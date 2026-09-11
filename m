Received: from smtp.kernel.org (aws-us-west-2-korg-mail-alma10-1.taild15c8.ts.net [100.103.45.18])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 04999457E57
	for <devicetree@vger.kernel.org>; Fri, 11 Sep 2026 07:47:03 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=100.103.45.18
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1789112825; cv=none; b=F0WMu+uHNbom0pLQwLo/SnNP3hHxN5sACet1KBmwGJ2q6BhJ3VfuJo0GWzNF9QOterYbzbraayIZIWQLltqgNuLZGedSW38ktClIQQr4kOL5TI+kXeIpL4lJ+oMkIjQmMemplc+q+EvaBn0L34LvP64P/edD+VzniQPDt7jFod0=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1789112825; c=relaxed/simple;
	bh=7qAR0d5nUJ4Z2NOjJBKfSaTNgZb/a9W2bDyVVHrss08=;
	h=From:Subject:To:Cc:In-Reply-To:References:Content-Type:Date:
	 Message-Id; b=U7sb3HVfytEb1zXvLVZP5iF6u1wogjKuvRG9sTmUkPBRL7I8mjjEx7pXeBPCLD/7pFaswOu2mNTtBfel6jnNmBKp2/+btXBVOBgocZrKa/Yi/xO/o7unJ2ztmy0XaUIdy3ITFnhjTnuoirGGcBrQUVs1N+wVbr2wtQLRIlEH9RE=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=dAzrRcEK; arc=none smtp.client-ip=100.103.45.18
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="dAzrRcEK"
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 4E36B1F000FF;
	Fri, 11 Sep 2026 07:47:03 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kernel.org;
	s=k20260515; t=1789112823;
	bh=FXkFQaXHBosI6nOSGpFvUGYOa0q+nku8D3Ly0vylLRk=;
	h=From:Subject:Reply-To:To:Cc:In-Reply-To:References:Date;
	b=dAzrRcEKiYsB3UySc052oX2idJTOq4tnXcr1BywdY5hueY2MXZI5vlJDMrqLMIZ8Z
	 E4mTnMSjmTQOxnhsTpfH2aPwIWGUUXjpNivl7dAZzUIideH0zHV9lE3xscEPbAhMGL
	 /SgdRja/+2PGgy4lPZbBQ2tVVa2Ig4K0A3mVNseaN0/FQiKkEfVfpkO8HYqVN9USEm
	 hkUVYRiz39rJ2hEojbsSmJ56wzxjHuXXiAhWNA5R/YHzjiB/iA0Uj/DlPxHl0FAKWr
	 lDXG+WHU6lloPCKoqSdyyW7StHECmfOooe4SEL44rIWGCYV9RVh5pGSeVzOyvFvMIu
	 1pBgJ0z3tCl4A==
From: sashiko-bot@kernel.org
Subject: Re: [PATCH v16 1/2] net: phy: Add driver for Motorcomm Quad 2.5GbE
 phy
Reply-To: sashiko-reviews@lists.linux.dev
To: "Kyle Switch" <kyle.switch@motor-comm.com>
Cc: conor+dt@kernel.org, robh@kernel.org, devicetree@vger.kernel.org
In-Reply-To: <20260910074624.2426899-2-kyle.switch@motor-comm.com>
References: <20260910074624.2426899-1-kyle.switch@motor-comm.com>
 <20260910074624.2426899-2-kyle.switch@motor-comm.com>
Content-Type: text/plain; charset=utf-8
Content-Transfer-Encoding: quoted-printable
Date: Fri, 11 Sep 2026 07:47:02 +0000
Message-Id: <20260911074703.4E36B1F000FF@smtp.kernel.org>
Precedence: bulk
X-Mailing-List: devicetree@vger.kernel.org
List-Id: <devicetree.vger.kernel.org>
List-Subscribe: <mailto:devicetree+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:devicetree+unsubscribe@vger.kernel.org>

Thank you for your contribution! Sashiko AI review found 1 potential issue(=
s) to consider:
- [Medium] Missing `return 0;` on success path causes unintended execution =
of error cleanup code.
--

commit 9c78ead4e6ec97a6c3f67882266f516e5930cc7c
Author: Kyle Switch <kyle.switch@motor-comm.com>

net: phy: Add driver for Motorcomm Quad 2.5GbE phy

This commit adds support for the Motorcomm YT8824 quad-port 2.5G PHY to the
existing motorcomm driver. It implements the phy_package helpers to handle
the shared top extended register space and introduces a new exported phylib
helper, genphy_c45_template_testmode.

> diff --git a/drivers/net/phy/motorcomm.c b/drivers/net/phy/motorcomm.c
> index c5a2cda8d31bd..d535fd384e7bb 100644
> --- a/drivers/net/phy/motorcomm.c
> +++ b/drivers/net/phy/motorcomm.c
[ ... ]
> +static int yt8824_internal_config_init_paged(struct phy_device *phydev)
> +{
[ ... ]
> +	ret =3D genphy_c45_template_testmode
> +		(phydev, YT8824_UTP_TEMPLATE_TEST_MODE1);
> +	if (ret)
> +		goto err_restore_normal;
> +	/* reset */
> +	ret =3D phy_modify(phydev, MII_BMCR, BMCR_RESET | BMCR_ANENABLE,
> +			 BMCR_RESET | BMCR_ANENABLE);
> +	if (ret < 0)
> +		goto err_restore_normal;
> +	ret =3D phy_read_poll_timeout(phydev, MII_BMCR, val,
> +				    !(val & BMCR_RESET),
> +				    50000, 600000, true);
> +	if (ret < 0)
> +		goto err_restore_normal;
> +
> +	ret =3D genphy_c45_template_testmode
> +		(phydev, YT8824_UTP_TEMPLATE_TEST_NORMAL);
> +	if (ret < 0)
> +		goto err_restore_normal;
> +

[Severity: Medium]
Does this code accidentally fall through into the error cleanup path?

In yt8824_internal_config_init_paged(), the success path executes=20
genphy_c45_template_testmode() but misses a return statement before the=20
err_restore label. As a result, it unconditionally falls through to:

err_restore:
	r =3D phy_modify(phydev, MII_BMCR, BMCR_PDOWN, 0);

This will inadvertently clear the BMCR_PDOWN bit at the end of the=20
initialization function instead of keeping it in the expected power-down
state until it is explicitly resumed. Sister functions like=20
yt8824_extern_config_utp_init_paged() appear to handle this correctly by
including a return 0; statement here.

> +err_restore:
> +	r =3D phy_modify(phydev, MII_BMCR, BMCR_PDOWN, 0);
> +	if (ret >=3D 0 && r < 0)
> +		ret =3D r;
> +	return ret;
> +
> +err_restore_normal:
> +	r =3D genphy_c45_template_testmode(phydev,
> +					 YT8824_UTP_TEMPLATE_TEST_NORMAL);
> +	if (ret >=3D 0 && r < 0)
> +		ret =3D r;
> +	r =3D phy_modify(phydev, MII_BMCR, BMCR_PDOWN, 0);
> +	if (ret >=3D 0 && r < 0)
> +		ret =3D r;
> +	return ret;
> +}

--=20
Sashiko AI review =C2=B7 https://sashiko.dev/#/patchset/20260910074624.2426=
899-1-kyle.switch@motor-comm.com?part=3D1
