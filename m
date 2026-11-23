Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=202.38.64.46
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1795427608;
	b=dd9TFbVdnQ3b+k3osuae8iIWhcNzVtcatlXcaKSd4YjsRjtVX4s+UpJG7tzRwMSMUq39
	 xk9LyS+slVb+29OPonEJGTwrPDERhaWZf8BqluzwYsWAWy37lYpGDcGvttDesqh/m2Ylu
	 g3WFDNEEr5y3R59xcGiEnPCWF41X+rddyby1wJJtMemZFZ9P3OhjURstOhpu3lxkHhDG9
	 00u5wfze5+VMlwjfe/eQK6yZadDZ9HsCd46eTYh3SynJqCB3/Y4kVOH8/HD0YEb+z7TIT
	 9ID1ygDwzTNaoON7G3dUiYKonKmtCVVV8zvN3Bt0B7mgE5xFsOMilq7hi0aYQJ6g7eA==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1795427608;
	h=DMARC-Filter:DKIM-Signature:Received:From:To:Cc:Subject:Date:
	 Message-ID:X-Mailer:In-Reply-To:References:MIME-Version:
	 Content-Transfer-Encoding:X-CM-TRANSID:X-Coremail-Antispam:
	 X-CM-SenderInfo;
	bh=XiG09QtEhLJXduv1eOfWH6YY3f0HEP49DXIcaFk4ULs=;
	b=WqFeIRw6svpcSeM6TSkBDdEeo5wv6yUL1IAzoSsabbeGvXld6hXptYHBHdUQJT8ui/+A
	 mLOstkaHf3epy7qpsBdZUntOI2L9jiFDua+hrnTGdWM735YKmnIbntjQ+nVd8m1eIEQO8
	 kIBqE5rYlTpN1bhLc3ovuNyCvTkYTd/35FItTVF0GRziHcsmZQzYVUiG+QWMxyI1D8V5M
	 MgG6+PR17qUXgu6rGqelGVEr06XSkoHOke4a5yKLsq0ERSxi4F1cBKsXCtmAn8lwI8yBJ
	 IWVPW465/fH9I8BpX6jW1QixnR0vZFgILiFPkkxJVUxXdGA3aaWC6u7uevj0bw0J3ng==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=mail.ustc.edu.cn;
	spf=pass smtp.mailfrom=mail.ustc.edu.cn;
	dkim=pass header.d=mail.ustc.edu.cn header.i=@mail.ustc.edu.cn header.a=rsa-sha256 header.s=dkim header.b="RBF/ZPFj";
	arc=none smtp.remote-ip=202.38.64.46
Received: from ustc.edu.cn (smtp.ustc.edu.cn [202.38.64.46])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 270ED606A31E;
	Mon, 23 Nov 2026 09:53:26 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org 270ED606A31E
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=mail.ustc.edu.cn
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=mail.ustc.edu.cn
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=mail.ustc.edu.cn header.i=@mail.ustc.edu.cn header.a=rsa-sha256 header.s=dkim header.b=RBF/ZPFj
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=mail.ustc.edu.cn; s=dkim; h=Received:From:To:Cc:Subject:Date:
	Message-ID:In-Reply-To:References:MIME-Version:
	Content-Transfer-Encoding; bh=XiG09QtEhLJXduv1eOfWH6YY3f0HEP49DX
	IcaFk4ULs=; b=RBF/ZPFjxMVCmH/WjrHzvaG13oMogfmvo1ziPB214Fz40knvgl
	uE12q/Q5fAospLCJBMtAk/s0zfmOzZU527/N0CyZOPGGU6m0lnYVw5EAZkSkw53P
	ynPNOkbT/MIK+d5YVFHh0HJTYd0c35PujCF1eehkdO0t2mE7QtumiPosU=
Received: from xuqianhui.tail7a2807.ts.net (unknown [114.214.185.179])
	by mailimap2024 (Coremail) with SMTP id 3pYKCgC3KzAGDQRrr9vrAA--.766S3;
	Mon, 23 Nov 2026 17:53:12 +0800 (CST)
From: Qianhui Xu <xiaqinghuan@mail.ustc.edu.cn>
To: Thinh.Nguyen@synopsys.com
Cc: robh@kernel.org,
	krzk+dt@kernel.org,
	conor+dt@kernel.org,
	gregkh@linuxfoundation.org,
	devicetree@vger.kernel.org,
	linux-arm-msm@vger.kernel.org,
	linux-kernel@vger.kernel.org
Subject: [PATCH v12 1/3] dt-bindings: usb: snps,dwc3: describe two connectors on one HS data bus
Date: Mon, 23 Nov 2026 17:53:07 +0800
Message-ID: <20261123095310.154352-2-xiaqinghuan@mail.ustc.edu.cn>
X-Mailer: git-send-email 2.53.0
In-Reply-To: <20261123095310.154352-1-xiaqinghuan@mail.ustc.edu.cn>
References: <20261123095310.154352-1-xiaqinghuan@mail.ustc.edu.cn>
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
X-CM-TRANSID:3pYKCgC3KzAGDQRrr9vrAA--.766S3
X-Coremail-Antispam: 1UD129KBjvJXoWxtFyrXF4xCw1rtw1rAr1fWFg_yoWxGw1DpF
	ZxtF4ktF4vgryfZ3s2y3W8Cwna9F4kJrnrtryDGw1UZa13W34rXa13Kw1FgFyUCF92va4a
	934DWa4UX3ZrCFJanT9S1TB71UUUUU7qnTZGkaVYY2UrUUUUjbIjqfuFe4nvWSU5nxnvy2
	9KBjDU0xBIdaVrnRJUUUP2b7Iv0xC_Kw4lb4IE77IF4wAFF20E14v26ryj6rWUM7CY07I2
	0VC2zVCF04k26cxKx2IYs7xG6rWj6s0DM7CIcVAFz4kK6r1j6r18M28IrcIa0xkI8VA2jI
	8067AKxVWUGwA2048vs2IY020Ec7CjxVAFwI0_JFI_Gr1l8cAvFVAK0II2c7xJM28CjxkF
	64kEwVA0rcxSw2x7M28EF7xvwVC0I7IYx2IY67AKxVW7JVWDJwA2z4x0Y4vE2Ix0cI8IcV
	CY1x0267AKxVW8Jr0_Cr1UM28EF7xvwVC2z280aVAFwI0_GcCE3s1l84ACjcxK6I8E87Iv
	6xkF7I0E14v26rxl6s0DM2AIxVAIcxkEcVAq07x20xvEncxIr21l5I8CrVACY4xI64kE6c
	02F40Ex7xfMcIj6xIIjxv20xvE14v26r1j6r18McIj6I8E87Iv67AKxVWUJVW8JwAm72CE
	4IkC6x0Yz7v_Jr0_Gr1lF7xvr2IYc2Ij64vIr41lc7CjxVAaw2AFwI0_JF0_Jw1lc2xSY4
	AK67AK6r4fMxAIw28IcxkI7VAKI48JMxC20s026xCaFVCjc4AY6r1j6r4UMI8I3I0E5I8C
	rVAFwI0_Jr0_Jr4lx2IqxVCjr7xvwVAFwI0_JrI_JrWlx4CE17CEb7AF67AKxVWUtVW8Zw
	CIc40Y0x0EwIxGrwCI42IY6xIIjxv20xvE14v26r1j6r1xMIIF0xvE2Ix0cI8IcVCY1x02
	67AKxVW8JVWxJwCI42IY6xAIw20EY4v20xvaj40_Jr0_JF4lIxAIcVC2z280aVAFwI0_Jr
	0_Gr1lIxAIcVC2z280aVCY1x0267AKxVW8JVW8JrUvcSsGvfC2KfnxnUUI43ZEXa7IU5EF
	AtUUUUU==
X-CM-SenderInfo: 50ld1x5qjk3t3q6ptxnoox23vfohv3gofq/1tbiAREAB2sDQttJXQBRsj

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

