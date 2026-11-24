Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=209.85.210.176
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1795483715;
	b=yvtkRSh4ZbY1KWaZEdmF6UctLc3i8nmoWy/yU2jUw6QFdNPna1NBaf/HrEkqzCuIJJQf
	 FSb6gqIja0MaEPRE1Cx0vM/waDomF9HhCSXPWXAYT3riKa/50g4wtHYyNDh1UvxOdrDfg
	 rLW7QS4+lEMpHhH6eTW8FMrORSIm7mEIauH3JYwYE8L5Z/cczi+cc68z66cJSlIegzACZ
	 pEUicQ6U1zuAagTaGj+QBOimStjc1bJFKyp2KI5CFzGMaHAb3TG4yrW+cwWpI3L6zl0Zf
	 kEU0IviQhB/pjWAvi0hxk7JhAV1XEjJIZQWBKfkIT+tvzADBio9QC+pt8RC7Uc5AvTw==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1795483715;
	h=DMARC-Filter:Received:DKIM-Signature:X-Google-DKIM-Signature:
	 X-Forwarded-Encrypted:X-Gm-Message-State:X-Gm-Gg:X-Received:Received:
	 From:To:Cc:Subject:Date:Message-ID:X-Mailer:In-Reply-To:References:
	 MIME-Version:Content-Transfer-Encoding;
	bh=vdOLga9Vo4Xp9js0CC/DhzZs7tFM2odH8QHKwA4/WTk=;
	b=kYw3ku5DfOZbpggkna+7/NnEvdkEzJUgDNzA48BVBOy4EJWaIJ+B/RKGqITJIR+qcN39
	 q+jvV3q8abOgXvTfw3gj2Y4krEpTzgPyU9zPADWZtWhzhukPqpKuz3VuOtH/ZC1NUGZt+
	 WuqsR+0UGO+mb10tjGwI4l1cQcsmqkLKYJZe0F6+BNY0hZEo+cepyUqE1gTNfZpyiKM58
	 pBzKOpDX8QtEk8HfMxKvHlG/KGd36bbwyAFj1S8P1cZYlAnsF3DRg5aH9NRlataieVIzi
	 lZ5zRdrkGkeLxdoxi/sRI4TFjDrqzcleK2olsZBlTAkVj7vnPv0fHpfrZ0P9hynVyKQ==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=gmail.com;
	spf=pass smtp.mailfrom=gmail.com;
	dkim=pass header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20260707 header.b=lg0Vprb4;
	arc=none smtp.remote-ip=209.85.210.176
Received: from mail-pf1-f176.google.com (mail-pf1-f176.google.com [209.85.210.176])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id C2E25606A338
	for <devicetree@vger.kernel.org>; Tue, 24 Nov 2026 01:28:34 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org C2E25606A338
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20260707 header.b=lg0Vprb4
Received: by mail-pf1-f176.google.com with SMTP id d2e1a72fcca58-8a60f90a924so1461186b3a.3
        for <devicetree@vger.kernel.org>; Mon, 23 Nov 2026 17:28:34 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20260707; t=1795483714; x=1796088514; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=vdOLga9Vo4Xp9js0CC/DhzZs7tFM2odH8QHKwA4/WTk=;
        b=lg0Vprb4kIAFuRBvNSY84P66mAbVUF4MdzhoJEatmAcGWTe6aVLq3UppqjGFNRNnDc
         tuZUASr3B7ypno172TT9ZXiWdrL/+H83Z4TPYoBg+2bgsKXBX8uV74Sntdj0Aq/zsKet
         XsEzDUuul4qEYvPSw8fgbD6qM9XlF8Y7vE8suEmPpcJX1d29uPQFTmrVcRXCrKo+5hp8
         zAT4TfmVT3GI4sIl63vtD+tPTL3Q+mlZsiGvpbpVIlM0mSaV3beH0tmP5IP9ai0gwLma
         7Z1iqB6qu4lUJIJNEEQssKFlWpi6YlBZ3sGC5/FnfsaSroIFgkRmlXXp8MHY1CD46W/P
         ImNw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1795483714; x=1796088514;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to:content-type;
        bh=vdOLga9Vo4Xp9js0CC/DhzZs7tFM2odH8QHKwA4/WTk=;
        b=KU5WJrapo13WcM3Sgj70v1Tfx7/aJIOmGzVetqexT5ju3MKDslFCMsu75ibpZN2ARA
         fdlO3p34t+Vxbaq/frFXvtM+mEsoy0npGHomlz8eP0yEKYQPtMVD6AexO1SRdWAZAS18
         l4ZHt8Ubz4VfSNOCkUqaspbB+gEkWM/Na4lVMRaSutRDRAbfJXaigczRJnkaKxPfoHSc
         0pqfMR146w4AdFKP/YiufxXBcsKPyNNHf5di2n7V9Qpm0SyljKdyCohiWFa3a9tOveWi
         SnAvZkYroIQR2XJeFICVbXuHoqJ47kbQcnDM0pIWYLY5LibodAFZWhJDJVuEs50nlP/O
         +nlw==
X-Forwarded-Encrypted: i=1; AL+hErGhlNmBZAqn4byUS/UUf+oyHR1DmegvzOKjShEnKIDon0K6XI6xiFNRmiQZcBkliJoG4KBaQW/zhuql@vger.kernel.org
X-Gm-Message-State: APuU4Z/WbBvcvl+yzVaKkVaTHMlXfg1tmbTdQ3qhrRoNxJqaE3Ard+KM
	I+G6CFWE7SO0/gHAlDxS6d8QJhocLLO/ZD4vYLnrEEG4ydn+/jnLwwKM
X-Gm-Gg: AZFdTZcsrhDsTJHeO9HNFIZpZuFlVRdT5iv8IMfhEeOA2LxgbfPJRoQcHSJ23qR5cM2
	8ohjZ/eob2d4O6VtI40GZmyoyHy1FaCeRNvlHhZeUlYK4lxnE/T+c1YwzMjA/kwr3w57ugq9w+g
	SJn4fPMTNH7l+nQTDIS7h4kInZ4dz3KiRZWSPu8VyS1ri1zqRxZPM/njoOselJ3EP5c6a3pKSQA
	oMwsCDA7SlKly3sbnid/CFduxYgR5hXTbfkSW7M435oqVxyJ5jkNLtifznHUtlnB3GUBlTuP8c5
	picvQqE9JGrTUVOsLP4jSaG41Q2ZoX06nd9a5txKzRH5RtJS8q2suzZTC+1lVPdukqO3bTPtNqL
	i7dTGjxDsdJnZV/8mfaUAB+C57Fz0Qrson7XkP7ZpV5O+CM4xlYQM0mJD0/1ucQO5rgryCbGdMt
	+adFx3rYZq0cdPvrUFrvUD7Av2lj7dYHksgIQKj4YGt6fGndRw381x9wJs2KGu8PnJxOlLgHv0R
	f5PSsndkbj37i15eBRKx6zzpP52YdFtfrHGFjjE9vKY42Qaf9KlvXJ2IRCzgGWAePw954fa8412
	xQ3xZe4utsJ1XkUK2bpKeiYCf/YJA/1IyAyUAF/W5knHe/qfLGlRfTY=
X-Received: by 2002:a05:6a20:1bc6:b0:3f4:79fa:414 with SMTP id adf61e73a8af0-401bb21187fmr9289912637.13.1795483713931;
        Mon, 23 Nov 2026 17:28:33 -0800 (PST)
Received: from d.home.yangfl.dn42 ([2a09:bac1:7680:d30::4d0:8e])
        by smtp.gmail.com with ESMTPSA id d2e1a72fcca58-8c872e457d1sm6115243b3a.30.2026.11.23.17.28.31
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 23 Nov 2026 17:28:33 -0800 (PST)
From: David Yang <mmyangfl@gmail.com>
To: linux-watchdog@vger.kernel.org
Cc: David Yang <mmyangfl@gmail.com>,
	Wim Van Sebroeck <wim@linux-watchdog.org>,
	Guenter Roeck <linux@roeck-us.net>,
	Rob Herring <robh@kernel.org>,
	Krzysztof Kozlowski <krzk+dt@kernel.org>,
	Conor Dooley <conor+dt@kernel.org>,
	Wei Xu <xuwei5@hisilicon.com>,
	devicetree@vger.kernel.org,
	linux-kernel@vger.kernel.org,
	linux-arm-kernel@lists.infradead.org
Subject: [PATCH v2 1/4] dt-bindings: watchdog: hisilicon,histb-wdt: Add HiSilicon STB watchdog
Date: Tue, 24 Nov 2026 09:27:35 +0800
Message-ID: <20261124012755.328774-2-mmyangfl@gmail.com>
X-Mailer: git-send-email 2.53.0
In-Reply-To: <20261124012755.328774-1-mmyangfl@gmail.com>
References: <20261124012755.328774-1-mmyangfl@gmail.com>
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

Add Device Tree binding schema for the watchdog controller found on
HiSilicon STB SoCs.

Signed-off-by: David Yang <mmyangfl@gmail.com>
---
 .../watchdog/hisilicon,histb-wdt.yaml         | 56 +++++++++++++++++++
 1 file changed, 56 insertions(+)
 create mode 100644 Documentation/devicetree/bindings/watchdog/hisilicon,histb-wdt.yaml

diff --git a/Documentation/devicetree/bindings/watchdog/hisilicon,histb-wdt.yaml b/Documentation/devicetree/bindings/watchdog/hisilicon,histb-wdt.yaml
new file mode 100644
index 000000000000..427225c9aa46
--- /dev/null
+++ b/Documentation/devicetree/bindings/watchdog/hisilicon,histb-wdt.yaml
@@ -0,0 +1,56 @@
+# SPDX-License-Identifier: (GPL-2.0-only OR BSD-2-Clause)
+%YAML 1.2
+---
+$id: http://devicetree.org/schemas/watchdog/hisilicon,histb-wdt.yaml#
+$schema: http://devicetree.org/meta-schemas/core.yaml#
+
+title: HiSilicon STB SoC Watchdog
+
+maintainers:
+  - David Yang <mmyangfl@gmail.com>
+
+description:
+  HiSilicon STB SoCs (Hi3716, Hi3796, Hi3798, etc.) integrate a watchdog device,
+  which triggers an interrupt after a configurable time period. If that
+  interrupt has not been serviced when the next interrupt would be triggered,
+  the reset signal is asserted.
+
+allOf:
+  - $ref: watchdog.yaml#
+
+properties:
+  compatible:
+    items:
+      - enum:
+          - hisilicon,hi3798cv200-wdt
+      - const: hisilicon,histb-wdt
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
+  clock-frequency:
+    description: Frequency of clock in Hz
+
+required:
+  - compatible
+  - reg
+
+unevaluatedProperties: false
+
+examples:
+  - |
+    #include <dt-bindings/clock/histb-clock.h>
+    #include <dt-bindings/interrupt-controller/arm-gic.h>
+
+    watchdog@8a2c000 {
+        compatible = "hisilicon,hi3798cv200-wdt", "hisilicon,histb-wdt";
+        reg = <0x8a2c000 0x1000>;
+        interrupts = <GIC_SPI 29 IRQ_TYPE_LEVEL_HIGH>;
+        clocks = <&crg HISTB_OSC_CLK>;
+    };
-- 
2.53.0

