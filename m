Received: from mail-wr1-f53.google.com (mail-wr1-f53.google.com [209.85.221.53])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id CA3CF483839
	for <devicetree@vger.kernel.org>; Wed, 29 Jul 2026 12:55:27 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.221.53
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1785329740; cv=none; b=rwH5nXR8KfvryOcXay4U+KywW8YSpZeM7JOpNa1VqogAYTxJjcNhq0TtMaAAqUrt08CoAlUJwQfyue1haCvH5UtT8WvzrIjIbfU3G5FWnmZJfdG10+O4AzFveqQO9bki1gEq3p14nalUJT0dHMRTKBFKHddAespEYrAEX4UtRDA=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1785329740; c=relaxed/simple;
	bh=5z419nIGXTaUcsnwp7BypsY1EVEP5PdrRKjkvgpAkbE=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version; b=A8wo200lllg0mhJbTqXgbPl8L8mK4u3rC6LSBdhJZpwz6ybWkl/+SWIkQ5oPqUnz61CRqf1skUz8AC40apzGbp/L2yNL24IOKMQJmv7oWO5sPk205CmotIbtpO9q4RBRxqvXmm/FQtPjouBkTQcXpz+LdshGboPmd/VZ3BHawZI=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=FTe0nQaU; arc=none smtp.client-ip=209.85.221.53
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="FTe0nQaU"
Received: by mail-wr1-f53.google.com with SMTP id ffacd0b85a97d-47de008b020so588071f8f.1
        for <devicetree@vger.kernel.org>; Wed, 29 Jul 2026 05:55:27 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1785329725; x=1785934525; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=XKm6yCQNcksyxuIgpcHIoi9E5tjt4D2YVHPUd/lYDCg=;
        b=FTe0nQaU11ebCri6cKPKbD585VBngVfc3bzCgyVNtpJ0WebgeydnYW2qLUW05dcVmx
         7DWjs8govJ2AylgnDdAhpdw4n5dUvbVCoGAd8eEN8RcuNZw00gFo8JH9blLQn5D17kDb
         iT2j7rbIsowbXDMAGLM+XPKaGeDEo9MYOrKojIMfZqQSdCV7IEXVlDR1V3jMWrZrFpNU
         lpJMxE1tZZkw2uqc5WEgKjwvC05KJYZAREwPahCEVIIb1Efw8CoS8phhE/eszZy5JbyK
         2keW9Oo+mPcvhQAWej4j1qLt8JIJ99mE6+IB0a5fyUKpFRplgQV62f8pwrKPdBux9lTp
         p5Xg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1785329725; x=1785934525;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to:content-type;
        bh=XKm6yCQNcksyxuIgpcHIoi9E5tjt4D2YVHPUd/lYDCg=;
        b=UrJpFh/WMc/2ja3aG8T5ize8FhZUk7gLf3g7wp9EV0kS81BoCDEaC/ixqRkVc6uSu/
         /acCwo3IDX7Za2LOKIEGegTQfnIB/GV3MRIJszCLCENFakd5hMO66zAeDf/3vhMw+lR2
         uU2gCDjntRH10WNEDalF0IgRPkoynyhB9n16oikL8rDDju+8vyQD46Gd19nW+z0MdcOQ
         4T9tmZqnxeTVUrpZzcrRcI/nGfFd+qJKenE5T7pLIOR25R/HLBkOfgLjnfZImoBEMVd4
         DamPwAC7e4vBUyl+d/PzuUMBVCngoMhdZbO5giiPO27D7ZgyR3n5ErUlUxcPELlUGqhw
         OZJA==
X-Forwarded-Encrypted: i=1; AHgh+RrTwzvZKLbr7kMQTx0YIeFYdY6dhtbel2QazEnqgwxFcM9KMuReylQmQJ4zKcTWzPzdscVzQyNL/CqV@vger.kernel.org
X-Gm-Message-State: AOJu0YyrNfwCTdAhTDOF7QaPGtJdJd34KFbsUN6h4XenEnpbkxo90l64
	U2aVI/d3T1uZ5Jsu0lxdNdMQEzR5EjblyXkD2m2xy6pgwMDxxsEh/beO
X-Gm-Gg: AR+sD10yicbAFnkX8k+1EGRFgUok6FrBdvZTKw2zJx7YwEy/2iRQh0hGtf4+KxrLbyQ
	XRZ8hE52f/ul5fHhKATDJxf1aMXkBul3Hy+LGfVYHH6TtVp2Zg2qN8aZIpp5ghXotzdkht4+zuN
	5O5q+5SxJXnEfaEoVeE1ZHRo7JZsSciqIjdZX637GGJHBDgcL3VYXvRVINjmm4y1m5woEKWyefP
	S2ISdwqzWG66NwPbSkftvhTChFe+XF4V9O17J+ybssNZnxld53bL15XoORsmb3odjNtUN+Tuteu
	/4roeKYM0WsN+qIE+75tVvJzWrv/OYj2Bv2U5h9z85TcvvWcQFIOd0ZmDK1HCLFtPh8SYSCsxtz
	9jR1HOVSvr8Gj516OmsqkfbpXWqEfQVHT3APWAmr1CTmIMHoxn2v9RIefmT2kdnCyd2wQrDD+Lf
	U4ZcgUbtXLyISW6V/3jDoUpl46CBYFISgfS9xpazkUFw8AK+dgPaEZ3QMhL90WI2k6T70RZYyDh
	57ILD9LaIp3iw==
X-Received: by 2002:a05:6000:41fe:b0:475:f0c2:75b2 with SMTP id ffacd0b85a97d-47fbac058e0mr2854007f8f.29.1785329724602;
        Wed, 29 Jul 2026 05:55:24 -0700 (PDT)
Received: from localhost.localdomain ([2a00:23c4:a702:d301:10b8:4461:ee04:15e2])
        by smtp.gmail.com with ESMTPSA id ffacd0b85a97d-47fb6b189e5sm9264645f8f.27.2026.07.29.05.55.22
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 29 Jul 2026 05:55:23 -0700 (PDT)
From: Biju <biju.das.au@gmail.com>
X-Google-Original-From: Biju <biju.das.jz@bp.renesas.com>
To: Andrzej Hajda <andrzej.hajda@intel.com>,
	Neil Armstrong <neil.armstrong@linaro.org>,
	Robert Foss <rfoss@kernel.org>,
	David Airlie <airlied@gmail.com>,
	Simona Vetter <simona@ffwll.ch>,
	Maarten Lankhorst <maarten.lankhorst@linux.intel.com>,
	Maxime Ripard <mripard@kernel.org>,
	Thomas Zimmermann <tzimmermann@suse.de>,
	Rob Herring <robh@kernel.org>,
	Krzysztof Kozlowski <krzk+dt@kernel.org>,
	Conor Dooley <conor+dt@kernel.org>,
	Geert Uytterhoeven <geert+renesas@glider.be>,
	Magnus Damm <magnus.damm@gmail.com>
Cc: Biju Das <biju.das.jz@bp.renesas.com>,
	Laurent Pinchart <Laurent.pinchart@ideasonboard.com>,
	Jonas Karlman <jonas@kwiboo.se>,
	Jernej Skrabec <jernej.skrabec@gmail.com>,
	Luca Ceresoli <luca.ceresoli@bootlin.com>,
	dri-devel@lists.freedesktop.org,
	devicetree@vger.kernel.org,
	linux-kernel@vger.kernel.org,
	linux-renesas-soc@vger.kernel.org,
	Prabhakar Mahadev Lad <prabhakar.mahadev-lad.rj@bp.renesas.com>,
	Biju Das <biju.das.au@gmail.com>
Subject: [PATCH v2 01/16] dt-bindings: display: bridge: renesas,dsi: Document RZ/G3L
Date: Wed, 29 Jul 2026 13:54:53 +0100
Message-ID: <20260729125516.230757-2-biju.das.jz@bp.renesas.com>
X-Mailer: git-send-email 2.43.0
In-Reply-To: <20260729125516.230757-1-biju.das.jz@bp.renesas.com>
References: <20260729125516.230757-1-biju.das.jz@bp.renesas.com>
Precedence: bulk
X-Mailing-List: devicetree@vger.kernel.org
List-Id: <devicetree.vger.kernel.org>
List-Subscribe: <mailto:devicetree+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:devicetree+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

From: Biju Das <biju.das.jz@bp.renesas.com>

The RZ/G3L DSI IP is similar to the RZ/G2L but has different global PHY
timings and also the PLLCLK is ungateble clock. Add the compatible
string "renesas,r9a08g046-mipi-dsi" to handle these difference for the
Renesas RZ/G3L SoC. The power to DSI region is controlled by SYSC block.
Document renesas,sysc-pwrrdy property to handle the power control.

Signed-off-by: Biju Das <biju.das.jz@bp.renesas.com>
---
v1->v2:
 * Dropped renesas,sysc-pwrrdy property as it is modelled as power
   sequence.
---
 .../devicetree/bindings/display/bridge/renesas,dsi.yaml          | 1 +
 1 file changed, 1 insertion(+)

diff --git a/Documentation/devicetree/bindings/display/bridge/renesas,dsi.yaml b/Documentation/devicetree/bindings/display/bridge/renesas,dsi.yaml
index c20625b8425e..3832a553871b 100644
--- a/Documentation/devicetree/bindings/display/bridge/renesas,dsi.yaml
+++ b/Documentation/devicetree/bindings/display/bridge/renesas,dsi.yaml
@@ -28,6 +28,7 @@ properties:
           - const: renesas,r9a09g057-mipi-dsi
 
       - enum:
+          - renesas,r9a08g046-mipi-dsi # RZ/G3L
           - renesas,r9a09g057-mipi-dsi # RZ/V2H(P)
 
   reg:
-- 
2.43.0

