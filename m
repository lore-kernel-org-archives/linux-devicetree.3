Received: from mail-wr1-f49.google.com (mail-wr1-f49.google.com [209.85.221.49])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 86E643A7F54
	for <devicetree@vger.kernel.org>; Tue,  1 Sep 2026 12:39:48 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.221.49
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1788266390; cv=none; b=b0cu6ynoUgUVyXvYaYxETNgH/69FJ6Tq4+cag+MxQgVoFX5oP8S5I957hSQw59NuQIxE9LYdiEg3fAsrGd27sETsgzSjUUv8FDZqe3BRTPb6hwlTbJwCZ8+dWDByD4jMx6VTeePsDeEAlqALuPEpzcwhk0U8VrPgFiZ3v4b1sJs=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1788266390; c=relaxed/simple;
	bh=HZaY6x6GPhHYibc098Whc4/fjwrAqZCS9AacbYwOBOw=;
	h=From:To:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version; b=mDiOFlg3i7SQuXL7vFJcOePJL5X6wcGF/rYHHld+tkefSu4DsWdSACDlbc8DLWF6IlL857OxwBQWHTKtEe5qCqn141GhCfRTXTguI2wWx4zYdp2ZoWfTDf+VdMW/du4ZonQ4zG33oHuTAzlrVIuzMIdDrvGEZQJHEWd/JfhGFW4=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=Xjs37Y0o; arc=none smtp.client-ip=209.85.221.49
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="Xjs37Y0o"
Received: by mail-wr1-f49.google.com with SMTP id ffacd0b85a97d-4843750de83so558480f8f.1
        for <devicetree@vger.kernel.org>; Tue, 01 Sep 2026 05:39:48 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1788266387; x=1788871187; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:to:from:from:to:cc:subject:date:message-id
         :reply-to:content-type;
        bh=PSi1RxUH1oU6vn8Qf+5AgLaeRjmhNUBH22lgQsnU2Us=;
        b=Xjs37Y0oJpsa2OoVVyeftPzD4HKcODC1cR+CDWIBVZDvqSrvwkwyLt7ER/Zi5RXpsl
         CwvxD2Yp2btlg7bPjbKn6DwUn5hCS3aau5pWGEyKL/2u4bsUL51E/dhzQoiUFz+51Dlf
         m4ZkC/I/bXLeZNQL3vWoT/UiONUa4c5aisH9h0U6sO/J3YH+TwQnMxpu/phKRqQFphJv
         8zlMJ3MNDIEX8IOd1HPO0r+DRDJg+idm+/taGmvZbBtK1wk6DD3WQzMZgICFS5t4NWhE
         ab5WaE4I9GUMgqk7JSAMriZG5J4o+EFCs5xlYpuM/3pEr63xS84gHY6nMAqNe3sS4uF6
         ikQA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1788266387; x=1788871187;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:to:from:x-gm-gg:x-gm-message-state:from:to
         :cc:subject:date:message-id:reply-to:content-type;
        bh=PSi1RxUH1oU6vn8Qf+5AgLaeRjmhNUBH22lgQsnU2Us=;
        b=eGBEV3sB5P3n4CjT6rweTlizxPZeRdMxV4hX38YtV/TRTiSxoIotKPjr2OrdpsMvhi
         brVxGmnJFPnONWFOSMUpQJJfkgjUHj5saG2/KNQavuymUYpRbSA1Zk8FqEenzvJc6DPN
         ghrdjFG8GlXPC4je/UTkg0UpeujvErYjghQvTc1GPXWBX5Pc/3i15ozHQ/DvsAsMmRKA
         yxmDn1FlDLeAoAxL+DgmnUbO5b1OogKyzcIDxGdIE3Ijpseg/xS7VrtA6v7gjUTLZlhh
         Uwpii+XkUiMC7ushmyP/QpJsdMytepgbN5o34ykcmKVD7ykto/D5VrsthRr+L4FdcfY/
         e38Q==
X-Forwarded-Encrypted: i=1; AKwUvBzq9CmFmWIhRPFTktsh0dDEI8hcCQ8UM9q+9x9AiqhOhr7DF7Da2bjCIcymEFtSxwV+CxxbloRWtzmQ@vger.kernel.org
X-Gm-Message-State: AFuF++mBTdLHHuVaKyjBHV9sbxN5sXRRr6YyIF9VD0v2T/l6VUY/BO+b
	3VVGd2tKbZz7Wuo1haGWZ5+pMfGdKGf3oPWxQxmD1ObInACn0HboMplM
X-Gm-Gg: AYBFou3dHvUtItcOZyPKD6WNR8YX5h6b3iHM08YzneUyT03eJA/jU2Sx68qAAL79BrG
	80NDrv1K9yTfv5/GwOsohm4Wvhw7H5LDKCrmJ2vrSiE2gLhTma5kxOEKLvJHFP4KPeFYTc4TLal
	t82JpVFoMmyoFGoYrvcLDWn5obIefC8lkhU2Vw4me/D7UTI+5srLpWqBnpFJw0Ur8QNy/N8smtM
	/5lMlcpQHhas5oaaQ+H7p8LShXPctXTIW2KA4KggC4nVaexY2ZZLPkbRW4rEw6JH6G96AJnq7jQ
	NyO9/RCaodXvu68a4hNMOy8Ta4BXZ9HVjbwyRglwyTS/4RWuiichoPuEQKZjngtJ71HBRV10847
	yM6aUCk+YTv8R8+cSxx0whtkCkiBm87MpIgEVI7J/ZZJf7YnFLTO+EsA3Nr4js85VsuR/jC6cXn
	w1f9Xs6j07CztpEK/UAocZX7i8EdkOsOxUNR9269KeUPdHJZm8z2B0C/YG/xenDuovWAwcTBlOz
	JBVtKbw9cNhOEXowSw8w4md/F/xNYIexXtWJBuF/sHCMPmTl967Kg==
X-Received: by 2002:a5d:54c6:0:b0:47f:4919:d5b2 with SMTP id ffacd0b85a97d-48440fcee78mr11971287f8f.1.1788266386406;
        Tue, 01 Sep 2026 05:39:46 -0700 (PDT)
Received: from Ansuel-XPS24.localdomain (host-79-26-252-140.retail.telecomitalia.it. [79.26.252.140])
        by smtp.googlemail.com with ESMTPSA id ffacd0b85a97d-48442d3d2eesm4644130f8f.15.2026.09.01.05.39.45
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 01 Sep 2026 05:39:45 -0700 (PDT)
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
Subject: [PATCH v4 2/3] dt-bindings: phy: airoha: Document support for AN7583 Gen2 PCIe PHY
Date: Tue,  1 Sep 2026 14:39:32 +0200
Message-ID: <20260901123933.15388-3-ansuelsmth@gmail.com>
X-Mailer: git-send-email 2.53.0
In-Reply-To: <20260901123933.15388-1-ansuelsmth@gmail.com>
References: <20260901123933.15388-1-ansuelsmth@gmail.com>
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
index 000000000000..424da3c5ad01
--- /dev/null
+++ b/Documentation/devicetree/bindings/phy/airoha,an7583-pcie-gen2-phy.yaml
@@ -0,0 +1,63 @@
+# SPDX-License-Identifier: GPL-2.0-only OR BSD-2-Clause
+%YAML 1.2
+---
+$id: http://devicetree.org/schemas/phy/airoha,an7583-pcie-gen2-phy.yaml#
+$schema: http://devicetree.org/meta-schemas/core.yaml#
+
+title: Airoha AN7583 SoC PCIe Gen2 PHY
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
+    const: airoha,an7583-pcie-gen2-phy
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
+        compatible = "airoha,an7583-pcie-gen2-phy";
+        reg = <0x1fa5f000 0x100>,
+              <0x1fa5e000 0x400>,
+              <0x1fa5a000 0x900>;
+        reg-names = "ana", "pma", "dig";
+
+        phys = <&serdes_phy>;
+
+        #phy-cells = <0>;
+    };
-- 
2.53.0

