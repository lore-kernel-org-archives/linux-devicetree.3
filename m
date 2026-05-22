Received: from mail-ej1-f43.google.com (mail-ej1-f43.google.com [209.85.218.43])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 79465366054
	for <devicetree@vger.kernel.org>; Fri, 22 May 2026 17:49:34 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.218.43
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1779472176; cv=none; b=jrSibrRtJf9UhSTlWsojEoSymvSugLjuK2uPiRbr0ZanBtc9sThZSJpumIf3eqwPXIthAy4EKmZLntCaIasz9H/mn2qpXepriD7MD0BWz0twrcWPnK92gY692k7l2o9tjLw11m3ss3u45FimGdvjCVqi6xrBipRZckitZYYM/6w=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1779472176; c=relaxed/simple;
	bh=rlNiEGGR+d9fRVv8q1EWwiKgFwMp4YTvkE48LEnwN0Y=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version; b=oYRUQqGV+pVFEFz25fAqQWzj77j1EnUPxQaYDxAKKGH9uaGIlrjggT3b7hQtF8D0z02JVzPn8tmvamuh+pRuFBjK9lEBOhb9aYhL3a/nvTMu9xspOprWoWz8q1Afs38vVT6FjuwILNBuh915wnxN1IpVF25MAPOcl+ffk+ylIaQ=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=amarulasolutions.com; spf=pass smtp.mailfrom=amarulasolutions.com; dkim=pass (1024-bit key) header.d=amarulasolutions.com header.i=@amarulasolutions.com header.b=kD18zCep; arc=none smtp.client-ip=209.85.218.43
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=amarulasolutions.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=amarulasolutions.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=amarulasolutions.com header.i=@amarulasolutions.com header.b="kD18zCep"
Received: by mail-ej1-f43.google.com with SMTP id a640c23a62f3a-bd8faef2e18so828625266b.3
        for <devicetree@vger.kernel.org>; Fri, 22 May 2026 10:49:34 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=amarulasolutions.com; s=google; t=1779472173; x=1780076973; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=huSUFU6ip7GkC8Ccc+ugSGLD8hr2PM+jnPbb2q1KoI8=;
        b=kD18zCepWZMYrAsDNLfuAcB+odS5muJXwaqCNnpx6IX4Lgy7/Dr3R6K1U54Ib/mMiy
         LpNqNuXmEEHWdOOlkvNykjfveCwc+aBJE6K8ywTmXqHRJOTpU5n7OLV4DGEt8MDzd4HT
         Nr9wPtZss3sZRGIqTVdvWKK1l2XQXGnNWM2fU=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1779472173; x=1780076973;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to;
        bh=huSUFU6ip7GkC8Ccc+ugSGLD8hr2PM+jnPbb2q1KoI8=;
        b=AolZggVE5ea/kB9/Yd2wSwLIIdzAGqMChYFHEDXk71IoueiDY311uPsh4adcpEZJ7N
         oZeIZT9tVspraEHHlOfPyi6pa7XALv7stsV5kaeOqeb773hoboj4sY7e+kokSy++RXk3
         kx5I+lqEqlpLVpttciaQF+rULbaOOcXCBOKV91qOynuNypDMi5nTGLzAZ2K59nyQqyJB
         hMFMeLdn/De1ctxWLxvYiUcR3m3tK2En2Mi084Q1rZcHZDFBTk1t3k5QzEVZrQDnB5uq
         mu1F5lpv049ZD5K2SH0yO0FsBAuBuT30aKqHxyhHq1W43iM2L9dwDGMR3ew09YcKnflM
         C5VA==
X-Gm-Message-State: AOJu0Yzq53emUlc7xZQjCibGQ2T0mZqGJb+Fw8EUF02UvRgsj+7o8iAJ
	MLuCNimbtIwUztOx+UnI/hxbCT0J/Xn7qr/jPiyOTLZYxxsl8HieTVxnFYQqwFMqzs1fnLWZ7G8
	z00ZvyeM=
X-Gm-Gg: Acq92OErWkQO4+533FtnUAWMn1XAqVMxKU+AaTl77TnwkT14+KshNlF9fz442opJ46Y
	QGrs1Cz4c4f4fe7OC/KP411HsTRP9a6KWBj7BtH34AksII7v3ip8UkDgqSesEN8/DXv6Q0Sn4Ig
	vyYgAYpgyT1SjU+3LYnxt0ruS3pV2B7T95kJ55GerztuJUQzutr/Mz7yXcoFvIpQP8vIEaxAgSn
	s9Py2la4PJRrFWQUVRAMFl3HZ5dsHanvKt+XpLVvCkyez2uwcKQHhHaPglzPlM3FeWZGU0d4s8T
	gSqhRcGjnOs5pAsEjkgYgsrXLbqKZM7uixLHYwO6FAHpRq9Qm/7PifI23i7jNMPqvrOcN95xzay
	IGx/1sGYYsffc6JXPe6BxgH2TheVm1bVBGAQTjAcMfx+lc+zVW+KWrUYi1s0H6D9qOY6cc2pT06
	6lrDT3JQ1qgddfa7HoREd8l2gIoIV0T8F8++MOzRhXyq33V5xQCec555REk/GnVMh+Q+32dA==
X-Received: by 2002:a17:907:762a:b0:bd5:151d:2d31 with SMTP id a640c23a62f3a-bdd23024b25mr231817366b.13.1779472172722;
        Fri, 22 May 2026 10:49:32 -0700 (PDT)
Received: from thinkpat.amarulasolutions.com ([94.162.24.211])
        by smtp.gmail.com with ESMTPSA id a640c23a62f3a-bddc5eca6f9sm74302366b.38.2026.05.22.10.49.30
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 22 May 2026 10:49:31 -0700 (PDT)
From: Patrick Barsanti <patrick.barsanti@amarulasolutions.com>
To: devicetree@vger.kernel.org,
	linux-rockchip@lists.infradead.org,
	linux-kernel@vger.kernel.org,
	heiko@sntech.de,
	robh@kernel.org,
	krzk+dt@kernel.org,
	conor+dt@kernel.org
Cc: linux-amarula@amarulasolutions.com,
	michael@amarulasolutions.com,
	dario.binacchi@amarulasolutions.com,
	Patrick Barsanti <patrick.barsanti@amarulasolutions.com>
Subject: [PATCH 2/3] dt-bindings: arm: rockchip: Add Axelera AI Metis Compute Board
Date: Fri, 22 May 2026 19:49:17 +0200
Message-ID: <20260522174918.61523-3-patrick.barsanti@amarulasolutions.com>
X-Mailer: git-send-email 2.53.0
In-Reply-To: <20260522174918.61523-1-patrick.barsanti@amarulasolutions.com>
References: <20260522174918.61523-1-patrick.barsanti@amarulasolutions.com>
Precedence: bulk
X-Mailing-List: devicetree@vger.kernel.org
List-Id: <devicetree.vger.kernel.org>
List-Subscribe: <mailto:devicetree+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:devicetree+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

The Axelera AI Metis Compute Board is a SBC based on the Rockchip RK3588
SoC.

Specification:
- Rockchip RK3588
- 16GB LPDDR4
- Axelera AI Metis AIPU, 4GB/16GB LPDDR4X
- 64GB eMMC
- uSD slot
- 2x SATA ports
- 2x Gigabit LAN
- 1x M.2 E key
- 1x M.2 B key
- 1x HDMI2.0
- 1x USB-C with DP
- 4x USB3.1

Link: https://axelera.ai/evaluation-systems/metis-compute-board
Signed-off-by: Patrick Barsanti <patrick.barsanti@amarulasolutions.com>
---
 Documentation/devicetree/bindings/arm/rockchip.yaml | 5 +++++
 1 file changed, 5 insertions(+)

diff --git a/Documentation/devicetree/bindings/arm/rockchip.yaml b/Documentation/devicetree/bindings/arm/rockchip.yaml
index 1a9dde18626d..a784c9eddc50 100644
--- a/Documentation/devicetree/bindings/arm/rockchip.yaml
+++ b/Documentation/devicetree/bindings/arm/rockchip.yaml
@@ -107,6 +107,11 @@ properties:
               - asus,rk3566-tinker-board-3s
           - const: rockchip,rk3566
 
+      - description: Axelera AI Metis Compute Board
+        items:
+          - const: axelera,metis-sbc
+          - const: rockchip,rk3588
+
       - description: Beelink A1
         items:
           - const: azw,beelink-a1
-- 
2.53.0

