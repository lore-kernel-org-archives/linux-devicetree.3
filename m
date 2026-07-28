Received: from smtp.kernel.org (aws-us-west-2-korg-mail-alma10-1.taild15c8.ts.net [100.103.45.18])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 32FF841A554;
	Tue, 28 Jul 2026 10:10:30 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=100.103.45.18
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1785233432; cv=none; b=LPRq1WbH+hevUZD0m2fxnxkm3VKeVTie7NMpPxT0VN94npEZfZlJZq+LW1c7aKcCpUPUEs5OZctC8y19nSjBmalZ8MGWy8HmuhoSF0TmMgnXEWsUjlgOLRwpYcm7x8zjGCpARSdvw3tsLUZ+Pk1xzJvCmOPNlxF+RjJSq5Gijvc=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1785233432; c=relaxed/simple;
	bh=OE/PUyCIR8A8c/O/iToRnf1oPR6csrVcIOUwrSXbqJQ=;
	h=From:Date:Subject:MIME-Version:Content-Type:Message-Id:References:
	 In-Reply-To:To:Cc; b=nAMp9/tWmxanJZQGUm5eULfJs54XQH6A/shHu4v4cXjZjsoHBscuFKXvgFmAhzbJxK1TAEME2nt8Qry+YCr2OCfzIMpLGJHFliLCw+VB0Fkhs6U4KDBAqEO+58Q+Nd00CnFZ0MByp4L9MX1txbX4ch+fHbSwUYqEA7CjU7h/rF4=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=NqOPIrSr; arc=none smtp.client-ip=100.103.45.18
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="NqOPIrSr"
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 67AA71F00A3A;
	Tue, 28 Jul 2026 10:10:26 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kernel.org;
	s=k20260515; t=1785233430;
	bh=dIfKfIec2FGyunm/+Tus+IvAl0rnNUfIxPefz6BsbXY=;
	h=From:Date:Subject:References:In-Reply-To:To:Cc;
	b=NqOPIrSr2+Occ4XhQr1KZ0XuBly1TE2GhzBy/+cWvDRh7NYwFgr8neXajzO1N5Sq2
	 aBKywUx6W4poGFUi7ictguc+7IYopS7rjV2A055ZZpWxrvHTD1IwtMb09cLWpnwYtk
	 OuxFXaKhqVecqZ4WSCeQ74lPOVhQCi7Kaz4gdgmSQRTHoZdQdKr0KWEPZ8CEvlPToa
	 y/Tnxjl9/UgU/ecqZRXPNWHh4A7RyD6nkLAIfMYCNUxZPpCeX6Wj4zOvFFl7ciBv8E
	 rUbWKWKyJvSbnakn96HFNCtC+4EIbtCf9ZBaLo2GKaXHhT6JJnYCV2vwgvaIg9j11n
	 wE7Rf0ffqQJUQ==
From: Konrad Dybcio <konradybcio@kernel.org>
Date: Tue, 28 Jul 2026 12:10:12 +0200
Subject: [PATCH v2 1/5] dt-bindings: phy: qcom,qmp-usb3-dp: Extend X1E
 description for USB4
Precedence: bulk
X-Mailing-List: devicetree@vger.kernel.org
List-Id: <devicetree.vger.kernel.org>
List-Subscribe: <mailto:devicetree+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:devicetree+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20260728-topic-usb4phy-v2-1-5d9dd5149ec7@oss.qualcomm.com>
References: <20260728-topic-usb4phy-v2-0-5d9dd5149ec7@oss.qualcomm.com>
In-Reply-To: <20260728-topic-usb4phy-v2-0-5d9dd5149ec7@oss.qualcomm.com>
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
 Konrad Dybcio <konrad.dybcio@oss.qualcomm.com>
X-Mailer: b4 0.15.2
X-Developer-Signature: v=1; a=ed25519-sha256; t=1785233420; l=3334;
 i=konrad.dybcio@oss.qualcomm.com; s=20230215; h=from:subject:message-id;
 bh=XfP7xVdYmEavZgvB7n2IjdAMBM/4sWrCIVDpXN+ojc8=;
 b=3/hQ+Ov7/Y9sKkI/61WAhAUy1JYmU7q0ruqkaxf3IM12+YJY4bOQs1Ve32ZyIMFcuJ4Cxq0uq
 gfZV2MMFbV6AEtTHleyOO684RqiSSnIJiXDf9v5KOWEf1CtuhfU1VhM
X-Developer-Key: i=konrad.dybcio@oss.qualcomm.com; a=ed25519;
 pk=iclgkYvtl2w05SSXO5EjjSYlhFKsJ+5OSZBjOkQuEms=

From: Konrad Dybcio <konrad.dybcio@oss.qualcomm.com>

Some instances of the QMP combo PHY (called USB43DP) feature a third
functional sub-block, responsible for USB4/Thunderbolt 3 communication.

Compared to the today's state of the binding, one more clock (P2RR2P -
PHY-to-Router, Router-to-PHY) needs to be enabled for the PHY to be
able to switch to USB4 mode. Allow that for X1E.

Also, add a bindings define to let consumers access it.

Assisted-by: Claude Code:Sonnet 5
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

