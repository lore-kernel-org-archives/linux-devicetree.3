Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=209.85.217.53
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1794429438;
	b=Fnm8OsKZjmidO1Gf9L9vNpj4uNszlriyYPNBCxx1JkP0zt2HGVf+m0K5NLUcZhlpmJNm
	 obmOVAH2un6zjcwNqMDE0VlirYx4qcJQWkyDelswHl+fmdkxcDEEBMDYBWYeOUwWsHlfZ
	 8MBzU/Y8De+/qaBYyxyfyKw+Rtry2Aa4q4yNL/jGHmrtjhh8f4YLjL1BIYfH5HtHrCZMR
	 J3xxPUovu6DKrRESlWv8qPIONPG30bTh9X90J6wNChjZm/uRu+x3UsKVjjsmMQzvQW4nC
	 smrY4NuU6F31CPwXhRUH4v9IYKo13bXbPxOGH8O17obgxAeJ/D0qYG258Az6n/JNWKw==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1794429438;
	h=DMARC-Filter:Received:DKIM-Signature:X-Google-DKIM-Signature:
	 X-Forwarded-Encrypted:X-Gm-Message-State:X-Gm-Gg:X-Received:Received:
	 From:To:Cc:Subject:Date:Message-ID:X-Mailer:MIME-Version:
	 Content-Transfer-Encoding;
	bh=MbMz2QduqBl0mlCaXRQxtGdqnfX132c6wYdK6b13hWY=;
	b=oxztvx1ufomh+WO1FbDYXQuZqBB9LvQwIvCJnkli7oafKRwgJbjVjttjiEamB7pGRDtT
	 BYkJ6fIP2ShQc08kWDm6K24wBL7s4O/c7wdKAxk5CBsjVU2x9jRm3RioFASXfu3fi/YyO
	 5PjUhdJ9b/tudwgQZcE5Q2+YZt1KjdlC0urSb+ttZv8OeTia170/DyHHz61zyIsq8pE7z
	 R34sc2k014quU4UfoUrkaz+No2/D9WySzn84pfyh6dczBc04TAzxdpem2euAZlTUeuyru
	 u+kOl1/ejErEnKWHnEIRn/gzpdsOjBnwT53Kbg4ZdB6mNY6w73dEviKbdcMqjfJoXSw==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=gmail.com;
	spf=pass smtp.mailfrom=gmail.com;
	dkim=pass header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20260707 header.b=u390TekB;
	arc=none smtp.remote-ip=209.85.217.53
Received: from mail-vs1-f53.google.com (mail-vs1-f53.google.com [209.85.217.53])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id A959A606A893
	for <devicetree@vger.kernel.org>; Wed, 11 Nov 2026 20:37:17 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org A959A606A893
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20260707 header.b=u390TekB
Received: by mail-vs1-f53.google.com with SMTP id ada2fe7eead31-7cc53938a8fso2348185137.2
        for <devicetree@vger.kernel.org>; Wed, 11 Nov 2026 12:37:17 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20260707; t=1794429436; x=1795034236; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:from:to:cc:subject:date:message-id:reply-to:content-type;
        bh=MbMz2QduqBl0mlCaXRQxtGdqnfX132c6wYdK6b13hWY=;
        b=u390TekBVOfsU6W92eCR8uqDX2HypR25ULdF80ML6iI5BUW33r6LwCBOmETUxO1ELg
         AmtrPje948ANJC6h0pSNnjl//jUMc/qIU+dMU4AwjJoyHMsNf0g1/Grpt2t1aC6x2Hec
         IN1fxq6xwQ2GSKWrvW4dVFrGkbx4nyeccEUzGdmeQUKhJFRg5LZU9jgmABBzn6+4OhWf
         EdVV1y/OuMk7fKK8JoIlb6yUpGukWYzEFsuiM03AObf3A/0kqOKsD6mlgoC24rMz6sfw
         YaDUUe+Zqks+JxPoFYlIrudMHJ2ZghNF/rA40HlanyZ4ewxYSq+olrGAKUsrEhr450Ke
         +nWw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1794429436; x=1795034236;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=MbMz2QduqBl0mlCaXRQxtGdqnfX132c6wYdK6b13hWY=;
        b=asqeSoB5qhWWrIE91INT7adgJkDOcYJ0z1b5WpPjwycIz4oC1C0MLy9uwCsBuwmeJD
         JVN/BXsPvM7v7iURqtLcBKcgdsV0XErMpVfhnRB4fxjEOYYCwz8Mn2ExTxDLNb8KF8Jr
         /ElJoD95VoCo2zsi92aNPqjtnqOgtBreAUhvwnd3g8Zo+YylpIWorLx5C/1C3hSVg0jO
         2ysJdfvUnMHOJgf85FAre2e5wALgnCjHNCKeR+1c9ilY1jlhS453ccwjdJ/oYo/aFTTU
         OsulYu9aukNu7kWuoPc1kNC9UwdjvIoRPvOif8CHlZHcfzh/J8IIv9Gv9sWQ4lsphSHw
         fh/g==
X-Forwarded-Encrypted: i=1; AL+hErEbabuUtFYEcIpojYY8GJvE8ARsU9meuH+FT1wAxxgZhwoP/siO3/DEb+XRggSNczvb2aQFnWOo+MpV@vger.kernel.org
X-Gm-Message-State: APuU4Z9CEOBEBJXF2r5PwQhpnQTLoJl7AWt+H2TOyN80cCxO2i5dmis5
	cyfLmKM5NR/+6FyDcGn7sTN8fdhIkxyoAs5+C55A//G9mZMe7kU0LJvsh07veA==
X-Gm-Gg: AYBFou2nqcpx7+ktSRVOwLbUzSq2eyl5GbsLZ8mXOrA6dt633jxItPN5O39fG+BMOxT
	dr+JX7KPvPzhn8FXcjaZ9oPQZMoMLT5kxsw+VI6P1921E1hrkmwJFvYML4SYaEZfKPGgtj/eGqC
	Zqno9Px+5RJlNxkLbPvkH/2zzbNFHd2fPEcV5aG1wtZmwWPqi0M3yRqKr2oAuwhU/I6slp+5Zvy
	6Qko76rY88IwKCsiuxDpSn/O5H/KUYQvrvSRKRLEOD9t0pXGLl2HJ7XnHo0risjhMtNwPBA2/ze
	80mU63SrQbUfJEwbyj9g26cruFagsw7xxqY9dbAAUHSew8W5w9hA0tQjOBZDSYaiCadglD58/zM
	YiUVhsfBnlwQfRMb3/SYIhWbExMLBbROF85S3PkCl2F4AMgqGbKfJWLpPTyr7Gt3ma+mOqitfEc
	MlmFo9sHVo6ObzFRtx0iiRd495BmiTtGMVORvcI/66XEdhnHrPADDSSuoDoyT+O/Ze/ftufqVKZ
	G9kAwxMyOlYr4WbHGKY4lw5xEHPdrNiYoA8VUdbhhGILE3j2HM/x6PvuOtUtbuQUbSR4/WWx+hG
	Lmrk2v/Ql7oEdkoqoA0qHGhCxGxc7M4oMuj5+/kjs6deNG1mzxZmtLaSoOnyLpxMp2ZBsCMs6Md
	NGs/iM3UMLxICN4oHJd5img==
X-Received: by 2002:a05:6102:3585:b0:7c3:2f13:d905 with SMTP id ada2fe7eead31-7d4eff7be7dmr1694934137.3.1794429436467;
        Wed, 11 Nov 2026 12:37:16 -0800 (PST)
Received: from fabio-X870-EAGLE-WIFI7.tail2bb604.ts.net ([2804:1b3:a803:1afe:5307:7968:510:1cbd])
        by smtp.gmail.com with ESMTPSA id ada2fe7eead31-7d62241eca6sm1564816137.11.2026.11.11.12.37.13
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 11 Nov 2026 12:37:15 -0800 (PST)
From: Fabio Estevam <festevam@gmail.com>
To: p.zabel@pengutronix.de
Cc: robh@kernel.org,
	krzk+dt@kernel.org,
	conor+dt@kernel.org,
	Frank.Li@nxp.com,
	dri-devel@lists.freedesktop.org,
	devicetree@vger.kernel.org,
	Fabio Estevam <festevam@gmail.com>
Subject: [PATCH v3] dt-bindings: display: imx: Describe legacy display nodes
Date: Wed, 11 Nov 2026 17:36:56 -0300
Message-ID: <20261111203656.725823-1-festevam@gmail.com>
X-Mailer: git-send-email 2.43.0
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

Legacy i.MX LCD display nodes have no schema, leaving their properties
unvalidated and causing dt-core.yaml warnings for fsl,pcr on several
i.MX25 and i.MX27 boards:

  imx27-phytec-phycard-s-rdk.dtb: display: fsl,pcr:
  b'\xf0\xc8\x80\x80' is not of type
  'object', 'integer', 'array', 'boolean', 'null'

Add a display schema selected by the presence of fsl,pcr. Describe the
panel model, framebuffer pixel depth, interface width and LCDC settings,
and reference panel-common.yaml for common panel properties and display
timings. Reject properties not covered by these definitions.

Keep the LCD controller schema limited to controller properties.

Signed-off-by: Fabio Estevam <festevam@gmail.com>
---
Changes since v2:
- Add a separate display-node schema selected by the presence of fsl,pcr. (Rob)
- Describe model, bits-per-pixel, bus-width and fsl,aus-mode, and reference panel-common.yaml.
- Reject unknown display properties with unevaluatedProperties: false.

 .../display/imx/fsl,imx-fb-display.yaml       | 73 +++++++++++++++++++
 1 file changed, 73 insertions(+)
 create mode 100644 Documentation/devicetree/bindings/display/imx/fsl,imx-fb-display.yaml

diff --git a/Documentation/devicetree/bindings/display/imx/fsl,imx-fb-display.yaml b/Documentation/devicetree/bindings/display/imx/fsl,imx-fb-display.yaml
new file mode 100644
index 000000000000..72e567b9ed98
--- /dev/null
+++ b/Documentation/devicetree/bindings/display/imx/fsl,imx-fb-display.yaml
@@ -0,0 +1,73 @@
+# SPDX-License-Identifier: (GPL-2.0-only OR BSD-2-Clause)
+%YAML 1.2
+---
+$id: http://devicetree.org/schemas/display/imx/fsl,imx-fb-display.yaml#
+$schema: http://devicetree.org/meta-schemas/core.yaml#
+
+title: Freescale i.MX framebuffer display
+
+maintainers:
+  - Fabio Estevam <festevam@gmail.com>
+
+description:
+  Legacy display nodes referenced by the display property of the i.MX
+  LCD controller describe the panel and its interface configuration.
+
+select:
+  required:
+    - fsl,pcr
+
+allOf:
+  - $ref: /schemas/display/panel/panel-common.yaml#
+
+properties:
+  model:
+    $ref: /schemas/types.yaml#/definitions/string
+    description: Display panel model name.
+
+  bits-per-pixel:
+    $ref: /schemas/types.yaml#/definitions/uint32
+    description: Number of bits per pixel in the framebuffer.
+
+  bus-width:
+    $ref: /schemas/types.yaml#/definitions/uint32
+    description: Number of data lines connected to the panel.
+
+  fsl,pcr:
+    $ref: /schemas/types.yaml#/definitions/uint32
+    description: LCDC Panel Configuration Register value.
+
+  fsl,aus-mode:
+    type: boolean
+    description: Enable AUS mode on i.MX21 and later LCD controllers.
+
+required:
+  - bits-per-pixel
+  - display-timings
+  - fsl,pcr
+
+unevaluatedProperties: false
+
+examples:
+  - |
+    display {
+        model = "Primeview-PD050VL1";
+        bits-per-pixel = <16>;
+        fsl,pcr = <0xf0c88080>;
+
+        display-timings {
+            native-mode = <&timing0>;
+
+            timing0: timing0 {
+                hactive = <640>;
+                vactive = <480>;
+                hback-porch = <112>;
+                hfront-porch = <36>;
+                hsync-len = <32>;
+                vback-porch = <33>;
+                vfront-porch = <33>;
+                vsync-len = <2>;
+                clock-frequency = <25000000>;
+            };
+        };
+    };
-- 
2.43.0

