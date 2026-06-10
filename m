Received: from mail-pg1-f182.google.com (mail-pg1-f182.google.com [209.85.215.182])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 4F1AA33EB10
	for <devicetree@vger.kernel.org>; Wed, 10 Jun 2026 03:04:22 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.215.182
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1781060663; cv=none; b=MWZ/mdjZ/WJ4RpvFc3lDsYG7ycspGYK0mbZnp1Uk8MytYSYQZdne3O0m1+iKpBEVGOSh4Ug1ebiD1Me2tj3OV7nyGPEkYswBJlbZsxC0u/YL+xehoBALqgXWejF7Lay1GM6kBXH6HblRRSJ2m0N0GlStEeP9GB8JVgq00BdBiq4=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1781060663; c=relaxed/simple;
	bh=j6TERrnebUEQt6LyebRQ5rWCD1wXS7acJa0BJlTn7vE=;
	h=From:To:Cc:Subject:Date:Message-Id:In-Reply-To:References:
	 MIME-Version; b=YzDfnJwAhWYLMFbOOl3ZmTsHHmNx07EroIaKvumVHaCYNzIRWl7H/3ttFlEefsi/hivtZz6PqSGFE14We+w/dQTmJEW8oEwIpVHFp1BCIUfDU0GizT6H1hyaJZ0RG/zB6FQfB+BW8SpZv8gExYKmxNT5kFGxhKVnOxdyIvHZ+1Y=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=ZSkpS3+m; arc=none smtp.client-ip=209.85.215.182
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="ZSkpS3+m"
Received: by mail-pg1-f182.google.com with SMTP id 41be03b00d2f7-c85b2139015so2143491a12.2
        for <devicetree@vger.kernel.org>; Tue, 09 Jun 2026 20:04:22 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1781060661; x=1781665461; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=aX/h3JPBtDP5eEo8S5UCA3kPcg5M0Mv68w4Fd4D5N/M=;
        b=ZSkpS3+mMw27AfXMxIsnecuPsO+B2+vSUWFkDTKXBrYXnovbQR1YYq63txsYVeTkyW
         ke7gyZLKkyZ1xXOHmRIMb3MsZBrXklzoFoToYE8/LZ7BbEYMocM1DPPIJv+xnmAGryzC
         uL1pa2+ZFAXf/IqNei+QdCMFcZ+SF6JIBJM8ZsMt1DC058tWQX9B5X0FUi5qDx2P4BNl
         /hHWDXy59CRebaLOi6PX4dChkFYJqOE4DTSW3+ophj8zmP4gesLUtUVcv45KFYVFAFGu
         YDouwpw9r7VRdT4xJrExRdnvKvNB4fcKTI3Jsqz2kv9ZcBYpSnF9FftPQJVq5JNCk32n
         onbQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1781060661; x=1781665461;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to;
        bh=aX/h3JPBtDP5eEo8S5UCA3kPcg5M0Mv68w4Fd4D5N/M=;
        b=A/qJo4fIvysZfs7nPwuTbtyIQtAcysoIzxKELTX0NRTR0D4Mb2C9hCOX19xX5sBVPL
         emHTC1K7JEnLRhgZAIkc8mFJEWAbRhBhiBy6+8uIP1lv936robgq01PFXx7g1Rraz37U
         bx3L7Ew6BbX+AFNgV2z4HwXqQtBFnrzcVkkha+0ITSfQfnV80fUhorrTukAGP/WteKrE
         EfB7gHd4KXCuKbWSN1CLHEOoD93pqyglt+v+dCzp7gBvwJeFgXhdBBFFOCu4I6/iLZB5
         JkmkUcL7MAvtg7r1dX/ZDV6amCxduLMDJqdwPwogokDynmrfSU2jjUvyRVjhvGwQfHms
         YJ2Q==
X-Forwarded-Encrypted: i=1; AFNElJ/ispTK5eUvPdKLAp0ZjStMuXOPUPy7oO4gMPxg8T9ZWapAF7DNisQA1si0GhQuFfGj5p48SYTUdIkz@vger.kernel.org
X-Gm-Message-State: AOJu0Yx+cu/tIlWbpBSOhbeLImfGRVc9EbgKfpHv9z0HCRu7I9aApSrl
	Lj1QAb4NZ2d+8RcDJrEUhe2/h5P1e2YVFROw2nTUPXVdOeDGPxtztAve
X-Gm-Gg: Acq92OFKTqJ6d+Hpe+/KX4mdgbflP7tJSgN7nXdNNaqJQMEoSIz/irzvD5TeDPWTYoz
	heb8bbQR2AnjevR7l6aq9s9smEy0miclkYGts/O1sxurhCNnaNGnG0LON8R0NBXg9+WtoAvfNKH
	nw7dFbqG0gHeKEW4fGI6+a9eMrHME/MzAk0U4icyHK8k+bFXE36dwfrFZd7AoXYdkCqWhfg0+xC
	fZ2JdgEvM58EC7gcGEFM69IUznyJCw5SxjI8h0b7WVssnPNaMOWs+4BcF4TK5238NP8TU1Gucss
	REon0Shsgo6MAFY3YCyyfMPlbwwy1v8tyQUMmJsfr1Rz61xIkrfVu5ALUQOH1GzPWpOU6OV8yz7
	D5O2YFyrAnwjiTLTyw2CVDtZ/tprA+tHQHZMnjyqTprwjoufwW57TjgIbK/s5kGHQoEkQLjfRRq
	FI8HpwPK7USiJ+81Qs72QkM8ddedlvY0dAB8admuOL5hwcVCFhB9UySJZD5TeKzmPGFQYvwLBB6
	Xi/8lYdWq1xv6igcw6C
X-Received: by 2002:a05:6a20:d524:b0:3b4:88e7:87c7 with SMTP id adf61e73a8af0-3b53bc648aemr7501936637.17.1781060661587;
        Tue, 09 Jun 2026 20:04:21 -0700 (PDT)
Received: from localhost.localdomain (60-250-196-139.hinet-ip.hinet.net. [60.250.196.139])
        by smtp.gmail.com with ESMTPSA id 41be03b00d2f7-c85df0a61b3sm19927082a12.17.2026.06.09.20.04.18
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 09 Jun 2026 20:04:20 -0700 (PDT)
From: Zi-Yu Chen <zychennvt@gmail.com>
To: Andi Shyti <andi.shyti@kernel.org>
Cc: Jacky Huang <ychuang3@nuvoton.com>,
	Shan-Chun Hung <schung@nuvoton.com>,
	Rob Herring <robh@kernel.org>,
	Krzysztof Kozlowski <krzk+dt@kernel.org>,
	Conor Dooley <conor+dt@kernel.org>,
	Philipp Zabel <p.zabel@pengutronix.de>,
	linux-i2c@vger.kernel.org,
	devicetree@vger.kernel.org,
	linux-arm-kernel@lists.infradead.org,
	linux-kernel@vger.kernel.org,
	Zi-Yu Chen <zychennvt@gmail.com>,
	Krzysztof Kozlowski <krzysztof.kozlowski@oss.qualcomm.com>
Subject: [PATCH v4 1/3] dt-bindings: i2c: nuvoton,ma35d1-i2c: Add MA35D1 I2C controller
Date: Wed, 10 Jun 2026 11:02:06 +0800
Message-Id: <20260610030208.2020275-2-zychennvt@gmail.com>
X-Mailer: git-send-email 2.34.1
In-Reply-To: <20260610030208.2020275-1-zychennvt@gmail.com>
References: <20260610030208.2020275-1-zychennvt@gmail.com>
Precedence: bulk
X-Mailing-List: devicetree@vger.kernel.org
List-Id: <devicetree.vger.kernel.org>
List-Subscribe: <mailto:devicetree+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:devicetree+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

Add device tree binding documentation for the I2C controller
found in the Nuvoton MA35D1 SoC.

Reviewed-by: Krzysztof Kozlowski <krzysztof.kozlowski@oss.qualcomm.com>
Signed-off-by: Zi-Yu Chen <zychennvt@gmail.com>
---
 .../bindings/i2c/nuvoton,ma35d1-i2c.yaml      | 63 +++++++++++++++++++
 1 file changed, 63 insertions(+)
 create mode 100644 Documentation/devicetree/bindings/i2c/nuvoton,ma35d1-i2c.yaml

diff --git a/Documentation/devicetree/bindings/i2c/nuvoton,ma35d1-i2c.yaml b/Documentation/devicetree/bindings/i2c/nuvoton,ma35d1-i2c.yaml
new file mode 100644
index 000000000000..f2c004049d86
--- /dev/null
+++ b/Documentation/devicetree/bindings/i2c/nuvoton,ma35d1-i2c.yaml
@@ -0,0 +1,63 @@
+# SPDX-License-Identifier: (GPL-2.0-only OR BSD-2-Clause)
+%YAML 1.2
+---
+$id: http://devicetree.org/schemas/i2c/nuvoton,ma35d1-i2c.yaml#
+$schema: http://devicetree.org/meta-schemas/core.yaml#
+
+title: Nuvoton MA35D1 I2C Controller
+
+maintainers:
+  - Zi-Yu Chen <zychennvt@gmail.com>
+
+description:
+  The Nuvoton MA35D1 I2C controller supports controller and optional target mode.
+
+allOf:
+  - $ref: /schemas/i2c/i2c-controller.yaml#
+
+properties:
+  compatible:
+    const: nuvoton,ma35d1-i2c
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
+    description:
+      Desired I2C bus clock frequency in Hz. The absence of this property
+      indicates the default frequency 100 kHz.
+
+  resets:
+    maxItems: 1
+
+required:
+  - compatible
+  - reg
+  - interrupts
+  - clocks
+  - resets
+
+unevaluatedProperties: false
+
+examples:
+  - |
+    #include <dt-bindings/interrupt-controller/arm-gic.h>
+    #include <dt-bindings/clock/nuvoton,ma35d1-clk.h>
+    #include <dt-bindings/reset/nuvoton,ma35d1-reset.h>
+
+    i2c0: i2c@40800000 {
+      compatible = "nuvoton,ma35d1-i2c";
+      reg = <0x40800000 0x1000>;
+      interrupts = <GIC_SPI 13 IRQ_TYPE_LEVEL_HIGH>;
+      clocks = <&clk I2C0_GATE>;
+      clock-frequency = <100000>;
+      resets = <&sys MA35D1_RESET_I2C0>;
+      #address-cells = <1>;
+      #size-cells = <0>;
+    };
-- 
2.34.1

