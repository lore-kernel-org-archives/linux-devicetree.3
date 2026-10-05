Received: from mail-pj2-f6.google.com (mail-pj2-f6.google.com [74.125.227.134])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 1CDD8392829
	for <devicetree@vger.kernel.org>; Mon,  5 Oct 2026 22:13:00 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=74.125.227.134
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1791238381; cv=none; b=dIIfoNU7aoAxbwTEtO2d/ptzyz0NF8SAUCziHpAF+czJrHKH2JS/wbowbG8zRu4WHoIrCGH2+SnwcBmdnyzYiAd8jwZZXDPJZRwenTOPIM9VEPm3Se8QB64ldapFVGBM2QUnsB9XohGggv2NAUnBfI2mSBGcVlApwhUIgkqX5Bo=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1791238381; c=relaxed/simple;
	bh=RQ8/bIf5S9U/FiX3uQoU1u6/FV6K7LLD2uqZys3J7EY=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version; b=UcRhPTiF9lI+LxuQ0QfZfzOe3kI8A9xtoZw5aGPUKDZclcP086s0XwlriTL0w9pbNze0vwbT2mZqeAvZRSWaAyLj3aOvTqLr4gUr7yVSZQyathUvtr1b3vJ9LG04vos0xkCiZAYlj/VsxR5Zhfq8+ouH4D0XopHbr6tdjIzTYfA=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=sbsj82Ho; arc=none smtp.client-ip=74.125.227.134
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="sbsj82Ho"
Received: by mail-pj2-f6.google.com with SMTP id 98e67ed59e1d1-3964e7720afso744483a91.1
        for <devicetree@vger.kernel.org>; Mon, 05 Oct 2026 15:13:00 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1791238379; x=1791843179; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=v2tJApUzC1LEzp8M/eTL2SHChylQhCDDbwAQQxkGsv0=;
        b=sbsj82HoqdWry/itx8mocPJ+s90YdlNFJ+f6TSQSYANPFJmD07zcwHsFMjXeYaqRTQ
         sRHcbKJg487/0/JOADiK5jAHor30QO+eU+YdUIyrtA2J+XB4T8EoE3+BLD5uhVLGd5zu
         +K50NYnIKTNxQvf1cahlwRxlRTrQ/M3RjmNYWMOmbw/B9ezm7//EPk5F4O4IE0Irk1y2
         EyOSOxHYKVyG2lIhr9pkVWzMYCr3s5DAmA1A5ActM+tVgfGxPMv+CSxNk2FR+MtooMbs
         fKDc2i+nRYt4F92Jyu+xgZgqSLUwPsNzPmI+XNbt5RVkFwbxUMf5BocD+ipVjYlCDuz4
         rFSw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1791238379; x=1791843179;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to:content-type;
        bh=v2tJApUzC1LEzp8M/eTL2SHChylQhCDDbwAQQxkGsv0=;
        b=o1BIoHKbMo1Bc1lFywo0b6cM4Go1kfvgbrabmmQi2NedTaDARyBC9y5j1FZSNQaWr8
         ZMyOflI+1LuqLYTRy95BubtED6K7NV/E8LCDpRhg0dtFu0iiIr4pHVRw5zxiyrsTuQTi
         8YIhEb+SIESL1N38rRYvAwtaB/E15IobKHcbBTDlaApRJDYCQsifrCfD7fHyT7xL2QsH
         17NpAn0Mcp43wBlhZkOudQ9VqnDVD8BrjJ9TuU0BkeUsv2z7rby3L1qWEvriR36SijjI
         PvsQuqFp9CXHc09ZOkrk/kct3XUzZQ3vOLlW4KscOg/6WuHNnCvskgIhJGAX2VpbfOJe
         HGKg==
X-Forwarded-Encrypted: i=1; AKwUvBzZ8y0qsch5k3XprVSueTQl4W9tRa3vNVvGs2KOZOEhA2JLPW3POp8SNIDyWwqDruUcEA9jPUvxpVsq@vger.kernel.org
X-Gm-Message-State: AFq9FYI9VcdAyaagbSr1aXgBD8tdxOysYnYB0JGcQm5JagL2BUwZS4mv
	CmN1GE3StA+yFejzxjOxIavWqfI3yl6Tbwk7Vpu+EXi5VZmYr2R//tgq
X-Gm-Gg: AYBFou1FHE3vf35nOodgF/j5ciot35knx8XyrfYU8smqDIen03xPbNCpgVwKlToKAjy
	YCD6g9Ar3Lr62ISgmogU6vcqPd39N83KgHbK1bBb+6L0EuNiS4KyHwqMqmkIcRmJDGrq0mP8Dj2
	OJUyNdY+S4JiVry2biti1liQKd5A2w1JTBjUjDH2fajyQUN3LVXfQlFy6RBqy957YF/J/bACwSo
	4m2xAU7EXI/oUgX0Ac7VjJGH03M9mr3Ts5bGAwmnUa9C1O/xZrvs5s9aBBVSVqVE1cbewNrPv33
	Pkj7nE6k5AilMiPurgux9m5G6J1lkyERald2zC5MNvM0mzX4SQsbY6abK7mrG/oSjiQZ4TuHGBk
	t43HyPZEAy32hgDswEHpBeGNZzYahjlDiN1cA8zYLujEC6bv2EL65xik5VOrEH5XGJdjQ7J+pjb
	u5aR1CuJ8s9X8jVeZIBt4LZJctGxpmkk7nqKc8pTV1j/XZIUimGJKcqafBLAcOLQWHKerw
X-Received: by 2002:a17:90b:518d:b0:3a4:b418:94cf with SMTP id 98e67ed59e1d1-3a6cec143d7mr10688007a91.14.1791238379236;
        Mon, 05 Oct 2026 15:12:59 -0700 (PDT)
Received: from server.lan ([168.138.199.194])
        by smtp.gmail.com with ESMTPSA id 98e67ed59e1d1-3a8533aba95sm1719425a91.2.2026.10.05.15.12.54
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 05 Oct 2026 15:12:58 -0700 (PDT)
From: Coia Prant <coiaprant@gmail.com>
To: Vinod Koul <vkoul@kernel.org>
Cc: Neil Armstrong <neil.armstrong@linaro.org>,
	Manivannan Sadhasivam <mani@kernel.org>,
	Rob Herring <robh@kernel.org>,
	Krzysztof Kozlowski <krzk+dt@kernel.org>,
	Conor Dooley <conor+dt@kernel.org>,
	Heiko Stuebner <heiko@sntech.de>,
	linux-phy@lists.infradead.org,
	devicetree@vger.kernel.org,
	linux-arm-kernel@lists.infradead.org,
	linux-rockchip@lists.infradead.org,
	linux-kernel@vger.kernel.org,
	Coia Prant <coiaprant@gmail.com>
Subject: [PATCH v10 1/2] dt-bindings: phy: rockchip: naneng-combphy: add rockchip,sgmii-mac-sel property
Date: Tue,  6 Oct 2026 06:12:28 +0800
Message-ID: <20261005221229.1095843-2-coiaprant@gmail.com>
X-Mailer: git-send-email 2.47.3
In-Reply-To: <20261005221229.1095843-1-coiaprant@gmail.com>
References: <20261005221229.1095843-1-coiaprant@gmail.com>
Precedence: bulk
X-Mailing-List: devicetree@vger.kernel.org
List-Id: <devicetree.vger.kernel.org>
List-Subscribe: <mailto:devicetree+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:devicetree+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

On RK3568, the SGMII interface can be routed to either GMAC0 or
GMAC1 via the pipe_sgmii_mac_sel bit in the pipe GRF registers.

Add the optional "rockchip,sgmii-mac-sel" property to allow the
device tree to select which GMAC controller is used for SGMII.

The property takes a value of 0 (GMAC0) or 1 (GMAC1). The hardware
reset value is 1 (GMAC1), but this can be overridden by setting the
property to 0 for boards where SGMII is connected to GMAC0.

This is necessary for boards such as the Ariaboard Photonicat, where
the SGMII interface is connected to GMAC0 and needs to be explicitly
configured.

Signed-off-by: Coia Prant <coiaprant@gmail.com>
---
 .../bindings/phy/phy-rockchip-naneng-combphy.yaml   | 13 +++++++++++++
 1 file changed, 13 insertions(+)

diff --git a/Documentation/devicetree/bindings/phy/phy-rockchip-naneng-combphy.yaml b/Documentation/devicetree/bindings/phy/phy-rockchip-naneng-combphy.yaml
index 379b08bd9e97a..8e898bce9af73 100644
--- a/Documentation/devicetree/bindings/phy/phy-rockchip-naneng-combphy.yaml
+++ b/Documentation/devicetree/bindings/phy/phy-rockchip-naneng-combphy.yaml
@@ -80,6 +80,15 @@ properties:
     description:
       Some additional pipe settings are accessed through GRF regs.
 
+  rockchip,sgmii-mac-sel:
+    $ref: /schemas/types.yaml#/definitions/uint32
+    enum: [0, 1]
+    default: 1
+    description:
+      Select gmac0 or gmac1 to be used as SGMII controller.
+      The hardware reset value is GMAC1 (1). Set this to 0 to route
+      SGMII to GMAC0.
+
   "#phy-cells":
     const: 1
 
@@ -105,6 +114,10 @@ allOf:
           maxItems: 1
         reset-names:
           maxItems: 1
+        rockchip,sgmii-mac-sel: true
+    else:
+      properties:
+        rockchip,sgmii-mac-sel: false
   - if:
       properties:
         compatible:
-- 
2.47.3

