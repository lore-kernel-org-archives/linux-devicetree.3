Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=209.85.218.49
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1793101183;
	b=EwQ9P2IEcEo/GkOQYAeHPZODl98eVdegvajIvzGV0Jx/9kZ+uXSOrpvz+ZLOrGktHB9A
	 3rsSlqcjt5Jb0/3rvejmn/yIug+iK8d7zta1AVhM/D7OJNC7+thnznN7FjpJzJjuqcw26
	 4tEocG4rMH6hhBZ0/GpIzZgKdLXzyu4E68FY9DkqDFck8TFz+2MpnBkAY2UcKzEVrgWeO
	 hGPbDG7IfFADtzZ73v0AVHewj/DuoDueBeag7TFEGVH96n2qc1KmZVKRuM3AydpY69UJR
	 DmOypY0rNSFz8F0HRIhnbs0uKxcXRIfZ9Nboj14Usb9NAmDFXNdyQRWxPqN7YE3JIFw==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1793101183;
	h=DMARC-Filter:Received:DKIM-Signature:X-Google-DKIM-Signature:
	 X-Forwarded-Encrypted:X-Gm-Message-State:X-Gm-Gg:X-Received:Received:
	 From:To:Cc:Subject:Date:Message-ID:X-Mailer:In-Reply-To:References:
	 MIME-Version:Content-Type:Content-Transfer-Encoding;
	bh=2Tz2Y++B7a7rKvRoX+4cYNKQyDY5thruOl2DK8uaPEY=;
	b=w/dIMw8xh+N/dt9jowECt/XqlxPg/SEXl2OhBgM1dw3IBEPqEM9PBZuZyqV/nk7RC9ce
	 KAtRTsTmFrEuPWMK8RTOwV8HFyjqJkyl19eNcWJGDdJPJ8s9djj4IHck3qrJ9HEGYMy+L
	 56tHIwDcLHMP/mKL1CtjBjWRIllxOuTXS0fUhS3m+gS0Ap179tMV4d2jr/F2XIdWrEOUc
	 BQQO4V15UVNE2kkVkihwrS/VNRNiYDjRyj6hZiNyvbHKcwZditBYN1OIcZEvHm+y/x0iX
	 IvdbCamaff1cHuqNG+yKoyGTrBa/MMuqNyYFWumgpvN+LHrcKiIJ7glHT02u19Zh49w==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=gmail.com;
	spf=pass smtp.mailfrom=gmail.com;
	dkim=pass header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20251104 header.b=jKHD8slx;
	arc=none smtp.remote-ip=209.85.218.49
Received: from mail-ej1-f49.google.com (mail-ej1-f49.google.com [209.85.218.49])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 2A383606AED4
	for <devicetree@vger.kernel.org>; Tue, 27 Oct 2026 11:39:42 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org 2A383606AED4
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key, unprotected) header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20251104 header.b=jKHD8slx
Received: by mail-ej1-f49.google.com with SMTP id a640c23a62f3a-c43373ae89aso609992066b.3
        for <devicetree@vger.kernel.org>; Tue, 27 Oct 2026 04:39:42 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1793101181; x=1793705981; darn=vger.kernel.org;
        h=content-transfer-encoding:content-type:mime-version:references
         :in-reply-to:message-id:date:subject:cc:to:from:from:to:cc:subject
         :date:message-id:reply-to:content-type;
        bh=2Tz2Y++B7a7rKvRoX+4cYNKQyDY5thruOl2DK8uaPEY=;
        b=jKHD8slxvdEgGMIPpyIp1f3/cw5FGjJQx2IA3ge/1E6WkyBl1FZShR1uzjyX8h99zd
         d5o+Jk3wO4AzB67PRZ1SIEFznVW8CmRVa6w9VgjbRZ4xG0xWrtoxGUMf+58b51/wKAvu
         nRuyAbPHkMnS4v6kTNDBV8ps7DHjBXgvvcEOAGEtAPbeuzD5ZmX3B7pC7U0GO7hE6i5P
         kWEMTog2wx51xwicF1ifAEJu5PkDeKhpcgvHNBieLqWVjXpEptC8GScCyClnXjHzyr/t
         suP7Npfl4hrOA6om3v6lJ08lc1C2R1tZeJbWJLFo3ez5eyeQkEcZ6LLjgegDgA1uXl9I
         6BeA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1793101181; x=1793705981;
        h=content-transfer-encoding:content-type:mime-version:references
         :in-reply-to:message-id:date:subject:cc:to:from:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=2Tz2Y++B7a7rKvRoX+4cYNKQyDY5thruOl2DK8uaPEY=;
        b=R+o01i/mYXs397xC4Se+izZm0zj8X19l+KMCm/6Q2jlbnXqUtl104/zf7M+lKqxUBx
         njkQjubwKLJZH1Kl6wnsI/Pkur4+Q2TM5yplEx97ChPwrAmZ9vO6mgi4D+IPD53rO1OZ
         Y2d7+PY5tYfuDWLm76Toac1onozjOEt62Lbm9SJrU6s3Tp4S0ka8c7be/6pRS1R+kBSV
         PTDTenZ9zZEwKVCV8tGVYy+Gb56w/VbZ3UQzK6cdHUi2jvAUUc+bQ1wMOfkRfWTsYhFm
         XXqGyEYkruIvX6Bf8PPh/1TyB0iv0KrKNkZ1B/lQecGXIbHkmai69WRBehTnxq9OFRl0
         2P5A==
X-Forwarded-Encrypted: i=1; AKwUvBwA7055OwD8pWRWWj6GX3gbqlzyDimWeuNnc6MqRTLwC/SEFM318rkKHWLOLMkP329N5eaP4LhQ1oYH@vger.kernel.org
X-Gm-Message-State: AFq9FYK8FrFaxmq4O3zSowYyNeCTLWkWviAjF4ySJUgmPKkiTMMuavWF
	W4U9uZ5hyFlCEE+YxLOWibvFv+5U1WDUlTM8U0zJ/C3kL91f+3aHzd+b
X-Gm-Gg: AYBFou0IDOBKm2G7JKIGJ71z5taxyY6rXn9NeYObTZAqYlX42h3JZPisj7KU1hM5JhQ
	JX28LSzVIdbk8xaZPzRtabnQsmoGY3sbt/EugFdfuWKSWfResOrrSB+Hmjkxrr9zDJxxeqXgYjV
	MhrvS424TPBJRpE7bGnjj7AP/nHKNYyTca4aZQkw1BnPWiVigjGhpjOGVUij+CKHM2fCZ8F7Dy/
	AyhoKW8EKQy1CdrNtyyeCpv9e6xyTYJhAdTMnW5NeRD9/ZAsqVouByKw2K18n0k1imgQNRWDSSW
	Tg2qtihHvcEFARiyxQQDBcqs5mNBvsh2vhG6nKjr7Uba5fR/rCXhBVYLMMA5q3ZnLJPJAAPYPT6
	ABSe62dbni37vz34sWmRaVyTZc/iIav9cMgiPSLvz6mCjvI80TMYgx+ClLj+Jf+bGfBaF/5XS7p
	UNlQl73Ctnq0GDdDwtdYFVo/PTV0xhrdzxOAq+W9ajPxS4GkfRvENRyAxR0zcwsEHYzFQq4CSQ0
	6+F+zg6GWcALzjIwwYnCTzOB5YW/JRaF8aPmXZRAe8Sko2IqsDZEqLZrZwEtwVR7NfNjxtD0jv4
	tA==
X-Received: by 2002:a17:906:f585:b0:c46:88ef:2e46 with SMTP id a640c23a62f3a-c46bdac306bmr909348466b.1.1793101181423;
        Tue, 27 Oct 2026 04:39:41 -0700 (PDT)
Received: from xeon ([188.163.112.62])
        by smtp.gmail.com with ESMTPSA id a640c23a62f3a-c46bd7abf6asm430272466b.81.2026.10.27.04.39.40
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 27 Oct 2026 04:39:40 -0700 (PDT)
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
Subject: [PATCH v3 1/2] ASoC: dt-bindings: Document FM34NE DSP
Date: Tue, 27 Oct 2026 13:39:27 +0200
Message-ID: <20261027113929.65102-2-clamor95@gmail.com>
X-Mailer: git-send-email 2.53.0
In-Reply-To: <20261027113929.65102-1-clamor95@gmail.com>
References: <20261027113929.65102-1-clamor95@gmail.com>
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

