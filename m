Received: from bali.collaboradmins.com (bali.collaboradmins.com [148.251.105.195])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 3724F38D3FE;
	Fri, 12 Jun 2026 16:21:56 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=148.251.105.195
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1781281322; cv=none; b=Fv/f7LrOgNDfvt5kPC9skFV0Vc6B1Kt1u+ED2+M8EkgZg4zAkmFtQtmZR9EQXt9uz/RIGG/1yVf7Q9CucQJKnWNV2LIABOXnQPQShU1Nhp91LgL8qmK0f5hr/W9aGA4WFCL8lHVtlksB6t3DPZeuTHKMK9AYvvM+Vx9d8PkaCxE=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1781281322; c=relaxed/simple;
	bh=fHxmMNes7ZoyxfLo002TT//4L/5fwSuOfG1Hg+T4k4E=;
	h=From:Date:Subject:MIME-Version:Content-Type:Message-Id:References:
	 In-Reply-To:To:Cc; b=i2G3M3g4QWbQC0nU/d0M4s6vK/dC0zqOQeWufCFKuz3HaJYUcf0stgeYxMxa+apzo7xeEMrcFlJ/P9YB2E9MKJFKqXzCgGp034udmany4GVJ2QziAFvPj9pvRzQm4GUSElcXMj1ysvY47OIEyVyRt0Ivd4Lti8gWXHhyaYCHlr4=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=collabora.com; spf=pass smtp.mailfrom=collabora.com; dkim=pass (2048-bit key) header.d=collabora.com header.i=@collabora.com header.b=B1W631o2; arc=none smtp.client-ip=148.251.105.195
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=collabora.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=collabora.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=collabora.com header.i=@collabora.com header.b="B1W631o2"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=collabora.com;
	s=mail; t=1781281314;
	bh=fHxmMNes7ZoyxfLo002TT//4L/5fwSuOfG1Hg+T4k4E=;
	h=From:Date:Subject:References:In-Reply-To:To:Cc:From;
	b=B1W631o2NwDijEBS+NN+YRNsaJ+FSFsSwJcFQgeks+aJYqa0ENzv6YsyBbxFmmeVM
	 WeCDV43s1erTBAvoat5hii8BKoQKkkzwbFf3lylJENLH4MGmFGbHesRwB5st+0BFoO
	 Z0KXnZA+e/NaLJz8+ippsXAaUQ0MkwfeJc8AWrWDmgNcFCHognGdvAbHTFwiJ0lhJ/
	 4QeZlAqsf3GyD6wEiyVVuS14rcWIlVIp5mPGgLlMf25GV2mppHyBrzNF4OFvBg6MNl
	 a/9VJUvWKDM62l6+LjFo44alk/516q4zchWvah43qkJ7smnOw5F7ObJdrT8KVGytwv
	 2w2JlZRa7R4mg==
Received: from jupiter.universe (unknown [100.64.1.62])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (4096 bits) server-digest SHA256)
	(No client certificate requested)
	(Authenticated sender: sre)
	by bali.collaboradmins.com (Postfix) with ESMTPSA id 23E3E17E0D9D;
	Fri, 12 Jun 2026 18:21:54 +0200 (CEST)
Received: by jupiter.universe (Postfix, from userid 1000)
	id C9D7E48002F; Fri, 12 Jun 2026 18:21:53 +0200 (CEST)
From: Sebastian Reichel <sebastian.reichel@collabora.com>
Date: Fri, 12 Jun 2026 18:21:42 +0200
Subject: [PATCH v5 04/18] phy: rockchip: usbdp: Amend SSC modulation
 deviation
Precedence: bulk
X-Mailing-List: devicetree@vger.kernel.org
List-Id: <devicetree.vger.kernel.org>
List-Subscribe: <mailto:devicetree+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:devicetree+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20260612-rockchip-usbdp-cleanup-v5-4-efc83069869f@collabora.com>
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
 Sebastian Reichel <sebastian.reichel@collabora.com>
X-Mailer: b4 0.14.3
X-Developer-Signature: v=1; a=openpgp-sha256; l=1765;
 i=sebastian.reichel@collabora.com; h=from:subject:message-id;
 bh=AuNc/Qcz/Iy4+CnR35UWZ2mhDOOwaiShV6QzYNmhadk=;
 b=owJ4nAFtApL9kA0DAAoB2O7X88g7+poByyZiAGosMiEBk/p4wvRltQ/6MQNcO93v7g1d+zn4Y
 KUu2vOgY6YM1YkCMwQAAQoAHRYhBO9mDQdGP4tyanlUE9ju1/PIO/qaBQJqLDIhAAoJENju1/PI
 O/qa1zQP/0+jwFH8WJKwMAW0foRNhSecnDIz3rN4WzQRMgbg8U8gMLUgSlkUmjx4nlhT1yDdBgV
 REM+3MD62hTwXQJrL1DqIc21AYKaGffot8QQMMLLNCO0SI//CrkRYuEpLYtLKVtCy9xaN1CdYyh
 k17mFpPCYSytwp+HKK7zw0xocqZXUxh8q4PlwOYRUR1O0BFk4q/UZ7JeadpSMECBd/2/UE1oEEQ
 XoD1VRlECxLTYLcQvLkzMDelTn1u+3jWUMpdJJRoTl4lwH9JNpMhun7g9vpcqBhWY0WkTHyjDyb
 21mXwl0cyRQ9ymeQe88aeDiiwkdXYfbNc9wkPsqv2+n/JdwVT+v3TVYVwHYR89IuK3iU6u1/lpY
 Zz185YgExCF0DqPiUgsUueQnRuyGvo7eSP1wFwpmo20TJEgiSi9SkM/t6yS6DnyD/SJuLOO3oaE
 ju3qzwSqag9RdyJ8FzpjCo8OLwe1ccYPpzDCer+yFjzMJCGx+puxxkz0+p0f2ZibEEdFSQCSyEw
 2Jqg5f/JTf32WlwB6JJEui+Ndy8cerTsTnfFx5BWMcIZ9WhfGS5a9t+19OYTVixawGZREpYqNtg
 vKt6Q6GkEnK8BSnctOb0lmeL15hOvNAfEcwUED5PzgM3LB+2MnHwxDXneJochPzfUNRMACP1zg/
 cnGavRJ+EqbKXRWjBVm4qIw==
X-Developer-Key: i=sebastian.reichel@collabora.com; a=openpgp;
 fpr=EF660D07463F8B726A795413D8EED7F3C83BFA9A

From: Frank Wang <frank.wang@rock-chips.com>

Move SSC modulation deviation into private config of clock

 - 24M: 0x00d4[5:0] = 0x30
 - 26M: 0x00d4[5:0] = 0x33

Signed-off-by: Frank Wang <frank.wang@rock-chips.com>
[Taken over from rockchip's kernel tree; register 0x00d4 is not
described in the TRM]
Reviewed-by: Neil Armstrong <neil.armstrong@linaro.org>
Signed-off-by: Sebastian Reichel <sebastian.reichel@collabora.com>
---
 drivers/phy/rockchip/phy-rockchip-usbdp.c | 8 ++++----
 1 file changed, 4 insertions(+), 4 deletions(-)

diff --git a/drivers/phy/rockchip/phy-rockchip-usbdp.c b/drivers/phy/rockchip/phy-rockchip-usbdp.c
index 98562a888b42..1f686844c337 100644
--- a/drivers/phy/rockchip/phy-rockchip-usbdp.c
+++ b/drivers/phy/rockchip/phy-rockchip-usbdp.c
@@ -350,7 +350,8 @@ static const struct reg_sequence rk_udphy_24m_refclk_cfg[] = {
 	{0x0a64, 0xa8}, {0x1a3c, 0xd0},
 	{0x1a44, 0xd0}, {0x1a48, 0x01},
 	{0x1a4c, 0x0d}, {0x1a54, 0xe0},
-	{0x1a5c, 0xe0}, {0x1a64, 0xa8}
+	{0x1a5c, 0xe0}, {0x1a64, 0xa8},
+	{0x00d4, 0x30}
 };
 
 static const struct reg_sequence rk_udphy_26m_refclk_cfg[] = {
@@ -377,7 +378,7 @@ static const struct reg_sequence rk_udphy_26m_refclk_cfg[] = {
 	{0x0c30, 0x0e}, {0x0c48, 0x06},
 	{0x1c30, 0x0e}, {0x1c48, 0x06},
 	{0x028c, 0x18}, {0x0af0, 0x00},
-	{0x1af0, 0x00}
+	{0x1af0, 0x00}, {0x00d4, 0x33}
 };
 
 static const struct reg_sequence rk_udphy_init_sequence[] = {
@@ -412,8 +413,7 @@ static const struct reg_sequence rk_udphy_init_sequence[] = {
 	{0x0070, 0x7d}, {0x0074, 0x68},
 	{0x0af4, 0x1a}, {0x1af4, 0x1a},
 	{0x0440, 0x3f}, {0x10d4, 0x08},
-	{0x20d4, 0x08}, {0x00d4, 0x30},
-	{0x0024, 0x6e},
+	{0x20d4, 0x08}, {0x0024, 0x6e}
 };
 
 static inline int rk_udphy_grfreg_write(struct regmap *base,

-- 
2.53.0

