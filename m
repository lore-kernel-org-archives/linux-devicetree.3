Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=209.85.221.48
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1793735425;
	b=Qba8VLJokIRO3ZQEiuvGTVdYN1BU4wW6kxoWcKIYYk3b1zGG38vpwvcqT+riqfrXqqBM
	 nsQ8EmmCYpVkbBppq4EvQxMXnzMtkB4MLCUwt8XynV53aso0nCnDMiOzSx9H3JVNl63Rn
	 5/P01MvdlExCloHE89CwHvlZjySUn66QR3SbhYsWaTvx7iY2YK+tH29njPcR1lNewpE6z
	 067Vsh1/HuIx2r5C+LRAP/fJlmsAlgxH6iGn5AYH3cTaZDGV31H1bXZtPK2Q3j/VuHCMC
	 spN5n/DdysSAdRqZdm8skISbQvjTxaf1m397uHqh/BqiiYV44jaeZ/64NqI1Amgt4oQ==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1793735425;
	h=DMARC-Filter:Received:DKIM-Signature:X-Google-DKIM-Signature:
	 X-Forwarded-Encrypted:X-Gm-Message-State:X-Gm-Gg:X-Received:Received:
	 From:To:Subject:Date:Message-ID:X-Mailer:In-Reply-To:References:
	 MIME-Version:Content-Transfer-Encoding;
	bh=J5xMolcA2jijade3hq2GliWPHkN3pbidlI2m81QLD6M=;
	b=Su0asolQyZyY7NRUtDhmpAu7A3yk5bR+B5NdzLQLYAr2yeIQ+XlSXNHImcCl9ZUCFziQ
	 hBU/J74iWSqBT9VslLnuPdy4gT5cDpkXqweOPDT4CuHFIsECKwaxAIolwF79OJgXmNbVL
	 agWmVuB8XBjb//nciQYAUOCeVN6PPRQlTvS/FAoV6ZHX6dcMDh1Nw33Q6xZHP0FxTUpdZ
	 ahxH/JNBk4wa1dFeHpOTBeWcMkUAY6dJ7GLH0HGS+Omisk6J9niTeLMtkAbrm3jOOqS8k
	 a2qyDzuZZsbgZ/4A0pFkMoYS+CO1CapcApnq7jJOX4xclreprtUEhI+J+HUPY64gL6Q==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=gmail.com;
	spf=pass smtp.mailfrom=gmail.com;
	dkim=pass header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20260707 header.b=ysKuAiBt;
	arc=none smtp.remote-ip=209.85.221.48
Received: from mail-wr1-f48.google.com (mail-wr1-f48.google.com [209.85.221.48])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 3DA0C606A33A
	for <devicetree@vger.kernel.org>; Tue,  3 Nov 2026 19:50:25 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org 3DA0C606A33A
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key, unprotected) header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20260707 header.b=ysKuAiBt
Received: by mail-wr1-f48.google.com with SMTP id ffacd0b85a97d-48e20ed3b9dso4022319f8f.2
        for <devicetree@vger.kernel.org>; Tue, 03 Nov 2026 11:50:25 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20260707; t=1793735424; x=1794340224; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:to:from:from:to:cc:subject:date:message-id
         :reply-to:content-type;
        bh=J5xMolcA2jijade3hq2GliWPHkN3pbidlI2m81QLD6M=;
        b=ysKuAiBt+W6nmfkqU8y5XGJKSO3ZL5DYe3tiPCeWCbpDn7lxzuB1JcIN3yVNuN8LAK
         +aRd8J+NHAq3jF669fCMTqfWL1Khtjgk/z/KHdyt9wlvGaE6JF2Z90cl2Z0as0GGSDUI
         qHZXbVDM/3Uk8qLFCVS90VIb1RG5zAggucft+MFP+SKjkHWcHUpuxRV7rSwFOZ6n9EHc
         NFubSNb7+tgaYjI23yv5NiwKsUVzVJ6N94VGPIvHoDBDRAQFDrjBiKs3fJr2f7Sfb0mh
         CRpNLjGmA4I4BgPO3B4OTACrsHfuNn7rCKOJHGN+g31Rklj4W5prSb6SsXUwLgl2wVNu
         sXIA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1793735424; x=1794340224;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:to:from:x-gm-gg:x-gm-message-state:from:to
         :cc:subject:date:message-id:reply-to:content-type;
        bh=J5xMolcA2jijade3hq2GliWPHkN3pbidlI2m81QLD6M=;
        b=yB/ylYFI1ERVRSY+iD+pCvDvijjLPFDNb7Re8NSTKciMa2YD7Yx8bs6+cyaPXO45Ds
         6jcEmIU68yTWOFkrp8tHXmOClQXuude25bnha4sK8j510l2ZI6DQqizpgTIP/WzuPpUA
         3bs+Aa8/ZeeL/+oCO8vSbSdZav/eP06x07OVQ4+KPKVe4vfF4mqgeDY4x/LSp+paNzfK
         Ikl5HOz4iexQAo5iSF1NhzBKeZvpV2bQrbYoVDOTD9ObnrJhCABqDyRl8rtZWTwh6HGU
         HHe1MFIi4Swffl7RGqp/ZemJzhHUJvdQmiRsC1ZFe0b4umFNQcLeMnZl32MoUQyyEXeW
         2i+g==
X-Forwarded-Encrypted: i=1; AKwUvBx9uq/aB7xPrHmWD0K4Pf1mECZWjJNRuUyvx5I9mLT3t8QOat+wqdup0/H7gcI8YuFlcwygq3B3Aoea@vger.kernel.org
X-Gm-Message-State: APuU4Z/SMqu+0jIQTzmqyw+cvluD19zyN0vtbJuUyHwnRSNa/u60A3S4
	xh9RjqKXZ+7BHKPc/ISdG4X2FLPHGoqpuKnpOe0or81yt7eSMji8Ncku
X-Gm-Gg: AYBFou3Tgr68f935aaZRA4zGgiJs0Z2ZeXOeiu9wB7PjEoXu5ZT4chjf1AnZHEHFxCc
	G2b2hSLEg/9U0yMnR0q7VT8Tw5Lf4vOwCC6QHrCYKmSdjhhQLOmWkkTtgrZrD2Ubkmwf+RGDwTE
	ux8aHl2f4VDZGm+iNQ/JKK9ZqpJhJyiQX6QLNvAib8fwBFm/xnWOEvk4SyGbxuAlJAORnDQaxUb
	lXUpaVO0soBwR5YglJ2ItOyqmRWRwx9W0EXLEItH2saLTVtgDUIFOVNsGz1lxVnynRDo7OwV6CP
	HW/voeFd4NowI2jDWqF+0EyxsbWTLZwJFYj6ulwizOQ9NW7SYNU14UVTyk+njii3CMoACMHLiFB
	YT32sojHIMqb2n8nwMp+whKDJ3PF3CIPbypEU0tjWsylJAw/LRcQAhf+b+QUURT5CAZqXvIZfZb
	vWGXGZUMGDXW/z6O7muPxXxiwJ1isfFJRv7oqw5OnHMwCfzQygFpfSoyj3giis2R657aZgyfvqm
	GMB6ORRfL5WSw4+8PJq0m/qnbBCOQuHxrEs4mUJE6x/LhEjl2ZdYfFz8RFOnd+yHstezf3OE3mQ
	rv8OFnas4cwAaXw77yxILI+V8I9O8sdDo488D43L586Mt52bmdfcJL/UhVGS8ts8YwAw4uO+Wa7
	2sqKoqJGYd83Glm6ZJ/j9rdOnZXgykUf+jw==
X-Received: by 2002:a05:6000:4027:b0:48d:fbdd:4132 with SMTP id ffacd0b85a97d-48e6e4f540bmr30004149f8f.18.1793735423549;
        Tue, 03 Nov 2026 11:50:23 -0800 (PST)
Received: from Ansuel-XPS24.localdomain (93-34-90-148.ip49.fastwebnet.it. [93.34.90.148])
        by smtp.googlemail.com with ESMTPSA id ffacd0b85a97d-48fc9d6b0aasm417802f8f.2.2026.11.03.11.50.21
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 03 Nov 2026 11:50:22 -0800 (PST)
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
Subject: [PATCH v5 1/2] dt-bindings: phy: airoha: Document support for AN7583 Gen3 PCIe PHY
Date: Tue,  3 Nov 2026 20:49:59 +0100
Message-ID: <20261103195007.9721-2-ansuelsmth@gmail.com>
X-Mailer: git-send-email 2.55.0
In-Reply-To: <20261103195007.9721-1-ansuelsmth@gmail.com>
References: <20261103195007.9721-1-ansuelsmth@gmail.com>
X-Mailing-List: devicetree@vger.kernel.org
List-Id: <devicetree.vger.kernel.org>
List-Post: <mailto:devicetree@vger.kernel.org>
List-Help: <mailto:devicetree+help@vger.kernel.org>
List-Subscribe: <mailto:devicetree+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:devicetree+unsubscribe@vger.kernel.org>
List-Owner: <mailto:devicetree+owner@vger.kernel.org>
Precedence: list
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

Document support for AN7583 PCIe PHY used to make the Gen3 PCIe port
work. Add the required register to configure the PCIe PHY and provide an
example for it.

The PHY link to another PHY (the QPHY as described in the YAML) to
correctly handle Gen2 speed and mode. It's mandatory to have this PHY
configured for correct functionality of PCIe. The QPHY is a unified PHY
that both handle USB and PCIe PHY.

It's also mondatory that the QPHY setup is done in the PCIe PHY setup and
calibration phase or calibration might fail.

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
2.55.0

