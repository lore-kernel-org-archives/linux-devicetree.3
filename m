Received: from smtp.kernel.org (aws-us-west-2-korg-mail-alma10-1.taild15c8.ts.net [100.103.45.18])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 0C8E94534B9;
	Wed,  8 Jul 2026 12:55:42 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=100.103.45.18
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1783515344; cv=none; b=YqR8O+wqk0i1SqVzBX5iWiXzk53pUvU2W2KCOndv4aEuTjQmKAHTDy32BXhMwb3bjuTx1Pkmy7APs83NZDXzUDnacoFpspOyk/Z8nYJ6HrtXqDtMMII2H2tzl5FUAXCSIEoBxZeNLK1SXJfiQojYoY3Jhhq267C2+LmCWLes+kc=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1783515344; c=relaxed/simple;
	bh=fN5aycUQykgWSTS+TqAg3jSNaE01sgPMnS4TYIJg8qI=;
	h=From:Date:Subject:MIME-Version:Content-Type:Message-Id:References:
	 In-Reply-To:To:Cc; b=STilABaNREeW2vibZbTVka3DubpVP7KO37q5SxhVNU12CC2nCWiH0GGi75d0fQov+X3BMIBUR6P5Zu9dLzHM5BhBirV7oPAUphCwmySuPPvKjS1gLRi0G4w8keLAHhcOhhy53dBUQLzmAN+xW7nY53KFqDx2pagvehG/g/yX+Bk=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=C7kB4xTO; arc=none smtp.client-ip=100.103.45.18
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="C7kB4xTO"
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 1CD271F00A3A;
	Wed,  8 Jul 2026 12:55:41 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kernel.org;
	s=k20260515; t=1783515342;
	bh=QEp95vvRU23pksx3TFahHAXyVzDUq9Jp+fK8iJa9dqc=;
	h=From:Date:Subject:References:In-Reply-To:To:Cc;
	b=C7kB4xTOV0Wc7kET6sefFih2NpwE8bI/SXkZtreKVbCNFt73ifVfwQbSVxsjDsZWx
	 4LtdUdQ8qROo+5RLk6WkTqcm+jtVovzxYYYbiH7YnanLeFkqOUaRDHdv0AcxAuwWnx
	 AdGu6Up3Y9Uakel9v/4gf8BB/KXD7khfWSa4MHG09QsosbslkYWx4JwdFwMiJOoYvz
	 bzlzQWlF/EUq2dwB4ePA0tkpeI6+6LZKgEYFFZwlcbS0JzJuzRnB26jom/9uW2XNMp
	 Z76Tz96BxD8KHTqDAGYSADvII/Tqn9duSjdLnsnUu1L5UqZ0w4ZWxxkGuJbuZx50Yd
	 2PUY0CESLctHg==
From: Mattijs Korpershoek <mkorpershoek@kernel.org>
Date: Wed, 08 Jul 2026 14:54:20 +0200
Subject: [PATCH 1/2] dt-bindings: phy: qcom,sc8280xp-qmp-usb3-uni: Add
 SA8255P USB PHY
Precedence: bulk
X-Mailing-List: devicetree@vger.kernel.org
List-Id: <devicetree.vger.kernel.org>
List-Subscribe: <mailto:devicetree+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:devicetree+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20260708-phy-qcom-qmp-usb-8255-v1-1-8d852a9535db@kernel.org>
References: <20260708-phy-qcom-qmp-usb-8255-v1-0-8d852a9535db@kernel.org>
In-Reply-To: <20260708-phy-qcom-qmp-usb-8255-v1-0-8d852a9535db@kernel.org>
To: Vinod Koul <vkoul@kernel.org>, 
 Neil Armstrong <neil.armstrong@linaro.org>, Rob Herring <robh@kernel.org>, 
 Krzysztof Kozlowski <krzk+dt@kernel.org>, 
 Conor Dooley <conor+dt@kernel.org>
Cc: Maxime Ripard <mripard@kernel.org>, linux-arm-msm@vger.kernel.org, 
 linux-phy@lists.infradead.org, devicetree@vger.kernel.org, 
 linux-kernel@vger.kernel.org, Mattijs Korpershoek <mkorpershoek@kernel.org>
X-Mailer: b4 0.16-dev
X-Developer-Signature: v=1; a=openpgp-sha256; l=4497;
 i=mkorpershoek@kernel.org; h=from:subject:message-id;
 bh=fN5aycUQykgWSTS+TqAg3jSNaE01sgPMnS4TYIJg8qI=;
 b=owEBbQGS/pANAwAKARkNHbRmThk1AcsmYgBqTkjIT1RPeEqzZvAh1TgHlprQ46Q+Yv6e1tdtL
 FWf63WO3amJATMEAAEKAB0WIQQu6UKnth9qvlMTrQAZDR20Zk4ZNQUCak5IyAAKCRAZDR20Zk4Z
 NR6WB/4s7rx0c6cFdXyBlnvc6Rw//yYSXf/Q2lD2xP3pi1tafA7wNVCj3T+12jMb7qSicdcEWgT
 G7O/rxtoUFbo6R77FJNiASPRXVI73b+kuItz/eWdDCoH3T6KSn4OMEjd0qBZlb6+0GeLtEkGXau
 +KSIossuMDgMXDSI8YTXZREhaofBn/KztUYmy/IeyonKSbMETJmnTyx5n6qhXemI2OdcuOb3moS
 Xv0riHM81opGgMY/LN2VF8jGObPSc/bpaGrH8qcUFV058m0E77i0EeYSTWLwjHKLJlke0oJRGoB
 bAnzV4Q+iz/QrtSO9NtY2SkiTxcxMntby/qt4VDPQSQwwbk+
X-Developer-Key: i=mkorpershoek@kernel.org; a=openpgp;
 fpr=8234A35B45C0D26B31C1A2DA570338B018144F28

SA8255p platform abstracts resources such as clocks, interconnect and
GPIO pins configuration in Firmware. SCMI power protocol is used to
request resource configurations.

Two power domains can be requested: usb_transfer and usb_core.
usb_transfer controls clocks and interconnects and usb_core controls
the GDSC, resets and TLMM (GPIOs)

Add compatible string for Qualcomm QMP Super Speed (SS) UNI PHY found
in SA8255P.
Add conditionals to make some properties (clocks, resets, supplies)
optional for SA8255P while keeping them required for all other platforms.
Finally, also add a new example to illustrate a firmware-managed node.

Signed-off-by: Mattijs Korpershoek <mkorpershoek@kernel.org>
---
 .../phy/qcom,sc8280xp-qmp-usb3-uni-phy.yaml        | 92 +++++++++++++++++++---
 1 file changed, 83 insertions(+), 9 deletions(-)

diff --git a/Documentation/devicetree/bindings/phy/qcom,sc8280xp-qmp-usb3-uni-phy.yaml b/Documentation/devicetree/bindings/phy/qcom,sc8280xp-qmp-usb3-uni-phy.yaml
index 01342823e57f..80b04b7f7584 100644
--- a/Documentation/devicetree/bindings/phy/qcom,sc8280xp-qmp-usb3-uni-phy.yaml
+++ b/Documentation/devicetree/bindings/phy/qcom,sc8280xp-qmp-usb3-uni-phy.yaml
@@ -26,6 +26,7 @@ properties:
               - qcom,msm8996-qmp-usb3-phy
               - qcom,qcs8300-qmp-usb3-uni-phy
               - qcom,qdu1000-qmp-usb3-uni-phy
+              - qcom,sa8255p-qmp-usb3-uni-phy
               - qcom,sa8775p-qmp-usb3-uni-phy
               - qcom,sc8180x-qmp-usb3-uni-phy
               - qcom,sc8280xp-qmp-usb3-uni-phy
@@ -54,7 +55,13 @@ properties:
     maxItems: 5
 
   power-domains:
-    maxItems: 1
+    minItems: 1
+    maxItems: 2
+
+  power-domain-names:
+    items:
+      - const: usb_transfer
+      - const: usb_core
 
   resets:
     maxItems: 2
@@ -82,14 +89,6 @@ properties:
 required:
   - compatible
   - reg
-  - clocks
-  - clock-names
-  - resets
-  - reset-names
-  - vdda-phy-supply
-  - vdda-pll-supply
-  - "#clock-cells"
-  - clock-output-names
   - "#phy-cells"
 
 allOf:
@@ -188,6 +187,66 @@ allOf:
       properties:
         refgen-supply: false
 
+  - if:
+      properties:
+        compatible:
+          contains:
+            enum:
+              - qcom,glymur-qmp-usb3-uni-phy
+              - qcom,ipq5424-qmp-usb3-phy
+              - qcom,ipq6018-qmp-usb3-phy
+              - qcom,ipq8074-qmp-usb3-phy
+              - qcom,ipq9574-qmp-usb3-phy
+              - qcom,msm8996-qmp-usb3-phy
+              - qcom,qcs8300-qmp-usb3-uni-phy
+              - qcom,qdu1000-qmp-usb3-uni-phy
+              - qcom,sa8775p-qmp-usb3-uni-phy
+              - qcom,sc8180x-qmp-usb3-uni-phy
+              - qcom,sc8280xp-qmp-usb3-uni-phy
+              - qcom,sdm845-qmp-usb3-uni-phy
+              - qcom,sdx55-qmp-usb3-uni-phy
+              - qcom,sdx65-qmp-usb3-uni-phy
+              - qcom,sdx75-qmp-usb3-uni-phy
+              - qcom,sm8150-qmp-usb3-uni-phy
+              - qcom,sm8250-qmp-usb3-uni-phy
+              - qcom,sm8350-qmp-usb3-uni-phy
+              - qcom,x1e80100-qmp-usb3-uni-phy
+    then:
+      properties:
+        power-domains:
+          maxItems: 1
+      required:
+        - clocks
+        - clock-names
+        - resets
+        - reset-names
+        - vdda-phy-supply
+        - vdda-pll-supply
+        - "#clock-cells"
+        - clock-output-names
+
+  - if:
+      properties:
+        compatible:
+          contains:
+            enum:
+              - qcom,sa8255p-qmp-usb3-uni-phy
+    then:
+      properties:
+        clocks: false
+        clock-names: false
+        resets: false
+        reset-names: false
+        vdda-phy-supply: false
+        vdda-pll-supply: false
+        "#clock-cells": false
+        clock-output-names: false
+        power-domains:
+          minItems: 2
+      required:
+        - power-domains
+        - power-domain-names
+
 additionalProperties: false
 
 examples:
@@ -219,3 +278,18 @@ examples:
 
       #phy-cells = <0>;
     };
+
+  - |
+    soc {
+      #address-cells = <2>;
+      #size-cells = <2>;
+
+      phy@88e8000 {
+        compatible = "qcom,sa8255p-qmp-usb3-uni-phy";
+        reg = <0x0 0x088e8000 0x0 0x2000>;
+        #phy-cells = <0>;
+
+        power-domains = <&scmi12_pd 2>, <&scmi12_pd 3>;
+        power-domain-names = "usb_transfer", "usb_core";
+      };
+    };

-- 
2.54.0

