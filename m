Received: from smtp.kernel.org (aws-us-west-2-korg-mail-alma10-1.taild15c8.ts.net [100.103.45.18])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id E76723B8945
	for <devicetree@vger.kernel.org>; Thu,  1 Oct 2026 12:23:32 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=100.103.45.18
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1790857414; cv=none; b=iZy+An3GGKKdNEozcI5meAU1tF84tbgxWafB/QnQVehJU7lo9VdZaH2CzWfJn2uj5lXd2FWBAcaasN8GC86DgTWUqwyMxYB/NJQJv6u3MR+aB+sJPXTrEeMlJ+8WK/CfoA7YOBVpU6wY+ykmDpf/oaVAKPxIoSQ25ro552khMIo=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1790857414; c=relaxed/simple;
	bh=ERgwMoDd+SgpXk/AL8RS8MJYa67Y+4D16G2XzX3PMMs=;
	h=From:Subject:To:Cc:In-Reply-To:References:Content-Type:Date:
	 Message-Id; b=N/RjNyA1ukVyVn2KnVmoR5KAaAQPmSmscAAvtmv6hX73xjahjik5vwBHbtVDnRtCIKcSeeS/CNIz/XFTVF6aaTy2cSuQLgfK8OEva+BvHvJhcLjJFdSndii2DGuYdX1c9TIn73djX2QOBuKyaKx9s2VkpejbUgUKzj3YDOvyZ8I=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=Yk067toA; arc=none smtp.client-ip=100.103.45.18
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="Yk067toA"
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 8351D1F00899;
	Thu,  1 Oct 2026 12:23:32 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kernel.org;
	s=k20260515; t=1790857412;
	bh=K9UuISO+CxhZ55DPSW8SaOfS8npyFgFLqUpXajdG/rk=;
	h=From:Subject:Reply-To:To:Cc:In-Reply-To:References:Date;
	b=Yk067toAb+d3IrVPCHgNvJR2rmKItho05fmluOsavcmUR03vHsfgcQ6ohjb5maqfR
	 ppHge2LRz6lmjy3WpyeGZZA6fVs238HHxnzadOHmi9FrE3ayZGLGKXGXMFmScLZiAY
	 Wu0AQuu+mkm6MwUuHdcjZNQ9GtRT2ss+3H32jMRwz5eT446EbsEg7zvsLmrOinxuzX
	 3Tw01+mQRsTgr0PuApgxBsCVafMYonVueeNbcTjz7+Nxwg7Oh86SIB8ITqWEQcGQqt
	 wAxfNo9KrLOmH3IQzLZMxoaHU4SamcK8pNl72rDmDdNUS79GqO0dUdl++kMfCyZamK
	 rYvF7SLmpSHnw==
From: sashiko-bot@kernel.org
Subject: Re: [PATCH 2/5] net: phy: mxl-gpy: add MxL86211C MDIO I/O regulator
Reply-To: sashiko-reviews@lists.linux.dev
To: "Robert Marko" <robert.marko@sartura.hr>
Cc: robh@kernel.org, devicetree@vger.kernel.org, conor+dt@kernel.org
In-Reply-To: <20260930122305.293686-2-robert.marko@sartura.hr>
References: <20260930122305.293686-1-robert.marko@sartura.hr>
 <20260930122305.293686-2-robert.marko@sartura.hr>
Content-Type: text/plain; charset=utf-8
Content-Transfer-Encoding: quoted-printable
Date: Thu, 01 Oct 2026 12:23:32 +0000
Message-Id: <20261001122332.8351D1F00899@smtp.kernel.org>
Precedence: bulk
X-Mailing-List: devicetree@vger.kernel.org
List-Id: <devicetree.vger.kernel.org>
List-Subscribe: <mailto:devicetree+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:devicetree+unsubscribe@vger.kernel.org>

Thank you for your contribution! Sashiko AI review found 1 potential issue(=
s) to consider:
- [High] phy: mxl-gpy: MDIO voltage configuration is lost upon PHY hard res=
et
--

commit 438b87726bd21719eabd6b5d16a0da13d7bc0f33
Author: Robert Marko <robert.marko@sartura.hr>

net: phy: mxl-gpy: add MxL86211C MDIO I/O regulator

This commit models the MxL86211C MDIO I/O voltage setting as a regulator. It
registers a regulator during probe to configure the MDIO pads for 1.8V or
3.3V signaling based on board requirements.

> diff --git a/drivers/net/phy/mxl-gpy.c b/drivers/net/phy/mxl-gpy.c
> --- a/drivers/net/phy/mxl-gpy.c
> +++ b/drivers/net/phy/mxl-gpy.c

[ ... ]

> @@ -390,6 +396,72 @@ static int gpy_probe(struct phy_device *phydev)

[ ... ]

> +static int mxl86211c_probe(struct phy_device *phydev)
> +{
> +	struct device *dev =3D &phydev->mdio.dev;
> +	struct regulator_config config =3D { };
> +	struct regulator_dev *rdev;
> +	int ret;
> +
> +	ret =3D gpy_probe(phydev);
> +	if (ret)
> +		return ret;
> +
> +	config.dev =3D dev;
> +	config.driver_data =3D phydev;
> +
> +	rdev =3D devm_regulator_register(dev, &mxl86211c_mdio_desc, &config);

[Severity: High]
Does the initialization and reset recovery path (such as the config_init
callback) need a way to restore the MDIO voltage regulator state?

When the MAC driver or PHY framework toggles the PHY reset GPIO (for exampl=
e,
during interface up/down or suspend/resume), the PHY's internal registers a=
re
cleared. The phy_init_hw() function will then call the PHY's config_init
callback.

Because the voltage is applied by the regulator framework's constraint
evaluation exactly once here during probe, the regulator core is unaware
of the hardware reset and does not re-apply the voltage.

If the board uses 1.8V, the PHY falling back to 3.3V MDIO signaling after
reset could cause a mismatch, leading to unreliable MDIO communication and
making the PHY inaccessible.

> +	if (IS_ERR(rdev)) {
> +		phydev_err(phydev, "failed to register MDIO regulator\n");
> +		return PTR_ERR(rdev);
> +	}
> +
> +	return 0;
> +}

--=20
Sashiko AI review =C2=B7 https://sashiko.dev/#/patchset/20260930122305.2936=
86-1-robert.marko@sartura.hr?part=3D2
