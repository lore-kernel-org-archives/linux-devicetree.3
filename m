Received: from mail-wm2-f12.google.com (mail-wm2-f12.google.com [74.125.225.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id AA8E4513569
	for <devicetree@vger.kernel.org>; Tue, 29 Sep 2026 12:58:35 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=74.125.225.140
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1790686717; cv=none; b=N5o/C1kE5CTXeXJWOEuOTp4wDXYUd9rYLKOcN/KQ5qQT4CP5Kn3R5R1f6oP/RAOTps5mJrCiNcUAXjVGX6V5dwzzQHS1fYdg66J57olFQHwNm347QLm0spdsyGEOc/b9zzMPklzndFXqLKPOQOLoDE6cLOOBJwbR+Ab9qTj7/ro=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1790686717; c=relaxed/simple;
	bh=Go39NKKMwkuXXP/SejpjyZo/TgbX2bfpHuiP0B8nCjc=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version; b=cp9rMT0E+CiSxXCINaQljdPn3v6wibtQw/vx7S4LfJcXPS61FY3ryRQLgAxmMfuGJR2aPAplG85QthOoUu1MHjQ1PTBDYTgiwdb04yAAwFhyJjimnRkoVpiWAro3Y+4YioAHWcR8pmKX3qjjQbdb2ThE8uGsUb9dcxT0hhJZo1o=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=suse.com; spf=pass smtp.mailfrom=suse.com; dkim=pass (2048-bit key) header.d=suse.com header.i=@suse.com header.b=Km1ZcSou; arc=none smtp.client-ip=74.125.225.140
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=suse.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=suse.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=suse.com header.i=@suse.com header.b="Km1ZcSou"
Received: by mail-wm2-f12.google.com with SMTP id 5b1f17b1804b1-49b912d3920so31077085e9.1
        for <devicetree@vger.kernel.org>; Tue, 29 Sep 2026 05:58:35 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=suse.com; s=google; t=1790686714; x=1791291514; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=piB6olxsDjTKBBKWtT/80MoIuyo/txOuxpczb55KJIY=;
        b=Km1ZcSouHj1xJ6Pb/cCmthnOI+xJR4FZ8KHMc+mJfjRnm7g0DbGb2R4Tix2GT56dy1
         5Xvjv+y+Dxie1tvr9Q6e/GSdNwjmzMf4YS17su/Cki6XfZO7hleXtAUSdtDvQF8MD+k1
         mzpdWKyiqcXsS5h5XegNivuWv8uD7ETjiMQodD481S2iCJhuYJ7bIRqxhOL/kwVs2lES
         7T/rb+ikC1M5lMAG7+y0bjHoP9/Xp93vUWRdSmYZtdzqUGC+yefJ+Q6wGBRHITmTlhh0
         DE29s/QAMDNb3iH5j8V/LchkpavF1S1XT16NWQDSuLmIhrRI7mdgyMMtVLhaK5z5KdOZ
         HThg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1790686714; x=1791291514;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to:content-type;
        bh=piB6olxsDjTKBBKWtT/80MoIuyo/txOuxpczb55KJIY=;
        b=SH+4F4tdWIZxU/m9PXhsjETA+a2IzdMJO9w43GYGglKWBRqxhiv9oiYWy3nQjxNIZ2
         dVVQNxfURX2pi6/94tHm/qm3XPivAG1O6DbvqZ3y8JsFhXGO4jlCnmN7mgJipjDi8le6
         +7CwKlQrwk8WHmBkaq+WrHSdvxb4bnrlkZYOApZYEzlrRWwH3PnBCMOypKK/39vkJQvg
         RXc36VMXewC3Q9FeAtKh83L/8px9p8Rb83TIQTgEpVCPeVkJEtuZHGc2Ww2+IwYwl6pT
         IJnVJk1x//iCeroxedAabw+9ysXRM2kEkEysmsaGv7f+yTj4A2Xfa+k8NnR/p2PT66xl
         ahLg==
X-Forwarded-Encrypted: i=1; AKwUvBwRwW7EX5DNycOkcOabJIX8LwjoEa4+he+y1lDQDiLee9QqfSKychTwV7fm3yurSBlavBnQ/V7z4ZA1@vger.kernel.org
X-Gm-Message-State: AFuF++l82q0SHZO85TDVmim8g2VfQoL/6tgLVWO4xnMF9TmSOCHABF04
	ruC8c1j3pnRhhceuiIA4+6eX90OmYKwicMN6WHjm7ymXRBqSwCknpwofZuIB6gQ6oFA=
X-Gm-Gg: AYBFou1NmsKGfGTxAaO3gA3gVyEnyFMJJtKiQDMEMecCESTxDfolHc5mRJffDpHqhdK
	M5Hb7tpZtmKDdABBuZqznEuczQlusRTEc7GLmsCXP26gqXohjc1xc/Ty98aIXtrSy8lFH3qZ+0a
	A8wilPeJjPJN+9U8mzCu+Ud41HzZYmwG150eL5YpJPGcd3WEKZ/S8som2miqiBw0eCqozYxrSFQ
	oC1EfTikFc0GDD2cif6AU4c2OSH0Z6AVbi4fpLqG52xS9qECsLoVWsCpRKDn9goSCmOFCA0rl9X
	Ma02pPcycpcQbCq80uBstLF+cJQFemBTLQCD00AMDo6yCZDc4ZJ/deH/GjdnHdWeilZsMZLdQLz
	N49heCrlHhxDGsNqQYqX1MOYv3pLw16ySzAUi6jHAGSfyNQhrX6v7fuUfu6hQ1SxeUnmuCLslNR
	HvTK97hJ1Tauici7DHapJ/XvoK2yIvoT3WVbCiha9lm5x0kW6spE1uAWBc64aLwKdXFsbX20kTv
	Ua/+pGN
X-Received: by 2002:a05:600c:4ed2:b0:49f:e3f2:f5a3 with SMTP id 5b1f17b1804b1-49fe6685393mr284862965e9.0.1790686713541;
        Tue, 29 Sep 2026 05:58:33 -0700 (PDT)
Received: from localhost ([195.94.147.179])
        by smtp.gmail.com with ESMTPSA id 5b1f17b1804b1-4a00cfe13a1sm75682335e9.5.2026.09.29.05.58.32
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 29 Sep 2026 05:58:33 -0700 (PDT)
From: Andrea della Porta <andrea.porta@suse.com>
To: =?UTF-8?q?Uwe=20Kleine-K=C3=B6nig?= <ukleinek@kernel.org>,
	linux-pwm@vger.kernel.org,
	Rob Herring <robh@kernel.org>,
	Krzysztof Kozlowski <krzk+dt@kernel.org>,
	Conor Dooley <conor+dt@kernel.org>,
	Florian Fainelli <florian.fainelli@broadcom.com>,
	Broadcom internal kernel review list <bcm-kernel-feedback-list@broadcom.com>,
	Andrea della Porta <andrea.porta@suse.com>,
	devicetree@vger.kernel.org,
	linux-rpi-kernel@lists.infradead.org,
	linux-arm-kernel@lists.infradead.org,
	linux-kernel@vger.kernel.org,
	Naushir Patuck <naush@raspberrypi.com>,
	Stanimir Varbanov <svarbanov@suse.de>,
	mbrugger@suse.com,
	Sean Young <sean@mess.org>,
	Julian Braha <julianbraha@gmail.com>,
	"Gary Guo" <gary@garyguo.net>,
	Christophe JAILLET <christophe.jaillet@wanadoo.fr>
Cc: Krzysztof Kozlowski <krzysztof.kozlowski@oss.qualcomm.com>
Subject: [PATCH v12 1/2] dt-bindings: pwm: Add Raspberry Pi RP1 PWM controller
Date: Tue, 29 Sep 2026 15:02:11 +0200
Message-ID: <ee0aa89faa14e0073f1271693bae28678652998b.1790686331.git.andrea.porta@suse.com>
X-Mailer: git-send-email 2.51.0
In-Reply-To: <cover.1790686331.git.andrea.porta@suse.com>
References: <cover.1790686331.git.andrea.porta@suse.com>
Precedence: bulk
X-Mailing-List: devicetree@vger.kernel.org
List-Id: <devicetree.vger.kernel.org>
List-Subscribe: <mailto:devicetree+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:devicetree+unsubscribe@vger.kernel.org>
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
 .../bindings/pwm/raspberrypi,rp1-pwm.yaml     | 66 +++++++++++++++++++
 1 file changed, 66 insertions(+)
 create mode 100644 Documentation/devicetree/bindings/pwm/raspberrypi,rp1-pwm.yaml

diff --git a/Documentation/devicetree/bindings/pwm/raspberrypi,rp1-pwm.yaml b/Documentation/devicetree/bindings/pwm/raspberrypi,rp1-pwm.yaml
new file mode 100644
index 0000000000000..be020583fd0ba
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
2.35.3

