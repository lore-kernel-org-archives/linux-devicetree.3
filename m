Received: from mail-wm1-f54.google.com (mail-wm1-f54.google.com [209.85.128.54])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 2C8A34FECCE
	for <devicetree@vger.kernel.org>; Tue,  8 Sep 2026 09:18:56 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.128.54
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1788859140; cv=none; b=bS0M/VIzIG7zvyksSyi0QATEUVEvHx97seie0VQTGQKp5VCPvcCnhw+w/6q9c9J+nEYlb4JkASDxBZRL41jGljDpOmVUg+G57MvJjfpb6paBYfSrIhBfBQR/TZZCCCDu/zD13hWKGJatjjODaXQR52Qa5X+7RtJhYbcm+HC6k60=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1788859140; c=relaxed/simple;
	bh=f8uHZpfRl4v8AUtS53bPhxc4vthZX6W8U9P1WRFUNx0=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version; b=O640jbKtf9s/CBCr3f2XuirAfTLZQ0D1tKqyKiX0lyQqP6f3rGXIwspclz/r6Zda/O0yjv8lFmIE9mkxLPbbLUuyQQDi0b6MSWDKQWagzlOU41wjP1QWQEPJzbIgHzAd1qc7xj/78wO/s6OZgS7Y+4DmgqkCwGGog3LOTXCNeOA=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=OfK7SkI6; arc=none smtp.client-ip=209.85.128.54
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="OfK7SkI6"
Received: by mail-wm1-f54.google.com with SMTP id 5b1f17b1804b1-49b96837ca3so35082865e9.3
        for <devicetree@vger.kernel.org>; Tue, 08 Sep 2026 02:18:55 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1788859134; x=1789463934; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=RBs47LjvcqFa12yXVqhhMacXUU5EOaptYJ05VFD/yFg=;
        b=OfK7SkI61VRC0ejxUBEWkW6ctgoAisu6hwL5X8kNm823fZ1IW0sJFSfJyzBl713W6t
         G0lmZEwIdl0eBV4IXz6iNBd6JKOU5g1c6KI2UPrWbKKfVUVheL0V1wWJzxA6JNai+ey0
         TYn7GqIk5kqVj3N0Vfeb9C6Zal4NoOYLW71oyr2IXxdWTv+8VPCKNmO4q48+2h06SO8E
         QJWykhuwXEw5Ba5NZ7mpQ7rMuG+y/K1XUFx3/kHEH0Gd4YSSfwC3c1lai8QoSuFkODvW
         CNfJoMM0RwPIIu8r7bVmeshkEFTBr9QLTNdl5T2rdW6cnMGP5lgmPXJ8oCMaotDBJC+g
         pyMA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1788859134; x=1789463934;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to:content-type;
        bh=RBs47LjvcqFa12yXVqhhMacXUU5EOaptYJ05VFD/yFg=;
        b=BVxvn7vPud+7M96KLyzeoQLMjzu/9cezJVyfqfzee45cOhSFp9/AtnbKdDTn3GYot5
         IpRVBxHxFSkbGV914CgK37Hp8AvxlJ8zbwvuI5UM976/3yScz+NF3pqbR+YS7K8m/+U2
         qH+IyPwASlLFSUiUuauBxW7Nkv9XcJg6UlxLgMUZPBdhwVa+g9Aq2EFcpWqOEgomCKIf
         pJ8jTiXaC/ezpjwbYF5qK8ylCri15rm/phKGcMOeb1LENZKCSW9ixW6oKrhgpJQQNZZI
         R33RJbnwo4j1A/3DJbDv9//Og1oMzi6MXGxS1PTy5hgl+lYcfN0ysdnrTLw1IDFgUXyf
         Fzug==
X-Forwarded-Encrypted: i=1; AKwUvBxFZwPAZCn9KORvgXckkav0NklG5OS4jkIhvKH24cnlLeSqsM00VJFElx/b1cMpWzL/CbDq60d4ZXxc@vger.kernel.org
X-Gm-Message-State: AFuF++lG5LU9/0yYuZtOHGZ+pcu41jZJ8EdXJMkk+8/5UarMwuePtXO3
	kX1WpPfYGIZKZDHyX1R+LijYCGr4M0FXzxVDE591x57PPda5DEUnq3DX
X-Gm-Gg: AYBFou0AoGF8I2RchI+N+7c3ZTPXLonuSgmjBeA0izV9fRc5vEgUENNy7ZMjW3H3SPS
	5BbUXZD89FfVQ78MYnmQIkyRtxVyjnMNzo9gHcbHjWOW6WJHz7e4+OvbaTglyA08tk+kBW202ni
	gGNYwh3DxU0uSZXyytdrA6htyW2c0zVsyAtQCtYqDE9MusQ7pLqhKB8rwoV6eqru8lJ05WeCWa/
	InL5Xb0NO+xn3xRFzc7KCNW4hENBYNwvM8r3+8pi2TzcGckMgB4abPIOYj/7OwLpSZIlj4z83I6
	AdPKu98bwmtU/OfEJe6QpRF65Rr8XPtBFC21Cg9RHRryBO3z4aNHWlkwPStjW/6sXFoSsy5W+yF
	KdyuX3xhPjLJRf/Vl+bIoYZok7SAjNAV1zOtA4Y/qD2L/ON+msaRyMxWH5gkB5Vm8ZMRry3ahp0
	IXbtetMmal/Nl3pzoJjpFzhZR5oPyZRXg3TyUQv4wqnf9XMBzByEFpaCIMAbDXxawK6LzeKQHYR
	LKea8LQ3JiG+NALsyUEzVSobfOPTQI42g==
X-Received: by 2002:a05:600c:5493:b0:49b:8f18:714a with SMTP id 5b1f17b1804b1-49cf824a6c5mr291161125e9.12.1788859134252;
        Tue, 08 Sep 2026 02:18:54 -0700 (PDT)
Received: from localhost.localdomain (mob-31-26-103-238.net.vodafone.it. [31.26.103.238])
        by smtp.googlemail.com with ESMTPSA id ffacd0b85a97d-48588135600sm30514063f8f.2.2026.09.08.02.18.52
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 08 Sep 2026 02:18:53 -0700 (PDT)
From: Oleg Keri <okerixx@gmail.com>
To: Rob Herring <robh@kernel.org>,
	Krzysztof Kozlowski <krzk+dt@kernel.org>,
	Conor Dooley <conor+dt@kernel.org>,
	Hans de Goede <hansg@kernel.org>,
	=?UTF-8?q?Ilpo=20J=C3=A4rvinen?= <ilpo.jarvinen@linux.intel.com>,
	"Bryan O'Donoghue" <bryan.odonoghue@linaro.org>,
	Guenter Roeck <linux@roeck-us.net>
Cc: linux-arm-msm@vger.kernel.org,
	devicetree@vger.kernel.org,
	linux-kernel@vger.kernel.org,
	platform-driver-x86@vger.kernel.org,
	linux-hwmon@vger.kernel.org
Subject: [PATCH 1/2] dt-bindings: embedded-controller: add Lenovo Yoga Slim 7x Gen 11 EC
Date: Tue,  8 Sep 2026 11:17:51 +0200
Message-ID: <20260908091752.5508-2-okerixx@gmail.com>
X-Mailer: git-send-email 2.55.0
In-Reply-To: <20260908091752.5508-1-okerixx@gmail.com>
References: <20260908091752.5508-1-okerixx@gmail.com>
Precedence: bulk
X-Mailing-List: devicetree@vger.kernel.org
List-Id: <devicetree.vger.kernel.org>
List-Subscribe: <mailto:devicetree+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:devicetree+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

Document the Compal embedded controller found on the Lenovo Yoga Slim 7x
Gen 11, a Qualcomm Snapdragon X2 Elite (glymur) laptop. It sits on I2C at
address 0x70 and is distinct from the Qualcomm reference EC that the
reference designs place at 0x76.

Signed-off-by: Oleg Keri <okerixx@gmail.com>
---
 .../lenovo,yoga-slim7x-gen11-ec.yaml          | 56 +++++++++++++++++++
 MAINTAINERS                                   |  8 +++
 2 files changed, 64 insertions(+)
 create mode 100644 Documentation/devicetree/bindings/embedded-controller/lenovo,yoga-slim7x-gen11-ec.yaml

diff --git a/Documentation/devicetree/bindings/embedded-controller/lenovo,yoga-slim7x-gen11-ec.yaml b/Documentation/devicetree/bindings/embedded-controller/lenovo,yoga-slim7x-gen11-ec.yaml
new file mode 100644
index 000000000000..37337de86b0b
--- /dev/null
+++ b/Documentation/devicetree/bindings/embedded-controller/lenovo,yoga-slim7x-gen11-ec.yaml
@@ -0,0 +1,56 @@
+# SPDX-License-Identifier: (GPL-2.0-only OR BSD-2-Clause)
+%YAML 1.2
+---
+$id: http://devicetree.org/schemas/embedded-controller/lenovo,yoga-slim7x-gen11-ec.yaml#
+$schema: http://devicetree.org/meta-schemas/core.yaml#
+
+title: Lenovo Yoga Slim 7x Gen 11 Embedded Controller
+
+maintainers:
+  - Oleg Keri <okerixx@gmail.com>
+
+description:
+  The Lenovo Yoga Slim 7x Gen 11, a Qualcomm Snapdragon X2 Elite (glymur)
+  laptop, has a Compal embedded controller on I2C. It reports board
+  thermistors, battery cell voltages and CPU fan speed, and drives the
+  keyboard backlight.
+
+  This controller is not the Qualcomm reference EC that the Snapdragon
+  reference designs place at address 0x76; it speaks a different command
+  set and answers at 0x70.
+
+properties:
+  compatible:
+    const: lenovo,yoga-slim7x-gen11-ec
+
+  reg:
+    const: 0x70
+
+  interrupts:
+    maxItems: 1
+    description:
+      The controller pulses this line while it has events queued.
+
+required:
+  - compatible
+  - reg
+  - interrupts
+
+additionalProperties: false
+
+examples:
+  - |
+    #include <dt-bindings/interrupt-controller/irq.h>
+
+    i2c {
+        #address-cells = <1>;
+        #size-cells = <0>;
+
+        embedded-controller@70 {
+            compatible = "lenovo,yoga-slim7x-gen11-ec";
+            reg = <0x70>;
+
+            interrupts-extended = <&tlmm 66 IRQ_TYPE_EDGE_FALLING>;
+        };
+    };
+...
diff --git a/MAINTAINERS b/MAINTAINERS
index 38612eca2987..e35679264e22 100644
--- a/MAINTAINERS
+++ b/MAINTAINERS
@@ -14882,6 +14882,14 @@ S:	Maintained
 F:	Documentation/ABI/testing/sysfs-driver-lenovo-yb9-kbdock
 F:	drivers/platform/x86/lenovo/yb9-kbdock.c
 
+LENOVO YOGA SLIM 7X GEN 11 EMBEDDED CONTROLLER DRIVER
+M:	Oleg Keri <okerixx@gmail.com>
+L:	linux-arm-msm@vger.kernel.org
+S:	Maintained
+F:	Documentation/ABI/testing/sysfs-driver-lenovo-yoga-slim7x-gen11-ec
+F:	Documentation/devicetree/bindings/embedded-controller/lenovo,yoga-slim7x-gen11-ec.yaml
+F:	drivers/platform/arm64/lenovo-yoga-slim7x-gen11-ec.c
+
 LETSKETCH HID TABLET DRIVER
 M:	Hans de Goede <hansg@kernel.org>
 L:	linux-input@vger.kernel.org
-- 
2.55.0

