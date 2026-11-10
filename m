Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=74.125.82.177
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1794298711;
	b=IFTCymRELz03P7LItATW3KFhMmUago8yVf9O18mz2kOHQ99DaMELwvQNlEBuVRpiE36d
	 pgexpL8BZsHnTxMLTCOQuCq5/NR0ajJA2z4HdmpkV8IBHBr3lH17MpZBTBLvh51LdtUVU
	 By2uhSO9b1af/SVR3Z5SM7CKK0a5MyZo7Ha2j+DBoIxyDX8vadua7uRvXC5exHSZ+fg2U
	 WNynB/2Kd5PX+mCNb5LwDarwzqRYnSpheNDGaO/tpP4ZrmI7vM4gnKBiJaDhb+H3yMkI5
	 JPdm8s207BNSqc2AMil5XVX6hM9Y/wjTO+Ra8Sq30XS3Ioo77UZHM56ZXr2B5T94IaA==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1794298711;
	h=DMARC-Filter:Received:DKIM-Signature:X-Google-DKIM-Signature:
	 X-Forwarded-Encrypted:X-Gm-Message-State:X-Gm-Gg:X-Received:Received:
	 From:Date:Subject:MIME-Version:Content-Type:Content-Transfer-Encoding:
	 Message-Id:References:In-Reply-To:To:Cc:X-Mailer:
	 X-Developer-Signature:X-Developer-Key;
	bh=/CKr1kEi8VZLmxn0omdbiYtt+CDZQCwiRpNUGKV8mro=;
	b=LqN2LBKa4RanyH0Ouewt8Dm+MTJBaLyGhpv9Xq9F+Tcd9FfE8BhSDBAochtrrz/JCcga
	 miBmTBoH7H7qGNpobjdIfdmNId6qDfObSJ5hRcrrJoHgbhFSBmIy2SnQS4fEsx0Eslv5Y
	 f13z5Q+e6BKQrpem9w0crg7Job/sTma9Mj/uljszbDKJRqa/SytA/IuHyQa8Kt+oIYyRG
	 /Tr1NONZUABD8dQDoXQwy2uSXC1URIoOWxpOjkgGiUMMJ0ucQo6/XP8qg6kmYBxqIuxry
	 a/mVIbOmAC4f3FqlIlh8TZCf5doIgw3tyZa9C9T6kUhTsP+SryqN2OKvK4OMA6FVz2Q==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=gmail.com;
	spf=pass smtp.mailfrom=gmail.com;
	dkim=pass header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20260707 header.b=RKnu0IJK;
	arc=none smtp.remote-ip=74.125.82.177
Received: from mail-dy1-f177.google.com (mail-dy1-f177.google.com [74.125.82.177])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 1184660A2601
	for <devicetree@vger.kernel.org>; Tue, 10 Nov 2026 08:18:30 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org 1184660A2601
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20260707 header.b=RKnu0IJK
Received: by mail-dy1-f177.google.com with SMTP id 5a478bee46e88-36ecc11bd26so203727eec.3
        for <devicetree@vger.kernel.org>; Tue, 10 Nov 2026 00:18:30 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20260707; t=1794298710; x=1794903510; darn=vger.kernel.org;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :content-type:mime-version:subject:date:from:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=/CKr1kEi8VZLmxn0omdbiYtt+CDZQCwiRpNUGKV8mro=;
        b=RKnu0IJK9pQbEAU8MKWmIbVH1elZgbMUzwijF/c5zRFI3iX50jy8UWaUyU6Jtz2WF5
         ShJeag8lNzkGfWvJPeIyETVvm6GutH6AvqiDzoogEYJJBzTPLpV/Ij/RsV3LUEpLIS11
         f1yxhRNUHaEfe5PcULuLEMTEeEXPiGdzKkR51TuH9+YnIsf9wzJIntSoITI/7yN/rLJd
         SfTLGareRJ6PCWODs0QA3Nsem2YgP3ZUkwyPZ5xcMFHSdp8kI5AhEtt4aLziXZu+UBlE
         fc2ctbL+Wzq+1puCvYu8uWjGJnmZ0Mv+8hP9XnRGc1PYW3p53OwP1mwJ1l/hY2c73Bu1
         rP5g==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1794298710; x=1794903510;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :content-type:mime-version:subject:date:from:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=/CKr1kEi8VZLmxn0omdbiYtt+CDZQCwiRpNUGKV8mro=;
        b=eKwpWhtKr6RwFhxiN6+Vdu9PoTq27nPYlYN5HJWTJggTR9/PAbwUDMAJwJqVb3EDC3
         oZjCccG35RTQUlH762AL93pUKPrNyEGbYrP6+9x0K8g0HOZwTHiVAloxQgywhOrgfqRD
         LIL8+7YQ6v+li+SlTjn5FECxCorRsC6dEboWs+kdnnrx1nnh33Ss6EtF6VcDOPgR7GM9
         LIIVLSj7zf1/VDc8l+tLYQwNUJOEp0J/YzTGtWGIKKJset9u5niiRuUTce9RsDtdlqfm
         Nk8YGh849uIhWEoto+RdJSm96QK2Trf1EpCm8nUKKw6JCNutcQ98SgZs3tGcWgFx6YCl
         d6qA==
X-Forwarded-Encrypted: i=1; AL+hErHwMzpcLXJtzvBtwdSL3vkIKiQ9vgaxffVm3XVbWrlyOQCXVTwZpaWwW/9R+2vyYK3b9NUcIWkn308F@vger.kernel.org
X-Gm-Message-State: APuU4Z/BKuVBJlitNwnV+SLkql6RnK1Ir7qabf0e2CFtq6wFmN+fc3ux
	Vfa5bcjhLU1ddVdAwtZi5fG0gFOY4GCOpv/5Avq2D1jBRD/coXPqFStU
X-Gm-Gg: AYBFou2Uc5mX8alCr7e/K0m21Xj4mF0TAGUnmsbS/xUYQ+lYTv8Iv2RoVczePzkHKZq
	D7VjzjbDfSTinKg6b2/nRh1Azz26vzmbptp9PFAjh8zGHkzUZpa6sTy9PrsSfU708q0kpuNCiGv
	EPfjE3ZLZzKzTYWC+WMplMmtKaw/poWN9NDQZpaUaS5J/H28wWGUCpLxxycP1wZTkVSSdiY9bL4
	BIa40FPka7KqBj05Hri/D4YjD9QslgAYonzHK5arGwj7yVDiYC/i6DrrOen/z5ztqGVSJvlKBG0
	ZHqSSVRzW1yUHhc+nwyjHy4jwqUALMMSdyeQTQYYfpclmHUR865PhbdBdEgdJI2Bj2LfZwoBfYY
	RgsswkBp3F9JIjdBVYXMH0TayoebJhptE9KvMgBXgd+IVnnX8GAttswAO0RU79ID92FdPn3IGC5
	8riizZG4CQnCvMWfT3uG44GcuyGpF1APXDiD3eU82ojulSSebEaGC86h2rRxaWlfRUjbE8+8vtD
	b/25ctP1L8m1VFcb5e7kl5ujxvc+h2MxUW8zE0ya0mkINKk3egc8ghKz6zSWIyGiWB9kN5AGSf0
	qPfqi4xv2K9ukHMQoCuQ28g+Mh9ekqPXj+JsHSl0fxhVdK18rPhOsk5DXSvYjg==
X-Received: by 2002:a05:7022:f502:b0:17f:641e:7f6b with SMTP id a92af1059eb24-1b3b5fbb37bmr3713432c88.1.1794298709534;
        Tue, 10 Nov 2026 00:18:29 -0800 (PST)
Received: from [127.0.1.1] (211-23-39-77.hinet-ip.hinet.net. [211.23.39.77])
        by smtp.gmail.com with ESMTPSA id a92af1059eb24-1b3b5b2fc14sm5236759c88.12.2026.11.10.00.18.25
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 10 Nov 2026 00:18:28 -0800 (PST)
From: Jason Yang <jason98166@gmail.com>
Date: Tue, 10 Nov 2026 16:18:06 +0800
Subject: [PATCH v6 3/9] phy: rockchip-samsung-dcphy: Unwind power-on on PLL
 lock failure
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
Message-Id: <20261110-dcphy-rx-v1-v6-3-d681ba20b36a@gmail.com>
References: <20261110-dcphy-rx-v1-v6-0-d681ba20b36a@gmail.com>
In-Reply-To: <20261110-dcphy-rx-v1-v6-0-d681ba20b36a@gmail.com>
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
 linux-kernel@vger.kernel.org, Sashiko <sashiko-bot@kernel.org>, 
 Jason Yang <jason98166@gmail.com>
X-Mailer: b4 0.16.0
X-Developer-Signature: v=1; a=ed25519-sha256; t=1794298691; l=1478;
 i=jason98166@gmail.com; s=20260721; h=from:subject:message-id;
 bh=NxS9d/s7pydolKNqGjxDl7brlQxmJp2mA7Qr0lzmsSc=;
 b=hK5LSp5p1KXM3oD1W4e88Z83BYsDKcZyvMoCmAJHxlugKKCpNWqKdoE8suj99bc1BLXvTOoUG
 0d0VgAU4krZB9H71TVakaDDs4idjmzjDPoUED7Z6C9RnSeNLvWX8nph
X-Developer-Key: i=jason98166@gmail.com; a=ed25519;
 pk=xQmD001Q/ooHl39PxyQtusbUQmgbOsSfpFryRVWZ/k4=

samsung_mipi_dphy_power_on() returns on a PLL lock timeout with PLL_EN
set and m_phy_rst still asserted, and the PHY core does not call
power_off after a failed power_on.

Today the APB reset at the start of the next power_on cleans this up.

A later change moves that reset to runtime resume, so the leftover
PLL_EN would stay set, and regmap_update_bits() would not even write
it again.

Unwind the power-on before returning the error.

Reported-by: Sashiko <sashiko-bot@kernel.org>
Closes: https://lore.kernel.org/linux-phy/sashiko-outbox-174059@kernel.org/
Signed-off-by: Jason Yang <jason98166@gmail.com>
---
 drivers/phy/rockchip/phy-rockchip-samsung-dcphy.c | 5 ++++-
 1 file changed, 4 insertions(+), 1 deletion(-)

diff --git a/drivers/phy/rockchip/phy-rockchip-samsung-dcphy.c b/drivers/phy/rockchip/phy-rockchip-samsung-dcphy.c
index 7382043e1f31..ce1bc62497c5 100644
--- a/drivers/phy/rockchip/phy-rockchip-samsung-dcphy.c
+++ b/drivers/phy/rockchip/phy-rockchip-samsung-dcphy.c
@@ -1343,8 +1343,11 @@ static int samsung_mipi_dphy_power_on(struct samsung_mipi_dcphy *samsung)
 	samsung_mipi_dphy_clk_lane_timing_init(samsung);
 	samsung_mipi_dphy_data_lane_timing_init(samsung);
 	ret = samsung_mipi_dcphy_pll_enable(samsung);
-	if (ret < 0)
+	if (ret < 0) {
+		samsung_mipi_dcphy_pll_disable(samsung);
+		reset_control_deassert(samsung->m_phy_rst);
 		return ret;
+	}
 
 	samsung_mipi_dphy_lane_enable(samsung);
 

-- 
2.43.0

