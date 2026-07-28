Received: from smtp.kernel.org (aws-us-west-2-korg-mail-alma10-1.taild15c8.ts.net [100.103.45.18])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 3AF1A420487
	for <devicetree@vger.kernel.org>; Tue, 28 Jul 2026 10:23:06 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=100.103.45.18
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1785234188; cv=none; b=Ynx5AQcMVRKM72E0iPGtE6LsgLM9OK57aYi/vvtfrff9q7PHIiSq2hhbL0qBZZ7pRGm8XA428JK5mOHo2H/juiL9p8gsJVgFM+JM4JWVX52E/LD3j3NcJEFeElEhyQ5YBUg06XMTS10/OEP72hVbnzASxnjIo7MBlO8mpST6gWI=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1785234188; c=relaxed/simple;
	bh=i/cSw9DDqjHnKu5fd4qIJ0MTD0za5UHc8+7pOUYd/uk=;
	h=From:Subject:To:Cc:In-Reply-To:References:Content-Type:Date:
	 Message-Id; b=a1MBLwiWDbNdlsFetu8Clt1AeUN08U212ju6LUIpWkTbIu1g6124T5F+ukFBTUbnw0aRHXnP2GwAVCuKOLnPQLQAxDv837t5tDS+usHmgGAIfrHVUBCjYQjO4YAXA2M2jyWgxyFQmBQXo7NnRtebn7TXUhx6/Z1JuqqZks6Mk74=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=OJDoms+p; arc=none smtp.client-ip=100.103.45.18
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="OJDoms+p"
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 18DA31F000E9;
	Tue, 28 Jul 2026 10:23:06 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kernel.org;
	s=k20260515; t=1785234186;
	bh=RP+zYIN7e8H1Y7e/qb+QEgZvAAk9SFEqnfruEJkaHAA=;
	h=From:Subject:Reply-To:To:Cc:In-Reply-To:References:Date;
	b=OJDoms+p9ujwDV8WhgnP57K9So4NAZaRtxkrZpe7NXCpcifsAXXXRMm6SIrEwNRXq
	 YfZHEuvRB+fz+0N/5MfAGeSxF2SKkUjkM5mpozimveNGi3p4sgh5T1cylRwTwupDHC
	 IMRsd3Rk8qaOqh5Ju5i0bIoAXpaW/Dpzrv9/kMEhwqDhG2aqrX4u3HUeVqOh56mixO
	 7H5PDofiQInnPb3pZSPyV+wXY/FSW+a1sxq3DbXtem3P7ssc31hJSWDUMo7w6X1D8Y
	 AsYJImBEgeAPQv1bQDV++lKvGeeX5CNmAVcZs/kkhXPH4PbiQtu+eOE67vHG0LMkzW
	 HzPzMmR3QdxPQ==
From: sashiko-bot@kernel.org
Subject: Re: [PATCH v2 3/5] phy: qualcomm: qmp-combo: Add preliminary USB4
 support
Reply-To: sashiko-reviews@lists.linux.dev
To: "Konrad Dybcio" <konradybcio@kernel.org>
Cc: vkoul@kernel.org, olteanv@gmail.com, linux-phy@lists.infradead.org, robh@kernel.org, conor+dt@kernel.org, devicetree@vger.kernel.org, neil.armstrong@linaro.org
In-Reply-To: <20260728-topic-usb4phy-v2-3-5d9dd5149ec7@oss.qualcomm.com>
References: <20260728-topic-usb4phy-v2-0-5d9dd5149ec7@oss.qualcomm.com>
 <20260728-topic-usb4phy-v2-3-5d9dd5149ec7@oss.qualcomm.com>
Content-Type: text/plain; charset=utf-8
Content-Transfer-Encoding: quoted-printable
Date: Tue, 28 Jul 2026 10:23:05 +0000
Message-Id: <20260728102306.18DA31F000E9@smtp.kernel.org>
Precedence: bulk
X-Mailing-List: devicetree@vger.kernel.org
List-Id: <devicetree.vger.kernel.org>
List-Subscribe: <mailto:devicetree+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:devicetree+unsubscribe@vger.kernel.org>

Thank you for your contribution! Sashiko AI review found 6 potential issue(=
s) to consider:

New issues:
- [High] Resource leak of p2rr2p_pipe_clk on error paths and early returns.
- [High] Type-C orientation is silently discarded after a USB4 disconnect, =
breaking subsequent USB3 connections.
- [High] Incorrect register offset is used to check for active DP tunnels, =
leading to incorrect DP PHY reset behavior.
- [Medium] Lockless write to qmp->orientation in qmp_combo_typec_switch_set=
() introduces a data race.

Pre-existing issues:
- [High] Missing mutex protection in qmp_combo_typec_mux_set() leads to sev=
ere data races on PHY state and hardware registers.
- [High] Ignored return value of qmp_combo_com_init() in reconfiguration pa=
ths leads to hardware crashes.
--

--- Patch [3]: [PATCH v2 3/5] phy: qualcomm: qmp-combo: Add preliminary USB=
4 support ---
commit 52b7ebb494f878e59b52ed97e3df1d0893347c98
Author: Konrad Dybcio <konrad.dybcio@oss.qualcomm.com>

phy: qualcomm: qmp-combo: Add preliminary USB4 support

This patch adds preliminary USB4 support to some QMP Combo PHYs. It introdu=
ces
a new struct phy for USB4, along with a set_mode callback for toggling
between USB4 and TBT3 submodes. The Type-C handling is delegated to the Host
Router when USB4 PHY mode is active.

> diff --git a/drivers/phy/qualcomm/phy-qcom-qmp-combo.c b/drivers/phy/qual=
comm/phy-qcom-qmp-combo.c
> index cdcfad2e86b1d..b80eac9d71401 100644
> --- a/drivers/phy/qualcomm/phy-qcom-qmp-combo.c
> +++ b/drivers/phy/qualcomm/phy-qcom-qmp-combo.c

[ ... ]

> @@ -3691,14 +3691,26 @@ static int qmp_combo_dp_calibrate(struct phy *phy)
>  static int qmp_combo_com_init(struct qmp_combo *qmp, bool force)
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
> =20
> +	if (qmp->qmpphy_mode =3D=3D QMPPHY_MODE_USB4) {
> +		pcs =3D qmp->usb4_pcs;
> +
> +		qphy_setbits(pcs_aon, cfg->regs[QPHY_PCS_USB4_CLAMP_ENABLE], CLAMP_EN);
> +
> +		/* Do not disturb the DP PLL in case there's an active DP tunnel */
> +		if (readl(com + QPHY_V3_DP_COM_RESET_OVRD_CTRL) & DP_TUNNELING_CLOCK_G=
EN_EN)
> +			dp_reset_val &=3D ~SW_DPPHY_RESET_MUX;
> +	}

[Severity: High]
Is the DP_TUNNELING_CLOCK_GEN_EN mask applied to the wrong register offset =
here?

DP_TUNNELING_CLOCK_GEN_EN is defined as BIT(3) for QPHY_V3_DP_COM_PHY_MODE_=
CTRL,
but this checks QPHY_V3_DP_COM_RESET_OVRD_CTRL instead. Reading the wrong
register might misread the hardware state and lead to incorrect DP PHY reset
behavior.

[ ... ]

> @@ -3993,6 +4100,119 @@ static int qmp_combo_usb_set_mode(struct phy *phy=
, enum phy_mode mode, int submo
>  	return 0;
>  }
> =20
> +static int qmp_combo_reconfigure_phy(struct qmp_combo *qmp, enum qmpphy_=
mode new_mode)
> +{
> +	dev_dbg(qmp->dev, "qmp_combo_reconfigure_phy: switching from qmpphy mod=
e %d to %d\n",
> +		qmp->qmpphy_mode, new_mode);
> +
> +	if (qmp->usb_init_count || qmp->usb4phy_init_count)
> +		qmp_combo_usb_power_off(qmp->usb_phy);
> +
> +	if (qmp->dp_init_count)
> +		writel(DP_PHY_PD_CTL_PSR_PWRDN, qmp->dp_dp_phy + QSERDES_DP_PHY_PD_CTL=
);
> +
> +	qmp_combo_com_exit(qmp, true);
> +
> +	qmp->qmpphy_mode =3D new_mode;
> +
> +	/* Now everything's powered down, power up the right PHYs */
> +	qmp_combo_com_init(qmp, true);
> +
> +	if ((qmp->usb_init_count || qmp->usb4phy_init_count) &&
> +	    new_mode !=3D QMPPHY_MODE_DP_ONLY)
> +		qmp_combo_usb_power_on(qmp->usb_phy);

[Severity: High]
This is a pre-existing issue, but does ignoring the return value of
qmp_combo_com_init() here lead to SoC crashes if the initialization fails?

Accessing PHY MMIO registers in qmp_combo_usb_power_on() when regulators or
clocks are powered off could trigger an unrecoverable external abort.

> +
> +	if ((new_mode =3D=3D QMPPHY_MODE_USB3DP || new_mode =3D=3D QMPPHY_MODE_=
DP_ONLY) &&
> +	    qmp->dp_init_count)
> +		qmp->cfg->dp_aux_init(qmp);
> +
> +	return 0;
> +}
> +
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
> +
> +	/* USB4 mode takes precedence to USB3(+DP), force reconfigure the PHY */
> +	ret =3D qmp_combo_reconfigure_phy(qmp, QMPPHY_MODE_USB4);
> +	if (ret)
> +		return ret;
> +
> +	ret =3D qmp_combo_usb_power_on(phy);
> +	if (ret) {
> +		qmp_combo_com_exit(qmp, false);
> +		return ret;
> +	}

[Severity: High]
Does this code leak the p2rr2p_pipe_clk clock?

If any of qmp_combo_com_init(), qmp_combo_reconfigure_phy(), or
qmp_combo_usb_power_on() fail, the function returns the error directly with=
out
calling clk_disable_unprepare(qmp->p2rr2p_pipe_clk).

> +
> +	/*
> +	 * Due to the SoC design, the PHY only has a single valid consumer and
> +	 * preventing it from having sole ownership of the PHY's power state
> +	 * makes suspending/resuming the router impossible.
> +	 */
> +	WARN_ON(qmp->usb4phy_init_count++);
> +
> +	return 0;
> +}
> +
> +static int qmp_combo_usb4_exit(struct phy *phy)
> +{
> +	struct qmp_combo *qmp =3D phy_get_drvdata(phy);
> +	int ret;
> +
> +	guard(mutex)(&qmp->phy_mutex);
> +
> +	ret =3D qmp_combo_usb_power_off(qmp->usb_phy);
> +	if (ret)
> +		return ret;
> +
> +	ret =3D qmp_combo_com_exit(qmp, false);
> +	if (ret)
> +		return ret;

[Severity: High]
Are there clock leaks on these early return paths?

If qmp_combo_usb_power_off() or qmp_combo_com_exit() return an error, the
function exits early, bypassing the clk_disable_unprepare() step.

> +
> +	/*
> +	 * Mark the USB4 PHY uninitialized and wait for a mux_set event to dete=
rmine the correct
> +	 * setting. This will always be possible because USB4 requires Type-C.
> +	 */
> +	qmp->usb4phy_init_count--;
> +
> +	clk_disable_unprepare(qmp->p2rr2p_pipe_clk);
> +
> +	return 0;
> +}

[Severity: High]
Does exiting USB4 mode fail to clear qmp->qmpphy_mode?

If qmp->qmpphy_mode is not reset here, when the next device (like a standard
USB3 device) is connected, qmp_combo_typec_switch_set() will still see
qmpphy_mode as QMPPHY_MODE_USB4. This could cause the valid Type-C
orientation to be incorrectly discarded.

[ ... ]

> @@ -4429,24 +4662,29 @@ static int qmp_combo_typec_switch_set(struct type=
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

[Severity: Medium]
Does writing to qmp->orientation without holding qmp->phy_mutex introduce a
data race?

Concurrent threads, such as the USB controller driver executing
qmp_combo_usb_init(), hold the phy_mutex and call qmp_combo_com_init() which
reads qmp->orientation.

> =20
>  	if (orientation =3D=3D qmp->orientation || orientation =3D=3D TYPEC_ORI=
ENTATION_NONE)
>  		return 0;
> =20
> -	mutex_lock(&qmp->phy_mutex);
> +	guard(mutex)(&qmp->phy_mutex);
>  	qmp->orientation =3D orientation;
> =20
>  	if (qmp->init_count) {
> -		if (qmp->usb_init_count)
> +		if (qmp->usb_init_count || qmp->usb4phy_init_count)
>  			qmp_combo_usb_power_off(qmp->usb_phy);
>  		qmp_combo_com_exit(qmp, true);
> =20
>  		qmp_combo_com_init(qmp, true);
> -		if (qmp->usb_init_count)
> +		if (qmp->usb_init_count || qmp->usb4phy_init_count)
>  			qmp_combo_usb_power_on(qmp->usb_phy);

[Severity: High]
This is a pre-existing issue, but does ignoring the return value of
qmp_combo_com_init() here have the same hardware crash potential?

If qmp_combo_com_init() fails, qmp_combo_usb_power_on() is called
unconditionally, which might access MMIO registers while unpowered.

[ ... ]

> @@ -4497,41 +4757,11 @@ static int qmp_combo_typec_mux_set(struct typec_m=
ux_dev *mux, struct typec_mux_s
>  		return 0;
>  	}
> =20
> -	dev_dbg(qmp->dev, "typec_mux_set: switching from qmpphy mode %d to %d\n=
",
> -		qmp->qmpphy_mode, new_mode);
> -
> -	qmp->qmpphy_mode =3D new_mode;
> -
> -	if (qmp->init_count) {
> -		if (qmp->usb_init_count)
> -			qmp_combo_usb_power_off(qmp->usb_phy);
> -
> -		if (qmp->dp_init_count)
> -			writel(DP_PHY_PD_CTL_PSR_PWRDN, qmp->dp_dp_phy + QSERDES_DP_PHY_PD_CT=
L);
> -
> -		qmp_combo_com_exit(qmp, true);
> -
> -		/* Now everything's powered down, power up the right PHYs */
> -		qmp_combo_com_init(qmp, true);
> -
> -		if (new_mode =3D=3D QMPPHY_MODE_DP_ONLY) {
> -			if (qmp->usb_init_count)
> -				qmp->usb_init_count--;
> -		}
> -
> -		if (new_mode =3D=3D QMPPHY_MODE_USB3DP || new_mode =3D=3D QMPPHY_MODE_=
USB3_ONLY) {
> -			qmp_combo_usb_power_on(qmp->usb_phy);
> -			if (!qmp->usb_init_count)
> -				qmp->usb_init_count++;
> -		}
> -
> -		if (new_mode =3D=3D QMPPHY_MODE_DP_ONLY || new_mode =3D=3D QMPPHY_MODE=
_USB3DP) {
> -			if (qmp->dp_init_count)
> -				cfg->dp_aux_init(qmp);
> -		}
> -	}
> +	/* The mux still receives Type-C events, even if all PHYs are uninitial=
ized */
> +	if (!qmp->init_count)
> +		return 0;
> =20
> -	return 0;
> +	return qmp_combo_reconfigure_phy(qmp, new_mode);
>  }

[Severity: High]
This is a pre-existing issue, but does qmp_combo_typec_mux_set() lack mutex
protection?

The function performs hardware reconfigurations via qmp_combo_reconfigure_p=
hy()
and modifies shared state such as qmp->qmpphy_mode without acquiring
qmp->phy_mutex. This can race with phy_ops callbacks that do hold the mutex.

--=20
Sashiko AI review =C2=B7 https://sashiko.dev/#/patchset/20260728-topic-usb4=
phy-v2-0-5d9dd5149ec7@oss.qualcomm.com?part=3D3
