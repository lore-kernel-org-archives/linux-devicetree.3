Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=209.85.221.44
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1792955789;
	b=kEd3HKOR1nrsrNXjPrMvrdJpvq0gkyX2eRawG5OlSkJ9BWR2UFwtZ8pSpaHCRTDLkXQn
	 rpYjBIIQ5VxIiaZyBhu9FFpSuhlF9DL8Mr7yQ51WBlCI6eJN0tbEvBPsQs13qXFy4h3uR
	 jDq6QVFzjCAiWa+K4jbP4rBcuiHaJJs2ovIR+nxYWQS2vuaSuK0bMbM8eua7ELufXQSVt
	 JGI9g0SwGpeB0YVr9wr4WPc3v/eR4VvAs1EX0ugk26Uzm8M7QQ3rsgwsPUzwo6X74yy2+
	 oWU7CFlsvD5DuoVzB3IDnsDokYZJOZhBUGXokAUEKYvEVdYqXFisOHXXX0OXI3uuYzQ==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1792955789;
	h=DMARC-Filter:Received:DKIM-Signature:X-Google-DKIM-Signature:
	 X-Forwarded-Encrypted:X-Gm-Message-State:X-Gm-Gg:X-Received:Received:
	 From:To:Cc:Subject:Date:Message-ID:X-Mailer:In-Reply-To:References:
	 MIME-Version:Content-Transfer-Encoding;
	bh=7DeFc9otasxZEGZwFUzRH8RX2baoMN1ocp4U5Fzi2nY=;
	b=sam8yxFD0+OohzN2KeDuflRxWrwydaraUeDO4x1igPpydwMgwEg9WifbASIJjfxkG2Ny
	 PNNZ4RaJI9KdoIR6V/BwQOZCuhjDJYH5hfgNAAzd+qIei5jEVZkZf5uVOxqzmCBspQOEL
	 x9l/iUN7IEzDOXLc5JmlOs/rYOMtb4E+IJTJC8FzMB3c8nvC6bhVfHuUIn6WYbRIzY7ov
	 SlQ3if8aUsup5F4/+uX2km6zNvY53kWFCjdSS1/Ozw6YicIrqhFc48lL8vArIWSE264oX
	 aE5YrJhfVgfspdFG9ihMOWI66KYKW7cvNBG7TvA0iSgzQrYnX6SNUX2xTJ6i+y+2tgg==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=fail header.from=mgcrea.io;
	spf=pass smtp.mailfrom=mg-crea.com;
	dkim=pass header.d=mg-crea-com.20251104.gappssmtp.com header.i=@mg-crea-com.20251104.gappssmtp.com header.a=rsa-sha256 header.s=20251104 header.b=oh7valtr;
	arc=none smtp.remote-ip=209.85.221.44
Received: from mail-wr1-f44.google.com (mail-wr1-f44.google.com [209.85.221.44])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 88751606A31B
	for <devicetree@vger.kernel.org>; Sun, 25 Oct 2026 19:16:28 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org 88751606A31B
Authentication-Results: smtp.subspace.kernel.org; dmarc=fail (p=none dis=none) header.from=mgcrea.io
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=mg-crea.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key, unprotected) header.d=mg-crea-com.20251104.gappssmtp.com header.i=@mg-crea-com.20251104.gappssmtp.com header.a=rsa-sha256 header.s=20251104 header.b=oh7valtr
Received: by mail-wr1-f44.google.com with SMTP id ffacd0b85a97d-48e0d1c095dso1383554f8f.1
        for <devicetree@vger.kernel.org>; Sun, 25 Oct 2026 12:16:28 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=mg-crea-com.20251104.gappssmtp.com; s=20251104; t=1792955787; x=1793560587; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=7DeFc9otasxZEGZwFUzRH8RX2baoMN1ocp4U5Fzi2nY=;
        b=oh7valtrkmKMdQvevEIpsbvmUYS2B86kxe5EKnfOszdH2bZ5JD/mQJdXd09w1JLvB1
         Qt1vbg3Ag8vO2VyqUOg8spaLE9Nqrc+6dCGWuHUVb4MXjPWuoAJRqu25eCTysrd0lbdA
         0NMw6g6MsvCMwt3BnY8Uua8CgnqlLA8TlLqL5jiY0Vk+Z94uq0caKIoBaVdRsfHK/xo/
         E64RojtF55nfs9sE+8L7z3dxtzKnjbMkinWa9wtWlJ+r2gvs+NVqTmQ7mrozV5b/3cZ6
         xIjZwiYjoAs4ZgGnwDpSG1hhuXxplXaeMIimJHEVDVT2tp1G71EcmMTTLBU1NF1GlkWW
         ecCA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1792955787; x=1793560587;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to:content-type;
        bh=7DeFc9otasxZEGZwFUzRH8RX2baoMN1ocp4U5Fzi2nY=;
        b=CClWDSN41wgsICNZOD9EMvf5boQbtcxmBijauPrmBSwS/u2ifI8bHk1AC1TdfmvOlP
         wDaDvPtA2EihODKwzhKRSnDEF77IAIc8RmSa4e+qcCo01Y7oCiMbUVwELAfxGmcFjk7M
         ejwiMODueM8fzbJSRBIXIWUjdGFWzHIXxoluANtQdgc/kWACpcpopclQDBD3ol17WVLQ
         HMAxxKUa02zRrN9ozH00goI6z9Cx7ao+jEfomT0lrIL0B83MDpQxkhbgQyLfQSa3PcVG
         Z9BLTCnz/A0/axLMGyqO4jxLKQ7kFmpgHkMjqELbsA4xJA9n5nLgFjWatj9wJBK4a1mV
         Jy+Q==
X-Forwarded-Encrypted: i=1; AKwUvByD9gyGYKUmeoO0DWMEPGJfoOguHSnzvH+I/V4SEup28Q3tLU4GaDzClDSpxr+A/hu5EhC0cwTSW2wC@vger.kernel.org
X-Gm-Message-State: AFq9FYLrHqrGO+Ec8IdHsNd/zNNeUJcpj6WajFt+hNKBuI9G4rSfx/T8
	XJixay6TPA5UXZtl6Y/W++cZnH0lfsr5uMC4JLSxXZT73pVaAGNnotNkPJ+4JCmtbT4=
X-Gm-Gg: AYBFou12uD3UXOlOhsESDWxCe/jzynVdQiWhYLj7s/2B8zgT9M5UVqXkGBpIrhStm0i
	wI8l3BKM/0mTZ5SYJgrBdToEG1Od9Umae1z/Eo6TYO1cXqiBhT6iSh71Lcm6FINeCd1TKahyW5J
	gLAeqpZDM/SaLcPQAF/RcmzslhJLtfAmqAl3drRV2kgoSB+rbZOzctmZchOurjujB6+3QhQTHDJ
	9Qpyt8fAQy5HkZwnhAkw6vtXiuEzvNTnhRgjkqHR1Td4b+Lj9Gh9VoCX7pfGUR1sn7a3wvaELcd
	jDcNsStKFMGFZuGEu7/s2HcopKEifA+LbsYgEwhyhYJS7NZCaZNTZjxZWwbFOCb3ZvEw5WKFgPC
	0VZAgiCcby4cjg2C0wrSPaVoyNZUEc9hawUvlCKKDpfS8sfnQXL+fct7JVLv5I2FYR0jzJBuGj9
	j7JHCwmLxOlH/umQ1RxrcMsnrtsE7A5vQ7AtZZBi7859iGeMoEd1rodEAs2n+8lneNXnV5zblS7
	q7ZFmQ9Yj3KtGXoojymH1Eesg2SQDDNfb4JAKYbHpXYG49Vksk9tjGuHAi123XZanDVf4is6FPv
	e62jMvZhwZ19USx1aZu8LDliPAkBwYbJcLw=
X-Received: by 2002:adf:ff81:0:b0:48d:f58f:c98 with SMTP id ffacd0b85a97d-48e3eb9e34amr6121463f8f.40.1792955786568;
        Sun, 25 Oct 2026 12:16:26 -0700 (PDT)
Received: from localhost.localdomain ([2a01:e0a:9d2:5a71:6dfc:5715:ead7:7540])
        by smtp.gmail.com with ESMTPSA id ffacd0b85a97d-48e3ebc3bcdsm10082051f8f.13.2026.10.25.12.16.25
        (version=TLS1_3 cipher=TLS_CHACHA20_POLY1305_SHA256 bits=256/256);
        Sun, 25 Oct 2026 12:16:26 -0700 (PDT)
From: Olivier Louvignes <olivier@mgcrea.io>
To: =?UTF-8?q?Uwe=20Kleine-K=C3=B6nig?= <ukleinek@kernel.org>
Cc: Rob Herring <robh@kernel.org>,
	Krzysztof Kozlowski <krzk+dt@kernel.org>,
	Conor Dooley <conor+dt@kernel.org>,
	Paul Cercueil <paul@crapouillou.net>,
	"H . Nikolaus Schaller" <hns@goldelico.com>,
	linux-pwm@vger.kernel.org,
	devicetree@vger.kernel.org,
	linux-mips@vger.kernel.org,
	linux-kernel@vger.kernel.org,
	Olivier Louvignes <olivier@mgcrea.io>
Subject: [PATCH v2 1/2] dt-bindings: pwm: Add the Ingenic X1600 PWM controller
Date: Sun, 25 Oct 2026 20:16:23 +0100
Message-ID: <20261025191624.9219-2-olivier@mgcrea.io>
X-Mailer: git-send-email 2.54.0
In-Reply-To: <20261025191624.9219-1-olivier@mgcrea.io>
References: <20261025191624.9219-1-olivier@mgcrea.io>
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

The X1600 has an eight-channel PWM controller of its own, separate from
the TCU timers that drive the PWMs of earlier Ingenic SoCs
(ingenic,tcu.yaml), so it gets a binding of its own.

Signed-off-by: Olivier Louvignes <olivier@mgcrea.io>
---
 .../bindings/pwm/ingenic,x1600-pwm.yaml       | 47 +++++++++++++++++++
 MAINTAINERS                                   |  5 ++
 2 files changed, 52 insertions(+)
 create mode 100644 Documentation/devicetree/bindings/pwm/ingenic,x1600-pwm.yaml

diff --git a/Documentation/devicetree/bindings/pwm/ingenic,x1600-pwm.yaml b/Documentation/devicetree/bindings/pwm/ingenic,x1600-pwm.yaml
new file mode 100644
index 000000000000..3ecaa92a5ca2
--- /dev/null
+++ b/Documentation/devicetree/bindings/pwm/ingenic,x1600-pwm.yaml
@@ -0,0 +1,47 @@
+# SPDX-License-Identifier: (GPL-2.0-only OR BSD-2-Clause)
+%YAML 1.2
+---
+$id: http://devicetree.org/schemas/pwm/ingenic,x1600-pwm.yaml#
+$schema: http://devicetree.org/meta-schemas/core.yaml#
+
+title: Ingenic X1600 PWM controller
+
+maintainers:
+  - Olivier Louvignes <olivier@mgcrea.io>
+
+description:
+  The eight-channel PWM controller of the Ingenic X1600 SoC, separate from
+  the TCU timers that drive the PWMs of earlier Ingenic SoCs.
+
+allOf:
+  - $ref: pwm.yaml#
+
+properties:
+  compatible:
+    const: ingenic,x1600-pwm
+
+  reg:
+    maxItems: 1
+
+  clocks:
+    maxItems: 1
+
+  "#pwm-cells":
+    const: 3
+
+required:
+  - compatible
+  - reg
+  - clocks
+  - "#pwm-cells"
+
+unevaluatedProperties: false
+
+examples:
+  - |
+    pwm@134c0000 {
+        compatible = "ingenic,x1600-pwm";
+        reg = <0x134c0000 0x200>;
+        clocks = <&cgu 21>;
+        #pwm-cells = <3>;
+    };
diff --git a/MAINTAINERS b/MAINTAINERS
index 3a19da74d00c..c905aa13bcbc 100644
--- a/MAINTAINERS
+++ b/MAINTAINERS
@@ -12878,6 +12878,11 @@ F:	include/linux/mfd/ingenic-tcu.h
 F:	sound/soc/codecs/jz47*
 F:	sound/soc/jz4740/
 
+INGENIC X1600 PWM DRIVER
+M:	Olivier Louvignes <olivier@mgcrea.io>
+S:	Maintained
+F:	Documentation/devicetree/bindings/pwm/ingenic,x1600-pwm.yaml
+
 INJOINIC IP5xxx POWER BANK IC DRIVER
 M:	Samuel Holland <samuel@sholland.org>
 S:	Maintained
-- 
2.39.5

