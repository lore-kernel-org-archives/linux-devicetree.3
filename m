Received: from mail-43100.protonmail.ch (mail-43100.protonmail.ch [185.70.43.100])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id D40783AA4F7;
	Thu,  2 Apr 2026 23:09:45 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=185.70.43.100
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1775171387; cv=none; b=lVrDV7AIhYF1xbAfUE5gCGd4ukS0vMsSQxQf8eE09pnGTsu2v4Uo8yi3IGEyNc+Asvsmnr+7Z5jVWNBuiJGe7L14IRzSAcmi7n9iRYl1IAWijhBM6RB7OlAUKbiacXGt7NyxiICxzlEX9PYkbzuMfqHKgVdG2hacGLtHy6ELTB0=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1775171387; c=relaxed/simple;
	bh=sjTb348AHUewwGk80X2mbrV7aXERcHAbGOkvX3abnHk=;
	h=Date:To:From:Cc:Subject:Message-ID:In-Reply-To:References:
	 MIME-Version:Content-Type; b=JRTDs8GNccZl3l0ynVDZbLMYh2bzwpQMvHqHsVI6RhS/9/8wMYyERokBb/f9F2tsKqg0LbELzD7AMyrs1cDFYRIGDzmSPMGoenimOnrr9j9sHasvOA2b9O75mjxePHygC6gvTt3Y5FBWLg6mT46honJMNlW1noO1PjJk6rVacTs=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=pm.me; spf=pass smtp.mailfrom=pm.me; dkim=pass (2048-bit key) header.d=pm.me header.i=@pm.me header.b=OXP1FSyt; arc=none smtp.client-ip=185.70.43.100
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=pm.me
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=pm.me
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=pm.me header.i=@pm.me header.b="OXP1FSyt"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=pm.me;
	s=protonmail3; t=1775171377; x=1775430577;
	bh=sjTb348AHUewwGk80X2mbrV7aXERcHAbGOkvX3abnHk=;
	h=Date:To:From:Cc:Subject:Message-ID:In-Reply-To:References:
	 Feedback-ID:From:To:Cc:Date:Subject:Reply-To:Feedback-ID:
	 Message-ID:BIMI-Selector;
	b=OXP1FSytZr2lVqzBVwut/DZqHEuUY8BolFD8t+2wIa0aKrAFMTWOhmJYQT+02szT6
	 l2VujR0UU+kXhbMoA0cYCQt+qB5ZOVpgXAFQ/JkPaw6AwBYIE8I2DKpP8bkv5BUL4M
	 0YEvdoeTOF/WQBqe9TNGKKtWuN50ya4LXCb7h1tEYFjXFUBzSFWjIQwxNuCp9doTJu
	 0rS62ZvsfewuODCd3VREMveMbv3injRnwW/HkTQeb9zc148fy0BX0VDSJGrsScYoVp
	 zDondzzufj/AFXcpBgNovr6PL/QcVn6SHeQUO5k2efqgKSMTommW0iROYIAYcV7Hm1
	 9bvG5vofKLN8g==
Date: Thu, 02 Apr 2026 23:09:32 +0000
To: Rob Clark <robin.clark@oss.qualcomm.com>, Dmitry Baryshkov <lumag@kernel.org>, Abhinav Kumar <abhinav.kumar@linux.dev>, Jessica Zhang <jesszhan0024@gmail.com>, Sean Paul <sean@poorly.run>, Marijn Suijten <marijn.suijten@somainline.org>, Maarten Lankhorst <maarten.lankhorst@linux.intel.com>, Maxime Ripard <mripard@kernel.org>, Thomas Zimmermann <tzimmermann@suse.de>, David Airlie <airlied@gmail.com>, Simona Vetter <simona@ffwll.ch>, Rob Herring <robh@kernel.org>, Krzysztof Kozlowski <krzk+dt@kernel.org>, Conor Dooley <conor+dt@kernel.org>, Konrad Dybcio <konradybcio@kernel.org>, Akhil P Oommen <akhilpo@oss.qualcomm.com>, Bjorn Andersson <andersson@kernel.org>
From: Alexander Koskovich <akoskovich@pm.me>
Cc: Luca Weiss <luca.weiss@fairphone.com>, linux-arm-msm@vger.kernel.org, dri-devel@lists.freedesktop.org, freedreno@lists.freedesktop.org, devicetree@vger.kernel.org, linux-kernel@vger.kernel.org, Alexander Koskovich <akoskovich@pm.me>, Konrad Dybcio <konrad.dybcio@oss.qualcomm.com>
Subject: [PATCH RFC v2 4/6] drm/msm/a8xx: use pipe protect slot 15 for last-span-unbound feature
Message-ID: <20260402-adreno-810-v2-4-ce337ca87a9e@pm.me>
In-Reply-To: <20260402-adreno-810-v2-0-ce337ca87a9e@pm.me>
References: <20260402-adreno-810-v2-0-ce337ca87a9e@pm.me>
Feedback-ID: 37836894:user:proton
X-Pm-Message-ID: b8def7380ff3b80ea1b49ff0111db2fc670cb38b
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
Signed-off-by: Alexander Koskovich <akoskovich@pm.me>
---
 drivers/gpu/drm/msm/adreno/a8xx_gpu.c | 9 +++++----
 1 file changed, 5 insertions(+), 4 deletions(-)

diff --git a/drivers/gpu/drm/msm/adreno/a8xx_gpu.c b/drivers/gpu/drm/msm/ad=
reno/a8xx_gpu.c
index 8b4b022d9a6b..102d5e751536 100644
--- a/drivers/gpu/drm/msm/adreno/a8xx_gpu.c
+++ b/drivers/gpu/drm/msm/adreno/a8xx_gpu.c
@@ -252,11 +252,12 @@ static void a8xx_set_cp_protect(struct msm_gpu *gpu)
 =09}
=20
 =09/*
-=09 * Last span feature is only supported on PIPE specific register.
-=09 * So update those here
+=09 * Last span setting is only being applied to the last pipe specific
+=09 * register. Hence duplicate the last span from protect reg into the
+=09 * BR and BV protect reg pipe 15.
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


