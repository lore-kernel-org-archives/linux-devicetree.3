Received: from mail-wm1-f45.google.com (mail-wm1-f45.google.com [209.85.128.45])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 14D4641BA9E
	for <devicetree@vger.kernel.org>; Thu, 16 Jul 2026 11:38:28 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.128.45
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1784201912; cv=none; b=cXtwOoyLaRTGhbLKCqh4UX1n+zfQksIO/RhVV9OaTfiE/vV4E/jeYp1dvQjmObhEk0N+T8RgEqrKHSpEdE93pAjhJK8CalcuE9chbdkPOl51MP5yWVCmkPrWNgwAxTVch1fy0C+SecOCjjrqDkvGioTD43E9ANdpWCniK7oeTZM=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1784201912; c=relaxed/simple;
	bh=HC9Umllw/UhQV3rgBtTIo/fWCOVWhQWvCTMxwy1tUJY=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version; b=BnswoC/tzsjHCLHgQK9ObP+MgMXVESJaL5tdVQ/BaoGt7LsKwsLnaroYOVYzx8aCQ2p8P71JXnOoYxkWU4o8wFN8ZvbQGWPRQGa72JxC9ikIxPAsUbnmtiV5V3iqMOoYwo6lnR9ANJwig5VkQ4YBrs/TUcMkyVsDvkHjpBi7UsA=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=F9z1q4L/; arc=none smtp.client-ip=209.85.128.45
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="F9z1q4L/"
Received: by mail-wm1-f45.google.com with SMTP id 5b1f17b1804b1-49546c690ffso275595e9.2
        for <devicetree@vger.kernel.org>; Thu, 16 Jul 2026 04:38:28 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1784201907; x=1784806707; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=ryr2s2w0siIeOD0ExeDIYeRjYrw6WRSyoBeAvMjxr1M=;
        b=F9z1q4L/jczupaarn5vp6gCOcvuO+NTPIbS+0YF9myjMLeFa8bJmaoJ/s6Ax565ikP
         +XqR1oDZdpcW771cPizVXNJsLr2eieNjFU4DFGG97RJXQXPuUq0dhgq32mB+ws0CsA47
         s8u8sWheWN/JKUJSFITEbLug8eKWu2q57ekYaM23pKCVK37t5OjdMk9kfyh9vXHJOuIi
         pEOCtm30lZFHWF4rpyFEY/u2ReUEVjGSPx1SmruG+DgViYNevq1ijkYB+mKTDbpkCFMj
         5GUN0SbsCEfcMQnfxhkAABe7IPDU2ajIvAjDxTpKG6np8x0WX1upase5r/T+kSiuqZ0k
         cqgw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1784201907; x=1784806707;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to:content-type;
        bh=ryr2s2w0siIeOD0ExeDIYeRjYrw6WRSyoBeAvMjxr1M=;
        b=NlN9x1T8dM9d5IsNVOPctF0ba/5ndm45N0DxMZ8QoXkbzJ7teBcHG9Q++KMUF5PVm9
         tKnYq0cAvmhnFvDAREr7A/4ETE76Es+1AO1hS2yTdY2bPUK5S7mzygMwAFiPyyJmcz9O
         2XqL3H3aC5vEqCmwclVcPJzSYSUwhxv3E8Ua/dRW97ERMVVMC32Rvz+hDB0BzZcD1v2W
         C/dWTEacMkDkU416KvqYfUz97ZyR00USVjpB2/ipwIwZmbmqAL5boRO15jqaWUPcKBKM
         LKp/c9aXVvRbiWIoeYK+bAuemFIKfXoGDPIdN22g2axubSrLMOTaQtwBFGnVOVm2aqeX
         Kl0w==
X-Forwarded-Encrypted: i=1; AHgh+RrZ03CEMIKygSez+End4mNOYlTstk04SB0jO33AkIdBBB89xhNnXUYTOE+nGeablvguH7OOmus7XE+t@vger.kernel.org
X-Gm-Message-State: AOJu0YxkPK85rI5N8bB47cLsdPSNwPI9EffszYrxs6gxvAjWgewburpw
	xFcN8gDzNw2t7VbxoZuYWbUF5FHwnkEWQrviwOCQSM1/mqdAByQaUhtG
X-Gm-Gg: AfdE7clSnxGX+mufsMVjwUvX96Q9cyI9kcEhuhQB5amWVrcBM3t7JAK8PYs5SgF5InC
	aYxPUwgfu/svO88jISANQbn1w+xLSei9bxdF3WPqLeFFG0UXJbr8JiPi0gk6SI0S8MKy8dDgwIy
	6MyaTq3u1jTY/fHse3PbAbs8OPTG2i7RIJNPbH9ZMHlL6GL9BQzpllJUmDDswRoWYfFHSti/DD8
	GfWfEnkxp2JO0N/cLE3OPCPqgsfPd9yShZjcpuivoahWzsVXX9RKScOwOpPFlJTCOCFuC7Y5VQs
	jWBqm4lAyi0PTkOe4h8YJIaEGa59e8MWdV3JAseURXBwV94kBHmIV1qnFNvMlrKDQg7+JqrA3Kg
	fRjBSUH8obIsoAgYYoeuZibVUXyg/V5McHHin56wECgGdy6foQt8EpXGtGtxvSJ6tbxIRLJ9KSH
	Zf23/MN88sXin0H4eXSwE=
X-Received: by 2002:a05:600c:1908:b0:492:41c9:886b with SMTP id 5b1f17b1804b1-4953c1620c0mr74288235e9.14.1784201906695;
        Thu, 16 Jul 2026 04:38:26 -0700 (PDT)
Received: from NB-6746.corp.yadro.com ([188.243.183.76])
        by smtp.gmail.com with ESMTPSA id 5b1f17b1804b1-49541e83bcbsm49217165e9.4.2026.07.16.04.38.25
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 16 Jul 2026 04:38:26 -0700 (PDT)
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
Subject: [PATCH net-next v2 1/2] dt-bindings: net: add DAPU Telecom DAP8211R(I) PHY binding
Date: Thu, 16 Jul 2026 14:38:03 +0300
Message-ID: <20260716113805.593215-2-a.shimko.dev@gmail.com>
X-Mailer: git-send-email 2.43.0
In-Reply-To: <20260716113805.593215-1-a.shimko.dev@gmail.com>
References: <20260716113805.593215-1-a.shimko.dev@gmail.com>
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
with a default of 1950 ps if not specified. The dapu,tx-inverted-clk flag
provides a vendor-specific extension for boards where PCB trace length or
MAC requirements necessitate 180-degree clock phase shift.

Signed-off-by: Artem Shimko <a.shimko.dev@gmail.com>
---
 .../bindings/net/dapu,dap8211r.yaml           | 73 +++++++++++++++++++
 1 file changed, 73 insertions(+)
 create mode 100644 Documentation/devicetree/bindings/net/dapu,dap8211r.yaml

diff --git a/Documentation/devicetree/bindings/net/dapu,dap8211r.yaml b/Documentation/devicetree/bindings/net/dapu,dap8211r.yaml
new file mode 100644
index 000000000000..d4012fa17a1e
--- /dev/null
+++ b/Documentation/devicetree/bindings/net/dapu,dap8211r.yaml
@@ -0,0 +1,73 @@
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
+  dapu,tx-inverted-clk:
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
+            compatible = "ethernet-phy-id0008.011b";
+            reg = <1>;
+            rx-internal-delay-ps = <2100>;
+            tx-internal-delay-ps = <2100>;
+            dapu,tx-inverted-clk;
+        };
+    };
+
-- 
2.43.0

