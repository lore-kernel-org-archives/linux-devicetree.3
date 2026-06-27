Received: from mail-dl1-f54.google.com (mail-dl1-f54.google.com [74.125.82.54])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id D27833A7F72
	for <devicetree@vger.kernel.org>; Sat, 27 Jun 2026 10:26:48 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=74.125.82.54
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1782556010; cv=none; b=lds9WDJJ4cVbo547otATueGmORg4VljFTq/yOZpxZ1/21lI32+eHbTUfHN1h7f0xpGxIlB2vd6rrbkkxZRwapY3s+B8Nch62ngQGZkXMDWESYIbKCtsLbfmUrhBP60qHcc+YdRnlmk5Aq3njUQEGmjC6J5GSs3V4t/HB+qZ3lHI=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1782556010; c=relaxed/simple;
	bh=PjeAyVzdrmEPvru5WSS2hywp+olcq5EiYjAbVoPzIDc=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version; b=U1CQvAIHexlJ/eeYF+mFUzdDXrMUUg+YAdl7urlkoujSjGtJmi5PqAPKtloZ35M9NlIipmNgDjIruXBG8XcPP+R6YbdCDTp5j1DzXDhRQctNemYXsLxwISqv+Bbe7QSUTi4MQ7yiMjGYrUE3QOStn60Fl00GB3jx7prnBat5lC8=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=o4yD8ihC; arc=none smtp.client-ip=74.125.82.54
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="o4yD8ihC"
Received: by mail-dl1-f54.google.com with SMTP id a92af1059eb24-139f1dfc9faso359836c88.0
        for <devicetree@vger.kernel.org>; Sat, 27 Jun 2026 03:26:48 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1782556008; x=1783160808; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=YtSd3Xc+ifVj14PL2Jkw0taP79/hnT+MmHpMwaXVGFE=;
        b=o4yD8ihCpZREecfKoAvM8QkvyY4kBxrWC1BpGYWGT0xCZvDZ2VtHLljtTP/rdPPl4K
         nh/vcmCqdIh6qYPHKKdYwrD/NQXKXKmfEps+Zf2ryPSnkPGJocgdLmQYZ0GsvdmlRebe
         nA75gr/GEwX/gtoFrENAWH2GALl3lGLGYRzEzSNyJKyn3opPUAbOoQG58y1Bqn6GDmQ6
         VzJzF5rdHqbIZ3IuTs7b+UuFBNzYOt2g75OUxQNr+u4eZBZa17DPB91407HPZiIus+gO
         L/Rm7iCEqxoGEpb2pg9gGdNivbTMwJhZnjkHbfLy4siKinyshJLcC3ma8k8nmT2ohv4q
         GUMQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1782556008; x=1783160808;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to:content-type;
        bh=YtSd3Xc+ifVj14PL2Jkw0taP79/hnT+MmHpMwaXVGFE=;
        b=PhZYWewl2T0qJSo008CwgJ6BIRxxGzgFCfiqRAdaX64thAlzL+CKOSy4SqWhpANmk8
         qKxsz9Nw9U6DINV8Tn+uviQBUqUsxQSNwwBHflNOWixAjJhVNtr8oD+WZs0/MJDpejp6
         LgKW0YLAsprrQBQoCUboxrLcMr2Iz9Y9U4dzFPfg3DbBmPEdCF07hCSF0u4zTEATSpnx
         N4mosTa2Jp7v3VEUQTqS8TAT7J01ltMKrhSevPcJVvhroYd7hqRYRHIDfgFxAbBY8aRV
         zP7S1zfQdS8PUNT4o6VwcuCcvVXE4lRNfXe2R6yHRQq0VzjkSKedPkQvOSqTNUIQPKtP
         7iUA==
X-Forwarded-Encrypted: i=1; AFNElJ+U+j6w2IKQ/6sPXlZdb2h/7NqKUJh2gk4Xy5cgkYOzJ8WevevlwM1ErRrSkCbJbH/BTyx/tJnppDDR@vger.kernel.org
X-Gm-Message-State: AOJu0Yz5rOA2kwa31deETXF3nfPPMl56iA9HLu+84Pm0hbX5NZ5YQB2O
	LVFTPy7jm1QX/b9O6IUO8JaFzCujLf6aZD67UVergKqmDAqBylZbJBen
X-Gm-Gg: AfdE7cmFBxQOCuvNsxRzKkszUnme4aBYn9MUmV65QF0PZvmtDObCGh1zgMF9W34fbXK
	CwatiSc3my2eoWRHIswW/KG9sfzMPuUTYSxhnIGE8y40he9Y+52KODXnqBEvOYmhC1Y8Ys123zt
	6YszCVNLVHbb41P4papq2Sqcy3s4IIVjyIavtugqMXDDUfdKWnwl05XCaiKeWdl0p7FAHx0qmym
	t4rWwDgnVSit9EZsErPMR759sLp7LXug8VrBNWiAs5NwUBfxYog7UNFTOwQV3jnxWVoQ9wk5Siq
	idZ2CODo8mVQKfX/dSb56Cd0cEES2puqm1UsJzdkfb4RGGhZKfXim9Yh4Y1kYAA6Um45HNBHzk+
	uiX0cH8HoRsUNbYrdjwmaqwENn2GzjizPNwhJTpcqrZ4IphxWr5SJdcP2QvWWTIb+Z5SSHovB4e
	SSBxVgN7AIxdkuKI5zrRU=
X-Received: by 2002:a05:7022:6098:b0:137:fb6c:5355 with SMTP id a92af1059eb24-139db9e6413mr7764693c88.3.1782556007971;
        Sat, 27 Jun 2026 03:26:47 -0700 (PDT)
Received: from i386.168.1.127 ([2402:a00:163:2ce9:9c6f:e28:3da8:7980])
        by smtp.gmail.com with ESMTPSA id a92af1059eb24-139d912197bsm43776437c88.15.2026.06.27.03.26.43
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Sat, 27 Jun 2026 03:26:47 -0700 (PDT)
From: Hrushiraj Gandhi <hrushirajg23@gmail.com>
To: linux-rockchip@lists.infradead.org,
	devicetree@vger.kernel.org,
	linux-arm-kernel@lists.infradead.org,
	linux-kernel@vger.kernel.org
Cc: heiko@sntech.de,
	robh@kernel.org,
	krzk+dt@kernel.org,
	conor+dt@kernel.org,
	Hrushiraj Gandhi <hrushirajg23@gmail.com>
Subject: [PATCH v2 1/2] dt-bindings: arm: rockchip: Add Vicharak Vaaman2
Date: Sat, 27 Jun 2026 15:56:32 +0530
Message-ID: <20260627102633.86222-2-hrushirajg23@gmail.com>
X-Mailer: git-send-email 2.47.3
In-Reply-To: <20260627102633.86222-1-hrushirajg23@gmail.com>
References: <20260627102633.86222-1-hrushirajg23@gmail.com>
Precedence: bulk
X-Mailing-List: devicetree@vger.kernel.org
List-Id: <devicetree.vger.kernel.org>
List-Subscribe: <mailto:devicetree+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:devicetree+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

Add device tree binding documentation for the Vicharak Vaaman2,
a single-board computer based on the Rockchip RK3588 SoC.

Signed-off-by: Hrushiraj Gandhi <hrushirajg23@gmail.com>
---
 Documentation/devicetree/bindings/arm/rockchip.yaml | 5 +++++
 1 file changed, 5 insertions(+)

diff --git a/Documentation/devicetree/bindings/arm/rockchip.yaml b/Documentation/devicetree/bindings/arm/rockchip.yaml
index b023d4cc9842..b5a43fd5e546 100644
--- a/Documentation/devicetree/bindings/arm/rockchip.yaml
+++ b/Documentation/devicetree/bindings/arm/rockchip.yaml
@@ -1311,6 +1311,11 @@ properties:
           - const: vicharak,axon
           - const: rockchip,rk3588
 
+      - description: Vicharak Vaaman2
+        items:
+          - const: vicharak,vaaman2
+          - const: rockchip,rk3588
+
       - description: WolfVision PF5 mainboard
         items:
           - const: wolfvision,rk3568-pf5
-- 
2.47.3

