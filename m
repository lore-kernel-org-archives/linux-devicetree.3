Received: from mail-ed1-f42.google.com (mail-ed1-f42.google.com [209.85.208.42])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id AD7A2339714
	for <devicetree@vger.kernel.org>; Fri, 17 Apr 2026 07:07:52 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.208.42
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1776409674; cv=none; b=DLK5VnVBDt0Su3sY82Ctk7kCeLo3TPBmHxPODZ0S2QzenLUAavE2daZlMl6ywKVre+ALg3Dq3dtz8Goyg/7onG46sg9xJ1Di7jKgOLkBq0Y3W/A04Tw9g3kAvCMIR3jHtsRyGapW3dr8Ym1zeE5lGxuK/W9OWS9xhB9ShQg9f68=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1776409674; c=relaxed/simple;
	bh=AMCItOgDdHgKRdx1GXTFHeaC4r97dyq4obHVbtp3GHw=;
	h=From:Date:Subject:MIME-Version:Content-Type:Message-Id:References:
	 In-Reply-To:To:Cc; b=XqBlZYZJ/gq/+Cu/O/bDbVMFmIy11Qel9f26qllPzMs2MXtWv0bT5DLG01OrJWZhZAtb38eDaK8m5mJDSM7cy36Km5vOuk/i33fvpBKquWCSWHN96dQU/dfQz7R8NK3A3brpPeOtTcBq6eHmlX9wf4U+eZiIEZVIAm+9gfyRlOQ=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=fairphone.com; spf=pass smtp.mailfrom=fairphone.com; dkim=pass (2048-bit key) header.d=fairphone.com header.i=@fairphone.com header.b=ypKbL/9h; arc=none smtp.client-ip=209.85.208.42
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=fairphone.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=fairphone.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=fairphone.com header.i=@fairphone.com header.b="ypKbL/9h"
Received: by mail-ed1-f42.google.com with SMTP id 4fb4d7f45d1cf-672c12e95e9so489047a12.2
        for <devicetree@vger.kernel.org>; Fri, 17 Apr 2026 00:07:52 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=fairphone.com; s=fair; t=1776409671; x=1777014471; darn=vger.kernel.org;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :mime-version:subject:date:from:from:to:cc:subject:date:message-id
         :reply-to;
        bh=cvOfVZPOjPhsoW4F3DQC7Jn5+Am3jq15qDLt0sa1MzA=;
        b=ypKbL/9hVKV/zgm165L9uPUrp9LyC4sZX+h6STSboH+oGsxrbakQEQAdqSdUVGk/l4
         Tt2aU8DrjMAnoOxrKEWLURC2c7cFMbOf9qrLkjGVbb1Rl73ax7n0v1K6T2Tb9rc7bgp7
         iP/fCfhvk1I0ZXtR7KBYH1HiDIHAry+8A3eSK7x3HMciAYOdcJnxrJjIArmGiKeqKhnh
         gAQLUuhVKu1Dnya3bbl5cy2woe9zc4MWzr8sWns7tJbVyqOYRfk112bI0tiZFoJFmWR/
         6juvY5n/70YRUP5s0QvE4SP5oKbLB5ekAFftgCajuXGYK6gnHXWU5xiohE6vbabkbE7S
         wyOw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1776409671; x=1777014471;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :mime-version:subject:date:from:x-gm-gg:x-gm-message-state:from:to
         :cc:subject:date:message-id:reply-to;
        bh=cvOfVZPOjPhsoW4F3DQC7Jn5+Am3jq15qDLt0sa1MzA=;
        b=P36PY4pfXhT1iyqH1MrZeKBmshlS3PSMmGVbeFtTn9FzIYB0GCEhpqiwUr2SLJ2s6o
         pzRftCQIiEL3N+jMuXyVa6yhWxA92QXej9ipdZhkUUsLlqVHbg5AJxyTe3XrGxPZnFdP
         tA2Jb/sk+oHL46kkSao3zJgj6IxWQn5fPi+03yK5YP9vfJMmo6rLBKvP8KuzCvKc1fsB
         DGrpYWS5znL8wM9gGu2KIgL12T7liuosb5RR1ir5G/7zScPItAOgkRm3lYI6TQxhfGmb
         3AzI/o7FZIp19ZEbD6tJCNUx5aWS9CrJX/qW1QI+Ajus512Q2aGdkZThUSgJzfBuzy8h
         ro6A==
X-Forwarded-Encrypted: i=1; AFNElJ+bfp0jANRRKAiO8G9rbQ2FhijhQq72NJU0aOBv2B3id5ysH06f4sjpcNhJvjK7954dq71cscfXriGr@vger.kernel.org
X-Gm-Message-State: AOJu0YwV2IuHXV9n4JS2ZmmIy6ZLP6tTkAh2Afk6pJ7zxZNmSMlBSORg
	OmpYVHJD8AVtlvq/wnqNtXo3SyZhiBqZi/bFHubR2ZhShqUfIIyvuYneiByV5jSZyFM=
X-Gm-Gg: AeBDieu2RzL2qbb5+nxMjMZFT4QotNQ1PYZo3n2mGoQdu12h/imO8oaBnNXD2F0iGrL
	5D8WQXtAbzFu+I0Dm6uLNjI2/G8p7CfF4bHmxgbdZTwoCNOa/I+vG4vVsTDk67WJqZ5PRLMM3rM
	ndCg0qt/xR7Sfk+tei03AxH6Oo2ZUCUJrt6PcdZXNy1dxS7QXGGvn8QXs5v+HtWJO9Wz0bvdtr6
	GfHhrwplDMwra2loIGC5992FBcxQeYYnKNsbRlWtCmuVrIr88d88JLpUb57VMhoLBFql5Vwbp97
	9aiYDL6fQCa8CJrwEvRLZHuPSOOCrKy4BzH54+JzjbmxRCW97gk1z+odBtQNFFR/bXDxMWvikHj
	b5pBLNTZ3Ssn7c/ndfHeLQe5DSQ7e6QscIOVKTgnLqEPujG6UkumvNVQY3j6907+P3IAXqmvTWC
	Yot8ZeXPRqK/lvS8ppiXekgtEVV+sj54MYy9B1M2lK0oBdBeZ5fqtio7W76tTJKs7xDW53e3MkS
	ZY6DNLIMWM4KyJE
X-Received: by 2002:a17:907:1b09:b0:b9d:e69b:58f7 with SMTP id a640c23a62f3a-ba41945c089mr80672066b.21.1776409670939;
        Fri, 17 Apr 2026 00:07:50 -0700 (PDT)
Received: from [172.16.240.100] (144-178-202-138.static.ef-service.nl. [144.178.202.138])
        by smtp.gmail.com with ESMTPSA id a640c23a62f3a-ba451cdfd27sm26448466b.26.2026.04.17.00.07.49
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 17 Apr 2026 00:07:50 -0700 (PDT)
From: Luca Weiss <luca.weiss@fairphone.com>
Date: Fri, 17 Apr 2026 09:07:44 +0200
Subject: [PATCH v3 1/3] dt-bindings: clock: qcom: document the Milos GX
 clock controller
Precedence: bulk
X-Mailing-List: devicetree@vger.kernel.org
List-Id: <devicetree.vger.kernel.org>
List-Subscribe: <mailto:devicetree+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:devicetree+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20260417-milos-gxclkctl-v3-1-08f5988c43a2@fairphone.com>
References: <20260417-milos-gxclkctl-v3-0-08f5988c43a2@fairphone.com>
In-Reply-To: <20260417-milos-gxclkctl-v3-0-08f5988c43a2@fairphone.com>
To: Bjorn Andersson <andersson@kernel.org>, 
 Michael Turquette <mturquette@baylibre.com>, 
 Stephen Boyd <sboyd@kernel.org>, Rob Herring <robh@kernel.org>, 
 Krzysztof Kozlowski <krzk+dt@kernel.org>, 
 Conor Dooley <conor+dt@kernel.org>, Konrad Dybcio <konradybcio@kernel.org>, 
 Alexander Koskovich <akoskovich@pm.me>
Cc: ~postmarketos/upstreaming@lists.sr.ht, phone-devel@vger.kernel.org, 
 linux-arm-msm@vger.kernel.org, linux-clk@vger.kernel.org, 
 devicetree@vger.kernel.org, linux-kernel@vger.kernel.org, 
 Luca Weiss <luca.weiss@fairphone.com>, 
 Krzysztof Kozlowski <krzysztof.kozlowski@oss.qualcomm.com>
X-Mailer: b4 0.15.2
X-Developer-Signature: v=1; a=ed25519-sha256; t=1776409667; l=2723;
 i=luca.weiss@fairphone.com; s=20250611; h=from:subject:message-id;
 bh=AMCItOgDdHgKRdx1GXTFHeaC4r97dyq4obHVbtp3GHw=;
 b=hUIxkwNCfgNBT48GTiRI3BvsQ5rtFklAYZzv51cQl26o2DQEuT+YGDpXuqxrSQEZS2UEtKPQ+
 DXfgdvp/FGZBzOFwEIAp8Nhu5X+KFyue9GP1EMWKw+uLxVinjHuHvWV
X-Developer-Key: i=luca.weiss@fairphone.com; a=ed25519;
 pk=O1aw+AAust5lEmgrNJ1Bs7PTY0fEsJm+mdkjExA69q8=

Qualcomm GX(graphics) is a clock controller which has PLLs, clocks and
Power domains (GDSC), but the requirement from the SW driver is to use
the GDSC power domain from the clock controller to recover the GPU
firmware in case of any failure/hangs. The rest of the resources of the
clock controller are being used by the firmware of GPU. This module
exposes the GDSC power domains which helps the recovery of Graphics
subsystem.

Milos can reuse the qcom,kaanapali-gxclkctl.h header due to similarity
of the hardware block, and also reuse of the Linux driver.

Reviewed-by: Krzysztof Kozlowski <krzysztof.kozlowski@oss.qualcomm.com>
Signed-off-by: Luca Weiss <luca.weiss@fairphone.com>
---
 .../bindings/clock/qcom,milos-gxclkctl.yaml        | 61 ++++++++++++++++++++++
 1 file changed, 61 insertions(+)

diff --git a/Documentation/devicetree/bindings/clock/qcom,milos-gxclkctl.yaml b/Documentation/devicetree/bindings/clock/qcom,milos-gxclkctl.yaml
new file mode 100644
index 000000000000..fbcb5d3f3e3d
--- /dev/null
+++ b/Documentation/devicetree/bindings/clock/qcom,milos-gxclkctl.yaml
@@ -0,0 +1,61 @@
+# SPDX-License-Identifier: (GPL-2.0-only OR BSD-2-Clause)
+%YAML 1.2
+---
+$id: http://devicetree.org/schemas/clock/qcom,milos-gxclkctl.yaml#
+$schema: http://devicetree.org/meta-schemas/core.yaml#
+
+title: Qualcomm Graphics Power Domain Controller on Milos
+
+maintainers:
+  - Luca Weiss <luca.weiss@fairphone.com>
+
+description: |
+  Qualcomm GX(graphics) is a clock controller which has PLLs, clocks and
+  Power domains (GDSC). This module provides the power domains control
+  of gxclkctl on Qualcomm SoCs which helps the recovery of Graphics subsystem.
+
+  See also:
+    include/dt-bindings/clock/qcom,kaanapali-gxclkctl.h
+
+properties:
+  compatible:
+    enum:
+      - qcom,milos-gxclkctl
+
+  reg:
+    maxItems: 1
+
+  power-domains:
+    description:
+      Power domains required for the clock controller to operate
+    items:
+      - description: GFX power domain
+      - description: GPUCC(CX) power domain
+
+  '#power-domain-cells':
+    const: 1
+
+required:
+  - compatible
+  - reg
+  - power-domains
+  - '#power-domain-cells'
+
+additionalProperties: false
+
+examples:
+  - |
+    #include <dt-bindings/power/qcom,rpmhpd.h>
+    soc {
+        #address-cells = <2>;
+        #size-cells = <2>;
+
+        clock-controller@3d64000 {
+            compatible = "qcom,milos-gxclkctl";
+            reg = <0x0 0x03d64000 0x0 0x6000>;
+            power-domains = <&rpmhpd RPMHPD_GFX>,
+                            <&gpucc 0>;
+            #power-domain-cells = <1>;
+        };
+    };
+...

-- 
2.53.0

