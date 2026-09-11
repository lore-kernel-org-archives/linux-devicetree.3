Received: from mail-wr2-f12.google.com (mail-wr2-f12.google.com [74.125.225.76])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id C93603E1228
	for <devicetree@vger.kernel.org>; Fri, 11 Sep 2026 22:54:35 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=74.125.225.76
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1789167278; cv=none; b=lCHqOuN6IzByeOPJipqdxuQxrk3BccxdCNz7RRaXI5Hi/zHAMsUB8isFzCknHi8Ac7wEqC6rp2en/YBuUBXHi/G3sD3fE+mCJ858uLFt5SHUyJB1FSym/kvL9DsO7GDmpqF184BnQANhHDD/D2cLogKsFdVaooToaTmBD3ijaMY=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1789167278; c=relaxed/simple;
	bh=5Bv9DWXKoe1rCy2VuILgNvXFcH8nqtMIfGBD86DCJpE=;
	h=From:To:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version; b=eh1rLada1BAQWVcr9HmQudgvxpydG23bY9xhNyED2rAuto6FGycOmAHZ0K8HaHDe1lykoW7XnhON6my2URP0Rw+mD3tGsbkh5SvEByVP0Q4789Pgij9TWJWiXa/+7O6FzrU6KkCtDQ8KBMVs7TiYYs3CybgfaUdw6rzavGAKi7o=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=Ba8ulXt2; arc=none smtp.client-ip=74.125.225.76
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="Ba8ulXt2"
Received: by mail-wr2-f12.google.com with SMTP id ffacd0b85a97d-4834977ae75so163406f8f.3
        for <devicetree@vger.kernel.org>; Fri, 11 Sep 2026 15:54:35 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1789167274; x=1789772074; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:to:from:from:to:cc:subject:date:message-id
         :reply-to:content-type;
        bh=mBJHZiui6LC0ZFroetycbP9gbMZ7hcwLvF2peu3oVkk=;
        b=Ba8ulXt2FzckTMm7NIj9QTMw0uZJkXPCrAIny+gEKasrfSbX9dcyKQ5Dbq2e8751hj
         SyCK1kZ0IOKC5MQFAmovOajrhRv/nHt6LbJ0iqxIxYapvGjYJAsHC6ClNwD1N8rXlI6c
         P3aHKgK+QO8CDuzP5BKhWg8neAk22uIxn/OXsgi7410TLW2kWfZnqF2s9hpeveIg6Tpw
         jdA9nVpG136jWVuIU9zgPf48Isvcy4HJ0pHD28LswgVaOnP42UtFTkw9kcm7owjmlgPL
         NLVw6ZqFf/GlT1OzT1By456jSDzwE5vm3C+rwGDp+ZB3jwsWxQ5i7+MV49B+k1E3Uozm
         i+KQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1789167274; x=1789772074;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:to:from:x-gm-gg:x-gm-message-state:from:to
         :cc:subject:date:message-id:reply-to:content-type;
        bh=mBJHZiui6LC0ZFroetycbP9gbMZ7hcwLvF2peu3oVkk=;
        b=kxiX8fgi8UQs+d5SDc+ci0afKxi1LPlxC8d628H9EEDbPCQLafV+MZTrEpSqf9PUNE
         ECrJnvRGfhtM6xh8lvptqPJYv1YSpJvmgA+PxFLKTgi3FN3m+1w52P5WOGWV9rho2dla
         Q6X9Q6QCYWKNJuEYV6XS/MM/EnMM1A1fXeSZLLX5ZHco50ld74B42wf6eF7CgRehUtVn
         HYBGzvetv2rmohazGUNCHVfV1OxAeDzyuqwk76f9lhIlS+HSlQGhYci4GuR1c78ws5Si
         2r4ElrWwIM/Djq1ZRpAyxRQZq6nuizNseXiLJ+4xoXklXR8BYYuODXsP3QvGTFKA4UsV
         k0CQ==
X-Forwarded-Encrypted: i=1; AKwUvByVQ3pa+ZbgAvJMdwamNHph0gK2swWQdSnB+zPOaycgk/e5+hize8NnEqURi0cSDxs/CU+z7ee/xgry@vger.kernel.org
X-Gm-Message-State: AFuF++nZn+n5l7fTx5AHxjP8N4x6iC8tZaWN+a+tzBSi1Z6bZ+WyLZVJ
	VcHGD1VybJiUXGDigaB8zrNDXmiZAfMKcRXXwawmo85Gy709h47i2u7d
X-Gm-Gg: AYBFou0HdWie00lwmFYMRGNMdLQrZxqlWt6VtyasxxjPFDG3YTTjaOBP/pDsjargcCY
	6oaBUkX3+tjoCVuyQoXzOos7NZ39NIrsFFqbft9zgqWJuVKyMeRLgJbKlMzi3MTXKUqC8kVamaQ
	Qti6BOVka8RACzs6wbSfYVknpAVwjpqWK+OiOevOBljA9WEfI50rh/16zXfp8C0C8lKcrwSXtsx
	POfYvqnrtfbXeafXwRtaFQT6voNm6unYW5apB4e8juF/IYNHRvRSwCoTJC2+SSUqPwxw/6EPTHQ
	4yccQ4xH9coKozed1bwJnQXDQtvq/Iv+b0tggxqpBDqszI88LVEv/zBYtd7s37sxBJkMi7cSxhS
	POoxTxNDT/0lbwdYvYY1VtN7pzwJ2FZVzkVLm3xrYzkRjvTb6AG1Q4HoztLDGLDlyO4JjM8aW52
	EVrg9d/3DcSmzZhbYlC3dsdwMZioNvBWcOq6uY5Bn+UD2Nhp0RMWhOzIxbn93KG8SjEfou5P3He
	WXorM6S/OYNfV8ZxYZiiqgOkVStyJpaBxqYQwUw5pr8/GGyvBEOMyrB78O3K5U=
X-Received: by 2002:a05:600c:3494:b0:49c:e3c3:5efd with SMTP id 5b1f17b1804b1-49e619aab42mr168024575e9.9.1789167274003;
        Fri, 11 Sep 2026 15:54:34 -0700 (PDT)
Received: from Ansuel-XPS24.localdomain (host-79-26-252-140.retail.telecomitalia.it. [79.26.252.140])
        by smtp.googlemail.com with ESMTPSA id 5b1f17b1804b1-49e6221ffb0sm77593685e9.3.2026.09.11.15.54.31
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 11 Sep 2026 15:54:33 -0700 (PDT)
From: Christian Marangi <ansuelsmth@gmail.com>
To: Christian Marangi <ansuelsmth@gmail.com>,
	Lee Jones <lee@kernel.org>,
	Rob Herring <robh@kernel.org>,
	Krzysztof Kozlowski <krzk+dt@kernel.org>,
	Conor Dooley <conor+dt@kernel.org>,
	Andrew Lunn <andrew+netdev@lunn.ch>,
	"David S. Miller" <davem@davemloft.net>,
	Eric Dumazet <edumazet@google.com>,
	Jakub Kicinski <kuba@kernel.org>,
	Paolo Abeni <pabeni@redhat.com>,
	Vladimir Oltean <olteanv@gmail.com>,
	Matthias Brugger <matthias.bgg@gmail.com>,
	AngeloGioacchino Del Regno <angelogioacchino.delregno@collabora.com>,
	"Chester A. Unal" <chester.a.unal@arinc9.com>,
	Daniel Golle <daniel@makrotopia.org>,
	Heiner Kallweit <hkallweit1@gmail.com>,
	Russell King <linux@armlinux.org.uk>,
	Simon Horman <horms@kernel.org>,
	linux-arm-kernel@lists.infradead.org,
	linux-mediatek@lists.infradead.org,
	netdev@vger.kernel.org,
	mfd@lists.linux.dev,
	devicetree@vger.kernel.org,
	linux-kernel@vger.kernel.org
Subject: [PATCH net-next v21 2/9] dt-bindings: net: Document support for AN8855 Switch Internal PHY
Date: Sat, 12 Sep 2026 00:53:26 +0200
Message-ID: <20260911225414.225980-3-ansuelsmth@gmail.com>
X-Mailer: git-send-email 2.53.0
In-Reply-To: <20260911225414.225980-1-ansuelsmth@gmail.com>
References: <20260911225414.225980-1-ansuelsmth@gmail.com>
Precedence: bulk
X-Mailing-List: devicetree@vger.kernel.org
List-Id: <devicetree.vger.kernel.org>
List-Subscribe: <mailto:devicetree+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:devicetree+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

Document support for AN8855 Switch Internal PHY.

Airoha AN8855 is a 5-port Gigabit Switch that expose the Internal
PHYs on the MDIO bus.

Each PHY might need to be calibrated to correctly work with the
use of the eFUSE provided by the Switch SoC. This can be enabled by
defining in the PHY node the NVMEM cell properties.

Signed-off-by: Christian Marangi <ansuelsmth@gmail.com>
Reviewed-by: Rob Herring (Arm) <robh@kernel.org>
---
 .../bindings/net/airoha,an8855-phy.yaml       | 83 +++++++++++++++++++
 1 file changed, 83 insertions(+)
 create mode 100644 Documentation/devicetree/bindings/net/airoha,an8855-phy.yaml

diff --git a/Documentation/devicetree/bindings/net/airoha,an8855-phy.yaml b/Documentation/devicetree/bindings/net/airoha,an8855-phy.yaml
new file mode 100644
index 000000000000..d2f86116badf
--- /dev/null
+++ b/Documentation/devicetree/bindings/net/airoha,an8855-phy.yaml
@@ -0,0 +1,83 @@
+# SPDX-License-Identifier: (GPL-2.0-only OR BSD-2-Clause)
+%YAML 1.2
+---
+$id: http://devicetree.org/schemas/net/airoha,an8855-phy.yaml#
+$schema: http://devicetree.org/meta-schemas/core.yaml#
+
+title: Airoha AN8855 Switch Internal PHY
+
+maintainers:
+  - Christian Marangi <ansuelsmth@gmail.com>
+
+description: >
+  Airoha AN8855 is a 5-port Gigabit Switch that expose the Internal
+  PHYs on the MDIO bus.
+
+  Each PHY might need to be calibrated to correctly work with the
+  use of the eFUSE provided by the Switch SoC.
+
+allOf:
+  - $ref: ethernet-phy.yaml#
+
+select:
+  properties:
+    compatible:
+      contains:
+        enum:
+          - ethernet-phy-idc0ff.0410
+  required:
+    - compatible
+
+properties:
+  reg:
+    maxItems: 1
+
+  nvmem-cells:
+    items:
+      - description: phandle to SoC eFUSE tx_a
+      - description: phandle to SoC eFUSE tx_b
+      - description: phandle to SoC eFUSE tx_c
+      - description: phandle to SoC eFUSE tx_d
+
+  nvmem-cell-names:
+    items:
+      - const: tx_a
+      - const: tx_b
+      - const: tx_c
+      - const: tx_d
+
+required:
+  - compatible
+  - reg
+
+dependentRequired:
+  nvmem-cells: [ nvmem-cell-names ]
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
+            compatible = "ethernet-phy-idc0ff.0410",
+                         "ethernet-phy-ieee802.3-c45";
+
+            reg = <1>;
+        };
+
+        ethernet-phy@2 {
+            compatible = "ethernet-phy-idc0ff.0410",
+                         "ethernet-phy-ieee802.3-c45";
+
+            reg = <2>;
+
+            nvmem-cells = <&shift_sel_port0_tx_a>,
+                          <&shift_sel_port0_tx_b>,
+                          <&shift_sel_port0_tx_c>,
+                          <&shift_sel_port0_tx_d>;
+            nvmem-cell-names = "tx_a", "tx_b", "tx_c", "tx_d";
+        };
+    };
-- 
2.53.0

