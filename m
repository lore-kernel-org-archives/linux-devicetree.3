Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=209.85.128.42
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1795541584;
	b=LLs4+OddLcMVk1nLhQ4E1qGKTz+WBv6ciHtD3XykWJo4ZdoUF+1jJ9E2+Dh1Yd02KOh4
	 ju/E3RRNmuFeUsi512EyiW6KEKKYD9sA5ErXtJKEuozzihRssPSJqFQBbi8a5WeW9CAhy
	 gURpGbk4oU6J7RnhXMeWIgk9ro+3A1/RkI0ag+R3ywfs6m22CpjWUFX0/08s2jyyY21vt
	 3qSOBL1k9pI9GYx0kad0OWrtk6ksYylMjGB7EYw3LLUQuEemwUIIqsA3LKLookqmNjBxk
	 u4SD6QfKCXmYbuH/f4vfYo/s/SUyl6+hwedsuRMJBnVwIkoMNypMXyCXDbKoC1HP5qg==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1795541584;
	h=DMARC-Filter:Received:DKIM-Signature:X-Google-DKIM-Signature:
	 X-Forwarded-Encrypted:X-Gm-Message-State:X-Gm-Gg:X-Received:Received:
	 From:To:Cc:Subject:Date:Message-ID:X-Mailer:In-Reply-To:References:
	 MIME-Version:Content-Transfer-Encoding;
	bh=aH2MTB0Ze17g97ePs4wlPxbOQN12XIysjRotJSq3KWU=;
	b=BR4/sP+62wFWWq3j/8zk5+cACh1ln6xRT1+jAev4RaVEo8tukMQRjHWbEVy4GlUnzOiP
	 TuKShXRI++JMQVxak7AwmSLgIUrFcOLMZz2cT5oumsRPKX3tvYPbtSZmIlbG1hFHncIkh
	 lAFsW98pRySmsWkWRFZifN72usFgmxOgKt+wTLAFhbsv5lrxOnAddXXoeU/zJX+5cxFrX
	 cwJozkM1TjYpH9+xtO8eJ8/GAH6Do29Efr2XryfoIzUGxABGcSc32wGAMKeekazXLVhif
	 TLmK3FwGfaDpk0NCWXfx6WXBndIqM+o7UIRxmI347nAiDU9kEkx3zPpsUP9+g9Qhg8A==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=suse.com;
	spf=pass smtp.mailfrom=suse.com;
	dkim=pass header.d=suse.com header.i=@suse.com header.a=rsa-sha256 header.s=google header.b=YBeE8QUO;
	arc=none smtp.remote-ip=209.85.128.42
Received: from mail-wm1-f42.google.com (mail-wm1-f42.google.com [209.85.128.42])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 9F73F60A2633
	for <devicetree@vger.kernel.org>; Tue, 24 Nov 2026 17:33:03 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org 9F73F60A2633
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=suse.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=suse.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=suse.com header.i=@suse.com header.a=rsa-sha256 header.s=google header.b=YBeE8QUO
Received: by mail-wm1-f42.google.com with SMTP id 5b1f17b1804b1-4ba013938d7so44330035e9.2
        for <devicetree@vger.kernel.org>; Tue, 24 Nov 2026 09:33:03 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=suse.com; s=google; t=1795541582; x=1796146382; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=aH2MTB0Ze17g97ePs4wlPxbOQN12XIysjRotJSq3KWU=;
        b=YBeE8QUOOp51AgJ3SsRNyTURxzAxaIkVckh1C02xLsmCc5ezSk3lgZBSqW1dJ635jV
         EonCr68RcWbdREMNRZhlFzjZ92CDDH+sWWLhhDxs3Rvrfy2xtO4TY8827SYovhpAv4ai
         zfHU2mTEcOK48CP1YZVDzt+2gvjjHnPIED0Mpgu/kl1a5y24Kmf/+LulxSTtfsBUTgPC
         fdSmdHmMuFMEhTSbA3ymlevkPfvIQylu33tqvIY2GIw4W5p/0wmv4C4mRoBT8qinY5h7
         jW5hZHDl+h27oOREs94urwC5xSNzEh8OxlwSwZ1brBoFZooBUG4gfxpCZZBxvrWeEtxV
         8TbQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1795541582; x=1796146382;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to:content-type;
        bh=aH2MTB0Ze17g97ePs4wlPxbOQN12XIysjRotJSq3KWU=;
        b=RUwu+h2gHouj00lGazkmGbsXxtp1YeLM0d5/sQEANlQ+/CR4BzUDvw8voou65e783f
         WM5M1jdpWsWNW2rI3WrBeChg3+LqcMivi8k/lfaib7Wttkq8fu3k4YYKI5wWnv/lxEhh
         BzJxFVJgm8UotflsyJfVp+ZdkfQ3frW5SHkmNd/+FuPTNg7+1W5m2C18QKDIy+GdWhtk
         KfjX6tiFuSrMwuYWJc32fm0pFurvEUAUcvigQAOvbc1g5y6ovnq4oyHyj4fkw5W8gz6O
         DNRpCJMxYMEnig8SRzIwtEEyG44fRvbiDoaL3ml1oHzpWsUP3I+NnwMJDjyGkN2gq+sm
         sxKQ==
X-Forwarded-Encrypted: i=1; AL+hErG2ddJtTJ81DbVtd2rfzA43lSjlgSIQtvVNGpKdFYUW2qRXzAL6MlBXnIRfd4y+jSR3SNJjv4Cb+faB@vger.kernel.org
X-Gm-Message-State: APuU4Z9oEKRI3HSrZeGzwxNcYri/SY75EV7m00klZPkSnBR+uquUlNna
	0ff35kKDLqwzx2/Tb7MEUzWK9rE0Vci2+nKA4feEKSZZHHaFV8aRszVeaytx45BG4bk=
X-Gm-Gg: AZFdTZeq2WJn2FFbyrvrgP/zrRRH76Bun7G8QeOus5zNXxug+HXsk+1fG8Rj7roX26c
	2+HZqX/6/mKUpAZ1gxNQw6zBqWWXRt8xSpveuXIkvwLfZjxu/DjafMj3x/6jIu57O8SSLBNcDQ/
	appRdE/ApZcrmaLlqpwKNKRTjPQFJZHz9KRkXsfDP0H2l8Ciiw30AjZcdMyf5DW21YdFtuHm+hC
	DPNJn3DnS63U6BIfi6fm39RtVu+QFQLiYZkcn/cPbr4dNOi8NP9MEKZ+6kD9SiOEomi9GFjst9N
	3AURfSWxgekZcr2Uo7K9pzlKpGnWyk9cabStI1i06nXsmyYImhLirTgz+ML5wVu24jtHyYknDHv
	wJ1d7WsC6UXoFaUGNmpc3Y1JTyaxAKGTKfcwzCckLU9CIKITYToz5WbH08F6jZz3+nUMNLSQjoj
	RCvWDhBZFZmHI3NwGqhyinb/Wh3QlYMBs99uwGiNNlE2/uDVOmD+Zl4GRpjIIPijaRgW1fbLJJp
	IwOWbZkQmB3/QUAX6iHvh2eWws3aJ/s2ZJvIS4aSIxkbUX7K6/WcZ1XgwjVVuQEXtfWmyQ4oEOc
	2OkqM+6VE5Mvf41poiQWP4a0OSA=
X-Received: by 2002:a05:600c:34d0:b0:4bb:6a5a:7839 with SMTP id 5b1f17b1804b1-4bb889428eamr309983845e9.34.1795541582068;
        Tue, 24 Nov 2026 09:33:02 -0800 (PST)
Received: from localhost ([82.192.120.76])
        by smtp.gmail.com with ESMTPSA id 5b1f17b1804b1-4bb85399d52sm439552155e9.6.2026.11.24.09.33.01
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 24 Nov 2026 09:33:01 -0800 (PST)
From: Andrea della Porta <andrea.porta@suse.com>
To: =?UTF-8?q?Uwe=20Kleine-K=C3=B6nig?= <ukleinek@kernel.org>,
	linux-pwm@vger.kernel.org,
	robh@kernel.org,
	krzk+dt@kernel.org,
	conor+dt@kernel.org,
	devicetree@vger.kernel.org,
	florian.fainelli@broadcom.com,
	rjui@broadcom.com,
	sbranden@broadcom.com,
	bcm-kernel-feedback-list@broadcom.com,
	linux-rpi-kernel@lists.infradead.org,
	linux-arm-kernel@lists.infradead.org,
	linux-kernel@vger.kernel.org
Cc: naush@raspberrypi.com,
	svarbanov@suse.de,
	gary@garyguo.net,
	linux@roeck-us.net,
	linux-hwmon@vger.kernel.org,
	krzysztof.kozlowski@oss.qualcomm.com,
	Andrea della Porta <andrea.porta@suse.com>
Subject: [PATCH v13 1/3] dt-bindings: pwm: Add Raspberry Pi RP1 PWM controller
Date: Tue, 24 Nov 2026 18:36:55 +0100
Message-ID: <20261124173658.31030-2-andrea.porta@suse.com>
X-Mailer: git-send-email 2.51.0
In-Reply-To: <20261124173658.31030-1-andrea.porta@suse.com>
References: <20261124173658.31030-1-andrea.porta@suse.com>
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

From: Naushir Patuck <naush@raspberrypi.com>

Add the devicetree binding documentation for the PWM
controller found in the Raspberry Pi RP1 chipset.

Signed-off-by: Naushir Patuck <naush@raspberrypi.com>
Co-developed-by: Stanimir Varbanov <svarbanov@suse.de>
Signed-off-by: Stanimir Varbanov <svarbanov@suse.de>
Signed-off-by: Andrea della Porta <andrea.porta@suse.com>
Reviewed-by: Krzysztof Kozlowski <krzysztof.kozlowski@oss.qualcomm.com>
---
The DT binding has been applied by Rob (see [1]) for consistency tov7.4
and is part of v7.4-rc2: as a consequence, this patch is included only to
make this series apply 'logically' on top of v7.4-rc1 and can be dropped
when rebasing.

[1] - https://lore.kernel.org/all/20261102192302.GA882027-robh@kernel.org/
---
 .../bindings/pwm/raspberrypi,rp1-pwm.yaml     | 66 +++++++++++++++++++
 1 file changed, 66 insertions(+)
 create mode 100644 Documentation/devicetree/bindings/pwm/raspberrypi,rp1-pwm.yaml

diff --git a/Documentation/devicetree/bindings/pwm/raspberrypi,rp1-pwm.yaml b/Documentation/devicetree/bindings/pwm/raspberrypi,rp1-pwm.yaml
new file mode 100644
index 000000000000..be020583fd0b
--- /dev/null
+++ b/Documentation/devicetree/bindings/pwm/raspberrypi,rp1-pwm.yaml
@@ -0,0 +1,66 @@
+# SPDX-License-Identifier: (GPL-2.0-only OR BSD-2-Clause)
+%YAML 1.2
+---
+$id: http://devicetree.org/schemas/pwm/raspberrypi,rp1-pwm.yaml#
+$schema: http://devicetree.org/meta-schemas/core.yaml#
+
+title: Raspberry Pi RP1 PWM controller
+
+maintainers:
+  - Naushir Patuck <naush@raspberrypi.com>
+  - Andrea della Porta <andrea.porta@suse.com>
+  - Stanimir Varbanov <svarbanov@suse.de>
+
+allOf:
+  - $ref: pwm.yaml#
+
+description: |
+  The PWM peripheral is a flexible waveform generator with a
+  variety of operational modes. It has the following features:
+   - four independent output channels
+   - 32-bit counter widths
+   - Seven output generation modes
+   - Optional per-channel output inversion
+   - Optional duty-cycle data FIFO with DMA support
+   - Optional sigma-delta noise shaping engine
+  Serves as a fan speed provider to other nodes for a PWM-connected
+  fan.
+
+properties:
+  compatible:
+    const: raspberrypi,rp1-pwm
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
+  dmas:
+    maxItems: 1
+    description: |
+      Phandle to the DMA controller and the channel specifier for
+      the duty-cycle FIFO.
+
+  dma-names:
+    items:
+      - const: tx
+
+required:
+  - compatible
+  - reg
+  - clocks
+
+unevaluatedProperties: false
+
+examples:
+  - |
+    pwm@98000 {
+      compatible = "raspberrypi,rp1-pwm";
+      reg = <0x98000 0x100>;
+      clocks = <&rp1_clocks 17>;
+      #pwm-cells = <3>;
+    };
-- 
2.51.0

