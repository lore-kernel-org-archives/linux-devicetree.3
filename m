Received: from mail-wr1-f45.google.com (mail-wr1-f45.google.com [209.85.221.45])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 255BA4071C5
	for <devicetree@vger.kernel.org>; Mon, 29 Jun 2026 12:42:33 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.221.45
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1782736955; cv=none; b=Qwg1So3wBHA4zQDSlIqeZIEVAPfDh9MPYuxewBkpd01Tw7G62VfHGGsAJoufoZkwebkgX7FzoVtYT4rRk5mtrwKilDYZ0e6USEcUKwMW0P8q4ItMv94p4hLLBHDEt8hMIuDY8LSRW6Kh7S1V3G+wkUef1qAd4o20EW0DWQlaAxM=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1782736955; c=relaxed/simple;
	bh=QIDVb4v67kXTxypoR7T1A+2qrv5ugJGiyI5f/4IznIg=;
	h=From:Date:Subject:MIME-Version:Content-Type:Message-Id:References:
	 In-Reply-To:To:Cc; b=OrD9efCkQx5wsNibJG8JuVWkz9dmeXxOjD9FsIs1rvGu0e91eSZKrO0HrQSkt+SRnVZjaBBp0X6lxGTQvE4ICfnfGDauEpgvuNHKfRoIIzzdAip8NrMHAY32jNMAKRRuI3Ojlb6Os2jJFodJt5NW4iGxMntxl75tkuFjnKqlj8w=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=baylibre.com; spf=pass smtp.mailfrom=baylibre.com; dkim=pass (2048-bit key) header.d=baylibre.com header.i=@baylibre.com header.b=mTCwPFgA; arc=none smtp.client-ip=209.85.221.45
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=baylibre.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=baylibre.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=baylibre.com header.i=@baylibre.com header.b="mTCwPFgA"
Received: by mail-wr1-f45.google.com with SMTP id ffacd0b85a97d-473dc4cf238so557219f8f.3
        for <devicetree@vger.kernel.org>; Mon, 29 Jun 2026 05:42:33 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=baylibre.com; s=google; t=1782736952; x=1783341752; darn=vger.kernel.org;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :mime-version:subject:date:from:from:to:cc:subject:date:message-id
         :reply-to;
        bh=p9gMufAEHeq0Shwigbm5Xg4KyFFoCIavO1i9vrLQZfU=;
        b=mTCwPFgA9GSon7eNHOkoqMDLP50YuDjY8dBTpzJ27uw59+VUFHRqESqc/mHqbbQv3n
         034/LNeHysOMqQS5FNBtWtk0y9L6+q1ghIAQTh2nBKOdgnY0EsEGQzqc33LMh1pocYAE
         fB6/WAqGQsysGf0NXRxh2lEQeYKEyDGxLMEGF+BCFoKHutEIP1pL8NtNN7BYE8p4ohGd
         NSzAcodLyfRU0eep6ER1o8qmCGub9Hmme2CM3O1R3Ra8w7oLVoTtgg6gtfrOlaj0djnJ
         9vgp1RmgKnlKAN8v95ZWKdiuQnRCdBlp0EzuBLctimSecs5W0hxHWRPeUbSMEVeeXrrQ
         HATw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1782736952; x=1783341752;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :mime-version:subject:date:from:x-gm-gg:x-gm-message-state:from:to
         :cc:subject:date:message-id:reply-to;
        bh=p9gMufAEHeq0Shwigbm5Xg4KyFFoCIavO1i9vrLQZfU=;
        b=rO5J+ObLBe1wW/LngKKM4jZu0qyIa//6JI0TWsa7xYVDbMBCgdnxPbVspiIvi1mxdY
         /Z/jH28ZHxnn/AQF9+pWPc39cJGtvyQpLFLWxZGVIzNUGmuucYYreFUpgp49p8WzZaC5
         R+FtUNv5e35/JenU98yfPPvCITjRP+8ynaaHa/SIb0ozJV31oJVRHjve1M9Xx6OIPtjg
         IihP0TGZNpfGmtEiBmXMZ07gz5pCrSxinOd++jKepJcZffsHH2AK+QJsDN200n6endhX
         hLlfG0Nj/HchbxOwXnUYYZ6xe6NNU8bFUkzu4+209ht9BDLgj69pztP5SRiHw6mzAOf9
         hz6Q==
X-Forwarded-Encrypted: i=1; AFNElJ8u2uDoJPJSXRksE3t/XNlIsVny7+yY6GYsO5K/nzRjAj0dzK879VsLMaAfjwxzQKwaTkfFkawFGCbr@vger.kernel.org
X-Gm-Message-State: AOJu0YyH4fbIOev+kC/Pu2+vslewghO9n3xY1O0qpin0GZV2iooiCskD
	t1h8TNT0Wvu7BOtGmIv1hMde9IAfEpjbgDX0HOV75xG0yd7r3jR3Oo+HcCwglRcsSNU=
X-Gm-Gg: AfdE7clE1qxIe8V5Ao6yxpRN2I6lWU/RK8kouu9DpE7iiSLFvKZn+ON/YNDg0w76ux3
	XWL4XlIQmjGMOlBltuKzyMd6dfWl+7rAtyRXUtFKiwP8DUDBojQe8/BNLUjQKXzAE5vHL5vpGG2
	/qqqO5Wjr8dxDym8Y9P1DwX9s7RSTAjDam8Rp+epYd2iluVfSRTkeDh5YiyKIr3R2vdGsQnRIuR
	nPRqqIduEhj+GU18bXsQUuGudFYwhzarxD6e9j/4lXWpt1txMkadI/3fJs2o8LN2VduLD9FVV0R
	HfcZ3TecjalxAmgHMy6/aiW5iH+ULHdB3g3tyLfE3a/L3Nk+961b6RDdZucynC0nyduHwdQz2Qx
	Cju/G5IMcac6Xz03nT2jITtWiJORkqZl2NfuMrKcGebHUIrlWGXvsGrzs8+QDZ+tSQNMOqTNMaW
	2C/jR3ZIjFHYM=
X-Received: by 2002:a05:600c:8117:b0:493:a607:f3b8 with SMTP id 5b1f17b1804b1-493b71413demr11373165e9.0.1782736952553;
        Mon, 29 Jun 2026 05:42:32 -0700 (PDT)
Received: from localhost ([2a01:e0a:3c5:5fb1:1d21:f5d5:2d3c:23a7])
        by smtp.gmail.com with UTF8SMTPSA id ffacd0b85a97d-4726b76e6f8sm19182406f8f.13.2026.06.29.05.42.31
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 29 Jun 2026 05:42:32 -0700 (PDT)
From: Jerome Brunet <jbrunet@baylibre.com>
Date: Mon, 29 Jun 2026 14:42:06 +0200
Subject: [PATCH v2 2/6] clk: sunxi-ng: sun6i-rtc: clean up DT usage
Precedence: bulk
X-Mailing-List: devicetree@vger.kernel.org
List-Id: <devicetree.vger.kernel.org>
List-Subscribe: <mailto:devicetree+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:devicetree+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20260629-a733-rtc-v2-2-7b72112784f8@baylibre.com>
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
X-Developer-Signature: v=1; a=openpgp-sha256; l=2634; i=jbrunet@baylibre.com;
 h=from:subject:message-id; bh=QIDVb4v67kXTxypoR7T1A+2qrv5ugJGiyI5f/4IznIg=;
 b=owEBbQKS/ZANAwAKAeb8Dxw38tqFAcsmYgBqQmgu5DnB+eudiTNdZyR8LEcTDWwt/TL8OLgi8
 mOLm0C8spKJAjMEAAEKAB0WIQT04VmuGPP1bV8btxvm/A8cN/LahQUCakJoLgAKCRDm/A8cN/La
 hX1QD/95lLPuPyszhXE8d/DJws2q5hAdSAN/+TLFua8a1fFg/xdl1HEmX5SP5l1C7lgaka8FqIm
 rMRKHh0oeizypSTZFQfWkyqPsR8pSx3LiOiKOXwNykN+bmJ4oQqIYKd9LQjKyiFMSUxSmmUbGMH
 hGqFxT6yVW1I76xgw5WCS8tCzdSmePBXggO3hUvLqmE4DU+V/DEokJdKNwmD4zNfxoefthIRnOh
 T9bzIFPN2EiYH1D8oXvkF+GFLqbH6Sl6zpNPLKkzc7HE4fFxE5EY24G1u3VaE0nUlcLn5vEH5PI
 6TrdXRzss5NYcXu6w8m4OnZoUzzSWe6fPy74ExMOrIKH8vUXKsbt632rhR38x7JpO4av+CVwxFv
 XC3sb94OTpYo4I2r5k1uZZz80CEy1BxxcnOSgiDpwWW7dNzsYwivpa8U1v4LrTjX8k5xFILIIDQ
 tjHCt0iDk9qctrHojzZZqsVQdgHiJMY1UerL/4TTdz8NAFah87tu4+TCs3utPCJ3ZRjqAZgAncd
 8iPsOkHBMvKawDAxy82FyLWptvch17SXKekO88Tly3x6sMxR516cMKY04ti/Xm0zJWO+Fyd9cUU
 LG+hzHdrg22dHqqfGNZ4+3ee8nNSvIpsdv1jXwZTeN4oqSvpOsjLKdBNN6Ukri5WQbGGTzKH35F
 WdjsUrDbyv+7IxQ==
X-Developer-Key: i=jbrunet@baylibre.com; a=openpgp;
 fpr=F29F26CF27BAE1A9719AE6BDC3C92AAF3E60AED9

With sun6i-rtc compatible devices, the "ext-osc32k" clock input
is optional for the devices that support this input (r329 and onward).

Probably preparing for older SoC support, the driver does something funny
when parsing DT. It check if "ext-osc32k" is present in the clock-names and
if it is not, it uses the first clock as "ext-osc32k". This clock will
actually be the rtc bus clock so what the driver does is wrong.

At the moment, the driver does not support the older SoCs that would have
an external 32k clock provided on index #0 so just remove this quirk.

Signed-off-by: Jerome Brunet <jbrunet@baylibre.com>
---
 drivers/clk/sunxi-ng/ccu-sun6i-rtc.c | 23 +++--------------------
 1 file changed, 3 insertions(+), 20 deletions(-)

diff --git a/drivers/clk/sunxi-ng/ccu-sun6i-rtc.c b/drivers/clk/sunxi-ng/ccu-sun6i-rtc.c
index f6bfeba009e8..0f528bfaed00 100644
--- a/drivers/clk/sunxi-ng/ccu-sun6i-rtc.c
+++ b/drivers/clk/sunxi-ng/ccu-sun6i-rtc.c
@@ -191,10 +191,8 @@ static struct ccu_common iosc_32k_clk = {
 					 CLK_GET_RATE_NOCACHE),
 };
 
-static const struct clk_hw *ext_osc32k[] = { NULL }; /* updated during probe */
-
-static SUNXI_CCU_GATE_HWS(ext_osc32k_gate_clk, "ext-osc32k-gate",
-			  ext_osc32k, 0x0, BIT(4), 0);
+static SUNXI_CCU_GATE_FW(ext_osc32k_gate_clk, "ext-osc32k-gate",
+			  "ext-osc32k", 0x0, BIT(4), 0);
 
 static const struct clk_hw *osc32k_parents[] = {
 	&iosc_32k_clk.hw,
@@ -352,7 +350,6 @@ MODULE_DEVICE_TABLE(of, sun6i_rtc_ccu_match);
 int sun6i_rtc_ccu_probe(struct device *dev, void __iomem *reg)
 {
 	const struct sun6i_rtc_match_data *data;
-	struct clk *ext_osc32k_clk = NULL;
 	const struct of_device_id *match;
 
 	/* This driver is only used for newer variants of the hardware. */
@@ -363,21 +360,7 @@ int sun6i_rtc_ccu_probe(struct device *dev, void __iomem *reg)
 	data = match->data;
 	have_iosc_calibration = data->have_iosc_calibration;
 
-	if (data->have_ext_osc32k) {
-		const char *fw_name;
-
-		/* ext-osc32k was the only input clock in the old binding. */
-		fw_name = of_property_present(dev->of_node, "clock-names")
-			? "ext-osc32k" : NULL;
-		ext_osc32k_clk = devm_clk_get_optional(dev, fw_name);
-		if (IS_ERR(ext_osc32k_clk))
-			return PTR_ERR(ext_osc32k_clk);
-	}
-
-	if (ext_osc32k_clk) {
-		/* Link ext-osc32k-gate to its parent. */
-		*ext_osc32k = __clk_get_hw(ext_osc32k_clk);
-	} else {
+	if (!data->have_ext_osc32k) {
 		/* ext-osc32k-gate is an orphan, so do not register it. */
 		sun6i_rtc_ccu_hw_clks.hws[CLK_EXT_OSC32K_GATE] = NULL;
 		osc32k_init_data.num_parents = 1;

-- 
2.47.3

