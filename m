Received: from smtp.kernel.org (aws-us-west-2-korg-mail-alma10-1.taild15c8.ts.net [100.103.45.18])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id B5BCC374A1B
	for <devicetree@vger.kernel.org>; Fri, 12 Jun 2026 16:41:08 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=100.103.45.18
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1781282470; cv=none; b=nxg/HaofH6ut2F1UpQ1JuPUAUJkxD9ZmJUCt325uxu50MMR7cCx2JsmcU1T6BdJ8C2Y5GAEO2lrKYu3H8NAZiwtFGhKXC/JtYxayFgkYYdof2UB2wJOffiBbIQ7aJF8b9bHA9qBrfpN8aX2T9FxExWr43Ng24xgavehbnlWc7yo=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1781282470; c=relaxed/simple;
	bh=3wCoSRh3j6Wh3cRilinglX2IBmBk0bRDpjL5heho828=;
	h=From:Subject:To:Cc:In-Reply-To:References:Content-Type:Date:
	 Message-Id; b=nBIUBmvhwZGpEhcXcBUGxSJg4jUPyZ38/Px2Rb647+8ynfG81rBHScTzuJPTMTkwl9oAxZcP3ANCAY/tfR8ueJe5KgKZ1Oq9UmeWdNfidgvkbcJjxVkWqxYwf2zVUZT+MQivCtVAvuhyUT40c2kxMxsRcCpHeiKqgjU6SjtWOOI=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=erGXlXo/; arc=none smtp.client-ip=100.103.45.18
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="erGXlXo/"
Received: by smtp.kernel.org (Postfix) with ESMTPSA id C7DB21F000E9;
	Fri, 12 Jun 2026 16:41:07 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kernel.org;
	s=k20260515; t=1781282468;
	bh=Z4n1vm43k0djrya0Z/OuKO+WXUJY9ePJRT4jLsDPK70=;
	h=From:Subject:Reply-To:To:Cc:In-Reply-To:References:Date;
	b=erGXlXo/YMXfyl43DspRiIi4jJ9NWrYwgZbJ1VhWYcZ1Bs2J1OFygcISAZ30iGFGY
	 /v60+gMAl9G9syiEwRSrb6PTBQxqiHQL2HqnmAARwe5dArm7DecdnjsOiREIuHC/D5
	 aQDuZx0DzMhwbrl2EtjhF2r7/Mo6JHkPggmx5je9oSXfcOUh2aitcCLRJhJM278Rac
	 UjnWoxXHEziZYbsCFKEwfStcRB1ITlLFBvxGRYFEUF2N6odhcoDJjv7K0Ms/UXTfKs
	 kLYhybPXg1IvF75EkqnhOFnu30FYt6DXu5he4vyMhTS87xzu7bUHQAJrVXT869Jenk
	 ZX5swtdcXBvnw==
From: sashiko-bot@kernel.org
Subject: Re: [PATCH v5 03/18] phy: rockchip: usbdp: Keep clocks running on
 PHY re-init
Reply-To: sashiko-reviews@lists.linux.dev
To: "Sebastian Reichel" <sebastian.reichel@collabora.com>
Cc: robh@kernel.org, conor+dt@kernel.org, olteanv@gmail.com, devicetree@vger.kernel.org, linux-phy@lists.infradead.org, vkoul@kernel.org, neil.armstrong@linaro.org
In-Reply-To: <20260612-rockchip-usbdp-cleanup-v5-3-efc83069869f@collabora.com>
References: <20260612-rockchip-usbdp-cleanup-v5-3-efc83069869f@collabora.com>
Content-Type: text/plain; charset=utf-8
Content-Transfer-Encoding: quoted-printable
Date: Fri, 12 Jun 2026 16:41:07 +0000
Message-Id: <20260612164107.C7DB21F000E9@smtp.kernel.org>
Precedence: bulk
X-Mailing-List: devicetree@vger.kernel.org
List-Id: <devicetree.vger.kernel.org>
List-Subscribe: <mailto:devicetree+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:devicetree+unsubscribe@vger.kernel.org>

Thank you for your contribution! Sashiko AI review found 5 potential issue(=
s) to consider:

Pre-existing issues:
- [High] Missing clock disable on probe failure and driver unbind if the bo=
otloader left the PHY enabled.
- [High] Premature consumption of the re-initialization flag leads to false=
 success reporting on subsequent retries if PHY initialization fails.
- [High] Initialization failure of a new mode silently breaks the already a=
ctive mode in the combo PHY.
- [High] Shadowing of error codes from devm_clk_bulk_get_all() breaks defer=
red probing.
- [High] Missing mutex_lock(&udphy->mutex) in rk_udphy_dp_phy_configure() a=
llows data races and hardware state corruption.
--

commit 352757db3201eb1ea989ca1ac6bc600f268f254c
Author: Sebastian Reichel <sebastian.reichel@collabora.com>

phy: rockchip: usbdp: Keep clocks running on PHY re-init

This commit avoids unnecessarily disabling and re-enabling clocks when
re-initializing the PHY during a mode change. Since rk_udphy_init()
asserts the reset lines anyway, keeping the clocks running simplifies
the flow and avoids delaying the process.

> diff --git a/drivers/phy/rockchip/phy-rockchip-usbdp.c b/drivers/phy/rock=
chip/phy-rockchip-usbdp.c
> index 744cc7c642f49..98562a888b42a 100644
> --- a/drivers/phy/rockchip/phy-rockchip-usbdp.c
> +++ b/drivers/phy/rockchip/phy-rockchip-usbdp.c
> @@ -1012,8 +1012,7 @@ static int rk_udphy_power_on(struct rk_udphy *udphy=
, u8 mode)
>  		if (udphy->mode =3D=3D UDPHY_MODE_DP)
>  			rk_udphy_u3_port_disable(udphy, true);
> =20
> -		rk_udphy_disable(udphy);
> -		ret =3D rk_udphy_setup(udphy);
> +		ret =3D rk_udphy_init(udphy);

[Severity: High]
This is a pre-existing issue, but by consuming udphy->phy_needs_reinit earl=
ier
in rk_udphy_power_on(), could this falsely report success on subsequent
retries if rk_udphy_init() fails?

When transitioning to a combo mode, udphy->phy_needs_reinit is cleared befo=
re
rk_udphy_init() is called:

drivers/phy/rockchip/phy-rockchip-usbdp.c:rk_udphy_power_on() {
    ...
	} else if (udphy->phy_needs_reinit) {
		udphy->phy_needs_reinit =3D false;
        ...
		ret =3D rk_udphy_init(udphy);
		if (ret)
			return ret;
    ...
}

If rk_udphy_init() returns an error, the flag remains false. On the next re=
try
by the framework, it might skip hardware initialization, incorrectly add the
new mode to udphy->status, and return success despite the PHY not functioni=
ng.

>  		if (ret)
>  			return ret;
>  	}

[Severity: High]
This is a pre-existing issue, but is there a leak of the clock enable count
during probe error paths or driver unbind if the bootloader left the PHY
enabled?

In rk_udphy_get_initial_status(), clocks are prepared and enabled:

drivers/phy/rockchip/phy-rockchip-usbdp.c:rk_udphy_get_initial_status() {
    ...
	ret =3D clk_bulk_prepare_enable(udphy->num_clks, udphy->clks);
    ...
}

If the PHY was left enabled by the bootloader, udphy->status is set to
UDPHY_MODE_DP and clocks are intentionally kept running. However, the driver
does not appear to register a devm cleanup action for these clocks. If
subsequent steps in rk_udphy_probe() fail, or if the driver is unbound, the
clock enable count is never decremented.

[Severity: High]
This is a pre-existing issue, but would an initialization failure of a new
mode in rk_udphy_init() silently break the already active mode?

If a mode change occurs (e.g., turning on DisplayPort while USB is already
active) and rk_udphy_init() fails, the error path asserts all reset lines:

drivers/phy/rockchip/phy-rockchip-usbdp.c:rk_udphy_init() {
    ...
assert_resets:
	rk_udphy_reset_assert_all(udphy);
	return ret;
}

This forcefully asserts reset lines for the entire combo PHY, breaking the
already active USB PHY without notifying the USB subsystem.

[Severity: High]
This is a pre-existing issue, but by replacing the error code in
rk_udphy_clk_init(), could deferred probing be broken?

drivers/phy/rockchip/phy-rockchip-usbdp.c:rk_udphy_clk_init() {
    ...
	udphy->num_clks =3D devm_clk_bulk_get_all(dev, &udphy->clks);
	if (udphy->num_clks < 1)
		return -ENODEV;
    ...
}

If devm_clk_bulk_get_all() returns -EPROBE_DEFER, it is replaced with -ENOD=
EV,
permanently failing the driver probe instead of allowing it to defer.

[Severity: High]
This is a pre-existing issue, but without acquiring udphy->mutex in
rk_udphy_dp_phy_configure(), are there potential data races or hardware sta=
te
corruption?

drivers/phy/rockchip/phy-rockchip-usbdp.c:rk_udphy_dp_phy_configure() {
	struct rk_udphy *udphy =3D phy_get_drvdata(phy);
	struct phy_configure_opts_dp *dp =3D &opts->dp;
    ...
}

The function modifies shared driver state (udphy->dp_lane_sel,
udphy->lane_mux_sel, udphy->bw, udphy->link_rate) and writes to shared PHY
hardware registers. Without holding the mutex, this can race with Type-C
callbacks or concurrent USB PHY operations.

--=20
Sashiko AI review =C2=B7 https://sashiko.dev/#/patchset/20260612-rockchip-u=
sbdp-cleanup-v5-0-efc83069869f@collabora.com?part=3D3
