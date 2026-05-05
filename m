Received: from mail-pj1-f45.google.com (mail-pj1-f45.google.com [209.85.216.45])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 61FE538839C
	for <devicetree@vger.kernel.org>; Tue,  5 May 2026 10:09:21 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.216.45
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1777975765; cv=none; b=s5ZWDzMv0Whuq0i55b6WEIuXBpR5o0U4hhd/Pxyp9LX5IUmsAZyZeVAWGZSSuHsDclM5xpLsUpObZKbhxCv2zAlf4oIfYHij2lGJ72LOWMVeQu97Y09Jlq6uKNUMEycpyAzs74tJN6IDMKxdHJBKdf6hTzZ2azeWtb9lRRcYj9s=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1777975765; c=relaxed/simple;
	bh=8c7lkCrauuFMZC1+5FlXt1OgEI+FRNKl9K/f0yf4qi8=;
	h=From:To:Cc:Subject:Date:Message-ID:MIME-Version; b=qQMYTxN+kkYB5YAcBQnmEw9x/re75/PWEwY4Bu95/SRGxyyL0Y+zStV+SJMNFzAhF3neLZKyeogY7BwFH7Epd1Dd90e6uKc91EB/CSEUp8XLYpvBYgvQIcSLrvsXoXFQfiss26ysV0PDExYedtFbtzGhq4VxMsyEhahwof5hRUY=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=nbLckOr5; arc=none smtp.client-ip=209.85.216.45
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="nbLckOr5"
Received: by mail-pj1-f45.google.com with SMTP id 98e67ed59e1d1-364ff382b0bso3755936a91.2
        for <devicetree@vger.kernel.org>; Tue, 05 May 2026 03:09:20 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1777975758; x=1778580558; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:from:to:cc:subject:date:message-id:reply-to;
        bh=uhallVX0Ytq91OQAMJWcDLSKAT1B+Q8z2ndVaDQYwas=;
        b=nbLckOr5mLExI9XYaQgEkDMyrEwsX5HhpbhWsqABZYWe3ssG9EFV85rQDH5Agt3f9h
         /jYoPZTPSoyHTLbwL+6ej5yaTJiU5gv/yqvVKMpJDLMy4uxWLg9cCMZfANQZvIr6+6Rf
         nCL8aMuzgvaiaSDKBQNfJ3hgbt0pMsslXexNoIv3XW6/p5P4fauSIArkfQuVaEajkmMi
         d8fUe7/8M2su6iv+DKJZg2pz7IvZqMziiqaya8u78zWHzjFIulWaeO/IEa0cc9Dgx6k3
         VgEUcahy9v5FOQp7wa8+GDric7xv67lDwnprYOFkU0t5xJs+nKLm+R8BV1VDEGkgsaU1
         K0+w==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1777975758; x=1778580558;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=uhallVX0Ytq91OQAMJWcDLSKAT1B+Q8z2ndVaDQYwas=;
        b=L1IK7dVV02QfjVojT0hmeU4tqgGnDDno/vdr6vomvX50FnP9m1x6wIIWmzBGfTbJUm
         495xGvqkisGZoQwF2LEWi4MHbku6pZYh0jASqBVnrWzNTFgier6mSc9o1Ek0h8kUrwDw
         PHt+TwoHXrUAb/v8F/FyWc5+vimD1Wo/3hYzxbvM3CQBP8Iy0oS4cX2jzxoVAqkbQttU
         xNN8S4olQ47/XgCbS96tiyAjOSbJsbo8j3+7ywpnW7YrycQODt5T7qV/XS3Zzito5Ei2
         0JZ6lc+Ttl0e+nDTKmhslMCQsqTfuq2mkJJ63DfZP7a2yWQHPi2JomJqzE/PRND/u2uL
         xxIg==
X-Forwarded-Encrypted: i=1; AFNElJ+MQ3dttZEE7MDo/1qT4/sEQpETNMZokZBOpVRJ4km/Td/YXOqwY/zFzdO+jn1tfLEuD/jhS2DVEAcF@vger.kernel.org
X-Gm-Message-State: AOJu0YzRFNsN4NoqgWWL1WeODuNoxxHwPt3GlLBs7MAdBKis2XYCIqCa
	T5fXXDsveEMFgiwBl245PT3GwlykMWL39HGWBDLwL2uS6Lb1D3wLAcQm
X-Gm-Gg: AeBDievfQFt7+uKqNzGXEbi5Nx9vy+LypdADw6p81EOlKVIEbAYd1XzF2UXmjpcu4tE
	1VK5T1/xYhnXEEXqmPpm9F5UZMPCH8cbgoyKtMmWUks0CqW0uuHcEuAM8mI1pH4nxX3TEdMf5Zu
	niLzAOtmfzsyjQFQoq5bZs8Y0W1pH2EmLt9LdA3cus/DT4RD4DZg8aYKBCaaW2Wr8sR2hr8bqhJ
	MzLc+X3mc6aweWh9K+Z9opy3bcCfn1GbX3LVeFGC7NZRj/sHL4Zp5PJLJ+NqISNUYmBW4dy+fzQ
	O6L1FqqeTNIsFyjgKYbWbqTnCAYZkoBwDbbVm85wHpOWpKAe2pifhkemFxJ97qdlwZrWPI0wjmT
	BWM6Ma6ndr1pjFthwPcfV6wtpW9TUd5RjFjw9FZIZR451hyl6r58p9h9fzF/2BdfeCBdhr0NmJo
	HFcoTGQlcBIGNrWF6suOdb3vH2mI9Zy1VCv7qA67nMoqyf/9NFQ8agPEEYz+w1VGJTae9ovzeZo
	Qane74SiqU=
X-Received: by 2002:a17:90a:ec86:b0:35f:bd29:75b9 with SMTP id 98e67ed59e1d1-3650cee7ca6mr13002143a91.22.1777975758250;
        Tue, 05 May 2026 03:09:18 -0700 (PDT)
Received: from chaitanya-virtualbox.. ([103.249.241.52])
        by smtp.gmail.com with ESMTPSA id 98e67ed59e1d1-36575df7ab8sm1458869a91.1.2026.05.05.03.09.15
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 05 May 2026 03:09:17 -0700 (PDT)
From: Chaitanya Sabnis <chaitanya.msabnis@gmail.com>
To: andi.shyti@kernel.org,
	wsa@kernel.org,
	anders.berg@lsi.com
Cc: robh@kernel.org,
	krzk+dt@kernel.org,
	conor+dt@kernel.org,
	linux-i2c@vger.kernel.org,
	devicetree@vger.kernel.org,
	linux-kernel@vger.kernel.org,
	Chaitanya Sabnis <chaitanya.msabnis@gmail.com>
Subject: [PATCH] dt-bindings: i2c: convert axxia i2c to dt-schema
Date: Tue,  5 May 2026 15:38:54 +0530
Message-ID: <20260505100854.5258-1-chaitanya.msabnis@gmail.com>
X-Mailer: git-send-email 2.43.0
Precedence: bulk
X-Mailing-List: devicetree@vger.kernel.org
List-Id: <devicetree.vger.kernel.org>
List-Subscribe: <mailto:devicetree+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:devicetree+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

Convert the LSI Axxia I2C Controller bindings from legacy text
format to modern dt-schema (YAML).

During the conversion, the obsolete `device_type = "i2c"` property
was dropped from the example, as it is deprecated and not utilized
by the driver. The `clock-names` property is enforced as required
matching the driver probe behavior. The example node address was
also updated to a standard 32-bit address.

Signed-off-by: Chaitanya Sabnis <chaitanya.msabnis@gmail.com>
---
 .../devicetree/bindings/i2c/i2c-axxia.txt     | 30 -----------
 .../devicetree/bindings/i2c/lsi,api2c.yaml    | 52 +++++++++++++++++++
 2 files changed, 52 insertions(+), 30 deletions(-)
 delete mode 100644 Documentation/devicetree/bindings/i2c/i2c-axxia.txt
 create mode 100644 Documentation/devicetree/bindings/i2c/lsi,api2c.yaml

diff --git a/Documentation/devicetree/bindings/i2c/i2c-axxia.txt b/Documentation/devicetree/bindings/i2c/i2c-axxia.txt
deleted file mode 100644
index 7d53a2b79553..000000000000
--- a/Documentation/devicetree/bindings/i2c/i2c-axxia.txt
+++ /dev/null
@@ -1,30 +0,0 @@
-LSI Axxia I2C
-
-Required properties :
-- compatible : Must be "lsi,api2c"
-- reg : Offset and length of the register set for the device
-- interrupts : the interrupt specifier
-- #address-cells : Must be <1>;
-- #size-cells : Must be <0>;
-- clock-names : Must contain "i2c".
-- clocks: Must contain an entry for each name in clock-names. See the common
-  clock bindings.
-
-Optional properties :
-- clock-frequency : Desired I2C bus clock frequency in Hz. If not specified,
-  the default 100 kHz frequency will be used. As only Normal and Fast modes
-  are supported, possible values are 100000 and 400000.
-
-Example :
-
-i2c@2010084000 {
-	compatible = "lsi,api2c";
-	device_type = "i2c";
-	#address-cells = <1>;
-	#size-cells = <0>;
-	reg = <0x20 0x10084000 0x00 0x1000>;
-	interrupts = <0 19 4>;
-	clocks = <&clk_per>;
-	clock-names = "i2c";
-	clock-frequency = <400000>;
-};
diff --git a/Documentation/devicetree/bindings/i2c/lsi,api2c.yaml b/Documentation/devicetree/bindings/i2c/lsi,api2c.yaml
new file mode 100644
index 000000000000..2d1c3069c3a3
--- /dev/null
+++ b/Documentation/devicetree/bindings/i2c/lsi,api2c.yaml
@@ -0,0 +1,52 @@
+# SPDX-License-Identifier: (GPL-2.0-only OR BSD-2-Clause)
+%YAML 1.2
+---
+$id: http://devicetree.org/schemas/i2c/lsi,api2c.yaml#
+$schema: http://devicetree.org/meta-schemas/core.yaml#
+
+title: LSI Axxia I2C Controller
+
+maintainers:
+  - Anders Berg <anders.berg@lsi.com>
+  - Chaitanya Sabnis <chaitanya.msabnis@gmail.com>
+
+allOf:
+  - $ref: /schemas/i2c/i2c-controller.yaml#
+
+properties:
+  compatible:
+    const: lsi,api2c
+
+  reg:
+    maxItems: 1
+
+  interrupts:
+    maxItems: 1
+
+  clocks:
+    maxItems: 1
+
+  clock-names:
+    const: i2c
+
+required:
+  - compatible
+  - reg
+  - interrupts
+  - clocks
+  - clock-names
+
+unevaluatedProperties: false
+
+examples:
+  - |
+    i2c@10084000 {
+        compatible = "lsi,api2c";
+        reg = <0x10084000 0x1000>;
+        interrupts = <0 19 4>;
+        clocks = <&clk_per>;
+        clock-names = "i2c";
+        clock-frequency = <400000>;
+        #address-cells = <1>;
+        #size-cells = <0>;
+    };
-- 
2.43.0

