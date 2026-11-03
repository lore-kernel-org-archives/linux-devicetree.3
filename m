Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=209.85.128.41
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1793737851;
	b=mjOXQguq49DtH1zlzRmc/lxpZmxPTVVTzzlghQzd1EIBz7ZIhhzDlUkVMTLjiZP3nXYx
	 9zx41ZcJlXNFWluyrEoNf56j9cPld/Ib/Y5BEOBt/uKNvtEmEwpYNTNfakSF3ccv5QcoP
	 5WSqJY6e0tJS5hk0gwNF5G9l69m3rCtkpgndLHL78gb61tg0VQUIhIACNXZ68zxSqC7rA
	 kk9EdPTBWHKMNRyjdPxeh8TpdZd7Adj7G8FI31V1/JauD+UJYURZhQhA16B6KWQvjjM2j
	 r10s0hguTv6ARobPLPSjMLyzPI6MNVqmtRBxRL/NLqJmRc2bVLpClA6qXWf2UWZn2aw==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1793737851;
	h=DMARC-Filter:Received:DKIM-Signature:X-Google-DKIM-Signature:
	 X-Forwarded-Encrypted:X-Gm-Message-State:X-Gm-Gg:X-Received:Received:
	 From:To:Subject:Date:Message-ID:X-Mailer:In-Reply-To:References:
	 MIME-Version:Content-Transfer-Encoding;
	bh=FZfYo8SuzajjbwV4kqNY7tywvSI0LOY4vzOInvykOJI=;
	b=C1PUSdCDxOQ5dsgvhXYQJ1u/iivvzRs4JDZhJ2GJdC6QGaMpdEzGJS83498cNqp23Hia
	 hGfLepYKI6vx0HagRhcbYXnuZp8CN9iTTM0hAgnSEAyKoJXjKbRcKogZHD4HDN2FY/SV6
	 kto/l6vNmotV8KkJjk5GmeYsWmE/nevqvJa4LXePEHCSFT6JECJbY556z7NV3XjMkl4r4
	 e/HiiIwQ0+S+Srwi6pnZrqp07NAR9PGmHbm/5FH2UPWewGu7GNHgohprqKFNRpDxLFZZS
	 Tb6ZKHJzhRVCp+ebNlndIkLkJdOyX5Dn6WvYzNye0ecrAclP2AvR85YjQgBlOXzM1gw==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=gmail.com;
	spf=pass smtp.mailfrom=gmail.com;
	dkim=pass header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20260707 header.b=z+G0hPgv;
	arc=none smtp.remote-ip=209.85.128.41
Received: from mail-wm1-f41.google.com (mail-wm1-f41.google.com [209.85.128.41])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 0EB01606A335
	for <devicetree@vger.kernel.org>; Tue,  3 Nov 2026 20:30:50 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org 0EB01606A335
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key, unprotected) header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20260707 header.b=z+G0hPgv
Received: by mail-wm1-f41.google.com with SMTP id 5b1f17b1804b1-4a5720b0a57so7194445e9.0
        for <devicetree@vger.kernel.org>; Tue, 03 Nov 2026 12:30:50 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20260707; t=1793737849; x=1794342649; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:to:from:from:to:cc:subject:date:message-id
         :reply-to:content-type;
        bh=FZfYo8SuzajjbwV4kqNY7tywvSI0LOY4vzOInvykOJI=;
        b=z+G0hPgvJEtClVcAOQwvDYL/LaCrrOLaj99bug0eOtu1t7nKLZINdnWZnMAluamX4q
         P2s8eAbfKmM4bIxlCMCEQDiLRH00FzQifTcN51bXR6ku9SNYB6Cj7n0tsN5G6hIbfgxx
         pOH7TEr9CXKtG3y2cNqZdWtB9Li7RiaKLObp0wTTkwSNWnUHqSUNtVcmdwFpr43whHES
         xC80EoChV922tufQ1Qqgb7LIQEmh/XYFjuZgMPXgB0kmMMivnSHaR6JwePP9+5bFZRRo
         sqBxaSn3JFakp9nWtuX15vQPr6F+ge6ibino2pjDFXaAUD431J6y42lvDBhDAUGiu6Uo
         vkvQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1793737849; x=1794342649;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:to:from:x-gm-gg:x-gm-message-state:from:to
         :cc:subject:date:message-id:reply-to:content-type;
        bh=FZfYo8SuzajjbwV4kqNY7tywvSI0LOY4vzOInvykOJI=;
        b=YhqswkI3ypSz7UwQ2IvXFldXfx954kXA8Gq0cBO9YQjUCwNG2BwuK/43UoYiZs1DBo
         BeLP8kK5BKuyraFqxEHmm+glzPYc/wmLZelAJ7ELyRrTc9umjTg3iZN8XKjPNI8XAbaU
         h2jke1CPj5LW6iywnmAiLUKVJyjhp37UXSaFcbmywjzgeW1jnaw2xlUHi+Ef8mqWCZDl
         bQ9IGkzRW7g3ozEGAYdkLzOZmdpQvBccr+6TeKJJPtAWm6K56Kte3bRfH54Aza+bmDGH
         WqfyrRMmLfVa2RdiRe3iVI0Jx01ks/QPShfEdXYsaVP4G9VIyZPRssF1jGJIzshLaHY/
         dTHA==
X-Forwarded-Encrypted: i=1; AKwUvBzowihBAU01d25SiQTRA0R9orDC5OH3u+a1m2+bn9YRrO56oFX+Vd//1KgMrJOt++LdBfeRK2f3jIth@vger.kernel.org
X-Gm-Message-State: APuU4Z/gAdCHVEoHVpBoo40LsZvwhlqN6kGdK0+9Dmq5rrYaKWIXdBnZ
	Jc19RMxRByT0HrOEM8lL1oND1oiCOuDRhkh6wTUWERdE4EkhWBWx5fkT
X-Gm-Gg: AYBFou2Tifez3OoNYGoOSfkk6Bg/jvPX06V+BcKdzHdxdwM37QHysZvWKc44AFh3j6W
	BZQkREUnEQBFmtfIDKvvt2dxoa8XRJoUxDija0Iqwl3xOU8PnRRdRwZlbnJkBgGFhmkXzqZTmA0
	xFQaiU59O+IdULM+t+hbnXDFAaux81AbOh9u/F0dZybynwjURZ1Z78q1L4fVB9ue5vWA/Ej5PSF
	Srwab/Gta9/8xYpDwFZrOU2KRKFIdtFYJu4hfyRMEqyNTh657ncz22SeBjb3LL0bl/GXPS7Zkuc
	5YxNHrVBdcw6qmVLekHGQ1/wmdQS0DT/ycb7q7c17ork0wkA9sKkYD9xPhffQczM88VsYO0fJvH
	UEnRXnLAtJx4fSn6oB7ZUF1nibSbBZKLC4ReMOK/hchKselbfTZ12Rq63kqCvh0CJzTS7iqXXK+
	wcDiS+67SAv0BHcS5m5VNp+isBuaEaXnikHO7D5fq3PGsymzmi1LtgdSX7ejnLkdTTW7sqJ8yey
	yEh9jzLMOkUVsLPSLGd5Pe7iJYimIc7sfvfML59Mi7ca76xV+htvyESIs+X44X7lAy5zO+ec6HU
	ELST+1WJ1rA9+bGYmi4ROVSLNIE5yOOSHqh8WccQ2J/qOq7nR2fyYK2s3zrsE2oKMaxNMbeme7D
	dmw85YcCIRIZP0v3QljHBWSi9/VKfEv7ySQ==
X-Received: by 2002:a05:600c:1d11:b0:4a1:c27d:e1a8 with SMTP id 5b1f17b1804b1-4ac174712admr336521505e9.10.1793737849367;
        Tue, 03 Nov 2026 12:30:49 -0800 (PST)
Received: from Ansuel-XPS24.localdomain (93-34-90-148.ip49.fastwebnet.it. [93.34.90.148])
        by smtp.googlemail.com with ESMTPSA id 5b1f17b1804b1-4b2a879fb29sm75110245e9.4.2026.11.03.12.30.48
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 03 Nov 2026 12:30:48 -0800 (PST)
From: Christian Marangi <ansuelsmth@gmail.com>
To: Lee Jones <lee@kernel.org>,
	Rob Herring <robh@kernel.org>,
	Krzysztof Kozlowski <krzk+dt@kernel.org>,
	Conor Dooley <conor+dt@kernel.org>,
	Christian Marangi <ansuelsmth@gmail.com>,
	mfd@lists.linux.dev,
	devicetree@vger.kernel.org,
	linux-kernel@vger.kernel.org
Subject: [PATCH v2 1/2] dt-bindings: mfd: Document support for Airoha AN8855 Switch SoC
Date: Tue,  3 Nov 2026 21:30:31 +0100
Message-ID: <20261103203034.12869-2-ansuelsmth@gmail.com>
X-Mailer: git-send-email 2.55.0
In-Reply-To: <20261103203034.12869-1-ansuelsmth@gmail.com>
References: <20261103203034.12869-1-ansuelsmth@gmail.com>
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

Document support for Airoha AN8855 Switch SoC. This SoC expose various
peripherals like an Ethernet Switch, a NVMEM provider and Ethernet PHYs.

It does also support i2c and timers but those are not currently
supported/used.

Signed-off-by: Christian Marangi <ansuelsmth@gmail.com>
---

This was already approved by Rob but I dropped since
I dropped the DSA switch section and reference (since
it will be handled by the other series)

I have a question about this... Can I send a follow-up
patch to this schema to add the ethernet-switch
and make it required by this or will be an ABI violation?

It's not clear how to handle this detail. Would really
love some guidance on this.

(or maybe the DSA schema should be pushed with this
series?)

 .../bindings/mfd/airoha,an8855.yaml           | 134 ++++++++++++++++++
 1 file changed, 134 insertions(+)
 create mode 100644 Documentation/devicetree/bindings/mfd/airoha,an8855.yaml

diff --git a/Documentation/devicetree/bindings/mfd/airoha,an8855.yaml b/Documentation/devicetree/bindings/mfd/airoha,an8855.yaml
new file mode 100644
index 000000000000..ee7241154851
--- /dev/null
+++ b/Documentation/devicetree/bindings/mfd/airoha,an8855.yaml
@@ -0,0 +1,134 @@
+# SPDX-License-Identifier: (GPL-2.0-only OR BSD-2-Clause)
+%YAML 1.2
+---
+$id: http://devicetree.org/schemas/mfd/airoha,an8855.yaml#
+$schema: http://devicetree.org/meta-schemas/core.yaml#
+
+title: Airoha AN8855 Switch SoC
+
+maintainers:
+  - Christian Marangi <ansuelsmth@gmail.com>
+
+description: >
+  Airoha AN8855 Switch is a SoC that expose various peripherals like an
+  Ethernet Switch, a NVMEM provider and Ethernet PHYs.
+
+  It does also support i2c and timers but those are not currently
+  supported/used.
+
+properties:
+  compatible:
+    const: airoha,an8855
+
+  reg:
+    maxItems: 1
+
+  reset-gpios:
+    maxItems: 1
+
+  efuse:
+    type: object
+    $ref: /schemas/nvmem/airoha,an8855-efuse.yaml
+    description: EFUSE exposed by the Airoha AN8855 SoC
+
+  mdio:
+    type: object
+    $ref: /schemas/net/mdio.yaml#
+    description: MDIO exposed by the Airoha AN8855 SoC
+    unevaluatedProperties: false
+
+required:
+  - compatible
+  - reg
+  - mdio
+
+additionalProperties: false
+
+examples:
+  - |
+    #include <dt-bindings/gpio/gpio.h>
+
+    mdio {
+        #address-cells = <1>;
+        #size-cells = <0>;
+
+        soc@1 {
+            compatible = "airoha,an8855";
+            reg = <1>;
+
+            reset-gpios = <&pio 39 GPIO_ACTIVE_HIGH>;
+
+            efuse {
+                compatible = "airoha,an8855-efuse";
+
+                #nvmem-cell-cells = <0>;
+
+                nvmem-layout {
+                    compatible = "fixed-layout";
+                    #address-cells = <1>;
+                    #size-cells = <1>;
+
+                    shift_sel_port0_tx_a: shift-sel-port0-tx-a@c {
+                       reg = <0xc 0x4>;
+                    };
+
+                    shift_sel_port0_tx_b: shift-sel-port0-tx-b@10 {
+                        reg = <0x10 0x4>;
+                    };
+
+                    shift_sel_port0_tx_c: shift-sel-port0-tx-c@14 {
+                        reg = <0x14 0x4>;
+                    };
+
+                    shift_sel_port0_tx_d: shift-sel-port0-tx-d@18 {
+                       reg = <0x18 0x4>;
+                    };
+
+                    shift_sel_port1_tx_a: shift-sel-port1-tx-a@1c {
+                        reg = <0x1c 0x4>;
+                    };
+
+                    shift_sel_port1_tx_b: shift-sel-port1-tx-b@20 {
+                        reg = <0x20 0x4>;
+                    };
+
+                    shift_sel_port1_tx_c: shift-sel-port1-tx-c@24 {
+                       reg = <0x24 0x4>;
+                    };
+
+                    shift_sel_port1_tx_d: shift-sel-port1-tx-d@28 {
+                        reg = <0x28 0x4>;
+                    };
+                };
+            };
+
+            mdio {
+                #address-cells = <1>;
+                #size-cells = <0>;
+
+                internal_phy1: ethernet-phy@1 {
+                  compatible = "ethernet-phy-idc0ff.0410",
+                               "ethernet-phy-ieee802.3-c22";
+                  reg = <1>;
+
+                  nvmem-cells = <&shift_sel_port0_tx_a>,
+                      <&shift_sel_port0_tx_b>,
+                      <&shift_sel_port0_tx_c>,
+                      <&shift_sel_port0_tx_d>;
+                  nvmem-cell-names = "tx_a", "tx_b", "tx_c", "tx_d";
+                };
+
+                internal_phy2: ethernet-phy@2 {
+                  compatible = "ethernet-phy-idc0ff.0410",
+                               "ethernet-phy-ieee802.3-c22";
+                  reg = <2>;
+
+                  nvmem-cells = <&shift_sel_port1_tx_a>,
+                      <&shift_sel_port1_tx_b>,
+                      <&shift_sel_port1_tx_c>,
+                      <&shift_sel_port1_tx_d>;
+                  nvmem-cell-names = "tx_a", "tx_b", "tx_c", "tx_d";
+                };
+            };
+        };
+    };
-- 
2.55.0

