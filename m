Received: from bali.collaboradmins.com (bali.collaboradmins.com [148.251.105.195])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 3C6DE3EFD15;
	Thu, 25 Jun 2026 17:39:48 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=148.251.105.195
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1782409190; cv=none; b=ZAYhxem9Ykod0b4udA2U5xDyWDpiRO4diOsJJnFm1RVMvw+cPtSxwiBDMUDM4zQS0+QuVmQ4Q4ASe9ki7nDXF0UXgt7BVXnT+YMW+SU6khu4gNW+DK0YCt5Pze7+Swk1E/uPcaUPC1SqBqgmljqKTe6KyBXAl9o6csUqE6HPwXc=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1782409190; c=relaxed/simple;
	bh=yCiw8z2UZvWRq9t6m2DjxSjwEpiHMLoGQwvUavl25U0=;
	h=From:Date:Subject:MIME-Version:Content-Type:Message-Id:References:
	 In-Reply-To:To:Cc; b=LthbBx3gUYNSqp9Qw6zvEz8kOYv6nRgveQVno4RI0V9XKGD61sR5Rhc+oWdBkGoZGP+EhKwGGJ+8RbaL1Bk67Ow6hvZKRy8SVcr2YIvG2BoGsn+pZiUa1ne+6B3Vkkgrtytjq7QikAWPBcdYWRFdp4XWSYAenYJ1MDMv1+xQZWg=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=collabora.com; spf=pass smtp.mailfrom=collabora.com; dkim=pass (2048-bit key) header.d=collabora.com header.i=@collabora.com header.b=Mv0eJlcp; arc=none smtp.client-ip=148.251.105.195
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=collabora.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=collabora.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=collabora.com header.i=@collabora.com header.b="Mv0eJlcp"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=collabora.com;
	s=mail; t=1782409181;
	bh=yCiw8z2UZvWRq9t6m2DjxSjwEpiHMLoGQwvUavl25U0=;
	h=From:Date:Subject:References:In-Reply-To:To:Cc:From;
	b=Mv0eJlcp5oMIUruB6ek22DodS+kYVJixkO19OnxGBEwRD3qBTvCu05q8cbzNB2WXD
	 ZpPXfNlNfunXIj6+fanb3JyuDiEeiWA3C+BC1VhbfEjIgAsRgw9d8SeXD8PnFTsOHf
	 j/+dcNpCBW7LfXIxAEDdL3WlXES2pkWXykbLC2Xpr8zGZiN5Nije6G829eXd9dhFlq
	 Cf3SiIltdL5sS+myynH3+Uyi6KjTkTYFNUb3Q8XM8pO3pKcYlC70DwB+bcwjhr/7j2
	 m63xdu/lrShqMbmCr8kfMgQUK6UVSz2E6iNnbSIrwbyHryTROKbauphwvl0mdfGIuR
	 L6MWk/cNhVmkg==
Received: from jupiter.universe (unknown [100.64.1.62])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (4096 bits))
	(No client certificate requested)
	(Authenticated sender: sre)
	by bali.collaboradmins.com (Postfix) with ESMTPSA id 39BA217E15C4;
	Thu, 25 Jun 2026 19:39:41 +0200 (CEST)
Received: by jupiter.universe (Postfix, from userid 1000)
	id 1D76A48006A; Thu, 25 Jun 2026 19:39:40 +0200 (CEST)
From: Sebastian Reichel <sebastian.reichel@collabora.com>
Date: Thu, 25 Jun 2026 19:39:52 +0200
Subject: [PATCH v7 25/27] phy: rockchip: usbdp: Hold mutex in DP PHY
 configure
Precedence: bulk
X-Mailing-List: devicetree@vger.kernel.org
List-Id: <devicetree.vger.kernel.org>
List-Subscribe: <mailto:devicetree+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:devicetree+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20260625-rockchip-usbdp-cleanup-v7-25-38eb3cf654fd@collabora.com>
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
X-Developer-Signature: v=1; a=openpgp-sha256; l=1341;
 i=sebastian.reichel@collabora.com; h=from:subject:message-id;
 bh=yCiw8z2UZvWRq9t6m2DjxSjwEpiHMLoGQwvUavl25U0=;
 b=owJ4nAFtApL9kA0DAAoB2O7X88g7+poByyZiAGo9Z9ve13T9kS1Y1cp+2SyUK0AKoRggdPYXM
 aO9LllARPBLtYkCMwQAAQoAHRYhBO9mDQdGP4tyanlUE9ju1/PIO/qaBQJqPWfbAAoJENju1/PI
 O/qaJNEP/016qdNdDOzwbpj1GGmCDiNIYR9GTMTmljYGfKbPEct6tGF34nRNOA5CFhdhEoEdfK5
 m80x+CfCgpquYWm9Lmg+C7USEoLVfxAiwx70eOkksqllaAqCadBSe6fjow9PihdevhnguPtgY7O
 nSJ5rEl4wxgN1XUWezzEVK3kggefE4H2eyMh4Zk62TExL1+uTglWumNAi4/7dGBJBWRljJsZ/9T
 fdTanzypeuPp4uhdAyaiVHMIyPXB/0KJK+uuRcpKIHUnAm/USojOHs2fobsBRHgQxD7A5CkH1m8
 QhdA9t3KHmi7tUufD/L/gO1zLnesctgxBlHkCwDmurxXOAY2qASQQRlAz7DEXk1amVO+hpbSXsI
 GfvjRoV1R8N7d7mwN9odoEf/CuTSt97t9dgxF/SzJb/TYlJjcmpjJInYVVPIxq88g0UgyQz4zRS
 yJXqQuzxT2FT04NISKa1XY8THjNF33qFAkj6bJe7Db/W3t2MFqoGlVPRTI73ZMRc0SEPOolztLR
 gbxIa9xXak8xocz2nLNpvGtbBr0ftqqaWoPLPoVJwQ0Q0DmbX6Etn1yoTqImhSbjg5cmFkNdZw0
 eCD/jAO9scbcWXzAvrNRxYDuldVMk/hFZeFSSj3KEM0AU0yTlxA2FG7LFICQsNQqI+debtIU7Tt
 Yyg36/0KzivHoScmIcPMrZQ==
X-Developer-Key: i=sebastian.reichel@collabora.com; a=openpgp;
 fpr=EF660D07463F8B726A795413D8EED7F3C83BFA9A

rk_udphy_dp_phy_configure() accesses some variables from the struct
rk_udphy, which are updated independently from the USB-C framework.

The USB-C mux/orientation switch functions already hold a mutex to
ensure mutual exclusive access to the struct rk_udphy states, so
simply hold the same one in the DP PHY configuration function.

Reproducing problems due to this on real hardware would be really hard,
but could be possible when quickly re-connecting the USB-C connector.

Fixes: 2f70bbddeb45 ("phy: rockchip: add usbdp combo phy driver")
Reported-by: Sashiko <sashiko-bot@kernel.org>
Closes: https://lore.kernel.org/linux-phy/20260612164627.23D391F000E9@smtp.kernel.org/
Signed-off-by: Sebastian Reichel <sebastian.reichel@collabora.com>
---
 drivers/phy/rockchip/phy-rockchip-usbdp.c | 2 ++
 1 file changed, 2 insertions(+)

diff --git a/drivers/phy/rockchip/phy-rockchip-usbdp.c b/drivers/phy/rockchip/phy-rockchip-usbdp.c
index 182141837596..fc788f2bf5fb 100644
--- a/drivers/phy/rockchip/phy-rockchip-usbdp.c
+++ b/drivers/phy/rockchip/phy-rockchip-usbdp.c
@@ -1189,6 +1189,8 @@ static int rk_udphy_dp_phy_configure(struct phy *phy,
 	u32 i, val, lane;
 	int ret;
 
+	guard(mutex)(&udphy->mutex);
+
 	if (dp->set_rate) {
 		ret = rk_udphy_dp_phy_verify_link_rate(udphy, dp);
 		if (ret)

-- 
2.53.0

