Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=209.85.128.49
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1795729483;
	b=zyEjJdlS5EMFfWehTEXtuV3u1YRmvHbyIjDV3OEGW8QjJE4d9ZAKBz8n3xep824k2fla
	 7wdU8IbPWabu9DkK+FEUbl2dGQLg5vrxp9prftD/v3IeL8X2Ic9Dl/9+JfmgQn5X03gzl
	 fVqxX0yVr9HcbHhsFQfRjTnXF/LvwvUyQ0OXv/Txp66ja30MMDam+4ji9Ol3Xu0tiwO9d
	 PYD4RYXstNbTPan5sN6TyXg9ThCkt4SR132u4lGJKTejInhhUT2YIjIQg38j4xbVaeyE2
	 T8a03oMB8MOcM6xDOloa6e9mD/EnQXicVXitz7RqcxXxvPGlCDnCS8P8Ov5HHV2h9IA==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1795729483;
	h=DMARC-Filter:Received:DKIM-Signature:X-Google-DKIM-Signature:
	 X-Forwarded-Encrypted:X-Gm-Message-State:X-Gm-Gg:X-Received:Received:
	 From:To:Cc:Subject:Date:Message-ID:X-Mailer:In-Reply-To:References:
	 MIME-Version:Content-Transfer-Encoding;
	bh=vAPLB5wINg8+k5DF0d3PoxcepaPENAHu+hHbKIVA9v8=;
	b=GOzFe+jVHSSWQq2Agcj/akmSIdzDuxCssbFqWR1cmpvzFxwD/wLuv4pinxhT/hySqb6n
	 UQnVPH2HoJKzy+pC633KH0WMRgpQ0SSm8KaraFgWReIoOmDN0HM8Teg3zV7IpS38VNjOx
	 y2scojz1EhXRejQk2vT2viOqhS6L6bqrPrk0QiKNjyyG6UlFk8x9NmqvI1NbFUQXepNR5
	 cKhxM3jdfyTjU+XGAKqjyZqawlS2td8x8gizpbRhh2U01C04s13bwLj1afHneepqg5FLI
	 oPyNRboLS8GL8dGNHbRJUkoBwX2FpzdK59TQh8UgeXaL8BdHKXf1KAEcEIqSF6lYVhw==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=gmail.com;
	spf=pass smtp.mailfrom=gmail.com;
	dkim=pass header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20260707 header.b=gxW2kdhu;
	arc=none smtp.remote-ip=209.85.128.49
Received: from mail-wm1-f49.google.com (mail-wm1-f49.google.com [209.85.128.49])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id E2566606A68F
	for <devicetree@vger.kernel.org>; Thu, 26 Nov 2026 21:44:42 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org E2566606A68F
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20260707 header.b=gxW2kdhu
Received: by mail-wm1-f49.google.com with SMTP id 5b1f17b1804b1-4bb666304fdso73969965e9.0
        for <devicetree@vger.kernel.org>; Thu, 26 Nov 2026 13:44:42 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20260707; t=1795729481; x=1796334281; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=vAPLB5wINg8+k5DF0d3PoxcepaPENAHu+hHbKIVA9v8=;
        b=gxW2kdhub2Cnyvt4FXpfCLFU1HHIUSlvqmNGIwIvaGHhotHoR3si45IwzOWFcc/1Sl
         pi3t6jYCskQfK6mnyGB+ahhenTKwr5bWROVvn3QNWbguwz4J/N6Qc0TNmRcJENlYfTtm
         c4BMv2MQSCd5Dj76JkNH77vvWeLAQHG4g2RPBREGQLonRBIAPfAt/Yw3rUepS9QYEFKU
         vJ6o64J08GI5iFh8dnH5QVXPfbaAuekQ4hz0rABaujmM0vJzDwNxR5irrlmMksyz6V/T
         UwXJXIVfHrsam2xQDu80b/DZ8/XRnFHX8w9JcYTn4f+UXSAuWavrTtxIqGH2lTzJpGSO
         Hqnw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1795729481; x=1796334281;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to:content-type;
        bh=vAPLB5wINg8+k5DF0d3PoxcepaPENAHu+hHbKIVA9v8=;
        b=csTwobJ9G12E4ViKx0b5IhtJJSoFIg3pDAFRXDDA24OVOQg6lgThPYb2tMahJu6Vi/
         qc1r9ZF5/NX3Kjh4sslYWRBkx4/idipP9oa1fRuxC0kKX7xww0GHjWZWtJgOXhTs1Oxp
         NN1PwWPF2gzm1VMXGelEbNwaXCAZpq/YzBHfXBQNEt+Aezzj2NClduwLJmbFP90EU1QY
         CdQX3n/oVAnAbFYOiQLLW1hUlhNvqerG7HTrtlIY7AILW5U8UbGGH+vdOqxp3P585QqP
         lqrXHWoFm/PpM2uNcIpWHS74kiBPB9gNtLsS3tYFB8Kh0RXhC+U5De5CwN78YfST9LVh
         pJOg==
X-Forwarded-Encrypted: i=1; AL+hErGscKJ+u1f4I0slrpyZ8RzL0t7g0x0tHLSsLl2BIgQU05cgy+RhuIbRbktTnfDV+oEYhSM5WPDRTlxB@vger.kernel.org
X-Gm-Message-State: APuU4Z9O4hNcjV0rMoW1DvNyi9h9igvwwqI1Z0SEsDoV6iLQCNr54DCC
	keU2cSxcFz8Sj8oStKoRiwLIzKu4Rd55qPMszPAM434XU/heO1/Ze/qN
X-Gm-Gg: AZFdTZfMfErjdbQOwtUpGcurLSFhPg1l/G1VirpYVpi5Lio8DWxsIcOTKXjkxf8rjWC
	gJcVmT+W5SKDnRpvU/TF7oWnKXuCkKJDdF0Z+aH8CDUMXfF3OEeHiR5VhTkAKoW3UD1tzt+1QMp
	A92c70fvkH01mY3BmnrlBolZRRI1wgXUTf9rLdoGk+7H/32JccjbycaAQkgZRPx3/F0e4taOFJ7
	tqefmGvvzlCDiCGVna4FlKTVYC5gxXEI8PWbMgoc6fG8f1cJcMtgIjEzqxuRmvnupM7z/3SyhFP
	mzg/pCt1Pj+gGjnl3gB5nn5iy6bEPNRXUXTkzS8rZICbhVIGegGUs09MVgK2daskxafnoLjLRvj
	Hn+FOgSW+zq+Xr1vB5w/qTgWuZJj7ZTMUkTRvXUNUrF5/j4cPlEeNMoX4duYMz+mYpuedHUKE1u
	9ikTwUrIki6OD4FbojHteMsJa+hEgmASlps3VO0aEQGXO0au8XkEWG7aZPsZa4R2ElA7IHt3YjT
	muKxz8Q/4NwjxTWShA59wm0vQWtmbQ3CiYRyu8HrU6eSEtpqw/tP896u0QowaUA4iP9rbP5oM/b
	77maymV3naeyZ1b8+sqpDR/RjWGmgjUufvk1XGiF3fSOqNgH432/nXZuY0nbaTRWgPeNX2Sxi7i
	xrdyFUQItBABI6HhMYxhbjX61/+zC3DpGUVN1DD9XI5f8nzrh+SVS3cx178g/BWGAtpfxSLoaw+
	c27G5+pT13JiPV34yqcEorTOpNG17zOqGwMKAi+8PonUcEbVmB808Cx0GXqkCAXswiOMyVAXUU2
	fKsbWZFLNgVcsZVFAVghzMiSvme+ij56BypEYwYwA==
X-Received: by 2002:a05:600c:4f53:b0:4bb:68cc:7b94 with SMTP id 5b1f17b1804b1-4bb8616516cmr559444565e9.18.1795729481269;
        Thu, 26 Nov 2026 13:44:41 -0800 (PST)
Received: from jernej-laptop (77-38-7-250.dynamic.telemach.net. [77.38.7.250])
        by smtp.gmail.com with ESMTPSA id ffacd0b85a97d-4abbd84e661sm40403963f8f.18.2026.11.26.13.44.40
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 26 Nov 2026 13:44:40 -0800 (PST)
From: Jernej Skrabec <jernej.skrabec@gmail.com>
To: Chen-Yu Tsai <wens@kernel.org>,
	Samuel Holland <samuel@sholland.org>
Cc: mripard@kernel.org,
	maarten.lankhorst@linux.intel.com,
	tzimmermann@suse.de,
	airlied@gmail.com,
	simona@ffwll.ch,
	robh@kernel.org,
	jernej.skrabec@gmail.com,
	p.zabel@pengutronix.de,
	krzk+dt@kernel.org,
	conor+dt@kernel.org,
	Andre Przywara <andre.przywara@arm.com>,
	dri-devel@lists.freedesktop.org,
	devicetree@vger.kernel.org,
	linux-arm-kernel@lists.infradead.org,
	linux-sunxi@lists.linux.dev,
	linux-kernel@vger.kernel.org
Subject: [PATCH 02/11] dt-bindings: display: Add H616 display engine compatibles
Date: Thu, 26 Nov 2026 22:44:24 +0100
Message-ID: <20261126214433.3562326-3-jernej.skrabec@gmail.com>
X-Mailer: git-send-email 2.56.1
In-Reply-To: <20261126214433.3562326-1-jernej.skrabec@gmail.com>
References: <20261126214433.3562326-1-jernej.skrabec@gmail.com>
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

Allwinner H616 contains a display engine 3.3. It features two mixers and
four TCONs (2x LCD, 2x TV). Supported outputs are LCD, LVDS, HDMI and
CVBS.

Signed-off-by: Jernej Skrabec <jernej.skrabec@gmail.com>
---
 .../bus/allwinner,sun50i-a64-de2.yaml         | 20 ++++++++++-
 .../allwinner,sun4i-a10-display-engine.yaml   |  4 ++-
 .../display/allwinner,sun4i-a10-tcon.yaml     |  7 ++++
 .../display/allwinner,sun8i-a83t-dw-hdmi.yaml |  4 +++
 .../allwinner,sun8i-a83t-hdmi-phy.yaml        |  1 +
 .../display/allwinner,sun8i-r40-tcon-top.yaml | 33 +++++++++++++++++++
 6 files changed, 67 insertions(+), 2 deletions(-)

diff --git a/Documentation/devicetree/bindings/bus/allwinner,sun50i-a64-de2.yaml b/Documentation/devicetree/bindings/bus/allwinner,sun50i-a64-de2.yaml
index 232252e8825e..18ec57448edd 100644
--- a/Documentation/devicetree/bindings/bus/allwinner,sun50i-a64-de2.yaml
+++ b/Documentation/devicetree/bindings/bus/allwinner,sun50i-a64-de2.yaml
@@ -26,6 +26,9 @@ properties:
       - items:
           - const: allwinner,sun50i-h6-de3
           - const: allwinner,sun50i-a64-de2
+      - items:
+          - const: allwinner,sun50i-h616-de33
+          - const: allwinner,sun50i-a64-de2
 
   reg:
     maxItems: 1
@@ -49,11 +52,26 @@ patternProperties:
     additionalProperties: true
     properties:
       reg:
-        maxItems: 1
+        minItems: 1
+        maxItems: 2
 
     required:
       - reg
 
+allOf:
+  - if:
+      not:
+        properties:
+          compatible:
+            contains:
+              const: allwinner,sun50i-h616-de33
+    then:
+      patternProperties:
+        "@[0-9a-f]+$":
+          properties:
+            reg:
+              maxItems: 1
+
 required:
   - compatible
   - reg
diff --git a/Documentation/devicetree/bindings/display/allwinner,sun4i-a10-display-engine.yaml b/Documentation/devicetree/bindings/display/allwinner,sun4i-a10-display-engine.yaml
index e6088f379f70..6e26f184ab24 100644
--- a/Documentation/devicetree/bindings/display/allwinner,sun4i-a10-display-engine.yaml
+++ b/Documentation/devicetree/bindings/display/allwinner,sun4i-a10-display-engine.yaml
@@ -65,6 +65,7 @@ properties:
       - allwinner,sun20i-d1-display-engine
       - allwinner,sun50i-a64-display-engine
       - allwinner,sun50i-h6-display-engine
+      - allwinner,sun50i-h616-display-engine
 
   allwinner,pipelines:
     $ref: /schemas/types.yaml#/definitions/phandle-array
@@ -74,7 +75,7 @@ properties:
       maxItems: 1
     description: |
       Available display engine frontends (DE 1.0) or mixers (DE
-      2.0/3.0) available.
+      2.0/3.0/3.3) available.
 
 required:
   - compatible
@@ -96,6 +97,7 @@ if:
           - allwinner,sun9i-a80-display-engine
           - allwinner,sun20i-d1-display-engine
           - allwinner,sun50i-a64-display-engine
+          - allwinner,sun50i-h616-display-engine
 
 then:
   properties:
diff --git a/Documentation/devicetree/bindings/display/allwinner,sun4i-a10-tcon.yaml b/Documentation/devicetree/bindings/display/allwinner,sun4i-a10-tcon.yaml
index 05ed4ddcff3a..eb8d1fd9d8a3 100644
--- a/Documentation/devicetree/bindings/display/allwinner,sun4i-a10-tcon.yaml
+++ b/Documentation/devicetree/bindings/display/allwinner,sun4i-a10-tcon.yaml
@@ -36,6 +36,7 @@ properties:
       - const: allwinner,sun9i-a80-tcon-tv
       - const: allwinner,sun20i-d1-tcon-lcd
       - const: allwinner,sun20i-d1-tcon-tv
+      - const: allwinner,sun50i-h616-tcon-tv
 
       - items:
           - enum:
@@ -59,6 +60,11 @@ properties:
               - allwinner,sun50i-h6-tcon-tv
           - const: allwinner,sun8i-r40-tcon-tv
 
+      - items:
+          - enum:
+              - allwinner,sun50i-h616-tcon-lcd
+          - const: allwinner,sun8i-r40-tcon-lcd
+
   reg:
     maxItems: 1
 
@@ -256,6 +262,7 @@ allOf:
               - allwinner,sun8i-r40-tcon-tv
               - allwinner,sun9i-a80-tcon-tv
               - allwinner,sun20i-d1-tcon-tv
+              - allwinner,sun50i-h616-tcon-tv
 
     then:
       properties:
diff --git a/Documentation/devicetree/bindings/display/allwinner,sun8i-a83t-dw-hdmi.yaml b/Documentation/devicetree/bindings/display/allwinner,sun8i-a83t-dw-hdmi.yaml
index c43b02ec884f..44cc5c2beb04 100644
--- a/Documentation/devicetree/bindings/display/allwinner,sun8i-a83t-dw-hdmi.yaml
+++ b/Documentation/devicetree/bindings/display/allwinner,sun8i-a83t-dw-hdmi.yaml
@@ -28,6 +28,10 @@ properties:
       - const: allwinner,sun8i-a83t-dw-hdmi
       - const: allwinner,sun50i-h6-dw-hdmi
 
+      - items:
+          - const: allwinner,sun50i-h616-dw-hdmi
+          - const: allwinner,sun50i-h6-dw-hdmi
+
       - items:
           - enum:
               - allwinner,sun8i-h3-dw-hdmi
diff --git a/Documentation/devicetree/bindings/display/allwinner,sun8i-a83t-hdmi-phy.yaml b/Documentation/devicetree/bindings/display/allwinner,sun8i-a83t-hdmi-phy.yaml
index 1b47f3d99a78..fc88c5e2a3f6 100644
--- a/Documentation/devicetree/bindings/display/allwinner,sun8i-a83t-hdmi-phy.yaml
+++ b/Documentation/devicetree/bindings/display/allwinner,sun8i-a83t-hdmi-phy.yaml
@@ -21,6 +21,7 @@ properties:
       - allwinner,sun8i-r40-hdmi-phy
       - allwinner,sun50i-a64-hdmi-phy
       - allwinner,sun50i-h6-hdmi-phy
+      - allwinner,sun50i-h616-hdmi-phy
 
   reg:
     maxItems: 1
diff --git a/Documentation/devicetree/bindings/display/allwinner,sun8i-r40-tcon-top.yaml b/Documentation/devicetree/bindings/display/allwinner,sun8i-r40-tcon-top.yaml
index 7d849c4095a3..41324e1376ee 100644
--- a/Documentation/devicetree/bindings/display/allwinner,sun8i-r40-tcon-top.yaml
+++ b/Documentation/devicetree/bindings/display/allwinner,sun8i-r40-tcon-top.yaml
@@ -43,6 +43,7 @@ properties:
       - allwinner,sun8i-r40-tcon-top
       - allwinner,sun20i-d1-tcon-top
       - allwinner,sun50i-h6-tcon-top
+      - allwinner,sun50i-h616-tcon-top
 
   reg:
     maxItems: 1
@@ -201,6 +202,38 @@ allOf:
           items:
             - description: TCON TV0 output clock name
 
+  - if:
+      properties:
+        compatible:
+          contains:
+            const: allwinner,sun50i-h616-tcon-top
+
+    then:
+      properties:
+        clocks:
+          items:
+            - description: The TCON TOP interface clock
+            - description: The TCON TOP TV0 clock
+            - description: The TCON TOP TVE0 clock
+            - description: The TCON TOP TV1 clock
+
+        clock-names:
+          items:
+            - const: bus
+            - const: tcon-tv0
+            - const: tve0
+            - const: tcon-tv1
+
+        clock-output-names:
+          items:
+            - description: TCON TV0 output clock name
+            - description: TCON TV1 output clock name
+
+        ports:
+          required:
+            - port@2
+            - port@3
+
 examples:
   - |
     #include <dt-bindings/interrupt-controller/arm-gic.h>
-- 
2.43.0

