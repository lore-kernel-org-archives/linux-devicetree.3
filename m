Received: from mail-pj2-f2.google.com (mail-pj2-f2.google.com [74.125.227.130])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 9C7773557F3
	for <devicetree@vger.kernel.org>; Sat,  1 Aug 2026 14:23:30 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=74.125.227.130
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1785594216; cv=none; b=D9/XfNxk4YtLwe3bjEIBEhb9GU/ZtDvm6OYHarRTo9GAsWxkdMIKixSSd4R9L75nAPwUKGXbH+DwHIHmsR/pGZQ7+/QJDv1pC4dYG2L2P6G5Sa/riNhI11ClrXfV280kW+JHxVFJa1eigcOGJsD++y80fgYj72u/cSxgcuaNavw=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1785594216; c=relaxed/simple;
	bh=RQ8/bIf5S9U/FiX3uQoU1u6/FV6K7LLD2uqZys3J7EY=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version; b=YeRyUAIyGcYCkT2ZSlQ3szjmvuqXTLoG5llQ14EZHcK84Ge6Fi7H47+0gVj29fZiu6OX4JGwtYfVNQLR5Mrbc15Q3LiDTJ4eZh6tVMVcLByaRclSbUylFr0F6aqMkoZebr3AE1WPbo07xRWcPVGXD5jFi1V6WfJ5QH7b4SzNPfI=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=XAJ0FX53; arc=none smtp.client-ip=74.125.227.130
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="XAJ0FX53"
Received: by mail-pj2-f2.google.com with SMTP id d9443c01a7336-2ccc2e84048so11250275ad.1
        for <devicetree@vger.kernel.org>; Sat, 01 Aug 2026 07:23:29 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1785594207; x=1786199007; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=v2tJApUzC1LEzp8M/eTL2SHChylQhCDDbwAQQxkGsv0=;
        b=XAJ0FX53IV3ce2ZuIOWMYtvkboF8ATRrIx1m/aKVq9BxORjbwnCw2j0Gb+KTU8s/D1
         9uFWCSS36NHHxh98OqY/mlQ9kSi9YfYFpIAMym4YohVvpXQk/TW41yg6tT4t/9LmAcsS
         HoCH1HoXCxkkNM9sBJ+HXNQIwuAum8IhJFUKualC1mqPiJ/XdJJX3Ua5PQX2P+ttzHx3
         XRTn/vPRUedYWRY0+eXej/f2jX5Bgi9wnkVSLNL8waZMLCJ2aRhy4bBZ5m3VKnu/wRvZ
         TlfhW0oroGxdvPuiTz9X0dSQE0/wIFbBaiuy9cIbJnpizwjwla//1gFhMkq4UgG92+ZG
         aoIQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1785594207; x=1786199007;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to:content-type;
        bh=v2tJApUzC1LEzp8M/eTL2SHChylQhCDDbwAQQxkGsv0=;
        b=WCDQqGd/rW67aDtOIS6USfpUiSQZkmtbqPqaAAWpzWzEZtMWIPlZ//7eygGDcYYKrR
         j3XLMMVsGbXnc/t1qGGPqcmxK8MfqkG/VM+fu8Ozu2ygvUuPmq0q6OFUyPrQo7zQpwZi
         0Inalw2S61tR1jlCR8UHc2xfjBpgu9bXUVTKr4acfEzz6R+pHBlsxARGnspDCcc5jWad
         320aEgUEp8CnXDKtpX8k3NlhieSyHVy0Gl2uDLphvSsyOTVb5F9oLj6PNBx89606H7Aj
         w0D4Z1ei121dKPmhqEn6TpH7e7oAitFlP2HQVXSUMZANcGTDAFbDLUKcUU4oojAX+DZ1
         HNow==
X-Forwarded-Encrypted: i=1; AHgh+RoUfdXASDEvR601QjqGOrUFyRsd/8pWgNUc+7HZKIeRLBQfce5/Eb5K4itJALi8MGjsu9xtrXnD0ysN@vger.kernel.org
X-Gm-Message-State: AOJu0YxBUtiEUbxW2DnbMvchRmNf6D8dVfp86gCD0eeYPTEE40VWvobJ
	MzPc6MHgRb2so29vIeFbEBuANsZPNdtR210hO0Ht+tqR5/8rR1U2KZa1
X-Gm-Gg: AR+sD108+UGkva+to5i3NbHAubwyz0n5VhHa4kqeib30w/yN7ZKJKlG6oevRAoNs7fV
	O25+5QjsV3ZSSvcvscx9l06CfPdVTYmhm6PsnRN3dzHqV9eHZLPzSyExy0vFiMM2v9pDJt3OAAT
	3aQYRb9/H0s2eILGYvhCd1bUCRIj0qptfTQJSh6vHFt//zt+0953L4pyFtS1IlfjenmSFxepPzW
	6NPAdOmTcq8kFoH5G/xSuEFf3hIIjLMnbF7rnoxerPvKV65juBMnwy7ZmgCP9McVhCwyI4bBcd1
	XrJ520ebFYSGs7J+7vnJ7kbNJup+VQ6i4Vogf6XTdbe49wA+k4AqHpMJQXnbYQmnKNa7EJJsr1z
	JHqLrQzL8eF2YE+EQ//7bcTDVNc4Rhzr/Q7xQ4J8oBoVZb5A5juwAfHeSPgPFESAA3kyqdnMe/p
	wNoslTHbWWNmyXwT0VNeXC4Q23HKipKlVAXnmnBJC0UK+HjRjRLsDBY180U+RFex2KkQ==
X-Received: by 2002:a17:903:2b07:b0:2cf:a5da:705e with SMTP id d9443c01a7336-2d052494227mr37113295ad.41.1785594206913;
        Sat, 01 Aug 2026 07:23:26 -0700 (PDT)
Received: from server.lan ([103.213.4.16])
        by smtp.gmail.com with ESMTPSA id d9443c01a7336-2d04ae5ac3dsm18043845ad.23.2026.08.01.07.23.20
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Sat, 01 Aug 2026 07:23:26 -0700 (PDT)
From: Coia Prant <coiaprant@gmail.com>
To: Andrew Lunn <andrew+netdev@lunn.ch>,
	"David S . Miller" <davem@davemloft.net>,
	Eric Dumazet <edumazet@google.com>,
	Jakub Kicinski <kuba@kernel.org>,
	Paolo Abeni <pabeni@redhat.com>,
	Rob Herring <robh@kernel.org>,
	Krzysztof Kozlowski <krzk+dt@kernel.org>,
	Conor Dooley <conor+dt@kernel.org>,
	Heiko Stuebner <heiko@sntech.de>,
	Vinod Koul <vkoul@kernel.org>,
	Maxime Chevallier <maxime.chevallier@bootlin.com>,
	Maxime Coquelin <mcoquelin.stm32@gmail.com>,
	Alexandre Torgue <alexandre.torgue@foss.st.com>,
	Lad Prabhakar <prabhakar.mahadev-lad.rj@bp.renesas.com>,
	Romain Gantois <romain.gantois@bootlin.com>,
	Heiner Kallweit <hkallweit1@gmail.com>,
	Coia Prant <coiaprant@gmail.com>
Cc: Neil Armstrong <neil.armstrong@linaro.org>,
	Russell King <linux@armlinux.org.uk>,
	Shawn Lin <shawn.lin@rock-chips.com>,
	David Heidelberg <david@ixit.cz>,
	netdev@vger.kernel.org,
	linux-rockchip@lists.infradead.org,
	devicetree@vger.kernel.org,
	linux-arm-kernel@lists.infradead.org,
	linux-kernel@vger.kernel.org,
	linux-phy@lists.infradead.org,
	linux-stm32@st-md-mailman.stormreply.com,
	linux-renesas-soc@vger.kernel.org
Subject: [PATCH v2 02/10] dt-bindings: phy: rockchip: naneng-combphy: add rockchip,sgmii-mac-sel property
Date: Sat,  1 Aug 2026 22:22:26 +0800
Message-ID: <20260801142244.679437-4-coiaprant@gmail.com>
X-Mailer: git-send-email 2.47.3
In-Reply-To: <20260801142244.679437-2-coiaprant@gmail.com>
References: <20260801142244.679437-2-coiaprant@gmail.com>
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

