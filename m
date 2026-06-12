Received: from bali.collaboradmins.com (bali.collaboradmins.com [148.251.105.195])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 7B7BA33CE9A;
	Fri, 12 Jun 2026 16:22:04 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=148.251.105.195
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1781281329; cv=none; b=p/d6RMqVvKrGFSmcAA8S54sp+jNFiYDGruVrj3A4aFvemDX3Q2f04uZVZidWaWKe86O+UfYgGPfFNZ+dGqsuC3KUPxP3P8Q7Yc8slC5TPAVL3eeWun/OA818koEAT1OQLVbM/AeDZOHSBUex+BQVk12hwJXz7NnhZl9Dasfrvhk=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1781281329; c=relaxed/simple;
	bh=YM8vhaVqe6VkIRnSmmclQMgLxDRedtbKmvS/ah+S/TU=;
	h=From:Date:Subject:MIME-Version:Content-Type:Message-Id:References:
	 In-Reply-To:To:Cc; b=SeQGQ6bahdrZsMRlGUg9deqleWUFAICYnaQIQldjZunxtJsXT03Vl16QYxlCL5J7nbcG6stgXwJun5aJ9VDBpUNTYvtYEB9dSc1MsjpUCTobqqom3yzovlFIsnSBsgxRWMsxBCYJcz89vO5sSv0uXK+fU8gG14Jevphx29OQTeo=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=collabora.com; spf=pass smtp.mailfrom=collabora.com; dkim=pass (2048-bit key) header.d=collabora.com header.i=@collabora.com header.b=I9F7Wffz; arc=none smtp.client-ip=148.251.105.195
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=collabora.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=collabora.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=collabora.com header.i=@collabora.com header.b="I9F7Wffz"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=collabora.com;
	s=mail; t=1781281314;
	bh=YM8vhaVqe6VkIRnSmmclQMgLxDRedtbKmvS/ah+S/TU=;
	h=From:Date:Subject:References:In-Reply-To:To:Cc:From;
	b=I9F7WffznuEW931ghv/SXP7ewXiC2swVf64zpbG4uPCzf8C2iXSnJXwUCjamIOhih
	 1SQydnwo1vlrWqadYXUu/i3NZXq+dpiKraaydUouiPEj3Kj4s1uwxpBuaPhufjmBHA
	 P09zapiPYqMGD1UCOMvXOC+Dxw7XScxazI3Qhy5J0VUQ+rLPyoehqJH8UeRI6wRjPA
	 G6GKuwFDI4cWbCbM6A8XEtRdNyjo54c6a9O1nsYtaHDjyrVwo334jfAvXW5ScXB5V4
	 gH8LSyfy3hgQQg2+mIzQae1HClAsHVOqh8n4rWsw3VyZe6IqCvIlkbMgh3cO96cxN3
	 SNK87qHmFY4nA==
Received: from jupiter.universe (unknown [100.64.1.62])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (4096 bits))
	(No client certificate requested)
	(Authenticated sender: sre)
	by bali.collaboradmins.com (Postfix) with ESMTPSA id A9D1F17E14FB;
	Fri, 12 Jun 2026 18:21:54 +0200 (CEST)
Received: by jupiter.universe (Postfix, from userid 1000)
	id D957548004E; Fri, 12 Jun 2026 18:21:53 +0200 (CEST)
From: Sebastian Reichel <sebastian.reichel@collabora.com>
Date: Fri, 12 Jun 2026 18:21:52 +0200
Subject: [PATCH v5 14/18] phy: rockchip: usbdp: Re-init the PHY on
 orientation change
Precedence: bulk
X-Mailing-List: devicetree@vger.kernel.org
List-Id: <devicetree.vger.kernel.org>
List-Subscribe: <mailto:devicetree+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:devicetree+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20260612-rockchip-usbdp-cleanup-v5-14-efc83069869f@collabora.com>
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
X-Developer-Signature: v=1; a=openpgp-sha256; l=1257;
 i=sebastian.reichel@collabora.com; h=from:subject:message-id;
 bh=YM8vhaVqe6VkIRnSmmclQMgLxDRedtbKmvS/ah+S/TU=;
 b=owJ4nAFtApL9kA0DAAoB2O7X88g7+poByyZiAGosMiEo7Ra4KF/dow0Pb3iWgyuH7adBgpGWt
 bsOqntQGuV9FokCMwQAAQoAHRYhBO9mDQdGP4tyanlUE9ju1/PIO/qaBQJqLDIhAAoJENju1/PI
 O/qasDkP/10XqYzkoOmM24a+Lo9njSyyFFlWEOPbGCZvIQ+kccv0e1DHmYmPUSpxKJL5W+1GBbO
 q7+eJF7V3dY9Nl9W1ERiHKE8gSvnrih04h2sBCec5CvF5Xm+Z//Kz5Tr4scb2t21XDnns8JqpOf
 Ebtr8uo3fbYart9CInQoSQetdvR+vanUoGmRIW2fOh1l6rpu8eFrvelMwuadz//5b0COQmeSaFv
 wpTcmkkP/YrxMN8gIC+PwATc/jgMmYJVgzlqnZPlY70YDrLN/19qojYdcUPq4REW8vchJ8uDQTJ
 d7oot8EMbf/zDQQ8bKPuy/+sxDpcz6mZTp2OLiLaz18K0Iz0Uz4lPdAfeao7qDEI4MH0B9gZlXk
 LaULx3HumSnuMs4HUuDtI48b5upQFJFL8tmZtvp6se/5DRQu+tvbtrgmyvOHvhUu+ByNRMf9swO
 upGqHcEggbobz0rUvrotl9sNFjIhcvBNd7cFsNeJ6VCFH7FsZvVOOEayiE+VwnaVhB7wyQUTuOb
 t3RTEhzyMyUWtBFQwqlAa/XNRxUP7T9XytUUWBXzXKvCqv0rC0XMxeTB2bRd7vB8Vd2izbmXY9e
 7vx4Jx+TWG4lR2oWqjYKeIgfPbDpdGqBSDuN2ezAkNLsuSCnfpNI8H3+E3mPu9nN3Pb2ngHeukt
 m+b9dXsiHiBFSHujtA+QxmA==
X-Developer-Key: i=sebastian.reichel@collabora.com; a=openpgp;
 fpr=EF660D07463F8B726A795413D8EED7F3C83BFA9A

Changing the cable orientation reconfigures the lane muxing, which
requires re-initializing the PHY. Without this DP functionality
breaks, if the cable is re-plugged with swapped orientation.

Signed-off-by: Sebastian Reichel <sebastian.reichel@collabora.com>
---
 drivers/phy/rockchip/phy-rockchip-usbdp.c | 6 +++++-
 1 file changed, 5 insertions(+), 1 deletion(-)

diff --git a/drivers/phy/rockchip/phy-rockchip-usbdp.c b/drivers/phy/rockchip/phy-rockchip-usbdp.c
index a3b4e2e0f578..89a08267611c 100644
--- a/drivers/phy/rockchip/phy-rockchip-usbdp.c
+++ b/drivers/phy/rockchip/phy-rockchip-usbdp.c
@@ -622,6 +622,7 @@ static int rk_udphy_orien_sw_set(struct typec_switch_dev *sw,
 				 enum typec_orientation orien)
 {
 	struct rk_udphy *udphy = typec_switch_get_drvdata(sw);
+	bool flipped = orien == TYPEC_ORIENTATION_REVERSE;
 
 	mutex_lock(&udphy->mutex);
 
@@ -633,7 +634,10 @@ static int rk_udphy_orien_sw_set(struct typec_switch_dev *sw,
 		goto unlock_ret;
 	}
 
-	udphy->flip = orien == TYPEC_ORIENTATION_REVERSE;
+	if (udphy->flip != flipped)
+		udphy->phy_needs_reinit = true;
+
+	udphy->flip = flipped;
 	rk_udphy_set_typec_default_mapping(udphy);
 	rk_udphy_usb_bvalid_enable(udphy, true);
 

-- 
2.53.0

