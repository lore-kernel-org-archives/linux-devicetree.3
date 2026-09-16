Received: from mail-pj2-f13.google.com (mail-pj2-f13.google.com [74.125.227.141])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id EC6CB36920F
	for <devicetree@vger.kernel.org>; Wed, 16 Sep 2026 18:01:30 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=74.125.227.141
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1789581696; cv=none; b=p5tnx90h9B0re4rsnBmILrRdMrCHwO6DKRr06HtAc729NgPasONu97Rl7a/Hh/H+TBDySz20HuM/muxAXnlfvi4wsg64MzHItHqAF/sUYBVjsw8d7R1lI8ZT3HGB+kxz36w/rXK0a19Tajv358aFX5HRdEY0q8EfUrbPnaeQ1x8=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1789581696; c=relaxed/simple;
	bh=FvXp/TdGwtWrHVCk18WSssgM7XRcJZQ54RrQTn3GOvM=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version; b=IrfVZgqrClTC8gVUvZ0CFm6X4J0Zj/bQ9ESmJi4VjaU3JSeYwhWhQknV7VjGGdtv8lzvrBNZIQ4a4GMuWSDmiBQRXucr58oOCDA6H9qXRo0vLpeZcNpwTzewMqciVTFfppq+iRyh48ER9p8sZJTaTvRZ85bA85+IS3Mm8XJzrZE=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=QlGzSugZ; arc=none smtp.client-ip=74.125.227.141
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="QlGzSugZ"
Received: by mail-pj2-f13.google.com with SMTP id 98e67ed59e1d1-399026951a2so140251a91.2
        for <devicetree@vger.kernel.org>; Wed, 16 Sep 2026 11:01:30 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1789581688; x=1790186488; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=ruVPTz3hTy5PAMDzs0VSzntCrCNW8xKkYo6sPASahL0=;
        b=QlGzSugZtFYgwiwgeVxyTCxXFvrcP70ofdleg0jvaVtMW4EVTXIamGB4ggwQwqy8xA
         MhNh9ig6IBURkNd5Di4HywX06FpAQpdK+waW5zQrVS9fIziRW9cBhQ2fLW/cAcyEaea6
         Dqg3qIxth/uG/Bp79LZyz2uPZoCmQMna7Hef1gL6DpfJwbilFUcAQr3f3WvYNp9dDj8R
         jX+t3QsEu4swNmRXF9ofgxj8rbOh0rzAjLF5+O+0Gyq4HoC6gdAMM1qto6aJTeMc62Ad
         5NFPnLra58ybv4t9kauLstTpY54ZXkZgZw9HU67Nv2oiLAUahuDqt6vnXpqb49NexdHH
         ks6A==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1789581688; x=1790186488;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to:content-type;
        bh=ruVPTz3hTy5PAMDzs0VSzntCrCNW8xKkYo6sPASahL0=;
        b=xFnKG4uitpidgJsbUSyg2xr8aubXexRK/l2Qdm4whya1IyWnFrlA/IFB/MSHDs6Hin
         fopSs1ohgWBGMk14wW2YzwDmbqpIeWW4nDk0hFp6AdVjeJXc0jjtgqPro14C/3RkRahk
         9UwprEqO5gBqpS9mRnv73pBTPj+UQ2UyrJvxnSzYw49Q1xMquk8ZrpbOrEtePtm1utmj
         Yx+fq+BYnMFvKZbYjjyiJDenAwdjAm815RUJPiudy9WK3gO1FAmzEIRr1//ziFJBeAzw
         5c3ah0oVzxWnMX+wWhiGgw30PN5gKe9XAioVaPVqX5+PMi9KBMnxmXkO63WULqTeVkQg
         3Z9g==
X-Forwarded-Encrypted: i=1; AKwUvBwf77Baa778Yq2PLyeM6FJ3zwUrVh+V6Blg0Az0EczwooUO2PCtTa4Dbp1oc3tA0K5Fiq1UqP3EYLKq@vger.kernel.org
X-Gm-Message-State: AFuF++li9HYbka7zhmo6x7EGsGbuHrXVKkzTmW/gYbfj0QfoUQQqmAkW
	JaJihc4Iiojb14lppQoPPtLZJLKgLjnLjxz4jOmbPL7Xdlydps1Bh7Gj
X-Gm-Gg: AYBFou2dG4ZjaqMqjOnEa59hiAwPzE4ZJFMUvRl1uvDSpx5qufSf8O3DcgATkHcyj5O
	KnoMiF/U0I9W0B3sFoDgbzQ8ZkK1YZAhZmeyW2wNpNENJCVA1Uy1c+VSde9j6mMrmygf+JNm02o
	whMQEZJKod650i3kjvPX/zNJXrmJSNlnsuomxe58munqmAZB+ruUEBbl9sRj+TyAlD+BObs0o/9
	ShJ5bKmaLYtaMpGOuTQQxfaJi26qsmmPS0H7YSCemU+7mS3Jj9zFS6e1LS3HCg73ZxOQd+8jDh3
	Kjh14/27XRii2EnSI5LPmHYWd6wTLelTN4yZ1jamKcRtfU+BKLVhhePD72jzRVRlmgDl9RKZrLI
	2ZPQBZ9MupZXDAFfKQ8LqogY1Srm+yNOHHzzGFnOENdwbBfBNLfGgon31xIgIi/o5Y+DfjV6UMS
	ret50cqZZ4mD1Xqu2JJ5nzPhNV2WndGn+kruyGpdZ5adRQKEvHSGpatLvuHlVlZgVRly2QmGuK3
	T3fau1aFA==
X-Received: by 2002:a17:90b:2250:b0:39d:e1f2:3400 with SMTP id 98e67ed59e1d1-39e1e5285d8mr5311132a91.5.1789581687601;
        Wed, 16 Sep 2026 11:01:27 -0700 (PDT)
Received: from marchy ([2402:1980:e96:7839:ee8e:77ff:fed4:d18b])
        by smtp.gmail.com with ESMTPSA id 98e67ed59e1d1-39e35df479fsm569972a91.6.2026.09.16.11.01.25
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 16 Sep 2026 11:01:25 -0700 (PDT)
From: Adam Azuddin <azuddinadam@gmail.com>
To: robh@kernel.org,
	krzk+dt@kernel.org,
	conor+dt@kernel.org,
	neil.armstrong@linaro.org,
	maarten.lankhorst@linux.intel.com,
	mripard@kernel.org,
	tzimmermann@suse.de
Cc: jesszhan0024@gmail.com,
	airlied@gmail.com,
	simona@ffwll.ch,
	andersson@kernel.org,
	dri-devel@lists.freedesktop.org,
	devicetree@vger.kernel.org,
	linux-kernel@vger.kernel.org,
	Adam Azuddin <azuddinadam@gmail.com>
Subject: [PATCH 1/2] dt-bindings: display: panel: Add RAiO RA8875 display controller
Date: Thu, 17 Sep 2026 01:59:41 +0800
Message-ID: <20260916175942.3186804-2-azuddinadam@gmail.com>
X-Mailer: git-send-email 2.55.0
In-Reply-To: <20260916175942.3186804-1-azuddinadam@gmail.com>
References: <20260916175942.3186804-1-azuddinadam@gmail.com>
Precedence: bulk
X-Mailing-List: devicetree@vger.kernel.org
List-Id: <devicetree.vger.kernel.org>
List-Subscribe: <mailto:devicetree+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:devicetree+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

The RA8875 is an SPI-connected TFT display controller by RAiO
Technology Inc. It supports display resolutions of up to 800x480.

Add YAML binding schema for the RA8875 controller, along with
the raio vendor prefix for RAiO Technology Inc.

Assisted-by: LLM
Signed-off-by: Adam Azuddin <azuddinadam@gmail.com>
---
 .../bindings/display/panel/raio,ra8875.yaml   | 66 +++++++++++++++++++
 .../devicetree/bindings/vendor-prefixes.yaml  |  2 +
 2 files changed, 68 insertions(+)
 create mode 100644 Documentation/devicetree/bindings/display/panel/raio,ra8875.yaml

diff --git a/Documentation/devicetree/bindings/display/panel/raio,ra8875.yaml b/Documentation/devicetree/bindings/display/panel/raio,ra8875.yaml
new file mode 100644
index 000000000000..f6f4867495dd
--- /dev/null
+++ b/Documentation/devicetree/bindings/display/panel/raio,ra8875.yaml
@@ -0,0 +1,66 @@
+# SPDX-License-Identifier: (GPL-2.0-only OR BSD-2-Clause)
+%YAML 1.2
+---
+$id: http://devicetree.org/schemas/display/panel/raio,ra8875.yaml#
+$schema: http://devicetree.org/meta-schemas/core.yaml#
+
+title: RAiO RA8875 Display Controller
+
+maintainers:
+  - Adam Azuddin <azuddinadam@gmail.com>
+
+description: |
+  This binding is for display panels using an RAiO RA8875 controller
+  connected via SPI.
+
+allOf:
+  - $ref: panel-common.yaml#
+  - $ref: /schemas/spi/spi-peripheral-props.yaml#
+
+properties:
+  compatible:
+    const: raio,ra8875
+
+  reg:
+    maxItems: 1
+
+  spi-max-frequency:
+    maximum: 25000000
+
+  display-timings:
+    $ref: /schemas/display/panel/display-timings.yaml#
+
+required:
+  - compatible
+  - reg
+  - display-timings
+
+unevaluatedProperties: false
+
+examples:
+  - |
+    spi {
+        #address-cells = <1>;
+        #size-cells = <0>;
+
+        ra8875: ra8875@0 {
+            compatible = "raio,ra8875";
+            reg = <0>;
+            spi-max-frequency = <16000000>;
+
+            display-timings {
+                native-mode = <&timing0>;
+                timing0: timing0 {
+                    clock-frequency = <25000000>;
+                    hactive = <800>;
+                    vactive = <480>;
+                    hfront-porch = <40>;
+                    hsync-len = <40>;
+                    hback-porch = <40>;
+                    vfront-porch = <10>;
+                    vsync-len = <10>;
+                    vback-porch = <20>;
+                };
+            };
+        };
+    };
diff --git a/Documentation/devicetree/bindings/vendor-prefixes.yaml b/Documentation/devicetree/bindings/vendor-prefixes.yaml
index ba2002969373..99d5113fb035 100644
--- a/Documentation/devicetree/bindings/vendor-prefixes.yaml
+++ b/Documentation/devicetree/bindings/vendor-prefixes.yaml
@@ -1395,6 +1395,8 @@ patternProperties:
     description: Radxa
   "^raidsonic,.*":
     description: RaidSonic Technology GmbH
+  "^raio,.*":
+    description: RAiO Technology Inc.
   "^ralink,.*":
     description: Mediatek/Ralink Technology Corp.
   "^ramtron,.*":
-- 
2.55.0

