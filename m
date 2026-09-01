Received: from mail-ed1-f54.google.com (mail-ed1-f54.google.com [209.85.208.54])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id B9A5239768C
	for <devicetree@vger.kernel.org>; Tue,  1 Sep 2026 12:58:31 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.208.54
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1788267513; cv=none; b=juJu8M62nZEazFgR/KfvugfcCto1Aw981OABM1gaZvT8rOJB9z51P8+TMQkPBZ3j9ZnmbE6VkGdg1D9oQe7eTnSB1HzqfZ05yXwz6HoqDeRPnmPLIeohOBzKClP0eXiJxWFYPFzt6vlGetOsYyc+l3b6ADwjG33tRn8lAmvSJ5M=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1788267513; c=relaxed/simple;
	bh=Xb89+qyq0qoc5FkJnBf9sbTQo5MzEBRB/z4KxpjpIKE=;
	h=From:To:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version; b=M8hjuUo+hdvspN3iHYfQ5Cnm/Is6Uvo5aFcDo9bqSaXJ0MllfLTZRXVzT92qX3jtsZkV/ivE+lm8Ovp6ryLGauU1Gax7EA6Ca9vRoFFNcJu26icQ18gXPt3orweeEfzoaCylCsOtEapJOxHvHInYzJRbyyHdm2bYfvAMvDH9T74=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=ZSdNPJGU; arc=none smtp.client-ip=209.85.208.54
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="ZSdNPJGU"
Received: by mail-ed1-f54.google.com with SMTP id 4fb4d7f45d1cf-6a60f0dbeccso6372399a12.0
        for <devicetree@vger.kernel.org>; Tue, 01 Sep 2026 05:58:31 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1788267510; x=1788872310; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:to:from:from:to:cc:subject:date:message-id
         :reply-to:content-type;
        bh=3SoUapY3IA8tD1+b3WHVHM5822Ty391/3XnWQKi5WWU=;
        b=ZSdNPJGUON7n8OC1/kjKo3AzL0+/MxY9XRn4T0wlGcPKXlCXsF8qFTsGaWAc350eOq
         aG6k3Hu5e05ZARikn80BQYj1rW5sz73IScq9QMPl3YRSTkYqySvnI0RMnttf+bkJXpp7
         TuAoZJAxLy8kTfRfXLa5v0cB+gO0ElR2AlkjoBkYvosEyObRmhXIA9xGgqoKwlGOQuix
         br3pNxcGYITaYaq123pj0EIsY5GlibNooE69QWS1PY26olaZrPyptTrYREgSzJPfWc4e
         /+/gFfeP2URBTQCxROi+RVhPXAYYucq19WI9PzGto9P0QI/CAXEk9DpuKzZ5B4QIXZJm
         +I3A==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1788267510; x=1788872310;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:to:from:x-gm-gg:x-gm-message-state:from:to
         :cc:subject:date:message-id:reply-to:content-type;
        bh=3SoUapY3IA8tD1+b3WHVHM5822Ty391/3XnWQKi5WWU=;
        b=BD22ZzvIlalcQ/f9nusG24Ciz0zCM4Q6B6p56yqqq8o0QHzIbKd2msOle7QYOmDZOd
         P58vBm6IFw7DxYMpgm2PY0PxIdX+lvsZR6p0sS+5lPy4ykQr1KGdiwTytwbNVfd17z2m
         8RzqncuN82IlmAoUzUA3vfo/h0pq8HRRoGAeuCqVVrgHUjW8vT9BLK0k/UqCVPf3IBuu
         hmV/e1/RRoXE8O3ROwdbYheZEYAca0DdfVIdBB6Wqm+N015oBn4eCdR1pCVugaTZGavi
         y2rGubcojhnwSJ4QroOEO+1Go2iHuP8luVsbZBRdblwOVHgw4WYYK0TonwlhxVq/T2ff
         +DOg==
X-Forwarded-Encrypted: i=1; AKwUvBwhHnAdNlWR2E4U2NysfyA3jQlH03QRGnvFUccp0FTtl4ezgL2yvpOMQovzJfk+G8F7RT+HwPMyUQqe@vger.kernel.org
X-Gm-Message-State: AFuF++laR/Lc1IF1dI7L/bin20sUmnt8uc30QEEurbj55quhpJvcfJf2
	HuYdNE8z8sajwSRmMMjxQLaXXmTBA9nmWeifir+/6EkSiBN1HcI9jBEZ
X-Gm-Gg: AYBFou3RHhKOzWsKQL4TiP30AkUI4TGfq49PE9jzJMpDMh74faHyhdwk0qIWjRsgmrV
	nAmJEbC4h/Z7BDZlcD58M+shpF1QP8If5BSAZ5iAumuWf0N0nEosHF9Hwu4oFBJuwI1orBfXO3D
	fw9txN0B5GegdVoQX9R812/gosEjMmGN18+JswCYCP3qjxkrkGaAJYJ8QqBZGToELbKPo2kj+pt
	7aTImUOkQzak8WY7TQb2xFL+NvFKbPR/fYLfYUL/gq/GBFpWCB4UFGUF11q0xymYamE5SyPN7cu
	8Y1ZQN7BLZ2VWaV1XCnik+QL1ifLdCyfsCFPEOWKJ3zZynFxtKPKj58E7tsFHG7CqGelbFQLd6X
	hTUQLjigy8ysjodvPpkxHFITbMFnxzdus9qa8ScEXOdljNdwUJBuFDr2RuRbmI4faJ8YvvpCW57
	xn+7HaNP7h8/icrSzHmktv3cueM9D2370d0Wa2OyFvSv72NH8xWlMt2svLwbd1EyLXbs5r8+0oY
	7R73JNJC7ZzzW0mQ1qiSpGCR5P+TeikYFnMWdzTk8xF7dRLOhb+kwCvprfQf2k=
X-Received: by 2002:a05:6402:5048:b0:6a6:32f9:d7cd with SMTP id 4fb4d7f45d1cf-6a632f9d943mr12264712a12.18.1788267509677;
        Tue, 01 Sep 2026 05:58:29 -0700 (PDT)
Received: from Ansuel-XPS24.localdomain (host-79-26-252-140.retail.telecomitalia.it. [79.26.252.140])
        by smtp.googlemail.com with ESMTPSA id 4fb4d7f45d1cf-6a66d15d10asm773959a12.28.2026.09.01.05.58.28
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 01 Sep 2026 05:58:28 -0700 (PDT)
From: Christian Marangi <ansuelsmth@gmail.com>
To: Christian Marangi <ansuelsmth@gmail.com>,
	Vinod Koul <vkoul@kernel.org>,
	Neil Armstrong <neil.armstrong@linaro.org>,
	Manivannan Sadhasivam <mani@kernel.org>,
	Rob Herring <robh@kernel.org>,
	Krzysztof Kozlowski <krzk+dt@kernel.org>,
	Conor Dooley <conor+dt@kernel.org>,
	linux-arm-kernel@lists.infradead.org,
	linux-phy@lists.infradead.org,
	devicetree@vger.kernel.org,
	linux-kernel@vger.kernel.org
Subject: [PATCH v3 1/2] dt-bindings: phy: airoha: Document support for AN7583 Gen3 PCIe PHY
Date: Tue,  1 Sep 2026 14:58:17 +0200
Message-ID: <20260901125819.20378-2-ansuelsmth@gmail.com>
X-Mailer: git-send-email 2.53.0
In-Reply-To: <20260901125819.20378-1-ansuelsmth@gmail.com>
References: <20260901125819.20378-1-ansuelsmth@gmail.com>
Precedence: bulk
X-Mailing-List: devicetree@vger.kernel.org
List-Id: <devicetree.vger.kernel.org>
List-Subscribe: <mailto:devicetree+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:devicetree+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

Document support for AN7583 PCIe PHY used to make the Gen3 PCIe port
work. Add the required register to configure the PCIe PHY and provide an
example for it.

Signed-off-by: Christian Marangi <ansuelsmth@gmail.com>
---
 .../phy/airoha,an7583-pcie-gen3-phy.yaml      | 65 +++++++++++++++++++
 1 file changed, 65 insertions(+)
 create mode 100644 Documentation/devicetree/bindings/phy/airoha,an7583-pcie-gen3-phy.yaml

diff --git a/Documentation/devicetree/bindings/phy/airoha,an7583-pcie-gen3-phy.yaml b/Documentation/devicetree/bindings/phy/airoha,an7583-pcie-gen3-phy.yaml
new file mode 100644
index 000000000000..a8ec5ac781cc
--- /dev/null
+++ b/Documentation/devicetree/bindings/phy/airoha,an7583-pcie-gen3-phy.yaml
@@ -0,0 +1,65 @@
+# SPDX-License-Identifier: (GPL-2.0 OR BSD-2-Clause)
+%YAML 1.2
+---
+$id: http://devicetree.org/schemas/phy/airoha,an7583-pcie-gen3-phy.yaml#
+$schema: http://devicetree.org/meta-schemas/core.yaml#
+
+title: Airoha AN7583 PCI-Express PHY
+
+maintainers:
+  - Christian Marangi <ansuelsmth@gmail.com>
+
+description:
+  The PCIe PHY supports physical layer functionality for PCIe Gen2/Gen3 port.
+
+properties:
+  compatible:
+    const: airoha,an7583-pcie-gen3-phy
+
+  reg:
+    items:
+      - description: PCIE G3 analog base address
+      - description: PCIE G3 PMA base address
+      - description: PCIE detection time base address
+      - description: PCIE Rx AEQ base address
+
+  reg-names:
+    items:
+      - const: g3-ana
+      - const: g3-pma
+      - const: xr-dtime
+      - const: rx-aeq
+
+  phys:
+    items:
+      - description: phandle to QPHY phy for Gen2 support
+
+  "#phy-cells":
+    const: 0
+
+required:
+  - compatible
+  - reg
+  - reg-names
+  - phys
+  - "#phy-cells"
+
+additionalProperties: false
+
+examples:
+  - |
+    #include <dt-bindings/phy/phy.h>
+
+    phy@1fc7f000 {
+        compatible = "airoha,an7583-pcie-gen3-phy";
+        reg = <0x1fc7f000 0x1000>,
+              <0x1fc7e000 0x1000>,
+              <0x1fc30044 0x4>,
+              <0x1fc35030 0x4>;
+        reg-names = "g3-ana", "g3-pma",
+                    "xr-dtime", "rx-aeq";
+
+        phys = <&pcie1_phy PHY_TYPE_PCIE>;
+
+        #phy-cells = <0>;
+    };
-- 
2.53.0

