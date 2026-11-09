Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=100.103.45.18
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1794230395;
	b=m8VlRZyMktUmKD9vTv203677UiqBK6Lq8NaguoWNWkv0Iwke++yLcKjFPsQouswHe7Xa
	 9hnzi8jZE95VecLOdFNMxkSKyRgtpx3Anc5ncOvmS10Cs8eBGc9z4lBxEdh7ygm/NRp10
	 msg1SUERVgiphoUkJnu4Sh2/J1UJu7kZ6m0Hik1BP6/tEoWq9XvAwyD3oHIQxDmaLwVBN
	 dgeflA2QEyERyvrsTQ2CZfvcmez6R0C8pmHv4QqlN3VU5MPhrUS531Sxhv4JBwAtfuPhX
	 eOyT+e3qU7y5FViDc7cO2p/VJDnVlqrj+89ujx9W/n++jvwEw1xLxLJmGi0Imq2wK0Q==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1794230395;
	h=Received:DKIM-Signature:Message-ID:From:Subject:Reply-To:To:Cc:
	 In-Reply-To:References:Content-Type:Content-Transfer-Encoding:Date;
	bh=oNN61QSChnRW31lCd9QNPKqvXpS73d+RBKqq0sjNU/o=;
	b=D2d65jhbrnKrnSwmHpmMK18ulHRPIyPNDwylJJ60oZTeK+WcPeolMpuxxOG26BUBUGTQ
	 6j3L6+v0JC7Hxri8V+01p8DNn0936+nMPiYx4nb4rr7zPCpjej4QCV/AngsVQjA6whTmA
	 qJfzhap9U+8sueWZXW+Cywi4LuylK0AL56xIwljfo82GfwNGOlMbFIImGuFCMW9fmwsq2
	 t8VFGIQ8qUJ8Z0qezyrEeq5mL4s33+rAvW/yahNW5xlIo9HnNmk7L/kMlXbwSnYJReI33
	 1GjiF7Kg3Goel8mx8sz52pivvFoPJ4PO0bEzC60OdsMer3k8e8ufNhiYITCATdIcDdg==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dkim=pass header.d=kernel.org header.i=@kernel.org header.a=rsa-sha256 header.s=k20260515 header.b=cvM6HmRI;
	arc=none smtp.remote-ip=100.103.45.18
Received: from smtp.kernel.org (quasi.space.kernel.org [100.103.45.18])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id D3C7E606A330
	for <devicetree@vger.kernel.org>; Mon,  9 Nov 2026 13:19:54 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.a=rsa-sha256 header.s=k20260515 header.b=cvM6HmRI
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 7C9561F0089F;
	Mon,  9 Nov 2026 13:19:54 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kernel.org;
	s=k20260515; t=1794230394;
	bh=oNN61QSChnRW31lCd9QNPKqvXpS73d+RBKqq0sjNU/o=;
	h=From:Subject:Reply-To:To:Cc:In-Reply-To:References:Date;
	b=cvM6HmRImGxeQrfhZ+6w/O/ucecao9Af0x0D2CoIR1JZ32ZyTxJqer4zo9zkVdbtQ
	 iALxyM8cQkkgK2YAVQCiQQMJYbSEkQS/BsK81+RvGf5OtcxD3H3cUOIFLVE8elMPus
	 hBQuskBMZWLBSYlMk6Mfms3ifIHGrM5Bbd98szfPU9xMCqwHyeCJ82fwpMncGfUGjL
	 PN8XoKjqJ2aUz0Wm7DHgU/m/msXVYbxHSGo6ja+pIDJx/PpFjT+Xkb909INCz1laTF
	 d4jWMIGRUoeBfi0Xfiz+FskCYv7TLkoLlywkoF2xUbJH2RsJbbSDktrt7jQX08DpI0
	 z+8k5ZKlXrlCQ==
Message-ID: <sashiko-outbox-205001@kernel.org>
From: sashiko-bot@kernel.org
Subject: Re: [PATCH v2 04/10] ptp: qcom: Add PTP driver for the Qualcomm TSC
 hardware
Reply-To: sashiko-reviews@lists.linux.dev
To: "Imran Shaik" <imran.shaik@oss.qualcomm.com>
Cc: devicetree@vger.kernel.org, robh@kernel.org, conor+dt@kernel.org
In-Reply-To: <20261108-tscss-v2-4-d5f575010427@oss.qualcomm.com>
References: <20261108-tscss-v2-0-d5f575010427@oss.qualcomm.com>
 <20261108-tscss-v2-4-d5f575010427@oss.qualcomm.com>
Content-Type: text/plain; charset=utf-8
Content-Transfer-Encoding: quoted-printable
Date: Mon, 09 Nov 2026 13:19:54 +0000
X-Mailing-List: devicetree@vger.kernel.org
List-Id: <devicetree.vger.kernel.org>
List-Post: <mailto:devicetree@vger.kernel.org>
List-Help: <mailto:devicetree+help@vger.kernel.org>
List-Subscribe: <mailto:devicetree+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:devicetree+unsubscribe@vger.kernel.org>
List-Owner: <mailto:devicetree+owner@vger.kernel.org>
Precedence: list

Thank you for your contribution! Sashiko AI review found 4 potential
issues to consider:
- [High] ptp: qcom: torn 64-bit counter read in qcom_tsc_read_time() on
  rollover
- [High] ptp: qcom: period truncated to 0 for small negative ppb in
  adjfine()
- [Medium] ptp: qcom: ahb_clk and devres leak in
  qcom_tsc_enable_clocks() on error
- [Medium] ptp: qcom: uninitialized clock at probe and skipped config in
  qcom_tsc_settime()
--

commit 9c266c0baa9449c0c5ca7b1a7e003c4cbd0cb88b
Author: Imran Shaik <imran.shaik@oss.qualcomm.com>

ptp: qcom: Add PTP driver for the Qualcomm TSC hardware

This commit adds a PTP Hardware Clock driver for the Qualcomm Timestamp
Counter (TSC) hardware on SA8775P, QDU1000, and Nord SoCs.

> diff --git a/drivers/ptp/ptp_qcom_tsc.c b/drivers/ptp/ptp_qcom_tsc.c
> new file mode 100644
> index 0000000000000..82ddbdd63389d
> --- /dev/null
> +++ b/drivers/ptp/ptp_qcom_tsc.c
> @@ -0,0 +1,598 @@

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
Can read_cntcv_lo roll over between reading read_cntcv_hi and
read_cntcv_lo?  If the lower word wraps between the two 32-bit reads, the
old upper word is paired with the post-rollover lower word, returning a
timestamp that jumps backward by 1 second (when rollover is true) or ~4.295
seconds (when rollover is false).  Because qcom_tsc_settime() and
qcom_tsc_update_offset() call qcom_tsc_read_time() to compute the delta or
new counter value written back to the hardware, a torn read during
settime64() or adjtime() also permanently shifts the hardware clock.
Re-reading read_cntcv_hi in a loop until two consecutive upper-word reads
match would avoid this.

[ ... ]

> +static int qcom_tsc_enable_clocks(struct qcom_tsc *tsc)
> +{
> +	int ret;
> +
> +	if (tsc->clocks_enabled)
> +		return 0;
> +
> +	ret =3D clk_prepare_enable(tsc->ahb_clk);
> +	if (ret)
> +		return ret;
> +
> +	ret =3D devm_add_action_or_reset(tsc->dev, qcom_tsc_clk_disable, tsc->a=
hb_clk);
> +	if (ret)
> +		return ret;
> +
> +	ret =3D clk_prepare_enable(tsc->cntr_clk);
> +	if (ret)
> +		return ret;
> +
> +	ret =3D devm_add_action_or_reset(tsc->dev, qcom_tsc_clk_disable, tsc->c=
ntr_clk);
> +	if (ret)
> +		return ret;
> +
> +	tsc->clocks_enabled =3D true;
> +
> +	return 0;
> +}

[Severity: Medium]
If enabling tsc->cntr_clk or registering its devm action fails here, does
tsc->ahb_clk remain enabled with tsc->clocks_enabled still false?  Because
qcom_tsc_enable_clocks() runs from the runtime .settime64 callback rather
than probe, returning an error does not unwind devres actions on tsc->dev,
and each subsequent qcom_tsc_settime() call will prepare_enable
tsc->ahb_clk and queue another devres action again.

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
> +	if (ppb =3D=3D 0)
> +		return 0;
> +
> +	if (ppb < 0) {
> +		ppb =3D -ppb;
> +		regval &=3D ~DRIFT_JUMP_SWALLOW;
> +
> +		period =3D div_u64(ppb, soc->cntr_res);
> +		if (period >=3D DRIFT_MAX_RES)
> +			period =3D DRIFT_MAX_RES;
> +	} else {
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

[Severity: High]
Does the negative ppb branch truncate period to 0 when 0 < -ppb <
soc->cntr_res (for example, -63 <=3D ppb <=3D -1 on SA8775P where cntr_res =
is
64)?  Unlike the positive branch, which clamps period to 1 and adjusts
incval when ppb < soc->cntr_res, the negative branch leaves period =3D 0 and
incval =3D 0 and triggers drift_correct_cmd with a zero period, dropping fi=
ne
negative frequency adjustments during PTP synchronization.

[ ... ]

> +static int qcom_ptp_tsc_probe(struct platform_device *pdev)
> +{

[ ... ]

> +	/* Both clocks are enabled on first use, when the counter is set */
> +	tsc->ahb_clk =3D devm_clk_get(&pdev->dev, "ahb");
> +	if (IS_ERR(tsc->ahb_clk))
> +		return PTR_ERR(tsc->ahb_clk);
> +
> +	tsc->cntr_clk =3D devm_clk_get(&pdev->dev, "cntr");
> +	if (IS_ERR(tsc->cntr_clk))
> +		return PTR_ERR(tsc->cntr_clk);
> +
> +	tsc->ptp_info =3D qcom_ptp_info;
> +
> +	tsc->ptp =3D ptp_clock_register(&tsc->ptp_info, &pdev->dev);

[Severity: Medium]
Should the clocks and hardware counter be initialized before
ptp_clock_register() exposes the PHC?  Because tsc->clocks_enabled starts
as false and the counter is only enabled in qcom_tsc_settime(), any
gettime64(), adjtime(), adjfine(), or virtual clock creation
(n_vclocks_store() -> ptp_vclock_register()) fails with -EINVAL until
userspace calls clock_settime().  In addition, if BIT(0) in control_cntcr
is already set at probe (from firmware or a prior driver bind/unbind, since
qcom_ptp_tsc_remove() does not disable the counter), the first
qcom_tsc_settime() call sees qcom_tsc_is_enabled(tsc) =3D=3D true and takes=
 the
qcom_tsc_update_offset() path without programming PULSE_WIDTH_MASK or
ROLLOVER_VAL:

drivers/ptp/ptp_qcom_tsc.c:qcom_tsc_settime() {
    ...
	if (qcom_tsc_is_enabled(tsc)) {
		qcom_tsc_read_time(tsc, &tod);
		ret =3D qcom_tsc_update_offset(tsc, timespec64_sub(*ts, tod));
		mutex_unlock(&tsc->lock);
		return ret;
	}

	/* Configure and enable the TSC counter */
	regval =3D readl_relaxed(tsc->base + regs->control_cntcr);
	regval &=3D ~PULSE_WIDTH_MASK;
	regval |=3D FIELD_PREP(PULSE_WIDTH_MASK, tsc->soc->pulse_width);
	writel_relaxed(regval, tsc->base + regs->control_cntcr);

	if (tsc->soc->rollover)
		writel_relaxed(ROLLOVER_VAL, tsc->base + regs->rollover_val);
    ...
}

--=20
Sashiko AI review =C2=B7 https://sashiko.dev/#/patchset/20261108-tscss-v2-0=
-d5f575010427@oss.qualcomm.com?part=3D4
