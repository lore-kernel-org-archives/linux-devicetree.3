Received: from mail-vs2-f12.google.com (mail-vs2-f12.google.com [74.125.227.12])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id AB44959650C
	for <devicetree@vger.kernel.org>; Wed, 23 Sep 2026 22:35:58 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=74.125.227.12
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1790202963; cv=none; b=h1f/EwCHLoKMi12Nanb7Cyu2VPqyZVzIlwT/3qt9eGjz/E563yNF0jW2g71TN9PkrmcX7NypvfVQoqkVH2TB5VY6Bhls2hKnwxDcSsQeYYYcC70Igsft9DwdrbZ+ieVUKBRboIBrPqXNg2KDeq8s4Ff7ovHxdek4bbmeMbOseBY=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1790202963; c=relaxed/simple;
	bh=Ot25WLyqVRhsBXv9+FeXxetochqDJHUpqUPvyel2wpg=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version:Content-Type; b=s2zC7fJbG2PUDxN8imwIoKZnwkpnsd3XpSKiHjZne7hREzNgIT1mNC+4Pu4MwN/t9HSI3/NF+oVrrHUeWog81wHyECD1xSAhjzX4sfiOu/XGq5fhrHrrSf5rSElHTCjehhaFZFY6tWyX8XynVDnOzXwyecutYMK0DvlxasLu6Aw=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=flWNWFgi; arc=none smtp.client-ip=74.125.227.12
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="flWNWFgi"
Received: by mail-vs2-f12.google.com with SMTP id 71dfb90a1353d-5c67e2ff27eso1258870e0c.0
        for <devicetree@vger.kernel.org>; Wed, 23 Sep 2026 15:35:58 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1790202957; x=1790807757; darn=vger.kernel.org;
        h=content-transfer-encoding:content-type:mime-version:references
         :in-reply-to:message-id:date:subject:cc:to:from:from:to:cc:subject
         :date:message-id:reply-to:content-type;
        bh=E15zTz6LSPQ0+KOjqcr732bl7v4sHhRkFWWTNxNbp1E=;
        b=flWNWFgiq2zZuJ8Knco5vhDc1+If3REpIIWfyGyLl6temXFn6r74AWhPEdzRAqkUPW
         sT/p3Vzm9BIArdARoWO4KrqwIYs2fUXug/y4tYEwELhLrlZqdXwg3Teq1XIduKosJlBW
         cxKLEmQifGHEi4H43DbNfEGoDJ891ff9o+DuC0B6rhXxqsUD2+/hvNOnxzrL2uWiDj3P
         aq7lh+upgRqbW1QF2m2YssIUOBfeBlAsWTLowQe3uLIklmm08CzdNngH46fMsrlws/9U
         gjVZt2KX5meOsyRnZ3xn/88wJcyeNHeriMFsfP4Qd74JlmcQOuv/cEybhTytIbvNwAWb
         JbUQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1790202957; x=1790807757;
        h=content-transfer-encoding:content-type:mime-version:references
         :in-reply-to:message-id:date:subject:cc:to:from:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=E15zTz6LSPQ0+KOjqcr732bl7v4sHhRkFWWTNxNbp1E=;
        b=EQm+cU1RuUlriCrMtKp2yGJuN+myI9+vvELjBS1Od8oYm1BtFL5eYK8+sb7hsln3ER
         h63NbDDOmFGsBTth7LpfLs9hOfbMuh4Bf0pgVVNNdWlEcZoI3+YlQ2wkX4ufQAKzQz2g
         GWr/X/u8PxgoJx1m6IjDOmVA8ri/OsaDQ7IrVBbZUnSqtjEfcX908ysGVF9Q3xPwPSh/
         jyped2jHPt0nG4jsNiWsYI6FUmf3yrqAS8vIk6yaPLp+icj2tcW4ZqrP4i4X+L/Mqfxh
         pmxkdU0EqHTW0sUkMpPPo0Ku1UtE5UaCTM1iErlq9m9IPgTgbr1lAXCOJ5s3ZXSewMNQ
         cfbA==
X-Forwarded-Encrypted: i=1; AKwUvBz9hS+H19bePds6ZySxGNgPkFGVZToeLlBKS6ct7amNR1H2it+0NqcSR4rPp2G1MsxZjjjwf58cdX5l@vger.kernel.org
X-Gm-Message-State: AFuF++m4o0E150Tbu4L2w3VbsNg44ZUJsUprbJlVIdP935vAVZGXGb9C
	BjH6gjagV34WzdBGrvsR4r+6dl92tt/wOKZbjoobbmOCMzJ8lQ4f49M2liUnwjo=
X-Gm-Gg: AYBFou3EQcyCkxFWC0o8j6EuVb0dg3AGKmTsDaAG1GIO9rB9c5KyWYBN0jGEHS7HTQE
	RhjD/d9cFVKObRsrhraqsoy4nRD2KxmAtDlHPs4U7BlrGJf4lKLSDJpIaLNby5RABcbfjNIGebe
	7zAOW7CquDrNGcKQMVbR+9eePt15vRVLEvKR9Skx75J28kkNwAKJqGGrf6u5xEx6hwM2YWBuuiX
	MNlxE1KAwfJNaa8yQp7oHckq8y6v8PEC2LvxrJ3Q8Ede8HMCV6a0lwaCVuPWvZGn9OOZydikskG
	/4T2/Qo7Tne2yxlGxyUjC/X82/G9Tdj5W0leWtWt57xPyYIGkuSn/SaR3niC0pKJ5CPuvRBSX+m
	8WC5QiDLokWxCopFxeTU67vcfLhc4b+wuMfUq8nMOeK3RDpX9stqksMYP4s25ejv2Mcy+WVLocK
	lkBFqMPfqVfxnCOHx611H3BpYHgeB0DQiNM6R6Rmn2XQzY/O0m9zEfIQs4nE+533iqs3Wb1fBYp
	sq3z0+6atyKEXxQ1SM3KGvZOQJRguAXt7SW8iaZPwFLh4pDsA==
X-Received: by 2002:a05:6122:198d:b0:5c9:82a1:a6a3 with SMTP id 71dfb90a1353d-5cb08753a03mr590726e0c.6.1790202956828;
        Wed, 23 Sep 2026 15:35:56 -0700 (PDT)
Received: from localhost.localdomain ([186.158.238.108])
        by smtp.gmail.com with ESMTPSA id 71dfb90a1353d-5c9f04fb621sm5162983e0c.9.2026.09.23.15.35.51
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 23 Sep 2026 15:35:55 -0700 (PDT)
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
	Jori Koolstra <jkoolstra@xs4all.nl>,
	Shuah Khan <skhan@linuxfoundation.org>,
	devicetree@vger.kernel.org,
	dri-devel@lists.freedesktop.org,
	linux-kernel@vger.kernel.org,
	linux-kernel-mentees@lists.linux.dev,
	Krzysztof Kozlowski <krzysztof.kozlowski@oss.qualcomm.com>
Subject: [PATCH v5 1/3] dt-bindings: display: add Chipwealth CH1115 OLED Controller
Date: Wed, 23 Sep 2026 19:35:13 -0300
Message-ID: <b961c25f0b67968b6ef891f2dd3527508a374261.1790200427.git.nico.antinori.7@gmail.com>
X-Mailer: git-send-email 2.47.3
In-Reply-To: <cover.1790200427.git.nico.antinori.7@gmail.com>
References: <cover.1790200427.git.nico.antinori.7@gmail.com>
Precedence: bulk
X-Mailing-List: devicetree@vger.kernel.org
List-Id: <devicetree.vger.kernel.org>
List-Subscribe: <mailto:devicetree+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:devicetree+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit

Chipwealth CH1115 is a controller for monochrome dot matrix OLED panels.

Reviewed-by: Krzysztof Kozlowski <krzysztof.kozlowski@oss.qualcomm.com>
Signed-off-by: Nicolás Antinori <nico.antinori.7@gmail.com>
---
Notes:
- Patch series based on 7.3-rc1
- Carried "Reviewed-by: Krzysztof Kozlowski <...>" from v3 since this
  patch did not change.

 .../bindings/display/chipwealth,ch1115.yaml   | 81 +++++++++++++++++++
 .../devicetree/bindings/vendor-prefixes.yaml  |  2 +
 2 files changed, 83 insertions(+)
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
diff --git a/Documentation/devicetree/bindings/vendor-prefixes.yaml b/Documentation/devicetree/bindings/vendor-prefixes.yaml
index 73acf72c01f6..16a4a7a158ab 100644
--- a/Documentation/devicetree/bindings/vendor-prefixes.yaml
+++ b/Documentation/devicetree/bindings/vendor-prefixes.yaml
@@ -331,6 +331,8 @@ patternProperties:
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

