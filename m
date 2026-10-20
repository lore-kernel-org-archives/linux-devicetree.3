Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=91.218.175.3
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1792513299;
	b=HXDfVy6d7kodlEaU98H+f5CGe3luszRl6y1zTpbGc/mgzU2ABzSagYYnVf5fJXOqjAom
	 SnZvNXoEBE+KODgx9/lDhTOoaAui6vlUN20mb0Bf8L6QT/BHBK3E7oYWpJsVIv7jHc3iQ
	 ddwmDUdo8Dn0SH2Ep68lGYgrM+Wqsbs2pcFpXYCU7lLylySCVgakKzukFPWPnmIl+ppko
	 fR/ITBFs6KgvHm6Iomf3jeWG6yj/uohMD7H0/CPXiv0FCiYPGdybBtlGASE5S6PfaFcfy
	 JwIUpJThXZs4bwzC3icr7Bl9kPIw5fzu737VZjKkR2JzQlrrleNGpQvgOAyUNodjlWw==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1792513299;
	h=DMARC-Filter:X-Envelope-To:DKIM-Signature:X-Envelope-To:Received:
	 X-Mizu-Trace-ID:X-Migadu-Flow:From:To:Cc:Subject:Date:Message-ID:
	 X-Mailer:In-Reply-To:References:MIME-Version:
	 Content-Transfer-Encoding;
	bh=2aKFnBqY+ZOSc2qg+3ps+Ris0ORSO71jh1jEIP3HX84=;
	b=d7MM17Mf4zdRIUYXqUtAP5Blv5f6mekNDNCC8e40N89jBEY2Ym0GX7q15MSl4mrZZ+Qk
	 EbdS76sL3jPgHP3viNxQoSuS7iDx5B2ACGGHZg1v32trCjwMrb/hWK8y9+eJzsbSzsctV
	 OTtUJ2GPM1K55DIedZ33rxK2D6wVU21QN/3QnxRd3q/Vg/8MosjQJ+ZI+mJ/rxQMffk3u
	 kSxA2/9mRCfPukNi9dVIdgu8pUajd3ayNo2+ZoNkjsj8cU0GcrS7viIZq1b28H2p3N4N+
	 FQ3dnzrzV2DF3gJgAfj/MSqKOKkd/nhOB2bEe0kOEZVQu137gxSyBawP2oxEVr88fyA==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=packett.cool;
	spf=pass smtp.mailfrom=packett.cool;
	dkim=pass header.d=packett.cool header.i=@packett.cool header.a=rsa-sha256 header.s=key1 header.b=CamxvQrt;
	arc=none smtp.remote-ip=91.218.175.3
Received: from mta0.migadu.com (out-3.mta0.migadu.com [91.218.175.3])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 54458606A32F
	for <devicetree@vger.kernel.org>; Tue, 20 Oct 2026 16:21:38 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org 54458606A32F
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=packett.cool
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=packett.cool
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key, unprotected) header.d=packett.cool header.i=@packett.cool header.a=rsa-sha256 header.s=key1 header.b=CamxvQrt
X-Envelope-To: devicetree@vger.kernel.org
DKIM-Signature: a=rsa-sha256; bh=j16WdnSx3DNDWkxVUpc7etCn7NUgxL1/ifcQaa0wdeU=;
 c=simple/simple; d=packett.cool;
 h=from:to:subject:date:message-id:mime-version:content-type; s=key1;
 t=1792513296; v=1; x=1793118096;
 b=CamxvQrtSdpdGwGuwW/GaYEsC5yhqMhYcrj7dDRobknnPPAlDDrHVpUBqPSm828w7jTwUFPs
 5yHWAWSpe5QhUs72vR0CQetjZkrfKQ0i9qn4HwELJKWMan6jz63RqttBXZM/suLo4BdbpxSxPni
 1bWHn7MfBAq21oQJiNbhsOxtextArNPTJbfWhChUGOHZUKssUsYkGnnVQMzOOOoqQeFjyjIoLfy
 OuVpZGncNfHUREh5ernS+2JQKILkTlBRt4HXF7vA/UIe5R79Ao8ES4CHZ9Oxpu1y59b0oyPWZDX
 QZ7smUdb6jL7c/oL8Ltjx7DOMZe7qfLd6My9vtZkZKBVA==
X-Envelope-To: devicetree@vger.kernel.org
Received: by smtp.migadu.com with ESMTPS id 35bc12ad2e011340;
	Tue, 20 Oct 2026 16:21:36 +0000
X-Mizu-Trace-ID: 35bc12ad2e011340
X-Migadu-Flow: FLOW_OUT
From: Val Packett <val@packett.cool>
To: Greg Kroah-Hartman <gregkh@linuxfoundation.org>,
	Rob Herring <robh@kernel.org>,
	Krzysztof Kozlowski <krzk+dt@kernel.org>,
	Conor Dooley <conor+dt@kernel.org>,
	Bjorn Andersson <andersson@kernel.org>
Cc: Val Packett <val@packett.cool>,
	Heikki Krogerus <heikki.krogerus@linux.intel.com>,
	Neil Armstrong <neil.armstrong@linaro.org>,
	Luca Weiss <luca.weiss@fairphone.com>,
	~postmarketos/upstreaming@lists.sr.ht,
	phone-devel@vger.kernel.org,
	linux-usb@vger.kernel.org,
	linux-kernel@vger.kernel.org,
	devicetree@vger.kernel.org
Subject: [PATCH v3 1/2] dt-bindings: usb: fsa4480: Add an optional audio port/endpoint
Date: Tue, 20 Oct 2026 13:20:30 -0300
Message-ID: <20261020162101.1527014-2-val@packett.cool>
X-Mailer: git-send-email 2.55.0
In-Reply-To: <20261020162101.1527014-1-val@packett.cool>
References: <20261020162101.1527014-1-val@packett.cool>
X-Mailing-List: devicetree@vger.kernel.org
List-Id: <devicetree.vger.kernel.org>
List-Post: <mailto:devicetree@vger.kernel.org>
List-Help: <mailto:devicetree+help@vger.kernel.org>
List-Subscribe: <mailto:devicetree+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:devicetree+unsubscribe@vger.kernel.org>
List-Owner: <mailto:devicetree+owner@vger.kernel.org>
Precedence: list
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

The fsa4480 mux is physically connected not only to a Type-C port
controller, but also to an audio codec which has to be notified when
an analog audio accessory has been plugged in.

Describe a second port intended for the codec. Keep it optional to make
sure existing device trees do still validate.

Signed-off-by: Val Packett <val@packett.cool>
---
 .../devicetree/bindings/usb/fcs,fsa4480.yaml  | 94 +++++++++++++------
 1 file changed, 66 insertions(+), 28 deletions(-)

diff --git a/Documentation/devicetree/bindings/usb/fcs,fsa4480.yaml b/Documentation/devicetree/bindings/usb/fcs,fsa4480.yaml
index 89b1fb90aeeb..ee00c7ce0c50 100644
--- a/Documentation/devicetree/bindings/usb/fcs,fsa4480.yaml
+++ b/Documentation/devicetree/bindings/usb/fcs,fsa4480.yaml
@@ -9,31 +9,11 @@ title: ON Semiconductor Analog Audio Switch
 maintainers:
   - Bjorn Andersson <bjorn.andersson@linaro.org>
 
-properties:
-  compatible:
-    oneOf:
-      - const: fcs,fsa4480
-      - items:
-          - enum:
-              - ocs,ocp96011
-          - const: fcs,fsa4480
-
-  reg:
-    maxItems: 1
-
-  interrupts:
-    maxItems: 1
-
-  vcc-supply:
-    description: power supply (2.7V-5.5V)
-
-  mode-switch: true
-  orientation-switch: true
-
-  port:
+$defs:
+  controller-port:
     $ref: /schemas/graph.yaml#/$defs/port-base
     description:
-      A port node to link the FSA4480 to a TypeC controller for the purpose of
+      A port node to link the FSA4480 to a Type-C controller for the purpose of
       handling altmode muxing and orientation switching.
     unevaluatedProperties: false
 
@@ -69,14 +49,57 @@ properties:
                   - AUX+ connected to SBU2
                   - AUX- connected to SBU1
 
+properties:
+  compatible:
+    oneOf:
+      - const: fcs,fsa4480
+      - items:
+          - enum:
+              - ocs,ocp96011
+          - const: fcs,fsa4480
+
+  reg:
+    maxItems: 1
+
+  interrupts:
+    maxItems: 1
+
+  vcc-supply:
+    description: power supply (2.7V-5.5V)
+
+  mode-switch: true
+  orientation-switch: true
+
+  port:
+    $ref: "#/$defs/controller-port"
+
+  ports:
+    $ref: /schemas/graph.yaml#/properties/ports
+
+    properties:
+      port@0:
+        $ref: "#/$defs/controller-port"
+      port@1:
+        $ref: /schemas/graph.yaml#/properties/port
+        description:
+          A port node to link the FSA4480 to an audio codec for the purpose of
+          handling Audio Accessory Mode muxing and orientation switching.
+
+    required:
+      - port@0
+
 required:
   - compatible
   - reg
-  - port
 
 allOf:
   - $ref: usb-switch.yaml#
-  - $ref: usb-switch-ports.yaml#
+
+oneOf:
+  - required:
+      - port
+  - required:
+      - ports
 
 additionalProperties: false
 
@@ -98,9 +121,24 @@ examples:
             mode-switch;
             orientation-switch;
 
-            port {
-                fsa4480_ept: endpoint {
-                    remote-endpoint = <&typec_controller>;
+            ports {
+                #address-cells = <1>;
+                #size-cells = <0>;
+
+                port@0 {
+                    reg = <0>;
+
+                    fsa4480_sbu_mux: endpoint {
+                        remote-endpoint = <&typec_controller>;
+                    };
+                };
+
+                port@1 {
+                    reg = <1>;
+
+                    fsa4480_audio: endpoint {
+                        remote-endpoint = <&audio_codec>;
+                    };
                 };
             };
         };
-- 
2.55.0

