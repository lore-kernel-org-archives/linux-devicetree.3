Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 7AACA313E3B
	for <devicetree@vger.kernel.org>; Mon, 18 May 2026 11:49:32 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=10.30.226.201
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1779104972; cv=none; b=C+KoI4QC3nORnmDfetKeeaLmDQ/5IPAaHkvShT5MAVU9asSodhp6GLYlYEcfL/1pr3fZbpkGk1cz3HBh0S6k96wPFl8sXEGjGbTrBfjz9aOpNixlVUeeg9ykOHItpqPASQdEyoqJvnF2yMznyG4EbVqg6kYUGkniZX30mdWrqvM=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1779104972; c=relaxed/simple;
	bh=cNlP5bfLoARIVy4MMsIn8cjA7BGxZtEfDS9gueb1MFQ=;
	h=From:Subject:To:Cc:In-Reply-To:References:Content-Type:Date:
	 Message-Id; b=JinHeW1XxH9JmA0BiAydRBuUxKf32pQFg0Gdj4AWM7CZQ99c2BnWUkNXrXobzoA07YWjdKUbKwFDRzvK1UUkcutFBen/rC4ZGOnabrIhXp/dI9XbzOPhYm0GbwLxfHL/F3GZcOyxnIltf7xkabomnU44wwso+NtolZwdFKdVyFE=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=Rs/hRu1q; arc=none smtp.client-ip=10.30.226.201
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="Rs/hRu1q"
Received: by smtp.kernel.org (Postfix) with ESMTPSA id B7A0DC2BCB7;
	Mon, 18 May 2026 11:49:31 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1779104972;
	bh=cNlP5bfLoARIVy4MMsIn8cjA7BGxZtEfDS9gueb1MFQ=;
	h=From:Subject:Reply-To:To:Cc:In-Reply-To:References:Date:From;
	b=Rs/hRu1qd3MCaspgLiBSjcA/qG4kUU2J/m7lnjr/SRbCzFfdSvBd6BenDY4aMH7La
	 xGlD6dkffEZMUqvRRWJNqPHqeRTe+5XfuHcXTAKgCL1DY6kMtqIGAQa2pNmKCjdbD/
	 LJWIWXxTk0nhYLhSBETkEys+9ozsnI1M6hDSEnimIiVw1PB3v1uHk59BVbf/0zCC7M
	 WRKd1wFDoeThIH1lExSgs7ss/snbopBtetIfz3PesUsW2DuhEKJHVim4QwZRb7CtDG
	 lnn8gNZQrpl5eolIFOmj3lDPfUm/kscuHs6PupRDwfFFIqh2fzkQ3bNPuP7bF0ZvD8
	 JNw5THfcfublQ==
From: sashiko-bot@kernel.org
Subject: Re: [PATCH 4/5] phy: qualcomm: qmp-combo: Add USB4/TBT3
 configuration data for Hamoa
Reply-To: sashiko-reviews@lists.linux.dev
To: "Konrad Dybcio" <konradybcio@kernel.org>
Cc: olteanv@gmail.com, linux-phy@lists.infradead.org, devicetree@vger.kernel.org, conor+dt@kernel.org, robh@kernel.org, neil.armstrong@linaro.org, vkoul@kernel.org
In-Reply-To: <20260518-topic-usb4phy-v1-4-71d827c49dca@oss.qualcomm.com>
References: <20260518-topic-usb4phy-v1-4-71d827c49dca@oss.qualcomm.com>
Content-Type: text/plain; charset=utf-8
Content-Transfer-Encoding: quoted-printable
Date: Mon, 18 May 2026 11:49:29 +0000
Message-Id: <20260518114931.B7A0DC2BCB7@smtp.kernel.org>
Precedence: bulk
X-Mailing-List: devicetree@vger.kernel.org
List-Id: <devicetree.vger.kernel.org>
List-Subscribe: <mailto:devicetree+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:devicetree+unsubscribe@vger.kernel.org>

Thank you for your contribution! Sashiko AI review found 4 potential issue(=
s) to consider:
- [Low] Incorrect `TX_` prefix for RX UCDR fastlock registers.
- [Low] Typo in register macro name: `LPFS` instead of `LFPS`.
- [Low] Redundant `PCS_PCS` prefix in register macro name.
- [Low] Missing `_N4_` infix in the `QSERDES_V6_TX_LDO_TIMER_CTRL` macro.
--

commit 13a3731f3b7c12c298d2f498011a7ef852fd4a42
Author: Konrad Dybcio <konrad.dybcio@oss.qualcomm.com>

phy: qualcomm: qmp-combo: Add USB4/TBT3 configuration data for Hamoa

This commit adds the offsets and configuration tables to support USB4
and Thunderbolt 3 operation on the USB4-capable PHYs found on Hamoa chips.

> diff --git a/drivers/phy/qualcomm/phy-qcom-qmp-combo.c b/drivers/phy/qual=
comm/phy-qcom-qmp-combo.c
> index 898f42de4a086..0916d9a4599ed 100644
> --- a/drivers/phy/qualcomm/phy-qcom-qmp-combo.c
> +++ b/drivers/phy/qualcomm/phy-qcom-qmp-combo.c

[ ... ]

> @@ -1873,6 +1952,68 @@ static const struct qmp_phy_init_tbl x1e80100_usb4=
3dp_tx_tbl[] =3D {
> [ ... ]
> +static const struct qmp_phy_init_tbl x1e80100_usb4_rx_tbl[] =3D {
> [ ... ]
> +	QMP_PHY_INIT_CFG(QSERDES_V6_N4_TX_UCDR_FASTLOCK_COUNTER_LOW_RATE2, 0x30=
),
> +	QMP_PHY_INIT_CFG(QSERDES_V6_N4_TX_UCDR_FASTLOCK_COUNTER_HIGH_RATE2, 0x1=
4),
> +	QMP_PHY_INIT_CFG(QSERDES_V6_N4_TX_UCDR_FASTLOCK_COUNTER_LOW_RATE3, 0xff=
),
> +	QMP_PHY_INIT_CFG(QSERDES_V6_N4_TX_UCDR_FASTLOCK_COUNTER_HIGH_RATE3, 0x3=
f),

This isn't a bug, but should these use the RX_ prefix instead of TX_?=20
These registers appear to map to the RX block address space and are used
here to configure the RX hardware.

[ ... ]

> diff --git a/drivers/phy/qualcomm/phy-qcom-qmp-pcs-usb-v6.h b/drivers/phy=
/qualcomm/phy-qcom-qmp-pcs-usb-v6.h
> index df670143feb1e..30fdb437146c4 100644
> --- a/drivers/phy/qualcomm/phy-qcom-qmp-pcs-usb-v6.h
> +++ b/drivers/phy/qualcomm/phy-qcom-qmp-pcs-usb-v6.h
> @@ -14,4 +14,19 @@
>  #define QPHY_V6_PCS_USB3_RCVR_DTCT_DLY_U3_L		0x40
>  #define QPHY_V6_PCS_USB3_RCVR_DTCT_DLY_U3_H		0x44
> =20
> +#define QPHY_V6_PCS_USB4_POWER_STATE_CONFIG3		0x98
> [ ... ]
> +#define QPHY_V6_PCS_USB4_PCS_PCS_TX_RX_CONFIG1		0x1a8

This isn't a bug, but is there a duplicate PCS_ prefix in this macro name?

> +#define QPHY_V6_PCS_USB4_EQ_CONFIG1			0x1b8
> [ ... ]
> +#define QPHY_V6_PCS_USB4_LPFS_TX_ECSTART		0x220

This isn't a bug, but is this a typo for LFPS (Low Frequency Periodic
Signaling)?

[ ... ]

> diff --git a/drivers/phy/qualcomm/phy-qcom-qmp-qserdes-txrx-v6_n4.h b/dri=
vers/phy/qualcomm/phy-qcom-qmp-qserdes-txrx-v6_n4.h
> index d37cc0d4fd365..e72ae2cb460ac 100644
> --- a/drivers/phy/qualcomm/phy-qcom-qmp-qserdes-txrx-v6_n4.h
> +++ b/drivers/phy/qualcomm/phy-qcom-qmp-qserdes-txrx-v6_n4.h
> @@ -23,27 +23,63 @@
> [ ... ]
>  #define QSERDES_V6_N4_TX_VMODE_CTRL1			0xb0
> +#define QSERDES_V6_TX_LDO_TIMER_CTRL			0x120

This isn't a bug, but should this macro include the _N4_ infix for
consistency with the rest of the V6 N4 block definitions?

--=20
Sashiko AI review =C2=B7 https://sashiko.dev/#/patchset/20260518-topic-usb4=
phy-v1-0-71d827c49dca@oss.qualcomm.com?part=3D4
