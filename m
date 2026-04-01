Received: from mail-244123.protonmail.ch (mail-244123.protonmail.ch [109.224.244.123])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 342F91FA272
	for <devicetree@vger.kernel.org>; Wed,  1 Apr 2026 02:17:32 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=109.224.244.123
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1775009854; cv=none; b=c/QcP9R3KfRWWlWDk68Xrs27Howwizaortu4PzvJBSGF3G9QT/2yup8zq7G2OeZo+Z3TwfxbEMGsozAOjptSUR+B0g6fznWIzwanChAhom2dgpjYrm4S3TwBDbpDE3Umz0O9p1C9La1Upt4F44k1kILAznqfDP1j85K3T8h7irg=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1775009854; c=relaxed/simple;
	bh=73Psf8RUrYZQFi6blmvy3tdL4+HY9hFI5sWBh7+SDko=;
	h=Date:To:From:Cc:Subject:Message-ID:In-Reply-To:References:
	 MIME-Version:Content-Type; b=pND40rNXhzqx5TMVHDfMS/seAc7Ge/JgtkeHkn5ri5C9Bqa0xAztx57cG2pOdOWSSPA7BfeG7xTAw1SggR6PFmrYyrJ6QVuDMbOeWWpdL2S2W10uVU5ZliM7dtbk6AwI9tBmlQkA/+oIpE3ujts22zxN7nQsfGV0kF7zRzIZBdg=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=pm.me; spf=pass smtp.mailfrom=pm.me; dkim=pass (2048-bit key) header.d=pm.me header.i=@pm.me header.b=m7A70LOZ; arc=none smtp.client-ip=109.224.244.123
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=pm.me
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=pm.me
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=pm.me header.i=@pm.me header.b="m7A70LOZ"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=pm.me;
	s=protonmail3; t=1775009845; x=1775269045;
	bh=73Psf8RUrYZQFi6blmvy3tdL4+HY9hFI5sWBh7+SDko=;
	h=Date:To:From:Cc:Subject:Message-ID:In-Reply-To:References:
	 Feedback-ID:From:To:Cc:Date:Subject:Reply-To:Feedback-ID:
	 Message-ID:BIMI-Selector;
	b=m7A70LOZmmtucBAEb0YWgs5NKb2SlV80+hBB/KOLeCQora1rPni+CpCVSLLl8ZMBM
	 oibfYxeu52ZdYD2Am6/yxY2TQF8w+Hi3fGURdQmTD28F3u6RgngdwL1j0HoPjP8YXe
	 6lKL5o5SLj15pAaohY+Rt1M8oXBwPFnaY1jihqvLssHyhlhULMycIhoDe8lQPck/al
	 TbO8SYIN4Xd1N/sn46feaA8fs/ed+aKUB9NmDnRZEtgAZI/rsY+PN0P+bh6Q2KiuZm
	 fsQUgtgJzmhh7MGSjdB6lddi24ebG9s9hlLPPkNbQ8uJQihKlMCKGyRHzfdpy1MrX4
	 GJbieMaTAn3BQ==
Date: Wed, 01 Apr 2026 02:17:21 +0000
To: Rob Clark <robin.clark@oss.qualcomm.com>, Dmitry Baryshkov <lumag@kernel.org>, Abhinav Kumar <abhinav.kumar@linux.dev>, Jessica Zhang <jesszhan0024@gmail.com>, Sean Paul <sean@poorly.run>, Marijn Suijten <marijn.suijten@somainline.org>, Maarten Lankhorst <maarten.lankhorst@linux.intel.com>, Maxime Ripard <mripard@kernel.org>, Thomas Zimmermann <tzimmermann@suse.de>, David Airlie <airlied@gmail.com>, Simona Vetter <simona@ffwll.ch>, Rob Herring <robh@kernel.org>, Krzysztof Kozlowski <krzk+dt@kernel.org>, Conor Dooley <conor+dt@kernel.org>, Konrad Dybcio <konradybcio@kernel.org>, Akhil P Oommen <akhilpo@oss.qualcomm.com>, Bjorn Andersson <andersson@kernel.org>
From: Alexander Koskovich <akoskovich@pm.me>
Cc: Luca Weiss <luca.weiss@fairphone.com>, linux-arm-msm@vger.kernel.org, dri-devel@lists.freedesktop.org, freedreno@lists.freedesktop.org, devicetree@vger.kernel.org, linux-kernel@vger.kernel.org, Alexander Koskovich <akoskovich@pm.me>
Subject: [PATCH 4/6] drm/msm/a8xx: use pipe protect slot 15 for last-span-unbound feature
Message-ID: <20260331-adreno-810-v1-4-725801dbb12b@pm.me>
In-Reply-To: <20260331-adreno-810-v1-0-725801dbb12b@pm.me>
References: <20260331-adreno-810-v1-0-725801dbb12b@pm.me>
Feedback-ID: 37836894:user:proton
X-Pm-Message-ID: 69d98dadff9f9da658c472e0351e335d6e5fe1c2
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

Signed-off-by: Alexander Koskovich <akoskovich@pm.me>
---
 drivers/gpu/drm/msm/adreno/a8xx_gpu.c | 9 +++++----
 1 file changed, 5 insertions(+), 4 deletions(-)

diff --git a/drivers/gpu/drm/msm/adreno/a8xx_gpu.c b/drivers/gpu/drm/msm/ad=
reno/a8xx_gpu.c
index 5af82d43f1e4..63387ee9b04a 100644
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


