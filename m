Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=74.125.82.45
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1794166819;
	b=2+5sz1jkoMzMcZ3YOuDyNi2ID9o3hirkFoXbZoosaZtCloyEFE6dhIJFdaPoxnDiI4k7
	 GT3keuBHqpKuakUaugf/3IBA8JVs5yfA/WmaD6h4k47WTbwu8G2yZ3tGrXhzo8hkYFGgm
	 9teAUNbQTwBGbVWqgAkSDghc0qFESR99PooFkWNG/0rlvdYA9WskHGbLe2/WLmK5OuhDK
	 w67g7ASBAt+/F5kmfHY/Gs/0hfEnh+/1Ae6wvfwaMDvTwTtsz+/lF4DD9Iyec7TtGc2op
	 UN3xdYlYfwNQGZElz6OfJOQEcxE6CHCQ/14IqbY7H4AQrfGcXcelNRMzjWeYQZ7i8hw==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1794166819;
	h=DMARC-Filter:Received:DKIM-Signature:X-Google-DKIM-Signature:
	 X-Forwarded-Encrypted:X-Gm-Message-State:X-Gm-Gg:X-Received:Received:
	 From:Date:Subject:MIME-Version:Content-Type:Content-Transfer-Encoding:
	 Message-Id:X-B4-Tracking:X-Change-ID:To:Cc:X-Mailer:
	 X-Developer-Signature:X-Developer-Key;
	bh=jgN6Bg/88EVvG7gizqtM+Fbm0QD1WzCs1dkA6abj+Xo=;
	b=Cdr7FeojBZ2eHySDmYWHfvsXhg+geVpofdu2qdE1NZfZckC0Bw2xhPtZE3vP9dahUlHn
	 0YRFqdmJRtDfYKqYZOlvW2J0gcJbOW/I8SrPqiGJzF3YkMjkQQVUiRqEkMKGmIOd2TSin
	 y1IyQR2Mwk1R8AVw+Q0pJExa8g10QB3icBakhwZ6FFxgmt+DCl1d4x5xLZNatqNrKEAbt
	 RF7aqoLzRt/dZ6XPrnLkOHp+EvgNYbAgEj0OMCB35U0asZjmaqyRMCTFIYo20UnFGQ3LB
	 v5FItjuj5zrNvkUB7MvsSsFnG+5N2BXUg7fGSkO7azKCp+sEewm9De6K8DWPzg/1lbA==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=gmail.com;
	spf=pass smtp.mailfrom=gmail.com;
	dkim=pass header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20260707 header.b=RbBUkI2C;
	arc=none smtp.remote-ip=74.125.82.45
Received: from mail-dl1-f45.google.com (mail-dl1-f45.google.com [74.125.82.45])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id BDFA5606A322
	for <devicetree@vger.kernel.org>; Sun,  8 Nov 2026 19:40:18 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org BDFA5606A322
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20260707 header.b=RbBUkI2C
Received: by mail-dl1-f45.google.com with SMTP id a92af1059eb24-1b3a142c6cfso17402c88.1
        for <devicetree@vger.kernel.org>; Sun, 08 Nov 2026 11:40:18 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20260707; t=1794166818; x=1794771618; darn=vger.kernel.org;
        h=cc:to:message-id:content-transfer-encoding:content-type
         :mime-version:subject:date:from:from:to:cc:subject:date:message-id
         :reply-to:content-type;
        bh=jgN6Bg/88EVvG7gizqtM+Fbm0QD1WzCs1dkA6abj+Xo=;
        b=RbBUkI2CuwYbQhZJnK3u11+VhhgeD9WZgGtPrXZCV3OHDulaniBy6IrzW58fETO7JI
         kj/pEZQFvHHCBqWXxoeUPENyJdWpkLt8e6bLf/K6C0Y7Ai7wmKDISOG41zl55+vMvGEp
         B9dXz9zKNiDIV8Pull71+2cj/pk87Zau/p/RZy5yfH5mrMbGGe3kROZsaAO0KWSPPfF/
         jNkCVpQHVcuCmQboKGcP0l0wT5QVVQIXejbaicgwytYkmdSlE97Ay7ib3dXxbAUT4OJP
         oKRoRpPBc5KPqA5GEkKOrP4RlMsAn69zSUnvgIPHsq8jDTO8NtY/US9HG1Fz4Ozb5yEw
         /rZw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1794166818; x=1794771618;
        h=cc:to:message-id:content-transfer-encoding:content-type
         :mime-version:subject:date:from:x-gm-gg:x-gm-message-state:from:to
         :cc:subject:date:message-id:reply-to:content-type;
        bh=jgN6Bg/88EVvG7gizqtM+Fbm0QD1WzCs1dkA6abj+Xo=;
        b=vRIj7kT1MtbAPxrpkobyP6Vu5KOcMyEzatl5uBk0HSwshcHFTwC1xUhgPeRgXbOnRO
         XZALV/p266pSy50+w7iPXSxko/i1fzS/sZRud0oyIkl6lA05uGMJVBaR/HUegp1Q1JNl
         oTkDTpeKUcOAa/bMkOf78bA0YOD8QCO9W5nV1On6KDBrJZYg14SPxRZew4AWvO5lQc84
         6n2F6PYy4V1OMBb4k1SvYBDB5tN0EPJ6l99HyakObg6KNlUXoMso0+LaTefufJDKG/Tr
         Vaiwu0bywVYctsH3x6CLF8z0cDpLhwJc6bwqpFDPQt3Ri77QLssI6Tdp/M1Q8R4Zc0vL
         UiDg==
X-Forwarded-Encrypted: i=1; AL+hErH4ZMZAJlIaBxFS67n6xFS8kRgmzPtlTd84vyViPfFaMHJJ6ZRzGRVwjXh+1Fs5vFNvh2PZd2lWxxuN@vger.kernel.org
X-Gm-Message-State: APuU4Z86/mRAeEE+ub9xjhbK/sOfALrzy4MkfUj0K4xrrDgy2/IdXUJ5
	h69EOeUMl7lcVljdppJ8djHqWLtPJfuzZkHhbqRdhHqWAR5pvfF6zk4p
X-Gm-Gg: AYBFou1yle8g2tREzppP7lSdvbz5vW8NUCt2iW2bp8CbDMldsrjXnoRQmvubDbiazRL
	huao5dYwAlMveVDh+n1ftogYwbnCuOa61QTBm6JwCO+vFkc1skpWyraNjV9MKecin+xz8GeItkj
	pfkGWdBIrNS2yP7RubhyV5RFMyuZRcCWFFc5lE9jCk5PAJSF4rHsTAkDrmpkirCPhly9HU07m3V
	QtvefN8qd6V0Nx40OPPzbJhTAub22jYiu/40Y7g/TeEgmF18vnQ6Lgf4NycoMHyZEps/cO0Fv/d
	e/tyCEJ63nVwyCZV5Qz45wMokRlaHwxcxEH5KoKW04EKasHqQjSp9k0EqQSJ5RYCY5hSRblD3RU
	W8QR34OcAtHHEEmSvVfq3J5X+0s7wOX/5Z/5UfqWsXSEn9S43IshRwxy5C70mo7C37T0+r6Duhk
	rkizRMIwQKa5CVX/QUWB4ineN5qtpTjSA7oI4uM+36HwsHrMfB6egitOS9iH89dJtjfAebVWVsq
	3b2uiY8WC3+7Wt0W3fJt/rV8bx4wgzsC+m2ZyRzpHCv27m5MbFgpkNKOg9NWmUcp24wrbLGUqaT
	2Y3k3he96+quz2O6Pnp1znzRw/N1poHlbYvdoag=
X-Received: by 2002:a05:693c:62cc:b0:36e:66d8:1424 with SMTP id 5a478bee46e88-3725024039amr6431662eec.0.1794166817576;
        Sun, 08 Nov 2026 11:40:17 -0800 (PST)
Received: from [192.168.1.11] ([2401:4900:881e:93af:b6d8:a723:b13b:3c1b])
        by smtp.gmail.com with ESMTPSA id 5a478bee46e88-3726039c635sm6997517eec.0.2026.11.08.11.40.13
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Sun, 08 Nov 2026 11:40:16 -0800 (PST)
From: Bhargav Joshi <j.bhargav.u@gmail.com>
Date: Mon, 09 Nov 2026 01:10:06 +0530
Subject: [PATCH] dt-bindings: media: i2c: ti,tvp514x: Convert to DT schema
X-Mailing-List: devicetree@vger.kernel.org
List-Id: <devicetree.vger.kernel.org>
List-Post: <mailto:devicetree@vger.kernel.org>
List-Help: <mailto:devicetree+help@vger.kernel.org>
List-Subscribe: <mailto:devicetree+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:devicetree+unsubscribe@vger.kernel.org>
List-Owner: <mailto:devicetree+owner@vger.kernel.org>
Precedence: list
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20261109-ti-tvp514x-v1-1-151cc74f67bd@gmail.com>
X-B4-Tracking: v=1; b=H4sIAAAAAAAC/6tWKk4tykwtVrJSqFYqSi3LLM7MzwNyDHUUlJIzE
 vPSU3UzU4B8JSMDIzMDc2ND3ZJM3ZKyAlNDkwpdY5NkC6NkUyNjQzMjJaCGgqLUtMwKsGHRsbW
 1AL3/gCxcAAAA
X-Change-ID: 20260731-ti-tvp514x-34c82c523162
To: Mauro Carvalho Chehab <mchehab@kernel.org>, 
 Rob Herring <robh@kernel.org>, Krzysztof Kozlowski <krzk+dt@kernel.org>, 
 Conor Dooley <conor+dt@kernel.org>, Vaibhav Hiremath <hvaibhav@ti.com>
Cc: linux-media@vger.kernel.org, devicetree@vger.kernel.org, 
 linux-kernel@vger.kernel.org, Bhargav Joshi <j.bhargav.u@gmail.com>
X-Mailer: b4 0.14.3
X-Developer-Signature: v=1; a=ed25519-sha256; t=1794166813; l=4336;
 i=j.bhargav.u@gmail.com; h=from:subject:message-id;
 bh=9Qksg9VZxIypnPAp453R1HaC6dfK5tRPmx4sBRRlbx4=;
 b=11eMTlJzawxRvobdnfXimGV0AkJ7uFuerwq5N6G3Jh7usGfM97q8uN0xjLajUswQEorQvn3nt
 U3K2dFrJeIOAI4BKgH3VNBthR4Ugkd+tlNeTSFZuzpZ/rX82W0ntAPj
X-Developer-Key: i=j.bhargav.u@gmail.com; a=ed25519;
 pk=IqNDwUZKECEA+n8wXctFLBbYL9NhFstZNbOznm/nX1k=

Convert Texas Instruments TVP514x video decoder from text to DT schema.
The legacy text binding marked the port endpoint as required, but
in-tree DTS files omit it. Make the endpoint optional.

Signed-off-by: Bhargav Joshi <j.bhargav.u@gmail.com>
---
 .../devicetree/bindings/media/i2c/ti,tvp514x.txt   | 44 -------------
 .../devicetree/bindings/media/i2c/ti,tvp514x.yaml  | 72 ++++++++++++++++++++++
 2 files changed, 72 insertions(+), 44 deletions(-)

diff --git a/Documentation/devicetree/bindings/media/i2c/ti,tvp514x.txt b/Documentation/devicetree/bindings/media/i2c/ti,tvp514x.txt
deleted file mode 100644
index 46752cc71f2eb..0000000000000
--- a/Documentation/devicetree/bindings/media/i2c/ti,tvp514x.txt
+++ /dev/null
@@ -1,44 +0,0 @@
-* Texas Instruments TVP514x video decoder
-
-The TVP5146/TVP5146m2/TVP5147/TVP5147m1 device is high quality, single-chip
-digital video decoder that digitizes and decodes all popular baseband analog
-video formats into digital video component. The tvp514x decoder supports analog-
-to-digital (A/D) conversion of component RGB and YPbPr signals as well as A/D
-conversion and decoding of NTSC, PAL and SECAM composite and S-video into
-component YCbCr.
-
-Required Properties :
-- compatible : value should be either one among the following
-	(a) "ti,tvp5146" for tvp5146 decoder.
-	(b) "ti,tvp5146m2" for tvp5146m2 decoder.
-	(c) "ti,tvp5147" for tvp5147 decoder.
-	(d) "ti,tvp5147m1" for tvp5147m1 decoder.
-
-- hsync-active: HSYNC Polarity configuration for endpoint.
-
-- vsync-active: VSYNC Polarity configuration for endpoint.
-
-- pclk-sample: Clock polarity of the endpoint.
-
-For further reading on port node refer to Documentation/devicetree/bindings/
-media/video-interfaces.txt.
-
-Example:
-
-	i2c0@1c22000 {
-		...
-		...
-		tvp514x@5c {
-			compatible = "ti,tvp5146";
-			reg = <0x5c>;
-
-			port {
-				tvp514x_1: endpoint {
-					hsync-active = <1>;
-					vsync-active = <1>;
-					pclk-sample = <0>;
-				};
-			};
-		};
-		...
-	};
diff --git a/Documentation/devicetree/bindings/media/i2c/ti,tvp514x.yaml b/Documentation/devicetree/bindings/media/i2c/ti,tvp514x.yaml
new file mode 100644
index 0000000000000..d39dd6c37c073
--- /dev/null
+++ b/Documentation/devicetree/bindings/media/i2c/ti,tvp514x.yaml
@@ -0,0 +1,72 @@
+# SPDX-License-Identifier: (GPL-2.0-only OR BSD-2-Clause)
+%YAML 1.2
+---
+$id: http://devicetree.org/schemas/media/i2c/ti,tvp514x.yaml#
+$schema: http://devicetree.org/meta-schemas/core.yaml#
+
+title: Texas Instruments TVP514x video decoders
+
+maintainers:
+  - Vaibhav Hiremath <hvaibhav@ti.com>
+  - Mauro Carvalho Chehab <mchehab@kernel.org>
+
+description:
+  The TVP5146/TVP5146m2/TVP5147/TVP5147m1 device is high quality, single-chip
+  digital video decoder that digitizes and decodes all popular baseband analog
+  video formats into digital video component. The tvp514x decoder supports
+  analog- to-digital (A/D) conversion of component RGB and YPbPr signals as
+  well as A/D conversion and decoding of NTSC, PAL and SECAM composite and
+  S-video into component YCbCr.
+
+properties:
+  compatible:
+    enum:
+      - ti,tvp5146
+      - ti,tvp5146m2
+      - ti,tvp5147
+      - ti,tvp5147m1
+
+  reg:
+    maxItems: 1
+
+  port:
+    $ref: /schemas/graph.yaml#/$defs/port-base
+    unevaluatedProperties: false
+
+    properties:
+      endpoint:
+        $ref: /schemas/media/video-interfaces.yaml#
+        unevaluatedProperties: false
+        required:
+          - hsync-active
+          - vsync-active
+          - pclk-sample
+
+    required:
+      - endpoint
+
+required:
+  - compatible
+  - reg
+
+additionalProperties: false
+
+examples:
+  - |
+    i2c {
+        #address-cells = <1>;
+        #size-cells = <0>;
+
+        video-decoder@5c {
+            compatible = "ti,tvp5146m2";
+            reg = <0x5c>;
+
+            port {
+                endpoint {
+                    hsync-active = <1>;
+                    vsync-active = <1>;
+                    pclk-sample = <0>;
+                };
+            };
+        };
+    };

---
base-commit: fa4ad798f6f681031775266044ba1b0cf3c670bd
change-id: 20260731-ti-tvp514x-34c82c523162

Best regards,
-- 
Bhargav

