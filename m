Received: from smtp.kernel.org (aws-us-west-2-korg-mail-alma10-1.taild15c8.ts.net [100.103.45.18])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 01BED3E51EF
	for <devicetree@vger.kernel.org>; Tue, 14 Jul 2026 19:49:10 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=100.103.45.18
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1784058552; cv=none; b=Z/MWkiodzI4mvbYFUPqnRYsBil3SkZG5wkmvYuZpD+dnIX37bPWqQ7XR487QO7gIey/ltCvNAAlom4ehAP4n0jO954i0RNaUt/6uNSXRL7DSGK1D1kR9Wf6VYNoz5rpQGqfkETxtrzNVDdIcb0FdZ5AFDMjiIZ6tNO+ZDNrut+g=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1784058552; c=relaxed/simple;
	bh=u+1+qEBEdXOFnSmSTL5zZPTbf+fnXxujVz9of+aWqa4=;
	h=From:Subject:To:Cc:In-Reply-To:References:Content-Type:Date:
	 Message-Id; b=Xze9KdLmylcBP216frwVcxNBGNujWRVPwCmaNdew3KynzFTwIGmWfzxVS6V6ynoikgsAxUlg3EogDGW+9Hc3aoVO4P+EflEUkWrCZcMVRZSS4wfK4C7snwCID3TIw6/B4Vdpjhfm34JEEVDoIkt8wDzfx0COgsZwNzVlzXAnsE0=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=fXyZ0i26; arc=none smtp.client-ip=100.103.45.18
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="fXyZ0i26"
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 13B941F000E9;
	Tue, 14 Jul 2026 19:49:10 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kernel.org;
	s=k20260515; t=1784058550;
	bh=5Q/styvhIXpLetkJ2vEn3tKPaL9M825eB16Rpj8C8uM=;
	h=From:Subject:Reply-To:To:Cc:In-Reply-To:References:Date;
	b=fXyZ0i26y42jJXQ2AFObNEFRa17feBUOS/MM+Vptxn64a8bUl5oW3D5c+d1dG7fE4
	 cdQwDAgHqa6Db/9T23w3Xopb1OLfiFo72MLU8eWAcO6u35Q1l06rNM5ECLsB9oT+vQ
	 l4HvWxARtw9Zimc/qG6o0bPqTzh7RoM+FviDa+ewxN1ULtfoARocHQmeUsTgp18BKb
	 qrm694N+Vod/dkhJGZAVg6+RciytUgCzvFOz4bU67EWMciS2DDp5H9/jPs8o5PCoiH
	 6hLAoo2RN5Hc2vWL/TRUxvOhixf2xC3NbkxzrnQFc/JMwhAJeXxhNt45AEQ5TJIqgi
	 Ctbh2IRG/ypXA==
From: sashiko-bot@kernel.org
Subject: Re: [PATCH v13 03/35] phy: rockchip: usbdp: Do not lose USB3 PHY
 status
Reply-To: sashiko-reviews@lists.linux.dev
To: "Sebastian Reichel" <sebastian.reichel@collabora.com>
Cc: olteanv@gmail.com, robh@kernel.org, conor+dt@kernel.org, devicetree@vger.kernel.org, vkoul@kernel.org, neil.armstrong@linaro.org, linux-phy@lists.infradead.org
In-Reply-To: <20260714-rockchip-usbdp-cleanup-v13-3-6cb3e769d4c5@collabora.com>
References: <20260714-rockchip-usbdp-cleanup-v13-0-6cb3e769d4c5@collabora.com>
 <20260714-rockchip-usbdp-cleanup-v13-3-6cb3e769d4c5@collabora.com>
Content-Type: text/plain; charset=utf-8
Content-Transfer-Encoding: quoted-printable
Date: Tue, 14 Jul 2026 19:49:09 +0000
Message-Id: <20260714194910.13B941F000E9@smtp.kernel.org>
Precedence: bulk
X-Mailing-List: devicetree@vger.kernel.org
List-Id: <devicetree.vger.kernel.org>
List-Subscribe: <mailto:devicetree+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:devicetree+unsubscribe@vger.kernel.org>

Thank you for your contribution! Sashiko AI review found 5 potential issue(=
s) to consider:

New issues:
- [High] State desynchronization on PHY setup failure causes double clock d=
isable.
- [High] USB status bit permanently sticks when transitioning to DP-only mo=
de, causing a permanent hardware power leak.

Pre-existing issues:
- [High] USB3 port remains permanently disabled after Type-C transitions fr=
om DP-only to DP+USB.
- [High] Clock resource leak on probe failure and module unload if the boot=
loader left the PHY enabled.
- [High] Data race in `rk_udphy_dp_phy_configure` leading to corrupted DP l=
ane configuration.
--

--- Patch [3]: [PATCH v13 03/35] phy: rockchip: usbdp: Do not lose USB3 PHY=
 status ---
commit d46c4c27785a2f2be7f57da59562db8997835bf3
Author: Sebastian Reichel <sebastian.reichel@collabora.com>

phy: rockchip: usbdp: Do not lose USB3 PHY status

This patch modifies the Rockchip USB/DP combo PHY driver to prevent the sta=
tus
variable from being cleared during a DP mode change. This ensures that the
tracking information for USB3 is not lost when re-initializing the PHY.

> diff --git a/drivers/phy/rockchip/phy-rockchip-usbdp.c b/drivers/phy/rock=
chip/phy-rockchip-usbdp.c
> index a5ffdf7a6e76b..12dfdd470a782 100644
> --- a/drivers/phy/rockchip/phy-rockchip-usbdp.c
> +++ b/drivers/phy/rockchip/phy-rockchip-usbdp.c
> @@ -1008,7 +1008,6 @@ static int rk_udphy_power_on(struct rk_udphy *udphy=
, u8 mode)
>  			rk_udphy_u3_port_disable(udphy, false);
>  		udphy->mode_change =3D false;
>  	} else if (udphy->mode_change) {
> -		udphy->status =3D UDPHY_MODE_NONE;

[Severity: High]
If rk_udphy_setup() fails in the subsequent step (e.g., due to a PLL lock
timeout), could this cause a state desynchronization?

By no longer clearing the status here, the previous active flags remain if =
the
setup fails:

drivers/phy/rockchip/phy-rockchip-usbdp.c:rk_udphy_power_on() {
    ...
	} else if (udphy->mode_change) {
		if (udphy->mode =3D=3D UDPHY_MODE_DP)
			rk_udphy_u3_port_disable(udphy, true);

		rk_udphy_disable(udphy);
		ret =3D rk_udphy_setup(udphy);
		if (ret)
			return ret;
    ...
}

When the consumer unwinds the failure and calls phy_power_off(), the driver
will see the non-zero status, clear the bit, and invoke rk_udphy_disable() a
second time on already disabled clocks. Will this cause the clock enable
refcount to underflow and generate a kernel warning?

[Severity: High]
Additionally, does removing this clearance cause a permanent hardware power
leak when transitioning to a DP-only mode?

If the Type-C port negotiates a DP-only mode, udphy->mode changes to
UDPHY_MODE_DP, but the UDPHY_MODE_USB bit now persists in udphy->status from
prior initialization.

Later, if the USB core suspends or unbinds, rk_udphy_usb3_phy_exit() is cal=
led:

drivers/phy/rockchip/phy-rockchip-usbdp.c:rk_udphy_usb3_phy_exit() {
    ...
	/* DP only or high-speed */
	if (!(udphy->mode & UDPHY_MODE_USB) || udphy->hs)
		goto unlock;

	rk_udphy_power_off(udphy, UDPHY_MODE_USB);
    ...
}

Because udphy->mode is UDPHY_MODE_DP, it skips the call to
rk_udphy_power_off(), meaning the UDPHY_MODE_USB bit is never cleared.
When the DP consumer eventually powers off, rk_udphy_disable() is skipped
because status remains non-zero, leaving the clocks permanently enabled.

>  		if (udphy->mode =3D=3D UDPHY_MODE_DP)
>  			rk_udphy_u3_port_disable(udphy, true);

[Severity: High]
This is a pre-existing issue, but does this block fail to explicitly re-ena=
ble
the USB3 port when transitioning to a mode that requires it?

When transitioning from a DP-only mode to a DP+USB combo mode, udphy->mode
changes to UDPHY_MODE_DP_USB and udphy->mode_change is set to true.

During rk_udphy_power_on(), the code previously disabled the U3 port when
entering DP-only mode. However, when transitioning back to DP+USB, the code
skips the initial UDPHY_MODE_NONE block and enters the
else if (udphy->mode_change) block, which entirely lacks a call to explicit=
ly
re-enable the port via rk_udphy_u3_port_disable(udphy, false).

Will the GRF register retain the disabled state indefinitely, silently
breaking USB3 functionality?

[Severity: High]
This isn't a bug introduced by this patch, but does the driver leak clock
resources if the bootloader left the PHY enabled and probe fails?

In rk_udphy_get_initial_status(), if it detects the PHY was already enabled
by the bootloader, it intentionally skips disabling the clocks:

drivers/phy/rockchip/phy-rockchip-usbdp.c:rk_udphy_get_initial_status() {
    ...
	regmap_read(udphy->pma_regmap, CMN_LANE_MUX_AND_EN_OFFSET, &value);
	if (FIELD_GET(CMN_DP_LANE_MUX_ALL, value) &&
	    FIELD_GET(CMN_DP_LANE_EN_ALL, value))
		udphy->status =3D UDPHY_MODE_DP;
	else
		rk_udphy_disable(udphy);
    ...
}

Since there is no devm cleanup action registered for these manually enabled
clocks, if a subsequent probe step like devm_phy_create() fails, probe
returns an error without disabling them. Furthermore, since the platform
driver lacks a .remove callback, will the module leak these clocks if it is
cleanly unloaded?

[Severity: High]
This is a pre-existing issue, but is there a data race in
rk_udphy_dp_phy_configure() that could lead to corrupted DP lane configurat=
ion?

drivers/phy/rockchip/phy-rockchip-usbdp.c:rk_udphy_dp_phy_configure() {
    ...
	if (dp->set_voltages) {
		for (i =3D 0; i < udphy->lanes; i++) {
			lane =3D udphy->dp_lane_sel[i];
    ...
}

The udphy->dp_lane_sel and udphy->lane_mux_sel arrays are read without
holding udphy->mutex.

Concurrently, if a Type-C orientation flip occurs, the TCPM worker thread
calls rk_udphy_orien_sw_set(), which mutates these exact arrays under
udphy->mutex.

If the DP driver performs link training concurrently with an orientation fl=
ip,
could it read partially updated lane arrays and write invalid voltage swing
configurations to incorrect lane registers on the PHY?

--=20
Sashiko AI review =C2=B7 https://sashiko.dev/#/patchset/20260714-rockchip-u=
sbdp-cleanup-v13-0-6cb3e769d4c5@collabora.com?part=3D3
