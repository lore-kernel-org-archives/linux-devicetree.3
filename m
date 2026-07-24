Received: from mail-pf1-f170.google.com (mail-pf1-f170.google.com [209.85.210.170])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 9C3BC3D9DD8
	for <devicetree@vger.kernel.org>; Fri, 24 Jul 2026 09:15:08 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.210.170
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1784884510; cv=none; b=VpSPCcOlEVXYvOGNHJM/4cbA/+19ENNjkkG25eQ+vSY4zSLz3QZ4+6SZUuAwpZhRUzOYb+EUMoK80RBpJFkIDy3ebidDdIyKR9UBUOel9aycnv1OIBbXROnh03JWiURelS/ELkPWTJ7mmBiRu71BhJgLxwVjkHIh8D53LnhYbyc=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1784884510; c=relaxed/simple;
	bh=/xlEVw/KiT9/XEqDjIphDYd3uSSaRu/4jZjjAdQtqd8=;
	h=From:To:Cc:Subject:Date:Message-Id:In-Reply-To:References:
	 MIME-Version; b=ejdBhxrEn0EoROKoTunlruy12tEDciSZJScX29oqZ73AhLc4LxLHrpGEslnKU5DlBBH1Epl4y5KtE1ZZwuaY1GzgFWaCuc0eqXQUI302a90yXKnsjg7LZ9M57rvQKtrRFfasrEYLc/ctoMlPd9D4QNENJw4o4UbBbNTSgU99K3M=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=BupgRjk5; arc=none smtp.client-ip=209.85.210.170
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="BupgRjk5"
Received: by mail-pf1-f170.google.com with SMTP id d2e1a72fcca58-84864086bfeso177205b3a.1
        for <devicetree@vger.kernel.org>; Fri, 24 Jul 2026 02:15:08 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1784884508; x=1785489308; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=yzDl4rio1x0zKV1oZWrhXk8ePWLshifrG/jhvgwjQz8=;
        b=BupgRjk5l+MuL8KBKi23Gt3MpvYB0x7coU0qrABpDmXZ1XssBcDK8qciftVlY//eim
         IpEGTEVA654bpx75ClSPUcjHMbHsCtKMEigbaUnUtAO/gRCYqPVNMENZrw07Vk2jVnOx
         TfFcnSsqqmM0gWPjB4gUtpP3LqLWuX6T0XPRaebrM0ZWvdo25sFVUEhBJ0VLeFUD6er8
         eMunqFN4mDOEtQUhRdohFbz96Errb2bJg5w/Tnyf/epZthN9+hTFH1/3qNp0YYdKQq/s
         yh+O1HHeGlsJoxx726LWGSq6N0d/hmgU6FmNNQIpqQInRk5UqwlKpqes0ru05ZO2W4HS
         L73w==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1784884508; x=1785489308;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to:content-type;
        bh=yzDl4rio1x0zKV1oZWrhXk8ePWLshifrG/jhvgwjQz8=;
        b=lhKr+DOiRDlFr370I55iB90eirOMUb3dHkx3KuI/lcpq1yRR3MVLuLW1Bue3TMUy/S
         g6mTf8rTjAhyeCLTSt7uv6EKur4cMBaZPMMkdZ/5mQEAw/zAWzsnKjrWfAt97pdXxIlG
         5BjFDhH4MJtHKxe7a3xhycm+hIcJDwMXf78Kg6vHsVANmzrDll663j+kW9UbYEBFBvzz
         wtCV7toTk5Y1c4cQ1apM17EAUGBFYsh4FTpnzckcAhYspZau3hF9/CFFF52df0VnHeHY
         aslu5N+5dSATgEFJ3u2HkmyjD6+Dqsj2YqLLgs8o9LuYMPK1pFtSUYB2ygfwTPPKZbdz
         0GLg==
X-Forwarded-Encrypted: i=1; AHgh+Rp9327Co8aA1mbezBwhXS+26bpW6XUX8jqadPGtmqAcwrss5hQKY8jMpRAkxYbGFJKg13o8QeOLHObq@vger.kernel.org
X-Gm-Message-State: AOJu0Yz7HKu0sSWoqfkkT2xl17IJEHETwslO2uvtWn17eSXvoN1JELdT
	GTsk8Skxt7GbPbBpCKIYz4D4mrJMzGtMOs9jta4mSCTfh3M2RP8j8S5G
X-Gm-Gg: AR+sD13ey2QcFN+ol/Od91t7I53hik8DalTYCen3Wi7ctjTIv7oem0nYscnbw33qT5e
	V4cGWwci1yNntN4vEYmAf6V5XQ7KKvOZ80BOlAVaq0HzXPpypXMVEifwL2ICxMs7vqu/AovxSpc
	NzrXMGU/GtCtRsdwac0ZxdIqpo4DFCq78Z0ZERzE1C+YAoU+iGbp7PeriVFhNHBD6X3lMED9jhO
	4dpWsWrdzvMl/nj/xUKEKIqV39slbMgCAK/x+eW2X74n8Uald8HC6W3A6qUVJEGy5cxiBFFe5TD
	uQ9blSwFm+CTZ6tZATvO8MwAMXCkI57g22M/NlA1iMPBdhhJJDHuJVPJ2ImKLOaK4pd0oKr1Y/w
	ccsKos3ervY3gp1l6mj5ZGmIeTBilZQ6Yl02cGaEgZj1txWVpN0H67qQrFQNCzhKia2TE9SLy7C
	Ah5SOOecgtvD2HwNp6ZjXOv/VWuoxsJbYP+TgE7P/5Z/pLu0NL/LQ+T+07ffGk
X-Received: by 2002:a05:6a00:1797:b0:847:968c:a0f1 with SMTP id d2e1a72fcca58-84e2c1aa5dfmr7625153b3a.43.1784884507987;
        Fri, 24 Jul 2026 02:15:07 -0700 (PDT)
Received: from localhost.localdomain (60-250-196-139.hinet-ip.hinet.net. [60.250.196.139])
        by smtp.gmail.com with ESMTPSA id d2e1a72fcca58-84e17237c3fsm4410519b3a.9.2026.07.24.02.15.05
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 24 Jul 2026 02:15:07 -0700 (PDT)
From: Zi-Yu Chen <zychennvt@gmail.com>
To: Wim Van Sebroeck <wim@linux-watchdog.org>,
	Guenter Roeck <linux@roeck-us.net>,
	Rob Herring <robh@kernel.org>,
	Krzysztof Kozlowski <krzk+dt@kernel.org>,
	Conor Dooley <conor+dt@kernel.org>
Cc: Jacky Huang <ychuang3@nuvoton.com>,
	Shan-Chun Hung <schung@nuvoton.com>,
	linux-watchdog@vger.kernel.org,
	devicetree@vger.kernel.org,
	linux-arm-kernel@lists.infradead.org,
	linux-kernel@vger.kernel.org,
	Zi-Yu Chen <zychennvt@gmail.com>
Subject: [PATCH v2 1/3] dt-bindings: watchdog: Add MA35D1 Watchdog binding
Date: Fri, 24 Jul 2026 17:14:25 +0800
Message-Id: <20260724091427.1689980-2-zychennvt@gmail.com>
X-Mailer: git-send-email 2.34.1
In-Reply-To: <20260724091427.1689980-1-zychennvt@gmail.com>
References: <20260724091427.1689980-1-zychennvt@gmail.com>
Precedence: bulk
X-Mailing-List: devicetree@vger.kernel.org
List-Id: <devicetree.vger.kernel.org>
List-Subscribe: <mailto:devicetree+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:devicetree+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

Add device tree binding documentation for the watchdog timer (WDT)
controller found on Nuvoton MA35D1 SoC.

Signed-off-by: Zi-Yu Chen <zychennvt@gmail.com>
---
 .../bindings/watchdog/nuvoton,ma35d1-wdt.yaml | 55 +++++++++++++++++++
 1 file changed, 55 insertions(+)
 create mode 100644 Documentation/devicetree/bindings/watchdog/nuvoton,ma35d1-wdt.yaml

diff --git a/Documentation/devicetree/bindings/watchdog/nuvoton,ma35d1-wdt.yaml b/Documentation/devicetree/bindings/watchdog/nuvoton,ma35d1-wdt.yaml
new file mode 100644
index 000000000000..aced7d77a7d3
--- /dev/null
+++ b/Documentation/devicetree/bindings/watchdog/nuvoton,ma35d1-wdt.yaml
@@ -0,0 +1,55 @@
+# SPDX-License-Identifier: (GPL-2.0-only OR BSD-2-Clause)
+%YAML 1.2
+---
+$id: http://devicetree.org/schemas/watchdog/nuvoton,ma35d1-wdt.yaml#
+$schema: http://devicetree.org/meta-schemas/core.yaml#
+
+title: Nuvoton MA35D1 Watchdog Timer
+
+maintainers:
+  - Zi-Yu Chen <zychennvt@gmail.com>
+
+allOf:
+  - $ref: watchdog.yaml#
+
+properties:
+  compatible:
+    enum:
+      - nuvoton,ma35d1-wdt
+
+  reg:
+    maxItems: 1
+
+  interrupts:
+    maxItems: 1
+
+  clocks:
+    maxItems: 1
+
+  wakeup-source: true
+
+required:
+  - compatible
+  - reg
+  - interrupts
+  - clocks
+
+unevaluatedProperties: false
+
+examples:
+  - |
+    #include <dt-bindings/interrupt-controller/arm-gic.h>
+    #include <dt-bindings/interrupt-controller/irq.h>
+    #include <dt-bindings/clock/nuvoton,ma35d1-clk.h>
+
+    soc {
+        #address-cells = <2>;
+        #size-cells = <2>;
+        wdt1: watchdog@40440000 {
+          compatible = "nuvoton,ma35d1-wdt";
+          reg = <0x0 0x40440000 0x0 0x100>;
+          interrupts = <GIC_SPI 43 IRQ_TYPE_LEVEL_HIGH>;
+          clocks = <&clk WDT1_GATE>;
+        };
+    };
+...
-- 
2.34.1

