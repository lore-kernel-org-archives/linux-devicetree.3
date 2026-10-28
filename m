Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=100.103.45.18
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1793201778;
	b=x8Tl2ytXe51PF6L5p6mq2ksdnJL3cJbctb2eQf7X8/LpMtZDS6ReMChtssrLqVIqTaO9
	 H+XOAEA5nuLqjxrqf+ea1ejNFa+HqS8Q1tiZBMwYwc401l+P1R8/TI1odUWq2RtsfN2zd
	 TCo7a8AiLD80R2QVBV+EeET8CHIl07eF6i4y35g/B8kFeFVb8oGD4fOwgfcxEXj9KbKjJ
	 xA2MM5Rk/K6v5+wT18s8QuYukYmllqmVENE12VjyFaGOIpxVsIbLpRfXJwwBUQa3L7tI9
	 wekZqJFPYX+Nr8BM3nmhKMm9QPlpVPDpK7ArqAFcT42J4MV7TVwGjkgO4WPnKUMwdgg==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1793201778;
	h=Received:DKIM-Signature:Message-ID:From:Subject:Reply-To:To:Cc:
	 In-Reply-To:References:Content-Type:Content-Transfer-Encoding:Date;
	bh=NcBMAsscOX++K8Pwqm1G7DDSp4gQMpAWt2lAFd4UW3U=;
	b=ppJrjRWb1zbVmUktReEJAYUF1iePEjOQQq5wdCY+9yw63lqIBpVLAjRGki3TMHnHAHfn
	 79utfN6gnvqo/LhqmuR+9S9PYSPwmbO/h2IhF/EiP88JCoKn+oHNf1wA8Q1ZQVhBUyhga
	 6FwXSOrmd3QrwdowH63wRkBoQC6xebAb0jnk4KqLhYsJTIj+WSpCtiEUbfybMN3q0QT66
	 0wFEf3LWr6HkK7f6heV79y24CIKfwHz7kzJQeRb0zl23VIxI/bcNOOJTFIv+no+Tnz9u2
	 ElEKIEp2k1iV8oiOwNalHEJvBkv0Wudrkau5sXm1AVGOBaXf/VibOp7XjWERntayvgg==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dkim=pass header.d=kernel.org header.i=@kernel.org header.a=rsa-sha256 header.s=k20260515 header.b="ENS9tKz/";
	arc=none smtp.remote-ip=100.103.45.18
Received: from smtp.kernel.org (quasi.space.kernel.org [100.103.45.18])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id EEF8960A2604
	for <devicetree@vger.kernel.org>; Wed, 28 Oct 2026 15:36:17 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key, unprotected) header.d=kernel.org header.i=@kernel.org header.a=rsa-sha256 header.s=k20260515 header.b=ENS9tKz/
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 4A14D1F01242;
	Wed, 28 Oct 2026 15:36:17 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kernel.org;
	s=k20260515; t=1793201777;
	bh=NcBMAsscOX++K8Pwqm1G7DDSp4gQMpAWt2lAFd4UW3U=;
	h=From:Subject:Reply-To:To:Cc:In-Reply-To:References:Date;
	b=ENS9tKz/j5zjSyLFESyOhELFO/mfE2g7oUwFcvJAANP9VQCBp5Lzz9xozhTOymmAS
	 ywBrDUq8hEIxjJcy2oWiem72saWgu0XFUvzRh4eQEz/WSynXNRwqbu0AL0uLuG7k5d
	 mJRmk+p9gn+nGxZt4KR7j0xrNis4WONi7IccBrP/Ia5rhR6M12vnaDWLjYOjeyewCI
	 oIQTuoa1D+vvtY+ZfOxY+i/npzjeO1yTVCdiiF8qctzsYz6Fr9BA7C87u4Hp0ZwCm/
	 z441abUJbh1OdHqlzTo1DGU8xW9ULPlQHe4ttqHNiHIl/8fTKVBuywlVWjCFntM2US
	 bvx8AiUKSuDVg==
Message-ID: <sashiko-outbox-188060@kernel.org>
From: sashiko-bot@kernel.org
Subject: Re: [PATCH v23 09/15] media: qcom: camss: csid: Add support for
 CSID 1080
Reply-To: sashiko-reviews@lists.linux.dev
To: "Hangxiang Ma" <hangxiang.ma@oss.qualcomm.com>
Cc: linux-phy@lists.infradead.org, devicetree@vger.kernel.org, robh@kernel.org, conor+dt@kernel.org, media-ci@linuxtv.org, vkoul@kernel.org, neil.armstrong@linaro.org, olteanv@gmail.com
In-Reply-To: <20261028-kaanapali-camss-v23-9-95f250b18612@oss.qualcomm.com>
References: <20261028-kaanapali-camss-v23-0-95f250b18612@oss.qualcomm.com>
 <20261028-kaanapali-camss-v23-9-95f250b18612@oss.qualcomm.com>
Content-Type: text/plain; charset=utf-8
Content-Transfer-Encoding: quoted-printable
Date: Wed, 28 Oct 2026 15:36:16 +0000
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
- [High] media: qcom: camss: out-of-bounds fmt access in __csid_configure_r=
di_stream()
- [Medium] media: qcom: camss: csid-1080: race on addr_update and reg_updat=
e bitmasks
- [Low] media: qcom: camss: unused variable lane_cnt in __csid_configure_rd=
i_stream()
--

commit a4bf52311267182465594dfcec0df1e6e7980755
Author: Hangxiang Ma <hangxiang.ma@oss.qualcomm.com>

media: qcom: camss: csid: Add support for CSID 1080

This commit adds hardware resource definitions and driver support for the
CSID 1080 module on the Qualcomm Kaanapali SoC, including RUP/AUP register
update handling, stream configuration, reset, and BUF_DONE interrupt
handling.

> diff --git a/drivers/media/platform/qcom/camss/camss-csid-1080.c b/driver=
s/media/platform/qcom/camss/camss-csid-1080.c
> new file mode 100644
> index 0000000000000..3d90d31201fa5
> --- /dev/null
> +++ b/drivers/media/platform/qcom/camss/camss-csid-1080.c

[ ... ]

> +#define MSM_CSID_MAX_SRC_STREAMS_1080		(csid_is_lite(csid) ? 4 : 5)

[ ... ]

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
> +
> +	if (!lane_cnt)
> +		lane_cnt =3D 4;

[Severity: Low]
In __csid_configure_rdi_stream(), lane_cnt is initialized and updated here
but never read anywhere in the function. Will this trigger an
-Wunused-but-set-variable warning?

> +
> +	val =3D RDI_CFG0_TIMESTAMP_EN;
> +	val |=3D RDI_CFG0_TIMESTAMP_STB_SEL;
> +	val |=3D RDI_CFG0_RETIME_BS;
> +
> +	/* note: for non-RDI path, this should be format->decode_format */
> +	val |=3D DECODE_FORMAT_PAYLOAD_ONLY << RDI_CFG0_DECODE_FORMAT;
> +	val |=3D vc << RDI_CFG0_VC;
> +	val |=3D format->data_type << RDI_CFG0_DT;
> +	writel(val, csid->base + CSID_RDI_CFG0(port));
> +
> +	val =3D RDI_CFG1_PACKING_FORMAT_MIPI;
> +	writel(val, csid->base + CSID_RDI_CFG1(port));
> +
> +	/* Configure pixel store using dedicated register in 1080 */
> +	if (!csid_is_lite(csid))
> +		__csid_configure_rdi_pix_store(csid, port);
> +
> +	val =3D 0;
> +	writel(val, csid->base + CSID_RDI_CTRL(port));
> +
> +	val =3D readl(csid->base + CSID_RDI_CFG0(port));
> +
> +	if (enable)
> +		val |=3D RDI_CFG0_EN;
> +
> +	writel(val, csid->base + CSID_RDI_CFG0(port));
> +}
> +
> +static void csid_configure_stream(struct csid_device *csid, u8 enable)
> +{
> +	u8 i, k;
> +
> +	__csid_configure_rx(csid, &csid->phy);
> +
> +	for (i =3D 0; i < MSM_CSID_MAX_SRC_STREAMS_1080; i++) {
> +		if (csid->phy.en_vc & BIT(i)) {
> +			__csid_configure_rdi_stream(csid, enable, i, 0);

[Severity: High]
Can this read past the end of csid->fmt[] on non-lite CSID 1080 instances?

For non-lite instances (CSID0, CSID1, CSID2 in csid_res_kaanapali),
MSM_CSID_MAX_SRC_STREAMS_1080 evaluates to 5, so csid_configure_stream()
iterates i from 0 to 4 and passes port =3D 4 into
__csid_configure_rdi_stream().

Inside __csid_configure_rdi_stream(), input_format is computed as:

	struct v4l2_mbus_framefmt *input_format =3D &csid->fmt[MSM_CSID_PAD_FIRST_=
SRC + port];

However, in drivers/media/platform/qcom/camss/camss-csid.h,
MSM_CSID_PAD_FIRST_SRC is 1 and MSM_CSID_PADS_NUM is still 5:

	#define MSM_CSID_PAD_SINK 0
	#define MSM_CSID_PAD_FIRST_SRC 1
	#define MSM_CSID_PADS_NUM 5
	...
	struct csid_device {
		...
		struct media_pad pads[MSM_CSID_PADS_NUM];
		...
		struct v4l2_mbus_framefmt fmt[MSM_CSID_PADS_NUM];

When port is 4, MSM_CSID_PAD_FIRST_SRC + port is 5, which indexes one
element past the end of csid->fmt[5] when reading input_format->code (and
msm_csid_register_entity() only registers 4 source pads). Should
MSM_CSID_PADS_NUM and MSM_CSID_MAX_SRC_STREAMS be updated to accommodate
the 5th RDI stream, or should MSM_CSID_MAX_SRC_STREAMS_1080 be capped to
the number of source pads?

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

[ ... ]

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

[Severity: Medium]
Could the unlocked updates to csid->addr_update and csid->reg_update here
race with vfe_queue_buffer_v2() and vfe_enable_output_v2(), or re-trigger
updates for other RDI ports?

In drivers/media/platform/qcom/camss/camss-vfe.c, vfe_queue_buffer_v2() and
vfe_enable_output_v2() call ops->addr_update() and ops->reg_update() while
holding vfe->output_lock:

	vfe_queue_buffer_v2()
	  spin_lock_irqsave(&vfe->output_lock, flags);
	  ops->addr_update(vfe, line->id)
	    -> csid_subdev_addr_update()
	      -> __csid_addr_update()
	  ops->reg_update(vfe, line->id)
	    -> csid_subdev_reg_update()
	      -> __csid_reg_update()

In csid_isr(), __csid_addr_update_clear() and __csid_reg_update_clear()
modify csid->addr_update and csid->reg_update without holding
vfe->output_lock or a CSID spinlock. If csid_isr() runs on one CPU while
vfe_queue_buffer_v2() or vfe_enable_output_v2() runs on another CPU, the
read-modify-write on csid->addr_update and csid->reg_update can lose a
newly set RDI bit or write a stale cleared bit back into CSID_AUP_CMD and
CSID_RUP_CMD.

Also, within this loop in csid_isr(), camss_buf_done() -> vfe_buf_done() is
called for port i before INFO_RUP_DONE is checked and cleared for ports
j > i. When vfe_buf_done() calls __csid_addr_update(csid, i), it writes the
entire csid->addr_update bitmask to CSID_AUP_CMD while completed ports
j > i still have their CSID_RUP_AUP_RDI(j) bits set. Should INFO_RUP_DONE
be processed for all ports before invoking camss_buf_done(), or does
CSID_AUP_CMD / CSID_RUP_CMD only need CSID_RUP_AUP_RDI(port_id) written
directly?

--=20
Sashiko AI review =C2=B7 https://sashiko.dev/#/patchset/20261028-kaanapali-=
camss-v23-0-95f250b18612@oss.qualcomm.com?part=3D9
