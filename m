Received: from smtp.kernel.org (aws-us-west-2-korg-mail-alma10-1.taild15c8.ts.net [100.103.45.18])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 595E93B389E
	for <devicetree@vger.kernel.org>; Tue,  8 Sep 2026 08:14:40 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=100.103.45.18
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1788855281; cv=none; b=ecfTHNu4mFbzWENNd5mE/o4xssO2LS1WT3lLq0I1Hjxyr5zUZbQm7XS5Yo47HOgjGbBaJaj6MSjrSkjVsA+D+agTuC1XUErl4HyM5W0z2jJn16inrO9gvanEHPDSXeuMQFsKg9U3xKjoL0GHy9ufHuB6YT9MYvRseZm2NW391WA=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1788855281; c=relaxed/simple;
	bh=URVzPAiGbl2SjFQzS8MQYeg+6uQquniKhRT/lW9BOCM=;
	h=From:Subject:To:Cc:In-Reply-To:References:Content-Type:Date:
	 Message-Id; b=Y+0J22HfSRYx1n58HB/H4OZTZ9Bx7Yo2o3MuPGXPVg3v1Vt7tZ6cHK2kEkwXOCGW2aAMwvNnEjgcdWGDrwf3lQTqZ5m2+ZIp5fuLAlFnotO57LOPnZ6ofwRdv19G4YVTwUfNfR9nrBok1gi0Wd4UZJAfrB0XWAwnQu9H8wSvdOQ=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=hIY3hiUQ; arc=none smtp.client-ip=100.103.45.18
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="hIY3hiUQ"
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 92D371F00A3A;
	Tue,  8 Sep 2026 08:14:39 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kernel.org;
	s=k20260515; t=1788855280;
	bh=Mls77PdAp4kofowzjZnFOdfbz4BOKd+ABwoaE3mPRrw=;
	h=From:Subject:Reply-To:To:Cc:In-Reply-To:References:Date;
	b=hIY3hiUQP6MPhcXWNcapWMwCWE8Mxc0BxdkZxhgn3JmiWj7RdFMml55eUDEP1Tg2Z
	 JQjyDtKrpIjLaqhVs8DPXwKR9DSjl1F8+qVNTkc/q7VkbFQTGyofVBMyf6LKOxvUY/
	 w+aGUSI9VO9DtkgWewIFssI1lvhARpBH0oZhAjxgOiICsapKSyvLyMdakayIYpQ6Mk
	 OChUU2IR5msuOvHlE7LLr6ydFZHVBnLTWOSvzW30AqWY2qECyfG15wDOAdiSk1DHKx
	 hGXnA6ZQu6Ef0e0wwh3Hhbniyeh8XOLaVn/bTAYaAUYkeWeQ9b/mGhDJysxh1RYh/H
	 sLlE+/stG176g==
From: sashiko-bot@kernel.org
Subject: Re: [PATCH v5 4/5] phy: qualcomm: qmp-combo: Add USB4/TBT3
 configuration data for Hamoa
Reply-To: sashiko-reviews@lists.linux.dev
To: "Konrad Dybcio" <konradybcio@kernel.org>
Cc: linux-phy@lists.infradead.org, neil.armstrong@linaro.org, robh@kernel.org, vkoul@kernel.org, olteanv@gmail.com, conor+dt@kernel.org, devicetree@vger.kernel.org
In-Reply-To: <20260908-topic-usb4phy-v5-4-73aac69578ef@oss.qualcomm.com>
References: <20260908-topic-usb4phy-v5-0-73aac69578ef@oss.qualcomm.com>
 <20260908-topic-usb4phy-v5-4-73aac69578ef@oss.qualcomm.com>
Content-Type: text/plain; charset=utf-8
Content-Transfer-Encoding: quoted-printable
Date: Tue, 08 Sep 2026 08:14:39 +0000
Message-Id: <20260908081439.92D371F00A3A@smtp.kernel.org>
Precedence: bulk
X-Mailing-List: devicetree@vger.kernel.org
List-Id: <devicetree.vger.kernel.org>
List-Subscribe: <mailto:devicetree+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:devicetree+unsubscribe@vger.kernel.org>

Thank you for your contribution! Sashiko AI review found 4 potential issue(=
s) to consider:

New issues:
- [Low] Incorrect prefix for RX UCDR FASTLOCK_COUNTER registers.
- [Low] Typo in USB4 LFPS register name (written as LPFS).
- [Low] Register sort order violation in header file.

Pre-existing issues:
- [Critical] Unclocked and unpowered register access in qmp_combo_com_init =
when in USB4 mode.
--

commit dbef849ad62b34a45390169ec84b4136bf981184
Author: Konrad Dybcio <konrad.dybcio@oss.qualcomm.com>

phy: qualcomm: qmp-combo: Add USB4/TBT3 configuration data for Hamoa

Add the offsets and configuration tables to support USB4 and
Thunderbolt 3 operation on the USB4-capable PHYs found on Hamoa chips.

> diff --git a/drivers/phy/qualcomm/phy-qcom-qmp-combo.c b/drivers/phy/qual=
comm/phy-qcom-qmp-combo.c
> index a4f130fc33e39..284efc3f23d42 100644
> --- a/drivers/phy/qualcomm/phy-qcom-qmp-combo.c
> +++ b/drivers/phy/qualcomm/phy-qcom-qmp-combo.c
> @@ -240,6 +240,7 @@ static const unsigned int qmp_v6_n4_usb3phy_regs_layo=
ut[QPHY_LAYOUT_SIZE] =3D {
>  	[QPHY_PCS_LFPS_RXTERM_IRQ_CLEAR] =3D QPHY_V6_PCS_USB3_LFPS_RXTERM_IRQ_C=
LEAR,
> =20
>  	[QPHY_PCS_CLAMP_ENABLE]		=3D QPHY_V6_PCS_AON_CLAMP_ENABLE,
> +	[QPHY_PCS_USB4_CLAMP_ENABLE]	=3D QPHY_V6_PCS_AON_USB4_CLAMP_ENABLE,

[Severity: Critical]
This is a pre-existing issue, but providing this layout entry exposes
qmp_combo_com_init() to an unclocked and unpowered register access in
USB4 mode.

When qmp->qmpphy_mode =3D=3D QMPPHY_MODE_USB4, qmp_combo_com_init() immedia=
tely
executes qphy_setbits() using QPHY_PCS_USB4_CLAMP_ENABLE. This occurs before
regulator_bulk_enable() and clk_bulk_prepare_enable() are called later in
the function.

Accessing unclocked and unpowered APB/AHB mapped registers can cause a
synchronous external abort (bus hang). Could this access be deferred until
after the clocks and regulators are enabled?

[ ... ]
> @@ -2028,6 +2107,68 @@ static const struct qmp_phy_init_tbl x1e80100_usb4=
3dp_tx_tbl[] =3D {
[ ... ]
> +static const struct qmp_phy_init_tbl x1e80100_usb4_rx_tbl[] =3D {
[ ... ]
> +	QMP_PHY_INIT_CFG(QSERDES_V6_N4_TX_UCDR_FASTLOCK_COUNTER_LOW_RATE2, 0x30=
),
> +	QMP_PHY_INIT_CFG(QSERDES_V6_N4_TX_UCDR_FASTLOCK_COUNTER_HIGH_RATE2, 0x1=
4),
> +	QMP_PHY_INIT_CFG(QSERDES_V6_N4_TX_UCDR_FASTLOCK_COUNTER_LOW_RATE3, 0xff=
),
> +	QMP_PHY_INIT_CFG(QSERDES_V6_N4_TX_UCDR_FASTLOCK_COUNTER_HIGH_RATE3, 0x3=
f),

[Severity: Low]
Are these TX macros intentionally placed in the rx_tbl, or do they refer to
RX UCDR FASTLOCK_COUNTER registers?

If they are UCDR registers mapping into the RX hardware block, should they
have the QSERDES_V6_N4_RX_ prefix instead to prevent confusion?

> diff --git a/drivers/phy/qualcomm/phy-qcom-qmp-pcs-usb-v6.h b/drivers/phy=
/qualcomm/phy-qcom-qmp-pcs-usb-v6.h
> index df670143feb1e..30fdb437146c4 100644
> --- a/drivers/phy/qualcomm/phy-qcom-qmp-pcs-usb-v6.h
> +++ b/drivers/phy/qualcomm/phy-qcom-qmp-pcs-usb-v6.h
> @@ -14,4 +14,19 @@
[ ... ]
> +#define QPHY_V6_PCS_USB4_G3_FOM_EQ_CONFIG3		0x210
> +#define QPHY_V6_PCS_USB4_G3_FOM_EQ_CONFIG5		0x218
> +#define QPHY_V6_PCS_USB4_LPFS_TX_ECSTART		0x220

[Severity: Low]
Is this intended to be LFPS (Low Frequency Periodic Signaling) instead of
LPFS? It might be clearer to name it QPHY_V6_PCS_USB4_LFPS_TX_ECSTART to
match standard USB protocol terminology.

> diff --git a/drivers/phy/qualcomm/phy-qcom-qmp-qserdes-txrx-v6_n4.h b/dri=
vers/phy/qualcomm/phy-qcom-qmp-qserdes-txrx-v6_n4.h
> index d37cc0d4fd365..e72ae2cb460ac 100644
> --- a/drivers/phy/qualcomm/phy-qcom-qmp-qserdes-txrx-v6_n4.h
> +++ b/drivers/phy/qualcomm/phy-qcom-qmp-qserdes-txrx-v6_n4.h
> @@ -23,27 +23,63 @@
[ ... ]
>  #define QSERDES_V6_N4_RX_UCDR_FO_GAIN_RATE2		0x8
> +#define QSERDES_V6_N4_RX_UCDR_FO_GAIN_RATE3		0xc
> +#define QSERDES_V6_N4_RX_UCDR_SO_GAIN_RATE3		0x1c
>  #define QSERDES_V6_N4_RX_UCDR_SO_GAIN_RATE2		0x18

[Severity: Low]
Does this break the numerical sort order of the register offsets? Offset
0x1c is defined here before 0x18.

--=20
Sashiko AI review =C2=B7 https://sashiko.dev/#/patchset/20260908-topic-usb4=
phy-v5-0-73aac69578ef@oss.qualcomm.com?part=3D4
