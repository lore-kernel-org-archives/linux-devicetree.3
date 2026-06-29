Received: from mail-wm1-f41.google.com (mail-wm1-f41.google.com [209.85.128.41])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 7A35C407574
	for <devicetree@vger.kernel.org>; Mon, 29 Jun 2026 12:42:36 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.128.41
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1782736958; cv=none; b=qiR8FD8+0aYAe+yw1goJvdZz1BATgwU6GrY7Gm74+BadGH+uwx/Emk1DjCGPBLEn/CBE6GKNmuIz27ezOW9KQku7st5g+DB45hVXcrx3Aj3tP1O3Rfu7tj27uSa7HQ/qPzIp7NXfRc2DzhOSZJTOW1q8WgDVfUYwN2c3o/zaEgI=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1782736958; c=relaxed/simple;
	bh=CMXkvBKW25otLd9mL3jHlLeuFI1KrOKFlpzgrTR57uM=;
	h=From:Date:Subject:MIME-Version:Content-Type:Message-Id:References:
	 In-Reply-To:To:Cc; b=B7OpZsVYV+I65Xqp6R8gkm+a3yhN79DZkI5vOhNmqdmUfuuR6Tte7k9oDFbGjWqFcrfArvGp2KN/o9LlqmwXKqVO5+EUHE8drMJ6rak9TQCWE8Y5UJusVkRBaAE0ExG1SdFNkIqRc5RabGWsdJlyqZW9ibS8lB1YQc/pElU+7gQ=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=baylibre.com; spf=pass smtp.mailfrom=baylibre.com; dkim=pass (2048-bit key) header.d=baylibre.com header.i=@baylibre.com header.b=kRxnQMEb; arc=none smtp.client-ip=209.85.128.41
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=baylibre.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=baylibre.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=baylibre.com header.i=@baylibre.com header.b="kRxnQMEb"
Received: by mail-wm1-f41.google.com with SMTP id 5b1f17b1804b1-4926f8e02e8so19865485e9.0
        for <devicetree@vger.kernel.org>; Mon, 29 Jun 2026 05:42:36 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=baylibre.com; s=google; t=1782736955; x=1783341755; darn=vger.kernel.org;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :mime-version:subject:date:from:from:to:cc:subject:date:message-id
         :reply-to;
        bh=YhNzJtjd4g7I67fgHg1GjtzbDZpsXvz5OahsTzru97E=;
        b=kRxnQMEbMQ82qNV/zF3MZOVNW0+35PoZwyiRTnmV3f57ZThweaD7slku01XV5t6H9i
         bZS2vHf/FpMXeUIgB0ODc6dwBp45lzDHJ/61F/Yi4KFksRH6+iRiJnVWjdCk8Gl8W94i
         U1hTC46d7RRpNedze1ir/N38ANv88hF4ERref3np7S8xGdUJ8cuYDIDJGuXuoi85qyFc
         hezvQ4Yz6/bJbXwMC6DXPlcc59CPFB0LdmwEGbzKPFzrrTkfPHEN7aFwvf7XQ9cPrKc8
         Uy6y32Z75ub0UpFkdeAre0kuA5rMydkAGp4GcJrLvLIqtl7FH7x2e09WFBK+2zJO/AGP
         F4ug==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1782736955; x=1783341755;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :mime-version:subject:date:from:x-gm-gg:x-gm-message-state:from:to
         :cc:subject:date:message-id:reply-to;
        bh=YhNzJtjd4g7I67fgHg1GjtzbDZpsXvz5OahsTzru97E=;
        b=reirskq1adsQRD347kK06n/VzrEAt7a1g+XcXCxYGULCnGpZYwUf2HBaf0P8d4ipUc
         6Na5lsyg+VyKadOpZk2gYkCNFf+tEs5ASJ1WdvtcHbgSd8DjjXsAbWzZaAdlKIeNaoFH
         dVUsKLbdFVFcv+4mYOsfd7QUqUvwSv8MXcAGLiWdKWfVjtFcWSyfwOVy6f3f3qAd7Cyy
         U6rBi2v+GTVPewcccUz/jUp/ZiWRTXHTz0FKMyHHeCKQFGoBthy933o2RjsskJt3tYkK
         pPS1/z/pQfL/U9Am1l41tTbrzLV2lLoPey4KerhRceRytE8t0n0W2AyX7PUkv6z0u7P3
         GwiQ==
X-Forwarded-Encrypted: i=1; AFNElJ8nG9kJg8BG1YlTeqalFuZyOfB2y88WwNjMZNGjMsPTwhBWs1aVFRkONtfTc2Ns1G0apUrCw92dqwHN@vger.kernel.org
X-Gm-Message-State: AOJu0YytKWCW31Hs+SA6KH2D+J5nJvE3TPGgJ8OCpwhPsLZpmR4jamAh
	7p/CgMX3zk1QGQn3fdJFEgmuWClF2BousjwopTr5PweYwzsQxxs2LlC5D0xndyIb1ak=
X-Gm-Gg: AfdE7clwem5eB+bHjeKjxhLqdW82HTpjJYgesJrsr0/EWPpL384uGyY66FeXO2jkZdl
	23mtBR8veJr3lmZvxXncicICo+PA3IwagEbdcsb8OvhwBSG35BunWjEQgXdal848yumYR9PYsR+
	QIf2WV1kneFg2qGDg2iWBbihKZIYISB0iuANQLjzFgshiAp5Dld05fPS+tjKyK7edHvyoTxkjkF
	TPoRP1T4oQ9VR3B05fVi+2f70NMpQwYoCF85RRKl0Y3JPokgp3viljdt/Z0sj9cNlFa9Oi+VDVF
	R3fr9Hg3kB2P/dxOJ0VGPBqEJQKLaSObqndRaP6Uzhj/rCwcStzBthVwMrlqW8ZBfreIL8VNnVR
	nl5zSgRUqt5Vz9pTVXbB6pQ2Fctznd+2be7vig6VwtKHYj+2asJnTChM6vSkpT5zyiZ6avSafWc
	oH5LSHY1VkYt8=
X-Received: by 2002:a05:600c:5487:b0:493:a623:d090 with SMTP id 5b1f17b1804b1-493a623d54emr88606515e9.10.1782736954582;
        Mon, 29 Jun 2026 05:42:34 -0700 (PDT)
Received: from localhost ([2a01:e0a:3c5:5fb1:1d21:f5d5:2d3c:23a7])
        by smtp.gmail.com with UTF8SMTPSA id ffacd0b85a97d-46f8d6f10absm43899161f8f.5.2026.06.29.05.42.34
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 29 Jun 2026 05:42:34 -0700 (PDT)
From: Jerome Brunet <jbrunet@baylibre.com>
Date: Mon, 29 Jun 2026 14:42:07 +0200
Subject: [PATCH v2 3/6] clk: sunxi-ng: sun6i-rtc: Add feature bit for IOSC
 calibration
Precedence: bulk
X-Mailing-List: devicetree@vger.kernel.org
List-Id: <devicetree.vger.kernel.org>
List-Subscribe: <mailto:devicetree+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:devicetree+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20260629-a733-rtc-v2-3-7b72112784f8@baylibre.com>
References: <20260629-a733-rtc-v2-0-7b72112784f8@baylibre.com>
In-Reply-To: <20260629-a733-rtc-v2-0-7b72112784f8@baylibre.com>
To: Junhui Liu <junhui.liu@pigmoral.tech>, 
 Alexandre Belloni <alexandre.belloni@bootlin.com>, 
 Rob Herring <robh@kernel.org>, Krzysztof Kozlowski <krzk+dt@kernel.org>, 
 Conor Dooley <conor+dt@kernel.org>, Chen-Yu Tsai <wens@kernel.org>, 
 Jernej Skrabec <jernej.skrabec@gmail.com>, 
 Samuel Holland <samuel@sholland.org>, 
 Michael Turquette <mturquette@baylibre.com>, 
 Stephen Boyd <sboyd@kernel.org>, Maxime Ripard <mripard@kernel.org>
Cc: linux-rtc@vger.kernel.org, devicetree@vger.kernel.org, 
 linux-arm-kernel@lists.infradead.org, linux-sunxi@lists.linux.dev, 
 linux-kernel@vger.kernel.org, linux-clk@vger.kernel.org, 
 Jerome Brunet <jbrunet@baylibre.com>
X-Mailer: b4 0.15.2
X-Developer-Signature: v=1; a=openpgp-sha256; l=3514; i=jbrunet@baylibre.com;
 h=from:subject:message-id; bh=qw1svrvYiRbA39e1tTAaC53/r39CysR7OZmJk6EA0P8=;
 b=owEBbQKS/ZANAwAKAeb8Dxw38tqFAcsmYgBqQmguZlIuTKrBwsDM7sE3NJOiNO0633kiU5jvw
 iqmqtZQIPGJAjMEAAEKAB0WIQT04VmuGPP1bV8btxvm/A8cN/LahQUCakJoLgAKCRDm/A8cN/La
 hVowEACbP1RgJeS6oBE7ZfdUCvyvRI5L1vmoVseCOL6b9LQ+Tk6FNRtcrw63NqYvazVySfNE3L9
 IElyTcJyOiet2Y//r9bS9tHvlsPRAGsGNudc47AIrhEB0xj+NWaA7vOy7+vB6P7yF+HmmAJZDPP
 Qj6m5ooIyFzyPpORnjN9fKeC43a3DDed2F6wPGCng3GkNO6SWNfMYkCHSdi9oXpIw6Xbz1V6Ckg
 7d8XtcOzdu4XAv5QMghkEuwjxLgD8iMEgLUx7R01RE0NVn2h+yHKOmGovBWFrKG6+yToDxHiY+u
 Ly6xRyt0rAYmtFCymRKEURq5j13T5FBOWS75ZjtoIsbdiEnsd6h+wuAm43sHNCIzkFUlW3Rvic7
 i4xiS6fnlrKm6oPE46TR4QHptzGgAEPuuIyE2b7RwW6WI3vEVXl4DBa1B1cZ+dFvgp7Dy8mtq2a
 VIrHKq/a4KDYOpRpMioC8BaVoRTCtpIlMbOGxTuAg//xyLVA8xVJZ3x3bOUigiNdkfxUE4zjbDG
 gOUNewajibt80USpU8Dd42aX3AoTHHAwErV8QOhBA67pf5spWQYZ/IH9NymwqWqpvk2ftCX+pfF
 hBZqiqDzoq2+utsG0Xt7/d9OH41U1qohcK6T/VeSRdyGSTABkFfpgEBxgTL33d/TXiloHWohvfl
 Wn+LMvsA0AiuzZw==
X-Developer-Key: i=jbrunet@baylibre.com; a=openpgp;
 fpr=F29F26CF27BAE1A9719AE6BDC3C92AAF3E60AED9

From: Junhui Liu <junhui.liu@pigmoral.tech>

The sun6i-rtc CCU driver currently uses a global static variable to
denote whether calibration is supported, which makes IOSC operations
tightly coupled to this file.

Convert this into a feature bit to decouple the logic. This allows the
IOSC clock code to be moved into a shared module for reuse by other SoCs.

Signed-off-by: Junhui Liu <junhui.liu@pigmoral.tech>
Signed-off-by: Jerome Brunet<jbrunet@baylibre.com>
---
 drivers/clk/sunxi-ng/ccu-sun6i-rtc.c | 17 +++++++++--------
 drivers/clk/sunxi-ng/ccu_common.h    |  1 +
 2 files changed, 10 insertions(+), 8 deletions(-)

diff --git a/drivers/clk/sunxi-ng/ccu-sun6i-rtc.c b/drivers/clk/sunxi-ng/ccu-sun6i-rtc.c
index 0f528bfaed00..b24c8b196e66 100644
--- a/drivers/clk/sunxi-ng/ccu-sun6i-rtc.c
+++ b/drivers/clk/sunxi-ng/ccu-sun6i-rtc.c
@@ -52,8 +52,6 @@ struct sun6i_rtc_match_data {
 	u8				osc32k_fanout_nparents;
 };
 
-static bool have_iosc_calibration;
-
 static int ccu_iosc_enable(struct clk_hw *hw)
 {
 	struct ccu_common *cm = hw_to_ccu_common(hw);
@@ -80,7 +78,7 @@ static unsigned long ccu_iosc_recalc_rate(struct clk_hw *hw,
 {
 	struct ccu_common *cm = hw_to_ccu_common(hw);
 
-	if (have_iosc_calibration) {
+	if (cm->features & CCU_FEATURE_IOSC_CALIBRATION) {
 		u32 reg = readl(cm->base + IOSC_CLK_CALI_REG);
 
 		/*
@@ -119,7 +117,7 @@ static int ccu_iosc_32k_prepare(struct clk_hw *hw)
 	struct ccu_common *cm = hw_to_ccu_common(hw);
 	u32 val;
 
-	if (!have_iosc_calibration)
+	if (!(cm->features & CCU_FEATURE_IOSC_CALIBRATION))
 		return 0;
 
 	val = readl(cm->base + IOSC_CLK_CALI_REG);
@@ -134,7 +132,7 @@ static void ccu_iosc_32k_unprepare(struct clk_hw *hw)
 	struct ccu_common *cm = hw_to_ccu_common(hw);
 	u32 val;
 
-	if (!have_iosc_calibration)
+	if (!(cm->features & CCU_FEATURE_IOSC_CALIBRATION))
 		return;
 
 	val = readl(cm->base + IOSC_CLK_CALI_REG);
@@ -148,7 +146,7 @@ static unsigned long ccu_iosc_32k_recalc_rate(struct clk_hw *hw,
 	struct ccu_common *cm = hw_to_ccu_common(hw);
 	u32 val;
 
-	if (have_iosc_calibration) {
+	if (cm->features & CCU_FEATURE_IOSC_CALIBRATION) {
 		val = readl(cm->base + IOSC_CLK_CALI_REG);
 
 		/* Assume the calibrated 32k clock is accurate. */
@@ -167,7 +165,7 @@ static unsigned long ccu_iosc_32k_recalc_accuracy(struct clk_hw *hw,
 	struct ccu_common *cm = hw_to_ccu_common(hw);
 	u32 val;
 
-	if (have_iosc_calibration) {
+	if (cm->features & CCU_FEATURE_IOSC_CALIBRATION) {
 		val = readl(cm->base + IOSC_CLK_CALI_REG);
 
 		/* Assume the calibrated 32k clock is accurate. */
@@ -358,7 +356,10 @@ int sun6i_rtc_ccu_probe(struct device *dev, void __iomem *reg)
 		return 0;
 
 	data = match->data;
-	have_iosc_calibration = data->have_iosc_calibration;
+	if (data->have_iosc_calibration) {
+		iosc_clk.features |= CCU_FEATURE_IOSC_CALIBRATION;
+		iosc_32k_clk.features |= CCU_FEATURE_IOSC_CALIBRATION;
+	}
 
 	if (!data->have_ext_osc32k) {
 		/* ext-osc32k-gate is an orphan, so do not register it. */
diff --git a/drivers/clk/sunxi-ng/ccu_common.h b/drivers/clk/sunxi-ng/ccu_common.h
index bbec283b9d99..d9dc24ad5503 100644
--- a/drivers/clk/sunxi-ng/ccu_common.h
+++ b/drivers/clk/sunxi-ng/ccu_common.h
@@ -21,6 +21,7 @@
 #define CCU_FEATURE_CLOSEST_RATE	BIT(9)
 #define CCU_FEATURE_DUAL_DIV		BIT(10)
 #define CCU_FEATURE_UPDATE_BIT		BIT(11)
+#define CCU_FEATURE_IOSC_CALIBRATION	BIT(12)
 
 /* MMC timing mode switch bit */
 #define CCU_MMC_NEW_TIMING_MODE		BIT(30)

-- 
2.47.3

