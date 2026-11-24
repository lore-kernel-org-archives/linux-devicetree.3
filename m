Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=209.85.221.46
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1795559105;
	b=vHRVfyEXaqjBl3Gb3BQa7V7aG54yOptG24vdBUgKu8BsQxKAF5qhx2vY2HCXu3chMb25
	 xx9/vgs3OZDDhQtckgynsW9Opi5AGLnW4vwq+2EbTsgysQPK+/ptfPkK9DteNyYYN1RRJ
	 sJzTdx5rklYqg+VWvQVOKyGp0EedCyAZ73acrmMpczmZ5+K0OG6BG33T2tD1amZGEZ3hS
	 JqSE9bv9jgQjo3tsVJdq+cTDHRIX0CssTilX0LVPjVx4LhcUurzoH5GQI78LCJgcWxWUI
	 qBwLJMHzG3I6Zg7zapVCr7V5f97wwgHN6QBWFnXo+xT4Q5Bpk5qWPyaVkV1mUQTLvrA==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1795559105;
	h=DMARC-Filter:Received:DKIM-Signature:X-Google-DKIM-Signature:
	 X-Forwarded-Encrypted:X-Gm-Message-State:X-Gm-Gg:X-Received:Received:
	 From:To:Subject:Date:Message-ID:X-Mailer:In-Reply-To:References:
	 MIME-Version:Content-Transfer-Encoding;
	bh=hbE4Q7q4TrDtAfvA5QvxISTriMkp04Un/AU1m5jHodE=;
	b=KCy+tCl5hUeQt6Zb+kPBLzrg83uWtyhD/ekxVFa0qHVXq9T7xLYV/B7OyDl7iglkB+zb
	 ZZvhrzwCxI1YRmdIF6DHyX8I/zyYLrIc3hyN2bwm9P+e2Kgl49vskQl9Vwz3vMUb1UVUt
	 rp8lZ4z43wlFIkL/JQu7+asO+XOPalPbvydYTBrvMqPmN/SmYKDhEOsqws9HlsO1VhNdV
	 UOqakM0VWr1LKKO+yGR5Dld3F5htBzJRnT6SDsiPwTE+fmPiQJA8ULDNirROUCuO8tkXo
	 cH7vSI4ibZ1ElcxLKk8QyHzsoEFx21XGPdxkwj/1tBB1QDNPtYKzb3nKNg8KZMIqTag==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=gmail.com;
	spf=pass smtp.mailfrom=gmail.com;
	dkim=pass header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20260707 header.b=OqrkBlvL;
	arc=none smtp.remote-ip=209.85.221.46
Received: from mail-wr1-f46.google.com (mail-wr1-f46.google.com [209.85.221.46])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 40E2F606A32C
	for <devicetree@vger.kernel.org>; Tue, 24 Nov 2026 22:25:05 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org 40E2F606A32C
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20260707 header.b=OqrkBlvL
Received: by mail-wr1-f46.google.com with SMTP id ffacd0b85a97d-4a9be758734so3187937f8f.1
        for <devicetree@vger.kernel.org>; Tue, 24 Nov 2026 14:25:05 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20260707; t=1795559103; x=1796163903; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:to:from:from:to:cc:subject:date:message-id
         :reply-to:content-type;
        bh=hbE4Q7q4TrDtAfvA5QvxISTriMkp04Un/AU1m5jHodE=;
        b=OqrkBlvLFFiXmfHtN5DPs4LEfBjKqUZSDzwTE1EffqbRTK/nzjN6gUpvWlCh1tjdEu
         bnfJklffsjdbWMjVkAB5MPsxUJW+UM/i1rsEcCuwFBxwGBg9RHwDYiJCaoVeJeghCdlD
         nE3VNAPWJd7EOewwKUgO7ZxduxTuVFOtoZbSFheAGpoRZbXwTNz5f350ouLn3dZV1WHV
         rnVHPm6OmGwGRPSkSdhOenzO+Z5aEebfnbMCviJfmgZWC0of40BI1PHu2FklTvCachRd
         iQUiUK6p9P+aFFvfbiz7lRCrOSYFobFv8g85MzhMACgrjDZ2CzIHhmY/oflRvvhsvYlo
         pPtg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1795559103; x=1796163903;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:to:from:x-gm-gg:x-gm-message-state:from:to
         :cc:subject:date:message-id:reply-to:content-type;
        bh=hbE4Q7q4TrDtAfvA5QvxISTriMkp04Un/AU1m5jHodE=;
        b=Xphzi89IJ8Ly6iq1vjecr1yIiYLbtYjfP00ypyUlLTc1vFotwbdv1KkIxcGNF1fAjb
         pbR0n4cJANmAQlVPA1SgSbAFAXZKTkFYqMGNRaljVCAnyGho3hBqMn56929YrIeoWcJo
         cVp4WdI1UeiV+EInpqpIvUNIbT3FC1LFhtAKgUWFo2BObg/vPaBvuIlpQvhqEOu05/Xk
         Bh2rchIh7gDPuG84aDH8MASZqblMe25Hpi4KzECsXJbe/ZLKq8YMY6VzrJPmHgdZ6OyW
         5rbV+y6Q7WMwGL5pbYydaxKILBAJ1/Ktmaycn2/M5L+AV6cBWHPn67ad6hdGLzoJsKOy
         mFwg==
X-Forwarded-Encrypted: i=1; AL+hErGmsix0rIFLIzXPyUDwGgZiYDtG7JoowzKYMTmUTB+UtaR6VAPuDmj+8U4xhq6AAsNmCT+s7gGuF5gs@vger.kernel.org
X-Gm-Message-State: APuU4Z+/iKaeRYJ0oC59kULiqx0pr//5RV9J0xog4Si0walbyD0dWnvN
	a6DVHu8rZDhY5ypVYbP6f2g0fa58Utvv8xHFiSN/YvTwDrAP87F6DBiA
X-Gm-Gg: AZFdTZfrE0kH/XrFkRMVLEA21jzrua0gwCHRjCNiDPCy/6YVFCme/FML/xlZ3oZAA2V
	PPrZDKQtd057QPVt/XYfe3mQxFPUgiidFqB3Cy314WQQRcmcno3FTXdO8e+D5Dp4gvzHMG9BrY9
	14aL0a1TIa5TikmfcnAQ6+6XnfIjdP4oYH7tBWdZGnZ1ITMwZLJKlSTI+1wEwGM/fT6S23x5X3C
	otmCcXU0F3y50RwyOJbeOO4ucYn3cfs91Io3N9aVypVxLTcytlm/aLgH+aTd7UQo/NqWIrmFedo
	MOg0mKGxxTO9uuJ9Rx/9u9cR2nMeRTJSzPlKX1NaCtkc0T8yMr6hg9rK3PaoR51N+w6DF1VaCmk
	8WQKfwaTxsG5pT834AuOhHEkAkQoKpwgKyDkTM1GFKXWRawPgOzssJ7BN5nd5OU5TvwuhTcflDh
	5A7aKvmebbO6Pn+ak1S1S77h0+xtQ0hv0A7kcwzEjQzoa1QrJnyZ/GvrmTMoDflB5eR3079Zrk4
	DDXqxBX0P84hq5U0ihE6JDmxjwfBTHQXeeUSE861lyILNhwKQ+jH7zUxzw3kqMCzAkvo/B4Hp5d
	oyePlK9igjuW/yyBSy42Mysq+xrDTvm4ux7gaGiZ8PVDGHWKviVM4EoZyySGIBYHLOUKf2UP4Vz
	5jTU=
X-Received: by 2002:a05:6000:2f87:b0:4a3:7954:ac75 with SMTP id ffacd0b85a97d-4abb2910fb2mr29043091f8f.37.1795559103518;
        Tue, 24 Nov 2026 14:25:03 -0800 (PST)
Received: from Ansuel-XPS24.localdomain ([87.13.246.159])
        by smtp.googlemail.com with ESMTPSA id ffacd0b85a97d-4ab69bf630esm31125711f8f.16.2026.11.24.14.25.01
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 24 Nov 2026 14:25:03 -0800 (PST)
From: Christian Marangi <ansuelsmth@gmail.com>
To: Vinod Koul <vkoul@kernel.org>,
	Neil Armstrong <neil.armstrong@linaro.org>,
	Manivannan Sadhasivam <mani@kernel.org>,
	Rob Herring <robh@kernel.org>,
	Krzysztof Kozlowski <krzk+dt@kernel.org>,
	Conor Dooley <conor+dt@kernel.org>,
	Christian Marangi <ansuelsmth@gmail.com>,
	Lorenzo Bianconi <lorenzo@kernel.org>,
	linux-phy@lists.infradead.org,
	devicetree@vger.kernel.org,
	linux-kernel@vger.kernel.org,
	John Crispin <john@phrozen.org>
Subject: [PATCH v5 1/3] dt-bindings: phy: airoha: Document support for AN7583 USB PHY
Date: Tue, 24 Nov 2026 23:24:31 +0100
Message-ID: <20261124222452.219832-2-ansuelsmth@gmail.com>
X-Mailer: git-send-email 2.55.0
In-Reply-To: <20261124222452.219832-1-ansuelsmth@gmail.com>
References: <20261124222452.219832-1-ansuelsmth@gmail.com>
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

Add documentation for Airoha AN7583 USB PHY that describe the USB PHY
for the USB controller.

Airoha AN7583 SoC support a maximum of 2 USB port. The USB 2.0 mode is
always supported. The USB 3.0 mode is optional and depends on the Serdes
mode currently configured on the system for the relevant USB port.

To correctly calibrate, the USB 2.0 port require correct value in
"airoha,usb2-monitor-clk-sel" property. Both the 2 USB 2.0 port permit
selecting one of the 4 monitor clock for calibration (internal clock not
exposed to the system) but each port have only one of the 4 actually
connected in HW hence the correct value needs to be specified in DT
based on board and the physical port. Normally it's monitor clock 1 for
USB1 and monitor clock 2 for USB2.

To correctly setup the Serdes mode attached to the USB 3.0 mode, a phys
property is required with the phandle pointing to the correct Serdes port
provided by the SCU node. Providing the phys property is optional if USB
3.0 is not used.

Signed-off-by: Christian Marangi <ansuelsmth@gmail.com>
---
 .../bindings/phy/airoha,an7583-usb-phy.yaml   | 133 ++++++++++++++++++
 1 file changed, 133 insertions(+)
 create mode 100644 Documentation/devicetree/bindings/phy/airoha,an7583-usb-phy.yaml

diff --git a/Documentation/devicetree/bindings/phy/airoha,an7583-usb-phy.yaml b/Documentation/devicetree/bindings/phy/airoha,an7583-usb-phy.yaml
new file mode 100644
index 000000000000..f1a5d83e8968
--- /dev/null
+++ b/Documentation/devicetree/bindings/phy/airoha,an7583-usb-phy.yaml
@@ -0,0 +1,133 @@
+# SPDX-License-Identifier: GPL-2.0-only OR BSD-2-Clause
+%YAML 1.2
+---
+$id: http://devicetree.org/schemas/phy/airoha,an7583-usb-phy.yaml#
+$schema: http://devicetree.org/meta-schemas/core.yaml#
+
+title: Airoha AN7583 SoC USB PHY
+
+maintainers:
+  - Christian Marangi <ansuelsmth@gmail.com>
+
+description: >
+  The Airoha AN7583 SoC USB PHY describes the USB PHY for the USB controller..
+
+  Airoha AN7583 SoC support a maximum of 2 USB port. The USB 2.0 mode is
+  always supported. The USB 3.0 mode is optional and depends on the Serdes
+  mode currently configured on the system for the relevant USB port.
+
+  On Airoha AN7583 there is an unified PHY implementation where a single
+  PHY provide support for both the 2 USB 2.0 port and
+  optionally one 3.0 USB.
+
+properties:
+  compatible:
+    const: airoha,an7583-usb-phy
+
+  reg:
+    items:
+      - description: phy register
+      - description: ana register
+      - description: pma register
+      - description: dig register
+
+  reg-names:
+    items:
+      - const: phy
+      - const: ana
+      - const: pma
+      - const: dig
+
+  '#address-cells':
+    const: 1
+
+  '#size-cells':
+    const: 0
+
+  usb3-phy:
+    type: object
+
+    properties:
+      phys:
+        items:
+          - description: phandle to Serdes PHY
+
+      '#phy-cells':
+        description: The cell contains the mode, PHY_TYPE_USB2 or PHY_TYPE_USB3,
+          as defined in dt-bindings/phy/phy.h.
+        const: 1
+
+    required:
+      - phys
+      - '#phy-cells'
+
+    additionalProperties: false
+
+patternProperties:
+  '^usb2-phy@[0-9a-f]+$':
+    type: object
+
+    properties:
+      reg:
+        enum: [0x0, 0x1000]
+
+      airoha,usb2-monitor-clk-sel:
+        description: Describe what oscillator across the available 4
+          should be selected for USB 2.0 Slew Rate calibration.
+        $ref: /schemas/types.yaml#/definitions/uint32
+        enum: [0, 1, 2, 3]
+
+      '#phy-cells':
+        description: The cell contains the mode, PHY_TYPE_USB2 or PHY_TYPE_USB3,
+          as defined in dt-bindings/phy/phy.h.
+        const: 1
+
+    required:
+      - reg
+      - airoha,usb2-monitor-clk-sel
+      - '#phy-cells'
+
+    additionalProperties: false
+
+required:
+  - compatible
+  - reg
+  - reg-names
+  - '#address-cells'
+  - '#size-cells'
+
+unevaluatedProperties: false
+
+examples:
+  - |
+    phy@1fac0000 {
+        compatible = "airoha,an7583-usb-phy";
+        reg = <0x1fac0000 0x1200>,
+              <0x1fa6f000 0x100>,
+              <0x1fa6e000 0x400>,
+              <0x1fa6a000 0x900>;
+        reg-names = "phy", "ana", "pma", "dig";
+
+        #address-cells = <1>;
+        #size-cells = <0>;
+
+        usb2-phy@0 {
+            reg = <0x0>;
+            airoha,usb2-monitor-clk-sel = <0>;
+
+            #phy-cells = <1>;
+        };
+
+        usb2-phy@1000 {
+            reg = <0x1000>;
+            airoha,usb2-monitor-clk-sel = <1>;
+
+            #phy-cells = <1>;
+        };
+
+        usb3-phy {
+            phys = <&serdes_phy>;
+
+            #phy-cells = <1>;
+        };
+    };
-- 
2.55.0

