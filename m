Received: from smtp.kernel.org (aws-us-west-2-korg-mail-alma10-1.taild15c8.ts.net [100.103.45.18])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 807A142048D
	for <devicetree@vger.kernel.org>; Tue, 28 Jul 2026 10:30:49 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=100.103.45.18
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1785234650; cv=none; b=Qx/Pdl7tMucReBEnOHRQvvqCZ72y//psLLph92WziZCUWPuibpWfu+uYudOYUbXZ4U74lwM8Tz0CpvGJmJQNe82dw1vZ2kF0VK9aYg8wsiLfK89FpZ50khnf33fswiLCOQoMnTJ00tD7/KR/cToqK5OQAm1ErpCBLa1Mp9bSNpo=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1785234650; c=relaxed/simple;
	bh=CHBpkIaOV/cygzkhMSeCo3PSs0M+g8d78QaRl8VFWhs=;
	h=From:Subject:To:Cc:In-Reply-To:References:Content-Type:Date:
	 Message-Id; b=r9qj6GA99Gs/tHyIf4cAGXliZ9VvdPeDLCqMUjHmICZXgYeRPBt4BBmc5CxOIjkQ/u5RxL7Zh6iAzryVlIuGJayFiWs2LWZXl/hSZkpQv3SI68Jnqj3eWlZ+zJ3QNoMaVIXim9IhpRgW323mlahbKURKBhYlrYg8vrAyqISuvMI=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=nKxcHcdF; arc=none smtp.client-ip=100.103.45.18
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="nKxcHcdF"
Received: by smtp.kernel.org (Postfix) with ESMTPSA id B3E7B1F000E9;
	Tue, 28 Jul 2026 10:30:48 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kernel.org;
	s=k20260515; t=1785234649;
	bh=SrvA82VR2s/Czj3SgLLrD/E84EvR04FsO0mjgIFaPNE=;
	h=From:Subject:Reply-To:To:Cc:In-Reply-To:References:Date;
	b=nKxcHcdFylFKvza58FjvbKNXmnRYKMyNmDk6/0VzU0J7XkIJkS/aDdBJVEmv+T6gV
	 x9WjOwdioGUVM+ObgQJ9jQZ1gG6/FExjYaErb/Mqyc+sHh6VMD1V/Oe2kZuEDe0Lvg
	 zpSMskx0SMsxfJwx9lynwV1EP2wbJFNW5Of9GoMZ22ipeCTZUFA86TXtxoZnVQd6QS
	 F+cQZAom7vyb0aSN52s4KGwB3jRrY7dZhTUT9aibk4dzSnQCHUtkS5JbZ2yjS54ERZ
	 jtdqgCnBoRp4cpSas3f0UMnA4UVOQ91ZaDvtHWeXAr23RoWizb3C2ODo/kIiw92coM
	 Csded6u+fknjw==
From: sashiko-bot@kernel.org
Subject: Re: [PATCH v2 4/5] phy: qualcomm: qmp-combo: Add USB4/TBT3
 configuration data for Hamoa
Reply-To: sashiko-reviews@lists.linux.dev
To: "Konrad Dybcio" <konradybcio@kernel.org>
Cc: conor+dt@kernel.org, devicetree@vger.kernel.org, neil.armstrong@linaro.org, linux-phy@lists.infradead.org, robh@kernel.org, vkoul@kernel.org, olteanv@gmail.com
In-Reply-To: <20260728-topic-usb4phy-v2-4-5d9dd5149ec7@oss.qualcomm.com>
References: <20260728-topic-usb4phy-v2-0-5d9dd5149ec7@oss.qualcomm.com>
 <20260728-topic-usb4phy-v2-4-5d9dd5149ec7@oss.qualcomm.com>
Content-Type: text/plain; charset=utf-8
Content-Transfer-Encoding: quoted-printable
Date: Tue, 28 Jul 2026 10:30:48 +0000
Message-Id: <20260728103048.B3E7B1F000E9@smtp.kernel.org>
Precedence: bulk
X-Mailing-List: devicetree@vger.kernel.org
List-Id: <devicetree.vger.kernel.org>
List-Subscribe: <mailto:devicetree+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:devicetree+unsubscribe@vger.kernel.org>

Thank you for your contribution! Sashiko AI review found 4 potential issue(=
s) to consider:
- [High] The driver reads the wrong register to check the `DP_TUNNELING_CLO=
CK_GEN_EN` flag and then unconditionally clobbers the correct register with=
 `writel`.
- [Medium] Missing `clk_disable_unprepare` for `p2rr2p_pipe_clk` on error p=
aths in `qmp_combo_usb4_init`.
- [Medium] Double execution of `qmp_combo_usb_power_on` in `qmp_combo_usb4_=
init` if the USB3 PHY is already active.
- [Low] Several UCDR (Universal Clock and Data Recovery) register offsets a=
re misleadingly defined with a `_TX_` prefix instead of `_RX_`.
--

--- Patch [4]: [PATCH v2 4/5] phy: qualcomm: qmp-combo: Add USB4/TBT3 confi=
guration data for Hamoa ---
commit cbebd51448ab869d435da5d2defb78f367d02956
Author: Konrad Dybcio <konrad.dybcio@oss.qualcomm.com>
Subject: phy: qualcomm: qmp-combo: Add USB4/TBT3 configuration data for Ham=
oa

This commit adds the offsets and configuration tables to support USB4 and
Thunderbolt 3 operation on the USB4-capable PHYs found on Hamoa chips.

> diff --git a/drivers/phy/qualcomm/phy-qcom-qmp-combo.c b/drivers/phy/qual=
comm/phy-qcom-qmp-combo.c
> index b80eac9d71401..419668e014906 100644
> --- a/drivers/phy/qualcomm/phy-qcom-qmp-combo.c
> +++ b/drivers/phy/qualcomm/phy-qcom-qmp-combo.c
[ ... ]
> @@ -1873,6 +1952,68 @@ static const struct qmp_phy_init_tbl x1e80100_usb4=
3dp_tx_tbl[] =3D {
>  	QMP_PHY_INIT_CFG(QSERDES_V6_N4_TX_RES_CODE_LANE_OFFSET_RX, 0x0a),
>  };
> =20
> +static const struct qmp_phy_init_tbl x1e80100_usb4_rx_tbl[] =3D {
[ ... ]
> +	QMP_PHY_INIT_CFG(QSERDES_V6_N4_RX_MODE_RATE3_B6, 0xe3),
> +	QMP_PHY_INIT_CFG(QSERDES_V6_N4_TX_UCDR_FASTLOCK_COUNTER_LOW_RATE2, 0x30=
),

[Severity: Low]
Is this macro name accurate? It uses a "_TX_" prefix but is placed inside an
"rx_tbl".

Since UCDR is fundamentally a receiver-side block and its offsets logically
fall within the contiguous RX register block, using the "_TX_" prefix
creates a misleading hardware representation for future maintenance.

> +	QMP_PHY_INIT_CFG(QSERDES_V6_N4_TX_UCDR_FASTLOCK_COUNTER_HIGH_RATE2, 0x1=
4),
> +	QMP_PHY_INIT_CFG(QSERDES_V6_N4_TX_UCDR_FASTLOCK_COUNTER_LOW_RATE3, 0xff=
),
> +	QMP_PHY_INIT_CFG(QSERDES_V6_N4_TX_UCDR_FASTLOCK_COUNTER_HIGH_RATE3, 0x3=
f),
[ ... ]
> diff --git a/drivers/phy/qualcomm/phy-qcom-qmp-qserdes-txrx-v6_n4.h b/dri=
vers/phy/qualcomm/phy-qcom-qmp-qserdes-txrx-v6_n4.h
> index d37cc0d4fd365..e72ae2cb460ac 100644
> --- a/drivers/phy/qualcomm/phy-qcom-qmp-qserdes-txrx-v6_n4.h
> +++ b/drivers/phy/qualcomm/phy-qcom-qmp-qserdes-txrx-v6_n4.h
[ ... ]
> @@ -23,27 +23,63 @@
[ ... ]
> +#define QSERDES_V6_N4_RX_UCDR_SO_SATURATION		0x214
> +#define QSERDES_V6_N4_TX_UCDR_FASTLOCK_COUNTER_LOW_RATE1	0x224
> +#define QSERDES_V6_N4_TX_UCDR_FASTLOCK_COUNTER_HIGH_RATE1	0x228

[Severity: Low]
Are these registers correctly named? As noted above, they have a "_TX_"
prefix but are logically UCDR receiver-side block offsets.

> +#define QSERDES_V6_N4_TX_UCDR_FASTLOCK_COUNTER_LOW_RATE2	0x22c
> +#define QSERDES_V6_N4_TX_UCDR_FASTLOCK_COUNTER_HIGH_RATE2	0x230
[ ... ]

With the introduction of USB4 support, does the initialization code in
qmp_combo_com_init() corrupt the DP_TUNNELING_CLOCK_GEN_EN state?

drivers/phy/qualcomm/phy-qcom-qmp-combo.c:qmp_combo_com_init() {
    ...
	if (qmp->qmpphy_mode =3D=3D QMPPHY_MODE_USB4) {
		pcs =3D qmp->usb4_pcs;
        ...
		/* Do not disturb the DP PLL in case there's an active DP tunnel */
		if (readl(com + QPHY_V3_DP_COM_RESET_OVRD_CTRL) & DP_TUNNELING_CLOCK_GEN_=
EN)
			dp_reset_val &=3D ~SW_DPPHY_RESET_MUX;
	}
    ...
	case QMPPHY_MODE_USB4:
		writel(USB4_MODE, com + QPHY_V3_DP_COM_PHY_MODE_CTRL);
    ...
}

[Severity: High]
The code checks the tunneling state by reading QPHY_V3_DP_COM_RESET_OVRD_CT=
RL
instead of the correct PHY_MODE_CTRL register.

It then unconditionally overwrites QPHY_V3_DP_COM_PHY_MODE_CTRL completely
via writel(), which clears the DP_TUNNELING_CLOCK_GEN_EN flag if it was
previously active.

Can this break active DP tunnels by inappropriately resetting the DP PLL?

Are we missing a clk_disable_unprepare() on the error paths in
qmp_combo_usb4_init()?

drivers/phy/qualcomm/phy-qcom-qmp-combo.c:qmp_combo_usb4_init() {
    ...
	ret =3D clk_prepare_enable(qmp->p2rr2p_pipe_clk);
	if (ret) {
		dev_err(qmp->dev, "p2rr2p_pipe enable failed: %d\n", ret);
		return ret;
	}

	ret =3D qmp_combo_com_init(qmp, false);
	if (ret)
		return ret;
    ...
}

[Severity: Medium]
If qmp_combo_com_init(), qmp_combo_reconfigure_phy(), or
qmp_combo_usb_power_on() fail during USB4 PHY initialization, the function
returns without disabling the p2rr2p_pipe_clk prepared earlier, leaking
the clock reference.

Does qmp_combo_usb4_init() cause a double execution of
qmp_combo_usb_power_on()?

drivers/phy/qualcomm/phy-qcom-qmp-combo.c:qmp_combo_reconfigure_phy() {
    ...
	if ((qmp->usb_init_count || qmp->usb4phy_init_count) &&
	    new_mode !=3D QMPPHY_MODE_DP_ONLY)
		qmp_combo_usb_power_on(qmp->usb_phy);
    ...
}

drivers/phy/qualcomm/phy-qcom-qmp-combo.c:qmp_combo_usb4_init() {
    ...
	ret =3D qmp_combo_reconfigure_phy(qmp, QMPPHY_MODE_USB4);
	if (ret)
		return ret;

	ret =3D qmp_combo_usb_power_on(phy);
    ...
}

[Severity: Medium]
When initializing USB4 mode and the USB3 PHY is already active
(usb_init_count > 0), qmp_combo_reconfigure_phy() automatically invokes
qmp_combo_usb_power_on().

However, qmp_combo_usb4_init() unconditionally calls it a second time
immediately after. This might redundantly rewrite all configuration
registers and needlessly re-toggle SW_RESET and START_CTRL for the PHY.

--=20
Sashiko AI review =C2=B7 https://sashiko.dev/#/patchset/20260728-topic-usb4=
phy-v2-0-5d9dd5149ec7@oss.qualcomm.com?part=3D4
