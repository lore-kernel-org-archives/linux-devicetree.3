Received: from bali.collaboradmins.com (bali.collaboradmins.com [148.251.105.195])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id F032D217659;
	Thu, 25 Jun 2026 17:39:41 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=148.251.105.195
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1782409183; cv=none; b=Xo4Yuo6m3SPb430wzbWTjiE3nFG8g+cQ0yV1OORul6GStVN+c3Bx1+7U5mtAJ7CtDmj8DYMRKzaC8U2ovvndihMTsIYwZJF6y2UoxXGO5fEga3HtkSCY2Tn9fxE/6A9RUKhr4rrv507WQr0L6q7Ul3Rz92WQASfDEn0koJReoXk=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1782409183; c=relaxed/simple;
	bh=USg1ohYmbXwetA6mCilQyNqt0XA2ZTz/AW7yPMSqQVI=;
	h=From:Date:Subject:MIME-Version:Content-Type:Message-Id:References:
	 In-Reply-To:To:Cc; b=P1CHLTDbsXMJwg46v7pYBgtLvARhke8SNGpI6/mWr8cyGeyfuHnlmKll/olYH5ZklPqDv4RkBzJrYYubi7rlX5uHLbxaSKQDZ3xqb6SZPjo/Zt2sF3An9Jn7HGpaMmAY7hxsKftSId/IawfUFeOFt5H4homX/borH9Wqg2qcxEY=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=collabora.com; spf=pass smtp.mailfrom=collabora.com; dkim=pass (2048-bit key) header.d=collabora.com header.i=@collabora.com header.b=FS+GzwG4; arc=none smtp.client-ip=148.251.105.195
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=collabora.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=collabora.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=collabora.com header.i=@collabora.com header.b="FS+GzwG4"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=collabora.com;
	s=mail; t=1782409180;
	bh=USg1ohYmbXwetA6mCilQyNqt0XA2ZTz/AW7yPMSqQVI=;
	h=From:Date:Subject:References:In-Reply-To:To:Cc:From;
	b=FS+GzwG4ZkhoQJeB9L0r4u/8TPB2YkdRfKsmyu596gGg4dcnM6mVOo6d7YOwYmzXc
	 FlJxoS32CQ74k0uY+w+Lcbj7W5LUbmZjwyTQtf32+PfYH8yaKvYflLM43wKu5gNcKk
	 F2nC5OMvJXJLhhxZ06RgHbFsfsMPamam+F3hikcGbF4fzYmmr4c/0Qe/5xsq/37hE4
	 uL4j65cRKSBRHmXXoY43Jn6TYndyIgmIftV/OPceBgDtgGFMc4EcULxkwqZcmmlDNA
	 5kTzkARBYAwVTY4q9xX4eIRO9PnRBmRYcraSURf6OOKapHq20NjNnuF5Flv09DxSLU
	 3yEiwjzZwcyYQ==
Received: from jupiter.universe (unknown [100.64.1.62])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (4096 bits) server-digest SHA256)
	(No client certificate requested)
	(Authenticated sender: sre)
	by bali.collaboradmins.com (Postfix) with ESMTPSA id 4988A17E0C91;
	Thu, 25 Jun 2026 19:39:40 +0200 (CEST)
Received: by jupiter.universe (Postfix, from userid 1000)
	id F007A480029; Thu, 25 Jun 2026 19:39:39 +0200 (CEST)
From: Sebastian Reichel <sebastian.reichel@collabora.com>
Date: Thu, 25 Jun 2026 19:39:29 +0200
Subject: [PATCH v7 02/27] phy: rockchip: usbdp: Update mode_change after
 error handling
Precedence: bulk
X-Mailing-List: devicetree@vger.kernel.org
List-Id: <devicetree.vger.kernel.org>
List-Subscribe: <mailto:devicetree+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:devicetree+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20260625-rockchip-usbdp-cleanup-v7-2-38eb3cf654fd@collabora.com>
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
X-Developer-Signature: v=1; a=openpgp-sha256; l=1789;
 i=sebastian.reichel@collabora.com; h=from:subject:message-id;
 bh=USg1ohYmbXwetA6mCilQyNqt0XA2ZTz/AW7yPMSqQVI=;
 b=owJ4nAFtApL9kA0DAAoB2O7X88g7+poByyZiAGo9Z9q4ryncczx0Z6w5Fp1c9beUINV/M9G8h
 eg55tqLQkxkVokCMwQAAQoAHRYhBO9mDQdGP4tyanlUE9ju1/PIO/qaBQJqPWfaAAoJENju1/PI
 O/qaQVsP/2aE/le5xe0RJ0sWHWKzvUsShE9u+NvzljYLILJr3Gh3ldNJsd2ZRdhCuQGyZioCLRe
 6GJa8Wwt78CQfimaaiwq1V0eFB+hmXRnJQmcj++SxIfC8Pb2Hz1PkLjrvg1i4+SDtqSZ2paU/KA
 B9zoz8s+0k1P+44DWdLSDZz10k/PdTcy64F8Me6uE/8d3YxeIFB2EV2dgVj1rKnp+KLEaJsq/7M
 ujjzQ1dpbzJtuApZdLqrWSqh2eDBxum4vrVQmDCpaJoF0dP7Nq+Mw/gT96xQ6hZf06Gb/ZAz98J
 5s9yMsNQLyojlGC985dDeMhOa3w1mkQE4KboZD2AxhjJX3T7GHd29/UiST4Q3hYGSDUILJ/KM1V
 rWeaXNcYNp7fExUEZ4RaijmgnNxyQOPdZ9aTXtgRGaHbdqwn2cw+aI09s0ddtcB0n+Cggq7kobo
 vWQiHi8X9qaSf5ECvagL6v/Nhu4FsBdNGvCUCLZKFV/+pWiNqwLXkrqT2yP9QL9CSLAzLQnVRTu
 sJFxOOlJXjcbTZ25nVXbDOgoI2AzeDMc2ow+9L46jG0524SyyVZQ8hjMvo9ugPWmwHxX4KE97GO
 rZG/mQQ1H3LsYIVO7NBN5nZ04yn1+11083gE+M/3uEMngyxZJySEbio/tLc48ts2gnZBjnI+DaE
 O83STgyhf2AkakW6i7WMyFw==
X-Developer-Key: i=sebastian.reichel@collabora.com; a=openpgp;
 fpr=EF660D07463F8B726A795413D8EED7F3C83BFA9A

If rk_udphy_init() or rk_udphy_setup() fails, the reinit will not be
tried again. Fix this by only updating the variable after all potential
errors have been handled.

Note, that no errors have been seen on real hardware and failures would
most likely be fatal and require at least a full reboot as the function
already asserts the PHY reset lines. So this is more of a theoretical
issue.

Fixes: 2f70bbddeb45 ("phy: rockchip: add usbdp combo phy driver")
Reported-by: Sashiko <sashiko-bot@kernel.org>
Closes: https://lore.kernel.org/linux-phy/20260612163835.8D5471F000E9@smtp.kernel.org/
Signed-off-by: Sebastian Reichel <sebastian.reichel@collabora.com>
---
 drivers/phy/rockchip/phy-rockchip-usbdp.c | 4 ++--
 1 file changed, 2 insertions(+), 2 deletions(-)

diff --git a/drivers/phy/rockchip/phy-rockchip-usbdp.c b/drivers/phy/rockchip/phy-rockchip-usbdp.c
index fba35510d88c..a5ffdf7a6e76 100644
--- a/drivers/phy/rockchip/phy-rockchip-usbdp.c
+++ b/drivers/phy/rockchip/phy-rockchip-usbdp.c
@@ -1000,15 +1000,14 @@ static int rk_udphy_power_on(struct rk_udphy *udphy, u8 mode)
 	}
 
 	if (udphy->status == UDPHY_MODE_NONE) {
-		udphy->mode_change = false;
 		ret = rk_udphy_setup(udphy);
 		if (ret)
 			return ret;
 
 		if (udphy->mode & UDPHY_MODE_USB)
 			rk_udphy_u3_port_disable(udphy, false);
-	} else if (udphy->mode_change) {
 		udphy->mode_change = false;
+	} else if (udphy->mode_change) {
 		udphy->status = UDPHY_MODE_NONE;
 		if (udphy->mode == UDPHY_MODE_DP)
 			rk_udphy_u3_port_disable(udphy, true);
@@ -1017,6 +1016,7 @@ static int rk_udphy_power_on(struct rk_udphy *udphy, u8 mode)
 		ret = rk_udphy_setup(udphy);
 		if (ret)
 			return ret;
+		udphy->mode_change = false;
 	}
 
 	udphy->status |= mode;

-- 
2.53.0

