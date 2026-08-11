Received: from mail-lj1-f179.google.com (mail-lj1-f179.google.com [209.85.208.179])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 8832C42E8FD
	for <devicetree@vger.kernel.org>; Tue, 11 Aug 2026 23:48:21 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=pass smtp.client-ip=209.85.208.179
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1786492103; cv=pass; b=RPSEo7GtoPn9IZaqC5ClAgV+ETXegH/wUfhzrsXKPLhcaU1xDeGCoCmkrghdoMg/rfjNmXGu0ZwOlOqVmHm3cQKyNvpCPhs5TOwZDic2sF29UyUttLyCUcdifKy0bHhePita4BW3u4qH08lzoVePJZlfYO1uFxnqeU5soKty3EQ=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1786492103; c=relaxed/simple;
	bh=Q2v/Wf7s8DV6sTimo8qyzr4XW4xqwc4c+AuviYO4zWQ=;
	h=MIME-Version:References:In-Reply-To:From:Date:Message-ID:Subject:
	 To:Cc:Content-Type; b=j9KHExTgg/BgcF908q8KhJSDJQW/moVpPHCrgsnKUcQYz6PmKrW71DjbPM8KVvADOvdPrqdJ+E3MHPrLcBrOiFCqDf3KKro3PdpA1BFEP4L48wNhMb18Qo56XE7iA4Go/S/J1vJatJCDydv4MCB5gJALx+KoL/2K7H3BBiLx1h8=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=HVHyBe6v; arc=pass smtp.client-ip=209.85.208.179
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="HVHyBe6v"
Received: by mail-lj1-f179.google.com with SMTP id 38308e7fff4ca-39c908d6cb6so4936101fa.1
        for <devicetree@vger.kernel.org>; Tue, 11 Aug 2026 16:48:21 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1786492099; cv=none;
        d=google.com; s=arc-20260327;
        b=Md47CmgTneGeD4vdi3p9qkpe9Fu0TkAGX1vq9+fla7S7HxVYNsHghtdoNH0eJhW4gI
         WZExruM1xvD8hxbqemssi4qrTDjxTr3um2ZKf4KXMW4u33HrIKuywx0WAmqeEVlXc64C
         MuWFLneepEH0vIayiPrjivCKSwwdX9g6BCqjpIhlWG2Lo5IgqW4HwwCtWcUdNXsbQK6v
         swCX7uvqPVLWL1XPuJc1N1I1Et8zzD+4JgNzigTr7umg8VE4BL4zcKg2PFxTTGiqGETR
         1a19jnLq7bTe5gpqKoBVjEIdcPRn8LEHe1dKPdwsP7Kwr7B+H6fEdHGBGdNdAKf3RM2y
         decQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20260327;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:dkim-signature;
        bh=2v8c/t2XNNgMLOvm+YLPynbBDsv4JXJ1xwFLnZFif1M=;
        fh=KmnkKFxcA7C4yPYW4NO1TTGCg1kuWrDlQaUMdukJqtI=;
        b=cT1qmprsF6LAl2niubSQYZiOosTlBfKvRpMWx6L+/9HeOD9WE0OvmX65J+sugv8AWz
         CAL+Hw9VYsRWEU2uRFa1/SnpSW/+aimKu0sf1Ywu+8ztK1pj2BRA8GkUZqwwrgZ7U//Y
         5v3C+9wX0r0t2eH+fwkMgfy2F2QkVkOED1qe70C+hSLLx1Yco/nkKHZEnz3urvIb+8AV
         PhEUQ9N7lJVAWCNaHGAJl2EIT+k1zxn2ZwYTiCz84qMBql8qBkHj54LRnh5S5nUwtkiG
         /WPzKQgPAuMvrVPEaibxStOaXKokbTKCH8pzCzK3/sJp73To+KUEzVkFDTlRtiqMqToL
         0Kjg==;
        darn=vger.kernel.org
ARC-Authentication-Results: i=1; mx.google.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1786492099; x=1787096899; darn=vger.kernel.org;
        h=content-transfer-encoding:content-type:cc:to:subject:message-id
         :date:from:in-reply-to:references:mime-version:from:to:cc:subject
         :date:message-id:reply-to:content-type;
        bh=2v8c/t2XNNgMLOvm+YLPynbBDsv4JXJ1xwFLnZFif1M=;
        b=HVHyBe6vWkOaDL7Mx939+KwQN5JxapZ2AmBOUwye2b+olZcljdH4DqdQm1UPKJMyS4
         6qiBDRdavSdL9GE0FKycW2NjfYrzGiAdKrukOlLwErBdroasswVDyZsvi6joNVDJ/LIr
         3pYRJfAh4lYp/xM6uDxOFcHwO0JiFog06+Zy99Yu2BPlQjL3WZAdrgFmZhcyPp8dACbH
         YFgAbLTBLb9HtCsQLHc+6cYMMd/YhtHoX03D0OB24VaCJZpJkGqrlJtyprvCD6bPcc2B
         LFEkVPEMjNfZIGi/YnZN9ju0iTHR0VMXj9ppWGm442k0hwxfDyPOI87ag+FDWsOhV8+P
         OJ6g==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1786492099; x=1787096899;
        h=content-transfer-encoding:content-type:cc:to:subject:message-id
         :date:from:in-reply-to:references:mime-version:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=2v8c/t2XNNgMLOvm+YLPynbBDsv4JXJ1xwFLnZFif1M=;
        b=GHHIGgmz6PP/1U7tIW43j2Mckpq4qKjxj4DPxntFsj1CRp0M6P5YY6w8uSqr+42lK3
         O0dGH2bYv4eENZuxD+xR9D0axP+a+6gMNIs+NUbQpoVf8pDDYel64uF6wDZU38Fi3MpO
         FTq4bQ1uLN/81TTW7lDS6C1u3kYg6TNi9IXiNve1dgTfNvyIl2N8sljpQ8i/3lmgeoIU
         NejmFT0YsvOnB1vhBskEWyqJnTE3kzzi9rYf6vfSo22OuavtJTcZ/Z/vX0oEXlaNCcxR
         G5FR9R7KTtRW9bZOQ52Rv5dZNX2zsnXr85QcAaXRDCNqY2Zu6P2FkF9+Lxa1j//FF7Wg
         TjLg==
X-Forwarded-Encrypted: i=1; AHgh+Rp2cWagWryA79gyKLjzNtQVXeuxuySodLPqiwyAtRawZl7WP+Qr/UrhOlFiyeDmMk0dU3TAsri+3CpL@vger.kernel.org
X-Gm-Message-State: AOJu0YwBUOE/1hD2I11dJoZvh8RlzECE7Vfl9S/2VlwZ7heCvVANj6yC
	TBY9NrfnAhDx8kBBCfR7DUmMMO7U9PjJzTq/PiOZvlhiQ0TYFtqJBwSDdoy4rqK0VKkCnNdA5yZ
	QwPJbLPnj7xxXptiAYXCFp9klgIXIGlzB9N56
X-Gm-Gg: AR+sD13LFmMXAqBUXapUf91fKhyRx4zbSJJ14UDIHxdLPoP+03tj0bcUVN3ouAQwIsL
	sur2uciCNd+Ou93aH97Jz8+V/IBAQccP00pF47nR5CzNKvSWoVH2ovt+WyfIDdaRpBaDxJeIS2S
	DwTiFdGy1s3cezyhJPLnDBSAQOKvfBVpgvybHViQ7s+r08xZd9UhwXHp/Dk78rkAE7ws4QdBiEl
	qoogZT+gWVgyWpxAkRy2mzFci6TWxodTAxF3JBCj1Ud/0V23SmYH4AbhdAYAMy6XJ+dPvJDrlew
	PMMRA2u3plvzZrFYsis1SqDiuecnfmtdAmF/JevdpduYCa77xC2SJKQDfRe3BtyRje6MwuiXF6+
	DGySPD4r2v3bV49nmabDKzwm7/wsWflfQXsDrzVLGcQ==
X-Received: by 2002:a05:651c:510:b0:396:7e66:45ba with SMTP id
 38308e7fff4ca-3a10d4d0cb8mr229091fa.8.1786492099161; Tue, 11 Aug 2026
 16:48:19 -0700 (PDT)
Precedence: bulk
X-Mailing-List: devicetree@vger.kernel.org
List-Id: <devicetree.vger.kernel.org>
List-Subscribe: <mailto:devicetree+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:devicetree+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
References: <CALHNRZ-yffAy7xZbjVEZOfgVeqFGZ6h9jvNkbtTsNNXGQSgeCQ@mail.gmail.com>
 <471185ea-acb6-4e82-80a3-ac716a1cd8ad@oss.qualcomm.com>
In-Reply-To: <471185ea-acb6-4e82-80a3-ac716a1cd8ad@oss.qualcomm.com>
From: Aaron Kling <webgeek1234@gmail.com>
Date: Tue, 11 Aug 2026 18:48:07 -0500
X-Gm-Features: AUfX_mx5Ig8I3Sj5vECfhlqPLWkRaKAaNIS_xT5xFaP_LgYmRTq5k2zP334pZIQ
Message-ID: <CALHNRZ9cy=iNKcxVNC+KVm29B29=fZtc0EX6V3qTe4fqexbiVA@mail.gmail.com>
Subject: Re: [PATCH 1/6] drm/msm/a8xx: Add support for Adreno 830 GPU
To: Akhil P Oommen <akhilpo@oss.qualcomm.com>
Cc: abhinav.kumar@linux.dev, David Airlie <airlied@gmail.com>, 
	Bjorn Andersson <andersson@kernel.org>, Conor Dooley <conor+dt@kernel.org>, devicetree@vger.kernel.org, 
	dri-devel@lists.freedesktop.org, freedreno@lists.freedesktop.org, 
	Jessica Zhang <jesszhan0024@gmail.com>, jie.zhang@oss.qualcomm.com, 
	Konrad Dybcio <konradybcio@kernel.org>, Krzysztof Kozlowski <krzk+dt@kernel.org>, 
	linux-arm-msm@vger.kernel.org, linux-kernel@vger.kernel.org, 
	Dmitry Baryshkov <lumag@kernel.org>, Maarten Lankhorst <maarten.lankhorst@linux.intel.com>, 
	marijn.suijten@somainline.org, Maxime Ripard <mripard@kernel.org>, 
	Rob Herring <robh@kernel.org>, robin.clark@oss.qualcomm.com, sean@poorly.run, 
	Simona Vetter <simona@ffwll.ch>, Thomas Zimmermann <tzimmermann@suse.de>
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

On Tue, Aug 11, 2026 at 5:54=E2=80=AFPM Akhil P Oommen <akhilpo@oss.qualcom=
m.com> wrote:
>
> On 8/11/2026 1:29 PM, Aaron Kling wrote:
> >> From: Jie Zhang <jie.zhang@oss.qualcomm.com>
> >> Add support for the Adreno 830 GPU present in SM8750 SoC. Adreno 830 G=
PU
> >> belongs to the A8x Gen 1 family and it is architecturally close Adreno=
 840.
> >> Add a new catalog entry along with the register list to enable support
> >> for this GPU.
> >> Signed-off-by: Jie Zhang <jie.zhang@oss.qualcomm.com>
> >> Signed-off-by: Akhil P Oommen <akhilpo@oss.qualcomm.com>
> >> ---
> >>  drivers/gpu/drm/msm/adreno/a6xx_catalog.c | 334 +++++++++++++++++++++=
+++++++++
> >>  drivers/gpu/drm/msm/adreno/a8xx_gpu.c     |   2 +-
> >>  drivers/gpu/drm/msm/adreno/adreno_gpu.h   |   5 +
> >>  3 files changed, 340 insertions(+), 1 deletion(-)
> >> diff --git a/drivers/gpu/drm/msm/adreno/a6xx_catalog.c b/drivers/gpu/d=
rm/msm/adreno/a6xx_catalog.c
> >> index 90a0c7ffb3c8..418edde9104e 100644
> >> --- a/drivers/gpu/drm/msm/adreno/a6xx_catalog.c
> >> +++ b/drivers/gpu/drm/msm/adreno/a6xx_catalog.c
> >> @@ -1693,6 +1693,294 @@ static const struct adreno_info a7xx_gpus[] =
=3D {
> >>  };
> >>  DECLARE_ADRENO_GPULIST(a7xx);
> >>
> >> +static const struct adreno_reglist_pipe a830_nonctxt_regs[] =3D {
> >> + { REG_A8XX_CP_SMMU_STREAM_ID_LPAC, 0x00000101, BIT(PIPE_NONE) },
> >> + { REG_A8XX_GRAS_DBG_ECO_CNTL, 0x00000800, BIT(PIPE_BR) | BIT(PIPE_BV=
) },
> >> + { REG_A6XX_PC_AUTO_VERTEX_STRIDE, 0x00000001, BIT(PIPE_BR) | BIT(PIP=
E_BV) },
> >> + { REG_A8XX_PC_VIS_STREAM_CNTL, 0x10010000, BIT(PIPE_BR) | BIT(PIPE_B=
V) },
> >> + { REG_A8XX_PC_CONTEXT_SWITCH_STABILIZE_CNTL_1, 0x00000002, BIT(PIPE_=
BR) | BIT(PIPE_BV) },
> >> + { REG_A8XX_PC_CHICKEN_BITS_1, 0x00000003, BIT(PIPE_BR) | BIT(PIPE_BV=
) },
> >> + { REG_A8XX_PC_CHICKEN_BITS_2, 0x00000200, BIT(PIPE_BR) | BIT(PIPE_BV=
) },
> >> + { REG_A8XX_PC_CHICKEN_BITS_3, 0x00400000, BIT(PIPE_BR) | BIT(PIPE_BV=
) },
> >> + { REG_A8XX_PC_CHICKEN_BITS_4, 0x00500050, BIT(PIPE_BR) | BIT(PIPE_BV=
) },
> >> + /* Configure GBIF GX registers */
> >> + { REG_A8XX_UCHE_GBIF_GX_CONFIG, 0x010240e0, BIT(PIPE_NONE) },
> >> + { REG_A8XX_RBBM_GBIF_CLIENT_QOS_CNTL, 0x22122212, BIT(PIPE_NONE) },
> >> + /* Enable full concurrent resolve and unresolves */
> >> + { REG_A7XX_RB_CCU_CNTL, 0x00000068, BIT(PIPE_BR) },
> >> + /* Partially enable perf clear, Disable DINT to c/z be data forwardi=
ng */
> >> + { REG_A7XX_RB_CCU_DBG_ECO_CNTL, 0x00002200, BIT(PIPE_BR) },
> >> + { REG_A8XX_RB_GC_GMEM_PROTECT, 0x0c000000, BIT(PIPE_BR) },
> >> + /* Configure number of outstanding transactions to 32 */
> >> + { REG_A8XX_RB_RESOLVE_PREFETCH_CNTL, 0x00000007, BIT(PIPE_BR) },
> >> + /* Configure UCHE request time out to 16 cycles for CCU/UCHE arbitra=
tion */
> >> + { REG_A8XX_RB_CMP_DBG_ECO_CNTL, 0x00004000, BIT(PIPE_BR) },
> >> + { REG_A8XX_RBBM_NC_MODE_CNTL, 0x00000001, BIT(PIPE_NONE) },
> >> + { REG_A8XX_RBBM_SLICE_NC_MODE_CNTL, 0x00000001, BIT(PIPE_NONE) },
> >> + { REG_A8XX_RBBM_WAIT_IDLE_CLOCKS_CNTL, 0x00000030, BIT(PIPE_NONE) },
> >> + { REG_A8XX_RBBM_WAIT_IDLE_CLOCKS_CNTL2, 0x00000030, BIT(PIPE_NONE) }=
,
> >> + { REG_A8XX_RBBM_CGC_P2S_CNTL, 0x00000040, BIT(PIPE_NONE) },
> >> + /* Enable contribution of all shader stages to SP perfcounters */
> >> + { REG_A6XX_SP_PERFCTR_SHADER_MASK, 0x0000003f, BIT(PIPE_NONE) },
> >> + /*
> >> + * BIT(26): Limit the number of wave-slots for Eviction buffer to 1 p=
er ALU GRP
> >> + * BIT(30): Disable LPAC auto-promotion
> >> + */
> >> + { REG_A7XX_SP_CHICKEN_BITS_1, BIT(26) | BIT(30), BIT(PIPE_NONE) },
> >> + /*
> >> + * BIT(22): Disable PS out of order retire
> >> + * BIT(23): Enable half wave mode and MM instruction src&dst is half =
precision
> >> + */
> >> + { REG_A7XX_SP_CHICKEN_BITS_2, BIT(22) | BIT(23), BIT(PIPE_NONE) },
> >> + { REG_A7XX_SP_CHICKEN_BITS_3, 0x00300000, BIT(PIPE_NONE) },
> >> + { REG_A7XX_SP_HLSQ_TIMEOUT_THRESHOLD_DP, 0x00000080,  BIT(PIPE_NONE)=
 },
> >> + { REG_A6XX_TPL1_DBG_ECO_CNTL, 0x10000000, BIT(PIPE_NONE) },
> >> + /* Enable cubemap small miplevel optimization settings */
> >> + /* BIT(26): Disable final clamp for bicubic filtering */
> >> + { REG_A6XX_TPL1_DBG_ECO_CNTL1, 0x04000724, BIT(PIPE_NONE) },
> >> + /* Disable tag bank id hashing */
> >> + { REG_A6XX_UCHE_MODE_CNTL, 0x00080000, BIT(PIPE_NONE) },
> >> + { REG_A8XX_UCHE_CCHE_MODE_CNTL, 0x00001000, BIT(PIPE_NONE) },
> >> + /* Limit gmem number of ways for GMEM requests in each set */
> >> + { REG_A8XX_UCHE_CCHE_CACHE_WAYS, 0x00000800, BIT(PIPE_NONE)},
> >> + /* Disable write slow pointer in data phase queue */
> >> + { REG_A8XX_UCHE_HW_DBG_CNTL, BIT(8), BIT(PIPE_NONE) },
> >> + /* Configure UCHE to CCU switchthreshold timeout cycles */
> >> + { REG_A8XX_UCHE_VARB_IDLE_TIMEOUT, 0x00000020, BIT(PIPE_NONE) },
> >> + { REG_A7XX_VFD_DBG_ECO_CNTL, 0x00008000, BIT(PIPE_BR) | BIT(PIPE_BV)=
 },
> >> + { REG_A8XX_VFD_CB_BV_THRESHOLD, 0x00500050, BIT(PIPE_BR) | BIT(PIPE_=
BV) },
> >> + { REG_A8XX_VFD_CB_BR_THRESHOLD, 0x00600060, BIT(PIPE_BR) | BIT(PIPE_=
BV) },
> >> + { REG_A8XX_VFD_CB_BUSY_REQ_CNT, 0x00200020, BIT(PIPE_BR) | BIT(PIPE_=
BV) },
> >> + { REG_A8XX_VFD_CB_LP_REQ_CNT, 0x00100020, BIT(PIPE_BR) | BIT(PIPE_BV=
) },
> >> + { REG_A8XX_VPC_FLATSHADE_MODE_CNTL, 0x00000001, BIT(PIPE_BR) | BIT(P=
IPE_BV) },
> >> + /* Disable redundant tile data optimization */
> >> + { REG_A8XX_VSC_KMD_DBG_ECO_CNTL, BIT(11), BIT(PIPE_NONE)},
> >> + { },
> >> +};
> >> +
> >> +static const u32 a830_protect_regs[] =3D {
> >> + A6XX_PROTECT_RDONLY(0x00000, 0x03a3),
> >> + A6XX_PROTECT_RDONLY(0x003b4, 0x008b),
> >> + A6XX_PROTECT_NORDWR(0x00440, 0x001f),
> >> + A6XX_PROTECT_RDONLY(0x00580, 0x005f),
> >> + A6XX_PROTECT_NORDWR(0x005e0, 0x011f),
> >> + A6XX_PROTECT_RDONLY(0x0074a, 0x0005),
> >> + A6XX_PROTECT_RDONLY(0x00759, 0x0026),
> >> + A6XX_PROTECT_RDONLY(0x00789, 0x0000),
> >> + A6XX_PROTECT_RDONLY(0x0078c, 0x0013),
> >> + A6XX_PROTECT_NORDWR(0x00800, 0x0029),
> >> + A6XX_PROTECT_NORDWR(0x00837, 0x00af),
> >> + A6XX_PROTECT_RDONLY(0x008e7, 0x00c9),
> >> + A6XX_PROTECT_NORDWR(0x008ec, 0x00c3),
> >> + A6XX_PROTECT_NORDWR(0x009b1, 0x0250),
> >> + A6XX_PROTECT_RDONLY(0x00ce0, 0x0001),
> >> + A6XX_PROTECT_RDONLY(0x00df0, 0x0000),
> >> + A6XX_PROTECT_NORDWR(0x00df1, 0x0000),
> >> + A6XX_PROTECT_NORDWR(0x00e01, 0x0000),
> >> + A6XX_PROTECT_NORDWR(0x00e03, 0x1fff),
> >> + A6XX_PROTECT_NORDWR(0x03c00, 0x00c5),
> >> + A6XX_PROTECT_RDONLY(0x03cc6, 0x1fff),
> >> + A6XX_PROTECT_NORDWR(0x08600, 0x01ff),
> >> + A6XX_PROTECT_NORDWR(0x08e00, 0x00ff),
> >> + A6XX_PROTECT_RDONLY(0x08f00, 0x0000),
> >> + A6XX_PROTECT_NORDWR(0x08f01, 0x01be),
> >> + A6XX_PROTECT_NORDWR(0x09600, 0x01ff),
> >> + A6XX_PROTECT_RDONLY(0x0981a, 0x02e5),
> >> + A6XX_PROTECT_NORDWR(0x09e00, 0x01ff),
> >> + A6XX_PROTECT_NORDWR(0x0a600, 0x01ff),
> >> + A6XX_PROTECT_NORDWR(0x0ae00, 0x0000),
> >> + A6XX_PROTECT_NORDWR(0x0ae02, 0x0004),
> >> + A6XX_PROTECT_NORDWR(0x0ae08, 0x0006),
> >> + A6XX_PROTECT_NORDWR(0x0ae10, 0x036f),
> >> + A6XX_PROTECT_NORDWR(0x0b600, 0x1fff),
> >> + A6XX_PROTECT_NORDWR(0x0dc00, 0x1fff),
> >> + A6XX_PROTECT_RDONLY(0x0fc00, 0x1fff),
> >> + A6XX_PROTECT_NORDWR(0x18400, 0x003f),
> >> + A6XX_PROTECT_RDONLY(0x18440, 0x013f),
> >> + A6XX_PROTECT_NORDWR(0x18580, 0x1fff),
> >> + A6XX_PROTECT_NORDWR(0x1b400, 0x1fff),
> >> + A6XX_PROTECT_NORDWR(0x1f400, 0x0477),
> >> + A6XX_PROTECT_RDONLY(0x1f878, 0x0787),
> >> + A6XX_PROTECT_NORDWR(0x1f930, 0x0329),
> >> + A6XX_PROTECT_NORDWR(0x20000, 0x1fff),
> >> + A6XX_PROTECT_NORDWR(0x27800, 0x007f),
> >> + A6XX_PROTECT_RDONLY(0x27880, 0x0381),
> >> + A6XX_PROTECT_NORDWR(0x27882, 0x0001),
> >> + A6XX_PROTECT_NORDWR(0x27c02, 0x0000),
> >> +};
> >> +DECLARE_ADRENO_PROTECT(a830_protect, 64);
> >
> > I have tested this on an AYN Odin 3, which has a CQ8725S SoC with
> > A830. As-is, this change causes the device to fail to boot. Comparing
> > to a different implementation of this support that I used previously,
> > I found the operable difference is the count_max field here. Dropping
> > that from 64 to 15 allows the device to boot and work as intended. I
> > unfortunately don't have uart to see what the actual failure text is
> > and provide any more information than this.
>
> Maybe your stack is missing this patch:
> https://lore.kernel.org/lkml/20260502-adreno-810-v5-5-bc9fd2bb788d@pm.me/

This is correct. The kernel baseline I am using is partway between 7.1
and the 7.2 rc's and does not have that series yet. Picking that
specific commit does resolve the failure without needing to change
count_max.

Aaron
