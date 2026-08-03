Received: from mail-ej1-f45.google.com (mail-ej1-f45.google.com [209.85.218.45])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 3406833CE88
	for <devicetree@vger.kernel.org>; Mon,  3 Aug 2026 10:17:44 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.218.45
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1785752266; cv=none; b=FDZYn4lCjdhOtyWn5Mma7ywORSAooZfxEQFdrDchS9C/8WJUlisyezNaEpo9D98vcTxlIHnma+2GpIamZ+ZoAPd+HIUWhbiYtXgnmnkz4iioWvo1RC7yCJYkHqhFGDC1k74D+b9V4+NJUJbeizJd4Y5zh8Ir7ynKHT3LrNLZEdA=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1785752266; c=relaxed/simple;
	bh=ihxYljt9TvSONhIQg9chU2CaRvgGK8sqjjqdKQaNFaA=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version; b=NJvFkltOXexs4rV7YT9//gOfprpOuAmDueG0y828TJ7BDGQVfVo/GCPGf8b48qzsMoa65nM2UTmqiuyb/0xgBMyhX90tJlbI45XayqHsih02Sf8n8HEH35fqldKFsSCVNguWV3+WF06ThguSjNVPqc1fvGGpV5SQxwi34ZY9KxI=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=aDJmuL9g; arc=none smtp.client-ip=209.85.218.45
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="aDJmuL9g"
Received: by mail-ej1-f45.google.com with SMTP id a640c23a62f3a-c1c24ec9525so535875966b.1
        for <devicetree@vger.kernel.org>; Mon, 03 Aug 2026 03:17:43 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1785752262; x=1786357062; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=BKK29opAwoDm9NA+sehIYh0i1MrAbhgyis4MH0MRWRg=;
        b=aDJmuL9gyjSBcG4iVbPCUm7TiQzojbCezEL+HyIjpOeywEipBGURuE4FBVMrzk5rqG
         Zs4nNmDPEopLq9z1YkAnrxbMNLWNTNfK8QxYDw74PgZpiqgKVsgutl+MLdoy/d7Gber6
         KFL6NX83G7WgYch9CRL72A738yRVFRjRzcHTFbn3/S0+4BK9iSNtYif5EYkpfDewTOLo
         ToHDsGOCKK6f5asNDKuc/E4qNlWyB3H9QEhBSyVV+m1cAdWgsVY0Jxp3aokMG2tjgdLS
         aExfG4qv2vdk4MT/rncz8jAEQ8LfluiWX/V59Kb+kdOT7XNT52rfYrp5aO6ysozYBDMA
         14cA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1785752262; x=1786357062;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to:content-type;
        bh=BKK29opAwoDm9NA+sehIYh0i1MrAbhgyis4MH0MRWRg=;
        b=Z7DCj9iBPwB7Htv64+SfUgJYWNcroEzlQMs6HmyJlrXAH9bBCdr9kjNSNjxtMncaiU
         DoSAsun0YT0gIl4dN5Y+iFuq/2in68AGCVQ6aVaIuTXCkC9eRoUyKxta+RMpVCVN1afE
         0B/+DZZQY3ISY7jxiZ8fZ1Cf0ztk4ymGQeclXEVpnXACqYtlHuYgyUiPHMgrJpa1KBD7
         HLLf2HcKeIL+PZClo62ZJ0+4ZvYQpR93H9jehLqw7usqidAyAiYyX0vhZHRu6n4DmXc7
         9xQoCti6iu8iatA5IOvcTlBa9xi1PFAJUw0I6zM0CLdZu7gt8gfERbOxnbrpGxft+m6H
         K3UA==
X-Forwarded-Encrypted: i=1; AHgh+RoqqDvcsSER8epvk5UKTIu7Vx0O1g2N/L8C55Quixkx7XWazY54PtIzig08Xayk81tpPdWMT6iPCisW@vger.kernel.org
X-Gm-Message-State: AOJu0YywDv/M1iICx9SZLp2+x9Do7KRfGWyxcVDkRYI3GkJ4t+2GUh6g
	H4CQTjZkei9dkwp4CojBvQGepTyXQ9hNVfmKen/feDbl7WjgA8XzUrS6
X-Gm-Gg: AR+sD10l1QLUZnbYZCwop71R6vvL9+yjdMPgJyxSUvaMCD/14Ho3ofXtOqL+XjVsN0K
	MwE6Q8V0VOsM4O0VUEBaa4T/iYddwQzJwyzWLjo92K9snxAHHGNtgqZUg4+cbq9KMN6pAzQH0Ar
	Jwcm1yUOdpLJ7f2tmxgf6y/7Cn6SunqxnN7DtLsiMJVoTd/0Apk80nOrue0opYQI1b3cMUSISG1
	K4MJdVzsBL/F5VkdtqepEeQLZvTvHVPg14uJnYVZN4BPSWdXEgvISMzU15W9VQk9dU6u6TA5ylS
	fibGtCqY4U6S1UX4FgWZyyi2C1wRdL4BfL+Ewo+56rEeOTkg7C4IK+xOn5JKsGQdDtRcIWb/tQb
	WjccoXh78F5OfRO+DKGdPaP27zcw+/+9GxWVZazmG3K9O4+YoRgiw9M9kxAHCFyF6aWCCCG9NOz
	q4kyUfjF2RhI7iAJ+5fXqPbHt6kNLC4QxrWEEG4cvHdmG2o9XEvTkLm04wLwL2uJYpMypTeUGH
X-Received: by 2002:a17:906:dd9:b0:c1c:4afd:8d8c with SMTP id a640c23a62f3a-c1fe7f67f8bmr472940466b.14.1785752262065;
        Mon, 03 Aug 2026 03:17:42 -0700 (PDT)
Received: from NB-6746.. ([188.243.183.76])
        by smtp.gmail.com with ESMTPSA id 4fb4d7f45d1cf-6a09c6566b3sm5355731a12.23.2026.08.03.03.17.40
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 03 Aug 2026 03:17:41 -0700 (PDT)
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
Subject: [PATCH net-next v5 2/3] dt-bindings: net: add DAPU Telecom DAP8211R(I) PHY binding
Date: Mon,  3 Aug 2026 13:17:33 +0300
Message-ID: <20260803101734.270821-3-a.shimko.dev@gmail.com>
X-Mailer: git-send-email 2.43.0
In-Reply-To: <20260803101734.270821-1-a.shimko.dev@gmail.com>
References: <20260803101734.270821-1-a.shimko.dev@gmail.com>
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
 .../bindings/net/dapu,dap8211r.yaml           | 62 +++++++++++++++++++
 1 file changed, 62 insertions(+)
 create mode 100644 Documentation/devicetree/bindings/net/dapu,dap8211r.yaml

diff --git a/Documentation/devicetree/bindings/net/dapu,dap8211r.yaml b/Documentation/devicetree/bindings/net/dapu,dap8211r.yaml
new file mode 100644
index 000000000000..fb78fa4f58ca
--- /dev/null
+++ b/Documentation/devicetree/bindings/net/dapu,dap8211r.yaml
@@ -0,0 +1,62 @@
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
-- 
2.43.0

