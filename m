Received: from mail-wm1-f48.google.com (mail-wm1-f48.google.com [209.85.128.48])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id D7A204FC333
	for <devicetree@vger.kernel.org>; Thu,  8 Oct 2026 19:40:23 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.128.48
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1791488430; cv=none; b=czThTdegtfVw5Gq9DUvE4ayY1A0RF49I+GGap+AG7RBC1ld1ICc/EOnfzqc6Bk4cPUqZBJsOOcMyEH1pMACUhGY66qYvqkArQ1c22OaplHdoJ4u4Xl22sZPJ1PDGByhLz1N4Vljc1SJVxt1wooO66YaqUpc/rPV1ioT23zkHP9Q=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1791488430; c=relaxed/simple;
	bh=igs2tqHF/e5m1TR4ZJ1BI1cUnIOjq3NYwvi9hVUtQZM=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version; b=WhVGd0kp9FbthxXR/Djxn3Rd2c9eVSog6uB2PSVih+nwEaV/+uO1qpsd933z1U9QXhKhwUlI5vs0wEODRWEwezQ2T3xqrNvjVd6qE2d7dZDjHKq6jBDjfoSNumGaulTTgOyZUmJ3HjeWCfH57EeIijXICmZ0YL8fXL7ReR1BXNQ=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=Elsfa47l; arc=none smtp.client-ip=209.85.128.48
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="Elsfa47l"
Received: by mail-wm1-f48.google.com with SMTP id 5b1f17b1804b1-4a17baef589so25909225e9.0
        for <devicetree@vger.kernel.org>; Thu, 08 Oct 2026 12:40:23 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1791488422; x=1792093222; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=aUKnHWhbwjMVr4mKYh743dRcYI9pzvORcI6HHWVVZSU=;
        b=Elsfa47lVla7MnQgVv75UOBcFni1CLI3II73VKfl3GO3AorOPznCySjgjUJVkAtpI8
         kkKAREzqVCaIn6ql/p3YXyhCP4R1K9o5B93pW9jYp5fx8BpjeJn1SlSz82EJIFPk6Tqb
         f9B7EfbntFnwRWkdPLfZ4Bq49zvwY3/bttkWsFQKaeF36ince10sVwIJZHxFebH/CrO/
         a/u1vdWGTnrx0OnRj9g7y1mqetnj/CfhrhiH6W1CVUBHcFzP6C0B0opw0y3OV1Xq0oGR
         M9M3gQzd+oqjXo9hzlp0+Xq4hDlrb0nC2XqJ2/QOVtfduLDkOTwU/vjHdhsld+SPPGWm
         CgKg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1791488422; x=1792093222;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to:content-type;
        bh=aUKnHWhbwjMVr4mKYh743dRcYI9pzvORcI6HHWVVZSU=;
        b=1+5wnpUkeXYZBoBB3P9baogd/0f/YLXXhDxGEtcqd7m6aLAhZtvnsGCuOsgZwAFKgW
         Urb0lqgrWYYgFtK6iVlZ4qHjNKC399MwJ73hX7UhahQzuvayddZePowcWZA0wKwARyQ+
         XXyFSrrnOH9ILmpNM3crMIkrVlSd4WOTAziFspm5ViRBT70AeuCDSWSA8JJDvqB7OCMJ
         UhbSr4VFJ4Reo8CaYMgF3LKVASp3cQMpsciauaVm9eKxc6hdUMlQyCevaWtPQ0EQEVWG
         PtuFtrFEMH4GwfzWaX+l/jM/e/B8InbhSgNJ/zh2D/Afu5ttt8taELyv4kBfXpQOllMB
         jtRg==
X-Forwarded-Encrypted: i=1; AKwUvBw5tF/SB3RUpfWO9TvpEa3OaXeSrDwXmQawWVQ1doh0k18gBXeRQv9PD9hMqHUonbCmtpTCCFvpPThK@vger.kernel.org
X-Gm-Message-State: AFuF++mLP978GSyMGS724oVzKrZri6vVPAN3T6XQYA6rY8asH9osstMo
	zKn/2ZX7FwFAKQCy2S77Acl9/+W89oUsaPzarVPaD3KQ4jSvG2/3lW8k
X-Gm-Gg: AYBFou3UDX0l2R5VDEFHaU/mtxDDAmWi02QUjt9M7t+k/HIJjIGzv779xUfKB/kvRta
	TlxGEtdzMgo4GYU3XDcZTfxHEU6JYNYBUcsq/UcxVIQeG17eEAhc4l4Y8BRyXVsUuZsVzkBJY8I
	EXUCKI+cE5CAyiuipQLkhD9fGVgJ+4yCW/8zPpSYVUx4LBKoSxN0am/8o4jEyKEepyy6q9rr31O
	YeUOQN1LI1nsNf7T/Q+Dnl/hkzFlwR9WldxDemBhrelXjA8+UIJgRUt8Gpz56U0PYK6o2o/1lMr
	9kQ72EZ6L/cctZ7is2/j8RrZy0pm+eTIEIfT6JDCbO7LjalI/TDP+ceu8vl+KvkMbQnPWm5C4E3
	3lrSkGsvk2HXpWUQ8IwxK5g03vrtBYk2+SG97tKpbjbEhHVcSUjAoCp8U847l1glFnLtAPx/K7N
	F1T3nfsSpOGfP1k1kPvlD7X/imChfTS2iS/afSuMHyTPRulyzsHILj099QGK5oT4fkkWX2+B2+Q
	wEk7Gf62dDrZA/T3HLEhBMHoEj1bFoylb9RV0xS/bZicAznrc0WeUpOyiiTsZUKqGRPhLYEKBzS
	OwrhGtL+FDkzWulC9JqU8A==
X-Received: by 2002:a05:600c:5252:b0:4a0:4a8:d444 with SMTP id 5b1f17b1804b1-4a1806878c3mr107026915e9.33.1791488421519;
        Thu, 08 Oct 2026 12:40:21 -0700 (PDT)
Received: from Lord-Beerus.station ([31.27.155.43])
        by smtp.gmail.com with ESMTPSA id 5b1f17b1804b1-4a18c1e33d2sm1419065e9.0.2026.10.08.12.40.19
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 08 Oct 2026 12:40:21 -0700 (PDT)
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
Subject: [PATCH v5 04/13] net: phy: micrel: Check RMII clock select property presence
Date: Thu,  8 Oct 2026 21:37:44 +0200
Message-ID: <6271eea14eb6ef93031921cedc12d87cf5e25595.1791487179.git.stefano.r@variscite.com>
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

The micrel,rmii-reference-clock-select-25-mhz property is tested
for presence, but of_property_read_bool() warns when the property
has a value. Encoding it as <1> to satisfy the DT schema unit check
would therefore produce a warning at PHY probe.

Use of_property_present() for the presence test. It accepts both
existing empty properties and the new numeric form without changing
the RMII clock selection.

Signed-off-by: Stefano Radaelli <stefano.r@variscite.com>
---
v4->v5:
 - No changes.

v2->v3:
 - New patch: use of_property_present() for the RMII clock select
   property so its numeric form does not warn during PHY probe.

 drivers/net/phy/micrel.c | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/drivers/net/phy/micrel.c b/drivers/net/phy/micrel.c
index ae830781824b..acb481a29c25 100644
--- a/drivers/net/phy/micrel.c
+++ b/drivers/net/phy/micrel.c
@@ -2791,7 +2791,7 @@ static int kszphy_probe(struct phy_device *phydev)
 
 		if (type)
 			priv->rmii_ref_clk_sel = type->has_rmii_ref_clk_sel;
-		rmii_ref_clk_sel_25_mhz = of_property_read_bool(np,
+		rmii_ref_clk_sel_25_mhz = of_property_present(np,
 				"micrel,rmii-reference-clock-select-25-mhz");
 
 		if (rate > 24500000 && rate < 25500000) {
-- 
2.47.3

