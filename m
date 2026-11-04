Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=209.85.128.51
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1793795588;
	b=HRPtdPwYkEbyoj0wUtNwGQKphWgfCPr8erRsvAAQMKpOauBWnJk9Wu6hKy72u7+zA8fn
	 tsxbWty//jiePVrRXVmCbvR/jZ+0ZhJE4VA1mDfcX/TRWA+d4eWtM3YfF1GvN1JP+e6o5
	 YEsoKY2gAX4D6XvJIKhlPQcM8ZdVI0mkYdDz1EcaVaui6y8PoiVu4QitiYC0u/KJrp/VZ
	 8pPb3PfGRwI+SjTLavjqqPPb4l/yU2lWvJSYy5C2r34HbZHE2TmAy0AHugJitqoyH09ke
	 Fc85sjgIfvKsAJK9Dub0MIyRv793H+sUbIgyqs2vftwKHGm/fVLiEMLcTK6jeIZbimA==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1793795588;
	h=DMARC-Filter:Received:DKIM-Signature:X-Google-DKIM-Signature:
	 X-Forwarded-Encrypted:X-Gm-Message-State:X-Gm-Gg:X-Received:Received:
	 From:To:Cc:Subject:Date:Message-ID:X-Mailer:In-Reply-To:References:
	 MIME-Version:Content-Type:Content-Transfer-Encoding;
	bh=2Tz2Y++B7a7rKvRoX+4cYNKQyDY5thruOl2DK8uaPEY=;
	b=vidV/J+HeIvojL1f/Ba4VHf11gfOo3vXzacNjw8kSO5yKkgsKrlc+6FH8n8jfRfJijf5
	 5kULoVbRW072Acyn/s7oY+4iBM0Ue8d+H7xCwpwgr/5XXgJyC4fP4oK2rh13oDGAW+Zky
	 uG1UheFSRLr1cX/uzo+aTdVvP8AuAZPk6M19vD3Dv30V99rNCDPMFXQi5FSJ1b3IxTL6s
	 RGS0ywVf020/LgmxoPOV5igG7W6k8vNQa4C3rxYDzK96QdUnAXpttlULSTXcUviBFtrg1
	 PLryX9oilIkvh6QCPLcmde155FmDZpOvTphHhodi8jhdWq8XWqCoB8Cl++nvv/NvZ+Q==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=gmail.com;
	spf=pass smtp.mailfrom=gmail.com;
	dkim=pass header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20260707 header.b=Yog3OyDb;
	arc=none smtp.remote-ip=209.85.128.51
Received: from mail-wm1-f51.google.com (mail-wm1-f51.google.com [209.85.128.51])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 698EC606A33B
	for <devicetree@vger.kernel.org>; Wed,  4 Nov 2026 12:33:08 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org 698EC606A33B
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key, unprotected) header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20260707 header.b=Yog3OyDb
Received: by mail-wm1-f51.google.com with SMTP id 5b1f17b1804b1-4a20a37703bso4689615e9.1
        for <devicetree@vger.kernel.org>; Wed, 04 Nov 2026 04:33:08 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20260707; t=1793795587; x=1794400387; darn=vger.kernel.org;
        h=content-transfer-encoding:content-type:mime-version:references
         :in-reply-to:message-id:date:subject:cc:to:from:from:to:cc:subject
         :date:message-id:reply-to:content-type;
        bh=2Tz2Y++B7a7rKvRoX+4cYNKQyDY5thruOl2DK8uaPEY=;
        b=Yog3OyDb1q2TKjdtPXm6WYUczAoOFpStIyM/2ceCytih0faqgI4mpLtu+KHaw0el5I
         O++3e+47REx92CLnuYhbQEEFcpMlwYhBO2g9nbVvkwJaQb3wOnAyjzPp9kPBgMGjYoXT
         i98KwkG7pgyAGIhne6+M2opCERjb9gZ1kT6gseCX1ky4YWz4E9golN1JpyRbK7kw9tM/
         Irs31lfJYnMG4qIgm9aAohf+/gF7sUd2+WzM4T9X3Fz9tAs8BDAxuDGW8KV4/FWaOUBZ
         C5jepseInrn3lNT/LcqJ33u3HckdUtsPs4ZcHjTBY2yjCrD53zafkTliwXTrTQeX3c+x
         Q4pQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1793795587; x=1794400387;
        h=content-transfer-encoding:content-type:mime-version:references
         :in-reply-to:message-id:date:subject:cc:to:from:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=2Tz2Y++B7a7rKvRoX+4cYNKQyDY5thruOl2DK8uaPEY=;
        b=buNr2UpQjjTeVs8CIXLjK8FJKbe14y1+Esji82XA956HDqDJoKWElr6QrEQAbRmF2s
         PtX/c8FnF59moZmjT32KhQfWGlLZYuAPI652A20IsNAOE5DvYOMMIqnoVX/M/QmOzCSr
         u4rZu1LVOOjCjijPGlZvJhBvJM5zBSd/fnBsTYeCPCIMA451q7VtSos8PpteGuRStI7c
         g4rwyikbl3ym7gigIU8/Zx2FPvfbeaiib5zs5VqfhnfQj3tRID3f7qX+aJthNnmUMEfZ
         VyEpj+krhSAL0xZ2YcHXDzyo70dp1mlOEdB60p7J4w3SgrqolplSgASGEj1Qso1zifqk
         7qGQ==
X-Forwarded-Encrypted: i=1; AKwUvBzSf43zrN35RgZ41BD/t+j/w0A41BBD7zzcc+rlGyfpZ5g1zwyblnxm01kWOKGzFhuZWMXkNRzCa0rz@vger.kernel.org
X-Gm-Message-State: APuU4Z+yiFIUZOMFw4S4L5WM8yWkpfp2tkTq1iESQPq/E7SYsuGEw8LM
	M9LsgALMAz3OCy3abD5SbyUg9fNO1foBuInu5IL5JiZ1wWNm9kPrpBixq6nc1w==
X-Gm-Gg: AYBFou14R9Vx1OohABmf0Tavz7ISrNBdlmdprS/Jfi5xNKgfu8+9PTY4J6vVd4Y5fF1
	Va1u8HetcG47ltUYRgg0CqsIj+Iw6fFamTVU9Qb+rDZ9RaqWWbNOipTcgIy5iffYcAtHqOzAj38
	dr5F+Ce7EeM9u1GyNGJu3VJbDBI5FJWPKO5yBOlw7cBvqWQPVtC5DOPE+HxDJ4pAUYRL5LukVt1
	airySCApXbXdB02RcugLIkSBXKIR4UxZcUdc9OIGw/pnCSwJ54O7fKQxVaXiqFC1mA4/FBir7ui
	2tkpAlR2OoJI8Jr6h5Z+9vcSySi82gyaNqcJuCvv95NUu+Be7eA8r0rqgbAn2OVqK/DZvuuuFeH
	IW8wp9KrDskgLtFSVvBOPh1VqbNRWk+5t/Zwnw6hNPY4NvBkNwIYiFSwSuFUlXNzj3rBz8X6qLs
	UN+o0VI90NpAYCwPeB3YtANKgzXRyJnRI2mtA6zRnaQAjSZr2M5lFNzf9fLlEuII27BPuXWI3Gk
	oA2XAeKRKSltJji5WgNreQpg3g0z5sTRc0h5uav7m9xkSTdWw4SjxxOXi7WOPAvLJRK/0UK4LVZ
	tHYiR3IWMA9eZvO2TzziX5qNVSKnbbbBlDmbcT3gcJVCIVnqkXc=
X-Received: by 2002:a05:600c:5397:b0:4a1:dfaf:f465 with SMTP id 5b1f17b1804b1-4ac15584cd0mr357132435e9.4.1793795586634;
        Wed, 04 Nov 2026 04:33:06 -0800 (PST)
Received: from xeon ([188.163.112.62])
        by smtp.gmail.com with ESMTPSA id ffacd0b85a97d-48fecac1caesm3509380f8f.17.2026.11.04.04.33.04
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 04 Nov 2026 04:33:04 -0800 (PST)
From: Svyatoslav Ryhel <clamor95@gmail.com>
To: Liam Girdwood <lgirdwood@gmail.com>,
	Mark Brown <broonie@kernel.org>,
	Rob Herring <robh@kernel.org>,
	Krzysztof Kozlowski <krzk+dt@kernel.org>,
	Conor Dooley <conor+dt@kernel.org>,
	Jaroslav Kysela <perex@perex.cz>,
	Takashi Iwai <tiwai@suse.com>,
	Svyatoslav Ryhel <clamor95@gmail.com>
Cc: linux-sound@vger.kernel.org,
	devicetree@vger.kernel.org,
	linux-kernel@vger.kernel.org
Subject: [PATCH v4 1/2] ASoC: dt-bindings: Document FM34NE DSP
Date: Wed,  4 Nov 2026 14:32:46 +0200
Message-ID: <20261104123249.227920-2-clamor95@gmail.com>
X-Mailer: git-send-email 2.53.0
In-Reply-To: <20261104123249.227920-1-clamor95@gmail.com>
References: <20261104123249.227920-1-clamor95@gmail.com>
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

Document the FM34NE DSP based voice processor used in the ASUS Transformer
devices.

Signed-off-by: Svyatoslav Ryhel <clamor95@gmail.com>
---
 .../bindings/dsp/asus,tf201-dsp.yaml          | 74 +++++++++++++++++++
 1 file changed, 74 insertions(+)
 create mode 100644 Documentation/devicetree/bindings/dsp/asus,tf201-dsp.yaml

diff --git a/Documentation/devicetree/bindings/dsp/asus,tf201-dsp.yaml b/Documentation/devicetree/bindings/dsp/asus,tf201-dsp.yaml
new file mode 100644
index 0000000000000..8b39089c99a9d
--- /dev/null
+++ b/Documentation/devicetree/bindings/dsp/asus,tf201-dsp.yaml
@@ -0,0 +1,74 @@
+# SPDX-License-Identifier: (GPL-2.0-only OR BSD-2-Clause)
+%YAML 1.2
+---
+$id: http://devicetree.org/schemas/dsp/asus,tf201-dsp.yaml#
+$schema: http://devicetree.org/meta-schemas/core.yaml#
+
+title: Fortemedia FM34NE based voice processor
+
+description:
+  Fortemedia FM34NE is a hardware voice processor (DSP — Digital Signal
+  Processor) designed by Fortemedia. It specializes in real-time audio
+  processing, focusing on noise suppression and echo cancellation.
+
+maintainers:
+  - Svyatoslav Ryhel <clamor95@gmail.com>
+
+properties:
+  compatible:
+    enum:
+      - asus,sl101-dsp
+      - asus,tf101-dsp
+      - asus,tf201-dsp
+      - asus,tf300t-dsp
+      - asus,tf700t-dsp
+      - pegatron,chagall-dsp
+
+  reg:
+    maxItems: 1
+
+  clocks:
+    items:
+      - description: Master clock to the DSP
+
+  reset-gpios:
+    maxItems: 1
+
+  bypass-gpios:
+    maxItems: 1
+    description: Signal that switches DSP into programming mode.
+
+  vdd-supply: true
+
+  port:
+    $ref: /schemas/sound/audio-graph-port.yaml#
+    unevaluatedProperties: false
+
+required:
+  - compatible
+  - reg
+  - bypass-gpios
+
+unevaluatedProperties: false
+
+examples:
+  - |
+    #include <dt-bindings/gpio/gpio.h>
+
+    i2c {
+        #address-cells = <1>;
+        #size-cells = <0>;
+
+        dsp@60 {
+            compatible = "asus,tf201-dsp";
+            reg = <0x60>;
+
+            clocks = <&fm34ne_clk>;
+
+            bypass-gpios = <&gpio 222 GPIO_ACTIVE_HIGH>;
+            reset-gpios = <&gpio 115 GPIO_ACTIVE_LOW>;
+
+            vdd-supply = <&vdd_1v8_dsp>;
+        };
+    };
+...
-- 
2.53.0

