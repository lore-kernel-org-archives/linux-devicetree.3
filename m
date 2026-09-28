Received: from smtp.kernel.org (aws-us-west-2-korg-mail-alma10-1.taild15c8.ts.net [100.103.45.18])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 4991E4ABBA9
	for <devicetree@vger.kernel.org>; Mon, 28 Sep 2026 11:40:14 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=100.103.45.18
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1790595615; cv=none; b=ZVIGrTi5zz+9JlmfALbR1VBR0WZsPcZYfOxb+rqS+/KfWYQdrT3VIOye7v90LtRUGBjYF26vgfhNUkNIZ5sMcAmoOxr/4cjwVy3vZMvhHrMThygs9w9kj5b4vJSDLhsqPDVZUhfmBG1mYKsqp9ZQ+4zVkdf5dYlETdnrDVlvLcg=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1790595615; c=relaxed/simple;
	bh=nxEh3kVw11JYEFX33xLmvWFqab91d7O369PccPR7cDQ=;
	h=From:Subject:To:Cc:In-Reply-To:References:Content-Type:Date:
	 Message-Id; b=IXt+yrTb6q482vbT7iDy37UcbbErRPfv0O3GHKlaX5/Zn5A7CHUZP5io7nnqzVqQGarG1Zk5P78l2x7BP5czQxbvRYzkIxoJdwqgTB9/Q1U/GdNAMaEEKwNq19jZhv0/BNw7vbDTYTIH3WaFW+096rNFvn58ONvt6JweF2KBHdM=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=JnUrCEgN; arc=none smtp.client-ip=100.103.45.18
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="JnUrCEgN"
Received: by smtp.kernel.org (Postfix) with ESMTPSA id B44CC1F00899;
	Mon, 28 Sep 2026 11:40:13 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kernel.org;
	s=k20260515; t=1790595614;
	bh=nZkkNLK68DYMqSO/8Ch3GHxTqU/zwPmP4yVGs6kHnSU=;
	h=From:Subject:Reply-To:To:Cc:In-Reply-To:References:Date;
	b=JnUrCEgN7rQe3C4jMquN3oi4Iv4r5yGHUApC0Yho6y7BpknhZ6QB07noRZS3OLRYR
	 BFrIeC/i0VL4G/h5WL1DgvldK9WS8PQ6jlTPrB7TstfXF46xYln1FpXLf8s6X6bZPK
	 QOxALfEvTNTz1bs+PJN1n9/ICDtEm89TM63TQQNp/3o8oCr+23GHGtvWbHbDd+rSga
	 GVGFCp6cIFDTyjVU7YOm/RkV6hNZMRcEQKPhuWUFhZ/oXzmqQjy06ABpxkj1HP+vW6
	 rhd23d78unT4VMbb9kbj3RSASH7C4uHt1iTHpwITc12InjqotSPZ52vam2iVPM7iXG
	 5qQH2DWBsOkmQ==
From: sashiko-bot@kernel.org
Subject: Re: [PATCH v6] phy: qualcomm: qmp-combo: Add USB4/TBT3
 configuration data for Hamoa
Reply-To: sashiko-reviews@lists.linux.dev
To: "Konrad Dybcio" <konradybcio@kernel.org>
Cc: linux-phy@lists.infradead.org, robh@kernel.org, vkoul@kernel.org, olteanv@gmail.com, neil.armstrong@linaro.org, devicetree@vger.kernel.org, conor+dt@kernel.org
In-Reply-To: <20260928-topic-usb4phy-v6-1-815a73b063ef@oss.qualcomm.com>
References: <20260928-topic-usb4phy-v6-1-815a73b063ef@oss.qualcomm.com>
Content-Type: text/plain; charset=utf-8
Content-Transfer-Encoding: quoted-printable
Date: Mon, 28 Sep 2026 11:40:13 +0000
Message-Id: <20260928114013.B44CC1F00899@smtp.kernel.org>
Precedence: bulk
X-Mailing-List: devicetree@vger.kernel.org
List-Id: <devicetree.vger.kernel.org>
List-Subscribe: <mailto:devicetree+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:devicetree+unsubscribe@vger.kernel.org>

Thank you for your contribution! Sashiko AI review found 2 potential issue(=
s) to consider:
- [Low] phy: qualcomm: incorrectly named TX macro for RX UCDR FASTLOCK regi=
sters
- [Low] phy: qualcomm: typo LPFS instead of LFPS in PCS USB4 macro
--

commit 9fb8a660167beb5727c0f55ed2ce925959a5e21c
Author: Konrad Dybcio <konrad.dybcio@oss.qualcomm.com>

phy: qualcomm: qmp-combo: Add USB4/TBT3 configuration data for Hamoa

This commit adds offsets and configuration tables to support USB4 and
Thunderbolt 3 operation on USB4-capable PHYs for Hamoa chips. It exposes a
third PHY structure for the USB4 sub-PHY to be toggled by the USB4 router
driver.

> diff --git a/drivers/phy/qualcomm/phy-qcom-qmp-combo.c b/drivers/phy/qual=
comm/phy-qcom-qmp-combo.c
> index a4f130fc33e39..284efc3f23d42 100644
> --- a/drivers/phy/qualcomm/phy-qcom-qmp-combo.c
> +++ b/drivers/phy/qualcomm/phy-qcom-qmp-combo.c
[ ... ]
> @@ -2028,6 +2107,68 @@ static const struct qmp_phy_init_tbl x1e80100_usb4=
3dp_tx_tbl[] =3D {
>  	QMP_PHY_INIT_CFG(QSERDES_V6_N4_TX_RES_CODE_LANE_OFFSET_RX, 0x0a),
>  };
> =20
> +static const struct qmp_phy_init_tbl x1e80100_usb4_rx_tbl[] =3D {
[ ... ]
> +	QMP_PHY_INIT_CFG(QSERDES_V6_N4_RX_MODE_RATE3_B6, 0xe3),
> +	QMP_PHY_INIT_CFG(QSERDES_V6_N4_TX_UCDR_FASTLOCK_COUNTER_LOW_RATE2, 0x30=
),
> +	QMP_PHY_INIT_CFG(QSERDES_V6_N4_TX_UCDR_FASTLOCK_COUNTER_HIGH_RATE2, 0x1=
4),
> +	QMP_PHY_INIT_CFG(QSERDES_V6_N4_TX_UCDR_FASTLOCK_COUNTER_LOW_RATE3, 0xff=
),
> +	QMP_PHY_INIT_CFG(QSERDES_V6_N4_TX_UCDR_FASTLOCK_COUNTER_HIGH_RATE3, 0x3=
f),

[Severity: Low]
Do these macros have an incorrect _TX_ prefix instead of _RX_? They are
being used in the RX initialization table x1e80100_usb4_rx_tbl and evaluate=
 to
an offset within the RX block address space.

> +	QMP_PHY_INIT_CFG(QSERDES_V6_N4_RX_UCDR_PI_CTRL1, 0xd0),
[ ... ]
> @@ -2066,6 +2207,23 @@ static const struct qmp_phy_init_tbl x1e80100_usb4=
3dp_rx_tbl[] =3D {
>  	QMP_PHY_INIT_CFG(QSERDES_V6_N4_RX_RX_BKUP_CTRL1, 0x14),
>  };
> =20
> +static const struct qmp_phy_init_tbl x1e80100_usb4_pcs_tbl[] =3D {
> +	QMP_PHY_INIT_CFG(QPHY_V6_PCS_USB4_POWER_STATE_CONFIG3, 0x4f),
[ ... ]
> +	QMP_PHY_INIT_CFG(QPHY_V6_PCS_USB4_G3_FOM_EQ_CONFIG3, 0x25),
> +	QMP_PHY_INIT_CFG(QPHY_V6_PCS_USB4_G3_FOM_EQ_CONFIG5, 0x22),
> +	QMP_PHY_INIT_CFG(QPHY_V6_PCS_USB4_LPFS_TX_ECSTART, 0x0f),

[Severity: Low]
This is a minor typo, but should LPFS be LFPS (Low Frequency Periodic
Signaling) in this macro name?

> +};
[ ... ]
> diff --git a/drivers/phy/qualcomm/phy-qcom-qmp-pcs-usb-v6.h b/drivers/phy=
/qualcomm/phy-qcom-qmp-pcs-usb-v6.h
> index df670143feb1e..30fdb437146c4 100644
> --- a/drivers/phy/qualcomm/phy-qcom-qmp-pcs-usb-v6.h
> +++ b/drivers/phy/qualcomm/phy-qcom-qmp-pcs-usb-v6.h
[ ... ]
> @@ -14,4 +14,19 @@
>  #define QPHY_V6_PCS_USB3_RCVR_DTCT_DLY_U3_L		0x40
>  #define QPHY_V6_PCS_USB3_RCVR_DTCT_DLY_U3_H		0x44
> =20
> +#define QPHY_V6_PCS_USB4_POWER_STATE_CONFIG3		0x98
[ ... ]
> +#define QPHY_V6_PCS_USB4_G3_FOM_EQ_CONFIG3		0x210
> +#define QPHY_V6_PCS_USB4_G3_FOM_EQ_CONFIG5		0x218
> +#define QPHY_V6_PCS_USB4_LPFS_TX_ECSTART		0x220

[Severity: Low]
Is this another instance where LPFS should be LFPS?

> +
>  #endif
> diff --git a/drivers/phy/qualcomm/phy-qcom-qmp-qserdes-txrx-v6_n4.h b/dri=
vers/phy/qualcomm/phy-qcom-qmp-qserdes-txrx-v6_n4.h
> index d37cc0d4fd365..e72ae2cb460ac 100644
> --- a/drivers/phy/qualcomm/phy-qcom-qmp-qserdes-txrx-v6_n4.h
> +++ b/drivers/phy/qualcomm/phy-qcom-qmp-qserdes-txrx-v6_n4.h
[ ... ]
> @@ -23,27 +23,63 @@
>  #define QSERDES_V6_N4_TX_TRAN_DRVR_EMP_EN		0xac
>  #define QSERDES_V6_N4_TX_TX_BAND			0xd8
>  #define QSERDES_V6_N4_TX_INTERFACE_SELECT		0xe4
[ ... ]
> +#define QSERDES_V6_N4_RX_UCDR_FASTLOCK_FO_GAIN_RATE3	0x200
> +#define QSERDES_V6_N4_RX_UCDR_FASTLOCK_SO_GAIN_RATE3	0x210
> +#define QSERDES_V6_N4_RX_UCDR_SO_SATURATION		0x214
> +#define QSERDES_V6_N4_TX_UCDR_FASTLOCK_COUNTER_LOW_RATE1	0x224

[Severity: Low]
Does this define incorrectly use the _TX_ prefix instead of _RX_? This
block of macros appears to fall within the RX address space based on the
surrounding offsets.

> +#define QSERDES_V6_N4_TX_UCDR_FASTLOCK_COUNTER_HIGH_RATE1	0x228
> +#define QSERDES_V6_N4_TX_UCDR_FASTLOCK_COUNTER_LOW_RATE2	0x22c
> +#define QSERDES_V6_N4_TX_UCDR_FASTLOCK_COUNTER_HIGH_RATE2	0x230
> +#define QSERDES_V6_N4_TX_UCDR_FASTLOCK_COUNTER_LOW_RATE3	0x234
> +#define QSERDES_V6_N4_TX_UCDR_FASTLOCK_COUNTER_HIGH_RATE3	0x238
>  #define QSERDES_V6_N4_RX_UCDR_PI_CTRL1			0x23c
[ ... ]

--=20
Sashiko AI review =C2=B7 https://sashiko.dev/#/patchset/20260928-topic-usb4=
phy-v6-1-815a73b063ef@oss.qualcomm.com?part=3D1
