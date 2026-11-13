Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=100.103.45.18
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1794549876;
	b=PbWAv4gDmR9hKVmtn0tAM9qqBvMxQu0EAdZpvJKpd8AtieGl2FRJwmW0Ajj8XFlVOxeS
	 WN+sYG0La1tkAuhk6FlWoJxDimQWIbc3rZTaTLQr9LHivD+Spojy0+1F6vthcTJCKR9sX
	 8t7wck1C5kPBEMmtz0+cTsdNxx+cvvZwz5DwkM13bRqzY4nQl2uNxL8mfceWVC+3G0IZp
	 4usyJslDLoMg32feyWC5cgKHqG3AOO0OrBMnLMX6nCN5abWuukZu1+DpHkuHU9nqyFsSg
	 k8YIcWrVLTrzLkmemCeXHhCgbyRuo6sucLKwmUPAiqns48oehwLUDCvrynq8gYYfWvQ==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1794549876;
	h=Received:DKIM-Signature:Message-ID:From:Subject:Reply-To:To:Cc:
	 In-Reply-To:References:Content-Type:Content-Transfer-Encoding:Date;
	bh=Rj1etvk7gt7kIxdimWxsK6vzr3EEp81Rue5iwbWrWUU=;
	b=LbXgaFisSVevz4mzBQoU/DUf25vf7o0fA0w03CVi9XuDFd90wymoBukETBBgL67nLJRP
	 FyIf0g3Vo9nOsN4fuPWtxtg3CQYgOmX8c5+eDA0ntoUDnp4H/e4h/Ssnm2eKSfe9YvUJe
	 nanj4QXMZoZmdRtLqLsU6G/PuVou1Z8fpXhuQdNHt6Yi/n4Ys2GVb85bLG/U4lP8uIqyf
	 F6TdjJP8fXb1Q7M6taxlSW1Rw564eBQeTxPPcz52D8WCGRBbskzs5HFblJkdac1WkXc9F
	 68Bvr4dfc21QC2+0+3mdhd64N+ZU8xbe4PqwWy3Vb/0VsLv9AzJYJr2BIbVcZzXcsww==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dkim=pass header.d=kernel.org header.i=@kernel.org header.a=rsa-sha256 header.s=k20260515 header.b=o20+ygNM;
	arc=none smtp.remote-ip=100.103.45.18
Received: from smtp.kernel.org (quasi.space.kernel.org [100.103.45.18])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id C0321606A31C
	for <devicetree@vger.kernel.org>; Fri, 13 Nov 2026 06:04:36 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.a=rsa-sha256 header.s=k20260515 header.b=o20+ygNM
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 0B3D21F000C4;
	Fri, 13 Nov 2026 06:04:36 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kernel.org;
	s=k20260515; t=1794549876;
	bh=Rj1etvk7gt7kIxdimWxsK6vzr3EEp81Rue5iwbWrWUU=;
	h=From:Subject:Reply-To:To:Cc:In-Reply-To:References:Date;
	b=o20+ygNMRJR1uV/N4bv9GMvwqHn9HuVIzgDu1V3hy1IVxoaRFSOHno76eRTPbd9E5
	 63WkwHZXcUXqktLJ0zfndP4YdKncFXpZbr0hAxmKNlmXSkh7BDLycLhBlisLCFLgRV
	 wwuUY8mMkUVHQ17YbKhQON5werv8LBNXJh/XXkieC8GSA3sW1nACbyi9DKhEhSRH6a
	 HQFNOq8YdjciyTV3ungrEQ/3bgFsLBPEFz1bvgeqtK+ytmuUatD7zTmQ6ovGgFqbW2
	 RR9G7g/DhRapdF5Ubq7vf8tgd3OD215NNzi2CIJ+uDt4a7y649x1FrvaCs/JxFCeQ1
	 q4g5+1EGExfhw==
Message-ID: <sashiko-outbox-212267@kernel.org>
From: sashiko-bot@kernel.org
Subject: Re: [PATCH v25 09/15] media: qcom: camss: csid: Add support for
 CSID 1080
Reply-To: sashiko-reviews@lists.linux.dev
To: "Hangxiang Ma" <hangxiang.ma@oss.qualcomm.com>
Cc: linux-phy@lists.infradead.org, devicetree@vger.kernel.org, robh@kernel.org, conor+dt@kernel.org, media-ci@linuxtv.org, vkoul@kernel.org, neil.armstrong@linaro.org, olteanv@gmail.com
In-Reply-To: <20261112-kaanapali-camss-v25-9-1d709f57f370@oss.qualcomm.com>
References: <20261112-kaanapali-camss-v25-0-1d709f57f370@oss.qualcomm.com>
 <20261112-kaanapali-camss-v25-9-1d709f57f370@oss.qualcomm.com>
Content-Type: text/plain; charset=utf-8
Content-Transfer-Encoding: quoted-printable
Date: Fri, 13 Nov 2026 06:04:35 +0000
X-Mailing-List: devicetree@vger.kernel.org
List-Id: <devicetree.vger.kernel.org>
List-Post: <mailto:devicetree@vger.kernel.org>
List-Help: <mailto:devicetree+help@vger.kernel.org>
List-Subscribe: <mailto:devicetree+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:devicetree+unsubscribe@vger.kernel.org>
List-Owner: <mailto:devicetree+owner@vger.kernel.org>
Precedence: list

Thank you for your contribution! Sashiko AI review found 6 potential
issues to consider:
- [High] media: qcom: camss: unconditional AUP triggers in
  csid_configure_stream()
- [Medium] media: qcom: camss: out-of-bounds csid->fmt access in
  __csid_configure_rdi_stream()
- [Medium] media: qcom: camss: race on addr_update and reg_update in
  csid_isr()
- [Medium] media: qcom: camss: stale update state and IRQ mask in
  csid_reset()
- [Low] media: qcom: camss: unused variable lane_cnt in
  __csid_configure_rdi_stream()
- [Low] media: qcom: camss: malformed kernel-doc Return in csid_isr()
  and csid_reset()
--

commit 259ca3091478f035f17a018767773d2d4fcaa553
Author: Hangxiang Ma <hangxiang.ma@oss.qualcomm.com>

media: qcom: camss: csid: Add support for CSID 1080

This commit adds hardware resource definitions and CSID 1080 operations for
the Qualcomm Kaanapali SoC, including separate RUP and AUP register update
handling and BUF_DONE interrupt processing.

> diff --git a/drivers/media/platform/qcom/camss/camss-csid-1080.c b/driver=
s/media/platform/qcom/camss/camss-csid-1080.c
> new file mode 100644
> index 0000000000000..3d90d31201fa5
> --- /dev/null
> +++ b/drivers/media/platform/qcom/camss/camss-csid-1080.c
> @@ -0,0 +1,402 @@

[ ... ]

> +#define MSM_CSID_MAX_SRC_STREAMS_1080		(csid_is_lite(csid) ? 4 : 5)

[ ... ]

> +static void __csid_aup_rup_trigger(struct csid_device *csid)
> +{
> +	/* trigger SET in combined register */
> +	writel(RUP_SET, csid->base + CSID_RUP_AUP_CMD);
> +}
> +
> +static void __csid_addr_update(struct csid_device *csid, int port_id)
> +{
> +	csid->addr_update |=3D CSID_RUP_AUP_RDI(port_id);
> +	writel(csid->addr_update, csid->base + CSID_AUP_CMD);
> +
> +	__csid_aup_rup_trigger(csid);
> +}
> +
> +static void __csid_addr_update_clear(struct csid_device *csid, int port_=
id)
> +{
> +	csid->addr_update &=3D ~CSID_RUP_AUP_RDI(port_id);
> +}
> +
> +static void __csid_reg_update(struct csid_device *csid, int port_id)
> +{
> +	csid->reg_update |=3D CSID_RUP_AUP_RDI(port_id);
> +	writel(csid->reg_update, csid->base + CSID_RUP_CMD);
> +
> +	__csid_aup_rup_trigger(csid);
> +}
> +
> +static void __csid_reg_update_clear(struct csid_device *csid, int port_i=
d)
> +{
> +	csid->reg_update &=3D ~CSID_RUP_AUP_RDI(port_id);
> +}

[ ... ]

> +static void __csid_configure_rdi_stream(struct csid_device *csid, u8 ena=
ble, u8 port, u8 vc)
> +{
> +	u8 lane_cnt =3D csid->phy.lane_cnt;
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

[Severity: Medium]
Can this read past the end of csid->fmt[] on non-lite CSID 1080 instances?

MSM_CSID_MAX_SRC_STREAMS_1080 is 5 when csid_is_lite(csid) is false, so
csid_configure_stream() passes port =3D 4 into __csid_configure_rdi_stream(=
).
However, MSM_CSID_PADS_NUM in drivers/media/platform/qcom/camss/camss-csid.h
is 5 (1 sink pad and 4 source pads), sizing both csid->pads[] and
csid->fmt[] to 5 elements:

drivers/media/platform/qcom/camss/camss-csid.h:
    #define MSM_CSID_PAD_SINK 0
    #define MSM_CSID_PAD_FIRST_SRC 1
    #define MSM_CSID_PADS_NUM 5

When port is 4, MSM_CSID_PAD_FIRST_SRC + port is 5, which indexes one
element past csid->fmt[5] (and the 5th RDI stream has no media pad
registered by msm_csid_register_entity()).

> +
> +	if (!lane_cnt)
> +		lane_cnt =3D 4;

[Severity: Low]
lane_cnt is initialized and updated here, but never used in
__csid_configure_rdi_stream(), which triggers a -Wunused-but-set-variable
warning under W=3D1 builds.

[ ... ]

> +static void csid_configure_stream(struct csid_device *csid, u8 enable)
> +{
> +	u8 i, k;
> +
> +	__csid_configure_rx(csid, &csid->phy);
> +
> +	for (i =3D 0; i < MSM_CSID_MAX_SRC_STREAMS_1080; i++) {
> +		if (csid->phy.en_vc & BIT(i)) {
> +			__csid_configure_rdi_stream(csid, enable, i, 0);
> +			__csid_configure_rx_vc(csid, 0);
> +
> +			for (k =3D 0; k < CAMSS_INIT_BUF_COUNT; k++)
> +				__csid_addr_update(csid, i);
> +
> +			__csid_reg_update(csid, i);
> +
> +			__csid_ctrl_rdi(csid, enable, i);
> +		}
> +	}
> +}

[Severity: High]
Does unconditionally calling __csid_addr_update() CAMSS_INIT_BUF_COUNT
times here latch uninitialized or duplicate buffer addresses into the
hardware FIFO?

During VIDIOC_STREAMON, video_start_streaming() runs vfe_enable_output_v2()
before starting the CSID subdevice:

drivers/media/platform/qcom/camss/camss-vfe.c:vfe_enable_output_v2() {
    ...
	for (i =3D 0; i < CAMSS_INIT_BUF_COUNT; i++) {
		output->buf[i] =3D vfe_buf_get_pending(output);
		if (!output->buf[i])
			break;
		output->gen2.active_num++;
		ops->vfe_wm_update(vfe, output->wm_idx[0],
				   output->buf[i]->addr[0], line);
		if (!ops->addr_update)
			ops->reg_update(vfe, line->id);
	}
    ...
}

Because the vb2_queue does not set min_queued_buffers, 0, 1, or 2 buffers
may be queued when streaming starts. If 0 or 1 buffers are pending,
vfe_enable_output_v2() programs fewer than 2 addresses, yet
csid_configure_stream() still triggers 2 AUPs (and also does so when
enable =3D=3D 0). If 2 buffers are pending, the second ops->vfe_wm_update()
overwrites VFE_BUS_WM_IMAGE_ADDR with buf[1]->addr[0] before any AUP has
latched buf[0]->addr[0], and csid_configure_stream() then latches
buf[1]->addr[0] twice.

[ ... ]

> +/**
> + * csid_isr - CSID module interrupt service routine
> + * @irq: Interrupt line
> + * @dev: CSID device
> + *
> + * Return IRQ_HANDLED on success
> + */
> +static irqreturn_t csid_isr(int irq, void *dev)
> +{
> +	struct csid_device *csid =3D dev;
> +	u32 val, buf_done_val;
> +	u8 reset_done;
> +	int i;
> +
> +	val =3D readl(csid->base + CSID_TOP_IRQ_STATUS);
> +	writel(val, csid->base + CSID_TOP_IRQ_CLEAR);
> +
> +	reset_done =3D val & INFO_RST_DONE;
> +
> +	buf_done_val =3D readl(csid->base + CSID_BUF_DONE_IRQ_STATUS);
> +	writel(buf_done_val, csid->base + CSID_BUF_DONE_IRQ_CLEAR);
> +
> +	for (i =3D 0; i < MSM_CSID_MAX_SRC_STREAMS_1080; i++) {
> +		if (csid->phy.en_vc & BIT(i)) {
> +			val =3D readl(csid->base + CSID_CSI2_RDIN_IRQ_STATUS(i));
> +			writel(val, csid->base + CSID_CSI2_RDIN_IRQ_CLEAR(i));
> +
> +			if (val & INFO_RUP_DONE) {
> +				__csid_addr_update_clear(csid, i);
> +				__csid_reg_update_clear(csid, i);
> +			}
> +
> +			if (buf_done_val & BIT(BUF_DONE_IRQ_STATUS_RDI_OFFSET + i))
> +				camss_buf_done(csid->camss, csid->id, i);
> +		}
> +	}

[Severity: Medium]
As reported by bod@kernel.org on v24 [1], can concurrent updates to
csid->addr_update and csid->reg_update race between process context and
csid_isr()?

Process context (VIDIOC_QBUF -> vfe_queue_buffer_v2() under
vfe->output_lock, or csid_configure_stream() without locking) and
csid_isr() perform unsynchronized read-modify-write updates on
csid->addr_update and csid->reg_update and write the multi-port bitmask to
CSID_AUP_CMD and CSID_RUP_CMD:

CPU0 (process)                    CPU1 (<hardirq>)
vfe_queue_buffer_v2()
  spin_lock_irqsave(&vfe->output_lock)
  __csid_addr_update(csid, 0)
    reg =3D csid->addr_update
                                  csid_isr()
                                    __csid_addr_update_clear(csid, 1)
                                      csid->addr_update &=3D ~BIT(9)
    csid->addr_update =3D reg | BIT(8)
    writel(csid->addr_update, ...)  <-- re-sets stale BIT(9)

An interrupt on another CPU can also lose the newly set bit if the store in
__csid_addr_update_clear() lands last. In addition, inside the csid_isr()
loop, camss_buf_done() for port i calls vfe_buf_done() ->
__csid_addr_update() before higher-numbered ports j > i have had
INFO_RUP_DONE checked and cleared, writing their still-set bits back to
CSID_AUP_CMD and CSID_RUP_CMD.

[ ... ]

> +/**
> + * csid_reset - Trigger reset on CSID module and wait to complete
> + * @csid: CSID device
> + *
> + * Return 0 on success or a negative error code otherwise
> + */

[Severity: Low]
The kernel-doc comments above csid_isr() and csid_reset() use "Return"
instead of "Return:", which causes scripts/kernel-doc to warn that no
return value description was found.

> +static int csid_reset(struct csid_device *csid)
> +{
> +	unsigned long time;
> +	u32 val;
> +	int i;
> +
> +	reinit_completion(&csid->reset_complete);
> +
> +	val =3D INFO_RST_DONE | BUF_DONE_IRQ_STATUS;
> +	writel(val, csid->base + CSID_TOP_IRQ_CLEAR);
> +	writel(val, csid->base + CSID_TOP_IRQ_MASK);
> +
> +	val =3D 0;
> +	for (i =3D 0; i < MSM_CSID_MAX_SRC_STREAMS_1080; i++) {
> +		if (csid->phy.en_vc & BIT(i)) {
> +			/*
> +			 * Only need to clear buf done IRQ status here,
> +			 * RUP done IRQ status will be cleared once isr
> +			 * strobe generated by CSID_RST_CMD
> +			 */
> +			val |=3D BIT(BUF_DONE_IRQ_STATUS_RDI_OFFSET + i);
> +		}
> +	}
> +	writel(val, csid->base + CSID_BUF_DONE_IRQ_CLEAR);
> +	writel(val, csid->base + CSID_BUF_DONE_IRQ_MASK);

[Severity: Medium]
Can csid_reset() leave stale bits in csid->addr_update and
csid->reg_update, or leave CSID_BUF_DONE_IRQ_MASK masked for RDI ports
linked after power-on?

When csid_isr() handles a buffer completion, camss_buf_done() ->
vfe_buf_done() sets csid->addr_update and csid->reg_update for the next
buffer, and CSID_CSI2_RDIN_IRQ_MASK is never unmasked to deliver a
standalone INFO_RUP_DONE interrupt. When streaming stops and a port is
unlinked, neither csid_configure_stream() nor csid_reset() clears
csid->addr_update or csid->reg_update, so starting a different RDI port
later re-issues AUP and RUP commands for the stopped port.

Furthermore, CSID_BUF_DONE_IRQ_MASK is only programmed here in csid_reset()
from the bits set in csid->phy.en_vc at power-on time, and is never updated
in csid_configure_stream(). If a second RDI link is enabled via
MEDIA_IOC_SETUP_LINK while the CSID entity is already powered,
CSID_BUF_DONE_IRQ_MASK remains masked for that port and buffer completions
stall.

[1] https://lore.kernel.org/r/179406039659.650304.183461297349639175.b4-rep=
ly@b4

--=20
Sashiko AI review =C2=B7 https://sashiko.dev/#/patchset/20261112-kaanapali-=
camss-v25-0-1d709f57f370@oss.qualcomm.com?part=3D9
