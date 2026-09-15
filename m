Received: from mail-pj2-f1.google.com (mail-pj2-f1.google.com [74.125.227.129])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 630694A5EBA
	for <devicetree@vger.kernel.org>; Tue, 15 Sep 2026 12:38:42 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=74.125.227.129
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1789475924; cv=none; b=tUXwqZlW839j9LNf5ToiDZOggWxNCUQdkOfYTzwtmn6ojPteBGsZvhA+D9xY14ayUsWcUBHmMuawIHCewTVcyjHsu+vPTSlSS9WpNeyDFugIHdiynO/MqZ06JkHqMD3VBQO14ZmMERC/nkJyXMC2/YVRO5SyTZU89gLiLOAsabk=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1789475924; c=relaxed/simple;
	bh=RQ8/bIf5S9U/FiX3uQoU1u6/FV6K7LLD2uqZys3J7EY=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version; b=moERxPLrZ8E7p3SUnLDHYWzhRmFav+TqHdmbOiXR7IvBsKjjIBW84WDcGQRLurNiukj1u0f/a5aPKdR4CcTzJMUF6SKuEDOGAxLp+3yGqEZW9UcVRZ7+uTSJjbtDVg28aW+AJYdslGf2Nr9vNI2wv+Toet/jiQaXyGTYvCAmlds=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=i4ePi6Ei; arc=none smtp.client-ip=74.125.227.129
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="i4ePi6Ei"
Received: by mail-pj2-f1.google.com with SMTP id d9443c01a7336-2dae660f31bso31612165ad.1
        for <devicetree@vger.kernel.org>; Tue, 15 Sep 2026 05:38:42 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1789475922; x=1790080722; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=v2tJApUzC1LEzp8M/eTL2SHChylQhCDDbwAQQxkGsv0=;
        b=i4ePi6EiZuKQIKno6E8Jy0usm57JUwIpAqrAkdK5SWf6wvvcvtAeusOc0VU93rpfmW
         jHgyG5bgqlgYPfjLDrzpODNzPorX/r4A+RiBNaMR+JprP+ortEEhCnrnkvtt0Lbf5FcR
         pbKGpX7XeGiiPwGsuu+3+vLhNaYy/pKzgF0JG79FSKuKwRRGZixtJ4A3x/8kZiXbKLCf
         GADU5b9YOdKhQC9xpahqDjIrTdRQNBsGYedp1r4w9I0gcjaje1Nywu03mYJLEOGAjqHy
         WGoLBwy6O3nn8/7gHPDwnW9i1VnUERfQkao7FZEDlvY4jN1Le2HNwmcMUGfXorMmSxf/
         hZYw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1789475922; x=1790080722;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to:content-type;
        bh=v2tJApUzC1LEzp8M/eTL2SHChylQhCDDbwAQQxkGsv0=;
        b=UlIWXg3j8LtmxfAyKkqkDp6FSOZCCQE49F+AB3VkQrFzw2krvvtNB2/TxHOMvHr+Ob
         vQbvyJMa0LX3vovJ174rI2cA6XNPTigM/Ux1hj9hzMPsyNRDsyY3+iwNre9dDN7ywOJK
         HcOMYbz4kqea2DKVrCJ+NxOWYngxD5IixAbeCSOuvung5ntjyRY5Yy3TT57MMJPOwvgX
         4F9DPN2qMhyJKtLDObMTOLU83xl8CP4PWov8kpW8RXc5ETgUTW2Fky1IazcKeAWFiEFV
         ogPpp1Ev/kogzuwtLkc+TPpG5mteM2d8S6KCYpQ+Ea9itp5wS5jUUboD3kDCm+yVDXC+
         pEFw==
X-Forwarded-Encrypted: i=1; AKwUvByDt7j1AOx6LnoYUl1NY40j0U1qeVLrv4kh6k8L/MHrJpFLDi8etCxG4ngHbh5hg3RnTTEFt9jPR+2W@vger.kernel.org
X-Gm-Message-State: AFuF++kBv77qsoYgG6kBKHUUYelKb9/Xu0v31zwRVWYuKCdy6kaUy1yO
	HxGvXLnS9sURDGSBIBARehuQKa1ZT7Rt68wbHaB+y0xCDkrl3xWwP+PE
X-Gm-Gg: AYBFou033fD3QCeKqxWpGIRm5lS+YemlRHVE6oGRkIs9OSDvwiiMmCKRO4RJRTNxF7x
	VHtMzDs7Fvz+aU5rorAFdFM6vZlQSNcN2unQ1wvfynu1WlTe5TWZWhB+ysplXslGG321KLuF8/A
	GYgKYst2CRQ54Cw48XgS6X3f8knWHiP51Xl7TRzv5VzxBeLlo05JTnN4medrjP8n2WZj+xBIfwP
	SchmZ8wjDwLeCgeieX8oWy80c74ed4p8ZEv1PbZgmeNG945JcWhfpFsWtEkNPz0TTEejI+QvyfR
	MaMfzzg30KA/zqxcdcxi0HldPEOfI+JrvGxvf/SqcJsyz3R+LnHHX5ETFsOKAayNF90QWVzCcV+
	9n7qul6TJ6O4jxuzqG2k9IiTE4m7wX+usFqdj8Ck2bfffPruRBfDPOMVMlRZ5KRjqFAqMySVzqm
	ZbBn1/a6dkGk4fnAkrR3hYx8DUM7MT5qp1GKZiMJj6ajmwFCVkG71tEgO1inReGh93b18nTgVCJ
	S6X2rgB
X-Received: by 2002:a17:90b:39cc:b0:39d:e54c:8658 with SMTP id 98e67ed59e1d1-39debf547abmr16493286a91.5.1789475921598;
        Tue, 15 Sep 2026 05:38:41 -0700 (PDT)
Received: from server.lan ([168.138.199.194])
        by smtp.gmail.com with ESMTPSA id 98e67ed59e1d1-39dfdd28acbsm5307259a91.10.2026.09.15.05.38.33
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 15 Sep 2026 05:38:40 -0700 (PDT)
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
Subject: [PATCH net-next v6 02/11] dt-bindings: phy: rockchip: naneng-combphy: add rockchip,sgmii-mac-sel property
Date: Tue, 15 Sep 2026 20:37:51 +0800
Message-ID: <20260915123802.1561724-3-coiaprant@gmail.com>
X-Mailer: git-send-email 2.47.3
In-Reply-To: <20260915123802.1561724-1-coiaprant@gmail.com>
References: <20260915123802.1561724-1-coiaprant@gmail.com>
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

