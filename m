Received: from mail-43101.protonmail.ch (mail-43101.protonmail.ch [185.70.43.101])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 97B563B47FC
	for <devicetree@vger.kernel.org>; Thu, 28 May 2026 09:48:50 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=185.70.43.101
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1779961732; cv=none; b=FeSjbyh1I55psryhw6snTfREI2N+Wve9B5KfgXD21kJcOeEIUHChomIVVuz5RYU+8nw6Q73/cFwHT85kVUKV/rxEYdMcOpnKpIxAlNmo4RhZJKdq3SijPxQbMY1XzYzMeeuYoOYBpBYg1scHvJPYkh4S9xRNHvwioy5P0+EDQ18=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1779961732; c=relaxed/simple;
	bh=EOfkEqoI59XmVVmUQgLQY7QKKEQ7Ln2MOTubLdT2nN8=;
	h=Date:To:From:Cc:Subject:Message-ID:In-Reply-To:References:
	 MIME-Version:Content-Type; b=pyQLGXHVQnC2aqeaDk9Gy30Wno7/v0MT1zaYRxDYfsXJgyeoie3q210G56NzJtzgDIlrVt90TGCL96YZwFc4DyFFzxIU6DKPOt4+qVewtyMaovdySj9eQMe1ITCQu8Kta+YOZmGu0OCpiNJBMvCC39CIWbGifNh4cfN6IZ3SCKE=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=pm.me; spf=pass smtp.mailfrom=pm.me; dkim=pass (2048-bit key) header.d=pm.me header.i=@pm.me header.b=Hz8PiSFs; arc=none smtp.client-ip=185.70.43.101
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=pm.me
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=pm.me
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=pm.me header.i=@pm.me header.b="Hz8PiSFs"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=pm.me;
	s=protonmail3; t=1779961722; x=1780220922;
	bh=6quOadJw0T40j2a2pj1RIqbFfyX3sZvPfSLjCbf9oyo=;
	h=Date:To:From:Cc:Subject:Message-ID:In-Reply-To:References:
	 Feedback-ID:From:To:Cc:Date:Subject:Reply-To:Feedback-ID:
	 Message-ID:BIMI-Selector;
	b=Hz8PiSFshssZhY+P9tiFU17cGqAmBJOZ3nx3xv9n4sShdSKzYGfwhmU+Gpfeo4yCz
	 M2x7Sy+apvxVC2Ok+6YKind9vQc45ZRrbIrvWWIAbZxVsib7xZK0DIxHGlsPRPSKiJ
	 jDUWHeuriJjfRrQ6WiUF//Ru6/PE5hL15CJvUd8thD3v+xU73/lBZKy4SmhlAAbadu
	 2mLIOUP5FVwWMKQUzxr+jrUo27VX2jjCfqWOfevSpP5AcDt8y4+SGzbCbpABgCSsaF
	 sdiG3x7lW7rH8OVB06odeU0ApkkW4PtvI8yDo1DFpM8jrazi2DmiNkRCGTse2Vdydn
	 gjd0D0kjL1/NA==
Date: Thu, 28 May 2026 09:48:39 +0000
To: Rob Clark <robin.clark@oss.qualcomm.com>, Dmitry Baryshkov <lumag@kernel.org>, Abhinav Kumar <abhinav.kumar@linux.dev>, Jessica Zhang <jesszhan0024@gmail.com>, Sean Paul <sean@poorly.run>, Marijn Suijten <marijn.suijten@somainline.org>, David Airlie <airlied@gmail.com>, Simona Vetter <simona@ffwll.ch>, Maarten Lankhorst <maarten.lankhorst@linux.intel.com>, Maxime Ripard <mripard@kernel.org>, Thomas Zimmermann <tzimmermann@suse.de>, Rob Herring <robh@kernel.org>, Krzysztof Kozlowski <krzk+dt@kernel.org>, Conor Dooley <conor+dt@kernel.org>, Konrad Dybcio <konradybcio@kernel.org>, Akhil P Oommen <akhilpo@oss.qualcomm.com>, Bjorn Andersson <andersson@kernel.org>
From: Alexander Koskovich <akoskovich@pm.me>
Cc: linux-arm-msm@vger.kernel.org, dri-devel@lists.freedesktop.org, freedreno@lists.freedesktop.org, devicetree@vger.kernel.org, linux-kernel@vger.kernel.org, Alexander Koskovich <akoskovich@pm.me>
Subject: [PATCH v7 2/6] dt-bindings: display/msm/gpu: Document Adreno 810 GPU
Message-ID: <20260528-adreno-810-v7-2-7fe7fdd97fc2@pm.me>
In-Reply-To: <20260528-adreno-810-v7-0-7fe7fdd97fc2@pm.me>
References: <20260528-adreno-810-v7-0-7fe7fdd97fc2@pm.me>
Feedback-ID: 37836894:user:proton
X-Pm-Message-ID: b0700308c569d04cc9deec9ef3d4d5b4f1f32221
Precedence: bulk
X-Mailing-List: devicetree@vger.kernel.org
List-Id: <devicetree.vger.kernel.org>
List-Subscribe: <mailto:devicetree+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:devicetree+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Transfer-Encoding: quoted-printable

Document the GPU compatible string used for the Adreno 810.

Reviewed-by: Akhil P Oommen <akhilpo@oss.qualcomm.com>
Signed-off-by: Alexander Koskovich <akoskovich@pm.me>
---
 Documentation/devicetree/bindings/display/msm/gpu.yaml | 5 ++++-
 1 file changed, 4 insertions(+), 1 deletion(-)

diff --git a/Documentation/devicetree/bindings/display/msm/gpu.yaml b/Docum=
entation/devicetree/bindings/display/msm/gpu.yaml
index 77caacd0fb3f..a40899e5ea58 100644
--- a/Documentation/devicetree/bindings/display/msm/gpu.yaml
+++ b/Documentation/devicetree/bindings/display/msm/gpu.yaml
@@ -415,7 +415,9 @@ allOf:
       properties:
         compatible:
           contains:
-            const: qcom,adreno-44070001
+            enum:
+              - qcom,adreno-44010000
+              - qcom,adreno-44070001
     then:
       properties:
         reg:
@@ -449,6 +451,7 @@ allOf:
               - qcom,adreno-43050a01
               - qcom,adreno-43050c01
               - qcom,adreno-43051401
+              - qcom,adreno-44010000
               - qcom,adreno-44070001
=20
     then: # Starting with A6xx, the clocks are usually defined in the GMU =
node

--=20
2.53.0


