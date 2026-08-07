Received: from mail-oo1-f54.google.com (mail-oo1-f54.google.com [209.85.161.54])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 3BFA9394462
	for <devicetree@vger.kernel.org>; Fri,  7 Aug 2026 04:51:44 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.161.54
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1786078311; cv=none; b=D8Mo+YLbNKioBLNMWzX1WfIEk4XvKWwsynZdE2BssFuld6nuifRQv072ulY0mcxNG+0XsK46a4T8PeLR52n12j/CrkDBc/9fAx6qxXJEy70Ib+4pFYz0/qMxDwcN2LFUXRwd5Ug1sFyVbxVOeeK91zqdctCEyDlStTx6UGa1FZU=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1786078311; c=relaxed/simple;
	bh=akgH7FdSu8hkxoqBxRW5GrRYagY+QZDl3N0wKNP3Em8=;
	h=From:Date:Subject:MIME-Version:Content-Type:Message-Id:References:
	 In-Reply-To:To:Cc; b=rDfRbhe1sUQVsSmal1T8KG89+t1VAI76/YvOoFTPZo83/VeOQRRUOZfu2jm+jdK6/eZ2GjuDP88KdYo2LxDTA6LJHxeb2AP6MImIiE7D0LxGpqp0iN8NGA+G0q4SAxn8V1yiG2t3qbzvZl4beGFeq5BWg7km4i1t6DarRSsl3go=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=FVrsIXl6; arc=none smtp.client-ip=209.85.161.54
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="FVrsIXl6"
Received: by mail-oo1-f54.google.com with SMTP id 006d021491bc7-6aec68b03e2so729071eaf.3
        for <devicetree@vger.kernel.org>; Thu, 06 Aug 2026 21:51:42 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1786078299; x=1786683099; darn=vger.kernel.org;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :content-type:mime-version:subject:date:from:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=+3lkDhLHoHy7Deukicju73PIuJo/3t9WiJOLY5QufbM=;
        b=FVrsIXl6OE9cuNfhHiseBY+FKmPwv7vKVL1xDapMz18tzSQKKWaEJfIOJgj5pV8qFB
         aM7MK092m7Gjy4UvnxKN0j6T7KwN/W6GFqN0prKcOV/j6AdcmXW5LZvDEAepzpOcsF4E
         H1ycg9blekSm06NNQvIXR9U5IMBoA6Zx0e2xM3QIR4cJulyqkCJkpU03x3yuVWhrVphH
         AKneDsx5xdNdyQHyKwjGtdEsw/9+ChzER2cH6tGaQPCP7hc+gT91AeW/dWzh711zuh5o
         VFrkt58GSNNiFbEo0gWyEhaQ/OMuQA683aFsyHnkCmbl5I0yDOMemgjV+cC6V5PHdEhh
         WEkw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1786078299; x=1786683099;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :content-type:mime-version:subject:date:from:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=+3lkDhLHoHy7Deukicju73PIuJo/3t9WiJOLY5QufbM=;
        b=eeMEYj/4zFAneflDlsDrkPuzn7oU2FJXrK3gZpQdph49KKB4MnbvAODz8KN2dtiF0q
         qDTYGU5dbkcBiR+UItGzVT4dkXHlTSQQe6AGDOLxsbwI2IXX25PGMT6s+kCx/owvL4At
         kDJA1nINh091sYG5CPQhF8gqolnS7QDlYcDTzzP8qRllSlhVNT9VHrqDGbz/t+P9Wy+g
         cbCBxxBYU2O1WotzxBmh4j7Pbi/2VkiJv21uqPoiqb0Su3t3n+JPuA7yGffRR1X5ZOPA
         cEXFR4v2+GQXmXiGFIBTi8DoSbRivxSv94Fx4RMcjs2eOXS2MDpzged6FNYdDbg6FQd8
         yopw==
X-Forwarded-Encrypted: i=1; AHgh+Rqn2fwcVxOlvh+OV/oPviWSEjZrzF8XLnEbChe8rfGRKmxlUGRGhdQpCxfY4FBJQCL1K9pLVP3aLoEA@vger.kernel.org
X-Gm-Message-State: AOJu0YwW61G1/uWFBs+gG5gPbao2TTrX4TaVxIVcyyuVNhTDcAMSiMPC
	Scu6VozVS0EU9LcID4psQqYv8JcYJkDEq36ifM39w9FCvtcY8EzmjehQ
X-Gm-Gg: AR+sD10t+Kve7Ib/e7FfAA1g5slzwFMvkxpaYFpA+WNwG/pbEwMNg4qAgJjrwuZFV0A
	aRGvfMEGIrPXfseI75U284ZRtxDptx4uaGiZQMM8LtR0z3zNTfQLzPznhWIkmg+f7g1Q3GtBouP
	ntQUJ1ApeW9xJPDPtqHNhM7g+0/dYifNQ6z9A2nNYtJJ8EvPHbTziD5QN8Z5sqQuCr3Ggmj21m1
	tk/cHFDe31sr3a4rlxZMjEatXTNlIX23b43+IE9LtH8t0b3bRJ76/BvQ9SipdMKW0NuyJMQwsGY
	Zu/Ph7RAbITOXd3UugzZx6dr6KBfwnukweFGfZNg9mfcOD7lnaGKLmf0TNydPeS84T5j9WuUhWG
	jG2eGLkvpGjUmdic1R2G+K1c4hvN3Cs6C4N0AYKYWn0mhDA/IDmCpY4cnaHlE+Y3TXtVqYFvgtL
	EGoo+BS7JF0LC13sGVVDvQkm7myjxE7b8rwEX4lT8iwiJd6yOXEKw6aX2pR4tDtiYkQb/BWVqX4
	XZwOHTnB3GwapIWIlvc4L3rg3NB9M+49cNnoEQzLaGsDvB2vfA6abHBNeDlShkeU5l0y3wq8hLe
	GshnQDKKcWibCQ17Nazkkcyki7QBbSLJuxyyZKzSJI3+xacajZWTF4DFXGBXRmcB5JepKDPBenI
	T31JHl1fOPuvnJ+ftRA==
X-Received: by 2002:a05:6820:1996:b0:6b0:1b86:fa8 with SMTP id 006d021491bc7-6b01b8625afmr4347810eaf.15.1786078298727;
        Thu, 06 Aug 2026 21:51:38 -0700 (PDT)
Received: from [127.0.1.1] (184-96-154-59.hlrn.qwest.net. [184.96.154.59])
        by smtp.gmail.com with ESMTPSA id 006d021491bc7-6b02bbbf755sm1519726eaf.2.2026.08.06.21.51.37
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 06 Aug 2026 21:51:38 -0700 (PDT)
From: James Hilliard <james.hilliard1@gmail.com>
Date: Thu, 06 Aug 2026 22:51:26 -0600
Subject: [PATCH net-next v4 1/4] dt-bindings: mfd: x-powers: Add AC200
Precedence: bulk
X-Mailing-List: devicetree@vger.kernel.org
List-Id: <devicetree.vger.kernel.org>
List-Subscribe: <mailto:devicetree+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:devicetree+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20260806-submit-acx00-of-dynamic-v1-v4-1-9bf2f7441632@gmail.com>
References: <20260806-submit-acx00-of-dynamic-v1-v4-0-9bf2f7441632@gmail.com>
In-Reply-To: <20260806-submit-acx00-of-dynamic-v1-v4-0-9bf2f7441632@gmail.com>
To: Lee Jones <lee@kernel.org>, Rob Herring <robh@kernel.org>, 
 Krzysztof Kozlowski <krzk+dt@kernel.org>, 
 Conor Dooley <conor+dt@kernel.org>, 
 James Hilliard <james.hilliard1@gmail.com>, 
 Andrew Lunn <andrew+netdev@lunn.ch>, 
 "David S. Miller" <davem@davemloft.net>, Eric Dumazet <edumazet@google.com>, 
 Jakub Kicinski <kuba@kernel.org>, Paolo Abeni <pabeni@redhat.com>, 
 Andrew Lunn <andrew@lunn.ch>, Heiner Kallweit <hkallweit1@gmail.com>, 
 Russell King <linux@armlinux.org.uk>
Cc: mfd@lists.linux.dev, devicetree@vger.kernel.org, 
 linux-kernel@vger.kernel.org, netdev@vger.kernel.org
X-Mailer: b4 0.15.2

The AC200 is an I2C-controlled mixed-signal companion IC containing
audio, video, RTC and Fast Ethernet PHY functions.

Describe the parent device, its input clock and the four package
supplies. The Ethernet PHY is represented by a PHY package on its MDIO
bus, with a phandle back to this device for access to the package control
registers, so it does not require an MFD child node.

The input clock must run at 24 or 27 MHz when the Ethernet PHY is used,
matching the rates encoded by its documented clock selector.

Signed-off-by: James Hilliard <james.hilliard1@gmail.com>
---
 .../devicetree/bindings/mfd/x-powers,ac200.yaml    | 69 ++++++++++++++++++++++
 1 file changed, 69 insertions(+)

diff --git a/Documentation/devicetree/bindings/mfd/x-powers,ac200.yaml b/Documentation/devicetree/bindings/mfd/x-powers,ac200.yaml
new file mode 100644
index 000000000000..b7e8d9bd5661
--- /dev/null
+++ b/Documentation/devicetree/bindings/mfd/x-powers,ac200.yaml
@@ -0,0 +1,69 @@
+# SPDX-License-Identifier: (GPL-2.0-only OR BSD-2-Clause)
+%YAML 1.2
+---
+$id: http://devicetree.org/schemas/mfd/x-powers,ac200.yaml#
+$schema: http://devicetree.org/meta-schemas/core.yaml#
+
+title: X-Powers AC200 mixed-signal IC
+
+maintainers:
+  - James Hilliard <james.hilliard1@gmail.com>
+
+description:
+  The AC200 is a mixed-signal companion IC containing audio, video, RTC and
+  Fast Ethernet PHY functions. Its control registers are accessed over I2C.
+
+properties:
+  compatible:
+    const: x-powers,ac200
+
+  reg:
+    maxItems: 1
+
+  clocks:
+    maxItems: 1
+    description:
+      AC200 input clock. When using the Ethernet PHY, its configured rate must
+      be 24 or 27 MHz, matching the rates encoded by the documented EPHY clock
+      selector.
+
+  ac-ldoin-supply:
+    description: 3.3 V supply for the audio-codec LDO input
+
+  ephy-vcc-supply:
+    description: 3.3 V supply for the Ethernet PHY analog front end
+
+  rtc-vcc-supply:
+    description: 3.3 V supply for the RTC
+
+  tv-vcc-supply:
+    description: 3.3 V supply for the TV encoder DAC
+
+required:
+  - compatible
+  - reg
+  - clocks
+  - ac-ldoin-supply
+  - ephy-vcc-supply
+  - rtc-vcc-supply
+  - tv-vcc-supply
+
+additionalProperties: false
+
+examples:
+  - |
+    i2c {
+        #address-cells = <1>;
+        #size-cells = <0>;
+
+        mixed-signal@10 {
+            compatible = "x-powers,ac200";
+            reg = <0x10>;
+            clocks = <&pwm 5>;
+            ac-ldoin-supply = <&reg_3v3>;
+            ephy-vcc-supply = <&reg_3v3>;
+            rtc-vcc-supply = <&reg_3v3>;
+            tv-vcc-supply = <&reg_3v3>;
+        };
+    };
+...

-- 
2.53.0

