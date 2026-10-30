Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=100.103.45.18
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1793365672;
	b=SKCgWp2kHd5t1z7kWm/1FpWdcmpE1mkXzeKNUEbBi3v1HeBuhCbvL48h+WQgRhvKAvIo
	 thPAgecE0kZqgdbTTgMhGYyllQ8ODctStgOrA9LMKFYDJCZt9snN2nbx07DcseO2/Mnzj
	 ewDFQWgZ61b00HHidNEG00O7MR4c2+R8UEzRNI9ZpCD5dR9iTxD7k0FuQOExPd3QK/AwI
	 xNEJBrmJ14z4+cwJDPR+OZS24XUw+5Dkb3kLLdo0jfMNEokz9p8BKmsY/ejpt+ZCxeAXl
	 N/8WKOx4mY42nb7V2wFcCbW16lz/4VNruwmjXRFys5VeJP6wD4C1oSBrmLPkzDBPz6g==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1793365672;
	h=Received:DKIM-Signature:Message-ID:From:Subject:Reply-To:To:Cc:
	 In-Reply-To:References:Content-Type:Content-Transfer-Encoding:Date;
	bh=JT+3LP+5QyAnCVRh6Qv6QLpMg9XRGcsCRkKadZAigA4=;
	b=RDHzwe1CfDIjGQYs6VSHxWcbPzOziPUSP3wnqb41dVJaRz8BXxIrW8GIDRxBgQvms2Qd
	 HDYgL98kILuLsv/dInCtMzfCxJ9O8jsn6TmXhRnFO0gfTtDS6IWmQp27gLprKumJHjP0a
	 4JEH4J6E9fPAcbI8iX1iP3Lcvt4G5HAaUw3j5FdjavB8qKhl5qj6VQW5DJZJQuJ28Dh9w
	 2vaHVtnA25S6TVDrkmOPYNU+LA6D3m51FtuyfBB1fzhGSVzhhI7xEiFXaxULg2ivsGoHb
	 YOiupf1uN5lvv1SmTlpsR05e+7+5sGsK+WOLT8XIMs3ZcSfxedfL5sLO8GMEScuR6xg==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dkim=pass header.d=kernel.org header.i=@kernel.org header.a=rsa-sha256 header.s=k20260515 header.b=ZtjjYszc;
	arc=none smtp.remote-ip=100.103.45.18
Received: from smtp.kernel.org (quasi.space.kernel.org [100.103.45.18])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id B638B606A333
	for <devicetree@vger.kernel.org>; Fri, 30 Oct 2026 13:07:51 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key, unprotected) header.d=kernel.org header.i=@kernel.org header.a=rsa-sha256 header.s=k20260515 header.b=ZtjjYszc
Received: by smtp.kernel.org (Postfix) with ESMTPSA id EEE6D1F00A1D;
	Fri, 30 Oct 2026 13:07:50 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kernel.org;
	s=k20260515; t=1793365671;
	bh=JT+3LP+5QyAnCVRh6Qv6QLpMg9XRGcsCRkKadZAigA4=;
	h=From:Subject:Reply-To:To:Cc:In-Reply-To:References:Date;
	b=ZtjjYszcVqxuNf1vJaZ5617YkWrVLiATvGy8kOq1LjUFiZHUbDkmLI9/1WSPDWgIq
	 9DAPfW8qRvTerOOtM4/L19CzLjdsl0/oCnIXg8/fdtfIaIKIYtGxpYhXaYuzbdRSbJ
	 FTqSuVwACG4flQTj26aNzwXBv8I5+ueYbEA8feWRzpYNJxSpptzKAU9RgOSb06b7xV
	 Ro9vNcXQVGfOgH9xvtgPENje5nKGVc0ngff2WxpQd2HVrmWZhuLhFsiv3neYoGmy2c
	 +LKc0aL+3vBZv8kgD4GXqcZynMbI+Qgm8uhYHzgl7mwXA2Sb41j+d0OgXHA4Rc1fcO
	 wEeiGKNSGxPtQ==
Message-ID: <sashiko-outbox-191048@kernel.org>
From: sashiko-bot@kernel.org
Subject: Re: [PATCH v3 5/5] media: qcom: camss: Add support for Hawi
Reply-To: sashiko-reviews@lists.linux.dev
To: "Nihal Kumar Gupta" <nihal.gupta@oss.qualcomm.com>
Cc: devicetree@vger.kernel.org, linux-phy@lists.infradead.org, robh@kernel.org, conor+dt@kernel.org, media-ci@linuxtv.org, vkoul@kernel.org, neil.armstrong@linaro.org, olteanv@gmail.com
In-Reply-To: <20261030-hawi-maili-camss-v3-5-9742bca8cef2@oss.qualcomm.com>
References: <20261030-hawi-maili-camss-v3-0-9742bca8cef2@oss.qualcomm.com>
 <20261030-hawi-maili-camss-v3-5-9742bca8cef2@oss.qualcomm.com>
Content-Type: text/plain; charset=utf-8
Content-Transfer-Encoding: quoted-printable
Date: Fri, 30 Oct 2026 13:07:50 +0000
X-Mailing-List: devicetree@vger.kernel.org
List-Id: <devicetree.vger.kernel.org>
List-Post: <mailto:devicetree@vger.kernel.org>
List-Help: <mailto:devicetree+help@vger.kernel.org>
List-Subscribe: <mailto:devicetree+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:devicetree+unsubscribe@vger.kernel.org>
List-Owner: <mailto:devicetree+owner@vger.kernel.org>
Precedence: list

Thank you for your contribution! Sashiko AI review found 6 potential issue(=
s) to consider:
- [High] media: qcom: camss: unconditional AUP strobes in csid_configure_st=
ream()
- [High] media: camss: NULL hw_ops deref in msm_csiphy_subdev_init_legacy()
- [Medium] media: qcom: camss: wrong camnoc_rt_axi clock rates in vfe_res_h=
awi
- [Medium] media: qcom: camss: data race on csid->addr_update and csid->reg=
_update
- [Low] media: qcom: camss: duplicate CSID 1080 and VFE 1080 code in 1190 f=
iles
- [Low] media: qcom: camss: macros in camss-csid-1190.c implicitly capture =
csid
--

commit 25967aac8ac2c5b636dbbaab24c84dd484d99ab8
Author: Hangxiang Ma <hangxiang.ma@oss.qualcomm.com>

media: qcom: camss: Add support for Hawi

This commit adds CAMSS support for the Hawi SoC, including CSID 1190 and
VFE 1190 hardware operations and Hawi resource definitions.

> diff --git a/drivers/media/platform/qcom/camss/camss-csid-1190.c b/driver=
s/media/platform/qcom/camss/camss-csid-1190.c
> new file mode 100644
> index 0000000000000..4bd2cce094402
> --- /dev/null
> +++ b/drivers/media/platform/qcom/camss/camss-csid-1190.c
> @@ -0,0 +1,417 @@

[ ... ]

> +#define MSM_CSID_MAX_SRC_STREAMS_1190		(csid_is_lite(csid) ? 4 : 5)
> +
> +/* RDI Configuration */
> +#define CSID_RDI_CFG0(rdi)	(csid_is_lite(csid) ?\
> +					(0x3080 + 0x200 * (rdi)) :\
> +					(0x5480 + 0x200 * (rdi)))
> +#define		RDI_CFG0_RETIME_BS			BIT(5)
> +#define		RDI_CFG0_TIMESTAMP_EN			BIT(6)
> +#define		RDI_CFG0_TIMESTAMP_STB_SEL		BIT(8)
> +#define		RDI_CFG0_DECODE_FORMAT			12
> +#define		RDI_CFG0_DT				16
> +#define		RDI_CFG0_VC				22
> +#define		RDI_CFG0_EN				BIT(31)
> +
> +/* RDI Control and Configuration */
> +#define CSID_RDI_CTRL(rdi)	(csid_is_lite(csid) ?\
> +					(0x3088 + 0x200 * (rdi)) :\
> +					(0x5488 + 0x200 * (rdi)))
> +#define		RDI_CTRL_START_CMD			BIT(0)
> +
> +#define CSID_RDI_CFG1(rdi)	(csid_is_lite(csid) ?\
> +					(0x3094 + 0x200 * (rdi)) :\
> +					(0x5494 + 0x200 * (rdi)))

[Severity: Low]
As reported by Sashiko on v2 [1], this isn't a bug, but
MSM_CSID_MAX_SRC_STREAMS_1190, CSID_RDI_CFG0(rdi), CSID_RDI_CTRL(rdi), and
CSID_RDI_CFG1(rdi) in drivers/media/platform/qcom/camss/camss-csid-1190.c
expand to expressions calling csid_is_lite(csid) without taking csid as a
macro parameter. Should these macros take csid explicitly instead of relying
on a local variable named csid in the caller's scope?

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
> +	/* Hardware clears the registers upon consuming the settings */
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
> +	/* Hardware clears the registers upon consuming the settings */
> +	csid->reg_update &=3D ~CSID_RUP_AUP_RDI(port_id);
> +}

[Severity: Medium]
As reported by Sashiko on v2 [1], can __csid_addr_update() and
__csid_reg_update() race with __csid_addr_update_clear() and
__csid_reg_update_clear() on csid->addr_update and csid->reg_update?

In drivers/media/platform/qcom/camss/camss-csid-1190.c, __csid_addr_update()
and __csid_reg_update() perform non-atomic read-modify-write operations on
csid->addr_update and csid->reg_update before writing CSID_AUP_CMD and
CSID_RUP_CMD.

Meanwhile, in hardirq context, csid_isr() clears those fields when
INFO_RUP_DONE is set without holding any lock:

drivers/media/platform/qcom/camss/camss-csid-1190.c:csid_isr() {
    ...
			if (val & INFO_RUP_DONE) {
				__csid_addr_update_clear(csid, i);
				__csid_reg_update_clear(csid, i);
			}
    ...
}

Because vfe_queue_buffer_v2() and vfe_enable_output_v2() only hold
vfe->output_lock (which csid_isr() does not acquire before camss_buf_done())
and csid_configure_stream() holds no spinlock, concurrent updates from proc=
ess
context (for example during VIDIOC_QBUF or when starting multiple RDI strea=
ms
sharing a CSID) and hardirq context can clobber bits in csid->addr_update a=
nd
csid->reg_update.

[ ... ]

> +static void csid_configure_stream(struct csid_device *csid, u8 enable)
> +{
> +	u8 i, k;
> +
> +	__csid_configure_rx(csid, &csid->phy);
> +
> +	for (i =3D 0; i < MSM_CSID_MAX_SRC_STREAMS_1190; i++) {
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
What happens in csid_configure_stream() if VIDIOC_STREAMON is called with
fewer than CAMSS_INIT_BUF_COUNT (2) buffers queued?

In msm_video_register() in drivers/media/platform/qcom/camss/camss-video.c,
vb2_queue.min_queued_buffers is 0, so vb2_core_streamon() invokes
vb2_start_streaming() -> video_start_streaming() even when 0 or 1 buffer is
queued before VIDIOC_STREAMON.

video_start_streaming() first calls vfe_set_stream() -> vfe_enable_v2() ->
vfe_enable_output_v2(), which dequeues only the available pending buffers (0
or 1) and writes their addresses via ops->vfe_wm_update():

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

Next, video_start_streaming() calls csid_set_stream() ->
csid_configure_stream(), which unconditionally loops CAMSS_INIT_BUF_COUNT (=
2)
times calling __csid_addr_update(csid, i) regardless of how many buffers we=
re
queued in vfe_enable_output_v2(). Moreover, vfe_wm_stop() in
drivers/media/platform/qcom/camss/camss-vfe-1190.c only clears
VFE_BUS_WM_CFG(wm) without clearing VFE_BUS_WM_IMAGE_ADDR(wm).

When userspace later queues buffers via VIDIOC_QBUF, vfe_queue_buffer_v2()
sees output->state =3D=3D VFE_OUTPUT_ON and output->gen2.active_num < 2, and
issues additional ops->addr_update() and ops->reg_update() strobes:

drivers/media/platform/qcom/camss/camss-vfe.c:vfe_queue_buffer_v2() {
    ...
	if (output->state =3D=3D VFE_OUTPUT_ON &&
	    output->gen2.active_num < 2) {
		output->buf[output->gen2.active_num++] =3D buf;
		ops->vfe_wm_update(vfe, output->wm_idx[0],
				   buf->addr[0], line);
		if (ops->addr_update)
			ops->addr_update(vfe, line->id);
		ops->reg_update(vfe, line->id);
	}
    ...
}

Doesn't issuing two unconditional __csid_addr_update() strobes in
csid_configure_stream() latch stale or duplicate DMA addresses in the write
master and desynchronize buffer tracking when fewer than two buffers were
queued before streamon?

[ ... ]

> +const struct csid_hw_ops csid_ops_1190 =3D {
> +	.configure_stream =3D csid_configure_stream,
> +	.configure_testgen_pattern =3D csid_configure_testgen_pattern,
> +	.hw_version =3D csid_hw_version,
> +	.isr =3D csid_isr,
> +	.reset =3D csid_reset,
> +	.src_pad_code =3D csid_src_pad_code,
> +	.subdev_init =3D csid_subdev_init,
> +	.reg_update =3D csid_subdev_reg_update,
> +	.addr_update =3D csid_subdev_addr_update,
> +};

[Severity: Low]
This isn't a bug, but every register offset, bitmask macro, stream count
definition, helper function, interrupt handler, reset routine, and hardware
operation callback in drivers/media/platform/qcom/camss/camss-csid-1190.c
(including the unused lane_cnt local variable in
__csid_configure_rdi_stream()) is identical to
drivers/media/platform/qcom/camss/camss-csid-1080.c.

Similarly, drivers/media/platform/qcom/camss/camss-vfe-1190.c duplicates all
functions and callbacks of drivers/media/platform/qcom/camss/camss-vfe-1080=
.c
verbatim, differing only in the BUS_REG_BASE and write master register offs=
et
macros.

Could csid_res_hawi reuse csid_ops_1080 directly (just as hawi_resources
reuses csiphy_res_kaanapali and tpg_res_x1e80100), and could the common VFE
1080/1190 helpers be shared?

> diff --git a/drivers/media/platform/qcom/camss/camss.c b/drivers/media/pl=
atform/qcom/camss/camss.c
> index df4b4cf30711b..0a67d4f746eeb 100644
> --- a/drivers/media/platform/qcom/camss/camss.c
> +++ b/drivers/media/platform/qcom/camss/camss.c
> @@ -4359,6 +4359,218 @@ static const struct resources_icc icc_res_sa8775p=
[] =3D {
>  	},
>  };
> =20
> +static const struct camss_subdev_resources vfe_res_hawi[] =3D {
> +	/* VFE0 - TFE Full */
> +	{
> +		.clock =3D { "vfe0_fast_ahb", "vfe0", "cpas_vfe0",
> +			   "camnoc_rt_axi", "camnoc_nrt_axi", "qdss_debug_xo",
> +			   "cpas_mnoc_hf", "cpas_mnoc_sf" },
> +		.clock_rate =3D { { 0 },
> +				{ 238200000, 397000000, 440000000, 480000000,
> +				  630000000, 750000000, 833000000 },
> +				{ 0 },
> +				{ 171428571, 240000000, 300000000, 400000000,
> +				  480000000, 600000000 },

[Severity: Medium]
Are the camnoc_rt_axi clock rates in vfe_res_hawi (for VFE0 through VFE4)
matching the Hawi CAMCC clock driver?

In drivers/clk/qcom/camcc-hawi.c, ftbl_cam_cc_camnoc_rt_axi_clk_src for
qcom,hawi-camcc defines a maximum rate of 480 MHz:

drivers/clk/qcom/camcc-hawi.c:
static const struct freq_tbl ftbl_cam_cc_camnoc_rt_axi_clk_src[] =3D {
	F(19200000, P_BI_TCXO, 1, 0, 0),
	F(120000000, P_CAM_CC_PLL6_OUT_EVEN, 4, 0, 0),
	F(160000000, P_CAM_CC_PLL6_OUT_EVEN, 3, 0, 0),
	F(240000000, P_CAM_CC_PLL6_OUT_EVEN, 2, 0, 0),
	F(320000000, P_CAM_CC_PLL6_OUT_EVEN, 1.5, 0, 0),
	F(480000000, P_CAM_CC_PLL6_OUT_EVEN, 1, 0, 0),
	{ }
};

(Whereas the 200/240/300/400/480/600 MHz table
ftbl_cam_cc_camnoc_rt_axi_clk_src_maili is only used for qcom,maili-camcc, =
and
171428571 Hz is in neither table.)

When vfe_get() -> vfe_set_clock_rates() runs with min_rate between 480 MHz =
and
600 MHz, it selects 600000000 Hz from vfe_res_hawi instead of rejecting the
rate, and clk_round_rate() on Hawi clamps it down to 480000000 Hz. When the
second pipeline entity calls vfe_get() -> vfe_check_clock_rates(), won't
clk_get_rate(clock->clk) < min_rate cause vfe_check_clock_rates() to fail w=
ith
-EBUSY?

[ ... ]

> @@ -6078,6 +6290,22 @@ static const struct camss_resources sm8650_resourc=
es =3D {
>  	.vfe_num =3D ARRAY_SIZE(vfe_res_sm8650),
>  };
> =20
> +static const struct camss_resources hawi_resources =3D {
> +	.version =3D CAMSS_HAWI,
> +	.pd_name =3D "top",
> +	.pm_clks =3D { "cpas_fast_ahb", "cpas_ahb", "gcc_axi_hf" },
> +	.csiphy_res =3D csiphy_res_kaanapali,

[Severity: High]
As reported by Sashiko on v2 [2], can reusing csiphy_res_kaanapali in
hawi_resources lead to a NULL pointer dereference in
msm_csiphy_subdev_init_legacy() during probe?

The entries in csiphy_res_kaanapali do not set .csiphy.hw_ops, leaving hw_o=
ps
as NULL. During camss_probe() -> camss_init_subdevices(),
camss_detect_legacy_phy() defaults camss->legacy_phy to true:

drivers/media/platform/qcom/camss/camss.c:camss_detect_legacy_phy() {
	camss->legacy_phy =3D true;

	/* Find first remote-endpoint and determine if its a PHY */
	for_each_endpoint_of_node(camss->dev->of_node, ep) {
        ...
}

If the qcom,hawi-camss node has no endpoints in its ports node (for example,
when enabling CAMSS to use its internal Test Pattern Generators without
external sensors or PHYs), camss->legacy_phy remains true.
camss_init_subdevices() then calls msm_csiphy_subdev_init_legacy(), which
unconditionally dereferences csiphy->res->hw_ops:

drivers/media/platform/qcom/camss/camss-csiphy.c:msm_csiphy_subdev_init_leg=
acy() {
    ...
	ret =3D csiphy->res->hw_ops->init(csiphy);
    ...
}

[1] https://lore.kernel.org/r/20261013-hawi-maili-camss-v2-7-fc93222da89c@o=
ss.qualcomm.com
[2] https://lore.kernel.org/r/20261013-hawi-maili-camss-v2-6-fc93222da89c@o=
ss.qualcomm.com

--=20
Sashiko AI review =C2=B7 https://sashiko.dev/#/patchset/20261030-hawi-maili=
-camss-v3-0-9742bca8cef2@oss.qualcomm.com?part=3D5
