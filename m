Received: from smtp.kernel.org (aws-us-west-2-korg-mail-alma10-1.taild15c8.ts.net [100.103.45.18])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 26F7541D4FC
	for <devicetree@vger.kernel.org>; Sun, 27 Sep 2026 23:01:52 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=100.103.45.18
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1790550115; cv=none; b=PwYq5rQ9mLZnHYoGHQzi+nlEzFygVzEEUEXC1rAFAhlf3E+Lea63UNIUYyoBUslCfbcTM2hoaXsK70xDJE/ADiW0cRKMoQ6ufgw96JiV1zTX03VwTg/b88P3/BKQu9ec7QCceuNtlDMw31X9TU8KzWgp5PJedVFeF7cb9pg4wH4=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1790550115; c=relaxed/simple;
	bh=3gk0O9YSVZQdUmhGWWgdFEtSiNu1CKGoRs5L0a+goA0=;
	h=From:Subject:To:Cc:In-Reply-To:References:Content-Type:Date:
	 Message-Id; b=VFCmU13A0p0mwTbdoWgqIWwOQzO48FWJ3VvwFXjDD9zeg08zvvUuLmrQJgaVfwUI9phDAyxb1J0E66XHSFMtp/gd/VOL+z+gEMu4n9aKZaaoUNDpehiLBtcU8QKNcWw7b+cL3uT/U9J0jNhQFn9a7xDt+UAc0TbQYTUQL1StOoM=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=UHgxMZHf; arc=none smtp.client-ip=100.103.45.18
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="UHgxMZHf"
Received: by smtp.kernel.org (Postfix) with ESMTPSA id A720F1F00893;
	Sun, 27 Sep 2026 23:01:49 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kernel.org;
	s=k20260515; t=1790550110;
	bh=8l3o8/Y893unxSdNYi1d9CglkuoCHPHkeWJ+rjKiBKg=;
	h=From:Subject:Reply-To:To:Cc:In-Reply-To:References:Date;
	b=UHgxMZHferHKgZulXYt0Xfx3miwdGcFeZ8icBbQoDJbf07k39voo1HQuyMywNzDcE
	 386hAs5fqN+tu3FU8KqPTUrvykkBTtT3Ov5p+QeXi8jYo27C670QogC43c6SfgaOqW
	 QsEs6rzOMMOh9sSHOMT+gEy5+8OwOUPMsUZJWBFjCV2zV4HEbG4Hy8BPG/oFSJhoKE
	 lM6FbWBZ5m+8oA9b7ilQ/Z7ElJQWpg9NlsaSOkE5E+BIGiskrXJbA38kAvQ9xjjon1
	 e6CBm5hYsUPbhko2deaDg17JYO1PAj1dZz+OUwxPUYYRdz0JOOWXkdFFPORfHsPPWE
	 9dAud1BdcNQ5g==
From: sashiko-bot@kernel.org
Subject: Re: [PATCH net-next v3 4/5] net: phy: maxio: parse and enable PHY
 clock from generic DT binding
Reply-To: sashiko-reviews@lists.linux.dev
To: "Andre Przywara" <andre.przywara@arm.com>
Cc: robh@kernel.org, conor+dt@kernel.org, devicetree@vger.kernel.org
In-Reply-To: <20260926225625.25969-5-andre.przywara@arm.com>
References: <20260926225625.25969-1-andre.przywara@arm.com>
 <20260926225625.25969-5-andre.przywara@arm.com>
Content-Type: text/plain; charset=utf-8
Content-Transfer-Encoding: quoted-printable
Date: Sun, 27 Sep 2026 23:01:49 +0000
Message-Id: <20260927230149.A720F1F00893@smtp.kernel.org>
Precedence: bulk
X-Mailing-List: devicetree@vger.kernel.org
List-Id: <devicetree.vger.kernel.org>
List-Subscribe: <mailto:devicetree+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:devicetree+unsubscribe@vger.kernel.org>

Thank you for your contribution! Sashiko AI review found 3 potential issue(=
s) to consider:
- [High] net: phy: maxio: PHY clock enabled after reset deassertion without=
 subsequent reset cycle
- [High] net: phy: maxio: returning -EPROBE_DEFER causes permanent genphy h=
ijacking
- [Medium] net: phy: maxio: missing clock stabilization delay causes unsafe=
 early MDIO access
--

commit 52dca313fd23831811c2761895faceaea5529795
Author: Andre Przywara <andre.przywara@arm.com>

net: phy: maxio: parse and enable PHY clock from generic DT binding

The generic PHY DT binding features a clocks property, which describes
the clock input to the PHY. This commit looks for a "clocks" property
inside the PHY node and enables that clock explicitly during probe,
allowing boards with a SoC-driven PHY clock to use the PHY.

> diff --git a/drivers/net/phy/maxio.c b/drivers/net/phy/maxio.c
> index 9ba82c1cd8b13..266be95b949a8 100644
> --- a/drivers/net/phy/maxio.c
> +++ b/drivers/net/phy/maxio.c

[ ... ]

> @@ -57,6 +59,11 @@ static int maxio_mae0621a_probe(struct phy_device *phy=
dev)
>  		priv->clk_out_125m =3D true;
>  	}
> =20
> +	/* PHY clock from the generic PHY binding */
> +	priv->clk =3D devm_clk_get_optional_enabled(&phydev->mdio.dev, NULL);

[Severity: High]
Does this miss a hardware reset cycle?

The framework calls phy_device_reset(phydev, 0) in phy_probe() before invok=
ing
phydev->drv->probe. By enabling the clock here after the reset is already
deasserted, the PHY misses its proper reset sequence.

Should this issue a subsequent reset cycle (phy_device_reset(phydev, 1)
followed by phy_device_reset(phydev, 0)) to correctly initialize the PHY
with the newly running clock?

> +	if (IS_ERR(priv->clk))
> +		return PTR_ERR(priv->clk);

[Severity: High]
If this returns -EPROBE_DEFER, will it cause permanent genphy hijacking?

If devm_clk_get_optional_enabled() defers, the PHY device is left on the
deferred probe list with dev->driver =3D NULL. If the MAC driver subsequent=
ly
probes and calls phy_attach_direct(), the core code sees !d->driver and
forcefully binds genphy_driver.

This would bypass this driver completely and prevent the required clock from
being enabled, leaving the PHY permanently dead until reboot.

> +
> +	return 0;

[Severity: Medium]
Is a clock stabilization delay needed here before returning?

The probe routine returns immediately after clock enablement. The PHY
framework will then instantly issue MDIO read/write commands (e.g.,
phy_disable_interrupts()).

Since external oscillators and internal PHY PLLs require physical stabiliza=
tion
time, could accessing the PHY registers before the clock stabilizes lead to
MDIO timeouts or corrupted reads?

>  }
>

--=20
Sashiko AI review =C2=B7 https://sashiko.dev/#/patchset/20260926225625.2596=
9-1-andre.przywara@arm.com?part=3D4
