Authentication-Results: smtp.subspace.kernel.org; arc=pass header.oldest-pass=0 smtp.remote-ip=100.103.45.18
ARC-Seal: i=2; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=pass;
	t=1795558203;
	b=5lzxW0BF+K2diAi49Yov7m1sZV2yy97F50toSAR96VLLZ6duM/Al+LeTbeiEPY16fNiw
	 xU0GmfLstSEc+eGnkX48Mf22s0m7A/K+ACFsSVxqJt2jaLnkHcMvstgJr6FT9k45S0l/g
	 IXGkPj6bCz8uimw58E3nTIebyL0jBXNQelPQs5ysXY8Q1c5JXBeE7MVkLY6XmPKOKg06F
	 zuYmMGrbwNj92CaBWY1lkYw8bj/eU0KH5JdKo7cvsKZYSphprE+MB+nLqjeMQiAmA20Dj
	 I3xSfo/fJEBscShX7pi/ObPjotOuTe4yaFPLEVQPbUl4Mf/ihL+ZaiF1H2+eoZErG5A==
ARC-Message-Signature: i=2; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1795558203;
	h=Received:DKIM-Signature:Received:From:Date:Subject:MIME-Version:
	 Content-Type:Message-Id:References:In-Reply-To:To:Cc:X-Mailer:
	 X-Developer-Signature:X-Developer-Key:X-Endpoint-Received:
	 X-Original-From:Reply-To:Content-Transfer-Encoding;
	bh=MQluB+rCmoSqcxT7VMK5v52BeO5XQh+YYMA/T2P3rzc=;
	b=4NkV/buDRxpqsZxXDoE/oYHk8z7yEVOvhI+lkrlO8ex0H2Zcw7dkE4TrHfXgrvUntgTv
	 q8Tuq0JJeBPUZS3I0Iy164pwcMlROAKPOA63I38Cyb7cloWNM7Jm5x5m1jmUrORROhIrm
	 5kxosFkGlyxAhOOQ61lP+4DdmpcrG4xyOb+bBCprDyRreCrVQjMX2BoK/qT/6MJavXKnf
	 UcpLN7Y26ffpEDp96/7lpHKDPnIv9dWLklEZM2zDvWJAmNfuwtuZ/YGP/NelcKjdkc2XZ
	 V5id1vjNC1UFU1pBeH3KZzBKM0C3eK18jmAuXJ0FKm4cJrIxZcgpZZieELJQ+swTj7w==
ARC-Authentication-Results: i=2; smtp.subspace.kernel.org; 
	dkim=pass header.d=kernel.org header.i=@kernel.org header.a=rsa-sha256 header.s=k20260515 header.b=ZOpGpi3Y;
	arc=pass header.oldest-pass=0 smtp.remote-ip=100.103.45.18
Received: from smtp.kernel.org (quasi.space.kernel.org [100.103.45.18])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 417AA606A31E;
	Tue, 24 Nov 2026 22:10:03 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.a=rsa-sha256 header.s=k20260515 header.b=ZOpGpi3Y
Authentication-Results: smtp.kernel.org; arc=none smtp.remote-ip=100.80.115.77
ARC-Seal: i=1; d=kernel.org; s=arc20260519; a=rsa-sha256; cv=none;
	t=1795558203;
	b=bi5CDkhdu93RRAz/7pHDVjhoblRHgwRqdy+HDp9ekTSXMQIMrZDKuz/359JqKtuurpp+
	 JRm4R2OeRoEQkZcX8cdKk/vbSDTjuX4mmyfsHzMiZqUmOfTv/XrNyWHnkUVBd+pPlxmSO
	 4+lEeyD2Xyp74ocpPcp8+x2+JRwWvvv03USNw+/WoI2Fi1sMA6ZMw3bOi6jaD8FKwg+zZ
	 p66RzoF89nl0ptZqQbobXO1tEa7YTEdhMg4Vv5MIIfO6GrEvaFfNjEeicV339VywiIxfa
	 U8fMtxoF8gCdUar5dljnQv6egqfKE5sjfnrECp19I3tpvxKMCyhvMYAGZTW7epL3P1A==
ARC-Message-Signature: i=1; d=kernel.org; s=arc20260519; a=rsa-sha256;
	c=relaxed/relaxed; t=1795558203;
	h=DKIM-Signature:Received:From:Date:Subject:MIME-Version:Content-Type:
	 Message-Id:References:In-Reply-To:To:Cc:X-Mailer:
	 X-Developer-Signature:X-Developer-Key:X-Endpoint-Received:
	 X-Original-From:Reply-To:Content-Transfer-Encoding;
	bh=MQluB+rCmoSqcxT7VMK5v52BeO5XQh+YYMA/T2P3rzc=;
	b=aFmtw77Np9wW4Sy9My3eCtPM+2rHg/2ofxGy7zEARtGmWaUmir1k5resW+0APYzbFymU
	 ZjD/Qw8v1Zz3tiDXfss8Fjmplj771uzrvauxH6kV4zSJJOKhyzBBLw14kX0xzj4KwWYjN
	 L5BkV5BhSWp3oB6ILqSgTY0MFSgRL88Ml/7y6cxIbKmUaYBopg0mIGAiLmLdi863mr5LU
	 j3dXFXJdovOClo9FqurrBumCmkHmM5SsmyUk9dAJYYIA7UR8xlHtL8LgGwVVsAhJ6QDwz
	 PgCjsrzjeSYtC7pDxdzNowai4iAnoTbTxqxI6YG1YmoGlC1pNM5urMF24q8MKrBi4lQ==
ARC-Authentication-Results: i=1; smtp.kernel.org; 
	arc=none smtp.remote-ip=100.80.115.77
Received: from lkml.kernel.org (nexus.subspace.kernel.org [100.80.115.77])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.kernel.org (Postfix) with ESMTPS id 184451F000CF;
	Tue, 24 Nov 2026 22:09:57 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kernel.org;
	s=k20260515; t=1795558203;
	bh=MQluB+rCmoSqcxT7VMK5v52BeO5XQh+YYMA/T2P3rzc=;
	h=From:Date:Subject:References:In-Reply-To:To:Cc:Reply-To;
	b=ZOpGpi3YvZfkrBzxTGD9IqlNquHGvbjK+ebxVla3WRmsChoX7KjG3Lx8JCzuuymgg
	 1YsK7wKWy8vdySm3uIQRYNS18kG++dx0sZ42lTF//5+AvB+tOjuAw/iMSdeXwHfDsp
	 PXdEnCRbreYjcaD5khaBBWsrx5z3EHZ5VbxPLmWLLOk3XziWNTJV3LkpG2FdDuyO2j
	 TSxIUqMopZAcZysxs9CtEOpQAqq5r2wCrQQV14yyGaC6SZsHjvIxWkQMQXFnONbMMu
	 28+efBrJN9alPiF77NwFgurDTzOLG2GNFRwMXgfHjyt7SEvYuXX5nlY9Yol8u6OuE1
	 JQkT3HgZoQTDg==
Received: from nexus.subspace.kernel.org (localhost [IPv6:::1])
	by lkml.kernel.org (Postfix) with ESMTP id 9207C4CBC5;
	Tue, 24 Nov 2026 22:09:56 +0000 (UTC)
From: Selvamani Rajagopal via B4 Relay <devnull+Selvamani.Rajagopal.onsemi.com@kernel.org>
Date: Tue, 24 Nov 2026 14:09:49 -0800
Subject: [PATCH net-next v12 01/15] dt-bindings: net: add onsemi's S2500
X-Mailing-List: devicetree@vger.kernel.org
List-Id: <devicetree.vger.kernel.org>
List-Post: <mailto:devicetree@vger.kernel.org>
List-Help: <mailto:devicetree+help@vger.kernel.org>
List-Subscribe: <mailto:devicetree+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:devicetree+unsubscribe@vger.kernel.org>
List-Owner: <mailto:devicetree+owner@vger.kernel.org>
Precedence: list
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Message-Id: <20261124-s2500-mac-phy-support-v12-1-3575855d99f9@onsemi.com>
References: <20261124-s2500-mac-phy-support-v12-0-3575855d99f9@onsemi.com>
In-Reply-To: <20261124-s2500-mac-phy-support-v12-0-3575855d99f9@onsemi.com>
To: Andrew Lunn <andrew@lunn.ch>, Heiner Kallweit <hkallweit1@gmail.com>, 
 Russell King <linux@armlinux.org.uk>, 
 "David S. Miller" <davem@davemloft.net>, Jakub Kicinski <kuba@kernel.org>, 
 Paolo Abeni <pabeni@redhat.com>, Andrew Lunn <andrew+netdev@lunn.ch>, 
 Parthiban Veerasooran <parthiban.veerasooran@microchip.com>, 
 Selva Rajagopal <selvamani.rajagopal@onsemi.com>, 
 Richard Cochran <richardcochran@gmail.com>, Rob Herring <robh@kernel.org>, 
 Krzysztof Kozlowski <krzk+dt@kernel.org>, 
 Conor Dooley <conor+dt@kernel.org>, Simon Horman <horms@kernel.org>, 
 Jonathan Corbet <corbet@lwn.net>, Shuah Khan <skhan@linuxfoundation.org>, 
 Randy Dunlap <rdunlap@infradead.org>, Eric Dumazet <edumazet@kernel.org>, 
 Piergiorgio Beruto <piergiorgio.beruto@gmail.com>, 
 Eric Dumazet <edumazet@kernel.org>
Cc: netdev@vger.kernel.org, linux-kernel@vger.kernel.org, 
 devicetree@vger.kernel.org, linux-doc@vger.kernel.org, 
 Jerry Ray <jerry.ray@microchip.com>, 
 Ciprian Regus <ciprian.regus@analog.com>, 
 Selvamani Rajagopal <Selvamani.Rajagopal@onsemi.com>, 
 Krzysztof Kozlowski <krzysztof.kozlowski@oss.qualcomm.com>
X-Mailer: b4 0.13.0
X-Developer-Signature: v=1; a=ed25519-sha256; t=1795558193; l=4355;
 i=Selvamani.Rajagopal@onsemi.com; s=20260531; h=from:subject:message-id;
 bh=q9t30XlaBbVJWQqOwwkV/4rV3HxPdwscHINleug1/ps=;
 b=DoflO4W97N0DLp24MOr8F3nlFrPVWOM/S1cPMdAV4jXE3boHNHWb/cQ/C/PWYOts7N57MEEo8
 Dn4Q3rYzvJ0ArSMggKXkrWBF9u/6g9ZCjMK4nkaWjTtpirua5aoOor+
X-Developer-Key: i=Selvamani.Rajagopal@onsemi.com; a=ed25519;
 pk=5QRdM0HS/LGWWcUZZ9hVfZ+qbPQGZCumcTXOiN7Fyug=
X-Endpoint-Received: by B4 Relay for
 Selvamani.Rajagopal@onsemi.com/20260531 with auth_id=803
X-Original-From: Selvamani Rajagopal <Selvamani.Rajagopal@onsemi.com>
Reply-To: Selvamani.Rajagopal@onsemi.com
Content-Transfer-Encoding: 7bit

From: Selvamani Rajagopal <Selvamani.Rajagopal@onsemi.com>

Add device tree binding for the onsemi S2500 IEEE 802.3cg
compliant Ethernet transceiver device.

S2500 has both Media Access Controller (MAC) and 10BASE-T1S
Ethernet PHY. MAC implements 10 Mbps half duplex Ethernet
MAC. Communication between the host and MAC-PHY is defined in
OPEN Alliance 10BASE-T1x MACPHY Serial Interface document.

Reviewed-by: Krzysztof Kozlowski <krzysztof.kozlowski@oss.qualcomm.com>
Signed-off-by: Selvamani Rajagopal <Selvamani.Rajagopal@onsemi.com>

---
changes in v12
  - No change
changes in v11
  - No change
changes in v10
  - No change
changes in v9
  - No changes
changes in v8
  - Changed the interrupt type to level triggered
  - Added reset-gpios entry that was recently supported.
changes in v7
  - Added the missing review tag
  - Removed the word YAML from the commit message
changes in v6
  - Moved the signed off information to the right place.
changes in v5
  - no changes
changes in v4:
  - added spi-max-frequency as suggested by AI review
  - changed interrupt to IRQ_TYPE_EDGE_FALLING as it is
    being taken care in net (stable) branch
changes in v3
  - Removed URL link that failed verification
changes in v2
  - removed spi-max-frequency entry
  - changed the compatible string to s2500
changes in v1
  - Added the first version of YAML file for onsemi MAC-PHY
---
 .../devicetree/bindings/net/onnn,s2500.yaml        | 71 ++++++++++++++++++++++
 MAINTAINERS                                        |  6 ++
 2 files changed, 77 insertions(+)

diff --git a/Documentation/devicetree/bindings/net/onnn,s2500.yaml b/Documentation/devicetree/bindings/net/onnn,s2500.yaml
new file mode 100644
index 000000000000..e1df674c0f1e
--- /dev/null
+++ b/Documentation/devicetree/bindings/net/onnn,s2500.yaml
@@ -0,0 +1,71 @@
+# SPDX-License-Identifier: (GPL-2.0-only OR BSD-2-Clause)
+%YAML 1.2
+---
+$id: http://devicetree.org/schemas/net/onnn,s2500.yaml#
+$schema: http://devicetree.org/meta-schemas/core.yaml#
+
+title: onsemi S2500 10BASE-T1S MACPHY Ethernet Controllers
+
+maintainers:
+  - Selvamani Rajagopal <Selvamani.Rajagopal@onsemi.com>
+
+description:
+  The S2500 combines a Media Access Controller (MAC) and an
+  Ethernet PHY to enable 10BASE-T1S networks. The Ethernet Media Access
+  Controller (MAC) module implements a 10 Mbps half duplex Ethernet MAC,
+  compatible with the IEEE 802.3 standard and a 10BASE-T1S physical layer
+  transceiver integrated into the S2500. The communication between
+  the host and the MAC-PHY is specified in the OPEN Alliance 10BASE-T1x
+  MACPHY Serial Interface (TC6).
+
+allOf:
+  - $ref: /schemas/net/ethernet-controller.yaml#
+  - $ref: /schemas/spi/spi-peripheral-props.yaml#
+
+properties:
+  compatible:
+    const: onnn,s2500
+
+  reg:
+    maxItems: 1
+
+  interrupts:
+    description:
+      Interrupt from MAC-PHY asserted in the event of Receive Chunks
+      Available, Transmit Chunk Credits Available and Extended Status
+      Event.
+    maxItems: 1
+
+  reset-gpios:
+    description:
+      GPIO connected to the active-low RST_N pin of the MAC-PHY.
+    maxItems: 1
+
+  spi-max-frequency:
+    maximum: 25000000
+
+required:
+  - compatible
+  - reg
+  - interrupts
+  - spi-max-frequency
+
+unevaluatedProperties: false
+
+examples:
+  - |
+    #include <dt-bindings/interrupt-controller/irq.h>
+    spi {
+      #address-cells = <1>;
+      #size-cells = <0>;
+
+      ethernet@0 {
+        compatible = "onnn,s2500";
+        reg = <0>;
+        pinctrl-names = "default";
+        pinctrl-0 = <&eth0_pins>;
+        interrupt-parent = <&gpio>;
+        interrupts = <25 IRQ_TYPE_LEVEL_LOW>;
+        spi-max-frequency = <15000000>;
+      };
+    };
diff --git a/MAINTAINERS b/MAINTAINERS
index 97308edec53d..679b3b9565a1 100644
--- a/MAINTAINERS
+++ b/MAINTAINERS
@@ -21033,6 +21033,12 @@ S:	Supported
 W:	http://www.onsemi.com
 F:	drivers/net/phy/ncn*
 
+ONSEMI S2500 10BASE-T1S MACPHY ETHERNET DRIVER
+M:	Selvamani Rajagopal <selvamani.rajagopal@onsemi.com>
+L:	netdev@vger.kernel.org
+S:	Supported
+F:	Documentation/devicetree/bindings/net/onnn,s2500.yaml
+
 OP-TEE DRIVER
 M:	Jens Wiklander <jenswi@kernel.org>
 L:	op-tee@lists.trustedfirmware.org (moderated for non-subscribers)

-- 
2.43.0


