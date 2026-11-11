Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=100.103.45.18
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1794424987;
	b=JTDOlfPky1LC/r5SxChALyfd2Wr8WZUtiDP8juxA3LNx5sgWG/CUKzGSmEfq9SL1Wkat
	 Emv65xbvrdFZH0uvXh0j9+OIFuN1CCrD6hwm6eguE7/9ax7xfXM6iIfrZ+RorvTBZHdKt
	 eP3+up62od6sfmIXQByYBjqjcxQkGiCyZImgNq01x9IqOoKE2MV6t6ibaUqIzeuAYL0xC
	 6BHb31vsdczB+2Jic0EAZXb6fm+fqN2R6pGA7wCj6UVpoXWzmpyuz7UdIoTI1NcUJMmUS
	 xtSiNqL+6tVnjjDTtWJjs4gSLuEeDtfLHaEbwNDDErUiEd+b6Ybw2dxaNbymzbu4CFg==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1794424987;
	h=Received:DKIM-Signature:Message-ID:From:Subject:Reply-To:To:Cc:
	 In-Reply-To:References:Content-Type:Content-Transfer-Encoding:Date;
	bh=YT3vkoklgt0d0OQaCsUOjmmOrElqpIRuSoIPZTtj6dg=;
	b=CKtvvRPVLIKocWoz97RJL8nrPj+84FuCikJ8DTLAhGkoqp4CV9NPVqxrjE7UeFFT3pK3
	 3kyvgMy4WavPtJUzFRktBIyNxdqaUNkWAX98nlSGlUSfZvlcePHe+Sgp7GIcynWne4fh0
	 +DsjozbfupgJGYT/DtHrwIfTf95tDTm3TVollCeKqi209CSK2DR9+/a/1CGwTJiYe0omd
	 lDHFgJ34c9ma0JUgKGxmztt6xxaGhhIaP4eU/s6BUQCBJjsS5/TWe8HhQERXFxyD2nRsP
	 0Q102TFToOH/Rox506UagLNr1EuROXuXquvDqXFzFVL1hvGXh2FmYvIzwlIM8b4TJKg==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dkim=pass header.d=kernel.org header.i=@kernel.org header.a=rsa-sha256 header.s=k20260515 header.b=XeIz31hI;
	arc=none smtp.remote-ip=100.103.45.18
Received: from smtp.kernel.org (quasi.space.kernel.org [100.103.45.18])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 14B50606A31C
	for <devicetree@vger.kernel.org>; Wed, 11 Nov 2026 19:23:06 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.a=rsa-sha256 header.s=k20260515 header.b=XeIz31hI
Received: by smtp.kernel.org (Postfix) with ESMTPSA id A0BF01F00A05;
	Wed, 11 Nov 2026 19:23:05 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kernel.org;
	s=k20260515; t=1794424986;
	bh=YT3vkoklgt0d0OQaCsUOjmmOrElqpIRuSoIPZTtj6dg=;
	h=From:Subject:Reply-To:To:Cc:In-Reply-To:References:Date;
	b=XeIz31hIrG7XXsM2tHUvo4svX0ey/urkDWpdqkG41b9EO6uU6qWehNLLO3HDqipZA
	 g7Zrqtin/0XvBg4KxSCj9D+q0PKpd/8F7GXVqHaTSUTTmyjXjoXBOuJXF4bq/4w6kL
	 eeR5TdtTrDp8cYoyv4TV7Cnp23uiOAsX0drIgQIbcSOzMfLlyeVXdFNeSkfxQu+JAa
	 zQZV/mpmuzSUefMkgILcCSMqsnU3uRru2oo6HKn7jyKQA19cvqylx+b06rWDx6kf5T
	 o822QHWQcqmTT8T6pd5/00RWLno+5kW8Od4qfyiD8x4gPSmihkInNjzhdc0SVulASJ
	 in4b/f6R/lGDA==
Message-ID: <sashiko-outbox-209554@kernel.org>
From: sashiko-bot@kernel.org
Subject: Re: [PATCH 2/2] phy: qcom: qusb2: Add charger detection support
Reply-To: sashiko-reviews@lists.linux.dev
To: "Krishna Kurapati" <krishna.kurapati@oss.qualcomm.com>
Cc: linux-phy@lists.infradead.org, devicetree@vger.kernel.org, robh@kernel.org, conor+dt@kernel.org, vkoul@kernel.org, neil.armstrong@linaro.org, olteanv@gmail.com
In-Reply-To: <20261111-shikra-qusb2-charger-det-v1-2-5a9d919c66b5@oss.qualcomm.com>
References: <20261111-shikra-qusb2-charger-det-v1-0-5a9d919c66b5@oss.qualcomm.com>
 <20261111-shikra-qusb2-charger-det-v1-2-5a9d919c66b5@oss.qualcomm.com>
Content-Type: text/plain; charset=utf-8
Content-Transfer-Encoding: quoted-printable
Date: Wed, 11 Nov 2026 19:23:05 +0000
X-Mailing-List: devicetree@vger.kernel.org
List-Id: <devicetree.vger.kernel.org>
List-Post: <mailto:devicetree@vger.kernel.org>
List-Help: <mailto:devicetree+help@vger.kernel.org>
List-Subscribe: <mailto:devicetree+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:devicetree+unsubscribe@vger.kernel.org>
List-Owner: <mailto:devicetree+owner@vger.kernel.org>
Precedence: list

Thank you for your contribution! Sashiko AI review found 10 potential
issues to consider:
- [High] phy: qcom: qusb2: unbalanced ref_clk accounting in
  qusb2_phy_init()
- [High] phy: qcom: qusb2: charger detection disables initialized PHY
- [High] phy: qcom: qusb2: PHY left enabled on USB_ROLE_NONE disconnect
- [High] phy: qcom: qusb2: missing teardown of work and role switches on
  unbind
- [High] phy: qcom: qusb2: missing Kconfig dependency on USB_ROLE_SWITCH
- [Medium] phy: qcom: qusb2: clock and regulator leak in
  qusb2_phy_init()
- [Medium] phy: qcom: qusb2: race between qusb2_role_switch_set() and
  work
- [Medium] phy: qcom: qusb2: mismatched register writes in
  qusb_phy_drive_dp_pulse()
- [Low] phy: qcom: qusb2: undocumented new members in struct qusb2_phy
  kernel-doc
- [Low] phy: qcom: qusb2: hardcoded charger name in
  qusb_phy_notify_charger()
--

commit 24edde049bf5427e2a864a633231dd8850451f54
Author: Krishna Kurapati <krishna.kurapati@oss.qualcomm.com>

phy: qcom: qusb2: Add charger detection support

This commit adds BC 1.2 charger detection to the QUSB2 PHY driver and
registers a USB role switch to intercept role transitions and forward
device mode to the controller only after detecting SDP or CDP.

> diff --git a/drivers/phy/qualcomm/phy-qcom-qusb2.c b/drivers/phy/qualcomm=
/phy-qcom-qusb2.c
> index 2e5fdb620cb2d..549dc8d1378a4 100644
> --- a/drivers/phy/qualcomm/phy-qcom-qusb2.c
> +++ b/drivers/phy/qualcomm/phy-qcom-qusb2.c
[ ... ]
> @@ -478,9 +536,425 @@ struct qusb2_phy {
>  	const struct qusb2_phy_cfg *cfg;
>  	bool has_se_clk_scheme;
>  	bool phy_initialized;
> +	bool is_phy_enabled;
>  	enum phy_mode mode;
> +	int vbus_active;
> +	int id_state;
> +	struct power_supply	*usb_psy;
> +	struct delayed_work	port_det_w;
> +	enum port_state		port_state;
> +	unsigned int		dcd_timeout;
> +	bool			dcp_charger;
> +
> +	struct usb_role_switch	*connector_role_sw;
> +	struct usb_role_switch	*controller_role_sw;
> +	enum usb_role		current_role;
> +	struct mutex		role_lock;
>  };

[Severity: Low]
struct qusb2_phy has a kernel-doc comment above it, so adding these 12
members without @member descriptions will trigger scripts/kernel-doc
warnings under W=3D1.

> +static int qusb_phy_notify_charger(struct qusb2_phy *qphy,
> +					enum power_supply_usb_type charger_type)
> +{
> +	union power_supply_propval pval =3D {0};
> +
> +	if (!qphy->usb_psy) {
> +		qphy->usb_psy =3D power_supply_get_by_name("pm4125-charger");
> +		if (!qphy->usb_psy) {
> +			dev_err(&qphy->phy->dev, "could not get usb power supply\n");
> +			return -ENODEV;
> +		}
> +	}

[Severity: Low]
Should this look up the charger power supply via a firmware reference
(such as devm_power_supply_get_by_reference()) instead of hardcoding
"pm4125-charger" in the generic QUSB2 PHY driver?  Any platform with
usb-role-switch enabled whose charger power supply uses a different name
will fail with -ENODEV here.

[ ... ]

> +static int qusb_phy_drive_dp_pulse(struct qusb2_phy *qphy)
> +{
> +	int ret;
> +
> +	dev_dbg(&qphy->phy->dev, "connected to a CDP, drive DP up\n");
> +
> +	ret =3D qusb2_phy_enable_phy(qphy);
> +	if (ret)
> +		return ret;
> +
> +	ret =3D reset_control_assert(qphy->phy_reset);
> +	if (ret)
> +		dev_err(&qphy->phy->dev, "phy assert failed\n");
> +	usleep_range(100, 150);
> +	ret =3D reset_control_deassert(qphy->phy_reset);
> +	if (ret)
> +		dev_err(&qphy->phy->dev, "phy deassert failed\n");
> +
> +	writel_relaxed(CLAMP_N_EN | FREEZIO_N | POWER_DOWN,
> +			qphy->base + qphy->cfg->regs[QUSB2PHY_PORT_POWERDOWN]);
> +	writel_relaxed(TERM_SELECT | XCVR_SELECT_FS | OP_MODE_NON_DRIVE |
> +			SUSPEND_N, qphy->base + QUSB2PHY_PORT_UTMI_CTRL1);
> +	writel_relaxed(UTMI_ULPI_SEL | UTMI_TEST_MUX_SEL,
> +			qphy->base + QUSB2PHY_PORT_UTMI_CTRL2);
> +	writel_relaxed(PLL_RESET_N_CNT_5,
> +			qphy->base + QUSB2PHY_PLL_AUTOPGM_CTL1);
> +	writel_relaxed(CLAMP_N_EN | FREEZIO_N,
> +			qphy->base + qphy->cfg->regs[QUSB2PHY_PORT_POWERDOWN]);
> +	writel_relaxed(REF_BUF_EN | REXT_EN | PLL_BYPASSNL | REXT_TRIM_0,
> +			qphy->base + QUSB2PHY_PLL_PWR_CTRL);
> +
> +	usleep_range(5, 10);
> +
> +	writel_relaxed(0x15, qphy->base + QUSB2PHY_PLL_AUTOPGM_CTL1);
> +	writel_relaxed(PLL_RESET_N | PLL_RESET_N_CNT_5,
> +			qphy->base + QUSB2PHY_PLL_AUTOPGM_CTL1);
> +	writel_relaxed(0x00, qphy->base + QUSB2PHY_PORT_QC1);
> +	writel_relaxed(0x00, qphy->base + QUSB2PHY_PORT_QC2);
> +
> +	usleep_range(50, 60);
> +
> +	writel_relaxed(RDP_UP_EN, qphy->base + QUSB2PHY_PORT_QC2);
> +
> +	msleep(DP_PULSE_WIDTH_MSEC);
> +
> +	writel_relaxed(CLAMP_N_EN | FREEZIO_N | POWER_DOWN,
> +			qphy->base + qphy->cfg->regs[QUSB2PHY_PORT_POWERDOWN]);
> +	writel_relaxed(PLL_AUTOPGM_EN | PLL_RESET_N | PLL_RESET_N_CNT_5,
> +			qphy->base + QUSB2PHY_PLL_AUTOPGM_CTL1);
> +	writel_relaxed(UTMI_ULPI_SEL, qphy->base + QUSB2PHY_PORT_UTMI_CTRL2);
> +	writel_relaxed(TERM_SELECT, qphy->base + QUSB2PHY_PORT_UTMI_CTRL1);
> +
> +	qusb2_phy_disable_phy(qphy);
> +
> +	return 0;
> +}

[Severity: Medium]
Are the register values and relaxed writes in qusb_phy_drive_dp_pulse()
intended?

The bring-up sequence in qusb_phy_chg_det_enable_seq() writes 0x17 to
QUSB2PHY_PLL_PWR_CTRL, whereas REF_BUF_EN | REXT_EN | PLL_BYPASSNL |
REXT_TRIM_0 evaluates to 0x53 because REF_BUF_EN is defined as BIT(6)
rather than BIT(2).  Below that, QUSB2PHY_PLL_AUTOPGM_CTL1 is written
twice with 0x15 (raw 0x15 followed by PLL_RESET_N | PLL_RESET_N_CNT_5),
and the four teardown writes at the end use writel_relaxed() without a
readback flush right before qusb2_phy_disable_phy() gates cfg_ahb_clk.

[ ... ]

> +	case PORT_PRIMARY_IN_PROGRESS:
> +		if (!qphy->vbus_active) {
> +			dev_dbg(&qphy->phy->dev, "VBUS lost during primary detection, abortin=
g\n");
> +			qusb2_phy_disable_phy(qphy);
> +			qphy->port_state =3D PORT_DISCONNECTED;
> +			break;
> +		}
> +
> +		status =3D qusb_phy_chg_det_status(qphy, STATE_PRIMARY);
> +		if (status) {
> +			dev_dbg(&qphy->phy->dev,
> +				"primary detection positive, starting secondary detection\n");
> +			qusb_phy_chg_det_enable_seq(qphy, STATE_SECONDARY);
> +			qphy->port_state =3D PORT_SECONDARY_IN_PROGRESS;
> +			delay =3D CHG_SECONDARY_DET_TIME_MSEC;
> +
> +		} else {
> +			dev_dbg(&qphy->phy->dev, "charger detected: SDP (standard USB host)\n=
");
> +			qusb2_phy_disable_phy(qphy);
> +			qusb_phy_notify_charger(qphy, POWER_SUPPLY_USB_TYPE_SDP);
> +			qusb2_phy_forward_role(qphy, USB_ROLE_DEVICE);
> +			qphy->port_state =3D PORT_CHG_DET_DONE;
> +		}
> +		break;

[Severity: High]
What happens when charger detection runs after the USB controller has
already called phy_init()?

Controller drivers such as dwc3 call phy_init() -> qusb2_phy_init() during
probe, which sets qphy->is_phy_enabled =3D true and qphy->phy_initialized =
=3D
true.  When USB_ROLE_DEVICE later triggers qusb_phy_port_state_work(),
qusb_phy_chg_det_enable_seq() overwrites the operational PHY registers (and
qusb_phy_drive_dp_pulse() resets the PHY on CDP), and then
qusb2_phy_disable_phy() disables all clocks and regulators while
qphy->phy_initialized remains true.  Forwarding USB_ROLE_DEVICE then puts
the controller into device mode with a powered-down, unconfigured PHY, and
a subsequent qusb2_phy_runtime_suspend() or qusb2_phy_exit() will access
MMIO registers with cfg_ahb_clk and regulators disabled.

[ ... ]

> @@ -767,29 +1241,16 @@ static int qusb2_phy_init(struct phy *phy)
> =20
>  	dev_vdbg(&phy->dev, "%s(): Initializing QUSB2 phy\n", __func__);
> =20
> -	/* turn on regulator supplies */
> -	ret =3D regulator_bulk_enable(ARRAY_SIZE(qphy->vregs), qphy->vregs);
> +	/* Power up regulators and enable clocks (including ref_clk if needed).=
 */
> +	ret =3D qusb2_phy_enable_phy(qphy);
>  	if (ret)
>  		return ret;
> =20
> -	ret =3D clk_prepare_enable(qphy->iface_clk);
> -	if (ret) {
> -		dev_err(&phy->dev, "failed to enable iface_clk, %d\n", ret);
> -		goto poweroff_phy;
> -	}
> -
> -	/* enable ahb interface clock to program phy */
> -	ret =3D clk_prepare_enable(qphy->cfg_ahb_clk);
> -	if (ret) {
> -		dev_err(&phy->dev, "failed to enable cfg ahb clock, %d\n", ret);
> -		goto disable_iface_clk;
> -	}
> -
>  	/* Perform phy reset */
>  	ret =3D reset_control_assert(qphy->phy_reset);
>  	if (ret) {
>  		dev_err(&phy->dev, "failed to assert phy_reset, %d\n", ret);
> -		goto disable_ahb_clk;
> +		return ret;
>  	}

[Severity: Medium]
Does returning directly when reset_control_assert() fails leak the clocks
and regulators enabled by qusb2_phy_enable_phy() and leave
qphy->is_phy_enabled set to true?

>  	/* 100 us delay to keep PHY in reset mode */
>  	usleep_range(100, 150);
> =20
>  	ret =3D reset_control_deassert(qphy->phy_reset);
>  	if (ret) {
>  		dev_err(&phy->dev, "failed to de-assert phy_reset, %d\n", ret);
> -		goto disable_ahb_clk;
> +		goto assert_phy_reset;
>  	}
> =20
>  	/* Disable the PHY */
> @@ -887,23 +1348,15 @@ static int qusb2_phy_init(struct phy *phy)
>  		dev_err(&phy->dev,
>  			"QUSB2PHY pll lock failed: status reg =3D %x\n", val);
>  		ret =3D -EBUSY;
> -		goto disable_ref_clk;
> +		goto assert_phy_reset;
>  	}
>  	qphy->phy_initialized =3D true;
> =20
>  	return 0;
> =20
> -disable_ref_clk:
> -	if (!qphy->has_se_clk_scheme)
> -		clk_disable_unprepare(qphy->ref_clk);
>  assert_phy_reset:
>  	reset_control_assert(qphy->phy_reset);
> -disable_ahb_clk:
> -	clk_disable_unprepare(qphy->cfg_ahb_clk);
> -disable_iface_clk:
> -	clk_disable_unprepare(qphy->iface_clk);
> -poweroff_phy:
> -	regulator_bulk_disable(ARRAY_SIZE(qphy->vregs), qphy->vregs);
> +	qusb2_phy_disable_phy(qphy);
> =20
>  	return ret;
>  }

[Severity: High]
Does moving clk_prepare_enable(qphy->ref_clk) into qusb2_phy_enable_phy()
unbalance ref_clk across both single-ended and differential clock
platforms?

qphy->has_se_clk_scheme starts as false and is only determined halfway
through qusb2_phy_init() from cfg->se_clk_scheme_default and qphy->tcsr:

drivers/phy/qualcomm/phy-qcom-qusb2.c:qusb2_phy_init() {
    ...
	qphy->has_se_clk_scheme =3D cfg->se_clk_scheme_default;
    ...
	if (!qphy->has_se_clk_scheme) {
		ret =3D clk_prepare_enable(qphy->ref_clk);
    ...
}

Because qusb2_phy_enable_phy() runs at the start of qusb2_phy_init() (or
earlier during charger detection) while qphy->has_se_clk_scheme is still
false, it always enables ref_clk.  On single-ended platforms,
qusb2_phy_init() then sets qphy->has_se_clk_scheme =3D true, so
qusb2_phy_exit() and qusb2_phy_disable_phy() both skip disabling ref_clk
and leak the enable reference.  On differential platforms,
qusb2_phy_init() still calls clk_prepare_enable(qphy->ref_clk) a second
time, leaving ref_clk enabled twice so qusb2_phy_runtime_suspend() cannot
gate it and the assert_phy_reset error path leaks one reference.

[ ... ]

> +static int qusb2_role_switch_set(struct usb_role_switch *sw, enum usb_ro=
le role)
> +{
[ ... ]
> +	switch (role) {
> +	case USB_ROLE_DEVICE:
> +		/*
> +		 * VBUS is active; start charger detection.  The state machine
> +		 * will forward USB_ROLE_DEVICE controller only for SDP/CDP.
> +		 */
> +		qphy->vbus_active =3D 1;
> +		qphy->id_state =3D 1;
> +		qphy->port_state =3D PORT_UNKNOWN;
> +		queue_delayed_work(system_freezable_wq, &qphy->port_det_w, 0);
> +		break;
> +	case USB_ROLE_HOST:
> +		qphy->id_state =3D 0;
> +		qphy->vbus_active =3D 0;
> +		qphy->port_state =3D PORT_UNKNOWN;
> +		queue_delayed_work(system_freezable_wq, &qphy->port_det_w, 0);
> +		break;
> +	case USB_ROLE_NONE:
> +	default:
> +		qphy->vbus_active =3D 0;
> +		qphy->id_state =3D 1;
> +		cancel_delayed_work(&qphy->port_det_w);
> +		qusb2_phy_forward_role(qphy, USB_ROLE_NONE);
> +		break;
> +	}
> +	mutex_unlock(&qphy->role_lock);
> +
> +	return 0;
> +}

[Severity: High]
Does canceling port_det_w on USB_ROLE_NONE prevent the disconnect cleanup
in qusb_phy_port_state_work() from ever running?

When a DCP charger is detected in PORT_SECONDARY_IN_PROGRESS, the PHY is
left enabled with qphy->dcp_charger =3D true, and PORT_CHG_DET_DONE returns
once while qphy->vbus_active is 1 without re-queuing port_det_w.  When the
cable is unplugged (either after DCP detection or mid-detection in
PORT_DCD_IN_PROGRESS / PORT_PRIMARY_IN_PROGRESS /
PORT_SECONDARY_IN_PROGRESS), USB_ROLE_NONE sets qphy->vbus_active =3D 0 and
calls cancel_delayed_work(&qphy->port_det_w) instead of running the state
machine or calling qusb2_phy_disable_phy(), leaving the PHY clocks,
regulators, and DP/DM detection circuits enabled and qphy->dcp_charger set
to true.

[Severity: Medium]
Can qusb2_role_switch_set() also race with an already-running
qusb_phy_port_state_work()?

CPU0                                      CPU1 (kworker)
qusb_phy_port_state_work()
  case PORT_SECONDARY_IN_PROGRESS:
    qusb_phy_drive_dp_pulse()
      msleep(DP_PULSE_WIDTH_MSEC)
qusb2_role_switch_set(USB_ROLE_NONE)
  mutex_lock(&qphy->role_lock)
  qphy->vbus_active =3D 0
  cancel_delayed_work(&qphy->port_det_w)
  qusb2_phy_forward_role(USB_ROLE_NONE)
  mutex_unlock(&qphy->role_lock)
                                          qusb2_phy_forward_role(USB_ROLE_D=
EVICE)
                                            <-- stale role forwarded after =
NONE
                                          qphy->port_state =3D PORT_CHG_DET=
_DONE

qusb_phy_port_state_work() does not acquire qphy->role_lock, and
cancel_delayed_work() does not wait for an executing work item to finish,
so a disconnect during the 200 ms sleep in qusb_phy_drive_dp_pulse() (or
in qusb_phy_chg_det_enable_seq()) allows the worker to overwrite
qphy->port_state and forward a stale USB_ROLE_DEVICE after USB_ROLE_NONE.

[ ... ]

> @@ -1131,7 +1651,29 @@ static int qusb2_phy_probe(struct platform_device =
*pdev)
> =20
>  	phy_provider =3D devm_of_phy_provider_register(dev, of_phy_simple_xlate=
);
> =20
> -	return PTR_ERR_OR_ZERO(phy_provider);
> +	if (IS_ERR(phy_provider))
> +		return PTR_ERR(phy_provider);
> +
> +	mutex_init(&qphy->role_lock);
> +	INIT_DELAYED_WORK(&qphy->port_det_w, qusb_phy_port_state_work);
> +
> +	if (device_property_read_bool(dev, "usb-role-switch")) {
> +		struct usb_role_switch_desc role_sw_desc =3D {};
> +
> +		role_sw_desc.fwnode =3D dev->fwnode;
> +		role_sw_desc.set =3D qusb2_role_switch_set;
> +		role_sw_desc.driver_data =3D qphy;
> +
> +		qphy->connector_role_sw =3D usb_role_switch_register(dev, &role_sw_des=
c);
> +		if (IS_ERR(qphy->connector_role_sw)) {
> +			ret =3D PTR_ERR(qphy->connector_role_sw);
> +			dev_err(dev, "failed to register role switch, %d\n", ret);
> +			return ret;
> +		}
> +	}
> +	qphy->controller_role_sw =3D NULL;
> +
> +	return 0;
>  }

[Severity: High]
Does PHY_QCOM_QUSB2 in drivers/phy/qualcomm/Kconfig need a dependency on
or selection of USB_ROLE_SWITCH?

With CONFIG_PHY_QCOM_QUSB2=3Dy and CONFIG_USB_ROLE_SWITCH=3Dm, vmlinux fails
to link with undefined references to usb_role_switch_register(),
usb_role_switch_get(), usb_role_switch_set_role(),
usb_role_switch_get_drvdata(), and usb_role_string().  In addition, when
CONFIG_USB_ROLE_SWITCH=3Dn, the usb_role_switch_register() stub returns
ERR_PTR(-ENODEV), failing probe for any QUSB2 PHY node with the
usb-role-switch property.

[Severity: High]
What cleans up connector_role_sw, port_det_w, controller_role_sw, and
usb_psy when the driver is unbound?

qusb2_phy_driver has no .remove callback and registers no devm cleanup
actions for these resources.  Unbinding the device leaves
qphy->connector_role_sw registered and qphy->port_det_w queued or running
after devm frees qphy and unmaps qphy->base (causing a use-after-free),
and leaks the references acquired via usb_role_switch_get() and
power_supply_get_by_name().

--=20
Sashiko AI review =C2=B7 https://sashiko.dev/#/patchset/20261111-shikra-qus=
b2-charger-det-v1-0-5a9d919c66b5@oss.qualcomm.com?part=3D2
