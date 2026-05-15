Received: from mail-106119.protonmail.ch (mail-106119.protonmail.ch [79.135.106.119])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id DF7E63DE45A
	for <devicetree@vger.kernel.org>; Fri, 15 May 2026 05:09:17 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=79.135.106.119
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1778821759; cv=none; b=kBID7mSRoAT9LGEkG19mT+o4rfmJqb9MCan04JSPzzNk2Wp4vecj/CF1AhrB4k0vrF2JTddFBkAOWhoHeWRly1imYekNDQ87QATZZjC9G9cx5xrEK13TP0JQTNFOCewP5t8G3duWPfFK0jdcGP5WeJ1e7L1xMwttkgzHAFL4rrE=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1778821759; c=relaxed/simple;
	bh=wpiHLX1zWOUy8hBTDFwvSmMkzZNlxTZRLe+LwVa3mZQ=;
	h=Date:To:From:Cc:Subject:Message-ID:In-Reply-To:References:
	 MIME-Version:Content-Type; b=rbsvK+JRRy6xja53u4p/Zst1aaQLHjqIH4WtSHFLjQER3qeulD1Ukx8K8RGV5sjPGbssMow2EEjgiNAAMOjf1HnjRQ1MQBlj8BRH4zcgayIUB/HYiGYIv/5r9e2v7Qc+lEz3KkpCPdlUYruCzby0N+AY11bqujEgE1mCaDLxpoQ=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=pm.me; spf=pass smtp.mailfrom=pm.me; dkim=pass (2048-bit key) header.d=pm.me header.i=@pm.me header.b=Ijru+n1y; arc=none smtp.client-ip=79.135.106.119
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=pm.me
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=pm.me
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=pm.me header.i=@pm.me header.b="Ijru+n1y"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=pm.me;
	s=protonmail3; t=1778821755; x=1779080955;
	bh=wpiHLX1zWOUy8hBTDFwvSmMkzZNlxTZRLe+LwVa3mZQ=;
	h=Date:To:From:Cc:Subject:Message-ID:In-Reply-To:References:
	 Feedback-ID:From:To:Cc:Date:Subject:Reply-To:Feedback-ID:
	 Message-ID:BIMI-Selector;
	b=Ijru+n1yq4d5K79UiEOOTgNDmbbqldJazRLtiTFMNiV0aEzJHk52zV4v4flBwofmu
	 9nkUYrEgFphCTZB+igkolrAcEDn0o+N0f7V2dqjq5nJzKlWd3h+W49RTjRta19SYD3
	 x4UZ+t2oBiD9kY22uIHSBpVkgMPEoeG2dQKVk16wTIT+gDz50ObDeYspr4MZvGF7QY
	 kp6/40NdAkHZA3CAdnLBzG0u3X/Hkp+9uaL9rjHO0QR8E9P5GHUQOhJqPKW2qyvGfm
	 Oc/gdqtrF8kT4GAY1Hhkb9y0M96U4tnTmJ7hsZSC0CkxBOjWdo4lBxi2b9Xcm4dFC5
	 Y8x9Fsf897FcQ==
Date: Fri, 15 May 2026 05:09:08 +0000
To: Rob Clark <robin.clark@oss.qualcomm.com>, Dmitry Baryshkov <lumag@kernel.org>, Abhinav Kumar <abhinav.kumar@linux.dev>, Jessica Zhang <jesszhan0024@gmail.com>, Sean Paul <sean@poorly.run>, Marijn Suijten <marijn.suijten@somainline.org>, David Airlie <airlied@gmail.com>, Simona Vetter <simona@ffwll.ch>, Maarten Lankhorst <maarten.lankhorst@linux.intel.com>, Maxime Ripard <mripard@kernel.org>, Thomas Zimmermann <tzimmermann@suse.de>, Rob Herring <robh@kernel.org>, Krzysztof Kozlowski <krzk+dt@kernel.org>, Conor Dooley <conor+dt@kernel.org>, Konrad Dybcio <konradybcio@kernel.org>, Akhil P Oommen <akhilpo@oss.qualcomm.com>, Bjorn Andersson <andersson@kernel.org>
From: Alexander Koskovich <akoskovich@pm.me>
Cc: Luca Weiss <luca.weiss@fairphone.com>, linux-arm-msm@vger.kernel.org, dri-devel@lists.freedesktop.org, freedreno@lists.freedesktop.org, devicetree@vger.kernel.org, linux-kernel@vger.kernel.org, Alexander Koskovich <akoskovich@pm.me>, Konrad Dybcio <konrad.dybcio@oss.qualcomm.com>
Subject: [PATCH RFC v6 5/7] drm/msm/a8xx: use pipe protect slot 15 for last-span-unbound feature
Message-ID: <20260515-adreno-810-v6-5-fbe04c7203e1@pm.me>
In-Reply-To: <20260515-adreno-810-v6-0-fbe04c7203e1@pm.me>
References: <20260515-adreno-810-v6-0-fbe04c7203e1@pm.me>
Feedback-ID: 37836894:user:proton
X-Pm-Message-ID: deabef54c61baff43a06462424b7511c88efdcf4
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


