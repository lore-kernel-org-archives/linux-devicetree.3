Received: from mail-pg1-f182.google.com (mail-pg1-f182.google.com [209.85.215.182])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 99A6A3F86E0
	for <devicetree@vger.kernel.org>; Tue,  7 Jul 2026 12:54:01 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.215.182
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1783428842; cv=none; b=C50jbKA6VD6EMc1+mw8te6eNZPSoPGkr9Al8HObFl2Q9L6q6MgdCXa04NEy1EPvKe15F+Mia3u8RilH7DcD1LczwpjukET58Zc7WQr3Nl00WQEuIHJKFWQGW3UuZoVPl2kIyhoKmhKVQBXBmOZZZ51zzreRBCaJTiH8QNM/sMz0=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1783428842; c=relaxed/simple;
	bh=EjuF0ELSTrkiKLRleI4uqXD1+TO9XfuqJzol5iOj13I=;
	h=From:To:Cc:Subject:Date:Message-Id:In-Reply-To:References:
	 MIME-Version; b=cp7+Mc2KcJTr+ctgglXt9q4ihCPT7pDmgzXOejFdnV80WCMji4iXgKj/jlHqFG7BOAEmiSwVG5vh5YWv8OLsk6/1wXQ939IMJMtqtvWMxXuYx9DaX8S7g99u+7Hppu6zMO6iRuNIX3gAm4W1QC5hrYoqZksw9wU6amC7Twt/UWE=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=vayavyalabs.com; spf=pass smtp.mailfrom=vayavyalabs.com; dkim=pass (1024-bit key) header.d=vayavyalabs.com header.i=@vayavyalabs.com header.b=ZDvgTNc7; arc=none smtp.client-ip=209.85.215.182
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=vayavyalabs.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=vayavyalabs.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=vayavyalabs.com header.i=@vayavyalabs.com header.b="ZDvgTNc7"
Received: by mail-pg1-f182.google.com with SMTP id 41be03b00d2f7-c96c92c0980so2328718a12.3
        for <devicetree@vger.kernel.org>; Tue, 07 Jul 2026 05:54:01 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=vayavyalabs.com; s=google; t=1783428841; x=1784033641; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=4kx3Zw6tOxJTm94LnN99zbJzvwBuruxhjYqu5k+0DmQ=;
        b=ZDvgTNc7AXADVIryCnfao0uaYwi+vfpLKcUKasaKRNtibJtd9RdsgX8yUShX02TLd6
         TXvI3t30AGI+gO3OA8EOfXa+DtbPNmbxGpp+4xTKSkwo40dd5n6g1lbSD05AQJ7QZZxJ
         lotUIe2WEVnDf8ynz7V0p/LdDrE68GI5CYz7g=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1783428841; x=1784033641;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to:content-type;
        bh=4kx3Zw6tOxJTm94LnN99zbJzvwBuruxhjYqu5k+0DmQ=;
        b=GEiDiyA6Svo+KQGIlXk1Wah6gtTQX+u7PlNdCVQFqIiyUmjC9nFYNZa4gvlGVnte12
         d9LwFrJT+upZlCWTx5yJ03Ve5yf147SYUezj8n+l+fXtcnBoqAJqQ6aocCNSaMHl03Ir
         IodpqRCDVEBrSn5JczXgWQX/idvszCrPiUmxy1fXo5AwN9vBW2OkiMqMusf4Gbrjh4wy
         3h37PY8RDLM38b13657NZmHufPRGqfIwIOlZ9J4YvAJG7fI5iRsb0BbFCds9abDA0rH5
         wpVzkLBr0gG3Wn6jCRDwzdvYcmFnChniB/WCGjhmOh7r+n/MQM1MmKcZtUp6awV2qJlb
         Vl4w==
X-Forwarded-Encrypted: i=1; AHgh+RowzqvofyNlm+zPYm++uYdKvHPntogAMtrHnWTt1MUnD7UV8dSEoSnPnRhFNSStiemwceKI/oSet5Qz@vger.kernel.org
X-Gm-Message-State: AOJu0YyYsp2BMbnidpC9wZTYcxHmgMbatDU3fSkkphfuiSiZD4EVstkN
	8uUbgW1jczhZmUxrn43jOs3jOwNceDeINVWgj20dDSHvZ6lKOYbvQrz7nOyOeYy6Rw8=
X-Gm-Gg: AfdE7cnITu9EWirVl7YBMLRJYahxx6j2PJqwSys89YII+dCZKEnw/jYvDMAauP2OUow
	xC0fTfeGjPS+1U6v2IAz60+gnZ9qLnA4R8rpl9JcqRCsNFz2nw1XFzi412uP0joHihvI3n6v7oX
	S6EIge7b04DSnKwDLoiUeXPLjJXIp9SgZkXz/WxmXrVA9T6/+bVRI90AsI3/iHFBmiSU5iUay77
	asYwW3ZRSIzKLrizIozSNx1APKQA7Wxr5l9MALC/QnZkXXnZPMWLqs9jdvWi3bxqWBp/g6OHf4Q
	wpftulvjlmhflnnrkkE8cRHCaC39LzbjgLET9+wQuKQDDgQ0lStujoF4OAAdhWIQEAW9wvckjbO
	B93t2vvFIy1oa74hq/1+VHIIuTXxaiyKfPMXAGo+Ja5hCvMHo4074P5wJl7iq1hgeQZJy7MZ1hX
	EMpwC/eRTVnSOspTRBYAdQ3y4hoIn4G57Sfo5xl5pe+XM0xvbjW9oiqNWDT/p2JF7evVL3n2Dn6
	mf/CGHZOgSelD6tqD/hsAYWIcAOPJIeXgGK0k//qGiO75BBzeYJtxwuoxXl/aYBEdM=
X-Received: by 2002:a05:6a21:62cc:b0:3b3:241f:66c6 with SMTP id adf61e73a8af0-3c08edb777emr6445113637.26.1783428841051;
        Tue, 07 Jul 2026 05:54:01 -0700 (PDT)
Received: from localhost.localdomain ([103.108.57.9])
        by smtp.gmail.com with ESMTPSA id a92af1059eb24-13b659fa13bsm7945671c88.15.2026.07.07.05.53.54
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 07 Jul 2026 05:54:00 -0700 (PDT)
From: Pavitrakumar Managutte <pavitrakumarm@vayavyalabs.com>
To: linux-crypto@vger.kernel.org,
	linux-kernel@vger.kernel.org,
	devicetree@vger.kernel.org,
	herbert@gondor.apana.org.au,
	robh@kernel.org
Cc: krzk@kernel.org,
	conor+dt@kernel.org,
	Ruud.Derwig@synopsys.com,
	rbannerm@synopsys.com,
	manjunath.hadli@vayavyalabs.com,
	adityak@vayavyalabs.com,
	navami.telsang@vayavyalabs.com,
	bhoomikak@vayavyalabs.com,
	Pavitrakumar Managutte <pavitrakumarm@vayavyalabs.com>
Subject: [PATCH v16 1/4] dt-bindings: crypto: Document support for SPAcc
Date: Tue,  7 Jul 2026 18:23:08 +0530
Message-Id: <20260707125311.2398031-2-pavitrakumarm@vayavyalabs.com>
X-Mailer: git-send-email 2.25.1
In-Reply-To: <20260707125311.2398031-1-pavitrakumarm@vayavyalabs.com>
References: <20260707125311.2398031-1-pavitrakumarm@vayavyalabs.com>
Precedence: bulk
X-Mailing-List: devicetree@vger.kernel.org
List-Id: <devicetree.vger.kernel.org>
List-Subscribe: <mailto:devicetree+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:devicetree+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

Add DT bindings related to the SPAcc driver for Documentation.
DWC Synopsys Security Protocol Accelerator(SPAcc) Hardware Crypto
Engine is a crypto IP designed by Synopsys.

Co-developed-by: Bhoomika Kadabi <bhoomikak@vayavyalabs.com>
Signed-off-by: Bhoomika Kadabi <bhoomikak@vayavyalabs.com>
Acked-by: Ross Bannerman <rbannerm@synopsys.com>
Signed-off-by: Pavitrakumar Managutte <pavitrakumarm@vayavyalabs.com>
Reviewed-by: Krzysztof Kozlowski <krzk@kernel.org>
Reviewed-by: Rob Herring (Arm) <robh@kernel.org>
---
 .../bindings/crypto/snps,dwc-spacc.yaml       | 50 +++++++++++++++++++
 1 file changed, 50 insertions(+)
 create mode 100644 Documentation/devicetree/bindings/crypto/snps,dwc-spacc.yaml

diff --git a/Documentation/devicetree/bindings/crypto/snps,dwc-spacc.yaml b/Documentation/devicetree/bindings/crypto/snps,dwc-spacc.yaml
new file mode 100644
index 0000000000000..fe33ea361a8e1
--- /dev/null
+++ b/Documentation/devicetree/bindings/crypto/snps,dwc-spacc.yaml
@@ -0,0 +1,50 @@
+# SPDX-License-Identifier: (GPL-2.0-only OR BSD-2-Clause)
+%YAML 1.2
+---
+$id: http://devicetree.org/schemas/crypto/snps,dwc-spacc.yaml#
+$schema: http://devicetree.org/meta-schemas/core.yaml#
+
+title: Synopsys DesignWare Security Protocol Accelerator(SPAcc) Crypto Engine
+
+maintainers:
+  - Ross Bannerman <rbannerm@synopsys.com>
+
+description: |
+  The Synopsys DWC Security Protocol Accelerator (SPAcc), which is a
+  semiconductor IP designed to accelerate cryptographic operations,
+  such as encryption, decryption, and hashing.
+
+  In this configuration, the SPAcc IP is instantiated within the Synopsys
+  NSIMOSCI virtual SoC platform, a SystemC simulation environment used for
+  software development and testing. The device is accessed as a memory-mapped
+  peripheral and generates interrupts to the ARC interrupt controller.
+
+properties:
+  compatible:
+    items:
+      - const: snps,nsimosci-hs-spacc
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
+required:
+  - compatible
+  - reg
+  - interrupts
+
+additionalProperties: false
+
+examples:
+  - |
+    crypto@40000000 {
+        compatible = "snps,nsimosci-hs-spacc";
+        reg = <0x40000000 0x3ffff>;
+        interrupts = <28>;
+        clocks = <&clock>;
+    };
--
2.25.1

