Received: from mail-yw1-f169.google.com (mail-yw1-f169.google.com [209.85.128.169])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id C889D3E8C5E
	for <devicetree@vger.kernel.org>; Mon, 27 Apr 2026 17:58:44 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.128.169
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1777312726; cv=none; b=IXmUmTpQFbhevrO7xChRfRT18Ce89flRLrqbkdOp2ngw5CW9vRIGCtR0TN8DjkJUV1QnNIyezD5cRM/MLQ5u+/SBSm8JJQZbjkPAgyzRi1oyOT2xlPPKo5BXruXDQFxarxBh2Z0Adatp7mpggnJvogEd1YVg43AnTbm0Xl/jEz8=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1777312726; c=relaxed/simple;
	bh=sFgdCYiD5TfywfevqOqs8Vz5/tI6iCmjO2YFGeFbPAI=;
	h=From:Date:Subject:MIME-Version:Content-Type:Message-Id:References:
	 In-Reply-To:To:Cc; b=GJKBret2wgVS9mXyhjms6l6JwkbbZzBl5Jg3XWYxhEvr+HhbKxwRw+7PqqntOhcttMB339iP3nToeNyR3pKOjA6Ho/DnDwYrpvItSikH57EsVHRLruWKyhaD1H/vNVYAVovnQ8oKxkXpj3C/tZn/VxsHO4ZynaJNTHFYAE7Dfgg=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=jbmt1lMc; arc=none smtp.client-ip=209.85.128.169
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="jbmt1lMc"
Received: by mail-yw1-f169.google.com with SMTP id 00721157ae682-7982c3b7da9so99745727b3.1
        for <devicetree@vger.kernel.org>; Mon, 27 Apr 2026 10:58:44 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1777312724; x=1777917524; darn=vger.kernel.org;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :mime-version:subject:date:from:from:to:cc:subject:date:message-id
         :reply-to;
        bh=V8Tgdu3+sQNzcBRuzqvG3gzHTwwqwtEDe5RVadLhXWo=;
        b=jbmt1lMcDni+FMLlmXV1JnIKbnb9nmT+Tc4zIBEzUfTNHhzDWBK9/lga5UNB8HNgmi
         /SAf7OxUU7aoxa5UnnqRGo0RM8qDo1lrUny5vKlCxMl74A1jwZ1xnAMR6x4qxSn3j1xv
         n0BB2hXST1dNNaZHpp92GieQG6JfnOErWeOYazczv/zpnOgvTQnkMXPjLEEFoXUF3iSj
         hVrISl/ZgGvXIKdD6TyMWMTxz1HbrlhEt2fIDk+/Zol9PCp1AaHQsraG48xsTdd4P/4x
         zBYglmkPsY338RPYTWH7iTvfu/2MojG/c2J5VGpC3tT5p3C7U3RKdYFOcH4LWyoxmPh+
         FZIg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1777312724; x=1777917524;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :mime-version:subject:date:from:x-gm-gg:x-gm-message-state:from:to
         :cc:subject:date:message-id:reply-to;
        bh=V8Tgdu3+sQNzcBRuzqvG3gzHTwwqwtEDe5RVadLhXWo=;
        b=g0TY5M4xy0Hg79eMosrXEd0w8g90R393KcaJ6o1iem9Y7eyYuaCmo88FZJv9jaYOvD
         3onXqkLd/5Q+Jh+1YzIk99AcI8JN/SiEb/wsDfmSyW3WqEQV65p1hMQY+mbFdh/yZwj1
         nQ8lbezeyqLlqXvyxiCfNZPzgPgQmoXbkkuuhE6ORPcSUAkcQFPs06UQjfqwat6tU6/d
         atn2fknxhswKhsnleyEDcuNQhUE1HNdYm75pCc5XjbsahXI1l7mblKZ0elYaoZv8vAw5
         3pGU6FakiRhN6FtzufkA2Q2sw0S9RUA8EPhDNR50yixqDBx0F1StKBD0GefQu/tMhI44
         aabQ==
X-Forwarded-Encrypted: i=1; AFNElJ8LWnoINRoOWdVgOYxYbqncY15wxwMTBOPTvvft1sUh2/7Sj0ri+lvWhTbPhtTQYdCcyLfxJW+9adk5@vger.kernel.org
X-Gm-Message-State: AOJu0YwThNXEwWeoh8PIkYboICelfAyDKMqurfNdB0cEB4iGnNKfZ6jj
	0U66J8qoQZ8fDta4sx/gJD2NIjpn8eVdgQWWgWxbi3hyBh0teQ/MJOnH
X-Gm-Gg: AeBDievDCnlIkAXdDfA9S9KYW3+RpeQ2u3CY3wfDD3Xk5CwVV/9xSkdQiV7oCvmB0MK
	scIegHSPCRa+s4ADywjw5j+XQTYhlICJmiFIGSDrHeL4W0dlVurqL0Pn22AIieLeH4M+akekV61
	1pVaTKjpcXnFNrnNLMaDua6DMEpv+A/PpC2ABNg609/1gR3n1gAU10M8uPdq/NWevB8U7poa6UP
	gOGQqxcE4c0sCZVADh7kVy3cMkQgMyw14VfmccqgCHNmNfDyM5D5GZhU0Nij2TpMtAJkIxozYsi
	jFXzpGfiVfp+beEwls/iFy6oAl9y/T5OjfIanJhik9HzSvYm49/sG61o9/dtO7ucegifq1CNSqo
	a+8NLjogBmE1sgzWm0g1VynDkqErnXyYxo3RsWk07Kq34zIXEYbeF2qP2rrtbQC8aEPGdTHnJuN
	ZidbV+p6hY3ZoWz3c5may30tKzGWJ6C7s6fvT0
X-Received: by 2002:a05:690c:6811:b0:79a:60f6:c5ed with SMTP id 00721157ae682-7bced8dc69amr3553787b3.6.1777312723838;
        Mon, 27 Apr 2026 10:58:43 -0700 (PDT)
Received: from [192.168.0.39] ([79.133.247.80])
        by smtp.gmail.com with ESMTPSA id 00721157ae682-7bcf05e9cf8sm198467b3.18.2026.04.27.10.58.38
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 27 Apr 2026 10:58:43 -0700 (PDT)
From: Erikas Bitovtas <xerikasxx@gmail.com>
Date: Mon, 27 Apr 2026 20:58:23 +0300
Subject: [PATCH RFC v3 01/11] media: dt-bindings: venus: Add qcom,msm8939
 schema
Precedence: bulk
X-Mailing-List: devicetree@vger.kernel.org
List-Id: <devicetree.vger.kernel.org>
List-Subscribe: <mailto:devicetree+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:devicetree+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 8bit
Message-Id: <20260427-msm8939-venus-rfc-v3-1-288195bb7917@gmail.com>
References: <20260427-msm8939-venus-rfc-v3-0-288195bb7917@gmail.com>
In-Reply-To: <20260427-msm8939-venus-rfc-v3-0-288195bb7917@gmail.com>
To: Bryan O'Donoghue <bod@kernel.org>, 
 Vikash Garodia <vikash.garodia@oss.qualcomm.com>, 
 Dikshita Agarwal <dikshita.agarwal@oss.qualcomm.com>, 
 Mauro Carvalho Chehab <mchehab@kernel.org>, Rob Herring <robh@kernel.org>, 
 Krzysztof Kozlowski <krzk+dt@kernel.org>, 
 Conor Dooley <conor+dt@kernel.org>, 
 =?utf-8?q?Andr=C3=A9_Apitzsch?= <git@apitzsch.eu>, 
 Bjorn Andersson <andersson@kernel.org>, 
 Konrad Dybcio <konradybcio@kernel.org>, 
 Michael Turquette <mturquette@baylibre.com>, 
 Stephen Boyd <sboyd@kernel.org>
Cc: linux-media@vger.kernel.org, linux-arm-msm@vger.kernel.org, 
 devicetree@vger.kernel.org, linux-kernel@vger.kernel.org, 
 linux-clk@vger.kernel.org, ~postmarketos/upstreaming@lists.sr.ht, 
 phone-devel@vger.kernel.org, Erikas Bitovtas <xerikasxx@gmail.com>
X-Mailer: b4 0.15.2

From: André Apitzsch <git@apitzsch.eu>

Add a schema description for the Venus video decoder/encoder IP in
MSM8939.

Signed-off-by: André Apitzsch <git@apitzsch.eu>
Signed-off-by: Erikas Bitovtas <xerikasxx@gmail.com>
---
 .../bindings/media/qcom,msm8939-venus.yaml         | 147 +++++++++++++++++++++
 1 file changed, 147 insertions(+)

diff --git a/Documentation/devicetree/bindings/media/qcom,msm8939-venus.yaml b/Documentation/devicetree/bindings/media/qcom,msm8939-venus.yaml
new file mode 100644
index 000000000000..5790b3bf5aef
--- /dev/null
+++ b/Documentation/devicetree/bindings/media/qcom,msm8939-venus.yaml
@@ -0,0 +1,147 @@
+# SPDX-License-Identifier: (GPL-2.0-only OR BSD-2-Clause)
+%YAML 1.2
+---
+$id: http://devicetree.org/schemas/media/qcom,msm8939-venus.yaml#
+$schema: http://devicetree.org/meta-schemas/core.yaml#
+
+title: Qualcomm MSM8939 Venus video encode and decode accelerators
+
+maintainers:
+  - André Apitzsch <git@apitzsch.eu>
+  - Erikas Bitovtas <xerikasxx@gmail.com>
+
+description: |
+  The Venus IP is a video encode and decode accelerator present
+  on Qualcomm platforms
+
+allOf:
+  - $ref: qcom,venus-common.yaml#
+
+properties:
+  compatible:
+    const: qcom,msm8939-venus
+
+  power-domains:
+    maxItems: 1
+
+  clocks:
+    maxItems: 3
+
+  clock-names:
+    items:
+      - const: core
+      - const: iface
+      - const: bus
+
+  iommus:
+    maxItems: 1
+
+  video-decoder:
+    type: object
+
+    properties:
+      compatible:
+        const: venus-decoder
+
+      clocks:
+        maxItems: 2
+
+      clock-names:
+        items:
+          - const: core0
+          - const: core1
+
+      power-domains:
+        maxItems: 2
+
+      power-domain-names:
+        items:
+          - const: core0
+          - const: core1
+
+    required:
+      - compatible
+      - clocks
+      - clock-names
+      - power-domains
+      - power-domain-names
+
+    additionalProperties: false
+
+  video-encoder:
+    type: object
+
+    properties:
+      compatible:
+        const: venus-encoder
+
+      clocks:
+        maxItems: 2
+
+      clock-names:
+        items:
+          - const: core0
+          - const: core1
+
+      power-domains:
+        maxItems: 2
+
+      power-domain-names:
+        items:
+          - const: core0
+          - const: core1
+
+    required:
+      - compatible
+      - clocks
+      - clock-names
+      - power-domains
+      - power-domain-names
+
+    additionalProperties: false
+
+required:
+  - compatible
+  - iommus
+  - video-decoder
+  - video-encoder
+
+unevaluatedProperties: false
+
+examples:
+  - |
+    #include <dt-bindings/interrupt-controller/arm-gic.h>
+    #include <dt-bindings/clock/qcom,gcc-msm8939.h>
+
+    video-codec@1d00000 {
+        compatible = "qcom,msm8939-venus";
+        reg = <0x01d00000 0xff000>;
+        interrupts = <GIC_SPI 44 IRQ_TYPE_LEVEL_HIGH>;
+        clocks = <&gcc GCC_VENUS0_VCODEC0_CLK>,
+                 <&gcc GCC_VENUS0_AHB_CLK>,
+                 <&gcc GCC_VENUS0_AXI_CLK>;
+        clock-names = "core", "iface", "bus";
+        power-domains = <&gcc VENUS_GDSC>;
+        iommus = <&apps_iommu 5>;
+        memory-region = <&venus_mem>;
+
+        video-decoder {
+          compatible = "venus-decoder";
+          clocks = <&gcc GCC_VENUS0_CORE0_VCODEC0_CLK>,
+                   <&gcc GCC_VENUS0_CORE1_VCODEC0_CLK>;
+          clock-names = "core0", "core1";
+          power-domains = <&gcc VENUS_CORE0_GDSC>,
+                          <&gcc VENUS_CORE1_GDSC>;
+          power-domain-names = "core0", "core1";
+        };
+
+        video-encoder {
+          compatible = "venus-encoder";
+          clocks = <&gcc GCC_VENUS0_CORE0_VCODEC0_CLK>,
+                   <&gcc GCC_VENUS0_CORE1_VCODEC0_CLK>;
+          clock-names = "core0", "core1";
+          power-domains = <&gcc VENUS_CORE0_GDSC>,
+                          <&gcc VENUS_CORE1_GDSC>;
+          power-domain-names = "core0", "core1";
+        };
+    };

-- 
2.54.0

