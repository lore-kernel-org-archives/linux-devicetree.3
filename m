Received: from mail-pf1-f181.google.com (mail-pf1-f181.google.com [209.85.210.181])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 26A993CFF6D
	for <devicetree@vger.kernel.org>; Wed, 22 Apr 2026 12:06:23 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.210.181
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1776859585; cv=none; b=tT5A+5oS0B2txcvxVepl1LF9gOT7GZ3vxa4Z03/U9ITP7c6yjlzRytYLjHVlz/DVA71oDPlleHqn1JwqpVroWrfrqvGEP9LKtQ/EOdYa6mOkIWwjRuJ7jeQ3T1jei8SpCKZtYTkS4+VlSnO2s1Kl/4MLVGjUG6ODGwXP59On/DU=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1776859585; c=relaxed/simple;
	bh=K6kXILzd2iMJnONaLp/UgH6p8zJDWKMT+WvFlL3J0Js=;
	h=From:Date:Subject:MIME-Version:Content-Type:Message-Id:References:
	 In-Reply-To:To:Cc; b=ZLB0/YEVpiRB2nkRm688D5rdp7jhLz3D9u2dG7a22DTTe7eQwh8LEm6xvgM0ya4Ghz5KdLEzk4cs8jnXbPfxtp6Rpnbw313VQUy4TmAdC57L/8Emo/jSizPD6bfiuvNYJIOaMGbU6w7zcn6ehW04YMyKxajdR4MdyaCu7C2gur8=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=inventec.com; spf=pass smtp.mailfrom=inventec.com; dkim=pass (2048-bit key) header.d=inventec.com header.i=@inventec.com header.b=Fjk2OJOk; arc=none smtp.client-ip=209.85.210.181
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=inventec.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=inventec.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=inventec.com header.i=@inventec.com header.b="Fjk2OJOk"
Received: by mail-pf1-f181.google.com with SMTP id d2e1a72fcca58-82f69adeecbso2299354b3a.2
        for <devicetree@vger.kernel.org>; Wed, 22 Apr 2026 05:06:23 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=inventec.com; s=google; t=1776859583; x=1777464383; darn=vger.kernel.org;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :mime-version:subject:date:from:from:to:cc:subject:date:message-id
         :reply-to;
        bh=HOQKPwDDzrcAD0phDanh6XQC7w96PXuOSuzVKz/b9lI=;
        b=Fjk2OJOkngr82YUWzoDl6Kd03zgRcCUpGCcHwsEJ+VDfDP0+zXimq4aUtc5Bi1grEM
         NCDE0KmDWrLixApOnFQP7vNiHPFeQtVglOxaWoRodySFSnIRVNPyhWDK/3yauclvHFYv
         ziwqRknCyHmXr+WPFLHR3oiqAj6Shoq6uJbHdXcQBylQbTGbbKGiHclrLgKcRu4Ws2rg
         UmxQKlKITCIPgktIp8W/786U4PrZyqsAhuKQ/yb2TYkjO387GFFZgj6MQaLksknET8et
         mikpn9v52+eURDeduWSrn1GTLUPqFdY8ZWW56vwoiM4VBF2ySTtxiLrIfoi2zjvrVgUn
         uJhw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1776859583; x=1777464383;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :mime-version:subject:date:from:x-gm-gg:x-gm-message-state:from:to
         :cc:subject:date:message-id:reply-to;
        bh=HOQKPwDDzrcAD0phDanh6XQC7w96PXuOSuzVKz/b9lI=;
        b=lZlDlth7yhx90vl8h37B8Rn3DuTStpaE0SmIcqQncZOSLCs8dXIBFgZj+rOKNw+o8R
         nRTP2vNTcfH3DB1Jwj0EcFk0zi/NzFaijIhv9XrUQqoNyYUC/ghoo7MZw3/omm5f4xlY
         O0AnhMcqztqvdUkwjyEwDQo4DRsxo+m9DAyLyynR1cx7HXrzuMF9etKqmVTFo+qBb4ej
         OMddhGSTMUaRp0kv8exO3WEsNmvEfZGG36Gr/q71PFpWG/lcBM41IRJZ7Gm0PIoMegfY
         EufzTxgiHip83t0kQygMtTWCSlL4C1WLi3aSNyuZqTqdisM8iIesWPFuvU3AvpCzOFoH
         ltsA==
X-Forwarded-Encrypted: i=1; AFNElJ/r65sRqjNVWFeA0rLBMcM51VfA11tpqvo67ZJEMuO+HPy25uBwwTvOFRo/p9CulG0yBeribsRvNZhp@vger.kernel.org
X-Gm-Message-State: AOJu0YziU9hNyTQCzOqhU1CKSBke8u49jA+Wn/vjgaDWIGT4M73GY/0x
	yKKHgWl+UViwDq4swHwvPwd7FkEQsBeZIuUTrXcrA9Uu8sNE6xjCCzTA+2SMnX2vlfU=
X-Gm-Gg: AeBDietUB1P2r2H9MwrFUR4jqzReT1tT9If9B5d+NT/8dHu1Ya5I7LG+QQgJr2aRsYE
	V636OmofroQ/mMpoUawYFeqtcrmoIJvauqaC8CDLJS/LXFsOHKnLJaisorOvIRultSyJcMpJgOh
	E6zHnIUO2b983z3pV0bVcVSAsp3KOGV30zdt+FmDEaeLdI6o9SHJyKo+3N9jsdfDQKjPuC4SO8r
	q5VXX1C3hzE9TYY7Rv0tC/HCJ9NFSXvp6KWJQZ8py30BtHN5XgCRRhlctPMF5r161Fvtstd2poV
	QSpsyrHhjbNCVU8ZV+Vpiz5ZAOr0HlYxJy0e9UuUwrXDgUrkp2+o03XLEL2dTeTTWfELGe7xR7l
	/SqJZLdBwmC/fPieeFDQUYgKAZR0EkuPgp66s0MLzDmzCA7/aWuGjuser0LqHHg3c0vJiqSFxEy
	MDjNVl/Brc38X7XieAGda/W2x5Pn50LQSJiEJuYNSN2ZOMgfbj3vC3SqmASc1TisT5r/PEOKYkw
	JAi
X-Received: by 2002:a05:6a00:10c5:b0:82c:ddbb:7db3 with SMTP id d2e1a72fcca58-82f8c95c94cmr23378749b3a.25.1776859583175;
        Wed, 22 Apr 2026 05:06:23 -0700 (PDT)
Received: from [127.0.1.1] (60-250-242-163.hinet-ip.hinet.net. [60.250.242.163])
        by smtp.gmail.com with ESMTPSA id d2e1a72fcca58-82f8ebb3fa2sm17086636b3a.29.2026.04.22.05.06.20
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 22 Apr 2026 05:06:22 -0700 (PDT)
From: Brian Chiang <chiang.brian@inventec.com>
Date: Wed, 22 Apr 2026 12:06:15 +0000
Subject: [PATCH 1/2] dt-bindings: (pmbus/lx1308) Add LX1308 support
Precedence: bulk
X-Mailing-List: devicetree@vger.kernel.org
List-Id: <devicetree.vger.kernel.org>
List-Subscribe: <mailto:devicetree+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:devicetree+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20260422-add-support-lx1308-v1-1-9b8322f45aae@inventec.com>
References: <20260422-add-support-lx1308-v1-0-9b8322f45aae@inventec.com>
In-Reply-To: <20260422-add-support-lx1308-v1-0-9b8322f45aae@inventec.com>
To: Guenter Roeck <linux@roeck-us.net>, Rob Herring <robh@kernel.org>, 
 Krzysztof Kozlowski <krzk+dt@kernel.org>, 
 Conor Dooley <conor+dt@kernel.org>, Jonathan Corbet <corbet@lwn.net>, 
 Shuah Khan <skhan@linuxfoundation.org>
Cc: linux-hwmon@vger.kernel.org, devicetree@vger.kernel.org, 
 linux-kernel@vger.kernel.org, linux-doc@vger.kernel.org, 
 Brian Chiang <chiang.brian@inventec.com>
X-Mailer: b4 0.13.0
X-Developer-Signature: v=1; a=ed25519-sha256; t=1776859578; l=3150;
 i=chiang.brian@inventec.com; s=20260316; h=from:subject:message-id;
 bh=K6kXILzd2iMJnONaLp/UgH6p8zJDWKMT+WvFlL3J0Js=;
 b=eCXpJOmrWLqiPrJTwm7WXb64vLmd7+OKz7DeIasA+gQhQ608RaflSXpzWoGj6cZgUlwxmSB7+
 bW6GwKYrtpOCFd38S5TRj3zMcnG9t93tcXaawLCh4xfDP1xzQw2i5yG
X-Developer-Key: i=chiang.brian@inventec.com; a=ed25519;
 pk=q+NqJYuJbGpA9KS9941D7f+8PVVW+k7DvaGgFykBiUc=

Add device tree bindings for the Luxshare LX1308, a high-efficiency
12V 860W DC/DC power module with PMBus interface.

Signed-off-by: Brian Chiang <chiang.brian@inventec.com>
---
 .../bindings/hwmon/pmbus/luxshare,lx1308.yaml      | 49 ++++++++++++++++++++++
 .../devicetree/bindings/vendor-prefixes.yaml       |  2 +
 MAINTAINERS                                        |  8 ++++
 3 files changed, 59 insertions(+)

diff --git a/Documentation/devicetree/bindings/hwmon/pmbus/luxshare,lx1308.yaml b/Documentation/devicetree/bindings/hwmon/pmbus/luxshare,lx1308.yaml
new file mode 100644
index 000000000000..a8d92447508d
--- /dev/null
+++ b/Documentation/devicetree/bindings/hwmon/pmbus/luxshare,lx1308.yaml
@@ -0,0 +1,49 @@
+# SPDX-License-Identifier: (GPL-2.0-only OR BSD-2-Clause)
+%YAML 1.2
+---
+
+$id: http://devicetree.org/schemas/hwmon/pmbus/luxshare,lx1308.yaml#
+$schema: http://devicetree.org/meta-schemas/core.yaml#
+
+title: Luxshare LX1308 Digital DC/DC Power Module
+
+maintainers:
+  - Brian Chiang <chiang.brian@inventec.com>
+
+description: |
+  The LX1308 is a high-efficiency, non-isolated, regulated 12V, 860W,
+  digital DC/DC power module. The module operates from a 40V to 60V DC
+  primary bus and provides a 12V regulated output voltage. It can deliver
+  up to 860W continuous and 1300W in transient.
+
+properties:
+  compatible:
+    enum:
+      - luxshare,lx1308lch
+      - luxshare,lx1308nch
+      - luxshare,lx1308sch
+      - luxshare,lx1308ldh
+      - luxshare,lx1308ndh
+      - luxshare,lx1308sdh
+      - luxshare,lx1308
+
+  reg:
+    maxItems: 1
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
+      #address-cells = <1>;
+      #size-cells = <0>;
+
+      power-module@60 {
+        compatible = "luxshare,lx1308";
+        reg = <0x60>;
+      };
+    };
diff --git a/Documentation/devicetree/bindings/vendor-prefixes.yaml b/Documentation/devicetree/bindings/vendor-prefixes.yaml
index ee7fd3cfe203..67fb1592daaa 100644
--- a/Documentation/devicetree/bindings/vendor-prefixes.yaml
+++ b/Documentation/devicetree/bindings/vendor-prefixes.yaml
@@ -967,6 +967,8 @@ patternProperties:
     description: Shenzhen Luckfox Technology Co., Ltd.
   "^lunzn,.*":
     description: Shenzhen Lunzn Technology Co., Ltd.
+  "^luxshare,.*":
+    description: Luxshare-ICT Co., Ltd.
   "^luxul,.*":
     description: Lagrand | AV
   "^lwn,.*":
diff --git a/MAINTAINERS b/MAINTAINERS
index c3fe46d7c4bc..58fa595cff6a 100644
--- a/MAINTAINERS
+++ b/MAINTAINERS
@@ -15175,6 +15175,14 @@ S:	Maintained
 F:	Documentation/devicetree/bindings/iio/light/liteon,ltr390.yaml
 F:	drivers/iio/light/ltr390.c
 
+LUXSHARE LX1308 PMBUS DRIVER
+M:	Brian Chiang <chiang.brian@inventec.com>
+L:	linux-hwmon@vger.kernel.org
+S:	Maintained
+F:	Documentation/devicetree/bindings/hwmon/pmbus/luxshare,lx1308.yaml
+F:	Documentation/hwmon/lx1308.rst
+F:	drivers/hwmon/pmbus/lx1308.c
+
 LYNX 28G SERDES PHY DRIVER
 M:	Ioana Ciornei <ioana.ciornei@nxp.com>
 L:	netdev@vger.kernel.org

-- 
2.43.0

