Received: from smtp.kernel.org (aws-us-west-2-korg-mail-alma10-1.taild15c8.ts.net [100.103.45.18])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 1B35940B10D
	for <devicetree@vger.kernel.org>; Fri, 11 Sep 2026 15:59:54 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=100.103.45.18
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1789142395; cv=none; b=tcO9mp1/QKkUtQSlnWV/w0037hIXOAObmMj4faAgG+vKQnjYlCutwt2dZGNlwjiTaaucMoyy09FvmamJIrt6pW6yIMpPxCycdyedi/LOPkaJ0fCH5QvdngAWSVBee4Of4VbR0Rfw0OQwEv+RbxMf3vkmsjFJWZoDWz+H3poZ+WA=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1789142395; c=relaxed/simple;
	bh=Xy9e9OQ4Zrq0BG3idFmHBw8k7j3vNhfGg76yiPsUcpw=;
	h=From:Subject:To:Cc:In-Reply-To:References:Content-Type:Date:
	 Message-Id; b=JZ8NKK1+Azrr3jiae+BpJPoQT+GvuTU56v0SmpR5dq2tlQth6DmG/Sj4CMN3pSA5JraWoCVZIbivwvtMLpe9P77G3Lk6mhgBWvViHVmEvAVjvz5H0LUKT8yPqspTuKMSPB8cf/JZCLhBd9UOcPW+UEwyL6Q8nNJ66BLiINj3NcQ=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=TLM+tlPC; arc=none smtp.client-ip=100.103.45.18
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="TLM+tlPC"
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 7B2421F000FF;
	Fri, 11 Sep 2026 15:59:53 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kernel.org;
	s=k20260515; t=1789142394;
	bh=e1ZkIJ7dgQuKeYMRuEnRCVfbeVmVIydE09qYycLBhmM=;
	h=From:Subject:Reply-To:To:Cc:In-Reply-To:References:Date;
	b=TLM+tlPCNKZrtiagr0tyafKrRRijAYaEmSdfTfcRbRijg2M9x1vzVuXCzVrBBTWP6
	 siMWbT6ATQioBw2Uy95PUTzEOgPOsX/x6Qw01NS2TVq3E5HxKX/j4FiKJ/S2NqhGJY
	 jsWXrFQR4UdjWhG38/W1hSIr45tbl7FDezCKo5+Uj6LaBTiFqn8VAYzaTIZTo3dC7X
	 MJv6srlOyLcFoxnfNSWh8zstQz/nubQsbiZ43HLkKMzAlLhQJTBFL/Nztd9XW/wI4N
	 ddd8X918+b4flL/uXsnllwXEbBkpA2aU10RdDtNOJvqbKPlBPPF93idp8XsUmNmBCn
	 4cgc1bfmar8yA==
From: sashiko-bot@kernel.org
Subject: Re: [PATCH 04/17] drm/msm/dpu: Add support for DPU 12.1 on Nord
Reply-To: sashiko-reviews@lists.linux.dev
To: "Nabige Aala" <nabige.aala@oss.qualcomm.com>
Cc: olteanv@gmail.com, devicetree@vger.kernel.org, robh@kernel.org, vkoul@kernel.org, dri-devel@lists.freedesktop.org, neil.armstrong@linaro.org, conor+dt@kernel.org, linux-phy@lists.infradead.org
In-Reply-To: <20260911-nord-drv-dt-v1-4-e25c073cf1b6@oss.qualcomm.com>
References: <20260911-nord-drv-dt-v1-0-e25c073cf1b6@oss.qualcomm.com>
 <20260911-nord-drv-dt-v1-4-e25c073cf1b6@oss.qualcomm.com>
Content-Type: text/plain; charset=utf-8
Content-Transfer-Encoding: quoted-printable
Date: Fri, 11 Sep 2026 15:59:53 +0000
Message-Id: <20260911155953.7B2421F000FF@smtp.kernel.org>
Precedence: bulk
X-Mailing-List: devicetree@vger.kernel.org
List-Id: <devicetree.vger.kernel.org>
List-Subscribe: <mailto:devicetree+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:devicetree+unsubscribe@vger.kernel.org>

Thank you for your contribution! Sashiko AI review found 2 potential issue(=
s) to consider:
- [High] Adding `INTF_9` and `INTF_10` without corresponding entries in `en=
um dpu_hw_intr_reg` causes the `MDP_INTFn_INTR()` macro to silently alias w=
ith legacy DSI TEAR interrupts, leading to fatal unclocked hardware accesse=
s.
- [High] Including inferred, unverified dummy register addresses and bus ma=
pper IDs in an upstream hardware catalog.
--

commit bd1cb43210104c822d361350ae75f5b63854edc7
Author: Mahadevan P <mahadevan.p@oss.qualcomm.com>

drm/msm/dpu: Add support for DPU 12.1 on Nord

This commit adds the DPU catalog entry for the Qualcomm Nord SoC (MDSS 12.1=
),
a DP-only chip with 8 DSPP blocks, 2 writeback blocks, 8 interfaces and 2 DP
controllers. It extends the interface enum with INTF_9 and INTF_10 and adds
inferred hardware catalog entries marked with FIXME.

> diff --git a/drivers/gpu/drm/msm/disp/dpu1/catalog/dpu_12_1_nord.h b/driv=
ers/gpu/drm/msm/disp/dpu1/catalog/dpu_12_1_nord.h
> new file mode 100644
> index 0000000000000..8eb18752f3c4b
> --- /dev/null
> +++ b/drivers/gpu/drm/msm/disp/dpu1/catalog/dpu_12_1_nord.h
[ ... ]
> +static const struct dpu_wb_cfg nord_wb[] =3D {
> +	{
> +		.name =3D "wb_1", .id =3D WB_1,
> +		.base =3D 0x64800, .len =3D 0x2c8, /* FIXME(REG_ADDR): inferred */
> +		.features =3D WB_SDM845_MASK,
> +		.format_list =3D wb2_formats_rgb_yuv,
> +		.num_formats =3D ARRAY_SIZE(wb2_formats_rgb_yuv),
> +		.xin_id =3D 7, /* FIXME(XIU_MAP): inferred */

[Severity: High]
Is it safe to include inferred register base addresses and bus mapper IDs t=
hat
haven't been verified against actual hardware?

When the driver probes on Nord, it will unconditionally map and access these
unverified addresses. If the inferred base address is incorrect, accessing
this region will likely hit invalid physical memory and cause an immediate
bus error.

[ ... ]
> +static const struct dpu_intf_cfg nord_intf[] =3D {
> +	{
[ ... ]
> +		.name =3D "intf_4", .id =3D INTF_4,
> +		.base =3D 0x38000, .len =3D 0x4bc, /* FIXME(REG_ADDR): new, stride +0x=
1000 */

[Severity: High]
Similarly here, will accessing this unverified INTF_4 base address cause a
system crash if the guessed stride is incorrect for this SoC?

[ ... ]
> diff --git a/drivers/gpu/drm/msm/disp/dpu1/dpu_hw_mdss.h b/drivers/gpu/dr=
m/msm/disp/dpu1/dpu_hw_mdss.h
> index 0e65bf5ddc4a6..7eccb4d2c65ef 100644
> --- a/drivers/gpu/drm/msm/disp/dpu1/dpu_hw_mdss.h
> +++ b/drivers/gpu/drm/msm/disp/dpu1/dpu_hw_mdss.h
> @@ -226,6 +226,8 @@ enum dpu_intf {
>  	INTF_6,
>  	INTF_7,
>  	INTF_8,
> +	INTF_9,
> +	INTF_10,
>  	INTF_MAX
>  };

[Severity: High]
Does adding INTF_9 and INTF_10 without updating enum dpu_hw_intr_reg cause
an interrupt mapping collision?

Looking at MDP_INTFn_INTR in dpu_hw_interrupts.h:

#define MDP_INTFn_INTR(intf)    (MDP_INTF0_INTR + (intf - INTF_0))

When this maps INTF_9 (index 10) and INTF_10 (index 11), they evaluate to
offsets 12 and 13 respectively. In enum dpu_hw_intr_reg, offsets 12 and 13
are already mapped to MDP_INTF1_TEAR_INTR and MDP_INTF2_TEAR_INTR.

During driver probe, dpu_hw_intr_init() uses this macro to populate the
irq_mask. Since Nord is DP-only and explicitly lacks the INTF_1 and INTF_2
hardware blocks, will dpu_clear_irqs() iterating over this mask attempt to
write to unmapped TEAR registers and cause an unrecoverable bus fault?

--=20
Sashiko AI review =C2=B7 https://sashiko.dev/#/patchset/20260911-nord-drv-d=
t-v1-0-e25c073cf1b6@oss.qualcomm.com?part=3D4
