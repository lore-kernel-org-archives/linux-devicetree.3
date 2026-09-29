Received: from mail-wm2-f12.google.com (mail-wm2-f12.google.com [74.125.225.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 2995253FD54
	for <devicetree@vger.kernel.org>; Tue, 29 Sep 2026 15:17:59 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=74.125.225.140
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1790695108; cv=none; b=GOSiqSVqfHDt844fejhLWclpu7liOcnnt/nMdRRiHdaX0OSsYxSp2kSLaB1rfI1JKwbPKzM61lhR8fXxauEiDOB8cUMeAvpB7NLIGx9GoXmtFA34mKjufEd9QODEA6FlpqLmcYU10ZBM3jfcVm1p/Q+y46oOwrkVwl1waw1npLQ=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1790695108; c=relaxed/simple;
	bh=5T+a23aIGmK2iqABM7bsnn+JBjwEBOQqZO+RU3YCAIs=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version; b=o/64BC9llbpPqayZLr2y3K/dmUmyhuVqADrhK7DxYLwBNXs1kqSyPlKnl6rKXIy8zvkehHRp2QFzpttkyiVR/hTmkUUgCzo2rqvWr7TxH+jzUTB9NTumYJBub9KtIx/T3fBvgx8SLnroOIWlX9nZ4mFetJu36CIUQcU6uz9r9L4=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=dEwKTkXs; arc=none smtp.client-ip=74.125.225.140
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="dEwKTkXs"
Received: by mail-wm2-f12.google.com with SMTP id 5b1f17b1804b1-4a00713639cso17007215e9.1
        for <devicetree@vger.kernel.org>; Tue, 29 Sep 2026 08:17:58 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1790695073; x=1791299873; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=YshmIf8br7QZ8gBxtu/Vo13g09V/Sk1mprmtIBCHo2o=;
        b=dEwKTkXsbcUwSRywhPvI/PTqFIaOSeEA09fN3+c6KiMxzu2EjStXCNOxOwfE8qiZVW
         5gdwWYj+xeSONbh18IVtKnzV1Syb4E0owhv2hF0iBs4mTmrhU+ZQmSYVh76yq51g+ExU
         OIeon1/9tAAktz7ELeYqDb2cTqShLnJR+NHc8fkIYpF7fgv6L79P50Ii82GD3IlsWpI5
         RmhyEhFD714ebA847EQuYkr2Sh4SAIQNm/hQ/AFuFLQSutGVrWZl69D3y5tyEhKJF+Kx
         WjCLqxdlwTnLGJa9EygR5nooHlzR4C29pymvG4QkxqOtjX/Otws1FOb4qH49dcv/NKpq
         bJsg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1790695073; x=1791299873;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to:content-type;
        bh=YshmIf8br7QZ8gBxtu/Vo13g09V/Sk1mprmtIBCHo2o=;
        b=Fa/Lrv7lOfGUbAItD5ZsyHOP+xdu6znbc/8qd+XxXWt8wYo9HMqtspOg7L8rTkD5tb
         jhFqvT6v+QGIhJeOLpK6wUa590zS8YzTo/hkbTuoFAf/IqcaPpd56SkDk5T/klK/n6uq
         a87jh2tWMmKa5i1Xfd9wNcmuNqwiRWHxiKRHjeQMhXu9FOFTD3BHfxF3xygMqCHgtmgC
         U3VI2uYzvTMWLjzbXU9hMqfef4kfqYcExKc7lhc8E7LaFCG35uUp45guJMi5bggjQONN
         ZDA1mYW+m6Y0THC5TZ5AkoDHiyj647mrhigiE07HMrvC+MHDP7zhFIIUdt+ZsDSB66JT
         eUvw==
X-Forwarded-Encrypted: i=1; AKwUvBwKfVJaizhvKb7xmJ2ptDf9yXFlX8itCXhw3oxvg6XyBP3QoM1uotuMiLIPB6leruMVHC/fQl7oSjve@vger.kernel.org
X-Gm-Message-State: AFuF++kmyNZUzXMmTPKMKSEU0vL4G5ulkXN6aXHAYGXLzMtwAU4gtCFT
	H4y/LhWrOwxFQsoUNXZzTQzKy1JFZFKICdlUeGXmT7o78SOPejd49Yyz
X-Gm-Gg: AYBFou3APJy3BiUrjceCBcLSWGuk1B09ysVYZiWUNSgFFfKHQEz4M/x45IDQHWoXPBd
	ZJLN1VAoAKgu297bBLl3u/OVAMwkZSeK1MxLqEhQ2cK1u0s1CoPaCEPSKePhA/r/Y0OQ19I7X3s
	0aR9yAljIAGV5xQauLfosWySBlZp70oYNMV/mhaNZioGPxIltgGHZrloUX4G2v0ihis0z/6tkfn
	ve7DWdQffwM+1OV4sFZ9BDwYPfkhaNYRNBAeKRUaKvoTQe3lqaBWf0PQPI0ZHnUqs5UvFg1D7ke
	n99ygJZH7Bo1n2THcm0wH2usc9DPz9xIkxEJ6bGuJ+VLJKpdMOoFnRuuaNtROrdbB7TDHW7gizC
	T+WFmD9lWsQJtHM6NYHp1phjYZ40jS4Mcah95AI4FpKvbbx9jFrlVgtgdJBhAJ8IzSXTCcXzluG
	C7Mv7wLGeefR8D71pb56pTb6GWj0PsqCmssczo5bKEoUMW1Aja0ya0AGPLjpNjwjS5UN6FE3Rdg
	ub6U6DFFlnoi9UFW0PZ6m/8GjcPoXre1PSa69Wkj8VS/9xqk4EM5AnvHIbk9KexC8kHUiXDi1v2
	ZgJFv/c5xCD8MuhvHWfCGomfIa5oIAZy
X-Received: by 2002:a05:600c:c3c1:10b0:49c:fc6e:8caf with SMTP id 5b1f17b1804b1-49feaa1d628mr198851025e9.19.1790695073277;
        Tue, 29 Sep 2026 08:17:53 -0700 (PDT)
Received: from Lord-Beerus.station ([31.27.155.43])
        by smtp.gmail.com with ESMTPSA id 5b1f17b1804b1-4a013cf8402sm10313705e9.2.2026.09.29.08.17.51
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 29 Sep 2026 08:17:52 -0700 (PDT)
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
	Heiner Kallweit <hkallweit1@gmail.com>,
	Russell King <linux@armlinux.org.uk>,
	Shawn Guo <shawnguo@kernel.org>,
	Joseph Guo <qijian.guo@nxp.com>,
	Josua Mayer <josua@solid-run.com>,
	Ernest Van Hoecke <ernest.vanhoecke@toradex.com>,
	Mehmet Fide <mehmet.fide@screeningeagle.com>,
	Francesco Dolcini <francesco.dolcini@toradex.com>,
	Markus Niebel <Markus.Niebel@ew.tq-group.com>,
	Hugo Villeneuve <hvilleneuve@dimonoff.com>,
	Stefan Eichenberger <eichest@gmail.com>,
	netdev@vger.kernel.org
Subject: [PATCH v4 05/13] dt-bindings: net: micrel: Fix RMII clock select property type
Date: Tue, 29 Sep 2026 17:17:32 +0200
Message-ID: <9a0f70dc168278a484bb336835bf2e419a9d089d.1790693249.git.stefano.r@variscite.com>
X-Mailer: git-send-email 2.47.3
In-Reply-To: <cover.1790693249.git.stefano.r@variscite.com>
References: <cover.1790693249.git.stefano.r@variscite.com>
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
