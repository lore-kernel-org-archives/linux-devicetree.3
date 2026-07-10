Received: from smtp.kernel.org (aws-us-west-2-korg-mail-alma10-1.taild15c8.ts.net [100.103.45.18])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 347EB3B38B5
	for <devicetree@vger.kernel.org>; Fri, 10 Jul 2026 21:14:00 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=100.103.45.18
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1783718042; cv=none; b=O5Lfi1kxAdCkCDg4zPJW6VbAGvjRezqYQxj/Wzym5E7hQ6ZNm8pS4D1lUzVXeoq90zk9+VAJsIWiRytp2Uujlqm5wXvB2b5TMDY5bEkiibKu3OQFj/eN6kKI9JiYmUuFt2uykTMjNnP1MQ9q8mNt6PFrEqDJVjXoOCkoNQCzeMI=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1783718042; c=relaxed/simple;
	bh=gR9ajInfYVrkzz1ma9n6rOKK7T9ZfBsFBWksWGiA4nM=;
	h=From:Subject:To:Cc:In-Reply-To:References:Content-Type:Date:
	 Message-Id; b=owLyEF13J4lfYRpi1mYgtVFXJSLSxIFA8Ornp71RqEeHh2B28xo8yqZJlH/nFeZWtdReoLvY0y7D9JwlD/bxfbv1d4RNbIwD/k9x+miOrneULy6qayExyzCpcACXNSDTxi+CuoFBuRN8Zw3bQpnsmNYafm6Y8ZjW0WfUJxVzPWQ=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=S1qbpZIx; arc=none smtp.client-ip=100.103.45.18
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="S1qbpZIx"
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 5E31D1F00A3A;
	Fri, 10 Jul 2026 21:14:00 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kernel.org;
	s=k20260515; t=1783718040;
	bh=CwD8Ztb2o9SS2vVIEmowMswkxd/fpIpEdpaFfd7i7DE=;
	h=From:Subject:Reply-To:To:Cc:In-Reply-To:References:Date;
	b=S1qbpZIx7qJE8PL8f80S1RP4hsSgrKHpNI7vCzxXilcLyuW+nZu/UyjuaJzxNubtq
	 +ANQVAUJSYrK0VLM/6dTVgyJIrRLZRGPOZ6aiP6jPL7+o3T/M8Y9JyroO6P98d+Omw
	 yu2x2UUkPCriiKWdpUfe43Y9VUV2ELZUuQScQh2VCAIh0Pg2hjOkqre3/8ICFRA6mA
	 ohilu5O/cMYDGhACXxWHoovBSHZ4Lfj9zBSzl9FknJIOXLSX66yR3MBQQMPbuFDDRO
	 5maAwFNlJt5GEnCniQUJcTwq71xFi13yJ/RRf9UckTkz+3Po7E8eKBPyL4Dxn4NsJD
	 3H+RorNnASmlg==
From: sashiko-bot@kernel.org
Subject: Re: [PATCH v12 10/36] phy: rockchip: usbdp: Add missing mode_change
 update
Reply-To: sashiko-reviews@lists.linux.dev
To: "Sebastian Reichel" <sebastian.reichel@collabora.com>
Cc: olteanv@gmail.com, linux-phy@lists.infradead.org, vkoul@kernel.org, neil.armstrong@linaro.org, robh@kernel.org, conor+dt@kernel.org, devicetree@vger.kernel.org
In-Reply-To: <20260710-rockchip-usbdp-cleanup-v12-10-8b41a9a9bef0@collabora.com>
References: <20260710-rockchip-usbdp-cleanup-v12-0-8b41a9a9bef0@collabora.com>
 <20260710-rockchip-usbdp-cleanup-v12-10-8b41a9a9bef0@collabora.com>
Content-Type: text/plain; charset=utf-8
Content-Transfer-Encoding: quoted-printable
Date: Fri, 10 Jul 2026 21:13:59 +0000
Message-Id: <20260710211400.5E31D1F00A3A@smtp.kernel.org>
Precedence: bulk
X-Mailing-List: devicetree@vger.kernel.org
List-Id: <devicetree.vger.kernel.org>
List-Subscribe: <mailto:devicetree+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:devicetree+unsubscribe@vger.kernel.org>

Thank you for your contribution! Sashiko AI review found 4 potential issue(=
s) to consider:

Pre-existing issues:
- [High] PHY mode updates in `rk_udphy_typec_mux_set` are incorrectly gated=
 by DP Alt Mode and HPD status, breaking USB lane restoration when exiting =
Alt Mode.
- [High] The USB3 port remains permanently disabled in the GRF after dynami=
cally returning from 4-lane DP mode.
- [High] HPD events received from the Type-C TCPM before the DisplayPort co=
ntroller initializes the PHY are cached but never flushed, dropping the hot=
-plug event.
- [High] The driver leaks the `UDPHY_MODE_USB` bit in `udphy->status` when =
dynamically switching from DP+USB mode to DP-only mode.
--

--- Patch [10]: [PATCH v12 10/36] phy: rockchip: usbdp: Add missing mode_ch=
ange update ---
commit 1907d9e7af04f2c28df8bf00ded6a9b5a290664a
Author: Sebastian Reichel <sebastian.reichel@collabora.com>

phy: rockchip: usbdp: Add missing mode_change update

rk_udphy_set_typec_default_mapping() updates the available modes,
but does not set the mode_change as required. This results in
missing re-initialization and thus non-working DisplayPort.

> diff --git a/drivers/phy/rockchip/phy-rockchip-usbdp.c b/drivers/phy/rock=
chip/phy-rockchip-usbdp.c
> index 982315535caf7..7540c897dde13 100644
> --- a/drivers/phy/rockchip/phy-rockchip-usbdp.c
> +++ b/drivers/phy/rockchip/phy-rockchip-usbdp.c

[ ... ]

> @@ -1361,10 +1370,7 @@ static int rk_udphy_typec_mux_set(struct typec_mux=
_dev *mux,
>  			usleep_range(750, 800);
>  			rk_udphy_dp_hpd_event_trigger(udphy, true);
>  		} else if (data->status & DP_STATUS_HPD_STATE) {
> -			if (udphy->mode !=3D mode) {
> -				udphy->mode =3D mode;
> -				udphy->mode_change =3D true;
> -			}
> +			rk_udphy_mode_set(udphy, mode);

[Severity: High]
This is a pre-existing issue, but are PHY mode updates incorrectly gated by
DP Alt Mode and HPD status here?

When the Type-C manager tears down DP Alt Mode, it calls typec_mux_set()
with state->mode =3D TYPEC_STATE_SAFE and state->alt =3D NULL. The function
computes mode =3D UDPHY_MODE_DP_USB, but this rk_udphy_mode_set() call is
nested inside:

drivers/phy/rockchip/phy-rockchip-usbdp.c:rk_udphy_typec_mux_set() {
    ...
    if (state->alt && state->alt->svid =3D=3D USB_TYPEC_DP_SID) {
    ...
        } else if (data->status & DP_STATUS_HPD_STATE) {
            rk_udphy_mode_set(udphy, mode);
    ...
}

Does this incorrectly restrict PHY mode updates to DP Alt Mode, completely
missing state teardown paths where state->alt is NULL? This appears to break
USB lane restoration when exiting Alt Mode, causing USB to fail after
unplugging a DisplayPort adapter or exiting Alt Mode without a replug.

>  			rk_udphy_dp_hpd_event_trigger(udphy, true);
>  		} else {
>  			rk_udphy_dp_hpd_event_trigger(udphy, false);

[Severity: High]
This isn't a bug introduced by this patch, but does the USB3 port remain
permanently disabled in the GRF after dynamically returning from 4-lane DP
mode?

When dynamically switching from 4-lane DP mode back to DP+USB mode,
rk_udphy_power_on() executes the following block to reinitialize the PHY:

drivers/phy/rockchip/phy-rockchip-usbdp.c:rk_udphy_power_on() {
    ...
    } else if (udphy->mode_change) {
        if (udphy->mode =3D=3D UDPHY_MODE_DP)
            rk_udphy_u3_port_disable(udphy, true);

        ret =3D rk_udphy_init(udphy);
    ...
}

While this block correctly disables the U3 port for DP-only mode via
rk_udphy_u3_port_disable(udphy, true), it lacks the inverse
rk_udphy_u3_port_disable(udphy, false) call for restoring DP+USB mode.

Could this prevent the DWC3 controller from communicating with the USB3 PHY
when returning to DP+USB mode, resulting in non-working USB3?

[Severity: High]
This is a pre-existing issue, but are HPD events dropped if they are receiv=
ed
from the Type-C TCPM before the DisplayPort controller initializes the PHY?

If the TCPM fires an HPD event before the DP consumer probes and calls
rk_udphy_dp_phy_init(), rk_udphy_dp_hpd_event_trigger() caches the state in
udphy->dp_sink_hpd_cfg because udphy->dp_in_use is false.

When the DP consumer finally initializes the PHY, dp_in_use is set to true:

drivers/phy/rockchip/phy-rockchip-usbdp.c:rk_udphy_dp_phy_init() {
    ...
    mutex_lock(&udphy->mutex);

    udphy->dp_in_use =3D true;

    mutex_unlock(&udphy->mutex);
    ...
}

However, the cached dp_sink_hpd_cfg is never written to the hardware
registers via rk_udphy_grfreg_write(). Can this drop the hot-plug event
and cause the display to remain completely undetected until the cable is
replugged?

[Severity: High]
This is a pre-existing issue, but does the driver leak the UDPHY_MODE_USB b=
it
in udphy->status when dynamically switching from DP+USB mode to DP-only mod=
e?

When the type-c mux switches mode from UDPHY_MODE_DP_USB to UDPHY_MODE_DP,
udphy->mode is updated immediately. Later, when the USB subsystem processes
the disconnect and calls rk_udphy_usb3_phy_exit(), it checks the new mux mo=
de
rather than the currently active status:

drivers/phy/rockchip/phy-rockchip-usbdp.c:rk_udphy_usb3_phy_exit() {
    ...
    /* DP only or high-speed */
    if (!(udphy->mode & UDPHY_MODE_USB) || udphy->hs)
        goto unlock;

    rk_udphy_power_off(udphy, UDPHY_MODE_USB);
    ...
}

This condition evaluates to true because the mode was already changed,
skipping rk_udphy_power_off(udphy, UDPHY_MODE_USB).

Furthermore, the overarching rk_udphy_power_off() shares this identical
flawed check:

drivers/phy/rockchip/phy-rockchip-usbdp.c:rk_udphy_power_off() {
    ...
    if (!(udphy->mode & mode)) {
        dev_info(udphy->dev, "mode 0x%02x is not support\n", mode);
        return;
    }
    ...
}

Could this secondary check return early if the new mode lacks the bit the
caller is legitimately trying to power off, preventing the mode bit from ev=
er
being cleared from udphy->status? This appears to leave PHY resources
(clocks, resets) unreleased on teardown, corrupting state tracking and
leaking power.

--=20
Sashiko AI review =C2=B7 https://sashiko.dev/#/patchset/20260710-rockchip-u=
sbdp-cleanup-v12-0-8b41a9a9bef0@collabora.com?part=3D10
