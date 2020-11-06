BASE_DIR:=$(dir $(abspath $(lastword $(MAKEFILE_LIST))))

.PHONY: update

update:
	git submodule update --remote --merge

cloudflare-ddns:
	git submodule add "git@github.com:rokoucha/cloudflare-ddns.git"
	ln -sf ${BASE_DIR}/cloudflare-ddns.env ${BASE_DIR}/cloudflare-ddns/.env
	mkdir -p ${HOME}/.config/systemd/user
	ln -sf ${BASE_DIR}/cloudflare-ddns/systemd/*.timer ${HOME}/.config/systemd/user
	ln -sf ${BASE_DIR}/cloudflare-ddns/systemd/podman/*.service ${HOME}/.config/systemd/user
	systemctl --user daemon-reload
	systemctl --user enable --now cloudflare-ddns-a@tomoko.timer
	systemctl --user enable --now cloudflare-ddns-a@v4.tomoko.timer
	systemctl --user enable --now cloudflare-ddns-aaaa@tomoko.timer
	systemctl --user enable --now cloudflare-ddns-aaaa@v6.tomoko.timer

certbot-cloudflare-systemd:
	git submodule add git@github.com:rokoucha/certbot-cloudflare-systemd.git
	ln -sf ${BASE_DIR}/certbot-cloudflare-systemd.env ${BASE_DIR}/certbot-cloudflare-systemd/.env
	mkdir -p ${HOME}/.config/systemd/user
	ln -sf ${BASE_DIR}/certbot-cloudflare-systemd/certbot-cloudflare@.* ${HOME}/.config/systemd/user
	systemctl --user daemon-reload
	systemctl --user enable --now certbot-cloudflare@ggrel.net.timer
	systemctl --user enable --now certbot-cloudflare@heinrike.prinzessin.zu.sayn-wittgenste.in.timer
	systemctl --user enable --now certbot-cloudflare@rokoucha.net.timer
	systemctl --user enable --now certbot-cloudflare@sayn-wittgenste.in.timer

splatnet2statink:
	ln -sf ${BASE_DIR}/splatnet2statink.env ${BASE_DIR}/splatnet2statink/.env
	mkdir -p ${HOME}/.config/systemd/user
	ln -sf ${BASE_DIR}/splatnet2statink/splatnet2statink.* ${HOME}/.config/systemd/user
	systemctl --user daemon-reload
	systemctl --user enable --now splatnet2statink.timer
