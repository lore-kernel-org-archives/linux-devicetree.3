Received: from mail-wm2-f12.google.com (mail-wm2-f12.google.com [74.125.225.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id F4121409102
	for <devicetree@vger.kernel.org>; Tue, 15 Sep 2026 12:38:27 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=74.125.225.140
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1789475910; cv=none; b=MH3QfarrSfXHRlbWz01bxyzn/SPB2drFJWBc5HyrG2xuLyxMDo4rTUEDtmxe75sEKuhMql8/ef7LaeUrDUTbJS9K553WdvNtLdS/tfqomYSTU0BtSqH8G1+l8emi3E4mYKqv7uapXPGwlWGXDJc64hv6UGTrVXAH6ROQdUnSvA0=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1789475910; c=relaxed/simple;
	bh=7y5S0ThKweBnJIFIdstxVs81WWiUsDlt//Wvk+p7bhc=;
	h=From:To:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version; b=uqccgsMimv/Z2thBkPF88Ycvd4Gm1BI9FXinjV6BshQ4CG+8xRxopADaB6Xm8Ove9cx8UEDq56xuaufUsyhA9NX5BYZVhAvvDrrIn5ToJL0gJvLk+IWalg4BlzajvwbwqhoqCH5gSvq3IQGhcTgxd+jYGvPZ+yWz7w6j0VbddyQ=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=XHuDjvhk; arc=none smtp.client-ip=74.125.225.140
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="XHuDjvhk"
Received: by mail-wm2-f12.google.com with SMTP id 5b1f17b1804b1-49b912d8239so18849255e9.0
        for <devicetree@vger.kernel.org>; Tue, 15 Sep 2026 05:38:27 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1789475906; x=1790080706; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:to:from:from:to:cc:subject:date:message-id
         :reply-to:content-type;
        bh=EBth4tRMg8GOGvhksLcEkRFTz5ARAzMlbCo5jt8vu2Q=;
        b=XHuDjvhkpfjjroKtuJvBdH1GP2adgn85txZ3kkfo868eqPh0bEZ1Zri65czug5ym3C
         6512mXmJ0rPVdFcKSYhvG/LiX9lFQ84vng7yy3AnuGWwuh3eR67pn8Ed6Q/nydbCe1qK
         jDJN4OFQe2upv9VrFOdnAqFP7i44pB8ptoRMgj9fz1SAIcgbutQVxtyDroNH7C5fStjc
         qg3+/Tb2KHmAZ0aEPAsytEUF+BsxZ0yrwjU6r8Fax/1kAGvLmqi0uA1xIxLWaLaVN4qw
         06CKTabqCks70lFOYBArMm6z7W+9dZPwnpOXEhjNDtX09WHHyD0SLPrxUSuW8PHXcz3l
         KndQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1789475906; x=1790080706;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:to:from:x-gm-gg:x-gm-message-state:from:to
         :cc:subject:date:message-id:reply-to:content-type;
        bh=EBth4tRMg8GOGvhksLcEkRFTz5ARAzMlbCo5jt8vu2Q=;
        b=XfcrU0VTdC9kYjBWMDu48vcaZKiVcOuyy9xxllfFNx5QpFnsgV0AWl3fKaTLGEQH3u
         6ub992ixR3glqBRZ6RhT89E/dUWR28SE8BrK0b1L4laY7saZhN8R4rIp5qnzIEorbUM9
         RoqmQ4A3VpGGJaqSMI3nney19wXmd1sX2rwywmcYTE3E7X0eHnudGNYkkCkv3rgZs+nm
         1evWGhEXY779zQLqsZJiduC4rS8PLyZMvP7Sgh62HSIMw2XqESXT+10ddAQCUgFxXt7p
         puUTY7HwEVYec3sYCfEtxgYSL+tEaCrXF6Zxe5IS48cKNy1oR6LOm2uUEO0SN3uUbXeD
         OBTQ==
X-Forwarded-Encrypted: i=1; AKwUvBwoDnrTj7HoEAV0vbjyBih3KvmLS8Zvu7JN39LVAau/AAyJN0qZYhYKZY3CYIKRXOAVPtmFoifEcQnE@vger.kernel.org
X-Gm-Message-State: AFuF++lrLpq+b9w10f0O0RMiu6szWOsginN4hWlHjfdkVtEsZfOUe4sE
	daHbjmw2GOKAUtNiKWcjrTz2MqOtGdqgdUuaaFNXg/6P3r4+PyCFMM5I
X-Gm-Gg: AYBFou2jngL7yJIaGBFQ3jNGOsv9C/BTQvak9kVOcUUlsQKMSlXfkPCShZ5QVHoDXdh
	QjUkFe39JJqxODqBjRp3T79LoDw5eEeEZq7TQUyHbXDJh19lBBbxBW4r6TZHk3LfhThS2F8QrTV
	DirGtu9+BIT5Rs4dzf9q0uYvWvbyC+qfvQeD/6aHF+/YNC7KXrx5GsPDy2LaT13fmgNnf44xIMv
	E6AkRzi+WKHVoEwYpvKdKAcnKcw/gQiiF4nsUHe5hCYTa+TtMOFlFew8T2VbtPP1Vv44+eIt67E
	lj9QmxSvF9wvGdUoAVMETT3vRPHSca+eZiuny7joSE1ldJCHossOqRARx0bBvxgzretBJx9VTGm
	fLvSuCXp+rwQq4QgVBzQ4KBAF8aBhw/rDQFAJUTHViursKVPG82KDFGuK0eJ31i3cWCbUWKV7NM
	gtRFWIaCvBFf285Ns5/2BYO5fezQqnZuKjSc5fGIGItYSpabIQuCCHV9nZB9k/f93j78CDzBQpr
	Iob2ClUlKgzTFjHI4Gj1Z4GXH6bnh/lV6Grf6ly+F8TkzMHZ3VmIYlUd3ZUeq0e
X-Received: by 2002:a05:600c:3b89:b0:49c:ff3c:973f with SMTP id 5b1f17b1804b1-49e7a692d5emr106570525e9.24.1789475905719;
        Tue, 15 Sep 2026 05:38:25 -0700 (PDT)
Received: from Ansuel-XPS24.localdomain (host-79-26-252-140.retail.telecomitalia.it. [79.26.252.140])
        by smtp.googlemail.com with ESMTPSA id 5b1f17b1804b1-49e7d6a8d5asm62958635e9.9.2026.09.15.05.38.23
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 15 Sep 2026 05:38:25 -0700 (PDT)
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
Subject: [PATCH net-next v22 1/9] dt-bindings: net: dsa: Document support for Airoha AN8855 DSA Switch
Date: Tue, 15 Sep 2026 14:37:58 +0200
Message-ID: <20260915123812.14747-2-ansuelsmth@gmail.com>
X-Mailer: git-send-email 2.53.0
In-Reply-To: <20260915123812.14747-1-ansuelsmth@gmail.com>
References: <20260915123812.14747-1-ansuelsmth@gmail.com>
Precedence: bulk
X-Mailing-List: devicetree@vger.kernel.org
List-Id: <devicetree.vger.kernel.org>
List-Subscribe: <mailto:devicetree+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:devicetree+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

Document support for Airoha AN8855 5-port Gigabit Switch.

It does expose the 5 Internal PHYs on the MDIO bus and each port
can access the Switch register space by configuring the PHY page.

Signed-off-by: Christian Marangi <ansuelsmth@gmail.com>
Reviewed-by: Rob Herring (Arm) <robh@kernel.org>
---
 .../net/dsa/airoha,an8855-switch.yaml         | 86 +++++++++++++++++++
 1 file changed, 86 insertions(+)
 create mode 100644 Documentation/devicetree/bindings/net/dsa/airoha,an8855-switch.yaml

diff --git a/Documentation/devicetree/bindings/net/dsa/airoha,an8855-switch.yaml b/Documentation/devicetree/bindings/net/dsa/airoha,an8855-switch.yaml
new file mode 100644
index 000000000000..5ad9b9e13983
--- /dev/null
+++ b/Documentation/devicetree/bindings/net/dsa/airoha,an8855-switch.yaml
@@ -0,0 +1,86 @@
+# SPDX-License-Identifier: (GPL-2.0-only OR BSD-2-Clause)
+%YAML 1.2
+---
+$id: http://devicetree.org/schemas/net/dsa/airoha,an8855-switch.yaml#
+$schema: http://devicetree.org/meta-schemas/core.yaml#
+
+title: Airoha AN8855 Gigabit Switch
+
+maintainers:
+  - Christian Marangi <ansuelsmth@gmail.com>
+
+description: >
+  Airoha AN8855 is a 5-port Gigabit Switch.
+
+  It does expose the 5 Internal PHYs on the MDIO bus and each port
+  can access the Switch register space by configuring the PHY page.
+
+$ref: dsa.yaml#/$defs/ethernet-ports
+
+properties:
+  compatible:
+    const: airoha,an8855-switch
+
+required:
+  - compatible
+
+unevaluatedProperties: false
+
+examples:
+  - |
+    ethernet-switch {
+        compatible = "airoha,an8855-switch";
+
+        ports {
+            #address-cells = <1>;
+            #size-cells = <0>;
+
+            port@0 {
+                reg = <0>;
+                label = "lan1";
+                phy-mode = "internal";
+                phy-handle = <&internal_phy1>;
+            };
+
+            port@1 {
+                reg = <1>;
+                label = "lan2";
+                phy-mode = "internal";
+                phy-handle = <&internal_phy2>;
+            };
+
+            port@2 {
+                reg = <2>;
+                label = "lan3";
+                phy-mode = "internal";
+                phy-handle = <&internal_phy3>;
+            };
+
+            port@3 {
+                reg = <3>;
+                label = "lan4";
+                phy-mode = "internal";
+                phy-handle = <&internal_phy4>;
+            };
+
+            port@4 {
+                reg = <4>;
+                label = "wan";
+                phy-mode = "internal";
+                phy-handle = <&internal_phy5>;
+            };
+
+            port@5 {
+                reg = <5>;
+                label = "cpu";
+                ethernet = <&gmac0>;
+                phy-mode = "2500base-x";
+
+                fixed-link {
+                    speed = <2500>;
+                    full-duplex;
+                    pause;
+                };
+            };
+        };
+    };
-- 
2.53.0

