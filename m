Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=209.85.128.49
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1793044289;
	b=pC6sduYm55rXZLsOwf3soRQ2SB8i6E8SLWqEV0ZKhqHWISFJR8vqD/63kBQuD5nfyANF
	 Q9SUQFZdxwqxlq22Vjs571EFOUjErYv5EsBzpd87giU5RG7F5CZeG7IO4cfIjgDaC+DRc
	 uJuggKihZoPCs8PP4uJpuP7ut5DyAFHBI36NB2CqQRzbTbvK5iQB3qiz69/923SvImqnA
	 ilQAecLKVNf7D5iVY4vOfMashHhSXNtemf1XoBKO+fLUyi8+KK2o8JbTkCs4OA63JCNZQ
	 FVQfucInoEcyej40P0oY0Y4puJlC2SN65N0rXoJVsC5zuekO2/HpezAPqSTq8r6JEvA==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1793044289;
	h=DMARC-Filter:Received:DKIM-Signature:X-Google-DKIM-Signature:
	 X-Forwarded-Encrypted:X-Gm-Message-State:X-Gm-Gg:X-Received:Received:
	 From:To:Cc:Subject:Date:Message-ID:X-Mailer:In-Reply-To:References:
	 MIME-Version:Content-Type:Content-Transfer-Encoding;
	bh=RZowu2CZSoWrtBGCqSS1fXlX08mpdG8XiB36UcwU8S8=;
	b=k21jsF3rSZuUaNrv/mdLdw+uoSHv9/JmJJ0NUOhfeCmxSfFVLdKwHmVPU5Cx4uu2d9Ih
	 zfg4Bl6fh5dYwrSagizMMP2it/MP1wpl0F1O01DJmo8rKMJC5WKH2sH3/t2eX/MoFZDOM
	 lPpBLlBa1n0RCm54/KymWbdOnrWnU47bZPGioTRqXT9Dy3JoQYfcbL34Bmy2Rw/NkbUgt
	 W5un5QWIoSxHhyNEgsY8z6nOfOrG/3i8rHpdrAjGO0T2vxqCW0SKiJKbYpgdnceK+3zmk
	 Gw1Ofi727QFH6n7BqWZ6yHSsexUEWoTPcAmQ7ffJ6tASe+wiPxnMJteFRC2cNkJV4/Q==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=gmail.com;
	spf=pass smtp.mailfrom=gmail.com;
	dkim=pass header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20251104 header.b=GJj+EOMe;
	arc=none smtp.remote-ip=209.85.128.49
Received: from mail-wm1-f49.google.com (mail-wm1-f49.google.com [209.85.128.49])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 272A6606A32C
	for <devicetree@vger.kernel.org>; Mon, 26 Oct 2026 19:51:27 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org 272A6606A32C
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key, unprotected) header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20251104 header.b=GJj+EOMe
Received: by mail-wm1-f49.google.com with SMTP id 5b1f17b1804b1-4a3517554f7so23184285e9.2
        for <devicetree@vger.kernel.org>; Mon, 26 Oct 2026 12:51:27 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1793044286; x=1793649086; darn=vger.kernel.org;
        h=content-transfer-encoding:content-type:mime-version:references
         :in-reply-to:message-id:date:subject:cc:to:from:from:to:cc:subject
         :date:message-id:reply-to:content-type;
        bh=RZowu2CZSoWrtBGCqSS1fXlX08mpdG8XiB36UcwU8S8=;
        b=GJj+EOMeAgyR3cQmT8Uu/sQpyLca+gU+lWlclg67e8kbtkVYTrhnSge8YR+D7poqvw
         PET7XQV5Jy6gG3Zsi2sFqpILlqZF8xsLwYLurJD+mZwCbOXZXqjWljZ24wXN53AVe2Ps
         o2ztpckza7lfbzt2YCmDcj5+SU3M0bimYQVPPI6VOuF96Zl8vgxq/fpI9oc+TRai0Jtl
         gmXd17KKHCRC/gqEltyxYIbDnY6Nz6ziGBxnakjhu04L+4xxbridpQysQOsq/y2tbduX
         nfZsYZ70S2LI2pRPydbILyQe/EfVtULkWsj9iD4J2eupTHLiLAmiCHmwu80rWmT7dW8E
         wVHQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1793044286; x=1793649086;
        h=content-transfer-encoding:content-type:mime-version:references
         :in-reply-to:message-id:date:subject:cc:to:from:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=RZowu2CZSoWrtBGCqSS1fXlX08mpdG8XiB36UcwU8S8=;
        b=qJ/Xka2YS9vrLVULqXiBb5mYj9SY8VJT9kUEx3wY/sqJjJpBA44OBcLpl7Zg5gDU4Y
         YHaLIytlUkbf3XPmw0Dc1l7XREKZfEmJ/h0yrjcMKGwd4Ltm/Y3jSNetuk0F/O55sX7B
         MjewIvq9ZY0SPI4jqgWyU/XGocWaK6jjC+oAR2ET87FbOTgcc7o7+rgVltxX/rzJfLhu
         f6lEmuEyHtCPXmctqUfrrg8Os6PoiC1v62d7WE//ypdlYeb88cgdCAqjirDbwU5m1pTp
         e4psSU/U4W3MAtsjTwzmEdDzhysxhScYGrVqYC3cHhuWqUn9HTCLCMWxx0N2UfZUvmjP
         1MXQ==
X-Forwarded-Encrypted: i=1; AKwUvBwTk8Rw2I/UHdDmsgsvPV7wxY7BmYOCvwWhSe2bF/SNZhydOdKkK1TMW9SwAGC/xxgnVAp2M66QCPd1@vger.kernel.org
X-Gm-Message-State: AFq9FYImghXqw6qRYNw+HbdptG6yhNqXUgRVm3aw4W8w0THHvu8MXGzP
	fIxoFtcKlAhAMx+egDLssTK1LRGIuKhsgxbJPM37RHm33iUBYSuE+tJ5
X-Gm-Gg: AYBFou1+n01HUhgbMY+Cg0bCYrBN6vLOpk7cUJq8qUfb6cpQ8RG93yvtMgjtEJTcuYr
	jXUv06Z+x8T/l1BgnRyhXPWJwtEHIkhINvfjpuCiGxI8BR0G8u8bpLLf+jJQTwshjpuyxy0L29c
	3WqjU96C5hxvRisb8Tl4A/FIixv14cAbPoEWuJl6VP44nDoaEK7DmexczbTT14ZmTkUQ4g7KXBl
	4LSflTyuc9X3DfsuSLqlviUPakU15X6gSuElKP4taKR5uUGBp5aT0edMgdPNRaGkYDwBHIX0x+A
	v6DYzxVLcd3JYbUPMyfPnTZn2KPcjF5GpicmyeaQQ9bky/en2nYVj80amS7wqqdJMvzCwbjpbKi
	O/R/gQkBy/i9RoVHMT5XFeusvb3r8XxsXltd68eIYyJEFfgJEjUH46m1lhZfwZA8S6Ppqu4u73p
	qV8bd5JWT8AoMbTkH2M3+rWr0uVAboztNt0rnjaE6mk536uEvJjLRgKWsoVRFk3tEa/HTs7VcQm
	90vh13zB4sA7gSo/7jbBXLzvYccgWn/bPAAhsOnis51vnnVuRi0lG5u5tv9CkA+zX8eHNCG8TZi
	xjFir7Xv3MBdOoWjv5d3GqAFDyuNXtvYAfJ6g88Wo3PmizUw5s4poPC1T5zYthB4HQj0pFE1Pe+
	O14jJDyDFmBhygO2+BhMO4lo4IcB5nKlWDK/1mYFHW0z/NJBbVgrS7pV5xnISqTRG2HRXzV1Cke
	T4sba3
X-Received: by 2002:a05:600c:1c03:b0:4a6:42cc:bf65 with SMTP id 5b1f17b1804b1-4a642ccc7b2mr89258385e9.17.1793044286305;
        Mon, 26 Oct 2026 12:51:26 -0700 (PDT)
Received: from localhost.localdomain (dynamic-2a00-1028-8388-a84e-8ce1-bbf6-5949-b0f3.ipv6.o2.cz. [2a00:1028:8388:a84e:8ce1:bbf6:5949:b0f3])
        by smtp.gmail.com with ESMTPSA id ffacd0b85a97d-48e3ebc3c5bsm18877654f8f.9.2026.10.26.12.51.24
        (version=TLS1_3 cipher=TLS_CHACHA20_POLY1305_SHA256 bits=256/256);
        Mon, 26 Oct 2026 12:51:25 -0700 (PDT)
From: Josef Schlehofer <pepe.schlehofer@gmail.com>
To: Lee Jones <lee@kernel.org>,
	Pavel Machek <pavel@kernel.org>,
	Rob Herring <robh@kernel.org>,
	Krzysztof Kozlowski <krzk+dt@kernel.org>,
	Conor Dooley <conor+dt@kernel.org>
Cc: =?UTF-8?q?Pali=20Roh=C3=A1r?= <pali@kernel.org>,
	=?UTF-8?q?Marek=20Beh=C3=BAn?= <kabel@kernel.org>,
	Andy Shevchenko <andy@kernel.org>,
	Rong Zhang <i@rong.moe>,
	=?UTF-8?q?Uwe=20Kleine-K=C3=B6nig?= <u.kleine-koenig@baylibre.com>,
	Griffin Kroah-Hartman <griffin@kroah.com>,
	linux-leds@vger.kernel.org,
	devicetree@vger.kernel.org,
	linux-api@vger.kernel.org,
	linux-kernel@vger.kernel.org
Subject: [PATCH v4 1/2] dt-bindings: leds: Add CZ.NIC Turris 1.x LED controller
Date: Mon, 26 Oct 2026 20:51:19 +0100
Message-ID: <20261026195120.12759-2-pepe.schlehofer@gmail.com>
X-Mailer: git-send-email 2.54.0
In-Reply-To: <20261026195120.12759-1-pepe.schlehofer@gmail.com>
References: <20261026195120.12759-1-pepe.schlehofer@gmail.com>
X-Mailing-List: devicetree@vger.kernel.org
List-Id: <devicetree.vger.kernel.org>
List-Post: <mailto:devicetree@vger.kernel.org>
List-Help: <mailto:devicetree+help@vger.kernel.org>
List-Subscribe: <mailto:devicetree+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:devicetree+unsubscribe@vger.kernel.org>
List-Owner: <mailto:devicetree+owner@vger.kernel.org>
Precedence: list
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit

From: Pali Rohár <pali@kernel.org>

Add a binding for the LED controller on the front panel of the CZ.NIC
Turris 1.x routers. The LEDs are controlled by the firmware of the
CZ.NIC CPLD, which is memory mapped on the local bus.

The turris1x.dts device tree, which is part of the mainline kernel since
v6.0, already references this compatible string.

Signed-off-by: Pali Rohár <pali@kernel.org>
Co-developed-by: Josef Schlehofer <pepe.schlehofer@gmail.com>
Signed-off-by: Josef Schlehofer <pepe.schlehofer@gmail.com>
Reviewed-by: Rob Herring (Arm) <robh@kernel.org>
---

Notes:
    Changes in v4, by Josef Schlehofer:
    - add Rob's Reviewed-by
    - move the Cc: line out of the commit message (Andy)
    
    v3: https://lore.kernel.org/r/20260928111907.72592-2-pepe.schlehofer@gmail.com/
    
    Changes in v3, by Josef Schlehofer:
    - drop the file name and "binding" from the subject
    - describe the hardware rather than the driver
    - fix example indentation and use the merged turris1x.dts node
    - set Josef Schlehofer as the binding maintainer
    - constrain color to LED_COLOR_ID_RGB
    - list the required controller and LED properties
    - describe the register range and the LED order in the reg properties,
      and put the SPDX expression in parentheses
    - pass dt_binding_check with dtschema 2026.9
    
    checkpatch asks whether MAINTAINERS needs updating for the new file.
    The MAINTAINERS entry that covers it is added in 2/2, together with
    the driver.

 .../bindings/leds/cznic,turris1x-leds.yaml    | 132 ++++++++++++++++++
 1 file changed, 132 insertions(+)
 create mode 100644 Documentation/devicetree/bindings/leds/cznic,turris1x-leds.yaml

diff --git a/Documentation/devicetree/bindings/leds/cznic,turris1x-leds.yaml b/Documentation/devicetree/bindings/leds/cznic,turris1x-leds.yaml
new file mode 100644
index 000000000000..ad7ef7015f0b
--- /dev/null
+++ b/Documentation/devicetree/bindings/leds/cznic,turris1x-leds.yaml
@@ -0,0 +1,132 @@
+# SPDX-License-Identifier: (GPL-2.0-only OR BSD-2-Clause)
+%YAML 1.2
+---
+$id: http://devicetree.org/schemas/leds/cznic,turris1x-leds.yaml#
+$schema: http://devicetree.org/meta-schemas/core.yaml#
+
+title: CZ.NIC Turris 1.x LED controller
+
+maintainers:
+  - Josef Schlehofer <pepe.schlehofer@gmail.com>
+
+description:
+  The front panel of the CZ.NIC Turris 1.x routers carries eight RGB LEDs
+  driven by the CPLD firmware running on a Lattice FPGA. The five LAN LEDs
+  share one set of colour registers, so they cannot be given different
+  colours or brightness from each other. The CPLD firmware is open source
+  and available at
+  https://gitlab.nic.cz/turris/hw/turris_cpld/-/blob/master/CZ_NIC_Router_CPLD.v
+
+properties:
+  compatible:
+    const: cznic,turris1x-leds
+
+  reg:
+    description:
+      CPLD address range of the LED registers. It starts at the first colour
+      register, offset 0x13 in the CPLD, and ends at 0x2f; the offsets of
+      the registers inside the range are fixed by the CPLD firmware.
+    maxItems: 1
+
+  "#address-cells":
+    const: 1
+
+  "#size-cells":
+    const: 0
+
+patternProperties:
+  "^multi-led@[0-7]$":
+    type: object
+    $ref: leds-class-multicolor.yaml#
+    unevaluatedProperties: false
+
+    properties:
+      color:
+        const: 9  # LED_COLOR_ID_RGB
+
+      reg:
+        description:
+          Index of the LED, which is also its bit in the CPLD LED control
+          registers. 0 is WAN, 1 to 5 are LAN 5 to LAN 1, 6 is WiFi and 7 is
+          power. The CPLD source calls LEDs 1 to 5 lan1 to lan5 and the WiFi
+          LED status.
+        minimum: 0
+        maximum: 7
+
+    required:
+      - reg
+      - color
+
+required:
+  - compatible
+  - reg
+  - "#address-cells"
+  - "#size-cells"
+
+additionalProperties: false
+
+examples:
+  - |
+    #include <dt-bindings/leds/common.h>
+
+    led-controller@13 {
+        compatible = "cznic,turris1x-leds";
+        reg = <0x13 0x1d>;
+        #address-cells = <1>;
+        #size-cells = <0>;
+
+        multi-led@0 {
+            reg = <0x0>;
+            color = <LED_COLOR_ID_RGB>;
+            function = LED_FUNCTION_WAN;
+        };
+
+        multi-led@1 {
+            reg = <0x1>;
+            color = <LED_COLOR_ID_RGB>;
+            function = LED_FUNCTION_LAN;
+            function-enumerator = <5>;
+        };
+
+        multi-led@2 {
+            reg = <0x2>;
+            color = <LED_COLOR_ID_RGB>;
+            function = LED_FUNCTION_LAN;
+            function-enumerator = <4>;
+        };
+
+        multi-led@3 {
+            reg = <0x3>;
+            color = <LED_COLOR_ID_RGB>;
+            function = LED_FUNCTION_LAN;
+            function-enumerator = <3>;
+        };
+
+        multi-led@4 {
+            reg = <0x4>;
+            color = <LED_COLOR_ID_RGB>;
+            function = LED_FUNCTION_LAN;
+            function-enumerator = <2>;
+        };
+
+        multi-led@5 {
+            reg = <0x5>;
+            color = <LED_COLOR_ID_RGB>;
+            function = LED_FUNCTION_LAN;
+            function-enumerator = <1>;
+        };
+
+        multi-led@6 {
+            reg = <0x6>;
+            color = <LED_COLOR_ID_RGB>;
+            function = LED_FUNCTION_WLAN;
+        };
+
+        multi-led@7 {
+            reg = <0x7>;
+            color = <LED_COLOR_ID_RGB>;
+            function = LED_FUNCTION_POWER;
+        };
+    };
+
+...
-- 
2.54.0 (Apple Git-157)

