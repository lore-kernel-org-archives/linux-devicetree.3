Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=100.103.45.18
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1793160195;
	b=dkC7W20p1lmU7QUt72+hU+43kOTATYZahdIokVqvs+NDTPjCtkPDwEzFjfb1wyfyC9yk
	 3gXIMUx5PEL8lirbeaQA6n3NVhR71rSWBrP4bqF7z9FI7UGMV3wiX9vUK2SO2+y8//zhv
	 st+D1NogZOTLxEr6cNJ3pRhadwNmjmhIdP1YBEb/jeh4seiDtijig2p9ZV0AIkoCoZIbd
	 He3diPMMngU/5O4zwQX0EoE5uleWOw6gJSIubhh1MMZeDK+K/VpgaWSPFy57FggQyiXrV
	 ANeh/2aP1iatMNRFj57uBIKAkdZEaZnRy3iospFnHCWnEEWZ6ufwxHFPdP4vXh+T8JA==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1793160195;
	h=Received:DKIM-Signature:Message-ID:From:Subject:Reply-To:To:Cc:
	 In-Reply-To:References:Content-Type:Content-Transfer-Encoding:Date;
	bh=2mkUr2I8m61OwOPB4F77VdBMjpiZt1OCGnnp0mj1GaU=;
	b=Po31ZoK8RPR228J2l2i2/GIUtBKqWi0j4iWaZs+MY6HHQvpQWHuopwpP2wlYwrD+NI6I
	 tgwI/5+pbHPI+/g9Fjp8I4Kb3+3SmIyUYbWeaG5xH3PmtxEXhelmIdnDxQhewR67C0RKH
	 NY5kk4EnejvpEO2lN/VtLSG5er/ksLcXlSm1WltBxnHIw1Z4ea7jmwDOOoz99ljXsM+EY
	 9HpYHiZDuNh4Y6UobtXDgYztnxucwdZVxHRUadGYVlZcQ+/SVTLmP3mpMY8iqUQw8PnhA
	 3yBicvRWRZYx0YGqYzKCIiUkSu9jhqr2EWcfp7Ua9J/zWjVEqfSKzA0OSFhrBQQkwLA==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dkim=pass header.d=kernel.org header.i=@kernel.org header.a=rsa-sha256 header.s=k20260515 header.b=hdeMgApz;
	arc=none smtp.remote-ip=100.103.45.18
Received: from smtp.kernel.org (quasi.space.kernel.org [100.103.45.18])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 409F5606A31A
	for <devicetree@vger.kernel.org>; Wed, 28 Oct 2026 04:03:14 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key, unprotected) header.d=kernel.org header.i=@kernel.org header.a=rsa-sha256 header.s=k20260515 header.b=hdeMgApz
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 825E91F01825;
	Wed, 28 Oct 2026 04:03:14 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kernel.org;
	s=k20260515; t=1793160194;
	bh=2mkUr2I8m61OwOPB4F77VdBMjpiZt1OCGnnp0mj1GaU=;
	h=From:Subject:Reply-To:To:Cc:In-Reply-To:References:Date;
	b=hdeMgApzW9qrZnnSPq85sOezBN7vRFyFV2/Zup2fKyFGfr2X+garIxo6N4z5Y+RMH
	 q108yWHVw8GKDsaNJKvmiP/y+8tPBb8KEa8vLNCeYibUSptQNzva1248Hc1HcY3V3R
	 v1LIJRvNOudvwlKZqIjCqUls3chEw8x2Dt07uPVWd2Gi+HjBxZkM3bc5Lbc65AnISw
	 dHyh/yZhN++xZK/F8PvexfljCyuwHUwpRbeMX115pWhIArYuoGX2lFDLHlu3PDY9E7
	 qWkI//gSURS2ByrmPI8wbS9xaj8sqqsWW2UpdS4/P6OrdjjHixTdObhPGav6rJHJic
	 +P4pIgb59OhiQ==
Message-ID: <sashiko-outbox-187460@kernel.org>
From: sashiko-bot@kernel.org
Subject: Re: [PATCH 4/9] media: camss: csid: add the 980 generation
Reply-To: sashiko-reviews@lists.linux.dev
To: "Qianhui Xu" <xiaqinghuan@mail.ustc.edu.cn>
Cc: devicetree@vger.kernel.org, robh@kernel.org, conor+dt@kernel.org, media-ci@linuxtv.org
In-Reply-To: <20261028034105.326535-5-xiaqinghuan@mail.ustc.edu.cn>
References: <20261028034105.326535-1-xiaqinghuan@mail.ustc.edu.cn>
 <20261028034105.326535-5-xiaqinghuan@mail.ustc.edu.cn>
Content-Type: text/plain; charset=utf-8
Content-Transfer-Encoding: quoted-printable
Date: Wed, 28 Oct 2026 04:03:14 +0000
X-Mailing-List: devicetree@vger.kernel.org
List-Id: <devicetree.vger.kernel.org>
List-Post: <mailto:devicetree@vger.kernel.org>
List-Help: <mailto:devicetree+help@vger.kernel.org>
List-Subscribe: <mailto:devicetree+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:devicetree+unsubscribe@vger.kernel.org>
List-Owner: <mailto:devicetree+owner@vger.kernel.org>
Precedence: list

Thank you for your contribution! Sashiko AI review found 3 potential issue(=
s) to consider:
- [High] media: camss: csid: INFO_RUP_DONE left masked in csid_configure_st=
ream()
- [High] media: camss: csid: wrong dt_id in __csid_configure_rdi_stream()
- [Medium] media: camss: csid-980: race on reg_update, rup_update, and aup_=
update
--

commit 9e06166c718bdeac203de00c1a26a347c6114d7a
Author: Qianhui Xu <xiaqinghuan@mail.ustc.edu.cn>

media: camss: csid: add the 980 generation

This commit adds support for the CSID 980 generation found on SM8750,
including register maps for full and lite variants, split RUP and AUP
register update commands, RDI stream configuration, and buffer-done
interrupt handling.

> diff --git a/drivers/media/platform/qcom/camss/camss-csid-980.c b/drivers=
/media/platform/qcom/camss/camss-csid-980.c
> new file mode 100644
> index 0000000000000..45f3b37867040
> --- /dev/null
> +++ b/drivers/media/platform/qcom/camss/camss-csid-980.c

[ ... ]

> +static void __csid_aup_update(struct csid_device *csid, int port_id)
> +{
> +	if (csid_is_lite(csid)) {
> +		/* CSID Lites in v980 follow the legacy way of a combined RUP
> +		 * and AUP commands without an explicit SET register.
> +		 */
> +		csid->reg_update |=3D CSID_LITE_AUP_RDI(port_id);
> +		writel(csid->reg_update, csid->base + CSID_LITE_RUP_AUP_CMD);
> +	} else {
> +		csid->aup_update |=3D CSID_RUP_AUP_RDI(port_id);
> +		writel(csid->aup_update, csid->base + CSID_AUP_CMD);
> +
> +		/* CSID Fulls in v980 split AUP and RUP commands, which requires
> +		 * additional SET operation to make registers modification take
> +		 * effect.
> +		 */
> +		__csid_full_aup_rup_trigger(csid);
> +	}
> +}
> +
> +static void __csid_rup_update(struct csid_device *csid, int port_id)
> +{
> +	if (csid_is_lite(csid)) {
> +		/* CSID Lites in v980 follow the legacy way of a combined RUP
> +		 * and AUP commands without an explicit SET register.
> +		 */
> +		csid->reg_update |=3D CSID_LITE_RUP_RDI(port_id);
> +		writel(csid->reg_update, csid->base + CSID_LITE_RUP_AUP_CMD);
> +	} else {
> +		csid->rup_update |=3D CSID_RUP_AUP_RDI(port_id);
> +		writel(csid->rup_update, csid->base + CSID_RUP_CMD);
> +
> +		/* CSID Fulls in v980 split AUP and RUP commands, which requires
> +		 * additional SET operation to make registers modification take
> +		 * effect.
> +		 */
> +		__csid_full_aup_rup_trigger(csid);
> +	}
> +}
> +
> +static void __csid_aup_rup_clear(struct csid_device *csid, int port_id)
> +{
> +	/* Hardware clears the registers upon consuming the settings */
> +	if (csid_is_lite(csid)) {
> +		csid->reg_update &=3D ~CSID_LITE_RUP_RDI(port_id);
> +		csid->reg_update &=3D ~CSID_LITE_AUP_RDI(port_id);
> +	} else {
> +		csid->aup_update &=3D ~CSID_RUP_AUP_RDI(port_id);
> +		csid->rup_update &=3D ~CSID_RUP_AUP_RDI(port_id);
> +	}
> +}

[Severity: Medium]
Can concurrent updates to csid->reg_update, csid->rup_update, and
csid->aup_update race with each other?

In csid_isr(), when INFO_RUP_DONE is set, the interrupt handler calls
csid_subdev_reg_update(csid, i, true) -> __csid_aup_rup_clear() in hardirq
context without holding vfe->output_lock or any CSID lock:

    if (val & INFO_RUP_DONE)
        csid_subdev_reg_update(csid, i, true);

Meanwhile, on another CPU, vfe_queue_buffer_v2() (holding only
vfe->output_lock) or csid_configure_stream() (holding no spinlock while
csid->irq is enabled) can call __csid_aup_update() or __csid_rup_update().

Because both paths perform non-atomic read-modify-write operations on
csid->reg_update, csid->aup_update, and csid->rup_update before writing the
full mask to CSID_LITE_RUP_AUP_CMD, CSID_AUP_CMD, or CSID_RUP_CMD, could th=
is
clobber newly set update bits or re-write stale RDI bits to the command
registers?

[ ... ]

> +static void __csid_configure_rdi_stream(struct csid_device *csid, u8 ena=
ble, u8 port, u8 vc)
> +{
> +	u32 val;
> +
> +	/* Source pads matching RDI channels on hardware.
> +	 * E.g. Pad 1 -> RDI0, Pad 2 -> RDI1, etc.
> +	 */
> +	struct v4l2_mbus_framefmt *input_format =3D &csid->fmt[MSM_CSID_PAD_FIR=
ST_SRC + port];
> +	const struct csid_format_info *format =3D csid_get_fmt_entry(csid->res-=
>formats->formats,
> +								   csid->res->formats->nformats,
> +								   input_format->code);
> +
> +	/*
> +	 * DT_ID is a two bit bitfield that is concatenated with
> +	 * the four least significant bits of the five bit VC
> +	 * bitfield to generate an internal CID value.
> +	 *
> +	 * CSID_RDI_CFG0(vc)
> +	 * DT_ID : 28:27
> +	 * VC    : 26:22
> +	 * DT    : 21:16
> +	 *
> +	 * CID   : VC 3:0 << 2 | DT_ID 1:0
> +	 */
> +	u8 dt_id =3D vc & 0x03;

[Severity: High]
Should dt_id be computed as port & 0x03 instead of vc & 0x03 here?

In csid_configure_stream(), __csid_configure_rdi_stream(csid, enable, i, 0)
is always called with vc =3D 0 for every port i. Calculating dt_id from vc
programs dt_id =3D 0 and an identical internal CID =3D 0 in CSID_RDI_CFG0(p=
ort)
for all RDI ports (RDI0 through RDI3), which breaks streaming on non-zero R=
DI
ports just like the issue fixed for CSID gen3 in commit ad136e52634d ("medi=
a:
qcom: camss: Fix RDI streaming for CSID GEN3").

[ ... ]

> +static void csid_configure_stream(struct csid_device *csid, u8 enable)
> +{
> +	u8 i, k;
> +
> +	__csid_configure_rx(csid, &csid->phy);
> +
> +	for (i =3D 0; i < MSM_CSID_MAX_SRC_STREAMS_980; i++) {
> +		if (csid->phy.en_vc & BIT(i)) {
> +			u32 mask =3D readl(csid->base + CSID_CSI2_RDIN_IRQ_MASK(i));
> +
> +			writel(mask, csid->base + CSID_CSI2_RDIN_IRQ_MASK(i));

[Severity: High]
Does csid_configure_stream() leave INFO_RUP_DONE masked in
CSID_CSI2_RDIN_IRQ_MASK(i)?

Here, CSID_CSI2_RDIN_IRQ_MASK(i) is read into mask and written back unchang=
ed
without setting INFO_RUP_DONE, and csid_reset() does not unmask INFO_RUP_DO=
NE
in CSID_CSI2_RDIN_IRQ_MASK(i) either (even after follow-up commit
7457e598955f ("media: camss: csid: report frame starts from CSID"), which
only adds INFO_CAMIF_SOF to mask).

In csid_isr(), the handler checks for INFO_RUP_DONE to clear the software
update state:

    val =3D readl(csid->base + CSID_CSI2_RDIN_IRQ_STATUS(i));
    writel(val, csid->base + CSID_CSI2_RDIN_IRQ_CLEAR(i));

    if (val & INFO_RUP_DONE)
        csid_subdev_reg_update(csid, i, true);

Without INFO_RUP_DONE unmasked in CSID_CSI2_RDIN_IRQ_MASK(i), won't
csid_subdev_reg_update(csid, i, true) never be called, leaving
CSID_LITE_RUP_RDI(i) permanently set in csid->reg_update on CSID Lite (so
every subsequent per-frame __csid_aup_update() call in vfe_buf_done()
re-asserts RUP alongside AUP) and leaving stale bits set in csid->aup_updat=
e,
csid->rup_update, and csid->reg_update across streams?

--=20
Sashiko AI review =C2=B7 https://sashiko.dev/#/patchset/20261028034105.3265=
35-1-xiaqinghuan@mail.ustc.edu.cn?part=3D4
