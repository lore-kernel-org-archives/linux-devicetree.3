Received: from mail-pf1-f171.google.com (mail-pf1-f171.google.com [209.85.210.171])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id BD22F179A3
	for <devicetree@vger.kernel.org>; Mon,  4 May 2026 02:14:17 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.210.171
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1777860858; cv=none; b=mIX5D7lA1dd+NybCDraXHn/8tvLDoPR+ZG4ZN5gX8llsMeHaL8quw6AJE7b+MPE8igJh1R8wwCevfvCkDxFSoKIa8b31ExxkyaJG3+OverEUu3NuGSpd8RAN0ln9gWYSdHXVAk1u3RVGcsr0QvscEZTiXsY/20QNqUfpl8IMyGQ=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1777860858; c=relaxed/simple;
	bh=VgtPkc8lnuSreun9H6skI/hel9tJz/sGg7mtz5FLFVw=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version; b=fNJXbG6GzpUUFMIxcUnO4Znc5mQ7XDtsmZQQp4Kes7iZgWETKkfW3DLL/dS9EhrOSbRn7BHIg1V32R+5MvfcQu/G7vOTCWGZu289XRQPe1HHRv4nkoRchL5m6ADbBhEt3MTGi8OjBD5/8EmRYZ2TnW3uCL3j+qxVLK/cgnfz/kM=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=hYp4FTDw; arc=none smtp.client-ip=209.85.210.171
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="hYp4FTDw"
Received: by mail-pf1-f171.google.com with SMTP id d2e1a72fcca58-837b704783bso24296b3a.0
        for <devicetree@vger.kernel.org>; Sun, 03 May 2026 19:14:17 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1777860857; x=1778465657; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=2f9qY6qIojyC+n3cwV4DcJgl1Mh7dbRflEA4i8ZvFGU=;
        b=hYp4FTDwOBl7AzW4QLK2oHlQhBEn3at1ViuFdoyZfhfswa1lbyKCM1knEEsznggr5G
         RxFqNTXvzivdeooxh95dKSrqi6nfOWDHjK5r+bqb+J1+pNwWEmcu9x51SH4xUlxm7FZm
         JRQyy69WMYyyRN+RCgzznl4pi71b27czsVIkdw+yXdl8/oz5K62uwzD+5ixkM/DoPDPw
         wQi5t1mnzcyg61u0PhuTPjTyEGCbBQ4ryCGY37bBH7VeRm1lrF5JG4R09EiacJspG+4r
         DWcSGdH4UvpZQ8d+cbWogdE98Cy87LJTGm4rZsZLLqUp4b6QhvOZwEscNiO9XhN00by6
         f3jQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1777860857; x=1778465657;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to;
        bh=2f9qY6qIojyC+n3cwV4DcJgl1Mh7dbRflEA4i8ZvFGU=;
        b=R84jPY7uWs89MOFPkJFTCVNCiu4B211GvjLAMOszlyprrHzKplLEd29UrjkJAAw62w
         2lvZRChz0Sg2eKmvaWFh6qNHZRAc3LBAIecU4mu8el1PyGbuJT9RhgkQcrrhJW2sRV46
         g3UYw2U6zlq/sSXuh4yRVN9vruOFjYk8YZrPu4VYfZokRAwljeUcvIaAJUB/R52hymZr
         OCFLVKUtN/TL/aEQ8ihM3+xfgBE62YYtcMZmiCM/Ufsp3Abnsa1TR1joYvpkEiq8yZUn
         pGUVGxjHU/Byss5f2e+WBrkE0RDJXDsef8w7q3qJE0lVqsN+l8NIM5KnOmaP+Ty38npU
         BTvA==
X-Gm-Message-State: AOJu0YzRn0qAtDOvTUBod197BKEs1+s/vZhPHAHNsWFIOe3nXXd6KpL5
	OqP5cn+7dX7KWQd8c2VqVgk1SgITy0VUmIMuGcFE1alKB8fQ9geZc5o9
X-Gm-Gg: AeBDiesgSkaEiiTOupmA162i0dITLrm6KYOSu3oqCFG7H9uSgyITuAjN0WcozwJ/uNS
	557aw6nB9pdngeFTHYffb+5jKk+vmPHGPUiqQJX2ur/reHtCl6a8gUlq4/UI2JoitJHO2LkK1+O
	0a1bqaoYZ/zDtvD0cXgvjKZNxMQjNG7Ug9MVbZLKZkAkHPK+681mTaoq6oytnpgP+t6VJd/VimG
	6TPtRHiXhYk2QF/3FDaTCyWXv+CO5E7kEIlb/UW1MtX9RWoy2DoBplX00mSDMHTEDl95LeTPn/a
	d9OhteZxKXujeUZuxpL1HrLCe6HMdR4F8jQz3fdE9IVh7Q03bwD7GjgHTPeBO7FmSLwsPe+gpO7
	669OAsEuldiANtvZ5yFLo5tU+ipHrbd6s9RPTb22p5jX8uiFM+dfAzwnPy4qJyoIpltdIQ+mPep
	/w9jPi6Y/nUoIPHD3RkkXDYogdA0Met13p
X-Received: by 2002:aa7:88c8:0:b0:837:42a6:58a8 with SMTP id d2e1a72fcca58-83742b5accdmr1150467b3a.2.1777860857024;
        Sun, 03 May 2026 19:14:17 -0700 (PDT)
Received: from marchy ([2405:3800:95f:677d:ee8e:77ff:fed4:d18b])
        by smtp.gmail.com with ESMTPSA id d2e1a72fcca58-83515b485eesm9072385b3a.48.2026.05.03.19.14.16
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Sun, 03 May 2026 19:14:16 -0700 (PDT)
From: Adam Azuddin <azuddinadam@gmail.com>
To: dri-devel@lists.freedesktop.org
Cc: devicetree@vger.kernel.org,
	Adam Azuddin <azuddinadam@gmail.com>,
	Neil Armstrong <neil.armstrong@linaro.org>,
	Jessica Zhang <jesszhan0024@gmail.com>,
	Maarten Lankhorst <maarten.lankhorst@linux.intel.com>,
	Maxime Ripard <mripard@kernel.org>,
	Thomas Zimmermann <tzimmermann@suse.de>,
	David Airlie <airlied@gmail.com>,
	Simona Vetter <simona@ffwll.ch>,
	Rob Herring <robh@kernel.org>,
	Krzysztof Kozlowski <krzk+dt@kernel.org>,
	Conor Dooley <conor+dt@kernel.org>,
	Bjorn Andersson <bjorn.andersson@oss.qualcomm.com>,
	Lad Prabhakar <prabhakar.mahadev-lad.rj@bp.renesas.com>,
	"Kael D'Alcamo" <dev@kael-k.io>,
	linux-kernel@vger.kernel.org
Subject: [RFC PATCH v1 1/2] dt-bindings: display: panel: Add RAiO RA8875 display controller
Date: Mon,  4 May 2026 10:13:50 +0800
Message-ID: <20260504021355.72128-2-azuddinadam@gmail.com>
X-Mailer: git-send-email 2.54.0
In-Reply-To: <20260504021355.72128-1-azuddinadam@gmail.com>
References: <20260504021355.72128-1-azuddinadam@gmail.com>
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

Signed-off-by: Adam Azuddin <azuddinadam@gmail.com>
---
 .../bindings/display/panel/raio,ra8875.yaml   | 76 +++++++++++++++++++
 .../devicetree/bindings/vendor-prefixes.yaml  |  2 +
 2 files changed, 78 insertions(+)
 create mode 100644 Documentation/devicetree/bindings/display/panel/raio,ra8875.yaml

diff --git a/Documentation/devicetree/bindings/display/panel/raio,ra8875.yaml b/Documentation/devicetree/bindings/display/panel/raio,ra8875.yaml
new file mode 100644
index 000000000000..a49521242763
--- /dev/null
+++ b/Documentation/devicetree/bindings/display/panel/raio,ra8875.yaml
@@ -0,0 +1,76 @@
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
+  reset-gpios:
+    maxItems: 1
+    description: GPIO used to reset the controller, optional
+
+  vcc-supply:
+    description: Regulator that provides the VCC voltage, optional
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
+    #include <dt-bindings/gpio/gpio.h>
+
+    spi {
+        #address-cells = <1>;
+        #size-cells = <0>;
+
+        ra8875: ra8875@0 {
+            compatible = "raio,ra8875";
+            reg = <0>;
+            spi-max-frequency = <16000000>;
+            reset-gpios = <&gpio 25 GPIO_ACTIVE_LOW>;
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
index 28784d66ae7b..ca453042f6a2 100644
--- a/Documentation/devicetree/bindings/vendor-prefixes.yaml
+++ b/Documentation/devicetree/bindings/vendor-prefixes.yaml
@@ -1361,6 +1361,8 @@ patternProperties:
     description: Radxa
   "^raidsonic,.*":
     description: RaidSonic Technology GmbH
+  "^raio,.*":
+    description: RAiO Technology Inc.
   "^ralink,.*":
     description: Mediatek/Ralink Technology Corp.
   "^ramtron,.*":
-- 
2.54.0

