Received: from smtp.kernel.org (aws-us-west-2-korg-mail-alma10-1.taild15c8.ts.net [100.103.45.18])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 1296643E9DF
	for <devicetree@vger.kernel.org>; Thu, 30 Jul 2026 14:44:14 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=100.103.45.18
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1785422656; cv=none; b=IXkNwyvkt0nFMBLo0QXTOo0n/8FfLaXJOtxnx7rDir7iopplqPE6KY4gep6RPH3uclbU58dfSWhM1vhhOqS9uYan+DPbOq6cdQMHSKpNiRxelwZKM3kXIbSm2HVZQCsREBkZsGviwOQw6jxm7X7Z88JfLfujA/+bzEIiEPmL2Uc=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1785422656; c=relaxed/simple;
	bh=XS52QAQ2bEHKxSH/Kjzy270LCFOy3uretPxqdztZKRc=;
	h=From:Subject:To:Cc:In-Reply-To:References:Content-Type:Date:
	 Message-Id; b=UTL9mCd950EIvV0sWXkW9BBfvb3mI4gSCSuXrIBQQGljZDp4K9oc6Z4LDNApykmm1cwTMDBeH6f1HmFTbONCdk/01wlZyC34/O0N7sHp6WG25/wdmohi3JFCRgBD96Jpu1CfPaJG4TEXA97GNuDpReOhQMn3vxJTrh29AX/U3hQ=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=G5l2MhOA; arc=none smtp.client-ip=100.103.45.18
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="G5l2MhOA"
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 5FFC81F000E9;
	Thu, 30 Jul 2026 14:44:14 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kernel.org;
	s=k20260515; t=1785422654;
	bh=oXA7eNEE4kJ3LKFfEMb0sQdmSsbvIZKBPe2ae4fiWOU=;
	h=From:Subject:Reply-To:To:Cc:In-Reply-To:References:Date;
	b=G5l2MhOAAjvu7qkulXgUUfUXXw7VOmpxphpC8mr8uLcAh5XSXt51L1Wt4mFY4IpGJ
	 ytTz0YHxaU1qiJVbLFHdE/WDB6VgdRe2WVDBx+zmQInu875pLTsDGQ60b0gMkVebMK
	 +pCMuT2TcBdal1ksXRyHQ6yv66cCY7icnpvKvzJFc0+MXp6WygNHcpC8QliwqV4dbj
	 hVm4ErpvNZdV2iPlCUAR5Bap+rTvufBTjH/+XOMAQpfVhG4IMmz0dVRF1ffibLWbeN
	 dgva7fDcHqanRh8n/RWKKPzj80AkqeIsvvOsYWjjn27qgOZMWcNc+5JcEdH83XiINq
	 xL2QodwXcknXQ==
From: sashiko-bot@kernel.org
Subject: Re: [PATCH v3 4/5] phy: qualcomm: qmp-combo: Add USB4/TBT3
 configuration data for Hamoa
Reply-To: sashiko-reviews@lists.linux.dev
To: "Konrad Dybcio" <konradybcio@kernel.org>
Cc: robh@kernel.org, vkoul@kernel.org, devicetree@vger.kernel.org, olteanv@gmail.com, linux-phy@lists.infradead.org, neil.armstrong@linaro.org, conor+dt@kernel.org
In-Reply-To: <20260730-topic-usb4phy-v3-4-ccf0f7ea98b5@oss.qualcomm.com>
References: <20260730-topic-usb4phy-v3-0-ccf0f7ea98b5@oss.qualcomm.com>
 <20260730-topic-usb4phy-v3-4-ccf0f7ea98b5@oss.qualcomm.com>
Content-Type: text/plain; charset=utf-8
Content-Transfer-Encoding: quoted-printable
Date: Thu, 30 Jul 2026 14:44:14 +0000
Message-Id: <20260730144414.5FFC81F000E9@smtp.kernel.org>
Precedence: bulk
X-Mailing-List: devicetree@vger.kernel.org
List-Id: <devicetree.vger.kernel.org>
List-Subscribe: <mailto:devicetree+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:devicetree+unsubscribe@vger.kernel.org>

Thank you for your contribution! Sashiko AI review found 5 potential issue(=
s) to consider:
- [High] Missing clk_disable_unprepare() for p2rr2p_pipe_clk on error paths=
 in qmp_combo_usb4_init().
- [High] Double initialization of the PHY in qmp_combo_usb4_init() when swi=
tching from USB3 mode.
- [Medium] Silent replacement of USB3 configuration values.
- [Medium] Unchecked usage of `pcs_aon` during USB4 initialization.
- [Low] UCDR registers are incorrectly prefixed with TX instead of RX.
--

--- Patch [4]: [PATCH v3 4/5] phy: qualcomm: qmp-combo: Add USB4/TBT3 confi=
guration data for Hamoa ---
commit 49d296c106dd364ca64df2721ab78171f96275ce
Author: Konrad Dybcio <konrad.dybcio@oss.qualcomm.com>
Subject: phy: qualcomm: qmp-combo: Add USB4/TBT3 configuration data for Ham=
oa

Add the offsets and configuration tables to support USB4 and
Thunderbolt 3 operation on the USB4-capable PHYs found on Hamoa chips.

> diff --git a/drivers/phy/qualcomm/phy-qcom-qmp-combo.c b/drivers/phy/qual=
comm/phy-qcom-qmp-combo.c
> index b80eac9d71401..419668e014906 100644
> --- a/drivers/phy/qualcomm/phy-qcom-qmp-combo.c
> +++ b/drivers/phy/qualcomm/phy-qcom-qmp-combo.c

[ ... ]

> +static const struct qmp_phy_init_tbl x1e80100_usb3dp_serdes_tbl[] =3D {
>  	QMP_PHY_INIT_CFG(QSERDES_V6_COM_SSC_EN_CENTER, 0x01),
>  	QMP_PHY_INIT_CFG(QSERDES_V6_COM_SSC_PER1, 0x62),

[Severity: Medium]
Does this introduce a silent functional change to the USB3 SerDes
initialization sequence?

The patch renames the original x1e80100_usb43dp_serdes_tbl to
x1e80100_usb4_serdes_tbl for USB4, and introduces this new table for USB3
operations.

However, this new table contains distinctly different tuning parameters
(e.g., QSERDES_V6_COM_SSC_STEP_SIZE1_MODE0 changes from 0xd9 to 0xc2, and
LOCK_CMP1_MODE0 changes from 0x1a to 0x08).

Since this change is not documented in the commit message, is there a risk =
of
regression for USB3 operations?

[ ... ]

> +static const struct qmp_phy_init_tbl x1e80100_usb4_rx_tbl[] =3D {
> +	QMP_PHY_INIT_CFG(QSERDES_V6_N4_RX_SIGDET_CNTRL, 0x04),
> +	QMP_PHY_INIT_CFG(QSERDES_V6_N4_RX_SIGDET_DEGLITCH_CNTRL, 0x0e),

[ ... ]

> +	QMP_PHY_INIT_CFG(QSERDES_V6_N4_TX_UCDR_FASTLOCK_COUNTER_LOW_RATE2, 0x30=
),

[Severity: Low]
This isn't a bug, but should these UCDR macros use an RX prefix instead of =
TX?

UCDR (Universal Clock and Data Recovery) is strictly an RX feature, and the=
se
offsets belong to the RX block. They are populated correctly in this RX tab=
le,
but the misleading _TX_ prefix could pose a maintainability risk.

[ ... ]

> @@ -2689,11 +2864,11 @@ static const struct qmp_phy_cfg sc8280xp_usb43dpp=
hy_cfg =3D {
>  	.regs			=3D qmp_v5_5nm_usb3phy_regs_layout,
>  };
> =20
> -static const struct qmp_phy_cfg x1e80100_usb3dpphy_cfg =3D {
> -	.offsets		=3D &qmp_combo_offsets_v5,
> +static const struct qmp_phy_cfg x1e80100_usb43dpphy_cfg =3D {
> +	.offsets		=3D &qmp_combo_offsets_v6_n4,

[Severity: Medium]
Does supporting USB4 introduce a latent bug in qmp_combo_com_init()?

In qmp_combo_com_init(), if qmp->qmpphy_mode =3D=3D QMPPHY_MODE_USB4, the d=
river
directly executes:

qmp_combo_com_init() {
    ...
    if (qmp->qmpphy_mode =3D=3D QMPPHY_MODE_USB4)
        qphy_setbits(pcs_aon, cfg->regs[QPHY_PCS_USB4_CLAMP_ENABLE], CLAMP_=
EN);
    ...
}

Unlike other instances where pcs_aon is strictly checked (if (pcs_aon)) bef=
ore
dereferencing, this assumes pcs_aon is populated. While this works on
x1e80100 because its layout defines .usb3_pcs_aon (in qmp_combo_offsets_v6_=
n4),
any future configuration supporting USB4 but omitting usb3_pcs_aon (e.g.,
sc8280xp which uses qmp_combo_offsets_v5) would trigger a NULL pointer
dereference.

[Severity: High]
Does enabling USB4 expose resource leaks in qmp_combo_usb4_init()?

If a failure occurs during initialization, qmp_combo_usb4_init() immediately
returns the error code:

qmp_combo_usb4_init() {
    ...
    ret =3D qmp_combo_com_init(qmp, false);
    if (ret)
        return ret;
    ...
}

However, it fails to call clk_disable_unprepare(qmp->p2rr2p_pipe_clk), which
was successfully enabled earlier in the function. Does this result in a
resource leak on the error paths for qmp_combo_com_init(),
qmp_combo_reconfigure_phy(), and qmp_combo_usb_power_on()?

[Severity: High]
Can switching from USB3 mode cause a double initialization of the PHY?

When qmp_combo_usb4_init() executes and USB3 is already active
(qmp->usb_init_count > 0), it calls:

qmp_combo_usb4_init() {
    ...
    ret =3D qmp_combo_reconfigure_phy(qmp, QMPPHY_MODE_USB4);
    if (ret)
        return ret;

    ret =3D qmp_combo_usb_power_on(phy);
    ...
}

Inside qmp_combo_reconfigure_phy(), if qmp->usb_init_count is non-zero, it
explicitly calls qmp_combo_usb_power_on(qmp->usb_phy).

After returning successfully, qmp_combo_usb4_init() proceeds to call
qmp_combo_usb_power_on(phy) a second time. Could writing the entire
configuration sequence (tuning parameters, clearing resets, setting
SERDES_START | PCS_START) to an actively running PHY cause hardware lockups
or polling timeouts?

[ ... ]

> diff --git a/drivers/phy/qualcomm/phy-qcom-qmp-qserdes-txrx-v6_n4.h b/dri=
vers/phy/qualcomm/phy-qcom-qmp-qserdes-txrx-v6_n4.h
> index d37cc0d4fd365..e72ae2cb460ac 100644
> --- a/drivers/phy/qualcomm/phy-qcom-qmp-qserdes-txrx-v6_n4.h
> +++ b/drivers/phy/qualcomm/phy-qcom-qmp-qserdes-txrx-v6_n4.h
> @@ -23,27 +23,63 @@

[ ... ]

> +#define QSERDES_V6_N4_TX_UCDR_FASTLOCK_COUNTER_LOW_RATE1	0x224

[Severity: Low]
This isn't a bug, but as mentioned above, these UCDR macros are prefixed wi=
th
TX instead of RX despite UCDR being an RX feature.

--=20
Sashiko AI review =C2=B7 https://sashiko.dev/#/patchset/20260730-topic-usb4=
phy-v3-0-ccf0f7ea98b5@oss.qualcomm.com?part=3D4
