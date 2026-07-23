Received: from mail-pl1-f182.google.com (mail-pl1-f182.google.com [209.85.214.182])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 7F3DF3C3432
	for <devicetree@vger.kernel.org>; Thu, 23 Jul 2026 06:08:25 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.214.182
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1784786906; cv=none; b=AJkDOp0blUaf7GMf4Qlr43Cj6d4BGX5NTSxWeFAfuvo0W92jsWfU7FuLT5fUvLidaC5p8s3N1T+GORinYIHLYMnKKpxRsM9INwfZ3zKtALoL28BMTh0vBUFuWXy+NHlwhS4qQLb2nM1NPSuBJGV7OPNJNFw42vcrNqy/mtMFdnI=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1784786906; c=relaxed/simple;
	bh=/xlEVw/KiT9/XEqDjIphDYd3uSSaRu/4jZjjAdQtqd8=;
	h=From:To:Cc:Subject:Date:Message-Id:In-Reply-To:References:
	 MIME-Version; b=n7nrxNyfIKPTeGNqkZz1DwZ3qscPMcpqxAM1jjdumfjb5s+dej5nQUEu7c2FbwXwgFm1EjserxrdUB4IcghMgU7mx+GpJaDlekgK1vNABwOg98RT05uxowE2v5znMpBWWO0Z7/koC6TEvxwGCpuSv1DQY+HCXPbF45PGEkVqHcY=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=FUSgaNRN; arc=none smtp.client-ip=209.85.214.182
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="FUSgaNRN"
Received: by mail-pl1-f182.google.com with SMTP id d9443c01a7336-2cace91f112so3389605ad.0
        for <devicetree@vger.kernel.org>; Wed, 22 Jul 2026 23:08:25 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1784786905; x=1785391705; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=yzDl4rio1x0zKV1oZWrhXk8ePWLshifrG/jhvgwjQz8=;
        b=FUSgaNRNYirkB6AxdKLfbyyo9ngZpalOrWH4VoLMWWOc27twogM5Ph9H4sn8gKq9dF
         By9OXunWqTetxjMMHHnKXmTxrlqCmdRhsXir03HwJUHyO6LfDB4H29M3zEbtmke8TypV
         U777+BnVhEo8MxxplOhs+hbTQIB0kTUJ54a1Xd0yR7znrS9hFnOB3CyxtaB170C8QfB/
         2Hk1VQ935c3qISGo8DnNynK/xoqHoujdLKk5JiKuFgGNgFiss3WsppzgUo6AlMTCAFg5
         SZSteA+hFSaOeUeJP3hQLM5J0vjMxFIuR6JdRWOCZhh9m+IRuoYzsj95YFc+Ne/kKPoY
         XN0w==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1784786905; x=1785391705;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to:content-type;
        bh=yzDl4rio1x0zKV1oZWrhXk8ePWLshifrG/jhvgwjQz8=;
        b=N6pLBExT3M9wHfQxsCXJ5j+HMjJwJC3GWAjKK1nqOVWYgqR2S4UDGqAVvA/e+IckAT
         Ntk7JdUM779zx/WE9YGxQ+EjMWNOzZVHPd0Ecisewd4kJ9G+WYCMHnaCphrxH5wpt+yM
         Vjsjbp/8sDVKIgSxb34T9LwEst7KQiX5Ob25x28NQEcI6EQ7Vd107W1YzQ3mA5Lt4AvQ
         JLK/yYrpEzDRWA7/NGSMIj+f5u3hFkjXsXVe0r3barkuNlWipHfQpzBVi7qZi5k37gK0
         SA1hQT7B42s3yi5OVU9bpSLueI9TKW86eIHGDmzdr+rkwtylKSe5B4PksMZp1jW5FwGS
         t7Ng==
X-Forwarded-Encrypted: i=1; AHgh+RqaN/+7QWdlQmXgrPgqRFJgl6/lnzPwY6enb1NO7USC3M2XyN+Txg9pdC8B7HQ4LgmLa446qm9SKh05@vger.kernel.org
X-Gm-Message-State: AOJu0Yz9tCEVeFrft8PScE0E5LmSh4/lhol7ZSWTzUMMFdsWJ+5n/KzE
	ZFIotFcHiCJ1WOZEcHMmL4DG8hVk9mXY9aLbLdtdAeRaqSrAAS0XFAq8
X-Gm-Gg: AR+sD10zN/hRyq5IjzPv7znvdI0jlOPyxSRkRQxn1QdQDR+V6NjbCd9a/fyFaoFkjFN
	JBwqqLcQ0rpVGzMIEZ01fjHbKFYWem4KNMrD7f88zw/hhPxXPDEVYdmxX60ns2rPZb+WIIGRAN7
	gpk8EiuICfiP5TP2wMgO48wAQ+1iuAY7Nbp27zJvsvlZM9WavzXYsr0Ep2xkgqdwXaNGgIq4V/b
	ZISKY8jVvLTXZRzUvqw5cfMGzNwafGpxgwt9eT6wuIZ+HG8h0xSpkn3hbEAdrP+481GHmxvpgcK
	YoqlWu8VptdL+bvyMXr+hjE9X+p+sy+zYJuAvu0h9q77xIHlK0OOouTRHpxAuofnzrm4WgC1KC5
	0EQf4GNxrY3+iPji6IbEI3o7wJGMs5ARN1M1QONRa2sc2VF1wDT3VRDHUc7EKvmDpuddvLmw+BA
	v6NwDs8K9D3qahvzZB0WVnm958lXp5RR+zsNSmfBN1Xy1bboHgCDGnWGF3eQJX
X-Received: by 2002:a17:902:f68b:b0:2cf:32bc:971e with SMTP id d9443c01a7336-2cfa6c66618mr20561685ad.29.1784786904767;
        Wed, 22 Jul 2026 23:08:24 -0700 (PDT)
Received: from localhost.localdomain (60-250-196-139.hinet-ip.hinet.net. [60.250.196.139])
        by smtp.gmail.com with ESMTPSA id d9443c01a7336-2cf8f390dd2sm26071285ad.79.2026.07.22.23.08.22
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 22 Jul 2026 23:08:24 -0700 (PDT)
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
Subject: [PATCH 1/3] dt-bindings: watchdog: Add MA35D1 Watchdog binding
Date: Thu, 23 Jul 2026 14:07:52 +0800
Message-Id: <20260723060755.1596858-2-zychennvt@gmail.com>
X-Mailer: git-send-email 2.34.1
In-Reply-To: <20260723060755.1596858-1-zychennvt@gmail.com>
References: <20260723060755.1596858-1-zychennvt@gmail.com>
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

