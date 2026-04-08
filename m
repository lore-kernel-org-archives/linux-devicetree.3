Received: from mail-106119.protonmail.ch (mail-106119.protonmail.ch [79.135.106.119])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id BC18318DF80
	for <devicetree@vger.kernel.org>; Wed,  8 Apr 2026 01:45:32 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=79.135.106.119
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1775612734; cv=none; b=fRzLH76tGRir3zLwYRiORNg+0Yf+yCT0RsDiSZ1gFOQuvU2e8ToWOLye5izHocEtQh0WfZSDQQzx6YFKquoi1YoudTvmIEAQv4ILtux0IdDDT3OXefFw6vjccUWa5c/fvMnE4+nsaX7SGanN/OrkNRi4WjqEiQsQcX5JwRlPMDI=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1775612734; c=relaxed/simple;
	bh=eU/cSxB6Uf0re/3rG3Ty2Mmq7/rXHXC9/PXDZJO5zXg=;
	h=Date:To:From:Cc:Subject:Message-ID:In-Reply-To:References:
	 MIME-Version:Content-Type; b=LwIvrCU94svgagjX5c2cJbxTkSjPOZhQTvymG/gSVZPivc7rMPuwIUaB5Cj7n7pT6zhQb/kjI0G93dplEX/gWvNmtq5Kk4M8+4J4xtuas5J0GOZ8OXwIDUVHTAIZ5VmMQW2wnCgAHcQPg2DcBAeOZoiaLkW0WSHasBu+4IGr9B8=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=pm.me; spf=pass smtp.mailfrom=pm.me; dkim=pass (2048-bit key) header.d=pm.me header.i=@pm.me header.b=F/iqHiGt; arc=none smtp.client-ip=79.135.106.119
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=pm.me
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=pm.me
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=pm.me header.i=@pm.me header.b="F/iqHiGt"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=pm.me;
	s=protonmail3; t=1775612730; x=1775871930;
	bh=sK1TlZBAQYySSMv6oS9up9cb7t40GRjDltzChsfIaAk=;
	h=Date:To:From:Cc:Subject:Message-ID:In-Reply-To:References:
	 Feedback-ID:From:To:Cc:Date:Subject:Reply-To:Feedback-ID:
	 Message-ID:BIMI-Selector;
	b=F/iqHiGtrsXpGp7fc5ftevgQN0JChZHruPsu6yG4yzy6U5r/MgPK8mxsI6DxhomNc
	 BcV9O3AoOvSm4hSLBb3IqNBXq49Y8JbIp/HnvokG2UNMpVrQ40qnWtynFv1Ux2ogXx
	 p6/wgLx7TxXwyvzo7lxwssRVvhRFJfOwZsrRcLhT7RvEWf7d1Njy2nuqpJF+et0ZF0
	 rZOGMLAK6ffjIdqAlCVdkip6ACeJN9mukTHU70g1pVh7bxyTQx9at8AbBLgbfJfwQR
	 zCG7y4Kb6KjXxg62QSYuT0Fr/+iBJUhZYBB9uInq6EaiyC2yl9MiqrkqG3LNRu8Plh
	 zJy5fs4ds8EHw==
Date: Wed, 08 Apr 2026 01:45:22 +0000
To: Rob Clark <robin.clark@oss.qualcomm.com>, Dmitry Baryshkov <lumag@kernel.org>, Abhinav Kumar <abhinav.kumar@linux.dev>, Jessica Zhang <jesszhan0024@gmail.com>, Sean Paul <sean@poorly.run>, Marijn Suijten <marijn.suijten@somainline.org>, Maarten Lankhorst <maarten.lankhorst@linux.intel.com>, Maxime Ripard <mripard@kernel.org>, Thomas Zimmermann <tzimmermann@suse.de>, David Airlie <airlied@gmail.com>, Simona Vetter <simona@ffwll.ch>, Rob Herring <robh@kernel.org>, Krzysztof Kozlowski <krzk+dt@kernel.org>, Conor Dooley <conor+dt@kernel.org>, Konrad Dybcio <konradybcio@kernel.org>, Akhil P Oommen <akhilpo@oss.qualcomm.com>, Bjorn Andersson <andersson@kernel.org>
From: Alexander Koskovich <akoskovich@pm.me>
Cc: Luca Weiss <luca.weiss@fairphone.com>, linux-arm-msm@vger.kernel.org, dri-devel@lists.freedesktop.org, freedreno@lists.freedesktop.org, devicetree@vger.kernel.org, linux-kernel@vger.kernel.org, Alexander Koskovich <akoskovich@pm.me>, Krzysztof Kozlowski <krzysztof.kozlowski@oss.qualcomm.com>
Subject: [PATCH RFC v3 1/7] dt-bindings: display/msm/gmu: Document Adreno 810 GMU
Message-ID: <20260407-adreno-810-v3-1-30cb7f196ed4@pm.me>
In-Reply-To: <20260407-adreno-810-v3-0-30cb7f196ed4@pm.me>
References: <20260407-adreno-810-v3-0-30cb7f196ed4@pm.me>
Feedback-ID: 37836894:user:proton
X-Pm-Message-ID: a6fbc1f333b64e18a7010722c4cfc4d3c6db0aea
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
index e32056ae0f5d..cc03cda67ea7 100644
--- a/Documentation/devicetree/bindings/display/msm/gmu.yaml
+++ b/Documentation/devicetree/bindings/display/msm/gmu.yaml
@@ -299,6 +299,36 @@ allOf:
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


