Received: from mail-ot1-f49.google.com (mail-ot1-f49.google.com [209.85.210.49])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id BC83C256C6D
	for <devicetree@vger.kernel.org>; Sat, 20 Jun 2026 04:40:14 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.210.49
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1781930417; cv=none; b=GD6tW083A26q1AiqVM0M9iDAsVzzoJdEJc9Cbag+CofQrWaHpWEIpTY623/yNGEPBwLVmiWB3n+eMn57Gd4ZBCQD/ESRfCA8H8Mv0ckta35sdqJazuddL59SVJfxDrA+vN8li02z+z0cM9j2EplbeO3ztO+/0SAk0jQdAA1mdrA=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1781930417; c=relaxed/simple;
	bh=s4uGUDCNIZcuL67jmQB+Q6rJHyfc0sUokTYu0rPht9w=;
	h=From:To:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version; b=P6NFku5EwKJyFP/kMWZeR/RySZ3BZaE4DZlpqB2mM/jPxwOtbdNN0Q14SMNAdVFqGQ7Oex+yvM9t+iXFCYDdTza82XuVchom7J3yOJhxHocmDuKlnaJYomP69PUanleI0WqBt2v/nuOKvi262zsaAf/LeyNdM/Z3elD5iUcLuKk=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=mVCe7jNk; arc=none smtp.client-ip=209.85.210.49
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="mVCe7jNk"
Received: by mail-ot1-f49.google.com with SMTP id 46e09a7af769-7e6e21c47e6so1641784a34.1
        for <devicetree@vger.kernel.org>; Fri, 19 Jun 2026 21:40:14 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1781930414; x=1782535214; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:to:from:from:to:cc:subject:date:message-id
         :reply-to;
        bh=ZK6YFlyAvt6yked5wvEFfbmqGCX0V5PCrDLneg6SZt0=;
        b=mVCe7jNkbF0jAtTp+xZdhTKjtZYEHhLTwmeIWXKqu4/otQwfE4ffcRJBnVKEiARhvg
         LpWFdX8Io3HheXEixMEkuJ8CehmZyp8cUPcRhoRDbhXrxE4JCSmVcVMSW3/vs8o3q1mg
         t2W5yTwfqW8meuUpQpVL703NxL3OBuRAJVL4z9BH3AGlmen77R3147jxllfWp+A69Lhn
         teJY1qmEJvrGQlMH24jIYWgKWHfNdhvUP1iySR///dt80mpBhY3bEsVza3PSagWOcU9d
         IYKQKGrqpjTmREvgprH6k2CwtLT4PaOxuMq6Tb7fD81EJw2ANl25xm7y1pjSIl8SpSJ5
         3DEQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1781930414; x=1782535214;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:to:from:x-gm-gg:x-gm-message-state:from:to
         :cc:subject:date:message-id:reply-to;
        bh=ZK6YFlyAvt6yked5wvEFfbmqGCX0V5PCrDLneg6SZt0=;
        b=jTZSuu0ZcsDnEiteZM5LbVXx8kBSA9nrBhIvoNdQGTulo6lU010Cot7UCj2wrv/TYP
         2YmPAksOG2EGghAPC4vHenHhKL/EG3GCa0FpmVBsnj/yzgjC3rPEcJIn/dLafEaM4HZA
         pS/ZX1cWmJ/1XylTbMFrOIkxrCbyetGrpperxlPTev2OxcxxXeGSWk4bOeRhDyjsArfs
         N6rSejvfIfRcMROR2KDbGLgHwwnNGkfEkBmqQdaGReiVQG/L0rAdxfVo6gzTbFBNAOtw
         +4mhE/qC7gHZMKNJT/0nhiMLEDlyNB90PVtR+jZDyUB5TfCDGSwS97hXceNqPA+8LIH6
         iN2A==
X-Forwarded-Encrypted: i=1; AFNElJ8AlMAOcDSZID4H/SeNYnXTwtQ8XIOzs0QsZSNy0HGCeAHmfOiMzLXTatbmsAxk+eeCSrdqHhuRcL23@vger.kernel.org
X-Gm-Message-State: AOJu0YxymHBmQrHvA7dpxhjvAvyTiaUjGi3k5/ZXoqcDy36/3MimU2H9
	fwhMN+rGtvyH80dPUcMFEnggRFPUDnaQy7+7A6fasaXwnR5gFxJEbQFI
X-Gm-Gg: AfdE7ckUhUusDAKEnlnGsyTNFStvyyW5FOfq7HvtkVxTA7NutFAYn+7gyj5/ALmbxuK
	Y7pJmwNeVwd/7JAqHbSXqOqu7Tw/HvD5KAjWYrHozXHe4f5JijaEoOM1MTfQNj/IhL9Kj3DR2WA
	0lNC6CZIlNr+Jg3jqX0k88Yal6VSWWaWaHuqZy9JKa0SVZvEw98IMGTaz+hekjh0bDeyEuc4gOB
	XX9DMqTHeCSucX6NU75yjE+ti/uycAPtK5xT7IhBLcTs37K03cQ0yeb3g0BodRl4TKDWdtUzVf3
	3AVmnTEXgykr2HYl9znOrvChdriwihT6+JVFrs0jiQU3jJnCAqc3AA7eYuyzDsVIBDZFx7cir2M
	/GQWI8vcS9f835dEB6o/tUGk+jgLoMbPrasJhmKPf5aqYXblvnW7v2wYkHOltdHc+aFAwzv3HDT
	Up4+4rU2s9D1dhGeI4XuxSiVocuJ8MA7hcY2hd44poHjM97i0=
X-Received: by 2002:a05:6808:c2c3:b0:489:5dc8:1d61 with SMTP id 5614622812f47-4896aa57359mr5850543b6e.13.1781930413798;
        Fri, 19 Jun 2026 21:40:13 -0700 (PDT)
Received: from linuxescape.lan (23-88-128-2.fttp.usinternet.com. [23.88.128.2])
        by smtp.gmail.com with ESMTPSA id 5614622812f47-48aec0ddd7bsm679754b6e.7.2026.06.19.21.40.12
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 19 Jun 2026 21:40:13 -0700 (PDT)
From: Maxwell Doose <m32285159@gmail.com>
To: Jonathan Cameron <jic23@kernel.org>,
	David Lechner <dlechner@baylibre.com>,
	=?UTF-8?q?Nuno=20S=C3=A1?= <nuno.sa@analog.com>,
	Andy Shevchenko <andy@kernel.org>,
	Rob Herring <robh@kernel.org>,
	Krzysztof Kozlowski <krzk+dt@kernel.org>,
	Conor Dooley <conor+dt@kernel.org>,
	linux-iio@vger.kernel.org (open list:IIO SUBSYSTEM AND DRIVERS),
	devicetree@vger.kernel.org (open list:OPEN FIRMWARE AND FLATTENED DEVICE TREE BINDINGS),
	linux-kernel@vger.kernel.org (open list)
Subject: [RFC PATCH 1/3] dt-bindings: iio: temperature: Add STS30 devicetree bindings
Date: Fri, 19 Jun 2026 23:40:05 -0500
Message-ID: <20260620044010.1082621-2-m32285159@gmail.com>
X-Mailer: git-send-email 2.54.0
In-Reply-To: <20260620044010.1082621-1-m32285159@gmail.com>
References: <20260620044010.1082621-1-m32285159@gmail.com>
Precedence: bulk
X-Mailing-List: devicetree@vger.kernel.org
List-Id: <devicetree.vger.kernel.org>
List-Subscribe: <mailto:devicetree+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:devicetree+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

Add the devicetree bindings for the STS30 family of temperature sensors.
The STS30 family of sensors includes the STS30, STS31, and STS35.

All devices in the STS30 family share the same commands, timings, etc.
The only difference between them is their measurement accuracy and
tolerance.

Signed-off-by: Maxwell Doose <m32285159@gmail.com>
---
 .../iio/temperature/sensirion,sts30.yaml      | 49 +++++++++++++++++++
 1 file changed, 49 insertions(+)
 create mode 100644 Documentation/devicetree/bindings/iio/temperature/sensirion,sts30.yaml

diff --git a/Documentation/devicetree/bindings/iio/temperature/sensirion,sts30.yaml b/Documentation/devicetree/bindings/iio/temperature/sensirion,sts30.yaml
new file mode 100644
index 000000000000..dc0c6b7832fb
--- /dev/null
+++ b/Documentation/devicetree/bindings/iio/temperature/sensirion,sts30.yaml
@@ -0,0 +1,49 @@
+# SPDX-License-Identifier: (GPL-2.0-only OR BSD-2-Clause)
+%YAML 1.2
+---
+$id: http://devicetree.org/schemas/iio/temperature/sensirion,sts30.yaml#
+$schema: http://devicetree.org/meta-schemas/core.yaml#
+
+title: STS30, STS31, and STS35 temperature iio sensors
+
+maintainers:
+  - Maxwell Doose <m32285159@gmail.com>
+
+description: |
+  Family of digital temperature sensors from Sensirion with I2C interface.
+  All devices are compatible with each other, their only differences are
+  their levels of accuracy.
+
+  Datasheet available at:
+  https://sensirion.com/media/documents/1DA31AFD/65D613A8/Datasheet_STS3x_DIS.pdf
+
+properties:
+  compatible:
+    enum:
+      - sensirion,sts30
+      - sensirion,sts31
+      - sensirion,sts35
+
+  reg:
+    maxItems: 1
+
+  vdd-supply: true
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
+        temperature@4a {
+          compatible = "sensirion,sts30";
+          reg = <0x4a>;
+          vdd-supply = <&reg_3v3>;
+        };
+      };
-- 
2.54.0

