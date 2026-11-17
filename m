Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=100.103.45.18
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1794898035;
	b=gApVfgT7PHTl1j/f7DXv4HebvSsM5UHMgJv/Tox7Zy1dhOq2qjR4PQ0EQ3S4jplzmvqv
	 C0W1qEcawl3DnmwKlFmMlWnnQkC8scEp8DogLXu5OUhwZqyAf3AH2eNqos8d5BSiacpFY
	 Kx97K7TxhkeBbE9K1uwD0l2kNTQWrRP0gxp7X49am0zemV/JStAMUBT0oW6qUMoeV45NW
	 /reBNzM0QrOXCmeHn+DSTCluPzLwq8vR98rU7ep3zbze3//VED6z/kZ6FgdMweabpsb0W
	 +1eK2/AYBeXww1j8bTA5TTpAI3hySTNdVSXtpMNCkA1uvUL62/6Ym/dJxUwA15fFI9g==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1794898035;
	h=Received:DKIM-Signature:Message-ID:From:Subject:Reply-To:To:Cc:
	 In-Reply-To:References:Content-Type:Content-Transfer-Encoding:Date;
	bh=HY4O32y5OFsGlmJaGpz2RIOwU2yqM/oDcgp5vERNpck=;
	b=rC9rbabNWiDGZi3QtxvoMnsiOpJnnRpNwuRHPnGqKe9Jo+nsKkZ2qk8tcvhslX2uJPkA
	 zLmlR6UIUmnnrTiiIVMw5vQM1uSuP9jN08lmWe913kQvu9r8SYjkekl9E1060IBHbr/fP
	 eJSo79PjObZh+dFlYmQeE+lji/lp2bq4RWS3vueEfnozqehzEbuGYqBODEkTHtBnqgddw
	 m535m1l4MAa5CQAcuCUENuS4QHByfKuPO3j7giFacG5ezSFCQrVWI2WmvlxoQ4pVkgB5M
	 tXre94juiUyAzNV/ioGx+ATAPwaE3/bGIO8NEWNVLX6qu1JCbgCwaY+QQMddK//xoPQ==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dkim=pass header.d=kernel.org header.i=@kernel.org header.a=rsa-sha256 header.s=k20260515 header.b=h44a8zGo;
	arc=none smtp.remote-ip=100.103.45.18
Received: from smtp.kernel.org (quasi.space.kernel.org [100.103.45.18])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id D6E48606A31C
	for <devicetree@vger.kernel.org>; Tue, 17 Nov 2026 06:47:15 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.a=rsa-sha256 header.s=k20260515 header.b=h44a8zGo
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 16B131F000C4;
	Tue, 17 Nov 2026 06:47:15 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kernel.org;
	s=k20260515; t=1794898035;
	bh=HY4O32y5OFsGlmJaGpz2RIOwU2yqM/oDcgp5vERNpck=;
	h=From:Subject:Reply-To:To:Cc:In-Reply-To:References:Date;
	b=h44a8zGoqWc81hDOvRl7O1TEJGkR3k2H837pi/vZM54akW2psti3dN6TSVCLAy8mJ
	 yeD+koRWF9FLnb4Nf44dOmBnwk9HAm/+sSN1MevnOP92SctQbSi4ash9xQNTU+xfKM
	 y9NHci46luhk2XgvHKc0mAyib4O9BWVIcacESpYpzgtsxqXV5ULzjA+zMjZmvy6Osk
	 x1nkxlFNQfw4dvgdrA1giAbFiRxwBnO5ErHBuwV7z1vyIcFaIoHRZQuBuPpVVtjsqX
	 Jeip3YSwLHcgV3lDncWJnzj6Bozfa8a0w7GoIcx5mHvOCZDbp57osCySF0MzUyPezC
	 FwiUUK2vD3TIA==
Message-ID: <sashiko-outbox-218278@kernel.org>
From: sashiko-bot@kernel.org
Subject: Re: [PATCH v3 2/5] media: iris: Add support for Eliza
Reply-To: sashiko-reviews@lists.linux.dev
To: "Wangao Wang" <wangao.wang@oss.qualcomm.com>
Cc: devicetree@vger.kernel.org, robh@kernel.org, conor+dt@kernel.org, media-ci@linuxtv.org
In-Reply-To: <20261117-add_iris_for_eliza-v3-2-02a55a9272ef@oss.qualcomm.com>
References: <20261117-add_iris_for_eliza-v3-0-02a55a9272ef@oss.qualcomm.com>
 <20261117-add_iris_for_eliza-v3-2-02a55a9272ef@oss.qualcomm.com>
Content-Type: text/plain; charset=utf-8
Content-Transfer-Encoding: quoted-printable
Date: Tue, 17 Nov 2026 06:47:14 +0000
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
- [High] media: iris: NULL dereference in iris_set_slice_count() on
  Eliza
- [High] media: iris: broken watchdog handling in eliza_data due to
  missing wd_intr_mask
- [Medium] media: iris: zero peak bandwidth in iris_set_icc_bw() on
  Eliza
--

commit ce18526ddc6f609e07e690d6181970e4db456f5c
Author: Wangao Wang <wangao.wang@oss.qualcomm.com>

media: iris: Add support for Eliza

This commit adds platform data, firmware description, and device tree match
entries to support the VPU3.3 Iris video codec on Qualcomm Eliza.

> diff --git a/drivers/media/platform/qcom/iris/iris_platform_vpu3x.c b/dri=
vers/media/platform/qcom/iris/iris_platform_vpu3x.c
> index e963cb116313f..f16f94a2dacc6 100644
> --- a/drivers/media/platform/qcom/iris/iris_platform_vpu3x.c
> +++ b/drivers/media/platform/qcom/iris/iris_platform_vpu3x.c

[ ... ]

> @@ -87,6 +93,45 @@ static const struct tz_cp_config tz_cp_config_vpu3[] =
=3D {
>  	},
>  };
> =20
> +/*
> + * Shares most of SM8550 data except:
> + * - firmware_desc_gen2 to iris_vpu33_p2_s7_gen2_desc
> + * - vpu_ops to iris_vpu33_ops
> + * - clk_rst_tbl to sm8650_clk_reset_table
> + * - controller_rst_tbl to sm8650_controller_reset_table
> + * - inst_caps to platform_inst_cap_qcs8300 (4K capable, 2 VPP pipes)
> + */
> +const struct iris_platform_data eliza_data =3D {
> +	.firmware_desc_gen2 =3D &iris_vpu33_p2_s7_gen2_desc,
> +	.vpu_ops =3D &iris_vpu33_ops,
> +	.icc_tbl =3D iris_icc_info_vpu3x,
> +	.icc_tbl_size =3D ARRAY_SIZE(iris_icc_info_vpu3x),
> +	.clk_rst_tbl =3D sm8650_clk_reset_table,
> +	.clk_rst_tbl_size =3D ARRAY_SIZE(sm8650_clk_reset_table),
> +	.controller_rst_tbl =3D sm8650_controller_reset_table,
> +	.controller_rst_tbl_size =3D ARRAY_SIZE(sm8650_controller_reset_table),
> +	.bw_tbl_dec =3D iris_bw_table_dec_vpu3x,
> +	.bw_tbl_dec_size =3D ARRAY_SIZE(iris_bw_table_dec_vpu3x),
> +	.pmdomain_tbl =3D iris_pmdomain_table_vpu3x,
> +	.pmdomain_tbl_size =3D ARRAY_SIZE(iris_pmdomain_table_vpu3x),
> +	.opp_pd_tbl =3D iris_opp_pd_table_vpu3x,
> +	.opp_pd_tbl_size =3D ARRAY_SIZE(iris_opp_pd_table_vpu3x),
> +	.clk_tbl =3D sm8550_clk_table,
> +	.clk_tbl_size =3D ARRAY_SIZE(sm8550_clk_table),
> +	.opp_clk_tbl =3D iris_opp_clk_table_vpu3x,
> +	/* Upper bound of DMA address range */
> +	.dma_mask =3D 0xe0000000 - 1,
> +	.inst_iris_fmts =3D iris_fmts_vpu3x_dec,
> +	.inst_iris_fmts_size =3D ARRAY_SIZE(iris_fmts_vpu3x_dec),
> +	.inst_caps =3D &platform_inst_cap_qcs8300,
> +	.tz_cp_config_data =3D tz_cp_config_vpu3,

[Severity: High]
Should eliza_data set .slice_caps =3D &iris_vpu2_vpu3x_slice_caps like the
other VPU3x platforms?

iris_vpu33_p2_s7_gen2_desc uses iris_hfi_gen2_data, which exposes the
V4L2_CID_MPEG_VIDEO_MULTI_SLICE_MODE control with .set =3D
iris_set_slice_count.  With .slice_caps left NULL, selecting a multi-slice
mode (V4L2_MPEG_VIDEO_MULTI_SLICE_MODE_MAX_MB or
V4L2_MPEG_VIDEO_MULTI_SLICE_MODE_MAX_BYTES) causes a NULL pointer
dereference in iris_set_slice_count() when it reads
slice_caps->max_slice_frame_rate.

> +	.tz_cp_config_data_size =3D ARRAY_SIZE(tz_cp_config_vpu3),
> +	.num_vpp_pipe =3D 2,
> +	.max_session_count =3D 16,

[Severity: High]
Is eliza_data missing .wd_intr_mask =3D WRAPPER_INTR_STATUS_A2HWD_BMSK?

iris_vpu33_ops unmasks WRAPPER_INTR_MASK_A2HWD_BMSK in hardware via
iris_vpu_interrupt_init(), while iris_vpu_clear_interrupt() and
iris_vpu_watchdog() check core->iris_platform_data->wd_intr_mask.  Leaving
wd_intr_mask as 0 prevents iris_vpu_watchdog() from detecting a VPU
watchdog timeout, skipping error recovery and causing
iris_hfi_isr_handler() to re-enable the level-triggered IRQ while the
hardware watchdog interrupt remains asserted.

> +	.max_core_mbpf =3D NUM_MBS_4K * 2,
> +	.max_core_mbps =3D NUM_MBS_4K * 60,
> +};

[Severity: Medium]
Should eliza_data also initialize .icc_ib_multiplier =3D 1?  Without it,
iris_set_icc_bw() computes core->icc_tbl[i].peak_bw =3D bw_kbps *
icc_ib_multiplier as 0 and always votes zero peak bandwidth on the
video-mem interconnect path.

--=20
Sashiko AI review =C2=B7 https://sashiko.dev/#/patchset/20261117-add_iris_f=
or_eliza-v3-0-02a55a9272ef@oss.qualcomm.com?part=3D2
