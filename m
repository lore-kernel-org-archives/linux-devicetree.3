Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=209.85.210.182
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1793090745;
	b=F25Uvgm149xCk/5a3VFL2UFsQQllT3NtpEO5qUOldvkl6XP2x3/WzYRlhmmYZ8M1yghF
	 Knpao6zjN/3H0Bvliu0VzhXNz1Hhyx0bpZRdb6+8RY9JDzw+Zl1KdmNQipK1s5Q2Diai8
	 Mb7lQ9MkvmKtPX3wO+n/k+bj8a/quy8lXRsZ3UCywOQ1DgPWS6OvPAWVe5WWCs6tvea4+
	 DigSTnvFmnWAFVjVblau+mNLRuW1vTcMc+WXNYJRsZd6std75bzjgzaDXvph9I4N7gUc6
	 HF7EiExnJLYYIWKpd4Q7GIn/wdB+v0yVIVcj6U++SjmLIPMvkyKT0etHMgIDegGxkSQ==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1793090745;
	h=DMARC-Filter:Received:DKIM-Signature:X-Google-DKIM-Signature:
	 X-Forwarded-Encrypted:X-Gm-Message-State:X-Gm-Gg:X-Received:Received:
	 From:To:Cc:Subject:Date:Message-ID:X-Mailer:In-Reply-To:References:
	 MIME-Version:Content-Transfer-Encoding;
	bh=fUtBDBFlnuwqHCLsz+VPCk4N74H4c6MrUI5YYlRszuU=;
	b=LyjrQL5ywl3YH8rwjWhJYUy9US4rXHvFt03FqLvcXbn+2MlGM/4tjgAOSGh4ify+PAMn
	 hkCvdWrci+qsABPIrHllOkdqKNLJsd6tKSA3HUMRK0bxMYKl/rQ/KAE+UH93k7XHzp8na
	 qqM1rOrEiec/lMzjrI7hjTaYAFTn11yfThn/LgtszfianZep2L2FRH2ScPlG0Nq2zrWkZ
	 A3/zhw8tozYqDG7ksWe18v2DfuMdyeifi7RK+ibhYHpinZvHuve7Tk5pXGNgcZO4A3QDZ
	 V3Y3eWyHfd8hBgaaXOkJrMun13Q1ZefZJ4Enf3Iba/XEdTk++HhxbCv420VagT33AYw==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=gmail.com;
	spf=pass smtp.mailfrom=gmail.com;
	dkim=pass header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20251104 header.b=H4kILZPN;
	arc=none smtp.remote-ip=209.85.210.182
Received: from mail-pf1-f182.google.com (mail-pf1-f182.google.com [209.85.210.182])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 69DC9606A31A
	for <devicetree@vger.kernel.org>; Tue, 27 Oct 2026 08:45:45 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org 69DC9606A31A
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key, unprotected) header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20251104 header.b=H4kILZPN
Received: by mail-pf1-f182.google.com with SMTP id d2e1a72fcca58-886e61fa30fso1597527b3a.1
        for <devicetree@vger.kernel.org>; Tue, 27 Oct 2026 01:45:45 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1793090745; x=1793695545; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=fUtBDBFlnuwqHCLsz+VPCk4N74H4c6MrUI5YYlRszuU=;
        b=H4kILZPNGx/PI9tXIND2biAQPIFNsgZDlxRadAR32rqYh7qxvNtt+FW6aKE/10yJrC
         1nvf08Yagx2WCa69b1G5DOYuVpdG0xsvwZNTSV8jIHTyy3ishvuh+9bsCcjNYGbWirOK
         33+NLbfvGPHvw6RyQwsZ4jeXNQxxVhJIOkie4Bvm+a1ObscKjgNn4GOjZpK0I+JKoFIU
         hl7NFJtfP6UvvE6x8X8Q1z+SFEnvBeS0cxN6VQtyTOtSj+q/dTD/PKknfrkBRZVN4ewC
         KO1rK+wAiVvWssf+GhVYKOgIKony1QLBGTg6czbxi95fApaXXJ7vmPPFDKyaclpTytoa
         gLFw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1793090745; x=1793695545;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to:content-type;
        bh=fUtBDBFlnuwqHCLsz+VPCk4N74H4c6MrUI5YYlRszuU=;
        b=yK6gAyCnrrWwaEwofmL34v1CUPlVS8UA6vuPk43dYOlyBqHAH5KPY9faYUcSpuiRkG
         iTiMwC8xLHM5AfxfPWSgcUPq9NbyNWVm2z0DAIwv2BIV2vhskUaoPrBhissgQKGGhTpN
         d8jFbq2HyzGqVJ8TAoZVRAXZWbQEi2VpZW9Wxt2pVsjWhh2kKwmzwVW2xKK6BRKlCgkP
         h9vA8SQ0M70nxEbuKtRoqrQE4ujK3qe1PgfVAckUQo9IdnGRSeDCNaMSi+10DbffDOUL
         Cw+zZhLeoT4mFIblQTGq52vfeEETZUKLeReF95vTdQBCE9W4kyqrhv9eJk/0tx0CqKI8
         YBtQ==
X-Forwarded-Encrypted: i=1; AKwUvBwgkxu3FCppxOAT8q0UUz7tpwdbeyGxLSStPiVT+IcvMCAAxiGS9DOmFNGQ7KAkSwX1Jq1O1e8m0sgu@vger.kernel.org
X-Gm-Message-State: AFq9FYK/h8KCh4KWeiIz5AsVi8ZGuCZVdLcQ2fDQtuuiY5Pj0eZzjwtt
	vPSv1FR5iJ2eCqix3oRiL57OnWBPtOCM2LTLsq1+U7v5a85tVzGaV6ky
X-Gm-Gg: AYBFou1n/pLJCpOvR3/CrQy8pCkTpdyGr3WS8rQ00mz1UH9qsUGCw0g8ieG+bk+7V4m
	kwZEEvZMUs4w3i/3WgdkI8hSIh94LwPzsxbj1uNZ/yMeMVmJqCmSPfPlY1pPIM61fKdqt+RGlgT
	Uyxm1e0h3Wj/GhUqqgdtiERtw0ZQhIV/+0pybuaowd2tdHI+2DC1Ji/Q2Lfmup3jP3czEv89/gY
	w/z2nD9tSP+u3F1HUzvNToEYSOkA1QCxOA7aoJqvpfmGndr+0ZbIFBDpxd9N5TZkE+UmbLP5cLx
	F0XBQWWxxB10UhzRr+05GEaAyHSsp7Ci8vAvTrqfdntexnpPcU5R4p9h1nRoQRjzLOLv/+CaZuZ
	5AOaz+FRTxA6G5PeES+hEfGacWVDQW3RjfNh5iRFgsHfd48yiAeklIZLLWjSW83/eBctKVOf3tS
	qRQcz+KdL0KVbx4UuSJj5U6iC64DTkpxzuFVufuuvxCsprQrxDLVyBOU4LCOG9UBubEjuan3H/P
	ZEcHYBVCFPDeBBPcItGeN0QiXVB4Js0SV5jevp7qB6b/D1+09nvpkkxqJj+dXwYHO8R2A==
X-Received: by 2002:a05:6a20:ef03:b0:3e2:1a24:fb82 with SMTP id adf61e73a8af0-3e7bfa2023bmr5501098637.16.1793090744450;
        Tue, 27 Oct 2026 01:45:44 -0700 (PDT)
Received: from Aaron-M6 ([188.253.120.162])
        by smtp.gmail.com with ESMTPSA id 41be03b00d2f7-cdad8f2c611sm267581a12.10.2026.10.27.01.45.39
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 27 Oct 2026 01:45:43 -0700 (PDT)
From: Yaozhong Li <yaozhonguwl@gmail.com>
To: Lee Jones <lee@kernel.org>
Cc: Rob Herring <robh@kernel.org>,
	Krzysztof Kozlowski <krzk+dt@kernel.org>,
	Conor Dooley <conor+dt@kernel.org>,
	Heiko Stuebner <heiko@sntech.de>,
	Chris Zhong <zyw@rock-chips.com>,
	Zhang Qing <zhangqing@rock-chips.com>,
	Joseph Chen <chenjh@rock-chips.com>,
	Sebastian Reichel <sebastian.reichel@collabora.com>,
	mfd@lists.linux.dev,
	devicetree@vger.kernel.org,
	linux-rockchip@lists.infradead.org,
	linux-arm-kernel@lists.infradead.org,
	linux-kernel@vger.kernel.org,
	Yaozhong Li <yaozhonguwl@gmail.com>
Subject: [PATCH v5 1/3] dt-bindings: mfd: rk8xx: add board level power hold GPIOs
Date: Tue, 27 Oct 2026 16:45:07 +0800
Message-ID: <20261027084511.1992-2-yaozhonguwl@gmail.com>
X-Mailer: git-send-email 2.55.0.windows.3
In-Reply-To: <20261027084511.1992-1-yaozhonguwl@gmail.com>
References: <20261027084511.1992-1-yaozhonguwl@gmail.com>
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

Some boards route "power hold" lines from the SoC into the board's power
circuitry. Those lines have to be held asserted while the system is
running and released before the PMIC shutdown request is written,
otherwise the rails can drop and come back up instead of staying off.

Add power-hold-gpios to describe those lines and power-hold-delay-ms for
the settle time. The driver reads them for every RK8xx variant that is
the system power controller, so add them to all seven RK8xx schemas.

The array is bounded at two entries. Firefly's vendor kernel handles
exactly two such lines, pmic,hold-gpio and pmic,stby-gpio, and its board
files use one or both of them, with an RK808 and with an RK818.

The lines are released from the PMIC's power-off path, so they are only
meaningful when the PMIC is the system power controller. Require that.
A board adding these lines is expected to switch to the generic
system-power-controller property at the same time, so the deprecated
rockchip,system-power-controller spelling is not accepted here.

Assisted-by: LLM
Signed-off-by: Yaozhong Li <yaozhonguwl@gmail.com>
---
 .../bindings/mfd/rockchip,rk801.yaml          | 24 +++++++++++++++++++
 .../bindings/mfd/rockchip,rk805.yaml          | 24 +++++++++++++++++++
 .../bindings/mfd/rockchip,rk806.yaml          | 24 +++++++++++++++++++
 .../bindings/mfd/rockchip,rk808.yaml          | 24 +++++++++++++++++++
 .../bindings/mfd/rockchip,rk816.yaml          | 24 +++++++++++++++++++
 .../bindings/mfd/rockchip,rk817.yaml          | 24 +++++++++++++++++++
 .../bindings/mfd/rockchip,rk818.yaml          | 24 +++++++++++++++++++
 7 files changed, 168 insertions(+)

diff --git a/Documentation/devicetree/bindings/mfd/rockchip,rk801.yaml b/Documentation/devicetree/bindings/mfd/rockchip,rk801.yaml
index 7c71447..bfba394 100644
--- a/Documentation/devicetree/bindings/mfd/rockchip,rk801.yaml
+++ b/Documentation/devicetree/bindings/mfd/rockchip,rk801.yaml
@@ -29,6 +29,26 @@ properties:
     description:
       Telling whether or not this PMIC is controlling the system power.
 
+  power-hold-gpios:
+    minItems: 1
+    maxItems: 2
+    description: >
+      Board level power hold lines driven by the SoC. They have to be held
+      asserted while the system is running and released before the PMIC
+      shutdown request is written, otherwise the rails can drop and come
+      back up instead of staying off. Only meaningful when this PMIC is the
+      system power controller, as the lines are released as part of its
+      power-off path.
+
+      The lines are released in the order listed, and power-hold-delay-ms
+      elapses once, after the last of them.
+
+  power-hold-delay-ms:
+    default: 0
+    description:
+      Time to wait after releasing power-hold-gpios before the shutdown
+      request is written, to let the lines settle.
+
   wakeup-source:
     type: boolean
     description:
@@ -71,6 +91,10 @@ properties:
         unevaluatedProperties: false
     additionalProperties: false
 
+dependentRequired:
+  power-hold-gpios: [ system-power-controller ]
+  power-hold-delay-ms: [ power-hold-gpios ]
+
 required:
   - compatible
   - reg
diff --git a/Documentation/devicetree/bindings/mfd/rockchip,rk805.yaml b/Documentation/devicetree/bindings/mfd/rockchip,rk805.yaml
index da23915..7895c31 100644
--- a/Documentation/devicetree/bindings/mfd/rockchip,rk805.yaml
+++ b/Documentation/devicetree/bindings/mfd/rockchip,rk805.yaml
@@ -48,6 +48,26 @@ properties:
 
   system-power-controller: true
 
+  power-hold-gpios:
+    minItems: 1
+    maxItems: 2
+    description: >
+      Board level power hold lines driven by the SoC. They have to be held
+      asserted while the system is running and released before the PMIC
+      shutdown request is written, otherwise the rails can drop and come
+      back up instead of staying off. Only meaningful when this PMIC is the
+      system power controller, as the lines are released as part of its
+      power-off path.
+
+      The lines are released in the order listed, and power-hold-delay-ms
+      elapses once, after the last of them.
+
+  power-hold-delay-ms:
+    default: 0
+    description:
+      Time to wait after releasing power-hold-gpios before the shutdown
+      request is written, to let the lines settle.
+
   wakeup-source:
     type: boolean
     description:
@@ -102,6 +122,10 @@ allOf:
         clock-output-names:
           maxItems: 2
 
+dependentRequired:
+  power-hold-gpios: [ system-power-controller ]
+  power-hold-delay-ms: [ power-hold-gpios ]
+
 required:
   - compatible
   - reg
diff --git a/Documentation/devicetree/bindings/mfd/rockchip,rk806.yaml b/Documentation/devicetree/bindings/mfd/rockchip,rk806.yaml
index eb5bca3..b719b07 100644
--- a/Documentation/devicetree/bindings/mfd/rockchip,rk806.yaml
+++ b/Documentation/devicetree/bindings/mfd/rockchip,rk806.yaml
@@ -31,6 +31,26 @@ properties:
 
   system-power-controller: true
 
+  power-hold-gpios:
+    minItems: 1
+    maxItems: 2
+    description: >
+      Board level power hold lines driven by the SoC. They have to be held
+      asserted while the system is running and released before the PMIC
+      shutdown request is written, otherwise the rails can drop and come
+      back up instead of staying off. Only meaningful when this PMIC is the
+      system power controller, as the lines are released as part of its
+      power-off path.
+
+      The lines are released in the order listed, and power-hold-delay-ms
+      elapses once, after the last of them.
+
+  power-hold-delay-ms:
+    default: 0
+    description:
+      Time to wait after releasing power-hold-gpios before the shutdown
+      request is written, to let the lines settle.
+
   rockchip,reset-mode:
     $ref: /schemas/types.yaml#/definitions/uint32
     enum: [0, 1, 2]
@@ -138,6 +158,10 @@ patternProperties:
 allOf:
   - $ref: /schemas/spi/spi-peripheral-props.yaml
 
+dependentRequired:
+  power-hold-gpios: [ system-power-controller ]
+  power-hold-delay-ms: [ power-hold-gpios ]
+
 required:
   - compatible
   - reg
diff --git a/Documentation/devicetree/bindings/mfd/rockchip,rk808.yaml b/Documentation/devicetree/bindings/mfd/rockchip,rk808.yaml
index 50dfffa..0be2bb9 100644
--- a/Documentation/devicetree/bindings/mfd/rockchip,rk808.yaml
+++ b/Documentation/devicetree/bindings/mfd/rockchip,rk808.yaml
@@ -43,6 +43,26 @@ properties:
 
   system-power-controller: true
 
+  power-hold-gpios:
+    minItems: 1
+    maxItems: 2
+    description: >
+      Board level power hold lines driven by the SoC. They have to be held
+      asserted while the system is running and released before the PMIC
+      shutdown request is written, otherwise the rails can drop and come
+      back up instead of staying off. Only meaningful when this PMIC is the
+      system power controller, as the lines are released as part of its
+      power-off path.
+
+      The lines are released in the order listed, and power-hold-delay-ms
+      elapses once, after the last of them.
+
+  power-hold-delay-ms:
+    default: 0
+    description:
+      Time to wait after releasing power-hold-gpios before the shutdown
+      request is written, to let the lines settle.
+
   wakeup-source:
     type: boolean
     description:
@@ -113,6 +133,10 @@ properties:
         unevaluatedProperties: false
     unevaluatedProperties: false
 
+dependentRequired:
+  power-hold-gpios: [ system-power-controller ]
+  power-hold-delay-ms: [ power-hold-gpios ]
+
 required:
   - compatible
   - reg
diff --git a/Documentation/devicetree/bindings/mfd/rockchip,rk816.yaml b/Documentation/devicetree/bindings/mfd/rockchip,rk816.yaml
index a58d945..a834a9c 100644
--- a/Documentation/devicetree/bindings/mfd/rockchip,rk816.yaml
+++ b/Documentation/devicetree/bindings/mfd/rockchip,rk816.yaml
@@ -44,6 +44,26 @@ properties:
     description:
       Telling whether or not this PMIC is controlling the system power.
 
+  power-hold-gpios:
+    minItems: 1
+    maxItems: 2
+    description: >
+      Board level power hold lines driven by the SoC. They have to be held
+      asserted while the system is running and released before the PMIC
+      shutdown request is written, otherwise the rails can drop and come
+      back up instead of staying off. Only meaningful when this PMIC is the
+      system power controller, as the lines are released as part of its
+      power-off path.
+
+      The lines are released in the order listed, and power-hold-delay-ms
+      elapses once, after the last of them.
+
+  power-hold-delay-ms:
+    default: 0
+    description:
+      Time to wait after releasing power-hold-gpios before the shutdown
+      request is written, to let the lines settle.
+
   wakeup-source: true
 
   vcc1-supply:
@@ -101,6 +121,10 @@ patternProperties:
         $ref: /schemas/types.yaml#/definitions/string
         const: gpio0
 
+dependentRequired:
+  power-hold-gpios: [ system-power-controller ]
+  power-hold-delay-ms: [ power-hold-gpios ]
+
 required:
   - compatible
   - reg
diff --git a/Documentation/devicetree/bindings/mfd/rockchip,rk817.yaml b/Documentation/devicetree/bindings/mfd/rockchip,rk817.yaml
index 2cb6d17..2c05275 100644
--- a/Documentation/devicetree/bindings/mfd/rockchip,rk817.yaml
+++ b/Documentation/devicetree/bindings/mfd/rockchip,rk817.yaml
@@ -55,6 +55,26 @@ properties:
 
   system-power-controller: true
 
+  power-hold-gpios:
+    minItems: 1
+    maxItems: 2
+    description: >
+      Board level power hold lines driven by the SoC. They have to be held
+      asserted while the system is running and released before the PMIC
+      shutdown request is written, otherwise the rails can drop and come
+      back up instead of staying off. Only meaningful when this PMIC is the
+      system power controller, as the lines are released as part of its
+      power-off path.
+
+      The lines are released in the order listed, and power-hold-delay-ms
+      elapses once, after the last of them.
+
+  power-hold-delay-ms:
+    default: 0
+    description:
+      Time to wait after releasing power-hold-gpios before the shutdown
+      request is written, to let the lines settle.
+
   wakeup-source:
     type: boolean
     description:
@@ -189,6 +209,10 @@ allOf:
           patternProperties:
             "^(BOOST|OTG_SWITCH)$": false
 
+dependentRequired:
+  power-hold-gpios: [ system-power-controller ]
+  power-hold-delay-ms: [ power-hold-gpios ]
+
 required:
   - compatible
   - reg
diff --git a/Documentation/devicetree/bindings/mfd/rockchip,rk818.yaml b/Documentation/devicetree/bindings/mfd/rockchip,rk818.yaml
index 90d944c..319c0f2 100644
--- a/Documentation/devicetree/bindings/mfd/rockchip,rk818.yaml
+++ b/Documentation/devicetree/bindings/mfd/rockchip,rk818.yaml
@@ -43,6 +43,26 @@ properties:
 
   system-power-controller: true
 
+  power-hold-gpios:
+    minItems: 1
+    maxItems: 2
+    description: >
+      Board level power hold lines driven by the SoC. They have to be held
+      asserted while the system is running and released before the PMIC
+      shutdown request is written, otherwise the rails can drop and come
+      back up instead of staying off. Only meaningful when this PMIC is the
+      system power controller, as the lines are released as part of its
+      power-off path.
+
+      The lines are released in the order listed, and power-hold-delay-ms
+      elapses once, after the last of them.
+
+  power-hold-delay-ms:
+    default: 0
+    description:
+      Time to wait after releasing power-hold-gpios before the shutdown
+      request is written, to let the lines settle.
+
   wakeup-source:
     type: boolean
     description:
@@ -105,6 +125,10 @@ properties:
         unevaluatedProperties: false
     unevaluatedProperties: false
 
+dependentRequired:
+  power-hold-gpios: [ system-power-controller ]
+  power-hold-delay-ms: [ power-hold-gpios ]
+
 required:
   - compatible
   - reg
-- 
2.55.0.windows.3

