Received: from smtp.kernel.org (aws-us-west-2-korg-mail-alma10-1.taild15c8.ts.net [100.103.45.18])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 884B9369D7A
	for <devicetree@vger.kernel.org>; Thu, 20 Aug 2026 14:44:17 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=100.103.45.18
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1787237060; cv=none; b=Cd1I36uewgftVicVoGBjZWUDG4XrDGw3veMBFQX8vqphV4To+WSr51OVochmjPoIG5EI5ioBZWKbi4s9Kza7XW/3fKa7ww0MjZaRPZjy+Fq7oyOzAkEk+j3/hW699hIT4k8/6AHuZdhH2uMCCIUw7U9O7LOqfnfjqHwaFfZuB98=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1787237060; c=relaxed/simple;
	bh=n53BQmnlG7IuPEaoXrJZCERWr1HdgBOEcPCY7r2d03w=;
	h=From:Subject:To:Cc:In-Reply-To:References:Content-Type:Date:
	 Message-Id; b=nMOEAnK4VsQ98+QMCt13S5hqdIwZb62D6pvvkm05TBV90fVKkhNzD0ap1Hyz+LcJ1XAGUe0z//2l+i9gJdjapGNFSOBapGTvjIqI8xO9xC8d4FjaVWeeuEV0VdlYhBfRo8dVWPdFh4rKk5LgwzXbcgFTEfUPDrrmgIlwRZt0KXY=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=Q4Lwclja; arc=none smtp.client-ip=100.103.45.18
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="Q4Lwclja"
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 3913E1F000E9;
	Thu, 20 Aug 2026 14:44:17 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kernel.org;
	s=k20260515; t=1787237057;
	bh=4yAZmxmufa8AWXr40Mg479YvE3Bgy0qJVjPpuclmPRs=;
	h=From:Subject:Reply-To:To:Cc:In-Reply-To:References:Date;
	b=Q4Lwclja1Ig1gLikbXneTEwvFrMiyrebdGjV0uBkcV1w0fV05TzeQ8qyBBCzrJswc
	 JUkA72KnuPBV/UTu4zAZTRqYnrmsa2BAYYyxqvE4lhfNBqQEEZzUxEfqtYXPxnz1w1
	 5XS2TKnFAnBxY/gos/rrX6fVBIR4JuV1NIKebQoDFT7KswPHW919ENRsGyOGC1zKoE
	 7Ik2gE4yDu/iqja8T2f3d4MNKXu6QaCJyZUCAm0Y1a8nnf+1D6KCK70+SqK9xdhKXp
	 B2op1Wxd0DJX/+TbTzkUlCc4zoY0a3RLTb41LROJGGIn/1bEfkp8UmWUKZQy6QGSk5
	 R7xdQ01IWxRxQ==
From: sashiko-bot@kernel.org
Subject: Re: [PATCH v4 4/5] phy: qualcomm: qmp-combo: Add USB4/TBT3
 configuration data for Hamoa
Reply-To: sashiko-reviews@lists.linux.dev
To: "Konrad Dybcio" <konradybcio@kernel.org>
Cc: linux-phy@lists.infradead.org, conor+dt@kernel.org, vkoul@kernel.org, neil.armstrong@linaro.org, robh@kernel.org, devicetree@vger.kernel.org, olteanv@gmail.com
In-Reply-To: <20260820-topic-usb4phy-v4-4-aec9d2cb31f6@oss.qualcomm.com>
References: <20260820-topic-usb4phy-v4-0-aec9d2cb31f6@oss.qualcomm.com>
 <20260820-topic-usb4phy-v4-4-aec9d2cb31f6@oss.qualcomm.com>
Content-Type: text/plain; charset=utf-8
Content-Transfer-Encoding: quoted-printable
Date: Thu, 20 Aug 2026 14:44:16 +0000
Message-Id: <20260820144417.3913E1F000E9@smtp.kernel.org>
Precedence: bulk
X-Mailing-List: devicetree@vger.kernel.org
List-Id: <devicetree.vger.kernel.org>
List-Subscribe: <mailto:devicetree+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:devicetree+unsubscribe@vger.kernel.org>

Thank you for your contribution! Sashiko AI review found 3 potential issue(=
s) to consider:
- [Low] Typo in macro name: LPFS instead of LFPS.
- [Low] RX registers mistakenly prefixed with _TX_.
- [Low] Missing _N4 prefix in macro definition.
--

--- Patch [4]: [PATCH v4 4/5] phy: qualcomm: qmp-combo: Add USB4/TBT3 confi=
guration data for Hamoa ---
commit afe3f2e27c72fec44781edf41959e4fc3ad27e3e
Author: Konrad Dybcio <konrad.dybcio@oss.qualcomm.com>

phy: qualcomm: qmp-combo: Add USB4/TBT3 configuration data for Hamoa
   =20
Add the offsets and configuration tables to support USB4 and
Thunderbolt 3 operation on the USB4-capable PHYs found on Hamoa chips.

> diff --git a/drivers/phy/qualcomm/phy-qcom-qmp-combo.c b/drivers/phy/qual=
comm/phy-qcom-qmp-combo.c
> index dfdeec3ee4f5f..c150a4ef03a78 100644
> --- a/drivers/phy/qualcomm/phy-qcom-qmp-combo.c
> +++ b/drivers/phy/qualcomm/phy-qcom-qmp-combo.c

[ ... ]

> @@ -2028,6 +2107,68 @@ static const struct qmp_phy_init_tbl x1e80100_usb4=
3dp_tx_tbl[] =3D {

[ ... ]

> +static const struct qmp_phy_init_tbl x1e80100_usb4_rx_tbl[] =3D {
> +	QMP_PHY_INIT_CFG(QSERDES_V6_N4_RX_SIGDET_CNTRL, 0x04),

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
This isn't a bug, but should these UCDR (Universal Clock and Data Recovery)
registers be prefixed with _RX_ instead of _TX_? They are functionally
receiver registers falling within the RX offset block, and are being
initialized here inside x1e80100_usb4_rx_tbl.

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

> +#define QPHY_V6_PCS_USB4_G3_FOM_EQ_CONFIG5		0x218
> +#define QPHY_V6_PCS_USB4_LPFS_TX_ECSTART		0x220

[Severity: Low]
This isn't a bug, but is there a typo in this macro name? It uses LPFS
instead of LFPS (Low Frequency Periodic Signaling).

[ ... ]

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

> +#define QSERDES_V6_N4_TX_RX_MARG_COARSE_THRESH3_RATE210	0xf8
> +#define QSERDES_V6_N4_TX_RX_MARG_COARSE_THRESH3_RATE3	0xfc
>  #define QSERDES_V6_N4_TX_VMODE_CTRL1			0xb0
> +#define QSERDES_V6_TX_LDO_TIMER_CTRL			0x120

[Severity: Low]
This isn't a bug, but is this macro missing the _N4 infix? All other
SoC-specific macros added in this header use the _N4 format (e.g.,
QSERDES_V6_N4_TX_LANE_MODE_1).

--=20
Sashiko AI review =C2=B7 https://sashiko.dev/#/patchset/20260820-topic-usb4=
phy-v4-0-aec9d2cb31f6@oss.qualcomm.com?part=3D4
