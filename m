Received: from mail-wm1-f41.google.com (mail-wm1-f41.google.com [209.85.128.41])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 5B7DD363C6B
	for <devicetree@vger.kernel.org>; Tue, 14 Jul 2026 10:13:07 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.128.41
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1784023988; cv=none; b=oSMzjIjSUdlLamHerHlB86h54hRjCEYSYWFZULmjn4BA4ArQswOISc5dUOa++0DQs3caDcL6+dleeMoSY4okmwDIKHwacN8lCgYWJdhhck79kOal1m0aMHQSdEJwuuhIKQJ4xZ5KfrEXYsAYaf6yMDEQ15l78HC799tvOotc9Tw=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1784023988; c=relaxed/simple;
	bh=IjJRpkhQXQj7QdSjhQ2DTY6NAjXguYlKr2R6Lsy4IWY=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version; b=rZ2stbTfqK/XHs7VPqOt0mF2F/nsUHOgepyuPcsLq2wq5hsbVoyjIRHMgGU0jNXblg6Uz144MGJVJEzdJ/cXfDaRizWhVSS6w7YRQuNe1zK4d7MaUkojRoVR+2bQoipkxRxDBKog+4yQFWhgLDBRf1Ra2BLNK6ggeDI9y6/a2i8=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=ij1h+1WX; arc=none smtp.client-ip=209.85.128.41
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="ij1h+1WX"
Received: by mail-wm1-f41.google.com with SMTP id 5b1f17b1804b1-493ece78b0cso30103145e9.0
        for <devicetree@vger.kernel.org>; Tue, 14 Jul 2026 03:13:07 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1784023985; x=1784628785; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=NryLnlPMH6Hf3JNrq31VbojgpBro7QXUxTalZR3pyS4=;
        b=ij1h+1WXkR8t0AVbChd/Xsue9qpaNqI5VnZZ1PMMGSlDr1MVpNQYOcmzpVM5kFNEqW
         ap9C5a6q3PbF4UwQ2zhNVpxOl+NZEeTUuruFUL2Wa/jBmYX6iV5Pdi0AvfXKzjXpTFLC
         smKkzsvBwgE0vE31NK1nPD54dIvaR1L84a2sqAWo0v3krV9tG8bhThe9vPX86ECAVcYc
         z5wSbFwB1Ba4SShIonotUGTEh4ztUGjwfPXr8Zc9k6nR+3cS8QlLBvbuMhxaW+iTZJmY
         yK+pVklh+mYjoEWHTQ+S0uQiuNSBj74c5NAFfgTBmNMWup+ixgPGnGqeNnSi5/T79rGy
         3tcQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1784023985; x=1784628785;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to:content-type;
        bh=NryLnlPMH6Hf3JNrq31VbojgpBro7QXUxTalZR3pyS4=;
        b=aO9IQMswW6J1ZmZxoaUwd901aLB/fbt3DAOZSu3JXKe0Si7KU2RAK7ri5EcvUVT0qH
         KeIIXCayCbzv9ZPlw0XQskoQHnTH0FvfDcB1COqLNePAWSXWdMmqeiKn+oRnftOkKEwW
         /iEhWDLpMDfHvOaeds0dYywuP+MwyaoUTKRt062SHpfaITdDUAzZrTK9axjtXtt5hr+F
         fWMVDc7WPhgkUzfMfBfcJ8pA2o3NxbFGCuTZq+ZtX+80gsIgtMYGuYSY6O5p2X6CKxu/
         zJMYn6ZHu0Ztf6SJAErZ10Nmq94y+kn4ouGiz1yPaQb+UkXvN1DogD6HtW1FITsTrmNt
         T9PA==
X-Forwarded-Encrypted: i=1; AHgh+RogifSa+R/OPeNQawD28+vt8GId3uLXym6Fe5GNc6KqMdY7Ixfcrgh/kLQ5ravf97htLRoun8OvOxp9@vger.kernel.org
X-Gm-Message-State: AOJu0YzC9tuDFtX8Fmunyyo7utVBxkNMR/+Jj/43dWQUT6Giiq52AWfQ
	Ni/MFPTCNTsbJji2tKP/FzdzxWBfVptjJFYWCDFw0BMUMfEktxm40n8v
X-Gm-Gg: AfdE7ckq5eYutelOHIS6iHQCCPAlqeEuh99a0CIRGzQpxnwtao2oZwkdT/6hiSue0fY
	783QY5TWOypdaYS3i38NRZVcyRxbDnB8BJG9QFQAcaytE1+Yb5WNi7dQZDrXUL0iiISj4oqh87x
	+OR06Lj5QWdEQfMIndOZ9vGZShNAsywev9FvYiZ040iSh7yylGDEEY8sh4rb+NFR+QSiswCQWdZ
	dFnn9TH8kVw5EuupJFUeLwVUszwTvR4pHkryYsk7ngTlr1w5A4yEZ45IebWtotA9q2uV8P7puze
	Doqs5W0WUnzrcNNBoYtkLa6FIWD8py2lL53LeVChS7DRS9+ShVLT6PzpY4cPM2GE6pRb7VWfbJq
	+1T8/yb8pydRKztE7KUR8JCS2CHoZeKmCU5mTSyRnGaIVachPCGMpWVqnqSqSq6CLV45xpG6xum
	9vA2Htlm3TedTkgajzQbKWpS/E6dJiuxlxQyTXtlN1/sE+0GYIKrrOaRuxuyytqK6hmUe14u2PA
	cqCn8OXP3Aec5vZveOWKAWTUHGZpbg0bEeZQNLMPru14eDf7znFGHE=
X-Received: by 2002:a05:600c:6303:b0:493:cfe8:5b36 with SMTP id 5b1f17b1804b1-495158c6a1bmr32455935e9.8.1784023985260;
        Tue, 14 Jul 2026 03:13:05 -0700 (PDT)
Received: from stiangglanda-IdeaPad.. ([85.233.101.104])
        by smtp.gmail.com with ESMTPSA id ffacd0b85a97d-47f464a9879sm7788927f8f.22.2026.07.14.03.13.04
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 14 Jul 2026 03:13:04 -0700 (PDT)
From: Leander Kieweg <kieweg.leander@gmail.com>
To: dri-devel@lists.freedesktop.org,
	devicetree@vger.kernel.org
Cc: airlied@gmail.com,
	simona@ffwll.ch,
	maarten.lankhorst@linux.intel.com,
	mripard@kernel.org,
	tzimmermann@suse.de,
	robh@kernel.org,
	krzk+dt@kernel.org,
	conor+dt@kernel.org,
	Leander Kieweg <kieweg.leander@gmail.com>
Subject: [RFC PATCH 1/3] dt-bindings: display: Add GlandaGPU binding
Date: Tue, 14 Jul 2026 12:11:43 +0200
Message-ID: <20260714101146.200416-2-kieweg.leander@gmail.com>
X-Mailer: git-send-email 2.43.0
In-Reply-To: <20260714101146.200416-1-kieweg.leander@gmail.com>
References: <20260714101146.200416-1-kieweg.leander@gmail.com>
Precedence: bulk
X-Mailing-List: devicetree@vger.kernel.org
List-Id: <devicetree.vger.kernel.org>
List-Subscribe: <mailto:devicetree+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:devicetree+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

Add Device Tree binding documentation for GlandaGPU, a custom
FPGA-based 2D display controller.

Signed-off-by: Leander Kieweg <kieweg.leander@gmail.com>
---
 .../bindings/display/glanda,gpu.yaml          | 49 +++++++++++++++++++
 .../devicetree/bindings/vendor-prefixes.yaml  |  2 +
 2 files changed, 51 insertions(+)
 create mode 100644 Documentation/devicetree/bindings/display/glanda,gpu.yaml

diff --git a/Documentation/devicetree/bindings/display/glanda,gpu.yaml b/Documentation/devicetree/bindings/display/glanda,gpu.yaml
new file mode 100644
index 000000000..40304e773
--- /dev/null
+++ b/Documentation/devicetree/bindings/display/glanda,gpu.yaml
@@ -0,0 +1,49 @@
+# SPDX-License-Identifier: (GPL-2.0-only OR BSD-2-Clause)
+%YAML 1.2
+---
+$id: http://devicetree.org/schemas/display/glanda,gpu.yaml#
+$schema: http://devicetree.org/meta-schemas/core.yaml#
+
+title: GlandaGPU 2D Hardware Accelerated Display Controller
+
+maintainers:
+  - Leander Kieweg <kieweg.leander@gmail.com>
+
+description: |
+  GlandaGPU is a custom FPGA soft-IP core providing a simple
+  2D hardware-accelerated drawing engine (clear/rect/line) with a
+  VGA-compatible display output. The register window covers a
+  combined VRAM + MMIO region, with MMIO registers at a fixed
+  offset within it.
+
+properties:
+  compatible:
+    const: glanda,gpu-1.0
+
+  reg:
+    maxItems: 1
+    description:
+      Combined VRAM + MMIO register window (VRAM at offset 0,
+      MMIO registers at offset 0x00200000 within this range).
+
+  interrupts:
+    maxItems: 1
+
+  clocks:
+    maxItems: 1
+    description: Bus and pixel clock provided to the FPGA IP.
+
+required:
+  - compatible
+  - reg
+
+additionalProperties: false
+
+examples:
+  - |
+    gpu@c0000000 {
+        compatible = "glanda,gpu-1.0";
+        reg = <0xc0000000 0x1000000>;
+        interrupts = <0 43 4>;
+        clocks = <&osc1>;
+    };
\ No newline at end of file
diff --git a/Documentation/devicetree/bindings/vendor-prefixes.yaml b/Documentation/devicetree/bindings/vendor-prefixes.yaml
index b1af9deac..b8b7a5401 100644
--- a/Documentation/devicetree/bindings/vendor-prefixes.yaml
+++ b/Documentation/devicetree/bindings/vendor-prefixes.yaml
@@ -666,6 +666,8 @@ patternProperties:
     description: Giantplus Technology Co., Ltd.
   "^gira,.*":
     description: Gira Giersiepen GmbH & Co. KG
+  "^glanda,.*":
+    description: GlandaGPU
   "^glinet,.*":
     description: GL Intelligence, Inc.
   "^globalscale,.*":
-- 
2.43.0

