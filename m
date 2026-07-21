Received: from mail-wr1-f42.google.com (mail-wr1-f42.google.com [209.85.221.42])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id BF8EB46D081
	for <devicetree@vger.kernel.org>; Tue, 21 Jul 2026 18:24:43 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.221.42
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1784658285; cv=none; b=BAPKnLBVBjhKCKERxc969DKBfzKzlaYqxNZ+Z99VKUbxOgcGyuqJ5aK4juMO2TYLBcXv5CIYHN8Xj69Yiw3tZEUCeEleX+AccRGwhSStJ+MtREkYxx7kTgSOk/ibSpL9oM9kIKTYTSwkDnLG/A6xKDLwNbPv+XGrdzEv/w3f/GE=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1784658285; c=relaxed/simple;
	bh=PZeTCn4vfiOzIxtzUP6Cg4NPmVD+ay72/JvaXAZ39eY=;
	h=From:Date:Subject:MIME-Version:Content-Type:Message-Id:References:
	 In-Reply-To:To:Cc; b=rtDc+u/gqtsEqIU0/2c7sEGn+bVS9UxnAAjHYjdc3QmUMiNeIGqja2I7Ssptvy0h0X+8myHGx9deVlLcGLLOY6Cb4+FiisSZTmkdUbWx/rj5CbU418ozP5uOcWt5TDQbws/XBxsiSpWqDL4qtDevHs2WXccj6WWzrSeMqCTI9uk=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=cypSOEBn; arc=none smtp.client-ip=209.85.221.42
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="cypSOEBn"
Received: by mail-wr1-f42.google.com with SMTP id ffacd0b85a97d-47f703a9d05so1889489f8f.0
        for <devicetree@vger.kernel.org>; Tue, 21 Jul 2026 11:24:43 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1784658282; x=1785263082; darn=vger.kernel.org;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :content-type:mime-version:subject:date:from:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=ohyabsYXUEeH9CZfps7B4outocJBDW/m1cd73oaWqh0=;
        b=cypSOEBnqyUusLKG8Cu+jJsX6jfpCnEI/MSsrG5PNqJUvrAQH6r467FS34jZ71sZ7W
         p0hoV+fYwYkGcTPe/svbcBVU9pmCXBHS3MmQ7GFCp83E/eo7QWwWwt0sCdmTU5WUcp7p
         KMLjwDVY/j5sgCuxL2EFVXw0rgbjqEVqAEPPiSfTOU/k0p6n3lheo58kh4iAtTg4kF9h
         JHyToCmlFUInA80kLqsWKOhj4QPEvYd88ZC0Tyh3LTBHJw0CwWpW3/9qKo5em/kEVe5t
         1tPJTfvELrfsPvGIyZYBT2RQ2gGEJhimaOBZo+wJFoz8GoZj6jN5nf2Olas9gNNyo/rH
         jIig==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1784658282; x=1785263082;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :content-type:mime-version:subject:date:from:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=ohyabsYXUEeH9CZfps7B4outocJBDW/m1cd73oaWqh0=;
        b=jy4J2iVbMg1PAjCVKIi+n4RgxhHCtPyQM9NPW6ebPtE+Kl4dGXEHL0rXFQ0VBWGTg8
         4pbX2G5UBOz9lDNEgyyt6An7afsIJnwtpxtUybXc6A25smLEzBYJV/ShnGbqxrici5pF
         whddXnKDSUsmHMA6aKfMVKPqsYfkwjUF4NvDQ5nSBGbm8Dq+/U7J+FyeooHlUNhetSfx
         qcIIN3D+qRsQpiEfIBi3y0h1+4POn0AphZ2QcKMtoOgIXMMuZb4jCYvs2ViK4fakzLEJ
         riW2PAnKaRUaYPZx+kBgY8GTT4rJNrJuxPssd2Nj8EsZQCbeqRUSm/M06bzXDGBFum1N
         GwEw==
X-Forwarded-Encrypted: i=1; AHgh+Row/zqbrkI6jA6J0fTQQz8h8N2qJoOQhKsc4Ig7XB6nL7ZyMXDX5y4bb+6bk5g9EM0QFcSzNmu5w5xb@vger.kernel.org
X-Gm-Message-State: AOJu0YzlX00MBt/eHoP5aoU8erBKnTDK2l4b9VUthto8L2GsUWFkB7+D
	6NwvHz0/pqNZiZyOkrYOUbIBGkrWy2R6GycA5irttq3Eq9Uyr0kNxSzO
X-Gm-Gg: AR+sD134M3NbfG8X7SWXn603qUQrhzgKBehrs6Y9u7rkwe0VLMQ6fLt1kskXgK4Z1xZ
	31E3kaigeG2Jw1wiC4Xl8vM+QpHDCm3dGlbATpX8tGz+HtrOxJ0EJFL9g+52Ziv3f6t2iUJVE/o
	p1E5gyzQ27dtugvyNyNRo0K4rA7cYlp2LX3X2EZMd5mWNqhyIToiCyX5NEDIO2ry6oqquKiXunP
	F9hE4BBM57J0J8ZDcDpddilxKFzXPyx3nZjY6pajpXz3akJHbxbHZ3MhT1JF99Ke/DfDgPOKw9e
	ecQ2nz49jzYe5IZyZpIJB05E9ZW5FfeETrVKKKPXocAjt/VkMvNsgvLAFGVUawzfWt+/gY+X0zP
	dfELScSExO0t39dKmXo0bI9Y0eBcRHL4TsUQUpvXhUm6rFRQERdO9zNP2KNd3cFIu2J5+PqhEVx
	zNlNdecreMIcY0hq2RFBERTwTQ/qktoaTEgSP0jmnmbYAowqwC56EkL7LMyL3aG7N2ML91W10Pm
	n8m21bcKGXXojMWivu5JL29XShrbxzSCiXDOTxdO2Ot5TUIiA9SaS8zKxpXtAJGQC8K9XPziFMG
	aPzYsfkm+u/RAphnhP3MRWe4ysYeVoNVLNtw1lNFnDPpVsgoXhtxARwEo6Xc8F8aAIjblDZMIiu
	QanPWQieU9alcD84=
X-Received: by 2002:a05:6000:400f:b0:47f:8152:e568 with SMTP id ffacd0b85a97d-47f8152e595mr4627922f8f.60.1784658281871;
        Tue, 21 Jul 2026 11:24:41 -0700 (PDT)
Received: from [192.168.1.187] (ip-86-49-244-181.bb.vodafone.cz. [86.49.244.181])
        by smtp.gmail.com with ESMTPSA id ffacd0b85a97d-47f63eddd1csm40835081f8f.29.2026.07.21.11.24.41
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 21 Jul 2026 11:24:41 -0700 (PDT)
From: Joshua Crofts <joshua.crofts1@gmail.com>
Date: Tue, 21 Jul 2026 20:24:38 +0200
Subject: [PATCH 1/2] dt-bindings: iio: dac: add support for mcp47a1
Precedence: bulk
X-Mailing-List: devicetree@vger.kernel.org
List-Id: <devicetree.vger.kernel.org>
List-Subscribe: <mailto:devicetree+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:devicetree+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20260721-mcp47a1-add-support-v1-1-da045a2567e3@gmail.com>
References: <20260721-mcp47a1-add-support-v1-0-da045a2567e3@gmail.com>
In-Reply-To: <20260721-mcp47a1-add-support-v1-0-da045a2567e3@gmail.com>
To: Jonathan Cameron <jic23@kernel.org>, 
 David Lechner <dlechner@baylibre.com>, 
 =?utf-8?q?Nuno_S=C3=A1?= <nuno.sa@analog.com>, 
 Andy Shevchenko <andy@kernel.org>, Rob Herring <robh@kernel.org>, 
 Krzysztof Kozlowski <krzk+dt@kernel.org>, 
 Conor Dooley <conor+dt@kernel.org>
Cc: linux-iio@vger.kernel.org, devicetree@vger.kernel.org, 
 linux-kernel@vger.kernel.org, Joshua Crofts <joshua.crofts1@gmail.com>
X-Mailer: b4 0.14.3
X-Developer-Signature: v=1; a=ed25519-sha256; t=1784658280; l=2591;
 i=joshua.crofts1@gmail.com; s=20260530; h=from:subject:message-id;
 bh=PZeTCn4vfiOzIxtzUP6Cg4NPmVD+ay72/JvaXAZ39eY=;
 b=GoXVBBA3rVZtCkVT6C+MiAV66zcR6c4ebeSsV4XVESuW14/ifqraymiESHNCA5hYmoaVvmSFG
 PQSowwYCwf7DG1J/qFpP0e+ZhEJNsqMSahq7Q9WzRzvIbxbG8KhEuKC
X-Developer-Key: i=joshua.crofts1@gmail.com; a=ed25519;
 pk=RTDOoVwgeL4oFdASj9U+cxJuIjXuXk73zkjnGOJKbEo=

The Microchip MCP47A1 is a 6-bit volatile Digital-to-Analog converted
which communicates via I2C.

Signed-off-by: Joshua Crofts <joshua.crofts1@gmail.com>
---
 .../bindings/iio/dac/microchip,mcp47a1.yaml        | 56 ++++++++++++++++++++++
 MAINTAINERS                                        |  6 +++
 2 files changed, 62 insertions(+)

diff --git a/Documentation/devicetree/bindings/iio/dac/microchip,mcp47a1.yaml b/Documentation/devicetree/bindings/iio/dac/microchip,mcp47a1.yaml
new file mode 100644
index 000000000000..3322fca03b3a
--- /dev/null
+++ b/Documentation/devicetree/bindings/iio/dac/microchip,mcp47a1.yaml
@@ -0,0 +1,56 @@
+# SPDX-License-Identifier: (GPL-2.0-only OR BSD-2-Clause)
+%YAML 1.2
+---
+
+$id: http://devicetree.org/schemas/iio/dac/microchip,mcp47a1.yaml#
+$schema: http://devicetree.org/meta-schemas/core.yaml#
+
+title: Microchip MCP47A1 DAC
+
+maintainers:
+  - Joshua Crofts <joshua.crofts1@gmail.com>
+
+description: |
+  The Microchip MCP47A1 is a 6-bit single output volatile DAC.
+  This device can have different IDs (0x2e and 0x3e).
+  https://ww1.microchip.com/downloads/aemDocuments/documents/OTH/ProductDocuments/DataSheets/25154A.pdf
+
+properties:
+  compatible:
+    const: microchip,mcp47a1
+
+  reg:
+    maxItems: 1
+
+  vref-supply: true
+
+  vdd-supply: true
+
+required:
+  - compatible
+  - reg
+  - vref-supply
+  - vdd-supply
+
+additionalProperties: false
+
+examples:
+  - |
+    i2c {
+          #address-cells = <1>;
+          #size-cells = <0>;
+
+          dac@2e {
+              compatible = "microchip,mcp47a1";
+              reg = <0x2e>;
+              vref-supply = <&vref_regulator>;
+              vdd-supply = <&vdd_regulator>;
+          };
+
+          dac@3e {
+              compatible = "microchip,mcp47a1";
+              reg = <0x3e>;
+              vref-supply = <&vref_regulator>;
+              vdd-supply = <&vdd_regulator>;
+          };
+    };
diff --git a/MAINTAINERS b/MAINTAINERS
index 2b1ec46c5919..b44693593b94 100644
--- a/MAINTAINERS
+++ b/MAINTAINERS
@@ -17699,6 +17699,12 @@ S:	Maintained
 F:	Documentation/devicetree/bindings/iio/adc/microchip,mcp3911.yaml
 F:	drivers/iio/adc/mcp3911.c
 
+MICROCHIP MCP47A1 DAC DRIVER
+M:	Joshua Crofts <joshua.crofts1@gmail.com>
+L:	linux-iio@vger.kernel.org
+S:	Maintained
+F:	Documentation/devicetree/bindings/iio/dac/microchip,mcp47a1.yaml
+
 MICROCHIP MCP9982 TEMPERATURE DRIVER
 M:	Victor Duicu <victor.duicu@microchip.com>
 L:	linux-hwmon@vger.kernel.org

-- 
2.55.0

