Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=209.85.221.42
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1793987768;
	b=ASTAsRQ2cdFG0ai5sD3zUPb2nOTF+MWq2CZwIF7oSaWikzib8z8mdNQLS9/3y4i8Eack
	 baHqM40iskS6t+n5XmLBtMNc/0aYyOIfo3hRJgUqPS1gnnzQSfAOZLBOlb6a7yw6eI/G8
	 8nvbT45mA5ayIue7B8bkXC2qhbr8WUPbwaD/AUFX4BAOS8OQtigOxqMPVVFiPjGOGjofn
	 pB+ZjZlDcA06sZ4u3TXVgndex462zHMKDiQTP/obBV8i49/f8g4L/9mZUnxXYFHzUUUkO
	 x8N3IcJyMwzLiL3oNomn1xxnIYoF9ppcu7ztvWArh1zn1c7oQSztn/BtNLgpjNV3C9Q==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1793987768;
	h=DMARC-Filter:Received:DKIM-Signature:X-Google-DKIM-Signature:
	 X-Forwarded-Encrypted:X-Gm-Message-State:X-Gm-Gg:X-Received:Received:
	 From:To:Cc:Subject:Date:Message-ID:X-Mailer:In-Reply-To:References:
	 MIME-Version:Content-Transfer-Encoding;
	bh=RjB3LwZzxEuGJFQm9nKda7FlL6d4DBHlBEZNuNA4128=;
	b=ilq/OoCXFbyZ/59bnE44pF1l/c4WBuNkVsYMf2GsF/Epi+yAMtnZ1wOylcQ3FLhd1jY4
	 vJbZ2bd4nviq33Jb6nDyj7RKlVq5JMMCpjpHmkU+ke0b1YdTkw6zvz0H+llgcXMGYV9FD
	 weAW4TD+QRU/cDRnPvWvGCEo1+RbRUwyCnLEeFravc6TleV1cHV5J4xBgCuc35Kuowpqv
	 zlne7dIkEBYwF6LU8/YDUoJ25LcrT/Bt75kQpO2oqjiVcdWFw/DnCUFoNbw+M2kOclyTf
	 /CkwnDjflrwunlIvFKdXXQ/wuSeXh+EpCI52Veww4Lc5fUTxLvKbOqggPd1R2PcgJVw==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=gmail.com;
	spf=pass smtp.mailfrom=gmail.com;
	dkim=pass header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20260707 header.b=JJ04Jo98;
	arc=none smtp.remote-ip=209.85.221.42
Received: from mail-wr1-f42.google.com (mail-wr1-f42.google.com [209.85.221.42])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id C7572606A334
	for <devicetree@vger.kernel.org>; Fri,  6 Nov 2026 17:56:07 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org C7572606A334
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key, unprotected) header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20260707 header.b=JJ04Jo98
Received: by mail-wr1-f42.google.com with SMTP id ffacd0b85a97d-49376eb635fso342240f8f.1
        for <devicetree@vger.kernel.org>; Fri, 06 Nov 2026 09:56:07 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20260707; t=1793987766; x=1794592566; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=RjB3LwZzxEuGJFQm9nKda7FlL6d4DBHlBEZNuNA4128=;
        b=JJ04Jo982Z4RDDmlzz+Dje1vhQSA5oqF0L1kZsorXI54ruOpMg4NkVjlSr49EflGuj
         GlR+1KATWJjd+j/Cebv65TWQmQfFY6LyFSqChNdhiitwEAODefziDW5Q9BCVxv/cPend
         AOg0G7VTygcfJzPilB4kJxNDk0+86VXyu//dSGE25pjefslfXz3xTuHClGDSkv1lulG+
         iuDtud1D5yPTikZaIHSyODzc/Dq2uZ/ZWiBnQJN1CnVSZ5dkEcu9Y10LLkhC4PPgI5zj
         XUH8BLHuEyuPS0R2E9X1vhPb5XsLSMpVo+0WF1/xdsPseFoUHvjPl1LmgQrcg2gQM7yS
         +s9g==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1793987766; x=1794592566;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to:content-type;
        bh=RjB3LwZzxEuGJFQm9nKda7FlL6d4DBHlBEZNuNA4128=;
        b=XSwX+kyA07fdi5U6KyU/fkxXdwMwTiArEQW5uiL2Zzgszv3FspDxGewPqNAomsV6F/
         3PFil7HmkhenJN9h4E1bV5Ni4jTrcRvpatS7vrXZKYXKgaZCVHLFDkGBltl7nIvewZn3
         Ke8wAXYjssoG+gwA+Pf9reYgtuVHjT7PC5uVcg0V/+kakabMXALk/hxxUXfvipx7IWYx
         NXVCVUvPDnOO+vkoAfGZ1AC6Ue0v/SLH3+Rr1GhBRTK/1rY4Vne8NrBbdFgCYyWrJ2Y5
         4f/Acsz03U8oJWs4+aQAd3WE4C6cxnfeY8uQw2pFRI5/jHYzqkC0sJiNzEvKsRnUcazX
         kNqA==
X-Forwarded-Encrypted: i=1; AL+hErELd+LIW20GrDDCetoxJPowa2ybrdlihpJe1e5E31kmcI6fjVzGz0IjdUyRMKt6W2RBfeY88SnDEEwo@vger.kernel.org
X-Gm-Message-State: APuU4Z+soG1IP1WnJJJiArp4Mig/8Gpa2lQnUZcRN5KS6DmP5UjfGgyC
	5nE/fIIN6wRQdBcOjGgm74DXMJ/S36LO0rQDYo+Y+91Qem+baOclGk6s
X-Gm-Gg: AYBFou3Sr1ypXK3Wdv6VonUIBsEEPdBBC3Otf1DFhXPG5LkvSE6H5Iamezi5kpEha5A
	YohlargMzbHNoQXh9ICPvOKZT2eULK4DV6BJ6nWTzxqvgD5QaLxJL8ZjKU1atRkpoCLP+4OTlNy
	K0qNsMIjfCjOZaWx4KR6Yj8s3a6dqlPz0pdWSJt8nZJmgys8PEIm9NPkoc9/FXK8Fj/ci8x3+Nz
	929uDcvOC2K6wp95i+ic1UhQnCT/twFvywi6Q0PEPpAM8q023EPjV621lyHkzjHN06qgN/KjAR4
	svS1O/hRAdwv7JPu442BpTI9bF2PHFCajbXJCrYt2KKu6F41InMjagUh8T3IprYQsLKUL2MUwnK
	SVHH2PHvZWzEqxav4bsvwQTSRHeyIQ2OEzGyPdrtAGrOXDu7QlGPK9hUAxcYIx/sNoJJ7UhXosN
	38CDxdBORSSaSs6ST8LDKvSkcWv1nxV1FKJroParDMhH8PyD95u6wWjRVCiAmFmBdeNl0PWOC8Q
	KqP9+XVBfaXIOu51AgbXYwljTAEQo4t/OqiW5Nvqu7zavcTBGRZcuoZJ34WfpxGd/j5ZU0KV4/u
	vWHmPAJJOE3K6IRxTbqtoBu7oTngrZE=
X-Received: by 2002:a05:6000:144c:b0:490:88e5:92d6 with SMTP id ffacd0b85a97d-49277f881e8mr7918178f8f.49.1793987766143;
        Fri, 06 Nov 2026 09:56:06 -0800 (PST)
Received: from hp-z640.fritz.box ([64.43.161.7])
        by smtp.gmail.com with ESMTPSA id ffacd0b85a97d-492d723283dsm4649612f8f.23.2026.11.06.09.56.04
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 06 Nov 2026 09:56:05 -0800 (PST)
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
	Conor Dooley <conor@kernel.org>
Subject: [PATCH 1/3] dt-bindings: rtc: Add StarFive JH7110 RTC
Date: Fri,  6 Nov 2026 17:55:58 +0000
Message-ID: <20261106175600.3877614-2-oo.hehir@gmail.com>
X-Mailer: git-send-email 2.43.0
In-Reply-To: <20261106175600.3877614-1-oo.hehir@gmail.com>
References: <20261106175600.3877614-1-oo.hehir@gmail.com>
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
index 000000000..95edddea1
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
+  - Alexandre Belloni <alexandre.belloni@bootlin.com>
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

