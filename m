Received: from mail-yw1-f177.google.com (mail-yw1-f177.google.com [209.85.128.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 9AFDE3CBE69
	for <devicetree@vger.kernel.org>; Thu, 16 Apr 2026 13:44:10 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.128.177
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1776347056; cv=none; b=a9nxC1940ZwoqW2f3mGEAlMrQk5SrCyAxUmDmr5ESPpQYO0IDK5NzK64h3sxF/DnCLynEYPu63pvmrNJ5pqPvF1rIhhh16Y8DirmQuKK6rtX63JK4A8JnlMj/lymdH8kQ9RX3e9vFcJRoPdnWgeph4cJb68inq0y5AnmLUevlNs=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1776347056; c=relaxed/simple;
	bh=RzS5JmKjsOZYW4Pwddl7sWCABCvZEXMZ2Ju+Ufxr438=;
	h=From:Date:Subject:MIME-Version:Content-Type:Message-Id:References:
	 In-Reply-To:To:Cc; b=TTOElzYDGB4ns7c8ki5Ymgh9LLca8XRJJQIVLWZXpS7eduLH4/PcCXGgegA3pu3OhFlhWygTzhp/i744HA8EI+KSeO+kW4punYANhMVUXY21Myw4qmHxgMuEamSZ5NNqdq4eVDO/eUA5DY0M+sNXF3rVZySGoYojwmdt/UXjWSo=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=lQm7r3qm; arc=none smtp.client-ip=209.85.128.177
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="lQm7r3qm"
Received: by mail-yw1-f177.google.com with SMTP id 00721157ae682-7982c3b7dfcso79729777b3.0
        for <devicetree@vger.kernel.org>; Thu, 16 Apr 2026 06:44:09 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1776347048; x=1776951848; darn=vger.kernel.org;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :mime-version:subject:date:from:from:to:cc:subject:date:message-id
         :reply-to;
        bh=ywTUM+tHj4kZ/RlgFq4JcNm8/09Xy2NM9dmr9xVBZQg=;
        b=lQm7r3qmUTW7uqxhtlvQQNCq1dO28ZJuQlEhBhTcdWvpUwjAOwiWeDIQl+V8y80Iqt
         pxE8how88qyvJ4tuNQHOVWcNRr0thrbYXWH8ps2FetmX/5y1mDugFQgesDiD9oT1b+tg
         phH7o3HlJJDla4YlINQtkmceqUvCTaH2tEe7xtHTTvY6DTCDjNO1PTFswgfcmg5wLASH
         wYjUJchPrv5FK08gGFxa2b9s4suw4Jr+HU5mTdr3awtA8Eg6yAJeGoCI/QzCMLGjOvZ8
         uILRJIZV2dGP6TE95Owu77KKS668zdzpbmvNk3/6yUkoYyZEsDPP7yNRruMx713GeBen
         V0HA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1776347048; x=1776951848;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :mime-version:subject:date:from:x-gm-gg:x-gm-message-state:from:to
         :cc:subject:date:message-id:reply-to;
        bh=ywTUM+tHj4kZ/RlgFq4JcNm8/09Xy2NM9dmr9xVBZQg=;
        b=gp9MBPT8KQjmh9VXRGzKFn0cPxpiefYnywnlNY1aKnfGn6hktLHJcm2vK4m3W+xGqk
         fR7I7WHFvi+QN60+slbCzyy9En4Di8dfnEcxI4B9jdaPiDwcxMrJ/MFoQ40OpZOLX2eu
         iKt/ZYulTC6fv9MVD99M6URnN8AF1hzbRT+UP2kSKgVNvlgi73Gl5OYj1haT9cYk+tct
         YDQrrP34i6q+vE1cR/Ovbk+ICcmJhcnZ7B5usJtPbD2TINJ0mMNJMlMG12tgUU8zC6sV
         CJYI3YbEW1bzcZz6XjmQ0jiK5wkgBJ6MwgdEnqSoPkA5LJ2BRqY3WOILuvhWREEz8oWO
         wFRQ==
X-Forwarded-Encrypted: i=1; AFNElJ956zYVVmi5UFfG/UsQow7xxIqU6t7ibJOlXjLR5Ur3ssqvpcUUSgzNxZItsBBDYOzlHp8C4k8oEUkk@vger.kernel.org
X-Gm-Message-State: AOJu0Yw55Eu7ZFX2on+W7axSIrOIpRaJnZ17Z46bf035k/9nFz7XkjkB
	X5WphePoBLwUCfhLuAVZGzmNUued4W7mDNE8CVSnBfiaWoD8aTPTF0sK
X-Gm-Gg: AeBDies9t4cNTNUtW3ow+AnqhkwV/NYI4VLKQEG8FfHNAQgQF7MumBziFkKBbnYB8bU
	Cfw7h+09YFIEu7vGW0AiVxi/NjpeVyg94Thw5hiuV6qHwoVR5Rtqxv9qSkor6u5v+iStF6Suoqf
	jlzzhbBncMIAl89P4/T1BD6z8qndkyqWKiZ+yJ5BY60hdY5lmNH1bqC1aMMcRJGzB7++IruGT1t
	cHxZbyclJR3tH/M4p1VnyGO5lpDIELElRx80cfD2bHqqcm6gWAc8bMMtBCvnznmv/lOBF5xEv52
	VsLqh/PJZHTtdw3L5H/T0e62clUpfIW2+qwL7EEkc/CdyoiU9urKM7icxnybvw9cXjh1jPTW8ul
	QGJL3FFeX+teZA+1dBCTG1jLcl8XPQnFB0hezCI4f+giu9RnGcgIvMiIdttmtV7aW9Bxizi7G76
	uZB4w2DAkTvvHk/pWZfEmQsdjBeimpuQjPq8zS
X-Received: by 2002:a05:690c:6609:b0:7a0:afb5:6876 with SMTP id 00721157ae682-7af70f92567mr262065907b3.31.1776347048274;
        Thu, 16 Apr 2026 06:44:08 -0700 (PDT)
Received: from [192.168.0.39] ([79.133.247.80])
        by smtp.gmail.com with ESMTPSA id 00721157ae682-7b76931854esm23363737b3.37.2026.04.16.06.44.03
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 16 Apr 2026 06:44:07 -0700 (PDT)
From: Erikas Bitovtas <xerikasxx@gmail.com>
Date: Thu, 16 Apr 2026 16:43:48 +0300
Subject: [PATCH RFC 01/10] media: dt-bindings: venus: Add qcom,msm8939
 schema
Precedence: bulk
X-Mailing-List: devicetree@vger.kernel.org
List-Id: <devicetree.vger.kernel.org>
List-Subscribe: <mailto:devicetree+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:devicetree+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 8bit
Message-Id: <20260416-msm8939-venus-rfc-v1-1-a09fcf2c23df@gmail.com>
References: <20260416-msm8939-venus-rfc-v1-0-a09fcf2c23df@gmail.com>
In-Reply-To: <20260416-msm8939-venus-rfc-v1-0-a09fcf2c23df@gmail.com>
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
 .../bindings/media/qcom,msm8939-venus.yaml         | 104 +++++++++++++++++++++
 1 file changed, 104 insertions(+)

diff --git a/Documentation/devicetree/bindings/media/qcom,msm8939-venus.yaml b/Documentation/devicetree/bindings/media/qcom,msm8939-venus.yaml
new file mode 100644
index 000000000000..730473cfcce4
--- /dev/null
+++ b/Documentation/devicetree/bindings/media/qcom,msm8939-venus.yaml
@@ -0,0 +1,104 @@
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
+required:
+  - compatible
+  - iommus
+  - video-decoder
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
+          power-domain-names = "vcodec_core0", "vcodec_core1";
+        };
+    };

-- 
2.53.0

