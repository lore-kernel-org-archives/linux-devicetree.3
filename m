Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=202.38.64.46
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1795485018;
	b=PQHaCxlpad5th+B3rmQlkTlMuRW9YLfk9zmgKpzNe/Or1T5SwFXI+GfD19NTVSkG5pFc
	 bg+X4k35qXAwao3Zks+jGFSBrR1wgTKTkJRbbGXWKwYC9WoTOuaTBSdWrRgosXyjJWrxY
	 XvQjN04piFWSglmlHcDxI4jwMioOlrQAacek+qTMZbGhQJ6d9O1lk2wl+0Ash47pNcwiF
	 YhUtEgD6AF/uvN8zAPvmQgfxwLiyQx528z7VkMmSoIOpj3l7kklhXEB3ud6Sk2i2t0KIB
	 U8Gg0MQMaFS6KP7p71FK5SXTt8A23xOa2g71rvNO0RgNgJx1Z2vJPW1IjV9MLJmZvmQ==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1795485018;
	h=DMARC-Filter:DKIM-Signature:Received:From:To:Cc:Subject:Date:
	 Message-ID:X-Mailer:In-Reply-To:References:MIME-Version:
	 Content-Transfer-Encoding:X-CM-TRANSID:X-Coremail-Antispam:
	 X-CM-SenderInfo;
	bh=MIK5lgowHa9HZQL7wgJvDpM5vWQ0IauK2t5++KMPc2I=;
	b=zT+W3O3OPj6EjNPMeDwX9qYeWJ6zpp63zNhMC6e/udPamp66Ct33MPUvDHQ/2LnKfxGG
	 sdtqez+SLblJgfblEMnAJZaQt6Aoqu3HICiWdJvLFyFwtUjPcv7luLkPvcIs5BNDCEfd6
	 nbZBY6wc3LYEQFOLicOcVCUWb7AOnESp8SZKId77gSddJds8DBi0ncQ88b07Q6JRW80QA
	 I8D8pEp1MYjXKtD1MQkqeAWDr/mmdg6gn+jWsUSwMYW6PP18sADGSDhS7Urrp7ppxHoeK
	 GvIsTpx0gx6vyRlFUD5MjVDEwkH6/6CF7r9UtzUEERrOtKXcW6hmw6u8Q291LAkNoDA==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=mail.ustc.edu.cn;
	spf=pass smtp.mailfrom=mail.ustc.edu.cn;
	dkim=pass header.d=mail.ustc.edu.cn header.i=@mail.ustc.edu.cn header.a=rsa-sha256 header.s=dkim header.b="pAFL/mmG";
	arc=none smtp.remote-ip=202.38.64.46
Received: from ustc.edu.cn (smtp.ustc.edu.cn [202.38.64.46])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 675E1606A32D;
	Tue, 24 Nov 2026 01:50:15 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org 675E1606A32D
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=mail.ustc.edu.cn
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=mail.ustc.edu.cn
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=mail.ustc.edu.cn header.i=@mail.ustc.edu.cn header.a=rsa-sha256 header.s=dkim header.b=pAFL/mmG
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=mail.ustc.edu.cn; s=dkim; h=Received:From:To:Cc:Subject:Date:
	Message-ID:In-Reply-To:References:MIME-Version:
	Content-Transfer-Encoding; bh=MIK5lgowHa9HZQL7wgJvDpM5vWQ0IauK2t
	5++KMPc2I=; b=pAFL/mmG6FfHYbeUZvg7UvoewF52/Ttc0A+n9bLhCV/5iSJ6rY
	QV0/iJ3aAD+42Crt/gjfZalZ0BqOyI1/en+Sz3cei1sMQbUHccmrCv4yiTVTZlhJ
	rOrdY5d6+CcokIHQHhSXMzs9Xa4OFNHv+NTgg41rgQYAIC/FWhq0WiQpk=
Received: from xuqianhui.tail7a2807.ts.net (unknown [114.214.185.179])
	by mailimap2024 (Coremail) with SMTP id 3pYKCgAntEhK7QRrnDDvAA--.91S3;
	Tue, 24 Nov 2026 09:50:05 +0800 (CST)
From: Qianhui Xu <xiaqinghuan@mail.ustc.edu.cn>
To: Thinh.Nguyen@synopsys.com
Cc: robh@kernel.org,
	krzk+dt@kernel.org,
	conor+dt@kernel.org,
	gregkh@linuxfoundation.org,
	devicetree@vger.kernel.org,
	linux-arm-msm@vger.kernel.org,
	linux-kernel@vger.kernel.org
Subject: [PATCH v14 1/3] dt-bindings: usb: snps,dwc3: describe two connectors on one HS data bus
Date: Tue, 24 Nov 2026 09:50:00 +0800
Message-ID: <20261124015002.1426767-2-xiaqinghuan@mail.ustc.edu.cn>
X-Mailer: git-send-email 2.53.0
In-Reply-To: <20261124015002.1426767-1-xiaqinghuan@mail.ustc.edu.cn>
References: <20261124015002.1426767-1-xiaqinghuan@mail.ustc.edu.cn>
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
X-CM-TRANSID:3pYKCgAntEhK7QRrnDDvAA--.91S3
X-Coremail-Antispam: 1UD129KBjvJXoWxtFyrXF4xCw4rXr1rXFW7XFb_yoWxGFy8pF
	ZxtFs7tF4qgryfA3srAF18Cwn3KF4kJrnrJrnrGr1UZa13Wr1rXa13K3sYqFyUCF92va4a
	ka4qg3W7Xw17CFJanT9S1TB71UUUUU7qnTZGkaVYY2UrUUUUjbIjqfuFe4nvWSU5nxnvy2
	9KBjDU0xBIdaVrnRJUUUP2b7Iv0xC_Kw4lb4IE77IF4wAFF20E14v26ryj6rWUM7CY07I2
	0VC2zVCF04k26cxKx2IYs7xG6rWj6s0DM7CIcVAFz4kK6r1j6r18M28IrcIa0xkI8VA2jI
	8067AKxVWUGwA2048vs2IY020Ec7CjxVAFwI0_JFI_Gr1l8cAvFVAK0II2c7xJM28CjxkF
	64kEwVA0rcxSw2x7M28EF7xvwVC0I7IYx2IY67AKxVW7JVWDJwA2z4x0Y4vE2Ix0cI8IcV
	CY1x0267AKxVW8Jr0_Cr1UM28EF7xvwVC2z280aVAFwI0_Cr1j6rxdM28EF7xvwVC2z280
	aVCY1x0267AKxVW0oVCq3wAS0I0E0xvYzxvE52x082IY62kv0487Mc02F40EFcxC0VAKzV
	Aqx4xG6I80ewAv7VC0I7IYx2IY67AKxVWUJVWUGwAv7VC2z280aVAFwI0_Jr0_Gr1lOx8S
	6xCaFVCjc4AY6r1j6r4UM4x0Y48IcxkI7VAKI48JMxkF7I0En4kS14v26r126r1DMxkIec
	xEwVAFwVWkMxAIw28IcxkI7VAKI48JMxC20s026xCaFVCjc4AY6r1j6r4UMI8I3I0E5I8C
	rVAFwI0_Jr0_Jr4lx2IqxVCjr7xvwVAFwI0_JrI_JrWlx4CE17CEb7AF67AKxVWUtVW8Zw
	CIc40Y0x0EwIxGrwCI42IY6xIIjxv20xvE14v26r1j6r1xMIIF0xvE2Ix0cI8IcVCY1x02
	67AKxVW8JVWxJwCI42IY6xAIw20EY4v20xvaj40_Jr0_JF4lIxAIcVC2z280aVAFwI0_Jr
	0_Gr1lIxAIcVC2z280aVCY1x0267AKxVW8JVW8JrUvcSsGvfC2KfnxnUUI43ZEXa7IU5J3
	vUUUUUU==
X-CM-SenderInfo: 50ld1x5qjk3t3q6ptxnoox23vfohv3gofq/1tbiAREAB2sElFsCDQArsT

Some designs route two USB Type-C receptacles through one High Speed
D+/D- pair with a GPIO multiplexer, so only one connector drives the
controller at a time and the device tree has to say which role-switch
input and which mux state belongs to each of them.

A mux'ed data stream on one bus is an endpoint of that port in the OF
graph, not a port of its own, so the two connectors become endpoint@0
and endpoint@1 of the High Speed port, next to the Super Speed port@1.
Each endpoint carries "usb-role-switch" and the "mux-state" that
reaches it, and the multiplexer is referenced with "mux-controls", so
an existing "gpio-mux" controller is used as is instead of a private
property.

The High Speed port definition stays optional: a single-connector
controller keeps describing one plain "endpoint", the two endpoints
are required only when "mux-controls" is present, and the two states
must be opposite so that the two connectors cannot both claim the same
data path.

Signed-off-by: Qianhui Xu <xiaqinghuan@mail.ustc.edu.cn>

Changes since v13:
 - [sashiko, 2026-11-23, Low] "missing maxItems: 1 on mux-controls".
   Accepted: the shared data bus is driven by one two-state multiplexer, so
   "mux-controls" now says "maxItems: 1" instead of leaving the number of
   mux controllers open.

 - [sashiko, same report, Low] "missing endpoint schema under port@0":
   a plain "port@0/endpoint" could carry undocumented properties and
   "endpoint@2"/"endpoint@3" were not rejected, because the graph port base
   intentionally leaves "unevaluatedProperties" open.  Described where it
   matters, inside the "mux-controls" branch: a mux'ed bus has exactly two
   data streams, so that branch now rejects a plain "endpoint" and any
   "endpoint@2"+.  Single-connector controllers keep the generic graph port
   binding untouched.

 - [sashiko, same report, Low] "contradictory oneOf and redundant mux
   rules".  Accepted; this one was a real logic error.  The "oneOf" that
   requires opposite "mux-state" values evaluated both alternatives as true
   when "mux-state" was absent, so a two-endpoint tree without
   "mux-controls" failed validation.  The "oneOf" now sits in the
   "mux-controls" branch, where both properties are required anyway, and the
   redundant "dependentRequired" and "mux-controls: false" are gone.
---
 .../bindings/usb/snps,dwc3-common.yaml        | 100 +++++++++++++++++-
 1 file changed, 99 insertions(+), 1 deletion(-)

diff --git a/Documentation/devicetree/bindings/usb/snps,dwc3-common.yaml b/Documentation/devicetree/bindings/usb/snps,dwc3-common.yaml
index 6c0b8b653824..dcfa8c3a81c5 100644
--- a/Documentation/devicetree/bindings/usb/snps,dwc3-common.yaml
+++ b/Documentation/devicetree/bindings/usb/snps,dwc3-common.yaml
@@ -26,8 +26,78 @@ allOf:
       $ref: usb.yaml#
     else:
       $ref: usb-xhci.yaml#
+  - if:
+      required: [mux-controls]
+    then:
+      # A multiplexed High Speed bus only makes sense when the controller is
+      # dual-role and both connectors can switch their role independently.
+      required: [ports, usb-role-switch]
+      properties:
+        dr_mode:
+          const: otg
+        ports:
+          required: [port@0]
+          properties:
+            port@0:
+              required: ['#address-cells', '#size-cells',
+                         endpoint@0, endpoint@1]
+              # A mux'ed High Speed bus has exactly two connectors, as the
+              # two endpoints of this port; a plain "endpoint" or any further
+              # endpoint would be a third data stream and is not described.
+              properties:
+                endpoint: false
+              patternProperties:
+                '^endpoint@[01]$':
+                  required: [usb-role-switch, mux-state]
+                '^endpoint@([2-9]|[1-9a-f][0-9a-f]+)$': false
+              # The two connectors must claim opposite mux states.  Kept inside
+              # this branch: JSON Schema evaluates "properties" of an absent
+              # property as true, so the same "oneOf" outside the branch would
+              # see both alternatives match when "mux-state" is not used at all.
+              oneOf:
+                - properties:
+                    endpoint@0:
+                      properties:
+                        mux-state:
+                          const: 0
+                    endpoint@1:
+                      properties:
+                        mux-state:
+                          const: 1
+                - properties:
+                    endpoint@0:
+                      properties:
+                        mux-state:
+                          const: 1
+                    endpoint@1:
+                      properties:
+                        mux-state:
+                          const: 0
+    else:
+      # Without a mux the High Speed port keeps the generic graph port
+      # binding, so single-connector controllers are described as before and
+      # the per-connector properties have no meaning.
+      properties:
+        ports:
+          properties:
+            port@0:
+              patternProperties:
+                '^endpoint@[01]$':
+                  properties:
+                    usb-role-switch: false
+                    mux-state: false
 
 properties:
+  mux-controls:
+    $ref: /schemas/types.yaml#/definitions/phandle-array
+    maxItems: 1
+    description:
+      Phandle to the multiplexer that selects which of the two connectors
+      drives the controller's shared High Speed data bus, e.g. a
+      "gpio-mux" controller.  Each connector is described by the endpoint@0
+      or endpoint@1 of "port@0", and the endpoint of that connector carries
+      its own role-switch input and the "mux-state" it is reached in.
+
   extcon:
     maxItems: 1
     deprecated: true
@@ -411,9 +481,37 @@ properties:
 
     properties:
       port@0:
-        $ref: /schemas/graph.yaml#/properties/port
+        # The High Speed port carries the controller's HS data stream.  Two
+        # receptacles sharing one HS D+/D- pair are two mux'ed data streams of
+        # that one stream, so they are two endpoints of this port and not two
+        # ports.  A single-connector controller describes the plain "endpoint"
+        # of the graph binding and is unaffected.
+        $ref: /schemas/graph.yaml#/$defs/port-base
+        unevaluatedProperties: false
         description: High Speed (HS) data bus.
 
+        patternProperties:
+          '^endpoint@[01]$':
+            $ref: /schemas/graph.yaml#/$defs/endpoint-base
+            unevaluatedProperties: false
+
+            properties:
+              usb-role-switch:
+                type: boolean
+                description:
+                  This connector has its own USB role switch, registered
+                  against this endpoint.
+
+              mux-state:
+                $ref: /schemas/types.yaml#/definitions/uint32
+                enum: [0, 1]
+                description:
+                  State of the High Speed data bus multiplexer which connects
+                  this connector to the controller.  The two connectors of one
+                  controller must use different states.
+
+            required: [reg]
+
       port@1:
         $ref: /schemas/graph.yaml#/properties/port
         description: Super Speed (SS) data bus.
-- 
2.53.0

