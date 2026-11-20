Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=209.85.221.46
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1795218410;
	b=ghRL6CgiFKlKzsdV2elWUbuvG25EVLLwGekTMzqBu6CSrXFRxaWhq3ycuslRTJXTNzlG
	 eTWYboBOSI7IW8431HkfHsXVzOj2/258N15IP6YfZ2a4cAyMs6RdkagzDyIG2l9rIXKdJ
	 whVco3x883TAnk/m7Sq7LgGq3f+lzzPQHLdBT/2LJY9//8bDx4pgybs2W3Zx/UPOQ/xiv
	 ZZf9pROXqhHuxarbTQh8VzFirYjeB537CxmIaa7dAH77xrnL9mZXGezoRaPDJufhoXmww
	 WFruNId7IVg7ZUtg1srKDj6dDXl0aqq7R96yniUYuO8G86V4G/MQ6cYbHgPgT2B08vA==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1795218410;
	h=DMARC-Filter:Received:DKIM-Signature:X-Google-DKIM-Signature:
	 X-Forwarded-Encrypted:X-Gm-Message-State:X-Gm-Gg:X-Received:Received:
	 From:To:Subject:Date:Message-ID:X-Mailer:In-Reply-To:References:
	 MIME-Version:Content-Transfer-Encoding;
	bh=Qp6mhWPp883ejORG1lCokPuAQSQmWRK0wbW6sXM1LFg=;
	b=GtowyJYhNWFgfP9yw8m/7D/o+d6iGhZ4q5hJznmpHioVY2jrFrjFs09hv80REBsLlbZk
	 ojYbySl/r6ly0a7m0HGi1+Plgd1JuSVJ8MsJ0Tk2Z+mjPUUD2QRrqAATH4PPvMTRvMTg9
	 SJunDIu0VQ3MHqq5Pd3G2zg19Qx77SJlU+81dpcugYTOOaEj7ymdWTB0YnhuBvjba4plJ
	 qo4kwq4IRsl6CbiR+TeGaQx5Hf63707Sx9HfTOTQu2jvHMzMeyavus3c3vyKBS2F4LnqY
	 chiRxdHfC5PQdQ5X7fMcJFu/RjQHgDiiMDSHLiAf9oRtHo7NllazIkgVr0eGTLAAnpw==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=gmail.com;
	spf=pass smtp.mailfrom=gmail.com;
	dkim=pass header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20260707 header.b=RN5S5ecA;
	arc=none smtp.remote-ip=209.85.221.46
Received: from mail-wr1-f46.google.com (mail-wr1-f46.google.com [209.85.221.46])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 7FADD606A68B
	for <devicetree@vger.kernel.org>; Fri, 20 Nov 2026 23:46:48 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org 7FADD606A68B
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20260707 header.b=RN5S5ecA
Received: by mail-wr1-f46.google.com with SMTP id ffacd0b85a97d-48dfc0421d9so1377627f8f.1
        for <devicetree@vger.kernel.org>; Fri, 20 Nov 2026 15:46:48 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20260707; t=1795218407; x=1795823207; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:to:from:from:to:cc:subject:date:message-id
         :reply-to:content-type;
        bh=Qp6mhWPp883ejORG1lCokPuAQSQmWRK0wbW6sXM1LFg=;
        b=RN5S5ecAP6fgoHNRTGtbgcKstEbdj0ZpOtWHtVFDE1jtFCG/UafmMRolKfWxtWyu+3
         ez5I2ju3UlLagFqrQPoZR0Gtj6dYJec4c2NPi++cCtx4fMgNNvlWtZ62CoQ+Ca+CKO0M
         CfL7sNLW/LIQQ11JSb7IhugpRFZz5sDQo/TQkLKJc6hmITxxht9hYWZD8QXmBSjOxon/
         +Oa99VNOa1yRRqeENqHaMkW6+rhzjui/ndqpfQZ6HqBT/XO6MBkLgJXIDi68mLWK3axb
         JCeKh/9jyOFFp8i1GVBch0JtducqIQJDaWKJaEqjaW+NmXEvH6fE7w6BHhka/Vi0TBFb
         zVBg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1795218407; x=1795823207;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:to:from:x-gm-gg:x-gm-message-state:from:to
         :cc:subject:date:message-id:reply-to:content-type;
        bh=Qp6mhWPp883ejORG1lCokPuAQSQmWRK0wbW6sXM1LFg=;
        b=R46j15Fy36UaAMRV9dy3pyjBRomwSJJDKwg2ni3UUhaAeYOLmf8ZGigqgt+hyv8QXG
         cW5+xSnjnnNTfJEfKpAstz/7Mm3pTg2bWF87QyhIBAbJDcdFHRmjxGIm/DMPgs6/Hvr1
         5jZwz4J4r98YfTwldMn4z6jmjy7MotRvHnt+djpQ8kqLa7VXZzz8QgzitjpCjUBLfBir
         gJ4oyoiDZsg9nJ8p7ULWNrBWFLJ5lnPjetE9RmJtgFp6P3TGi6cIJ6x7oZkndsf8rn0M
         UbSBQzIR3miNo8o1tZLjdIZcwD3z96tjX8WcM3krlHV6Wse1qStkE9nPdjVWkV/HvxNs
         td9Q==
X-Forwarded-Encrypted: i=1; AL+hErFRvjzy4NiSVnC08SAhCJqDzV5EhbYc+2VkPiLvMhnAI7l+09wvKXkV0Feum+ZaqWKfPRB++2Z0O1/o@vger.kernel.org
X-Gm-Message-State: APuU4Z/dsRScu3tvwfk4Y+VNoqUbmWD2U3XG3UyIeZ8yS7NpJfNLTeeJ
	3nmuKlscNsELvxtUBr1iuzBuEtYtq01xbfFsHVTkokB8r8FSldhWc4Xu
X-Gm-Gg: AZFdTZec8x8L3nyiOmhAT/1nwoA6RIPiEgxs41l/dMDKZ4+ao7C14t4gUYIMh5V/PGx
	uPFF5RJkD76Fs2aQ5aZhPhhLVsRQJJBOgQ14ZW7IK38aOuB8N8a/obpcG3XJKr/63fjCA5DgtkY
	zpL3r+BU7+ienR59lSWL70Dv+EMCFfCfytXcAOqSCJ/FpA1ttTpUvE/RnjShuSlqgw/CL4JAIYk
	PEwLdodDLiZNryav6olBkLOSWyt0SKaefr2D3WXwB8zq3GplWRSlE9BVyGcEZYAPd473ZmNTUIt
	KAZrpqN7mMqAz93rNmXLqEy8wgbDh5DWkmB1VBa+4zPWRh2fNSu4UYWb3VxrE+Ry/R82RHtTOCC
	xRAnKdCltjgluFjKI8QbAbYz/EiPIHFEJknvr6Enyi/mYUAp2MQmwrv4RvDbQ8kG9AMC2ICpVtE
	SmjDaGSoY6mQnM3ldVTi437O+Y4HC9CDYEGy6xmk9shxKUalm7pU5BlFk7L7k3NeqFR5Zgd59n+
	isOuFCss3eUdhEnczDlRK8CVuu9CL6XQPfHJF0wtrPiPyZBIXk3efyeC21E/UoBCVQYCkKQJr3Y
	dU+QEcyDHFJLyT3lQ/qM1QMX8oPO6vOVuM34UNG/VZS0PXOnADDkzzHRsTebzEu0qspNqVZScTR
	ETwqriFpZdVroKUDMfGUPge2QI9+vd7YSa88R4+LmJ95yOiSFIPJY0A==
X-Received: by 2002:a05:6000:4a14:b0:4a6:9f2f:414b with SMTP id ffacd0b85a97d-4abb71cbc15mr9359436f8f.32.1795218406845;
        Fri, 20 Nov 2026 15:46:46 -0800 (PST)
Received: from Ansuel-XPS24.localdomain (host-95-234-253-103.retail.telecomitalia.it. [95.234.253.103])
        by smtp.googlemail.com with ESMTPSA id ffacd0b85a97d-4ab6b10b5f6sm7605156f8f.34.2026.11.20.15.46.44
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 20 Nov 2026 15:46:45 -0800 (PST)
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
Subject: [PATCH v7 1/2] ASoC: dt-bindings: airoha: Add AN7581 PCM controller
Date: Sat, 21 Nov 2026 00:46:38 +0100
Message-ID: <20261120234640.169279-2-ansuelsmth@gmail.com>
X-Mailer: git-send-email 2.55.0
In-Reply-To: <20261120234640.169279-1-ansuelsmth@gmail.com>
References: <20261120234640.169279-1-ansuelsmth@gmail.com>
X-Mailing-List: devicetree@vger.kernel.org
List-Id: <devicetree.vger.kernel.org>
List-Post: <mailto:devicetree@vger.kernel.org>
List-Help: <mailto:devicetree+help@vger.kernel.org>
List-Subscribe: <mailto:devicetree+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:devicetree+unsubscribe@vger.kernel.org>
List-Owner: <mailto:devicetree+owner@vger.kernel.org>
Precedence: list
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

The Airoha AN7581 SoC provides a PCM interface for VoIP applications,
supporting playback and capture at sample rates of 8 kHz and 16 kHz.
The driver configures the PCM bit clock to 2.048 MHz and supports
8-bit and 16-bit samples, with up to 32 channels.

Document the related compatible and required interrupt/reset and provide an
example for it.

Signed-off-by: Christian Marangi <ansuelsmth@gmail.com>
Reviewed-by: Rob Herring (Arm) <robh@kernel.org>
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

