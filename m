Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=100.103.45.18
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1793181157;
	b=Iw0Tv6kxIgyliMFkIApqCSzb2NtuFiVFNUaEqx0SwpCWFse0XZHEG/uETHHdVP67bs2C
	 YSAQwpMgEjdZBbAUqjQ9DWidDPv94kcFQ7PJH9Wn61XXNzXNSNtHcYdAN6PvKexmd6xPG
	 Pqf8GVGbGTjdUn/dwIltNFVuyhYkEibrlP1yJVHhP3B2rvfrnpR/iTCf7nfANrdPDlrlx
	 qqxguBO3oXfgnziTPU8Ng4BAKY4YkfKxkCPEkNRwyJ2Iu2j6dW6kYoWwtwPRVQZ5K7aU8
	 KZPA6GQyiDJfYuSoF1cuV5j/NSickkC+kRiwHPueWVPqR4v3k0Nz9/0jtTn3MFo2zew==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1793181157;
	h=Received:DKIM-Signature:Message-ID:From:Subject:Reply-To:To:Cc:
	 In-Reply-To:References:Content-Type:Content-Transfer-Encoding:Date;
	bh=gic6HTO1AM8g7001RSLTzQgmv2kZcJfF3mXlZL4P7/Y=;
	b=bGH852yRa/JprmFH5lFMZXoU1NWUXgou82l7nIdfztSJeeL3G22msrCOOfesNt8DChsR
	 CXr+oWbrBMEqFP/wFJGR3dXFU8vGmqI4fNGbj7pgc+FbrLG/UrLkvX59TI9e3cHagkmpc
	 BTP951ZBmQ6n5I47/OXKBXH1F3v2DGGMMh61uCNegSIBHSREKtffCwzRAOpGiMazoC/nH
	 ouxbzb9A4LSJNKR4eGrxade1SD6e5X5o9QxA8Ckdt5aiGaaKGAnOHWOoktBuucDsNDFYU
	 OLa6NQ+6njaCB5HjT1yZDmfdgfLQOoXxm7GFd4cst98SU5m01asz33zPwnHlThNWMMg==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dkim=pass header.d=kernel.org header.i=@kernel.org header.a=rsa-sha256 header.s=k20260515 header.b=BFImELsn;
	arc=none smtp.remote-ip=100.103.45.18
Received: from smtp.kernel.org (quasi.space.kernel.org [100.103.45.18])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 0AFC1606A31A
	for <devicetree@vger.kernel.org>; Wed, 28 Oct 2026 09:52:36 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key, unprotected) header.d=kernel.org header.i=@kernel.org header.a=rsa-sha256 header.s=k20260515 header.b=BFImELsn
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 69FAB1F01825;
	Wed, 28 Oct 2026 09:52:36 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kernel.org;
	s=k20260515; t=1793181156;
	bh=gic6HTO1AM8g7001RSLTzQgmv2kZcJfF3mXlZL4P7/Y=;
	h=From:Subject:Reply-To:To:Cc:In-Reply-To:References:Date;
	b=BFImELsndYQOP6wHlOiQ9bDCBL+4TbIQ7rqv/zHRPfwzNytnr9rjqw0+kZDSVEKee
	 40oeAb7FoOBCOgFMUbWyluqsuQzpzKbnv8qSIGV3sIb13/azy02oAxWO12idfprafN
	 RjNq4GZRj0NHkHPsK6PJMy0+wJZ82+JC2WFsgzmWh6C7ODm4dgJpXCf63IRTdbXSrH
	 vDKzowkOs/9NKqR2l9Fke70rP7r9ksqqqiKeSBIm5Lz3Z+CdER1Wg7sfXVSyUf3wwE
	 cz2VUxa0KybibgHcUMcYVnhq9Ye+3yQzjDRtpmncWEbsq7XGaubJIlNcbn7rmrkba2
	 Po0HENftUYvoQ==
Message-ID: <sashiko-outbox-187698@kernel.org>
From: sashiko-bot@kernel.org
Subject: Re: [PATCH v2 4/9] media: camss: csid: add the 980 generation
Reply-To: sashiko-reviews@lists.linux.dev
To: "Qianhui Xu" <xiaqinghuan@mail.ustc.edu.cn>
Cc: devicetree@vger.kernel.org, robh@kernel.org, conor+dt@kernel.org, media-ci@linuxtv.org
In-Reply-To: <20261028093003.722745-5-xiaqinghuan@mail.ustc.edu.cn>
References: <20261028093003.722745-1-xiaqinghuan@mail.ustc.edu.cn>
 <20261028093003.722745-5-xiaqinghuan@mail.ustc.edu.cn>
Content-Type: text/plain; charset=utf-8
Content-Transfer-Encoding: quoted-printable
Date: Wed, 28 Oct 2026 09:52:36 +0000
X-Mailing-List: devicetree@vger.kernel.org
List-Id: <devicetree.vger.kernel.org>
List-Post: <mailto:devicetree@vger.kernel.org>
List-Help: <mailto:devicetree+help@vger.kernel.org>
List-Subscribe: <mailto:devicetree+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:devicetree+unsubscribe@vger.kernel.org>
List-Owner: <mailto:devicetree+owner@vger.kernel.org>
Precedence: list

Thank you for your contribution! Sashiko AI review found 2 potential issue(=
s) to consider:
- [High] media: camss: csid-980: stale AUP/RUP bits in reg_update and aup_u=
pdate
- [Medium] media: camss: csid-980: data race on reg_update, aup_update, and=
 rup_update
--

commit 68a5dddeaab25c9fe58dfc5d32c5893629d64bd2
Author: Qianhui Xu <xiaqinghuan@mail.ustc.edu.cn>

media: camss: csid: add the 980 generation

This commit adds support for the CSID 980 generation found on SM8750,
including register maps for full and lite variants, RDI stream configuratio=
n,
and buffer-done reporting. It also introduces dedicated rup_update and
aup_update fields in struct csid_device for split RUP and AUP commands on
the full CSID variant.

> diff --git a/drivers/media/platform/qcom/camss/camss-csid-980.c b/drivers=
/media/platform/qcom/camss/camss-csid-980.c
> new file mode 100644
> index 0000000000000..09139815c2c19
> --- /dev/null
> +++ b/drivers/media/platform/qcom/camss/camss-csid-980.c
[ ... ]
> +static void __csid_full_aup_rup_trigger(struct csid_device *csid)
> +{
> +	/* trigger SET in combined register */
> +	writel(RUP_SET, csid->base + CSID_RUP_AUP_CMD);
> +}
> +
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
[ ... ]
> +static void csid_configure_stream(struct csid_device *csid, u8 enable)
> +{
> +	u8 i, k;
> +
> +	__csid_configure_rx(csid, &csid->phy);
> +
> +	for (i =3D 0; i < MSM_CSID_MAX_SRC_STREAMS_980; i++) {
> +		if (csid->phy.en_vc & BIT(i)) {
[ ... ]
> +			for (k =3D 0; enable && k < CAMSS_INIT_BUF_COUNT; k++) {
> +				__csid_aup_update(csid, i);
> +				__csid_rup_update(csid, i);
> +			}
> +
> +			__csid_ctrl_rdi(csid, enable, i);
> +		}
> +	}
> +}
[ ... ]
> +static void csid_subdev_reg_update(struct csid_device *csid, int port_id,
> +				   bool clear)
> +{
> +	if (clear)
> +		__csid_aup_rup_clear(csid, port_id);
> +	else
> +		__csid_aup_update(csid, port_id);
> +}

[Severity: High]
Does accumulating bits in csid->reg_update, csid->aup_update, and
csid->rup_update cause duplicate AUP/RUP commands during stream startup and
re-trigger stale AUP commands across RDI ports during multi-stream operatio=
n?

During stream startup (video_start_streaming() -> csid_set_stream() ->
csid_configure_stream()), before __csid_ctrl_rdi() or the upstream sensor
s_stream(1) is called, csid_configure_stream() loops CAMSS_INIT_BUF_COUNT
times calling __csid_aup_update(csid, i) followed by
__csid_rup_update(csid, i). Because no frame boundary or INFO_RUP_DONE
interrupt can occur during this loop, the bitmasks in csid->reg_update,
csid->aup_update, and csid->rup_update are not cleared between calls.

On CSID Lite, __csid_aup_update() sets CSID_LITE_AUP_RDI(i) in
csid->reg_update and writes CSID_LITE_RUP_AUP_CMD, and __csid_rup_update()
immediately ORs CSID_LITE_RUP_RDI(i) into the same csid->reg_update and wri=
tes
CSID_LITE_RUP_AUP_CMD again with CSID_LITE_AUP_RDI(i) still set. The second
loop iteration then writes both bits two more times, and if multiple RDI
streams are enabled in csid->phy.en_vc, configuring higher-numbered streams
re-writes the accumulated AUP/RUP bits of all lower-numbered streams.

Furthermore, during active streaming, per-frame buffer updates from
vfe_buf_done() and vfe_queue_buffer_v2() call ops->reg_update() ->
camss_reg_update(camss, hw_id, port_id, false) ->
csid_subdev_reg_update(csid, port_id, false), which only invokes
__csid_aup_update(csid, port_id) and never __csid_rup_update(csid, port_id).
In csid_isr(), csid_subdev_reg_update(csid, i, true) is only called when
INFO_RUP_DONE is set in CSID_CSI2_RDIN_IRQ_STATUS(i) (and prior to the
follow-up commit "media: camss: csid: report frame starts from CSID",
INFO_RUP_DONE is not unmasked in CSID_CSI2_RDIN_IRQ_MASK(i) either).

Because per-frame AUP-only updates do not generate INFO_RUP_DONE,
CSID_RUP_AUP_RDI(port_id) in csid->aup_update and CSID_LITE_AUP_RDI(port_id)
in csid->reg_update remain set indefinitely after the first frame's buffer
update. When multiple RDI streams are active on the same CSID instance (or
when one RDI port stops and another starts without a full CSID reset), call=
ing
__csid_aup_update() for one RDI port will write the stale AUP command bits =
for
the other RDI ports whose VFE write master image address registers were not
updated.

> +
> +/**
> + * csid_isr - CSID module interrupt service routine
> + * @irq: Interrupt line
> + * @dev: CSID device
> + *
> + * Return IRQ_HANDLED on success
> + */
> +static irqreturn_t csid_isr(int irq, void *dev)
> +{
[ ... ]
> +	for (i =3D 0; i < MSM_CSID_MAX_SRC_STREAMS_980; i++) {
> +		if (csid->phy.en_vc & BIT(i)) {
> +			bool done =3D buf_done_val & BIT(BUF_DONE_IRQ_STATUS_RDI_OFFSET + i);
> +
> +			val =3D readl(csid->base + CSID_CSI2_RDIN_IRQ_STATUS(i));
> +			writel(val, csid->base + CSID_CSI2_RDIN_IRQ_CLEAR(i));
> +
> +			if (val & INFO_RUP_DONE)
> +				csid_subdev_reg_update(csid, i, true);
> +
> +			if (done)
> +				camss_buf_done(csid->camss, csid->id, i);
> +		}
> +	}

[Severity: Medium]
Can csid_isr() race with concurrent calls to __csid_aup_update() when readi=
ng
and modifying csid->reg_update, csid->aup_update, and csid->rup_update?

In csid_isr(), when INFO_RUP_DONE is set, csid_subdev_reg_update(csid, i, t=
rue)
calls __csid_aup_rup_clear() in hardirq context without holding
vfe->output_lock or any CSID lock:

  csid_isr()
    csid_subdev_reg_update(csid, i, true)
      __csid_aup_rup_clear()

Meanwhile, a concurrent VIDIOC_QBUF ioctl on another CPU can execute
vfe_queue_buffer_v2() under vfe->output_lock (or csid_configure_stream() can
enable another RDI stream on the same CSID):

  vfe_queue_buffer_v2()
    ops->reg_update(vfe, line->id)
      camss_reg_update()
        csid_subdev_reg_update(csid, port_id, false)
          __csid_aup_update()

Since both paths perform unsynchronized read-modify-write operations on
csid->reg_update, csid->aup_update, and csid->rup_update, could this clobber
newly set update bits or resurrect just-cleared update bits and write stale
bitmasks to CSID_AUP_CMD or CSID_LITE_RUP_AUP_CMD?

--=20
Sashiko AI review =C2=B7 https://sashiko.dev/#/patchset/20261028093003.7227=
45-1-xiaqinghuan@mail.ustc.edu.cn?part=3D4
