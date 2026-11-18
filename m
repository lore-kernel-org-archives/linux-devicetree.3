Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=209.85.210.179
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1794981357;
	b=itQq0VkBUD3zIzY9th6kZtZGgfb777KdFPSk6zqrGWeBYS2SSyllWTwZMRyiZ0bysoEn
	 TAdjJQXOL2vT1m+mSApD2kKfk2ECNxm1ExlKNHvCGSwxgsQQZU/QXTmHdqzlnwTNdsuSR
	 FI6DczgKRJMdLK+npqISvfkHHBP0J5prPOhqLU8jO+79SZGd1gkq8v2cIMygdk8s38ske
	 zSWFhFrzkcV5SpBv1r96yNkSqZ2tZ4hSsm0Bhki4IqM8Mshz5XxafuU4Rq+yEHS0BvRPJ
	 F4C9hR3JUkOG4O9ohsgCYK/Ruv8oT+KVK6j23at4XqnsVmp0/h8I7vIDcuFo1OwKF/w==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1794981357;
	h=DMARC-Filter:Received:DKIM-Signature:X-Google-DKIM-Signature:
	 X-Forwarded-Encrypted:X-Gm-Message-State:X-Gm-Gg:X-Received:Received:
	 From:Date:Subject:MIME-Version:Content-Type:Content-Transfer-Encoding:
	 Message-Id:References:In-Reply-To:To:Cc:X-Mailer:
	 X-Developer-Signature:X-Developer-Key;
	bh=QV7/azGZskXYhWhh8bvjrBkzYwv/Uf2HoCpYkbr0EGk=;
	b=NuqvnF/ivwyI7aLLFGG9ULj+E15kHiBH5AOjKCslAsJ4VM8GevazO10YuZEk/bSzMJWY
	 jwD/JiQsIOfAGD8ag891kxtqkMpycyJV/QeTsUWy7CHtV3fXzDmNMFKsvlc0bv8SKQ+8S
	 gUQxa8H/UfJWbcKDvLrwGgSIArvflg6m7efvAU81P+jU/cL/ZdANn4v73hNd4k5QESF6t
	 tffQmvwnlrhYH716vLO+XI8mFJProvYIuiIEfLLGgYxhBqKH7iIJio8hIKu9hKfZVpg7y
	 j5p3p99tIN7uLvhKWIzPGRFALXA99c7kxScbYVzJU91l/noD9bMUP15Y0LyJxuAvhkA==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=gmail.com;
	spf=pass smtp.mailfrom=gmail.com;
	dkim=pass header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20260707 header.b=WknVe8fK;
	arc=none smtp.remote-ip=209.85.210.179
Received: from mail-pf1-f179.google.com (mail-pf1-f179.google.com [209.85.210.179])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id A829A606A332
	for <devicetree@vger.kernel.org>; Wed, 18 Nov 2026 05:55:56 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org A829A606A332
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20260707 header.b=WknVe8fK
Received: by mail-pf1-f179.google.com with SMTP id d2e1a72fcca58-89ecfdbe443so53624b3a.0
        for <devicetree@vger.kernel.org>; Tue, 17 Nov 2026 21:55:56 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20260707; t=1794981356; x=1795586156; darn=vger.kernel.org;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :content-type:mime-version:subject:date:from:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=QV7/azGZskXYhWhh8bvjrBkzYwv/Uf2HoCpYkbr0EGk=;
        b=WknVe8fKi2zPpNBYRtbP1Qfwq+BSUMdWwyH29+Fqe3kCJour1GIIV69Qn1FI4oIWRU
         amoY5C/Y8fZtOc/POuCunwbMmwW2nnPfjNblk5JipLnbINMR5NK3sTjM7EkkPPaCC1ip
         sIBATU/3XG+LNczMlHMTUCIzE/maPwwuyjKm1aFwEqLMolUyJ0G1Ra/WVmqkC33vT8Wd
         hteWX0N4Q60lADZcCz2EBX5s0eti7ALbfyMN4E6SzOlWxZ3qK3DAcda2PPgFd+unCtjo
         4IgjqrA8vtz0dMMZ4/Odtq5Mguddq9ekorJDyqN6/dx7/pKK5jHwR/f76qsuAUdxIjbE
         EtGw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1794981356; x=1795586156;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :content-type:mime-version:subject:date:from:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=QV7/azGZskXYhWhh8bvjrBkzYwv/Uf2HoCpYkbr0EGk=;
        b=IejlV1X4Bqep+1c5BkVm4zuCAhHyGHT6K9Mv0upRQ8zT2WmcilztsxQgEQQ+KGecat
         v4vh3DWNoq+jvh7ldBI1B/48y/vEGctITwlhtO5X8+0ix77rMQyatIepC/uuCBoR48kJ
         MjqRAK3AEI9A1UL9f2tKqp8j0b/27RLWtTYF1XYznnRyCkCrKGHKGc7V8HJqSyTG4lgJ
         Opr550kWMX/jmambjo6utNqZ00Djnx9537GxMRtMrwjQyuou6HL9m6gthQ1T4jHY7ZhP
         MDrbqiWwo8jBMz3ZJu9Xx9A+dxrZnewu34an4khKLhsmWluDKjETNgu/RQh6tU3bXAp5
         Ajbw==
X-Forwarded-Encrypted: i=1; AL+hErEq6s7bRIywbTswFrVHmDxne88AzU021IRR78hHJ39sjwlSm2dNGxIhtAqjDWD4wACugDLltE1Qy4ZI@vger.kernel.org
X-Gm-Message-State: APuU4Z+9KUzzX0L2PGWZKte9UJVIBQ22KgAnzq2dFpJxZAwvhC68smJ6
	BmhaBsmjRFqXIKwEYkxrhiTGD3/cEP91rUaMEFTE4zgpO0Q44avBmVK2
X-Gm-Gg: AYBFou2DAU7KngVS17ftQABaVBniX6SPTAyDWi9IlYALfwgVo+h4sUtNH/ybNvfQq+E
	pLj5yyzDbFcw23/2ADi5RPti0Exn2Q1OeRqqwwi1Y9ns96jCY77D46Qe8YtVYePlhwX5pkequEl
	m1HxxJ0PI+kfOhWLqObqQhnHHxE+093O22VBgwSY9FR12AmSLm3dJX4Uc71hBXcXv1mVLIjH4fP
	6fMbZ5ePPX4ksRYgipnwx7RxY5n0MTMPEbKUnNoahSftTEBju9H4EMtlVONCn1VfHuWpAG3ZG3P
	/s1nYqXWxd2r/4L3tQRjW2tocjfJTz62pcXkh59Sgwv0UzjtUQ6HLJTOqqBjm1jI2Kf1Kq3TQdj
	P4hAsTlw1jqSs6nvcoLYudtbjaJMoEYSmf7K5ppUawiZ5ZYOJvQthCujMXvda5q2IchKs5oBDU4
	GLPiNao/VzBkF2s6L7O9Q3BcX3lUX4urgPRu9Zc3BkvxaTHCaQriWJ/nljsHwkLgdRmLGSQWrsD
	CaC4wptt7N/OhUDyn+rPcc0uNLXfhP96TDEX2iJNaxcRu94SMnFViAtFu5xFF5x28LDtj9tW+5L
	Jc+ubGz++BhujL20yebZr8ELo5VE7XIuZl0j9VF1zdt7GdCKjCb/OMRRDQhuru2vD4UR4pOTeDx
	d9DLpHrMPaLT/dvxo+7U8
X-Received: by 2002:a05:6a20:3815:b0:3f8:fc10:f77b with SMTP id adf61e73a8af0-3fe84102e03mr2033878637.0.1794981355696;
        Tue, 17 Nov 2026 21:55:55 -0800 (PST)
Received: from [127.0.1.1] (211-23-39-77.hinet-ip.hinet.net. [211.23.39.77])
        by smtp.gmail.com with ESMTPSA id d2e1a72fcca58-8c5ca5bf959sm569563b3a.20.2026.11.17.21.55.51
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 17 Nov 2026 21:55:55 -0800 (PST)
From: Jason Yang <jason98166@gmail.com>
Date: Wed, 18 Nov 2026 13:55:16 +0800
Subject: [PATCH v7 3/9] phy: rockchip-samsung-dcphy: Unwind power-on on PLL
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
Message-Id: <20261118-dcphy-rx-v1-v7-3-8de1adac3a74@gmail.com>
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
 linux-kernel@vger.kernel.org, Sashiko <sashiko-bot@kernel.org>, 
 Jason Yang <jason98166@gmail.com>, 
 Quentin Schulz <quentin.schulz@cherry.de>
X-Mailer: b4 0.16.0
X-Developer-Signature: v=1; a=ed25519-sha256; t=1794981338; l=1650;
 i=jason98166@gmail.com; s=20260721; h=from:subject:message-id;
 bh=W4uqFjWfli07BWEGnXyu4qteuMVlaJHZHz3TMUadK50=;
 b=m7mXviKej2/0soFdmjYmH/XiRdXYaK1GmHksA4I0n03fIHctRzeTS9lVuu4DW3Gbc47NJvzGM
 7LSU94kNnpNDWdZ3aC5c+qp1M/C+VWAcJCPLR81h+FNtfxK0ZNnu2+8
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

