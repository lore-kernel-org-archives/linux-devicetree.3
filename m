Received: from mail-wm1-f52.google.com (mail-wm1-f52.google.com [209.85.128.52])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id A2A132E0914
	for <devicetree@vger.kernel.org>; Sun,  7 Jun 2026 16:56:09 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.128.52
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1780851370; cv=none; b=e/rW7wU9/8CgYxzoK2dR6zC1Q6eaERZi4a5U4I+eIPvY6wPzNVi0/hckKE/iz2xBU6lMo+OIVUtOSK1Nro9cYgtfm1r2ceUF+yvTrSqsvrzIcmcIPNHsyx2cOqEp2K6mzaUVlKEPxhw1pBzyVGKdKTZbM5MTTUpdNvP+1t0Zc1Q=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1780851370; c=relaxed/simple;
	bh=RmbGLXvguzzR6cADfjSa0pG1zmC1hTwnkCqAIZInmiw=;
	h=From:To:Cc:Subject:Date:Message-ID:MIME-Version; b=W6C2VyD3t1cwBkmiumdjiusgDwWsJIka4Pn52JQVa2HwdBHxg9ux5wYvuyuGw1FWVGs5QVqg1qLcX4ldo2dMctEzlioFEDdKZ+cKAUR6hQw5Rv2qiktrrW9v1GEl7jLyLsL4hFfLTbbMN3vHYANWTSansOE9myT3VIj50f4eDWQ=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=sartura.hr; spf=pass smtp.mailfrom=sartura.hr; dkim=pass (2048-bit key) header.d=sartura.hr header.i=@sartura.hr header.b=mD1I1xzQ; arc=none smtp.client-ip=209.85.128.52
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=sartura.hr
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=sartura.hr
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=sartura.hr header.i=@sartura.hr header.b="mD1I1xzQ"
Received: by mail-wm1-f52.google.com with SMTP id 5b1f17b1804b1-490ae94a89eso28704485e9.1
        for <devicetree@vger.kernel.org>; Sun, 07 Jun 2026 09:56:09 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=sartura.hr; s=sartura; t=1780851368; x=1781456168; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:from:to:cc:subject:date:message-id:reply-to;
        bh=gkIOc9hxgB6VFFpx2IKVhOdGPlSs4ufUyju4H9y6/R0=;
        b=mD1I1xzQ1laXi0bMjjuzkO9WMnM8i3PoKXnPCkWz2VCdBVf62OmATBzojKEBqND4mP
         doSj5hRVI1fY7FJOGbo0MJijGI5RyLyZHmchXy6Kc6H8uqgXe6PT8v4iYJP2CzfV3IpX
         EWl2E2Pxc42DqCKj5vwiwUCBpae0qt1bgCEkPGSgvY4hWkTIoz+/w3BIz2aD88dA4RXR
         uXXZZz6pvROgaRDLHgyQGs2h3iVOAN35/Tw4OjmyV/cUfTdLUthiVG6akJangAXJ6SYr
         BbuXnHWqTL8R+QqmAoQK+oihPUFJrEFG2/HxinzGy+XrRscqdRBwq8YqNzr8lcvv82aJ
         QWiw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1780851368; x=1781456168;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=gkIOc9hxgB6VFFpx2IKVhOdGPlSs4ufUyju4H9y6/R0=;
        b=tLuN1uOfWjybknQk+nNtrXEH6i6KfeSZURK+RqsNTrF0nRclaYR2KNq5Ygv2SsHFw5
         siQfVVlVY2vBwrKuv42uKgnbh28BFVwxekA2lTrM8KMxEU5g2rhxtjYhI9zwYHPbPP2P
         EM5/e1Ke5H3z6JHJLy27N5fv+5UDPvgBbQufUJSONhRYeUuqK+OiW2ZbODPd5sUWb3Nj
         rh88C7WbxPy//qG7vgrewToJEiRHnaUv+GkRGdlV8jYCmSPxGhesEbjgIXxf4aJDZ4Bb
         eeocV2H5yKWQLu4gkmKwFJqFZ039meZAIIQlOYqf3ewSrfqdV133u19Z6cT11/BH535Z
         kxMg==
X-Forwarded-Encrypted: i=1; AFNElJ+R/iXDorTRvT725hTzIm0XlYqs0DJXPV2pLwSTnAOkGO1H2LJljgc3+CtETijz9f1BknMYfiQq1kWi@vger.kernel.org
X-Gm-Message-State: AOJu0YxbVYzykZOfIUFYWtA029Wkf8TBKK4UVLRMK9kl3OduF8j4PgFG
	r6136hHJWYMvC4L8rH5//57HaAF5na9c5rA8ydis+JfPkb8b12/0nqFLSVfmXEvLWwLIgwp2VoA
	B99Ai
X-Gm-Gg: Acq92OGfMAoj8Fp8SJrfxMYVa9QevxQEOnsxaqDdPNwqi6QEjR6w0Q3sqWIo4AzzT4a
	MjFCcu3D5J9o805DJvfTeFujq4CJWcocdnulyGC06QObo2IvrlOYnqJYqBy8w739MYJ7VhPGVFI
	4Rst9F0+Cok6J1inMp+kog1OEuX6pcYTeHhm0MltAygxmBVW+fDLGC/1jbkQJRlJ3fvzuOXtlfz
	lcm8l2zd00TaqhzXqhhbC1LT9tAH/fOkQBeYKiTStvZBE5390W4F7+1xfwWcXSWlGZXH75E0w0A
	9LaVf0aYtYEW6QrnF+WIG9xAPcPP3lNCQXxDqSXkoDdokwKuR4Zp69zxu250zFRKh2NdgVJfYvu
	/banOTy1+WpreZ66jlil6W6FuDwM4KEVXb6Jf5yI7Njc1AHQv/b4k3As2YY1BjYSmsEuiDa+ZGa
	8icyvGqt5Cc0b0Q07FgC2jieG0swrTMKIvieYrlVPiENHCycfjbvrvgr9qH5pETz76nFf85/nAz
	UaqGo2WrLCCvgwVjtgFD4+FJXwjpIy+yP5kx2h4n7Zd4+ml2G3sLFpTUMDdgkPiQ1XkSroOIh/h
	oNFQTg==
X-Received: by 2002:a05:600c:4e14:b0:490:4e3e:b483 with SMTP id 5b1f17b1804b1-490c2600ebdmr187600905e9.22.1780851367960;
        Sun, 07 Jun 2026 09:56:07 -0700 (PDT)
Received: from threadripper-fedora-workstation (d-zg2-253.globalnet.hr. [213.149.37.253])
        by smtp.gmail.com with ESMTPSA id 5b1f17b1804b1-490bc3c1149sm283230325e9.4.2026.06.07.09.56.06
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Sun, 07 Jun 2026 09:56:07 -0700 (PDT)
From: Robert Marko <robert.marko@sartura.hr>
To: o.rempel@pengutronix.de,
	kory.maincent@bootlin.com,
	andrew+netdev@lunn.ch,
	davem@davemloft.net,
	edumazet@google.com,
	kuba@kernel.org,
	pabeni@redhat.com,
	robh@kernel.org,
	krzk+dt@kernel.org,
	conor+dt@kernel.org,
	netdev@vger.kernel.org,
	devicetree@vger.kernel.org,
	linux-kernel@vger.kernel.org,
	daniel.machon@microchip.com
Cc: luka.perkov@sartura.hr,
	Robert Marko <robert.marko@sartura.hr>
Subject: [PATCH net-next v3 1/2] dt-bindings: net: pse-pd: microchip,pd692x0: add port disable GPIO
Date: Sun,  7 Jun 2026 18:55:35 +0200
Message-ID: <20260607165600.1260210-1-robert.marko@sartura.hr>
X-Mailer: git-send-email 2.54.0
Precedence: bulk
X-Mailing-List: devicetree@vger.kernel.org
List-Id: <devicetree.vger.kernel.org>
List-Subscribe: <mailto:devicetree+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:devicetree+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

Microchip PSE controllers have a dedicated port disable input that like it
name suggest, will disable PoE on all ports.

So, lets document that GPIO.

Acked-by: Rob Herring (Arm) <robh@kernel.org>
Signed-off-by: Robert Marko <robert.marko@sartura.hr>
---
Changes in v2:
* Pick Acked-by from Rob

 .../devicetree/bindings/net/pse-pd/microchip,pd692x0.yaml     | 4 ++++
 1 file changed, 4 insertions(+)

diff --git a/Documentation/devicetree/bindings/net/pse-pd/microchip,pd692x0.yaml b/Documentation/devicetree/bindings/net/pse-pd/microchip,pd692x0.yaml
index ca61cc37a790..ca4200afa793 100644
--- a/Documentation/devicetree/bindings/net/pse-pd/microchip,pd692x0.yaml
+++ b/Documentation/devicetree/bindings/net/pse-pd/microchip,pd692x0.yaml
@@ -22,6 +22,10 @@ properties:
   reg:
     maxItems: 1
 
+  disable-ports-gpios:
+    description: GPIO pin to disable PoE on all ports
+    maxItems: 1
+
   vdd-supply:
     description: Regulator that provides 3.3V VDD power supply.
 
-- 
2.54.0

