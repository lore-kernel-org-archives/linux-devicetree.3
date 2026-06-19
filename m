Received: from bali.collaboradmins.com (bali.collaboradmins.com [148.251.105.195])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 5CD3D3B38AA;
	Fri, 19 Jun 2026 15:29:02 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=148.251.105.195
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1781882945; cv=none; b=FE2VCvioCSq9Y2kh6vmaWM0uAtwPkbH2Syto5djBrxxhGrHxuJMfRR/XX6X88td3z+3mYcPqdMDSC8VB/F9oknz4RX8htHMrUc11E0dxA7HqQwW+/lQFsaYsPTyjcd6OWPzxLIFJ8ariIRumEdaKL1Ns4pS/wSE7C4qSdPaiZ8U=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1781882945; c=relaxed/simple;
	bh=gXGJIR/hmYUEejkg/YXqOvfEwIx8WrXL3cr+XlmGmvg=;
	h=From:Date:Subject:MIME-Version:Content-Type:Message-Id:References:
	 In-Reply-To:To:Cc; b=CxzGZUYbht9Su8hhua9h6PN5EPHuYSU/Thjrm1PVPKIjrwaumIA+q0kXgttejbf7vqJ90Yt4ITgZFeP8VmB1yKATU6rfCesnjPvnEcDHXuv3niDkE5jsr95nakmUdMoIKPsE2Dx9zN5HVJhBRA5GppUvYWMP9qHwxDE94ua5m4k=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=collabora.com; spf=pass smtp.mailfrom=collabora.com; dkim=pass (2048-bit key) header.d=collabora.com header.i=@collabora.com header.b=Pqq6bYwB; arc=none smtp.client-ip=148.251.105.195
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=collabora.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=collabora.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=collabora.com header.i=@collabora.com header.b="Pqq6bYwB"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=collabora.com;
	s=mail; t=1781882938;
	bh=gXGJIR/hmYUEejkg/YXqOvfEwIx8WrXL3cr+XlmGmvg=;
	h=From:Date:Subject:References:In-Reply-To:To:Cc:From;
	b=Pqq6bYwBUQk0ezelaeevCIwlnKF/U4g7TH7CJPmXNNRMiuXAU4TbfmWcW9Ub+8nWH
	 hJx+8Hx4mL3FnhF7yLY/uFissRKYM2n/DQGGeVDmI6uTY2KeQoahAyeDe7bXNAr9aB
	 dMJPLXtcZJDOvZtEQlmKtvToU2QNiP9VeAbSbr7rVaT8V2ySi4WG5hqrDFakEQ3vpC
	 JZ7QIOGmWMMRH+y63XXmZD0rsu6xqPGoR0kQYTUTY4lz42jNXdlbgiCCrCCnOQBKbB
	 8FJB14geXKEC+7j/HLPkA/jB5LtozNeWWoy9Nq/7ay33lNF/8wSTknq0h0SYccSBa7
	 o9aHOPieIyx2A==
Received: from jupiter.universe (unknown [100.64.1.62])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (4096 bits))
	(No client certificate requested)
	(Authenticated sender: sre)
	by bali.collaboradmins.com (Postfix) with ESMTPSA id 42C9217E140E;
	Fri, 19 Jun 2026 17:28:58 +0200 (CEST)
Received: by jupiter.universe (Postfix, from userid 1000)
	id 9476648003A; Fri, 19 Jun 2026 17:28:57 +0200 (CEST)
From: Sebastian Reichel <sebastian.reichel@collabora.com>
Date: Fri, 19 Jun 2026 17:29:00 +0200
Subject: [PATCH v6 09/23] phy: rockchip: usbdp: Fix LFPS detect threshold
 control
Precedence: bulk
X-Mailing-List: devicetree@vger.kernel.org
List-Id: <devicetree.vger.kernel.org>
List-Subscribe: <mailto:devicetree+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:devicetree+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20260619-rockchip-usbdp-cleanup-v6-9-3bb1f54b3f35@collabora.com>
References: <20260619-rockchip-usbdp-cleanup-v6-0-3bb1f54b3f35@collabora.com>
In-Reply-To: <20260619-rockchip-usbdp-cleanup-v6-0-3bb1f54b3f35@collabora.com>
To: Vinod Koul <vkoul@kernel.org>, 
 Neil Armstrong <neil.armstrong@linaro.org>, 
 Heiko Stuebner <heiko@sntech.de>, Frank Wang <frank.wang@rock-chips.com>, 
 Rob Herring <robh@kernel.org>, Krzysztof Kozlowski <krzk+dt@kernel.org>, 
 Conor Dooley <conor+dt@kernel.org>
Cc: Andy Yan <andy.yan@rock-chips.com>, Dmitry Baryshkov <lumag@kernel.org>, 
 Yubing Zhang <yubing.zhang@rock-chips.com>, 
 Alexey Charkov <alchark@gmail.com>, linux-phy@lists.infradead.org, 
 linux-arm-kernel@lists.infradead.org, linux-rockchip@lists.infradead.org, 
 linux-kernel@vger.kernel.org, kernel@collabora.com, 
 devicetree@vger.kernel.org, 
 Sebastian Reichel <sebastian.reichel@collabora.com>, 
 William Wu <william.wu@rock-chips.com>
X-Mailer: b4 0.14.3
X-Developer-Signature: v=1; a=openpgp-sha256; l=1521;
 i=sebastian.reichel@collabora.com; h=from:subject:message-id;
 bh=GFdUGpYmGDDQ9cGl9w7ZUJpxRNfqmVqO/MAupoRmLlQ=;
 b=owJ4nAFtApL9kA0DAAoB2O7X88g7+poByyZiAGo1YDjzHd5Ldq1LRJkV60chyxZljGtaMmC0w
 VooZWQjj2MBkYkCMwQAAQoAHRYhBO9mDQdGP4tyanlUE9ju1/PIO/qaBQJqNWA4AAoJENju1/PI
 O/qaSmcP/04WRRlb+XpqTe+EmFOylARJJG0CYb9LnA0KUHtTd0tzTUNnzLRgR3znfVu+vGOZh61
 yZgT/yLmTqboowZVhvyI78a7TVKRShAqRR2/lDn8+3R9tsZZv5OHF5EmV1chdFNouhUDawc6sx7
 SkJ4/tpI5Zsr8FUcGhpum3RpBt8GLSGLgN7uti2nS49F/lgzVsXXGuuou2Tj0x/ykIro3DwEU2K
 8YMMme03XTGcrP8OpcGun1OG8BPFWO3iQV4vWt5FAK/8p5q83u4fjmBXXN01QqFH50PysmNDOza
 +9umUy5jjhigcPOUWBvLtdXaHbh+Hil5hj70155rx/L/fhkopP2EC3J5Z9kSysezk7b00wpCv+a
 Y2ripcrhridNT/hxu/XO2E4jYSF6LHNLNfoUIUAbAVyaRvaYZjSRk8EvNUgyM0JN5cbCiBTpUKK
 /LimC4bETqW0fNvQ0xxkmPI/4V5rSU27pIwbEH/T+TtA1TjvliTRvAPNAVoxdmgpHw7K7RnKut/
 D7M+5bj9NPRya3AWyy3ughR6DInUKmXmtxlYYi96+662HcqhD9bBuD24VMSUdJ02/oXbJme9BUg
 1Ref9FU7bJpCKwRX1aJh2RqfIY9xGAi/fbO0JVYV+hdM5opU94L105Hh906OF32X526tZj5S5+x
 FaK3ZjcJvR2XDqlDO+2812g==
X-Developer-Key: i=sebastian.reichel@collabora.com; a=openpgp;
 fpr=EF660D07463F8B726A795413D8EED7F3C83BFA9A

From: William Wu <william.wu@rock-chips.com>

According to the LFPS Tx Low Power/LFPS Rx Detect Threshold [1],
the device under test(DUT) must not respond if LFPS below the
minimum LFPS Rx Detect Threshold 100mV. Test fail on Rockchip
platforms, because the default LFPS detect threshold is set to
65mV.

The USBDP PHY LFPS detect threshold voltage could be set to
30mV ~ 140mV, and since there could be 10-20% PVT variation,
we set LFPS detect threshold voltage to 110mV.

[1] https://compliance.usb.org/resources/LFPS_Rx_Tx_Low_Power_Compliance_Update_Rev5.pdf

Signed-off-by: William Wu <william.wu@rock-chips.com>
[Taken over from rockchip's kernel tree; the registers are not described
in the TRM]
Reviewed-by: Neil Armstrong <neil.armstrong@linaro.org>
Signed-off-by: Sebastian Reichel <sebastian.reichel@collabora.com>
---
 drivers/phy/rockchip/phy-rockchip-usbdp.c | 3 ++-
 1 file changed, 2 insertions(+), 1 deletion(-)

diff --git a/drivers/phy/rockchip/phy-rockchip-usbdp.c b/drivers/phy/rockchip/phy-rockchip-usbdp.c
index a44babac3517..7ed539d8c791 100644
--- a/drivers/phy/rockchip/phy-rockchip-usbdp.c
+++ b/drivers/phy/rockchip/phy-rockchip-usbdp.c
@@ -413,7 +413,8 @@ static const struct reg_sequence rk_udphy_init_sequence[] = {
 	{0x0070, 0x7d}, {0x0074, 0x68},
 	{0x0af4, 0x1a}, {0x1af4, 0x1a},
 	{0x0440, 0x3f}, {0x10d4, 0x08},
-	{0x20d4, 0x08}, {0x0024, 0x6e}
+	{0x20d4, 0x08}, {0x0024, 0x6e},
+	{0x09c0, 0x0a}, {0x19c0, 0x0a}
 };
 
 static inline int rk_udphy_grfreg_write(struct regmap *base,

-- 
2.53.0

