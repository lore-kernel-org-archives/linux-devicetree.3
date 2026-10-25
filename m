Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=209.85.128.46
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1792918702;
	b=zfS0MK4xitk9zN6Qhxfy3JrRxkB5Uu8IP3fKI8XRkdFjm0OmkTmMIQMZwr/9wicskNxf
	 VKPvjTsEphxDLMyYl30xd+b/a8b7SdeCQyQ1UIbs6ogSh/dUonK5KAtMSb4lZ5LB+sPwO
	 LP7XmxWb5yOAtjdbnXzYr7Jdy06Owglx9WeR81vVLsW4Tuul7bvxqiJ6ecMDOWm0YboiK
	 9mr0Nl863LbNueqr3MGSJ0ofBCCh4hKlTze4UBS3Gy6YMhDfnrI61eoN9DjDTM/ukCQpM
	 jc8aXZQwXz66Ug6u8rnDW+jZnJKDOxs3kvnJoiVQOspFF41KUV1ME10rsa2wkWuliDQ==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1792918702;
	h=DMARC-Filter:Received:DKIM-Signature:X-Google-DKIM-Signature:
	 X-Forwarded-Encrypted:X-Gm-Message-State:X-Gm-Gg:X-Received:Received:
	 From:To:Cc:Subject:Date:Message-ID:X-Mailer:In-Reply-To:References:
	 MIME-Version:Content-Transfer-Encoding;
	bh=fXRuDl/kfmEcnVDe/qo2rO7Ex+8Z1Yq/lHQYrnrvp8k=;
	b=VjFZx7pWlVU8hiFselsjezI718e45i3ORTGdXIO5vIQRcEI4occrEkmUJNTNf7Xf7Xab
	 TQxCbg1806Y4V1U+F218OxkMwCohuUg6Mb3Y9Q5wvn8ADg0CBWmFG7UMSz0eoj+bxRPku
	 0llyj76GrwR5Zp7q5zPF+kNQh4oB0vK6K2JAxVhpFY/4DJCFmHQynKQbf2S+RBQxJhJQy
	 f+r+MTFRI8quUgLMv8fdVV6Rn8dlqpH1B1hP1SwYUlSnMPYwi/zrVGwzaTpGRawmnO25L
	 S4ic7vE+pVagFKnAoOu7oG4FbEq5/fwKwrlNFydRdjH/wvFS57JgPtjOZpg86HZsynQ==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=fail header.from=mgcrea.io;
	spf=pass smtp.mailfrom=mg-crea.com;
	dkim=pass header.d=mg-crea-com.20251104.gappssmtp.com header.i=@mg-crea-com.20251104.gappssmtp.com header.a=rsa-sha256 header.s=20251104 header.b=SpVtkEgL;
	arc=none smtp.remote-ip=209.85.128.46
Received: from mail-wm1-f46.google.com (mail-wm1-f46.google.com [209.85.128.46])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 2145C606A32A
	for <devicetree@vger.kernel.org>; Sun, 25 Oct 2026 08:58:21 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org 2145C606A32A
Authentication-Results: smtp.subspace.kernel.org; dmarc=fail (p=none dis=none) header.from=mgcrea.io
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=mg-crea.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key, unprotected) header.d=mg-crea-com.20251104.gappssmtp.com header.i=@mg-crea-com.20251104.gappssmtp.com header.a=rsa-sha256 header.s=20251104 header.b=SpVtkEgL
Received: by mail-wm1-f46.google.com with SMTP id 5b1f17b1804b1-4a2069b9710so19776045e9.2
        for <devicetree@vger.kernel.org>; Sun, 25 Oct 2026 01:58:20 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=mg-crea-com.20251104.gappssmtp.com; s=20251104; t=1792918699; x=1793523499; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=fXRuDl/kfmEcnVDe/qo2rO7Ex+8Z1Yq/lHQYrnrvp8k=;
        b=SpVtkEgLwsKWjd8xlLQt5CauSzkH6wiHgZrnTUaPZZvxNrIukHFF9mWlTN+AcpV2rx
         FBF8XdhUzRnsqg6nPtI4Zp3Khdpo+dIxseGUovNb+waniNlPSHjjJtaVEZXCm5Y7J/az
         d1z6NgLk2aglswfdYPdUegKgUC/54DeK3Za72zSZAauo5cTSKhUIvBbwi/UIQX6f85Oe
         R6NLDVdyyYO1I1+sJPUav74rPpNiUwXCmcY9ClJxIKO8caRu5+n0/WgaaWgJai+9oFiI
         fxbpqjHveQOnEeQirp9SQrw0BOFjZYU1ZKW4zqXjz1Ia5zFmvf72Q46iOP5Ulxpl7VJN
         737Q==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1792918699; x=1793523499;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to:content-type;
        bh=fXRuDl/kfmEcnVDe/qo2rO7Ex+8Z1Yq/lHQYrnrvp8k=;
        b=QWOzSGzy74LqkRfv/iVyJgn5H6Owwm+qEc0TNJ4Wpnc1RTkuBENd2x+nNS5Frgalo/
         EHp4Gjy2wsxf0aNJkNZZRWiE7u3wVorktvhnh//W2kjIegedkYWcyhNV8jgd9mx69fNA
         YieUYjFj1lvckFMJlw310JWaA9Q71KIeHn/hXR9ZI8rkVBIxVkkspl5a+DRMuV8/OZOG
         Ii38Xw3KwZLbXhx8UzAESxMIMhlvgumSFNKcr9MrNtGpBpbkfg2zLFU1t9y9PZoROQzA
         g/m6MiXRAPUXnZdchoFbfOuUDuwhVbc0t22UTV8VvwO1umTV7Lmt4PaNnAQvYwoe4NLR
         oI/w==
X-Forwarded-Encrypted: i=1; AKwUvBxN1zT9kWzqrwW3wWqMcAtYljelkZLv1403DPKLmmYYFSabpWeBszzTjltdYNDxiGmaATQ1fG9GHHON@vger.kernel.org
X-Gm-Message-State: AFq9FYJ0+xP7IOpaWku5qV2+nLK3qdxZ6Bw6XSqI0kPpBWYretBNwY4b
	jXLsFrTVlyT/xg+DRQCA8SRe+NJLYfuGn40SZ66oGtYkSmOd7+cpAC4Uijh3UojiOto=
X-Gm-Gg: AYBFou1VsTKjQf3D2kDbunQiPvEQbaPLsaFml6NUXw2anqcTe+1oo0ye4i4glcqhGBh
	znOXwDIafdeK6iTJbpx0a3L5ce4ptSeK+hMHvqDviYHjxqmzcBeGunzZFIW9kfKFUUICdjAdFUG
	qM69XYlRTkGqt0NpCZtC0B6EFb3miw4uLSOTgW4QD+9M0e8rfhP8Ur+y3DeOZclszuQGDTYy4u8
	0S56n9Uq4KZ+SlyRq7NJMEdumnUsu6y4i5z6GEuF6Pq5NQDCFllfDzgKq3+h2bkDv7dTJqQ3ani
	NVtQuzL1QMWhETvLH0B5KFfOE1Y+yhrncCV5LBOowxjbLgumEecZDSLF1apegOM3lSNQgm9yZQd
	zWSHGS7IK0h7icTaytCpuvxCMx84REXVzmm0T5yXgUJ3ESdce40yaUQs67S4fUqkludxrtilb2N
	ceQc0k8yWBw343NTzL/ubdX5oMkX8nCTL0ljBbD5qRVpfTk1FEP1ExqSIpHAFIaVYRPQ1FBYtz4
	ckd4STuvGCXgT7DsUfVqJeFdpCgYGHHnzDwkdfLxkCFakMleKWuZG6sae9oL/UlOVtYmr1C+KH/
	kT8AK37MUUx/ou36Ct8B7OoQhCMqnxmQCrAwjERe8Nfg4kwsc3Addq0Aa3y6J6OQf+rAhkyokw=
	=
X-Received: by 2002:a05:600d:c:b0:4a3:7344:13b5 with SMTP id 5b1f17b1804b1-4a373be2a9emr37807865e9.16.1792918699556;
        Sun, 25 Oct 2026 01:58:19 -0700 (PDT)
Received: from localhost.localdomain (2a01cb060184ad00bcfbae5efa3e0f0b.ipv6.abo.wanadoo.fr. [2a01:cb06:184:ad00:bcfb:ae5e:fa3e:f0b])
        by smtp.gmail.com with ESMTPSA id ffacd0b85a97d-48e3ebc3cfasm9094542f8f.17.2026.10.25.01.58.18
        (version=TLS1_3 cipher=TLS_CHACHA20_POLY1305_SHA256 bits=256/256);
        Sun, 25 Oct 2026 01:58:19 -0700 (PDT)
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
Subject: [PATCH 2/5] dt-bindings: display: Add the Ingenic X1600 LCD controller
Date: Sun, 25 Oct 2026 09:58:13 +0100
Message-ID: <20261025085816.60405-3-olivier@mgcrea.io>
X-Mailer: git-send-email 2.54.0
In-Reply-To: <20261025085816.60405-1-olivier@mgcrea.io>
References: <20261025085816.60405-1-olivier@mgcrea.io>
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

