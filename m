Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=209.85.128.41
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1792955804;
	b=eEDWRxIc3m5slUXX+PGxiWKjTtW8CILYPrdxgOsuyyCX86nJVfydM3TmtnQKsAR5KIZo
	 ETYs7HcA7nAtC2uzfTI29jEieYN9Y9SsBHWZm7HPB5zkuEL7iU1A71k1KzNHFegY+yVt0
	 lm69CGtWtsDg4yvDRl25bF8VvRJvr1/Ibo7M6hGRe5v+c2af9dG8o42XIjZkXlHZAIsey
	 Q0NuGW1CZ+IhARBVocOPSi/mE3BNhwKkTYoyzBYRSVxgS0Vi+Oj29UAC9bCI/tImBD8vR
	 UhlCFGZdnwhL+NQzxPyrgomW6udSUq7/PyWwbq0nXAPO675wLCe00EZbvl/186x1vRQ==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1792955804;
	h=DMARC-Filter:Received:DKIM-Signature:X-Google-DKIM-Signature:
	 X-Forwarded-Encrypted:X-Gm-Message-State:X-Gm-Gg:X-Received:Received:
	 From:To:Cc:Subject:Date:Message-ID:X-Mailer:In-Reply-To:References:
	 MIME-Version:Content-Transfer-Encoding;
	bh=fXRuDl/kfmEcnVDe/qo2rO7Ex+8Z1Yq/lHQYrnrvp8k=;
	b=1bQsQLp57FVgIP3AfAZLaNxtBeoJEVzlS3XI2eOspmnAtSFRyni8qdDw/uKi7CnBquuK
	 WuTbSxvLjye9Myj9FnvxBHLa468kKjdqn9NC2nYc8QUCMBE+0GvjhLsIQqg0sKC6gpxK7
	 xmqKKSvjdv6MJXy7TnYDVKk7IXaYT5D4v029+xJ2jDNb9Kz5SKUYRQJiKGg4x7xcqBK3C
	 WtRAEoA+w9+Kf2Zct6N4/hl06pitoiJj6oBfxw/dmZjXWu83ia1LHJOcq+UQtzkK+mBWs
	 aaNoS8dIbrqKRVyL1XxH1+xddZ69OahbLSHL6FVO0LzxK0ntmBNWok0GZvnze0o4++Q==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=fail header.from=mgcrea.io;
	spf=pass smtp.mailfrom=mg-crea.com;
	dkim=pass header.d=mg-crea-com.20251104.gappssmtp.com header.i=@mg-crea-com.20251104.gappssmtp.com header.a=rsa-sha256 header.s=20251104 header.b=qH+MjWg0;
	arc=none smtp.remote-ip=209.85.128.41
Received: from mail-wm1-f41.google.com (mail-wm1-f41.google.com [209.85.128.41])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 262FA606A324
	for <devicetree@vger.kernel.org>; Sun, 25 Oct 2026 19:16:44 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org 262FA606A324
Authentication-Results: smtp.subspace.kernel.org; dmarc=fail (p=none dis=none) header.from=mgcrea.io
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=mg-crea.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key, unprotected) header.d=mg-crea-com.20251104.gappssmtp.com header.i=@mg-crea-com.20251104.gappssmtp.com header.a=rsa-sha256 header.s=20251104 header.b=qH+MjWg0
Received: by mail-wm1-f41.google.com with SMTP id 5b1f17b1804b1-4a35ac4475dso8402995e9.2
        for <devicetree@vger.kernel.org>; Sun, 25 Oct 2026 12:16:43 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=mg-crea-com.20251104.gappssmtp.com; s=20251104; t=1792955802; x=1793560602; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=fXRuDl/kfmEcnVDe/qo2rO7Ex+8Z1Yq/lHQYrnrvp8k=;
        b=qH+MjWg00AIBXFcs2mMg4P273/BxhHXAGYqkwUn/B3fqqyhCQ/ydPM0Oayoyqlf+Xs
         54A6f+6oWNGqf03RnsnctANOIVNt94e/Xj3CDu8IDNH7a3sGuuzTy4dXIXETNv1qWJIc
         wLlhwEnZi6+gSH25z4YF1ROobcT5i1q/jHIXdZGob2o4OI8140ZcdmnM+21JtAb2HDqZ
         H+bC4vBB8YswKNqQrJBu0hEl1t829aRLyFm9ZuFLG4O+nFKUzAGBgPbp5jsT8NdEzeK+
         XPoOj2eT36dJklXS3bKGFFzvk7SzeiGdd6bNv+x8vcHwA2NQSi+2RCxo7RfQFqtKAcqt
         JsAw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1792955802; x=1793560602;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to:content-type;
        bh=fXRuDl/kfmEcnVDe/qo2rO7Ex+8Z1Yq/lHQYrnrvp8k=;
        b=yW4VAkVjfRIbF1/vxMXz3Bi6L6LQbkYFVneaCrFfcuqOfN+/jNqyz21YOboUpx0rrQ
         7yQaWsRy4Z4LXDTQONYlrxqu1dWUvSxtcl4J9qDefFh8AdyAw22pVTHFEjfqjRkUyHzd
         oKHgCM+GQTCkaNW7dSHj1p8FbRivFskESWL+Nv7zBGzMxe51zzdXAVx8U0wWgUQGs0Z5
         NAM03gPd8zwNEf2O/s+T8BFqjCuZq7zRivZkwpaaTwJTNZCTQQW3lfkCHAm0JCPsU2GJ
         NFrELmQU07j82Go6GFp3rf6GF1zg7PLy7P5PWQvhfIcYpoX5uLxyRakTZNHF9OqBMyOf
         3VKQ==
X-Forwarded-Encrypted: i=1; AKwUvBygsc6bmIE0oLPtZGusE6zAoFdTYl1TK2HXpDJA/hSSnN+3vxnW/8kUNuw81s7af8kyk2uQazuMaQNa@vger.kernel.org
X-Gm-Message-State: AFq9FYLeGzyorP1Vp2F4RVVkbwXCBkId3/dT+rtzGNWSW9B6ZUwUmmQc
	tsgfBOSiigPMGWC+TVrXOhccT9S5k1iADUQOXApPOtxquzB3SZAjtEAVh77AnMqJiBE=
X-Gm-Gg: AYBFou26fPbzRQLYLiqn7YxVY3riqJMhTtrBPCnf2pCqnGa3eZWn2k1XT3Th5Gmklu9
	qFDhV5H6o2B2diBg91vTRWKBkA/Qt7bAE0E9T8a8lO7EKvJ5zDkPb/GfNkzsYUb+qDYEFh2YDHj
	bSMMVM814nWMRIrezxbbbmKt/PS821AyKTZ21efGfLHqlouDGhTCGVf/jqLf/okBz8zu1TvWOHE
	PQO5kWspCl1QYdUvp5B3QxkZt1xSPVgk6crXsQ7UR6kznULNdmUCSV8D3S3EHKYU/eL4laS4ygv
	laY7TNenuKKD8B/7EdA58UZ0VGQo5LNFgwFDZOI9tCdAgGTREyQ8nhWYDGluqUKLVP0tX9k8M4m
	3U2veIPEFxdSA3G5Ot7cATFcljypK9BwKstIhSoLAovFmHsmWZaSNOo8jaQIZLMIP3iRhkGkiBD
	Wj7mmAqPZf67EyO30V0EjZjX6TN1dJuigxCUXlMvTh2z8V/ymLLovUrMO+a5GK1OyE6O8/tglXc
	EiDmzpcsq9C4V2N39zNhwcP/JEsyys77hTOpMsFpQYwD1Onh+4704R5HnnGc88BLm0BjbwkHQI8
	LyfBx1IkNvSuM7o=
X-Received: by 2002:a05:600c:3e8c:b0:4a1:d2b5:38e0 with SMTP id 5b1f17b1804b1-4a35acbcc9cmr72896635e9.25.1792955802524;
        Sun, 25 Oct 2026 12:16:42 -0700 (PDT)
Received: from localhost.localdomain ([2a01:e0a:9d2:5a71:6dfc:5715:ead7:7540])
        by smtp.gmail.com with ESMTPSA id 5b1f17b1804b1-4a35a5822a7sm144560865e9.11.2026.10.25.12.16.41
        (version=TLS1_3 cipher=TLS_CHACHA20_POLY1305_SHA256 bits=256/256);
        Sun, 25 Oct 2026 12:16:42 -0700 (PDT)
From: Olivier Louvignes <olivier@mgcrea.io>
To: Maarten Lankhorst <maarten.lankhorst@linux.intel.com>,
	Maxime Ripard <mripard@kernel.org>,
	Thomas Zimmermann <tzimmermann@suse.de>,
	Neil Armstrong <neil.armstrong@linaro.org>
Cc: David Airlie <airlied@gmail.com>,
	Simona Vetter <simona@ffwll.ch>,
	Jessica Zhang <jesszhan0024@gmail.com>,
	Rob Herring <robh@kernel.org>,
	Krzysztof Kozlowski <krzk+dt@kernel.org>,
	Conor Dooley <conor+dt@kernel.org>,
	Paul Cercueil <paul@crapouillou.net>,
	"H . Nikolaus Schaller" <hns@goldelico.com>,
	dri-devel@lists.freedesktop.org,
	devicetree@vger.kernel.org,
	linux-mips@vger.kernel.org,
	linux-kernel@vger.kernel.org,
	Olivier Louvignes <olivier@mgcrea.io>
Subject: [PATCH v2 2/5] dt-bindings: display: Add the Ingenic X1600 LCD controller
Date: Sun, 25 Oct 2026 20:16:37 +0100
Message-ID: <20261025191640.13592-3-olivier@mgcrea.io>
X-Mailer: git-send-email 2.54.0
In-Reply-To: <20261025191640.13592-1-olivier@mgcrea.io>
References: <20261025191640.13592-1-olivier@mgcrea.io>
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

The X1600's display controller fetches frames through descriptors and
keeps its interface and timings in register blocks of their own (X1600
programming manual, chapter 10), so it shares nothing with the
controllers ingenic,lcd.yaml describes. Its registers are those of the
X2000's display controller without the composer.

Signed-off-by: Olivier Louvignes <olivier@mgcrea.io>
---
 .../bindings/display/ingenic,x1600-lcd.yaml   | 70 +++++++++++++++++++
 MAINTAINERS                                   |  5 ++
 2 files changed, 75 insertions(+)
 create mode 100644 Documentation/devicetree/bindings/display/ingenic,x1600-lcd.yaml

diff --git a/Documentation/devicetree/bindings/display/ingenic,x1600-lcd.yaml b/Documentation/devicetree/bindings/display/ingenic,x1600-lcd.yaml
new file mode 100644
index 000000000000..171536c78f4b
--- /dev/null
+++ b/Documentation/devicetree/bindings/display/ingenic,x1600-lcd.yaml
@@ -0,0 +1,70 @@
+# SPDX-License-Identifier: (GPL-2.0-only OR BSD-2-Clause)
+%YAML 1.2
+---
+$id: http://devicetree.org/schemas/display/ingenic,x1600-lcd.yaml#
+$schema: http://devicetree.org/meta-schemas/core.yaml#
+
+title: Ingenic X1600 LCD controller
+
+maintainers:
+  - Olivier Louvignes <olivier@mgcrea.io>
+
+description:
+  The display controller of the Ingenic X1600 SoC. It fetches frames through
+  descriptors in memory and drives a parallel RGB panel or a smart panel;
+  its registers have nothing in common with the controllers described in
+  ingenic,lcd.yaml.
+
+properties:
+  $nodename:
+    pattern: "^lcd-controller@[0-9a-f]+$"
+
+  compatible:
+    const: ingenic,x1600-lcd
+
+  reg:
+    maxItems: 1
+
+  interrupts:
+    maxItems: 1
+
+  clocks:
+    items:
+      - description: The pixel clock, whose gate also gates the controller
+
+  clock-names:
+    items:
+      - const: lcd
+
+  port:
+    $ref: /schemas/graph.yaml#/properties/port
+    description: The output, to the panel or bridge.
+
+required:
+  - compatible
+  - reg
+  - interrupts
+  - clocks
+  - clock-names
+  - port
+
+additionalProperties: false
+
+examples:
+  - |
+    lcd-controller@13050000 {
+        compatible = "ingenic,x1600-lcd";
+        reg = <0x13050000 0x10000>;
+
+        interrupt-parent = <&intc>;
+        interrupts = <31>;
+
+        clocks = <&cgu 16>;
+        clock-names = "lcd";
+
+        port {
+            lcd_out: endpoint {
+                remote-endpoint = <&panel_in>;
+            };
+        };
+    };
diff --git a/MAINTAINERS b/MAINTAINERS
index a08087fb6e67..98d46b1cc029 100644
--- a/MAINTAINERS
+++ b/MAINTAINERS
@@ -12927,6 +12927,11 @@ F:	include/linux/mfd/ingenic-tcu.h
 F:	sound/soc/codecs/jz47*
 F:	sound/soc/jz4740/
 
+INGENIC X1600 DRM DRIVER
+M:	Olivier Louvignes <olivier@mgcrea.io>
+S:	Maintained
+F:	Documentation/devicetree/bindings/display/ingenic,x1600-lcd.yaml
+
 INJOINIC IP5xxx POWER BANK IC DRIVER
 M:	Samuel Holland <samuel@sholland.org>
 S:	Maintained
-- 
2.39.5

