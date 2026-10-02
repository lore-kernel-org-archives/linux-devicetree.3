Received: from smtp.kernel.org (aws-us-west-2-korg-mail-alma10-1.taild15c8.ts.net [100.103.45.18])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 37914470456
	for <devicetree@vger.kernel.org>; Fri,  2 Oct 2026 09:13:24 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=100.103.45.18
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1790932405; cv=none; b=QaURXcJMLGxrZRagZ6Pj4k4IuK/eNL/LcEuha4t7BZkX6QJ7zp0agHkd4wRHByCMQORk+he0ZJDABGcr6oeUPqipXux7fG9frrXViUtFgvuWeCp5iAeRR3uara3PRMsHKUR8Se0VWSPCAyTK+sv1PHmMP3XuYair2xEE/S2pbpk=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1790932405; c=relaxed/simple;
	bh=I+mugzBuYacNctLG5+7DkXqaf8WbU8hP9WbalLNRqvo=;
	h=From:Subject:To:Cc:In-Reply-To:References:Content-Type:Date:
	 Message-Id; b=dzneKlReZAMS5I7uEy+5arG15ufrBShdtNT2zNzVsIcKe+fPmyII9hXauoTkjDIttu2AzokLftBiN1kIBKJuVji1l+piDwgnmyg3xEpjOwyqbHdZ2I4hA1QufG3Go+3Vh9JSNDDK9DeK5rWXuGVTWmASU/0MlSJptvsqtbsURdU=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=FRXPIM4U; arc=none smtp.client-ip=100.103.45.18
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="FRXPIM4U"
Received: by smtp.kernel.org (Postfix) with ESMTPSA id C4B331F0089A;
	Fri,  2 Oct 2026 09:13:23 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kernel.org;
	s=k20260515; t=1790932404;
	bh=6wd8BryNYzn78dw069wozEwiepPh2IFsuGQ4Ka9DZEw=;
	h=From:Subject:Reply-To:To:Cc:In-Reply-To:References:Date;
	b=FRXPIM4UoUSyn28RKYCMEY9KDcEdwZQm5lmHT1wtZ8cR/zwtGoplm6Ui3oSFH00Kz
	 2WuohmozgG1reFTGAkCLbWuR9RrbFjeAps3Lc5fG0jrW9q3UJ8CnkgwAdYaA0DRVV3
	 QimfDGcwX2pTch9k4MFzlteZZIjNrBHEZDJJKr8VBL51x+90C2pKG0DTESQXmnNtR8
	 fvanNHalTlNqc/YdmVcP7Iui3meS5t4ZuyNc1+ExcR8Yw3pCxZgPXoXOQNOnm7vQ4+
	 roFMhIjkGF4KRSdAUBtud0fqZFgoXYMe2vhhyFv9jtOUHrp98k3fFyWREPoKKpUrun
	 Oc3qcqaroG43A==
From: sashiko-bot@kernel.org
Subject: Re: [PATCH net-next v23 2/3] net: phy: Add support for Template
 Control register for PMA
Reply-To: sashiko-reviews@lists.linux.dev
To: "Kyle Switch" <kyle.switch@motor-comm.com>
Cc: conor+dt@kernel.org, robh@kernel.org, devicetree@vger.kernel.org
In-Reply-To: <20260930194513.663575-3-kyle.switch@motor-comm.com>
References: <20260930194513.663575-1-kyle.switch@motor-comm.com>
 <20260930194513.663575-3-kyle.switch@motor-comm.com>
Content-Type: text/plain; charset=utf-8
Content-Transfer-Encoding: quoted-printable
Date: Fri, 02 Oct 2026 09:13:23 +0000
Message-Id: <20261002091323.C4B331F0089A@smtp.kernel.org>
Precedence: bulk
X-Mailing-List: devicetree@vger.kernel.org
List-Id: <devicetree.vger.kernel.org>
List-Subscribe: <mailto:devicetree+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:devicetree+unsubscribe@vger.kernel.org>

Thank you for your contribution! Sashiko AI review found 3 potential issue(=
s) to consider:
- [Medium] mdio: uapi: unshifted test mode constants and GENMASK break user=
space
- [Low] phy: genphy_c45_template_testmode returns -EOPNOTSUPP instead of -E=
INVAL
- [Low] phy: vendor-specific 'Template' terminology pollutes generic API
--

commit 60718c14fbea745ac1034f4e3a4c75164fce8bb3
Author: Kyle Switch <kyle.switch@motor-comm.com>

net: phy: Add support for Template Control register for PMA

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
Is it appropriate to use the vendor-specific term Template in the generic
PHY API?

This terminology doesn't appear to exist in the IEEE 802.3 specification
for the 10GBASE-T test mode register (1.132, Clause 45.2.1.75). Using it
here and in the UAPI header may mislead developers using the generic PHY
headers.

> +{
> +	u16 ctrl;
> +
> +	if (test_mode > MDIO_PMA_10GBT_TESTMODE_7)
> +		return -EOPNOTSUPP;

[Severity: Low]
Should this bounds check return -EINVAL instead of -EOPNOTSUPP?

Returning -EOPNOTSUPP implies the hardware doesn't support the test mode
feature at all, while the actual problem here is that the provided
argument is invalid.

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
> +#define MDIO_PMA_10GBT_TESTMODE_NORMAL 0x0 /* Template Normal */
> +#define MDIO_PMA_10GBT_TESTMODE_1 0x1 /* Template TestMode1 */

[Severity: Medium]
Will this break compilation for userspace applications since GENMASK is a
kernel-internal macro?

Also, the constants are exported as unshifted values (e.g., 0x1) without a
corresponding shift macro. Since userspace applications don't have access to
FIELD_PREP(), applications attempting to use these constants directly will
erroneously set bit 0 instead of bit 13, leading to silent hardware
misconfiguration.

> +#define MDIO_PMA_10GBT_TESTMODE_2 0x2 /* Template TestMode2 */
> +#define MDIO_PMA_10GBT_TESTMODE_3 0x3 /* Template TestMode3 */
> +#define MDIO_PMA_10GBT_TESTMODE_4 0x4 /* Template TestMode4 */
> +#define MDIO_PMA_10GBT_TESTMODE_5 0x5 /* Template TestMode5 */
> +#define MDIO_PMA_10GBT_TESTMODE_6 0x6 /* Template TestMode6 */
> +#define MDIO_PMA_10GBT_TESTMODE_7 0x7 /* Template TestMode7 */
> +

--=20
Sashiko AI review =C2=B7 https://sashiko.dev/#/patchset/20260930194513.6635=
75-1-kyle.switch@motor-comm.com?part=3D2
