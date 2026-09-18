Received: from smtp.kernel.org (aws-us-west-2-korg-mail-alma10-1.taild15c8.ts.net [100.103.45.18])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 670214ED18E
	for <devicetree@vger.kernel.org>; Fri, 18 Sep 2026 13:15:05 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=100.103.45.18
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1789737306; cv=none; b=fHXn2X0ZUOj9OByombdOqcz9dWTHIshI6eB/EIqKrtjPgrQWx62aF1dsztvBp5IKCMClNt+vkfuKEnaH4ZnCHqyrBPW8tMND7ls1gMs8GPXoBQEfXotoegS/cIyRQYr6gB/Cg3S+Y535YKzSSncDpWFVwKUqRyqAmVfMFaQcSO8=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1789737306; c=relaxed/simple;
	bh=pg6y6befn4hiMpIUO8wP0FptGEhz7wafBJiJlJQ3m8g=;
	h=From:Subject:To:Cc:In-Reply-To:References:Content-Type:Date:
	 Message-Id; b=sefoRBM9ySexzWL1vxPtZjrxbFr/ZW+R5JylrVoM9TCvrzLLaCywAo6rY3vEDqP+M3iWgqxW/RgO867mK5yE/6F3VESThXJI1ZEgzuGurUCzdbRipJZdl4D3bRwVz7fZ1TZweRix0R/icLptZz9Zhki1gCflJK+0terkH0WhniI=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=EUGpdAVt; arc=none smtp.client-ip=100.103.45.18
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="EUGpdAVt"
Received: by smtp.kernel.org (Postfix) with ESMTPSA id CC5461F0089B;
	Fri, 18 Sep 2026 13:15:04 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kernel.org;
	s=k20260515; t=1789737305;
	bh=YbSjf2tcuVj6bice1mUfz6U+YBD3ferunKW3L3WzsDc=;
	h=From:Subject:Reply-To:To:Cc:In-Reply-To:References:Date;
	b=EUGpdAVtl27SrKCOz320nBL9kArZecQ3eQbF+0PFbuNkjAKBj04VJC30K4muGRdIA
	 lssVW7r3c/dfKe401YlV9TB5OsMBqnfp3EDCf0itK4RgScJCau3vuCDHeUBmF94Os/
	 +24ll/AmDTY8VG2qNjqprT4sGNfspiYydMgdkGTMIj1gDmKAXZMFfP+YbBU22sMoxu
	 ANInvcTvIejw23aqKu4BTTmSgN92AoSGgNPACaBFZs71Xh9xwTaw3z82fHsdm+OKIz
	 PeZU4HCDyAmF3RAd6Et9vdO0hNvb4ejdCohDuTXCQPSvxpOmFu2xtfe4w2xLZvG/M8
	 v1F5oBi0Iqs6g==
From: sashiko-bot@kernel.org
Subject: Re: [PATCH net-next v20 2/3] net: phy: Add support for Template
 Control register for PMA
Reply-To: sashiko-reviews@lists.linux.dev
To: "Kyle Switch" <kyle.switch@motor-comm.com>
Cc: devicetree@vger.kernel.org, robh@kernel.org, conor+dt@kernel.org
In-Reply-To: <20260917131441.3428554-3-kyle.switch@motor-comm.com>
References: <20260917131441.3428554-1-kyle.switch@motor-comm.com>
 <20260917131441.3428554-3-kyle.switch@motor-comm.com>
Content-Type: text/plain; charset=utf-8
Content-Transfer-Encoding: quoted-printable
Date: Fri, 18 Sep 2026 13:15:04 +0000
Message-Id: <20260918131504.CC5461F0089B@smtp.kernel.org>
Precedence: bulk
X-Mailing-List: devicetree@vger.kernel.org
List-Id: <devicetree.vger.kernel.org>
List-Subscribe: <mailto:devicetree+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:devicetree+unsubscribe@vger.kernel.org>

Thank you for your contribution! Sashiko AI review found 2 potential issue(=
s) to consider:
- [High] uapi: testmode mask uses kernel-only GENMASK macro
- [Low] net: phy: missing linux/bitfield.h include for FIELD_PREP
--

commit b5c025498496747ab794fc2b34dd0903358ffea9
Author: Kyle Switch <kyle.switch@motor-comm.com>

net: phy: Add support for Template Control register for PMA

This commit adds support for the 10GBASE-T PMA Template Test Mode register
field. It introduces configuration functions and macro definitions to allow
selecting test modes used for PHY validation.

> diff --git a/drivers/net/phy/phy-c45.c b/drivers/net/phy/phy-c45.c
> index 870920311f9a0..c5f5753f7194b 100644
> --- a/drivers/net/phy/phy-c45.c
> +++ b/drivers/net/phy/phy-c45.c
[ ... ]
> +int genphy_c45_template_testmode(struct phy_device *phydev, u16 test_mod=
e)
> +{
> +	u16 ctrl;
> +
> +	if (test_mode > MDIO_PMA_10GBT_TESTMODE_7)
> +		return -EOPNOTSUPP;
> +
> +	ctrl =3D FIELD_PREP(MDIO_PMA_10GBT_TESTMODE_MASK, test_mode);

[Severity: Low]
Does genphy_c45_template_testmode() rely on an implicit inclusion of
linux/bitfield.h? Using FIELD_PREP without explicitly including its required
header might lead to build failures if header dependencies change in the
future or on certain architectures.

> +	return phy_modify_mmd(phydev, MDIO_MMD_PMAPMD, MDIO_PMA_10GBT_TESTMODE,
> +			      MDIO_PMA_10GBT_TESTMODE_MASK, ctrl);
> +}
> +EXPORT_SYMBOL_GPL(genphy_c45_template_testmode);
[ ... ]
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

[Severity: High]
Can this macro break userspace compilation? GENMASK is a kernel-only constr=
uct,
so defining a UAPI macro with it could cause a build regression for
userspace applications that include linux/mdio.h and evaluate
MDIO_PMA_10GBT_TESTMODE_MASK.

> +#define MDIO_PMA_10GBT_TESTMODE_NORMAL 0x0 /* Template Normal */
> +#define MDIO_PMA_10GBT_TESTMODE_1 0x1 /* Template TestMode1 */

--=20
Sashiko AI review =C2=B7 https://sashiko.dev/#/patchset/20260917131441.3428=
554-1-kyle.switch@motor-comm.com?part=3D2
