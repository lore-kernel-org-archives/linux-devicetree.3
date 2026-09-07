Received: from mail-pj2-f11.google.com (mail-pj2-f11.google.com [74.125.227.139])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 898EC4BD0FB
	for <devicetree@vger.kernel.org>; Mon,  7 Sep 2026 15:38:51 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=74.125.227.139
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1788795532; cv=none; b=PrBDRtswluSXef4r82rByt5aHkXR4GbXmY0zU66pHWW3GF5odc0ykvwwB7k88ephGI/akA2GW9sq3hi2xtBk7MadY05EDD+GOSL7HB7xaXE4yoCdtfmZeZUHH96WE3bFaI4aXg0ZFmHf618PmDAVSRvkYjvPYplqBytyK982W3o=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1788795532; c=relaxed/simple;
	bh=RQ8/bIf5S9U/FiX3uQoU1u6/FV6K7LLD2uqZys3J7EY=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version; b=VPDiFWCpVnIHcN10i94wzbRCa/TXpGIS75DDBrVPBLe3/ust4eIwFHvVOayXWqCbX1xa6/JYMw2JeF2bv3oQa8GaipANW7HoeZp8K2n0h52koSr8pWsDsUDekAhMFA4gVnMhAGRrZlGeibwC7khaZ8yuUT7fPlywYG6Ne1ITDrI=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=Dv/vx9+F; arc=none smtp.client-ip=74.125.227.139
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="Dv/vx9+F"
Received: by mail-pj2-f11.google.com with SMTP id 98e67ed59e1d1-396a51b2605so1467243a91.0
        for <devicetree@vger.kernel.org>; Mon, 07 Sep 2026 08:38:51 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1788795531; x=1789400331; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=v2tJApUzC1LEzp8M/eTL2SHChylQhCDDbwAQQxkGsv0=;
        b=Dv/vx9+FdyaJ5K0zDCPhMClqwDcb5KVaepp/oSxDG/LtCaX3Kyis/ZX1PEFp+KT/54
         l0Z3+0WN/9GdcyDAt0RWEcbLCFWEIffYYOqg2yQb3UHoscL+Vz2blenkFln/TENttXUG
         hKfSYPHjqqs9tzfIcCYvhun/I+F6lsz6+1sKLdRc0RJvLenqdb0NdOmNagNT7Sk+p+g0
         ij5aMKhzl+0TrmHWORIrgyfsbujZpATAxePIwq3071xmuin5vgvQcthSvcQVQ4lYwCap
         1ijxd9HAXK73LO4qohu5D4M8dzIuZO0kdlcZVvfdqv1TUz/O3PImNnhg4OJ2Fm1GI3O8
         Jhbw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1788795531; x=1789400331;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to:content-type;
        bh=v2tJApUzC1LEzp8M/eTL2SHChylQhCDDbwAQQxkGsv0=;
        b=Pt56IASSosyVPRXexa1YpdZC8CTO/N5JxU021uybo3icHCcNrfqVDlvmDvjb8WtUrH
         icy6+GBSIpWAorz8RIL/bcKdFnNagTTWOamaQC0RAHrC1rzNgPxFuLzAKPCgihQsRk9q
         sk+2FVJpJGV8d9s+CnSuwe+5SscjK+QRKvCyGIlwAdxnsH+Ytx5yaIjs2cd6Bhj7ocuB
         y5QmYyPlwwvtuGobpzYTtcFTeBsapIQyhj9x4hg07bMLnCP/q+4d7/vjH7RBhn4OFneE
         Vg0tFJFd+LxWLLGJWygZ/msSeix/Rp4XK1z0N7UgAy5hEbJFfRb8/r9HH7YZDxjRqXrF
         YxPg==
X-Forwarded-Encrypted: i=1; AKwUvBx0vkXn2m44M06aYE+x6CkuNHqRqIpOhxq+DEyXR64f179LM0LbHpzHdGqoNHkj8DRxiM4AQ+dTHLe7@vger.kernel.org
X-Gm-Message-State: AFuF++nrtDW0lDTSfrJPWV5vSbLSSCcfyzsjzoGSy1WceHPBZm3P9+N5
	S8HNt+Wb3+Nm2RnYXficrQSRQOgCTy89j6miLgvc6BnkIzD8CVDOLqYZ
X-Gm-Gg: AYBFou1Er61yuNnNW1NVsiivByyURrtot7nmzZg1tgjuwPhQHvLIYtOgH1+KJIcUUz/
	H/BfMu7UFZOM9QH88as9aG0EteYqxfdQVk3Gh5dG/OV/k+qW9Vpb70Oh6nYeX6NbFm6sgyMBOl2
	57iMCaYd2BMwe92xSKLkDOrFShUiDrYM+7kjaXP286WEEgiV+h4TJk2eGitDjIBuYnm7FmJbPnh
	vpfoTmvFzq1YPXII7/T0GtAm8nBlwVbEBFLdxmmmWkTGQASSRluc22dYVhUjmPq2YdxSCHcQ4AF
	99K8r1TWhcNFcJJyXht7PdqFuPhmb2W0YiNG/lovUBYZ3o5JQ0Qkek0YQZcFni3GRQ+8EK6m/dM
	85u7nueJP0kPcmhQpIXgKbBSv6SsuqyQtzMvoxYzis/Cco+siHXISj7DPWAmVEXk55Ss6vDFIZC
	RHgkM0RXcHap9UJ+87T82Gu3FpqKj3vKeEFY+/uy47b5+SKJ+22dTPiadRGes=
X-Received: by 2002:a17:90b:2ccf:b0:398:a2a3:b631 with SMTP id 98e67ed59e1d1-39b262aaf3dmr37885553a91.19.1788795530498;
        Mon, 07 Sep 2026 08:38:50 -0700 (PDT)
Received: from server.lan ([150.230.217.250])
        by smtp.gmail.com with ESMTPSA id 98e67ed59e1d1-39b260fdf9asm21690121a91.9.2026.09.07.08.38.43
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 07 Sep 2026 08:38:50 -0700 (PDT)
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
Subject: [PATCH net-next v4 02/10] dt-bindings: phy: rockchip: naneng-combphy: add rockchip,sgmii-mac-sel property
Date: Mon,  7 Sep 2026 23:37:05 +0800
Message-ID: <20260907153713.2572547-4-coiaprant@gmail.com>
X-Mailer: git-send-email 2.47.3
In-Reply-To: <20260907153713.2572547-2-coiaprant@gmail.com>
References: <20260907153713.2572547-2-coiaprant@gmail.com>
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

