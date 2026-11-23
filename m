Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=202.38.64.46
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1795432153;
	b=pGekmTe2HpbKVkdJM0lLQOGtXPn1N/ArVG+5hm8yBvbx3QuyTJ/hZI+UUpPKOGg9qTVY
	 l71gIE0z2OMRMg58jc4m5ilRiAVBJWtNeer4LlSaQ2spTdnJUZPr/euRg5+CHJbpZitrw
	 iJZ7AXwP/yU+gZ8fJLsKoZzkQWkFoWW00kYeeBBe4V3gJbSEWGOyyniuXAoade0PX29G2
	 EMcFuf7gbE76rlNwwxPmWiAuIRiesgnbOUBd9t60c7Z3YIKf3DHER5Hty2lJeBHUBPhWC
	 Qxsrihl5JTCa6aF4dlrlC/ovgOYwaaHnxvqIOieyo0GtxWB3RdVeGpEDh/LS6LGkvdA==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1795432153;
	h=DMARC-Filter:DKIM-Signature:Received:From:To:Cc:Subject:Date:
	 Message-ID:X-Mailer:In-Reply-To:References:MIME-Version:
	 Content-Transfer-Encoding:X-CM-TRANSID:X-Coremail-Antispam:
	 X-CM-SenderInfo;
	bh=XiG09QtEhLJXduv1eOfWH6YY3f0HEP49DXIcaFk4ULs=;
	b=Egj45pg2VLRThuC72CtEdqjRj3c1Yd1WFCcii68y0p8zz8/b4MZcnuqrkGt/V0zLnRQ4
	 FONU1bG17r6AdAYDx6H6jcDzNTSN6oa4sz0DApjAHLgcqQcJFHknxkkUJmCV/bRZfXyYR
	 za4t0VyYzvEgnfcOZAKYqPgXti/8RwPAUzsDb/wp8AZ9Ls6tAWrkKa+neJpV8ABzS77ll
	 zCVxDGOXbvYAXm8yLbhGNAT2bC72T32pN6cDvuboHl9ctZMdPl+faGpkpAtr7bmIBKRES
	 TgHmkpHiytzTuCsaimlvPswglfz0B4PN+1vmkjGP4IPfWxsKe6ftkxdWAEdmFt7tFVA==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=mail.ustc.edu.cn;
	spf=pass smtp.mailfrom=mail.ustc.edu.cn;
	dkim=pass header.d=mail.ustc.edu.cn header.i=@mail.ustc.edu.cn header.a=rsa-sha256 header.s=dkim header.b=cRw+tC+G;
	arc=none smtp.remote-ip=202.38.64.46
Received: from ustc.edu.cn (smtp.ustc.edu.cn [202.38.64.46])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 11515606A32A;
	Mon, 23 Nov 2026 11:09:09 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org 11515606A32A
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=mail.ustc.edu.cn
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=mail.ustc.edu.cn
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=mail.ustc.edu.cn header.i=@mail.ustc.edu.cn header.a=rsa-sha256 header.s=dkim header.b=cRw+tC+G
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=mail.ustc.edu.cn; s=dkim; h=Received:From:To:Cc:Subject:Date:
	Message-ID:In-Reply-To:References:MIME-Version:
	Content-Transfer-Encoding; bh=XiG09QtEhLJXduv1eOfWH6YY3f0HEP49DX
	IcaFk4ULs=; b=cRw+tC+G3KEp0wwwALZlNCpz+xK2BfnF4qrBOVqEQAtl7wMSg6
	xU4zt413BIPIqhQ4JogKFb1BD4/G07srBEXGwkkhM3huCLzp/H2Ko33gwMC1/iiQ
	M/XSD4U8gy6uT9SfvyNrwSWBJ6QGoyKoesHWnBGlXYXiG2ByNN+k2IjnQ=
Received: from xuqianhui.tail7a2807.ts.net (unknown [114.214.185.179])
	by mailimap2024 (Coremail) with SMTP id 3pYKCgCH9yvKHgRrRSLsAA--.2408S3;
	Mon, 23 Nov 2026 19:09:02 +0800 (CST)
From: Qianhui Xu <xiaqinghuan@mail.ustc.edu.cn>
To: Thinh.Nguyen@synopsys.com
Cc: robh@kernel.org,
	krzk+dt@kernel.org,
	conor+dt@kernel.org,
	gregkh@linuxfoundation.org,
	devicetree@vger.kernel.org,
	linux-arm-msm@vger.kernel.org,
	linux-kernel@vger.kernel.org
Subject: [PATCH v13 1/3] dt-bindings: usb: snps,dwc3: describe two connectors on one HS data bus
Date: Mon, 23 Nov 2026 19:08:56 +0800
Message-ID: <20261123110858.538884-2-xiaqinghuan@mail.ustc.edu.cn>
X-Mailer: git-send-email 2.53.0
In-Reply-To: <20261123110858.538884-1-xiaqinghuan@mail.ustc.edu.cn>
References: <20261123110858.538884-1-xiaqinghuan@mail.ustc.edu.cn>
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
X-CM-TRANSID:3pYKCgCH9yvKHgRrRSLsAA--.2408S3
X-Coremail-Antispam: 1UD129KBjvJXoWxtFyrXF4xCw1rtw1rAr1fWFg_yoWxGw1DpF
	ZxtF4ktF4vgryfZ3s2y3W8Cwna9F4kJrnrtryDGw1UZa13W34rXa13Kw1FgFyUCF92va4a
	934DWa4UX3ZrCFJanT9S1TB71UUUUU7qnTZGkaVYY2UrUUUUjbIjqfuFe4nvWSU5nxnvy2
	9KBjDU0xBIdaVrnRJUUUPFb7Iv0xC_Kw4lb4IE77IF4wAFF20E14v26ryj6rWUM7CY07I2
	0VC2zVCF04k26cxKx2IYs7xG6rWj6s0DM7CIcVAFz4kK6r1j6r18M28IrcIa0xkI8VA2jI
	8067AKxVWUGwA2048vs2IY020Ec7CjxVAFwI0_JFI_Gr1l8cAvFVAK0II2c7xJM28CjxkF
	64kEwVA0rcxSw2x7M28EF7xvwVC0I7IYx2IY67AKxVW7JVWDJwA2z4x0Y4vE2Ix0cI8IcV
	CY1x0267AKxVWxJVW8Jr1l84ACjcxK6I8E87Iv67AKxVW0oVCq3wA2z4x0Y4vEx4A2jsIE
	c7CjxVAFwI0_GcCE3s1le2I262IYc4CY6c8Ij28IcVAaY2xG8wAqx4xG64xvF2IEw4CE5I
	8CrVC2j2WlYx0E2Ix0cI8IcVAFwI0_Jr0_Jr4lYx0Ex4A2jsIE14v26r1j6r4UMcvjeVCF
	s4IE7xkEbVWUJVW8JwACjcxG0xvY0x0EwIxGrwCY1x0262kKe7AKxVWUAVWUtwCY02Avz4
	vE14v_Gw4l42xK82IYc2Ij64vIr41l4I8I3I0E4IkC6x0Yz7v_Jr0_Gr1lx2IqxVAqx4xG
	67AKxVWUJVWUGwC20s026x8GjcxK67AKxVWUGVWUWwC2zVAF1VAY17CE14v26r1q6r43MI
	IYrxkI7VAKI48JMIIF0xvE2Ix0cI8IcVAFwI0_Jr0_JF4lIxAIcVC0I7IYx2IY6xkF7I0E
	14v26r4j6F4UMIIF0xvE42xK8VAvwI8IcIk0rVWUJVWUCwCI42IY6I8E87Iv67AKxVWUJV
	W8JwCI42IY6I8E87Iv6xkF7I0E14v26r4j6r4UJbIYCTnIWIevJa73UjIFyTuYvjxUym0m
	UUUUU
X-CM-SenderInfo: 50ld1x5qjk3t3q6ptxnoox23vfohv3gofq/1tbiAREAB2sDQttdngBds4

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
---
*** AI-assistance disclosure ***
This patch was prepared with the help of an LLM coding assistant.  The
author reviewed every line and ran the gates quoted in the series notes.


Changes since v10:
 - the version posted as v10 still applied the two-connector definition to
   every user of "port@0" through an unconditional "$ref", and required
   "dr_mode" from a mux user.  Both are gone: "port@0" keeps the generic
   graph port at the top level, and the two endpoints, their
   "usb-role-switch"/"mux-state" and the address/size cells are required by
   the "mux-controls" branch only, so existing single-connector controllers
   such as qcom/sm8250.dtsi validate as before.
 - the High Speed endpoint schema is inlined into "port@0" through
   patternProperties; the local "$defs" section and the "$ref" to it are
   dropped, as Rob asked for in v9.
 - keep driver behaviour out of the binding: the "mux-controls" branch only
   states what the device tree must contain, without naming driver
   functions.
 - do not list "dr_mode" in "required": omitting it already means "otg"
   (usb-drd.yaml, and dwc3_get_dr_mode() for a role-switch controller), so
   requiring it rejected trees that rely on the default.  It stays
   "const: otg" when present, so "host" and "peripheral" are still rejected.
 - require both "usb-role-switch" and "mux-state" on both endpoints, so a
   tree cannot satisfy one branch of the oneOf while omitting the
   properties the driver needs.
 - describe the binding relative to the baseline tree instead of as a diff
   against v8; the v8 changelog referred to a "port@2" and a
   "port-select-gpios" property that never existed upstream.
 .../devicetree/bindings/usb/snps,dwc3-common.yaml  |   99 ++++++++++++++++++++
 1 file changed, 98 insertions(+), 1 deletion(-)

diff --git a/Documentation/devicetree/bindings/usb/snps,dwc3-common.yaml b/Documentation/devicetree/bindings/usb/snps,dwc3-common.yaml
index 6c0b8b653824..7a9cb5a115a6 100644
--- a/Documentation/devicetree/bindings/usb/snps,dwc3-common.yaml
+++ b/Documentation/devicetree/bindings/usb/snps,dwc3-common.yaml
@@ -26,8 +26,49 @@ allOf:
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
+              patternProperties:
+                '^endpoint@[01]$':
+                  required: [usb-role-switch, mux-state]
+    else:
+      # Without a mux the High Speed port keeps the generic graph port
+      # binding, so single-connector controllers are described as before and
+      # the per-connector properties have no meaning.
+      properties:
+        mux-controls: false
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
@@ -411,9 +452,65 @@ properties:
 
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
+            dependentRequired:
+              usb-role-switch: [mux-state]
+              mux-state: [usb-role-switch]
+
+        if:
+          required: [endpoint@0, endpoint@1]
+        then:
+          # The two connectors must claim opposite mux states.
+          oneOf:
+            - properties:
+                endpoint@0:
+                  properties:
+                    mux-state:
+                      const: 0
+                endpoint@1:
+                  properties:
+                    mux-state:
+                      const: 1
+            - properties:
+                endpoint@0:
+                  properties:
+                    mux-state:
+                      const: 1
+                endpoint@1:
+                  properties:
+                    mux-state:
+                      const: 0
+
       port@1:
         $ref: /schemas/graph.yaml#/properties/port
         description: Super Speed (SS) data bus.

