Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=100.103.45.18
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1794957433;
	b=iu637ChnQtRO88LeMTsa7zZ66fqzr63odvst0fHNLg0+2vAFue5hCByVfKX/e/MDQemP
	 ik8Z8EO79qqumhHjJO1a7/OB6s281bS+7RDZ5R23IMsLbMofggtXSYZN0WCDLWcvKyBC2
	 NZuGr0zZLrjA8Xh1AQoLJ0qQ/aBvyxtK24TdQEp0eAdMPCOHy6UYYte0+g7MIDK91bVZB
	 NV8Trpz1yemi8JlCTE5pGfwscbXmdlXKyAgNt1lBgU/9uvn5OQEgyonFZuZHqG4flIn5K
	 v2W0s7911UHGrFQ9dJtHjWRljecQU181X7MYGh8XwUXAqKpOsrf3xAeIq6WMDmxhMjw==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1794957433;
	h=Received:DKIM-Signature:Message-ID:From:Subject:Reply-To:To:Cc:
	 In-Reply-To:References:Content-Type:Content-Transfer-Encoding:Date;
	bh=Lrd7pfsA/gpXWlBfBjdzCjvJ1tm4d5drbCLNvWvxMes=;
	b=csP+Ql8ghZ/iopdFHfji1Jbwu1HY6hiiVig+fy7OlYcTJ8y6OfqZSHICM81zgbf0lQ5X
	 ePvgc/djXjkE3sF+L19JYm82BxaKvuvwE9utrCIjRqzI0QQMAZ0SbrojxclE6kGv6sHC0
	 ADMyRdSCIfCHrGlyuEad4cEfVWnD1+tIu6fyrgQJ2J+MXURbaAnQMAqDHRhuoLTDOrTHs
	 iqW8M4KojiMn5H7zSWacXApRD8Ao7koF02j5iVK8S7uTrK32ulEO2aS9PZTfoqVAkEdCc
	 DwxLEplwk+1NuvgP9vac+5oMatsbywmLQ8k3RPxhJxcBWrzTfcB6Mv6kNvwQx3ZE0jg==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dkim=pass header.d=kernel.org header.i=@kernel.org header.a=rsa-sha256 header.s=k20260515 header.b=ZVPuSeeV;
	arc=none smtp.remote-ip=100.103.45.18
Received: from smtp.kernel.org (quasi.space.kernel.org [100.103.45.18])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 39670606A31C
	for <devicetree@vger.kernel.org>; Tue, 17 Nov 2026 23:17:12 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.a=rsa-sha256 header.s=k20260515 header.b=ZVPuSeeV
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 13A5C1F000C4;
	Tue, 17 Nov 2026 23:17:11 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kernel.org;
	s=k20260515; t=1794957432;
	bh=Lrd7pfsA/gpXWlBfBjdzCjvJ1tm4d5drbCLNvWvxMes=;
	h=From:Subject:Reply-To:To:Cc:In-Reply-To:References:Date;
	b=ZVPuSeeV6/vOpG+ZW6fLzLbLJaUfF9VRv9j9Tjw2RmnUfhFqcdsfeHIvEvyJxmz3Z
	 RZQBmhy36TCVgcW7C3c8QlI0bk73ZdVVXLyOBC7LyHaSB6iI8wS0VxirgENg2XQNo1
	 phadhNaOqOTHqwXlV97dWD1f2qzzLciSf6vv2x+AZm/DFAylw6fPv0YSrs6Mxs4Vig
	 QC9v9TxIVEeYYvuR1ksHZ2foDQ3VEAuNheEKFLgM6gXIlQ+jNiYuHydZ7isd73pFUx
	 1gURT7sGwo106zjvtrglSEa87EYdWPXYIm6nHlSH+i3Au5tueNTXg7aQD81z526s9p
	 csUz7RsBR0gfA==
Message-ID: <sashiko-outbox-219788@kernel.org>
From: sashiko-bot@kernel.org
Subject: Re: [PATCH v2 1/5] drm/msm/a6xx: Add Adreno 753 support
Reply-To: sashiko-reviews@lists.linux.dev
To: "Akhil P Oommen" <akhilpo@oss.qualcomm.com>
Cc: dri-devel@lists.freedesktop.org, devicetree@vger.kernel.org, robh@kernel.org, conor+dt@kernel.org
In-Reply-To: <20261118-nord-gpu1-v2-1-8d6d9908b7c5@oss.qualcomm.com>
References: <20261118-nord-gpu1-v2-0-8d6d9908b7c5@oss.qualcomm.com>
 <20261118-nord-gpu1-v2-1-8d6d9908b7c5@oss.qualcomm.com>
Content-Type: text/plain; charset=utf-8
Content-Transfer-Encoding: quoted-printable
Date: Tue, 17 Nov 2026 23:17:11 +0000
X-Mailing-List: devicetree@vger.kernel.org
List-Id: <devicetree.vger.kernel.org>
List-Post: <mailto:devicetree@vger.kernel.org>
List-Help: <mailto:devicetree+help@vger.kernel.org>
List-Subscribe: <mailto:devicetree+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:devicetree+unsubscribe@vger.kernel.org>
List-Owner: <mailto:devicetree+owner@vger.kernel.org>
Precedence: list

Thank you for your contribution! Sashiko AI review found 1 potential
issue to consider:
- [High] drm/msm/a6xx: missing UBWC L2/L3 swizzle disable in
  a6xx_set_ubwc_config()
--

commit 0728c6891f9936a41b152874415dd989fc9326a8
Author: Shivam Rawat <shivrawa@qti.qualcomm.com>

drm/msm/a6xx: Add Adreno 753 support

This commit adds an A7xx catalog entry, an adreno_is_a753() helper, and
hardware initialization adjustments for the Adreno 753 GPU in the Qualcomm
Nord SoC.

> diff --git a/drivers/gpu/drm/msm/adreno/a7xx_catalog.c b/drivers/gpu/drm/=
msm/adreno/a7xx_catalog.c
> index 6f704898cea6e..9465ffa3dd12e 100644
> --- a/drivers/gpu/drm/msm/adreno/a7xx_catalog.c
> +++ b/drivers/gpu/drm/msm/adreno/a7xx_catalog.c
> @@ -451,6 +451,41 @@ static const struct adreno_info a7xx_gpus[] =3D {
>  			},
>  		},
>  		.preempt_record_size =3D 3572 * SZ_1K,
> +	}, {
> +		.chip_ids =3D ADRENO_CHIP_IDS(0x43051701), /* "C523v2" */
> +		.family =3D ADRENO_7XX_GEN3,
> +		.fw =3D {
> +			[ADRENO_FW_SQE] =3D "gen71300_sqe.fw",
> +			[ADRENO_FW_GMU] =3D "gen71300_gmu.bin",
> +		},
> +		.gmem =3D 3 * SZ_1M,
> +		.inactive_period =3D DRM_MSM_INACTIVE_PERIOD,
> +		.quirks =3D ADRENO_QUIRK_HAS_CACHED_COHERENT |
> +			  ADRENO_QUIRK_HAS_HW_APRIV |
> +			  ADRENO_QUIRK_PREEMPTION |
> +			  ADRENO_QUIRK_IFPC,
> +		.funcs =3D &a7xx_gpu_funcs,

[Severity: High]
Does a6xx_set_ubwc_config() need to disable level 3 UBWC bank swizzling
and program the swizzle disable bits into REG_A7XX_GRAS_NC_MODE_CNTL for
Adreno 753 on Nord?

In drivers/soc/qcom/ubwc_config.c, "qcom,nord" maps to glymur_data, which
sets both UBWC_FLAG_DISABLE_SWIZZLE_LVL2 and
UBWC_FLAG_DISABLE_SWIZZLE_LVL3.  That configuration is exposed to
userspace via MSM_PARAM_UBWC_SWIZZLE and programmed into MDSS and Iris,
and a8xx_set_ubwc_config() writes both level2_swizzling_dis and
level3_swizzling_dis for other glymur_data platforms.

Adreno 753 uses a7xx_gpu_funcs -> hw_init() -> a6xx_set_ubwc_config(),
which only checks UBWC_SWIZZLE_ENABLE_LVL2 and omits level 3 swizzle
disable from REG_A6XX_RB_NC_MODE_CNTL, REG_A6XX_TPL1_NC_MODE_CNTL and
REG_A6XX_SP_NC_MODE_CNTL, and writes neither level2_swizzling_dis nor
level3_swizzling_dis to REG_A7XX_GRAS_NC_MODE_CNTL:

drivers/gpu/drm/msm/adreno/a6xx_gpu.c:a6xx_set_ubwc_config() {
	...
	u32 level2_swizzling_dis =3D !(qcom_ubwc_swizzle(cfg) & UBWC_SWIZZLE_ENABL=
E_LVL2);
	...
	if (adreno_is_a7xx(adreno_gpu)) {
		for (u32 pipe_id =3D PIPE_BR; pipe_id <=3D PIPE_BV; pipe_id++) {
			gpu_write(gpu, REG_A7XX_CP_APERTURE_CNTL_HOST,
				  A7XX_CP_APERTURE_CNTL_HOST_PIPE(pipe_id));
			gpu_write(gpu, REG_A7XX_GRAS_NC_MODE_CNTL,
				  FIELD_PREP(GENMASK(8, 5), hbb_lo));
		}
	...
}

Leaving level 3 swizzling enabled in RB/TPL1/SP and both level 2 and
level 3 swizzling enabled in GRAS mismatches the rest of the SoC and
userspace, corrupting UBWC surfaces during rendering and buffer sharing.

--=20
Sashiko AI review =C2=B7 https://sashiko.dev/#/patchset/20261118-nord-gpu1-=
v2-0-8d6d9908b7c5@oss.qualcomm.com?part=3D1
