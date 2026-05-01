Received: from mail-qv1-f43.google.com (mail-qv1-f43.google.com [209.85.219.43])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 76EF33DDDA5
	for <devicetree@vger.kernel.org>; Fri,  1 May 2026 15:54:55 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.219.43
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1777650897; cv=none; b=nc9H27YqeagDwVJ8NZAd3f+Oe6u7CuRguVN4Ubv4I9yFIm93tFcDmrWhRicOxyudTpKDhpR+iSWr2gP8RMYZPGWRDc4wBEXggOeqOWCcrenj1XAbgnqozQhD2LyYt/zCFRgjt2dQvSPZWJOxUhfXYwxC39+Ci8IFU35P88l0AFE=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1777650897; c=relaxed/simple;
	bh=3EvigSq/dpN+56ACeHHTAxXSD8//ELNhyucmUDQBNOc=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version; b=EzpuiOr4Y1HsstU+brdluRFiSDTszlX09kzj4xWhtwsY1V8UC2aAUeKaW0cfgYvX9IuqYFZMBWeQxLfvpxsXex2pD1Wtgb3Mt0pd84EV9hCPqIv0bJx3238mq4Kh6zyvjAlbF7d37zJcDNlHcxr21h+31hfo2NlcW/zkEBhETNA=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=riscstar.com; spf=pass smtp.mailfrom=riscstar.com; dkim=pass (2048-bit key) header.d=riscstar-com.20251104.gappssmtp.com header.i=@riscstar-com.20251104.gappssmtp.com header.b=d5TuYKoB; arc=none smtp.client-ip=209.85.219.43
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=riscstar.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=riscstar.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=riscstar-com.20251104.gappssmtp.com header.i=@riscstar-com.20251104.gappssmtp.com header.b="d5TuYKoB"
Received: by mail-qv1-f43.google.com with SMTP id 6a1803df08f44-8b5ee185facso3447886d6.1
        for <devicetree@vger.kernel.org>; Fri, 01 May 2026 08:54:55 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=riscstar-com.20251104.gappssmtp.com; s=20251104; t=1777650894; x=1778255694; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=YQxIO0Y/h8byqARAs3DXDHZ5gcHRkK0ijPD4wFq7rUk=;
        b=d5TuYKoB1iNsFXPzdfSOfPMA7JWzQQqwg6krbNhrtbUusGhP9e3jmHXdIhMEItlfKp
         5e45rfC8NWzOUeDXRI0CVnq4Q5HANPmxneXZplZQs1ZAwCmv7KgE1cGy8XtkXH6rkF6s
         AOYMX8J6uXur0xsiV1qplMsypsj2RpWYPeYNHxuhmghjJ4gX4+xQCoSBZ0GKMVq2zM+2
         Jr4TIKHd5ATzfGZzmD97JkTIW0COn7ywuWNuI+CXqIlJv2K8cEyh8lLtrETU+Jtijy7Z
         Cs/oNQOyD3GbSgLRnqDlFz+So/Y1++kWFvYjQVoKIsrQQ49LKujs+wep8QzqCRwqC9Dr
         WSPg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1777650894; x=1778255694;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to;
        bh=YQxIO0Y/h8byqARAs3DXDHZ5gcHRkK0ijPD4wFq7rUk=;
        b=Pk0WBPu/4/EbMtid9GUZwV8Dt9AEmAR2T/wmY88+1f8ZBg8ZxPQ/0/V61leWE4HI8V
         u6wlA8xpPQuHIUISt0yTBB7UPrARfDeHJ0zvU691BmK6EOwKW16WmlVdJaXmUv5qC7xt
         whECvE5k1/b4FlMYV76rzDNQnF3oNk3EwonVIdxdsXSHHp5iMkwcJEIr+BtRItL5U6YA
         Ism0CzdWoMkt47H1/b+IKr+bRmikw7vUvLKgospBelLMnO+SmLb1Y++5ohfAJ7JIntI4
         5YvW27djCM74WpEbd5QiVY816/xpdb6S6nUMqRLK11UtrJtdOBRLXy3N5lINJMwybmZf
         BMWw==
X-Forwarded-Encrypted: i=1; AFNElJ/E599QvOnVVzceALlBzX7e4KT/0I1uzgoMRMwYxF4EywpTkBLZy6gBl0Ih4j9PyQR0vHuRGSsi7Jdp@vger.kernel.org
X-Gm-Message-State: AOJu0YyMGSgaj1w4C5Zhk3/eA/qc90r5u/oaZJ1o3EURx67m5J8qybcV
	32njWf4vNygbrPAlLxkaCHCT3jtihfJs8gNKa3xJqlfmDg16JSnByhHUYUwLa6NU1O0=
X-Gm-Gg: AeBDieurGE17Kr2uFbszlaFmwjStBpeFvayXx016MMewf9LrOkTZKRtpn3D0cEVeL+O
	JhHS6TXarolZTIBM7Sv/99zyF/6IU20GXnhRryUvkarOWNjBrirJV7WBCzSX6n0hLEqbSK/gspy
	shfbLemFDA/3ElEzHbad68NwkuZFXHQevntK+lIy6ko2RPKfZITkOuPwZ3W/c/FjZYSG+MqA0BP
	lvzxWoyLmTVl7K7zzqCpOcyul1AggvXCbt0evsSlHthi952t2ylPaQwMzPKFiycB7o955z14ZLU
	C+53BlKARYnt1pKFK+nujuv2+T+3j7c3vvzoyf8SdWp6m+do5vB+nSSgiU1myIsasOKvEfVsG+8
	XSx5MLME2BgBWhVnSzM+1tuTTgnWtwC1UM6nD9eIdcV0c4XtaJDqUGO+OvUQHeHF44WrK/2/Q6+
	8DEi3JxgqTPZABiLle/1Ecw9juyfGbUXuJXg2xXzblOb8QSs7L7q0hTncdUNxAoILvx3amHSi+o
	LwnEg==
X-Received: by 2002:a05:6214:54c9:b0:8a6:f065:3ef9 with SMTP id 6a1803df08f44-8b6664fcf69mr1373226d6.15.1777650894371;
        Fri, 01 May 2026 08:54:54 -0700 (PDT)
Received: from zippy.localdomain (c-75-72-117-212.hsd1.mn.comcast.net. [75.72.117.212])
        by smtp.gmail.com with ESMTPSA id 6a1803df08f44-8b539aa7293sm26615406d6.22.2026.05.01.08.54.51
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 01 May 2026 08:54:53 -0700 (PDT)
From: Alex Elder <elder@riscstar.com>
To: andrew+netdev@lunn.ch,
	davem@davemloft.net,
	edumazet@google.com,
	kuba@kernel.org,
	pabeni@redhat.com,
	maxime.chevallier@bootlin.com,
	rmk+kernel@armlinux.org.uk,
	andersson@kernel.org,
	konradybcio@kernel.org,
	robh@kernel.org,
	krzk+dt@kernel.org,
	conor+dt@kernel.org,
	linusw@kernel.org,
	brgl@kernel.org,
	arnd@arndb.de,
	gregkh@linuxfoundation.org
Cc: Daniel Thompson <daniel@riscstar.com>,
	elder@riscstar.com,
	mohd.anwar@oss.qualcomm.com,
	a0987203069@gmail.com,
	alexandre.torgue@foss.st.com,
	ast@kernel.org,
	boon.khai.ng@altera.com,
	chenchuangyu@xiaomi.com,
	chenhuacai@kernel.org,
	daniel@iogearbox.net,
	hawk@kernel.org,
	hkallweit1@gmail.com,
	inochiama@gmail.com,
	john.fastabend@gmail.com,
	julianbraha@gmail.com,
	livelycarpet87@gmail.com,
	matthew.gerlach@altera.com,
	mcoquelin.stm32@gmail.com,
	me@ziyao.cc,
	prabhakar.mahadev-lad.rj@bp.renesas.com,
	richardcochran@gmail.com,
	rohan.g.thomas@altera.com,
	sdf@fomichev.me,
	siyanteng@cqsoftware.com.cn,
	weishangjuan@eswincomputing.com,
	wens@kernel.org,
	netdev@vger.kernel.org,
	bpf@vger.kernel.org,
	linux-arm-msm@vger.kernel.org,
	devicetree@vger.kernel.org,
	linux-gpio@vger.kernel.org,
	linux-stm32@st-md-mailman.stormreply.com,
	linux-arm-kernel@lists.infradead.org,
	linux-kernel@vger.kernel.org
Subject: [PATCH net-next 08/12] dt-bindings: net: toshiba,tc965x-dwmac: add TC956x Ethernet bridge
Date: Fri,  1 May 2026 10:54:16 -0500
Message-ID: <20260501155421.3329862-9-elder@riscstar.com>
X-Mailer: git-send-email 2.51.0
In-Reply-To: <20260501155421.3329862-1-elder@riscstar.com>
References: <20260501155421.3329862-1-elder@riscstar.com>
Precedence: bulk
X-Mailing-List: devicetree@vger.kernel.org
List-Id: <devicetree.vger.kernel.org>
List-Subscribe: <mailto:devicetree+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:devicetree+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

From: Daniel Thompson <daniel@riscstar.com>

Add devicetree bindings for the Toshiba TC956x family of Ethernet-AVB/TSN
bridges.

Signed-off-by: Daniel Thompson <daniel@riscstar.com>
Signed-off-by: Alex Elder <elder@riscstar.com>
---
 .../bindings/net/toshiba,tc956x-dwmac.yaml    | 111 ++++++++++++++++++
 1 file changed, 111 insertions(+)
 create mode 100644 Documentation/devicetree/bindings/net/toshiba,tc956x-dwmac.yaml

diff --git a/Documentation/devicetree/bindings/net/toshiba,tc956x-dwmac.yaml b/Documentation/devicetree/bindings/net/toshiba,tc956x-dwmac.yaml
new file mode 100644
index 0000000000000..d95d22a3761da
--- /dev/null
+++ b/Documentation/devicetree/bindings/net/toshiba,tc956x-dwmac.yaml
@@ -0,0 +1,111 @@
+# SPDX-License-Identifier: (GPL-2.0-only OR BSD-2-Clause)
+%YAML 1.2
+---
+$id: http://devicetree.org/schemas/net/toshiba,tc956x-dwmac.yaml#
+$schema: http://devicetree.org/meta-schemas/core.yaml#
+
+title: Toshiba TC956x Ethernet-AVB/TSN Controller
+
+maintainers:
+  - Alex Elder <elder@riscstar.com>
+  - Daniel Thompson <daniel@riscstar.com>
+
+description: |
+  This node provides properties for configuring the Ethernet PCI functions
+  that are attached to the internal downstream port of the TC956x's PCIe
+  switch.
+
+  TC956x are a family of Ethernet-AVB/TSN bridge chips that combine a PCIe
+  switch together with a number of Ethernet controllers. These bindings
+  cover only the Ethernet functions of these devices.
+
+allOf:
+  - $ref: /schemas/pci/pci-bus-common.yaml#
+  - $ref: /schemas/pci/pci-device.yaml#
+
+unevaluatedProperties: false
+
+properties:
+  compatible:
+    enum:
+      - pci1179,0220 # Toshiba TC9564 (a.k.a. Qualcomm QPS615)
+
+  "#gpio-cells":
+    const: 2
+
+  gpio-controller: true
+
+  # We can't allOf reference Ethernet-controller.yaml because we end up with
+  # contradictory $nodename rules (`ethernet@` versus `pci@`). Happily only a
+  # small number of the properties are useful on TC956x so we can just reference
+  # what we need.
+  phy-connection-type:
+    $ref: ethernet-controller.yaml#/properties/phy-connection-type
+
+  phy-handle:
+    $ref: ethernet-controller.yaml#/properties/phy-handle
+
+  phy-mode:
+    $ref: ethernet-controller.yaml#/properties/phy-mode
+
+  mdio:
+    $ref: snps,dwmac.yaml#/properties/mdio
+
+required:
+  - compatible
+  - reg
+
+examples:
+  - |
+    pcie {
+      #address-cells = <3>;
+      #size-cells = <2>;
+
+      tc956x_emac0: pci@0,0 {
+        compatible = "pci1179,0220";
+        reg = <0x50000 0x0 0x0 0x0 0x0>;
+        #address-cells = <3>;
+        #size-cells = <2>;
+        device_type = "pci";
+        ranges;
+
+        gpio-controller;
+        #gpio-cells = <2>;
+
+        phy-mode = "10gbase-r";
+        phy-handle = <&tc956x_emac0_phy>;
+
+        mdio {
+          compatible = "snps,dwmac-mdio";
+          #address-cells = <1>;
+          #size-cells = <0>;
+
+          tc956x_emac0_phy: ethernet-phy@1c {
+            compatible = "ethernet-phy-id311c.1c12";
+            reg = <0x1c>;
+          };
+        };
+      };
+      pci@0,1 {
+        compatible = "pci1179,0220";
+        reg = <0x50100 0x0 0x0 0x0 0x0>;
+        #address-cells = <3>;
+        #size-cells = <2>;
+        device_type = "pci";
+        ranges;
+
+        phy-mode = "sgmii";
+        phy-handle = <&tc956x_emac1_phy>;
+
+        mdio {
+          compatible = "snps,dwmac-mdio";
+          #address-cells = <1>;
+          #size-cells = <0>;
+
+          tc956x_emac1_phy: ethernet-phy@1c {
+            compatible = "ethernet-phy-id004d.d101";
+            reg = <0x1c>;
+          };
+        };
+      };
+    };
-- 
2.51.0

