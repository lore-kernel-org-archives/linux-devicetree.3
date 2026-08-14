Received: from smtp.kernel.org (aws-us-west-2-korg-mail-alma10-1.taild15c8.ts.net [100.103.45.18])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id B6519336881
	for <devicetree@vger.kernel.org>; Fri, 14 Aug 2026 02:41:51 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=100.103.45.18
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1786675312; cv=none; b=uBrEhkILqufKBYy5k8umqxkqRE3HDvOc/Ulb/wHbiwGBlcxPRvWMJay4vGkhL3fqbRjMxdgQhgBOxa79VADgx21FeXrEEgZ+kOZXMWCppSk3SoZEmM2bDaUAo2blqfrgv9a03X66frBs5Ao0mw5UQKpdr7JpUe0sv0ZkuYruJFw=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1786675312; c=relaxed/simple;
	bh=xdWcD+HPDEB9bSukuWDb7jz+ZbC/tJBtzFDqHHWiKz0=;
	h=From:Subject:To:Cc:In-Reply-To:References:Content-Type:Date:
	 Message-Id; b=N8lywqZ2DiQ7WIiVFST/rL+pF4U+7dBrVQ1LDMh8hli0R3HeXUlr7OQQ+5VHPHYVMb+5qvl3nbXJDZR8jjxLb+TYhUllcqDhLI0zJmkFuTUdBpCS4tAnok+eBhFnmHa7AL6xee9VM48/X82651k8LRoJKCjnkNpN1V1vmS92aN4=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=NxttqOd3; arc=none smtp.client-ip=100.103.45.18
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="NxttqOd3"
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 31F801F000E9;
	Fri, 14 Aug 2026 02:41:51 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kernel.org;
	s=k20260515; t=1786675311;
	bh=WqTd6hTvZP+7jr4CnwgT2uItwEHTmJCWS0N2lOJVzwQ=;
	h=From:Subject:Reply-To:To:Cc:In-Reply-To:References:Date;
	b=NxttqOd3EAC4rRwNzQFauADKHZyKwAoZmPVJUKdsv69f1sc53/Ryt22QSl4pZ1tgh
	 uoRUV2vvpp4ORqZ/r38+mcfqNaZFJPpMVAKQ6/oP7VwcLiCAn7CPD4ftgAokgjmLel
	 /DsRVD7njV0CzB4x5uR3OXRcmf+PXikL/k1fWyDm65EAVkJLdFaLsgfr7/+SxP2wt/
	 o7jdVct2d0eLes/9BhUWzVx7rxiADfC4rVdx1UBVkJNaaZOeqJ1OdBNGgJRDAHZAAw
	 yvFJMDY0V/kjM0vbpHrqVDM5mKRmECD53EcP8VyrYT2QEk8Kv9VJHiDU9T+7uCoDus
	 GXjp6GSsXr0Og==
From: sashiko-bot@kernel.org
Subject: Re: [PATCH v14 10/38] phy: rockchip: usbdp: Add missing mode_change
 update
Reply-To: sashiko-reviews@lists.linux.dev
To: "Sebastian Reichel" <sebastian.reichel@collabora.com>
Cc: robh@kernel.org, conor+dt@kernel.org, devicetree@vger.kernel.org, vkoul@kernel.org, olteanv@gmail.com, linux-phy@lists.infradead.org, neil.armstrong@linaro.org
In-Reply-To: <20260813-rockchip-usbdp-cleanup-v14-10-b5ad9c68fa11@collabora.com>
References: <20260813-rockchip-usbdp-cleanup-v14-0-b5ad9c68fa11@collabora.com>
 <20260813-rockchip-usbdp-cleanup-v14-10-b5ad9c68fa11@collabora.com>
Content-Type: text/plain; charset=utf-8
Content-Transfer-Encoding: quoted-printable
Date: Fri, 14 Aug 2026 02:41:50 +0000
Message-Id: <20260814024151.31F801F000E9@smtp.kernel.org>
Precedence: bulk
X-Mailing-List: devicetree@vger.kernel.org
List-Id: <devicetree.vger.kernel.org>
List-Subscribe: <mailto:devicetree+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:devicetree+unsubscribe@vger.kernel.org>

Thank you for your contribution! Sashiko AI review found 2 potential issue(=
s) to consider:

Pre-existing issues:
- [High] Type-C state fallback to USB/Safe modes skips the PHY mode update =
and HPD reset, permanently breaking USB 3.0 and leaving a ghost DisplayPort=
 connection.
- [High] The PHY driver indefinitely leaks active power states (clocks and =
resets) if the Type-C mux mode changes before the USB or DP controllers exe=
cute their teardown routines.
--

--- Patch [10]: [PATCH v14 10/38] phy: rockchip: usbdp: Add missing mode_ch=
ange update ---
commit 9bed4fa08dd116716a39f228bdd961c66a8f8b64
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
> @@ -617,6 +617,15 @@ static void rk_udphy_dp_hpd_event_trigger(struct rk_=
udphy *udphy, bool hpd)
>  	rk_udphy_grfreg_write(udphy->vogrf, &cfg->vogrfcfg[udphy->id].hpd_trigg=
er, hpd);
>  }
> =20
> +static void rk_udphy_mode_set(struct rk_udphy *udphy, u8 mode)
> +{
> +	if (udphy->mode =3D=3D mode)
> +		return;
> +
> +	udphy->mode_change =3D true;
> +	udphy->mode =3D mode;
> +}

[Severity: High]
This isn't a bug introduced by this patch, but since we are updating how the
mode is set, can this asynchronous update to udphy->mode lead to a power st=
ate
leak?

If the Type-C subsystem asynchronously updates the requested mode via
rk_udphy_typec_mux_set() (e.g., changing from UDPHY_MODE_DP_USB to
UDPHY_MODE_DP), does this cause later teardown routines to fail?

For example, when the USB controller suspends and calls phy_exit() or
phy_power_off(), routines like rk_udphy_usb3_phy_exit() check the mode:

drivers/phy/rockchip/phy-rockchip-usbdp.c:rk_udphy_usb3_phy_exit() {
    ...
	/* DP only or high-speed */
	if (!(udphy->mode & UDPHY_MODE_USB) || udphy->hs)
		goto unlock;
    ...
}

Similarly in rk_udphy_power_off():

drivers/phy/rockchip/phy-rockchip-usbdp.c:rk_udphy_power_off() {
    ...
	if (!(udphy->mode & mode)) {
		dev_info(udphy->dev, "mode 0x%02x is not support\n", mode);
		return;
	}
    ...
}

Because udphy->mode has already changed, do these functions return early
without clearing the USB bit from udphy->status, leaving active hardware
clocks and resets leaked indefinitely?

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
>  			rk_udphy_dp_hpd_event_trigger(udphy, true);
>  		} else {
>  			rk_udphy_dp_hpd_event_trigger(udphy, false);

[Severity: High]
This is a pre-existing issue, but I have a question about the broader logic
in rk_udphy_typec_mux_set() when the mode changes.

When the Type-C port exits Alt Mode to a safe or USB-only state, does this
skip the PHY mode update and HPD reset entirely?

It looks like the vital state updates (including the new rk_udphy_mode_set()
call) are gated behind an earlier check in rk_udphy_typec_mux_set():

drivers/phy/rockchip/phy-rockchip-usbdp.c:rk_udphy_typec_mux_set() {
    ...
	if (state->alt && state->alt->svid =3D=3D USB_TYPEC_DP_SID) {
		struct typec_displayport_data *data =3D state->data;
    ...
}

Because state->alt is NULL when exiting DisplayPort Alt Mode, this block is
bypassed. Can this leave udphy->mode stuck in UDPHY_MODE_DP, potentially
breaking USB 3.0 functionality and leaving a ghost DisplayPort connection?

--=20
Sashiko AI review =C2=B7 https://sashiko.dev/#/patchset/20260813-rockchip-u=
sbdp-cleanup-v14-0-b5ad9c68fa11@collabora.com?part=3D10
