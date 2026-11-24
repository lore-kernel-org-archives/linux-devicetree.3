Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=209.85.221.48
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1795559107;
	b=CPO4ig2vl+CRBIz/rle67/2msJ35gUCTOmjxHaf1v3xtMwZigeiV03k6NjI1ifptjjSW
	 5AL9/aH20VeyvQJ7uLPHO/pEHHrS9NwveGJTm/HBvz1E85dlREtYTvwanLnoA81fEXQBM
	 xl/xkkMYLSTjuSB5wfr5Jf1pnFPNT28O4q7E7vkKdNt0qfVeyYBaPik2WYmBokBlqJzk1
	 yIvJqFi5Bokhh73sdci3UG/WVXkix+PeYPyZXeWgqy5X/gz79xq73EcVJMi6bFwMIwUUv
	 3r5JGGsF5tnd+nLFoPgFv4jZmp7jw/s6e2S8MrbMtpVQVgjAxQ3YAM3AAnjduefOWtg==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1795559107;
	h=DMARC-Filter:Received:DKIM-Signature:X-Google-DKIM-Signature:
	 X-Forwarded-Encrypted:X-Gm-Message-State:X-Gm-Gg:X-Received:Received:
	 From:To:Subject:Date:Message-ID:X-Mailer:In-Reply-To:References:
	 MIME-Version:Content-Transfer-Encoding;
	bh=JSzQSnco7VI2G/k8ySDHQjYOEaRc/td443pgDxBiMtM=;
	b=p8IQhe1iPW3ZcnylZBLgEAfQR0ZUivSPj2ieGx3d0L1i92PkXEMZFGa4p1/+D+Mjuux7
	 VhEXY0iidCZu92MsSnLiS8kuOPg1qGiyFxwNMJD7xB+Izn81t0bF6+a1mto3Aj2XiwRzc
	 ZlxvdVcWhmXgtnyAadvzGbIUZs9kEGK4Yl5fpZLfETM72z5MlUyqxWvr7HFWboFZFohhz
	 GWebqkJeFPMl6uW7pJQH/YKX9ceoYRpY2xhea4zHAxiY0yMmUiOCy29XO3kWd2Vrz0pbn
	 f4fV14hRwFxhqQ04n9i9naLj8sKMM3sL/viPUUFduGjKZGBdyfrMc/I4jBtfhAxBZsQ==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=gmail.com;
	spf=pass smtp.mailfrom=gmail.com;
	dkim=pass header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20260707 header.b=ZdZofUX3;
	arc=none smtp.remote-ip=209.85.221.48
Received: from mail-wr1-f48.google.com (mail-wr1-f48.google.com [209.85.221.48])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 215D5606A331
	for <devicetree@vger.kernel.org>; Tue, 24 Nov 2026 22:25:06 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org 215D5606A331
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20260707 header.b=ZdZofUX3
Received: by mail-wr1-f48.google.com with SMTP id ffacd0b85a97d-4a7b8abe209so3896724f8f.0
        for <devicetree@vger.kernel.org>; Tue, 24 Nov 2026 14:25:06 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20260707; t=1795559105; x=1796163905; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:to:from:from:to:cc:subject:date:message-id
         :reply-to:content-type;
        bh=JSzQSnco7VI2G/k8ySDHQjYOEaRc/td443pgDxBiMtM=;
        b=ZdZofUX3OTnIUfEPNnoNaFx+xNCBxP6kCyP7mv0ptg9ibEYBxvVowJYOtWui4c+x1c
         FKo3EECAUbxHWSvN+QEbL3lVteaMpHI2YKcS2LcwHllPfiDYIHLMrNhIDOu5e4taPZr/
         A6SAXB1iafKsfxBwZ+O26KZ6isfyU5NtEur1IEBdRZSaDmCOxPHbuOWEHVUJc9nzRUAE
         NkPl4N6Z6tXFnL8G6lIw1lZHVnb1qjlSRcTCraoLxxRlQ1XENc6+nRDUgL+2xfkpDrSz
         ZnAStcPxgD8NKnXNTBMwsl9a3ciRLmx1R3wZX616CdBxE/G720QHKSfCz06h3BbM4hJd
         bSLQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1795559105; x=1796163905;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:to:from:x-gm-gg:x-gm-message-state:from:to
         :cc:subject:date:message-id:reply-to:content-type;
        bh=JSzQSnco7VI2G/k8ySDHQjYOEaRc/td443pgDxBiMtM=;
        b=rIF3zhDTvvrSgccPPVwlSzDLoI7ivEeGda1Hxxcb/BzvK4S5RzgxlMqeYZSNtD2zEj
         TRXdKxlYqQ5F/K3Vxvd0Yr9uABDN4KptaD8An5MSPXqN8g0MBpa3cCcKQMJplAJXj2iU
         W0wUqynagMbPnLpYy6WBytCODrPxf4BuUbsgJyMfUwQZ7YPuF4mI1LAJUyNga4t1S5OS
         on3wCSfuETCxA9ySHqdFq1K47FYIrq7YnDxbFqII8tBs3GPQdBnDVQSe5mlrgWNCo8Fz
         jeoQKFAAlGwJl6UjCtK2ama97qhQebbDzUtwaRsN+yZV4ZSSBGO1+wHkI+wIBZFE4anU
         lvaw==
X-Forwarded-Encrypted: i=1; AL+hErFKoyOsG73FfWE4020qTCpdoafB6XFmEzkPOyJyLkbQGZP6URIn/LqUJs10qZ6ZSOJDGacUkS1gL4rB@vger.kernel.org
X-Gm-Message-State: APuU4Z85op+21z4sl6KEAbv+QY9/DyLZJyoYMskXvYC9gijAhV90TcIR
	+utZx30UQ4+7iGr/SA8SvLx+ISiZRQGBFSv7VnrYthCJN7HQ4nxQ0u2J
X-Gm-Gg: AZFdTZcxj4tIobj0k3AmZEFfxCRcRnY95qo8w5NmqljE6ay/9+W8gXxZH8nlxbQ5Uq9
	uLzKqf/jDR38Pl8OLrerNYB+nuWph7hxNJBjGJahsofT4Mzn+nGsxAyJixVI8q9CpXNUkBKnE13
	hDsTo6u45Lf4kgYcWhmx1NiOFWfnMUq25ePUH9DGifdKYhU8ir/pfSi4NQqcL4LmbwXWQg6d6i7
	v87LyR7Rr5kNYbU9uUWo3BDCdEjBK+txA6lthtymBXxrcfTLuGXaRS851HIctcdaritygbV1uuC
	oIRHFIzgmz385mTqWqLUm+tgKCnH77Us52uzdkZ0zV3lUv4Qo04jFWqELE8IFoazIBjBOXokPI5
	mw3PmEP31HQhY9l2iUREOaeIZ0Bm13jiTT7oChgz+HZcZ/WDRDQOSHc4Ag3YxJC8+xwxVOLuao2
	ugJcE+iT5kBmMFI5OExD+yhbHS3WVrxSp5guNMvDbsdwcOpqJ6dBxG4OhCV8b1Y2LlCBDYU5QA6
	OSp/YFxTUz4ibqKeNfwci1zyf9VMwnc9qN0DseEumDPm46Lmt4fDnFlJKtOz17htkFOFag/zXMx
	rEA/FUeRupy3Za1d6FvxLMp9EVQ1TyT6tdmtvySPqzF5zNfxLmg6GX5o6X9bCLVyVdSIYsEtcoa
	9tRE=
X-Received: by 2002:a05:6000:4704:b0:4a8:5a5b:3b7d with SMTP id ffacd0b85a97d-4abb5eacf4fmr32036412f8f.56.1795559105485;
        Tue, 24 Nov 2026 14:25:05 -0800 (PST)
Received: from Ansuel-XPS24.localdomain ([87.13.246.159])
        by smtp.googlemail.com with ESMTPSA id ffacd0b85a97d-4ab69bf630esm31125711f8f.16.2026.11.24.14.25.03
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 24 Nov 2026 14:25:05 -0800 (PST)
From: Christian Marangi <ansuelsmth@gmail.com>
To: Vinod Koul <vkoul@kernel.org>,
	Neil Armstrong <neil.armstrong@linaro.org>,
	Manivannan Sadhasivam <mani@kernel.org>,
	Rob Herring <robh@kernel.org>,
	Krzysztof Kozlowski <krzk+dt@kernel.org>,
	Conor Dooley <conor+dt@kernel.org>,
	Christian Marangi <ansuelsmth@gmail.com>,
	Lorenzo Bianconi <lorenzo@kernel.org>,
	linux-phy@lists.infradead.org,
	devicetree@vger.kernel.org,
	linux-kernel@vger.kernel.org,
	John Crispin <john@phrozen.org>
Subject: [PATCH v5 2/3] dt-bindings: phy: airoha: Document support for AN7583 Gen2 PCIe PHY
Date: Tue, 24 Nov 2026 23:24:32 +0100
Message-ID: <20261124222452.219832-3-ansuelsmth@gmail.com>
X-Mailer: git-send-email 2.55.0
In-Reply-To: <20261124222452.219832-1-ansuelsmth@gmail.com>
References: <20261124222452.219832-1-ansuelsmth@gmail.com>
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
2.55.0

