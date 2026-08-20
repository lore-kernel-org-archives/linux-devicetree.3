Received: from smtp.kernel.org (aws-us-west-2-korg-mail-alma10-1.taild15c8.ts.net [100.103.45.18])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 3D29F47604E;
	Thu, 20 Aug 2026 14:24:26 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=100.103.45.18
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1787235867; cv=none; b=j3+NQUE2N+wEuGexUxdS0EUGpINO05PqdwULxXC1jFWDqvkqtYuGsULIiIIKQftJV16cUQaVyVTeBXQlBf1X39tPf60qbilDFspzSW433hZK1g4CGGJOlvGcoEREbOV7WSIBHJGPQ2AJ5ac6bNrr9fQBx2K9HRUnlELBCaOhIZE=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1787235867; c=relaxed/simple;
	bh=ZTbrFbcZbwqV6X0pAC6SDmsRQ5lbf4n5kQVqt++PbVg=;
	h=From:Date:Subject:MIME-Version:Content-Type:Message-Id:References:
	 In-Reply-To:To:Cc; b=KCRmVULOmCavRXmwOAJrG29BnO/k1WnocKtONnNGU+zMMh428b/SQ1sz7+0V68c8doAqtyyR3qZtorpsktv8zyJoqNBL2f7pf3pykywacGJ48slBKOCcCgfBN46Q/SDb8Ft1NDwLNXeZkriYZoOfYo1am8KaUUV+q5H53xVrdqU=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=BeUWX8ib; arc=none smtp.client-ip=100.103.45.18
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="BeUWX8ib"
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 26FE31F00A3A;
	Thu, 20 Aug 2026 14:24:20 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kernel.org;
	s=k20260515; t=1787235866;
	bh=HVvXYZHM/m8ynyTJN/l0O4HhP3zJLvT4O3YsJI9ghxE=;
	h=From:Date:Subject:References:In-Reply-To:To:Cc;
	b=BeUWX8ibcjfvJntX1PkNft4UHuedUCtn14pFPumgVgEGoPnbnDyfW9A2fSbjdqnBT
	 zBbDCJgPCWgKj2yl87Yp4XlAh6PqK1fWT85h62hM0KbGDDzS/ZiL/dx8pkM88xAJN2
	 3D3sC3IU4Ds2x8SzmrQgi9XHMdQDnNTShnE3SnBBdaWSzs4+ITzaX7trNXgC95FvdZ
	 6vCLoEV4IkE+eeyB7J9m9ZdA/JlGVxfIo8Gb/4WrjIDw9b05iIjvPnoDWAN6u49EYy
	 WqU1BE9uxhRmY1Vr8N1f0q7/bmVW6RumATJpBjzvQKE+usThq8OUJQfS2mGj174L2H
	 XgH0YfuZPhk0w==
From: Konrad Dybcio <konradybcio@kernel.org>
Date: Thu, 20 Aug 2026 16:24:10 +0200
Subject: [PATCH v4 1/5] dt-bindings: phy: qcom,qmp-usb3-dp: Extend X1E
 description for USB4
Precedence: bulk
X-Mailing-List: devicetree@vger.kernel.org
List-Id: <devicetree.vger.kernel.org>
List-Subscribe: <mailto:devicetree+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:devicetree+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20260820-topic-usb4phy-v4-1-aec9d2cb31f6@oss.qualcomm.com>
References: <20260820-topic-usb4phy-v4-0-aec9d2cb31f6@oss.qualcomm.com>
In-Reply-To: <20260820-topic-usb4phy-v4-0-aec9d2cb31f6@oss.qualcomm.com>
To: Vinod Koul <vkoul@kernel.org>, 
 Neil Armstrong <neil.armstrong@linaro.org>, Rob Herring <robh@kernel.org>, 
 Krzysztof Kozlowski <krzk+dt@kernel.org>, 
 Conor Dooley <conor+dt@kernel.org>, Bjorn Andersson <andersson@kernel.org>, 
 Konrad Dybcio <konradybcio@kernel.org>, 
 Manivannan Sadhasivam <mani@kernel.org>
Cc: linux-kernel@vger.kernel.org, linux-phy@lists.infradead.org, 
 linux-arm-msm@vger.kernel.org, devicetree@vger.kernel.org, 
 usb4-upstream@oss.qualcomm.com, 
 Raghavendra Thoorpu <rthoorpu@qti.qualcomm.com>, 
 Mika Westerberg <westeri@kernel.org>, Sven Peter <sven@kernel.org>, 
 Konrad Dybcio <konrad.dybcio@oss.qualcomm.com>, 
 Krzysztof Kozlowski <krzysztof.kozlowski@oss.qualcomm.com>, 
 Manivannan Sadhasivam <manivannan.sadhasivam@oss.qualcomm.com>
X-Mailer: b4 0.15.2
X-Developer-Signature: v=1; a=ed25519-sha256; t=1787235854; l=3476;
 i=konrad.dybcio@oss.qualcomm.com; s=20230215; h=from:subject:message-id;
 bh=/ttJwCXk6D832t5qMZlO9Nw3aJA1EFXBUMTLzeBgQc0=;
 b=ZxAyY4eqifQUiquu96ryKRHe6PF5n7FmRCtipNq6uuro2qw6rTUeYPh+oEtAOEbO/hYr8gNa+
 3eXYD1nKtYEBH9VHyRyRpVQxdAa7U1S/AwDTh17FrkPceHgASuzSf5i
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
Acked-by: Manivannan Sadhasivam <manivannan.sadhasivam@oss.qualcomm.com>
Signed-off-by: Konrad Dybcio <konrad.dybcio@oss.qualcomm.com>
---
 .../phy/qcom,sc8280xp-qmp-usb43dp-phy.yaml         | 55 +++++++++++++++++-----
 include/dt-bindings/phy/phy-qcom-qmp.h             |  1 +
 2 files changed, 45 insertions(+), 11 deletions(-)

diff --git a/Documentation/devicetree/bindings/phy/qcom,sc8280xp-qmp-usb43dp-phy.yaml b/Documentation/devicetree/bindings/phy/qcom,sc8280xp-qmp-usb43dp-phy.yaml
index 8adfc78108fe..94a4fbff428f 100644
--- a/Documentation/devicetree/bindings/phy/qcom,sc8280xp-qmp-usb43dp-phy.yaml
+++ b/Documentation/devicetree/bindings/phy/qcom,sc8280xp-qmp-usb43dp-phy.yaml
@@ -53,12 +53,7 @@ properties:
 
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
@@ -189,21 +184,59 @@ allOf:
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

