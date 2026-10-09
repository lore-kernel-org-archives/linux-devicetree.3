Received: from mail-wm1-f42.google.com (mail-wm1-f42.google.com [209.85.128.42])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 24BBC4C6521
	for <devicetree@vger.kernel.org>; Fri,  9 Oct 2026 11:13:47 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.128.42
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1791544439; cv=none; b=b09njDWqYexjDQVAPwrTefS7uwq+Dym7ofsEf3PR8PhWoaUPV/bqeuCVTzSwCPHrOIY6c10/um4sdmQMNrCnKAlFUMbIqoDh5ftrrl4qKa7YKRWTD6SggWyOq1Qdb9CgoCqwbIrwZ7/h/1jytxpeWgZkF39SOWNK4ZKvEYuIUIw=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1791544439; c=relaxed/simple;
	bh=3Z8R88v/tx5Du3rc1hWNnOKXjYU+6r1PY7B4+5MN3J8=;
	h=From:To:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version; b=OIQoUbBnlOeXEfWgK60NRh8ONEmpzKqzsffRNHuu6rocemcrf0/A2slp2T0HBlDxI6uowERta4xEcGSjXI63FArsElbUi1Fa5DvuhuocsN2JxlJOZmuEwZwYbSGdSO2pzng1+pr7eytxh5ukYIdCJejicNTv0443dSLcpjXhrec=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=LnTQWWWh; arc=none smtp.client-ip=209.85.128.42
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="LnTQWWWh"
Received: by mail-wm1-f42.google.com with SMTP id 5b1f17b1804b1-4a01933b584so36644205e9.0
        for <devicetree@vger.kernel.org>; Fri, 09 Oct 2026 04:13:47 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1791544426; x=1792149226; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:to:from:from:to:cc:subject:date:message-id
         :reply-to:content-type;
        bh=3WuHrYY1WT9oFIK54Sq7W39RzHltv6fhaKlkGGpDGWk=;
        b=LnTQWWWhJlN0TmbnB1nwlKyVZBlAkg8yhsC/UqDzQh2iGHLwd2lUmz1cElRvGCtVJu
         xEDJX71/nBkoxS8DnwsT62+NeLRsgHOMui7++rjoG/ZbwKb/wMIETnbwmPuHAb2O2rTK
         1++Oj7Cta59d8l7nwpzRuS5KQ/rS+2DdC8O0WnzkfIqgz6PeqNE0BRh5JJ5NT+2SB9sG
         A6Th6vi9QeLf8iJggGzyHDYTdDtz7H821Rj0YJku0lTzUl5yiFOdD1zFc9Q7x7a6yaCl
         fcdTfm4sMpi8lOtGP50QXU94Q8LTQpGNudVXGyYBQLHd2YeCLKV23PRaZdR5ZuVLqjm8
         OcHg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1791544426; x=1792149226;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:to:from:x-gm-gg:x-gm-message-state:from:to
         :cc:subject:date:message-id:reply-to:content-type;
        bh=3WuHrYY1WT9oFIK54Sq7W39RzHltv6fhaKlkGGpDGWk=;
        b=uNzkXG3lpdCXkq4BEzTMkmzEq/H9znvQSZREtfGNVj9mEKmtaHPvKlZuOgV/hmtHJb
         YeYXyqgTS+UMotuWEEVgAqqkQc1Hdak/XMTLiTSmBnJjqJB2A2fMWVWYY2cfFL/EG2xB
         o1IkrvLwMxmA7xQWjwYf6S1n6xoMBcaQhVWonO2s/jElwI2+dcH0akpgOpqV22NbKBFh
         w+XIFwn9VTg6IXm1sF/bWS5Dhxq924tvOHWjn6Ch6++SMz9w41DYYproRx9yHRzf9iOD
         I6E9+QLV0pHk8g/YA6toFcPbfasN2UEQNFW5F43R5BU/Zh8gNCVu/6mWPQYMFDmBsvts
         /pJg==
X-Forwarded-Encrypted: i=1; AKwUvBz+RdjVpbT2o3JfihUWqjNlk/PWbjdgFnCDlOPX6ms5kNx/evGO40LeP/XeqXYhX0rzp9o/YuCvocvN@vger.kernel.org
X-Gm-Message-State: AFuF++kuVnRTlZXnDQadAiHrVLv6kA1j9iPOyHt4i8MVqApsZs5tnHnU
	zU8xPWucWrhd4srxAsBshsatD6yzNmNMO2SOd4itFAz35hO2li31Xshg
X-Gm-Gg: AYBFou1HpiHmMYlOXhJ1z8hW51GaMS2SkkAxxssAxM2E852tuTJDcyPOsK7hzZB674e
	1Df0+mNXKIgNZOocvQ+H8r1iqahIGSlNnFFnj0+S44nTL49f6YCm/jeaEFje8AKnFPBPfFHWTUJ
	8P6iUcg7mZ36KJklZaILZNWbd+ivLLzN/cxDGkMtt6rvQEs8vnhfz+gSgL4fuW5Vgj6SENUbhYW
	77+qIVCJonXC5DV2qa9cNAr2GsacsCbbK1QAsGLNWeJFHk76UupDRXSOgn63kQUN1bdwAXSsbgP
	upcXPcAIxcDIZz2Ai1xfmCm/Ug9iUyjOMiQi60AdEdAd3OzRBs5Wwvt3yABuzAU3iNSYcyDaXlq
	rLe+UsnxFIjAd7jVOmyHN31bIbr2Toyge1LQ62wxFxCsnlU2AI7P44/6Jsrhst4KaCOLsiycWsf
	u3WuoXOJsuVuMn+kgDC0QCCskO7sykAp64vVzWQZXE1if6Av12weUe5GsWqt6thGJBI3VTACTeD
	VVHHi58Tr8WLQiJQ7B3EkEmuGQ5OImdtj05Kl7SgsYwxFbrbIehSaue6u/Ilh+oxLC4wohMrsSs
	QVytLhxaQTl2fiKo
X-Received: by 2002:a05:600c:3f06:b0:49f:ce78:356f with SMTP id 5b1f17b1804b1-4a18e4ca2acmr29756465e9.32.1791544426066;
        Fri, 09 Oct 2026 04:13:46 -0700 (PDT)
Received: from Ansuel-XPS24.localdomain (host-213-45-9-252.retail.telecomitalia.it. [213.45.9.252])
        by smtp.googlemail.com with ESMTPSA id 5b1f17b1804b1-4a18bf135fasm45503605e9.5.2026.10.09.04.13.44
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 09 Oct 2026 04:13:45 -0700 (PDT)
From: Christian Marangi <ansuelsmth@gmail.com>
To: Christian Marangi <ansuelsmth@gmail.com>,
	Liam Girdwood <lgirdwood@gmail.com>,
	Mark Brown <broonie@kernel.org>,
	Rob Herring <robh@kernel.org>,
	Krzysztof Kozlowski <krzk+dt@kernel.org>,
	Conor Dooley <conor+dt@kernel.org>,
	Jaroslav Kysela <perex@perex.cz>,
	Takashi Iwai <tiwai@suse.com>,
	Philipp Zabel <p.zabel@pengutronix.de>,
	linux-sound@vger.kernel.org,
	devicetree@vger.kernel.org,
	linux-kernel@vger.kernel.org
Subject: [PATCH v3 1/2] ASoC: dt-bindings: airoha: Add AN7581 PCM controller
Date: Fri,  9 Oct 2026 13:13:31 +0200
Message-ID: <20261009111334.23522-2-ansuelsmth@gmail.com>
X-Mailer: git-send-email 2.55.0
In-Reply-To: <20261009111334.23522-1-ansuelsmth@gmail.com>
References: <20261009111334.23522-1-ansuelsmth@gmail.com>
Precedence: bulk
X-Mailing-List: devicetree@vger.kernel.org
List-Id: <devicetree.vger.kernel.org>
List-Subscribe: <mailto:devicetree+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:devicetree+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

The Airoha AN7581 SoC provides a PCM interface for VoIP applications,
supporting playback and capture at sample rates of 8 kHz and 16 kHz.
The driver configures the PCM bit clock to 2.048 MHz and supports
8-bit and 16-bit samples, with up to 32 channels.

Document the related compatible and required interrupt/reset and provide an
example for it.

Signed-off-by: Christian Marangi <ansuelsmth@gmail.com>
---
 .../bindings/sound/airoha,an7581-pcm.yaml     | 52 +++++++++++++++++++
 1 file changed, 52 insertions(+)
 create mode 100644 Documentation/devicetree/bindings/sound/airoha,an7581-pcm.yaml

diff --git a/Documentation/devicetree/bindings/sound/airoha,an7581-pcm.yaml b/Documentation/devicetree/bindings/sound/airoha,an7581-pcm.yaml
new file mode 100644
index 000000000000..e73236453b88
--- /dev/null
+++ b/Documentation/devicetree/bindings/sound/airoha,an7581-pcm.yaml
@@ -0,0 +1,52 @@
+# SPDX-License-Identifier: (GPL-2.0-only OR BSD-2-Clause)
+%YAML 1.2
+---
+$id: http://devicetree.org/schemas/sound/airoha,an7581-pcm.yaml#
+$schema: http://devicetree.org/meta-schemas/core.yaml#
+
+title: Airoha PCM controller for AN7581 SoC
+
+maintainers:
+  - Christian Marangi <ansuelsmth@gmail.com>
+
+properties:
+  compatible:
+    const: airoha,an7581-pcm
+
+  reg:
+    maxItems: 1
+
+  interrupts:
+    maxItems: 1
+
+  resets:
+    maxItems: 1
+
+  reset-names:
+    const: pcm1
+
+required:
+  - compatible
+  - reg
+  - interrupts
+  - resets
+  - reset-names
+
+additionalProperties: false
+
+examples:
+  - |
+    #include <dt-bindings/interrupt-controller/arm-gic.h>
+    #include <dt-bindings/interrupt-controller/irq.h>
+    #include <dt-bindings/reset/airoha,en7581-reset.h>
+
+    pcm@1fbd0000 {
+        compatible = "airoha,an7581-pcm";
+        reg = <0x1fbd0000 0x10000>;
+
+        interrupts = <GIC_SPI 27 IRQ_TYPE_LEVEL_HIGH>;
+        resets = <&scuclk EN7581_PCM1_RST>;
+        reset-names = "pcm1";
+    };
+
+...
-- 
2.55.0

