Received: from mail-wr1-f46.google.com (mail-wr1-f46.google.com [209.85.221.46])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 7AC32370D79
	for <devicetree@vger.kernel.org>; Thu, 26 Mar 2026 01:28:05 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.221.46
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1774488488; cv=none; b=W03VRXgbhdnX08tYm7PZQv9PFbgoKrVu459EyT+lOVHtRFVJhostJWmKnPXeVqUXkiQpRYAvu6RA21HK51J6RF7kzqUuInl1MUw2upDa7HDsNkoenTB2N9RGf/bzWBTNct8ZflUjaBIKUqlyXfnvWaBC1X+++4ymMeaSkV1TsVY=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1774488488; c=relaxed/simple;
	bh=/dbNXyt6doYGJOLfnqyVmZ3WMw1uSylWcEyQ9zySLt4=;
	h=From:Date:Subject:MIME-Version:Content-Type:Message-Id:References:
	 In-Reply-To:To:Cc; b=ocoXxYfkCTlB7Dup4JpkpO4eCtnP0Wcq+oeA7oSoYXhLdAzfVj7yul+4wfdnPuk0WXdFg4w1mHdZMQW7SdU4GpwyM2OVEobD8LYCONgb+dle6A5Fu+VJ/OkKkA798jHXjqNn7+ovb0k5vuMmNbAOBLZe6+nzJ2BvMwPL5dj7dAw=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org; spf=pass smtp.mailfrom=linaro.org; dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b=HmtQwonD; arc=none smtp.client-ip=209.85.221.46
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=linaro.org
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b="HmtQwonD"
Received: by mail-wr1-f46.google.com with SMTP id ffacd0b85a97d-43b88b7ca76so286649f8f.3
        for <devicetree@vger.kernel.org>; Wed, 25 Mar 2026 18:28:05 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1774488484; x=1775093284; darn=vger.kernel.org;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :mime-version:subject:date:from:from:to:cc:subject:date:message-id
         :reply-to;
        bh=G3LoPG/gWfFkYY5+0Z7Xp53uSm1t2TgaG5wGY3fLPnI=;
        b=HmtQwonDcRT5IkVXOn98RpHTgmUXDrFGKxk4LP95N6QwvEiWbRrhfr/xMT9Vbcad7n
         1JaWC5S+bc2b8she83L/C6tITjuxi/gOfiT5ztboajKtJ8WKAy9TnB8r89vK8HsAPAo/
         sQRJEq57W8DWQQ0IBAD+3JuxdyazM1PP+FK6XAJS4XQb3KTH0K0RBTp13KVtBnt4jdds
         3nETor7pB+aVvqUiXSxyM9zTjccQ7L1/uG3NshOFSprdjouQWYdHGkIWvXXpZ/B9U+S7
         BZ0dFunC8WNDFiA+bowPjs/QnLPGZkmUEO5a2I5gxwJ0N8gON0fGLOeEP+ZDVLVRe1mT
         fkww==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1774488484; x=1775093284;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :mime-version:subject:date:from:x-gm-gg:x-gm-message-state:from:to
         :cc:subject:date:message-id:reply-to;
        bh=G3LoPG/gWfFkYY5+0Z7Xp53uSm1t2TgaG5wGY3fLPnI=;
        b=Pkf1raTJ8kiF3ZGSEPB6lA33rHZSkriA4IMWgWIdggoNAHHC62wCKLv5TtaEljKkiS
         LwNxZLQ4WomB4xPSzYYxq82bVgwpSb1r7xSHO40c+w0I9vKicxJnOtd//5AB9qJBL/NY
         jNUgWB7VS2pNfP5qaoVNzkFIL6a236rC3C5RPrsE6u93Z9VdsCVkore/K5e63+XZNsOJ
         tRte7SVoeSfNUcYCEd0/hi1VSPvlI1HlK6O9VwwmWjAPpKiFNbuT450jgbBpEumyZDTy
         Geekn4JY5iznS9Kyow7qwPyyA5BeXbJ2mP3g50oLgftrURZQorNIbv6SbMGoo0G9/+Vz
         Cx/Q==
X-Forwarded-Encrypted: i=1; AJvYcCV+rXnhrJfMWs0KiZiy/Il8QFsfY38ZgG7KzJeDAsIkpjaU2NL2/HShp6xR+RaU6EDMfYpcVjL4fTyM@vger.kernel.org
X-Gm-Message-State: AOJu0YxlrNO/HTEVJLXMZvMT4b5QC7Sa/OkyQl8zESz1j/s8staTDXZ5
	1htPvos4lIAI4HYe9v9XbkVacjWQfrEwOPrTwRFrLu/tY2yzpjQVYbFX+1PCBjHAi4c=
X-Gm-Gg: ATEYQzzi8SGdb1WbrUINgWPSRaJXIroHV5qpuLzHt7GoSSgrKU9dYrPgHoXzScJ5umz
	lUbwuSAxIsP58y18betCTdfVNXMttd200cKNACby8qcWBt4mpddeTwTZBL5Cw48V1dlyybMSxls
	cpObWVNkyQxL4AlbGd6RX4M9v4cptoqzJIXjh1OHBkVxFntNj5pKrT4Wg53R8QU01Bbk1U3r0tk
	zHP54uSinFBlx917oc0k1B6CPT104jp/axdOF9PeTLjxZO8/KR+EZnzBQoRSYQpMQccq/Vz02OJ
	Hg4SHatMTqkltV7LhIaHMJhrEJ3eXg6CoQ+9sJZyLyeewPPaCbdVpSdPllQ1SOh4koUye0SVvCG
	gY4G5OQ4Z6OVKBEJq7eLpkvJy5x6EqfuaazKJACo5G8swCP+vb9U29p/9IVuE+RfLDcE/LpB84D
	AlrVS48ZwG1L/nF1zRXC26XekY0U7yEGW+LOo=
X-Received: by 2002:a05:6000:2882:b0:43a:3cc:83da with SMTP id ffacd0b85a97d-43b889861fcmr8032628f8f.18.1774488483793;
        Wed, 25 Mar 2026 18:28:03 -0700 (PDT)
Received: from [192.168.0.35] ([109.76.163.154])
        by smtp.gmail.com with ESMTPSA id ffacd0b85a97d-43b919cf1c4sm3918051f8f.23.2026.03.25.18.28.02
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 25 Mar 2026 18:28:03 -0700 (PDT)
From: Bryan O'Donoghue <bryan.odonoghue@linaro.org>
Date: Thu, 26 Mar 2026 01:28:29 +0000
Subject: [PATCH v11 1/7] dt-bindings: media: qcom,x1e80100-camss: Add
 optional PHY handle definitions
Precedence: bulk
X-Mailing-List: devicetree@vger.kernel.org
List-Id: <devicetree.vger.kernel.org>
List-Subscribe: <mailto:devicetree+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:devicetree+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20260326-b4-linux-next-25-03-13-dtsi-x1e80100-camss-v11-1-5b93415be6dd@linaro.org>
References: <20260326-b4-linux-next-25-03-13-dtsi-x1e80100-camss-v11-0-5b93415be6dd@linaro.org>
In-Reply-To: <20260326-b4-linux-next-25-03-13-dtsi-x1e80100-camss-v11-0-5b93415be6dd@linaro.org>
To: Bjorn Andersson <andersson@kernel.org>, 
 Michael Turquette <mturquette@baylibre.com>, 
 Stephen Boyd <sboyd@kernel.org>, Rob Herring <robh@kernel.org>, 
 Krzysztof Kozlowski <krzk+dt@kernel.org>, 
 Conor Dooley <conor+dt@kernel.org>, Robert Foss <rfoss@kernel.org>, 
 Todor Tomov <todor.too@gmail.com>, 
 Mauro Carvalho Chehab <mchehab@kernel.org>, 
 Konrad Dybcio <konradybcio@kernel.org>, 
 Vladimir Zapolskiy <vladimir.zapolskiy@linaro.org>, 
 Bryan O'Donoghue <bod@kernel.org>
Cc: linux-arm-msm@vger.kernel.org, linux-clk@vger.kernel.org, 
 devicetree@vger.kernel.org, linux-kernel@vger.kernel.org, 
 linux-media@vger.kernel.org, Bryan O'Donoghue <bryan.odonoghue@linaro.org>, 
 Krzysztof Kozlowski <krzk@kernel.org>
X-Mailer: b4 0.14.3
X-Developer-Signature: v=1; a=openpgp-sha256; l=2635;
 i=bryan.odonoghue@linaro.org; h=from:subject:message-id;
 bh=/dbNXyt6doYGJOLfnqyVmZ3WMw1uSylWcEyQ9zySLt4=;
 b=owEBbQKS/ZANAwAKASJxO7Ohjcg6AcsmYgBpxIu/E36D4vvcqA2r0xt7mHFNp2+uAaUCJvARw
 S6WEVpJLsqJAjMEAAEKAB0WIQTmk/sqq6Nt4Rerb7QicTuzoY3IOgUCacSLvwAKCRAicTuzoY3I
 OqaqD/9f/Uqry3eIKvFBSjWgbIeaiP/Z1VN9oQEbcwq0w1Fl4FCM6wJVX2NLLqVvGvJbGA/OE9l
 EbqOyqrmSt/7cT/t3V3QDXyd0uzErGE/0gdQ6CVVUl4PFbyUoGKz4CEvbFkIOx+HtK8JvQ9OMEY
 waMWldOi0VnLRElAVOlZXZCNlSsbacIQdLixY21ELR7Cd5W9ZIjD+1wLqK+1UNqltcx3HzG/OCM
 YwzQHgFtpL+0993o/MISoHXjbSWIJi/wKEMZC+/yKHIjtUr7aXXLDAxoxnV59oHkxk/fZfBJ0nP
 uV3yQvRDmVTJYcIh5gon5pho6ATQC+M+zP8+yyBrEFY8JpUlyEBaoMRIvwf5d+LeWJogeB3hBm+
 He31GKV5rpRJa9CHDhSkgZm/C0sin9U9wRgilwlt2SPcd3sctpSzxeIwgFVqcu/K4ckAn9axwza
 2E9lkgcKwG2akop26RR3bFja/m4Jy05iGzpBn7kK51W57TD1eXXtdeTykA0ZKdfLDDOT1anZscY
 hMC5eqzzw7st9MBgpPjat+0xUt/cRKLLdr6ctFXPpjsr5D5czBd7/S9cKi4+nnmYS8CAvh3wj/8
 IlNDcpN8oVdWDYFgrp3yIU1HRi9wC0B4tjK1Jt2hS2uL6D1EVTKIRJaoixm26lWGEYWMcq1YJJ7
 Ddr0cvSF/fZtu+A==
X-Developer-Key: i=bryan.odonoghue@linaro.org; a=openpgp;
 fpr=E693FB2AABA36DE117AB6FB422713BB3A18DC83A

Add optional PHY handle definitions. This will allow for supporting both
legacy PHY definitions as well as supporting the optional new handle based
approach.

Drop the legacy high-level 0p8 and 1p2 supplies as required, each PHY has
its own individual rails. The old binding is still valid but with
individual nodes we define the rails in the CSIPHY sub-nodes.

Signed-off-by: Bryan O'Donoghue <bryan.odonoghue@linaro.org>
---
 .../bindings/media/qcom,x1e80100-camss.yaml        | 33 ++++++++++++++++++++--
 1 file changed, 31 insertions(+), 2 deletions(-)

diff --git a/Documentation/devicetree/bindings/media/qcom,x1e80100-camss.yaml b/Documentation/devicetree/bindings/media/qcom,x1e80100-camss.yaml
index 2d1662ef522b7..c17b9757b2c86 100644
--- a/Documentation/devicetree/bindings/media/qcom,x1e80100-camss.yaml
+++ b/Documentation/devicetree/bindings/media/qcom,x1e80100-camss.yaml
@@ -39,6 +39,14 @@ properties:
       - const: vfe_lite0
       - const: vfe_lite1
 
+  '#address-cells':
+    const: 2
+
+  '#size-cells':
+    const: 2
+
+  ranges: true
+
   clocks:
     maxItems: 29
 
@@ -126,6 +134,16 @@ properties:
     description:
       1.2V supply to a PHY.
 
+  phys:
+    maxItems: 4
+
+  phy-names:
+    items:
+      - const: csiphy0
+      - const: csiphy1
+      - const: csiphy2
+      - const: csiphy4
+
   ports:
     $ref: /schemas/graph.yaml#/properties/ports
 
@@ -158,6 +176,14 @@ properties:
             required:
               - data-lanes
 
+patternProperties:
+  "^phy@[0-9a-f]+$":
+    $ref: /schemas/phy/qcom,x1e80100-csi2-phy.yaml
+    unevaluatedProperties: false
+
+  "^opp-table(-.*)?$":
+    type: object
+
 required:
   - compatible
   - reg
@@ -171,8 +197,6 @@ required:
   - iommus
   - power-domains
   - power-domain-names
-  - vdd-csiphy-0p8-supply
-  - vdd-csiphy-1p2-supply
   - ports
 
 additionalProperties: false
@@ -184,6 +208,7 @@ examples:
     #include <dt-bindings/clock/qcom,x1e80100-camcc.h>
     #include <dt-bindings/interconnect/qcom,icc.h>
     #include <dt-bindings/interconnect/qcom,x1e80100-rpmh.h>
+    #include <dt-bindings/phy/phy.h>
     #include <dt-bindings/power/qcom-rpmpd.h>
 
     soc {
@@ -229,6 +254,10 @@ examples:
                         "vfe_lite0",
                         "vfe_lite1";
 
+            #address-cells = <2>;
+            #size-cells = <2>;
+            ranges;
+
             clocks = <&camcc CAM_CC_CAMNOC_AXI_NRT_CLK>,
                      <&camcc CAM_CC_CAMNOC_AXI_RT_CLK>,
                      <&camcc CAM_CC_CORE_AHB_CLK>,

-- 
2.52.0

