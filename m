Received: from mail-pf1-f173.google.com (mail-pf1-f173.google.com [209.85.210.173])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 178F9388E66
	for <devicetree@vger.kernel.org>; Thu, 16 Apr 2026 15:24:59 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.210.173
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1776353101; cv=none; b=TnsKhL15bTNwcSczkTAdpsEHQJZhnhQfHbfWARsANLVAQQWoDCbibBkA6jAF8fS2OSq2J1FI64MGenBhn0B3wnzYwIRl7UJtstWs3PEoPaimZ3+Gt/0N+DAWqo49hU9kJqUAOHkyQfvMSJylWUQhx8Y8WBzfjvsbPpr70Wz10ms=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1776353101; c=relaxed/simple;
	bh=uvvcbjPfqTh2X7TQHVzpMcycfgm51VhlGpTLGD2o0pc=;
	h=From:To:Cc:Subject:Date:Message-ID:MIME-Version; b=l85t0jVvJi6q7X4aszrG9gKSOeFPozG/lVH/Mop/9F3kGiUDz97yqSbRfJ3D2dXOILioryprzcl90us2v2G+9Qgnw4+KPimPsSK9Fb/PSRTpYCGsN0WM9xVe9h87GRLbVq5RY4dNssGEvtrLsYR7OvzLmSbzrD5JW6nAwY51CSQ=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=kGVcWquY; arc=none smtp.client-ip=209.85.210.173
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="kGVcWquY"
Received: by mail-pf1-f173.google.com with SMTP id d2e1a72fcca58-827270d50d4so7150395b3a.3
        for <devicetree@vger.kernel.org>; Thu, 16 Apr 2026 08:24:59 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1776353099; x=1776957899; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:from:to:cc:subject:date:message-id:reply-to;
        bh=qa/4mWjDlNB4/W0mvOpWzdJOaWWAmeTtcRYBEVEM9PU=;
        b=kGVcWquYm8trGsQR/n2NLBkvcGWMPAT2xHzSD++U0htI4kk2Qeh1yNGx6evEl7HkRa
         SyYIA0C4VVzx1ZhOzOKJu44OYS64Wrqm4hMJs5f23RqlOmmszBDT55fiL1qjrSYcH/g5
         Gs3yBXEQvGoWxlrH+AZzEzdYNaDLh+FnWlR1k1hZU7Ebs6ab56DH67GA+6PeCzwSGAoO
         Udu13eFnYUZWQ4MguLAK45KjrumfQfqSZYi0kn6hRRh0Xb2ByoUWdQfaMDm/ZvZds1Au
         i9xVYWq2ZYuQKhM7AVbUSWauCzrjtNKcF9imOkc7xm2QkyYYKgKgYfGFcSW0tqsaZAm6
         YMyg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1776353099; x=1776957899;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=qa/4mWjDlNB4/W0mvOpWzdJOaWWAmeTtcRYBEVEM9PU=;
        b=PsxW9C33QLWmz2zwxmwNGpV3SU3tsmAocgBfnHR71se7kpgwT+3D75v11LCxEn287L
         Kwn2bbmI9+zgVUzfxm1W9hlaesMoXz+kRCTZe34cjypCitmxa+/nCzes4kQKS10phuE+
         cBKtVFzYxL2ji2AOGerNH4fp/JlZBxQcsGfN7bIYgoO2NnYoCQYjZxEFGHdysGA7c3uV
         sx0Dy84zETl0F4h3CTgMlkKKbuSscAl7SzFqKCECSeJnvNnoyd31ijP4CN7CG4kT4uHj
         k6zkKyw/sVLE1WzMT1U84oBkMDpXvsaRNzDusKlkpTWKQWrhOUnVwT6FhtpHjh+EbFfY
         bAhA==
X-Forwarded-Encrypted: i=1; AFNElJ/IoQXY3StIJN7AXWSHMAsqeKzO7JvVc6oHTfg/NPIXKqfZbOLBSGfsQDo0Fjo2IKQeepdGsUXayAUu@vger.kernel.org
X-Gm-Message-State: AOJu0YxwcxoEWiRDAMnvb9CbgYUSihektdGhVpJHQc+wKOUgAVTuwas0
	8ymfsOYAyoJbnxtvtkBoPLBsfmjD64PxPzZKuGcc+TfkYgf5Sek16ydvNQfbkC6wgtk=
X-Gm-Gg: AeBDievB39xGBBkreyQETAWz44QCvWjTyQysuLC1Yq8wjWxHhNwB+++eUcPkRNY16gD
	9toe55gQiEu/Z4c97JGSqxNzu9pnUw0swteLhSlT5TMeDqlecFOj6GSbavwaRZCuINCuxjyOvXT
	UOeY85VjmqwuQTKh21gzsyxNWvX4cHtnX0hvYdLOWFdFXysYdTRWImF/xCA+3tDwIu7KLGo4oB7
	GxyaF88OqlC3+ABrL8HCGo43RZWent/z8iLXYOJqhs5FZPFyFkxFp+vD/lLRHEWqvrKKhCYlU2R
	47WtdmMGhuisJk9hzqrnpnfr5tg+Cm+RY1AphVSQ5aP+B/0Y1iVaYpaqS8SfokpFvsYpVNGel1D
	e9H5EYQRzQlzBxSfzw8luATr5VhDFiOULmRwT2z0yhHWsqJ6b0skA7dGDeC+7bOH5qWKr8nZPPD
	5VnvrxYqEQgceUuMa9uTKkxgtJ/3mIXnO/aoKgDc7nuQIsEakwMB8P4Yk8OMZjBRJVyE7PVouRy
	0S900pNltc=
X-Received: by 2002:a05:6a00:400e:b0:82c:9f7f:3495 with SMTP id d2e1a72fcca58-82f0c351b36mr25862979b3a.45.1776353099219;
        Thu, 16 Apr 2026 08:24:59 -0700 (PDT)
Received: from chaitanya-virtualbox.. ([103.249.241.52])
        by smtp.gmail.com with ESMTPSA id d2e1a72fcca58-82f6744b350sm5322841b3a.54.2026.04.16.08.24.54
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 16 Apr 2026 08:24:58 -0700 (PDT)
From: Chaitanya Sabnis <chaitanya.msabnis@gmail.com>
To: Max Filippov <jcmvbkbc@gmail.com>,
	Liam Girdwood <lgirdwood@gmail.com>,
	Mark Brown <broonie@kernel.org>,
	Rob Herring <robh@kernel.org>,
	Krzysztof Kozlowski <krzk+dt@kernel.org>,
	Conor Dooley <conor+dt@kernel.org>
Cc: linux-sound@vger.kernel.org,
	devicetree@vger.kernel.org,
	linux-kernel@vger.kernel.org,
	Chaitanya Sabnis <chaitanya.msabnis@gmail.com>
Subject: [PATCH] ASoC: dt-bindings: cdns: Convert xtfpga I2S to dt-schema
Date: Thu, 16 Apr 2026 20:53:29 +0530
Message-ID: <20260416152329.6016-1-chaitanya.msabnis@gmail.com>
X-Mailer: git-send-email 2.43.0
Precedence: bulk
X-Mailing-List: devicetree@vger.kernel.org
List-Id: <devicetree.vger.kernel.org>
List-Subscribe: <mailto:devicetree+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:devicetree+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

Convert the Cadence XTensa FPGA I2S controller plain-text binding
documentation to standard dt-schema (YAML).

The hardware requires exactly one memory region, one interrupt line,
and one phandle to the master clock. Verified these constraints against
the driver source in sound/soc/xtensa/xtfpga-i2s.c.

Signed-off-by: Chaitanya Sabnis <chaitanya.msabnis@gmail.com>
---
 .../bindings/sound/cdns,xtfpga-i2s.txt        | 18 -------
 .../bindings/sound/cdns,xtfpga-i2s.yaml       | 48 +++++++++++++++++++
 2 files changed, 48 insertions(+), 18 deletions(-)
 delete mode 100644 Documentation/devicetree/bindings/sound/cdns,xtfpga-i2s.txt
 create mode 100644 Documentation/devicetree/bindings/sound/cdns,xtfpga-i2s.yaml

diff --git a/Documentation/devicetree/bindings/sound/cdns,xtfpga-i2s.txt b/Documentation/devicetree/bindings/sound/cdns,xtfpga-i2s.txt
deleted file mode 100644
index 860fc0da39c0..000000000000
--- a/Documentation/devicetree/bindings/sound/cdns,xtfpga-i2s.txt
+++ /dev/null
@@ -1,18 +0,0 @@
-Bindings for I2S controller built into xtfpga Xtensa bitstreams.
-
-Required properties:
-- compatible: shall be "cdns,xtfpga-i2s".
-- reg: memory region (address and length) with device registers.
-- interrupts: interrupt for the device.
-- clocks: phandle to the clk used as master clock. I2S bus clock
-  is derived from it.
-
-Examples:
-
-	i2s0: xtfpga-i2s@d080000 {
-		#sound-dai-cells = <0>;
-		compatible = "cdns,xtfpga-i2s";
-		reg = <0x0d080000 0x40>;
-		interrupts = <2 1>;
-		clocks = <&cdce706 4>;
-	};
diff --git a/Documentation/devicetree/bindings/sound/cdns,xtfpga-i2s.yaml b/Documentation/devicetree/bindings/sound/cdns,xtfpga-i2s.yaml
new file mode 100644
index 000000000000..9a4a9db3c159
--- /dev/null
+++ b/Documentation/devicetree/bindings/sound/cdns,xtfpga-i2s.yaml
@@ -0,0 +1,48 @@
+# SPDX-License-Identifier: (GPL-2.0-only OR BSD-2-Clause)
+%YAML 1.2
+---
+$id: http://devicetree.org/schemas/sound/cdns,xtfpga-i2s.yaml#
+$schema: http://devicetree.org/meta-schemas/core.yaml#
+
+title: Cadence XTensa FPGA I2S Controller
+
+maintainers:
+  - Max Filippov <jcmvbkbc@gmail.com>
+
+allOf:
+  - $ref: dai-common.yaml#
+
+properties:
+  compatible:
+    const: cdns,xtfpga-i2s
+
+  reg:
+    maxItems: 1
+
+  interrupts:
+    maxItems: 1
+
+  clocks:
+    maxItems: 1
+    description: phandle to the clk used as master clock. I2S bus clock is derived from it.
+
+  "#sound-dai-cells":
+    const: 0
+
+required:
+  - compatible
+  - reg
+  - interrupts
+  - clocks
+
+unevaluatedProperties: false
+
+examples:
+  - |
+    i2s@d080000 {
+        compatible = "cdns,xtfpga-i2s";
+        reg = <0x0d080000 0x40>;
+        interrupts = <2 1>;
+        clocks = <&cdce706 4>;
+        #sound-dai-cells = <0>;
+    };
-- 
2.43.0

