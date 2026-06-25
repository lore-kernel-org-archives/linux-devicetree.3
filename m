Received: from bali.collaboradmins.com (bali.collaboradmins.com [148.251.105.195])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 1A70A3EF670;
	Thu, 25 Jun 2026 17:39:47 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=148.251.105.195
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1782409190; cv=none; b=T0IDFoBFfLij1VZlLzs1jBUP0YacvvQ80KUNsVSVvNdhikwfNv2ZlKWb0fKO25dDFZbs5pQTBk5QB406Uixe73SQqMXscQIkmIjmHl/gfgjT/5ybw6L8XbEJbdlEjupy8Sf1AEsvFGDaA5eMWy7hmkKYOdb6hZ+mDjQk2G1of3o=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1782409190; c=relaxed/simple;
	bh=BKK0WOp1c+S2G4HJEwDSlIDRpU5wJfnkasC5i07zsD4=;
	h=From:Date:Subject:MIME-Version:Content-Type:Message-Id:References:
	 In-Reply-To:To:Cc; b=Hyz7iFlQSV9r+SUrF1Pvd1VlnsvIoMSvPC/HK0zsUz8WmxEdG76pQUj/fJZ2y6jlolihD7yRkSN4yrA4zEplKv+yTNr+gSy2vWLe7BudSzN6Cs/xQeiVeh9ADBBL0y1k9dZikiFeucGGUpVqlxZfjwSPDeVWzT6Eb3OqIW+ak0I=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=collabora.com; spf=pass smtp.mailfrom=collabora.com; dkim=pass (2048-bit key) header.d=collabora.com header.i=@collabora.com header.b=A6rRNuxi; arc=none smtp.client-ip=148.251.105.195
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=collabora.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=collabora.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=collabora.com header.i=@collabora.com header.b="A6rRNuxi"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=collabora.com;
	s=mail; t=1782409181;
	bh=BKK0WOp1c+S2G4HJEwDSlIDRpU5wJfnkasC5i07zsD4=;
	h=From:Date:Subject:References:In-Reply-To:To:Cc:From;
	b=A6rRNuxictVazFQYw5Rv1pKhe8X37t12JVXwjBvsH7kEkmSOKu7AcXArDq3g+fjds
	 0wEikdAhAFviBThfrrUaUhiNNwzw/wUcMX3MbfHO2MOlvbHVO6mu68AhfDg1ujBDX/
	 95FiJbg4J9ZXWrtmLCmlttP6XlJq0hJczz6bHXAc+8P2EM9bFZE1jBb3H9/TsXTYXq
	 g14mkeusSNMsCgi0aA9iW15saEuD4QBfT8gy0z9TCmoWhdd3R3Zu23mliGSTs7SUqP
	 BxBQwblCPNeA6SRUvdxdzD0vQmay/9xx07kBIkWRNsF5unrDv7cLHHns8wwILxOith
	 mnurrL5O8rxgg==
Received: from jupiter.universe (unknown [100.64.1.62])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (4096 bits))
	(No client certificate requested)
	(Authenticated sender: sre)
	by bali.collaboradmins.com (Postfix) with ESMTPSA id E88E417E155B;
	Thu, 25 Jun 2026 19:39:40 +0200 (CEST)
Received: by jupiter.universe (Postfix, from userid 1000)
	id 0F46C480052; Thu, 25 Jun 2026 19:39:40 +0200 (CEST)
From: Sebastian Reichel <sebastian.reichel@collabora.com>
Date: Thu, 25 Jun 2026 19:39:42 +0200
Subject: [PATCH v7 15/27] phy: rockchip: usbdp: Use FIELD_PREP_WM16_CONST
Precedence: bulk
X-Mailing-List: devicetree@vger.kernel.org
List-Id: <devicetree.vger.kernel.org>
List-Subscribe: <mailto:devicetree+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:devicetree+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20260625-rockchip-usbdp-cleanup-v7-15-38eb3cf654fd@collabora.com>
References: <20260625-rockchip-usbdp-cleanup-v7-0-38eb3cf654fd@collabora.com>
In-Reply-To: <20260625-rockchip-usbdp-cleanup-v7-0-38eb3cf654fd@collabora.com>
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
 Sebastian Reichel <sebastian.reichel@collabora.com>
X-Mailer: b4 0.14.3
X-Developer-Signature: v=1; a=openpgp-sha256; l=1546;
 i=sebastian.reichel@collabora.com; h=from:subject:message-id;
 bh=BKK0WOp1c+S2G4HJEwDSlIDRpU5wJfnkasC5i07zsD4=;
 b=owJ4nAFtApL9kA0DAAoB2O7X88g7+poByyZiAGo9Z9t9AGXQpTRfpaMuCI49nw3XYJxHCsuz2
 XPal/NGKv4jm4kCMwQAAQoAHRYhBO9mDQdGP4tyanlUE9ju1/PIO/qaBQJqPWfbAAoJENju1/PI
 O/qaU5UP/2SVikDFbqwZ+2af+dQucPhZeosARHSOhCUB+rHosxc/r5VM0yidQ5vbYLnNYELpMZa
 gWJQTG1TedYeL8VPDW/PEI1rUsdOBYYpQYX8tZxttrzLlJ3mHNwXOI+CdPR0XikaVsK88qwznda
 nBtUgdWDapVp2YN9jfJz/GDN517yZ/zgEeWV1lBF+IPImH0YR2cNpimq+WdSaTfwC5vIbe4sgbG
 iW82OZsW/QfCHQALypsentHARXfSyjQKyOlmSzl3nqJVegB5KcxbFgRWg9trf7aXLAem18QXeDZ
 xKceloprnmzSXaR+3OROg3Uo0lyEbIUd8U+JD0V/qTrR5kUuL2YYdJyyjFSvTStNmU4Om0saLG9
 SigHkeVOOrzoPvBrrYHHMbKKtdycZkXzXm57G6siNBwtAXuLGSY82AN3HuZ6YtujgBHfqLldN/C
 /CMKW5q+KdbSXeXXz0GewI3BIczkcVacjDYpTNiCrJ7KwNukCsijc7TJFwcJ4Lq4IAkda/X7sWj
 0Zo/37TikuMNAh99UaaYoxA7EeZBFJDx1ceMifW17h5+WMHs1ViV0gMnRLcIhJfWajl0qEMAEl4
 0it/TUTYzmleJoMl6QoMHcF/AqGgGeMSBi8JkQkQfAHfwpNqlhUhf926L7qtBe/w0WHfMNZ9wMg
 LXC3M0XJBzP3U9faGQNcjIA==
X-Developer-Key: i=sebastian.reichel@collabora.com; a=openpgp;
 fpr=EF660D07463F8B726A795413D8EED7F3C83BFA9A

Cleanup code by replacing open-coded version of FIELD_PREP_WM16_CONST
with the existing helper macro.

Reviewed-by: Neil Armstrong <neil.armstrong@linaro.org>
Signed-off-by: Sebastian Reichel <sebastian.reichel@collabora.com>
---
 drivers/phy/rockchip/phy-rockchip-usbdp.c | 6 +++---
 1 file changed, 3 insertions(+), 3 deletions(-)

diff --git a/drivers/phy/rockchip/phy-rockchip-usbdp.c b/drivers/phy/rockchip/phy-rockchip-usbdp.c
index 6ec9ab9d1e64..1bae8172d1fe 100644
--- a/drivers/phy/rockchip/phy-rockchip-usbdp.c
+++ b/drivers/phy/rockchip/phy-rockchip-usbdp.c
@@ -12,6 +12,7 @@
 #include <linux/clk.h>
 #include <linux/delay.h>
 #include <linux/gpio.h>
+#include <linux/hw_bitfield.h>
 #include <linux/mfd/syscon.h>
 #include <linux/mod_devicetable.h>
 #include <linux/module.h>
@@ -75,7 +76,6 @@
 #define TRSV_LN2_MON_RX_CDR_DONE_OFFSET		0x1b84	/* trsv_reg06E1 */
 #define TRSV_LN2_MON_RX_CDR_LOCK_DONE		BIT(0)
 
-#define BIT_WRITEABLE_SHIFT			16
 #define PHY_AUX_DP_DATA_POL_NORMAL		0
 #define PHY_AUX_DP_DATA_POL_INVERT		1
 #define PHY_LANE_MUX_USB			0
@@ -104,8 +104,8 @@ struct rk_udphy_grf_reg {
 #define _RK_UDPHY_GEN_GRF_REG(offset, mask, disable, enable) \
 {\
 	offset, \
-	FIELD_PREP_CONST(mask, disable) | (mask << BIT_WRITEABLE_SHIFT), \
-	FIELD_PREP_CONST(mask, enable) | (mask << BIT_WRITEABLE_SHIFT), \
+	FIELD_PREP_WM16_CONST(mask, disable), \
+	FIELD_PREP_WM16_CONST(mask, enable), \
 }
 
 #define RK_UDPHY_GEN_GRF_REG(offset, bitend, bitstart, disable, enable) \

-- 
2.53.0

