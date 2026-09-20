Received: from mail-pz2-f7.google.com (mail-pz2-f7.google.com [74.125.228.7])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 882CA46DFE8
	for <devicetree@vger.kernel.org>; Sun, 20 Sep 2026 17:02:25 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=74.125.228.7
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1789923747; cv=none; b=d4XdEax+DlL/QMRzMbsWbLY13i84vNPldLWkTpbXlMqZoYn2YP9CUTCdLZMC1yrkJPoQFvzsHUonfx6oXv/Rcze9f4dBDO/bl4li2hQFLRgKv9/DYiBuDQY07xpQAJZEFtdBvao1WDkmapPJ2PNM1n4EFkgqLNgN6kotZ7fer5g=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1789923747; c=relaxed/simple;
	bh=RQ8/bIf5S9U/FiX3uQoU1u6/FV6K7LLD2uqZys3J7EY=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version; b=KtnPhJXGkdJcAatbCSsebgEUoI44zqTEM0hUaEhCs2NM34s69tDJQNudc8shHKrzVz0xi9zFSxUI9Nuy5eHpKXYr6WMfJDgf1+PhSUccSeGDay6pbcueE4c3winvq5pIJ+eT73n7ymgiB39Xy/AFk5qAbF2yG6dDl3fJB9R6Q4k=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=GSrVPADM; arc=none smtp.client-ip=74.125.228.7
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="GSrVPADM"
Received: by mail-pz2-f7.google.com with SMTP id 41be03b00d2f7-cc4b1f7e8b7so867189a12.0
        for <devicetree@vger.kernel.org>; Sun, 20 Sep 2026 10:02:25 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1789923745; x=1790528545; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=v2tJApUzC1LEzp8M/eTL2SHChylQhCDDbwAQQxkGsv0=;
        b=GSrVPADMJ7gNakzuAequcbGwu71JjXBCM6cSVsLQtuFeLPiLB+ZdFwvOUpLvND2oRX
         kD3fFLPE5sk1qxYiRvDFZrH1Da+Mg5WK848/pwAXmLU2sGnLc0BwPhJUuumtZ9NSWgrt
         e2+KzHVqz6lEdOCudgAU9b/WWHoCVhepMQ0/fQQtug2UZA/c3U7zR+ia4fcgqSnV++al
         /XTl7DCaKw2VKlBBr46Qn6dI3hCftWPG2LQo+oG3DtrtSZybIRNEZ/IziJMcA0a5W33v
         q35yrj/SAfC7E7a48SEJban9cW1v4VtQl4T1/UWbsH6woO1Ov+SFjJ8QpSn2ZW7igvWs
         wxgA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1789923745; x=1790528545;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to:content-type;
        bh=v2tJApUzC1LEzp8M/eTL2SHChylQhCDDbwAQQxkGsv0=;
        b=l3WlU4Ggkp4b9JKnQmIL++ggHRU2YGPqwKdPJ9/VOS4EZaElroOZaVsHwPHGHlYa61
         py8PYIxXxiPZdKm0Gl0RdafhOXJiPSJrE8eKDhLw4vfQNyUhXXKR/eAvtpd2HPYdPUSs
         cUZTAudUn44EYmyr+RCExh0vZaEHaW+gJNQSeMX9NLcbShLMC2xOaAnHrNkPlHtpAwED
         /hsdmRv17QbRlIanh5PNUX/0thDZvGBdm/c3Ar9yDMw1W/hd/SYssDOkSV/rSQ9Zi283
         E9X9Wo+5avVoleZbp+JYyC9IDncLNEeLhvH4mMBefnuLc4DZdjZKbDIh2m5Iw97/FNbE
         L+/A==
X-Forwarded-Encrypted: i=1; AKwUvBz26KUABJ5FMyr7PaIE1Ot5kt1JT+uOv17+L10K3bjV5o5DfQqo9PTPblK4RfaBwDFfCWBs/31qTdkO@vger.kernel.org
X-Gm-Message-State: AFuF++l6YCLHmPseOrFSfvC1rHOWVvRrnE2nbkZqYc/ThUrWvWx4j3xk
	Wh2joYHcZY7ajazrHUwzJoZcwNDEBasBwOcg4jl4reH0OW/lhf/igWtY
X-Gm-Gg: AYBFou3kTeB5NAHp9PBC9L79XLRf/AU6tPbSuCA4FBwvDu7i27whAsR3jb1vno+cjv9
	WcuMozHFyB2tDOSxd7bIKi5GpKsowcHPcglbPcOssueYgMpHvKAsODefmBPzybq9dXNhiS52Aa9
	eMRhI76F9ilHLb9y353D8vEJgHULsyRgS69XiZx6Kfs+LEbGH1JPOrozcglf3S/AfyS3NwwP7m/
	QGx/eYj9MJiPcKBTXuFLMr8dLhsqBjTojpAhomg6ItUWQLEC2ltvPq4n6rrS2eRzQo+dI0mEsik
	XN5HURJXrnh9DgmzLUol7tC6kPlEqf9aSYFYTYuVnc3Mrka2n+6UvRXL4QM8MrznqRHYdLT1FOE
	zAVeNloVKKqLsePPREVsmgcufLCcHh4oPcPi5EX4bDtsvXT4bcafvWog/Io1n8ojs9EWuy9Vf7U
	jZRgR73Naexu9WSnH4Ko/x4Mvq3UrOeB0Z0wIJRIbziVcolC9aU9UJhd7uFDYRTb0vdjcIESjrz
	LLmdlIG
X-Received: by 2002:a05:6a00:298e:b0:874:708d:b621 with SMTP id d2e1a72fcca58-874e02e5f4dmr13003999b3a.31.1789923744661;
        Sun, 20 Sep 2026 10:02:24 -0700 (PDT)
Received: from server.lan ([168.138.199.194])
        by smtp.gmail.com with ESMTPSA id d2e1a72fcca58-877a9d07425sm2140646b3a.42.2026.09.20.10.02.15
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Sun, 20 Sep 2026 10:02:23 -0700 (PDT)
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
Subject: [PATCH net-next v9 02/11] dt-bindings: phy: rockchip: naneng-combphy: add rockchip,sgmii-mac-sel property
Date: Mon, 21 Sep 2026 01:01:06 +0800
Message-ID: <20260920170116.3624104-3-coiaprant@gmail.com>
X-Mailer: git-send-email 2.47.3
In-Reply-To: <20260920170116.3624104-1-coiaprant@gmail.com>
References: <20260920170116.3624104-1-coiaprant@gmail.com>
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

