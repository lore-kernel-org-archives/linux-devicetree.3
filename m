Received: from bali.collaboradmins.com (bali.collaboradmins.com [148.251.105.195])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 3A383478865;
	Tue, 28 Apr 2026 16:14:07 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=148.251.105.195
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1777392849; cv=none; b=VUgPrcwX5ohSj7EpxC7c+nictWK0Wba0QudvLnqHnik+jeIWG9aisdbmF6/ogT5TsSslwR6sPbTTyRXVd0CL1BEiIE8bSl3LbWPlvA+fk3h+tdVJnoXfVr2Gf4CxVtZUargv6OXctav36MH5nhIWc8GLQ5wYIOgs5uQzxRMKpik=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1777392849; c=relaxed/simple;
	bh=jN3EWA7Y+IO1E1+ctlqunQ4afKe4Rg68KcoQplL5rMI=;
	h=From:Date:Subject:MIME-Version:Content-Type:Message-Id:References:
	 In-Reply-To:To:Cc; b=ImhJeinePRWNOEXSuo7LqBZIY3uuBVIGfpOhFy36JVDw43I6+yppSa9exHkQQoGs4OQf7tUOdGrifCvhGiJfgcXuRNR4IlxFPeEuGD2sxtXDHdABWQncbIJsYDs0s5g6wFVjzdyvmB2+8+pb4UqRUEUPC5kiIjyZyx/UwezzSxc=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=collabora.com; spf=pass smtp.mailfrom=collabora.com; dkim=pass (2048-bit key) header.d=collabora.com header.i=@collabora.com header.b=gkF0O/Hw; arc=none smtp.client-ip=148.251.105.195
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=collabora.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=collabora.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=collabora.com header.i=@collabora.com header.b="gkF0O/Hw"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=collabora.com;
	s=mail; t=1777392842;
	bh=jN3EWA7Y+IO1E1+ctlqunQ4afKe4Rg68KcoQplL5rMI=;
	h=From:Date:Subject:References:In-Reply-To:To:Cc:From;
	b=gkF0O/HwmgHNMX9ayjQ0cJ8nZNMsER1zPFPJnVHuUgTeXgkCreT7jzJPyDO8Sm4rD
	 5wPW/vzCw3JcyjYPhdeNAK/Whq0Mzubi4G++psJ0jQfovejFYbHVsQM3w6jpCwvZ/Y
	 uVvI7RMOF6wfdEGKD6zJSuR/v93iMTdwYoKhErPENJc+DYBFl8Gm0bjtuRXBMmZs+E
	 TsGk6VLfCElHaeCpwcXi1s2aznHyrZ9CUp/hdmP2lt+TR4xhgxuwsTc1k4F+jqdeYT
	 k+7T3pfkhN/vk0wVcCjU8R8U0rf544OgBz7gQwdosBKQNC1IrEwj7QBm7ND1MD5iY8
	 jk/MlFMC5NRmA==
Received: from jupiter.universe (unknown [100.64.1.62])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (4096 bits))
	(No client certificate requested)
	(Authenticated sender: sre)
	by bali.collaboradmins.com (Postfix) with ESMTPSA id 24D2A17E1562;
	Tue, 28 Apr 2026 18:14:02 +0200 (CEST)
Received: by jupiter.universe (Postfix, from userid 1000)
	id 87F6348003A; Tue, 28 Apr 2026 18:14:01 +0200 (CEST)
From: Sebastian Reichel <sebastian.reichel@collabora.com>
Date: Tue, 28 Apr 2026 18:13:45 +0200
Subject: [PATCH v4 06/16] phy: rockchip: usbdp: Add missing mode_change
 update
Precedence: bulk
X-Mailing-List: devicetree@vger.kernel.org
List-Id: <devicetree.vger.kernel.org>
List-Subscribe: <mailto:devicetree+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:devicetree+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20260428-rockchip-usbdp-cleanup-v4-6-7775671ece22@collabora.com>
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
X-Developer-Signature: v=1; a=openpgp-sha256; l=1949;
 i=sebastian.reichel@collabora.com; h=from:subject:message-id;
 bh=jN3EWA7Y+IO1E1+ctlqunQ4afKe4Rg68KcoQplL5rMI=;
 b=owJ4nAFtApL9kA0DAAoB2O7X88g7+poByyZiAGnw3MnLtB8nOxEXUVhTmg2XYLHFs60idx6Vj
 FjOT2c9a7ivKokCMwQAAQoAHRYhBO9mDQdGP4tyanlUE9ju1/PIO/qaBQJp8NzJAAoJENju1/PI
 O/qa5gkP/RdMPWyyzXlIZAxDzVUlY4nV3vFAKU59lKk7BbvtSN9nPI28xd4KWhd30imgyra2EPo
 tSp+lI1lIUciR34/pwcd8zNaZ3jzYjX5Ge84heJNULnxKtoW0zwKQSdCz+14sDbreXC4spAtjQc
 i2H6sDF5EBqh2tVonardS/xnWN3cOdMfS5jrVwyvqbXHml1GgpHHwtLalYqRtY29WDkp+pM0zhx
 QOGUTSHWal4QU7+DGzWWMYDu47puZ0MQT03mWYuzx5nUW75Z2eETrW0C8583mlK8y8GmwGOsGmL
 WQplNGL/2UkCOyScfCju1sA5gMxL623U5yvi5fL4l9LEPSJKiknRrGZGShuKFaAm9/ryiG46IDr
 sO+/R1EflsElfQk8LP0jcNjHrleIIFMms4+sMDAetvS10+6NV/S7eG61+qDnEC1fXDf+4ax1aPb
 FZj123ur4Iq0+XtDX98iAA+zddB1VAvn2pNn2YyOwxOS+N4TtFVSRKoLy3hpX2FLPc309l/GsWK
 Z4oft72s4L4N01Eaib1V/v1iAkS7/jkgYUYTiXBID1163JIHwUIg8rziyMCjH5juwL4HEspVBk5
 yuLeFMGD9eTB6pywxnYN9tV5Y8mfURTe/NEdROxUQHbRlVVJAPaAKQ9Pk1nqG5NCkNfWc+uFV9c
 nbURqjmZXuM6MlOPlgikvPg==
X-Developer-Key: i=sebastian.reichel@collabora.com; a=openpgp;
 fpr=EF660D07463F8B726A795413D8EED7F3C83BFA9A

rk_udphy_set_typec_default_mapping() updates the available modes,
but does not set the mode_change as required. This results in
missing re-initialization and thus non-working DisplayPort.

Fix this issue by introducing a new helper to update the available
modes.

Signed-off-by: Sebastian Reichel <sebastian.reichel@collabora.com>
---
 drivers/phy/rockchip/phy-rockchip-usbdp.c | 16 +++++++++++-----
 1 file changed, 11 insertions(+), 5 deletions(-)

diff --git a/drivers/phy/rockchip/phy-rockchip-usbdp.c b/drivers/phy/rockchip/phy-rockchip-usbdp.c
index 97e53b933225..febc148a754e 100644
--- a/drivers/phy/rockchip/phy-rockchip-usbdp.c
+++ b/drivers/phy/rockchip/phy-rockchip-usbdp.c
@@ -619,6 +619,15 @@ static void rk_udphy_dp_hpd_event_trigger(struct rk_udphy *udphy, bool hpd)
 	rk_udphy_grfreg_write(udphy->vogrf, &cfg->vogrfcfg[udphy->id].hpd_trigger, hpd);
 }
 
+static void rk_udphy_mode_set(struct rk_udphy *udphy, u8 mode)
+{
+	if (udphy->mode == mode)
+		return;
+
+	udphy->mode_change = true;
+	udphy->mode = mode;
+}
+
 static void rk_udphy_set_typec_default_mapping(struct rk_udphy *udphy)
 {
 	if (udphy->flip) {
@@ -649,7 +658,7 @@ static void rk_udphy_set_typec_default_mapping(struct rk_udphy *udphy)
 		gpiod_set_value_cansleep(udphy->sbu2_dc_gpio, 1);
 	}
 
-	udphy->mode = UDPHY_MODE_DP_USB;
+	rk_udphy_mode_set(udphy, UDPHY_MODE_DP_USB);
 }
 
 static int rk_udphy_orien_sw_set(struct typec_switch_dev *sw,
@@ -1385,10 +1394,7 @@ static int rk_udphy_typec_mux_set(struct typec_mux_dev *mux,
 			usleep_range(750, 800);
 			rk_udphy_dp_hpd_event_trigger(udphy, true);
 		} else if (data->status & DP_STATUS_HPD_STATE) {
-			if (udphy->mode != mode) {
-				udphy->mode = mode;
-				udphy->mode_change = true;
-			}
+			rk_udphy_mode_set(udphy, mode);
 			rk_udphy_dp_hpd_event_trigger(udphy, true);
 		} else {
 			rk_udphy_dp_hpd_event_trigger(udphy, false);

-- 
2.53.0

