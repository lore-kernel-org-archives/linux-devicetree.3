Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=209.85.215.169
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1794981361;
	b=3vYnZZ14dkLzccDBlYCG5Ph6IQWz6gZB2KujWm1xNuPCpVeYOPZTkUDw38ckHVwPNFNm
	 q8sKuSWFhSsBuoqae4B9GYrJiR54vaHaxiGOR49mwHnLgkiarKEHZLrkHbYHQl62A/b0Z
	 /xONuBvG8m0m+rKFJy7q5ShaJTzNc0OK9HkUnSzzffLM9SdZN1vE1yeYW9pfayE6VbH4U
	 5ZEcb9StJRgaPh8mgm2JuEUO8ANSxWF+QmD9D+cKkmxl9J8vwh25G9iHakvvC+TFXs5BV
	 TzdJk9cWUoKtPVz20mcXnJ4qVAqqKkjjAvFRmZpTVopkdJZKghNJSDKgZfKRkjeSQuA==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1794981361;
	h=DMARC-Filter:Received:DKIM-Signature:X-Google-DKIM-Signature:
	 X-Forwarded-Encrypted:X-Gm-Message-State:X-Gm-Gg:X-Received:Received:
	 From:Date:Subject:MIME-Version:Content-Type:Content-Transfer-Encoding:
	 Message-Id:References:In-Reply-To:To:Cc:X-Mailer:
	 X-Developer-Signature:X-Developer-Key;
	bh=iHpEgxPbFinlelTShydiqMdXL6WmYaYuO85mjvtFPkY=;
	b=R4UXrydwUZHT0kVcl2DcNDwcNlosRGqCk0oZ8vtzlyVhAUEpQbtVgmkaHLC/UECpGVNc
	 PwOThgSEp5/Djt/mWp9SAeDOQu44Qv6okh8QJcX2eoezkr6Dp9UDTaFcTyo3JhgXES9KP
	 9DAgyVh4hxgvHylWGtR/AZ+AXSzrWm+O3I4HJB6g4L/gqizNz5My1c8aoinSScGXHxvg+
	 0ssa9CnWyBkDgNrbjor235xalCaiOZwMh3cHBuWijzARO1C2abhUGGXfHHIzJ/L9ZlgWy
	 kddo6bHKiOSKwHynkVskJK9fhuMcrEhOHUju2SnuaL2de/glqv24gWpN/AveK6VGYyQ==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=gmail.com;
	spf=pass smtp.mailfrom=gmail.com;
	dkim=pass header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20260707 header.b=lkChkZT1;
	arc=none smtp.remote-ip=209.85.215.169
Received: from mail-pg1-f169.google.com (mail-pg1-f169.google.com [209.85.215.169])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id C8776606A330
	for <devicetree@vger.kernel.org>; Wed, 18 Nov 2026 05:56:00 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org C8776606A330
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20260707 header.b=lkChkZT1
Received: by mail-pg1-f169.google.com with SMTP id 41be03b00d2f7-cdac52511b3so33288a12.2
        for <devicetree@vger.kernel.org>; Tue, 17 Nov 2026 21:56:00 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20260707; t=1794981360; x=1795586160; darn=vger.kernel.org;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :content-type:mime-version:subject:date:from:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=iHpEgxPbFinlelTShydiqMdXL6WmYaYuO85mjvtFPkY=;
        b=lkChkZT1D7xLfbiqYrsn3OXmIzGQlqPz2ENGy23WFQZ3VyxduHQekV/Y0EOnot704X
         LqKHvhuj7zwWUrHOk5Zx5sOAemwhK8QESHP659RJbDByr0R/EV11/AXZh8JGWmtFN1v3
         S5MOQWzC9gBzwpUOGBHd60GUuxg1dg8mz0gdSOPmrcQM88vPQpixLyrt/o2A2q2wBV6T
         6hBiW/0TGjsmnWWgGxZteLeP6wW6HYisgSsyZGEqoHqXuWZ6fkk2Dy2rNwrBOESP4YiX
         l7qmsOxi4mNEwv7KRhXriV0oZWbvIJWj9Co5KrNFBhQemciie7vxdbRuy9hABJAYfn5y
         gWOw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1794981360; x=1795586160;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :content-type:mime-version:subject:date:from:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=iHpEgxPbFinlelTShydiqMdXL6WmYaYuO85mjvtFPkY=;
        b=jTsDjntKQxWmNCwhhPM/IJTM/Mf9szZezzGTZUBhHAAIIMvBKJa/QyLZ23JU5+2ssa
         rInYrys7gb0rXYgJWc2GYqm9iekln8vU77ZZcxuqxplHq+6pfjON6z4qU8lR0xQ1bppz
         MZHkwlHO0BZymtnQxshuL5YAA2XUACYjIyYAqBgOkPBCDCHH1ibVGxdmBpAa+l//LfkD
         BtxTJOnyNar5OlXW4U4M0c17mTLGe66eLaNnHeB5wtwGNDaoTG5GHwhmMRy9eS3M0yKC
         bkdupu0Ms6OD3wRYNd9c+SUJ//AFuh+llXipGXSBnIUIbpH4c3TYJJ5KrGXELLvDzSUN
         K9Ug==
X-Forwarded-Encrypted: i=1; AL+hErFd3sECgQRXRnshBeuOGi+iI9nJY8rh/FbZiZtZTb7Recb1lQCXeKHxSVTh5R+RDUiHALQuUF1mKwGy@vger.kernel.org
X-Gm-Message-State: APuU4Z+hAPzWt1uY42j6JPVY3YEbXwuCJkKJ7I5d//cspaC7oh6t0n1d
	+grjOl7DdTxwttEdSLeSxlIVrU+P9GKyxe5ofoRd3EjxRHMrvVb69Ids
X-Gm-Gg: AYBFou0mbiSZRlkYfQz9/30vfS/tnM7RhNIxlj03oOebm+PhfaOuOaCW+0tb1rmK68o
	b1m3oOKHqL1Dhlkum4nAsgSMtxMHZZdfNc4RwJ2F7mZgGK6PiOAZcHnlCxaShcWnw44OPNSS9y4
	1FlztkWitSjfMiHrWxJ5zNy2cmIaJP1rj4LkbbZKt751dz4tQd9TMHnlDCzEleDYqhKDW1rAQVf
	Mk3liSr9p3Ctck9wqcpzU29wUrRytYF+tzoi5P+6Z1fmxbOAME7jfBV+JxPn5XibFcDrhMjg3TU
	1cfp0pD3ZAfMoB6RkSrpYbN0W9HdyHQVp31IB15Y5cfnMNrzaWhTUufRS4J5k9cuOw5YYO0IzgZ
	+BU8mr1Guf/7ySYQGBE7BosTtFPLeJ370YaA/q2vngqFNgQfp3ahyKjQxaX9txEMyAuI3pqGlpK
	mPwT/uIs425OzvBWslXGqnvcjQjbpHr5h6vwzS2y/5cL36N50z0SUqOLdXuFHo7g3nZRfbQPK9C
	stxdDlrHbqZTobrGONaGauqXoSGbmZnqmBPJ1f1981bTf7Sbs3nEOTDKJLF/wADjLrYfzYlean8
	M61IEyE+0R+V94cLKxgB99qE+bBwxO4UFBNoY7EvOs2U8YTBLEh5wMZA54VCwJK610NM1sH4vsi
	4/CHyViRZ6enKIj46qKrR
X-Received: by 2002:a05:6300:6bc1:20b0:3ef:2f72:c7e5 with SMTP id adf61e73a8af0-3fe89100d9fmr1650543637.2.1794981359689;
        Tue, 17 Nov 2026 21:55:59 -0800 (PST)
Received: from [127.0.1.1] (211-23-39-77.hinet-ip.hinet.net. [211.23.39.77])
        by smtp.gmail.com with ESMTPSA id d2e1a72fcca58-8c5ca5bf959sm569563b3a.20.2026.11.17.21.55.55
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 17 Nov 2026 21:55:59 -0800 (PST)
From: Jason Yang <jason98166@gmail.com>
Date: Wed, 18 Nov 2026 13:55:17 +0800
Subject: [PATCH v7 4/9] phy: rockchip-samsung-dcphy: Always write the
 rate-dependent registers
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
Message-Id: <20261118-dcphy-rx-v1-v7-4-8de1adac3a74@gmail.com>
References: <20261118-dcphy-rx-v1-v7-0-8de1adac3a74@gmail.com>
In-Reply-To: <20261118-dcphy-rx-v1-v7-0-8de1adac3a74@gmail.com>
To: Vinod Koul <vkoul@kernel.org>, 
 Neil Armstrong <neil.armstrong@linaro.org>, 
 Manivannan Sadhasivam <mani@kernel.org>, Rob Herring <robh@kernel.org>, 
 Krzysztof Kozlowski <krzk+dt@kernel.org>, 
 Conor Dooley <conor+dt@kernel.org>, Heiko Stuebner <heiko@sntech.de>, 
 Guochun Huang <hero.huang@rock-chips.com>, 
 Philipp Zabel <p.zabel@pengutronix.de>
Cc: Michael Riesch <michael.riesch@collabora.com>, 
 Sebastian Reichel <sebastian.reichel@collabora.com>, 
 Bryan O'Donoghue <bryan.odonoghue@linaro.org>, 
 linux-phy@lists.infradead.org, devicetree@vger.kernel.org, 
 linux-arm-kernel@lists.infradead.org, linux-rockchip@lists.infradead.org, 
 linux-kernel@vger.kernel.org, Jason Yang <jason98166@gmail.com>, 
 Quentin Schulz <quentin.schulz@cherry.de>
X-Mailer: b4 0.16.0
X-Developer-Signature: v=1; a=ed25519-sha256; t=1794981338; l=2791;
 i=jason98166@gmail.com; s=20260721; h=from:subject:message-id;
 bh=jOoW884/QWxzl0iQgg361AUaX2tfS/RGrsDEUvgeOSs=;
 b=VkOIadDSCSCWfnuqRaor/8P7xZ2XT4u0wDDTi479M168RRkokCGNAss3oSGd4blzKFbElD6Bu
 whowWKt+GmhDXy0qQNwzix6IZpQLJ7M65vCrX2H2rmVHBAv8R8sC34y
X-Developer-Key: i=jason98166@gmail.com; a=ed25519;
 pk=xQmD001Q/ooHl39PxyQtusbUQmgbOsSfpFryRVWZ/k4=

The lane timing init functions write DPHY_MC_ANA_CON1, the four data
lane ANA_CON1 registers and DPHY_MC_DESKEW_CON0 only above a data
rate threshold, and the registers have to be zero below it [1].

Today the APB reset at the start of every power_on provides the zero.

A later change moves that reset to runtime resume, so a power_on at a
lower rate after a higher one would keep the old values.

Write the registers on every power_on, with zero below the threshold.

[1] RK3588 TRM: sections 22.4.2 (reset values) and 22.4.3
    (DPHY_MC_ANA_CON1, DPHY_MC_DESKEW_CON0)

Signed-off-by: Jason Yang <jason98166@gmail.com>
Reviewed-by: Michael Riesch <michael.riesch@collabora.com>
Tested-by: Quentin Schulz <quentin.schulz@cherry.de> # RK3588 Tiger CSI1 2-lane IMX219, CSI0 2-lane OV5675+DSI
---
 drivers/phy/rockchip/phy-rockchip-samsung-dcphy.c | 24 +++++++++++++++--------
 1 file changed, 16 insertions(+), 8 deletions(-)

diff --git a/drivers/phy/rockchip/phy-rockchip-samsung-dcphy.c b/drivers/phy/rockchip/phy-rockchip-samsung-dcphy.c
index ce1bc62497c5..7a009d87a665 100644
--- a/drivers/phy/rockchip/phy-rockchip-samsung-dcphy.c
+++ b/drivers/phy/rockchip/phy-rockchip-samsung-dcphy.c
@@ -1228,7 +1228,10 @@ samsung_mipi_dphy_clk_lane_timing_init(struct samsung_mipi_dcphy *samsung)
 	regmap_write(samsung->regmap, DPHY_MC_ANA_CON0, val);
 
 	if (lane_hs_rate >= 4500)
-		regmap_write(samsung->regmap, DPHY_MC_ANA_CON1, 0x0001);
+		val = 0x0001;
+	else
+		val = 0;
+	regmap_write(samsung->regmap, DPHY_MC_ANA_CON1, val);
 
 	val = 0;
 	/*
@@ -1259,7 +1262,10 @@ samsung_mipi_dphy_clk_lane_timing_init(struct samsung_mipi_dcphy *samsung)
 	 * under 1.5Gbps or equal to 1.5Gbps.
 	 */
 	if (lane_hs_rate > 1500)
-		regmap_write(samsung->regmap, DPHY_MC_DESKEW_CON0, 0x9cb1);
+		val = 0x9cb1;
+	else
+		val = 0;
+	regmap_write(samsung->regmap, DPHY_MC_DESKEW_CON0, val);
 }
 
 static void
@@ -1284,12 +1290,14 @@ samsung_mipi_dphy_data_lane_timing_init(struct samsung_mipi_dcphy *samsung)
 	regmap_write(samsung->regmap, COMBO_MD2_ANA_CON0, val);
 	regmap_write(samsung->regmap, DPHY_MD3_ANA_CON0, val);
 
-	if (lane_hs_rate >= 4500) {
-		regmap_write(samsung->regmap, COMBO_MD0_ANA_CON1, 0x0001);
-		regmap_write(samsung->regmap, COMBO_MD1_ANA_CON1, 0x0001);
-		regmap_write(samsung->regmap, COMBO_MD2_ANA_CON1, 0x0001);
-		regmap_write(samsung->regmap, DPHY_MD3_ANA_CON1, 0x0001);
-	}
+	if (lane_hs_rate >= 4500)
+		val = 0x0001;
+	else
+		val = 0;
+	regmap_write(samsung->regmap, COMBO_MD0_ANA_CON1, val);
+	regmap_write(samsung->regmap, COMBO_MD1_ANA_CON1, val);
+	regmap_write(samsung->regmap, COMBO_MD2_ANA_CON1, val);
+	regmap_write(samsung->regmap, DPHY_MD3_ANA_CON1, val);
 
 	val = 0;
 	/*

-- 
2.43.0

