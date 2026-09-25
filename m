Received: from mail-wr2-f35.google.com (mail-wr2-f35.google.com [74.125.225.99])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 8127D36F90F
	for <devicetree@vger.kernel.org>; Fri, 25 Sep 2026 14:03:29 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=74.125.225.99
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1790345012; cv=none; b=tJu8OdA4lUNWQCldCASKEs/Z+GE7/Ro51MNe+pue4wP8MSjJtu1xzQt/lQysubgGFHivk/HVmogvzQ1+6VBhqAIC8hK409HqMrf8BU8dor9PS/I0xDxEl15+wEgBfrVumD3pzOKbpG/U9CLFrd2UkRtk5Ls2KKYKWueDv/pvWzw=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1790345012; c=relaxed/simple;
	bh=5T+a23aIGmK2iqABM7bsnn+JBjwEBOQqZO+RU3YCAIs=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version; b=Pgwkhy+B3iO4IyMmZKrcfXMGOj3Z3Mp4GLZWCjYtqS/BYmuHIqNMlj3VeyOFxcip5dC+DIbNkEWmR/vtQuHVu+De3rJXXhkv+tVMiYAnQ+6/pD7NuM72lWOu91nqPXp3EldhWC1uUsbKjOmvDRCfbM1/z3HxtCYpdhjA4C5WQqI=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=cEoe9NQH; arc=none smtp.client-ip=74.125.225.99
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="cEoe9NQH"
Received: by mail-wr2-f35.google.com with SMTP id ffacd0b85a97d-48877902c99so781114f8f.2
        for <devicetree@vger.kernel.org>; Fri, 25 Sep 2026 07:03:29 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1790345007; x=1790949807; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=YshmIf8br7QZ8gBxtu/Vo13g09V/Sk1mprmtIBCHo2o=;
        b=cEoe9NQH8UIinLr1nj94nO79Vgz4xmARsXXRQ9vGGeLcdLejzPjZvGYXcbFZ1/3ANY
         yQcmFgHPVYGDsZlqOvl77BnFvs9X2T+dNv/HZkJvD6ChxEGXHDvynCm6hcPLxs8IcCAS
         ZNm6AGrWi0DSsEH0KTN8HP+usQkTqY1Yh682tjnWD/dDru4gd1R5JxhYRvD73KYfE5uv
         jaenZIb4jIMVNeSgqEN5N9JZzw2GQMIQjkfnkYa7q+Bz+LdAxEDgMgWiX4Na4cQFNcCV
         H72/x+CVjvBaCXxFt0WYK58s8SuZTTgBOUHl3sID+6ogvEiJMHK+XbVAgH7+dKmKBIlT
         jLnA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1790345007; x=1790949807;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to:content-type;
        bh=YshmIf8br7QZ8gBxtu/Vo13g09V/Sk1mprmtIBCHo2o=;
        b=avNlJ1ufGOK1EkpRipycXLl+iz5qvhQFAFOE+mtjnR8b0IMEzX9iLBMUWOcHqAxInd
         eeBxxmglcqcOgPLmBz7YUHRNfXDFM+TtuQpZcHPTgEU94aB7Lr+PXMlM3thENmaGZ1J8
         mXPHyVfLG4s2Pq7TdVpOacFB+fzKt6fiPhJu6s3/QcGSocM3YynHO83GtidghcRHXHBH
         DKm8Jp3l9NQxgQeLkQrz5jd9M0EqStcclN4Ea/ABEHE7LjB1s2PjaA3U3Wl9GDcmolRJ
         96QAY37hORwbnX5C0oRlN1ynmX9xsXLWlB183JhnmZ3E7aQgAgN+naKSXJoUrr4S203u
         oalQ==
X-Forwarded-Encrypted: i=1; AKwUvByZ6N05TP9EJTDxTFR3uVv3eEoyNWIfGM5jFRowtaKWpkr63r3O6dMvU3/Zv2qvFQw3QUpqHs9uMZRD@vger.kernel.org
X-Gm-Message-State: AFuF++m8ntAv2TN1QWPQoh7OGlCQN7SIFcBfB0Qpj8y+Q75cGclqqD0I
	cmtyh68syaXD7F98/OvCCoVZcfuuYDztG9EwSb02bzRfuM9JQd1YEGs7
X-Gm-Gg: AYBFou0g6boy7ktUBeVNHy1UChYTh61UPg51mn22032/oDtluUWYaSzTR7UX/kadWLa
	BJdmAHge4WTMxAOuCUDQo7SXU249CqXgWdWh1PkJ8Qo0WAxQLdUdpNwqdzJHdIaXWzmF0dKpwig
	MVpAAzxbXbpemyi9FQrG87g66YSEKR9cv3NPm9IERoXmTicQ5d83JUB/NkA+31VcqQSeggjaNTm
	Lsh5+rVVS6IhMO0hmRrGj0XW21onHoLPqOAIrYnB1UcEN1ttbExQJZ1x53d0IwW06FumtZJOnQq
	ciJ9WqxucktJc1PfCtSmjJy3Rn/HXA1VLdH8SFZPwITY/E7M3iXcEm8+pfrOdon1VlMJekata9Q
	aSnaRllN+0ARbF6BVRHjR+ajL6PLQriemF74o28adOLfSWC+i1jv4cx8kYx8B1qiI92T2+OVkwW
	rXE40LxE9KRxHtMqheHuUmqJ73OrARkSove1EMArURudegRpxPchlXh4vzXX/QeNPvErqY/3vTL
	s7EUOzn2K+WuCeE/c+WzwCmGf6xOD5pxThYmGWi41LppUDdgPXjUlHgRqXlFiHAPdNe+aoWfc9X
	iRskgj740I17nHEw5dIhGA==
X-Received: by 2002:a05:6000:2511:b0:487:27f9:840 with SMTP id ffacd0b85a97d-48871726b7cmr10342107f8f.53.1790345006448;
        Fri, 25 Sep 2026 07:03:26 -0700 (PDT)
Received: from Lord-Beerus.station ([31.27.155.43])
        by smtp.gmail.com with ESMTPSA id ffacd0b85a97d-4887a355c65sm7522431f8f.19.2026.09.25.07.03.24
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 25 Sep 2026 07:03:25 -0700 (PDT)
From: Stefano Radaelli <stefano.radaelli21@gmail.com>
X-Google-Original-From: Stefano Radaelli <stefano.r@variscite.com>
To: Frank Li <Frank.Li@nxp.com>,
	linux-kernel@vger.kernel.org,
	devicetree@vger.kernel.org,
	imx@lists.linux.dev,
	linux-arm-kernel@lists.infradead.org
Cc: pierluigi.p@variscite.com,
	Stefano Radaelli <stefano.r@variscite.com>,
	Rob Herring <robh@kernel.org>,
	Krzysztof Kozlowski <krzk+dt@kernel.org>,
	Conor Dooley <conor+dt@kernel.org>,
	Andrew Lunn <andrew+netdev@lunn.ch>,
	"David S. Miller" <davem@davemloft.net>,
	Eric Dumazet <edumazet@google.com>,
	Jakub Kicinski <kuba@kernel.org>,
	Paolo Abeni <pabeni@redhat.com>,
	Sascha Hauer <s.hauer@pengutronix.de>,
	Pengutronix Kernel Team <kernel@pengutronix.de>,
	Fabio Estevam <festevam@gmail.com>,
	Shawn Guo <shawnguo@kernel.org>,
	Daniel Baluta <daniel.baluta@nxp.com>,
	Joseph Guo <qijian.guo@nxp.com>,
	Josua Mayer <josua@solid-run.com>,
	Ernest Van Hoecke <ernest.vanhoecke@toradex.com>,
	Mehmet Fide <mehmet.fide@screeningeagle.com>,
	Francesco Dolcini <francesco.dolcini@toradex.com>,
	Markus Niebel <Markus.Niebel@ew.tq-group.com>,
	Maud Spierings <maudspierings@gocontroll.com>,
	Hugo Villeneuve <hvilleneuve@dimonoff.com>,
	Stefan Eichenberger <eichest@gmail.com>,
	netdev@vger.kernel.org
Subject: [PATCH v1 02/11] dt-bindings: net: micrel: Fix RMII clock select property type
Date: Fri, 25 Sep 2026 16:02:19 +0200
Message-ID: <6580cb8231c0ccada44d3e510374f6c21b65d283.1790344389.git.stefano.r@variscite.com>
X-Mailer: git-send-email 2.47.3
In-Reply-To: <cover.1790344389.git.stefano.r@variscite.com>
References: <cover.1790344389.git.stefano.r@variscite.com>
Precedence: bulk
X-Mailing-List: devicetree@vger.kernel.org
List-Id: <devicetree.vger.kernel.org>
List-Subscribe: <mailto:devicetree+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:devicetree+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

From: Stefano Radaelli <stefano.r@variscite.com>

The binding describes micrel,rmii-reference-clock-select-25-mhz as a
boolean. dt-schema requires properties ending in -mhz to contain an
unsigned integer value. A bare property therefore produces a
property-units.yaml type warning.

Describe 25 MHz selection as <1> and keep the property restricted to
KSZ8021, KSZ8031, KSZ8081 and KSZ8091 PHYs, which have the RMII
reference clock select bit. The driver checks only for the property
presence, so this does not change runtime behavior.

Signed-off-by: Stefano Radaelli <stefano.r@variscite.com>
---
 .../devicetree/bindings/net/micrel.yaml       | 27 ++++++++++++++-----
 1 file changed, 20 insertions(+), 7 deletions(-)

diff --git a/Documentation/devicetree/bindings/net/micrel.yaml b/Documentation/devicetree/bindings/net/micrel.yaml
index 6fa568057b92..a1f876dc00de 100644
--- a/Documentation/devicetree/bindings/net/micrel.yaml
+++ b/Documentation/devicetree/bindings/net/micrel.yaml
@@ -63,6 +63,14 @@ properties:
     minimum: 0
     maximum: 3
 
+  micrel,rmii-reference-clock-select-25-mhz:
+    enum: [ 1 ]
+    description: |
+      RMII Reference Clock Select bit selects 25 MHz mode.
+
+      Setting the RMII Reference Clock Select bit enables 25 MHz rather
+      than 50 MHz clock mode.
+
 allOf:
   - $ref: ethernet-phy.yaml#
   - if:
@@ -90,6 +98,18 @@ allOf:
     then:
       properties:
         micrel,led-mode: false
+  - if:
+      not:
+        properties:
+          compatible:
+            contains:
+              enum:
+                - ethernet-phy-id0022.1555
+                - ethernet-phy-id0022.1556
+                - ethernet-phy-id0022.1560
+    then:
+      properties:
+        micrel,rmii-reference-clock-select-25-mhz: false
   - if:
       properties:
         compatible:
@@ -105,13 +125,6 @@ allOf:
           description:
             The RMII reference input clock. Used to determine the XI input
             clock.
-        micrel,rmii-reference-clock-select-25-mhz:
-          type: boolean
-          description: |
-            RMII Reference Clock Select bit selects 25 MHz mode
-
-            Setting the RMII Reference Clock Select bit enables 25 MHz rather
-            than 50 MHz clock mode.
 
 dependentRequired:
   micrel,rmii-reference-clock-select-25-mhz: [ clock-names ]
-- 
2.47.3

