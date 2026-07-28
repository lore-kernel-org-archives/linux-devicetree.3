Received: from mail-oi1-f176.google.com (mail-oi1-f176.google.com [209.85.167.176])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id EBC803B961F
	for <devicetree@vger.kernel.org>; Tue, 28 Jul 2026 20:41:06 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.167.176
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1785271268; cv=none; b=Ww3ol4wGDtYH2odJzGu6Mj52O70PeMtT6uWqI4+CgsvQ+r+9QYNWtfWpa/QzeVqhr5AxuGFc4Mw1wk/qWuJl6ivlsuZuRcGR6zRrnPt5LyFXKc1G3aL83hfezvx3WS2cY+znDQ58Y3fq5JQ1lhJb7fe1ZgCQ4rJwjLGLjgHurNs=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1785271268; c=relaxed/simple;
	bh=DBMoBYoiDqYJ9z07AasAMhfYkt1PvgYd+LjSuKM1ePI=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version; b=sLwDNldy5M2fL7JCmAvaJ9y5BlyVcGD2Uhh044EZD4DIjZnGciTC/zGNLFge9fhQkgJFm/TpESUbnFwIE1a0oZeA1PdenGbqSOmUuU2Y716JtldoliQSBlEd4DcS6jrhbX1orDELJnhoTsd/2UBX+RCirCU48RvLtFS3Cs9BZ0I=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=ingu+2ng; arc=none smtp.client-ip=209.85.167.176
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="ingu+2ng"
Received: by mail-oi1-f176.google.com with SMTP id 5614622812f47-4a46a53abc9so138778b6e.3
        for <devicetree@vger.kernel.org>; Tue, 28 Jul 2026 13:41:06 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1785271266; x=1785876066; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=wxlSATJdp1icBuAyE2MHftLf5IzsPs8NNyx38DkjeJg=;
        b=ingu+2nge/AtXY5l+19FmgGEZ4RTB0M1GgCZDKCLamCmcwuyJ2T+jTdZTDKVEgaGIe
         BNyJo+NcFwA6PRBRhAmqZK10LIYeRiGjviQEFb5c9COKtZU0+ze+s+c3rZSy/+P3rMKu
         XPFssp+a+gKFqMPO4fGn/FdirW8ejfeepDcAr7w0Ij+byqg9kaAaWY9gz/+eEor/aw3D
         hWou28T7XKDzB1Dp+yDWWjkeIi0Uj/8eqx6bcZ5/E0RGzs9cG7Gx4TBG7Zv3nEK1NidR
         /KTwtoT5HcftRS3f9jPD5rlk7UY0mJYI2x5nWU1Ado+Nea2Jv3AB5F00BYPka949IKn2
         vbLA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1785271266; x=1785876066;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to:content-type;
        bh=wxlSATJdp1icBuAyE2MHftLf5IzsPs8NNyx38DkjeJg=;
        b=YjXGbLXZQBb1ywVOHKH5ldkwSudYs5JY7fIKectxIDB64mESIDZgI7ZyUSmu2fZSgd
         nUFsVqhGKUYgLvw/7VPjvkqdTizqJxXYku/gsNheuntGt+yKC4Vlg2iVK4ujNnW2EnUJ
         Wg+g6bOdIcFa7jZbEu6AX0wfui9wkvRAqqUWfDYfm5Z3Gt7Zms3DyE7xbKkD8OKiQUFA
         Pahs0+/HtA5eFGVCj1Ci8aqxXFKCdk9bwTvqMEfogUMgxv/xTAyNIvTKneVmEm11Bp/0
         Lc3SiDrIqemjZvmuSynAmQLbmh91XiEclraQh4RwRHl4BcaVeNvJJmCITUA+o5D/+9N9
         Q6CA==
X-Gm-Message-State: AOJu0YzqTbUqmTmn90xWcTjWeDXnZClBimJBeo2jA3wkskuW4y8e7/jo
	nYTGRepCjRhZ0bqmVDho1SGNd+weNTZJgc+aJ16cZlcrhfkGOYk37zek
X-Gm-Gg: AR+sD12aXH5U3VoVlgdUAf4gN8ZzSqJekRyOtNqnVrGqX8JFKaUa5tdtmro70G+YRxT
	6eCQ4SbSN+badxyjLSRxI6EUfEHcKdbPxTNt6AeGkP0mG6z3aCC0DrgeVlIhNiNiMri9T51a+O9
	O6OglR6XcduyxTZd3LdG89cI3Ghfdo4ugahia+MYd7B7Eta8vn3HE7pG92AEMyHfGOecksiXfaP
	Y32v7DQmkinsZwbxTQxarTqev7MsbEXn7ve2bCqcIB4SOjxc08eNIsJRma+KMIKhjBnoaR1J7GD
	dFzFH2TAXT/hzLerixIeplipWfxhlmewxB4o2U8fILEsuV2XvSAqbVMgyul6VCjEKxPFpQ9cSt3
	5HCVaCj/OFZ4ez1QITFgPSk/qjbdLVWnPS7Uw4N1psgs725YBIjcUNMzpum1aNh0zmYLHaXE20T
	3Ih0xTOensJjJ8loGKFuqANYtKEwnRJNnSguaJETsrQHV2fTVxZYmWBVrhVTapdb6mWmnIgYUPJ
	GoB6sOq
X-Received: by 2002:a05:6808:1451:b0:496:dfe1:e8ce with SMTP id 5614622812f47-4ad5b83450cmr2320808b6e.22.1785271265851;
        Tue, 28 Jul 2026 13:41:05 -0700 (PDT)
Received: from localhost.localdomain ([2600:1700:fb0:1bc0:9162:e42b:cb94:2d55])
        by smtp.gmail.com with ESMTPSA id 5614622812f47-4ad6efc5c3fsm129884b6e.13.2026.07.28.13.41.05
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 28 Jul 2026 13:41:05 -0700 (PDT)
From: Chris Morgan <macroalpha82@gmail.com>
To: linux-rockchip@lists.infradead.org
Cc: devicetree@vger.kernel.org,
	xsf@rock-chips.com,
	sre@kernel.org,
	heiko@sntech.de,
	conor+dt@kernel.org,
	krzk+dt@kernel.org,
	robh@kernel.org,
	Chris Morgan <macromorgan@hotmail.com>,
	Conor Dooley <conor.dooley@microchip.com>
Subject: [PATCH V10 1/4] dt-bindings: power: supply: sgm41542: document sgm41542
Date: Tue, 28 Jul 2026 15:38:29 -0500
Message-ID: <20260728203832.166402-2-macroalpha82@gmail.com>
X-Mailer: git-send-email 2.43.0
In-Reply-To: <20260728203832.166402-1-macroalpha82@gmail.com>
References: <20260728203832.166402-1-macroalpha82@gmail.com>
Precedence: bulk
X-Mailing-List: devicetree@vger.kernel.org
List-Id: <devicetree.vger.kernel.org>
List-Subscribe: <mailto:devicetree+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:devicetree+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

From: Chris Morgan <macromorgan@hotmail.com>

Document the SG Micro sgm41542 battery charger/boost converter.
The parameters of input-current-limit-microamp and
input-voltage-limit-microvolt are defined as such since they are in
common use among multiple bindings currently.

Signed-off-by: Chris Morgan <macromorgan@hotmail.com>
Reviewed-by: Conor Dooley <conor.dooley@microchip.com>
---
 .../power/supply/sgmicro,sgm41542.yaml        | 96 +++++++++++++++++++
 1 file changed, 96 insertions(+)
 create mode 100644 Documentation/devicetree/bindings/power/supply/sgmicro,sgm41542.yaml

diff --git a/Documentation/devicetree/bindings/power/supply/sgmicro,sgm41542.yaml b/Documentation/devicetree/bindings/power/supply/sgmicro,sgm41542.yaml
new file mode 100644
index 000000000000..af80fe528505
--- /dev/null
+++ b/Documentation/devicetree/bindings/power/supply/sgmicro,sgm41542.yaml
@@ -0,0 +1,96 @@
+# SPDX-License-Identifier: (GPL-2.0-only OR BSD-2-Clause)
+%YAML 1.2
+---
+$id: http://devicetree.org/schemas/power/supply/sgmicro,sgm41542.yaml#
+$schema: http://devicetree.org/meta-schemas/core.yaml#
+
+title: SGM41542 Battery Charger
+
+description:
+  The SGMicro SGM41542 is a single cell battery charger/boost controller.
+
+maintainers:
+  - Chris Morgan <macromorgan@hotmail.com>
+  - Xu Shengfei <xsf@rock-chips.com>
+
+allOf:
+  - $ref: power-supply.yaml#
+
+properties:
+  compatible:
+    const: sgmicro,sgm41542
+
+  input-current-limit-microamp:
+    default: 2400000
+    minimum: 100000
+    maximum: 3800000
+
+  input-voltage-limit-microvolt:
+    default: 4500000
+    minimum: 3900000
+    maximum: 12000000
+
+  interrupts:
+    maxItems: 1
+
+  monitored-battery:
+    description: |
+        The charger uses the following battery properties
+        constant-charge-current-max-microamp (default 2040000)
+        constant-charge-voltage-max-microvolt (default 4208000)
+        charge-term-current-microamp (default 180000)
+        precharge-current-microamp (default 180000)
+
+  reg:
+    maxItems: 1
+
+  regulators:
+    type: object
+    properties:
+      otg-vbus:
+        type: object
+        description: OTG boost regulator
+        $ref: /schemas/regulator/regulator.yaml
+        unevaluatedProperties: false
+    additionalProperties: false
+
+required:
+  - compatible
+  - reg
+
+unevaluatedProperties: false
+
+examples:
+  - |
+    #include <dt-bindings/gpio/gpio.h>
+    #include <dt-bindings/interrupt-controller/irq.h>
+
+    battery: battery {
+      compatible = "simple-battery";
+      constant-charge-current-max-microamp = <10000000>;
+      constant-charge-voltage-max-microvolt = <4350000>;
+      precharge-current-microamp = <180000>;
+      charge-term-current-microamp = <300000>;
+    };
+
+    i2c {
+      #address-cells = <1>;
+      #size-cells = <0>;
+
+      charger@3b {
+        compatible = "sgmicro,sgm41542";
+        reg = <0x3b>;
+        input-current-limit-microamp = <3000000>;
+        input-voltage-limit-microvolt = <4500000>;
+        interrupt-parent = <&gpio0>;
+        interrupts = <26 IRQ_TYPE_EDGE_FALLING>;
+        monitored-battery = <&battery>;
+
+        regulators {
+          otg-vbus {
+            regulator-max-microvolt = <5000000>;
+            regulator-min-microvolt = <5000000>;
+          };
+        };
+      };
+    };
-- 
2.43.0

