Received: from smtp.kernel.org (aws-us-west-2-korg-mail-alma10-1.taild15c8.ts.net [100.103.45.18])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 0DF9B3EAC84
	for <devicetree@vger.kernel.org>; Fri, 25 Sep 2026 07:51:20 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=100.103.45.18
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1790322682; cv=none; b=lmehGsHhm1rVELmDiFj0uIAt5Dt09giLZMSZjLpbfTBgkOzQXt7qGH3E7evUHCfDt9x59LJFw0/A2jPpA3mGuU9sVkmjaL9a7yb0WTwpNgSZnGmkBLybzfvjmWHuAT7Go9WkBj8SyNOPn20EbCo/98PVcF8YFu7sRvoXJeoD+Q8=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1790322682; c=relaxed/simple;
	bh=OV886BjO04ewv4sqpW5mJh3Mfd04tHnzMTFT5P2ko1w=;
	h=From:Subject:To:Cc:In-Reply-To:References:Content-Type:Date:
	 Message-Id; b=h2YuXu48Z9Jonm1K97AuW/4YCEXNfyjhpa7bK2/x1+K9QIUGmADNWjT0V3neyiglcgQwf6GzWRQ0Wp8HTK+l5OZ6KCzJcG2ps/TDk2OrgabjXrjPWHv0N+lAPVikXEHAOl2+26B2mtrlJ5RXol276wYgEyNw0p2+DzcFlr9i1y4=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=ixcqT+2y; arc=none smtp.client-ip=100.103.45.18
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="ixcqT+2y"
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 6056C1F000FF;
	Fri, 25 Sep 2026 07:51:20 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kernel.org;
	s=k20260515; t=1790322680;
	bh=hHYzr6QdZqQPb3ga0Q/YxatfsTW8WsIYCWrx5ng2uLw=;
	h=From:Subject:Reply-To:To:Cc:In-Reply-To:References:Date;
	b=ixcqT+2yAmVNrY2pScmDREoXevgZOMV7xke3BFd5cLx0hZcZVoZdZ4C6w2w9MJ2u5
	 vYIq6HMvAu2Y2MWHMPlOVtl8ksa9135/teHD6cAB1yD2myUlvA8J+xCpXcfeQgwpbW
	 zgcGtdFlshYUMLoYnmwlOjI+TswiHDTjFEhnkNKQAf34prpdukfvBH3Pz6VHWyI4A3
	 xFrMiJNX13b89AV40y+rCP2C1WeAOfKyhZv8VOJ2ucsQ60g+Cgy6XbqEQc/+3rLZ2g
	 vvi+26FchICuSwgOvCyMIsTtJCTR057veBZWB7ofVGt6PYRP/YEk8R5vLwlgygLsQE
	 bCrikeRhFS7wQ==
From: sashiko-bot@kernel.org
Subject: Re: [PATCH net-next v21 2/3] net: phy: Add support for Template
 Control register for PMA
Reply-To: sashiko-reviews@lists.linux.dev
To: "Kyle Switch" <kyle.switch@motor-comm.com>
Cc: devicetree@vger.kernel.org, conor+dt@kernel.org, robh@kernel.org
In-Reply-To: <20260924075048.4060414-3-kyle.switch@motor-comm.com>
References: <20260924075048.4060414-1-kyle.switch@motor-comm.com>
 <20260924075048.4060414-3-kyle.switch@motor-comm.com>
Content-Type: text/plain; charset=utf-8
Content-Transfer-Encoding: quoted-printable
Date: Fri, 25 Sep 2026 07:51:19 +0000
Message-Id: <20260925075120.6056C1F000FF@smtp.kernel.org>
Precedence: bulk
X-Mailing-List: devicetree@vger.kernel.org
List-Id: <devicetree.vger.kernel.org>
List-Subscribe: <mailto:devicetree+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:devicetree+unsubscribe@vger.kernel.org>

Thank you for your contribution! Sashiko AI review found 2 potential issue(=
s) to consider:
- [Medium] UAPI: kernel-internal GENMASK breaks userspace build
- [Low] phy-c45: genphy_c45_template_testmode() returns -EOPNOTSUPP for inv=
alid argument
--

commit 188b76c25d65c5d40038c12ea01f1d6261994387
Author: Kyle Switch <kyle.switch@motor-comm.com>

net: phy: Add support for Template Control register for PMA
   =20
This commit adds support for the 10GBASE-T PMA Template Test Mode register
field. This allows selecting test modes used for PHY validation.

> diff --git a/drivers/net/phy/phy-c45.c b/drivers/net/phy/phy-c45.c
> index 870920311f9a0..c5f5753f7194b 100644
> --- a/drivers/net/phy/phy-c45.c
> +++ b/drivers/net/phy/phy-c45.c

[ ... ]

> @@ -1408,6 +1408,29 @@ int genphy_c45_fast_retrain(struct phy_device *phy=
dev, bool enable)
>  }
>  EXPORT_SYMBOL_GPL(genphy_c45_fast_retrain);
> =20
> +/**
> + * genphy_c45_template_testmode - configure template testmode registers
> + * @phydev: target phy_device struct
> + * @test_mode: testmode includes Normal to Test mode 7
> + *
> + * Description: Set template testmode include Normal to Test mode 7
> + *
> + * Return: 0 on success, or a negative error code on failure (e.g. regis=
ter
> + * read/write error).
> + */
> +int genphy_c45_template_testmode(struct phy_device *phydev, u16 test_mod=
e)
> +{
> +	u16 ctrl;
> +
> +	if (test_mode > MDIO_PMA_10GBT_TESTMODE_7)
> +		return -EOPNOTSUPP;

[Severity: Low]
Does this return the correct error code?=20

Returning -EOPNOTSUPP usually implies that the hardware lacks the capabilit=
y.
Would it be better to return -EINVAL here to indicate that the caller passed
an out-of-bounds test_mode parameter?

> +
> +	ctrl =3D FIELD_PREP(MDIO_PMA_10GBT_TESTMODE_MASK, test_mode);
> +	return phy_modify_mmd(phydev, MDIO_MMD_PMAPMD, MDIO_PMA_10GBT_TESTMODE,
> +			      MDIO_PMA_10GBT_TESTMODE_MASK, ctrl);
> +}
> +EXPORT_SYMBOL_GPL(genphy_c45_template_testmode);

> diff --git a/include/uapi/linux/mdio.h b/include/uapi/linux/mdio.h
> index 06f4bc3c20c71..353ca13c64fca 100644
> --- a/include/uapi/linux/mdio.h
> +++ b/include/uapi/linux/mdio.h

[ ... ]

> @@ -320,6 +321,17 @@
>  /* PMA 10GBASE-R Fast Retrain status and control register. */
>  #define MDIO_PMA_10GBR_FSRT_ENABLE	0x0001	/* Fast retrain enable */
> =20
> +/* PMA 10GBASE-T Template Test Mode Register*/
> +#define MDIO_PMA_10GBT_TESTMODE_MASK GENMASK(15, 13) /* Template test mo=
de */

[Severity: Medium]
Can this cause compilation failures for userspace programs?

The GENMASK macro is kernel-internal and isn't exported to standard userspa=
ce
headers, which typically only expose __GENMASK. Including GENMASK in a UAPI
header might break builds for any userspace applications that include
linux/mdio.h and evaluate this macro.

> +#define MDIO_PMA_10GBT_TESTMODE_NORMAL 0x0 /* Template Normal */
> +#define MDIO_PMA_10GBT_TESTMODE_1 0x1 /* Template TestMode1 */

--=20
Sashiko AI review =C2=B7 https://sashiko.dev/#/patchset/20260924075048.4060=
414-1-kyle.switch@motor-comm.com?part=3D2
