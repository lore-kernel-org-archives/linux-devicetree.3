Received: from mail-wr1-f43.google.com (mail-wr1-f43.google.com [209.85.221.43])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 9E1973BB674
	for <devicetree@vger.kernel.org>; Thu, 10 Sep 2026 07:07:46 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.221.43
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1789024070; cv=none; b=UjjzFYcSlWXHJuKb9N7fryOtOyt6p3NE+baXVNA2Rida/vNwXiC3lbQy+QV5jMPlktSytryqRfl0rXmtn8dto+v/vOl21MIToX+DbPZI1nmH7of8M+oVDwkohwkbbeTUJP8fLONLCuzZtXq2DoDRZQBhY1jw9cwznCaO1rvgUjg=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1789024070; c=relaxed/simple;
	bh=P2OqeAVCWHFS1/46fjXp/GqTmb5OLthjWFq4IcxNSrc=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version; b=KqKCsExXclW3d9leksRPr0Xab1Gn3eeQQoaoSN+YF8rkWfd4hSt2piMij4hLr2XOAKDHSeCPN61PRLFKQTx3x0Vl1uypneaQKWL6oYxBWbAp439AH3XDLS+njUjrizVD7m+IbSk8RJ6IhxQkkeXdgKbxAbVbReG8KJUcJhnBbgw=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=O28Mq88m; arc=none smtp.client-ip=209.85.221.43
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="O28Mq88m"
Received: by mail-wr1-f43.google.com with SMTP id ffacd0b85a97d-484392e3d33so4793143f8f.2
        for <devicetree@vger.kernel.org>; Thu, 10 Sep 2026 00:07:46 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1789024064; x=1789628864; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=6N41mPYMtwHJxcU+b3y0AU5P4+rfzOFqefvh/tO1NTI=;
        b=O28Mq88mXSz6XKCUzS9M/KBDQXXgZURxNuPPzcjkA7ep1BYoB8jn6395/uA9wyUm81
         PzfM6rSpniSRzSLbNKxRWuGScTYsGJRnCcGx3U9DuJX/ZjBr2cSlOj5YBU/LqwB/waex
         1gP6XtZpdb6sWSOmTBcEoz8dSIVt7Cc9FAv0ta8ICEApMq2cDji08BiC4DMW7tzGYJVO
         +H6TpqIVfpztHFkhOHE0gPNJ9cfwN7IssO67B+m9YFaeTVHXHP0HJtKvqN5r0tBJL95b
         7Cji+9o4CYFKmioJSZsu3SdmmxmRN/5MV4xfKuQlmkOv7zDPWiGqvNj+kTwQ00x80St+
         KaaA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1789024064; x=1789628864;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to:content-type;
        bh=6N41mPYMtwHJxcU+b3y0AU5P4+rfzOFqefvh/tO1NTI=;
        b=hSQ3aPPmQ/cMDFr5UW3YJl790MioyKqCpNcs3dKzRWgvrVgA5M6tows5CQvVkqteVp
         IkIeLolaGP+q8W+d9GVE569r2MDsAVEvXZ+rYm7FqohoW2E9O70xFSYAuYp/wp5lLGvz
         M3/N0+sqji00Xok86sD+NCI8ZVxz1lK8zWIb/ctaSHGKywOKdztbDbNJirpu0dVkMy15
         a4aPi+MWgg8gm99zvnUehowcIVqPUZBczvY2C8gYd6vk8I1GG1thikwYq7EJdg6JLEiK
         zar2+P+kXSsX8kwmE5yMJSVXNZf7GpM//pLVDYECs3uGlbgxZ3aDAptmfMl+NgiwMiUj
         RQ6w==
X-Forwarded-Encrypted: i=1; AKwUvBxdCvqGaNA5HVSHikJTcs0MdS5+jRBTooGslQdy1jMIcHLZluzYromRvj7n+z0E/NkE38WlEK3XExM4@vger.kernel.org
X-Gm-Message-State: AFuF++lW42njzCOnT/d3wCyg1IVcbnUuVXlq/8MbaXCakvrl+ur06Kka
	GJGs1riEyZbFuSS2oT+wuA7q0Hn/nfVDJSlegABvWPSZfnSdOFD6qbo/
X-Gm-Gg: AYBFou2WTRToPn3kx0xJrrTKdkxFSKGRTY+7L71M5VOxsPHVDPndcjrH5LjR3MckPmW
	Wa/jUpW+JV5lA9lbBghLJ7WBMrlkoBtmxsWm7URYzxmNruwlbOpZGAP5zACyYSHiJtcx7LrR63J
	5QyZFavCATT+oXvNcWTImYCc1ITi7H9PsqVB8YXkU4R8vjr2UD4YmGsSfG3nbtH70p64xZUMczP
	jU9AktkuBVj9rIWwiY9DdxaU+AictHZAvv/6B46Q0nbaRCV8OIg8TIAAVlhAJT9mb3xo33QU/Z7
	vunYl78OO3/K5/aUtQ2kNbrnMoh9eKj/bjAbVPM5x7rNJ8g/bnlKXdN1PINVKInDkq0OGUY9gg0
	OLfpGv7JLW0K3sJYf+uwSy+NM9WbyEvxEbsMWTMEidddIXFp4c+Vm4jd6ybuOrA+TQvpnf7XhCk
	sEsk+y3wq5dlX+HP93vtTc547AZ7nviiPEVs1ypfKzOM1IPdu3IxPjVj7yo8/L8UdfNi9CU3C1P
	fQ=
X-Received: by 2002:a05:6000:38e:b0:485:ea30:1f72 with SMTP id ffacd0b85a97d-485ea301fb5mr5498696f8f.27.1789024064007;
        Thu, 10 Sep 2026 00:07:44 -0700 (PDT)
Received: from Empers0n ([193.23.219.104])
        by smtp.gmail.com with ESMTPSA id ffacd0b85a97d-485883959f0sm52244311f8f.10.2026.09.10.00.07.41
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 10 Sep 2026 00:07:43 -0700 (PDT)
From: Vsevolod Nevorotov <sevanevorotov29@gmail.com>
To: Dmitry Torokhov <dmitry.torokhov@gmail.com>,
	Rob Herring <robh@kernel.org>,
	Krzysztof Kozlowski <krzk+dt@kernel.org>,
	Conor Dooley <conor+dt@kernel.org>
Cc: Henrik Rydberg <rydberg@bitmath.org>,
	linux-input@vger.kernel.org,
	devicetree@vger.kernel.org,
	linux-kernel@vger.kernel.org,
	Vsevolod Nevorotov <sevanevorotov29@gmail.com>
Subject: [PATCH 1/2] dt-bindings: input: touchscreen: add Synaptics S3908 controller
Date: Thu, 10 Sep 2026 14:07:22 +0700
Message-ID: <20260910070723.347768-2-sevanevorotov29@gmail.com>
X-Mailer: git-send-email 2.55.0
In-Reply-To: <20260910070723.347768-1-sevanevorotov29@gmail.com>
References: <20260910070723.347768-1-sevanevorotov29@gmail.com>
Precedence: bulk
X-Mailing-List: devicetree@vger.kernel.org
List-Id: <devicetree.vger.kernel.org>
List-Subscribe: <mailto:devicetree+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:devicetree+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

Add devicetree schema binding for the Synaptics S3908 TouchComm
generation-1 I2C touchscreen controller, found in devices such as
the OnePlus 9RT.

Signed-off-by: Vsevolod Nevorotov <sevanevorotov29@gmail.com>
---
 .../input/touchscreen/syna,s3908.yaml         | 69 +++++++++++++++++++
 1 file changed, 69 insertions(+)
 create mode 100644 Documentation/devicetree/bindings/input/touchscreen/syna,s3908.yaml

diff --git a/Documentation/devicetree/bindings/input/touchscreen/syna,s3908.yaml b/Documentation/devicetree/bindings/input/touchscreen/syna,s3908.yaml
new file mode 100644
index 00000000000..68479b0b7d7
--- /dev/null
+++ b/Documentation/devicetree/bindings/input/touchscreen/syna,s3908.yaml
@@ -0,0 +1,69 @@
+# SPDX-License-Identifier: (GPL-2.0-only OR BSD-2-Clause)
+%YAML 1.2
+---
+$id: http://devicetree.org/schemas/input/touchscreen/syna,s3908.yaml#
+$schema: http://devicetree.org/meta-schemas/core.yaml#
+
+title: Synaptics S3908 TouchComm I2C Touchscreen
+
+maintainers:
+  - Vsevolod Nevorotov <sevanevorotov29@gmail.com>
+
+description:
+  Synaptics S3908 is a TouchComm generation-1 touchscreen controller connected
+  over I2C.
+
+allOf:
+  - $ref: touchscreen.yaml#
+
+properties:
+  compatible:
+    const: syna,s3908
+
+  reg:
+    maxItems: 1
+
+  interrupts:
+    maxItems: 1
+
+  reset-gpios:
+    maxItems: 1
+
+  vdd-supply:
+    description: Core / digital power supply regulator (VDD)
+
+  avdd-supply:
+    description: Analog power supply regulator (AVDD)
+
+  wakeup-source: true
+
+required:
+  - compatible
+  - reg
+  - interrupts
+  - reset-gpios
+  - vdd-supply
+  - avdd-supply
+
+unevaluatedProperties: false
+
+examples:
+  - |
+    #include <dt-bindings/interrupt-controller/irq.h>
+    #include <dt-bindings/gpio/gpio.h>
+
+    i2c {
+        #address-cells = <1>;
+        #size-cells = <0>;
+
+        touchscreen@4b {
+            compatible = "syna,s3908";
+            reg = <0x4b>;
+            interrupt-parent = <&tlmm>;
+            interrupts = <23 IRQ_TYPE_LEVEL_LOW>;
+            reset-gpios = <&tlmm 22 GPIO_ACTIVE_LOW>;
+            vdd-supply = <&vreg_l3c_3p0>;
+            avdd-supply = <&vreg_l8c_1p8>;
+            wakeup-source;
+        };
+    };
-- 
2.55.0

