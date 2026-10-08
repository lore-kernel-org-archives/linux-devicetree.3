Received: from mail-wm1-f49.google.com (mail-wm1-f49.google.com [209.85.128.49])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id B46743CFF73
	for <devicetree@vger.kernel.org>; Thu,  8 Oct 2026 19:40:25 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.128.49
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1791488428; cv=none; b=uII3KMwQ+orubbAcdvHUmSKG7CXYtEuATRSYX6JuvqHhd3g6qz1yrt8EdgjUTk3RGNlcLpHfCAW2MKWMlpKXMGspWiy52gQXIQ/YO9/3d3GmxxgfaIWODjdjNK5sEsjinhQOld67/bYXkRZY5UP6UfEaoe86XM2EC+yfU+tjVM8=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1791488428; c=relaxed/simple;
	bh=louYATGthOtYvcZekgYD8gJCu1Mw18vnkIVWgcBPVp4=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version; b=n+lO20jA/qo7ypb3IBG+dBHK2bDgkZkXhkGvjwMbWyJ/8juM4VtbJvYzbAc8hvzoYhNn1fnAtxvqNkGLbQol1J11nL/aYck70kTIrmWEs01gQJ9VUJzNDeV/pJhj1k22jYz/wqZqhe9jT/Njn0Hfq8kfL/INUGqxs0hX4JTlQUQ=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=dvcpFw7P; arc=none smtp.client-ip=209.85.128.49
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="dvcpFw7P"
Received: by mail-wm1-f49.google.com with SMTP id 5b1f17b1804b1-49ff680331aso62242265e9.3
        for <devicetree@vger.kernel.org>; Thu, 08 Oct 2026 12:40:25 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1791488424; x=1792093224; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=3V/KESF44OWIlxoBBD4DKvOD0PQK3Y0aOYvdpaZuhdA=;
        b=dvcpFw7PCXfcFXqjfhi0ibDez9viIX4betznDOMv+kngZUjJigAJhrLzHkInthkAMP
         ocI/v+yWhumN/ASabbXyqL8YfPaIO8THos9LIU4huXFV/O44Ov5AO4F3JNBVOUmnJ+43
         ftF6n5ADJFklL9iBSovS23OZ91MsYmFPkBlqrbf+wvyw7OyiJKzh9svw/CiwRRm/4VeD
         D9K8dk+wK77/PNlPdj7BfTkBJScaDHulJmyhxkaxXB4ZVgiQnLHvI8IhaQiEHTUudMca
         WvvIRcU2ELMG7QdN1ryofZG6umNsdAtpuouxPBqStRakdRz13UwNN+LOxkqdxJ7ih9/J
         JCuA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1791488424; x=1792093224;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to:content-type;
        bh=3V/KESF44OWIlxoBBD4DKvOD0PQK3Y0aOYvdpaZuhdA=;
        b=AcBqLZfp8CbYsnL6q8KycFHSk5Q3h6sevs54Z8HzZ8+Jf/LVwFXzhHQAZg8/5AkktA
         GDcVA/sgLGA5DXkhL6kSuwOCDxZ34O/oI+1gxWkBQyQSEpRd3o4iEQXxCblbj+MKnTv3
         12plJo0erLmCfYTEkBvcdJ7yR2YPMiCoeKQ/EL8IxGPARQINBQ/5LwkakwbeOnV3iWFF
         lvokMaWE+q1eZf98w2gVx+5vgCFTVWfYr4dREvmaFmd1gXxGTWBmN7k4HuSSbMwy95YC
         myxZyvffnFHbLnpodbZjNfd8nGjRkL3HHlgBZpLQ/uCtyUxp4y5TiXC7yAtDE72g3V2U
         FKZQ==
X-Forwarded-Encrypted: i=1; AKwUvByHcDaDOJRUJuryNKXU659cFkck2BUAfFJoQJ9JBQwJTpgyXlsUg6RN6Bk/nIGvVNuwwajFxVrb8abo@vger.kernel.org
X-Gm-Message-State: AFuF++m2P4WZEECOjhYMoeSTOVKrxCM+y61isG41EQfiWEAxaETV5V8L
	UwHc1/wu9IOndYNNicWXlv+OcIP1hHnC6RiUQR9GPeGt6X+FSPKG/Tq/
X-Gm-Gg: AYBFou20w7Sm2ft/hQcDJm0g3U+r7uvCRzNmD2VQPgwnpkpyjhV1ZGE6bCNZpRBfpJU
	wGswt6zBbyyopH5BnY9NtoAB2N3Nj2s3bUYrlaIdqspGO/yDzoUFu0153q7oGrEG0Jvykj+1Cfy
	TDvGHzx4WbiTTo/TchnpNhkQZtedGHfu1TV+LUmFjyRd8vrTLCcF/QJV4uKiBVPIy++DK9dMKCV
	Ofs+2oMWc1GJDKoS7pFXrnkcPdCsXGomT0kf3MrCprLSREsF439pZWY7NEyKJJbkuvWaXhxiFlh
	iDhOktWYEHJ0AqDwilECNBsqYzWUfgU1eMgS2YOy6r8VBSHfzzuK8/5YJ4bqhOKhUXN7JVlZLOm
	0n1eMQQvQmeEzM1DRp2wCxqu0Oqjcr8bOvu3h58JNeaiZX8ybSMWQVDAELCzWL+okWWtCYo68yL
	nR+BX8ZfzY6vgCNUQLLumwCiC0aVSXpCXJ5XQo2TcUoK+33Wp5cALL/HS09p5wH0E9/KD74QHQd
	0EDRe6VfOAfHHRq2FabOFmiEhf3KrkDavB10PaCk7ijaD2TE6p1VAfe0pT8klhGH2vRzsJo9k+c
	EaTiqEJWwIh2NsDMuyOriA==
X-Received: by 2002:a05:600c:8b51:b0:4a1:7d56:663b with SMTP id 5b1f17b1804b1-4a18066ca69mr110758385e9.24.1791488423759;
        Thu, 08 Oct 2026 12:40:23 -0700 (PDT)
Received: from Lord-Beerus.station ([31.27.155.43])
        by smtp.gmail.com with ESMTPSA id 5b1f17b1804b1-4a18c1e33d2sm1419065e9.0.2026.10.08.12.40.21
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 08 Oct 2026 12:40:22 -0700 (PDT)
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
	Francesco Dolcini <francesco.dolcini@toradex.com>,
	Josua Mayer <josua@solid-run.com>,
	Ernest Van Hoecke <ernest.vanhoecke@toradex.com>,
	Mehmet Fide <mehmet.fide@screeningeagle.com>,
	Markus Niebel <Markus.Niebel@ew.tq-group.com>,
	Maud Spierings <maudspierings@gocontroll.com>,
	Hugo Villeneuve <hvilleneuve@dimonoff.com>,
	Stefan Eichenberger <eichest@gmail.com>,
	netdev@vger.kernel.org
Subject: [PATCH v5 05/13] dt-bindings: net: micrel: Fix RMII clock select property type
Date: Thu,  8 Oct 2026 21:37:45 +0200
Message-ID: <759d62ee229f0cbb83a51cacbb70ed7dacf4ea3b.1791487179.git.stefano.r@variscite.com>
X-Mailer: git-send-email 2.47.3
In-Reply-To: <cover.1791487179.git.stefano.r@variscite.com>
References: <cover.1791487179.git.stefano.r@variscite.com>
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

Acked-by: Rob Herring (Arm) <robh@kernel.org>
Signed-off-by: Stefano Radaelli <stefano.r@variscite.com>
---
v4->v5:
 - Collect Rob Herring's Acked-by; no binding changes.

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

