Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=209.85.221.43
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1792582477;
	b=Pk5M+MmHXSXJjMcunyMKfgzYEl6B4fShk8J/5SOpVVFhislsbTn7OGciEvnEmoihl5D7
	 2b057wG9+w0fpO1p18z5y6Oc+UlFu+6u6q/yNqeahW3cdGj7q5YpEW+m+8LumAaESQQYl
	 gcr49wZEvWj3DXKkWJV7HMmCLJaalgTnZX9nFnUEUPLFn3Ir3Ed37n75qA7zTVh0pDhIs
	 cU0FiRHOKpZ2Du4UNktmXeUrR4L6GV5nvkjCPiDGXrzjmdxpRINbNnoYQJLWZ9wkSx0ZB
	 4QEZYpBmrEZRy68Vd3lO/J/nO+YDxAbm1z7frOfiNJUuvngcsNUiEqKfCF29PpXyAjQ==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1792582477;
	h=DMARC-Filter:Received:DKIM-Signature:X-Google-DKIM-Signature:
	 X-Forwarded-Encrypted:X-Gm-Message-State:X-Gm-Gg:X-Received:Received:
	 From:To:Subject:Date:Message-ID:X-Mailer:In-Reply-To:References:
	 MIME-Version:Content-Transfer-Encoding;
	bh=e+ciZeljp4XbV+7Ul/HTP2zfMzICzcEEGNyLNPo0cRI=;
	b=uk56v6jfQ6UOcJhPyJUxaMCUkMEirAs0ohrSp3Ot8UWaqab2MVhbRL6aokjPa9Z9D8Jw
	 GNlwN75VW7OmUGNUs5eeUR06yObMQtnwmJG4Hm/mv3YG18m0TXA+x6yxi2u2EV7maRxmT
	 Q0VY6iDY4ZqIikrO7hoX9t2GkPxs8t2pgyP2XpDNGfnMX+y8y41bTyeV5tQXOVwzL/8ul
	 fcs5J7IuvnoqSqRc1LRdRg89Ne2rrJc1PELBkZRTwNOwl3JOEaaX0gRMFbyA8qmud3y08
	 X04TufXCDEYAsMn5uysCwNhxc0yW/RwLyRTej58vtQJ+l5Z3k69wnCucF2wWOImHZvw==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=gmail.com;
	spf=pass smtp.mailfrom=gmail.com;
	dkim=pass header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20251104 header.b=PwqR7+SE;
	arc=none smtp.remote-ip=209.85.221.43
Received: from mail-wr1-f43.google.com (mail-wr1-f43.google.com [209.85.221.43])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id AFA31606A320
	for <devicetree@vger.kernel.org>; Wed, 21 Oct 2026 11:34:36 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org AFA31606A320
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key, unprotected) header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20251104 header.b=PwqR7+SE
Received: by mail-wr1-f43.google.com with SMTP id ffacd0b85a97d-48e20ed3b9dso626325f8f.2
        for <devicetree@vger.kernel.org>; Wed, 21 Oct 2026 04:34:36 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1792582475; x=1793187275; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:to:from:from:to:cc:subject:date:message-id
         :reply-to:content-type;
        bh=e+ciZeljp4XbV+7Ul/HTP2zfMzICzcEEGNyLNPo0cRI=;
        b=PwqR7+SEfDE00LHg4c6TRp/whilgLicIH9x0KLuJDLz6mDthbM7bchork4oSUc81ng
         hALl3itrm02INZTTCzLc2RdczMaWHwhYOv0kJhdbCatYSwptUuOy/HTGu40yfyE0jtOG
         fzThuyYZibmqMqOj24UT0s9+iyvHzDtjh8+RIMKG3fXZUQTfBLFQvPRX2ipzDimQvR2g
         EnoGXlas70SxzBZDY1o7/Fz2+EOLGzeo7HF9YetHEK3WN5n4Nqg33sEykBzHaffOzjzk
         U9sMBK3RGjSSGPXXDfLiTZFiablIHEM9K/y+UPLBohxP0Y/1bOHNWGClAMBYIJE4dh3v
         ubgg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1792582475; x=1793187275;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:to:from:x-gm-gg:x-gm-message-state:from:to
         :cc:subject:date:message-id:reply-to:content-type;
        bh=e+ciZeljp4XbV+7Ul/HTP2zfMzICzcEEGNyLNPo0cRI=;
        b=oQKeHbLUqLNi3qS5Oy0y407iqmPHnbj4inZ6gd6EaU5BlgkXQPvl5u4f+yGKRivmvx
         XInpG6CIU9seOK51GKRLpnGvXO5I+auY7FJG26mkqMmCyitODIM97wEUmUA4oPQJ2kOd
         K3Fy1yUlXJnTSd3DL/mxTsPNtrNMGWHnOvRAMTV7zQL/a5f1+dpML3+xcyaXyNzZxLIH
         ZaTHX1chaC3xkWe3sm2hqFvyiuCL57t76Rt1u67UN4c//yWHJJdj3G3cvxSA3W/e5si+
         1DfqMcW4h4Nrmu9yqTRXmK8zA0Z3wic+SWrSNxp7pjvlgPixaPq9Hufdm1SKDuuvKpZO
         Q/dA==
X-Forwarded-Encrypted: i=1; AKwUvBz4JOg59EWmSwPNGLyMnqnzv8ay+czcHA5SwLNwVNBBywOXJtdDIzS14vze/4yzUn9tuR01iWsgoktG@vger.kernel.org
X-Gm-Message-State: AFq9FYJyONavLeonS4qcA/P14XCrvSXsgkWCHXYDnKIfUSybqP8oTefs
	xGu/orNvNnILbWtnEFRsLhgLziRIdxRaG/S0rSzG7ckKE25FLCflnjH5
X-Gm-Gg: AYBFou1p9fKPq3pitlzChXaPMKq/28ck3rEQKBuTeNgBvRne0mM/qmPk/ZjC3nD8KEa
	ubX4acyX+J6Awcmqp3+nYUOkUpoojLWaAtojtKNVFMx67h0Ax54vqt4rbheWlpvoa0PJ4YhTcIR
	XwUHbPJejTwlTOuRfbp8Socq2tzhGo96PBVE+vtlRH8AWaosX8m8lq8B3oDs7++ON8r5ndOyQFf
	QcxtxfeJ857dLjoO81p4Y/QF/YSs9yIWJ1uYiYq7hO/twXEhIaL9ZXriFctA3ZkoFzoIp7u3WwF
	uRJPJ6hvaBYncswqshNZ6kIfF6hkQczuGvbT6Z8fmzPh3k1MwlDFwa1A0kfnmMaUNbppmlrSI4k
	h+GkPsLcD/tnWm3MCuZjMTxf31MUdx2K/iEV5TTO0qcrcg0lvaCmiBeDahyeMfSFemaxkARNfxR
	dY+QdV4l9ej4CNnC96tnmZqP/S1tFbRHQtsTl84bk9fZFiaqUts5Za+CriBoIRn1MzrFT/AfX/7
	ts1X0+VH/cjBxiiSHwMqBsd74eWGk1ig2ok6OoZ/XVTTXzSf6aDHNL5huD7maQEXTF5gwFlnlmB
	6LbIeu1NCIjzYLLtxTC6t4HkLNRfRkh62rNp5QyuWVqP/WNDmnHrdtpdcDhK
X-Received: by 2002:a05:6000:4b0b:b0:48c:414f:cc12 with SMTP id ffacd0b85a97d-48e264d185bmr3297266f8f.40.1792582474839;
        Wed, 21 Oct 2026 04:34:34 -0700 (PDT)
Received: from Ansuel-XPS24.localdomain (93-34-92-187.ip49.fastwebnet.it. [93.34.92.187])
        by smtp.googlemail.com with ESMTPSA id ffacd0b85a97d-48e25833b9asm5068768f8f.33.2026.10.21.04.34.33
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 21 Oct 2026 04:34:34 -0700 (PDT)
From: Christian Marangi <ansuelsmth@gmail.com>
To: Lee Jones <lee@kernel.org>,
	Rob Herring <robh@kernel.org>,
	Krzysztof Kozlowski <krzk+dt@kernel.org>,
	Conor Dooley <conor+dt@kernel.org>,
	Christian Marangi <ansuelsmth@gmail.com>,
	mfd@lists.linux.dev,
	devicetree@vger.kernel.org,
	linux-kernel@vger.kernel.org
Subject: [RESEND PATCH 1/2] dt-bindings: mfd: Document support for Airoha AN8855 Switch SoC
Date: Wed, 21 Oct 2026 13:34:16 +0200
Message-ID: <20261021113419.283015-2-ansuelsmth@gmail.com>
X-Mailer: git-send-email 2.55.0
In-Reply-To: <20261021113419.283015-1-ansuelsmth@gmail.com>
References: <20261021113419.283015-1-ansuelsmth@gmail.com>
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
Reviewed-by: Rob Herring (Arm) <robh@kernel.org>
---
 .../bindings/mfd/airoha,an8855.yaml           | 176 ++++++++++++++++++
 1 file changed, 176 insertions(+)
 create mode 100644 Documentation/devicetree/bindings/mfd/airoha,an8855.yaml

diff --git a/Documentation/devicetree/bindings/mfd/airoha,an8855.yaml b/Documentation/devicetree/bindings/mfd/airoha,an8855.yaml
new file mode 100644
index 000000000000..48127e956c96
--- /dev/null
+++ b/Documentation/devicetree/bindings/mfd/airoha,an8855.yaml
@@ -0,0 +1,176 @@
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
+  ethernet-switch:
+    type: object
+    $ref: /schemas/net/dsa/airoha,an8855-switch.yaml
+    description: Switch exposed by the Airoha AN8855 SoC
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
+  - ethernet-switch
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
+            ethernet-switch {
+                compatible = "airoha,an8855-switch";
+
+                ports {
+                    #address-cells = <1>;
+                    #size-cells = <0>;
+
+                    port@0 {
+                        reg = <0>;
+                        label = "lan1";
+                        phy-mode = "internal";
+                        phy-handle = <&internal_phy1>;
+                    };
+
+                    port@1 {
+                        reg = <1>;
+                        label = "lan2";
+                        phy-mode = "internal";
+                        phy-handle = <&internal_phy2>;
+                    };
+
+                    port@5 {
+                        reg = <5>;
+                        label = "cpu";
+                        ethernet = <&gmac0>;
+                        phy-mode = "2500base-x";
+
+                        fixed-link {
+                            speed = <2500>;
+                            full-duplex;
+                            pause;
+                        };
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

