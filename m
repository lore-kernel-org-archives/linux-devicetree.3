Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=209.85.221.53
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1794173314;
	b=J4onDq1FCKK+HgT8VInpbFBzfvjq0BwK3l3GlxawZtZqCFVo83w1Jn8PFkIzjhAhf49R
	 gejH4jiUo0B1GqPDfYeJ3SooY9eAclvOMskg9L0VaIVYXbIgDaYzFemTVuWkLMDYinE5w
	 Pq0hz+ZTAks35lVJOwiDd1JFXkyotpoyaZCI2UBp3DUitmGVTp36jPS7qrNoNOQg8CiPE
	 19qpJ+v5oLPjZ6L3zxn1TFn+UKiqaY/5tC3lTGp/3VhbdEntgqVzH6dYo1RD+yaTnV4T4
	 GwUzRGgCEWVJsp38Y4SwPUa2HRAtOlZFkg80IpN2lQYchpy0s1oGpQCdywTTWGm+Qwg==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1794173314;
	h=DMARC-Filter:Received:DKIM-Signature:X-Google-DKIM-Signature:
	 X-Forwarded-Encrypted:X-Gm-Message-State:X-Gm-Gg:X-Received:Received:
	 From:To:Cc:Subject:Date:Message-ID:X-Mailer:In-Reply-To:References:
	 MIME-Version:Content-Transfer-Encoding;
	bh=QXRVCJ6p53mhv78a1V9znscskgidqnRubCEiNV0CGUQ=;
	b=RJf1/nQNsxk8FWsQ7gzkZFArfSl//x/9krmu6nlMZPTvyB6UDFvWVwSDe0fZpiJQtEU5
	 5LeWEbN9x6qPtElhwXP711ecLVgtr3fNtDXmb13ww0mj15CbP4Qtod+nbI6G1JanERPBS
	 WqD77eh+vAC5rMvj9yoixzxgrPw9uEUCxCNZRf9jH42YMjCKFaCpJyhp3nqq8sxvVD3Fq
	 J3Wop0Wcfq4PBMZxzZlUwdv9s1da861a083COnwVfhEHBi4elpC5FuTGamCiLbmkcvmDP
	 WvdDyzHb25RR7sFfVCnFf+Dx5qdJAEjYwzNwFlEwEoSJrNYKj2x+X4aCCcvIuzzT/pQ==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=gmail.com;
	spf=pass smtp.mailfrom=gmail.com;
	dkim=pass header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20260707 header.b=XL57eWKD;
	arc=none smtp.remote-ip=209.85.221.53
Received: from mail-wr1-f53.google.com (mail-wr1-f53.google.com [209.85.221.53])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 68CA4606A323
	for <devicetree@vger.kernel.org>; Sun,  8 Nov 2026 21:28:34 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org 68CA4606A323
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20260707 header.b=XL57eWKD
Received: by mail-wr1-f53.google.com with SMTP id ffacd0b85a97d-49134c8509fso233132f8f.1
        for <devicetree@vger.kernel.org>; Sun, 08 Nov 2026 13:28:34 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20260707; t=1794173313; x=1794778113; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=QXRVCJ6p53mhv78a1V9znscskgidqnRubCEiNV0CGUQ=;
        b=XL57eWKD2uSIcrWKMYH6JeAdiayS1nITNSJ6dRBeiD5M1VHBITmr+3boaUCWUOXPfS
         fuhPT0Cm+8KFc9DJY+p6tgTcg8cgRE/GLbzcbZkJJWbJCEw/g90pwPxX5GOKeAZLEjAn
         WkP7dbiM7+YTF4PoAZCpF6KznK4QsxdADNm8cN5YrAr0Ae8FzEh9IgeIKCeWTLcfcBs+
         Cajlw3AAq9MoU4zlV9JI6ne05Tn9tMTd8KoP8OPLVRQMGj5lI09Xpt0kx96GE0QvCvjJ
         sb7J211O3xzW632+9Q6m2vjahMDfgUYE2mLdSzb1ErY//CWCF4glgBju2qPMgXhJNiRO
         31TQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1794173313; x=1794778113;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to:content-type;
        bh=QXRVCJ6p53mhv78a1V9znscskgidqnRubCEiNV0CGUQ=;
        b=2yuW4lVF7RROrmy22jbLsliSulIWn2SgT9yUXt/huRp7daQIt2hvLDQJv2LuaBDYBx
         56kBc0O+iJQzZBvogx0/u9+HIyF7K709CCYyS9QRaVAGqqEzEGY9gzwNpEMHrJLbbDwi
         sp1BXtCOzuGhUzg2u3pql3pBRJ/vLdp+YoEeMziyaSDPcMJvJDGr+XmUO4yKDVU3lxzp
         o9dpPI1YsvgNJbLwSKaFeESPi/UMxsoeM3KCklGPLe0fFo2qFrEAGD09oGfC3Uh/WoeM
         J9LMu95o15CcEESxL1RmZw5f4HayPK7d49GkdSGCAIEADbvTPIE/WDCq51q8ARFmbQAH
         Dtxw==
X-Forwarded-Encrypted: i=1; AL+hErFxXpld5k1Wa+zG93gUSQVRw9IIARLwg75cTLPtpKrcuVGlsXBWwafSScXmEBBZUWwGVswPoNf6jO7c@vger.kernel.org
X-Gm-Message-State: APuU4Z+sWt7QFXccUERGm7IUSuzKW/2fznmApdAgGdjRdJVR9zg4/8GY
	93EuZ8BOoymiSuUi/fHuq+tF51dSo+qKumVvZhgm/Mg6IUgUC98TAaX6rVahx5yN
X-Gm-Gg: AYBFou2h/Jt3KLBSHYLM774blUSLCTzMojXwAv6exC6bvRgDHDlytlhFW7p16quGDcl
	y+gkULUJHZwzSD/qaKwQmumTx7B5ZwJBZguqeLTgBoBAjwMjS0ihQpYtl3M0ZKAjn0Pua2Q+OoV
	bwvhqoFLIejdoFedh6QbBrdpTEf0o9pnAdn1xYvcFVWVyZwssoop/9V8lLfSBN7hAbC11k9pNgc
	cI1Gk65ViDwuahLfQkqYhqjfUc/53D2nPFLp4UCBKccj3JP0pxG2ZIan7Bg3CDqyxt8hvYaQ1yQ
	xwAxDag7j0nK3qbUZsUdPmGWVtcwWrXZpalt87WmsjE0V+bYG6mPpnmILUc+HhZhMBpQ9TGNfE9
	SWhx4MqPK4o6mBnQprh/YKej94rOZawFXOt/htJnlYeNqiHqo8SjFvW9cCxxsFUVY4z2mz3edCN
	JeuPgifjiGI0oOksEPdPMbyYts2a3a7jTU6aDfhS6tRmGNQAIzhUJj+qlFyjW1RXduv6YP/vl9D
	dP1gXu97BZScfsAUapoZ6QY5FGmuUbLBkayGo/UyDBHGL3TF5QYw26GW5L2n6InemIq/v4AjNR1
	MYCUnXFhDcSpFvwWVs203KklNkbOnKmlRA==
X-Received: by 2002:a05:6000:260b:b0:48b:108:48cf with SMTP id ffacd0b85a97d-495844a312emr4255528f8f.25.1794173312645;
        Sun, 08 Nov 2026 13:28:32 -0800 (PST)
Received: from hp-z640.fritz.box ([109.76.148.69])
        by smtp.gmail.com with ESMTPSA id ffacd0b85a97d-49597091400sm5692050f8f.32.2026.11.08.13.28.29
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Sun, 08 Nov 2026 13:28:30 -0800 (PST)
From: Owen O'Hehir <oo.hehir@gmail.com>
To: Alexandre Belloni <alexandre.belloni@bootlin.com>,
	linux-rtc@vger.kernel.org
Cc: Rob Herring <robh@kernel.org>,
	Krzysztof Kozlowski <krzk+dt@kernel.org>,
	Conor Dooley <conor+dt@kernel.org>,
	Emil Renner Berthing <kernel@esmil.dk>,
	Paul Walmsley <pjw@kernel.org>,
	Palmer Dabbelt <palmer@dabbelt.com>,
	Albert Ou <aou@eecs.berkeley.edu>,
	Alexandre Ghiti <alex@ghiti.fr>,
	Philipp Zabel <p.zabel@pengutronix.de>,
	devicetree@vger.kernel.org,
	linux-kernel@vger.kernel.org,
	linux-riscv@lists.infradead.org,
	Hal Feng <hal.feng@starfivetech.com>,
	"ziv.xu" <ziv.xu@starfivetech.com>,
	Conor Dooley <conor@kernel.org>,
	=?UTF-8?q?Uwe=20Kleine-K=C3=B6nig?= <u.kleine-koenig@baylibre.com>
Subject: [PATCH v2 1/4] dt-bindings: rtc: Add StarFive JH7110 RTC
Date: Sun,  8 Nov 2026 21:28:23 +0000
Message-ID: <20261108212826.15890-2-oo.hehir@gmail.com>
X-Mailer: git-send-email 2.43.0
In-Reply-To: <20261108212826.15890-1-oo.hehir@gmail.com>
References: <20261108212826.15890-1-oo.hehir@gmail.com>
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

Describe the RTC in the always-on domain of the StarFive JH7110 SoC.

Signed-off-by: Owen O'Hehir <oo.hehir@gmail.com>
---
 .../bindings/rtc/starfive,jh7110-rtc.yaml     | 85 +++++++++++++++++++
 1 file changed, 85 insertions(+)
 create mode 100644 Documentation/devicetree/bindings/rtc/starfive,jh7110-rtc.yaml

diff --git a/Documentation/devicetree/bindings/rtc/starfive,jh7110-rtc.yaml b/Documentation/devicetree/bindings/rtc/starfive,jh7110-rtc.yaml
new file mode 100644
index 000000000..a88ab91ab
--- /dev/null
+++ b/Documentation/devicetree/bindings/rtc/starfive,jh7110-rtc.yaml
@@ -0,0 +1,85 @@
+# SPDX-License-Identifier: (GPL-2.0-only OR BSD-2-Clause)
+%YAML 1.2
+---
+$id: http://devicetree.org/schemas/rtc/starfive,jh7110-rtc.yaml#
+$schema: http://devicetree.org/meta-schemas/core.yaml#
+
+title: StarFive JH7110 Real Time Clock
+
+maintainers:
+  - Owen O'Hehir <oo.hehir@gmail.com>
+
+description:
+  The RTC in the always-on domain of the StarFive JH7110 SoC. It counts BCD
+  time and date from a 32.768 kHz clock and has an alarm, a frequency offset
+  adjustment and millisecond and one-second pulse outputs.
+
+allOf:
+  - $ref: rtc.yaml#
+
+properties:
+  compatible:
+    const: starfive,jh7110-rtc
+
+  reg:
+    maxItems: 1
+
+  interrupts:
+    items:
+      - description: Millisecond pulse
+      - description: One-second pulse
+      - description: Alarm and calibration events
+
+  interrupt-names:
+    items:
+      - const: ms-pulse
+      - const: sec-pulse
+      - const: rtc
+
+  clocks:
+    items:
+      - description: APB bus clock
+      - description: Calibration reference clock
+      - description: 32.768 kHz counter clock
+
+  clock-names:
+    items:
+      - const: apb
+      - const: cal
+      - const: 32k
+
+  resets:
+    items:
+      - description: 32.768 kHz counter domain reset
+      - description: APB bus reset
+      - description: Calibration reset
+
+required:
+  - compatible
+  - reg
+  - interrupts
+  - interrupt-names
+  - clocks
+  - clock-names
+  - resets
+
+unevaluatedProperties: false
+
+examples:
+  - |
+    #include <dt-bindings/clock/starfive,jh7110-crg.h>
+    #include <dt-bindings/reset/starfive,jh7110-crg.h>
+
+    rtc@17040000 {
+        compatible = "starfive,jh7110-rtc";
+        reg = <0x17040000 0x10000>;
+        interrupts = <10>, <11>, <12>;
+        interrupt-names = "ms-pulse", "sec-pulse", "rtc";
+        clocks = <&aoncrg JH7110_AONCLK_RTC_APB>,
+                 <&aoncrg JH7110_AONCLK_RTC_CAL>,
+                 <&aoncrg JH7110_AONCLK_RTC_32K>;
+        clock-names = "apb", "cal", "32k";
+        resets = <&aoncrg JH7110_AONRST_RTC_32K>,
+                 <&aoncrg JH7110_AONRST_RTC_APB>,
+                 <&aoncrg JH7110_AONRST_RTC_CAL>;
+    };
-- 
2.43.0

