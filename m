Received: from mail-yx2-f13.google.com (mail-yx2-f13.google.com [74.125.224.141])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id B432F2475D0
	for <devicetree@vger.kernel.org>; Tue, 22 Sep 2026 03:47:34 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=74.125.224.141
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1790048856; cv=none; b=Y9tn5ziWM0A5sdRhNWF0CJF3QWb58b8im8ZbqK/XPcwjjpTHGmHruDC/KR0CS87RDM+OmLXfuBxkfBl44MEO6c9SJ/OPHHWOEuCl8r1kFwDjoDIhUX9ES6lhVairZQ4i70hQRzRd4QU4+bZUmxlNQPFdBgFXXb5ySHPrThuXofk=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1790048856; c=relaxed/simple;
	bh=HtavXwOO0OEHuiGVXTW8F+NzHuFXrh7lU+hDGXaFDgg=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version; b=X1BySB3K58L6aSaPsCSSbr3WTbmniiEV0Pgf3LcKfTda7s+sjavToBFM62KyYl6gUQAEmM5+bU65MvVOtfmxf6oIQ0aaFM5Z0ynRzrD6n+IT6iQePzs2fPldycXD/uAIz5BOeriK7jRhSazIvM/toU33QUTZNUn3kWbfwC172zs=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=d7wZoolo; arc=none smtp.client-ip=74.125.224.141
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="d7wZoolo"
Received: by mail-yx2-f13.google.com with SMTP id 956f58d0204a3-66e4ab20a33so3773129d50.1
        for <devicetree@vger.kernel.org>; Mon, 21 Sep 2026 20:47:34 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1790048854; x=1790653654; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=EeGfs7dlNwJSpSR2y2pu7Meyw4f/IE6ZSxzgz1gB6h4=;
        b=d7wZoolo31o/NL6zWmMxbJqHyDpWBlFDZ3fIz8LW3Lmscs3EkZdShFXbmNWscQc97P
         qQflaLt2fM9rPrTVz41GXaGw6xdhhXFiKlmtuvgyzbaEo9f0lSCO8TqOVlWQM8gkwBDp
         WyCsyWnsnjycPxpRa+bNSwrLj9P4EayyCy/soJlA140CppL3rYXstwo/E3rv8X0qIUJK
         gJ/3Lc1bf3NdLivsF+iShPHdm4b81k12taDFAWyHAD9lyjKG29KHmpyYxk5z3XqS1QFt
         S8Sf2Fw7/EaA4xurwqWz+O51Nwy4V1KINRsdh68Y9kocKmCRk8e65iawTT08UoxzKjwI
         ps5g==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1790048854; x=1790653654;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to:content-type;
        bh=EeGfs7dlNwJSpSR2y2pu7Meyw4f/IE6ZSxzgz1gB6h4=;
        b=bKCDmqqR9Lzzt+RX0wzyyk1DbLcXZf/92L0GiQ22gkgR2WNl9RdSuJykPTqy/fMKOq
         tt/tvBNildeiZKS8+YmcS+EXvLhlUpOyyzjI8jqyG9TdaH6ctg4rUKDw4TtssZVcMOI4
         Pfwlt3kyHqw2oJoetQuSkVZKvnpcNImjL62yJszHBjJX2wH/jWGD/yq43tnk15OqDvPV
         0V2IbWZjAW8VPVq9A+38sITUERcUxHJ1U28dipNLDDI3Pz4jTebyDsGqf20DWSfcRsmP
         cEQWTfeb1WPlFzwsUpYvJd8UwqoMTKkMZYc+OQca0kBXRDszI+AzYJP51mrYQTskuIep
         kycQ==
X-Forwarded-Encrypted: i=1; AKwUvBxRPDGIQJkqPGaUCBcAjqLvsYNXE8eLcQ3ZAfps5oUW/dGhwYDmkk2P2svXTzwPiQ6K2mYGoXGSg/qR@vger.kernel.org
X-Gm-Message-State: AFuF++lL96I2kVh/TOyEs/gH65vA0ONMPXmFND6AyC53cOpyMy7hPg8N
	Xfr35xrV9ru4TDRatR2LhzseOPRsJwyUOpOX48mJoBDq+hwzWtH+NZAX
X-Gm-Gg: AYBFou0lz6NovFHcNZUyrvqCg+31UCZa0UzVQO+HCbKf6Nn9J9mtj9mB91zTFN9tNu6
	IlnNiuEqVD1r7v2VNhU/c10wxY7fQGZmpnm1WqT6J/4TJzeu9yFeDnwvpVpHJrA/mEUwsf1RmZz
	Dgf/d3y/F5FpFvZfFOPeNPUfA2EjKOvmY8QIu+ah1rPKpbCGL0Um+GC4bc4wRIQEnuDklo7nLwq
	wuPPi6CfQEKGCtMVZRBG6Cyvq3FJ7i6uHMua56xpfIN2ji1W7THx4d2u4XPg+VWnNndKvJUHDCj
	9KZ2WVxxF1m4rEtj1zzqeSBA86FHFASHbbvB2mQ0uAcQDh8vcV5fJEOAH0EoDsoJmRj0RnXb+e4
	E+7VC/PUDLUZjjxpuybyqUkbehl4ZgEmkRWBEkBHMoFoPqgsFms2S2XWLLdtYbmUa2qaWtMkH8F
	6BwGV1VHr3NWwcKuMQjsApuAJLqlp4wLxp7apftx5TPvsWJP16x1MWMDBTts7oBReNKA==
X-Received: by 2002:a05:690e:4148:b0:672:99e0:ebdd with SMTP id 956f58d0204a3-67299e0ef69mr2889187d50.117.1790048853652;
        Mon, 21 Sep 2026 20:47:33 -0700 (PDT)
Received: from hp ([71.12.40.102])
        by smtp.gmail.com with ESMTPSA id 00721157ae682-8a2bd79e82bsm1822337b3.5.2026.09.21.20.47.32
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 21 Sep 2026 20:47:33 -0700 (PDT)
From: Tim Michals <tcmichals@gmail.com>
To: linux-sunxi@lists.linux.dev
Cc: wens@kernel.org,
	jernej.skrabec@gmail.com,
	samuel@sholland.org,
	Tim Michals <tcmichals@gmail.com>,
	Jassi Brar <jaswinder.singh@linaro.org>,
	Rob Herring <robh@kernel.org>,
	Krzysztof Kozlowski <krzk+dt@kernel.org>,
	devicetree@vger.kernel.org,
	linux-arm-kernel@lists.infradead.org
Subject: [PATCH 1/7] dt-bindings: mailbox: add Allwinner sun55i msgbox schema
Date: Mon, 21 Sep 2026 22:47:05 -0500
Message-ID: <20260922034711.190253-2-tcmichals@gmail.com>
X-Mailer: git-send-email 2.53.0
In-Reply-To: <20260922034711.190253-1-tcmichals@gmail.com>
References: <20260922034711.190253-1-tcmichals@gmail.com>
Precedence: bulk
X-Mailing-List: devicetree@vger.kernel.org
List-Id: <devicetree.vger.kernel.org>
List-Subscribe: <mailto:devicetree+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:devicetree+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

Add Device Tree binding schema for the Allwinner 4-port hardware
Message Box controller found on sun55i (A523, A527, T527) and
sun60i (A733) SoCs.

The message box connects the ARM Cortex-A55 host cluster to the
HiFi4 Audio DSP, Power Management Unit (CPUS), and XuanTie RISC-V
co-processor across 12 logical channels with 8-entry hardware FIFOs.

Cc: Jassi Brar <jaswinder.singh@linaro.org>
Cc: Samuel Holland <samuel@sholland.org>
Cc: Jernej Skrabec <jernej.skrabec@gmail.com>
Cc: Rob Herring <robh@kernel.org>
Cc: Krzysztof Kozlowski <krzk+dt@kernel.org>
Cc: devicetree@vger.kernel.org
Cc: linux-arm-kernel@lists.infradead.org
Cc: linux-sunxi@lists.linux.dev
Signed-off-by: Tim Michals <tcmichals@gmail.com>
---
 .../mailbox/allwinner,sun55i-a523-msgbox.yaml | 93 +++++++++++++++++++
 1 file changed, 93 insertions(+)
 create mode 100644 Documentation/devicetree/bindings/mailbox/allwinner,sun55i-a523-msgbox.yaml

diff --git a/Documentation/devicetree/bindings/mailbox/allwinner,sun55i-a523-msgbox.yaml b/Documentation/devicetree/bindings/mailbox/allwinner,sun55i-a523-msgbox.yaml
new file mode 100644
index 000000000000..4b73543c7902
--- /dev/null
+++ b/Documentation/devicetree/bindings/mailbox/allwinner,sun55i-a523-msgbox.yaml
@@ -0,0 +1,93 @@
+# SPDX-License-Identifier: GPL-2.0-only OR BSD-2-Clause
+%YAML 1.2
+---
+$id: http://devicetree.org/schemas/mailbox/allwinner,sun55i-a523-msgbox.yaml#
+$schema: http://devicetree.org/meta-schemas/core.yaml#
+
+title: Allwinner sun55i 4-Port Message Box
+
+maintainers:
+  - Tim Michals <tcmichals@gmail.com>
+  - Samuel Holland <samuel@sholland.org>
+
+description: |
+  The hardware message box on sun55i (A523, A527, T527) and sun60i (A733)
+  SoCs is a 4-port multi-processor mailbox controller connecting the ARM
+  Cortex-A55 host cluster, HiFi4 Audio DSP, Power Management Unit (CPUS),
+  and XuanTie RISC-V co-processor.
+
+  It features independent 256-byte register banks for each processor port,
+  12 logical channels on the host (4 per remote processor), and 8-entry
+  hardware FIFOs with level interrupts.
+
+properties:
+  compatible:
+    enum:
+      - allwinner,sun55i-a523-msgbox
+      - allwinner,sun55i-t527-msgbox
+      - allwinner,sun60i-a733-msgbox
+
+  reg:
+    minItems: 4
+    maxItems: 4
+    description: |
+      Register banks for each of the four processor ports. Each port has
+      an independent 256-byte register bank.
+
+  reg-names:
+    items:
+      - const: arm
+      - const: dsp
+      - const: cpus
+      - const: rv
+
+  clocks:
+    maxItems: 1
+    description: bus clock
+
+  resets:
+    maxItems: 1
+    description: bus reset
+
+  interrupts:
+    minItems: 1
+    maxItems: 4
+    description: |
+      One interrupt per processor port. The host port interrupt is required;
+      remote port interrupts are optional.
+
+  '#mbox-cells':
+    const: 1
+    description: "channel number (0-11: 0-3 CPUS, 4-7 DSP, 8-11 RISC-V)"
+
+required:
+  - compatible
+  - reg
+  - reg-names
+  - clocks
+  - resets
+  - interrupts
+  - '#mbox-cells'
+
+additionalProperties: false
+
+examples:
+  - |
+    #include <dt-bindings/interrupt-controller/arm-gic.h>
+
+    mailbox@3003000 {
+        compatible = "allwinner,sun55i-a523-msgbox";
+        reg = <0x03003000 0x1000>,
+              <0x07094000 0x1000>,
+              <0x07120000 0x1000>,
+              <0x07136000 0x1000>;
+        reg-names = "arm", "dsp", "cpus", "rv";
+        clocks = <&ccu 120>;
+        resets = <&ccu 45>;
+        interrupts = <GIC_SPI 0 IRQ_TYPE_LEVEL_HIGH>,
+                     <GIC_SPI 1 IRQ_TYPE_LEVEL_HIGH>,
+                     <GIC_SPI 181 IRQ_TYPE_LEVEL_HIGH>,
+                     <GIC_SPI 174 IRQ_TYPE_LEVEL_HIGH>;
+        #mbox-cells = <1>;
+    };
+
-- 
2.53.0

