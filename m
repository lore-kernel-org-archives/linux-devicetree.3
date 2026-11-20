Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=209.85.128.48
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1795134366;
	b=BA+wtP0IV44jBD86hbzEx/FwE6lSyhQN0YiHFEzOwPrIGHU2djzOzUEzpEoY2ujWdX9a
	 /r2DPHUUvi85P3uA7L3eeR9/Zp9+kLzXVyPgKNqMh/Gp7tZsWUsUV4cH6UFnSrXzvJZYq
	 glxHUmQyQfW5iLbG6eoHJZZESE0+KwKdox0WANf73nfMtrrkBV8fUtuo3dqq02bIABwhP
	 QpBhs3vetyxQ1LjHhaF6SIpiZvzvISNruPb35kHfbhliDhX8s2/KRrQSJO8aiY5wQg+Mf
	 p3LWKje3Gxu2ZMJKT2NuGNof4FLIGIMqJFEWz+ZYCr8PkJhPYXJt15thPjM5Qe8lYrA==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1795134366;
	h=DMARC-Filter:Received:DKIM-Signature:X-Google-DKIM-Signature:
	 X-Forwarded-Encrypted:X-Gm-Message-State:X-Gm-Gg:X-Received:Received:
	 From:X-Google-Original-From:To:Cc:Subject:Date:Message-ID:X-Mailer:
	 In-Reply-To:References:MIME-Version:Content-Transfer-Encoding;
	bh=mPt8ckgxbndwPDdtomIJwXpg4ESCKJ7Dvn/Ga7ANGV4=;
	b=jFQt4/DPW+Q3a202ksSbM0YnVG03pm7hnOP3s6Com9DaBKnldLOZT6ACJ3SVjx8gE84K
	 JoMl3H6XpPI0NnySe4cRzO7LkYaue6ORzRvMXbfbjNDbOjonnXRe//RnCjWDWDJat6LD2
	 QOnUKYXgmmPKzg89yDzKzXhyIpl1lLPkC/RjaahgWex3HcYOjsPFyHdZxxAlQOIOr5zg6
	 Ril5rkJW3UzrQyk1b45PnTc1UtNv+D1aJSUc66jsrhW7JNqUak9wyVq2BtGBIQ/3qFleD
	 sSecN/g8xCr/xsQYdXXVnb8zmzbHHgR0N8HowjpsR85x8wReO9ivNziZ4rmgJmPfNpA==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=gmail.com;
	spf=pass smtp.mailfrom=gmail.com;
	dkim=pass header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20260707 header.b=kvRmUPCV;
	arc=none smtp.remote-ip=209.85.128.48
Received: from mail-wm1-f48.google.com (mail-wm1-f48.google.com [209.85.128.48])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 7168260A3833
	for <devicetree@vger.kernel.org>; Fri, 20 Nov 2026 00:26:05 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org 7168260A3833
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20260707 header.b=kvRmUPCV
Received: by mail-wm1-f48.google.com with SMTP id 5b1f17b1804b1-4a3517554f7so3148305e9.2
        for <devicetree@vger.kernel.org>; Thu, 19 Nov 2026 16:26:05 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20260707; t=1795134364; x=1795739164; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=mPt8ckgxbndwPDdtomIJwXpg4ESCKJ7Dvn/Ga7ANGV4=;
        b=kvRmUPCVFdVm9Tvu0USFo59ybVuNY+lv/i/sbUinEHjjSz1u1oTC6qMNXiMNCd9z3X
         RsOZkXuiy3FFIHSSKoBPOY8IZuMSl0+tBrtyTxfJxC59ZHgy7RtCosCY5mP21342VOfb
         oVdxG82rBoRF/tpBq+mqaaqYUXgvGs9ZvSC+u6M7IEVel7kf94mhPdu5TS8WyKTc28bq
         QvfPdfTJAyOBjQhlsoSztQ/HIp2YMUCtt32uIw4U6ZaL76wRNBPgtXohSwXj00E+w5ew
         Y1SaCK55hGUTNGaon0Da9mR0I/64EwzQf75PqOFz2xdv0/7DhusBGU9vfAoIARLFoHJf
         Wq3Q==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1795134364; x=1795739164;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to:content-type;
        bh=mPt8ckgxbndwPDdtomIJwXpg4ESCKJ7Dvn/Ga7ANGV4=;
        b=1IaMIddSpLfQ+yrjEomtvcexQtCmBYKsAXSBrnHA5XWqjQFbD5wq2qh37pieXmeujV
         3Lo2Qt1Y5F0I4jnppCc3d0ofzHcr/rq2Rjk4LI/Aw8A6SxnyAovJq7OQyQGqvAF7gGsz
         zrlQ04yKkeIG7yvI+zf6gtcCeixxZ0847LivVLtTaVnKFminG051UuD6OIDFdczNfzU9
         VXkrGMegnIdp/R2WwoGV5+tx6+kMXumbjFHy04yL9cKVz8VjVkHG1HVr8V1YfD4o3ccL
         2WAXmsReO7DMsoPixbcMGtWcxPBogi/crCwOds0DksLXZWLAZIXdrJney/98+3W4YzYi
         ixxA==
X-Forwarded-Encrypted: i=1; AL+hErEZOrIp0/97dlO+Q7HqUmAFyaHD/UK5gFu2gAAWH53KO27pT9NsR3sEaJUFbDL/elCf1hAgsGtL8Gex@vger.kernel.org
X-Gm-Message-State: APuU4Z8SV8hPGpq7MdwRUIquYfZUGDWxRFq1FsZmnrSENvJPEPnuSiui
	qoi1Fh+ioWwoaBH82NFESWz5hKWsWw8Rjxz9fKaHO+3AMZ3/SQ2O7wRR
X-Gm-Gg: AZFdTZdYNS24MGyMWizwVjPCFm/n689zGOaveefwMp+8kNjcto93ZYRTPBEA9BFMucK
	cVMQypxcFcayYp+zFx2kBiay7FWUbys79nMWcpiC4IkP3x6TXgglvM8YGQK/4pIhtgXWsr7pz1A
	so3gc5VS9AExBhJ/rhByabnmI7e/T0pXHqSOHSAX8jCmnXcKllEtwNpAYvqgnMqRfK4s5WpmdE3
	Z+yfQkiuBHBNdb772AAoNuRt3QgJg7IIsaYHZD5IavsMON6XWtctRFkIYzBd8N0SpePGSmB+LLS
	c9Tdw5bQNG15focVecVwIlsRZr8Zyi6l71MTybJyXp0B0WT/s2N8zOdqkirHSnSobInoCkM7WPJ
	IqCtQLCVUyBuiyS5nkn/OaFRBoro2S8kTbdTGGi9IJ1EkTp1mfbEfNouzFpg/t5hsuz5uQSkCXm
	12CI9Gv/670yxPADUKqm17aMk90MnzxQb19ThEvwRKUv3UVOEfXcfATradZxgo9sqviiyMn3wEs
	wb+LxsPvTIHb8TWo6/G60q+F/QAHuuDHsFVbbR8cjyK1Ltyh9qHA2b5Te4UteLhKAFL/gC5LQUV
	hlCfqaHZAlCniktGepr0Mzfk/xx7xqi/4tAdyfZhUVQ2GF3U0TTOiMUaudg8wu61v7ccGxt1LKV
	8N2Np79aWAvnBpusuH0xkMzwcqAnyT0KFtUpBwrjs1Qvt1siHEMfct3xH+v07ms3XhQBS/DkB
X-Received: by 2002:a05:6000:4a15:b0:49f:eb4b:faa3 with SMTP id ffacd0b85a97d-4abb2168f46mr1969744f8f.9.1795134363733;
        Thu, 19 Nov 2026 16:26:03 -0800 (PST)
Received: from iku.lan ([2a00:23c8:254f:fd01:c5c5:590b:f4b8:3e])
        by smtp.gmail.com with ESMTPSA id ffacd0b85a97d-4ab6c340df4sm2629998f8f.55.2026.11.19.16.26.02
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 19 Nov 2026 16:26:03 -0800 (PST)
From: Prabhakar <prabhakar.csengg@gmail.com>
X-Google-Original-From: Prabhakar <prabhakar.mahadev-lad.rj@bp.renesas.com>
To: =?UTF-8?q?Cl=C3=A9ment=20L=C3=A9ger?= <clement.leger@linux.dev>,
	Andrew Lunn <andrew@lunn.ch>,
	Vladimir Oltean <olteanv@gmail.com>,
	"David S. Miller" <davem@davemloft.net>,
	Eric Dumazet <edumazet@kernel.org>,
	Jakub Kicinski <kuba@kernel.org>,
	Paolo Abeni <pabeni@redhat.com>,
	Rob Herring <robh@kernel.org>,
	Krzysztof Kozlowski <krzk+dt@kernel.org>,
	Conor Dooley <conor+dt@kernel.org>,
	Heiner Kallweit <hkallweit1@gmail.com>,
	Russell King <linux@armlinux.org.uk>,
	Simon Horman <horms@kernel.org>,
	Philipp Zabel <p.zabel@pengutronix.de>,
	Geert Uytterhoeven <geert+renesas@glider.be>,
	Magnus Damm <magnus.damm@gmail.com>
Cc: Florian Fainelli <f.fainelli@gmail.com>,
	Ralph Siemsen <ralph.siemsen@linaro.org>,
	linux-renesas-soc@vger.kernel.org,
	netdev@vger.kernel.org,
	devicetree@vger.kernel.org,
	Prabhakar <prabhakar.csengg+renesas@gmail.com>,
	Biju Das <biju.das.jz@bp.renesas.com>,
	Fabrizio Castro <fabrizio.castro.jz@renesas.com>,
	Lad Prabhakar <prabhakar.mahadev-lad.rj@bp.renesas.com>,
	stable@vger.kernel.org
Subject: [PATCH net-next v5 10/24] net: dsa: rzn1-a5psw: Fix MDIO clock divider calculation
Date: Fri, 20 Nov 2026 00:25:20 +0000
Message-ID: <20261120002549.1908299-11-prabhakar.mahadev-lad.rj@bp.renesas.com>
X-Mailer: git-send-email 2.56.1
In-Reply-To: <20261120002549.1908299-1-prabhakar.mahadev-lad.rj@bp.renesas.com>
References: <20261120002549.1908299-1-prabhakar.mahadev-lad.rj@bp.renesas.com>
X-Mailing-List: devicetree@vger.kernel.org
List-Id: <devicetree.vger.kernel.org>
List-Post: <mailto:devicetree@vger.kernel.org>
List-Help: <mailto:devicetree+help@vger.kernel.org>
List-Subscribe: <mailto:devicetree+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:devicetree+unsubscribe@vger.kernel.org>
List-Owner: <mailto:devicetree+owner@vger.kernel.org>
Precedence: list
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

From: Lad Prabhakar <prabhakar.mahadev-lad.rj@bp.renesas.com>

The MDC frequency is hclk / (2 * CLKDIV + 1) on RZ/N1 as well as
RZ/T2H and RZ/N2H. The existing calculation uses the wrong divisor
formula and can set MDC above the requested clock-frequency.

Calculate the smallest CLKDIV that keeps MDC at or below the requested
frequency.

Fixes: 888cdb892b61 ("net: dsa: rzn1-a5psw: add Renesas RZ/N1 advanced 5 port switch driver")
Cc: stable@vger.kernel.org
Signed-off-by: Lad Prabhakar <prabhakar.mahadev-lad.rj@bp.renesas.com>
---
v4->v5:
- New patch
---
 drivers/net/dsa/rzn1_a5psw.c | 3 ++-
 1 file changed, 2 insertions(+), 1 deletion(-)

diff --git a/drivers/net/dsa/rzn1_a5psw.c b/drivers/net/dsa/rzn1_a5psw.c
index 7fd2652813ac..df3b3f75b489 100644
--- a/drivers/net/dsa/rzn1_a5psw.c
+++ b/drivers/net/dsa/rzn1_a5psw.c
@@ -11,6 +11,7 @@
 #include <linux/if_bridge.h>
 #include <linux/if_ether.h>
 #include <linux/kernel.h>
+#include <linux/math.h>
 #include <linux/module.h>
 #include <linux/of.h>
 #include <linux/of_mdio.h>
@@ -1104,7 +1105,7 @@ static int a5psw_mdio_config(struct a5psw *a5psw, u32 mdio_freq)
 	u32 cfgstatus;
 
 	rate = clk_get_rate(a5psw->hclk);
-	div = ((rate / mdio_freq) / 2);
+	div = DIV_ROUND_UP(DIV_ROUND_UP(rate, mdio_freq) - 1, 2);
 	if (div > FIELD_MAX(A5PSW_MDIO_CFG_STATUS_CLKDIV) ||
 	    div < A5PSW_MDIO_CLK_DIV_MIN) {
 		dev_err(a5psw->dev, "MDIO clock div %ld out of range\n", div);
-- 
2.56.1

