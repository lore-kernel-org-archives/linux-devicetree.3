Received: from mail-pj2-f10.google.com (mail-pj2-f10.google.com [74.125.227.138])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 493C74BC005
	for <devicetree@vger.kernel.org>; Tue, 22 Sep 2026 20:04:10 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=74.125.227.138
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1790107457; cv=none; b=f8nPjCPK3inzyRNo9ZvlJjKixzYOErrDGtiQIzQk4MDH9HtKVcN+pfz6kKF30y88J0RmwK5Bg8NWyd7y8DFtUxF7KHTfxZTooMjiNscCQz1ftGywjN5QKBrzZwXcj710liUjUee9dYy9QyQnLvjmfC0FfAVzOPqo2Gw/dI0uPMs=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1790107457; c=relaxed/simple;
	bh=RQ8/bIf5S9U/FiX3uQoU1u6/FV6K7LLD2uqZys3J7EY=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version; b=HOMO250Yi22RJwqJdd4+3A82sl9sl6EOc8yFJhn1qjpnzgat35tgQuaAN6EPoGDQV+RQmTUePTD0iOuGfWwpU9nc8VwpO4rDlpK69ApaDq/Vu+y8e8Ym+IhP35IppCjGK6vEwxubjfjGLCRPbmpkKufziOrQYc06IuyETlzaYNY=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=d7aTeVc/; arc=none smtp.client-ip=74.125.227.138
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="d7aTeVc/"
Received: by mail-pj2-f10.google.com with SMTP id d9443c01a7336-2cf5e516e67so453935ad.1
        for <devicetree@vger.kernel.org>; Tue, 22 Sep 2026 13:04:10 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1790107443; x=1790712243; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=v2tJApUzC1LEzp8M/eTL2SHChylQhCDDbwAQQxkGsv0=;
        b=d7aTeVc/rk4js/lhi6D2RU1PbGqx6YqBvY1FyIV+qBrBrNci13RLNSCH6AAxKUfcYu
         eYlZSXIjycIoUCL9bVE6qk235DIIXtBYJbkbVXKQS/60OX5eeUbHhI6OZTs/MCxEMAcy
         plpBCqvGEmu9Aq8IzAG4RW1eJVxAUvfdoF74lfQvvSFZ8oSz8VeQ5RLGqub75CJ0dnDr
         Z8RkzeRFwgiuxVwSWhnadv2HGkzyI7c2x1bHWRWfiFlT/osiGJLOrCyhKxlyv1w8E3FT
         vguKvMyZrVMnBVDOk6UoW95lgEN8v9eRkLffkrzVt033KdumaYvTD2YgdJ7xvYqAPYT8
         p7RQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1790107443; x=1790712243;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to:content-type;
        bh=v2tJApUzC1LEzp8M/eTL2SHChylQhCDDbwAQQxkGsv0=;
        b=VD6QFCcr27cWV/ajZQF9amMo+Bm1ALIRzoZZpJN5MpZngCFGkvrbzrUqt0inLddYEp
         PMxolm6XcbbqSy+hWyfKjqJNgvuDW5giIG2iOavQe/Uf96BcxVZrXj3PjLM83RK9wLkl
         f4U5KJY8oOwtoT0E9Kh0CELWA2eFBtl0AY3mc9Zrkr1Cg6YBafb9ZMu8l2V5sKSJzB4Z
         X+WIsN5/B8ipMJokXtJTlcNmfnEWlbnGnoAi1ukA79iM8NKGtoY6fF0eJD37x9O4bvgi
         WLkWr2798M6LlPYOJ7nXmfd3XDwewR5837ZlP5gHGwZz7U7cGMDM3Zn24imNuXS6rwzE
         M+LQ==
X-Forwarded-Encrypted: i=1; AKwUvBwyWL2oQTuOP5emgbYcmePrSn3jsgCiGJqHl+8nI0Kfnlm0F8sN/BfuNmHcAL07LJ1pA3QAZJLp1JXa@vger.kernel.org
X-Gm-Message-State: AFuF++nRmyDfh/D7sJ6rolGEcg6ITItkElgeRCzqlIBdpBc2ljpuLqV2
	MUyYj1G2Nru5yNMYX8kf6D6rjGC0d6LdrpYjmUYoeBV11TZn/o9GUvgX
X-Gm-Gg: AYBFou0mGhb+HnejOwFglH5VygxkRLwtkfCU4/BrJpQaqVIz4GbaC/cd/kpWwpnZspR
	cvI3W5tet9drEnKtC7k8hRQJVYtWB8W9EcSfI36dCtBLEuDC6DJ5ruBOjerPz4WkjwCrXapNw54
	nBwoAWmc4sI48D+7mRZ0cFNbj5AqtsBPg7qRiUKtxb3khEnPajmGCJyusMajgf8psdHU3BDX0Q9
	yszCdmTxidnz4iPeOvxSSJlP8P357NR6ZUGBcU9SoLtv+IHLD9h1nZkLpHP7WEGU9oMfP4BIxpH
	ROL4364vHA6Lpv4es+sFWwXloLRPtm9dnFTEI7OEl6f/G8Ih9HWnw7OsTQsbvM5Ay0U38v5sStn
	HwZuY5/jnluN7TqRGVBgBbu+YlVo2hG49uPuJOuIHYAfVzaIhzf5/y0ttz6Jdp+gsAU5Ra9MxOc
	xP84GMjd8+DSisYB3WXiEOn8aX66vWo3+mbzUk5wZ9M05axtXdKTnRVXwzsQVa5dHrx4/m/A==
X-Received: by 2002:a17:902:d4c5:b0:2d9:68b7:c324 with SMTP id d9443c01a7336-2df69d368e1mr4567765ad.3.1790107443277;
        Tue, 22 Sep 2026 13:04:03 -0700 (PDT)
Received: from server.lan ([168.138.199.194])
        by smtp.gmail.com with ESMTPSA id d9443c01a7336-2df6a5eea15sm654515ad.64.2026.09.22.13.03.55
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 22 Sep 2026 13:04:02 -0700 (PDT)
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
	linux-renesas-soc@vger.kernel.org
Subject: [PATCH net-next v10 02/11] dt-bindings: phy: rockchip: naneng-combphy: add rockchip,sgmii-mac-sel property
Date: Wed, 23 Sep 2026 04:03:26 +0800
Message-ID: <20260922200336.2201212-3-coiaprant@gmail.com>
X-Mailer: git-send-email 2.47.3
In-Reply-To: <20260922200336.2201212-1-coiaprant@gmail.com>
References: <20260922200336.2201212-1-coiaprant@gmail.com>
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

