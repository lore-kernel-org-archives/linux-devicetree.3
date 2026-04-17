Received: from mail-lf1-f42.google.com (mail-lf1-f42.google.com [209.85.167.42])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id E9E6333CE80
	for <devicetree@vger.kernel.org>; Fri, 17 Apr 2026 07:11:34 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.167.42
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1776409896; cv=none; b=mPeeAvTAMrUK+ZiCQ25TfB91yFs2X3PkoxIrhkvLQv0nx4tS3h+S9ZG0PwUU0LE00gNzNgcrdNtiG/8Oc+cK64duKIPH81RUSTUGKJJqhpQIBs9gf+G8OvOiBFjbnkmfEItJ2Mdzjpk/Qd1d3WV2ZhRJOFNANxkXEpKAmQbJx4A=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1776409896; c=relaxed/simple;
	bh=sJYSHWc09xFtiXGLxIY3eCmrqPgEujr443cRCV1hpP4=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version; b=iNBQlM6ew92yFRIY9Q+RzEBgj7dlJ7kv3Xi6xnK8fL8XWMepjE4Vz1upI36vIyu288+Q/G+GpMJ8DDmkaQAxuFkRQOCxTR+mPiTyYxiugG+ujELEdM4aU8tk19JnnGcr+y1kuUouW/W6UMcgZbxM61kQkhIQHrl6TFpKCwOy1X4=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=cQD6PgRx; arc=none smtp.client-ip=209.85.167.42
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="cQD6PgRx"
Received: by mail-lf1-f42.google.com with SMTP id 2adb3069b0e04-5a415fd6bceso494745e87.1
        for <devicetree@vger.kernel.org>; Fri, 17 Apr 2026 00:11:34 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1776409893; x=1777014693; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=eV+WP61ShKOblE3anHz+BLN4XFN+aFPa0yNq3Cy5s6A=;
        b=cQD6PgRxb+3veKbVFBchJmNr/o/P57m7zd4gALCcOQJd9NmdOSUf/SA1PCokVdPib2
         h3gZ3m2/MOiKiDiGD3kEer7/eE+c9KK6ktDMHDf8YBLP2H+AVy9OgL/d8cNC/qogClCd
         hIIVRf1B7waeys7CymJ5xXi8PKV6ovZie2xVeCD2Yj49Pn2J8+Eh1JJcY2D9qSiMlpC/
         0T6kIvoBzxR7aVE+2/UQRJKWCWRHrGE2SS2vaGkGazCro9AeMzqW/E18aFuEfbH7XQYT
         ePfsXm9/wDKhyjXFZRwIyItJ51jJZdexoiRFx7e5XnLFyMWU8bRMi3RgJMAKnMuthhv1
         +0Fw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1776409893; x=1777014693;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to;
        bh=eV+WP61ShKOblE3anHz+BLN4XFN+aFPa0yNq3Cy5s6A=;
        b=iAvV0ioGSqPokZYKJWyB57s5Q0U7k7FTGlhZQ7lDerdTCXb99vMNwddOE7Fd9e46EF
         vZ+y2/qL2XyRakkBO8pXCZdqhmbzpZJAf1Szl/Vlhjpzd7pfP3Grm0xK/POnM/TBTj6U
         XVCl0KjoWz9LpaWdqHNS/WwKRYr08R0Ja7rbB6/8trUvDC0l6RAvA3R5BKpkF46+IkAl
         BMWFu4y5eHPx44wToBsU2QqKar+OHwWy6+6s9WTF30BASvUTQO9yh0EBeQ84roqvOrUF
         XBEoWF+jcwcx57UMjqssu1z26nLeJ80vfC1n5IfmujDIyJK3TDCmsThg8r3qLVMQT9+o
         TEtQ==
X-Forwarded-Encrypted: i=1; AFNElJ+6dJlDqoN+LK4vQln1LHQOuzrSXjBh+99nYijNU5691jF6JJdWgmMFN20nx3TBmBlKIq2VfgbtNT/g@vger.kernel.org
X-Gm-Message-State: AOJu0YzrnmRad2We6tln7hn9prtt7PiQ5KghuDTPDjNYKaNVFeIGOixZ
	bqxGWs44T+gKo2CyOOb8G18IiytCk6j6BGEhQQNuq+6cAVRuA+OnHGfb
X-Gm-Gg: AeBDiesz2YOqyg6TmBQ8Ei8NXHPfkji4/SehqtaRbBAE1OkZdRUsG3dxCINj7eqazKz
	XmUwW0z6Otvd1otnTSJgzGdj6Kd+KVVrMKgOLrLPq17rl6PtQVEDmVnZVNeEX3AIeCLbc/tv5AL
	auvojG8+b/jWVmHWVDlz7+Wbe17lQ/fMIQfCEojfEsPZC3jrKH0WI6nps9OczCd1W9xx7YpEZhS
	elCgoaKrBA13ly2AKjmpO+CPIoIqc8Ib//ae3g2RcdvImp7dpzfb3r25+zpZD1CHs/yWRFZ+Btv
	qJEBg57NVHcj8+VWM8U+E1X6l8MUoeEsBOKQ66+BJwrUz02iI5OM3yapcGjiy/xUegVwscemkwk
	USEzhKaGbOKTMmyGyNXcOtOKNm66823jPKADPptqvn9LSh6ihHiA4wQEzSsv8fgoZltv6KswBc4
	rBBv++BFapgeuIGo61AAkPnVw=
X-Received: by 2002:a05:6512:31d3:b0:5a4:156:aea3 with SMTP id 2adb3069b0e04-5a417174a77mr492829e87.7.1776409892978;
        Fri, 17 Apr 2026 00:11:32 -0700 (PDT)
Received: from xeon ([188.163.112.56])
        by smtp.gmail.com with ESMTPSA id 2adb3069b0e04-5a4185bc240sm162772e87.23.2026.04.17.00.11.32
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 17 Apr 2026 00:11:32 -0700 (PDT)
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
Subject: [PATCH v4 2/6] dt-bindings: input: cpcap-pwrbutton: convert to DT schema
Date: Fri, 17 Apr 2026 10:11:02 +0300
Message-ID: <20260417071106.21984-3-clamor95@gmail.com>
X-Mailer: git-send-email 2.51.0
In-Reply-To: <20260417071106.21984-1-clamor95@gmail.com>
References: <20260417071106.21984-1-clamor95@gmail.com>
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

