Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=100.103.45.18
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1793949177;
	b=tUvj3u+8Qm9CmGPQI9qxo2RIAnnRT2d84/Dx6Jre3j9RlcfgcuMWQjjb9CyBWaUuENxC
	 p54m5g3UDlDP2QOpotLcEpYH88zb/oxRR8dKA07aWKJ7Qf6agomiU1zhjmh14YAiY7ZPs
	 tfBTVc8MidS+6xbWn9J/+dajGrZGzvuEeJOQJImrpV7h9/XOOq3x+jvnHoC4tb4A73FLf
	 MHwboYzwjFqFhJ2aydGwia8J9jjDF8GJHwZWlzr5V+z/FIxYrim/U1Nmat0+98EYMubbS
	 qNGfgRyZOYVBu3cSzCUzEGKveHZWOliusPQYamxSijd3B30L41fjdoW9trR8jP/6s3A==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1793949177;
	h=Received:DKIM-Signature:Message-ID:From:Subject:Reply-To:To:Cc:
	 In-Reply-To:References:Content-Type:Content-Transfer-Encoding:Date;
	bh=5XLHt4ws72v48Z4v6bAzP2rEp3zyelYVNcBAKn+rWw4=;
	b=1nm5ByylCKx/xszz0BkaFsLzhWJctpPqqNSdqdhZL5IVTJZTP1Z2tGP9ht1839A0WQjc
	 IeYYrV9eYryVOdi/SBvM2ZhcmukwcDIK/w3AxIooA8y3kv7A3dummKcwdqwY1n7LmpPcw
	 /RSwsEPLDIhqqo9KVGx2xbgq+332reGD8byXfeZO4aCenKIVznuJlpw7gqgO84ckTP5gF
	 bqVmzbfAcBuswbAUaOmXMXzlr8mDz5Pl9xZaMKVpreXh0wLE1yXcMZRBBAJ5LJB/J1zfk
	 Kr8F58KxBvM91lit1ol/JDf5U5jpgozQhwtM3Sdt2alvq0c59t2L2chhg2oSY0hDcLw==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dkim=pass header.d=kernel.org header.i=@kernel.org header.a=rsa-sha256 header.s=k20260515 header.b=mYv7bpXx;
	arc=none smtp.remote-ip=100.103.45.18
Received: from smtp.kernel.org (quasi.space.kernel.org [100.103.45.18])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id C726B606EE82
	for <devicetree@vger.kernel.org>; Fri,  6 Nov 2026 07:12:56 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key, unprotected) header.d=kernel.org header.i=@kernel.org header.a=rsa-sha256 header.s=k20260515 header.b=mYv7bpXx
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 23CE41F008A5;
	Fri,  6 Nov 2026 07:12:56 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kernel.org;
	s=k20260515; t=1793949176;
	bh=5XLHt4ws72v48Z4v6bAzP2rEp3zyelYVNcBAKn+rWw4=;
	h=From:Subject:Reply-To:To:Cc:In-Reply-To:References:Date;
	b=mYv7bpXxoTN7QXBqQXDD9DAK+Eue3xRiIB0U1wjD1Aeg2BQPvPkvxgdRk/zXY7pcS
	 XRn4+uv88gx6h9gWC2sJp1w7caG8i1EWQX39S/ak5+fW0vdA80G9AkSRuKPuko4mnn
	 i6Lt8AKbNcE4l8DIEsZuNAEIW15dnJrS6vJNpt0/FqE1qmKEQXYuRTj5So64MiZI5g
	 N197i17O8aKtL8CCMeweNKjw8Tz2w+x6RK+t0tDIKQbmjWJsbVpGUu8wlYG2WayI6I
	 KCwRiOPKgCGjeinLh4Qph27Rht5rReTfMxMYrjvlTAaOCqgn5UpNxltwGAaXF+6TPV
	 Zt+TSrhIgwKBA==
Message-ID: <sashiko-outbox-200974@kernel.org>
From: sashiko-bot@kernel.org
Subject: Re: [PATCH v4 6/6] media: qcom: camss: Add support for Hawi
Reply-To: sashiko-reviews@lists.linux.dev
To: "Nihal Kumar Gupta" <nihal.gupta@oss.qualcomm.com>
Cc: devicetree@vger.kernel.org, linux-phy@lists.infradead.org, robh@kernel.org, conor+dt@kernel.org, media-ci@linuxtv.org, vkoul@kernel.org, neil.armstrong@linaro.org, olteanv@gmail.com
In-Reply-To: <20261106-hawi-maili-camss-v4-6-d528c7a797b4@oss.qualcomm.com>
References: <20261106-hawi-maili-camss-v4-0-d528c7a797b4@oss.qualcomm.com>
 <20261106-hawi-maili-camss-v4-6-d528c7a797b4@oss.qualcomm.com>
Content-Type: text/plain; charset=utf-8
Content-Transfer-Encoding: quoted-printable
Date: Fri, 06 Nov 2026 07:12:55 +0000
X-Mailing-List: devicetree@vger.kernel.org
List-Id: <devicetree.vger.kernel.org>
List-Post: <mailto:devicetree@vger.kernel.org>
List-Help: <mailto:devicetree+help@vger.kernel.org>
List-Subscribe: <mailto:devicetree+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:devicetree+unsubscribe@vger.kernel.org>
List-Owner: <mailto:devicetree+owner@vger.kernel.org>
Precedence: list

Thank you for your contribution! Sashiko AI review found 5 potential
issues to consider:
- [High] media: qcom: camss: unconditional AUP strobes in
  csid_configure_stream()
- [Medium] media: qcom: camss: race on csid->addr_update and
  csid->reg_update
- [Medium] media: qcom: camss: wrong camnoc_rt_axi clock rates in
  vfe_res_hawi
- [Low] media: qcom: camss: duplicate CSID/VFE 1080 code and inaccurate
  changelog
- [Low] media: qcom: camss: commit message mismatch with hawi_resources
--

commit 56bf9cdebfcac8b831c8b140e2703b5aa2fdcc78
Author: Hangxiang Ma <hangxiang.ma@oss.qualcomm.com>

media: qcom: camss: Add support for Hawi

This commit adds CAMSS support for the Qualcomm Hawi SoC, including CSID
1190, VFE 1190, and the Hawi subdevice resource tables.

> diff --git a/drivers/media/platform/qcom/camss/camss-csid-1190.c b/driver=
s/media/platform/qcom/camss/camss-csid-1190.c
> new file mode 100644
> index 0000000000000..4bd2cce094402
> --- /dev/null
> +++ b/drivers/media/platform/qcom/camss/camss-csid-1190.c

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
Can concurrent updates to csid->addr_update and csid->reg_update race with
csid_isr()?

vfe_queue_buffer_v2() and vfe_enable_output_v2() call ops->addr_update() and
ops->reg_update() under vfe->output_lock, whereas csid_isr() clears those
bitmasks on INFO_RUP_DONE without holding vfe->output_lock or a CSID
spinlock, and csid_configure_stream() sets them without a spinlock:

CPU0                                  CPU1 (<hardirq>)
vfe_queue_buffer_v2()                 csid_isr()
  spin_lock_irqsave(&vfe->output_lock)
  ...                                   __csid_addr_update_clear(csid, i)
  __csid_addr_update(csid, port_id)       load csid->addr_update
    load csid->addr_update                and ~CSID_RUP_AUP_RDI(i)
    or CSID_RUP_AUP_RDI(port_id)          store csid->addr_update
    store csid->addr_update  <-- clobbers clear (or loses set bit)
    writel(csid->addr_update, ...)

This data race can drop a pending RDI address or register update or
re-write a stale RDI bit to CSID_AUP_CMD and CSID_RUP_CMD.

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
Does unconditionally issuing CAMSS_INIT_BUF_COUNT address updates here
desynchronize the hardware write master when fewer than two buffers are
queued before VIDIOC_STREAMON?

Because vb2_queue.min_queued_buffers is 0 in msm_video_register(),
vfe_enable_output_v2() only programs VFE_BUS_WM_IMAGE_ADDR for as many
pending buffers as are actually queued (0, 1, or 2):

drivers/media/platform/qcom/camss/camss-vfe.c:vfe_enable_output_v2() {
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
}

csid_configure_stream() then runs and triggers two __csid_addr_update()
strobes even if 0 or 1 buffer was written to VFE_BUS_WM_IMAGE_ADDR (and also
when enable is 0 or on other link-enabled RDI ports in csid->phy.en_vc).
Latching uninitialized or duplicate buffer addresses into the hardware FIFO
and then issuing further addr_update strobes from vfe_queue_buffer_v2() when
buffers arrive while active_num < 2 corrupts buffer tracking and DMA target
addresses.

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
This isn't a bug, but camss-csid-1190.c is register-for-register and
functionally identical to camss-csid-1080.c, including the unused local
variable lane_cnt in __csid_configure_rdi_stream().  Could csid_res_hawi
reuse csid_ops_1080 directly instead of duplicating the file, and could
camss-vfe-1190.c share the identical helper functions with camss-vfe-1080.c?

> diff --git a/drivers/media/platform/qcom/camss/camss.c b/drivers/media/pl=
atform/qcom/camss/camss.c
> index 7976796dca598..70d4306581a23 100644
> --- a/drivers/media/platform/qcom/camss/camss.c
> +++ b/drivers/media/platform/qcom/camss/camss.c
> @@ -4308,6 +4308,218 @@ static const struct resources_icc icc_res_sa8775p=
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
Do the camnoc_rt_axi frequencies in vfe_res_hawi (VFE0 through VFE4) match
the Hawi CAMCC clock driver?

In drivers/clk/qcom/camcc-hawi.c, ftbl_cam_cc_camnoc_rt_axi_clk_src defines
the supported rates on Hawi as 19.2 MHz, 120 MHz, 160 MHz, 240 MHz, 320 MHz,
and a maximum of 480 MHz:

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

When vfe_set_clock_rates() selects 600 MHz for a min_rate between 480 MHz
and 600 MHz, clk_round_rate() clamps the rate down to 480 MHz, causing a
subsequent vfe_check_clock_rates() call on the same VFE to fail with -EBUSY
because clk_get_rate() is below min_rate.

[ ... ]

> @@ -6030,6 +6242,21 @@ static const struct camss_resources sm8650_resourc=
es =3D {
>  	.vfe_num =3D ARRAY_SIZE(vfe_res_sm8650),
>  };
> =20
> +static const struct camss_resources hawi_resources =3D {
> +	.version =3D CAMSS_HAWI,
> +	.pd_name =3D "top",
> +	.pm_clks =3D { "cpas_fast_ahb", "cpas_ahb", "gcc_axi_hf" },
> +	.tpg_res =3D tpg_res_8775p,
> +	.csid_res =3D csid_res_hawi,
> +	.vfe_res =3D vfe_res_hawi,
> +	.icc_res =3D icc_res_hawi,
> +	.icc_path_num =3D ARRAY_SIZE(icc_res_hawi),
> +	.csiphy_num =3D 6,
> +	.tpg_num =3D ARRAY_SIZE(tpg_res_8775p),
> +	.csid_num =3D ARRAY_SIZE(csid_res_hawi),
> +	.vfe_num =3D ARRAY_SIZE(vfe_res_hawi),
> +};

[Severity: Low]
Does the commit message match hawi_resources?

The changelog states that the CSIPHY resource table is reused from Kaanapal=
i,
the TPG table is reused from X1E80100, and the common CPAS clocks are manag=
ed
as PM clocks rather than per-VFE clocks.  However, hawi_resources sets
.tpg_res to tpg_res_8775p (not tpg_res_x1e80100), has no .csiphy_res table,
and vfe_res_hawi still lists the shared cpas_mnoc_hf and cpas_mnoc_sf clocks
in every VFE entry rather than in .pm_clks.

--=20
Sashiko AI review =C2=B7 https://sashiko.dev/#/patchset/20261106-hawi-maili=
-camss-v4-0-d528c7a797b4@oss.qualcomm.com?part=3D6
