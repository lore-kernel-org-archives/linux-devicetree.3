Received: from mail-wr2-f12.google.com (mail-wr2-f12.google.com [74.125.225.76])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 480B73D47B5
	for <devicetree@vger.kernel.org>; Thu, 10 Sep 2026 09:14:58 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=74.125.225.76
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1789031700; cv=none; b=H4UNlgseg449sTQnAXugS6GZreLDjIhQXWwL6ZFoZwXys4e6wm5FYm+LCci9G4Nk9Pv62zW0IzMYjZXPnkZxEXfz8d73DuQ1wSyX02mJa+xLAaEvxmdFHglrvYlIIrmt6hADH9Ow+jl6utLhY94chGW5wHGKS/y3d6khOAAsG/Y=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1789031700; c=relaxed/simple;
	bh=P2OqeAVCWHFS1/46fjXp/GqTmb5OLthjWFq4IcxNSrc=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version; b=qSVxIr+2K2YGG2JmbP1r7SP1NvFzA1ItXlvxWLALz8a8kzSfwNK/b0FPBJvFBaRTt8T34iQw28JRECPjflxc19iyGgzK4571gXhz1AmRVMezi3ArGevb1O6Z85NjxidzctRn9hSlMxh3uZAgpqlbjdUR7oEiAf9D0/pF9AHXDM0=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=ZxnMWR72; arc=none smtp.client-ip=74.125.225.76
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="ZxnMWR72"
Received: by mail-wr2-f12.google.com with SMTP id ffacd0b85a97d-4843c2790ccso1268239f8f.1
        for <devicetree@vger.kernel.org>; Thu, 10 Sep 2026 02:14:58 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1789031696; x=1789636496; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=6N41mPYMtwHJxcU+b3y0AU5P4+rfzOFqefvh/tO1NTI=;
        b=ZxnMWR72/gX/rO1xUmdhzOYteRXubworPwEIhaY5T7L3lDtJS3N5fXdaNFrj03HNGX
         qJbxdgZb/HEJwmmBmat9D9zcPX7lQQplVOqKTmMeqyWym3QAIRZYMxMkVZ5l17lpnfCg
         NoQj+gR3/I2M6HUg6rlLel5Bdgy6T0X2MQsP63mdOewA6vAYmhytBt2LWZ65hraoFpFW
         sU58eCrpg3qHEWiIfA/yDQHBMpd/22ml8s/Ms4BKLL3qUrZoaCwk+4gGYLjgniJJ1vRh
         YiGWYhkeJlxTi8Re0LzddI59dTSU38ArAUN0LoKjc2rnyiOWDo8xBqptAMB9RDczCzpS
         rPgw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1789031696; x=1789636496;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to:content-type;
        bh=6N41mPYMtwHJxcU+b3y0AU5P4+rfzOFqefvh/tO1NTI=;
        b=ZZzAhhA5Urwy0V8A9zhddVj5fab+z4ImBKebOYcdrtLY9oe6zEt4PGkY0+20fjiPrv
         kgMYXLRFMZ9xmASlaGGoupylBp03RN39NQAuFy71fgJT7mMDFQsnxjyQiD0MKaIk3uOT
         DOWKAMZA45ZpTjZpuUE19JiLfvNqceVkkdx93o794tkiV6F98NaoHaFN9dv7L4QjVSSN
         o7IdabLdzHRY3KVKGVw5a7lUbbuRc5DhBj4ulwWXzKA1q6/v8kOG2AZWfJFNzFMiv1Z4
         bqobJGo4ozjYhgOtDRNzVTQnINaFeEHPJSDi1mwds8B8lEiyHEjdSX4iRMRFFS93gEnf
         FBvQ==
X-Forwarded-Encrypted: i=1; AKwUvBxGSXIA/FkazHUD5JzYPqbj4rozx6V6liqdZD4qssnh7gwFx2KLUUa3wDGxB+V3WL1cTaDdGkeGw6jy@vger.kernel.org
X-Gm-Message-State: AFuF++k5v7D8Zydc912tqcYBmcWadI5nabI3UhWXFg8SVi+IaHZ10McP
	tL6hX38Y9h9CqdvlVDwWgZscRP2QEOmIbWbOKUOS4kuLKIHwFiaRKCis
X-Gm-Gg: AYBFou3SFGNBEAA0S5XO10/H6z8HYL2RWLRxkmUP2+Pb9wWf0l9eBBoX7dEtuB6uoNK
	xA9DMDBMAu584AaMF1g7hUKCGkXGUWhJlZ4aPe5kRNrwzCu/MPKaHbYEv0bUZX8lRRknK0+MG+M
	C3cBF39UOY9QvEHCjGIJw2gNZ1WgzhtdOhXcAI1Km9193x4YgAMb0s6gCEZX9lbiP8hKsvb8zc1
	8OYUQpBAxKK6Yur+8Mpx8+icpBHCEvgu5szPameIoohbzd/FrzZc9t0uxmYZaYSU3YkOXhEA2fj
	zRymdctNqTOL1mOrpy9hlDurcf1UsWQTA/9ef7NR+gdZZfcqhkHoew5cAT2jCvZzrKWUrykNu7u
	TJKq83NDdRQqKetxoZeNG1gwVHH4zxD7nziB+ywnLWxGNBeLmZg2gG6g7dIzykIb5m7+FebI32n
	kGTXBAueDHJ3uqFo8WC0JHaDrjUkrDsH0yb5KoGm7SqMzBWBVFVxrkJtz0RHM3sZFaNkW5vKgvv
	B8=
X-Received: by 2002:a05:6000:38f:b0:482:f0ee:1390 with SMTP id ffacd0b85a97d-485aaddef92mr23597846f8f.22.1789031696449;
        Thu, 10 Sep 2026 02:14:56 -0700 (PDT)
Received: from Empers0n ([193.23.219.104])
        by smtp.gmail.com with ESMTPSA id ffacd0b85a97d-485885bbb51sm52065435f8f.30.2026.09.10.02.14.53
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 10 Sep 2026 02:14:55 -0700 (PDT)
From: Vsevolod Nevorotov <sevanevorotov29@gmail.com>
To: Dmitry Torokhov <dmitry.torokhov@gmail.com>,
	Rob Herring <robh@kernel.org>,
	Krzysztof Kozlowski <krzk+dt@kernel.org>,
	Conor Dooley <conor+dt@kernel.org>
Cc: Henrik Rydberg <rydberg@bitmath.org>,
	linux-input@vger.kernel.org,
	devicetree@vger.kernel.org,
	linux-kernel@vger.kernel.org,
	Vsevolod Nevorotov <sevanevorotov29@gmail.com>
Subject: [PATCH v2 1/2] dt-bindings: input: touchscreen: add Synaptics S3908 controller
Date: Thu, 10 Sep 2026 16:14:04 +0700
Message-ID: <20260910091405.354058-2-sevanevorotov29@gmail.com>
X-Mailer: git-send-email 2.55.0
In-Reply-To: <20260910091405.354058-1-sevanevorotov29@gmail.com>
References: <20260910091405.354058-1-sevanevorotov29@gmail.com>
Precedence: bulk
X-Mailing-List: devicetree@vger.kernel.org
List-Id: <devicetree.vger.kernel.org>
List-Subscribe: <mailto:devicetree+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:devicetree+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

Add devicetree schema binding for the Synaptics S3908 TouchComm
generation-1 I2C touchscreen controller, found in devices such as
the OnePlus 9RT.

Signed-off-by: Vsevolod Nevorotov <sevanevorotov29@gmail.com>
---
 .../input/touchscreen/syna,s3908.yaml         | 69 +++++++++++++++++++
 1 file changed, 69 insertions(+)
 create mode 100644 Documentation/devicetree/bindings/input/touchscreen/syna,s3908.yaml

diff --git a/Documentation/devicetree/bindings/input/touchscreen/syna,s3908.yaml b/Documentation/devicetree/bindings/input/touchscreen/syna,s3908.yaml
new file mode 100644
index 00000000000..68479b0b7d7
--- /dev/null
+++ b/Documentation/devicetree/bindings/input/touchscreen/syna,s3908.yaml
@@ -0,0 +1,69 @@
+# SPDX-License-Identifier: (GPL-2.0-only OR BSD-2-Clause)
+%YAML 1.2
+---
+$id: http://devicetree.org/schemas/input/touchscreen/syna,s3908.yaml#
+$schema: http://devicetree.org/meta-schemas/core.yaml#
+
+title: Synaptics S3908 TouchComm I2C Touchscreen
+
+maintainers:
+  - Vsevolod Nevorotov <sevanevorotov29@gmail.com>
+
+description:
+  Synaptics S3908 is a TouchComm generation-1 touchscreen controller connected
+  over I2C.
+
+allOf:
+  - $ref: touchscreen.yaml#
+
+properties:
+  compatible:
+    const: syna,s3908
+
+  reg:
+    maxItems: 1
+
+  interrupts:
+    maxItems: 1
+
+  reset-gpios:
+    maxItems: 1
+
+  vdd-supply:
+    description: Core / digital power supply regulator (VDD)
+
+  avdd-supply:
+    description: Analog power supply regulator (AVDD)
+
+  wakeup-source: true
+
+required:
+  - compatible
+  - reg
+  - interrupts
+  - reset-gpios
+  - vdd-supply
+  - avdd-supply
+
+unevaluatedProperties: false
+
+examples:
+  - |
+    #include <dt-bindings/interrupt-controller/irq.h>
+    #include <dt-bindings/gpio/gpio.h>
+
+    i2c {
+        #address-cells = <1>;
+        #size-cells = <0>;
+
+        touchscreen@4b {
+            compatible = "syna,s3908";
+            reg = <0x4b>;
+            interrupt-parent = <&tlmm>;
+            interrupts = <23 IRQ_TYPE_LEVEL_LOW>;
+            reset-gpios = <&tlmm 22 GPIO_ACTIVE_LOW>;
+            vdd-supply = <&vreg_l3c_3p0>;
+            avdd-supply = <&vreg_l8c_1p8>;
+            wakeup-source;
+        };
+    };
-- 
2.55.0

