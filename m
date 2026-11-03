Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=100.103.45.18
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1793736212;
	b=3lanrPbj3LZ9HTF7ckAYCWPFAoFyW2A8Auuwji+VRhoYB1/r8ZXlyOYN75bR10vuNetn
	 LcwYUlTTct0k28+Y+23jCkAqH0gB64wZylhe/A4Tye6AwrY572t2McCLr5WWxZ+CT+5Al
	 pW6l9rqzyXEleP1VqM2fGGocrp5r+DNY2nc7o+jH660kIuhIzJiihioNxyf6hlu5v7LWs
	 KFoLhxi2N3ogYlnzkFpaBGBrNtFJLKgUIB+HDkmEfCzyTf0gwXpvTseazZivNDrIJYQag
	 YjNlFcZioedFswDKmfYDfBY254xWa+aSIKWwtsiSkOY3WWI7deckQgqshWgbN/hYCAQ==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1793736212;
	h=Received:DKIM-Signature:Message-ID:From:Subject:Reply-To:To:Cc:
	 In-Reply-To:References:Content-Type:Content-Transfer-Encoding:Date;
	bh=U1Or1ILmplwMCt9mtFKMvSlwMjG1et6SGTG6EtWHktk=;
	b=ofNpePizAr5y41PXG+WrYo7M+z6ybRYXwaE+vy5iwsL+MkMdZUhBsuX5ZtZZhNN9eub2
	 f5aPfGPGm5EtgHedOtqaGVjOe7x1v999Cml7vzRysJ4gfJnrZNZneaBi83edqKIWJKIC2
	 9uQ66IEcLJanZe+oujosQlRukJWLk9HmMhu4bus1ik5H2QF2/50tX6q2o93kfTuFDimxn
	 /HMTqDP6aNBc/9y4FWygSRDkJva9yndCteGPAEF/magrTcOqY1LxKhy2JlSHdcPyvq51H
	 G/iI9I0O+fCGYpA1Kn4r+A8Rf4c82nDluO4lAyyvqOQbbBrw6fjAWFsMqyJyGzP44Qg==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dkim=pass header.d=kernel.org header.i=@kernel.org header.a=rsa-sha256 header.s=k20260515 header.b=d7cYleg+;
	arc=none smtp.remote-ip=100.103.45.18
Received: from smtp.kernel.org (quasi.space.kernel.org [100.103.45.18])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id CACC1606A326
	for <devicetree@vger.kernel.org>; Tue,  3 Nov 2026 20:03:31 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key, unprotected) header.d=kernel.org header.i=@kernel.org header.a=rsa-sha256 header.s=k20260515 header.b=d7cYleg+
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 0993F1F0093A;
	Tue,  3 Nov 2026 20:03:30 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kernel.org;
	s=k20260515; t=1793736211;
	bh=U1Or1ILmplwMCt9mtFKMvSlwMjG1et6SGTG6EtWHktk=;
	h=From:Subject:Reply-To:To:Cc:In-Reply-To:References:Date;
	b=d7cYleg+OR4CIAZnd+7AnQG86/Zmdur8xmaMk55VXcxRpgKwhOo5CgjcvjGjXPTzU
	 hlM8n0pvImC/lsaYnVM7wyp0wsZZpUzASyGuALKH95DdWNsE36h+AX5PfRvTD+y9Zc
	 LgFdTwoznrd5iFfJUc/2E7lbjecno2ffy0jqJzOWENtxPpmrXFGBkO13y0i9Gy5dza
	 bFBW2KKXf4CCLdiwLX9WAN1MZ8LlQxotDgU0BEzzZfnCI1sDFDATvBkFMQ5uGdrsNo
	 pd65W0MKUQaO3Gn/nmp1JlCXGIQHyl8mjaPjutn+k95wDIAaIMyXpFmUvF2ur0bRsb
	 dpzm+93yN6acw==
Message-ID: <sashiko-outbox-195954@kernel.org>
From: sashiko-bot@kernel.org
Subject: Re: [PATCH v5 2/2] phy: airoha: add support for AN7583 Gen3 PCIe
 PHY driver
Reply-To: sashiko-reviews@lists.linux.dev
To: "Christian Marangi" <ansuelsmth@gmail.com>, linux-phy@lists.infradead.org, devicetree@vger.kernel.org
Cc: robh@kernel.org, conor+dt@kernel.org, vkoul@kernel.org, neil.armstrong@linaro.org, olteanv@gmail.com
In-Reply-To: <20261103195007.9721-3-ansuelsmth@gmail.com>
References: <20261103195007.9721-1-ansuelsmth@gmail.com>
 <20261103195007.9721-3-ansuelsmth@gmail.com>
Content-Type: text/plain; charset=utf-8
Content-Transfer-Encoding: quoted-printable
Date: Tue, 03 Nov 2026 20:03:30 +0000
X-Mailing-List: devicetree@vger.kernel.org
List-Id: <devicetree.vger.kernel.org>
List-Post: <mailto:devicetree@vger.kernel.org>
List-Help: <mailto:devicetree+help@vger.kernel.org>
List-Subscribe: <mailto:devicetree+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:devicetree+unsubscribe@vger.kernel.org>
List-Owner: <mailto:devicetree+owner@vger.kernel.org>
Precedence: list

Thank you for your contribution! Sashiko AI review found 4 potential issue(=
s) to consider:
- [Medium] phy: airoha: use of devm_phy_optional_get() for required qp_phy
- [Medium] phy: airoha: G3_ANA_PXP_JCPLL_SSC_EN not cleared on init or dein=
it
- [Low] phy: airoha: misuse of dev_err_probe() in an7583_pcie_phy_init()
- [Low] phy: airoha: unused FREQ_LOCK_MAX_ATTEMPT macro and MAINTAINERS ord=
er
--

commit 2954f920d212f21a88edba191990e99091d7cd13
Author: Christian Marangi <ansuelsmth@gmail.com>

phy: airoha: add support for AN7583 Gen3 PCIe PHY driver

This commit adds a new PHY driver for the Gen3 PCIe port on the Airoha
AN7583 SoC, implementing its register map and calibration sequence.

> diff --git a/MAINTAINERS b/MAINTAINERS
> index 93abbb315065d..fb88a25ce0381 100644
> --- a/MAINTAINERS
> +++ b/MAINTAINERS
> @@ -788,6 +788,14 @@ F:	Documentation/devicetree/bindings/phy/airoha,en75=
81-pcie-phy.yaml
>  F:	drivers/phy/phy-airoha-pcie-regs.h
>  F:	drivers/phy/phy-airoha-pcie.c
> =20
> +AIROHA AN7583 PCIE PHY DRIVER
> +M:	Christian Marangi <ansuelsmth@gmail.com>
> +L:	linux-arm-kernel@lists.infradead.org (moderated for non-subscribers)
> +S:	Maintained
> +F:	Documentation/devicetree/bindings/phy/airoha,an7583-pcie-gen3-phy.yaml
> +F:	drivers/phy/airoha/phy-an7583-pcie-regs.h
> +F:	drivers/phy/airoha/phy-an7583-pcie.c
> +
>  AIROHA SOUND DRIVER
>  M:	Christian Marangi <ansuelsmth@gmail.com>
>  L:	linux-sound@vger.kernel.org
[ ... ]
> diff --git a/drivers/phy/airoha/phy-an7583-pcie.c b/drivers/phy/airoha/ph=
y-an7583-pcie.c
> new file mode 100644
> index 0000000000000..f3c42654895f8
> --- /dev/null
> +++ b/drivers/phy/airoha/phy-an7583-pcie.c
> @@ -0,0 +1,823 @@
[ ... ]
> +#include "phy-an7583-pcie-regs.h"
> +
> +#define FREQ_LOCK_MAX_ATTEMPT	50

[Severity: Low]
This isn't a bug, but FREQ_LOCK_MAX_ATTEMPT is defined in
drivers/phy/airoha/phy-an7583-pcie.c without being referenced anywhere in
the driver. Also, in MAINTAINERS, AIROHA AN7583 PCIE PHY DRIVER is placed
after AIROHA PCIE PHY DRIVER; should FREQ_LOCK_MAX_ATTEMPT be dropped and
the MAINTAINERS entry be placed in alphabetical order before AIROHA
ETHERNET DRIVER?

[ ... ]
> +static void an7583_pcie_phy_init_jcpll(struct an7583_pcie_phy *pcie_phy)
> +{
> +	regmap_set_bits(pcie_phy->g3_pma, REG_FORCE_DA_PXP_JCPLL_CKOUT_EN,
> +			G3_PMA_FORCE_SEL_DA_PXP_JCPLL_EN);
> +	regmap_clear_bits(pcie_phy->g3_pma, REG_FORCE_DA_PXP_JCPLL_CKOUT_EN,
> +			  G3_PMA_FORCE_DA_PXP_JCPLL_EN);
> +	regmap_update_bits(pcie_phy->g3_ana, REG_PXP_JCPLL_SPARE_H,
> +			   G3_ANA_PXP_JCPLL_SPARE_L,
> +			   FIELD_PREP(G3_ANA_PXP_JCPLL_SPARE_L, 0x20));
> +	regmap_set_bits(pcie_phy->g3_ana, REG_PXP_JCPLL_RST_DLY,
> +			G3_ANA_PXP_JCPLL_PLL_RSTB);
> +	regmap_update_bits(pcie_phy->g3_ana, REG_PXP_JCPLL_SSC_DELTA,
> +			   G3_ANA_PXP_JCPLL_SSC_DELTA,
> +			   FIELD_PREP(G3_ANA_PXP_JCPLL_SSC_DELTA, 0x0));
> +	regmap_update_bits(pcie_phy->g3_ana, REG_PXP_JCPLL_SSC_TRI_EN,
> +			   G3_ANA_PXP_JCPLL_SSC_DELTA1,
> +			   FIELD_PREP(G3_ANA_PXP_JCPLL_SSC_DELTA1, 0x0));
> +	regmap_update_bits(pcie_phy->g3_ana, REG_PXP_JCPLL_SSC_DELTA,
> +			   G3_ANA_PXP_JCPLL_SSC_PERIOD,
> +			   FIELD_PREP(G3_ANA_PXP_JCPLL_SSC_PERIOD, 0x0));
> +	regmap_clear_bits(pcie_phy->g3_ana, REG_PXP_JCPLL_VCO_TCLVAR,
> +			  G3_ANA_PXP_JCPLL_SSC_PHASE_INI);
> +	regmap_clear_bits(pcie_phy->g3_ana, REG_PXP_JCPLL_SSC_TRI_EN,
> +			  G3_ANA_PXP_JCPLL_SSC_TRI_EN);
[ ... ]
> +static void an7583_pcie_phy_init_ssc_jcpll(struct an7583_pcie_phy *pcie_=
phy)
> +{
> +	regmap_update_bits(pcie_phy->g3_ana, REG_PXP_JCPLL_SSC_DELTA,
> +			   G3_ANA_PXP_JCPLL_SSC_DELTA,
> +			   FIELD_PREP(G3_ANA_PXP_JCPLL_SSC_DELTA, 0x106));
> +	regmap_update_bits(pcie_phy->g3_ana, REG_PXP_JCPLL_SSC_TRI_EN,
> +			   G3_ANA_PXP_JCPLL_SSC_DELTA1,
> +			   FIELD_PREP(G3_ANA_PXP_JCPLL_SSC_DELTA1, 0x106));
> +	regmap_update_bits(pcie_phy->g3_ana, REG_PXP_JCPLL_SSC_DELTA,
> +			   G3_ANA_PXP_JCPLL_SSC_PERIOD,
> +			   FIELD_PREP(G3_ANA_PXP_JCPLL_SSC_PERIOD, 0x31B));
> +	regmap_set_bits(pcie_phy->g3_ana, REG_PXP_JCPLL_VCO_TCLVAR,
> +			G3_ANA_PXP_JCPLL_SSC_PHASE_INI);
> +	regmap_set_bits(pcie_phy->g3_ana, REG_PXP_JCPLL_VCO_TCLVAR,
> +			G3_ANA_PXP_JCPLL_SSC_EN);
> +	regmap_set_bits(pcie_phy->g3_ana, REG_PXP_JCPLL_SDM_IFM,
> +			G3_ANA_PXP_JCPLL_SDM_IFM);
> +	regmap_set_bits(pcie_phy->g3_ana, REG_PXP_JCPLL_SDM_HREN,
> +			G3_ANA_PXP_JCPLL_SDM_HREN);
> +	regmap_clear_bits(pcie_phy->g3_ana, REG_PXP_JCPLL_RST_DLY,
> +			  G3_ANA_PXP_JCPLL_SDM_DI_EN);
> +	regmap_set_bits(pcie_phy->g3_ana, REG_PXP_JCPLL_SSC_TRI_EN,
> +			G3_ANA_PXP_JCPLL_SSC_TRI_EN);
> +}
[ ... ]
> +static int an7583_pcie_phy_deinit(struct an7583_pcie_phy *pcie_phy)
> +{
> +	/* Disable RX CDR/PR */
> +	regmap_clear_bits(pcie_phy->g3_pma, REG_SS_DA_XPON_PWDB_0,
> +			  G3_PMA_DA_XPON_CDR_PR_PWDB);
> +
> +	/* Disable TX PLL output/enable */
> +	regmap_clear_bits(pcie_phy->g3_pma, REG_FORCE_DA_PXP_TXPLL_CKOUT_EN,
> +			  G3_PMA_FORCE_DA_PXP_TXPLL_CKOUT_EN |
> +			  G3_PMA_FORCE_SEL_DA_PXP_TXPLL_CKOUT_EN |
> +			  G3_PMA_FORCE_SEL_DA_PXP_TXPLL_EN |
> +			  G3_PMA_FORCE_DA_PXP_TXPLL_EN);
> +
> +	/* Disable JCPLL output/enable */
> +	regmap_clear_bits(pcie_phy->g3_pma, REG_FORCE_DA_PXP_JCPLL_CKOUT_EN,
> +			  G3_PMA_FORCE_DA_PXP_JCPLL_CKOUT_EN |
> +			  G3_PMA_FORCE_SEL_DA_PXP_JCPLL_CKOUT_EN |
> +			  G3_PMA_FORCE_SEL_DA_PXP_JCPLL_EN |
> +			  G3_PMA_FORCE_DA_PXP_JCPLL_EN);
> +
> +	/* Assert PHY resets */
> +	regmap_clear_bits(pcie_phy->g3_pma, REG_SW_RST_SET,
> +			  G3_PMA_SW_TX_FIFO_RST_N |
> +			  G3_PMA_SW_ALLPCS_RST_N |
> +			  G3_PMA_SW_PMA_RST_N |
> +			  G3_PMA_SW_TX_RST_N |
> +			  G3_PMA_SW_RX_FIFO_RST_N |
> +			  G3_PMA_SW_XFI_RXPCS_RST_N |
> +			  G3_PMA_SW_REF_RST_N |
> +			  G3_PMA_SW_RX_RST_N);
> +
> +	/* Disable TX analog blocks */
> +	regmap_clear_bits(pcie_phy->g3_ana, REG_PXP_TX_CKLDO_EN,
> +			  G3_ANA_PXP_TX_CKLDO_EN |
> +			  G3_ANA_PXP_TX_DMEDGEGEN_EN);
> +
> +	return 0;
> +}

[Severity: Medium]
When an7583_pcie_phy_init() runs, an7583_pcie_phy_init_ssc_jcpll() enables
JCPLL spread-spectrum clocking by setting G3_ANA_PXP_JCPLL_SSC_PHASE_INI
and G3_ANA_PXP_JCPLL_SSC_EN in REG_PXP_JCPLL_VCO_TCLVAR, and
G3_ANA_PXP_JCPLL_SSC_TRI_EN in REG_PXP_JCPLL_SSC_TRI_EN.

However, an7583_pcie_phy_deinit() does not clear these JCPLL SSC bits (in
contrast to airoha_pcie_phy_exit() in drivers/phy/phy-airoha-pcie.c, which
clears CSR_2L_PXP_JCPLL_SSC_PHASE_INI | CSR_2L_PXP_JCPLL_SSC_TRI_EN |
CSR_2L_PXP_JCPLL_SSC_EN), and Phase 1 in an7583_pcie_phy_init_jcpll() only
clears G3_ANA_PXP_JCPLL_SSC_PHASE_INI and G3_ANA_PXP_JCPLL_SSC_TRI_EN
without clearing G3_ANA_PXP_JCPLL_SSC_EN.

If the PHY is re-initialized after phy_exit() or after a failed phy_init()
attempt (or if the bootloader left JCPLL SSC enabled), will
G3_ANA_PXP_JCPLL_SSC_EN remain set during Phase 1 JCPLL and TXPLL
configuration when SSC is supposed to be disabled?

> +
> +static int an7583_pcie_phy_init(struct phy *phy)
> +{
[ ... ]
> +	ret =3D phy_init(pcie_phy->qp_phy);
> +	if (ret) {
> +		an7583_pcie_phy_deinit(pcie_phy);
> +
> +		return dev_err_probe(pcie_phy->dev, ret, "failed to initialize QP phy\=
n");
> +	}

[Severity: Low]
Is dev_err_probe() appropriate inside the phy_ops .init callback
an7583_pcie_phy_init()?

Because an7583_pcie_phy_init() runs when a consumer PCIe controller driver
calls phy_init() after an7583_pcie_phy_probe() has already bound
pcie_phy->dev, calling dev_err_probe(pcie_phy->dev, ret, ...) will suppress
error messages completely if ret is -ENOMEM, or downgrade the message to
dev_dbg() and allocate pcie_phy->dev->p->deferred_probe_reason on an
already-bound device if ret is -EPROBE_DEFER. Should this use dev_err()
instead?

[ ... ]
> +static int an7583_pcie_phy_probe(struct platform_device *pdev)
> +{
> +	struct an7583_pcie_phy *pcie_phy;
> +	struct device *dev =3D &pdev->dev;
> +	struct phy_provider *provider;
> +
> +	pcie_phy =3D devm_kzalloc(dev, sizeof(*pcie_phy), GFP_KERNEL);
> +	if (!pcie_phy)
> +		return -ENOMEM;
> +
> +	pcie_phy->g3_ana =3D an7583_pcie_phy_regmap_init(pdev, "g3-ana");
> +	if (IS_ERR(pcie_phy->g3_ana))
> +		return dev_err_probe(dev, PTR_ERR(pcie_phy->g3_ana),
> +				     "Failed to initialize g3 ANA regmap\n");
> +
> +	pcie_phy->qp_phy =3D devm_phy_optional_get(dev, NULL);
> +	if (IS_ERR(pcie_phy->qp_phy))
> +		return dev_err_probe(dev, PTR_ERR(pcie_phy->qp_phy),
> +				     "Failed to get QP PCIe phy\n");

[Severity: Medium]
Should an7583_pcie_phy_probe() use devm_phy_get() instead of
devm_phy_optional_get() for pcie_phy->qp_phy?

In Documentation/devicetree/bindings/phy/airoha,an7583-pcie-gen3-phy.yaml,
phys is a required property because QPHY configuration is needed during the
PCIe PHY setup and calibration phase. With devm_phy_optional_get(dev, NULL),
a missing phys property or a disabled QPHY node in DeviceTree causes
_of_phy_get() to return ERR_PTR(-ENODEV), which devm_phy_optional_get()
turns into NULL. Both an7583_pcie_phy_probe() and phy_init(pcie_phy->qp_phy)
in an7583_pcie_phy_init() will then succeed silently without initializing
the required QPHY.

--=20
Sashiko AI review =C2=B7 https://sashiko.dev/#/patchset/20261103195007.9721=
-1-ansuelsmth@gmail.com?part=3D2
