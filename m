Received: from mail-106119.protonmail.ch (mail-106119.protonmail.ch [79.135.106.119])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id B3CFD3DEAC9
	for <devicetree@vger.kernel.org>; Fri, 15 May 2026 05:08:40 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=79.135.106.119
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1778821722; cv=none; b=i5Kwvt1KQKmXdPoZ236mU9TVEYcoUkNtOx3VyfNgHECfGcokk+lfMDYYWlO64Du/3QELmT50zTmB7QT1xteTMhcjQ8B1SumduXyW6kcutAlQ/hTLH0dDqhpCCyQBBbRX21zAp796tWnTI3wsLU75enJjJaRdtE4vbzZ+IJ/1dWA=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1778821722; c=relaxed/simple;
	bh=ZPDzxzNkMskjLOEcF6bpBPV7fYkrTOkqVFWAURsyI6s=;
	h=Date:To:From:Cc:Subject:Message-ID:In-Reply-To:References:
	 MIME-Version:Content-Type; b=rW1q0X31K2uMMHgmMZ5AYQ8PjJZvMgvzSAf5D+ia0OJ8MCEVJt4wpaAEGIVlZae8WcgpDnKzoIUUy8cpZeDNt5uBzBCZojYsIDpVRdltvbhWV+QZKm2w2Y8+e3CsNtMPZOxqB8Zj19K0DycLiQjuz6Jh82a0Bpbj3U4WdlNWNRY=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=pm.me; spf=pass smtp.mailfrom=pm.me; dkim=pass (2048-bit key) header.d=pm.me header.i=@pm.me header.b=X189sRUn; arc=none smtp.client-ip=79.135.106.119
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=pm.me
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=pm.me
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=pm.me header.i=@pm.me header.b="X189sRUn"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=pm.me;
	s=protonmail3; t=1778821712; x=1779080912;
	bh=pv/F1PPV1Zi+/q9n2GNINyeWZvEso37phWI69dlZ4Wg=;
	h=Date:To:From:Cc:Subject:Message-ID:In-Reply-To:References:
	 Feedback-ID:From:To:Cc:Date:Subject:Reply-To:Feedback-ID:
	 Message-ID:BIMI-Selector;
	b=X189sRUnIOmn2B6pl10Bjwu9Pr2mHU8pxOGBiQ2Qh1ci9G81T/uJ3HOC0+qjcBxER
	 rf1OLSPUaGC1dKa7eMluxHFJDugYgK2CQXS+QK/TmwFCbygJt7BUKl7qIK52r4sJCF
	 E/J3Z0nLziLix+MbPHGsEYLEneJ30TSaaLu8yhEQzsZh/y9t8k1Iha1FDiT5CVDG1y
	 +9LDFInHQRsTLhnAxVM2ZaOq3mPs8/ZJOZGI6pWkhl4U0FT83IrkK0GywDI6EObjXp
	 LY6X9auerdYTueyvIopixjSn/QWpq2rsxiaq5Osi64r/U5bMiXTYNCzLOlbBq4pPkj
	 lJPE2aKRdbZrw==
Date: Fri, 15 May 2026 05:08:24 +0000
To: Rob Clark <robin.clark@oss.qualcomm.com>, Dmitry Baryshkov <lumag@kernel.org>, Abhinav Kumar <abhinav.kumar@linux.dev>, Jessica Zhang <jesszhan0024@gmail.com>, Sean Paul <sean@poorly.run>, Marijn Suijten <marijn.suijten@somainline.org>, David Airlie <airlied@gmail.com>, Simona Vetter <simona@ffwll.ch>, Maarten Lankhorst <maarten.lankhorst@linux.intel.com>, Maxime Ripard <mripard@kernel.org>, Thomas Zimmermann <tzimmermann@suse.de>, Rob Herring <robh@kernel.org>, Krzysztof Kozlowski <krzk+dt@kernel.org>, Conor Dooley <conor+dt@kernel.org>, Konrad Dybcio <konradybcio@kernel.org>, Akhil P Oommen <akhilpo@oss.qualcomm.com>, Bjorn Andersson <andersson@kernel.org>
From: Alexander Koskovich <akoskovich@pm.me>
Cc: Luca Weiss <luca.weiss@fairphone.com>, linux-arm-msm@vger.kernel.org, dri-devel@lists.freedesktop.org, freedreno@lists.freedesktop.org, devicetree@vger.kernel.org, linux-kernel@vger.kernel.org, Alexander Koskovich <akoskovich@pm.me>, Krzysztof Kozlowski <krzysztof.kozlowski@oss.qualcomm.com>
Subject: [PATCH RFC v6 1/7] dt-bindings: display/msm/gmu: Document Adreno 810 GMU
Message-ID: <20260515-adreno-810-v6-1-fbe04c7203e1@pm.me>
In-Reply-To: <20260515-adreno-810-v6-0-fbe04c7203e1@pm.me>
References: <20260515-adreno-810-v6-0-fbe04c7203e1@pm.me>
Feedback-ID: 37836894:user:proton
X-Pm-Message-ID: 7d369594815313d6516ace44ebba579508e341ca
Precedence: bulk
X-Mailing-List: devicetree@vger.kernel.org
List-Id: <devicetree.vger.kernel.org>
List-Subscribe: <mailto:devicetree+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:devicetree+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Transfer-Encoding: quoted-printable

Document Adreno 810 GMU in the dt-binding specification.

Reviewed-by: Krzysztof Kozlowski <krzysztof.kozlowski@oss.qualcomm.com>
Signed-off-by: Alexander Koskovich <akoskovich@pm.me>
---
 .../devicetree/bindings/display/msm/gmu.yaml       | 30 ++++++++++++++++++=
++++
 1 file changed, 30 insertions(+)

diff --git a/Documentation/devicetree/bindings/display/msm/gmu.yaml b/Docum=
entation/devicetree/bindings/display/msm/gmu.yaml
index 93e5e6e19754..8578c2f8122e 100644
--- a/Documentation/devicetree/bindings/display/msm/gmu.yaml
+++ b/Documentation/devicetree/bindings/display/msm/gmu.yaml
@@ -300,6 +300,36 @@ allOf:
       required:
         - qcom,qmp
=20
+  - if:
+      properties:
+        compatible:
+          contains:
+            const: qcom,adreno-gmu-810.0
+    then:
+      properties:
+        reg:
+          items:
+            - description: Core GMU registers
+        reg-names:
+          items:
+            - const: gmu
+        clocks:
+          items:
+            - description: GPU AHB clock
+            - description: GMU clock
+            - description: GPU CX clock
+            - description: GPU AXI clock
+            - description: GPU MEMNOC clock
+            - description: GMU HUB clock
+        clock-names:
+          items:
+            - const: ahb
+            - const: gmu
+            - const: cxo
+            - const: axi
+            - const: memnoc
+            - const: hub
+
   - if:
       properties:
         compatible:

--=20
2.53.0


