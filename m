Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=209.85.221.51
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1795560211;
	b=imrhFK0L4mXuUAdPFaPVHeX1tXQVu6qPKn9WMcJatXYQu2VgTLwSYsIpddSqIrclT1Vv
	 8g5UdEvlT0kajjpZ3PqhHWsbHTJS3eTJ2bNAPPuPiBlW9KrWEY9CId4EzmObZj41Hsl/S
	 2AMLwNiRUis4njjJzuZpakI0Q9bFbgt3JpqYNLDw+OEmM6FGZ6ZZsX/Lbtc75MJcjVka6
	 V6HpU2d1jZT29Uvj9vmxyM/OX7Pzu+OuOIJVjqJ0nMFtuSqWEW0PglBIzxDQZYuszyN3/
	 kLcjqt7QHnDCt9uFeRtBeiPCYC8UAL1q/UX3j+w/LC4Sp0c1SKuZNCySiBYDcTZI+wg==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1795560211;
	h=DMARC-Filter:Received:DKIM-Signature:X-Google-DKIM-Signature:
	 X-Forwarded-Encrypted:X-Gm-Message-State:X-Gm-Gg:X-Received:Received:
	 From:To:Subject:Date:Message-ID:X-Mailer:In-Reply-To:References:
	 MIME-Version:Content-Transfer-Encoding;
	bh=7rPLYS7So0Y9QvCfhAuguLYZiylbNJV9FhluYZDmJM0=;
	b=fcGyE0w6RDKs2jp8LgsxGuD7vNOdguRNsswVzMr+TR+p2p7OHNxucbDxYU5yIy/TuqAF
	 8HjMQhEAo7g6B6nOwZ61kJDGWCq0/27csmiGhI3Zvg9Rb2l4v195PdaaSQS0Y+WNpOj23
	 GK8LB4FnvhosCLJIVrFcN2ZrwL0KDZcGdXe/d6G5SvjQrDKhRO3WX2sTMOja+V7In1FSh
	 2jGnsD4J4EXhSoNACXSc7+IUrV7xRhyqu10EgMC/0L9Mvh0MksitvWTjdC34UCG3vQ1Y6
	 glKNBX3grcRxRynWZPEuHbsEAaOeYkW59e7eASMgkAeOD3F+H1J6SaCt++lVu7edY9A==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=gmail.com;
	spf=pass smtp.mailfrom=gmail.com;
	dkim=pass header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20260707 header.b=KCfjE4bn;
	arc=none smtp.remote-ip=209.85.221.51
Received: from mail-wr1-f51.google.com (mail-wr1-f51.google.com [209.85.221.51])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 7FC39606A332
	for <devicetree@vger.kernel.org>; Tue, 24 Nov 2026 22:43:31 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org 7FC39606A332
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20260707 header.b=KCfjE4bn
Received: by mail-wr1-f51.google.com with SMTP id ffacd0b85a97d-492690dd5daso3871971f8f.1
        for <devicetree@vger.kernel.org>; Tue, 24 Nov 2026 14:43:31 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20260707; t=1795560210; x=1796165010; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:to:from:from:to:cc:subject:date:message-id
         :reply-to:content-type;
        bh=7rPLYS7So0Y9QvCfhAuguLYZiylbNJV9FhluYZDmJM0=;
        b=KCfjE4bnQD82RwHGGKdiXNtgGErpAWjW/IhH1YzF7I+uS0VAzT+8JZzvMyY+b3qL+h
         aLThNdzzpsJwCx+uuPrMm0f91cwGed2ID8LnvguRWyzFqg8T4xHyy+5xQ2tfwgR7iH0G
         cjk7D4yI+B9bcKJvIQAmpBTamLeuNXZEja9OitneRfP9NUIaKN/UpMO+AWzd/2Zh8tpC
         H7amjugChvm3adsR5E/UYnha6fFSTXgJ4P33y6ft/jwU9eb6QCdgUlZZoPlHyvN6eMDP
         RxtfPcmE5vOmtEcgPdMcpi0D1Q41eSMmQFinBtpAGMgEZ8Hn25fHOldr5yQOwXuYqZAF
         40aQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1795560210; x=1796165010;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:to:from:x-gm-gg:x-gm-message-state:from:to
         :cc:subject:date:message-id:reply-to:content-type;
        bh=7rPLYS7So0Y9QvCfhAuguLYZiylbNJV9FhluYZDmJM0=;
        b=Y+hm1s3581ESA/iJsVOiU8b4y/BRO3CIEss0W0JNtNvC1Vd34+yWIcW71g24BoPFRi
         09JRw2de0J4sL1qeFTGcLcI3xm5fKq3oj/JYr5koToxP7XsM7+FlwEpVq5JuTQUEUeGR
         5kmQnh63MnFDh96CsNMVLQdtbtQF5McVg+3190iHugi5Q40klef8Jg352LEh7RUxux7o
         5OQ7mqdeJ9I40lKL5sscCPCc9Avw3sW0qxyGi5rLhCNV+FJWmwKTRaBMn3ch3x0wYOLW
         7tqbFuoaZu88LjeajpihPeE5un9MUfdqJxmAUf3FGGpogORbWtq/cA9+Ny6FQ4vnjsoH
         /SnQ==
X-Forwarded-Encrypted: i=1; AL+hErFpgNupmRwhRJGvnPVCC3rny59a28JW09IaKJJ6pNrnGhcy5hXB9ib75d5L3Sp6JVC6UH/VmITQ4xLq@vger.kernel.org
X-Gm-Message-State: APuU4Z++zLuQsVYZUov/1aUU+FNpYFZgCHYXjtj1I3AsOP4kh7t4gLJ2
	I1Eh89gvUECzNiyFl3zoAmNSvwk+9j/O4HxrdB4iavTXrNFzYLlcdOEh
X-Gm-Gg: AZFdTZfIMVLmC7gjhgGfzOKRI+RV+26hTbGx5zx8jhsswRyq9t/ZMTvXkLe7BE5i0TG
	V1zxJBFRjkeQrpreDyuZ1RXSj6g+3nVIGND0fPKJKBgXxC1Unlh8eJGRty+QmhSi9xmbIV9djz+
	3HKSOEJ/05Qn7giepasV3oSBVh8sN/M4af83A6KeYYPTcyPFY+p2HA2OQz58Lgi5gTlyK+9u7+d
	cqvmpsBJbfQizamzWTVPznVDpUFDZY2kCWQfevXCJrWME0nvG3dkqVFx9waznKh77uKgq/6kJka
	fTNvQcuEthJDY5Szj6bn/to81qry6hU/b5/Yra4IP1BrvgQr/nNaqlj5gXauNqSZ0oXt60UG/BQ
	k1OmPvET1fO9yw1vyR3C6+79rd1Haf01LI0eJvi/H94HTYj0PgjSO8TjSr29hX3a+lj99PZsxpT
	lZm9iivb2KaNKCqDCZMTc8Aplt5bMj6TwRjZySQPpIprNUTr24txJlmNrqj8BtHJ8IvtG/9sJL8
	kwlRVBl5D+VUX06hAqJDEitEq2LXbLepX3ndeO1mTuM8m8UNs7btDr8uEmlZ9NsHAFPxH55kX6J
	9R98UdJlgR07IrLOSgt3bVPDm5oo5DMZEKsA9+A+feswwgpXAbJgFTxF8XrqN/K94cq+BcjxsQk
	cZaA=
X-Received: by 2002:a05:6000:4705:b0:48f:cb37:3ec3 with SMTP id ffacd0b85a97d-4abb400c591mr31382607f8f.41.1795560209956;
        Tue, 24 Nov 2026 14:43:29 -0800 (PST)
Received: from Ansuel-XPS24.localdomain ([87.13.246.159])
        by smtp.googlemail.com with ESMTPSA id ffacd0b85a97d-4ab6c61f558sm30900915f8f.58.2026.11.24.14.43.28
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 24 Nov 2026 14:43:28 -0800 (PST)
From: Christian Marangi <ansuelsmth@gmail.com>
To: Christian Marangi <ansuelsmth@gmail.com>,
	Vinod Koul <vkoul@kernel.org>,
	Neil Armstrong <neil.armstrong@linaro.org>,
	Manivannan Sadhasivam <mani@kernel.org>,
	Rob Herring <robh@kernel.org>,
	Krzysztof Kozlowski <krzk+dt@kernel.org>,
	Conor Dooley <conor+dt@kernel.org>,
	Lorenzo Bianconi <lorenzo@kernel.org>,
	linux-arm-kernel@lists.infradead.org,
	linux-phy@lists.infradead.org,
	devicetree@vger.kernel.org,
	linux-kernel@vger.kernel.org
Subject: [PATCH v6 1/2] dt-bindings: phy: airoha: Document support for AN7583 Gen3 PCIe PHY
Date: Tue, 24 Nov 2026 23:43:15 +0100
Message-ID: <20261124224318.227478-2-ansuelsmth@gmail.com>
X-Mailer: git-send-email 2.55.0
In-Reply-To: <20261124224318.227478-1-ansuelsmth@gmail.com>
References: <20261124224318.227478-1-ansuelsmth@gmail.com>
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

Reviewed-by: Rob Herring (Arm) <robh@kernel.org>
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

