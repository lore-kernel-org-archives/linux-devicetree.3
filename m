Received: from mail-wr1-f53.google.com (mail-wr1-f53.google.com [209.85.221.53])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 5E5304519A2
	for <devicetree@vger.kernel.org>; Thu, 27 Aug 2026 13:16:07 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.221.53
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1787836581; cv=none; b=G1/eAOrtjYAsnr6bOVydPqa2BPhWbq5C3GNO6+YFoHtZZt1X1l5CUmlkDYMhPzyDOAsdeIvXRe8wcF4Ys9WQWGypqp/yOtZIaaI6RCf7MCKNNSZ2iRjRc/3kQIYtoZX4tMFZ0+HX3JmI3yZvkduWnk7HXzi/lAeD1qT4f6Y0mAc=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1787836581; c=relaxed/simple;
	bh=9uQY2oAxzu/a3z8lJZrMRZ6tlUX6yn5rLUtGT6ZfB9Y=;
	h=From:To:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version; b=HQ7Cz9kv6FcLq2XSIxGC6Q3QBtcuPYS34cR7fKtjtQxeU7nD8RXl2GobakuFDzA8dZqcxJEDfIuS7qWI9eT2W64vkUQ0n3NpjS/c5BJYoWgkfpFOMFCfTNXAtAVPUWXBh7AQH3drOciHb+uBi4UgGve2OK2PpUFa631jUjAVHC0=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=A/01fo9j; arc=none smtp.client-ip=209.85.221.53
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="A/01fo9j"
Received: by mail-wr1-f53.google.com with SMTP id ffacd0b85a97d-482dbc9a00bso676190f8f.1
        for <devicetree@vger.kernel.org>; Thu, 27 Aug 2026 06:16:04 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1787836562; x=1788441362; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:to:from:from:to:cc:subject:date:message-id
         :reply-to:content-type;
        bh=Ozh67gvExXsrnwoDUAZ22g3egdKS3V6pXOMWX1pqEkU=;
        b=A/01fo9jy/3KiYpjGqL5BX8JWBh6how8gDhsC5OEvwV52lOjx55xVl3uvp+L2KkLr7
         c742XsQe+nGsUsOzK2jyTUY8jdovD/QZaOZIjnaOeAWYH3ldm2fY11Qs+Qkw/AuWbXAM
         0nttYsfNRUBEjoC8p3HW+ruMLqcNFuqZ8oIqtu+rZJ0Tg9CCB2HF9GHh76Rd0SlAEUDn
         K4cflZ1n8w5dtRuXkxIqMrbGsuaxsPOi79UipHxe3pYQJUSauxJIswckQG7qsgpUgVJI
         L9eBSTHqgGu8NQ5cM9fftAHocXUubT5+AyUcny7pW1G4rA/khjuuIXjSCKIHiKyb+TKq
         GbEw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1787836562; x=1788441362;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:to:from:x-gm-gg:x-gm-message-state:from:to
         :cc:subject:date:message-id:reply-to:content-type;
        bh=Ozh67gvExXsrnwoDUAZ22g3egdKS3V6pXOMWX1pqEkU=;
        b=PgH2yi66vwKLgdw+cRceGT+/qTGs2/wrndmhanINQJPA8PZ9bDZgvVsnaUH2C+KbOj
         tASNoQdWJJyQTgN3GN2Xzr8glBbEvZlYuGP7JbQ6GoWJdL6mVMCRJ5Qj3YL2mprq8Zi9
         CMykEQbKHQCDfI3r4K3+d6pAT+oTVvb3Ikl7vkr7/tLKkhGP8BduhAsWR1C/lNv8M65Z
         vkmmhZioCDb8QqJdeBzCaaBYoTenV5LIqht3KiRA/yhj7YDdLHCJjmB6zlVdlUOIyzzL
         ABnBUqfFGSd9duxZLk8C6M2z+zzEPXp/VI2eNwaMdBwDlDCb/mqzKh+mENYLy06Mo7yk
         oHrA==
X-Forwarded-Encrypted: i=1; AHgh+RrzZddLVE4+kUxbQzERq3WjdGXCEwqWS2nQ6vQizRdVNhmFmEkeQQPLEOmaVAi++qjCz8tMYF3ca2dl@vger.kernel.org
X-Gm-Message-State: AFuF++kwEKgc0uCJ+vvAV9cnJd+35ea7NBZrwdcHCepZthbAi3zdCs27
	8TpMD2URVbP/dtCuy/7yBABoE7l4HW5dlN6xNGbK05A5uG0Xb7S+dbDO
X-Gm-Gg: AR+sD10Wo7tbzv07Ijjg2MaTNK1mRzD8/Hpa+7aC1pHzx4NrrN4cpDP5RLxvzCxJ9cA
	bNH2G9caEwOCjHn5MrwK5ZxZtLrIa4zAwjXhzq//K3aV8eaKJzE6JB53IeJ4Qz1turhPTdlzR8n
	tU9YXTGD2yIF4Qy3icj4ns0+sagZHZ/Ynq2qmAOQOxzj7gd9rkxZ8ZXLfDFCXtfBkeiCfaL6HVe
	3BHNR/g6HUq42OlXKgVf69Rpahrzv9DeE9oiyeuy9XvTShctI7JOIo/penXDlE5/JsaZN5aS5Bc
	v/WWRxZ0B1XJvxMqSD0jwYW9HbJVirdtXOmTT62OjpQaSSfBVm8gjF7+WpRa6qUmKiEsdIFJDna
	9uXxD+3b0RueCCk7JISmnwjhU97/+TKTC3Zlo5xwMSDL5JztivSn6A3/eHFoY80y72HerzsDKns
	4VvEE7I06tDeiQ9WzXy3zzUJU5bsKoVInkbEzXSOnBGQUMoDuPQ19351ee59agfSwov9TRY8bRy
	sXNuuWktG2Iy5CcvZHcLKG3fZwd35v/GYUHam5g8Hp86G4tAFRN
X-Received: by 2002:a05:6000:4305:b0:481:5dea:c014 with SMTP id ffacd0b85a97d-482eabb5cc6mr8398077f8f.14.1787836561549;
        Thu, 27 Aug 2026 06:16:01 -0700 (PDT)
Received: from Ansuel-XPS24.localdomain (host-79-26-252-140.retail.telecomitalia.it. [79.26.252.140])
        by smtp.googlemail.com with ESMTPSA id ffacd0b85a97d-482e28dc3f5sm9367192f8f.21.2026.08.27.06.16.00
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 27 Aug 2026 06:16:01 -0700 (PDT)
From: Christian Marangi <ansuelsmth@gmail.com>
To: Vinod Koul <vkoul@kernel.org>,
	Neil Armstrong <neil.armstrong@linaro.org>,
	Rob Herring <robh@kernel.org>,
	Krzysztof Kozlowski <krzk+dt@kernel.org>,
	Conor Dooley <conor+dt@kernel.org>,
	Christian Marangi <ansuelsmth@gmail.com>,
	linux-phy@lists.infradead.org,
	devicetree@vger.kernel.org,
	linux-kernel@vger.kernel.org
Subject: [PATCH v3 2/3] dt-bindings: phy: airoha: Document support for AN7583 Gen2 PCIe PHY
Date: Thu, 27 Aug 2026 15:15:46 +0200
Message-ID: <20260827131551.26725-3-ansuelsmth@gmail.com>
X-Mailer: git-send-email 2.53.0
In-Reply-To: <20260827131551.26725-1-ansuelsmth@gmail.com>
References: <20260827131551.26725-1-ansuelsmth@gmail.com>
Precedence: bulk
X-Mailing-List: devicetree@vger.kernel.org
List-Id: <devicetree.vger.kernel.org>
List-Subscribe: <mailto:devicetree+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:devicetree+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

Document support for AN7583 Gen2 PCIe PHY used to make the Gen2 PCIe port
work. Add the required register to configure the PCIe PHY and provide an
example for it.

Similar to the USB 3.0 PHY, a dedicated phys property is required to
configure the serdes for PCIe or Ethernet usage.

Signed-off-by: Christian Marangi <ansuelsmth@gmail.com>
---
 .../phy/airoha,an7583-pcie-gen2-phy.yaml      | 63 +++++++++++++++++++
 1 file changed, 63 insertions(+)
 create mode 100644 Documentation/devicetree/bindings/phy/airoha,an7583-pcie-gen2-phy.yaml

diff --git a/Documentation/devicetree/bindings/phy/airoha,an7583-pcie-gen2-phy.yaml b/Documentation/devicetree/bindings/phy/airoha,an7583-pcie-gen2-phy.yaml
new file mode 100644
index 000000000000..f31d838871fc
--- /dev/null
+++ b/Documentation/devicetree/bindings/phy/airoha,an7583-pcie-gen2-phy.yaml
@@ -0,0 +1,63 @@
+# SPDX-License-Identifier: GPL-2.0-only OR BSD-2-Clause
+%YAML 1.2
+---
+$id: http://devicetree.org/schemas/phy/airoha,an7583-pcie-gen2-phy.yaml#
+$schema: http://devicetree.org/meta-schemas/core.yaml#
+
+title: Airoha AN7581 SoC PCIe Gen2 PHY
+
+maintainers:
+  - Christian Marangi <ansuelsmth@gmail.com>
+
+description: >
+  The Airoha AN7583 SoC PCIe Gen2 PHY describes the PCIe PHY for the
+  Gen2 PCIe controller.
+
+  This PCIe PHY makes use of a dedicated USB PHY for PCIe usage and
+  can also be used for Ethernet usage for SGMII or HSGMII mode.
+
+properties:
+  compatible:
+    const: airoha,an7583-pcie-phy
+
+  reg:
+    items:
+      - description: ana register
+      - description: pma register
+      - description: dig register
+
+  reg-names:
+    items:
+      - const: ana
+      - const: pma
+      - const: dig
+
+  phys:
+    items:
+      - description: phandle to Serdes PHY
+
+  '#phy-cells':
+    const: 0
+
+required:
+  - compatible
+  - reg
+  - reg-names
+  - phys
+  - '#phy-cells'
+
+additionalProperties: false
+
+examples:
+  - |
+    phy@1fa5f000 {
+        compatible = "airoha,an7583-pcie-phy";
+        reg = <0x1fa5f000 0xff>,
+              <0x1fa5e000 0x3ff>,
+              <0x1fa5a000 0x8ff>;
+        reg-names = "ana", "pma", "dig";
+
+        phys = <&serdes_phy>;
+
+        #phy-cells = <0>;
+    };
-- 
2.53.0

