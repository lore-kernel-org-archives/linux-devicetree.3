Received: from bali.collaboradmins.com (bali.collaboradmins.com [148.251.105.195])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id BD4D23D2FEC;
	Fri, 12 Jun 2026 16:22:01 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=148.251.105.195
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1781281326; cv=none; b=EnT0E+OSPZ+dc2HqOlXisISwnKqT3f4PVzerty2PgULvI6MZfoAwmWIwBXvfuCy2j0ZA1B74mpQqFAn4AqnySJWVxB38y4lWwkwJIZ6d5j374fo+a6GRS3qAvkSWIf2UAqM0joKnNlB44dtTy0/qTTimduT4eKMzuZnMpmyKOiU=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1781281326; c=relaxed/simple;
	bh=V/529AadGwD70lqWgfn8mxzfTOio4otD4zISV3Ilp7c=;
	h=From:Date:Subject:MIME-Version:Content-Type:Message-Id:References:
	 In-Reply-To:To:Cc; b=mcIUkHrJTeErg0/vqBFg2kjDb03cnllSkQ6SxhbodoEfPnZoP3ecRX+eku0LyBtKGcJxuxdY+fpQj+rNwZvis/5O1Fx94OxMemQz9tErGiZfDNZ4IxKBlTQBTSubHyxK9vflNZpA0ll5VmlTBTczS1ihict9YKW1RzfL1skc/YI=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=collabora.com; spf=pass smtp.mailfrom=collabora.com; dkim=pass (2048-bit key) header.d=collabora.com header.i=@collabora.com header.b=fnb/YTyB; arc=none smtp.client-ip=148.251.105.195
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=collabora.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=collabora.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=collabora.com header.i=@collabora.com header.b="fnb/YTyB"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=collabora.com;
	s=mail; t=1781281314;
	bh=V/529AadGwD70lqWgfn8mxzfTOio4otD4zISV3Ilp7c=;
	h=From:Date:Subject:References:In-Reply-To:To:Cc:From;
	b=fnb/YTyBFtoSuEw8z0NjXJyZx2QfyudWBKQu00sASaP8Dxl5ub2Q17x9LHLlRn+N3
	 JHgZdyeT+cLhl+9R8k924qGh/8ZKfBfvRkLKOAIo8H/vwE4pY98ARXmSfDprgI0IJw
	 LSr4Y/aCEu9kjPHzf77dQXl4pIdYGOroqxAf9c6vWqRvsLuI/Jwvb3oPVbGIRN3dgQ
	 MqOWo8dFVXdZUIy9EePkLmrd6iKouRrJCcYeT1+p/KoAURQ/5c8Ot3+GxboRDXfcDr
	 G4EYjoljq/VLsF/0s5rF4qY8xX61pWpPT6bwx/oe4QgIzXD58zw96FlnxoBdizki9O
	 Frha7jSr11/6Q==
Received: from jupiter.universe (unknown [100.64.1.62])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (4096 bits))
	(No client certificate requested)
	(Authenticated sender: sre)
	by bali.collaboradmins.com (Postfix) with ESMTPSA id 71DCC17E0DE1;
	Fri, 12 Jun 2026 18:21:54 +0200 (CEST)
Received: by jupiter.universe (Postfix, from userid 1000)
	id CB4FD480030; Fri, 12 Jun 2026 18:21:53 +0200 (CEST)
From: Sebastian Reichel <sebastian.reichel@collabora.com>
Date: Fri, 12 Jun 2026 18:21:43 +0200
Subject: [PATCH v5 05/18] phy: rockchip: usbdp: Fix LFPS detect threshold
 control
Precedence: bulk
X-Mailing-List: devicetree@vger.kernel.org
List-Id: <devicetree.vger.kernel.org>
List-Subscribe: <mailto:devicetree+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:devicetree+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20260612-rockchip-usbdp-cleanup-v5-5-efc83069869f@collabora.com>
References: <20260612-rockchip-usbdp-cleanup-v5-0-efc83069869f@collabora.com>
In-Reply-To: <20260612-rockchip-usbdp-cleanup-v5-0-efc83069869f@collabora.com>
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
 bh=Led/QOkLk4w3MB/VmlIc1bBbJFPYOjp803NShAil2Pk=;
 b=owJ4nAFtApL9kA0DAAoB2O7X88g7+poByyZiAGosMiEVbdQEOmh+s0g9cTOXjnO2Imv+Ax6sl
 pAF6ZFPpPMRx4kCMwQAAQoAHRYhBO9mDQdGP4tyanlUE9ju1/PIO/qaBQJqLDIhAAoJENju1/PI
 O/qa42UP+gMViwOZ9fF3gyraPytg+28dj1fMVIEBNTqVmvDEkCTGyMwi4wqg7OlqCWo5n2GegVl
 Nzns2jrwU+wgE98248rp10t4RaVeXgMeNq2dhB401vzwQbOwt6O9Q/cfZiT9jvIeXK1tMlgdCJ3
 8Dua4LWb2HAjilGNeJq5TGzgY5eetmq7U6AWNOBjBS2q76VcaHkfTKQfC83I5BwVdSaaG+/HMda
 p8LTmRmbZZlSkqSDaLJr8W2fpCPZ0aVOuW47z5FEBm4y+eaWaVo7Z2xcw2Z5zcqCB5o8E6mxD3B
 257Fm22uul8ya5crgJLQB5MZkqYuXt8ZqtoFsHhXcwEecULa5isFvju7p7Y+YfQ9H4up5RvtEq2
 oGu8yzu54cJwBgpBicH7zuSIYBZpqdcZ552yMnnZ4Z0L6sflEpZv9MF4KwwpAQf3Af3h9mqhegk
 WWke3OI20wfyhyNwUzw/j/WQ/h8txa6v3VKl1HImy5FDdcI6d4nYt0ylYvGlVpLKv6GsqM77x10
 XOIuj5hWB8eNbHjnn2VAB0oYA4KXnyLZWG2lIknvoDvifxuJN5rzX+ZQXvYnlGAyHrtz8XjO8yB
 x5IGt/QzlxcBSnRHpPTqX3zR4q3RRJsEWwaliFr7EENMAqhsADBno8SnABtsiniqnXe3VafZIzC
 yZzTENiyzTnrPL6E1/xsnkw==
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
index 1f686844c337..97e53b933225 100644
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

