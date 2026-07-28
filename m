Received: from smtp.kernel.org (aws-us-west-2-korg-mail-alma10-1.taild15c8.ts.net [100.103.45.18])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 840AC43B6C1
	for <devicetree@vger.kernel.org>; Tue, 28 Jul 2026 14:12:18 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=100.103.45.18
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1785247940; cv=none; b=qqZXZbtCuolirntf5/mumun4Cg/I5mRrJOJ3Xca7yYSLcpm0gSQ65j+qpKyd6wIdU19LzX43hpagJbwEZ9sUbmsFRA5w++EVVGqTzW67kf8cEkJfX+KTE/6SWnSSdAN7QzIwdKRSq1VQ7LjWXqb8EayOz/1JG4JTOQRvIo8svCw=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1785247940; c=relaxed/simple;
	bh=62kuwjocLrUnoVOf5/eicxyqK3kTYc6p1Ow4adLIsC4=;
	h=From:Subject:To:Cc:In-Reply-To:References:Content-Type:Date:
	 Message-Id; b=irEoaOQPKLZAADj5Yw9wgFPdHCZr2v3nZZwQW1feIuCoC0Qh35yZzVE6RcDooFJv+LmCHf0I3/EZLOFKDO2tJDDMFJX3WbYJvVWTMH8RtCl6ILKKsnp1ZDjTrD4os12qnQIFLQGsauMISlj71PGa/iz+N3YRM/QetUc8Ic1+yRE=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=Enm8fH44; arc=none smtp.client-ip=100.103.45.18
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="Enm8fH44"
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 1B3681F00A3A;
	Tue, 28 Jul 2026 14:12:18 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kernel.org;
	s=k20260515; t=1785247938;
	bh=sLLBWCxyy1dxejINKwbC0dvDxrkddTOZm4pWlH1Iduc=;
	h=From:Subject:Reply-To:To:Cc:In-Reply-To:References:Date;
	b=Enm8fH44sIqzjRuEVPM4xrDSvQTvub9auz5ied6e9CIXqcVyeEyQWaarT3PUiZ52q
	 M+zekStcRtaBsK/mO1wyrnw6YLaIa36W1JscbYdpDXCpyFaeG0bw+0lKC4Rccd46mZ
	 nv/g/cVSSHGuxNP/GRuFsw7A4EslamFKXfl9/J6Czea4l9JjkvvtlLkNeVa/Gf+01j
	 SvqTAl5dqw/twvj9BxKLhy5V1jYcyrSJV+gOZWHB76UFqeDMrAHQa68+GZiUVut6ok
	 2bGc42odY+gsQo7MuIDkRkZRTb5TES0ozhQOtEa3STylQkazGOUTon32atMMTHJmb5
	 wRriQgOIIQ9yA==
From: sashiko-bot@kernel.org
Subject: Re: [PATCH 3/6] ptp: qcom: Add PTP driver for the Qualcomm TSC
 hardware
Reply-To: sashiko-reviews@lists.linux.dev
To: "Imran Shaik" <imran.shaik@oss.qualcomm.com>
Cc: devicetree@vger.kernel.org, robh@kernel.org, conor+dt@kernel.org
In-Reply-To: <20260727-tscss-v1-3-beed14e72510@oss.qualcomm.com>
References: <20260727-tscss-v1-0-beed14e72510@oss.qualcomm.com>
 <20260727-tscss-v1-3-beed14e72510@oss.qualcomm.com>
Content-Type: text/plain; charset=utf-8
Content-Transfer-Encoding: quoted-printable
Date: Tue, 28 Jul 2026 14:12:17 +0000
Message-Id: <20260728141218.1B3681F00A3A@smtp.kernel.org>
Precedence: bulk
X-Mailing-List: devicetree@vger.kernel.org
List-Id: <devicetree.vger.kernel.org>
List-Subscribe: <mailto:devicetree+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:devicetree+unsubscribe@vger.kernel.org>

Thank you for your contribution! Sashiko AI review found 5 potential issue(=
s) to consider:
- [High] The `adjfine` implementation improperly applies a one-shot phase s=
hift and fails to clear adjustments on zero, rather than configuring contin=
uous frequency modification.
- [High] The hardware fallback path for `adjtime` physically stops the hard=
ware counter, causing lost ticks and non-deterministic negative phase drift.
- [High] Sequential 32-bit reads of the 64-bit hardware counter lack a retr=
y loop, exposing severe backwards time jumps during rollover.
- [High] The `adjfine` drift calculation silently drops small negative adju=
stments by computing a period of zero.
- [Medium] The `PULSE_WIDTH_MASK` configuration in `qcom_tsc_settime()` is =
corrupted by a missing bitwise clear before applying `FIELD_PREP`.
--

--- Patch [3]: [PATCH 3/6] ptp: qcom: Add PTP driver for the Qualcomm TSC h=
ardware ---
commit df14ad1f19420dd656de996ed9674c4b2511975f
Author: Imran Shaik <imran.shaik@oss.qualcomm.com>

ptp: qcom: Add PTP driver for the Qualcomm TSC hardware

Add a PTP Hardware Clock driver for the Qualcomm Timestamp Counter (TSC)
hardware found on Qualcomm Lemans and QDU1000 SoCs. The TSC is a free
running hardware counter used for time synchronization, clocked by an AHB
configuration clock and a global counter clock.

> diff --git a/drivers/ptp/ptp_qcom_tsc.c b/drivers/ptp/ptp_qcom_tsc.c
> new file mode 100644
> index 0000000000000..b29248150388f
> --- /dev/null
> +++ b/drivers/ptp/ptp_qcom_tsc.c

[ ... ]

> +static int qcom_tsc_read_time(struct qcom_tsc *tsc, struct timespec64 *t=
s)
> +{
> +	const struct qcom_tsc_regs *regs =3D tsc->soc->reg_layout;
> +	u32 hi, lo;
> +
> +	if (!qcom_tsc_is_enabled(tsc))
> +		return -EINVAL;
> +
> +	hi =3D readl_relaxed(tsc->base + regs->read_cntcv_hi);
> +	lo =3D readl_relaxed(tsc->base + regs->read_cntcv_lo);

[Severity: High]
Does this sequential read risk returning backward time jumps during rollove=
r?

If the lower 32-bit register rolls over between reading the upper and
lower registers, could this return a stale upper half combined with a
wrapped lower half? Is a retry loop needed here to ensure consistency?

> +
> +	if (tsc->soc->rollover) {
> +		ts->tv_sec =3D hi;
> +		ts->tv_nsec =3D lo;
> +	} else {
> +		u64 ns =3D ((u64)hi << NSEC_SHIFT) | lo;
> +
> +		*ts =3D ns_to_timespec64(ns);
> +	}
> +
> +	return 0;
> +}

[ ... ]

> +static int qcom_tsc_update_offset(struct qcom_tsc *tsc, const struct tim=
espec64 ts)
> +{
> +	const struct qcom_tsc_regs *regs =3D tsc->soc->reg_layout;
> +	struct timespec64 tod;
> +	u32 regval, hi, lo;
> +	int ret;
> +
> +	if (tsc->soc->offset_correction) {
> +		qcom_tsc_split_ts(tsc, ts, &hi, &lo);
> +
> +		writel_relaxed(lo, tsc->base + regs->offset_lo);
> +		writel_relaxed(hi, tsc->base + regs->offset_hi);
> +
> +		return 0;
> +	}
> +
> +	/*
> +	 * No hardware offset correction support: disable and reload the
> +	 * counter with the corrected time, as recommended by the hardware
> +	 * design team.
> +	 */
> +	ret =3D qcom_tsc_read_time(tsc, &tod);
> +	if (ret)
> +		return ret;
> +
> +	regval =3D readl_relaxed(tsc->base + regs->control_cntcr);
> +	regval &=3D ~BIT(0);
> +	writel_relaxed(regval, tsc->base + regs->control_cntcr);

[Severity: High]
Does disabling the counter during the update permanently lose hardware tick=
s?

When the software update occurs on SoCs without hardware offset correction,
the time elapsed between reading the time and disabling the counter seems to
be permanently dropped. Could this introduce negative drift and jitter on
each call to adjtime?

> +
> +	return qcom_tsc_update_counter(tsc, timespec64_add(tod, ts));
> +}

[ ... ]

> +static int qcom_tsc_settime(struct ptp_clock_info *ptp, const struct tim=
espec64 *ts)
> +{
> +	struct qcom_tsc *tsc =3D container_of(ptp, struct qcom_tsc, ptp_info);
> +	const struct qcom_tsc_regs *regs =3D tsc->soc->reg_layout;
> +	struct timespec64 tod;
> +	u32 regval;
> +	int ret;
> +
> +	mutex_lock(&tsc->lock);
> +
> +	if (qcom_tsc_is_enabled(tsc)) {
> +		qcom_tsc_read_time(tsc, &tod);
> +		ret =3D qcom_tsc_update_offset(tsc, timespec64_sub(*ts, tod));
> +		mutex_unlock(&tsc->lock);
> +		return ret;
> +	}
> +
> +	/* Configure and enable the TSC counter */
> +	regval =3D readl_relaxed(tsc->base + regs->control_cntcr);
> +	regval |=3D FIELD_PREP(PULSE_WIDTH_MASK, tsc->soc->pulse_width);
> +	writel_relaxed(regval, tsc->base + regs->control_cntcr);

[Severity: Medium]
Should the PULSE_WIDTH_MASK bits be cleared before applying the bitwise OR?

If there are previous bits set in this field, could the bitwise OR without
a preceding bitwise clear leave those bits set and corrupt the pulse width
configuration?

> +
> +	if (tsc->soc->rollover)
> +		writel_relaxed(ROLLOVER_VAL, tsc->base + regs->rollover_val);
> +
> +	ret =3D qcom_tsc_update_counter(tsc, *ts);
> +	mutex_unlock(&tsc->lock);
> +
> +	return ret;
> +}

[ ... ]

> +static int qcom_tsc_drift_correction(struct qcom_tsc *tsc, long scaled_p=
pm)
> +{
> +	const struct qcom_tsc_soc_data *soc =3D tsc->soc;
> +	const struct qcom_tsc_regs *regs =3D soc->reg_layout;
> +	long ppb =3D scaled_ppm_to_ppb(scaled_ppm);
> +	u64 period, incval =3D 0;
> +	u32 regval =3D 0, subperiod;
> +
> +	if (ppb < 0) {
> +		ppb =3D -ppb;
> +		regval &=3D ~DRIFT_JUMP_SWALLOW;
> +
> +		period =3D div_u64(ppb, soc->cntr_res);
> +		if (period >=3D DRIFT_MAX_RES)
> +			period =3D DRIFT_MAX_RES;
> +	} else {

[Severity: High]
Does this calculation silently drop small negative adjustments?

When ppb is less than zero and its absolute value is smaller than
soc->cntr_res, div_u64 will evaluate to 0.=20

Since the negative branch lacks the fallback to period =3D 1 that the posit=
ive
branch has, does this result in a period of 0 being written to hardware for
fine-grained negative frequency adjustments?

> +		regval |=3D DRIFT_JUMP_SWALLOW;
> +
> +		period =3D div_u64(ppb, soc->cntr_res);
> +		if (period >=3D DRIFT_MAX_RES) {
> +			period =3D DRIFT_MAX_RES;
> +			incval =3D soc->cntr_res * 2;
> +		} else if (ppb < soc->cntr_res) {
> +			incval =3D soc->cntr_res + ppb;
> +			period =3D 1;
> +		} else {
> +			incval =3D soc->cntr_res * 2;
> +		}
> +	}
> +
> +	subperiod =3D soc->pulse_width * 2;
> +	regval |=3D FIELD_PREP(DRIFT_SUBPERIOD_MASK, subperiod);
> +	regval |=3D FIELD_PREP(DRIFT_PERIOD_MASK, period);
> +
> +	/* Update jump/swallow, period, subperiod */
> +	writel_relaxed(regval, tsc->base + regs->drift_correct_duration);
> +
> +	writel_relaxed(incval, tsc->base + regs->drift_correct_incr_val);
> +
> +	/* Trigger the drift correction */
> +	regval =3D readl_relaxed(tsc->base + regs->drift_correct_cmd);
> +	regval |=3D BIT(0);
> +	writel_relaxed(regval, tsc->base + regs->drift_correct_cmd);
> +
> +	return readl_poll_timeout(tsc->base + regs->drift_correct_cmd, regval,
> +				  !(regval & BIT(1)), DRIFT_INTERVAL_US,
> +				  DRIFT_TIMEOUT_US(period, subperiod, soc->cntr_res));
> +}

[Severity: High]
Does this trigger a one-shot phase shift instead of continuous drift correc=
tion?

The ptp daemon expects adjfine to configure a continuous hardware clock rate
adjustment. Since this block triggers a correction and polls for completion,
does the hardware just return to its nominal rate afterwards?

Will the ptp synchronization servo fail to stabilize if the frequency is not
actually adjusted continuously?

> +
> +static int qcom_tsc_adjfine(struct ptp_clock_info *ptp, long scaled_ppm)
> +{
> +	struct qcom_tsc *tsc =3D container_of(ptp, struct qcom_tsc, ptp_info);
> +	int ret;
> +
> +	if (scaled_ppm =3D=3D 0)
> +		return 0;

[Severity: High]
Does an early exit on zero scaled_ppm leave the hardware at its previous ra=
te?

When the ptp daemon attempts to clear adjustments by passing 0, returning
early prevents any hardware commands from halting ongoing adjustments. Shou=
ld
this reset the hardware to its nominal frequency before returning?

> +
> +	mutex_lock(&tsc->lock);
> +	ret =3D qcom_tsc_drift_correction(tsc, scaled_ppm);
> +	mutex_unlock(&tsc->lock);
> +
> +	return ret;
> +}

--=20
Sashiko AI review =C2=B7 https://sashiko.dev/#/patchset/20260727-tscss-v1-0=
-beed14e72510@oss.qualcomm.com?part=3D3
