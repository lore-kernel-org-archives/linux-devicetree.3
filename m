Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=209.85.210.176
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1792586783;
	b=gxJ9yidvdk+BB2HLKwAOb0mvVUfP2jsIaW+i+WHIUEpoe9tiMnJkzlVkEPGogCsvFe09
	 gjImKC9Jse2oFYt4O1JfLUnAUT0fw0Up/Uw8UosiafCrJplmpzua3KnzahPQZMrARGMpJ
	 RXuV5WDMyUq0kSjBt7Fj4XsRMxRF/q5H/GJs7ImXngxi24HeGndc3sBet0CphPhb5+7En
	 NTOb/TtiVBOfzX3ixwAg4kFW02XtRzAeAnHtK67BatOwxk8XD/xUZQaFt+OSsApLKlXA0
	 hlNdi2yu+3tlJMjirn4SdsG0Q5dkACAMDEcqmpw2K1CTDZ8LfDZJUpNjuuF5rn7GK3Q==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1792586783;
	h=DMARC-Filter:Received:DKIM-Signature:X-Google-DKIM-Signature:
	 X-Forwarded-Encrypted:X-Gm-Message-State:X-Gm-Gg:X-Received:Received:
	 From:To:Cc:Subject:Date:Message-ID:X-Mailer:In-Reply-To:References:
	 MIME-Version:Content-Transfer-Encoding;
	bh=WwZtUrdYtW8MtDYG2yC3ydbDQlF/r6XHSO1vV5BkgeA=;
	b=PrTftIS1CJqK71d/YXZKgHgqT9Bo93+ROKkryv37oE+CEldmltrZ5QDPtxmceUrN2PSs
	 JBbR2A7Md4CIanbDE9YnEKabe5yalWD7vKtzpVklrPpiqs1BrJEj/IN3QOXWTeo9BU0/W
	 XEmodsIJclPkrNTFCCY/Ywupf/RrA186NGATJDmoM9qUhAFRa9xThIsYKlClKInLTgBxl
	 oRom+xnyFRvF2MixKRhSEknrvpT8WFY63Mb+9KkXoUYRdkW0idmq1YRSrwBdr6M1XbsUK
	 kwYIrxElnQAWOxTPfNqgcjtfP2Vq3u81ZtED34pwZkime9irIf18gMHbLbMkwXBlqww==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=gmail.com;
	spf=pass smtp.mailfrom=gmail.com;
	dkim=pass header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20251104 header.b=TFq6P6r4;
	arc=none smtp.remote-ip=209.85.210.176
Received: from mail-pf1-f176.google.com (mail-pf1-f176.google.com [209.85.210.176])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id E1E8D606A325
	for <devicetree@vger.kernel.org>; Wed, 21 Oct 2026 12:46:22 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org E1E8D606A325
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key, unprotected) header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20251104 header.b=TFq6P6r4
Received: by mail-pf1-f176.google.com with SMTP id d2e1a72fcca58-8a01cac8733so406596b3a.2
        for <devicetree@vger.kernel.org>; Wed, 21 Oct 2026 05:46:22 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1792586782; x=1793191582; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=WwZtUrdYtW8MtDYG2yC3ydbDQlF/r6XHSO1vV5BkgeA=;
        b=TFq6P6r439sMoTmALZIeItkoFlfJeoKAlxxoA82luquzE5l+j6g3th/bVRROMHmjtm
         881PAPylfPqjNr+I6KrFgKKDNbxNGmXAqWGhvMDNcVDPOJMur3DVR26mqVqdfYYFZ/Gi
         KnOiGWIBK93oHGKOopJPlU2SUCuxspDu1ibqqMK/n3Rw9bJGaNWQY2Lpl1LYfHBfmFDN
         E/5BE7aw9noyNxFU7kFOKcUDZAoJ+C1zG1ErrzhV/NIvgVFZHhvgK3odMUSdpSzyLUXN
         1MRD13U2M94QtKe9pp/d+4sVEh471wHPXhdCV5SxGqoOiMstjaTzoMf1W7j09QeqU66l
         y9YQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1792586782; x=1793191582;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to:content-type;
        bh=WwZtUrdYtW8MtDYG2yC3ydbDQlF/r6XHSO1vV5BkgeA=;
        b=mUEXaNItR49ncH+01uQdSb0oIAK86+gL5NmPaTiqKTvc0AdBGnfUAgTemaE4ejB4Q6
         nXtFJL95TKbGaUUKUx5r+m51IedMcNHXjddCow0QUtawjVtKhVCMIp8Jj+Njjv5RK3Yz
         l7bO2jUhl7CUY+tJxHguH17WhndN3abaXtt1iNj1000gHkC1FCynnLSQQHzi1BLkecco
         YnZqNLgFx+lNCMAbd9J3JUa95Ef4BBTxI39lDTkuje9kdxHuApNfDpVaKEjWMRwXubme
         r8EbshO0U7Hqj2jSLItS7Z5FC0irbR4J2dS6qdGOhmHtFaNGEaBpMRnsmaxmdLbXKw6Z
         LjLg==
X-Forwarded-Encrypted: i=1; AKwUvBzw6/i7ddIQLD3ZDCr7FktC2h6Of9HNO6IbCi7Dmsdb2lvUx7Jqj9NWRT3JXSunHMhiyg/ZqL3F0w6n@vger.kernel.org
X-Gm-Message-State: AFq9FYKrzqwOWbobli8XKE0T6kLToYk3N7gLFvVWLHLRrE7M2iYkFjHi
	phod7AGz9qHWZexf3HEpjOGVJX2z9QFLz8KTb92ddRFAFR4/y1RsiB0Y
X-Gm-Gg: AYBFou3bQhUk+xRrUl/qaVyOqw21zw0rtdUdHgA7rxMTk2W6SNoVEuEesacj9TshaHx
	ZxDcRP5L853n4CG6rAN9y6NAuL5RQOj6WR/fYlJVr94jz9Yjsx7ymnQVN+t0Hfuna3hQoAVeXDZ
	wywJUdMmfeI8zVU7FdKPaaxMSAigv7uVFVBCFACn5PvwswJVyT6mCLK8qo2pitFEut6bUO61Rpg
	Oh9awd9utxlJu2oV45qEZp2oDfTmNzdEUIW2/U9OqnZ9JUVe5tVhGDh9fKJdz8NOaQ9rGBECjKI
	0KQ/k6R5TcD8j3cNpebdpdj1milaP8/13tRP1xt3cGwjf+Pb1VTbk4mmUuGnJ75XFsdNa098kUi
	b5YILdQ+y2kixkAEh67Hc6qaR2spuZ4lJSQgdawBoSupSpANYQONYcVkAbx+j1EcHhke4v2sluQ
	+owT9cXCMztewwY4VndZS1QrlGo9pk3bmGEbKDLlWhVFL5yKGM/D29kVpETSvjVgQTpPpBRAPlW
	JODa1jWkGyurfpnb9DEMd3SH24yT5yU8AmvC8d5T3lJwl9nWRsXC55NVik5mEpwvE+/RhkP3IG3
	CTAfFkRAfqRGMems
X-Received: by 2002:a05:6a00:420a:b0:89e:f8e9:205f with SMTP id d2e1a72fcca58-8a089df2652mr1470227b3a.32.1792586782100;
        Wed, 21 Oct 2026 05:46:22 -0700 (PDT)
Received: from arch.localdomain (123202092053.ctinets.com. [123.202.92.53])
        by smtp.gmail.com with ESMTPSA id d2e1a72fcca58-8a08960fa88sm832964b3a.53.2026.10.21.05.46.17
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 21 Oct 2026 05:46:21 -0700 (PDT)
From: Jun Yan <jerrysteve1101@gmail.com>
To: Liam Girdwood <lgirdwood@gmail.com>,
	Mark Brown <broonie@kernel.org>,
	Rob Herring <robh@kernel.org>,
	Krzysztof Kozlowski <krzk+dt@kernel.org>,
	Conor Dooley <conor+dt@kernel.org>,
	Jaroslav Kysela <perex@perex.cz>,
	Takashi Iwai <tiwai@suse.com>,
	Jun Yan <jerrysteve1101@gmail.com>
Cc: linux-sound@vger.kernel.org,
	devicetree@vger.kernel.org,
	linux-kernel@vger.kernel.org
Subject: [PATCH v2 1/2] dt-bindings: sound: add Everest ES7202
Date: Wed, 21 Oct 2026 20:45:47 +0800
Message-ID: <20261021124552.767218-2-jerrysteve1101@gmail.com>
X-Mailer: git-send-email 2.56.0
In-Reply-To: <20261021124552.767218-1-jerrysteve1101@gmail.com>
References: <20261021124552.767218-1-jerrysteve1101@gmail.com>
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

Add the device-tree bindings for the Everest ES7202, a 2-channel PDM
analog-to-digital converter controlled over I2C.

Signed-off-by: Jun Yan <jerrysteve1101@gmail.com>
---
 .../bindings/sound/everest,es7202.yaml        | 56 +++++++++++++++++++
 1 file changed, 56 insertions(+)
 create mode 100644 Documentation/devicetree/bindings/sound/everest,es7202.yaml

diff --git a/Documentation/devicetree/bindings/sound/everest,es7202.yaml b/Documentation/devicetree/bindings/sound/everest,es7202.yaml
new file mode 100644
index 000000000000..ce98d2d600d4
--- /dev/null
+++ b/Documentation/devicetree/bindings/sound/everest,es7202.yaml
@@ -0,0 +1,56 @@
+# SPDX-License-Identifier: (GPL-2.0-only OR BSD-2-Clause)
+%YAML 1.2
+---
+$id: http://devicetree.org/schemas/sound/everest,es7202.yaml#
+$schema: http://devicetree.org/meta-schemas/core.yaml#
+
+title: Everest ES7202 2 channel PDM analog to digital converter
+
+maintainers:
+  - Jun Yan <jerrysteve1101@gmail.com>
+
+properties:
+  compatible:
+    enum:
+      - everest,es7202
+
+  reg:
+    maxItems: 1
+
+  reset-gpios:
+    maxItems: 1
+    description: GPIO connected to the reset pin (active low)
+
+  vdd-supply:
+    description: Main power supply, 1.8 V or 3.3 V. Optional; defaults to 3.3 V
+
+  "#sound-dai-cells":
+    const: 0
+
+required:
+  - compatible
+  - reg
+  - "#sound-dai-cells"
+
+allOf:
+  - $ref: dai-common.yaml#
+
+unevaluatedProperties: false
+
+examples:
+  - |
+    #include <dt-bindings/gpio/gpio.h>
+
+    i2c {
+        #address-cells = <1>;
+        #size-cells = <0>;
+
+        es7202: codec@30 {
+            compatible = "everest,es7202";
+            reg = <0x30>;
+            #sound-dai-cells = <0>;
+            reset-gpios = <&gpio0 0 GPIO_ACTIVE_LOW>;
+            vdd-supply = <&vcc3v3_sys>;
+        };
+    };
+...
-- 
2.56.0

