Received: from bali.collaboradmins.com (bali.collaboradmins.com [148.251.105.195])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id CCF573ED5DA;
	Thu, 25 Jun 2026 17:39:44 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=148.251.105.195
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1782409186; cv=none; b=kYcTmDW3PWqHNhApiyco245aGI7jS72js1uBZnpGHVfbVb2o201QV4IgdVzRHmzbSCJwTWMJqUoDDhrfNwawjUBGlcKr8vavwD5Xx50JajqG7jFjUANtITfZku2NvbBabxKm2JFLuAFvmD9yHZyiyIKfBhhZ0lnEacg1PKm9xz8=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1782409186; c=relaxed/simple;
	bh=ZLMIcvyfhf9stnxjwRcLTo+Dil/1ZTGfZYTsbsf7ywg=;
	h=From:Date:Subject:MIME-Version:Content-Type:Message-Id:References:
	 In-Reply-To:To:Cc; b=r9/fc2jYSku6MJhXjvpbbIIZDC3GKdnemHinoDysypUzj6qmmzN38rhMxmFi3xUUFGLs2sm03y7tDe3WgsLCBr60OM/ywuKF2t3MrR6uhGe2rqBCiPuvZCNGdovXRccoh1AoezSHHz2j2D7KAz6N5IsLYwt/oz8PwgmO4lcgWps=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=collabora.com; spf=pass smtp.mailfrom=collabora.com; dkim=pass (2048-bit key) header.d=collabora.com header.i=@collabora.com header.b=W3V5h1jK; arc=none smtp.client-ip=148.251.105.195
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=collabora.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=collabora.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=collabora.com header.i=@collabora.com header.b="W3V5h1jK"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=collabora.com;
	s=mail; t=1782409180;
	bh=ZLMIcvyfhf9stnxjwRcLTo+Dil/1ZTGfZYTsbsf7ywg=;
	h=From:Date:Subject:References:In-Reply-To:To:Cc:From;
	b=W3V5h1jKd5EgJ3YCKhcOLx4CEfg0Ir1rWsDCo7B02iINQVz8g7S/El270y8oogL0R
	 VARSKoOS9AykMYXcqxOuPBDZB3kIkiGD46L3sQRmRKQ97tSuB9XRjpFwE/3vwPMIJd
	 F0clcLHRNXrFmBK76QfdxYnQBSqsGRyDlJEGAZfGZL4b8GM9yHp54C3j/ynea9u81X
	 rggfM9G0WYaTfzh7XVMKdBgqcUTo8X8laipaW9DdN6+6jKDybfQRZ9Mh3di2oBCcV+
	 5VzFuK1eLzKxittvbBhu9sHpDFU1hO6xrJLHThZNRITBcUYtOzGDBqHqUypMvaXe5h
	 xXASRnMgCN5Yg==
Received: from jupiter.universe (unknown [100.64.1.62])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (4096 bits))
	(No client certificate requested)
	(Authenticated sender: sre)
	by bali.collaboradmins.com (Postfix) with ESMTPSA id B70B017E14E5;
	Thu, 25 Jun 2026 19:39:40 +0200 (CEST)
Received: by jupiter.universe (Postfix, from userid 1000)
	id 07EE648003D; Thu, 25 Jun 2026 19:39:40 +0200 (CEST)
From: Sebastian Reichel <sebastian.reichel@collabora.com>
Date: Thu, 25 Jun 2026 19:39:37 +0200
Subject: [PATCH v7 10/27] phy: rockchip: usbdp: Amend SSC modulation
 deviation
Precedence: bulk
X-Mailing-List: devicetree@vger.kernel.org
List-Id: <devicetree.vger.kernel.org>
List-Subscribe: <mailto:devicetree+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:devicetree+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20260625-rockchip-usbdp-cleanup-v7-10-38eb3cf654fd@collabora.com>
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
X-Developer-Signature: v=1; a=openpgp-sha256; l=1765;
 i=sebastian.reichel@collabora.com; h=from:subject:message-id;
 bh=kEWHRK8i2SbYzK/Rz+AaRU4u77b8etZZ1XWjvVUgC4M=;
 b=owJ4nAFtApL9kA0DAAoB2O7X88g7+poByyZiAGo9Z9vY1DH2sUtWebr+JxEJ0EteToQY6iQHr
 gjnDUnBx8B/XYkCMwQAAQoAHRYhBO9mDQdGP4tyanlUE9ju1/PIO/qaBQJqPWfbAAoJENju1/PI
 O/qaWTUQAI9K8AajHl1e0M96SY/JACpEkY7ASjA4wm/kwDx1+3J1Zzho2qa1UG9j6Caa7SC5Yq+
 ZlMaiKmeIcBgrkoo/32fZX6Axp1BZFPXFGxVqGw/cVh7ELqvsQGTVar3c96MSOzBOSncf18mxv5
 2RtKypSy8dm8rhn/t1mKRy+2hCDU1CQiMYZuWlfWgVBv1lPJt7MNEtJHrkOrhIhl54QjGx7wdn4
 VnqokD7oFY80X5pGsYUUQwFtEqQE24PJeo1vFVfIbddidiAADHkpSOy5DXGzjrZk2uDi1emsb2m
 ApIOf3U+LXlUjsKJkxpvJAMk6QCpIZ3squoNce0i+gPUst3hya46+YSKVwTiPX7KyoscJcTLxE+
 TIxy6mfUaTIZUr7ysnvp3bf8dAsGxl7iz8oG6CFGgP7dfXQK9O8isaSE5iL3TAQEvCTkyJ2HmD5
 Ot0xIU43Qf4EUgTJVvGc154cnyXcRStU7wK5xzmQNZKiwOb7pO6GtHjzR23jLCvqC0A0iVgLb/x
 j/SMD0VvHs5i0jlJ4j5jIPJsyXs7IahiL9L7C28KIc3F6AmBTJ6wkkA6V92k9p9PPOYbP+opcHS
 ECuHzvnOn2xC8WcQtySKTRZOuMqSg7gA77gWVMOF4mdM340NTrsa0orXPDPCGKx20oTiKwfPhvJ
 ZbmegAcdKHq77rWej1x4myA==
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
index 989a7884d8b5..93df673e181b 100644
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

