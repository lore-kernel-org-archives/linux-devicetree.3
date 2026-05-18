Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 4E91D3502AA
	for <devicetree@vger.kernel.org>; Mon, 18 May 2026 11:32:27 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=10.30.226.201
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1779103947; cv=none; b=iBlZK9lmGkTNvCieO2/wMxcHWartqqdDEZXjhM9n2Dr07hcUzcHpuNTkJuuMlWgccAXuVd8zjAqnUFusmi9pFIyAK1Hx9iHWlXidn9oAtNkJFelnikN6AkwfULxMNrNyt9wf8wHdFHf1SYWPz2GWtx2VT7IdLrBneWSglq9V9Fc=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1779103947; c=relaxed/simple;
	bh=w3OypB7JaRmqaEg205doeFLjj0zgTv7FFyu6INW5CpM=;
	h=From:Subject:To:Cc:In-Reply-To:References:Content-Type:Date:
	 Message-Id; b=mG7FA/GQwHaVRPgQgEKcMNkqu280vrUsiRNmI3KEonlMsioJSsLQds5gBoT+SIo+Ilha0zHbPZLGTFXyT6RugB7dGkw3toRpWHjMa2HqFuG/dH0Z6ZM4Jd6VQkYM4nA5LB95CXUZFbRAbul4DS9pbwGULrktRN91VVPtWMihvcw=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=ZQBf6jAo; arc=none smtp.client-ip=10.30.226.201
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="ZQBf6jAo"
Received: by smtp.kernel.org (Postfix) with ESMTPSA id DADE3C2BCB7;
	Mon, 18 May 2026 11:32:26 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1779103947;
	bh=w3OypB7JaRmqaEg205doeFLjj0zgTv7FFyu6INW5CpM=;
	h=From:Subject:Reply-To:To:Cc:In-Reply-To:References:Date:From;
	b=ZQBf6jAoh8DsGcmPq1RiKhpyEo1K+bYcq7V+l41H/HaX6iLTu/KZn4yF2jqha1t3J
	 /7u5Th/i9UK8MpicYTKGGRSPAnCkB2qorJTZv0Tpa4b8wBrvLxTh82EFDkvEaZGcGz
	 kGQR+trDobzMeljzc6TM0ELPvN6PuLuXsQAJpQ5MstPPeS9KCREM0u6f+PXtRFXGPo
	 96MNRr+ZNu7bcqBTZINCEX9+gnNB4Ro6Or6jVFaWpGbznHbnL9MRjm8Jkn+wLRQ9cP
	 GHzTZYcARffUj90YPTtKwl0dqHFC7F4vYL5Lcz54CxlD87QU/lt7yxDannsBZTXeFf
	 AWes+fSUm3amA==
From: sashiko-bot@kernel.org
Subject: Re: [PATCH 3/5] phy: qualcomm: qmp-combo: Add preliminary USB4
 support
Reply-To: sashiko-reviews@lists.linux.dev
To: "Konrad Dybcio" <konradybcio@kernel.org>
Cc: conor+dt@kernel.org, neil.armstrong@linaro.org, olteanv@gmail.com, linux-phy@lists.infradead.org, vkoul@kernel.org, robh@kernel.org, devicetree@vger.kernel.org
In-Reply-To: <20260518-topic-usb4phy-v1-3-71d827c49dca@oss.qualcomm.com>
References: <20260518-topic-usb4phy-v1-3-71d827c49dca@oss.qualcomm.com>
Content-Type: text/plain; charset=utf-8
Content-Transfer-Encoding: quoted-printable
Date: Mon, 18 May 2026 11:32:26 +0000
Message-Id: <20260518113226.DADE3C2BCB7@smtp.kernel.org>
Precedence: bulk
X-Mailing-List: devicetree@vger.kernel.org
List-Id: <devicetree.vger.kernel.org>
List-Subscribe: <mailto:devicetree+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:devicetree+unsubscribe@vger.kernel.org>

Thank you for your contribution! Sashiko AI review found 12 potential issue=
(s) to consider:
- [Critical] Accessing hardware registers before enabling regulators and cl=
ocks causes a system crash.
- [High] Unconditional dereference of the `pcs_aon` pointer in `qmp_combo_c=
om_init()`.
- [High] Register mismatch when checking for an active DP tunnel breaks the=
 DP PLL.
- [High] Incomplete masking of DP reset bits in `qmp_combo_com_init()` acti=
vely forces the DP PHY into reset.
- [High] Type-C mux events are permanently dropped before the PHY is initia=
lized, breaking alt modes.
- [High] Double hardware initialization and `pipe_clk` reference leak in `q=
mp_combo_usb4_init()`.
- [High] Type-C cable orientation state is discarded for USB3 connections f=
ollowing a USB4 disconnect.
- [High] Error paths in `qmp_combo_usb4_init()` leak the `p2rr2p_pipe_clk` =
reference.
- [High] TOCTOU data race on `qmpphy_mode` and `orientation` in `qmp_combo_=
typec_switch_set()`.
- [High] Autonomous mode functions access unclocked `pcs_usb` registers, ca=
using a hardware hang.
- [High] Missing lock in `qmp_combo_typec_mux_set()` leads to concurrent PH=
Y reconfiguration races.
- [High] `init_count` underflows on error paths in `qmp_combo_com_init()` w=
hen `force` is true.
--

commit f92b7738f7f78a59373363a1b4f2191edf48f3e5
Author: Konrad Dybcio <konrad.dybcio@oss.qualcomm.com>

phy: qualcomm: qmp-combo: Add preliminary USB4 support

This commit adds preliminary USB4 support for Qualcomm QMP combo PHYs,
introducing a new USB4 submode and handling mutually exclusive USB4 and
USB3/DP operation modes.

> diff --git a/drivers/phy/qualcomm/phy-qcom-qmp-combo.c b/drivers/phy/qual=
comm/phy-qcom-qmp-combo.c
> index 93f1aa10d4008..898f42de4a086 100644
> --- a/drivers/phy/qualcomm/phy-qcom-qmp-combo.c
> +++ b/drivers/phy/qualcomm/phy-qcom-qmp-combo.c
[ ... ]
> @@ -3691,14 +3691,26 @@ static int qmp_combo_com_init(struct qmp_combo *q=
mp, bool force)
>  {
>  	const struct qmp_phy_cfg *cfg =3D qmp->cfg;
> +	u32 dp_reset_val =3D SW_DPPHY_RESET_MUX | SW_DPPHY_RESET;
>  	void __iomem *com =3D qmp->com;
>  	void __iomem *pcs_aon =3D qmp->pcs_aon;
> +	void __iomem *pcs =3D qmp->pcs;
>  	int ret;
>  	u32 val;
> =20
>  	if (!force && qmp->init_count++)
>  		return 0;

If force is true, this bypasses the init_count increment. However, if a
failure occurs later in the function (e.g., regulator_bulk_enable fails),
the error path jumps to err_decrement_count and executes qmp->init_count--.
Could this decrement a count that was never incremented, corrupting the
driver state?

> =20
> +	if (qmp->qmpphy_mode =3D=3D QMPPHY_MODE_USB4) {
> +		pcs =3D qmp->usb4_pcs;
> +
> +		qphy_setbits(pcs_aon, cfg->regs[QPHY_PCS_USB4_CLAMP_ENABLE], CLAMP_EN);

Could pcs_aon be NULL here? Other functions like
qmp_combo_enable_autonomous_mode() check if pcs_aon is valid before using i=
t.
If a platform lacks this memory region in the device tree, will this cause a
kernel panic?

Can accessing these hardware registers before enabling regulators and clocks
cause a system crash? The readl() and qphy_setbits() are called before
regulator_bulk_enable() and clk_bulk_prepare_enable(). Accessing unpowered
or unclocked hardware domains often triggers a synchronous external abort.

> +
> +		/* Do not disturb the DP PLL in case there's an active DP tunnel */
> +		if (readl(com + QPHY_V3_DP_COM_RESET_OVRD_CTRL) & DP_TUNNELING_CLOCK_G=
EN_EN)

Does this read the wrong register? DP_TUNNELING_CLOCK_GEN_EN is defined as a
bit in QPHY_V3_DP_COM_PHY_MODE_CTRL, rather than QPHY_V3_DP_COM_RESET_OVRD_=
CTRL.
This might evaluate SW_USB3PHY_RESET_MUX instead, leading to incorrect DP r=
eset
logic.

> +			dp_reset_val &=3D ~SW_DPPHY_RESET_MUX;
> +	}

Does this incomplete mask force the DP PHY into reset? dp_reset_val is
initially SW_DPPHY_RESET_MUX | SW_DPPHY_RESET, so this clears the mux bit
but leaves SW_DPPHY_RESET set to 1.

> +
>  	ret =3D regulator_bulk_enable(cfg->num_vregs, qmp->vregs);
[ ... ]
> @@ -3695,8 +3737,9 @@ static int qmp_combo_com_init(struct qmp_combo *qmp=
, bool force)
> =20
>  	/* override hardware control for reset of qmp phy */
>  	qphy_setbits(com, QPHY_V3_DP_COM_RESET_OVRD_CTRL,
> -			SW_DPPHY_RESET_MUX | SW_DPPHY_RESET |
> -			SW_USB3PHY_RESET_MUX | SW_USB3PHY_RESET);
> +			dp_reset_val |
> +			SW_USB3PHY_RESET_MUX | SW_USB3PHY_RESET |
> +			SW_USB4PHY_RESET_MUX | SW_USB4PHY_RESET);

When this is applied, since qphy_setbits() performs a bitwise OR, it cannot
clear SW_DPPHY_RESET_MUX in the hardware if it was already 1. Combined with
SW_DPPHY_RESET still being 1 in dp_reset_val, won't this actively put the
DP PHY into reset and destroy the state it was intended to protect?

[ ... ]
> @@ -3991,6 +4098,119 @@ static int qmp_combo_usb_set_mode(struct phy *phy=
, enum phy_mode mode, int submo
[ ... ]
> +static int qmp_combo_usb4_init(struct phy *phy)
> +{
> +	struct qmp_combo *qmp =3D phy_get_drvdata(phy);
> +	int ret;
> +
> +	guard(mutex)(&qmp->phy_mutex);
> +
> +	if (!qmp->p2rr2p_pipe_clk) {
> +		dev_err(qmp->dev, "missing p2rr2p_pipe clock handle. Update your Devic=
e Tree.\n");
> +		return -EINVAL;
> +	}
> +
> +	ret =3D clk_prepare_enable(qmp->p2rr2p_pipe_clk);
> +	if (ret) {
> +		dev_err(qmp->dev, "p2rr2p_pipe enable failed: %d\n", ret);
> +		return ret;
> +	}
> +
> +	ret =3D qmp_combo_com_init(qmp, false);
> +	if (ret)
> +		return ret;

Do the error paths in this function leak the p2rr2p_pipe_clk reference?
If qmp_combo_com_init(), qmp_combo_reconfigure_phy(), or
qmp_combo_usb_power_on() fail, the function returns directly without calling
clk_disable_unprepare() for p2rr2p_pipe_clk.

> +
> +	/* USB4 mode takes precedence to USB3(+DP), force reconfigure the PHY */
> +	ret =3D qmp_combo_reconfigure_phy(qmp, QMPPHY_MODE_USB4);
> +	if (ret)
> +		return ret;
> +
> +	ret =3D qmp_combo_usb_power_on(phy);

Can this cause a double hardware initialization and leak the pipe_clk refer=
ence?

If the USB3 PHY is already active, qmp_combo_reconfigure_phy() internally
calls qmp_combo_usb_power_on(qmp->usb_phy). Immediately after, this function
unconditionally calls qmp_combo_usb_power_on(phy) a second time. This would
enable the hardware twice and increment the pipe_clk reference count twice,
but usb4_exit() only calls power_off once.

[ ... ]
> @@ -4037,9 +4264,12 @@ static void qmp_combo_enable_autonomous_mode(struc=
t qmp_combo *qmp)
>  	 * Enable i/o clamp_n for autonomous mode
>  	 * V6 and later versions use pcs aon clamp register
>  	 */
> -	if (pcs_aon)
> -		qphy_clrbits(pcs_aon, cfg->regs[QPHY_PCS_CLAMP_ENABLE], CLAMP_EN);
> -	else if (pcs_misc)
> +	if (pcs_aon) {
> +		if (qmp->qmpphy_mode =3D=3D QMPPHY_MODE_USB4)
> +			qphy_clrbits(pcs_aon, cfg->regs[QPHY_PCS_USB4_CLAMP_ENABLE], CLAMP_EN=
);
> +		else
> +			qphy_clrbits(pcs_aon, cfg->regs[QPHY_PCS_CLAMP_ENABLE], CLAMP_EN);
> +	} else if (pcs_misc)
>  		qphy_clrbits(pcs_misc, cfg->regs[QPHY_PCS_CLAMP_ENABLE], CLAMP_EN);
>  }

In USB4 mode, qmp_combo_com_init() does not clear SW_USB3PHY_RESET, leaving
the USB3 PCS block in hardware reset. However,
qmp_combo_enable_autonomous_mode() unconditionally accesses pcs_usb registe=
rs
earlier in the function (e.g., QPHY_PCS_LFPS_RXTERM_IRQ_CLEAR). Will
accessing an IP block held in reset cause an external abort?

[ ... ]
> @@ -4427,24 +4660,29 @@ static int qmp_combo_typec_switch_set(struct type=
c_switch_dev *sw,
>  	struct qmp_combo *qmp =3D typec_switch_get_drvdata(sw);
>  	const struct qmp_phy_cfg *cfg =3D qmp->cfg;
> =20
> +	if (qmp->qmpphy_mode =3D=3D QMPPHY_MODE_USB4) {
> +		/* QMPPHY has no orientation handling in USB4 mode, don't cache the se=
tting */
> +		qmp->orientation =3D TYPEC_ORIENTATION_NONE;
> +		return 0;
> +	}
> +
>  	if (orientation =3D=3D qmp->orientation || orientation =3D=3D TYPEC_ORI=
ENTATION_NONE)
>  		return 0;
> =20
> -	mutex_lock(&qmp->phy_mutex);
> +	guard(mutex)(&qmp->phy_mutex);

Is there a data race here? The check for qmp->qmpphy_mode and the
modification of qmp->orientation are performed before acquiring
qmp->phy_mutex. If an orientation switch event races with
qmp_combo_usb4_init() modifying qmpphy_mode, switch_set could read a stale
mode and enter the critical section to execute a full PHY reset while the
USB4 router is actively using it.

Also, if a USB4 device is unplugged, usb4_exit is called but qmpphy_mode
remains QMPPHY_MODE_USB4. If a USB3 device is then plugged in, switch_set()
is typically called before mux_set(). Because it sees the stale USB4 mode,
it drops the valid orientation and forces TYPEC_ORIENTATION_NONE.

When mux_set() is subsequently called, it configures USB3 with no orientati=
on.
Will this cause enumeration to fail if the Type-C cable is flipped?

[ ... ]
> @@ -4495,41 +4755,11 @@ static int qmp_combo_typec_mux_set(struct typec_m=
ux_dev *mux, struct typec_mux_s
[ ... ]
> +	/* The mux still receives Type-C events, even if all PHYs are uninitial=
ized */
> +	if (!qmp->init_count)
> +		return 0;
> =20
> -	return 0;
> +	return qmp_combo_reconfigure_phy(qmp, new_mode);
>  }

Does this early return break alt modes by dropping Type-C events? It
bypasses saving the requested mode (qmp->qmpphy_mode =3D new_mode). Since
Type-C events often arrive before the USB controller initializes the PHY,
the requested mode is lost. When phy_init() is later called, it will
initialize with the stale default mode, breaking USB3 or DP routing.

Additionally, qmp_combo_reconfigure_phy() is called here without acquiring
qmp->phy_mutex. Concurrently, qmp_combo_usb4_init() uses the mutex and also
calls qmp_combo_reconfigure_phy(). Doesn't this lack of synchronization
permit concurrent execution of PHY hardware power down/up sequences,
potentially corrupting register states?

--=20
Sashiko AI review =C2=B7 https://sashiko.dev/#/patchset/20260518-topic-usb4=
phy-v1-0-71d827c49dca@oss.qualcomm.com?part=3D3
