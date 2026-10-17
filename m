Received: from mail-pf1-f194.google.com (mail-pf1-f194.google.com [209.85.210.194])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 981093F20ED
	for <devicetree@vger.kernel.org>; Sat, 17 Oct 2026 05:45:12 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.210.194
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1792215914; cv=none; b=ivxMN6Z9ajg/lPyDZfGwR8oIpCLy4mc4d4mD1S9PZZPTv2uktaxCQPpbkj3meBnBwiBFvD9A50CUlgR8NdJiozs7UQdwDXc2MNWW2nTR78rdylVC7xMxXl3Zj6ebe0oiAiTLmaSMqhMFRfmRLywZykqkt+2I1k4ywdOAPj/vYtU=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1792215914; c=relaxed/simple;
	bh=3JZb0ui9185DkLL+vQqRLAgo4SmmslSADMqlHD752Vs=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version; b=QhYq+/8vrmvLp2VShZUzWAu6+Av0D40gZSYoOjW2mwg1LNN3ampjrbhUB/BIXJM6FmUxSPhGCI/G9QFFczmW1is8J3dvfMSQrSEMR8szpwz/vZq0z8l7aBqdcQFIo3exIVTJqhlqmAm9/NnU4PuSZr5uIQlZU7XD8kEM9qYhlrQ=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=IoNanWus; arc=none smtp.client-ip=209.85.210.194
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="IoNanWus"
Received: by mail-pf1-f194.google.com with SMTP id d2e1a72fcca58-885cd98d226so308477b3a.1
        for <devicetree@vger.kernel.org>; Fri, 16 Oct 2026 22:45:12 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1792215912; x=1792820712; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=vxuxc5T1ripM4n0F4O5vkglU3x7CEQrB8YPn1E2u+7Y=;
        b=IoNanWusElzMrf069Ziw0qe9+O90UKWs78KQKo232aYYMesF+q1O9QWcrrNKubBege
         uZGGgNcn6RQdhYvNf5xiKWroSg7P8QUpOxUf3rJY6W/0Mhb6VjsBCAf69sYm1urZMdgT
         iTpq7XXiPPni+W/fcdHnheGZ4WjCTFBnWYmIq2VkyA7F1zBvDSX2XQHwypQQxoPH7Dq2
         HU702Om9pNEInn0AHJfLcIsZWFibaE29ZF7dlId2HyyOX1gypXOGITpXRidU1jIbzd8p
         rqNdDNotVQy38G1wG8WChESSYcl5ElEpBnOEuBqH4lC+mZP57RAOOAqDr1kddohFsYpD
         aqJg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1792215912; x=1792820712;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to:content-type;
        bh=vxuxc5T1ripM4n0F4O5vkglU3x7CEQrB8YPn1E2u+7Y=;
        b=xJAmq8goELXW94k7x6SvzY+FHB3YcxRTGrnCr230lxSyOG/aEcEIj/kDLYbcVSgBKB
         IWTAu3sZkBk8HGKpfhURmPDVrhPO4n96ruzpmUSxWUlTvxsRggMbmOQ0Qwg2Jyhygotc
         vwodS3fGbIogVqkGtnhFP4iA7VDVPsRBKycrNPWAjGM1FaJLIN3Zhl1FNuhZyomBgQkf
         B+1wwy4XXUsGJhBnoJsI4Uv20mrtOlB7Qc6JxKny4Qmrk6h/VXONYklwhoRBT39cx1/m
         izdYZmg1aFyt7b20YcE3Bob+wafVIlZa+qsex8tNwl8Q3cWisQ3LFvnidowVySxmGCi0
         rIHw==
X-Forwarded-Encrypted: i=1; AKwUvBw4EP3KGXDhuauu5rkVojQAv9mToMmZXQlh41T3W9u9H/A7yWguyNuTsBcWhBpYRBbyMaWigjr0S6q9@vger.kernel.org
X-Gm-Message-State: AFq9FYLDSk23CM5EIbVMdF1VbRZeK+83bLifvG57ikpLTv9wnK2JeAJ2
	wDfN+7pis5oDgyRKHmVoqnoTYWNtv58xQHVKpdfs1UCgOhKebWDpk9dm
X-Gm-Gg: AYBFou3fM6UNZUx3YV+3WoRhJ9knF/gssfPmcVxbWC3MHtnIPbgzBH238X49jAQ49p5
	u0XpczucgZOthBQlvH68S1DceR/orA2dkFZMODvd3Umy4TG75ggFKMIgbRmHXVLW3+OHEJ4qifn
	CEa0ef8NpWmEpTeAfeiG6zqhTY4YEtTI50cnL0xvMLhQ+GtAzyL38C1svhqtViNKeTkvBHXAIqG
	Nc3VEiqhpsZRiq3g8Sv27jVbIaAXz/+8BwoRXr21eVYhbB6C52FvsHWK3hnR8BFPVL90WR+w5aP
	ldS7QwDn5SnZAsCSARq30cq+YFsBtacQOMNRuLyXJVkcGk+PxOXGKfnE+0ANuf74egk2fJy2dg2
	zqvWBhP7wJ+SyO6WDUoYPRbF7NciyJ7BgT2qJbmYKIXou1IidHUyrKeFOLEgOu9nGNzrz3QP6A6
	5m7xRFbIfzlpgb1tyi/Dipb4nStCb9kUhZU8JDLjMUzbF5DXzh1e9a1B+O5BwzPJ/D/gG5
X-Received: by 2002:a05:6a00:1389:b0:89e:7b15:d934 with SMTP id d2e1a72fcca58-89f2214f36dmr3388109b3a.45.1792215911894;
        Fri, 16 Oct 2026 22:45:11 -0700 (PDT)
Received: from server.lan ([168.138.199.194])
        by smtp.gmail.com with ESMTPSA id d2e1a72fcca58-89f57269315sm1958225b3a.23.2026.10.16.22.45.03
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 16 Oct 2026 22:45:11 -0700 (PDT)
From: Coia Prant <coiaprant@gmail.com>
To: Jakub Kicinski <kuba@kernel.org>,
	netdev@vger.kernel.org
Cc: Andrew Lunn <andrew+netdev@lunn.ch>,
	"David S . Miller" <davem@davemloft.net>,
	Eric Dumazet <edumazet@kernel.org>,
	Paolo Abeni <pabeni@redhat.com>,
	Rob Herring <robh@kernel.org>,
	Krzysztof Kozlowski <krzk+dt@kernel.org>,
	Conor Dooley <conor+dt@kernel.org>,
	Heiko Stuebner <heiko@sntech.de>,
	Maxime Chevallier <maxime.chevallier@bootlin.com>,
	Maxime Coquelin <mcoquelin.stm32@gmail.com>,
	Alexandre Torgue <alexandre.torgue@foss.st.com>,
	Heiner Kallweit <hkallweit1@gmail.com>,
	Russell King <linux@armlinux.org.uk>,
	David Wu <david.wu@rock-chips.com>,
	linux-rockchip@lists.infradead.org,
	devicetree@vger.kernel.org,
	linux-arm-kernel@lists.infradead.org,
	linux-kernel@vger.kernel.org,
	Coia Prant <coiaprant@gmail.com>
Subject: [PATCH net-next v12 4/6] dt-bindings: net: rockchip-dwmac: document pcs-handle
Date: Sat, 17 Oct 2026 13:44:02 +0800
Message-ID: <20261017054406.1828061-5-coiaprant@gmail.com>
X-Mailer: git-send-email 2.47.3
In-Reply-To: <20261017054406.1828061-1-coiaprant@gmail.com>
References: <20261017054406.1828061-1-coiaprant@gmail.com>
Precedence: bulk
X-Mailing-List: devicetree@vger.kernel.org
List-Id: <devicetree.vger.kernel.org>
List-Subscribe: <mailto:devicetree+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:devicetree+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

The Rockchip GMAC binding needs to describe the PCS reference used by
the SGMII support added later in this series. The property will be
parsed by rk_pcs_init(), and a missing phandle fails the probe. Add it
and require it when phy-mode is "sgmii" on rockchip,rk3568-gmac, the
only SoC in this binding that has SGMII support.

Reviewed-by: Rob Herring (Arm) <robh@kernel.org>
Signed-off-by: Coia Prant <coiaprant@gmail.com>
---
 .../bindings/net/rockchip-dwmac.yaml          | 27 +++++++++++++++++++
 1 file changed, 27 insertions(+)

diff --git a/Documentation/devicetree/bindings/net/rockchip-dwmac.yaml b/Documentation/devicetree/bindings/net/rockchip-dwmac.yaml
index 80c252845349c..c434450fd07ff 100644
--- a/Documentation/devicetree/bindings/net/rockchip-dwmac.yaml
+++ b/Documentation/devicetree/bindings/net/rockchip-dwmac.yaml
@@ -120,6 +120,12 @@ properties:
     maximum: 0x7F
     default: 0x10
 
+  pcs-handle:
+    description:
+      Specifies a reference to a node representing the PCS device
+      connected to this GMAC. Required when phy-mode is "sgmii".
+    maxItems: 1
+
   phy-supply:
     description: PHY regulator
 
@@ -159,6 +165,27 @@ allOf:
         clocks:
           minItems: 5
 
+  - if:
+      properties:
+        compatible:
+          contains:
+            const: rockchip,rk3568-gmac
+    then:
+      required:
+        - phy-mode
+
+  - if:
+      properties:
+        compatible:
+          contains:
+            const: rockchip,rk3568-gmac
+        phy-mode:
+          contains:
+            const: sgmii
+    then:
+      required:
+        - pcs-handle
+
 unevaluatedProperties: false
 
 examples:
-- 
2.47.3

