Received: from mail-pl1-f182.google.com (mail-pl1-f182.google.com [209.85.214.182])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 80AEA39479C
	for <devicetree@vger.kernel.org>; Mon, 13 Jul 2026 07:46:29 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.214.182
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1783928792; cv=none; b=aqa2LY1v0mXSybwFDQJBfhMX6oX0albD8Im9OUb5d/hMRcQN3kBVvWvR/XhEAMOAUhNgEPVxnlNWsmwMQ6EB2BLhZeWAvxR9FPjv5cdxKOiD8lbK5Bdbz61s+HMH2NNgzyit6DQObtnwnIq7Q4WPaodAD9apwF3UGIvpeLws9+s=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1783928792; c=relaxed/simple;
	bh=aBdmcCrvRpLElUzuYLREjjeHQy7cLHxZPdBypWnd1vk=;
	h=From:To:Cc:Subject:Date:Message-Id:In-Reply-To:References:
	 MIME-Version; b=riW8Zbt2SYPQEd/96BLzizmt1NS9xjZpc+ftZHxVvPcwIkNYy7LxhnYJi5zhG6czyhsZhbfSPQclRelv6RmYFAMBq0w5TOoUoAla+1GofIOzmG1DrExdw+vLrdkwkD+L+0drVl4gIJ02bZdBGkU9sXNd0IxHQK+/eir1MCtUdEA=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=Lo3dwKpe; arc=none smtp.client-ip=209.85.214.182
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="Lo3dwKpe"
Received: by mail-pl1-f182.google.com with SMTP id d9443c01a7336-2cc7ef7ec27so30989855ad.1
        for <devicetree@vger.kernel.org>; Mon, 13 Jul 2026 00:46:29 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1783928788; x=1784533588; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=o0+La67QneHhY8Z4TRc0JjcxjWm5o09HxeLxb6S6j6Q=;
        b=Lo3dwKpeqCpQcH++3UbEPVAVvv5rJIHImSqzJ6NO/3fipjs0SNpuIvq8S97QMe2lIw
         QjTe7TnBeYaUppzLCWLgfuuCi9cYt+j9vJVfjUrAtRmxTq41JKTMounC9RaGA9ndULqT
         VSQErkYJKiSaIEaM6YojQxSrQMUvbv7wgmwoHR5H6vySZzQQ1uqoMnDqnTvoRxA5KpuE
         Uzy5cZ2fyAEf5IEa2a86bR9elzSlBlMJerAAut50O/T2tHCISph7lru8BovCq7OC7ktC
         Pr3M+VczC/So32E316dvHbWN4kQwVCf/jVkSxn4mh8YIGAQ4/VVIojiC2A8RsWeAFL4a
         +dTA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1783928788; x=1784533588;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to:content-type;
        bh=o0+La67QneHhY8Z4TRc0JjcxjWm5o09HxeLxb6S6j6Q=;
        b=O0RngslSTTgoppjrwdZaOBejuLj4lnydN2RizpQ17EvZ/fJr5gKwFRyKjBQnZu2TCF
         hkOp1luy9j6KuAECcOWGf5TS1Ey62IcjNXtDcgfn4SVHNDZptSzzCEMzmvAiVvJNbcXv
         LMrcZm7c+exuT5tUdQuHDGeJqSK0TD0i/uqVOyNZqgq6cCT5bj23Q7dxV7TGqSNkTd+U
         kpU8NItjuTtc8ni7D0P3glyGeuWR5quTisf6xDR36qJi6bB8kCVAnu3xb0ui/lD667Bz
         a33Qm7npUlldHleri6mxa9thfl/XjLiW4ZHX8jW77Zn7nfz4OkUaaOIdEu7MzMl5WZAG
         KGZg==
X-Forwarded-Encrypted: i=1; AHgh+RpzhbOqtqXxloEXutts6kjD06fpqD8LAzvGNZIl1wDAmGopye34iB2gsR+wUydx0N0yIsAkUX2M5yzc@vger.kernel.org
X-Gm-Message-State: AOJu0YzpfHZxn8tD0frJzdvGqF8i/vxebME21ShmlLxltoy9q5BSv4KN
	NxbEsHLxBuoFrOS7nhELHlRrTnhENy0UDFxOeKwi8tT0MzvDhq/yPJ7c
X-Gm-Gg: AfdE7ckelEhDjPP3qzU9rk1rTikbIawq29iXFDDegJ74wXlatOkbMsTam3vZTe7SjtB
	pWdi7BRU+K7aVsNYn+E5c3VstQMpmaiUfT7ny5qv92x/gf0bt1EDaDNDjq8TVJ/VkiX3l35XRiM
	DHbxIJeZlR6dAiEuErFrE1KiwZImbKluw0n4B4K3ZGpUVIq0dxDANI8ZsYHbw14fPxCgruFqhjU
	dB/I8zQRiIlOc3ieWKng+WVHFL92up64Nrv5ZX5BiTvlBXhdG0QtHUES6nDQ5KctozbnAhRh/oC
	iqo+n/hKBIVWflN5hnjObkQm2oNVhqLcTgd4yUB4RFvDOcRse0x+w8bncIHspKkagcOoDWjlAl3
	uJMDxycB3kY0QUd+FBGAhAXEJQYP2Ef8Jx6ZRPr/BjAK05DAnfCZeTasM65a6OFcpgsyI41MHeH
	+1Kyf8LJjRjl9MWQuNJil8aHIHrtQBD1FK
X-Received: by 2002:a17:903:2410:b0:2c9:e6d7:fbb4 with SMTP id d9443c01a7336-2ce9ee163e3mr75760275ad.31.1783928788524;
        Mon, 13 Jul 2026 00:46:28 -0700 (PDT)
Received: from HP.localdomain ([27.217.83.168])
        by smtp.gmail.com with ESMTPSA id d9443c01a7336-2ccc9d5bde9sm94960105ad.79.2026.07.13.00.46.25
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 13 Jul 2026 00:46:28 -0700 (PDT)
From: Zaixiang Xu <zaixiang.xu.dev@gmail.com>
To: Guenter Roeck <linux@roeck-us.net>
Cc: Rob Herring <robh@kernel.org>,
	Krzysztof Kozlowski <krzk+dt@kernel.org>,
	Conor Dooley <conor+dt@kernel.org>,
	linux-hwmon@vger.kernel.org,
	devicetree@vger.kernel.org,
	linux-kernel@vger.kernel.org,
	Zaixiang Xu <zaixiang.xu.dev@gmail.com>
Subject: [PATCH v7 2/4] dt-bindings: hwmon: Add Sensirion SHT30 series
Date: Mon, 13 Jul 2026 15:45:57 +0800
Message-Id: <20260713074559.12196-3-zaixiang.xu.dev@gmail.com>
X-Mailer: git-send-email 2.34.1
In-Reply-To: <20260713074559.12196-1-zaixiang.xu.dev@gmail.com>
References: <20260713074559.12196-1-zaixiang.xu.dev@gmail.com>
Precedence: bulk
X-Mailing-List: devicetree@vger.kernel.org
List-Id: <devicetree.vger.kernel.org>
List-Subscribe: <mailto:devicetree+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:devicetree+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

Add a YAML devicetree binding for the Sensirion SHT3x/STS3x sensor
family and the compatible GXCAS GXHT30, with the ALERT interrupt,
nRESET GPIO and VDD supply as optional properties.

The SHT30, SHT31, SHT35 and SHT85 measure humidity and temperature
and differ only in accuracy and packaging, while the STS30, STS31,
STS32 and STS35 are temperature-only parts. Within each group the
parts share the same software interface, so model them with a
fallback to the base part of their group: "sensirion,sht30" for the
SHT parts and "sensirion,sts30" for the STS parts.

The GXCAS GXHT30 is a drop-in replacement for the SHT30 and uses it
as fallback as well.

Signed-off-by: Zaixiang Xu <zaixiang.xu.dev@gmail.com>
---
 .../bindings/hwmon/sensirion,sht30.yaml       | 71 +++++++++++++++++++
 1 file changed, 71 insertions(+)
 create mode 100644 Documentation/devicetree/bindings/hwmon/sensirion,sht30.yaml

diff --git a/Documentation/devicetree/bindings/hwmon/sensirion,sht30.yaml b/Documentation/devicetree/bindings/hwmon/sensirion,sht30.yaml
new file mode 100644
index 000000000000..dee0252941c2
--- /dev/null
+++ b/Documentation/devicetree/bindings/hwmon/sensirion,sht30.yaml
@@ -0,0 +1,71 @@
+# SPDX-License-Identifier: (GPL-2.0-only OR BSD-2-Clause)
+%YAML 1.2
+---
+$id: http://devicetree.org/schemas/hwmon/sensirion,sht30.yaml#
+$schema: http://devicetree.org/meta-schemas/core.yaml#
+
+title: Sensirion SHT3x and GXCAS GXHT30 humidity and temperature sensors
+
+maintainers:
+  - Zaixiang Xu <zaixiang.xu.dev@gmail.com>
+
+properties:
+  compatible:
+    oneOf:
+      - enum:
+          - sensirion,sht30
+          - sensirion,sts30
+      - items:
+          - enum:
+              - gxcas,gxht30
+              - sensirion,sht31
+              - sensirion,sht35
+              - sensirion,sht85
+          - const: sensirion,sht30
+      - items:
+          - enum:
+              - sensirion,sts31
+              - sensirion,sts32
+              - sensirion,sts35
+          - const: sensirion,sts30
+
+  reg:
+    maxItems: 1
+
+  vdd-supply:
+    description: Regulator that provides power to the VDD pin.
+
+  reset-gpios:
+    maxItems: 1
+    description:
+      GPIO connected to the nRESET pin. Active low.
+
+  interrupts:
+    maxItems: 1
+    description:
+      Interrupt connected to the ALERT pin.
+
+required:
+  - compatible
+  - reg
+
+additionalProperties: false
+
+examples:
+  - |
+    #include <dt-bindings/gpio/gpio.h>
+    #include <dt-bindings/interrupt-controller/irq.h>
+
+    i2c {
+        #address-cells = <1>;
+        #size-cells = <0>;
+
+        humidity-sensor@44 {
+            compatible = "gxcas,gxht30", "sensirion,sht30";
+            reg = <0x44>;
+            vdd-supply = <&vcc_3v3_reg>;
+            reset-gpios = <&gpio1 15 GPIO_ACTIVE_LOW>;
+            interrupt-parent = <&gpio1>;
+            interrupts = <16 IRQ_TYPE_LEVEL_HIGH>;
+        };
+    };
-- 
2.34.1

