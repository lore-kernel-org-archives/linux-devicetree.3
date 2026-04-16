Received: from mail-43100.protonmail.ch (mail-43100.protonmail.ch [185.70.43.100])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 46E203A640C
	for <devicetree@vger.kernel.org>; Thu, 16 Apr 2026 11:05:44 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=185.70.43.100
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1776337545; cv=none; b=mMxUNelk07z5cssWfOkHgq8WFxhOViQxOQtx7nknA8DPVR8GFqg0sDBVhaG/3PK1KXe7nrRqyRyhmx/n2nH+UzPEi9/9blQXaZfojp1YZ/BoPATImul66It1v43pCJztxW8ZcVu7jyyneBCn1+JAGD1asRkT4DFsI2dTd6MurnY=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1776337545; c=relaxed/simple;
	bh=wpiHLX1zWOUy8hBTDFwvSmMkzZNlxTZRLe+LwVa3mZQ=;
	h=Date:To:From:Cc:Subject:Message-ID:In-Reply-To:References:
	 MIME-Version:Content-Type; b=lFZMfmYbVSyCYTHioUYHpKbISdTOwXv0a7dExG2GJ5ZT9vne6v2EEbnI6Bn2a8pX0ZAr8qnpYgxg4eQqxu6I387Y15k/mjrf8+M/fMDhtabzEM8rSJ7uXEZ8kNtFuGZVuxEzs4ydxDPQQFiDpG+G5BTzHy1tNz9xuitVpPBgQWE=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=pm.me; spf=pass smtp.mailfrom=pm.me; dkim=pass (2048-bit key) header.d=pm.me header.i=@pm.me header.b=pQUMjmu4; arc=none smtp.client-ip=185.70.43.100
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=pm.me
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=pm.me
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=pm.me header.i=@pm.me header.b="pQUMjmu4"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=pm.me;
	s=protonmail3; t=1776337542; x=1776596742;
	bh=wpiHLX1zWOUy8hBTDFwvSmMkzZNlxTZRLe+LwVa3mZQ=;
	h=Date:To:From:Cc:Subject:Message-ID:In-Reply-To:References:
	 Feedback-ID:From:To:Cc:Date:Subject:Reply-To:Feedback-ID:
	 Message-ID:BIMI-Selector;
	b=pQUMjmu4pBwokBRzUM5OWiiWv62C1ekWSIZT3mil42REk1el0LvCg+gRA7IEwgqy1
	 Tbmjv25GJQ7Jq/0UF9diZWQvh9064f5hO6BXK7UrEatSCMphycsP+Y9WdVzGTLofrk
	 C0b5fW5DUrtpWaoFamCK3m1HguAvQ0ygqjgNUh89lEuHIa7vgCHMjscPFAJtWqhbJS
	 z/KLpS/ui7lgf16+FsElHt0Jz49dJB1byTivdJ0XylsKNXuqBnUSqauB68ob43bxmw
	 I44A4ZGyvgdbzcz4knnjNoL0ASRQR1GpgTLxdRo03L4k49pw9c42nCqwwGVCrXKKom
	 5PQZwX4MGmeFQ==
Date: Thu, 16 Apr 2026 11:05:36 +0000
To: Rob Clark <robin.clark@oss.qualcomm.com>, Dmitry Baryshkov <lumag@kernel.org>, Abhinav Kumar <abhinav.kumar@linux.dev>, Jessica Zhang <jesszhan0024@gmail.com>, Sean Paul <sean@poorly.run>, Marijn Suijten <marijn.suijten@somainline.org>, Maarten Lankhorst <maarten.lankhorst@linux.intel.com>, Maxime Ripard <mripard@kernel.org>, Thomas Zimmermann <tzimmermann@suse.de>, David Airlie <airlied@gmail.com>, Simona Vetter <simona@ffwll.ch>, Rob Herring <robh@kernel.org>, Krzysztof Kozlowski <krzk+dt@kernel.org>, Conor Dooley <conor+dt@kernel.org>, Konrad Dybcio <konradybcio@kernel.org>, Akhil P Oommen <akhilpo@oss.qualcomm.com>, Bjorn Andersson <andersson@kernel.org>
From: Alexander Koskovich <akoskovich@pm.me>
Cc: Luca Weiss <luca.weiss@fairphone.com>, linux-arm-msm@vger.kernel.org, dri-devel@lists.freedesktop.org, freedreno@lists.freedesktop.org, devicetree@vger.kernel.org, linux-kernel@vger.kernel.org, Alexander Koskovich <akoskovich@pm.me>, Konrad Dybcio <konrad.dybcio@oss.qualcomm.com>
Subject: [PATCH RFC v4 5/7] drm/msm/a8xx: use pipe protect slot 15 for last-span-unbound feature
Message-ID: <20260416-adreno-810-v4-5-61676e073f8a@pm.me>
In-Reply-To: <20260416-adreno-810-v4-0-61676e073f8a@pm.me>
References: <20260416-adreno-810-v4-0-61676e073f8a@pm.me>
Feedback-ID: 37836894:user:proton
X-Pm-Message-ID: 3287677ba8a48beacce1c7308f59e178787081da
Precedence: bulk
X-Mailing-List: devicetree@vger.kernel.org
List-Id: <devicetree.vger.kernel.org>
List-Subscribe: <mailto:devicetree+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:devicetree+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Transfer-Encoding: quoted-printable

A8XX GPUs have two sets of protect registers: 64 global slots and 16
pipe specific slots. The last-span-unbound feature is only available
on pipe protect registers, and should always target pipe slot 15.

This matches the downstream driver which hardcodes pipe slot 15 for
all A8XX GPUs (GRAPHICS.LA.15.0.r1) and resolves protect errors on
A810.

Reviewed-by: Konrad Dybcio <konrad.dybcio@oss.qualcomm.com>
Reviewed-by: Akhil P Oommen <akhilpo@oss.qualcomm.com>
Signed-off-by: Alexander Koskovich <akoskovich@pm.me>
---
 drivers/gpu/drm/msm/adreno/a8xx_gpu.c | 4 ++--
 1 file changed, 2 insertions(+), 2 deletions(-)

diff --git a/drivers/gpu/drm/msm/adreno/a8xx_gpu.c b/drivers/gpu/drm/msm/ad=
reno/a8xx_gpu.c
index d519a29573a1..74802f330ae9 100644
--- a/drivers/gpu/drm/msm/adreno/a8xx_gpu.c
+++ b/drivers/gpu/drm/msm/adreno/a8xx_gpu.c
@@ -265,8 +265,8 @@ static void a8xx_set_cp_protect(struct msm_gpu *gpu)
 =09 * Last span feature is only supported on PIPE specific register.
 =09 * So update those here
 =09 */
-=09a8xx_write_pipe(gpu, PIPE_BR, REG_A8XX_CP_PROTECT_PIPE(protect->count_m=
ax), final_cfg);
-=09a8xx_write_pipe(gpu, PIPE_BV, REG_A8XX_CP_PROTECT_PIPE(protect->count_m=
ax), final_cfg);
+=09a8xx_write_pipe(gpu, PIPE_BR, REG_A8XX_CP_PROTECT_PIPE(15), final_cfg);
+=09a8xx_write_pipe(gpu, PIPE_BV, REG_A8XX_CP_PROTECT_PIPE(15), final_cfg);
=20
 =09a8xx_aperture_clear(gpu);
 }

--=20
2.53.0


