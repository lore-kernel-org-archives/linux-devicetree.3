Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=209.85.221.172
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1793738835;
	b=UHi6S+pmVfXUD3KhXm8jk0oePvYtwb/JVyv2pLiuKlJlGFPKOg6gAzoRM/EhgLHW1b6a
	 +s1Vp2qfNLddtqXQrn/dLKxk9QZaAYrw+MCPtD1WpI9r+rEZNI5S9RYSjEzm0tpvmUxFP
	 0nkuJmdwT//qNoY7PsihlGy5G4krXrG8DXHwOuItgzoP+xoNrU4nDY+zvK8PIi4d7z+sS
	 K3rDwwqa/tNmA2ym3grIiYdCCr5jGOkjAjHsVxXPQEmfkLVA0LYOM74VfL0bqgbes+nd6
	 pZ/b65Wxs2414ZrD6UVgQfrUrsOv0vbLgx7OWBUsCZCAw0tiW6iXa3vDB3XyJac1Kqg==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1793738835;
	h=DMARC-Filter:Received:DKIM-Signature:X-Google-DKIM-Signature:
	 X-Forwarded-Encrypted:X-Gm-Message-State:X-Gm-Gg:X-Received:Received:
	 From:To:Cc:Subject:Date:Message-ID:X-Mailer:In-Reply-To:References:
	 MIME-Version:Content-Type:Content-Transfer-Encoding;
	bh=fiW5hM0LTMUxH6fsk06/qcEbiBGXuvdygHyz52E4fRI=;
	b=hbfHzKIqpTHJirp6xQYkX4wmyHA07FAeEL0k5W8LcMr3XFCz+huNB3nKNefvzcI/M6BJ
	 vOUzpHdQcSP/PBSnkV8ZsXAx0lgaze2WyBE5Mni7Uuq9okCMzog/0NlyDmCp7+xqPIWJs
	 pwhC/+H2ARutvKlcPJsYn/EkwNTbKPne0yZ+6Qb1cyFy6nhK0lW5qSZ4+WKdX1iW3IPox
	 jWXHwUIh9YovBIcY/hOW6YWB7YkFKzRCra8YDdGqhOrvSOmmYCTwqez1DFiNXp5+Vic8/
	 txi/Wlq1fVGOKPSSY/irPVfqHBCwqOgFs5JAZFArVUYO2/xDOS6sBPHfYMwtQ499f8g==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=gmail.com;
	spf=pass smtp.mailfrom=gmail.com;
	dkim=pass header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20260707 header.b=VJuNliHL;
	arc=none smtp.remote-ip=209.85.221.172
Received: from mail-vk1-f172.google.com (mail-vk1-f172.google.com [209.85.221.172])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id E50CC606A31B
	for <devicetree@vger.kernel.org>; Tue,  3 Nov 2026 20:47:14 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org E50CC606A31B
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key, unprotected) header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20260707 header.b=VJuNliHL
Received: by mail-vk1-f172.google.com with SMTP id 71dfb90a1353d-5ec690faf85so1306459e0c.0
        for <devicetree@vger.kernel.org>; Tue, 03 Nov 2026 12:47:14 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20260707; t=1793738834; x=1794343634; darn=vger.kernel.org;
        h=content-transfer-encoding:content-type:mime-version:references
         :in-reply-to:message-id:date:subject:cc:to:from:from:to:cc:subject
         :date:message-id:reply-to:content-type;
        bh=fiW5hM0LTMUxH6fsk06/qcEbiBGXuvdygHyz52E4fRI=;
        b=VJuNliHLzOkkzmCy0fTWuU038MKDjPBjvXGm3u5icfUyfCDlJwkf4KRPcVrvf4Ld+K
         cKs841qx/B38W7rWBeFjD3oaDZ+ISQ8Ao+yV4GRl41/eAWtrZowLrHBvHo1wd8JD7DqR
         yDTlTY4iNjY+CTkMHjYrNTaGBp8Lf/Uxy28hdiefENGSou2LkoEdl72zOL3tuiN57i59
         JabvRf7wDC1JWyH3cXpdA4XAE3+oKnkG9mnqSVo8zSY73JRdb+DIpN2+AE9FWRyYcdXZ
         dndIvsSKv2v8QyCY6SajccdX/ZyVrI6T3hUr5D+EUXRS/tlgdGC+wQb0XthVOBAaMMiQ
         x3wA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1793738834; x=1794343634;
        h=content-transfer-encoding:content-type:mime-version:references
         :in-reply-to:message-id:date:subject:cc:to:from:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=fiW5hM0LTMUxH6fsk06/qcEbiBGXuvdygHyz52E4fRI=;
        b=LOoR4ko2TQfNKHhP9TO/rizoYJ62rVt12D2bi6Ufh1xXqRnlQJGL1nMLbt/XQwIebH
         RKLPkNCdQ8OhI16rR3Q6r+m2ECUO7GdeE0VjnFaqBVGTUzhQSosZvH8FS1Dx38AusL44
         eGdeNfW/2XGEmHdFm/abepC/mIunSjmp4mbWPdG2mvzgZ7zH5KoUo38jjFBOD9zt5Xgm
         Iqj9o0S6dHlvssCPB7JVbrev6RI5Zbx14tgAqAUQDVfQ/qnzhmWphEhHURN+lmI2vOGN
         4Uc4Bwy80kqj1Cc20LNBHb2Kl6FikYGBJl7V8hnrMh+EDGek2fQNQjlUlZouLj4KqBC+
         ZLHw==
X-Forwarded-Encrypted: i=1; AKwUvBzuG6kwD/zIwLxikdvkVWZGmLKAiYT7SUmTEYyBTP/PRBawmc0zjA8Gg28MBJkvUl3pQqieLLZBLTsC@vger.kernel.org
X-Gm-Message-State: APuU4Z/7ohMJHb4W3QIBX+VEPO8pWiIxbVCzEZoY7NY0D5zCv3b1K8gW
	qFYWTeMYF1RZRN3KEtHTDXJKRhNzKi5q3gQh3tLQtvkHSoutbVGT9qE=
X-Gm-Gg: AYBFou2SSUSjUgy2q7iyD37/yflEz+7czsvKipx2EE4X364m1SgNF2i65XpfMbvXVQy
	ryMiowQGbBfbl+uWIHXonPAREJ2sZtCYOZCcVcgBXJ2NNQ73p5t/UjxBq1VGQxjCi6Ufhj8iR8H
	iSqpnWKKJfqRfbjuYGcapdsfLGAxF+E0xXuooFIEuiKnO+0tkqEoms7/ZrmyZULPAnr+6IwZ+th
	c/jreMSlqiDumDdpm6ao6KgB9hh6YX/W/F2SG5g+2ha8aXBoW1PkazTkTQtHIcERAeYREeM6M9h
	KcH8zsL0HkAAs3fvXhh5fUufs2VK3MhY1CEVD62x8tjautiryh1WbVv4hDLM2XZLG+PEa82B+CO
	3l+i2F742FOXaw979bvNTbBvsNFfNsEN4bcPL5NPzqT++j7eYklgsnNZEMPYkZinoFeKwUAlfnm
	e25SmjVMwOjnfroMhRsfX3PPC6q76wVhdwF89y2NO1q6JmSAGvVTEFt+lDkIUm1Auf3mvQt2C4D
	7j5D1CDTKaS87OL9Y2UiJe14jQEgT6w8dXgENfYYfLNYj8jEQEUUMxiLQZJ3Wm3drTgKpudtfR7
	U1/PQuVvUH3akiBlVRz3TA2egznj/IqNdpaANHm7jyvRkzGewLsrgSQ1aNNUec1yCH8bbQwr29e
	+NIZP
X-Received: by 2002:a05:6122:210a:b0:5ea:f399:7820 with SMTP id 71dfb90a1353d-5ec6883a5a5mr5727843e0c.10.1793738833755;
        Tue, 03 Nov 2026 12:47:13 -0800 (PST)
Received: from localhost.localdomain ([186.158.238.108])
        by smtp.gmail.com with ESMTPSA id 71dfb90a1353d-5eca89b81b3sm119618e0c.2.2026.11.03.12.47.08
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 03 Nov 2026 12:47:13 -0800 (PST)
From: =?UTF-8?q?Nicol=C3=A1s=20Antinori?= <nico.antinori.7@gmail.com>
To: Maarten Lankhorst <maarten.lankhorst@linux.intel.com>,
	Maxime Ripard <mripard@kernel.org>,
	Thomas Zimmermann <tzimmermann@suse.de>,
	David Airlie <airlied@gmail.com>,
	Simona Vetter <simona@ffwll.ch>,
	Rob Herring <robh@kernel.org>,
	Krzysztof Kozlowski <krzk+dt@kernel.org>,
	Conor Dooley <conor+dt@kernel.org>
Cc: =?UTF-8?q?Nicol=C3=A1s=20Antinori?= <nico.antinori.7@gmail.com>,
	Brigham Campbell <me@brighamcampbell.com>,
	Christophe JAILLET <christophe.jaillet@wanadoo.fr>,
	Javier Martinez Canillas <javierm@redhat.com>,
	Jori Koolstra <jkoolstra@xs4all.nl>,
	Shuah Khan <skhan@linuxfoundation.org>,
	devicetree@vger.kernel.org,
	dri-devel@lists.freedesktop.org,
	linux-kernel@vger.kernel.org,
	linux-kernel-mentees@lists.linux.dev,
	Krzysztof Kozlowski <krzysztof.kozlowski@oss.qualcomm.com>
Subject: [PATCH v6 1/3] dt-bindings: display: add Chipwealth CH1115 OLED Controller
Date: Tue,  3 Nov 2026 17:46:51 -0300
Message-ID: <eafb1a147cc8e3c8c8a1f863fb47d8f6c52655d8.1793735996.git.nico.antinori.7@gmail.com>
X-Mailer: git-send-email 2.47.3
In-Reply-To: <cover.1793735996.git.nico.antinori.7@gmail.com>
References: <cover.1793735996.git.nico.antinori.7@gmail.com>
X-Mailing-List: devicetree@vger.kernel.org
List-Id: <devicetree.vger.kernel.org>
List-Post: <mailto:devicetree@vger.kernel.org>
List-Help: <mailto:devicetree+help@vger.kernel.org>
List-Subscribe: <mailto:devicetree+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:devicetree+unsubscribe@vger.kernel.org>
List-Owner: <mailto:devicetree+owner@vger.kernel.org>
Precedence: list
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit

Chipwealth CH1115 is a controller for monochrome dot matrix OLED panels.

Reviewed-by: Krzysztof Kozlowski <krzysztof.kozlowski@oss.qualcomm.com>
Signed-off-by: Nicolás Antinori <nico.antinori.7@gmail.com>
---
Carried "Reviewed-by: Krzysztof Kozlowski <...>" from v3 since the only
change was the removal of adding Chipwealth to vendor-prefixes.yml. This
was added in commit 058ee00216a1 ("dt-bindings: vendor-prefixes: Add
Chip Wealth Technology").

 .../bindings/display/chipwealth,ch1115.yaml   | 81 +++++++++++++++++++
 1 file changed, 81 insertions(+)
 create mode 100644 Documentation/devicetree/bindings/display/chipwealth,ch1115.yaml

diff --git a/Documentation/devicetree/bindings/display/chipwealth,ch1115.yaml b/Documentation/devicetree/bindings/display/chipwealth,ch1115.yaml
new file mode 100644
index 000000000000..6b037c40242e
--- /dev/null
+++ b/Documentation/devicetree/bindings/display/chipwealth,ch1115.yaml
@@ -0,0 +1,81 @@
+# SPDX-License-Identifier: (GPL-2.0-only OR BSD-2-Clause)
+%YAML 1.2
+---
+$id: http://devicetree.org/schemas/display/chipwealth,ch1115.yaml#
+$schema: http://devicetree.org/meta-schemas/core.yaml#
+
+title: Chipwealth CH1115 Display Controller
+
+maintainers:
+  - Nicolás Antinori <nico.antinori.7@gmail.com>
+
+description:
+  Chipwealth CH1115 is a controller for monochrome dot matrix OLED
+  panels.
+
+  https://datasheet4u.com/download/1576606/CH1115.html
+
+allOf:
+  - $ref: panel/panel-common.yaml#
+
+properties:
+  compatible:
+    const: chipwealth,ch1115
+
+  reg:
+    maxItems: 1
+
+  chipwealth,inverted:
+    type: boolean
+    description:
+      Display pixels are inverted, i.e. 0 is white and 1 is black.
+
+  chipwealth,offset:
+    $ref: /schemas/types.yaml#/definitions/uint32
+    minimum: 0
+    maximum: 63
+    default: 0
+    description:
+      Display start line offset. Specifies the vertical alignment and row shift
+      along the Y-coordinate.
+
+  width-mm: true
+  height-mm: true
+  flip-horizontal: true
+  flip-vertical: true
+  panel-timing: true
+
+required:
+  - compatible
+  - reg
+  - width-mm
+  - height-mm
+  - panel-timing
+
+additionalProperties: false
+
+examples:
+  - |
+    i2c {
+        #address-cells = <1>;
+        #size-cells = <0>;
+
+        display@3c {
+            compatible = "chipwealth,ch1115";
+            reg = <0x3c>;
+            width-mm = <12>;
+            height-mm = <8>;
+            chipwealth,offset = <8>;
+            panel-timing {
+                clock-frequency = <0>;
+                hactive = <88>;
+                vactive = <48>;
+                hfront-porch = <0>;
+                hback-porch = <0>;
+                hsync-len = <0>;
+                vsync-len = <0>;
+                vfront-porch = <0>;
+                vback-porch = <0>;
+            };
+        };
+    };
--
2.47.3

