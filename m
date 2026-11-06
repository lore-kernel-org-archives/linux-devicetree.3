Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=209.85.221.54
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1793953838;
	b=TagpjOPoY1f4dlRm3RBfrGUR6GXTE6mcIDKjahS6FuTmsLxY5ApNFavjyMVNDAGXpRVX
	 22F02/rPmjFos2lrnToI+ZfnBNbPLLKUyhYGMqCiC9leCo97mhX9ip/RZLG0g8ItYoZJi
	 5NtSEzuZsJuL6QOArB0Tu/zOdaqF1xZyQk7iyNA+cFZk9knJv/T+RTa2kgz0xuu9z6Eyy
	 aq93BfdvhPcY4236DrAwRTiD8A83reBIh+PZKS8xSCFQbqxwDn7s2/TCPhQtethxzFmOi
	 41b0ley531nuGrtU0ffhaAj3k8hOR8SMUmi4pj9b3MFCbwd78LhG32IaMjb0k6J5iPw==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1793953838;
	h=DMARC-Filter:Received:DKIM-Signature:X-Google-DKIM-Signature:
	 X-Forwarded-Encrypted:X-Gm-Message-State:X-Gm-Gg:X-Received:Received:
	 From:Date:Subject:MIME-Version:Content-Type:Content-Transfer-Encoding:
	 Message-Id:References:In-Reply-To:To:Cc:X-Mailer;
	bh=z5PBEnq7VF6lYD89KsFrntzTjwO4LYAxU3lHBv/vL7c=;
	b=B/UQt4zd9t+PRhoi+zOSTwLDjtezasQ9gKl1NKBr9OFkC846anECjqa//Qb5T05gWmLn
	 b2WGl/yqd2572FMCEXd/ZVYBUsyf7DUZ19B01+LepHcTBWgf7gQIuJ7Lc2NQUBlOBwglt
	 zlBLH9YqjgwLzBLYumtWTaFol+I9BaC8cy2S5obJVNPN/0jA/ucQEWQ109Tua0lLC4Pd1
	 aIFOiJrTV3zPCz+ipZlOkCFk9//TyMubFlRZzNMynPTNOwsBFiyjZmEkXPtn+jB6zmPrF
	 rom5GteGKDvFQWSr3CVPE9UX2DQVyiP493Z2IhKCc/QGPYU35Sq8a4RbkWWZLk8VXrg==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=none header.from=baylibre.com;
	spf=pass smtp.mailfrom=baylibre.com;
	dkim=pass header.d=baylibre.com header.i=@baylibre.com header.a=rsa-sha256 header.s=google header.b=N6MSp7+V;
	arc=none smtp.remote-ip=209.85.221.54
Received: from mail-wr1-f54.google.com (mail-wr1-f54.google.com [209.85.221.54])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 8238F606D811
	for <devicetree@vger.kernel.org>; Fri,  6 Nov 2026 08:30:37 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org 8238F606D811
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=baylibre.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=baylibre.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key, unprotected) header.d=baylibre.com header.i=@baylibre.com header.a=rsa-sha256 header.s=google header.b=N6MSp7+V
Received: by mail-wr1-f54.google.com with SMTP id ffacd0b85a97d-49231763f81so193423f8f.1
        for <devicetree@vger.kernel.org>; Fri, 06 Nov 2026 00:30:37 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=baylibre.com; s=google; t=1793953836; x=1794558636; darn=vger.kernel.org;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :content-type:mime-version:subject:date:from:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=z5PBEnq7VF6lYD89KsFrntzTjwO4LYAxU3lHBv/vL7c=;
        b=N6MSp7+V8HPEY6Bt8+49slpA+THfhpi4GFCegpfPQB1BwD6XA+2XV6jk7jfCQT6GE+
         XWkjn27k5eNayKlwF5LkRZQoyrT7VkNE9uF3NGP9eLJWffeUlKyYsI7ghz4U/ziWHPR/
         Raq8TnQXGg7gFPb1seUKNycA6taol9D0mZeyH0lJSef//OG66qDH1ffptAis12J2ao9g
         s8K24obObXIjdgCrAIf/OFlb+KcFQsAbPl5vqVineDW9wGoDZoacfUabloLJnS8HKPYk
         VgTsLPCbWiYUDXwaI3DDmTY4nnKwYs59VcAcj8AI+46bxla4+nHLy5KUvEhedVS6nw6L
         x3uQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1793953836; x=1794558636;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :content-type:mime-version:subject:date:from:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=z5PBEnq7VF6lYD89KsFrntzTjwO4LYAxU3lHBv/vL7c=;
        b=hKNnwJr/dLSlWHYWO7h3a/nh5eYrvE0CbdNfV7ZNACqqIwIRElKhKXlpxsBOPsVA25
         QjY1proIlsQcfJ7aVWQmVA7fZAkymemYqLheR5XaGgl0cCzCibnlcl+nwCFuX0pXamJN
         C2N5K+g8V1EVxIZwnPIKS9hl3wq8YLyK8vv7f6BogKKIbbuxH1JTmGIQLCs/a539ZUhU
         hRqNiRSpm/PTBAbILzOcfz7jSzeDbcksBMfDVl3E+kb10ObpUoDu7aIQ4nqMT96RhMvz
         1SseLtNqE7L2sFAPVGxUg0qWjYnzxZTHEnI1HcmsP8rQViUea+w/TrpPPOKQHQfMShjp
         0V7g==
X-Forwarded-Encrypted: i=1; AL+hErH28d2u0IerTRI3HDkn0ndurC/emqWreX5kL2+U0MJLnLKvOOJlX3orBQvtQQQBWX+CUyRHWWMOCcQ2@vger.kernel.org
X-Gm-Message-State: APuU4Z9Ryxp59WLIdBXjZcr51B2n0XV8WIsKnqxWWn6QHN4rtnF6jSDy
	Nx09PBTHI0AFPZ4/JLBjUibLGnfwh1pKtddzQ6EXG8MMhRCA3/rBJvyA9JMDbXWF8Fg=
X-Gm-Gg: AYBFou0h5mZXMLZo5PsZUxkj31qSViV3Q2dpL2p5EHW/bQhx8vDYDReAOnRpVYZFnFT
	DxWBdFKrPMI2BjggXDY0sKYPUtsn9gMLvn+1kHDyp/bMvYuEKBrg4lJr1F6RZ4ep1L8NjvupH3d
	msgqwy2qFF+Yj4yavPEvTtTaWDq2DPXPN+9y0I2NTHRuqef+di9gSW1UwossalEPHSnvVoPW3mT
	vBlrzzaHxeevy1AQZlV1nSFX2Z9+1+d8XNwkKvIDBw5YwYFkHktYvYmbhGV7c7ueeQKQrrwp9Zh
	TcJbkj6xaXjBBmcZN21u/3R5EIrxn23FhCnD+990WXO7Bc2YBwcz4PltwRMXqMzItCEEc54/3cH
	BuZwibD72+n8wD1UheG9fbXNxa/b4y+4rSnr1Vu6mzWkDZ6mmsoLjlbVoCcSDUvvQWjENdRiDjP
	2sS/q5DX7NqO6Kz6v4pvmQqtPjtMqi7OiPoseBx0u25Ltp6Dg25fcPcCq+j6oH1JDonYbBJPQZC
	pP2WRt+wFNLQ8HX3N5KZDKLvwH52q1gRuurOEuUWdUbXhB+DGcLvRrovlnkoBSTtjTmbUVyewTB
	3MI2nmKKLu0yxjtkBgWuJBsJGuhMAMJZZNq+hbF9aY7vfUYBYm4cD8z1nZWJA8dlx+xjfFG4/JU
	b3c/1bmd3FSEb/65IiE7Jkcf+fNdFM1xYIUTuvCpNkvxw5A==
X-Received: by 2002:a05:6000:1882:b0:487:27f9:834 with SMTP id ffacd0b85a97d-492778d1739mr3822099f8f.41.1793953835726;
        Fri, 06 Nov 2026 00:30:35 -0800 (PST)
Received: from macbook.homenet.telecomitalia.it (host-95-246-144-141.retail.telecomitalia.it. [95.246.144.141])
        by smtp.gmail.com with ESMTPSA id ffacd0b85a97d-492d8472969sm2366839f8f.58.2026.11.06.00.30.34
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 06 Nov 2026 00:30:35 -0800 (PST)
From: Carlo Caione <ccaione@baylibre.com>
Date: Fri, 06 Nov 2026 09:30:26 +0100
Subject: [PATCH 3/7] clk: meson: pll: Support active-low resets
X-Mailing-List: devicetree@vger.kernel.org
List-Id: <devicetree.vger.kernel.org>
List-Post: <mailto:devicetree@vger.kernel.org>
List-Help: <mailto:devicetree+help@vger.kernel.org>
List-Subscribe: <mailto:devicetree+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:devicetree+unsubscribe@vger.kernel.org>
List-Owner: <mailto:devicetree+owner@vger.kernel.org>
Precedence: list
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20261106-upstream-s7-clk-v1-3-7d501d62621f@baylibre.com>
References: <20261106-upstream-s7-clk-v1-0-7d501d62621f@baylibre.com>
In-Reply-To: <20261106-upstream-s7-clk-v1-0-7d501d62621f@baylibre.com>
To: Stephen Boyd <sboyd@kernel.org>, Brian Masney <bmasney+clk@redhat.com>, 
 Jerome Brunet <jbrunet+clk@baylibre.com>, Rob Herring <robh@kernel.org>, 
 Krzysztof Kozlowski <krzk+dt@kernel.org>, 
 Conor Dooley <conor+dt@kernel.org>, 
 Neil Armstrong <neil.armstrong@linaro.org>, 
 Jerome Brunet <jbrunet@baylibre.com>, Kevin Hilman <khilman@baylibre.com>, 
 Martin Blumenstingl <martin.blumenstingl@googlemail.com>, 
 Carlo Caione <ccaione@baylibre.com>
Cc: Jian Hu <jian.hu@amlogic.com>, Chuan Liu <chuan.liu@amlogic.com>, 
 linux-kernel@vger.kernel.org, linux-clk@vger.kernel.org, 
 devicetree@vger.kernel.org, linux-amlogic@lists.infradead.org, 
 linux-arm-kernel@lists.infradead.org
X-Mailer: b4 0.16.0

The common PLL code assumes that the reset of a PLL is active high. The
S7 HDMI PLL has an active-low reset, and its lock flag only rises
reliably when the PLL goes through it.

Add a flag for PLLs with an active-low reset so this PLL can use the
common implementation.

Signed-off-by: Carlo Caione <ccaione@baylibre.com>
---
 drivers/clk/meson/clk-pll.c | 43 +++++++++++++++++++++++++++++++------------
 drivers/clk/meson/clk-pll.h |  1 +
 2 files changed, 32 insertions(+), 12 deletions(-)

diff --git a/drivers/clk/meson/clk-pll.c b/drivers/clk/meson/clk-pll.c
index 44b33051405f..4ac5e45c1e9b 100644
--- a/drivers/clk/meson/clk-pll.c
+++ b/drivers/clk/meson/clk-pll.c
@@ -293,13 +293,37 @@ static int meson_clk_pll_wait_lock(struct clk_hw *hw)
 	return -ETIMEDOUT;
 }
 
+static bool meson_clk_pll_in_reset(struct clk_regmap *clk,
+				   struct meson_clk_pll_data *pll)
+{
+	unsigned int rst;
+
+	if (!MESON_PARM_APPLICABLE(&pll->rst))
+		return false;
+
+	rst = meson_parm_read(clk->map, &pll->rst);
+
+	return pll->flags & CLK_MESON_PLL_RST_ACTIVE_LOW ? !rst : rst;
+}
+
+static void meson_clk_pll_reset(struct clk_regmap *clk,
+				struct meson_clk_pll_data *pll, bool reset)
+{
+	if (!MESON_PARM_APPLICABLE(&pll->rst))
+		return;
+
+	if (pll->flags & CLK_MESON_PLL_RST_ACTIVE_LOW)
+		reset = !reset;
+
+	meson_parm_write(clk->map, &pll->rst, reset);
+}
+
 static int meson_clk_pll_is_enabled(struct clk_hw *hw)
 {
 	struct clk_regmap *clk = to_clk_regmap(hw);
 	struct meson_clk_pll_data *pll = meson_clk_pll_data(clk);
 
-	if (MESON_PARM_APPLICABLE(&pll->rst) &&
-	    meson_parm_read(clk->map, &pll->rst))
+	if (meson_clk_pll_in_reset(clk, pll))
 		return 0;
 
 	if (!meson_parm_read(clk->map, &pll->en) ||
@@ -328,14 +352,12 @@ static int meson_clk_pll_init(struct clk_hw *hw)
 		return 0;
 
 	if (pll->init_count) {
-		if (MESON_PARM_APPLICABLE(&pll->rst))
-			meson_parm_write(clk->map, &pll->rst, 1);
+		meson_clk_pll_reset(clk, pll, true);
 
 		regmap_multi_reg_write(clk->map, pll->init_regs,
 				       pll->init_count);
 
-		if (MESON_PARM_APPLICABLE(&pll->rst))
-			meson_parm_write(clk->map, &pll->rst, 0);
+		meson_clk_pll_reset(clk, pll, false);
 	}
 
 	return 0;
@@ -365,15 +387,13 @@ static int meson_clk_pll_enable(struct clk_hw *hw)
 		return 0;
 
 	/* Make sure the pll is in reset */
-	if (MESON_PARM_APPLICABLE(&pll->rst))
-		meson_parm_write(clk->map, &pll->rst, 1);
+	meson_clk_pll_reset(clk, pll, true);
 
 	/* Enable the pll */
 	meson_parm_write(clk->map, &pll->en, 1);
 
 	/* Take the pll out reset */
-	if (MESON_PARM_APPLICABLE(&pll->rst))
-		meson_parm_write(clk->map, &pll->rst, 0);
+	meson_clk_pll_reset(clk, pll, false);
 
 	/*
 	 * Compared with the previous SoCs, self-adaption current module
@@ -406,8 +426,7 @@ static void meson_clk_pll_disable(struct clk_hw *hw)
 	struct meson_clk_pll_data *pll = meson_clk_pll_data(clk);
 
 	/* Put the pll is in reset */
-	if (MESON_PARM_APPLICABLE(&pll->rst))
-		meson_parm_write(clk->map, &pll->rst, 1);
+	meson_clk_pll_reset(clk, pll, true);
 
 	/* Disable the pll */
 	meson_parm_write(clk->map, &pll->en, 0);
diff --git a/drivers/clk/meson/clk-pll.h b/drivers/clk/meson/clk-pll.h
index 949157fb7bf5..8384b75ae38d 100644
--- a/drivers/clk/meson/clk-pll.h
+++ b/drivers/clk/meson/clk-pll.h
@@ -29,6 +29,7 @@ struct pll_mult_range {
 
 #define CLK_MESON_PLL_ROUND_CLOSEST	BIT(0)
 #define CLK_MESON_PLL_NOINIT_ENABLED	BIT(1)
+#define CLK_MESON_PLL_RST_ACTIVE_LOW	BIT(2)
 
 struct meson_clk_pll_data {
 	struct parm en;

-- 
2.56.0

