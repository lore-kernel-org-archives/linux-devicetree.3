Received: from mail-wm1-f50.google.com (mail-wm1-f50.google.com [209.85.128.50])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 14C0241A569
	for <devicetree@vger.kernel.org>; Fri, 16 Oct 2026 07:12:36 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.128.50
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1792134759; cv=none; b=VEbyLEbjmZxiVx7MixuTcHRjClC+zds2MWn/u6ZMZihwxoU+BB+t3ns13mjQ1ZHKfgzo9cjAPfzOyvaS43ce71n+unoXbtoebYnZ+cTuOc6d9OrIwOvZ+iObar6oNX7gT5Sr/EWgV3/caVAGy3wEu+L1Zm8waPURjdK+Hkqk3MU=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1792134759; c=relaxed/simple;
	bh=tEX39GDnTod+NDjDLHnBKvhQxnCaMXJywpN07WIYxfc=;
	h=From:To:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version; b=HhXFsK9PrfPB4+S7Bvwf/G2gur3dpsDhsNYnUpCTwTdz6EJPgbDpQFmB1+tc0ysQzXiKIehGmSM3PP+NhQsfIBPbOVteP6zAaZ35zdZC3QQb50ezENTXkrKq1tgeZ1bch9LbxaH4xrojrmpVEypTVdVkdLlO7gdWe/kDrdfz1B8=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=QfFX2634; arc=none smtp.client-ip=209.85.128.50
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="QfFX2634"
Received: by mail-wm1-f50.google.com with SMTP id 5b1f17b1804b1-4a1880e1bf1so25514145e9.1
        for <devicetree@vger.kernel.org>; Fri, 16 Oct 2026 00:12:36 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1792134755; x=1792739555; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:to:from:from:to:cc:subject:date:message-id
         :reply-to:content-type;
        bh=J5xMolcA2jijade3hq2GliWPHkN3pbidlI2m81QLD6M=;
        b=QfFX2634rWRJPoheoW5LmAnw2t4VvMYsnaP4ZcUDiLM8MhcIniJDMFh0d7buF7U3IG
         CLsm0xpif/sat3YRHz5kOTAsiwcM5z9FRAy+hDlp3Eu/YL5mVtFL7TXSTmMHrrvOzdTT
         4pxZ5z5WXrqrsojOAU2cpTFBly2hUujP0cZEv5R+O5/eInrWcs+Im63rhee/epnL8SI4
         cTHiW4TNc/Py71M5wBJrZt1XO3H7fZuG6M2/2bLZj8aZ5i6gmnfKcZbxXC2tguxgZkqe
         q4Iqfc78GyDQkTE2YvNZVZScBeSu3xVJOXqvMo+wQbpbe98uZaV+VKiC1fClGigqy2Ov
         /JJg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1792134755; x=1792739555;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:to:from:x-gm-gg:x-gm-message-state:from:to
         :cc:subject:date:message-id:reply-to:content-type;
        bh=J5xMolcA2jijade3hq2GliWPHkN3pbidlI2m81QLD6M=;
        b=LnFI+hqGPRWxYU/KSj/UbXEi/QS2J9MugoTQfK5R5JlH3DN9u1T+JHIquAI/OIfSlr
         mCjVwKfus2bSOHJ7fiSwUiNox0zxaBumxWYNRHRaurQpwE0FKubN4DPLC/dAJ2JN0BBh
         p2kKGC7PG86yBTRVgnnWoD3xqzGcYKO++0cCRfUlsh+bdgzX4g7De1AdWZyE+iGr3Qos
         vKkUgwq+2aDw0T9kpXHDCmdcT6LOvxP3rpzuHVh0gcX9AuX6SBIknumR3boVBeFAGJhY
         7O6TfsjigdJgEtcJN8NwpmoMr6BMi8WaHzLRTH8NpTECzg1ST/whsZzlixCsAdZu4mF5
         P1wA==
X-Forwarded-Encrypted: i=1; AKwUvBxAN8+yxNqMQls6XVA0z74xj2CxpwvDyLtaCMsxdNTtyhm1wkisZNCFtiQH3CjCS/0JVdVE6XQoQ15h@vger.kernel.org
X-Gm-Message-State: AFq9FYJ+wirXZIcynBM1fcYY1VcWJNRTTfqxc0XbMGddZW7xSnk3gCZV
	EBlB2AFcCJKCfrHIdWxsUuUNQ6/D/BmVsfkfx0zeRFByMve09IrrEG4l
X-Gm-Gg: AYBFou0JnDzUU/O3L/fSV5rW37TdZ4TNn4EzEX2v/ACpXHfjd2uYv/h/hLdtb6cbUss
	yJHhSnzIDNqfMAqNlCeO1LhXTanqMa3tW0CddI6MzhDh/+iQWQpa8Lnmn+ycfjdIySCIuDJNN3z
	CSrt/P4dE6bFaDeDHhw8k/h0BCvHw6+T46aA0GhkV+K+8EBzWJnA1cYiuliohAtiENd8K5UgGXj
	EXykh2Wp6D4nXjcESGMTLYg34sgnJE4hkpvbeo+6Gv+iAF4Y8k578eC/IiHlKVcaHWZ3BVhuQ8q
	6sMyhqSVNVee3K5Ze7WSK2SYEOxv5vBtE9diGD8ueyB7uzSufde7KqPzr3+wt9uIT43fiW7+HPy
	Rsr/mSRNxLzge8Ft4MwcpeUoL+F1iPuyQRosWtt5EKNlKP7SCGb9zHysP2/0RMFGqsZQmUUg4lR
	hOpDC/NvWdwFLnMlW9OEIzPBfe7C7x0cwAT4hhOHRRp4iUR1OXuZTlOqniNn/nvYNr7iZYVy8U1
	pwwNY/OuglmUVQbOgkYa2dFr7w/CPD99STIFwdYAixxt0DqFTkNt9IiID8KbTLcvmrLVFtiGzIM
	Cc9xKcQ/lUL6teU2+zM9rPphBpe8uP1KBg==
X-Received: by 2002:a05:600c:870e:b0:4a1:6dca:51e3 with SMTP id 5b1f17b1804b1-4a18e4487ccmr433992205e9.3.1792134754909;
        Fri, 16 Oct 2026 00:12:34 -0700 (PDT)
Received: from Ansuel-XPS24.localdomain (host-95-235-252-189.retail.telecomitalia.it. [95.235.252.189])
        by smtp.googlemail.com with ESMTPSA id 5b1f17b1804b1-4a1c8a1b377sm61802015e9.0.2026.10.16.00.12.32
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 16 Oct 2026 00:12:33 -0700 (PDT)
From: Christian Marangi <ansuelsmth@gmail.com>
To: Christian Marangi <ansuelsmth@gmail.com>,
	Vinod Koul <vkoul@kernel.org>,
	Neil Armstrong <neil.armstrong@linaro.org>,
	Manivannan Sadhasivam <mani@kernel.org>,
	Rob Herring <robh@kernel.org>,
	Krzysztof Kozlowski <krzk+dt@kernel.org>,
	Conor Dooley <conor+dt@kernel.org>,
	linux-arm-kernel@lists.infradead.org,
	linux-phy@lists.infradead.org,
	devicetree@vger.kernel.org,
	linux-kernel@vger.kernel.org
Subject: [PATCH v4 1/2] dt-bindings: phy: airoha: Document support for AN7583 Gen3 PCIe PHY
Date: Fri, 16 Oct 2026 09:12:23 +0200
Message-ID: <20261016071225.2092-2-ansuelsmth@gmail.com>
X-Mailer: git-send-email 2.55.0
In-Reply-To: <20261016071225.2092-1-ansuelsmth@gmail.com>
References: <20261016071225.2092-1-ansuelsmth@gmail.com>
Precedence: bulk
X-Mailing-List: devicetree@vger.kernel.org
List-Id: <devicetree.vger.kernel.org>
List-Subscribe: <mailto:devicetree+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:devicetree+unsubscribe@vger.kernel.org>
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

