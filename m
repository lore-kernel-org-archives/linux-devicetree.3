Received: from bali.collaboradmins.com (bali.collaboradmins.com [148.251.105.195])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id C11C83ED5D0;
	Thu, 25 Jun 2026 17:39:44 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=148.251.105.195
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1782409186; cv=none; b=smPqkb+0EzQpXnpJkFd71WsTi0pG7fyrnwWhzKypVndVPdOOeQIVZ6r+xR/Z9yg6MMQQ2gigNUEStHDXjDz0bNy97vAi2a2/f+XsQNmklZNMwCp8v5zW1YyhaQDyOh8RwJU6qpBp4lU/K3MPXrqSup+45g2U9pJiKaBBpn12Svs=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1782409186; c=relaxed/simple;
	bh=HZ/3ES/nIovGU0qa5ahu6BZsbPwj2mb1498FeAaaX4s=;
	h=From:Date:Subject:MIME-Version:Content-Type:Message-Id:References:
	 In-Reply-To:To:Cc; b=gQOQxLvepfY+VODd6ibcEEvvgwXaFCH5yQU/4poGSfbaDdKUaooApZt6WyoCD0SXEBH5hiWVGriTK0vGdbVWTX+66uL17zsseeVOybmNmDQVEj+BRsqgdivwK6DVg0SM+Ygo1nX6Un8kiZO1Jm6FjZfwMeo2TzX3/8uEL5NdDQE=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=collabora.com; spf=pass smtp.mailfrom=collabora.com; dkim=pass (2048-bit key) header.d=collabora.com header.i=@collabora.com header.b=INN3dmDO; arc=none smtp.client-ip=148.251.105.195
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=collabora.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=collabora.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=collabora.com header.i=@collabora.com header.b="INN3dmDO"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=collabora.com;
	s=mail; t=1782409180;
	bh=HZ/3ES/nIovGU0qa5ahu6BZsbPwj2mb1498FeAaaX4s=;
	h=From:Date:Subject:References:In-Reply-To:To:Cc:From;
	b=INN3dmDONpdACBs2Faq5TOxhMJsjqKiudzLLLUi8+TpB9332K30xwNTH2moLipD0H
	 qtMs27h5JMfEi53h7cHZf1VW6MvSGrMkQmOhy+RFGkO+6sgSS8PBZvjgHCCw7NvMjd
	 A6TJwWjx3ef/n+vyoaFJHffiAfJc/0ezPtvLqrk6nvfBPRih0/1QAGDhw2N2aLJaWb
	 IjEOTXHh6aod1/4avE8FPY/kFxFYyY1MxMdPEvVGE9GPaYHeDbMIo17GZW75upE4il
	 BQoseSdad3ArzTRO/UqBFGTq8a0zX0D/uV8tflyweuKk4FMxuWN1pw4gSyoBNJ5Xmr
	 q8uuYbKeUyqdw==
Received: from jupiter.universe (unknown [100.64.1.62])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (4096 bits))
	(No client certificate requested)
	(Authenticated sender: sre)
	by bali.collaboradmins.com (Postfix) with ESMTPSA id A60B117E1270;
	Thu, 25 Jun 2026 19:39:40 +0200 (CEST)
Received: by jupiter.universe (Postfix, from userid 1000)
	id 0511C480038; Thu, 25 Jun 2026 19:39:40 +0200 (CEST)
From: Sebastian Reichel <sebastian.reichel@collabora.com>
Date: Thu, 25 Jun 2026 19:39:35 +0200
Subject: [PATCH v7 08/27] phy: rockchip: usbdp: Limit DP lane count to
 muxed lanes
Precedence: bulk
X-Mailing-List: devicetree@vger.kernel.org
List-Id: <devicetree.vger.kernel.org>
List-Subscribe: <mailto:devicetree+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:devicetree+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20260625-rockchip-usbdp-cleanup-v7-8-38eb3cf654fd@collabora.com>
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
 Sebastian Reichel <sebastian.reichel@collabora.com>, 
 Sashiko <sashiko-bot@kernel.org>
X-Mailer: b4 0.14.3
X-Developer-Signature: v=1; a=openpgp-sha256; l=1284;
 i=sebastian.reichel@collabora.com; h=from:subject:message-id;
 bh=HZ/3ES/nIovGU0qa5ahu6BZsbPwj2mb1498FeAaaX4s=;
 b=owJ4nAFtApL9kA0DAAoB2O7X88g7+poByyZiAGo9Z9s7BBRaoGAP0HJiJtSiaFFqF73MUetNp
 1gDJFjNpR2B5IkCMwQAAQoAHRYhBO9mDQdGP4tyanlUE9ju1/PIO/qaBQJqPWfbAAoJENju1/PI
 O/qaKIIP/RgT8jh+Ou1c6H14CCRijJkxKMl4Y9m1FEHTFknbVaJATH3uu6Pcwuz1Jf33GLeJeaa
 LdhW7DEwOTtrIbIoxHTlRNiC197WEC99oawF7mGolgkwoTQGMD7pwmpYxz5MnKBAbpu6B5J2Vs/
 Yu4QBia4gdqiZ8gKUdfBcw92lVAH8e2yePbo5ZtQoYelz9UHwWZAKncBO6/Zm0U+jLnRKqOL4y/
 2T8FyY4Ly8Bbr+q/idIjCpE+WJtEIUvVsQi+oJCg/Z8g+1gFbZMG29eyWAE8YuSqIDEJwhmiZ3T
 QYmFpRvDWmfkd36mL2FzscwdnY7SoNe8Jd9ZA2ux9uUyUqQG9JjrfSEZTNxy93NkBJFV8/arixs
 Rv0VaT2sk35nKLgzrC7O/jCM6CO3QukL5Ex9K6MracIt41XHFYBa9j3mXShTOBAEY4an8V6MNJ/
 HEbVxQIE7pDaGBeUHKAhSgwSQwinqqKBoIfCQ2X/D7+0X8WMdRCUPyKwVv1Co8jXUzXWhETnWkq
 LqUE5IL26AdqEhcwhQxIXTOhTeEb0RGZ0HEtRH0sd10xKQKBzeiEXf2VEoAnkdMWcmtJszCQMwe
 c95ZLps+JQViQ+UEqS9FAridTs6wnQZSMUgOW913ycS7jEqD/hgnEjvsadqPbzeq60EKaotQAau
 rQP3kRE7PqM6PO05I1TwZhQ==
X-Developer-Key: i=sebastian.reichel@collabora.com; a=openpgp;
 fpr=EF660D07463F8B726A795413D8EED7F3C83BFA9A

In theory the DP controller could request 4 lanes when the PHY is
restricted to 2 lanes as the other half is used by USB3.

With the current user (DW-DP) this cannot happen, but as the check is
cheap and users might change in the future protect things accordingly.
Not doing so would corrupt USB3 usage by the following code configuring
the voltages.

Fixes: 2f70bbddeb45 ("phy: rockchip: add usbdp combo phy driver")
Reported-by: Sashiko <sashiko-bot@kernel.org>
Closes: https://lore.kernel.org/linux-phy/20260612165546.98E1F1F000E9@smtp.kernel.org/
Signed-off-by: Sebastian Reichel <sebastian.reichel@collabora.com>
---
 drivers/phy/rockchip/phy-rockchip-usbdp.c | 3 +++
 1 file changed, 3 insertions(+)

diff --git a/drivers/phy/rockchip/phy-rockchip-usbdp.c b/drivers/phy/rockchip/phy-rockchip-usbdp.c
index 121dd78d8c16..2324f9050f63 100644
--- a/drivers/phy/rockchip/phy-rockchip-usbdp.c
+++ b/drivers/phy/rockchip/phy-rockchip-usbdp.c
@@ -1132,6 +1132,9 @@ static int rk_udphy_dp_phy_verify_link_rate(struct rk_udphy *udphy,
 static int rk_udphy_dp_phy_verify_lanes(struct rk_udphy *udphy,
 					struct phy_configure_opts_dp *dp)
 {
+	if (dp->lanes > udphy->dp_lanes)
+		return -EINVAL;
+
 	switch (dp->lanes) {
 	case 1:
 	case 2:

-- 
2.53.0

