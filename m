Received: from mail-ej1-f50.google.com (mail-ej1-f50.google.com [209.85.218.50])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 26120339872
	for <devicetree@vger.kernel.org>; Mon, 27 Jul 2026 07:53:32 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.218.50
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1785138814; cv=none; b=fKoA8lrUuONpcNr4U2zwVUZ4Icr267EgCaD0moK/gfuJfITSdcHFx2dpDWY+mvaVoNHZqh5pV17CxxJMsKGIj4oJ3PJ3GKMCWf9TTCPEI2I8sPptKFiTVtIlGvNglHNvGUKZPEWY+vJ3nsuG4l9c9nDKaq+AiTF0kyw8AHdHzuE=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1785138814; c=relaxed/simple;
	bh=y6JIwdIepDyzjraq6zfjHmg6aYC4x/fsAGSfNHPByC0=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version; b=fUSd5mOkoR6kG21Ev25a8Fdg9LarHsRcY8RPgSt3GbuZNQFxRtzNPM+gCtaSLQVheJjsyiWB8mCbywAqpBvOQqhmj5lQp8nBbHwW0Exbh7UeryeC/t6F1zk0OxzS72PrutHRALfxI8KKbajeokO6rCXfyF1Z3coovHgJXERhKVw=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=eicpSk3P; arc=none smtp.client-ip=209.85.218.50
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="eicpSk3P"
Received: by mail-ej1-f50.google.com with SMTP id a640c23a62f3a-c1670dad7a8so366949666b.3
        for <devicetree@vger.kernel.org>; Mon, 27 Jul 2026 00:53:32 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1785138811; x=1785743611; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=6zZdAClxmTevqCUKw0Xa1m5MszX553esz6ujE1k4zSU=;
        b=eicpSk3P+KwpwAWmQS9C+Afw585JV6Fl2V8UX6Frctthclvg1eYoRCM+EgmO6nNPmo
         FzK43kOXcOGf7sKXQ7jyRAbwJux53drFrRIJTkYXhlMHFXuIOKnkEYgnWaGeWVVlkMeD
         HE2ycNkr+VeGNVpN9AGaQxgHloh50acoV7jGoPvX1LneZrnSZ5Qh9XR5dcNZbgRqD2BM
         /Hz3sRrOC5LysVq0Gde1KVt1l5SKETxdywr0klcR2LdliGySOh+ZGgddv7FmcuT6Ny3g
         NZE3gWOCbB9x/eO3+fGjnqgv74R3Ll4MIfBNgvYSrfzGC8CEJKq/6erdaWVWaxTa92a8
         9+WA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1785138811; x=1785743611;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to:content-type;
        bh=6zZdAClxmTevqCUKw0Xa1m5MszX553esz6ujE1k4zSU=;
        b=GLzB+VEJ/1v3ldvNckuwH+vnu9QgVhEo7fZlVH7jm4L5ISi1BXfzvZSwdv9ASLy26K
         MSDOa795cX9t0r/4cWgJAKeLfrN7OXEltEtmqFesSsDb7+JSeAAnENWyDCV9xjI55gAS
         rBBTrVHhm0uDRh/PIXlFGreNEGodd0iNd3TXu1ault1JVWY8k6SYI5UCgZDEbHP1w0Gn
         4/Nh51xz/M6p+RbHm7IpuXBQFVXkbr3BcNAZq1mHjvnnV02RQJt6hgBosY6UFcV0NL0D
         qx3OJLqKOkKCBW2Q7EnxXnDH4/PDK2PEIm1Dad83cEd4wjjbG+cxCtb1TykwJdBM3Q0J
         RVYw==
X-Forwarded-Encrypted: i=1; AHgh+RoSKD1zIdMBLcCEcoFOWmC8FX20qFt3xQHMSRq7DXMBCQ7sK8OI7TE5AoUcNGzv4HlZqX/ruyTwY+rb@vger.kernel.org
X-Gm-Message-State: AOJu0YwNnft1fX3Pzrs8k3ua/cHVdlTPCebu2v2OEbxZpMQqltwUGl+z
	FhKl9NCJn768liKh7hTdUEZoqLHCfKhcEODI1sMd6y84rflsgkbbd3KC
X-Gm-Gg: AR+sD13OxP23lgPniO+SQoWH9GdBlII65Xq2S6eCoJxGhF3b+Nr51qS+4cLw6Dy01q2
	jPQ+GLVG+kf74rMvhDh+w1wuV4UeyF1/PYb9RIwSvU42CBXh2xDJ8dHGrTK6bE48PrlgcG9IfNP
	NychKFiKmwPfsD83fdViv4z+ENdpPi1Md7zkjtQBt8Jn+IjQ0dA4eY7nEJPFFqrOGxmG2SlBOM6
	6BCcYoxCN6H0uv7cnViwL4tgk24o38fQ4JECuW06J3vB3vz4r97QSX0ab1a7vRjQE8sTXR1i96S
	bYGtDpFEe6/cNcPClrv3X+aJJalWftGl67Ilk0Bd2XMdURoGfLBlhba7r1ALMs/BB8lKvASY9t3
	GOFMylPS/XQHYuzGPAYjC9Nq1rFQnUQSc+B+VV8w2AMzGnExWnHLyt3someQf/MBuGKh7CzEOpf
	NLce8=
X-Received: by 2002:a17:907:608a:b0:c17:40e5:3d75 with SMTP id a640c23a62f3a-c1f1edaa13emr304274666b.16.1785138810959;
        Mon, 27 Jul 2026 00:53:30 -0700 (PDT)
Received: from NB-6746.. ([188.243.183.76])
        by smtp.gmail.com with ESMTPSA id a640c23a62f3a-c1c32ac0fa4sm596226866b.20.2026.07.27.00.53.29
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 27 Jul 2026 00:53:30 -0700 (PDT)
From: Artem Shimko <a.shimko.dev@gmail.com>
To: netdev@vger.kernel.org,
	Andrew Lunn <andrew@lunn.ch>,
	Heiner Kallweit <hkallweit1@gmail.com>,
	Russell King <linux@armlinux.org.uk>,
	"David S . Miller" <davem@davemloft.net>,
	Eric Dumazet <edumazet@google.com>,
	Jakub Kicinski <kuba@kernel.org>,
	Paolo Abeni <pabeni@redhat.com>,
	Rob Herring <robh@kernel.org>,
	Krzysztof Kozlowski <krzk+dt@kernel.org>,
	Conor Dooley <conor+dt@kernel.org>,
	Maxime Chevallier <maxime.chevallier@bootlin.com>
Cc: Artem Shimko <a.shimko.dev@gmail.com>,
	linux-kernel@vger.kernel.org,
	devicetree@vger.kernel.org
Subject: [PATCH net-next v4 1/2] dt-bindings: net: add DAPU Telecom DAP8211R(I) PHY binding
Date: Mon, 27 Jul 2026 10:53:23 +0300
Message-ID: <20260727075324.3555446-2-a.shimko.dev@gmail.com>
X-Mailer: git-send-email 2.43.0
In-Reply-To: <20260727075324.3555446-1-a.shimko.dev@gmail.com>
References: <20260727075324.3555446-1-a.shimko.dev@gmail.com>
Precedence: bulk
X-Mailing-List: devicetree@vger.kernel.org
List-Id: <devicetree.vger.kernel.org>
List-Subscribe: <mailto:devicetree+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:devicetree+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

Add device tree binding documentation for the DAPU Telecom DAP8211R(I)
Gigabit Ethernet PHY.

The PHY supports TX and RX clock delays in 150 ps steps from 0 to 2250 ps,
with a default of 1950 ps if not specified.

Signed-off-by: Artem Shimko <a.shimko.dev@gmail.com>
---
 .../bindings/net/dapu,dap8211r.yaml           | 63 +++++++++++++++++++
 1 file changed, 63 insertions(+)
 create mode 100644 Documentation/devicetree/bindings/net/dapu,dap8211r.yaml

diff --git a/Documentation/devicetree/bindings/net/dapu,dap8211r.yaml b/Documentation/devicetree/bindings/net/dapu,dap8211r.yaml
new file mode 100644
index 000000000000..ba9b301ea1f5
--- /dev/null
+++ b/Documentation/devicetree/bindings/net/dapu,dap8211r.yaml
@@ -0,0 +1,63 @@
+# SPDX-License-Identifier: (GPL-2.0-only OR BSD-2-Clause)
+%YAML 1.2
+---
+$id: http://devicetree.org/schemas/net/dapu,dap8211r.yaml#
+$schema: http://devicetree.org/meta-schemas/core.yaml#
+
+title: DAPU Telecom DAP8211R(I) Gigabit Ethernet PHY
+
+maintainers:
+  - Artem Shimko <a.shimko.dev@gmail.com>
+
+description: |
+  The DAP8211R(I) is a Gigabit Ethernet PHY with RGMII interface,
+  supporting IEEE 802.3az Energy Efficient Ethernet, IEEE 1588 SyncE,
+  and an internal packet generator for diagnostics.
+
+  Specifications:
+    - 10BASE-Te, 100BASE-TX, 1000BASE-T
+    - RGMII with configurable TX/RX clock delays (150 ps steps, 0-2250 ps)
+    - IEEE 802.3az-2010 Energy Efficient Ethernet
+    - IEEE 1588 SyncE support
+    - Internal packet generator and checker for link diagnostics
+
+allOf:
+  - $ref: ethernet-phy.yaml#
+
+properties:
+  compatible:
+    const: ethernet-phy-id0008.011b
+
+  reg:
+    maxItems: 1
+
+  rx-internal-delay-ps:
+    description:
+      RGMII RX clock delay in picoseconds (0 to maximum).
+    multipleOf: 150
+    maximum: 2250
+    default: 1950
+
+  tx-internal-delay-ps:
+    description:
+      RGMII TX clock delay in picoseconds (0 to maximum).
+    multipleOf: 150
+    maximum: 2250
+    default: 1950
+
+unevaluatedProperties: false
+
+examples:
+  - |
+    mdio {
+        #address-cells = <1>;
+        #size-cells = <0>;
+
+        ethernet-phy@1 {
+            compatible = "ethernet-phy-id0008.011b";
+            reg = <1>;
+            rx-internal-delay-ps = <2100>;
+            tx-internal-delay-ps = <2100>;
+        };
+    };
+
-- 
2.43.0

