Received: from smtp.kernel.org (aws-us-west-2-korg-mail-alma10-1.taild15c8.ts.net [100.103.45.18])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 7139C2F0C79
	for <devicetree@vger.kernel.org>; Wed, 30 Sep 2026 10:00:17 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=100.103.45.18
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1790762418; cv=none; b=DnozIcuMWqqRYecbWHqO9NHqVFI5p4VfZsKUQMrFnAR1EF8uv8xktbbGewXa51qi1PIuNskEskfbwWOrBz1+CZWXFmWMOaCXRU0y12YVw0TjHroCZH9Bc5ojnttK5hR2w5VsRQZsIpfvmac8tNrhNyW7X1qwqAU/0mOvPz20S8w=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1790762418; c=relaxed/simple;
	bh=64vmMXy2gN9MkSRHnrqu7yc57uu3D+0yvHkQtzRwLCU=;
	h=From:Subject:To:Cc:In-Reply-To:References:Content-Type:Date:
	 Message-Id; b=aQDKjRU5n9WRq+1cZ2DIJVw7BVgDnnJObtkwg6tjOfrWoOWG4RdtAwdEOtZGV0yXqM4Wl5BHKQaI1MWjIszXzywF+B6E86PIAtOZ+7HGkaolB0CtOIcg2Ybe9T6EMn7zGbDf0ZWC27kmFdELmqvmg2BEQqH/9QkdSs1M2CciVvI=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=EV+QqBmV; arc=none smtp.client-ip=100.103.45.18
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="EV+QqBmV"
Received: by smtp.kernel.org (Postfix) with ESMTPSA id B09971F00898;
	Wed, 30 Sep 2026 10:00:16 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kernel.org;
	s=k20260515; t=1790762417;
	bh=kJi5tgW+ZVQD+rvs3CxkVq3SUqA4DqMEUMrWrPCs/lo=;
	h=From:Subject:Reply-To:To:Cc:In-Reply-To:References:Date;
	b=EV+QqBmV7esTi/H/sPK3XW0tj6Q9FoQP54Br0mZwSayKkWIHLxzDZlefIGl6NY/UL
	 boshb9EDqykBpMu5o/livwNKqEiJ+SBS9AnD0vDs5CdwmpYT9B1GXmeHMe+8+jJSDX
	 ELB0dn7AClcmf1VX71CUKxAKEpSWBm2xUsHvw0Vm3MGRWz8t+F7QyzxjeXvr3yRY+s
	 2lwSzAvqm5UqZ+3mwZyKeLyrdQTgbx51H7w2fVa36Kcn8fJziHJZdHdnZOk+TxWpZI
	 YqrYaqzT5zmR99d7XFngATcesBiXohUrvIMPG6nzJRILQTVTgDEsxX6ucKKVmUWUUA
	 AniD4ZqvczHSQ==
From: sashiko-bot@kernel.org
Subject: Re: [PATCH net-next v22 2/3] net: phy: Add support for Template
 Control register for PMA
Reply-To: sashiko-reviews@lists.linux.dev
To: "Kyle Switch" <kyle.switch@motor-comm.com>
Cc: robh@kernel.org, devicetree@vger.kernel.org, conor+dt@kernel.org
In-Reply-To: <20260929095430.508657-3-kyle.switch@motor-comm.com>
References: <20260929095430.508657-1-kyle.switch@motor-comm.com>
 <20260929095430.508657-3-kyle.switch@motor-comm.com>
Content-Type: text/plain; charset=utf-8
Content-Transfer-Encoding: quoted-printable
Date: Wed, 30 Sep 2026 10:00:16 +0000
Message-Id: <20260930100016.B09971F00898@smtp.kernel.org>
Precedence: bulk
X-Mailing-List: devicetree@vger.kernel.org
List-Id: <devicetree.vger.kernel.org>
List-Subscribe: <mailto:devicetree+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:devicetree+unsubscribe@vger.kernel.org>

Thank you for your contribution! Sashiko AI review found 2 potential issue(=
s) to consider:
- [High] uapi: kernel-internal GENMASK used in uapi header breaks userspace=
 compilation
- [Low] net: phy: 'template' is a misnomer for standard 10GBASE-T test mode
--

commit b002860110e66ac77172a47fcc853ce9025d5816
Author: Kyle Switch <kyle.switch@motor-comm.com>

net: phy: Add support for Template Control register for PMA
   =20
Add support for the 10GBASE-T PMA Template Test Mode register
field, which allows selecting one of eight test modes (Normal and
TestMode1..TestMode7) used for PHY validation.

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

[Severity: Low]
Does the word "template" accurately reflect the IEEE 802.3 standard?

The IEEE 802.3 standard (Clause 45.2.1.75) defines this as the 10GBASE-T
test mode register. Using the word "template" in the core PHY API and UAPI
comments appears to be a misnomer that could cause confusion, as it is not
part of the standard nomenclature.

> +{
> +	u16 ctrl;
> +
> +	if (test_mode > MDIO_PMA_10GBT_TESTMODE_7)
> +		return -EOPNOTSUPP;
> +
> +	ctrl =3D FIELD_PREP(MDIO_PMA_10GBT_TESTMODE_MASK, test_mode);
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
Will exposing the kernel-internal GENMASK macro in a UAPI header cause
compilation failures for userspace programs?

Userspace applications including linux/mdio.h will fail to compile because
GENMASK is defined in linux/bits.h, which is not available to userspace.
UAPI headers must use __GENMASK instead.

> +#define MDIO_PMA_10GBT_TESTMODE_NORMAL 0x0 /* Template Normal */
> +#define MDIO_PMA_10GBT_TESTMODE_1 0x1 /* Template TestMode1 */
> +#define MDIO_PMA_10GBT_TESTMODE_2 0x2 /* Template TestMode2 */
> +#define MDIO_PMA_10GBT_TESTMODE_3 0x3 /* Template TestMode3 */
> +#define MDIO_PMA_10GBT_TESTMODE_4 0x4 /* Template TestMode4 */
> +#define MDIO_PMA_10GBT_TESTMODE_5 0x5 /* Template TestMode5 */
> +#define MDIO_PMA_10GBT_TESTMODE_6 0x6 /* Template TestMode6 */
> +#define MDIO_PMA_10GBT_TESTMODE_7 0x7 /* Template TestMode7 */

[Severity: High]
Since kernel helpers like FIELD_PREP are not available in userspace, does
providing these unshifted constants without a corresponding shift macro for=
ce
userspace applications to hardcode the shifts when using them?

>  /* PCS 10GBASE-R/-T status register 1. */
>  #define MDIO_PCS_10GBRT_STAT1_BLKLK	0x0001	/* Block lock attained */
>

--=20
Sashiko AI review =C2=B7 https://sashiko.dev/#/patchset/20260929095430.5086=
57-1-kyle.switch@motor-comm.com?part=3D2
