Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=209.85.221.51
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1794269290;
	b=JVOt9PY8cGcqTNIr06Pfh7DIoHLf3RX9fdxDoosvw8YqxLaYEXqO4Nr/7DvhuAqSPBV6
	 aKhPamUUviUsUq5s2Se/f+mfaA3LK1sM2mb3eOdqyMHAulhdODqkrP6maCuZjW8YqvqT2
	 J90dJpv7IUHS+PU9y11p5CSExs7sY6ObZUURB9Echew6ULQtmWWTMKFITyGcDk/FKRdNk
	 i/R1+MRJRD5KA3KB8tWNAg2AEHq4KdmqJfqAaFUa/FaaMSQgYQEyJ02xp9vWnHdOzFA75
	 54mF7gOgBDaQuvyXBfAqBcqZfs+6fGz2y1GTURo7rJj+U2P8nb9fPW1Ovj3f/zFb49w==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1794269290;
	h=DMARC-Filter:Received:DKIM-Signature:X-Google-DKIM-Signature:
	 X-Forwarded-Encrypted:X-Gm-Message-State:X-Gm-Gg:X-Received:Received:
	 From:To:Cc:Subject:Date:Message-ID:X-Mailer:In-Reply-To:References:
	 MIME-Version:Content-Transfer-Encoding;
	bh=jrxKnimkJlrFR0WRqhZUCXVjI+A7zsd604Fm1CjsY5Y=;
	b=GJx1Hq5pxaYddtD4BN1wgbIlmoReOmcYtHpoxO2lteVll3qLgIn31lWkh/pWeUJ53EqL
	 My/cn+uvB+ZZXoaYsX5biCRmLxaErKkezJPmZRGHSAxbTaKGGsnrOogF4GREvGIScvt1R
	 HIe3Wz/bbuIP74gG7weTvjNfon0wSGYB/B8cWAFxmp2jGL3F+ywXLpLL/eNCRjYcEBgPI
	 hdMeDWesdlLpivDZoncKo1gQM89POUlyUDqy1715bRfahG0+GFdDi4pYVjCYp7s9Y9lEg
	 gt80/PmGWZ3TZU0yYkSlGeSsEio8ZOV52g+S4TydMqV1zLnu7uKWUSjCrpJAgH6JYOw==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=gmail.com;
	spf=pass smtp.mailfrom=gmail.com;
	dkim=pass header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20260707 header.b="fAT/bcyF";
	arc=none smtp.remote-ip=209.85.221.51
Received: from mail-wr1-f51.google.com (mail-wr1-f51.google.com [209.85.221.51])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 5BA2860A261A
	for <devicetree@vger.kernel.org>; Tue, 10 Nov 2026 00:08:10 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org 5BA2860A261A
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20260707 header.b=fAT/bcyF
Received: by mail-wr1-f51.google.com with SMTP id ffacd0b85a97d-48e20ed3b9dso1244676f8f.2
        for <devicetree@vger.kernel.org>; Mon, 09 Nov 2026 16:08:10 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20260707; t=1794269289; x=1794874089; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=jrxKnimkJlrFR0WRqhZUCXVjI+A7zsd604Fm1CjsY5Y=;
        b=fAT/bcyF94tPNIyAtZNuFvVu25DD39UP0tsXgVALMMITkcXdx4F2P0SUEwY0K86s1s
         HeC9TFkDEbWLcwNm+5FsT+WG1ZaoQwSsv/Wc7yPMmfNiIe7fJjN4jTDZFK8xw0inJzZV
         7/7hSxUntpvMfzQTau+SSllyj6MLOPxQtPiAWowsbfArxB+J5WU0b/3ePEvHEO6IJQgE
         YboiXsN3ioo3wvXLBZ7ZaLPdAYoA55ccPVurWQ4cu9hNID1KbYm0E36fUhN5OF/A2+Tu
         FJO76NOBVp7oWMyS+7AJGwP3iy90/Puo9MV4D86jZ4xYnl2YDtLl8glWCcE3RGF3ogYc
         hIyg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1794269289; x=1794874089;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to:content-type;
        bh=jrxKnimkJlrFR0WRqhZUCXVjI+A7zsd604Fm1CjsY5Y=;
        b=nW3++ZHdyUYF/GWCCA/fyAxEclkjjxmAsfz2baTgjucQxgJ9a8V9Clw3wiPUKWko4x
         exmmUGm7/wlnOG37eOW5GxsVlYYeV/vjQk7IiEhJqz5FN86Fjk0T0S+wCGFgIKl2xsFC
         wsf0BydrZaCmqRJUQq4smfRGe+RXneC/G+kmX3KUeHqekXxpzuvwqXXRVdjrEK3M7wY/
         rffXn80jWsXJv4viDRpVHxhJpYlsuLS72G8mE1lP/J9DJ/VCIu7SfdNmeiRxphDf8ZEB
         7M+tXjIklUcZ513ogPpYbSEK1NjPxE+iHRZI00L/i/Grg4d7h0FfGkVb7RbcEmr239e3
         6yNg==
X-Forwarded-Encrypted: i=1; AL+hErFRWDTRsrS6smCbyNNQ7v2OnOzvMe8tCVZDCjYhFUq+yt/kegnUuNLSeykmY87koZrzqReT3sIcY7DO@vger.kernel.org
X-Gm-Message-State: APuU4Z9HAbJArzt36KZcCH+h0dI9+VqYCBsGcxnZWOD07IJEtph+MKr/
	tp7d22H8YvTMVM1QBfh/xx08ad9SG2dHPg3RpbMry9hjhez651IgFTMx
X-Gm-Gg: AYBFou1pfQoP+55Zanz22GA5gfVtxGwKjxtPUXzrM9rG2JlzI/PpaypMWmcDDB1xKsz
	ZQl2HIofWjrT2wkZBp9liM/SujvjqKMoWOcRiN1SRd1ZD0lmiyJyEOT14RjDC/+oNP1XnJxjbcM
	gD0HC48Kh1PKHLY1jihNrXOg+Q7d8uhJbAajVSoaQ+x/PBT0WKaH68ZJZ9mni3VM7oQwJiJK1y6
	hAtGtxBxE6Iu8BAwdYChp1jAUkGObp/OImg9YTfsyCCIa2XEGPTB3/YQ9ZDPYTEfvJc2K7t4Hm6
	F9Hg3ZwfWjyRQEaORju3v5oNKzXj4g29wXVafinN28MRz/GqDu8wKWKb9UlxY3ueOlmc3C1QhKH
	ZQDbFEBpwdwioU5Z0gV1kF6LLYIP9vO8g74kBaROqm5+8QjvNpdPlXYnXz6lZ3jObr6xmjbOmJf
	MrE/fkSzzyIEHEDU/ml7MQB/oyJtR/KRkB03Hrf5iGu7+OXzz88x9zFbB3sjHmf1+EROtczfcPT
	RBDD/z07EXWp6a12kEXue7V6i+mK55MkoYs66oIe1fsx5kBW4nJknmx3FXyozuu/lvd2rhIcOKY
	vAu+mNJ0rRF9fg5AEQcW/UX5j5Cw85tkVJZo2kdTcLYENQUowyCN5L/UV1HV4t8nNmVE6JJ4RNm
	UV/Wr/+m+zWmOyXZh+A/zf+Hd+VNhib5xwGWbZ+fJ9B/ll+acHTo=
X-Received: by 2002:a05:6000:641:b0:490:b23b:802d with SMTP id ffacd0b85a97d-498308b94famr1294764f8f.37.1794269288613;
        Mon, 09 Nov 2026 16:08:08 -0800 (PST)
Received: from Ansuel-XPS24.localdomain (host-212-171-11-30.retail.telecomitalia.it. [212.171.11.30])
        by smtp.googlemail.com with ESMTPSA id ffacd0b85a97d-498363df7a5sm1704703f8f.37.2026.11.09.16.08.07
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 09 Nov 2026 16:08:08 -0800 (PST)
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
Subject: [PATCH v12 2/5] clk: en7523: use devm variant for clk_hw_register and fixed clock
Date: Tue, 10 Nov 2026 01:07:47 +0100
Message-ID: <20261110000753.508-3-ansuelsmth@gmail.com>
X-Mailer: git-send-email 2.55.0
In-Reply-To: <20261110000753.508-1-ansuelsmth@gmail.com>
References: <20261110000753.508-1-ansuelsmth@gmail.com>
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

