Received: from mail-pf1-f170.google.com (mail-pf1-f170.google.com [209.85.210.170])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 224EA3368BF
	for <devicetree@vger.kernel.org>; Wed, 25 Mar 2026 09:08:30 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.210.170
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1774429714; cv=none; b=NS7Bfnv1Dgpd23Z+jVRB9ETvfWYhxdj4zRzJX6KwygNZHC/DsbYpfcympfo7gyMrzRafRmdDvLBRaf6K2hoD7jb+ZcEdgt4AvWa56bWW5eWag7mnSM6rwEVtBgkkDM8VHh+RCJb31b1EJGlWxMLwquEQRm3hIe7oRg4iGb/x+J0=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1774429714; c=relaxed/simple;
	bh=17vJldx190UtREN9N166r46Kt1uzxrxBDYAbNaVuqmw=;
	h=From:To:Cc:Subject:Date:Message-Id:In-Reply-To:References; b=K+4zSWCW3NiI/xWBy4qu9oFVYP3sgoflcr2RdXQe/D/2XOWk9Lm54oOb/H/P5izc/fgfkK4ShqXs6j/y0JoFFwn/fnLhBGVhejt5BMII3QSzKL5kYikBNP8B/6Euu7L6PrUgKblYch8kgcEEunemlWmFziccGsmv54Iki93v8KM=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=VzO7Tryn; arc=none smtp.client-ip=209.85.210.170
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="VzO7Tryn"
Received: by mail-pf1-f170.google.com with SMTP id d2e1a72fcca58-82ae378fff8so3580446b3a.2
        for <devicetree@vger.kernel.org>; Wed, 25 Mar 2026 02:08:30 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1774429710; x=1775034510; darn=vger.kernel.org;
        h=references:in-reply-to:message-id:date:subject:cc:to:from:from:to
         :cc:subject:date:message-id:reply-to;
        bh=wg4hmLMuZM7AMAh8JiXj2GkH4WkZAyqVPGv9vuptt9o=;
        b=VzO7TryniNyDptNOv2jJrKyr1BcPJmb2KT9Ns3ihCuzUMERdNMgiLE/+1yeNBOQJdz
         FmumaQzjG6y6YBf034EBD0UJrQ6KAgO9I8M239YX+0EYH2CK1FLUkTVLvxDqa0iPLTwm
         WrsnKlt74BVdQk0M9qENeFXxdeGTQAJT/W278E5G2vg86wMRL5E9oQaBTPZlwaJqn8YK
         igYpZFsuCMwPXCjWL+PUKM6FdAjt58Ji9TNbGFNRbiS7Y/CPEoJfMXJqDEJ/JrRChBht
         01VBgCSLmRyeimTCmx4+tURXLw69rl+PraWnu45IH7H0O07ZigvBVKRyMVkfSqi/Yl30
         Dqxg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1774429710; x=1775034510;
        h=references:in-reply-to:message-id:date:subject:cc:to:from:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=wg4hmLMuZM7AMAh8JiXj2GkH4WkZAyqVPGv9vuptt9o=;
        b=i2Pz7ZD4wIgoZ/8Mri+hAL4tHe537iS67DihQZ4XPppG7ZpFUzLOWoqkPPoUmpbRG2
         4muVaWF2JVlWaIOfeLM9wJwCp2idQGi5uEfexnaciMiJPESw5ek4wYFjPPgJt+X8Gq88
         tKopW7ODQtPHrgPl7jq4ljtupq+v+3cyYnN2eORAyg765Ov3bnTOQJMESX0X7Kj0zQeW
         96MhZYQ3D+icDPisUV8qUIpBL7+6Z4lguchTaaJP4atmyvVVCFXM5MH6IYDZb9YeVFD4
         W3sSnvgPqa663iODC9yuvQwHaZi5ydJz6no04Vlw0f9qUJJKDg7G2CV0EdbBjy9NL2Y4
         vGUA==
X-Forwarded-Encrypted: i=1; AJvYcCWwRF1blhHzWl6Gz6n7BlMOE9TeqtRyC7u7/w4TruV48f0eNSEKPEQdJryLUZlXbJA9KGqWZ/cAhqdh@vger.kernel.org
X-Gm-Message-State: AOJu0YyP2O2a0+ayRetfIwpO+jFspRbthW8IJ6ihPSlZuYQnZDucTeXW
	zljoy+nxpZ7HFHX4wVa3ZFihUPPsaNv8JYOX/1Jki1uZg15rcENBxRf4
X-Gm-Gg: ATEYQzyrUfH+QhkOGXVoBDwW+/UNQNjh0KkSIN1Wm96fedfj+rh/txY1tiqMfLt+CsK
	TKPXNgQpGLVyCecSLAhs2WdkLn01MXPl6usUcM8tJ1XrPcsAxEl84C33jkxaKgzxP7Cg63BP8ej
	khhqdxiOabl0z2XdzkkRhGS3SjhTveFFZWStWoXjVF4Ji+a6WjO8zpYjm+fzZ1mGyP4X1ZnUe/u
	i+wM2k3oFYyyHhkG8s8fZNENnVQ+zmkhyhRxw+pjLUW1wwR83T4jTO/dXWg/Eey058A/08wGJx1
	CDpiytk+j/ha238dg/VzKIRwwnT5l3caG11btBFu/nWRkgkuQbYOUpP7BKLOjmmsHqwhXpuXQOp
	plt6KiB1Sjbnu4Dk/88BIi2R9fQpwGi8kDep/yoOlRbAUv5ta5YWhUeEHvzm0stjwqMtZRQDsiL
	/Jg30vbQKFwOYNtG4gDsYl5Tt/YgeT8TWcK0Iyeq8rT4hcNzKCsPEUur/8XK236wo=
X-Received: by 2002:a05:6a00:3c94:b0:81f:3cac:38a1 with SMTP id d2e1a72fcca58-82c6de82b8emr2967488b3a.6.1774429710460;
        Wed, 25 Mar 2026 02:08:30 -0700 (PDT)
Received: from ubuntu.localdomain ([27.217.83.168])
        by smtp.gmail.com with ESMTPSA id d2e1a72fcca58-82b03bc6881sm17476982b3a.22.2026.03.25.02.08.27
        (version=TLS1_2 cipher=ECDHE-ECDSA-AES128-GCM-SHA256 bits=128/128);
        Wed, 25 Mar 2026 02:08:30 -0700 (PDT)
From: Zaixiang Xu <zaixiang.xu.dev@gmail.com>
To: linux@roeck-us.net
Cc: robh@kernel.org,
	krzk+dt@kernel.org,
	conor+dt@kernel.org,
	linux-hwmon@vger.kernel.org,
	devicetree@vger.kernel.org,
	linux-kernel@vger.kernel.org,
	zaixiang.xu.dev@gmail.com
Subject: [PATCH v4 2/4] dt-bindings: hwmon: Add Sensirion SHT30 series
Date: Wed, 25 Mar 2026 17:08:08 +0800
Message-Id: <1774429690-129139-3-git-send-email-zaixiang.xu.dev@gmail.com>
X-Mailer: git-send-email 2.7.4
In-Reply-To: <1774429690-129139-1-git-send-email-zaixiang.xu.dev@gmail.com>
References: <1774429690-129139-1-git-send-email-zaixiang.xu.dev@gmail.com>
Precedence: bulk
X-Mailing-List: devicetree@vger.kernel.org
List-Id: <devicetree.vger.kernel.org>
List-Subscribe: <mailto:devicetree+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:devicetree+unsubscribe@vger.kernel.org>

Add YAML devicetree binding schema for Sensirion SHT30 series.
Use fallback compatibles for compatible chips and add optional
interrupts and vdd-supply properties.

Reported-by: kernel test robot <lkp@intel.com>
Closes: https://lore.kernel.org/r/202603212044.BRPaiz86-lkp@intel.com/
Signed-off-by: Zaixiang Xu <zaixiang.xu.dev@gmail.com>
---
 .../bindings/hwmon/sensirion,sht30.yaml       | 50 +++++++++++++++++++
 1 file changed, 50 insertions(+)
 create mode 100644 Documentation/devicetree/bindings/hwmon/sensirion,sht30.yaml

diff --git a/Documentation/devicetree/bindings/hwmon/sensirion,sht30.yaml b/Documentation/devicetree/bindings/hwmon/sensirion,sht30.yaml
new file mode 100644
index 000000000000..1b5ce822b37b
--- /dev/null
+++ b/Documentation/devicetree/bindings/hwmon/sensirion,sht30.yaml
@@ -0,0 +1,50 @@
+# SPDX-License-Identifier: (GPL-2.0-only OR BSD-2-Clause)
+%YAML 1.2
+---
+$id: http://devicetree.org/schemas/hwmon/sensirion,sht30.yaml#
+$schema: http://devicetree.org/meta-schema.yaml#
+
+title: Sensirion SHT30 Humidity and Temperature Sensor
+
+maintainers:
+  - Zaixiang Xu <zaixiang.xu.dev@gmail.com>
+
+description: |
+  The SHT30 series is a family of humidity and temperature sensors by Sensirion.
+  Compatible sensors like the GXCAS GXHT30 are also supported.
+
+properties:
+  compatible:
+    enum:
+      - gxcas,gxht30
+      - sensirion,sht30
+      - sensirion,sht31
+      - sensirion,sht35
+      - sensirion,sht85
+      - sensirion,sts30
+      - sensirion,sts31
+      - sensirion,sts32
+      - sensirion,sts35
+
+  reg:
+    maxItems: 1
+    description: I2C address (usually 0x44 or 0x45)
+
+required:
+  - compatible
+  - reg
+
+additionalProperties: false
+
+examples:
+  - |
+    i2c {
+        #address-cells = <1>;
+        #size-cells = <0>;
+
+        sensor@44 {
+            compatible = "gxcas,gxht30";
+            reg = <0x44>;
+        };
+    };
+
-- 
2.34.1

