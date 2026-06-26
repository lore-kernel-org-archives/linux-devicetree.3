Received: from bali.collaboradmins.com (bali.collaboradmins.com [148.251.105.195])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 4A2573C343E;
	Fri, 26 Jun 2026 20:55:10 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=148.251.105.195
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1782507312; cv=none; b=jbLAH9GDIxVwegdVQyq6uv1grlyroDgEaEiK/yrlAh6VNpYTqixIs8hap1RwZF/mLZaS8VT7NDyeDsio1XUS9oodWWMkpK8Uy/Hc/EvsvQ4K9APoyBOI3K88EtKfo2qxYIxjdyMgKgnoIKV/VOnEOKqnsDqY5Cl2xDjpfoWuNiU=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1782507312; c=relaxed/simple;
	bh=zUXIVNlYFpb7JLPZE2WGx1V+P1LbLJfUycXU2leOX4I=;
	h=From:Date:Subject:MIME-Version:Content-Type:Message-Id:References:
	 In-Reply-To:To:Cc; b=V/YKyq5bvowZa/5kxz90YKlSQ6Lg6D6QekZbqD18bZ/vjWsYIMaLXGAfsDDmBJord+C1L4QCzXKJLuVryqe3BIYJln2MC5RePVyvsx2tQQ2RHxJRyKItHeBTvbMyCsxd/QzNxFlSGv2ltyiNf3bfxdeJYTlgWbGiCk/AYX6pJKc=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=collabora.com; spf=pass smtp.mailfrom=collabora.com; dkim=pass (2048-bit key) header.d=collabora.com header.i=@collabora.com header.b=O76cntWN; arc=none smtp.client-ip=148.251.105.195
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=collabora.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=collabora.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=collabora.com header.i=@collabora.com header.b="O76cntWN"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=collabora.com;
	s=mail; t=1782507303;
	bh=zUXIVNlYFpb7JLPZE2WGx1V+P1LbLJfUycXU2leOX4I=;
	h=From:Date:Subject:References:In-Reply-To:To:Cc:From;
	b=O76cntWNZNpRD+3HpQTIcWm+vnjpOiUnteGTXo2juM6HR/w00Tvht7LSNhnDrA+Ht
	 /Aewy6tXEgigOKKOJEpF+qrnQ0UmBmB/XeYi77jo5xzTHhD7O07/++7du9feTvNYjV
	 0Exqolz8jemtx9dnQjUNLz37ywiLhKIxSm9PbHnQo12txRUG1VivdyT1D1Dw+yCiy1
	 ElcfNqcmboMEyZT54HtjmV2CKaAGoEf26IcmkvtLlnqtJqc3RiIX33GNdStq66GznG
	 Gsm9S8u+GjI02neOWcmlIyB1eannGyyuh39KT6psj9cPuAbx2J88ykZt0y5NBEz65A
	 M8mRiSn6X3ksQ==
Received: from jupiter.universe (unknown [100.64.1.62])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (4096 bits))
	(No client certificate requested)
	(Authenticated sender: sre)
	by bali.collaboradmins.com (Postfix) with ESMTPSA id 08D8D17E1576;
	Fri, 26 Jun 2026 22:55:03 +0200 (CEST)
Received: by jupiter.universe (Postfix, from userid 1000)
	id 214EC480052; Fri, 26 Jun 2026 22:55:02 +0200 (CEST)
From: Sebastian Reichel <sebastian.reichel@collabora.com>
Date: Fri, 26 Jun 2026 22:55:08 +0200
Subject: [PATCH v8 15/29] phy: rockchip: usbdp: Use FIELD_PREP_WM16_CONST
Precedence: bulk
X-Mailing-List: devicetree@vger.kernel.org
List-Id: <devicetree.vger.kernel.org>
List-Subscribe: <mailto:devicetree+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:devicetree+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20260626-rockchip-usbdp-cleanup-v8-15-47f682987895@collabora.com>
References: <20260626-rockchip-usbdp-cleanup-v8-0-47f682987895@collabora.com>
In-Reply-To: <20260626-rockchip-usbdp-cleanup-v8-0-47f682987895@collabora.com>
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
 bh=zUXIVNlYFpb7JLPZE2WGx1V+P1LbLJfUycXU2leOX4I=;
 b=owJ4nAFtApL9kA0DAAoB2O7X88g7+poByyZiAGo+5yUWotN674cF4uiIMplDCYnxjyc8HYtIE
 F4Y2LQ1qYWazIkCMwQAAQoAHRYhBO9mDQdGP4tyanlUE9ju1/PIO/qaBQJqPuclAAoJENju1/PI
 O/qaw5cP/jiw83L7uKUSYt07hAhQmXqsBYt2mV5tzQATxag1uH30PYUKH/zGq7qnv8cvzakv0Yb
 /vXtXRWJwP7ey/2ZYMT1Ut/G3c9qNxwTAlPe49qTMFV92RcKsdnq4A7kzXvrw5lybSufNzUgpN+
 KZkbOGqvFcGOhbcZqe+n3obN/gqgQxGGXjv6dnj3IhlwY4FiF/TNJDsycsaxl5bpl5CFBUsKRGo
 KbRW3+gknmb9QAz8OPRE3CMdOiMhb5q32yeksBLvr5cezbbjdtUYWeYj0xDJWdojXf9pl1otQkI
 LXUsTI1uFIUjMIz1CQUxqDFZiAJjyLzyrRgrQPw6G9wcjYb6nqs9dKaDur2F/sXboG7SlCJJhb+
 lemZVP+XUM3UdEJXzsljPwFiefYMe2K4KYcCqq5lItOgC0Gg440GKxCYCz9HlhAIoKl3XhenFzW
 FDMvbDRrsCl6IQU7ijwJ9VOxMQhGV2FjZC8Dp5yntz/EhaUm1nMvi+UT0/HdEEDhmrolVmdxtv5
 j8k70E60aqTcvPlA5lovq6I7cjGN+xQmzLYdK7ah25zlxyaSck0ES3OEwmAbntEIYKKpDRIw5pK
 pyjpcwol8BqoJm3Gp+oqipM7NGJI2j/jyqI//6UmxsklEnJaTthH56MWUiR0m888a5+hzV+KmDr
 tnwasStjf5UwQcrbbsTkuHQ==
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
index db1ad3c2a953..d8978cd22707 100644
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

