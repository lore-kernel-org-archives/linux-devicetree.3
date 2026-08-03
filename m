Received: from mail-ot1-f53.google.com (mail-ot1-f53.google.com [209.85.210.53])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 0DBC2395D8B
	for <devicetree@vger.kernel.org>; Mon,  3 Aug 2026 05:15:38 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.210.53
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1785734142; cv=none; b=IMSaSVw9H52EIHEVIwvoRiSO+grCo6ydSCLXhVMXYxc770l6S688PczKWMgrnYUaglQe6FkVFBrWUeD9P58rIabmVrf46UhlATIojeDhrtCdo/1rjdhhhqVFHR6ZEBA0i8RczSph5dgy8cmPoA80OjxM18iExUAfV13uz/NusgI=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1785734142; c=relaxed/simple;
	bh=2SOkuuUqffJAqXcEW7ZDhEaFHvF0SZKllJC1Nh5E8zo=;
	h=From:Date:Subject:MIME-Version:Content-Type:Message-Id:References:
	 In-Reply-To:To:Cc; b=LUjH498BPYzAR/xRtcsicZwiyKPxNgCpdMNdc3d0b8T+t/2K0cJy9IgxcN3nZnv54Juxu454OEMk4S7xC5nMsAe6sw1ePKBebynrxYxnhy1uIKarwgK25wFVMRHtltfOdrwm53KlzSKlJsBeUNxoYhIIEAYZ2JxN98MqQ91r27Y=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=XiIWB36y; arc=none smtp.client-ip=209.85.210.53
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="XiIWB36y"
Received: by mail-ot1-f53.google.com with SMTP id 46e09a7af769-7ee37dc91f5so1801401a34.3
        for <devicetree@vger.kernel.org>; Sun, 02 Aug 2026 22:15:38 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1785734138; x=1786338938; darn=vger.kernel.org;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :content-type:mime-version:subject:date:from:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=GTwjTV5MzEj5mt/lgWMCGvinpE29xZysk84NZ5krcS8=;
        b=XiIWB36y+ctp2h/vcBxuJgrrd7pGCplgyG69UMP9K2TEDFvjAsmcU/8p0nlafeR6tx
         q8uf5vA2LFoysoiCU7Dh/atuC74pkqQgJf/9982ta7Imms7jkD84Xm1F0L+YJ64PLrMK
         m/ISqcRZoQA3bucxpfW70OSOkYXg7MkZMeDVULK/UH7rztYYXPoYehziikXwrY9dMgoX
         oV7ppK5H1T/aQPhxB1kKwGCvGwDgsFbRtHT+5nonuPQqMTOOBicASamXYyLUAFhsU/Ap
         pyh8JCTS9kdLeLMfaKFhTCy/n6zcO5r+NEgl66x4zNdnNvg1XMiyjQIEUBSTilhbTaq0
         YINA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1785734138; x=1786338938;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :content-type:mime-version:subject:date:from:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=GTwjTV5MzEj5mt/lgWMCGvinpE29xZysk84NZ5krcS8=;
        b=VJxDz3+9EyJu50fJgM5B34KXt5qgvl4vJZtQZu0WmZlE9ReYkNGGR0BO4BRwUCKzgF
         fyh1G5wX6HyL+pDq+nbsOwbLLVVHK7h64QidmSRCylEbSHkZ3FwMVZpiHLVAWwswZmOw
         OLZ0Iaa66uctlLLRIDNmj0DgFwY6R4mdyM/j+HLTmXMSwvnCSq/l4UmU7W8IUwIG+fMz
         0VkfYvK+aYt+u6d8eZsDE8sW92lnDVmJe/Y3+8kMc7RhKS1u7V+nL6cbb33Qmu6cCa6J
         nxN36idtBFBlDliTHCC7JdIDFPEHsNmr3q6w8XrcM0q4jeKauI4k1MQcsv2hP18k8xcZ
         iC3A==
X-Forwarded-Encrypted: i=1; AHgh+RoJcycoA0fnnZoixHpDJPY6DK2rJQJuWDFvcqzMrBkhXKC5GMx6B0m+VgCh2Z3hcbnsY1qJbdlsOc+h@vger.kernel.org
X-Gm-Message-State: AOJu0YxUtpnIqn1UDdRJpT1ej++NRI5XK+JfO7IyOmqtCYcinVcr6uRT
	/VqCW2rFXBbZFbOxwGHD4F9C9janqyE30Sia91hYWuaWs3t6Ao0CTJFU
X-Gm-Gg: AR+sD11Ezhn3zf8S1VQkGpjjcvOMR8fBbjjowza/o6R0+GGgs9m4OWdbN6RocaEP37r
	2TWPd9wJ66f2iq9CYfPv/gqyuKACIJzbeftOePEF4HCcZ0L9iOS+D8YjlyvAjdxLtrYrmPRUM6B
	RZxa5JNttjEv7J8bWi3exyZn7DOSe9hj8ANcQzlMC2tWIyIFkiIrJf0XfpRvP18lR9du4uI1le8
	b49GUnX2mv523MqLYSTBpxW6Uw4x0oenyljjDNXZDD8by2mS03qEe/du1W85FBE5KqShGd3M8Rw
	HIX51aNoCO1XyDVsq5VRLrL1q3rOJ8F0aokhIOxgAyFjPgW8ei/3X6xu5QPDn9DCzy9hJ3c8uBw
	DAMxtIKxdsumPbLeO1cieDXd2EllqPP8VLV5+Tj3CW0pdwd6ZnNI4ipqFmfsD5U/aTAL8SoQIBD
	7Py5HmkI+2gFWTx66QAtBhzzJCP8HOPN//TKLKBUZiy/QErpU/bKhHaM8Bg21JOpuQyRKCUBIKl
	+aLYYeHtWvSmo0P4O9TlBy/M+wCmsYfUAn2O0x4PWE3doPwiCN2mNvoxvQMmQtOTnKWqPeM40nC
	bY4PHuSpQ9oVBiaBUOu2tf7ThCDWT9dPg2u3A6PLO5nDPIDil17LIrq/HLjyoEN19WwpbbSeTg/
	LgZLPTZ9rRYQmH71i
X-Received: by 2002:a05:6830:4489:b0:7e9:cddb:142a with SMTP id 46e09a7af769-7f196bd63a9mr15354948a34.7.1785734137863;
        Sun, 02 Aug 2026 22:15:37 -0700 (PDT)
Received: from [127.0.1.1] (184-96-154-59.hlrn.qwest.net. [184.96.154.59])
        by smtp.gmail.com with ESMTPSA id 46e09a7af769-7f18f07a5e3sm6787108a34.15.2026.08.02.22.15.36
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Sun, 02 Aug 2026 22:15:37 -0700 (PDT)
From: James Hilliard <james.hilliard1@gmail.com>
Date: Sun, 02 Aug 2026 23:14:21 -0600
Subject: [PATCH 11/21] dt-bindings: net: x-powers: add AC300 EPHY control
Precedence: bulk
X-Mailing-List: devicetree@vger.kernel.org
List-Id: <devicetree.vger.kernel.org>
List-Subscribe: <mailto:devicetree+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:devicetree+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20260802-submit-acx00-of-dynamic-v1-v1-11-0a53cd9e21cc@gmail.com>
References: <20260802-submit-acx00-of-dynamic-v1-v1-0-0a53cd9e21cc@gmail.com>
In-Reply-To: <20260802-submit-acx00-of-dynamic-v1-v1-0-0a53cd9e21cc@gmail.com>
To: Andrew Lunn <andrew+netdev@lunn.ch>, 
 "David S. Miller" <davem@davemloft.net>, Eric Dumazet <edumazet@google.com>, 
 Jakub Kicinski <kuba@kernel.org>, Paolo Abeni <pabeni@redhat.com>, 
 Rob Herring <robh@kernel.org>, Krzysztof Kozlowski <krzk+dt@kernel.org>, 
 Conor Dooley <conor+dt@kernel.org>, Chen-Yu Tsai <wens@kernel.org>, 
 Jernej Skrabec <jernej.skrabec@gmail.com>, 
 Samuel Holland <samuel@sholland.org>, 
 Andre Przywara <andre.przywara@arm.com>, 
 Richard Genoud <richard.genoud@bootlin.com>, 
 Maxime Ripard <mripard@kernel.org>, 
 Alexandre Torgue <alexandre.torgue@foss.st.com>, 
 Giuseppe Cavallaro <peppe.cavallaro@st.com>, 
 Jose Abreu <joabreu@synopsys.com>, 
 Maxime Chevallier <maxime.chevallier@bootlin.com>, 
 Maxime Coquelin <mcoquelin.stm32@gmail.com>, Andrew Lunn <andrew@lunn.ch>, 
 Heiner Kallweit <hkallweit1@gmail.com>, 
 Russell King <linux@armlinux.org.uk>, 
 Saravana Kannan <saravanak@kernel.org>, Lee Jones <lee@kernel.org>, 
 Heiko Stuebner <heiko@sntech.de>
Cc: netdev@vger.kernel.org, devicetree@vger.kernel.org, 
 linux-arm-kernel@lists.infradead.org, linux-sunxi@lists.linux.dev, 
 linux-kernel@vger.kernel.org, linux-stm32@st-md-mailman.stormreply.com, 
 mfd@lists.linux.dev, linux-rockchip@lists.infradead.org, 
 James Hilliard <james.hilliard1@gmail.com>
X-Mailer: b4 0.15.2

The AC300 companion IC exposes the Fast Ethernet PHY control registers
through a separate non-PHY Clause 22 address. The manual defines the
control address as the link-PHY address plus 16, giving address ranges
of 16-23 and 0-7 respectively.

Describe the control endpoint, its required VCC1 supply, its 24, 25 or
27 MHz input clock, interface mode and calibration cell.

Signed-off-by: James Hilliard <james.hilliard1@gmail.com>
---
 .../bindings/net/x-powers,ac300-ephy-ctl.yaml      | 77 ++++++++++++++++++++++
 1 file changed, 77 insertions(+)

diff --git a/Documentation/devicetree/bindings/net/x-powers,ac300-ephy-ctl.yaml b/Documentation/devicetree/bindings/net/x-powers,ac300-ephy-ctl.yaml
new file mode 100644
index 000000000000..a6634fcfafd4
--- /dev/null
+++ b/Documentation/devicetree/bindings/net/x-powers,ac300-ephy-ctl.yaml
@@ -0,0 +1,77 @@
+# SPDX-License-Identifier: (GPL-2.0-only OR BSD-2-Clause)
+%YAML 1.2
+---
+$id: http://devicetree.org/schemas/net/x-powers,ac300-ephy-ctl.yaml#
+$schema: http://devicetree.org/meta-schemas/core.yaml#
+
+title: X-Powers AC300 Ethernet PHY control interface
+
+maintainers:
+  - James Hilliard <james.hilliard1@gmail.com>
+
+description:
+  The AC300 Fast Ethernet PHY has a separate control interface accessed as a
+  non-PHY Clause 22 device. Its address is 16 plus the address of the link PHY.
+
+properties:
+  compatible:
+    const: x-powers,ac300-ephy-ctl
+
+  reg:
+    minimum: 16
+    maximum: 23
+
+  clocks:
+    maxItems: 1
+    description:
+      AC300 input clock. Its configured rate must be 24, 25, or 27 MHz and
+      determines the corresponding EPHY_CLK_SEL value.
+
+  vcc1-supply:
+    description:
+      3.3 V supply for the AC300 I/O, bandgap, Ethernet PHY analog front end,
+      and internal digital LDO
+
+  nvmem-cells:
+    maxItems: 1
+    description:
+      SoC SID cell containing the Ethernet PHY calibration value written to
+      the AC300 BGS_EFFUSE field after adding 3 modulo 16, as prescribed by
+      the vendor initialization sequence.
+
+  nvmem-cell-names:
+    const: calibration
+
+  phy-mode:
+    enum:
+      - mii
+      - rmii
+
+required:
+  - compatible
+  - reg
+  - clocks
+  - vcc1-supply
+  - nvmem-cells
+  - nvmem-cell-names
+  - phy-mode
+
+additionalProperties: false
+
+examples:
+  - |
+    mdio {
+        #address-cells = <1>;
+        #size-cells = <0>;
+
+        ethernet-phy-control@10 {
+            compatible = "x-powers,ac300-ephy-ctl";
+            reg = <0x10>;
+            clocks = <&pwm 5>;
+            vcc1-supply = <&reg_3v3>;
+            nvmem-cells = <&ephy_calibration>;
+            nvmem-cell-names = "calibration";
+            phy-mode = "rmii";
+        };
+    };
+...

-- 
2.53.0

