Received: from bali.collaboradmins.com (bali.collaboradmins.com [148.251.105.195])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 7A0AA3B3BF7;
	Fri, 19 Jun 2026 15:29:02 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=148.251.105.195
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1781882944; cv=none; b=SvBFjbOGes5hyvk9/PrWsMuvWQgCUNupvMXc9Y7Cj0d66ECKKYNz01wvcrADOa0j+bjVhuFlAuQc5QZ9uF4P8D1BZFrhZWjzdqF11tgliD4CG6Q6pHuVtMlv0D5k2km9GuCd9RAQiFDiMsxcFNU1CjrQVFsEswmE5K7sFkViFAs=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1781882944; c=relaxed/simple;
	bh=f7KPjiSOnjCxa9RoMx7kPG+FkV/tgCDYiLWluj8oSYg=;
	h=From:Date:Subject:MIME-Version:Content-Type:Message-Id:References:
	 In-Reply-To:To:Cc; b=UDSQmsGoXgmD+DpkCkgozzi/5MibpPHVluOuOFeEkcDbgTmzqciVC/n0/rjoytyVN2/hlnC2J3Eot27MuzMQCR7j0f40QfrNgTTwaAay5kg3btARK3wSB1a6pc8rrBhHmRzFOHOApx/RoGf7KUBd1PZSNiObECTIO4wIWoMEzMc=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=collabora.com; spf=pass smtp.mailfrom=collabora.com; dkim=pass (2048-bit key) header.d=collabora.com header.i=@collabora.com header.b=ome+Hcxh; arc=none smtp.client-ip=148.251.105.195
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=collabora.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=collabora.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=collabora.com header.i=@collabora.com header.b="ome+Hcxh"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=collabora.com;
	s=mail; t=1781882938;
	bh=f7KPjiSOnjCxa9RoMx7kPG+FkV/tgCDYiLWluj8oSYg=;
	h=From:Date:Subject:References:In-Reply-To:To:Cc:From;
	b=ome+HcxhFaoTtPDT1PQk3AVR+RV2tLf9dnPu6iyI5lpnQQB2JitGmiGIte58TD3Zk
	 gzjyUDNhuRlQ/RurMa4OWYw4hu9griwb0EhG6tefdt7hnsBbJRtt+Ui606SvGt4tT6
	 P/h2P+6SQ9dWRph32L8mlc/9JyhGH0z8EjwzxckFmoYcoMW607Q+aH04J5iSEfWo35
	 XmPoH9+ZScQI4p6QqWf1gJaREsBtk/ebwWPBNzCBOwGmu9voSZ3pst6RK89SO0zsuW
	 5gVpUdR6d7tAGLihdzf5QNEJBYcIInIiiWQsZ6eS9CPNeNPFUr3H/GU7HrCRzsDe4z
	 wj1Ck/Idbgbkw==
Received: from jupiter.universe (unknown [100.64.1.62])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (4096 bits))
	(No client certificate requested)
	(Authenticated sender: sre)
	by bali.collaboradmins.com (Postfix) with ESMTPSA id 36EAD17E120F;
	Fri, 19 Jun 2026 17:28:58 +0200 (CEST)
Received: by jupiter.universe (Postfix, from userid 1000)
	id 9164F480035; Fri, 19 Jun 2026 17:28:57 +0200 (CEST)
From: Sebastian Reichel <sebastian.reichel@collabora.com>
Date: Fri, 19 Jun 2026 17:28:58 +0200
Subject: [PATCH v6 07/23] phy: rockchip: usbdp: Keep clocks running on PHY
 re-init
Precedence: bulk
X-Mailing-List: devicetree@vger.kernel.org
List-Id: <devicetree.vger.kernel.org>
List-Subscribe: <mailto:devicetree+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:devicetree+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20260619-rockchip-usbdp-cleanup-v6-7-3bb1f54b3f35@collabora.com>
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
 Sebastian Reichel <sebastian.reichel@collabora.com>
X-Mailer: b4 0.14.3
X-Developer-Signature: v=1; a=openpgp-sha256; l=1163;
 i=sebastian.reichel@collabora.com; h=from:subject:message-id;
 bh=f7KPjiSOnjCxa9RoMx7kPG+FkV/tgCDYiLWluj8oSYg=;
 b=owJ4nAFtApL9kA0DAAoB2O7X88g7+poByyZiAGo1YDj4vFWawwKth1Jmo6InIOSwilacNlLO7
 KZrp4dQCdNc/4kCMwQAAQoAHRYhBO9mDQdGP4tyanlUE9ju1/PIO/qaBQJqNWA4AAoJENju1/PI
 O/qay3cQAI76iMJRvIjFIBwjVoEOnisEDXuEjFJpO95CwrcbJ1HFwdgAE5p1DiYT+0een3uCXKm
 Evkl2CuBYL4FQc9a5mOmZR3on+sDZuODl9ybPsu9OPdDWqJWKS0vOLxjNQvxFRYvTxVNzGXCd5M
 wL7l23crLE+kTHnITbNAqNuIQJFqj4dVCz4ukKmRRTiMrQsMOxC7lS8KTU+WAXFnxS76HO0Xhln
 hPaJDWNAAzz9ZY034bRp5rhPnMzyDul48+mZiq1A1hBd7exy73OH9tvFQAK6F6Hqrpzhsc0/CWt
 T13ejOZ+KWVn073fS+rxUNWv1EXnmTCwaHG1sTpMsK0+ySYm6gIiZIUd9iqA7jIE/QW1+WzbA0J
 nzjIVO66gtYPihkWf74lUj3brVsrYMMso1JK2oStxDuy2j4+1fWiduGAb+6gZa6hDwMDIY3lz1d
 cEZSl/5gCtynDK7BehufqdT1+xUnffnCmDa/pAreMw65U8DqtliIYa4xYGZsFJ0r5tHaipuKCop
 A3SuRbpr3m8gY412mYzUyi/TSwgSaRSYZJfQA7xPfZ/Daz+vilAV9YqDNwZGJP6OoZLnOszYZfz
 VsGpSjCxoa+fF4sD8T3JtrEWtzGF5uQWTmkxu7i7gtrWzeuedAzrpIejA2+nTdq19yygexIZh1J
 LAqoynJkTdexkR6q0L4A1LQ==
X-Developer-Key: i=sebastian.reichel@collabora.com; a=openpgp;
 fpr=EF660D07463F8B726A795413D8EED7F3C83BFA9A

When a mode change is required rk_udphy_power_on() disables
the clocks and then calls rk_udphy_setup(), which then enables
all the clocks again before continuing with rk_udphy_init().

Considering that rk_udphy_init() does assert the reset lines,
re-enabling the clocks is just delaying things. Avoid it by
directly calling rk_udphy_init().

Reviewed-by: Neil Armstrong <neil.armstrong@linaro.org>
Signed-off-by: Sebastian Reichel <sebastian.reichel@collabora.com>
---
 drivers/phy/rockchip/phy-rockchip-usbdp.c | 3 +--
 1 file changed, 1 insertion(+), 2 deletions(-)

diff --git a/drivers/phy/rockchip/phy-rockchip-usbdp.c b/drivers/phy/rockchip/phy-rockchip-usbdp.c
index 6dff4dfc9363..c05ee65a9f73 100644
--- a/drivers/phy/rockchip/phy-rockchip-usbdp.c
+++ b/drivers/phy/rockchip/phy-rockchip-usbdp.c
@@ -1011,8 +1011,7 @@ static int rk_udphy_power_on(struct rk_udphy *udphy, u8 mode)
 		if (udphy->mode == UDPHY_MODE_DP)
 			rk_udphy_u3_port_disable(udphy, true);
 
-		rk_udphy_disable(udphy);
-		ret = rk_udphy_setup(udphy);
+		ret = rk_udphy_init(udphy);
 		if (ret)
 			return ret;
 		udphy->mode_change = false;

-- 
2.53.0

