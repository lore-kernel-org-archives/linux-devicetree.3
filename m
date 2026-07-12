Received: from mail-wm1-f49.google.com (mail-wm1-f49.google.com [209.85.128.49])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id D67752139C9
	for <devicetree@vger.kernel.org>; Sun, 12 Jul 2026 14:04:57 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.128.49
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1783865099; cv=none; b=lCV+2PGSqEdPUdrC8W5ikfB21VYhgPM/1RMbDB7lBB6VpXyN1I98P4APYtcYlwuHNbV02c9xMD8fI2sxSDqtttQzXtuST2k+Rvb9ertS+jgpN9WRHru1hY3Lmy9uCHWGZJAheJV1OBHSMaucnP3ZD4hCU1HJYcWv7YyOfe86W04=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1783865099; c=relaxed/simple;
	bh=suF+UBN+R1rjxWojuU32UPyGtiN7ORILdbua26i5jRs=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version; b=h0J6XVNIr9s193PH1X06k3DEB4aXT/T8RbKPYyvGRq2W8z6216UAVEfiUF9w2OaYKVzrTRW3O/qNcwLQW15yuw+eloUaS4xDH2eLNYnT8czooSPIKDupyJGyr4fFBANPbyC8ez73kGvySPLtH2Daw95eIad/oRAJTOvFD85PbOg=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=lsZ+mf7g; arc=none smtp.client-ip=209.85.128.49
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="lsZ+mf7g"
Received: by mail-wm1-f49.google.com with SMTP id 5b1f17b1804b1-493bf73ec2aso16157725e9.2
        for <devicetree@vger.kernel.org>; Sun, 12 Jul 2026 07:04:57 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1783865096; x=1784469896; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=OHkQOAwnqn+GHM2YCaa/ek3hYLA29AY6tEwxhPAeG+E=;
        b=lsZ+mf7gHj8zrIopx4ZQ3aWGPzO2kM36RHMIyz3NgZ3pSI7C+iSc7GvQhM2iZoEgbs
         eRlUXk1w4/HznMkCGPIuqlxNsLfEi+7y5adE2phrz+iNetKP2bmco+OORQ2sMytmftZ8
         fggF9+G5RQQEPxZNrBwATBadl5jCf1mhSvxE4oFY8MvhOAi55gVzBUMHd3H/OcRpGmGK
         C0JMaDGK/kLajMJGubnc0TfMgo4Wpk1fTYkQsAQMJ/wK/XeQESxkH+lXj6oaRt5n0dmO
         B8yx1QRPSEWKEUMmFe99ceG2420DZlD8j16QfurogK63I4WIdQd28pG317X37KBD8Nrn
         rlwA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1783865096; x=1784469896;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to:content-type;
        bh=OHkQOAwnqn+GHM2YCaa/ek3hYLA29AY6tEwxhPAeG+E=;
        b=q+xYgGt5kUaL5k5hGqBr5F+eBjTZmHi3BduwI4zdJ3jU6FbP5lGucaIzIiQZIZG+2E
         2xCDkY053tcjvrTHmCSNMRY8AFS/RMIFjcebWb/Qj/IAv1d8D+G86+ntSJRxnw5WsQf0
         WeYc2qvpue4wKM7JChH5/PkXqNhVqy1BQ8ALa7Sg55QlAIN4+rlb9yaatvsag/R7r59d
         fiFcTMgSENPg5I0JomaX5+AFWq4cbYfCDGVZSFF+reGXDYVXs1SJrPt9ewwk2a4wVs3n
         yx5v+Evjw++7aqx7ZxThKJ6CmagmKmZzJy38/e9cZeKNougW1L4UpqIfIaqbMFdmK0dS
         cj0g==
X-Forwarded-Encrypted: i=1; AHgh+RoXuri7YSXQqrDYJlNLQIrLR6nvYsJvhjQKCIJXASHfr6+eFOujwvLiZocfML2GjeML3QXaR1QJI4zF@vger.kernel.org
X-Gm-Message-State: AOJu0Yx5dHabuTg9G17waHTPgkCspKo6MAiTVOw1fC8l5giAcP719beg
	k1nNJ1XT+0sFsAkdjn0ntgKP0ZjOMXDKCx3Tr01mB6RgM3VSHCwE4vV9
X-Gm-Gg: AfdE7cnB2+HP8ARHC/w4yL91yTmooo1/w7zMKqxgu0XCJ1CfMeiUMAybWEpwDveMucW
	eD0bozYyaYvGW133NX8aJ1QnjLjLK/L5J/FRWGOWB0PL8RZJ3TPYkwNShp+QIlJ1aDLvgTfZXaI
	dlzv/Z+opEiMGen44pXDsBjqX2sI05CIOtQnVDA8+Okqi4IlSnJYCbyXpQwv20M4hw4j0lMZvTY
	1L1hYnS2mOJRFXG0K1N6R3rLi1tM6c35sBy2vC1f1Jr6x7gNSAdk8U5CSiP3hj9y1jxOyP9xEoQ
	EqHmsiM01EC7zO+XB5G9o48YLAhFY9mPk2aUh6qggwZIOkRrw2LiPczh+Un4Lbys8HeFOQt1r6q
	xd5E7F6sUP4ivYQuFPLMJ5d0wesBMVXcg3ISHguA+EFNPtoS4FxjGghiDdn1lAuWaWTOqwT7KDv
	7qjOgSlfSMMU6jXJSFiCqg5MGMJjYkQup0mNm4eHsPlM9HmdTtHT4JY8DndyrVIzjOOLlEEgOgc
	DL86QWLp4neltY+CD1uKyZQmroAPAJVR7o=
X-Received: by 2002:a05:600c:4746:b0:493:e034:a3b5 with SMTP id 5b1f17b1804b1-493f8818cb0mr62961625e9.24.1783865096161;
        Sun, 12 Jul 2026 07:04:56 -0700 (PDT)
Received: from GLaDOS.station (122.red-80-39-213.dynamicip.rima-tde.net. [80.39.213.122])
        by smtp.gmail.com with ESMTPSA id ffacd0b85a97d-47a9e4d843csm76330888f8f.14.2026.07.12.07.04.55
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Sun, 12 Jul 2026 07:04:55 -0700 (PDT)
From: Stefano Radaelli <stefano.radaelli21@gmail.com>
X-Google-Original-From: Stefano Radaelli <stefano.r@variscite.com>
To: linux-kernel@vger.kernel.org,
	devicetree@vger.kernel.org,
	linux-arm-kernel@lists.infradead.org
Cc: pierluigi.p@variscite.com,
	matthias.p@variscite.com,
	Stefano Radaelli <stefano.r@variscite.com>,
	Nishanth Menon <nm@ti.com>,
	Vignesh Raghavendra <vigneshr@ti.com>,
	Tero Kristo <kristo@kernel.org>,
	Rob Herring <robh@kernel.org>,
	Krzysztof Kozlowski <krzk+dt@kernel.org>,
	Conor Dooley <conor+dt@kernel.org>,
	Kees Cook <kees@kernel.org>,
	Tony Luck <tony.luck@intel.com>,
	"Guilherme G. Piccoli" <gpiccoli@igalia.com>,
	Conor Dooley <conor.dooley@microchip.com>
Subject: [PATCH v4 1/3] dt-bindings: arm: ti: Add bindings for Variscite VAR-SOM-AM62
Date: Sun, 12 Jul 2026 16:04:48 +0200
Message-ID: <20d42ed8808c477c79b4d45fea6fd474ee42b06d.1783864932.git.stefano.r@variscite.com>
X-Mailer: git-send-email 2.47.3
In-Reply-To: <cover.1783864932.git.stefano.r@variscite.com>
References: <cover.1783864932.git.stefano.r@variscite.com>
Precedence: bulk
X-Mailing-List: devicetree@vger.kernel.org
List-Id: <devicetree.vger.kernel.org>
List-Subscribe: <mailto:devicetree+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:devicetree+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

From: Stefano Radaelli <stefano.r@variscite.com>

Add devicetree bindings for Variscite VAR-SOM-AM62 System on Module
and its carrier boards.

Acked-by: Conor Dooley <conor.dooley@microchip.com>
Signed-off-by: Stefano Radaelli <stefano.r@variscite.com>
---
v3->v4:
 - 

v2->v3:
 - 

v1->v2:
 - 

 Documentation/devicetree/bindings/arm/ti/k3.yaml | 6 ++++++
 1 file changed, 6 insertions(+)

diff --git a/Documentation/devicetree/bindings/arm/ti/k3.yaml b/Documentation/devicetree/bindings/arm/ti/k3.yaml
index 69b5441cbf1a..b9da6e62ab79 100644
--- a/Documentation/devicetree/bindings/arm/ti/k3.yaml
+++ b/Documentation/devicetree/bindings/arm/ti/k3.yaml
@@ -104,6 +104,12 @@ properties:
           - const: tq,am625-tqma6254
           - const: ti,am625
 
+      - description: K3 AM625 SoC Variscite SOM and Carrier Boards
+        items:
+          - const: variscite,var-som-am62-symphony
+          - const: variscite,var-som-am62
+          - const: ti,am625
+
       - description: K3 AM62P5 SoC Toradex Verdin Modules and Carrier Boards
         items:
           - enum:
-- 
2.47.3

