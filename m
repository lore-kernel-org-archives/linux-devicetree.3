Received: from mail-wm2-f12.google.com (mail-wm2-f12.google.com [74.125.225.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 785FA3E763E
	for <devicetree@vger.kernel.org>; Sun, 27 Sep 2026 12:46:37 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=74.125.225.140
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1790513199; cv=none; b=Q/oQ3N+Exc/szZD7PhaCJwlE7Tz94ZiA17wjtSzEPt4DRNvGVYtlTS4/sWq4+McInGQqOuB92e0VNeTGerFY1vGb3WZgtmfayIPKyMUQcauWrTnOJA+ApfDUkyqld77i+Knnl8JkZi158kxlh0ZR5CC+AczNgsPJ+GCW9Ptm260=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1790513199; c=relaxed/simple;
	bh=xG8fQs+Nv8hzYaB47vBOWqr+MR+BJEmuFuZwRxqnET0=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version; b=uyUSPGtas6sdSyGJ2vvfMVjT4GeSY6gvdnfbrJtP1zAn8C8JXHRJNuinB0hDVzj+ijmsU+RkIG03vzAtJUVPhNocfsszuoJuB3E+yBYNa8jxUsStFZMtd6yH8QPCNl5jrlBTwdiiQXiS0oJtd/8kXx+jG99u6gB6eybMXBg8IgM=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=GVcT70Yq; arc=none smtp.client-ip=74.125.225.140
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="GVcT70Yq"
Received: by mail-wm2-f12.google.com with SMTP id 5b1f17b1804b1-49cd4ba9f68so25530145e9.1
        for <devicetree@vger.kernel.org>; Sun, 27 Sep 2026 05:46:37 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1790513196; x=1791117996; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=6TBF9avaY/bTBgvPOC6p2G/lL798dgydRUW2YJl/tA8=;
        b=GVcT70Yq1sylQT1Id4B3ZvvKj8khaXua+PnNtiVOWLBmIYmmwlCFaSHL3SNN5JT6TU
         iVtMHmSgdt1HPiAjgpRWfvk1zHGEl/9TkWV5Q+MV04O2/p2DEjzjxrjr+QNh95vKBOU4
         GCWIIM7N9pMaaGAVf70vVuY7Q39e3Lor+PzwjPu0tm6Kc8VZxmmRRtDeXttGbweubOKt
         mM54+UFwr2N7a9dDlYtRAxoAiehBd3JyjN+eBmZEiC3AeoUC5vGkthBmtv45q0S5ZPsp
         fFfOVI3+sqi0n1Js98WKLZQFs6MMEjlKtUkjjeYT3GxjD1fH6jhcoaGohxNGz1c7tqVc
         Vxhg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1790513196; x=1791117996;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to:content-type;
        bh=6TBF9avaY/bTBgvPOC6p2G/lL798dgydRUW2YJl/tA8=;
        b=UEapr2s6uZ7qMx4p19yRI1hm60b/XcxsGYHNFCAAahl4iRBOfoAai5/jAFu4qPmh+Z
         CNXsvTEWZIt0T7RJ6ttYH1Axaqfj0cE4CZStm3EgP56w5BJHHKzV7DWHmtFyAT4O5scj
         CBZTvau2atuHP9zffBNWw+9QhUpEzds+1PPpfD9Me8ZVQbOHojyUvQ17Hzw3Vbq2WmtE
         Oa1vJOJR/Ta7qqLP0MtnUX3vos32zDBZpFzVUR0wFbh6xyEPqbKIDSd/v44PRtoC5SA7
         z6m5hiw/owACT6Vmmwe+D2ppz5cRQ/omz63KeELHvCCvZei5CIWKTXVb7EOAXVYRQiB7
         8JAg==
X-Forwarded-Encrypted: i=1; AKwUvByKE0DUYm4qdLQ3x2o7A+Po1Ybmf/uICxog5ap4y1S43a4uU/JtOOhYlWisCoOGLLFykkdFUqizSLft@vger.kernel.org
X-Gm-Message-State: AFuF++ktN9IK1EC2nO5CgWo7G6w6ZUDcP6OK9dOGTkTco6Ra3K1osoDe
	EniQtUKrUUYWESLWdkwX6Z5Mm5+RC1FBKClY9Sz7XZ0Crmg7aoHGNX32
X-Gm-Gg: AYBFou0noQRXosDUsmOHQqP2In3dEGwBpOEU5843hSHw6Ds2uKGvxUfVonxfFdjfuA9
	8AiQgP15S7PejgP5ePYo4pJ4S69RcpWx+yImMRkp6ibWS9YeAxjZOhDidZbRpR9dHinzKZn1fRD
	Vf9ySYeYHqeoEV5589UCvtcftGyAQnODVdoKKtcSaPR/80E0Sf+KqZ11xsWZS6NZsuwqm8P/Nm5
	lI52Z5O1yBieA7brnLN0ysGthW/uWUmfRoFTElFtPxjF0gUZ1BJLxuAE9uNrQkd1+1w9GOHdjA5
	DmA7oSm2mArSupe83vcLB1uBcyTmhCKlvAQGhTqmaFzpb3RW1PSuQ8EAn4Md0LYRTmOmszTsCk8
	1mDH28GGryRmx3dASdgXWOjw/wERRKDhriMpbiTwpOsv6o4RIduCGZ/pEilo3eT9Yh4jzhWIiZl
	223hM5gcrtMb+4+BwHsM46lA5Nat9K0ImabxgU6XuqBTC+PZZgwB7eWI9eNFdRAVjBPye390H/l
	dKTwy3cYd4kN+PG09zVKl+YMXSd3LSO8kUq5hk/xJl3r3I+NYRxpj7s0rAb2r005Dl9cMnUMlnT
	gWVakVV3uGk7HrEekMlY6qOYLP1yfsyq
X-Received: by 2002:a05:600c:8b34:b0:4a0:b6:4619 with SMTP id 5b1f17b1804b1-4a000b647f1mr30425705e9.0.1790513195410;
        Sun, 27 Sep 2026 05:46:35 -0700 (PDT)
Received: from Lord-Beerus.station ([31.27.155.43])
        by smtp.gmail.com with ESMTPSA id 5b1f17b1804b1-49fef60da94sm148440605e9.4.2026.09.27.05.46.33
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Sun, 27 Sep 2026 05:46:34 -0700 (PDT)
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
Subject: [PATCH v3 02/12] net: phy: micrel: Check RMII clock select property presence
Date: Sun, 27 Sep 2026 14:46:17 +0200
Message-ID: <095af7bdb3b28e7776bac12bb4f3f661d057216f.1790512621.git.stefano.r@variscite.com>
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

The micrel,rmii-reference-clock-select-25-mhz property is tested
for presence, but of_property_read_bool() warns when the property
has a value. Encoding it as <1> to satisfy the DT schema unit check
would therefore produce a warning at PHY probe.

Use of_property_present() for the presence test. It accepts both
existing empty properties and the new numeric form without changing
the RMII clock selection.

Signed-off-by: Stefano Radaelli <stefano.r@variscite.com>
---
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
