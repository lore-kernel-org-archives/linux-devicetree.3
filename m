Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=100.103.45.18
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1794657350;
	b=dEJjULmCbliLtlNFpTkGy3Jdp35YK1mcPr9QI9VTwDj+vCWQNvP9Avvt0O8tQkNS5UH4
	 c+tDC9H2yhajGGmfwAvCKMyeVKv2JHqN06tZzvYI5JidJNEKPpzckBPpWlEORPcsprdOc
	 +ybhaRFnG4LZs4NxgotuecAXMfS9P20x/8NAQCbv2nSvKQlbGBC+GMwLa781DqhDMz10D
	 +f4z8qrXx24Pg8sjBbYwm01PbpBfINJWHNiD+hOAL9JvJ7wMB6K6X28n/y4pBd7Fe7Uml
	 WxzP65rqm/k4Uipp+2Y8tlwiwQXMxqZBNxAth90mh/mpqyskJfIiSJ6Vimh2P9NmT0w==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1794657350;
	h=Received:DKIM-Signature:Message-ID:From:Subject:Reply-To:To:Cc:
	 In-Reply-To:References:Content-Type:Content-Transfer-Encoding:Date;
	bh=4/Q1bfzHfAdx4wt2Qbi+egQJKxl84zjDLUbFA3DRoSQ=;
	b=anKXFkmSwK2f8hd4QiRvUK6bhY6Bx+FcFMp6gtk7Xj+JGI6CDhT9LkkiwnW/TJu+64/s
	 g2DFwQUMnOTXeIiykEZX6N+Y7Mpi1azKe/OqftozRXnsb5UMpGUXK53VlRM2F9csctbv0
	 HjEE9q0M5wiJo8F1hhjsXctJVRKLGc9mWDk8pXDCr5NWmdTtN90/K/2cRNinLvORifiM9
	 CzK5BankUhDJ5pzRyK2t13Cz+aQgVCZlW7ievOouX63MsobwFnoQN2fp4D9qr3YjYp8hJ
	 dqEkX/0H1K/ray1iRqfLn2itScgeBe+j+0aoQabVusfJ8+/7XypPnSaT4GNppVtvFqg==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dkim=pass header.d=kernel.org header.i=@kernel.org header.a=rsa-sha256 header.s=k20260515 header.b="Zahy/hNq";
	arc=none smtp.remote-ip=100.103.45.18
Received: from smtp.kernel.org (quasi.space.kernel.org [100.103.45.18])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id ED07E606A327
	for <devicetree@vger.kernel.org>; Sat, 14 Nov 2026 11:55:49 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.a=rsa-sha256 header.s=k20260515 header.b=Zahy/hNq
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 154761F000C5;
	Sat, 14 Nov 2026 11:55:49 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kernel.org;
	s=k20260515; t=1794657349;
	bh=4/Q1bfzHfAdx4wt2Qbi+egQJKxl84zjDLUbFA3DRoSQ=;
	h=From:Subject:Reply-To:To:Cc:In-Reply-To:References:Date;
	b=Zahy/hNqmGQJOjs0QgTtqR8oGTtXJ8fNe5guB89mnjz002biupVowEMq5Olf9oKih
	 EcAZTHdMEh4ao5TZTLh6LffeRBb7mqdcbjqrJgW8itLPuipSP8DWSd3NAcu/pGg1wz
	 sM23i6E3/aEJoLbxbMdLa3+U473hiGJ36YmDxzpeaAMh4wZ/p8AJjAklz/HwQuPKK4
	 93LFjDFsj//Y5jevCVR5VujtQNbRkXuUVd3RD5cGvhxsXuwFX5TQ1i4qElFFiehuu8
	 XrhGazTCUy89P/71Q3rWi8gM5T/q8F8LUmoh9J+mv3ZJg+VxBD/PTgGJQpwRX7OVZW
	 BWudybVwsq0LQ==
Message-ID: <sashiko-outbox-214437@kernel.org>
From: sashiko-bot@kernel.org
Subject: Re: [PATCH v7 10/23] media: qcom: camss: csid: Add support for CSID
 980
Reply-To: sashiko-reviews@lists.linux.dev
To: "Wenmeng Liu" <wenmeng.liu@oss.qualcomm.com>
Cc: linux-phy@lists.infradead.org, devicetree@vger.kernel.org, robh@kernel.org, conor+dt@kernel.org, media-ci@linuxtv.org, vkoul@kernel.org, neil.armstrong@linaro.org, olteanv@gmail.com
In-Reply-To: <20261114-add-support-for-camss-on-sm8750-v7-10-8ff2a11835f6@oss.qualcomm.com>
References: <20261114-add-support-for-camss-on-sm8750-v7-0-8ff2a11835f6@oss.qualcomm.com>
 <20261114-add-support-for-camss-on-sm8750-v7-10-8ff2a11835f6@oss.qualcomm.com>
Content-Type: text/plain; charset=utf-8
Content-Transfer-Encoding: quoted-printable
Date: Sat, 14 Nov 2026 11:55:48 +0000
X-Mailing-List: devicetree@vger.kernel.org
List-Id: <devicetree.vger.kernel.org>
List-Post: <mailto:devicetree@vger.kernel.org>
List-Help: <mailto:devicetree+help@vger.kernel.org>
List-Subscribe: <mailto:devicetree+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:devicetree+unsubscribe@vger.kernel.org>
List-Owner: <mailto:devicetree+owner@vger.kernel.org>
Precedence: list

Thank you for your contribution! Sashiko AI review found 3 potential
issues to consider:
- [High] media: qcom: camss: wrong dt_id calculation in
  __csid_configure_rdi_stream()
- [Medium] media: qcom: camss: misplaced lane_cnt fallback in
  camss-csid-980.c
- [Medium] media: qcom: camss: race on csid->reg_update and addr_update
  in csid-980
--

commit ad1ff7fa26120bcd2005c8cf69d816599d94898f
Author: Hangxiang Ma <hangxiang.ma@oss.qualcomm.com>

media: qcom: camss: csid: Add support for CSID 980

This commit adds the CSID 980 hardware operations driver and populates
the SM8750 CSID subdevice resource definitions.

> diff --git a/drivers/media/platform/qcom/camss/camss-csid-980.c b/drivers=
/media/platform/qcom/camss/camss-csid-980.c
> new file mode 100644
> index 0000000000000..713db25cd8c65
> --- /dev/null
> +++ b/drivers/media/platform/qcom/camss/camss-csid-980.c
> @@ -0,0 +1,466 @@

[ ... ]

> +static void __csid_configure_rx(struct csid_device *csid,
> +				struct csid_phy_config *phy)
> +{
> +	int val;
> +
> +	val =3D (phy->lane_cnt - 1) << CSI2_RX_CFG0_NUM_ACTIVE_LANES;
> +	val |=3D phy->lane_assign << CSI2_RX_CFG0_DL0_INPUT_SEL;
> +	val |=3D (phy->csiphy_id + CSI2_RX_CFG0_PHY_SEL_BASE_IDX)
> +	       << CSI2_RX_CFG0_PHY_NUM_SEL;
> +	writel(val, csid->base + CSID_CSI2_RX_CFG0);
> +
> +	val =3D CSI2_RX_CFG1_ECC_CORRECTION_EN;
> +	writel(val, csid->base + CSID_CSI2_RX_CFG1);
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

[Severity: Medium]
Was the lane_cnt fallback meant to be in __csid_configure_rx() instead of
__csid_configure_rdi_stream()?

In __csid_configure_rdi_stream(), lane_cnt is never read after being set,
which triggers a -Wunused-but-set-variable warning under W=3D1 (and precedes
the variable declarations below).  Meanwhile, __csid_configure_rx() uses
phy->lane_cnt - 1 directly in signed int arithmetic, so if phy->lane_cnt
is 0 (for instance, when csid_set_stream() disables a stream after
csid_set_power() without an active sink link), val becomes -1 and corrupts
all fields written to CSID_CSI2_RX_CFG0.

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
> +	u32 rdi_cfg0_offset =3D CSID_RDI_CFG0(port);
> +	u32 rdi_cfg1_offset =3D CSID_RDI_CFG1(port);
> +	u32 rdi_ctrl_offset =3D CSID_RDI_CTRL(port);
> +
> +	val =3D RDI_CFG0_TIMESTAMP_EN;
> +	val |=3D RDI_CFG0_TIMESTAMP_STB_SEL;
> +	val |=3D RDI_CFG0_RETIME_BS;
> +
> +	/* note: for non-RDI path, this should be format->decode_format */
> +	val |=3D DECODE_FORMAT_PAYLOAD_ONLY << RDI_CFG0_DECODE_FORMAT;
> +	val |=3D vc << RDI_CFG0_VC;
> +	val |=3D format->data_type << RDI_CFG0_DT;
> +	val |=3D dt_id << RDI_CFG0_DT_ID;
> +	writel(val, csid->base + rdi_cfg0_offset);

[ ... ]

> +static void csid_configure_stream(struct csid_device *csid, u8 enable)
> +{
> +	u8 i, k;
> +
> +	__csid_configure_rx(csid, &csid->phy);
> +
> +	for (i =3D 0; i < MSM_CSID_MAX_SRC_STREAMS_980; i++) {
> +		if (csid->phy.en_vc & BIT(i)) {
> +			__csid_configure_rdi_stream(csid, enable, i, 0);

[Severity: High]
Should dt_id in __csid_configure_rdi_stream() be derived from port & 0x03
rather than vc & 0x03?

csid_configure_stream() always passes vc =3D 0 while passing the RDI channel
index i as port.  Calculating dt_id from vc sets RDI_CFG0_DT_ID to 0 for
every RDI channel, so RDI1, RDI2, and RDI3 all receive internal CID 0 and
cannot stream properly, matching the issue fixed for CSID GEN3 in commit
ad136e52634d ("media: qcom: camss: Fix RDI streaming for CSID GEN3") and
for CSID GEN2 in commit 618765634cef ("media: qcom: camss: Fix RDI
streaming for CSID GEN2").

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
> +	for (i =3D 0; i < MSM_CSID_MAX_SRC_STREAMS_980; i++) {
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
Can __csid_addr_update_clear() and __csid_reg_update_clear() in csid_isr()
race with concurrent updates to csid->reg_update and csid->addr_update?

In camss-vfe.c, vfe_queue_buffer_v2(), vfe_enable_output_v2(), and
vfe_buf_done() hold vfe->output_lock while calling the CSID addr_update
and reg_update callbacks, which perform non-atomic read-modify-write
updates on csid->reg_update and csid->addr_update.  However, csid_isr()
clears bits in csid->addr_update and csid->reg_update before
camss_buf_done() is called and without holding vfe->output_lock:

CPU0                              CPU1 (<hardirq>)
vfe_queue_buffer_v2()
  spin_lock_irqsave(&vfe->output_lock)
  __csid_addr_update(csid, i)
    csid->reg_update |=3D AUP_RDI(i)
    writel(csid->reg_update,
           CSID_LITE_RUP_AUP_CMD)
                                  csid_isr()
                                    if (val & INFO_RUP_DONE)
                                      __csid_addr_update_clear(csid, i)
                                        csid->reg_update &=3D ~AUP_RDI(i)
  __csid_reg_update(csid, i)
    csid->reg_update |=3D RUP_RDI(i)
    writel(csid->reg_update, ...) <-- overwrites CMD with AUP_RDI(i) cleared

On CSID Lite, where RUP and AUP share csid->reg_update and the
CSID_LITE_RUP_AUP_CMD register, this race can clear a newly queued AUP bit
in hardware before it is consumed, and across multiple active RDI ports it
can lose or retain stale update bits in csid->reg_update and
csid->addr_update.

--=20
Sashiko AI review =C2=B7 https://sashiko.dev/#/patchset/20261114-add-suppor=
t-for-camss-on-sm8750-v7-0-8ff2a11835f6@oss.qualcomm.com?part=3D10
