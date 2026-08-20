Received: from smtp.kernel.org (aws-us-west-2-korg-mail-alma10-1.taild15c8.ts.net [100.103.45.18])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id F19FC361952
	for <devicetree@vger.kernel.org>; Thu, 20 Aug 2026 14:40:15 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=100.103.45.18
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1787236817; cv=none; b=WyYBLM+JzxV8U7+RyJtnbmoCl2NDcqbzsh6Tos5pxF8pcJY5ZXx8SFtce+9i+MG0yjXksoG1fQq69IvdzVSUjYnX11uryo/HbMWeYyKbSPAI/hbTQTKzoebOPmweyrKVGjvDa8fcY91gByJXQcA7ekIuQdZyl5iYIiruIzVCvx8=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1787236817; c=relaxed/simple;
	bh=x+dKW/KYzaD2vGsEXi1yQlqj6PSuTFK3mBR5msoTk7c=;
	h=From:Subject:To:Cc:In-Reply-To:References:Content-Type:Date:
	 Message-Id; b=uYUXDAyCnb8iohxtTmjFkwhcszIGMqrTnME6HzyXDHS098iUCFsc7ysI8cZGNqb3x1z2Zk6+R+WxxFMbIw09+a4sRwZrbpbPOU5k2RidHnRsJ5C+pVzKY+5cf2VDv+JsYFKCeqghCySmhKQY6nm6YAQDIudH7ty+gzfG+n5iCVI=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=QM990qQU; arc=none smtp.client-ip=100.103.45.18
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="QM990qQU"
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 32F2E1F000E9;
	Thu, 20 Aug 2026 14:40:15 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kernel.org;
	s=k20260515; t=1787236815;
	bh=OMd4GEi2ju9VDRjtlLPVOJJPY1azifUxAoFFL5QIjUE=;
	h=From:Subject:Reply-To:To:Cc:In-Reply-To:References:Date;
	b=QM990qQULApX6hUs2d9Nz9UbsCAO//KWBUISXAvfSN4Rg33tptpzFpFJSCylmtJu5
	 0qQbJoP3hi9Anm9FqreUHOYGPw4uJXe4dLRu5zX+/x/jF3gWoaM1UCxFchgGivy72M
	 JqOlFBpYBtneks2qq/bydRZcrbSczD20qg2aN5t+ul1l1LdgHsy7YT1HaUKhVEdQgx
	 cQsPiBlWaxOhzgHx9Ob1jubHCIopqyrDM+Z+hUQ/4sZ9t3dwU3m1hySN+mZh7zcar3
	 fda5R4/3MwbKgYWtuWFSF4Sp5Iq2pMPmHfy4EoleiUpgHYxZDgbMSk+dOWKHrAfYAV
	 tnJuciFlsI2gw==
From: sashiko-bot@kernel.org
Subject: Re: [PATCH v4 3/5] phy: qualcomm: qmp-combo: Add preliminary USB4
 support
Reply-To: sashiko-reviews@lists.linux.dev
To: "Konrad Dybcio" <konradybcio@kernel.org>
Cc: robh@kernel.org, olteanv@gmail.com, linux-phy@lists.infradead.org, conor+dt@kernel.org, devicetree@vger.kernel.org, vkoul@kernel.org, neil.armstrong@linaro.org
In-Reply-To: <20260820-topic-usb4phy-v4-3-aec9d2cb31f6@oss.qualcomm.com>
References: <20260820-topic-usb4phy-v4-0-aec9d2cb31f6@oss.qualcomm.com>
 <20260820-topic-usb4phy-v4-3-aec9d2cb31f6@oss.qualcomm.com>
Content-Type: text/plain; charset=utf-8
Content-Transfer-Encoding: quoted-printable
Date: Thu, 20 Aug 2026 14:40:14 +0000
Message-Id: <20260820144015.32F2E1F000E9@smtp.kernel.org>
Precedence: bulk
X-Mailing-List: devicetree@vger.kernel.org
List-Id: <devicetree.vger.kernel.org>
List-Subscribe: <mailto:devicetree+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:devicetree+unsubscribe@vger.kernel.org>

Thank you for your contribution! Sashiko AI review found 10 potential issue=
(s) to consider:

New issues:
- [Critical] Unclocked hardware register access in `qmp_combo_com_init()` d=
uring USB4 mode selection.
- [High] Double initialization of the USB4 PHY hardware in `qmp_combo_usb4_=
init()`.
- [High] Lockless check of `qmpphy_mode` in `qmp_combo_typec_switch_set()` =
leads to a TOCTOU race and uncoordinated PHY resets.
- [High] Wiping Type-C orientation state during USB4 mode permanently break=
s subsequent fallback to USB3.
- [High] Silently dropping Type-C mux events during USB4 mode permanently s=
trands the PHY.
- [High] PM runtime leak on `usb4_phy` creation failure in `qmp_combo_probe=
()`.
- [High] Inconsistent PCS selection between `power_on` and `power_off` leav=
es the USB4 PCS permanently running on error paths.

Pre-existing issues:
- [High] Unbalanced `init_count` decrement on error path when `force =3D=3D=
 true` in `qmp_combo_com_init()`.
- [High] Missing `phy_mutex` lock in `qmp_combo_typec_mux_set()` causes uns=
afe concurrent hardware access.
- [Medium] Double-disable of `pipe_clk` on `qmp_combo_usb_power_on()` timeo=
ut error.
--

--- Patch [3]: [PATCH v4 3/5] phy: qualcomm: qmp-combo: Add preliminary USB=
4 support ---
commit 1ed9c8485ed697b644025bad10e28d1de6fda740
Author: Konrad Dybcio <konrad.dybcio@oss.qualcomm.com>

phy: qualcomm: qmp-combo: Add preliminary USB4 support

Some Combo PHYs (so far only on SC8280XP, X1E80100 and Glymur), come in
a flavor called USB43DP, which as the name implies, features USB4, USB3
and DP signal processing capabilities. In that architecture, USB3 and
USB4 PHYs share the same USB_PLL while featuring separate logic spaces.

> diff --git a/drivers/phy/qualcomm/phy-qcom-qmp-combo.c b/drivers/phy/qual=
comm/phy-qcom-qmp-combo.c
> index c39ced168d035..dfdeec3ee4f5f 100644
> --- a/drivers/phy/qualcomm/phy-qcom-qmp-combo.c
> +++ b/drivers/phy/qualcomm/phy-qcom-qmp-combo.c
[ ... ]
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
Does this code execute memory-mapped I/O reads/writes before the
clk_bulk_prepare_enable() call?

When qmp_combo_reconfigure_phy() switches to QMPPHY_MODE_USB4, it calls
qmp_combo_com_exit() to turn off clocks and regulators, then calls
qmp_combo_com_init(). These register accesses happen before the clocks
and regulators are re-enabled, which might cause a synchronous external
abort or bus error.

[ ... ]
> @@ -4219,6 +4276,10 @@ static int qmp_combo_usb_power_on(struct phy *phy)
>  	struct qmp_combo *qmp =3D phy_get_drvdata(phy);
>  	const struct qmp_phy_cfg *cfg =3D qmp->cfg;
>  	void __iomem *serdes =3D qmp->serdes;
> +	const struct qmp_phy_init_tbl *pcs_tbl;
> +	const struct qmp_phy_init_tbl *rx_tbl;
> +	const struct qmp_phy_init_tbl *serdes_tbl;
> +	const struct qmp_phy_init_tbl *tx_tbl;
>  	void __iomem *tx =3D qmp->tx;

[Severity: Medium]
This is a pre-existing issue, but does a timeout error here cause a
double-disable of pipe_clk?

If PHY initialization times out in qmp_combo_usb_power_on(), it jumps to
err_disable_pipe_clk:

drivers/phy/qualcomm/phy-qcom-qmp-combo.c:qmp_combo_usb_power_on() {
    ...
err_disable_pipe_clk:
    clk_disable_unprepare(qmp->pipe_clk);
    return ret;
}

It then returns the error to qmp_combo_usb_init(), which calls
qmp_combo_com_exit(). The exit function unconditionally disables
pipe_clk again, potentially leading to a clock reference count underflow.

[ ... ]
> @@ -4275,16 +4367,20 @@ static int qmp_combo_usb_power_off(struct phy *ph=
y)
>  {
>  	struct qmp_combo *qmp =3D phy_get_drvdata(phy);
>  	const struct qmp_phy_cfg *cfg =3D qmp->cfg;
> +	void __iomem *pcs =3D qmp->pcs;
> +
> +	if (qmp->usb4_init_count)
> +		pcs =3D qmp->usb4_pcs;
> =20
>  	/* PHY reset */
> -	qphy_setbits(qmp->pcs, cfg->regs[QPHY_SW_RESET], SW_RESET);

[Severity: High]
Can this asymmetry leave the USB4 PCS running on error paths?

In qmp_combo_usb_power_on(), the code uses qmpphy_mode to select usb4_pcs.
Here, qmp_combo_usb_power_off() uses usb4_init_count to select it.

If qmp_combo_usb4_init() encounters a failure and errors out, it does not
increment usb4_init_count. However, the hardware was already started in USB4
mode. A subsequent call to qmp_combo_usb_exit() will see usb4_init_count =
=3D=3D 0
and might power off the USB3 PCS instead of the active USB4 PCS.

[ ... ]
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

[Severity: High]
This is a pre-existing issue, but does the error path in qmp_combo_com_init=
()
cause an unbalanced init_count decrement when force =3D=3D true?

If force =3D=3D true, the code skips incrementing qmp->init_count. However,=
 if any
initialization step fails, the function jumps to err_decrement_count:

drivers/phy/qualcomm/phy-qcom-qmp-combo.c:qmp_combo_com_init() {
    if (!force && qmp->init_count++)
        return 0;
    ...
    ret =3D regulator_bulk_enable(cfg->num_vregs, qmp->vregs);
    if (ret) {
        ...
        goto err_decrement_count;
    }
    ...
err_decrement_count:
    qmp->init_count--;
}

This could push the counter to -1, which evaluates to true in subsequent
if (qmp->init_count++) checks, potentially bypassing hardware initializatio=
n.

[ ... ]
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
[ ... ]
> +	/* USB4 mode takes precedence to USB3(+DP), force reconfigure the PHY */
> +	ret =3D qmp_combo_reconfigure_phy(qmp, QMPPHY_MODE_USB4);
> +	if (ret) {
> +		clk_disable_unprepare(qmp->p2rr2p_pipe_clk);
> +		qmp_combo_com_exit(qmp, false);
> +		return ret;
> +	}
> +
> +	ret =3D qmp_combo_usb_power_on(phy);

[Severity: High]
Does this code force a redundant hardware power-on sequence on the same
physical block?

When qmp_combo_reconfigure_phy() is called, it already calls
qmp_combo_usb_power_on(qmp->usb_phy) if the USB PHY was active. When execut=
ion
returns to qmp_combo_usb4_init(), it unconditionally calls
qmp_combo_usb_power_on(phy) again. This writes initialization sequences and
START bits twice to a running PHY without a power cycle.

[ ... ]
> @@ -4779,24 +5019,29 @@ static int qmp_combo_typec_switch_set(struct type=
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

[Severity: High]
Could this destructively clear the Type-C orientation state, causing state
loss upon fallback to USB3?

If qmp_combo_typec_switch_set() forces qmp->orientation =3D TYPEC_ORIENTATI=
ON_NONE,
and later the port falls back to USB3, the TCPM issues a switch_set (which
may drop the orientation due to stale mode) followed by mux_set(USB3). The =
PHY
might then configure for USB3 with NORMAL orientation, causing the link to
fail if the cable is physically REVERSE.

[Severity: High]
Is qmpphy_mode unsafely accessed outside the lock here?

The check for qmpphy_mode is done before acquiring qmp->phy_mutex. If
qmp_combo_usb4_init() is executing concurrently, it can hold the mutex and
change the mode to QMPPHY_MODE_USB4. If switch_set() evaluates the mode bef=
ore
this happens, it will block on the mutex and execute a full hardware power
cycle while the host router driver expects exclusive manual control over the
USB4 PHY.

>  	if (orientation =3D=3D qmp->orientation || orientation =3D=3D TYPEC_ORI=
ENTATION_NONE)
>  		return 0;
> =20
> -	mutex_lock(&qmp->phy_mutex);
> +	guard(mutex)(&qmp->phy_mutex);

[ ... ]
> @@ -4804,7 +5049,6 @@ static int qmp_combo_typec_switch_set(struct typec_=
switch_dev *sw,
>  static int qmp_combo_typec_mux_set(struct typec_mux_dev *mux, struct typ=
ec_mux_state *state)
>  {
>  	struct qmp_combo *qmp =3D typec_mux_get_drvdata(mux);
> -	const struct qmp_phy_cfg *cfg =3D qmp->cfg;
>  	enum qmpphy_mode new_mode;
>  	unsigned int svid;
> =20
> @@ -4815,6 +5059,29 @@ static int qmp_combo_typec_mux_set(struct typec_mu=
x_dev *mux, struct typec_mux_s
>  	else
>  		svid =3D 0;
> =20
> +	/*
> +	 * The USB4 router driver must excercise fine-grained control over the =
timing of
> +	 * USB4 QMPPHY mode entry/exit, which is difficult to otherwise ensure =
within Linux's
> +	 * Type-C framework if the PHY acts as a self-decisive mode mux in para=
llel.
> +	 *
> +	 * Keep the hardware in QMPPHY_MODE_USB4 at all times between .init and=
 .exit of the
> +	 * (Linux) USB4 PHY and wait for the router driver to turn it off at it=
s discretion.
> +	 * Once that happens, fall back to the usual USB3/DP/Combo mode logic.
> +	 *
> +	 * After the QMPPHY has been turned off through phy_exit(usb4_phy), the=
 next mux_set
> +	 * will initialize it in the right mode.
> +	 */
> +	if (qmp->usb4_init_count)
> +		return 0;

[Severity: High]
Will returning 0 here silently drop Type-C mux events and permanently strand
the PHY in USB4 mode?

If TCPM issues mux_set(USB3) before the USB4 router driver has finished its
teardown (while usb4_init_count > 0), the event is silently ignored. When
usb4_exit() eventually runs, it leaves the PHY powered off, but the TCPM
believes the USB3 transition already succeeded and might not resend it.

[ ... ]
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
This is a pre-existing issue, but does missing a lock here cause unsafe
concurrent hardware access?

qmp_combo_typec_mux_set() directly invokes qmp_combo_reconfigure_phy(),
which modifies shared state (qmpphy_mode, usb_init_count) and performs
full hardware power cycles. This function does not hold qmp->phy_mutex,
meaning concurrent execution with usb4_init or usb_init could cause
simultaneous uncoordinated PHY register writes.

[ ... ]
> @@ -5325,6 +5573,17 @@ static int qmp_combo_probe(struct platform_device =
*pdev)
> =20
>  	phy_set_drvdata(qmp->dp_phy, qmp);
> =20
> +	if (qmp->cfg->usb4_serdes_tbl) {
> +		qmp->usb4_phy =3D devm_phy_create(dev, dev->of_node, &qmp_combo_usb4_p=
hy_ops);
> +		if (IS_ERR(qmp->usb4_phy)) {
> +			ret =3D PTR_ERR(qmp->usb4_phy);
> +			dev_err(dev, "failed to create USB4 PHY: %d\n", ret);
> +			goto err_node_put;
> +		}

[Severity: High]
Does this jump bypass the pm_runtime_put_noidle() cleanup?

In qmp_combo_probe(), the device acquires a PM runtime reference. If
devm_phy_create() for usb4_phy fails, the code executes goto err_node_put.
This bypasses the err_pm_put label, leaking the PM runtime reference and
preventing the device from suspending.

--=20
Sashiko AI review =C2=B7 https://sashiko.dev/#/patchset/20260820-topic-usb4=
phy-v4-0-aec9d2cb31f6@oss.qualcomm.com?part=3D3
