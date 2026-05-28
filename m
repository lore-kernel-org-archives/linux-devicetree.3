Received: from mail-43101.protonmail.ch (mail-43101.protonmail.ch [185.70.43.101])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 6FBEB3B38B2
	for <devicetree@vger.kernel.org>; Thu, 28 May 2026 09:49:14 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=185.70.43.101
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1779961755; cv=none; b=hE7W/lmCwpLezxJ54ta62HVgmby4xIx1rQIWF09pxUlU+H7aAShFGjlGCJrNM7dh8dd8P1nQa0o+4ElBwYlKcuwtOkCKUjRMOmHDpbn1XSKUcOl7CMS4yLftyx5LlpSO333iwkmfGX93D2zLSXeh4pSU2SAxSkT3FVEZs0rcf3I=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1779961755; c=relaxed/simple;
	bh=4cNpgUFkxkNEbpjpaCfVK8wi7WkJctG6LthT6aKiF/s=;
	h=Date:To:From:Cc:Subject:Message-ID:In-Reply-To:References:
	 MIME-Version:Content-Type; b=fqafyzLTHfouHMLBYxPa5Y9HrNqCFXGwCcHPmGnTYlHyWZZydGZ1dUdzyPoXPofpph41T6J1dl8Y4eyNB36Nog1ci5Nfdw4kPD3wTMJHZ/497ZXrl2m8eAdKq/F87DXEp2Fs2gWyFzmju0MjirwIkGOGX8+7gybSef9Oh2NnTtY=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=pm.me; spf=pass smtp.mailfrom=pm.me; dkim=pass (2048-bit key) header.d=pm.me header.i=@pm.me header.b=gEoJbWHm; arc=none smtp.client-ip=185.70.43.101
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=pm.me
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=pm.me
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=pm.me header.i=@pm.me header.b="gEoJbWHm"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=pm.me;
	s=protonmail3; t=1779961752; x=1780220952;
	bh=4cNpgUFkxkNEbpjpaCfVK8wi7WkJctG6LthT6aKiF/s=;
	h=Date:To:From:Cc:Subject:Message-ID:In-Reply-To:References:
	 Feedback-ID:From:To:Cc:Date:Subject:Reply-To:Feedback-ID:
	 Message-ID:BIMI-Selector;
	b=gEoJbWHmIi+7byYiB079v+ED48a4RHwy84IXEGULqXDU18kX/ngMiSzz8H+dxBAPs
	 XmqovD/4vDSaglf+brqJAcuQcs7pFzZX/8CnzCL50foOl7KFPgNsOJNE2hO+FEZCWK
	 lUIDNoaI4J0bCPAqdnivaOojkI+4w1joyNmFW8ux4wfBXZCx7BG3Tm3F8nSnViUPyv
	 2iVgiJXM05HRlDAB/4z34iLlfy9ADqy3ZqWDxQvd36P5GnzOotrNfoUXjmKcEG+uVh
	 OwDvs3Zd92T/pdKWIfGbGuneiZLBDye6yfI5cWHmCB6IFN99GYfRLehqLw1qWSoISg
	 fKXi/7BwPk49A==
Date: Thu, 28 May 2026 09:49:04 +0000
To: Rob Clark <robin.clark@oss.qualcomm.com>, Dmitry Baryshkov <lumag@kernel.org>, Abhinav Kumar <abhinav.kumar@linux.dev>, Jessica Zhang <jesszhan0024@gmail.com>, Sean Paul <sean@poorly.run>, Marijn Suijten <marijn.suijten@somainline.org>, David Airlie <airlied@gmail.com>, Simona Vetter <simona@ffwll.ch>, Maarten Lankhorst <maarten.lankhorst@linux.intel.com>, Maxime Ripard <mripard@kernel.org>, Thomas Zimmermann <tzimmermann@suse.de>, Rob Herring <robh@kernel.org>, Krzysztof Kozlowski <krzk+dt@kernel.org>, Conor Dooley <conor+dt@kernel.org>, Konrad Dybcio <konradybcio@kernel.org>, Akhil P Oommen <akhilpo@oss.qualcomm.com>, Bjorn Andersson <andersson@kernel.org>
From: Alexander Koskovich <akoskovich@pm.me>
Cc: linux-arm-msm@vger.kernel.org, dri-devel@lists.freedesktop.org, freedreno@lists.freedesktop.org, devicetree@vger.kernel.org, linux-kernel@vger.kernel.org, Alexander Koskovich <akoskovich@pm.me>, Konrad Dybcio <konrad.dybcio@oss.qualcomm.com>
Subject: [PATCH v7 5/6] drm/msm/a8xx: use pipe protect slot 15 for last-span-unbound feature
Message-ID: <20260528-adreno-810-v7-5-7fe7fdd97fc2@pm.me>
In-Reply-To: <20260528-adreno-810-v7-0-7fe7fdd97fc2@pm.me>
References: <20260528-adreno-810-v7-0-7fe7fdd97fc2@pm.me>
Feedback-ID: 37836894:user:proton
X-Pm-Message-ID: be0eea62f1b0a9bd01496b79b60be27b3c8a802f
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
index 66a6c9c714fa..5e2d15e42452 100644
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


