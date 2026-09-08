Received: from smtp.kernel.org (aws-us-west-2-korg-mail-alma10-1.taild15c8.ts.net [100.103.45.18])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 52DFF3B38BC
	for <devicetree@vger.kernel.org>; Tue,  8 Sep 2026 08:14:51 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=100.103.45.18
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1788855293; cv=none; b=YhpnmpOsX/8mYsB5BmxTQB2G6kuv82C385t4c5cncMHZMC2EHwBy09U32ZIj9lE8RS+GYquHI1yU/2M6EfJfqTHKi2TaDrBOgTacOBqreW/CJnrmhxnFR23IXnfBd+u/a89imh7lOM6SO6g/sYxOp63EltQnRV1qOHFhz8awNLs=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1788855293; c=relaxed/simple;
	bh=1BolK9DJkDmqYIqXkLNpUde1FRqkpABMpGu7ss1rqG0=;
	h=From:Subject:To:Cc:In-Reply-To:References:Content-Type:Date:
	 Message-Id; b=DkDKgF2y2ApxhD9Z+2W0ueqWlS5cwX1Xn3r/xkQ69Ip0oWmHoooNwLMtFz6aEDtqTSs6ZrLHARzgDL3b6Ft6n9+m2P+zVOl3fhpdirgjZxUgFELNAcEeuGQdpR2Qzlx2b+LZFrCVIVPrhmpp4AlLM1O2pdw6OPUohE4FwUCPhKI=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=Qyzi6YPh; arc=none smtp.client-ip=100.103.45.18
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="Qyzi6YPh"
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 87A4E1F00A3A;
	Tue,  8 Sep 2026 08:14:50 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kernel.org;
	s=k20260515; t=1788855291;
	bh=3CRQGRW+ANb7BzU6Kgkqb+na5YoneOf9a7HU+n8MPFg=;
	h=From:Subject:Reply-To:To:Cc:In-Reply-To:References:Date;
	b=Qyzi6YPhneu0Fx2V4TsyM2R8Hn2pPjZvXcAK8oyg1O4E7imbon8PXNlA6BPRtE0xW
	 Vb4gULhWK/VJg0HEieXGytTDBJHypQ5y0YxjC1QGZj0Anpft7w9R2ZCy+B3e0QdNEA
	 UNhoNhgiBVBO92djwnaKWmjd4dpkug3IGQG4Ov7agj9TYaegLbPyfJBAGvcCGD0Acz
	 XJrbuo5Qvg9fuQ5Pa5CJtYe8YVECyvknsIqtorynqoUDRzmL3ZIq4BczU0JRJpLHwY
	 H/3LVho2bfttqMczNhfBaiNfqs0CfVhnkp0UIbiCsNlrhcjTTH/CugcGeQ78vekjrA
	 Qarj1T9UANSQA==
From: sashiko-bot@kernel.org
Subject: Re: [PATCH v5 3/5] phy: qualcomm: qmp-combo: Add preliminary USB4
 support
Reply-To: sashiko-reviews@lists.linux.dev
To: "Konrad Dybcio" <konradybcio@kernel.org>
Cc: robh@kernel.org, conor+dt@kernel.org, devicetree@vger.kernel.org, vkoul@kernel.org, olteanv@gmail.com, linux-phy@lists.infradead.org, neil.armstrong@linaro.org
In-Reply-To: <20260908-topic-usb4phy-v5-3-73aac69578ef@oss.qualcomm.com>
References: <20260908-topic-usb4phy-v5-0-73aac69578ef@oss.qualcomm.com>
 <20260908-topic-usb4phy-v5-3-73aac69578ef@oss.qualcomm.com>
Content-Type: text/plain; charset=utf-8
Content-Transfer-Encoding: quoted-printable
Date: Tue, 08 Sep 2026 08:14:50 +0000
Message-Id: <20260908081450.87A4E1F00A3A@smtp.kernel.org>
Precedence: bulk
X-Mailing-List: devicetree@vger.kernel.org
List-Id: <devicetree.vger.kernel.org>
List-Subscribe: <mailto:devicetree+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:devicetree+unsubscribe@vger.kernel.org>

Thank you for your contribution! Sashiko AI review found 6 potential issue(=
s) to consider:

New issues:
- [Critical] Accessing PHY registers before enabling clocks in `qmp_combo_c=
om_init` causes a synchronous external abort.
- [High] Type-C mux events fail to update `qmpphy_mode` when the PHY is uni=
nitialized, leading to stale state and broken subsequent connections.
- [High] Double initialization of the USB4 PHY when transitioning from an a=
ctive USB3 state clobbers the active hardware state.
- [High] PHY mode and power state are not restored if USB4 power-on fails.
- [Medium] Data race on shared state `qmp->orientation` due to unprotected =
access in `qmp_combo_typec_switch_set`.

Pre-existing issues:
- [High] Preexisting race condition: `qmp_combo_typec_mux_set` modifies sha=
red PHY state and hardware without holding `phy_mutex`.
--

commit e68a240bfd6571e7ac31565bbc5b1911cba807e3
Author: Konrad Dybcio <konrad.dybcio@oss.qualcomm.com>
Subject: phy: qualcomm: qmp-combo: Add preliminary USB4 support

This commit introduces preliminary USB4 support for Combo PHYs on certain
Qualcomm platforms (SC8280XP, X1E80100, Glymur). It adds a new struct phy
to expose the USB4 mode and modifies the PHY mode management to support
mutually exclusive toggling between USB4/TBT3 and USB3/DP operation.

> diff --git a/drivers/phy/qualcomm/phy-qcom-qmp-combo.c b/drivers/phy/qual=
comm/phy-qcom-qmp-combo.c
> index c39ced168d035..a4f130fc33e39 100644
> --- a/drivers/phy/qualcomm/phy-qcom-qmp-combo.c
> +++ b/drivers/phy/qualcomm/phy-qcom-qmp-combo.c
[ ... ]
> @@ -4006,6 +4036,9 @@ static int qmp_combo_dp_calibrate(struct phy *phy)
>  static int qmp_combo_com_init(struct qmp_combo *qmp, bool force)
>  {
>  	const struct qmp_phy_cfg *cfg =3D qmp->cfg;
> +	u32 dp_reset_val =3D SW_DPPHY_RESET_MUX | SW_DPPHY_RESET;
> +	void __iomem *pcs_aon =3D qmp->pcs_aon;
> +	void __iomem *pcs =3D qmp->pcs;
>  	void __iomem *com =3D qmp->com;
>  	void __iomem *aon_toggle;
>  	int ret;
> @@ -4019,6 +4052,16 @@ static int qmp_combo_com_init(struct qmp_combo *qm=
p, bool force)
>  	else
>  		aon_toggle =3D qmp->pcs_aon;
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
> +
>  	ret =3D regulator_bulk_enable(cfg->num_vregs, qmp->vregs);
>  	if (ret) {
>  		dev_err(qmp->dev, "failed to enable regulators, err=3D%d\n", ret);

[Severity: Critical]
Does accessing these memory-mapped registers before enabling clocks cause a
synchronous external abort?

When transitioning to USB4 mode, qmp_combo_reconfigure_phy() calls
qmp_combo_com_exit(qmp, true) which disables all PHY clocks. Immediately af=
ter,
it calls qmp_combo_com_init(qmp, true), executing this block where it reads
from and writes to the PHY registers before regulator_bulk_enable() and
clk_bulk_prepare_enable() are called below.

[ ... ]
> @@ -4343,6 +4454,125 @@ static int qmp_combo_usb_set_mode(struct phy *phy=
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
> +	if (qmp->usb_init_count || qmp->usb4_init_count)
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
> +	if ((qmp->usb_init_count || qmp->usb4_init_count) &&
> +	    new_mode !=3D QMPPHY_MODE_DP_ONLY)
> +		qmp_combo_usb_power_on(qmp->usb_phy);
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
> +	if (ret) {
> +		clk_disable_unprepare(qmp->p2rr2p_pipe_clk);
> +		return ret;
> +	}
> +
> +	/* USB4 mode takes precedence to USB3(+DP), force reconfigure the PHY */
> +	ret =3D qmp_combo_reconfigure_phy(qmp, QMPPHY_MODE_USB4);
> +	if (ret) {
> +		clk_disable_unprepare(qmp->p2rr2p_pipe_clk);
> +		qmp_combo_com_exit(qmp, false);
> +		return ret;
> +	}
> +
> +	ret =3D qmp_combo_usb_power_on(phy);
> +	if (ret) {
> +		clk_disable_unprepare(qmp->p2rr2p_pipe_clk);
> +		qmp_combo_com_exit(qmp, false);
> +		return ret;
> +	}

[Severity: High]
Does this execute a double initialization of the USB4 PHY?

When qmp_combo_reconfigure_phy() is called and the USB3 PHY is already acti=
ve
(qmp->usb_init_count > 0), it tears down the connection and calls
qmp_combo_usb_power_on() to start the hardware in the new USB4 mode. Since =
it
has already started the PHY hardware state machine, does calling
qmp_combo_usb_power_on() again immediately after clobber the active hardware
state?

[Severity: High]
If this second call to qmp_combo_usb_power_on() fails (for example due to a
PHY status poll timeout), does the error path fail to restore the PHY mode =
and
power state?

qmp_combo_reconfigure_phy() modifies qmp->qmpphy_mode and shuts down the ac=
tive
USB3/DP PHYs. If power-on fails here, qmp->qmpphy_mode is not restored and =
the
previously active PHYs are left powered off, leaving the USB3/DP drivers
believing the PHY is initialized.

[ ... ]
> @@ -4779,24 +5022,29 @@ static int qmp_combo_typec_switch_set(struct type=
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
>  	qmp->orientation =3D orientation;

[Severity: Medium]
Does writing to qmp->orientation here without holding qmp->phy_mutex introd=
uce
a data race?

This write bypasses the subsequent guard(mutex)(&qmp->phy_mutex) used for
normal orientation caching, creating a concurrent memory access violation if
PHY initialization (such as qmp_combo_com_init) is running in parallel duri=
ng
Type-C switch events.

[ ... ]
> @@ -4847,41 +5117,11 @@ static int qmp_combo_typec_mux_set(struct typec_m=
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
Does this early return prevent qmp->qmpphy_mode from tracking the actual
Type-C mux state while the PHY is powered down?

If a USB4 device is unplugged, init_count drops to 0 and qmpphy_mode remains
QMPPHY_MODE_USB4. If a USB3 device is then plugged in, this check returns
early and fails to update qmp->qmpphy_mode. Later, when the USB controller
calls phy_init(), the PHY is programmed using the stale USB4 mode without
orientation, which can break the SuperSpeed link.

[Severity: High]
This is a pre-existing issue, but does calling qmp_combo_reconfigure_phy()
from qmp_combo_typec_mux_set() modify shared PHY state and hardware without
holding qmp->phy_mutex?

qmp_combo_typec_mux_set() is called by the Type-C workqueue without holding=
 the
mutex. It calls qmp_combo_reconfigure_phy(), which updates qmp->qmpphy_mode=
 and
programs PHY hardware registers. This seems to race with PHY lifecycle
operations running in the USB controller thread, which do acquire phy_mutex=
 to
protect these exact same variables and registers.

--=20
Sashiko AI review =C2=B7 https://sashiko.dev/#/patchset/20260908-topic-usb4=
phy-v5-0-73aac69578ef@oss.qualcomm.com?part=3D3
