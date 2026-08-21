Received: from mail-yw1-f175.google.com (mail-yw1-f175.google.com [209.85.128.175])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id E3C4F4C042F
	for <devicetree@vger.kernel.org>; Fri, 21 Aug 2026 14:38:37 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.128.175
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1787323120; cv=none; b=AQ2ZgbbAS2UmBwYX/2jZwvwCg3KRvu83hj23OYtaQxNwtwBIDYDUkx9fvjAgPmA19KqNrisao3K1nPTRYbuQUqHoef/juT2iyOu57dc/KMpFsgg5Slv1teIVso+1OCkPza9vqRzVE5dPBBwJenSK4+Hnqnp+j2yjJ5SW0oPSCgs=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1787323120; c=relaxed/simple;
	bh=yDkWoEFDM+6E+tOGZ/Pf2E1ikfxC7ajm6i/wChJMl5A=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version:Content-Type; b=YH4QGyqFMTC0gt7mxG3NNEOpVE66JP713RJhR53OcJ0nlD7VqcmpTRLiCk9+dESyPDFw5hjR2CJ2+My4sqeE5D4q7yOOK7ZVsrSMQ8juhf35IY89nhd2yQkeFn+fUyKHVyEp+sUwiGls9mz2msssjRfm9V5GZkndxgtvfAghlN0=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=KDT98qsm; arc=none smtp.client-ip=209.85.128.175
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="KDT98qsm"
Received: by mail-yw1-f175.google.com with SMTP id 00721157ae682-81e6f0b4610so12323437b3.2
        for <devicetree@vger.kernel.org>; Fri, 21 Aug 2026 07:38:37 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1787323113; x=1787927913; darn=vger.kernel.org;
        h=content-transfer-encoding:content-type:mime-version:references
         :in-reply-to:message-id:date:subject:cc:to:from:from:to:cc:subject
         :date:message-id:reply-to:content-type;
        bh=FpnrrgVBkCseeH30s/+2qScfilYBiNsJRVekRnVKb/Y=;
        b=KDT98qsmhdmf4F0SEegqSexqjR1iYsyCon39Q/cviDdTMY9rRgnXLlBJaHoqRH42//
         wRHp+4A25iHCXZiOevgLb9ofFoQ6d40T+wL31jlvqUZIv+gVUmHUi6E6oc0SA1QXW6g1
         O0V/cI/2B8HaUzcK2+tYExOJt2YQHPeBIOaN2vbKaXy6QA4VGJo40OdcskFyjWDaRfzs
         1U/dM82ZyeyzWKNVDFoIz7IF63K0fzs7aggRV2jXPUkW7txJKQZia63EYrp/bpn+nVuu
         +of8oSelOm57ljY1Btbermw5KGsNVIXSLlpNWLBcU3TW1nfNLTmmkuj8nuKVieGt/Uiu
         cXaA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1787323113; x=1787927913;
        h=content-transfer-encoding:content-type:mime-version:references
         :in-reply-to:message-id:date:subject:cc:to:from:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=FpnrrgVBkCseeH30s/+2qScfilYBiNsJRVekRnVKb/Y=;
        b=GpqLUf/pG3LxkT7l+sYVBccZNtKhyC6cGkOuMJc+P7RrlzZn1SIzhnfxL1ZHN4s4B2
         QWlXX8FyBCqNQHEyu0Vq0QQm/Zz8C9VsGMwOgEeVG2B2em7yU36bwEKNdknmwuzSFfEx
         yvkZ68oDbEHgu+/B1Wuk1nreVviiOLbCIHtvDByz8IRX8uS14gdkf4C+kQDDs2L79q7M
         mrIRoKKWaq9ztkwEszR+Hww6KD1+15X9bWOcFhVnmAHK+y3BWoqrLkb5eEDIkUDJWQvg
         5XlAJbYwbb6baIWJmf1M98rkCSpfkZTGWOxhZDU4uxiZ45VnG9E3qiGc+IVFxfyjeiAf
         bbuA==
X-Forwarded-Encrypted: i=1; AHgh+Rrvb+LmayU87Qx8aWRBPbr1FlFIoEWmkloRDSWMJyxFDXijimWvNyDs4kzDtb0zCMHg67ZdnpKflfnP@vger.kernel.org
X-Gm-Message-State: AFuF++l4f4cE+tzv0U9ij1LLVBcvdGx47s8V86L6gbpbh+MQHT3mrlVO
	B3DhafZhIMNyHHa36ZPq10N22hilcLn6RfV9eTpC0/6R0W/f4+me684=
X-Gm-Gg: AR+sD10nRSk5EG312LPPp9x/UdnmgtJ1gmwA+h6rRFbDmR4Zx3PB9uGRGY+MRuxUOAL
	5Z3q/U68JOy4CfGNC2bGsH2mF4/V+C4liAjskx4CU5UxJCrs01vHcNtQVEgP7BqDT7gB0slu4Lu
	hNUYzcW43Kns+ZUyc+eSPi6qXuKXqo/0RsemTNASL2xI78vGDzzlK2F/QgzQtITrIhsUaWZ8zu4
	7hzMjSRF6v0MzHEDYad36CONdnxW3mqtHCjoySHtODw7uMkTE+2N4q1ax4S1iEgrY0GV/QSJj8d
	vI0lonO1sa4hpBPaZHzAbTnzlE9PPE56EAujh00f+hT8ToxRhsxeDoXEo2CRV5tubvWoZ98FelX
	Br/isqMIuHUQA63UVw2h1UHpZwm5uyQ92uqAc43LokPiTWHwNirkkZZ+r0PUaMqQNG0zZNkJOUO
	SlmGX+hbbZdACJsLNJ5btZqk3bo/i/f3N2gIY5h7/HRPxGia5UCwSak46y0mczW13tkPR/9GTZK
	NIlOStEU+f0bHLU1p20AEoz+kJ+O4k1sK4onffE
X-Received: by 2002:a05:690c:e20c:10b0:81f:d515:8c06 with SMTP id 00721157ae682-849f61ddfc9mr21942087b3.29.1787323112427;
        Fri, 21 Aug 2026 07:38:32 -0700 (PDT)
Received: from localhost.localdomain ([186.158.238.108])
        by smtp.gmail.com with ESMTPSA id 00721157ae682-845188b28f2sm41868277b3.38.2026.08.21.07.38.28
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 21 Aug 2026 07:38:32 -0700 (PDT)
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
	Jori Koolstra <jkoolstra@xs4all.nl>,
	Shuah Khan <skhan@linuxfoundation.org>,
	devicetree@vger.kernel.org,
	dri-devel@lists.freedesktop.org,
	linux-kernel@vger.kernel.org,
	linux-kernel-mentees@lists.linux.dev
Subject: [PATCH v2 1/3] dt-bindings: display: add Chipwealth CH1115 OLED Controller
Date: Fri, 21 Aug 2026 11:34:16 -0300
Message-ID: <379eb0dbb4a911d80a3af680f647cf13ae0ece32.1787321297.git.nico.antinori.7@gmail.com>
X-Mailer: git-send-email 2.47.3
In-Reply-To: <cover.1787321297.git.nico.antinori.7@gmail.com>
References: <cover.1787321297.git.nico.antinori.7@gmail.com>
Precedence: bulk
X-Mailing-List: devicetree@vger.kernel.org
List-Id: <devicetree.vger.kernel.org>
List-Subscribe: <mailto:devicetree+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:devicetree+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit

Chipwealth CH1115 is a controller for monochrome dot matrix OLED panels.

Signed-off-by: Nicolás Antinori <nico.antinori.7@gmail.com>
---
NOTE: patch series based in kernel v7.2

 .../bindings/display/chipwealth,ch1115.yaml   | 89 +++++++++++++++++++
 .../devicetree/bindings/vendor-prefixes.yaml  |  2 +
 2 files changed, 91 insertions(+)
 create mode 100644 Documentation/devicetree/bindings/display/chipwealth,ch1115.yaml

diff --git a/Documentation/devicetree/bindings/display/chipwealth,ch1115.yaml b/Documentation/devicetree/bindings/display/chipwealth,ch1115.yaml
new file mode 100644
index 000000000000..9d9c43722131
--- /dev/null
+++ b/Documentation/devicetree/bindings/display/chipwealth,ch1115.yaml
@@ -0,0 +1,89 @@
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
+  chipwealth,invert:
+    type: boolean
+    description:
+      Display pixels are inverted, i.e. 0 is white and 1 is black.
+
+  chipwealth,offset:
+    $ref: /schemas/types.yaml#/definitions/uint32
+    minimum: 0
+    maximum: 63
+    description:
+      Display start line offset. Specifies the vertical alignment and row shift along the
+      Y-coordinate.
+
+  chipwealth,contrast:
+    $ref: /schemas/types.yaml#/definitions/uint32
+    minimum: 0
+    maximum: 255
+    description:
+      Panel contrast.
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
+      #address-cells = <1>;
+      #size-cells = <0>;
+      status = "okay";
+
+      display@3c {
+        compatible = "chipwealth,ch1115";
+        reg = <0x3c>;
+        width-mm = <12>;
+        height-mm = <8>;
+        chipwealth,contrast = <127>;
+        chipwealth,offset = <8>;
+        panel-timing {
+          clock-frequency = <0>;
+          hactive = <88>;
+          vactive = <48>;
+          hfront-porch = <0>;
+          hback-porch = <0>;
+          hsync-len = <0>;
+          vsync-len = <0>;
+          vfront-porch = <0>;
+          vback-porch = <0>;
+        };
+      };
+    };
diff --git a/Documentation/devicetree/bindings/vendor-prefixes.yaml b/Documentation/devicetree/bindings/vendor-prefixes.yaml
index d2ba67c4c8e0..1d158ac83ce9 100644
--- a/Documentation/devicetree/bindings/vendor-prefixes.yaml
+++ b/Documentation/devicetree/bindings/vendor-prefixes.yaml
@@ -325,6 +325,8 @@ patternProperties:
     description: ChipOne
   "^chipspark,.*":
     description: ChipSPARK
+  "^chipwealth,.*":
+    description: Chip Wealth Technology, Ltd.
   "^chongzhou,.*":
     description: Shenzhen Chongzhou Electronic Technology Co., Ltd
   "^chrontel,.*":
--
2.47.3

