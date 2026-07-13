Received: from mail-wm1-f50.google.com (mail-wm1-f50.google.com [209.85.128.50])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 33A0541D4D7
	for <devicetree@vger.kernel.org>; Mon, 13 Jul 2026 13:12:35 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.128.50
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1783948356; cv=none; b=npCUovNuMnVFlPuTtoBf5RMM9+9xcQ/gYRLerhBcR0OgjfesGSI5RceiekOrpAgKjpre+g9R1r4vCSgdOxrr2saZQe3T54iLXMzX2vU+EPT2YFKCWCyHaVs4AqQXn6CLsXtZm0FU88zzbfURUprW1RCzg+USkTlrHLm59F8IniA=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1783948356; c=relaxed/simple;
	bh=EH/+VCZq3ED/37BZ1BBbanXdtr+T1t4fbqUlDmxF/mA=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version; b=uh+l/NqQrkILQjb0tLK2yCgNRQT430ygnbBI8YXYbhu63JXqPxdOH6jlXyY+9acSDuH79PpxETtQMjEqQOxIh9kazEHufOZL+JURhQyVpjkhf2tM1b1FKnE0jBmJItLqcXG6eAxgpLU+80ho/tvFSYyCoI41IvP3c0zJU8eF2y8=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=LNyiHWef; arc=none smtp.client-ip=209.85.128.50
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="LNyiHWef"
Received: by mail-wm1-f50.google.com with SMTP id 5b1f17b1804b1-493ae59eca6so14790665e9.1
        for <devicetree@vger.kernel.org>; Mon, 13 Jul 2026 06:12:35 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1783948354; x=1784553154; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=pJEMN9Bxqzoa18JvT1zUQAFrvTQjV4LBUzDIS8cV2Oc=;
        b=LNyiHWefdZ8EiXm2Em/Ek0Dn1FyOQCBwKloEmV1iX52RI3a+Z3WmqjFTJEuDnRLrz9
         ejbWnryPEO9OOz67CP/AaxermpvhBGSqc22cZ5YB30QZVZNdr83czRoaWsyORIxQh15q
         +CpNzg9Bt1OFxBIlLj2lqXJvovI0PLAJM1eDm+8FWg3257oWoU61yvMoQ+jLhIWO9qUu
         C7lAmrVTX80cauOjDBdeQnvMGdJQSnWrLDdwIAOPhN7PSGXOLCtRG8hGthkB+M3dTDbW
         KGLAOGMMsXSKc0/v6jm0oahUyXS+QAPhtAw6irkhclnaGJPWEAF/VSMw6euc2zEAFnNQ
         DgYA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1783948354; x=1784553154;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to:content-type;
        bh=pJEMN9Bxqzoa18JvT1zUQAFrvTQjV4LBUzDIS8cV2Oc=;
        b=HfhPvxSqAh/GUUuf4qS3cvoGeeR36z/+3SauQM/aaK49eq0Iu+1aScOifQz6ejBSve
         zP7XdxiI9Jx7NfHrW9TrvE9G7SQ7ww+ZtuYpX3T7ezOpIkOzpdv6H+LO/oBaoIdMRT7k
         8CvOal0i1REeEn1o9KRao2ySrakDqDfOtL9+ctXkW4qMKNWtG0DGxSNMbohn99BJ3lRi
         cxEFJnb1UysSXbmwd9gtHPLp0xskLPNQDqQ+Up+ahth6Md4IB5zQI7IQ8HtkZstdgps3
         EJWCLj3qzbDxCq5owWmVafOQ6dUQTM61zQusIoPE9b+etYUuO7WNUDK0J7A7hChT8y1r
         mxXQ==
X-Forwarded-Encrypted: i=1; AHgh+RrfJLrdCRuo3do2F/lMNEAd8jI7JcQEe9ZTfk7lgdGY0az7pvDdV+aqcOSWDK87OoXPx0/HXfJZGdQ9@vger.kernel.org
X-Gm-Message-State: AOJu0Yy7eO2JvPEjDDFSbwpTn5OJbPW+LGqYCEJLQNayhB6B8sQ4kw4b
	/hVKzfuzpcfqHpxWTUEYaieOymPRF1ssKXUAzkENH/bMr8sQ7eoj8G8n
X-Gm-Gg: AfdE7cmrSnzTmKedVbNx0eVckzr3fVGt3JPoK2tHVsP7aRoliCZMmH9EkJ9k5go4dhJ
	D/P3GEAvWDaCD7gBRRv3zVCfydvy+Z6ZuQKHvRTwO3VcVMU6zIN9ZZaPJMqZN7RhiSWCTVIZJIe
	kBDzJLsn+aZ3eOGX64NSrAoe7NhKlxkU/xQoAUEx4czcWMxi4ShuHrEV1BaBpUSxnzJx4yBoZn5
	eFzRxMbh1YDVvBb/qw9DKzRmwHZovYR5b2y1qcJ3TLeGFXeKHxixZkIipUH9O1tuqE448GVl9xg
	fzqRK1NCA79eOTtKyqeYGXtMVXRQRzZZNRtEBYkEAaIJBMUwLwChJ82VLoov2nWnVSiL+NkIXYB
	0c1cGi4cVun5n0KxroGJCHH08cEEmQgAEL3w7hy5jypclX5DV2Sub1fPim7sv9mnb5gRyanICmy
	wKrYpUW7Z7Qd/c
X-Received: by 2002:a05:600c:34c9:b0:493:f826:89a6 with SMTP id 5b1f17b1804b1-493f87806ddmr92802855e9.0.1783948353471;
        Mon, 13 Jul 2026 06:12:33 -0700 (PDT)
Received: from NB-6746.. ([188.243.183.76])
        by smtp.gmail.com with ESMTPSA id 5b1f17b1804b1-493eb6f3dcdsm354106345e9.3.2026.07.13.06.12.32
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 13 Jul 2026 06:12:33 -0700 (PDT)
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
	Conor Dooley <conor+dt@kernel.org>
Cc: Artem Shimko <a.shimko.dev@gmail.com>,
	linux-kernel@vger.kernel.org,
	devicetree@vger.kernel.org
Subject: [PATCH net-next 1/2] dt-bindings: net: add DAPU Telecom DAP8211R(I) PHY binding
Date: Mon, 13 Jul 2026 16:12:22 +0300
Message-ID: <20260713131223.279555-2-a.shimko.dev@gmail.com>
X-Mailer: git-send-email 2.43.0
In-Reply-To: <20260713131223.279555-1-a.shimko.dev@gmail.com>
References: <20260713131223.279555-1-a.shimko.dev@gmail.com>
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
with a default of 1950 ps if not specified. The tx-inverted-clk flag
provides a vendor-specific extension for boards where PCB trace length or
MAC requirements necessitate 180-degree clock phase shift.

Signed-off-by: Artem Shimko <a.shimko.dev@gmail.com>
---
 .../bindings/net/dapu,dap8211r.yaml           | 78 +++++++++++++++++++
 1 file changed, 78 insertions(+)
 create mode 100644 Documentation/devicetree/bindings/net/dapu,dap8211r.yaml

diff --git a/Documentation/devicetree/bindings/net/dapu,dap8211r.yaml b/Documentation/devicetree/bindings/net/dapu,dap8211r.yaml
new file mode 100644
index 000000000000..208a82f779d6
--- /dev/null
+++ b/Documentation/devicetree/bindings/net/dapu,dap8211r.yaml
@@ -0,0 +1,78 @@
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
+      RGMII RX clock delay in picoseconds. The PHY supports 150 ps steps
+      from 0 to 2250 ps. If not specified, defaults to 1950 ps. If the
+      requested value does not exactly match a supported step, the driver
+      selects the nearest supported value and issues a warning.
+    enum: [0, 150, 300, 450, 600, 750, 900, 1050, 1200, 1350, 1500,
+           1650, 1800, 1950, 2100, 2250]
+    default: 1950
+
+  tx-internal-delay-ps:
+    description:
+      RGMII TX clock delay in picoseconds. The PHY supports 150 ps steps
+      from 0 to 2250 ps. If not specified, defaults to 1950 ps. If the
+      requested value does not exactly match a supported step, the driver
+      selects the nearest supported value and issues a warning.
+    enum: [0, 150, 300, 450, 600, 750, 900, 1050, 1200, 1350, 1500,
+           1650, 1800, 1950, 2100, 2250]
+    default: 1950
+
+  tx-inverted-clk:
+    $ref: /schemas/types.yaml#/definitions/flag
+    description:
+      If present, the RGMII TX clock to the MAC is inverted (180 degree
+      phase shift relative to the data lines). This is a vendor-specific
+      extension for boards where PCB trace length or MAC requirements
+      necessitate clock inversion. Only use this property after hardware
+      signal integrity validation.
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
+            compatible = "ethernet-phy-ieee802.3-c22";
+            reg = <1>;
+            rx-internal-delay-ps = <1050>;
+            tx-internal-delay-ps = <1150>;
+            tx-inverted-clk;
+        };
+    };
\ No newline at end of file
-- 
2.43.0

