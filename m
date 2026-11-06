Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=209.85.128.49
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1793966345;
	b=buyx14AXqhdmN4bLJvhLra8u9tLFeo3JIqM958Ntx3KT6GjZ3fPoDHXX/DYcu4QQBAF0
	 TdJJshaPGaaExoRL9tBwviyL7ugFMevfZbWw19xDoW0FjzxJEY8s99oKDiOQXq5NqpAh/
	 fx1YePtYoq220gQrF+WLtTaKmd8bT06k3Je337nY4fsXFTQzB3ED2ahjnoKBB+C3+h61M
	 dK2ymUTFtKVFXLUMy+93nW8EXION2TBbV/vg00Pk1xlHRXSXsPSolpnwFn0JYI9GEGGF3
	 WDsGhIJ1na8oyWabVt2763nl33ZwiqAChBLj79533b7yEhQaz65IodVaid9v//HhoJg==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1793966345;
	h=DMARC-Filter:Received:DKIM-Signature:X-Google-DKIM-Signature:
	 X-Forwarded-Encrypted:X-Gm-Message-State:X-Gm-Gg:X-Received:Received:
	 From:To:Cc:Subject:Date:Message-ID:X-Mailer:In-Reply-To:References:
	 MIME-Version:Content-Transfer-Encoding;
	bh=jrxKnimkJlrFR0WRqhZUCXVjI+A7zsd604Fm1CjsY5Y=;
	b=qEcB53cNv56w1QopraaMGJv3a7xxCIYr1hEvFUkX5fYViLjLWMFPYVDPMxEAj207Y0mU
	 zXVpqfJn9IIvxtRvTgG+ey+Vzj4W5hOVlzzazROsOSLWfnV/iz/7RAjNVQ7BcfUIbx3yh
	 ICHlKObXpXp9P+xQrCfi9Yb9ZFP5/Y8YEll6iMScajVbn8BP+3UT6PwwkXfoZr1ONuDM6
	 Uv7XVWSg2HxTDIV+A96W1zNDtVAMybGGu/cD93odUBjWoVRLe5qNN3PJiQui1FzsCXL9c
	 d7qialkhZh6u1yrlcjmJaN9bE6ZlpQRCg7JOj1GiVuBwJpakpdUlFvKnx5IbuDM1yNg==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=gmail.com;
	spf=pass smtp.mailfrom=gmail.com;
	dkim=pass header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20260707 header.b=MxpMzx4E;
	arc=none smtp.remote-ip=209.85.128.49
Received: from mail-wm1-f49.google.com (mail-wm1-f49.google.com [209.85.128.49])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 2C5A1606D801
	for <devicetree@vger.kernel.org>; Fri,  6 Nov 2026 11:59:05 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org 2C5A1606D801
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key, unprotected) header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20260707 header.b=MxpMzx4E
Received: by mail-wm1-f49.google.com with SMTP id 5b1f17b1804b1-4b467581b98so4182925e9.0
        for <devicetree@vger.kernel.org>; Fri, 06 Nov 2026 03:59:04 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20260707; t=1793966343; x=1794571143; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=jrxKnimkJlrFR0WRqhZUCXVjI+A7zsd604Fm1CjsY5Y=;
        b=MxpMzx4EXCrl9s9/r80CSIZEdrWtkGNBI4tsPzbGF9W4RTW0vwPYtBaBd4L5FwbNnY
         pnekJ2frko/Hyl9XJnPDIq1Vp46gE0w39QUttIrA/mFoiQJ38hYrkzUZ1JxUygkPp7T4
         jtA+rNm9xIU37LchpUoGzylDBEztpERrFnZFJL1R36Rm+crVa0A+llSLmqDRhnMAdAHl
         LVFgFL1yjWAMr8VB1wQGlSfEr7/sP3rZXPeqY3ydpy5LqEJ2iBhgw4WgSOTUpkWk0SXm
         /02K/3e0H4VmQ2eH2GHmi/lweDD+duVaMbEouJD9VtpWV2y/kXfWGATWI6HsJ+FCyj0O
         ifIg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1793966343; x=1794571143;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to:content-type;
        bh=jrxKnimkJlrFR0WRqhZUCXVjI+A7zsd604Fm1CjsY5Y=;
        b=cTAga//qaNQ41Paw0iYrkUTioaHooTO+Y1XWSEKki4ZhBNlBHq/6zkROJYCN8conlO
         SDV0BCQBr9Hp8OYQXSflKTFbdRSYkHFKYuymcQ54DNpeUb7ZwRwMUkmQ5FBjYBMq+4q6
         ULNorE2Lr2udhjkOMjRbKBTd1d5SWYHSjwsDlqX1rRT/EnyeOPCBeyxiPqei2fNHRo1H
         VEkLUZzKRpzonW0F8XsKGU6RCXXE927k4/KxPBYRwvrO95dzMzo7FIxbEQgSyqqVE51v
         bFv2Irhf6iAmhf5dJswF14d5B1wxMOVMFWXZA1n7cj8w32+EhyyWUlhSsfAKY4dn0WMF
         pkaw==
X-Forwarded-Encrypted: i=1; AKwUvBwq7lXbt4108CFCO8Ilij8fiVN71ayWLCIS0LJ9Dd96NdrJ/+HKbm4q8QHjVxxG/k7FkafRSrVhnmnH@vger.kernel.org
X-Gm-Message-State: APuU4Z/U8qxOHPkPGefW8aJk6XKRz59cS3sv6q2uOT8s1OdgwMfJIhPC
	WIzSzP4zgfo0xz3SiE/tyLW0x+q1uUs2IAIqSpy/nXaGT/MpXoWuQ5gG
X-Gm-Gg: AYBFou3MTsOg+HSBXpjUnZ9pFZNCi7Bn1sHeYJO8GN5l8zrbJY9FjxITIdQ3+Gq8gMP
	xBFOo/dFuS07KKDgV73rhvMUJXAwUAtr0i50dTv6rzPChWh2iIkh+S12zQ17bNcsIxztUn1hEWJ
	SemCRPQC/hSCX8lnyENsRCT4TdE4k7eHLfdpKb1FFwEl2rAC67YAlPqV5VR/OVGEyMspCVbYKl1
	HLLCLNIOdcEbxgZF0F43P3wAgSdt24G7q7esMR3N+UKU8urF/+fo7ydZSI4UZknOPjpCOdlM5sV
	RwHxNKnM9lQBs2rjlJciARlYLCrsxDCTCIbIpBeicMLAsV1OeXefI1PWjhzwZPNqHCySq455XI8
	g7LBqKX+3KyixvCZqSzg/DV289zE5ymplmzMtkScuFXvuzD60hFZZaAHDyKGZae7yKEwHyORWzy
	SEg9jPQ/nqSGa2euiZqnpTIqxKCVleOEVJuSwkUCd4Lhp9l2l+THrL/D6leGe0P30HEr1oK5nxK
	Ubf1BBuHkWom4XJKlcCimBzu4MeDMH5YgPqiTCn5xk9+BBmtYmMEgpRPtv7Ciuib3LSLw1+TzXz
	Jx8KTCJ5wBjYMis3T4I5U98yMjn55kBGihqfcjSZek0ZPneEFB95eadDXEKsIuhMGCl5QAONOOl
	bfbEMnZ2pxWuCNU+SIP8339Te7Iy7FjuBfA==
X-Received: by 2002:a05:600c:c058:b0:4a2:1cc:6551 with SMTP id 5b1f17b1804b1-4b6e0172438mr27417465e9.35.1793966343552;
        Fri, 06 Nov 2026 03:59:03 -0800 (PST)
Received: from Ansuel-XPS24.localdomain (93-34-90-148.ip49.fastwebnet.it. [93.34.90.148])
        by smtp.googlemail.com with ESMTPSA id 5b1f17b1804b1-4b76b5d52a7sm4849775e9.1.2026.11.06.03.59.02
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 06 Nov 2026 03:59:03 -0800 (PST)
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
Subject: [PATCH v11 2/5] clk: en7523: use devm variant for clk_hw_register and fixed clock
Date: Fri,  6 Nov 2026 12:58:47 +0100
Message-ID: <20261106115852.189098-3-ansuelsmth@gmail.com>
X-Mailer: git-send-email 2.55.0
In-Reply-To: <20261106115852.189098-1-ansuelsmth@gmail.com>
References: <20261106115852.189098-1-ansuelsmth@gmail.com>
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

