Received: from mail-pl1-f180.google.com (mail-pl1-f180.google.com [209.85.214.180])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id B1B65426EC5
	for <devicetree@vger.kernel.org>; Tue,  5 May 2026 12:27:53 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.214.180
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1777984074; cv=none; b=U3+LAN5mFn5DKKgl55Yvu7saUL+XTsB0fX2/0Ds8Aa2+lgcz2MpUNUQHUuOwaH1AehS6oNForF5SlaqE9ssnVJZ3ScDZWGs5rC/O0/0QXUOIedJRe7GvMQ/QLH/oOSTFbrgGc0qFDD6HFbMtKMS0wNQwTaC05n3qZlXDeV0Tz7o=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1777984074; c=relaxed/simple;
	bh=VgtPkc8lnuSreun9H6skI/hel9tJz/sGg7mtz5FLFVw=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version; b=ZHnkXVlzG3NioGkMVucC/+5aqUe6tZvKqhDd98bAmhkwEGxC3Nyee5NbI6emtf+wwVFvOjwLvdeTGokQR20WKUV0G0IeNb1RSq6jFvWv5epLP5w4BwiFJr2ldzZnawwm3Gb+e2tBouxP+buF+qn8OriQy1h8bYAJeHqtqxNknKs=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=PKbVKHRz; arc=none smtp.client-ip=209.85.214.180
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="PKbVKHRz"
Received: by mail-pl1-f180.google.com with SMTP id d9443c01a7336-2ba5c126afaso245535ad.3
        for <devicetree@vger.kernel.org>; Tue, 05 May 2026 05:27:53 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1777984073; x=1778588873; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=2f9qY6qIojyC+n3cwV4DcJgl1Mh7dbRflEA4i8ZvFGU=;
        b=PKbVKHRzM8Y+tzTz8LsftB62eGJEBzyA1nBCYF8k04BlNVQ7nTgZsL5C58sHAUJ4Lj
         PjONTD+ZDnCk7UZjL5Z/OEv/VpEbsBXQvfTjSBmqxVWdaXdZ/IF9IL4A9BbfDl+wRIdO
         TtihKHjcS4HJBB23YBJAbgPz9/9VnO/i/iWuWoTq0JI1OXi3LqOwKIWhNuW5/b9KNzKZ
         4X6HPQnXW9kYr9xzs4e3YSk3lMEYXZKZKuDHZkdkK2VQeTOrWPwNzfvwwIHMG6LhMPvF
         mhUKDZQutn0r9SIwTOWRuwQMn7+ALgAaM4koo+qZMCsYpQSWpiH324v+4umnmasRS5zR
         LrPA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1777984073; x=1778588873;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to;
        bh=2f9qY6qIojyC+n3cwV4DcJgl1Mh7dbRflEA4i8ZvFGU=;
        b=HQHL/4ii0kac2D7qpA3AY4aHXjy3ajR6giFeX6xknvWZMWeGxtVyfMVz0jHSQViKbu
         duIoyvMosUbH+uTG+NnQtX7yiqhJXYvlaBRPkgcDk9ORv8iTTuAGVUjD/AWJPLwB0YDJ
         uP0WYjMerDrEgbs27hu/Ok4GuhdZHXdNntJfYJkfEeKGpRhFWB8efFhro1iwx5PxaMLg
         VTJBj6oSaJQnX20LvGahYsMTiMksEMeUhfkEVPobc/W4yZB8wZvRStctkhIt9UcpRZtT
         IDWvOwL4cUgmfQttcdLnmmI0s+npKLy/b3jWkWxMTblxrj9fK1D+D9+Os1pOpzMzgZwb
         9kiQ==
X-Gm-Message-State: AOJu0Yxmw/mUS+ApRoe9TIBMGVLFxXTEv227lUPWGh2IiphwdzPh2pQH
	78t3Gatkil/W6hNp4Vwi2FezNw/7hUaw8xRdL71H+XhgyB7rsTzbtFkI
X-Gm-Gg: AeBDiesreJkw+xOP46QhTil2dFqwbbxcjuv8VGUEhYJn70ZZSleIqeP1vKuoDCxWOhh
	Bc2JgJQqZAY1eYeOaifISZr0y/CgtAbFVXMv7YNdZr9w0TGgxQCo5E+hQv2ME3hKslFJsxqYFga
	uJp3egwgQ7peY8vrgYjpYuL7JVJ60AKU9FRJonOLpEyIioCq3bOXTCYXc5uMj/8IcG2MBfl0+NK
	nwZEKMEwedutQG5y41+vDPQL/cFGhx8EVBs7dl9tzKKfR6u7VdUNR4vjs4lVH4wpcfxt0aWIsFs
	ijJhnXTfUxalH6kMcyCWunyYsSSrlfhYCaCBK5NZ2zFiuEMc52EUXLBH4sKPNw3OqeuPOIqvK4o
	DSBr9SoZzOKgapU0ulpj56Qfz6O5aLD2JGVr8MOCtnLsu1Q+yD1cbDsEVVFCNnI1Gfe7WY7WvG1
	pq8mniMw1cs+p3xnGotaGlnW8DABBeSaxh
X-Received: by 2002:a17:903:380b:b0:2b2:5857:5847 with SMTP id d9443c01a7336-2b9f2600a87mr72494105ad.5.1777984072821;
        Tue, 05 May 2026 05:27:52 -0700 (PDT)
Received: from marchy ([2405:3800:88c:d085:ee8e:77ff:fed4:d18b])
        by smtp.gmail.com with ESMTPSA id d9443c01a7336-2b9cae0e5fasm134390295ad.54.2026.05.05.05.27.51
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 05 May 2026 05:27:52 -0700 (PDT)
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
	"Kael D'Alcamo" <dev@kael-k.io>,
	Lad Prabhakar <prabhakar.mahadev-lad.rj@bp.renesas.com>,
	linux-kernel@vger.kernel.org
Subject: [RFC PATCH v1 1/2] dt-bindings: display: panel: Add RAiO RA8875 display controller
Date: Tue,  5 May 2026 20:26:29 +0800
Message-ID: <20260505122636.11859-2-azuddinadam@gmail.com>
X-Mailer: git-send-email 2.54.0
In-Reply-To: <20260505122636.11859-1-azuddinadam@gmail.com>
References: <20260505122636.11859-1-azuddinadam@gmail.com>
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

