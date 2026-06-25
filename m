Received: from bali.collaboradmins.com (bali.collaboradmins.com [148.251.105.195])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 1C8D53EF673;
	Thu, 25 Jun 2026 17:39:48 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=148.251.105.195
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1782409190; cv=none; b=Ys2u6MK1DZ5vzWrUWx03tH8RkdZoLV/HtDROx42vbeRZMNzZCh1ebRG3FzO58T7E+EuP5bAl6cDV6a9jaRW/dsH2GW1XoDttgyvqLHcr34UEDvsj08fXDONXS+ZBKKRURNCu+89sfeJjWMKby+nqAxVZ57M0VLa+zHSbjnTKdkc=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1782409190; c=relaxed/simple;
	bh=85jWd847vUXet0cssxULpV8YQhdqQ+CsRUr07e6o0oI=;
	h=From:Date:Subject:MIME-Version:Content-Type:Message-Id:References:
	 In-Reply-To:To:Cc; b=NsghMedFFmSqWvGbJVr0gWh2gt7eK3kDky9HiZJU0Vy+d6//SlGFfzoFM710uWSA0T24KdBnE7vDjNN4mOWLp7Tjw6dJI49Oo3rvOgN1bo61B7eZIjrM7cJZ+M6MtxXB3lrjcff1B8dBpLP6GBaTSm81/jXuZUVl24snF6XMtB0=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=collabora.com; spf=pass smtp.mailfrom=collabora.com; dkim=pass (2048-bit key) header.d=collabora.com header.i=@collabora.com header.b=ilM41HW8; arc=none smtp.client-ip=148.251.105.195
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=collabora.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=collabora.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=collabora.com header.i=@collabora.com header.b="ilM41HW8"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=collabora.com;
	s=mail; t=1782409181;
	bh=85jWd847vUXet0cssxULpV8YQhdqQ+CsRUr07e6o0oI=;
	h=From:Date:Subject:References:In-Reply-To:To:Cc:From;
	b=ilM41HW8hMdegRB0+QY1RFtHRTambF0z4sngK2x9qP2OwTW/EOc+d2yI3Px1OMFdi
	 hWP/xgRs1e/CSkuQ8w1oMx+P4fy2l1FeK8EDjpy8sMrK+Rz46k1f+6i+O/7ZowrXB1
	 B5WizsNzDDYvOhze3K0gZxDv40XLQGUmmLHzkCdOirElY7EuSXssH+RgEQaXfmBs/K
	 +KeFPEtHTH7gc4hBneJ63NXKG3whPzCiMweYNIY/6sH3q3ZU7z1NzPzfX0kGPcqcGL
	 QA/s9iLMrvsQMZwedPUPrWui4Uk8Gy3MfcSmvPvU7Dg7ipLGUieBy8cMwptGbgaU9G
	 MDHqJIx/Xu4TA==
Received: from jupiter.universe (unknown [100.64.1.62])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (4096 bits))
	(No client certificate requested)
	(Authenticated sender: sre)
	by bali.collaboradmins.com (Postfix) with ESMTPSA id 3013B17E15A6;
	Thu, 25 Jun 2026 19:39:41 +0200 (CEST)
Received: by jupiter.universe (Postfix, from userid 1000)
	id 1C002480069; Thu, 25 Jun 2026 19:39:40 +0200 (CEST)
From: Sebastian Reichel <sebastian.reichel@collabora.com>
Date: Thu, 25 Jun 2026 19:39:51 +0200
Subject: [PATCH v7 24/27] phy: rockchip: usbdp: Support going from DP-only
 mode to USB mode
Precedence: bulk
X-Mailing-List: devicetree@vger.kernel.org
List-Id: <devicetree.vger.kernel.org>
List-Subscribe: <mailto:devicetree+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:devicetree+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20260625-rockchip-usbdp-cleanup-v7-24-38eb3cf654fd@collabora.com>
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
X-Developer-Signature: v=1; a=openpgp-sha256; l=3019;
 i=sebastian.reichel@collabora.com; h=from:subject:message-id;
 bh=85jWd847vUXet0cssxULpV8YQhdqQ+CsRUr07e6o0oI=;
 b=owJ4nAFtApL9kA0DAAoB2O7X88g7+poByyZiAGo9Z9v3BrncVEotXp2aGfTRe1jCLndpSu3kA
 X7PwkbPxBzMKYkCMwQAAQoAHRYhBO9mDQdGP4tyanlUE9ju1/PIO/qaBQJqPWfbAAoJENju1/PI
 O/qaiiEP/1j8ICJvFmbI6DwXgg73wuTTDZtYxycXO3/QsCwkCyRoprWENgU/yube/O7soQ8ZNNP
 ImicPWt3rG8D2McaL2suuBbF80IDgX/OF5PaXZjRMYNQoU3dTJBQqFjsrhSHHHl3/ucvIuQYS3D
 ERdPwZcBLVzChmCN4+J4B6sQAMWExpoXABft7oQv8h8Wae/BfOioPHZRlk2ozegQ2qfGQpfTnpO
 vONACEYJOP7ZfbSHgYLGRnvfdNAgzZ0xn6dptZj+asaYf9Tw+NTUhF6UZtCkWKORFqPURP5Pp5U
 RgZeHJ3wRzDiTz9+4ExsiCIR878+xxA624cAbuBeD70A8IPwRGI1oZWnP99JxU3+f/YUJBjlpJa
 XTbd365nHmbJthPririv2hs0WomDpRqebhLz7KW9RS6vSGP2Hsna/6Vt4ljojIfs9Sj1EUmtqOD
 GmiMW7+vt1hp9I+JbShfdv+TKwsZ+DJ4XDV0B7iLQ2rCNvH4kg/lwZB+Hu+fE+sC/Od0dUkhApa
 VirJ5VfskDAxbWrtGX8K1M74/7fYvq/OK0ZmQkzcQsrho44vpImEBZJXiy8bXFDmKaFQhWtBZdW
 dqLE47qfNmJ9YhNVREFlk8+89mX6HfDhvabz7vpUxyNGweGYZj/E7Lv7c1ITYKtP6wec1XajQCi
 UlEZlxW7qVP3yvxjHMXkuzQ==
X-Developer-Key: i=sebastian.reichel@collabora.com; a=openpgp;
 fpr=EF660D07463F8B726A795413D8EED7F3C83BFA9A

When a USB-C adapter, which maps all Superspeed lanes to DP is plugged
in, the USB support is disabled in the PHY. When the adapter is
unplugged and a different adapter with USB functionality is plugged in
afterwards, USB functionality is not restored as the USB controller
keeps the PHY enabled for the entire time.

Signed-off-by: Sebastian Reichel <sebastian.reichel@collabora.com>
---
 drivers/phy/rockchip/phy-rockchip-usbdp.c | 29 ++++++++++++++++++++++++++++-
 1 file changed, 28 insertions(+), 1 deletion(-)

diff --git a/drivers/phy/rockchip/phy-rockchip-usbdp.c b/drivers/phy/rockchip/phy-rockchip-usbdp.c
index 6f3184011e5f..182141837596 100644
--- a/drivers/phy/rockchip/phy-rockchip-usbdp.c
+++ b/drivers/phy/rockchip/phy-rockchip-usbdp.c
@@ -178,6 +178,7 @@ struct rk_udphy {
 
 	/* utilized for USB */
 	bool hs; /* flag for high-speed */
+	bool usb_in_use;
 
 	/* utilized for DP */
 	struct gpio_desc *sbu1_dc_gpio;
@@ -1021,6 +1022,10 @@ static int rk_udphy_power_on(struct rk_udphy *udphy, u8 mode)
 		ret = rk_udphy_init(udphy);
 		if (ret)
 			return ret;
+
+		if (udphy->mode & UDPHY_MODE_USB)
+			rk_udphy_u3_port_disable(udphy, false);
+
 		udphy->phy_needs_reinit = false;
 	}
 
@@ -1284,6 +1289,7 @@ static const struct phy_ops rk_udphy_dp_phy_ops = {
 static int rk_udphy_usb3_phy_init(struct phy *phy)
 {
 	struct rk_udphy *udphy = phy_get_drvdata(phy);
+	int ret;
 
 	guard(mutex)(&udphy->mutex);
 
@@ -1293,7 +1299,13 @@ static int rk_udphy_usb3_phy_init(struct phy *phy)
 		return 0;
 	}
 
-	return rk_udphy_power_on(udphy, UDPHY_MODE_USB);
+	ret = rk_udphy_power_on(udphy, UDPHY_MODE_USB);
+	if (ret)
+		return ret;
+
+	udphy->usb_in_use = true;
+
+	return 0;
 }
 
 static int rk_udphy_usb3_phy_exit(struct phy *phy)
@@ -1302,6 +1314,8 @@ static int rk_udphy_usb3_phy_exit(struct phy *phy)
 
 	guard(mutex)(&udphy->mutex);
 
+	udphy->usb_in_use = false;
+
 	/* DP only or high-speed */
 	if (!(udphy->mode & UDPHY_MODE_USB) || udphy->hs)
 		return 0;
@@ -1321,6 +1335,7 @@ static int rk_udphy_typec_mux_set(struct typec_mux_dev *mux,
 				  struct typec_mux_state *state)
 {
 	struct rk_udphy *udphy = typec_mux_get_drvdata(mux);
+	u8 old_mode;
 
 	/*
 	 * Ignore mux events not involving Safe State, USB State or DP AltMode,
@@ -1333,8 +1348,20 @@ static int rk_udphy_typec_mux_set(struct typec_mux_dev *mux,
 
 	guard(mutex)(&udphy->mutex);
 
+	old_mode = udphy->mode;
+
 	rk_udphy_set_typec_state(udphy, state->mode);
 
+	/*
+	 * If the new mode includes USB but the old one didn't (e.g. leaving
+	 * DP-only), and the USB PHY was already initialized by the USB
+	 * controller, we need to power on the USB side now since no
+	 * subsequent phy_init call will come from the controller.
+	 */
+	if ((udphy->mode & UDPHY_MODE_USB) && !(old_mode & UDPHY_MODE_USB) &&
+	    udphy->usb_in_use && !udphy->hs)
+		return rk_udphy_power_on(udphy, UDPHY_MODE_USB);
+
 	return 0;
 }
 

-- 
2.53.0

