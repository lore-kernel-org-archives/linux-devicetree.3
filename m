Received: from mail-wm2-f13.google.com (mail-wm2-f13.google.com [74.125.225.141])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 1C52F3EDAD2
	for <devicetree@vger.kernel.org>; Sun, 27 Sep 2026 12:46:39 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=74.125.225.141
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1790513203; cv=none; b=gheokCUT9A7cYunWlAO0zYIWpUPpsCQVNHskYoz1qDouPRTuv9vslPolSNPYFygg5Lvsyu1VUmNFmrLAg94Q/WQgouYjAh8EPvNcM/0TVqgvc36rma3bIpqMpehx2cBwjTNR+R+rGQ0E8NnpX8Pi1z2paV9+ZIFRApweTblHduk=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1790513203; c=relaxed/simple;
	bh=5T+a23aIGmK2iqABM7bsnn+JBjwEBOQqZO+RU3YCAIs=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version; b=TYOmCwlaCoPCaculgj8B4UW9efnJujGUk5RcXe6Mkvl5uWy5/e/T2H3QyDr4WeCIztlFF3YQ8QhoLi/qPkgDDTadl67RhLcmZlErRz6cC8mj3PT3pdEseFS3UsQwTv3zpMi8HPuj4ZKexJvAF9thCzPTLJKHZFXUaw80RocLn/Y=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=QVMk8HLh; arc=none smtp.client-ip=74.125.225.141
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="QVMk8HLh"
Received: by mail-wm2-f13.google.com with SMTP id 5b1f17b1804b1-49ffbd83a92so7259435e9.0
        for <devicetree@vger.kernel.org>; Sun, 27 Sep 2026 05:46:39 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1790513197; x=1791117997; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=YshmIf8br7QZ8gBxtu/Vo13g09V/Sk1mprmtIBCHo2o=;
        b=QVMk8HLhJkoGlvjM1+CL0xPLSAHlQlhhLu0zcACJ3H1J8nliHJ6pgtPD8OVnvfa788
         bDao1vT5By0Y0LpmBY6pPjGhwTQ8F1MF+LmK0Z6iMxKi9EOJ4O/EMlY6ouE5PekHxGb9
         /PXwsqWfnZfh2RxeZfOQNlxriyyTHi8SK5kFf8UmRTaDlfMLZLlbepbwCNjrNIOJ1YgU
         SnGtgnAw6/TVGhdWJBk8Cueq17wTFjhN8hNu0tIYSNAtjax1lQpBWy6V5PEa81oBYMcD
         tzV4Y1uw5ZpH9oTSk6dec/GJcXt72NqdIqY3AEQHLY/Zpl/mjUugq/9p1tJ/caG9uDuc
         vdyQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1790513197; x=1791117997;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to:content-type;
        bh=YshmIf8br7QZ8gBxtu/Vo13g09V/Sk1mprmtIBCHo2o=;
        b=w5VZ5ccfmAtZK2vVGHEC7Sw9lfKXT885YbNnnTN7XSpd2tVkNxIg6LyXvqeCrsADuj
         tlvvWqaUW/C+8+vdHnH0D/sM4aU0Rdag8Tbi6h6vls7GkLUe0bhBAGxDD3z9snZWSDKD
         jusCrJo+i/lOFWiRARzpXjrIU3TFaLfZiDj1O+YaSRgtqgzOT06UqzBOHnJXHTuR9F0M
         OgtrMiPQZE0XT8jYvkcnDqbg3Wzs1ocGIrFs7MrO8BqdsEkjSpciKqzdc2Od7S4Nuiz+
         ioF7d0qT/2z97axscOhoiuDCJs5IRozhogQfX2d2fIRCNuXtKWIOAGvDsQK9DP4ioJ+R
         YvIw==
X-Forwarded-Encrypted: i=1; AKwUvBzhNMFQW7/Hl8V4g+R+NnUwodzLdSPvCBNaWry13j+1VnXOIFj7pLiufso26sFVGYKRVgEuvyW8PHSO@vger.kernel.org
X-Gm-Message-State: AFuF++nR55C0XCW9JoJDV17W1+K3jlXpSu92ytDleHYqeq2x0wYfCMNx
	hWCMSjka8pLTUTrmNCd8z8REthYKbeFIqX3BqVhp9Xu8nNYACxYyKZ1o
X-Gm-Gg: AYBFou1L5a56nro5Mc66cECkFcIw018x0PDprT6MRJnQDm7fu1+LkBY0iyHAsWUtsBM
	9wnnXchNdtGkQG5aMksqfoTL6h/Fa62vJcchLNUJ72nEuZUS6McSqw5+1dQCPWleaJozofUHOKb
	lOqmfA3pyZa8MKkat4In+pQuqJMVNfyiidQZK+kX8CEOpF+Fa/fxLoOm7nZu0ffE/IVbpSplAcs
	zlDGEN0Q40p6feyZd34+/Ql8alC/mc+LT6hSB4gPse2o2+QLzPNKqdG7FO4gJRH5eglmLIM2xxB
	kunc3DR66hmclIf3Pq7ceq5X6Ai2qFVZ+9t7Urszas1QVy7o1TC3+ckE5PoBsg+q22eDQdqw8ra
	nFg6mPIFtNgcdwaYTbcCIWQyusNtjvJwdQj4QU03vhw6tOYhOszmsm6MaD7Qh802kzkm08lAJ3b
	4OsvLqcju6RRuLAbhuC66vLBnigptnDREX1eTlh+oQCgPIc/cF++qwtC4RxinSqiSflmnpWQavK
	VkrSmk2JeRmPMNruXurdjeQJNGU3w1HX7k6yUnUT58PxUtIF+6LLnTNA9eSpTrFfkZDzXL+SD76
	7MBtfkVgtj31edcgHl7ABw==
X-Received: by 2002:a05:600c:4ecc:b0:4a0:174:579e with SMTP id 5b1f17b1804b1-4a001745829mr23006575e9.28.1790513197048;
        Sun, 27 Sep 2026 05:46:37 -0700 (PDT)
Received: from Lord-Beerus.station ([31.27.155.43])
        by smtp.gmail.com with ESMTPSA id 5b1f17b1804b1-49fef60da94sm148440605e9.4.2026.09.27.05.46.35
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Sun, 27 Sep 2026 05:46:36 -0700 (PDT)
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
	Daniel Baluta <daniel.baluta@nxp.com>,
	Joseph Guo <qijian.guo@nxp.com>,
	Josua Mayer <josua@solid-run.com>,
	Ernest Van Hoecke <ernest.vanhoecke@toradex.com>,
	Mehmet Fide <mehmet.fide@screeningeagle.com>,
	Markus Niebel <Markus.Niebel@ew.tq-group.com>,
	Francesco Dolcini <francesco.dolcini@toradex.com>,
	Maud Spierings <maudspierings@gocontroll.com>,
	Hugo Villeneuve <hvilleneuve@dimonoff.com>,
	Stefan Eichenberger <eichest@gmail.com>,
	netdev@vger.kernel.org
Subject: [PATCH v3 03/12] dt-bindings: net: micrel: Fix RMII clock select property type
Date: Sun, 27 Sep 2026 14:46:18 +0200
Message-ID: <2596c9e2fd59d04abb2eb4f4abb98767d2d2ebdb.1790512621.git.stefano.r@variscite.com>
X-Mailer: git-send-email 2.47.3
In-Reply-To: <cover.1790512621.git.stefano.r@variscite.com>
References: <cover.1790512621.git.stefano.r@variscite.com>
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
