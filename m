Received: from smtp.kernel.org (aws-us-west-2-korg-mail-alma10-1.taild15c8.ts.net [100.103.45.18])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 84F633D3492
	for <devicetree@vger.kernel.org>; Sat, 17 Oct 2026 11:20:53 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=100.103.45.18
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1792236054; cv=none; b=HBrLYmcrTHyya01aFZq5ujWiP6HVr/WCtmKg8AZgBmcrbCtfJ+kLc+IiNwpa09XzaKN9DNNLwN+D+L7NAar0jhhr4WW3N68RvnEb2RyWFRJxex4Rolyo6DWVs6PyYuDdc1Jg46H4dXYSoqdh5+HaTX8LwEAQ1RpHpZpz8KTYddU=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1792236054; c=relaxed/simple;
	bh=oJA7caA82rEshrarMa4bequrNSPFEOIIJ7DFlKstdCs=;
	h=Message-ID:From:Subject:To:Cc:In-Reply-To:References:Content-Type:
	 Date; b=nZxfCcymMXCcP8qWpqxOI5u1Vgwvg0Wqj58gmjxg49H3QI69lS4yekAJKTuQWhqcwb97XqArgY5ET8cEZyoi8ELomI1sAC0afo0ln95wyF5CF1YjHAlDbbmX+/e1I4fD0l2PGsZQqt/Wj9X1oso/gXBRLYlxN374U/jMn5uP9S4=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=ke/imioX; arc=none smtp.client-ip=100.103.45.18
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="ke/imioX"
Received: by smtp.kernel.org (Postfix) with ESMTPSA id E80291F000C5;
	Sat, 17 Oct 2026 11:20:52 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kernel.org;
	s=k20260515; t=1792236053;
	bh=Ar2Ji6i6U4cwrDAUiULF+YCxz+oGkfan2s1tieyGupo=;
	h=From:Subject:Reply-To:To:Cc:In-Reply-To:References:Date;
	b=ke/imioXQPKMkqsGN3zgqAoMV6T1FN4oRWNc9v0R3Wj7WyELlf6FvUkdhZLe2uSaP
	 0BnId5GIX3MfxPQEJabucoWacUOGZmFhJT/jlI1OBBGhqULup48aMFERK20GyluZ1q
	 CotzrtJpN6Nmyak1mmrq3tWG95Yn5cReyONUZDCSib9r5pvHVEcZSckx0fyRC92sR6
	 oyE2qpyBxyeBDDZ6gMDkHGVq01rHRlkNSpV/cb5B4gAN5trvNmWkyFjzGlzMcVzMY0
	 RW/maE8lL8wkYp0oEVfhYrzM43C/P8N0X0D4DeaB0j84g4BdBS2j+iufaXjInaE9/U
	 DcPp3A+75zmxQ==
Message-ID: <sashiko-outbox-175490@kernel.org>
From: sashiko-bot@kernel.org
Subject: Re: [PATCH net-next v2 2/5] net: phy: mxl-gpy: add MxL86211C VDDP
 supply
Reply-To: sashiko-reviews@lists.linux.dev
To: "Robert Marko" <robert.marko@sartura.hr>, devicetree@vger.kernel.org
Cc: robh@kernel.org, conor+dt@kernel.org
In-Reply-To: <20261016112033.949026-2-robert.marko@sartura.hr>
References: <20261016112033.949026-1-robert.marko@sartura.hr>
 <20261016112033.949026-2-robert.marko@sartura.hr>
Content-Type: text/plain; charset=utf-8
Content-Transfer-Encoding: quoted-printable
Date: Sat, 17 Oct 2026 11:20:52 +0000
Precedence: bulk
X-Mailing-List: devicetree@vger.kernel.org
List-Id: <devicetree.vger.kernel.org>
List-Subscribe: <mailto:devicetree+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:devicetree+unsubscribe@vger.kernel.org>

Thank you for your contribution! Sashiko AI review found 2 potential issue(=
s) to consider:
- [High] mxl-gpy: missing regulator_enable() for VDDP supply
- [High] phy: mxl-gpy: probe regression on missing vddp-supply
--

commit a90a687bf14a0ab1f83d612c5413b01b74244ef5
Author: Robert Marko <robert.marko@sartura.hr>

net: phy: mxl-gpy: add MxL86211C VDDP supply

This commit introduces VDDP supply handling for the MxL86211C PHY. It
fetches the supply voltage to properly configure the MDIO, MDC, and MDINT
pads for 1.8V or 3.3V operation.

> diff --git a/drivers/net/phy/mxl-gpy.c b/drivers/net/phy/mxl-gpy.c
> index 089a1a9e5bc61..fbac7c49b4759 100644
> --- a/drivers/net/phy/mxl-gpy.c
> +++ b/drivers/net/phy/mxl-gpy.c
[ ... ]
> @@ -390,6 +396,61 @@ static int gpy_probe(struct phy_device *phydev)
>  	return 0;
>  }
> =20
> +static int mxl86211c_configure_mdio_voltage(struct phy_device *phydev,
> +					    struct regulator *vddp)
> +{
> +	int voltage;
> +	int val;
> +
> +	voltage =3D regulator_get_voltage(vddp);
> +	if (voltage < 0)
> +		return voltage;

[Severity: High]
If the device tree does not provide a vddp-supply, devm_regulator_get()
will return a dummy regulator. Calling regulator_get_voltage() on this dummy
regulator returns -EINVAL, which propagates up and aborts the probe. Will
this break backward compatibility on existing boards that do not define a
vddp-supply?

> +
> +	switch (voltage) {
> +	case 1800000:
> +		val =3D VSPEC1_PM_CTRL_MDIO_VOL;
> +		break;
> +	case 3300000:
> +		val =3D 0;
> +		break;
> +	default:
> +		phydev_err(phydev, "unsupported VDDP voltage: %d\n", voltage);
> +		return -EINVAL;
> +	}
> +
> +	return phy_modify_mmd(phydev, MDIO_MMD_VEND1, VSPEC1_PM_CTRL,
> +			      VSPEC1_PM_CTRL_MDIO_VOL, val);
> +}
> +
> +static int mxl86211c_probe(struct phy_device *phydev)
> +{
> +	struct device *dev =3D &phydev->mdio.dev;
> +	struct gpy_priv *priv;
> +	struct regulator *vddp;
> +	int ret;
> +
> +	vddp =3D devm_regulator_get(dev, "vddp");
> +	if (IS_ERR(vddp))
> +		return dev_err_probe(dev, PTR_ERR(vddp),
> +				     "failed to get VDDP supply\n");

[Severity: High]
The VDDP supply is acquired here, but it appears regulator_enable() is never
called. Because the regulator's use-count remains at zero, won't the
regulator core disable the VDDP supply during late init (via
regulator_disable_unused()) unless it is marked as regulator-always-on?=20

Disabling this supply would cut power to the PHY's MDIO pads and render the
network interface unusable.

> +	if (!vddp)
> +		return dev_err_probe(dev, -EOPNOTSUPP,
> +				     "VDDP supply requires regulator support\n");
> +
> +	ret =3D mxl86211c_configure_mdio_voltage(phydev, vddp);
> +	if (ret)
> +		return ret;
> +
> +	ret =3D gpy_probe(phydev);
> +	if (ret)
> +		return ret;
> +
> +	priv =3D phydev->priv;
> +	priv->vddp =3D vddp;
> +
> +	return 0;
> +}

--=20
Sashiko AI review =C2=B7 https://sashiko.dev/#/patchset/20261016112033.9490=
26-1-robert.marko@sartura.hr?part=3D2
