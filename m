Received: from bali.collaboradmins.com (bali.collaboradmins.com [148.251.105.195])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id CC07A3C4163;
	Fri, 26 Jun 2026 20:55:10 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=148.251.105.195
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1782507313; cv=none; b=P6G48CNyeZP++mkS0JMrvepJkZCIdhIhK+oRG1d988Jl/QO3KnNa30whi9vQxZN31Xd9pCqI7+hwe/z7WnFl9lp2k52/4TvtK5ZCOJKmw4cjPsVKPFG8p10gc5UFElOiIzV6cqY8HO/jw1gwc35i6ODqNawsFFyyGUYmgSDWi1w=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1782507313; c=relaxed/simple;
	bh=3n2dLm8cwAAZVSuTNSiRXrkEGCT5P2BhFUYLouYMLq4=;
	h=From:Date:Subject:MIME-Version:Content-Type:Message-Id:References:
	 In-Reply-To:To:Cc; b=JmtFCB3ozsEBhTOpgWZvJe3jSBQJExAHbDR5XFE95dhapnmpjnM8iE7gx6Od1QNcfCJW8IdklYPs2EFuX967EgvkD0c8QILt04XW3m70d4ZLjMWY3yDTsnvzHeoHAHCVqsNIoA/4SM5nkaAlNR3CGuRKLi8/MNqq0Wh5IqCZ6uE=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=collabora.com; spf=pass smtp.mailfrom=collabora.com; dkim=pass (2048-bit key) header.d=collabora.com header.i=@collabora.com header.b=GXFM6Mol; arc=none smtp.client-ip=148.251.105.195
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=collabora.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=collabora.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=collabora.com header.i=@collabora.com header.b="GXFM6Mol"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=collabora.com;
	s=mail; t=1782507303;
	bh=3n2dLm8cwAAZVSuTNSiRXrkEGCT5P2BhFUYLouYMLq4=;
	h=From:Date:Subject:References:In-Reply-To:To:Cc:From;
	b=GXFM6MolvEo36/TYaxuxg66OP1nhA72Tc+vqDn1yUxV2oAX6ZbWGk+WCi0W9seytd
	 TzHQrEAttyyr8STqRyvarkCW387lV5BVcZP2W8HKiZ2MoX5sWE6+NajNw/uHY33w6b
	 XQJ3CpABEbVBtCWdYp4lh5dhetm7uJfN/0diODW11nPQjnG5l4luvTYcSThLpKpQoG
	 9gAXudJftfohXFAKqjZeQyQFTIdgfSM48rLPQGn6Rh+ypi7V8WoRilFH3V2cxJO/kj
	 7d172O6piX3h23TwcZ0li8/hpUCEslk//7iP2BdlNXdXmW0zrHZo28Hs++gXMemsRq
	 1pb+0e3gqT0GQ==
Received: from jupiter.universe (unknown [100.64.1.62])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (4096 bits))
	(No client certificate requested)
	(Authenticated sender: sre)
	by bali.collaboradmins.com (Postfix) with ESMTPSA id 7179B17E35CD;
	Fri, 26 Jun 2026 22:55:03 +0200 (CEST)
Received: by jupiter.universe (Postfix, from userid 1000)
	id 3654248006F; Fri, 26 Jun 2026 22:55:02 +0200 (CEST)
From: Sebastian Reichel <sebastian.reichel@collabora.com>
Date: Fri, 26 Jun 2026 22:55:22 +0200
Subject: [PATCH v8 29/29] phy: rockchip: usbdp: Disable USB3 on probe
Precedence: bulk
X-Mailing-List: devicetree@vger.kernel.org
List-Id: <devicetree.vger.kernel.org>
List-Subscribe: <mailto:devicetree+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:devicetree+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20260626-rockchip-usbdp-cleanup-v8-29-47f682987895@collabora.com>
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
X-Developer-Signature: v=1; a=openpgp-sha256; l=1753;
 i=sebastian.reichel@collabora.com; h=from:subject:message-id;
 bh=3n2dLm8cwAAZVSuTNSiRXrkEGCT5P2BhFUYLouYMLq4=;
 b=owJ4nAFtApL9kA0DAAoB2O7X88g7+poByyZiAGo+5yafBmu9Crfrt5VjEWfUAOd76vUFSXmvr
 b4Vb6dDCvzOO4kCMwQAAQoAHRYhBO9mDQdGP4tyanlUE9ju1/PIO/qaBQJqPucmAAoJENju1/PI
 O/qaLUgP/R4ED4RcxqTiOKyps2g+s/jwkJSFwHSjm6ynjiY4TZIHeJH6JVtf28ONhnGZKbfmXrU
 0E5lPKmGLdtSQIRTWcWEfzqWRXIkr6SUsSCfVfp0wIga+mhShZ8z/zf5Nn/GNgF4ZcyYu6TLZTs
 l95atA67334rkFoBgUaM4uLr4pIPQ1S/a6wz0u/e/62BOUmBGnJUdNrohm8FhQ5Q1D8+8FglL3R
 S7L5K8kAT4FqZiulkMfG9EJXO34oHsAdTyern8isY30VjDLbXkur9sqlPa116h1uf2OOPnpIpYp
 oMjWEh6dONUTIhLlE2n0O86HywZnSO8cXM00zDTo28BXvX+M3LcYuUwgES+uoQ3tY9ODgWxPtaF
 SMW1AZsiY39WUOmxk7bwRGWwQWuJUx10bDcEZGIGp4FO/o1H/jD+Z0cPhzjpuT/mPvJwlyVtvDA
 dVARymrq1nQgxT8XDWOp5p6n1IpSiTCoNTUDji90mXv3VwjgJBx4A7f8xRIFRiT5NzAf9qD3dHK
 9+IlhJVcp+EeNVCVkaOxgjrREGG2kDVN2wl0miitooM3SFD6Bhyvk1Q3dVlH/3hILiT0uDUJHja
 aHObhNZmk0GrHi58T0nBuEzLiSs5g3mk2O71on5dIVUcM7E3CQtyOW82llv+65t0kabHaBZnHVC
 N57yUkSexPY8RyUZbNCUpBw==
X-Developer-Key: i=sebastian.reichel@collabora.com; a=openpgp;
 fpr=EF660D07463F8B726A795413D8EED7F3C83BFA9A

Disable USB3 support during probe, so that the driver always starts with
a clean state. With this it no longer makes sense to use -EPROBE_DEFER
for cmn ana lcpll lock timeouts afterwards. This error code should only
appear during probe and the PHY initialization function is also being
called at normal runtime.

Signed-off-by: Sebastian Reichel <sebastian.reichel@collabora.com>
---
 drivers/phy/rockchip/phy-rockchip-usbdp.c | 14 +++-----------
 1 file changed, 3 insertions(+), 11 deletions(-)

diff --git a/drivers/phy/rockchip/phy-rockchip-usbdp.c b/drivers/phy/rockchip/phy-rockchip-usbdp.c
index 7c8b9eaaf352..a25cce0b7337 100644
--- a/drivers/phy/rockchip/phy-rockchip-usbdp.c
+++ b/drivers/phy/rockchip/phy-rockchip-usbdp.c
@@ -755,17 +755,7 @@ static int rk_udphy_status_check(struct rk_udphy *udphy)
 					       (val & CMN_ANA_LCPLL_LOCK_DONE), 200, 100000);
 		if (ret) {
 			dev_err(udphy->dev, "cmn ana lcpll lock timeout\n");
-			/*
-			 * If earlier software (U-Boot) enabled USB once already
-			 * the PLL may have problems locking on the first try.
-			 * It will be successful on the second try, so for the
-			 * time being a -EPROBE_DEFER will solve the issue.
-			 *
-			 * This requires further investigation to understand the
-			 * root cause, especially considering that the driver is
-			 * asserting all reset lines at probe time.
-			 */
-			return -EPROBE_DEFER;
+			return ret;
 		}
 
 		if (!udphy->flip) {
@@ -962,6 +952,8 @@ static int rk_udphy_get_initial_status(struct rk_udphy *udphy)
 		rk_udphy_grfreg_write(udphy->vogrf, &cfg->vogrfcfg[udphy->id].hpd_trigger, false);
 	}
 
+	rk_udphy_u3_port_disable(udphy, true);
+
 exit:
 	rk_udphy_disable(udphy);
 

-- 
2.53.0

