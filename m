Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=209.85.128.50
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1793880689;
	b=PXZVWm4u6GQzsqGXG0IZ084MgSNZ3ZzOSGoJ1GnOWjFFatTphnXY3Yg1IcNKHaVRQ73Q
	 n9R/zhez+daglK8fiTwTGD0M/XuXGudL47sLQWbhWIXFLxBtaKYcI1c7JQaZTtKexDZeL
	 N6jwPJ+YlDGpXAIUVGgVgV7q5jiFLjIbLjmGnVbNwuOW9H/zR1T3nyW6s5pH7mtXgs3ik
	 L6ipkCI+KGpMbmGgz+rpDu+BDJe1warmfro9nNc90u7E5sEBxeSGnsi40wd8FoDHv/EI8
	 F5vk5Yg01edp/W9Lx2NEnA4bguG5qwCj+VjkEjzslwt6w5JgYzL8KWnzS2VLUaZBLTA==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1793880689;
	h=DMARC-Filter:Received:DKIM-Signature:X-Google-DKIM-Signature:
	 X-Forwarded-Encrypted:X-Gm-Message-State:X-Gm-Gg:X-Received:Received:
	 From:To:Cc:Subject:Date:Message-ID:X-Mailer:In-Reply-To:References:
	 MIME-Version:Content-Transfer-Encoding;
	bh=jrxKnimkJlrFR0WRqhZUCXVjI+A7zsd604Fm1CjsY5Y=;
	b=fwJxq7U0lwL+gmp7BXmRtx0XgAS3idDxinHQl15QUT2X/I8H1rSj4gAyMNy/KPBiZXwE
	 QY9XAt0XTNDdKJ4S6pz97+guDTA+znPlJImVtx+SGAULq4kaukipgGy+pD+zghhTXbkQG
	 d9fF1pQo/3NVEzL6TXt8faHSr3dkzOGqnmgaCI0Rq5vq/EFvk0NPbUsrZ8xMyIDN6rjkY
	 UAMIY7eyxrR1QAB8f14c8ZEtDMclY4JhUmetKrJEoJT4pSQTetFkgNVrMCIFVRTeiW6HX
	 zE/f6spIUFwG/0hUt8N3iUo/aSHYLExOYOeMRC+FI9zIO1uio3RmAYk9Bzyp9hHuTgQ==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=gmail.com;
	spf=pass smtp.mailfrom=gmail.com;
	dkim=pass header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20260707 header.b=TmXZNG6g;
	arc=none smtp.remote-ip=209.85.128.50
Received: from mail-wm1-f50.google.com (mail-wm1-f50.google.com [209.85.128.50])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id DF88F606EE9C
	for <devicetree@vger.kernel.org>; Thu,  5 Nov 2026 12:11:28 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org DF88F606EE9C
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key, unprotected) header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20260707 header.b=TmXZNG6g
Received: by mail-wm1-f50.google.com with SMTP id 5b1f17b1804b1-4a20bdaf39cso18847695e9.1
        for <devicetree@vger.kernel.org>; Thu, 05 Nov 2026 04:11:28 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20260707; t=1793880687; x=1794485487; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=jrxKnimkJlrFR0WRqhZUCXVjI+A7zsd604Fm1CjsY5Y=;
        b=TmXZNG6ghQYIwS8rLb6UXuIOgAX41WufUyU5O4906YvMWU2VO7I9LZCawzVsJi7QVM
         s5R9sjUeo1pl1ba8iTIDNoSUV/J9xo3UHIOqHj8z6PP41JhlB8TOH7Woz3c66VI2k0fF
         iLZqiGNezOOyKJhUktDjTqbfA9C8KPquuzSELgJzVJZmTrGGzKwshu6Ob2IPWTf3BoxF
         WfAlqeDCOSff54ElpzpTVtmbaXb+MRIai8JpxU4MRHgfttVYI3R01l9s5MslzMFiSbVZ
         TLYnOfi5ysE/cP9ZBqoj23wf7Qe6loWoz/SM9yHiO0okrwTuUgM62DXkxnCAkELNHnDM
         fBGQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1793880687; x=1794485487;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to:content-type;
        bh=jrxKnimkJlrFR0WRqhZUCXVjI+A7zsd604Fm1CjsY5Y=;
        b=UC14k4H6rjm+oqNFfFrsouo4gc3/W6ki6IKLNiGamj/acFTV5LdXQiAw79e7DeDpU1
         D78NpvELbc7mi4Al5/WAONyDeGeUYE/ziFuDoH9fuAZDksLJniQQdjBY2iG90rT4a45/
         mIrQMBSosvlV7GKczpI1RoNPgzQhPczf1tg86Vq76ZsUnPT/wMoPt4e5avOqOCr3uM8U
         iefco7Su15MbjLOIYY4NNu+R0kg5fWL6nDWTyJ4JPMhVqIu7NpJgCGEti24tUDFkEcD6
         NhE2laXUofkh7cScNW4GwXZUBFNI9MgVQ+5c2AydxAaLPDhgif91xF/Reer6cTLDS2Vv
         iODA==
X-Forwarded-Encrypted: i=1; AKwUvByPsfVM/ePoXudtb984/czXQZB0imUB9fJCksZCt1KxeElHESFxchf1NsmMcL3YcutPV7epG1zd8JTF@vger.kernel.org
X-Gm-Message-State: APuU4Z9zjMcGwJBGvY5wG13yiFqMFVMyCscnvLGuUI6QauHZxJBti2+H
	Hsz6jSE9TCr4mIpttsYnSfBotyBnyIUwPP3M/3fkG32YP/NjFz/sqkkm
X-Gm-Gg: AYBFou1dW/Xort0H8jQ4LkYIKihNPnTmxYcMJToYBgP+xbZ/fSB2PgdtwxZ/VCqok2Q
	F7Bm6k2T56pKqIKOK8G/MalRt7Am6ZxjNRnxfZDLrX7PljVbcBZ20zjdAHG+L8TlP7BCdodxTjT
	4zjzTseM0TaluuETiU+4Y/1VHOqLTFu9FhEZY0xCj8Yjv1k5kFvkb/czroN63PjVQT9HXNhbrAW
	4jlntLd7ldzrka9W0uipvLSUZUA9Cokir1HhIE+Mhy4v/Nbh109Tt2TWNGTgtriX9eMG1FVNM+X
	/Beh4hca3nYBKJt2BeaC9+y//hnDfvsB8vAiuin7elkC2gbe2au0t1z1v8Qt6bQLeZKgu7KOJJJ
	PSyllVg5GCIUdJkCGWR5+dAWB65uJUThbZSwiAzxzub1CohHfeaoBU7+LND7ow4XfRS1iH6wso8
	kjv5mTliqA/vSBdaiVxUJfVUTx2fyJ6qGr5P4C7Oyq6vsTrazZfgaaNIzS/IlQJy0tuSNJF2ekU
	FyK36IvkwikFXQDBdQ6/HuYR3VMylKBop7qaM1Vwlo76HHKwB9+JuNxyDwAXhAwMSCIow2k53qH
	UNa0W3v5Yn4yJMp/DcsBTRCiPxCD5q81jJHGZR4+H2bR3rsGkyOZ0x7ftVbP0yz1Uyti0z5TEIt
	daGk2zjHWtxd9foTJZolKgRvo
X-Received: by 2002:a05:600c:8b04:b0:4a1:db17:c7e6 with SMTP id 5b1f17b1804b1-4ac150b2044mr412102875e9.2.1793880687317;
        Thu, 05 Nov 2026 04:11:27 -0800 (PST)
Received: from Ansuel-XPS24.lan (93-34-90-148.ip49.fastwebnet.it. [93.34.90.148])
        by smtp.googlemail.com with ESMTPSA id 5b1f17b1804b1-4b56f02386bsm58869885e9.7.2026.11.05.04.11.26
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 05 Nov 2026 04:11:26 -0800 (PST)
From: Christian Marangi <ansuelsmth@gmail.com>
To: Stephen Boyd <sboyd@kernel.org>,
	Brian Masney <bmasney+clk@redhat.com>,
	Jerome Brunet <jbrunet+clk@baylibre.com>,
	Rob Herring <robh@kernel.org>,
	Krzysztof Kozlowski <krzk+dt@kernel.org>,
	Conor Dooley <conor+dt@kernel.org>,
	Philipp Zabel <p.zabel@pengutronix.de>,
	Felix Fietkau <nbd@nbd.name>,
	linux-clk@vger.kernel.org,
	devicetree@vger.kernel.org,
	linux-kernel@vger.kernel.org
Cc: Christian Marangi <ansuelsmth@gmail.com>
Subject: [PATCH v10 2/5] clk: en7523: use devm variant for clk_hw_register and fixed clock
Date: Thu,  5 Nov 2026 13:10:55 +0100
Message-ID: <20261105121059.11201-3-ansuelsmth@gmail.com>
X-Mailer: git-send-email 2.55.0
In-Reply-To: <20261105121059.11201-1-ansuelsmth@gmail.com>
References: <20261105121059.11201-1-ansuelsmth@gmail.com>
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

Use devm variant for clk_hw_register and clk_hw_register_fixed_rate
to correctly unregister the clocks on probe fails.

This should never happen under normal condition but it's better to
handle these cleanup.

Signed-off-by: Christian Marangi <ansuelsmth@gmail.com>
---
 drivers/clk/clk-en7523.c | 8 ++++----
 1 file changed, 4 insertions(+), 4 deletions(-)

diff --git a/drivers/clk/clk-en7523.c b/drivers/clk/clk-en7523.c
index 24fdec2e6198..2baec734df9f 100644
--- a/drivers/clk/clk-en7523.c
+++ b/drivers/clk/clk-en7523.c
@@ -651,7 +651,7 @@ static struct clk_hw *en7523_register_pcie_clk(struct device *dev,
 	if (init.ops->unprepare)
 		init.ops->unprepare(&cg->hw);
 
-	if (clk_hw_register(dev, &cg->hw))
+	if (devm_clk_hw_register(dev, &cg->hw))
 		return NULL;
 
 	return &cg->hw;
@@ -708,7 +708,7 @@ static void en7523_register_clocks(struct device *dev, struct clk_hw_onecell_dat
 		val = readl(base + reg);
 		rate /= en7523_get_div(desc, val);
 
-		hw = clk_hw_register_fixed_rate(dev, desc->name, NULL, 0, rate);
+		hw = devm_clk_hw_register_fixed_rate(dev, desc->name, NULL, 0, rate);
 		if (IS_ERR(hw)) {
 			pr_err("Failed to register clk %s: %ld\n",
 			       desc->name, PTR_ERR(hw));
@@ -770,7 +770,7 @@ static void en7581_register_clocks(struct device *dev, struct clk_hw_onecell_dat
 		}
 		rate /= en7523_get_div(desc, val);
 
-		hw = clk_hw_register_fixed_rate(dev, desc->name, NULL, 0, rate);
+		hw = devm_clk_hw_register_fixed_rate(dev, desc->name, NULL, 0, rate);
 		if (IS_ERR(hw)) {
 			pr_err("Failed to register clk %s: %ld\n",
 			       desc->name, PTR_ERR(hw));
@@ -1105,7 +1105,7 @@ static void en751221_try_register_clk(struct device *dev, int key,
 	if (WARN_ON_ONCE(key >= EN751221_MAX_CLKS))
 		return;
 
-	hw = clk_hw_register_fixed_rate(dev, name, NULL, 0, rate);
+	hw = devm_clk_hw_register_fixed_rate(dev, name, NULL, 0, rate);
 	if (IS_ERR(hw))
 		pr_err("Failed to register clk %s: %pe\n", name, hw);
 	else
-- 
2.55.0

