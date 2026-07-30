Received: from smtp.kernel.org (aws-us-west-2-korg-mail-alma10-1.taild15c8.ts.net [100.103.45.18])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 4053E43F080;
	Thu, 30 Jul 2026 14:19:29 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=100.103.45.18
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1785421170; cv=none; b=IDQ4PYZS7OrHmGyanLqnItCL/KA5qKmvHTKlgpbU+f5lsyhuW5amkYIsrvGEut7u0Quo7zKOD/Yt+y6v0oGcDEZZe3cFoxyENNVeAC11mWzOSd/m+OV1JWWp2tXOZsZeHWphAgUIItQ7E1dWiQX+4mVvhxKQWguaXXbdwHc8DOw=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1785421170; c=relaxed/simple;
	bh=sTTTfAaVIeu4U5XWg2bTepji50KuU3dWuw7Wak2Bv/E=;
	h=From:Date:Subject:MIME-Version:Content-Type:Message-Id:References:
	 In-Reply-To:To:Cc; b=kbbceTu9ySozuvf3CCrwvOmgYu62TIN6wwcTm1kqW8UI2qjuosASLij99a+mwKIPyx3w4BnMmWa6saq79dr2RzkebILHVya3bMaSsl43g7Ae/yGRpHO8eaXwBJqA1gDKQDJDhbWNIi2Hm6Fe3RsmGH9LrPpBFmnv4XvtrMm5nPI=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=nlxX20gx; arc=none smtp.client-ip=100.103.45.18
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="nlxX20gx"
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 45FC21F00A3A;
	Thu, 30 Jul 2026 14:19:24 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kernel.org;
	s=k20260515; t=1785421169;
	bh=GZLDTPo7pnCa4rXGOHiieW0U5XXmuyD9cIwA6E85lQY=;
	h=From:Date:Subject:References:In-Reply-To:To:Cc;
	b=nlxX20gxGguZ2v5E642QjgKzzJR9l33R7Z5IdbyKLa3YZRY+oowX8TlGRcY+NT17W
	 lF8S0Hvm+pPFaN6jy6FitQw0r0U7MqZhFBVqOf7GZgtDLZcnCUuQQ/bPHr75EvoZMS
	 rMgOqb6Wx4UD1Nl3v0okpeRVb4QH+7BG7Sd2z0kQkL30B3PMc/lqlwbKqGxOzl+fxh
	 9j8DHAnFNNLgOMtGfiuDxuIsn3eW8iZMgs7YyNpy56fAA7R/958bu/DloHhpM6UuJ+
	 mKxJ7pduJwkwLZWCeWW8/+z/+j3REkpSQFQYn8vIdrdwXSM53XmpQ5RdOHS7ejfQ8l
	 TP5Jx4Riuyr5Q==
From: Konrad Dybcio <konradybcio@kernel.org>
Date: Thu, 30 Jul 2026 16:19:13 +0200
Subject: [PATCH v3 1/5] dt-bindings: phy: qcom,qmp-usb3-dp: Extend X1E
 description for USB4
Precedence: bulk
X-Mailing-List: devicetree@vger.kernel.org
List-Id: <devicetree.vger.kernel.org>
List-Subscribe: <mailto:devicetree+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:devicetree+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20260730-topic-usb4phy-v3-1-ccf0f7ea98b5@oss.qualcomm.com>
References: <20260730-topic-usb4phy-v3-0-ccf0f7ea98b5@oss.qualcomm.com>
In-Reply-To: <20260730-topic-usb4phy-v3-0-ccf0f7ea98b5@oss.qualcomm.com>
To: Vinod Koul <vkoul@kernel.org>, 
 Neil Armstrong <neil.armstrong@linaro.org>, Rob Herring <robh@kernel.org>, 
 Krzysztof Kozlowski <krzk+dt@kernel.org>, 
 Conor Dooley <conor+dt@kernel.org>, Bjorn Andersson <andersson@kernel.org>, 
 Konrad Dybcio <konradybcio@kernel.org>
Cc: linux-kernel@vger.kernel.org, linux-phy@lists.infradead.org, 
 linux-arm-msm@vger.kernel.org, devicetree@vger.kernel.org, 
 usb4-upstream@oss.qualcomm.com, 
 Raghavendra Thoorpu <rthoorpu@qti.qualcomm.com>, 
 Mika Westerberg <westeri@kernel.org>, Sven Peter <sven@kernel.org>, 
 Konrad Dybcio <konrad.dybcio@oss.qualcomm.com>, 
 Krzysztof Kozlowski <krzysztof.kozlowski@oss.qualcomm.com>
X-Mailer: b4 0.15.2
X-Developer-Signature: v=1; a=ed25519-sha256; t=1785421158; l=3402;
 i=konrad.dybcio@oss.qualcomm.com; s=20230215; h=from:subject:message-id;
 bh=ioM+1JfL5GbKcpr0Oh4VXEfgYojNBsfBC5CjGpYl7WU=;
 b=QC19a2C2S+3qvzXq/KeTYT6+WNSEv/vFw1ZEcIgOTFKLjAdg/TzQ6zPZZQVI7HNRsPslvnaK1
 nwZAEp9B+sYBURSz9avdljHUCcTsxaibeAyzgCG8K3ErLkaeHvm5Ts1
X-Developer-Key: i=konrad.dybcio@oss.qualcomm.com; a=ed25519;
 pk=iclgkYvtl2w05SSXO5EjjSYlhFKsJ+5OSZBjOkQuEms=

From: Konrad Dybcio <konrad.dybcio@oss.qualcomm.com>

Some instances of the QMP combo PHY (called USB43DP) feature a third
functional sub-block, responsible for USB4/Thunderbolt 3 communication.

Compared to the today's state of the binding, one more clock (P2RR2P -
PHY-to-Router, Router-to-PHY) needs to be enabled for the PHY to be
able to switch to USB4 mode. Allow that for X1E.

Also, add a bindings define to let consumers access it.

Assisted-by: Claude:sonnet-5
Reviewed-by: Krzysztof Kozlowski <krzysztof.kozlowski@oss.qualcomm.com>
Signed-off-by: Konrad Dybcio <konrad.dybcio@oss.qualcomm.com>
---
 .../phy/qcom,sc8280xp-qmp-usb43dp-phy.yaml         | 55 +++++++++++++++++-----
 include/dt-bindings/phy/phy-qcom-qmp.h             |  1 +
 2 files changed, 45 insertions(+), 11 deletions(-)

diff --git a/Documentation/devicetree/bindings/phy/qcom,sc8280xp-qmp-usb43dp-phy.yaml b/Documentation/devicetree/bindings/phy/qcom,sc8280xp-qmp-usb43dp-phy.yaml
index 4eff92343ce4..18930eb96bdf 100644
--- a/Documentation/devicetree/bindings/phy/qcom,sc8280xp-qmp-usb43dp-phy.yaml
+++ b/Documentation/devicetree/bindings/phy/qcom,sc8280xp-qmp-usb43dp-phy.yaml
@@ -51,12 +51,7 @@ properties:
 
   clock-names:
     minItems: 4
-    items:
-      - const: aux
-      - const: ref
-      - const: com_aux
-      - const: usb3_pipe
-      - const: cfg_ahb
+    maxItems: 5
 
   power-domains:
     maxItems: 1
@@ -187,21 +182,59 @@ allOf:
   - if:
       properties:
         compatible:
-          enum:
-            - qcom,sc7180-qmp-usb3-dp-phy
-            - qcom,sdm845-qmp-usb3-dp-phy
+          contains:
+            enum:
+              - qcom,x1e80100-qmp-usb3-dp-phy
     then:
       properties:
         clocks:
           maxItems: 5
         clock-names:
+          items:
+            - const: aux
+            - const: ref
+            - const: com_aux
+            - const: usb3_pipe
+            - const: p2rr2p_pipe
+
+  - if:
+      properties:
+        compatible:
+          contains:
+            enum:
+              - qcom,sc7180-qmp-usb3-dp-phy
+              - qcom,sdm845-qmp-usb3-dp-phy
+    then:
+      properties:
+        clocks:
           maxItems: 5
-    else:
+        clock-names:
+          items:
+            - const: aux
+            - const: ref
+            - const: com_aux
+            - const: usb3_pipe
+            - const: cfg_ahb
+
+  - if:
+      not:
+        properties:
+          compatible:
+            contains:
+              enum:
+                - qcom,x1e80100-qmp-usb3-dp-phy
+                - qcom,sc7180-qmp-usb3-dp-phy
+                - qcom,sdm845-qmp-usb3-dp-phy
+    then:
       properties:
         clocks:
           maxItems: 4
         clock-names:
-          maxItems: 4
+          items:
+            - const: aux
+            - const: ref
+            - const: com_aux
+            - const: usb3_pipe
 
   - if:
       properties:
diff --git a/include/dt-bindings/phy/phy-qcom-qmp.h b/include/dt-bindings/phy/phy-qcom-qmp.h
index 6b43ea9e0051..1c3ce0c02b0c 100644
--- a/include/dt-bindings/phy/phy-qcom-qmp.h
+++ b/include/dt-bindings/phy/phy-qcom-qmp.h
@@ -16,6 +16,7 @@
 /* QMP USB4-USB3-DP PHYs */
 #define QMP_USB43DP_USB3_PHY		0
 #define QMP_USB43DP_DP_PHY		1
+#define QMP_USB43DP_USB4_PHY		2
 
 /* QMP PCIE PHYs */
 #define QMP_PCIE_PIPE_CLK		0

-- 
2.55.0

