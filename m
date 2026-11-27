Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=74.125.82.173
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1795765681;
	b=KKnpp64w3eemT0maoatENTL8sc3cH3IkCM7H/QTTyM+R52UfO01BLCMuyIVIKZzrucQp
	 m5OrCiSvYcltLPslhn4Che3qm1StWO82TVCRsktG/H4+a5kplRg/E/4DfQRX72cW/P/v1
	 ui6e1rHyV986pZJszy/cZkGsNmm/g2NiovYrQ3LdsZxoHqPM+dj7CX93JNSfy26NVm781
	 17s9Wt0bdg4SZ3giZQ+XJIbuztqDRyZNtbNcZOlTbin/Iy6WdU5bF+V3wMgtSpPxqJ8Se
	 LdcdJqtoxlI+6dtA6oej00Uoc28nkpDUQoQgqNiM6t+UAJjtR4GhfieAESU5n2vq8nA==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1795765681;
	h=DMARC-Filter:Received:DKIM-Signature:X-Google-DKIM-Signature:
	 X-Forwarded-Encrypted:X-Gm-Message-State:X-Gm-Gg:X-Received:Received:
	 From:Date:Subject:MIME-Version:Content-Type:Content-Transfer-Encoding:
	 Message-Id:References:In-Reply-To:To:Cc:X-Mailer:
	 X-Developer-Signature:X-Developer-Key;
	bh=QV7/azGZskXYhWhh8bvjrBkzYwv/Uf2HoCpYkbr0EGk=;
	b=IDLvzH9tqf57wjNJz8s+RZdQfKwyoDvqjqTho+G8++jwVsvwB3xuPcb861stbq6L6I6o
	 tDVGs1uHcxyt0nxF6cGlSX9lcIOoO9ffOdcaNrosjwjmbFIIVkocxNQ9hByU1gAvJKm+0
	 haYVnO8F/jFWpmSoTQTB5YZKdTM6L8RGev2J4Dv5L2d5sqtQHGgs/FQJ6pTBPsCmUGUOP
	 ZR6vshECqVEAze6nSTHfeOyblBgX6iup9otIrT5ck27H7GSP+mEiAROaoR4j+uciVT7v8
	 4xhN87CwuytxOje4i2LtNwpcsoYzyMcyDfN5BPk6MRMn4hMN0tiCbuoncOIr02wawfA==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=gmail.com;
	spf=pass smtp.mailfrom=gmail.com;
	dkim=pass header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20260707 header.b=lLvBM9Ah;
	arc=none smtp.remote-ip=74.125.82.173
Received: from mail-dy1-f173.google.com (mail-dy1-f173.google.com [74.125.82.173])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 9409E606A327
	for <devicetree@vger.kernel.org>; Fri, 27 Nov 2026 07:48:01 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org 9409E606A327
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20260707 header.b=lLvBM9Ah
Received: by mail-dy1-f173.google.com with SMTP id 5a478bee46e88-35159e0092aso718052eec.2
        for <devicetree@vger.kernel.org>; Thu, 26 Nov 2026 23:48:01 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20260707; t=1795765681; x=1796370481; darn=vger.kernel.org;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :content-type:mime-version:subject:date:from:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=QV7/azGZskXYhWhh8bvjrBkzYwv/Uf2HoCpYkbr0EGk=;
        b=lLvBM9AhneyYjbormb7D0Ve3cPfe+mL/xgDelbQaaQ4E/vif9YwY5/+I3h+6vmH53B
         ke4e+fWChGckjjdSFy0Zg7IGFcJC6T7eAWbaDCgxuYTGdiERiXlnFguAOyPn+LjptnSq
         g7Sy32YajUJWtJTdnve1mO9P7/qouSuG28twUZKQTto4ToboujSOJXwgUcA9+xUH3vBN
         kw0Y7fmjFZ8EFdcg3TMcxJSDO86YqGrXMlF/cZyWXRrVy/rywZSQDQcDUAIvahaPTjKj
         kDI6UNAxBNdIitHFXG/gTNYXIwyFuj9PY5JQ56jv9d2tIukRoeqs7QVx1YZ7xiXofMUh
         ZlQA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1795765681; x=1796370481;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :content-type:mime-version:subject:date:from:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=QV7/azGZskXYhWhh8bvjrBkzYwv/Uf2HoCpYkbr0EGk=;
        b=ERpUPe311XzWY1bWd69KnwNR/rM0ukgihLl6K9nGPllcheeS7Kkl1W+7PS6eEd0ked
         HwFFuF5pA3kwuTuUpbtuxTWa32oU07m4DuRJz72Nzp/AGYKoOckMYEXnjTZj3wbT1six
         EtXzGQ/lOv9zx8iog3r1opJb4OMQSvwrshprhwwNUbVVRuWBF/VQdMp1oovkr3NQ2AQr
         W+AKgBw9cmWR0PLt3bpZvSrZAq1gPVRux4RK2nj1fbhfHcfOYCR/pt++5bXqUnYxx4er
         wLBdQkmEBUM4E+ruy4F7vj+r/Q6rWPPLFEyUnxSw6uNfAlEXrrHLFx/CrX+Qp2ZwK6y3
         89XA==
X-Forwarded-Encrypted: i=1; AL+hErEGcu9dOVre87cbqIqNqx/rSuhGuCgBDYfYwkEXWLPlJIhIDuMXpjPU8IomyNsGMVsND/2NhvbJ2KBs@vger.kernel.org
X-Gm-Message-State: APuU4Z+B/MC3E4Vv9FbVdvjPfLHBebH0/3liGzOzM/O2M9r8gr+r4Tyz
	MWxQyXUyLRpxnG/5ElOLTe3mUCBfHwzjuTADMED7E1Fe7+QwFhMexcak
X-Gm-Gg: AZFdTZfRJX9MQzRDdO3JWul8oKrJuJQ16L+yXI0mRaCzkum6I/gN/TMxzmbATWYpHmH
	qWlpe40xgkJJbF0obxjua5VWp97MjKT6P8w8ablQUBv7313g5be1Yz8NXAFHYWPdjnBou6x3Mwb
	f2+cJWV59O/u31pwiV3aZwlZOLvoZRc1JQXDCayCpQHXx2mYE1O06uasqJlOirul6cEycYEsqIv
	AfZso0kEfrTsiOrqWQTpNfDcqifZ5tmyXgJrfF/ij8lFwMA5RbwmLE4IHuNDhbkryVWs8CEhx8l
	Ut4FSYxEOHsjiA9WbkvzcbTvAzRRZyfeWh1STmeUqPJld/ywZUVhZV8lk5CVxjwRLEw6FBrVYi2
	qzmpm9uk9IUQQJkseTn3UYd100Am8TXobJ9nLSCVDvHePUAX7WZupOT36EetGYjuQD2JETUsj/2
	ubrnmW8ItALcpKGeu4wzN10F47AbdJVZBCtq74AWWAfckqqNo5x0zgvU5hxB5lRoz5/4bUEIPGG
	FWEs2FV524oDbcFAKmVwKJahD+TGSxXOWOY9SaleriHL370rMzqcKIp+49Uc4hW1MGw1n9oN4M4
	an7OaRUdvxtlK4vpfa2BUTV6UgNJnANaiB1K8a7kinILZhUyWANAVAlP7/HioIqK1Npf0I5lCiC
	P3mPcgSwTL/+DLNyKKxqR
X-Received: by 2002:a05:7301:2624:b0:385:1a45:47b3 with SMTP id 5a478bee46e88-3856e24682amr38261091eec.1.1795765680315;
        Thu, 26 Nov 2026 23:48:00 -0800 (PST)
Received: from [127.0.1.1] (211-23-39-77.hinet-ip.hinet.net. [211.23.39.77])
        by smtp.gmail.com with ESMTPSA id 5a478bee46e88-385672c6f31sm68098252eec.15.2026.11.26.23.47.56
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 26 Nov 2026 23:47:59 -0800 (PST)
From: Jason Yang <jason98166@gmail.com>
Date: Fri, 27 Nov 2026 15:47:39 +0800
Subject: [PATCH v8 3/9] phy: rockchip-samsung-dcphy: Unwind power-on on PLL
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
Message-Id: <20261127-dcphy-rx-v1-v8-3-9ddfef99221d@gmail.com>
References: <20261127-dcphy-rx-v1-v8-0-9ddfef99221d@gmail.com>
In-Reply-To: <20261127-dcphy-rx-v1-v8-0-9ddfef99221d@gmail.com>
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
 Quentin Schulz <quentin.schulz@cherry.de>, linux-phy@lists.infradead.org, 
 devicetree@vger.kernel.org, linux-arm-kernel@lists.infradead.org, 
 linux-rockchip@lists.infradead.org, linux-kernel@vger.kernel.org, 
 Sashiko <sashiko-bot@kernel.org>, Jason Yang <jason98166@gmail.com>
X-Mailer: b4 0.16.0
X-Developer-Signature: v=1; a=ed25519-sha256; t=1795765664; l=1650;
 i=jason98166@gmail.com; s=20260721; h=from:subject:message-id;
 bh=W4uqFjWfli07BWEGnXyu4qteuMVlaJHZHz3TMUadK50=;
 b=Gu0eVRuDgeu70F7RSPjzHKcztPH+YfJNOX2TmitsSMipP6dmk3XLTBw0qxoOQ7E27z/ZVeIVL
 49W0elPOCvABZVdIcpA/1gyuWqHTOki4wOqlFDrQr9OYlLDzFUx3Z14
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
Reviewed-by: Michael Riesch <michael.riesch@collabora.com>
Tested-by: Quentin Schulz <quentin.schulz@cherry.de> # RK3588 Tiger CSI1 2-lane IMX219, CSI0 2-lane OV5675+DSI
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

