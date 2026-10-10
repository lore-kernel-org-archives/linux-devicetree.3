Received: from mail-wr1-f47.google.com (mail-wr1-f47.google.com [209.85.221.47])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id F31E44AA1E1
	for <devicetree@vger.kernel.org>; Sat, 10 Oct 2026 13:00:44 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.221.47
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1791637250; cv=none; b=JqD1Zp439fQsi9e5KAKtiaAsZuLp8bB/kmF0qVM6WY5/ihedff+CsWRvwNU2RP97zwh7XsygH7Rh0FAdabFdC4b86i+sSJqyq6pKoRbiTiWbhcStN/1vFzYIryYsDKW+0ud6zsPgZP9r8rOornthnMqUMr4g9Is/xwNwrbJ/fsQ=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1791637250; c=relaxed/simple;
	bh=LRlsp+7Wkjv4NlQijqgL+btcCaWjo6W5DhGeHyIWFqw=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version; b=EOlnJLIFjo/DBS+Ifes3EaF9q0PAMV8+kz0KEJ5zxWcprf/iaFwyAd5my7S0m8TOmeg9y14o6Kat0J97UC7G6q/RMeooL364cB/chMvWc3Gwuhr5AFF7oz6r2gyL9MU4rFrgH5T5YMX5guBBUIYtAznabso6aVXoppaMVGLf2XY=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=mEOfyGN0; arc=none smtp.client-ip=209.85.221.47
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="mEOfyGN0"
Received: by mail-wr1-f47.google.com with SMTP id ffacd0b85a97d-48b0584ad71so305471f8f.0
        for <devicetree@vger.kernel.org>; Sat, 10 Oct 2026 06:00:44 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1791637243; x=1792242043; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=YO8Lfw0R/ZajnaY4WHrnUbXF7RAAHoajPla3LSdk9go=;
        b=mEOfyGN0HmYes2TO+J4lUy69XxGTpUbQD+Kn/54g9rKzS0T+EH8qhIojbZ9R2HjHpb
         +kXuMsuAj4ipeo2LGQF8Tvn9lyUx/Y8KYyUyfjeld0UIiWzjsuPG4TMe0eSwgRF95TuD
         Gb+ONA863W0R8zTPYTdP+5zxNncBOna5FjuveMzQh2yF4wnYhMTM65mPpE4c/2yO38D6
         KBAk1Dea9fngpzInJDFpt1sul0tV56oLl49reH4A3aQrl4omVsfqdJTOZ74Ta42bN1qp
         Et70aQ0T/tu/Z0l4n3UO87K1rNAZhAttjIUcccNzI4BZD8vl7Wcp9iToZWnwKTTFRKTx
         +Znw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1791637243; x=1792242043;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to:content-type;
        bh=YO8Lfw0R/ZajnaY4WHrnUbXF7RAAHoajPla3LSdk9go=;
        b=2t3fHNTi4VNF4Mi4ZTjvtE6sxiQALVilZng543tYZA5HkzO15Ydxp9LcmvPCIZjR2D
         oh+FfA4qmbeH4vwoTYpiRL/ZNi+uNc5aOw0wMi7UjJbg6MixDWvHbl80ePszav/YiEn2
         8yu3ViSgC64b29rAxWyPc0U9wKPx9gPlnjqE9o6zsSV5Zjx3k2K0PiV7y1C+ldDm6U0r
         iNBtOWpLlrmT/vJE1hq32VDb7/lJ/6gVKS9gB0DsFmr6pozJj3of7xs78jf3XshOnq0z
         5KALnJwenrYzTzwSKc2OQL6znBZxGB26phs/36cJ3fZXvrcnm6/570HwH8rOVUQCTf+F
         Lq6Q==
X-Gm-Message-State: AFq9FYIIJECe8RYKxCGeWt/Locy9zZolqbc3fi52F11jSCAO+0aHFx2V
	3EZDq01hDb3e8WMsPubNBlnMYsdPQZ2491H8h8mVralsbAdQMbeQ9sW/
X-Gm-Gg: AYBFou3rN5LBtmZpsdlpxhFzBwI6wRJNVrD93YJab4VWsUQR9/Z+OecaRrbBowtj0I1
	rSY+36fTowAabagLIemKsiasrY9VLVSpD7aFklqW3dPzbzUwPcK4SmfzkEIyQCVCCVuEin6mbYl
	vMjkCDE3qvJYvGUt3OrusFpFHmJi63lew0DhNVctVpT2FAKoyOaS4i6RBl0mONoDVEMPKyls+hP
	Z8Nq54/EWFsvijmpb3FVaZHQvPZD2kYAzbZPH+hRjfVj/N5zjp6LIHi135tc73eaxxCh/e9i4ko
	shcPPQIxEXbfVpi/l7ee41ZFReIodOQwrjCKDZbN0zTZadcequAY7huWcmeQMUbyqmyWoA+i2n8
	XWkQZoUOq/4VvmC7qMuQ9tcecduHPSdAJRZl1UbFWtO0VHwP/bwMtfRj9zkd59oFuhX2hT/rryH
	PO4N1zN7jLFqRH+UxJBWiKkvw8ZhbqPbjzeDGMNO+aI/PMZ/H2gkMcrV7ffO6QM8rQMa0UwqJGt
	AIkMaNgsyXXHR1mQc4jow18wt6w4LtRWtbyIorRr+0Hz1CRtHMczDIvkth96bARyfBT6sTH23kf
	IT60O4Al8i87D3Agt3fAglNlP8ZUi4JZhvJCcAFv36b9lohTiA71gRr9+LXq9Q==
X-Received: by 2002:a05:600c:3ba5:b0:4a1:70d4:c69 with SMTP id 5b1f17b1804b1-4a18e4c03bbmr101466895e9.28.1791637242847;
        Sat, 10 Oct 2026 06:00:42 -0700 (PDT)
Received: from navid-pc ([2a01:4b00:a856:6220::a11])
        by smtp.gmail.com with ESMTPSA id 5b1f17b1804b1-4a190c49d5csm162309975e9.3.2026.10.10.06.00.42
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Sat, 10 Oct 2026 06:00:42 -0700 (PDT)
From: Navid Ghahremani <ghahramani.navid@gmail.com>
To: linux-arm-kernel@lists.infradead.org
Cc: devicetree@vger.kernel.org,
	linux-kernel@vger.kernel.org,
	arnd@arndb.de,
	linux@armlinux.org.uk,
	stefandoesinger@gmail.com,
	robh@kernel.org,
	krzk@kernel.org,
	Navid Ghahremani <ghahramani.navid@gmail.com>
Subject: [PATCH 14/24] dt-bindings: net: Add ZTE ZX279128S MDIO controller
Date: Sat, 10 Oct 2026 13:59:52 +0100
Message-ID: <20261010130024.177503-15-ghahramani.navid@gmail.com>
X-Mailer: git-send-email 2.55.0
In-Reply-To: <20261010130024.177503-1-ghahramani.navid@gmail.com>
References: <20261010130024.177503-1-ghahramani.navid@gmail.com>
Precedence: bulk
X-Mailing-List: devicetree@vger.kernel.org
List-Id: <devicetree.vger.kernel.org>
List-Subscribe: <mailto:devicetree+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:devicetree+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

Describe the MDIO register block and its work/register clocks. External-
PHY pin selections use pinctrl rather than direct syscon writes.

Assisted-by: LLM
Signed-off-by: Navid Ghahremani <ghahramani.navid@gmail.com>
---
 .../bindings/net/zte,zx279128s-mdio.yaml      | 67 +++++++++++++++++++
 1 file changed, 67 insertions(+)
 create mode 100644 Documentation/devicetree/bindings/net/zte,zx279128s-mdio.yaml

diff --git a/Documentation/devicetree/bindings/net/zte,zx279128s-mdio.yaml b/Documentation/devicetree/bindings/net/zte,zx279128s-mdio.yaml
new file mode 100644
index 0000000000..49ff7e7b1a
--- /dev/null
+++ b/Documentation/devicetree/bindings/net/zte,zx279128s-mdio.yaml
@@ -0,0 +1,67 @@
+# SPDX-License-Identifier: (GPL-2.0-only OR BSD-2-Clause)
+%YAML 1.2
+---
+$id: http://devicetree.org/schemas/net/zte,zx279128s-mdio.yaml#
+$schema: http://devicetree.org/meta-schemas/core.yaml#
+
+title: ZTE zx279128s MDIO controller
+
+maintainers:
+  - Navid Ghahremani <ghahramani.navid@gmail.com>
+
+description:
+  The MDIO controller of the ZTE zx279128s reaches the PHYs of the integrated
+  switch and an optional external PHY. On boards with an external PHY, the
+  default pin state connects the interface to it.
+
+allOf:
+  - $ref: mdio.yaml#
+
+properties:
+  compatible:
+    const: zte,zx279128s-mdio
+
+  reg:
+    maxItems: 1
+
+  clocks:
+    items:
+      - description: work clock, the source of the management clock (MDC)
+      - description: register (APB) clock
+
+  clock-names:
+    items:
+      - const: wclk
+      - const: pclk
+
+required:
+  - compatible
+  - reg
+  - clocks
+  - clock-names
+
+unevaluatedProperties: false
+
+examples:
+  - |
+    #include <dt-bindings/clock/zte,zx279128s-crm.h>
+
+    mdio@9a101000 {
+        compatible = "zte,zx279128s-mdio";
+        reg = <0x9a101000 0x18>;
+        clocks = <&lsp1crpm ZX279128S_LSP1_MDIO_WCLK>,
+                 <&lsp1crpm ZX279128S_LSP1_MDIO_PCLK>;
+        clock-names = "wclk", "pclk";
+        #address-cells = <1>;
+        #size-cells = <0>;
+        pinctrl-names = "default";
+        pinctrl-0 = <&ext_phy_pins>;
+
+        ethernet-phy@8 {
+            reg = <8>;
+        };
+
+        ethernet-phy@10 {
+            reg = <10>;
+        };
+    };
-- 
2.55.0

