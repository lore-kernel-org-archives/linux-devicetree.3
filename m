Received: from mail-244121.protonmail.ch (mail-244121.protonmail.ch [109.224.244.121])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 6274D26C39E
	for <devicetree@vger.kernel.org>; Wed,  8 Apr 2026 01:45:46 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=109.224.244.121
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1775612747; cv=none; b=OCW19bT5YXodKaDm20XveYrGf6s9FPM/kPO8AL8x+I1pETKnCTtNcFH490SawUM1QuPW3z+lp4J4EBtjKUNmQ+cQ/fNiK827MN8JLl5sEkjY5qU0Gb63miplm43FIG+EH39vxk4leMWHYT+tAtGICay0RJvQU56F14DCOt5hGkU=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1775612747; c=relaxed/simple;
	bh=yVCQ3Mvashl8qM6+9KCEfjaDfvC9TCf+CuT8KgZXoas=;
	h=Date:To:From:Cc:Subject:Message-ID:In-Reply-To:References:
	 MIME-Version:Content-Type; b=XX4ynC2Vn0v1Op3UvmzNjcJt7a5TUfSaBUnjVJELG57SCs1a3cLvEJVNCY12XrcwdF11rJAUWgd1CSQqqvOV3FyZRtCND+rYxiu6y2oZt9fv2L6AdVFLhzFf6x4zXuxRBHcrzF9GDEPMFDfAtaGZdzxGhM9KWjKYPXRSNiG+3yU=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=pm.me; spf=pass smtp.mailfrom=pm.me; dkim=pass (2048-bit key) header.d=pm.me header.i=@pm.me header.b=T5d+FfLf; arc=none smtp.client-ip=109.224.244.121
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=pm.me
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=pm.me
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=pm.me header.i=@pm.me header.b="T5d+FfLf"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=pm.me;
	s=protonmail3; t=1775612738; x=1775871938;
	bh=My6A4Kjbvn3+yth/CNO0WJXA7jsoQunz1YO6PftMUyU=;
	h=Date:To:From:Cc:Subject:Message-ID:In-Reply-To:References:
	 Feedback-ID:From:To:Cc:Date:Subject:Reply-To:Feedback-ID:
	 Message-ID:BIMI-Selector;
	b=T5d+FfLfs22XjDp0zt9bcLQuOUISVahbXiohAiknQxSSuA/VrT0cz6qspzHaQbPX0
	 eL2V7pQnr0bbhQ2L9wibX/GMeYUqCgW8Cex6ajjMaZQD7wCwfd+50im8LU1dk6HYmn
	 1QhBBbRIi24gxdEM9sGGl54R9LjOj108jYxLGW1sOeYmOaXI0qmi4Q5c3VUY4jGX8O
	 2pOz23A+SMJoECkMMkrDZDbOypTE6v++tgaP5+eAAMs+8kd/UCrqBxguQ9fZhjh/wq
	 rlAPZFqh9K7jRw6BMh3lSdgzt2XjH3jiblZGuwHYJiU5bZ1yHz6QMSvZItmR9/pYOx
	 H7V9yz4/k3R2A==
Date: Wed, 08 Apr 2026 01:45:33 +0000
To: Rob Clark <robin.clark@oss.qualcomm.com>, Dmitry Baryshkov <lumag@kernel.org>, Abhinav Kumar <abhinav.kumar@linux.dev>, Jessica Zhang <jesszhan0024@gmail.com>, Sean Paul <sean@poorly.run>, Marijn Suijten <marijn.suijten@somainline.org>, Maarten Lankhorst <maarten.lankhorst@linux.intel.com>, Maxime Ripard <mripard@kernel.org>, Thomas Zimmermann <tzimmermann@suse.de>, David Airlie <airlied@gmail.com>, Simona Vetter <simona@ffwll.ch>, Rob Herring <robh@kernel.org>, Krzysztof Kozlowski <krzk+dt@kernel.org>, Conor Dooley <conor+dt@kernel.org>, Konrad Dybcio <konradybcio@kernel.org>, Akhil P Oommen <akhilpo@oss.qualcomm.com>, Bjorn Andersson <andersson@kernel.org>
From: Alexander Koskovich <akoskovich@pm.me>
Cc: Luca Weiss <luca.weiss@fairphone.com>, linux-arm-msm@vger.kernel.org, dri-devel@lists.freedesktop.org, freedreno@lists.freedesktop.org, devicetree@vger.kernel.org, linux-kernel@vger.kernel.org, Alexander Koskovich <akoskovich@pm.me>
Subject: [PATCH RFC v3 2/7] dt-bindings: display/msm/gpu: Document A810 GPU
Message-ID: <20260407-adreno-810-v3-2-30cb7f196ed4@pm.me>
In-Reply-To: <20260407-adreno-810-v3-0-30cb7f196ed4@pm.me>
References: <20260407-adreno-810-v3-0-30cb7f196ed4@pm.me>
Feedback-ID: 37836894:user:proton
X-Pm-Message-ID: 83f10c34b769d3914c866c29fc061a35b54c7661
Precedence: bulk
X-Mailing-List: devicetree@vger.kernel.org
List-Id: <devicetree.vger.kernel.org>
List-Subscribe: <mailto:devicetree+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:devicetree+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Transfer-Encoding: quoted-printable

Document the GPU compatible string used for the Adreno 810.

Signed-off-by: Alexander Koskovich <akoskovich@pm.me>
---
 Documentation/devicetree/bindings/display/msm/gpu.yaml | 1 +
 1 file changed, 1 insertion(+)

diff --git a/Documentation/devicetree/bindings/display/msm/gpu.yaml b/Docum=
entation/devicetree/bindings/display/msm/gpu.yaml
index ec84b64d4c00..90ae435146d5 100644
--- a/Documentation/devicetree/bindings/display/msm/gpu.yaml
+++ b/Documentation/devicetree/bindings/display/msm/gpu.yaml
@@ -434,6 +434,7 @@ allOf:
               - qcom,adreno-43050a01
               - qcom,adreno-43050c01
               - qcom,adreno-43051401
+              - qcom,adreno-44010000
=20
     then: # Starting with A6xx, the clocks are usually defined in the GMU =
node
       properties:

--=20
2.53.0


