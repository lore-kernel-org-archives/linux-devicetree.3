Received: from mail-pj2-f8.google.com (mail-pj2-f8.google.com [74.125.227.136])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 87E733905F5
	for <devicetree@vger.kernel.org>; Sun, 13 Sep 2026 18:59:52 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=74.125.227.136
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1789325995; cv=none; b=pWlMCh1yEwO74Tv8bZpUXPpjxEwNoOMI1Zi+ngq8BNthZfUV9pyX59JefgnAIWt5IjSWlhINPrBG++kjn1TDExj7ma76ZHLwwmpPf3HG/cRrq3uDqM+sCXRpLIH8fZNpOxB2JE7fXLUsHX51JwDHeSIMRTtwxaq9U4JePTFqlU4=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1789325995; c=relaxed/simple;
	bh=RQ8/bIf5S9U/FiX3uQoU1u6/FV6K7LLD2uqZys3J7EY=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version; b=Yt9kCgXybDV9odKsqiwgHEUTAXETsfvxPmxDA06blN9j+LqV502S0w5djdCX8PMc3zzrCn+abClWhkQw03m2GqtG1+paV/ByVaTPhAYXR59wovZfuzDNITpFxCYsDnLstG5Tk9cAPPBb/HeqAUSyPmz1AsHbcoMz97dpIHzQA6c=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=jMcljIr3; arc=none smtp.client-ip=74.125.227.136
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="jMcljIr3"
Received: by mail-pj2-f8.google.com with SMTP id d9443c01a7336-2db33361b2fso18525045ad.1
        for <devicetree@vger.kernel.org>; Sun, 13 Sep 2026 11:59:52 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1789325992; x=1789930792; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=v2tJApUzC1LEzp8M/eTL2SHChylQhCDDbwAQQxkGsv0=;
        b=jMcljIr3Bc1ewohZGYB0XhjT4p5hXYsAE6UYIq+upzPusdyYqbD34/g8J0kppm/DDv
         rJfjKpkSRTMAsjLQq83dCo19ahBSNIOxAMDX5DgXylNv25WGPZplD+3jQ863cLt6jAvu
         2SqnS7aQG70GhAnmgfwV/KNqJkzl43oVA9Nvgtc5D6wwZi6g6uVj1rVcdOlgLcXbneAK
         SncLQbtgNXz2qXW8jhmN7Nt996jBQ6LjGAS05LSoG04ohVIcLaXxTAltS/hj35nDOUqc
         miuNOqXsp60OJPmeNkrcuTJVPX/DhwUh0Ox/Gdn7kGXEzKdPNotNjcWUOC4xNXLDTwBF
         G1oA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1789325992; x=1789930792;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to:content-type;
        bh=v2tJApUzC1LEzp8M/eTL2SHChylQhCDDbwAQQxkGsv0=;
        b=J1tQtFuN4i9da4uq8ETf7L7Fq9TLJWLfkEIFS3ZiIgVjYTp9hlTzxcuCMkazvE1WYj
         +y4PXJqQf2RY7dNQp1Y4aPUQ4Ncmc7s6IPbYSbczYdKV9iBx1hilwTZ95FXR0KeqEHhh
         vioE30dVOZy4cKcyDxE88r2Q3dKCA4kgCOMbXHRassDZnmaHyXXUUPXiZxcTAhQgrzoj
         HyrdjL4o/HS4M6FMC3NBr3H2KIXwXICLHgG9s/P032+NSE72T7c6hN1wF1qPg2rPNFnY
         Cl1BT4iefLJIv0x7SGC1ooDa+x+5smXTOEeJ2x4d3vHeGb2swHY8N471TPXs88RDAXxr
         CvUQ==
X-Forwarded-Encrypted: i=1; AKwUvBwUE6Q2Y/e/7+mwlpeho8B5RZrkefhA9y0HbeUNEKxbUfSTNEim+u43ihuAakmodo6t7n6353QqYLTF@vger.kernel.org
X-Gm-Message-State: AFuF++k0XLKuZVMyucLdSup5vF3lFzlVUW5bLMdChZknSfYlsPHtlsgq
	njFraZ9q3CHF4bEkb+AG1SCW9AdmXjaqJ4vrNafOlYUNArAfkuEPZhd3
X-Gm-Gg: AYBFou3pkuzuTgCRVrjCRZUvl0Vh9RSDoaq2nM0qylFbdgOnytOKkNO0ERolujBmq9E
	5GoOYXOMHr3r+9HnVt9dq88GzSQTT5RDR/nH7YostFx3MU5yJrII/FCG/asBL3b6Di0E34Ym1Up
	eq7FQuRnrO1+KgpZnQwBKwCBOBjo6nagSx2pfpeFPIOEzTgQw7zFldQn5dgzVinwu0N85CPxDJY
	WAqkoy2VHmzS5pScsS1PKxmTL43SoQZx2zv2cOwFKHXAp9Qnui7YYSHUBnAGfLSkDhtRpsuxoxZ
	2lNyaD4wlbvvLSZJMBkf9/CtbmSV73jXJPThTpPPfwWuscLoOEG+anJnbNFCq/68odubCm7lOUK
	Pi24tjIjLkN5VU6nI2EDyGZ2LXYrwa4odDhDwFvjiHDIYiuch6iClpqN0NtnSoZgmHBnzecUIMR
	nTQy6qj6T5ZoZ/kJOATQNIKOabNyTLd+fVz1/6st+du0PDdK0Z/+Wy/CyBAZ/U6U6bgpynRQ==
X-Received: by 2002:a17:902:f54b:b0:2da:f1b1:56c4 with SMTP id d9443c01a7336-2dd2a1c9d19mr243912565ad.3.1789325991655;
        Sun, 13 Sep 2026 11:59:51 -0700 (PDT)
Received: from server.lan ([168.138.199.194])
        by smtp.gmail.com with ESMTPSA id d9443c01a7336-2dd2cca6b7bsm36808655ad.3.2026.09.13.11.59.43
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Sun, 13 Sep 2026 11:59:50 -0700 (PDT)
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
Subject: [PATCH net-next v5 02/11] dt-bindings: phy: rockchip: naneng-combphy: add rockchip,sgmii-mac-sel property
Date: Mon, 14 Sep 2026 02:58:37 +0800
Message-ID: <20260913185849.907479-3-coiaprant@gmail.com>
X-Mailer: git-send-email 2.47.3
In-Reply-To: <20260913185849.907479-1-coiaprant@gmail.com>
References: <20260913185849.907479-1-coiaprant@gmail.com>
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

