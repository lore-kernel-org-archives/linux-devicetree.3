Received: from mail-wm1-f44.google.com (mail-wm1-f44.google.com [209.85.128.44])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 37D013A759E
	for <devicetree@vger.kernel.org>; Tue, 28 Apr 2026 15:36:38 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.128.44
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1777390601; cv=none; b=gFQOzLjGAMTS9A/HGaLP+Jk+WgwasShnTWgOrZRVUDSmMeICCGjFeAnC4gCE8Hs+rwyc2HBOPss1bVjT3nlxnR83/qMymLQSU8+6L7SKadK1nF8I/PythRw5y9ZGpZnVKc3VU9n8uEu6EHbXwGnvW5K+1N8vHEhbGXU0LQELb5o=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1777390601; c=relaxed/simple;
	bh=sJYSHWc09xFtiXGLxIY3eCmrqPgEujr443cRCV1hpP4=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version; b=j3yTXwRYZoLIDZS2WbPOzo39ZvM+ay4ezCkIl/gR84JIy+Y6kaI4aqfCB4elfSEqCUJh/beg754l30YWi4gN/uClt5b775La5q/PJNOx5cXmdvXfOL0IiNMzas+gd/WUfxdSIhvwuCPK6ZEv6zGCcvPzc7XoYL/zKDHUKOtnt30=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=lKQxq5RZ; arc=none smtp.client-ip=209.85.128.44
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="lKQxq5RZ"
Received: by mail-wm1-f44.google.com with SMTP id 5b1f17b1804b1-48984d29fe3so140815065e9.0
        for <devicetree@vger.kernel.org>; Tue, 28 Apr 2026 08:36:38 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1777390597; x=1777995397; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=eV+WP61ShKOblE3anHz+BLN4XFN+aFPa0yNq3Cy5s6A=;
        b=lKQxq5RZnkQ4Hi3yGJe+jF39DGat91RyckNI+sUpdg7kG8ih0pSRMGlSN6wE/xPoJB
         XZQBA35MHWCkYVlGgs8Jg6vYIOVkWRzzR5Bp5Zbd4Cu6Wa70pWNPEhGDQ8HnWfJcgvbo
         0NvxOqbvbORZTRL7hQIHKjAobwwiv8X6Vbs0JxXIn2U1yKbGz9nZtLxb1Hh6GkLyhzX6
         wSLnFMt67jwc2nOAFKE3uYH1c3KIJLKMsZxBFh2KQ9rG0Tt23HZbus9So7q3ZEckLDlu
         6PkAaBgqDaibVHLW6/vXUxAifQLuLDiuTPXpNrHA0cMhqa6ZZCG4xK2Nrh2/2u87L2kl
         BFGg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1777390597; x=1777995397;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to;
        bh=eV+WP61ShKOblE3anHz+BLN4XFN+aFPa0yNq3Cy5s6A=;
        b=hLWAlFz18OOAdmbbLT/iNGjPBOYcK+fZQRtdEbuT9AytdvfXh2SoGbe8vgVsGVNvT/
         yZsuwCCEVWsGWJT8I6IPNPV2wNkensLgAGt7m2Ggbnt/aouyX//dwWY5FwmsKQVFKBEV
         X91X/X7otBirSmXTcbe8br0iNxY4H0MeLCArYt5RicZia3RRG4LdrkZIlWb02TQOvNlb
         gtkDSNlcCltmppXQfOR707/EO8IRusZZLedOEYmNNya9U7fv7lYcFk6z19TH4/7feXeN
         cjzkA4q+Op38T1xr4Fs2wTAbMtN48JawTvwVDdpdTGWOjJ6tWZUWMreSQNRgvjw0KFdG
         Tndg==
X-Forwarded-Encrypted: i=1; AFNElJ/Ca3Jo+qRT0a561QSlhLBHIVWLPtgRQ/KwDQL1BlTarwRG4b4ILkwLlYyPdEWQTdv89+au8ENy7Zq7@vger.kernel.org
X-Gm-Message-State: AOJu0YyZLWaeHHyFH32NNY1wZ9JFBIfiqCCJg0gnh4C8E74tUT3q3cSj
	W9+GzJBciX6hNNfZbKcvamQFSR0sbKlR/+lc8byGrUFAba7V90POarm4
X-Gm-Gg: AeBDiet6z9TG4lSTHe587aFWR11F82wTlDJtaa7Ni4Q8wPCYZs8IqjahBPXx+9XtIRc
	uquRX9zTuNCom/CSM0Op9pMiUNYeW8quDbBQHPuZxGDnJC1mpq1UP/qzOz35c6PhP5jj6YcCw71
	w7vNwRab/MJfZItDLn2klTZdU8D9jxg9FEEYRw04DyJjssqfO8HNNIain12gPgxsaZuIhguf9fU
	NyoY5TSY4iY2w5xfOABk6s2Ql5SH5E4HUARCTjkqfuX+39MPTjaSiyjLGllG930+2Gx+7KizRja
	Fiw1fxScbsqFwJ+8hKuwuncqGErTfvWPjL6Fbi0RjnlZsrnxz5DPPJLIYeF2S/UcDaMr0h6RKaH
	23V3HkaAiLLDEee3Nz7Zq23cSRebknvvzP97+OJIOYJiJHnYL3+mFj6VwnzVHvwKF6Yb6dxQz6v
	7KMZiy3Mp913pVbXmVrP6uCnY=
X-Received: by 2002:a05:600c:4745:b0:488:9bf8:7f17 with SMTP id 5b1f17b1804b1-48a77b054d8mr51874665e9.14.1777390596486;
        Tue, 28 Apr 2026 08:36:36 -0700 (PDT)
Received: from xeon ([188.163.112.56])
        by smtp.gmail.com with ESMTPSA id 5b1f17b1804b1-48a7b56c2d0sm1358875e9.11.2026.04.28.08.36.35
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 28 Apr 2026 08:36:35 -0700 (PDT)
From: Svyatoslav Ryhel <clamor95@gmail.com>
To: Dmitry Torokhov <dmitry.torokhov@gmail.com>,
	Rob Herring <robh@kernel.org>,
	Krzysztof Kozlowski <krzk+dt@kernel.org>,
	Conor Dooley <conor+dt@kernel.org>,
	Lee Jones <lee@kernel.org>,
	Pavel Machek <pavel@kernel.org>,
	Svyatoslav Ryhel <clamor95@gmail.com>,
	David Lechner <dlechner@baylibre.com>,
	Tony Lindgren <tony@atomide.com>
Cc: linux-input@vger.kernel.org,
	devicetree@vger.kernel.org,
	linux-kernel@vger.kernel.org,
	linux-leds@vger.kernel.org
Subject: [PATCH v4 2/6 RESEND] dt-bindings: input: cpcap-pwrbutton: convert to DT schema
Date: Tue, 28 Apr 2026 18:36:07 +0300
Message-ID: <20260428153611.142816-3-clamor95@gmail.com>
X-Mailer: git-send-email 2.51.0
In-Reply-To: <20260428153611.142816-1-clamor95@gmail.com>
References: <20260428153611.142816-1-clamor95@gmail.com>
Precedence: bulk
X-Mailing-List: devicetree@vger.kernel.org
List-Id: <devicetree.vger.kernel.org>
List-Subscribe: <mailto:devicetree+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:devicetree+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

Convert power button devicetree bindings for the Motorola CPCAP MFD from
TXT to YAML format. This patch does not change any functionality; the
bindings remain the same.

Acked-by: Dmitry Torokhov <dmitry.torokhov@gmail.com>
Signed-off-by: Svyatoslav Ryhel <clamor95@gmail.com>
Reviewed-by: Rob Herring (Arm) <robh@kernel.org>
---
 .../bindings/input/cpcap-pwrbutton.txt        | 20 ------------
 .../input/motorola,cpcap-pwrbutton.yaml       | 32 +++++++++++++++++++
 2 files changed, 32 insertions(+), 20 deletions(-)
 delete mode 100644 Documentation/devicetree/bindings/input/cpcap-pwrbutton.txt
 create mode 100644 Documentation/devicetree/bindings/input/motorola,cpcap-pwrbutton.yaml

diff --git a/Documentation/devicetree/bindings/input/cpcap-pwrbutton.txt b/Documentation/devicetree/bindings/input/cpcap-pwrbutton.txt
deleted file mode 100644
index 0dd0076daf71..000000000000
--- a/Documentation/devicetree/bindings/input/cpcap-pwrbutton.txt
+++ /dev/null
@@ -1,20 +0,0 @@
-Motorola CPCAP on key
-
-This module is part of the CPCAP. For more details about the whole
-chip see Documentation/devicetree/bindings/mfd/motorola-cpcap.txt.
-
-This module provides a simple power button event via an Interrupt.
-
-Required properties:
-- compatible: should be one of the following
-   - "motorola,cpcap-pwrbutton"
-- interrupts: irq specifier for CPCAP's ON IRQ
-
-Example:
-
-&cpcap {
-	cpcap_pwrbutton: pwrbutton {
-		compatible = "motorola,cpcap-pwrbutton";
-		interrupts = <23 IRQ_TYPE_NONE>;
-	};
-};
diff --git a/Documentation/devicetree/bindings/input/motorola,cpcap-pwrbutton.yaml b/Documentation/devicetree/bindings/input/motorola,cpcap-pwrbutton.yaml
new file mode 100644
index 000000000000..77a3e5a47d1a
--- /dev/null
+++ b/Documentation/devicetree/bindings/input/motorola,cpcap-pwrbutton.yaml
@@ -0,0 +1,32 @@
+# SPDX-License-Identifier: (GPL-2.0 OR BSD-2-Clause)
+%YAML 1.2
+---
+$id: http://devicetree.org/schemas/input/motorola,cpcap-pwrbutton.yaml#
+$schema: http://devicetree.org/meta-schemas/core.yaml#
+
+title: Motorola CPCAP PMIC power key
+
+maintainers:
+  - Svyatoslav Ryhel <clamor95@gmail.com>
+
+description:
+  This module is part of the Motorola CPCAP MFD device. For more details
+  see Documentation/devicetree/bindings/mfd/motorola,cpcap.yaml. The
+  power key is represented as a sub-node of the PMIC node on the device
+  tree.
+
+properties:
+  compatible:
+    const: motorola,cpcap-pwrbutton
+
+  interrupts:
+    items:
+      - description: CPCAP's ON interrupt
+
+required:
+  - compatible
+  - interrupts
+
+additionalProperties: false
+
+...
-- 
2.51.0

