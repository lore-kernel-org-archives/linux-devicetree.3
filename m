Received: from smtp.kernel.org (aws-us-west-2-korg-mail-alma10-1.taild15c8.ts.net [100.103.45.18])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 03D601BD9D0
	for <devicetree@vger.kernel.org>; Fri, 10 Jul 2026 21:15:33 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=100.103.45.18
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1783718135; cv=none; b=qxSOMTyHZYERYpsdTCZ0Hr4g7DHQsZl0064xx4E0MilJZk4hJF/tY9LRFG9ThtH2MmcEiAEvRwMoTrXgDB41nPPNucZHXfkb21esJZLOIg1vb14nUUT0NfqhHgsKS4HU9lnU0Et9Zg+uC0EYFRBxiYkM/zCArbnT8PfAPxivWDE=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1783718135; c=relaxed/simple;
	bh=Oakaw5s3yHwNbZPAfk1YImztPtmz55AJx/848z+G2Mg=;
	h=From:Subject:To:Cc:In-Reply-To:References:Content-Type:Date:
	 Message-Id; b=AqckAY9x19L57bLCC8p/q+7ycIVR0eceW+1a6LvLIuqe9VP7t5vlSghrBAOmItzCtkBXJKTvYgshcMEVA9TGNyxJWGJbs4qg8PU0v/LavHas1b61PFRrikSJiwG3MPfpaoZlvuHQvfTGkjHM1epyKXUaDLKRLMQ/76pKWN7XNg8=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=Ji/gZ+Nv; arc=none smtp.client-ip=100.103.45.18
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="Ji/gZ+Nv"
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 460201F000E9;
	Fri, 10 Jul 2026 21:15:33 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kernel.org;
	s=k20260515; t=1783718133;
	bh=mSMn8ktTR1mf/DKEwlzAsknkClUSx+l2ubdqBKejdFQ=;
	h=From:Subject:Reply-To:To:Cc:In-Reply-To:References:Date;
	b=Ji/gZ+NvlGKnZEG1wlrriS0LSF1cIzsQvOXTkQzq7CEQrWHs/gi683wZ3vbKctxA0
	 QFQ9R3qfc6yOuEZXKAUyNtm6o14O6DF+FXVnTti/Bwyw4U50xD6SgGNTS8dxKcsqSw
	 V/3d6HtRO0sYnt0jALXuaWympDnSBJdXiXZsX5FN/FBfBzpAOCwzRam8Gpr7ukPjNK
	 RjUzbBe4bwyAzTWeZVZxYdEMxWIQvmvsmsddtCYI0Q8s2zZ2KYD/VCNS8JFEvcD3aq
	 aQUblbqlyVBdldQ2sRH/tXPDlb2xp4jfTIFnSzGsI42nBcgLlEd/AvDZk/Th9Mh0Va
	 B2TghSBSlsR4w==
From: sashiko-bot@kernel.org
Subject: Re: [PATCH v12 02/36] phy: rockchip: usbdp: Update mode_change
 after error handling
Reply-To: sashiko-reviews@lists.linux.dev
To: "Sebastian Reichel" <sebastian.reichel@collabora.com>
Cc: conor+dt@kernel.org, olteanv@gmail.com, neil.armstrong@linaro.org, linux-phy@lists.infradead.org, vkoul@kernel.org, robh@kernel.org, devicetree@vger.kernel.org
In-Reply-To: <20260710-rockchip-usbdp-cleanup-v12-2-8b41a9a9bef0@collabora.com>
References: <20260710-rockchip-usbdp-cleanup-v12-0-8b41a9a9bef0@collabora.com>
 <20260710-rockchip-usbdp-cleanup-v12-2-8b41a9a9bef0@collabora.com>
Content-Type: text/plain; charset=utf-8
Content-Transfer-Encoding: quoted-printable
Date: Fri, 10 Jul 2026 21:15:32 +0000
Message-Id: <20260710211533.460201F000E9@smtp.kernel.org>
Precedence: bulk
X-Mailing-List: devicetree@vger.kernel.org
List-Id: <devicetree.vger.kernel.org>
List-Subscribe: <mailto:devicetree+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:devicetree+unsubscribe@vger.kernel.org>

Thank you for your contribution! Sashiko AI review found 8 potential issue(=
s) to consider:

Pre-existing issues:
- [Critical] Asynchronous PHY mode changes while USB is active cause fatal =
SErrors (kernel panics) because PHY clocks are disabled without notifying t=
he active DWC3 controller.
- [High] `rk_udphy_power_on()` incorrectly drops active consumer tracking i=
n `udphy->status` during a mode change, potentially causing the PHY to be d=
isabled while still in use.
- [High] The U3 (USB3) port is not re-enabled when transitioning from DP-on=
ly mode to DP+USB mode, causing USB3 to remain broken.
- [High] `rk_udphy_clk_init()` shadows the error code from `devm_clk_bulk_g=
et_all()`, breaking deferred probing.
- [High] The driver leaks clock enable counts and hardware reset states on =
probe error paths if the initial hardware status is active.
- [High] The `rk_udphy_dp_phy_configure` function accesses shared arrays an=
d modifies hardware registers without acquiring `udphy->mutex`, leading to =
race conditions.
- [High] Non-DP Alternate Mode events corrupt the PHY lane mux configuratio=
n, silently breaking USB3 functionality.
- [High] DisplayPort HPD (Hot Plug Detect) events received before the DP PH=
Y is initialized are permanently lost, preventing display detection.
--

--- Patch [2]: [PATCH v12 02/36] phy: rockchip: usbdp: Update mode_change a=
fter error handling ---
commit 44a3e651748d53a497e7bb21061bf3cb86d67fbd
Author: Sebastian Reichel <sebastian.reichel@collabora.com>

phy: rockchip: usbdp: Update mode_change after error handling

If rk_udphy_init() or rk_udphy_setup() fails, the reinit will not be
tried again. Fix this by only updating the variable after all potential
errors have been handled.

Link: https://lore.kernel.org/linux-phy/20260612163835.8D5471F000E9@smtp.ke=
rnel.org/

> diff --git a/drivers/phy/rockchip/phy-rockchip-usbdp.c b/drivers/phy/rock=
chip/phy-rockchip-usbdp.c
> index fba35510d88ce..a5ffdf7a6e76b 100644
> --- a/drivers/phy/rockchip/phy-rockchip-usbdp.c
> +++ b/drivers/phy/rockchip/phy-rockchip-usbdp.c
> @@ -1000,15 +1000,14 @@ static int rk_udphy_power_on(struct rk_udphy *udp=
hy, u8 mode)
>  	}
> =20
>  	if (udphy->status =3D=3D UDPHY_MODE_NONE) {
> -		udphy->mode_change =3D false;
>  		ret =3D rk_udphy_setup(udphy);
>  		if (ret)
>  			return ret;
> =20
>  		if (udphy->mode & UDPHY_MODE_USB)
>  			rk_udphy_u3_port_disable(udphy, false);
> -	} else if (udphy->mode_change) {
>  		udphy->mode_change =3D false;
> +	} else if (udphy->mode_change) {

[Severity: High]
This isn't a bug introduced by this patch, but does this mode change block
neglect to conditionally re-enable the U3 port for USB modes?

If the PHY is active in DP-only mode and transitions to DP+USB, this
else if (udphy->mode_change) block is taken. Unlike the initialization
block, it fails to evaluate if (udphy->mode & UDPHY_MODE_USB) and call
rk_udphy_u3_port_disable(udphy, false).

Does this cause USB 3.0 to fail to initialize when plugged into an already
active DisplayPort?

>  		udphy->status =3D UDPHY_MODE_NONE;

[Severity: High]
This is a pre-existing issue, but does this forcefully erase the tracking
of all currently active consumers without transferring them to the new
state?

If DP is active, udphy->status holds UDPHY_MODE_DP. When a USB device is
plugged in, rk_udphy_power_on is called for UDPHY_MODE_USB with mode_change
true. The code clears udphy->status to UDPHY_MODE_NONE here.

Does this permanently lose the previously active UDPHY_MODE_DP bit? When
USB is later unplugged, power_off clears the USB bit, dropping status to 0,
which might prematurely disable the PHY despite DP still needing it.

>  		if (udphy->mode =3D=3D UDPHY_MODE_DP)
>  			rk_udphy_u3_port_disable(udphy, true);

[Severity: Critical]
This isn't a bug introduced by this patch, but does the asynchronous
disabling of PHY bulk clocks around here cause fatal SErrors?

drivers/phy/rockchip/phy-rockchip-usbdp.c:rk_udphy_power_on() {
    ...
    } else if (udphy->mode_change) {
        udphy->status =3D UDPHY_MODE_NONE;
        if (udphy->mode =3D=3D UDPHY_MODE_DP)
            rk_udphy_u3_port_disable(udphy, true);
        rk_udphy_disable(udphy);
    ...
}

If DWC3 is actively transferring USB data and a DisplayPort Alternate Mode
event arrives, rk_udphy_typec_mux_set triggers a mode change. The code
unconditionally calls rk_udphy_disable(udphy) which abruptly severs the
PHY clocks.

Since the DWC3 driver isn't notified, could its next register access hang
the system bus?

[ ... ]

> @@ -1017,6 +1016,7 @@ static int rk_udphy_power_on(struct rk_udphy *udphy=
, u8 mode)
>  		ret =3D rk_udphy_setup(udphy);
>  		if (ret)
>  			return ret;
> +		udphy->mode_change =3D false;
>  	}
> =20
>  	udphy->status |=3D mode;

[Severity: High]
This is a pre-existing issue, but does setting the status bit here only
register the consumer that triggered the function call, leaving previous
consumers untracked?


There are a few other pre-existing issues in this file that might be worth
looking into:

[Severity: High]
This isn't a bug introduced by this patch, but does this logic shadow the
error code from devm_clk_bulk_get_all and break deferred probing?

drivers/phy/rockchip/phy-rockchip-usbdp.c:rk_udphy_clk_init() {
    ...
    if (udphy->num_clks < 1)
        return -ENODEV;
    ...
}

If devm_clk_bulk_get_all returns -EPROBE_DEFER when clock providers aren't
ready yet, this explicitly checks if udphy->num_clks < 1 and returns a
hardcoded -ENODEV. Will this cause the PHY driver to fail to probe
permanently if clocks are not immediately available during early boot?


[Severity: High]
This is a pre-existing issue, but does the driver leak clock enable counts
and hardware reset states on probe error paths if the initial hardware
status is active?

drivers/phy/rockchip/phy-rockchip-usbdp.c:rk_udphy_probe() {
    ...
    udphy->phy_u3 =3D devm_phy_create(dev, dev->of_node, &rk_udphy_usb3_phy=
_ops);
    if (IS_ERR(udphy->phy_u3)) {
        ret =3D PTR_ERR(udphy->phy_u3);
        return dev_err_probe(dev, ret, "failed to create USB3 phy\n");
    }
    ...
}

rk_udphy_get_initial_status calls clk_bulk_prepare_enable. If it detects
active DP hardware, it leaves the clocks enabled and sets udphy->status to
UDPHY_MODE_DP.

If any subsequent step in rk_udphy_probe fails, the driver returns the error
without disabling the clocks. Without a devm-action registered to clean this
up, does this clock enable refcount leak prevent the system from ever
powering down the clock?


[Severity: High]
This isn't a bug introduced by this patch, but does rk_udphy_dp_phy_configu=
re
access shared arrays and modify hardware registers without acquiring
udphy->mutex, leading to race conditions?

drivers/phy/rockchip/phy-rockchip-usbdp.c:rk_udphy_dp_phy_configure() {
    ...
    lane =3D udphy->dp_lane_sel[i];
    ...
}

This reads a shared array that is actively modified by Type-C event
handlers. At the same time, Type-C orientation switch callbacks like
rk_udphy_typec_mux_set or USB initialization can modify these exact same
structures or registers.

Could this concurrent access corrupt hardware registers or result in
inconsistent lane mappings?


[Severity: High]
This is a pre-existing issue, but do non-DP Alternate Mode events corrupt
the PHY lane mux configuration and silently break USB3 functionality?

drivers/phy/rockchip/phy-rockchip-usbdp.c:rk_udphy_typec_mux_set() {
    ...
    switch (state->mode) {
    case TYPEC_DP_STATE_C:
    case TYPEC_DP_STATE_E:
        udphy->lane_mux_sel[0] =3D PHY_LANE_MUX_DP;
    ...
}

This executes the switch block and overwrites udphy->lane_mux_sel before
verifying state->alt->svid =3D=3D USB_TYPEC_DP_SID.

Because TYPEC_DP_STATE_C is defined as TYPEC_STATE_MODAL, any other
Alternate Mode that transitions into its modal state will inadvertently
match this case. Will this erroneously route all PHY lanes to DisplayPort
if a non-DP Type-C Alternate Mode device is attached?


[Severity: High]
This isn't a bug introduced by this patch, but are DisplayPort HPD events
received before the DP PHY is initialized permanently lost, preventing
display detection?

drivers/phy/rockchip/phy-rockchip-usbdp.c:rk_udphy_dp_phy_init() {
    ...
    udphy->dp_in_use =3D true;
    ...
}

rk_udphy_dp_hpd_event_trigger caches the HPD state in
udphy->dp_sink_hpd_cfg if udphy->dp_in_use is false. Later, when the DP
DRM driver calls rk_udphy_dp_phy_init, udphy->dp_in_use is set to true.

However, the function fails to write the cached HPD configuration out to
the hardware registers. Does this result in an attached DisplayPort monitor
not being detected by the system?

--=20
Sashiko AI review =C2=B7 https://sashiko.dev/#/patchset/20260710-rockchip-u=
sbdp-cleanup-v12-0-8b41a9a9bef0@collabora.com?part=3D2
