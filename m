Received: from mail-wr1-f49.google.com (mail-wr1-f49.google.com [209.85.221.49])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 1C9A539EF23
	for <devicetree@vger.kernel.org>; Tue,  9 Jun 2026 09:04:45 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.221.49
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1780995886; cv=none; b=PFUV5X+ML3BW7Fk+JdKo8lBNoZA8F04JoQ1TGH9WzuO+Mm8YbreMkpelaTMwR851CrBCuWGk08uM+nCW0XRCXvMX76vQgyTYWuwtB05607MKt9I8FG/aKgFkv+JapB0sObkykx6X7rvyUDeXm+xVvydtouNzBM5WHrXO9YIiOoU=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1780995886; c=relaxed/simple;
	bh=zCQXimV53Ogl4RxIQLRoYFinY1tzwaZ3CpUI8WssViA=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version; b=OPDYHgnIhE1ivJHCq1ys7s0EdbEiG1Xan/RyXh/+vW2LAmSaYn1YGQXQ+ckAm2zVnvKstWHesoMMenWUWI7yKhZvPx63oSoD6FdbeEyoO0e4Kyafjt/eXy9DCYGjGsxfaCAZ1VsD/Nm7sDsm8BCsWOPS6K3WOQ8tp2BY+yOmqqY=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=S4Hxw/pK; arc=none smtp.client-ip=209.85.221.49
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="S4Hxw/pK"
Received: by mail-wr1-f49.google.com with SMTP id ffacd0b85a97d-45efa80e0afso4049732f8f.2
        for <devicetree@vger.kernel.org>; Tue, 09 Jun 2026 02:04:44 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1780995883; x=1781600683; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=cF7A4g2is+YIBTmHtbyYR50VO6KbJDHH8KlYg9QTGTo=;
        b=S4Hxw/pKcqTuHYT4UTbHeuOLg6oNR1u290r5+0Qh7vGWgqV/jxwhKyHo9p2mlWebO5
         lqiUt4fifpn4dJHFKAfTuO/Hfy6GsS/OrithsWMXfJzxxCEVt3zGNl5EPWVA3EGVTZLx
         guDG4WSCXJhqKMRsjYo4AnFgLzaEeJZmirwk9EHtZ3HgBew794lKadgEDRRrX2cBTaST
         MaAFHknIYGGG59Q4WRGishoMznSYHYTqZab3XtJniuE3UkPCG59RwRYyVQqUXBe3CjTd
         +pkarVueb4JLcU2Bg00scoOtD8hjX2jUvOG1KiQ57vaB/RSJ3QqNo34IjiqVZW2JYKks
         mI1Q==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1780995883; x=1781600683;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to;
        bh=cF7A4g2is+YIBTmHtbyYR50VO6KbJDHH8KlYg9QTGTo=;
        b=Ntd9dI6IMhtcSB0WGGAQsG6p1JUKDAWGI07r7Osb665sm4GhsaT2E7fK3lA5ctrn3I
         ZWJP8AN6u/lfoonngK1ENrC6DmrvWwggNSpuEaweo88Rt/j/tk8yH8iQPUD15gxvIK8s
         vGQV3n1Hr6pWbZ8gGi7Wihvwq+yHwqguT5ugYxVSmi8LIGjuSLbDIjYatXtQlL1j3CTR
         DKDqEXzcGsWquU7GsJ+BfXFU/br7t8g2Z0rrOguzGE//HjAbJ4Ur94sV8zcBy3iHLCQc
         6tkG8EvVLLhUFLQ9gJPY5oPVMSwTfohF+L5lPsQqjqJc+VDqo5WsseyT7hsey3mBOh14
         GKyw==
X-Forwarded-Encrypted: i=1; AFNElJ94zYsJG3JsA0566wtTADIqz9UXAng0J7hFBQr6qIf7GWjVmOPImjWJy5sOHVG63GN2SjytK4wjxk7n@vger.kernel.org
X-Gm-Message-State: AOJu0YzsqInnbiV/tpQwxcyYDyIoYZ8schUo/uJD/MOgRELJfeNTKqEK
	b58jOt6E0GyER+HX/35Ezq4KZWIDvL3E96UF5qcvrYftMI8YxEoenI7H
X-Gm-Gg: Acq92OH13iUYdKbZH4iGGIgu1bz5NJPYOXPONlbRuSwev7IIhTNDGV0NekaDaqJdkZg
	xgeGRFPVHVjeNeNfpB4a/yE5jze71K8T+LiPqrDDPaeWcluWw7iLw5Z2m8dW5Dle6PZI2mVQ5fr
	g1stVNwucInB8I5PnETFlA8obeU6WCyXCPRVqNJwUT7CpWEUfRi4xArMSftQC8OWtC1WxPrBopz
	dgQthVxFYecXRZvLLHOYTktTPa3wHL8jkw9qTaTTLcZv676AT0f6cH40edUsey3Ez9fYnFvbktC
	x92xheC4UzKaRaHUatiQCGWy+zvV/tzuAg4pgRbq8S8S7scYlXE2JIAnEFQU8r4ngt643YBPxL7
	01LWWsgY2N277GXWwh9N6TdxGwBlaTYwC1QfbGEJC8nVaFR9VcYmp6awiwzGtE9/C5ZFRoaJZD1
	9vvZ1KvTd76XamRkIcSHcYWvs6akHJHVitLGPGd20n9Wk+rmmJX5DR0NLGUHXCgjIzr0x5UfvVr
	0XDgNI9dWDPyTuekAuH30NV9n8v0ccA5kFPVtH7NH/4Mn2O
X-Received: by 2002:a05:6000:54f:b0:45e:b21e:f840 with SMTP id ffacd0b85a97d-460304ec0e8mr24408982f8f.8.1780995883449;
        Tue, 09 Jun 2026 02:04:43 -0700 (PDT)
Received: from Lord-Beerus.station (net-93-144-65-244.cust.vodafonedsl.it. [93.144.65.244])
        by smtp.gmail.com with ESMTPSA id ffacd0b85a97d-4601f344762sm64910543f8f.23.2026.06.09.02.04.42
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 09 Jun 2026 02:04:43 -0700 (PDT)
From: Stefano Radaelli <stefano.radaelli21@gmail.com>
X-Google-Original-From: Stefano Radaelli <stefano.r@variscite.com>
To: linux-kernel@vger.kernel.org,
	devicetree@vger.kernel.org,
	imx@lists.linux.dev,
	linux-arm-kernel@lists.infradead.org
Cc: pierluigi.p@variscite.com,
	Stefano Radaelli <stefano.r@variscite.com>,
	Rob Herring <robh@kernel.org>,
	Krzysztof Kozlowski <krzk+dt@kernel.org>,
	Conor Dooley <conor+dt@kernel.org>,
	Frank Li <Frank.Li@nxp.com>,
	Sascha Hauer <s.hauer@pengutronix.de>,
	Pengutronix Kernel Team <kernel@pengutronix.de>,
	Fabio Estevam <festevam@gmail.com>,
	Shawn Guo <shawnguo@kernel.org>,
	Daniel Baluta <daniel.baluta@nxp.com>,
	Dario Binacchi <dario.binacchi@amarulasolutions.com>,
	Josua Mayer <josua@solid-run.com>,
	Maud Spierings <maudspierings@gocontroll.com>,
	Alexander Stein <alexander.stein@ew.tq-group.com>,
	Ernest Van Hoecke <ernest.vanhoecke@toradex.com>,
	Francesco Dolcini <francesco.dolcini@toradex.com>,
	Hugo Villeneuve <hvilleneuve@dimonoff.com>,
	Conor Dooley <conor.dooley@microchip.com>
Subject: [PATCH v4 1/3] dt-bindings: arm: fsl: add Variscite DART-MX8M PLUS Boards
Date: Tue,  9 Jun 2026 11:04:36 +0200
Message-ID: <c65129896fc6ce80044ee1d89e12dcdff34945be.1780995737.git.stefano.r@variscite.com>
X-Mailer: git-send-email 2.47.3
In-Reply-To: <cover.1780995737.git.stefano.r@variscite.com>
References: <cover.1780995737.git.stefano.r@variscite.com>
Precedence: bulk
X-Mailing-List: devicetree@vger.kernel.org
List-Id: <devicetree.vger.kernel.org>
List-Subscribe: <mailto:devicetree+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:devicetree+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

From: Stefano Radaelli <stefano.r@variscite.com>

Add DT compatible strings for Variscite DART-MX8MP SoM and Variscite
development carrier Board.

Acked-by: Conor Dooley <conor.dooley@microchip.com>
Signed-off-by: Stefano Radaelli <stefano.r@variscite.com>
---
v3->v4:
 - 

v2->v3:
 - 

v1->v2:
 - 

 Documentation/devicetree/bindings/arm/fsl.yaml | 6 ++++++
 1 file changed, 6 insertions(+)

diff --git a/Documentation/devicetree/bindings/arm/fsl.yaml b/Documentation/devicetree/bindings/arm/fsl.yaml
index 86876311ec59..11629b9eafc5 100644
--- a/Documentation/devicetree/bindings/arm/fsl.yaml
+++ b/Documentation/devicetree/bindings/arm/fsl.yaml
@@ -1310,6 +1310,12 @@ properties:
           - const: tq,imx8mp-tqma8mpql            # TQ-Systems GmbH i.MX8MP TQMa8MPQL SOM
           - const: fsl,imx8mp
 
+      - description: Variscite DART-MX8M Plus based boards
+        items:
+          - const: variscite,var-dart-mx8mp-sonata # Variscite DART-MX8MP on Sonata Development Board
+          - const: variscite,var-dart-mx8mp # Variscite DART-MX8MP SOM
+          - const: fsl,imx8mp
+
       - description: Variscite VAR-SOM-MX8M Plus based boards
         items:
           - const: variscite,var-som-mx8mp-symphony
-- 
2.47.3

