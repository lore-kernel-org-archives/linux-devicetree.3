Received: from bali.collaboradmins.com (bali.collaboradmins.com [148.251.105.195])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id BD59647887F;
	Tue, 28 Apr 2026 16:14:07 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=148.251.105.195
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1777392850; cv=none; b=ueN/vo0LnsCuWIkG8jc/6FbDgQeWdxR086MqJsbE3U9vQWuzvP9Ln5Szc1lpyhN13YJ2pMf2ONrPlHvuGQaxkjOpCqeUMTkM5dPI00CD7UDMQdE65sgx51Il+AJFDFPgB6D/vZu7DjtxgCitht9XijlzOGIGjk6k7J4EUujJPoQ=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1777392850; c=relaxed/simple;
	bh=t4WOoiRBpoIjnqRhUxMbzch5XZDGVRegDpDLfMr+pdg=;
	h=From:Date:Subject:MIME-Version:Content-Type:Message-Id:References:
	 In-Reply-To:To:Cc; b=ThCVHaoL5G3rpkmqwo77a7AVF4gLynL+6Tv3CFC8jZF3X3Axgc17uepKbkf27kK/wIzu3uysLKwf3FK+eAkpvVMI0nR6qbovhlXzbdVMbxkOauS6G8ZVDxMq+41SUy2/LbE2ql4xgkTbNqrbleU9tDSq2TBTuDoQmUjQWNwQ6GA=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=collabora.com; spf=pass smtp.mailfrom=collabora.com; dkim=pass (2048-bit key) header.d=collabora.com header.i=@collabora.com header.b=i5fd698P; arc=none smtp.client-ip=148.251.105.195
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=collabora.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=collabora.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=collabora.com header.i=@collabora.com header.b="i5fd698P"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=collabora.com;
	s=mail; t=1777392842;
	bh=t4WOoiRBpoIjnqRhUxMbzch5XZDGVRegDpDLfMr+pdg=;
	h=From:Date:Subject:References:In-Reply-To:To:Cc:From;
	b=i5fd698PwsQNVvvRsgRxUQrTU7R+/NzE7vqqgibSb+EF8hdt2WMoe8BvAJQ5CO+4Q
	 ActeE2//ia2HPEOeKY+QICzymM3KfoLEqQYTyHTLq2yXu++bnLeVGSWOeYeF2zBLvp
	 XrAvTb7SDK4nkj0c6kpyUWltULwJa+eutPRzAPaDOKMKWtqOyMwYeGvlDGRz83i+Ia
	 GNhjGjrJMSs26CvT3Eq3VX3yfbDihWSCLQaQZQV4RRQ9dPu8VU+3k5H1P485X8+97k
	 eH7PEzR+WrzoWUMpRTVXtRXXP6w7y9uwHv2dGgKjb0ovyKweRiuKXh1EaRFsKUhClW
	 pXmyhTnvTIRrA==
Received: from jupiter.universe (unknown [100.64.1.62])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (4096 bits))
	(No client certificate requested)
	(Authenticated sender: sre)
	by bali.collaboradmins.com (Postfix) with ESMTPSA id 3B3D317E1582;
	Tue, 28 Apr 2026 18:14:02 +0200 (CEST)
Received: by jupiter.universe (Postfix, from userid 1000)
	id 8CEF648004C; Tue, 28 Apr 2026 18:14:01 +0200 (CEST)
From: Sebastian Reichel <sebastian.reichel@collabora.com>
Date: Tue, 28 Apr 2026 18:13:48 +0200
Subject: [PATCH v4 09/16] phy: rockchip: usbdp: Use FIELD_PREP_WM16_CONST
Precedence: bulk
X-Mailing-List: devicetree@vger.kernel.org
List-Id: <devicetree.vger.kernel.org>
List-Subscribe: <mailto:devicetree+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:devicetree+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20260428-rockchip-usbdp-cleanup-v4-9-7775671ece22@collabora.com>
References: <20260428-rockchip-usbdp-cleanup-v4-0-7775671ece22@collabora.com>
In-Reply-To: <20260428-rockchip-usbdp-cleanup-v4-0-7775671ece22@collabora.com>
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
X-Developer-Signature: v=1; a=openpgp-sha256; l=1489;
 i=sebastian.reichel@collabora.com; h=from:subject:message-id;
 bh=t4WOoiRBpoIjnqRhUxMbzch5XZDGVRegDpDLfMr+pdg=;
 b=owJ4nAFtApL9kA0DAAoB2O7X88g7+poByyZiAGnw3MkDjC20n4q+HoWN81TqglrzFTrZQPhox
 hzb91pW/pjO24kCMwQAAQoAHRYhBO9mDQdGP4tyanlUE9ju1/PIO/qaBQJp8NzJAAoJENju1/PI
 O/qae+cQAIxyY4nZl1j7ttVmDhN5dv8Tv2ehJKQlCrzwxiBK1yd7bwqpxoR2H+9+RlZ5U4ON2DV
 1RLEUbMG1yHicfGzfHOhbjjgTuzBnxezS+ha3BwABSIzB8F00XfP3UFJtaxA0aVOAtHQfWrW1mK
 OFxjzKTRE75eoqh9ajonLZ2lkNpD0KbmpPgqpeEFKBgcnUAjNIvK3J2TGUaNSOny3g+t2kJB1Gm
 sZsg25jfM1y35N97WB39yCJRWJimYLfWATLZ95AYrSFZz7vSM3QpCWWOuIjuzjryuybIeR0M98U
 zqzYjuoQgfHkhFTzEUgOi+qmgPN6b4LkXiVoFF4Wv9inV9XFByzXoQ++vBApp9lLbCOwUmCsToX
 SVrwN2tnEIq2MClUar+Xhsv+GCTNAmHNJYZtBsQk5ZJklHzch1d4pXbzbRTy5gDcSGH8FGhjVqj
 KPE91jKg0Ore7oYxerQiUkRTs3EWVg1nYC7UcMabbPbpjpO8umfa0zqt/8QxmLeq18DIi3Rm118
 79X+XJOh0khi0qG4Ryo2lFv4Pnr4aFL6Qy/11o3hOY249jk14akUGwkUzZvNEDM93dJyVkJBtEr
 b8kalPUjMEPzbzPBc0ZcU3pHqqSEl7n1NL2yNqiLHWOklHZpYhhoW+rFgw7ha+Xfuo3d4AZ77iM
 2KEb/SKAaWmHveMwOoQAvVg==
X-Developer-Key: i=sebastian.reichel@collabora.com; a=openpgp;
 fpr=EF660D07463F8B726A795413D8EED7F3C83BFA9A

Cleanup code by replacing open-coded version of FIELD_PREP_WM16_CONST
with the existing helper macro.

Signed-off-by: Sebastian Reichel <sebastian.reichel@collabora.com>
---
 drivers/phy/rockchip/phy-rockchip-usbdp.c | 6 +++---
 1 file changed, 3 insertions(+), 3 deletions(-)

diff --git a/drivers/phy/rockchip/phy-rockchip-usbdp.c b/drivers/phy/rockchip/phy-rockchip-usbdp.c
index 6d7ca11b308e..1bfc365e2b2c 100644
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

