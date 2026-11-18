Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=74.125.82.173
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1795009930;
	b=Us5/yt2f96Jl/x84GI1xTQHXCrnl60n6RM381/4BuEblo8YkNqt50guXGzb7pUq3iYHn
	 U7GxgxFeTME3FyvgoSj2L/m0zNfwaxXx9rZutOTvWQ0janOFOOEdI0NBSsqCKdk6Dhxpn
	 WWQz9FVrf7cy/xQE0/0RyG3GyoslOmyWc57bA+7so/8CNHSVGrnhjh0oY1LAlwXrP37dJ
	 g3WwMWtDUbxOSc43MiyhOYCmZWSUfu76V3NPmk9xSmMEbebKV8hWss975Toos166jzA4Q
	 w0lRggEnEIs8Re6GlWAQ/QmbuLTqME2ELJ7uzJS9e0tJbTtZ6mN79VWBoF922hjWcHA==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1795009930;
	h=DMARC-Filter:Received:DKIM-Signature:X-Google-DKIM-Signature:
	 X-Forwarded-Encrypted:X-Gm-Message-State:X-Gm-Gg:X-Received:Received:
	 From:To:Cc:Subject:Date:Message-ID:X-Mailer:In-Reply-To:References:
	 MIME-Version:Content-Type:Content-Transfer-Encoding;
	bh=RZ3vrLi3jrHMyymz0x9oO4kFMwY1lDGMb6nA1tnV5sM=;
	b=1sdCn0S4twp1hlHXmQPiaw1ILGCTE8LgKtYIdHxaYPfthhJy13Jx2EDj4Z6sbra2gRDI
	 hjzx9Ogx9a9g1Baj+t8Y19d2o+TSkV4JnUhg9HFVoVTwo0tWUL3M7N7Q59jj6iYSJjzvF
	 iRwospxq1V07UrU9zVwv8u6jcXhUCHqd8QZFeQFghjdeCEYmNkGAP8HVSjH13XZ6h8UXo
	 vslFZib+0YUlPnUOsxvv+n92DXIZqbh4XzPW3ZReX8Fl2as+BHaSvqb1vohzrM/4HiFW6
	 SUP9scy8UXiD0WSkW3ziMNA2ssxo5Xbu05h+uGF+rwQmeeSUjKhUmI7+s2UzDCRufCA==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=gmail.com;
	spf=pass smtp.mailfrom=gmail.com;
	dkim=pass header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20260707 header.b=jUh7vNMO;
	arc=none smtp.remote-ip=74.125.82.173
Received: from mail-dy1-f173.google.com (mail-dy1-f173.google.com [74.125.82.173])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 56116606A33D
	for <devicetree@vger.kernel.org>; Wed, 18 Nov 2026 13:52:10 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org 56116606A33D
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20260707 header.b=jUh7vNMO
Received: by mail-dy1-f173.google.com with SMTP id 5a478bee46e88-3712b6d9843so1119052eec.1
        for <devicetree@vger.kernel.org>; Wed, 18 Nov 2026 05:52:10 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20260707; t=1795009929; x=1795614729; darn=vger.kernel.org;
        h=content-transfer-encoding:content-type:mime-version:references
         :in-reply-to:message-id:date:subject:cc:to:from:from:to:cc:subject
         :date:message-id:reply-to:content-type;
        bh=RZ3vrLi3jrHMyymz0x9oO4kFMwY1lDGMb6nA1tnV5sM=;
        b=jUh7vNMOX92+1VlBCYokd3NJubAlepAkfnGuQtZI9Dhv5lpHfCp/h55IsavVneJCKg
         bCcv1DTxQeopWLPAI4K4g9vpWzDj9y09Oa1BeBwPtNCvmSn8dsT3yTLX1Bk4ERa12XCS
         rQh03S7Hr1CuEOyKL6egrJqiaZMF4jbUjJW74GzzCNgCanUy67o5G5zGrDPBHGI8Zdg0
         +CvV4VOSUE7GE2IH5KACD493L3eApA+/DKyzkSL0gyjX/26dSB9EYDWePBjIeZdhdCo3
         XQ0IVJe0INHwXbVPT8HCNBBiMBTQY7PN09GMvVvvvtmiz7X3z/pjpkkVDChNtNwHap1I
         r5Iw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1795009929; x=1795614729;
        h=content-transfer-encoding:content-type:mime-version:references
         :in-reply-to:message-id:date:subject:cc:to:from:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=RZ3vrLi3jrHMyymz0x9oO4kFMwY1lDGMb6nA1tnV5sM=;
        b=SvXWe4SoH8SAFBuq33RceYWXXyL4eqTluPv/qsnLSAKyLwM9LrN7x+kJNaN+NtbETY
         //q3MbiUOsi+M21a08Qxhs+EpM4bMCNFA7nMZqBxxnmzoEMKjjxrlSFJG1grnszGAdAE
         uY1b19akuV4DX6ZXvSQotNT/8G2KOYrdt8C/wygXy4QbyixC8sSVZIRPv/d2dPDSe9+s
         ki5NihpFUAQk0wHqcdBWj9PWTdMtqS1SUq3onQaizKM+s7qjvBuZCtlbukP1iju+ZLDf
         ykD3aYuHLmbZo8W96h9o4pFc9FOW5Enrhymr9h+8N9ew6/xY+b7u5QcNyQ4p8MA5Shyz
         y89g==
X-Forwarded-Encrypted: i=1; AL+hErHbpoFTUkhGvboV6nis8q+1fik19r2j+S5yoYopn1PrUUPVTp1oWjl/tgzPd7P8pXS7HMrhgA9mhe6z@vger.kernel.org
X-Gm-Message-State: APuU4Z9sPflqsQSyJA2FCJgHMHlFrBo5+xeA6z/AFEFiTdIeSfRF4oRl
	EBs+UspmJUPLgkiE4MhcT4qyMtDzoqFxPfH+jMrapGjY+a6mg5ugwh8=
X-Gm-Gg: AZFdTZeT2Ofy6kFWTOv5xB/Rfsoy+EagdYwByFijBFaiPibN7r1gFK5wdCC66E+EzK3
	CWHvTRJ/6kK3+jZ01fHEd5QOigcP7wX4c6Wyavon81YwULy9s/DCMwnsqaOMPu4voDt0zYC/53h
	w2FNYqLj+GuF94wkRoo/W1sEDIDoI11fHvJT78tMFz+mU16u+wVUmZ9XQaPRduQwm0RXydmJL10
	/GKklqq8xlM++iwGDpjPlz6/4p6l5ZfWFMbgIhgcBMJ/kbMR5V/YzE6QRy9JC4SO8Czjm4mV7aT
	jfSSjtI8paGtRbbooFCMCiHJlffup2vhLbp1rB7ci5IQ85H2wFq0mcMLQRwxnyo29k7vpRUvBuK
	LU7KbG9HSD0We75XJ/FYFOSb/1UmNSrZxh3qhiDtW22HZ/Uj9rNaqN+RDk4XuBGUYBwEPnXZfvf
	fFrmpflnSZC+CXzbeYP3N6jzPulolNHwVrffi7PaG3csETjDKpndP8oJc8pHI36xxyc1yzxRynx
	dSTD0Fy5GAEKJ8TYT8ekrzF1yP+PxsPKvWpxPBMddh3sjUS8fvBOTujnfBMHC/7NKreda5RMRPx
	KLnpi+fe/4I43etDw0SCxfeKCrABTV/4Pl7vHDNOD9N871Sn+SJTByEloAvV5RD4230ZuGVSE+q
	hgIA9Pw==
X-Received: by 2002:a05:7300:1c9c:b0:361:1dd6:531b with SMTP id 5a478bee46e88-38281025c89mr2808520eec.26.1795009929066;
        Wed, 18 Nov 2026 05:52:09 -0800 (PST)
Received: from localhost.localdomain ([186.158.238.108])
        by smtp.gmail.com with ESMTPSA id 5a478bee46e88-382a7eaf3b3sm9576421eec.27.2026.11.18.05.52.05
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 18 Nov 2026 05:52:08 -0800 (PST)
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
	Krzysztof Kozlowski <krzysztof.kozlowski@oss.qualcomm.com>
Subject: [PATCH v7 1/2] dt-bindings: display: add Chipwealth CH1115 OLED Controller
Date: Wed, 18 Nov 2026 10:48:53 -0300
Message-ID: <ee36486140ce93f97d78ba526917cafc896b7e83.1795008752.git.nico.antinori.7@gmail.com>
X-Mailer: git-send-email 2.47.3
In-Reply-To: <cover.1795008752.git.nico.antinori.7@gmail.com>
References: <cover.1795008752.git.nico.antinori.7@gmail.com>
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
Note: Carried "Reviewed-by: Krzysztof Kozlowski <...>" from v3 since the
only change was the removal of adding Chipwealth to vendor-prefixes.yml.
This was added in commit 058ee00216a1 ("dt-bindings: vendor-prefixes:
Add Chip Wealth Technology").

Note: Based on drm-next commit 601c30449c80 ("Merge tag
'drm-misc-next-2026-11-13' of
https://gitlab.freedesktop.org/drm/misc/kernel into drm-next") to avoid
conflicts when applying the series.

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

