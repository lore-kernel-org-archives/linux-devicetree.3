Received: from bali.collaboradmins.com (bali.collaboradmins.com [148.251.105.195])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id C08C83D4102;
	Fri, 12 Jun 2026 16:22:01 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=148.251.105.195
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1781281327; cv=none; b=VydmH+RyPbGlgPK+2RPMmVSGB35ywjCWU5P+BofmqIo1XQRDF7GTIn9efU4x96Rx3StfVHg4HwMXS3ac4vn4HYD46GM9x45k8vEO7fVkPtiPfDVmzXnJTlicrSX5ERgCqIYpXSfpH5QNl4m/LVMgZX2juF9x6wy7Qu76pvGr7Aw=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1781281327; c=relaxed/simple;
	bh=fH5mubes2SOS68X9ZiYq/N2c6YI1cho4HC4nJ2SpDZg=;
	h=From:Date:Subject:MIME-Version:Content-Type:Message-Id:References:
	 In-Reply-To:To:Cc; b=C7rB5NH33m4+W5vp6QAdRObZtbRVGyKHmdOjK7M+zukhTBAJbQRueZ5kgrNYziOFG1p1K7rqDgN8mqS0diGmDCfjGTWeOkiwqQqoi3bOCQFzK4vAeHiCWRxtK88RgRtu4DaqJfEbiHDSPwmFudRaYMQTq8YcxmeEAocHPij/zxI=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=collabora.com; spf=pass smtp.mailfrom=collabora.com; dkim=pass (2048-bit key) header.d=collabora.com header.i=@collabora.com header.b=FdcWF9mk; arc=none smtp.client-ip=148.251.105.195
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=collabora.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=collabora.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=collabora.com header.i=@collabora.com header.b="FdcWF9mk"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=collabora.com;
	s=mail; t=1781281314;
	bh=fH5mubes2SOS68X9ZiYq/N2c6YI1cho4HC4nJ2SpDZg=;
	h=From:Date:Subject:References:In-Reply-To:To:Cc:From;
	b=FdcWF9mkG+zbwzGr8GD0a60r230mnYCXXWjYLGQTdtCjsqDZK29RCC4ktqgcllX4U
	 9ZmgTeFzSmMj841ZQy0ct7SP0Buyff/58l/HXp+/N2RNiVODgEaDg009GoxUjVwyQ2
	 Nj87egWYHeTrneQjU1fdfp6qmHeKo9e5dC+Xcqd3RZdxZ3TIEcFI2sTuhzYHK9WbKY
	 M6b7lEh1URXPjOZvYgITScZWfNzsTI1Qi6+vY09/7IQ7SD4909j89Fh5Yol63YP1st
	 qyn0eXJWBVhHknk/qPv8bg/u+pjcIvxrWsdiKW9E+TqtCpNi19nHmgY9dRNa3edmP0
	 G8swiHCtJRatg==
Received: from jupiter.universe (unknown [100.64.1.62])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (4096 bits))
	(No client certificate requested)
	(Authenticated sender: sre)
	by bali.collaboradmins.com (Postfix) with ESMTPSA id 75C3617E0E6E;
	Fri, 12 Jun 2026 18:21:54 +0200 (CEST)
Received: by jupiter.universe (Postfix, from userid 1000)
	id CCDCE480031; Fri, 12 Jun 2026 18:21:53 +0200 (CEST)
From: Sebastian Reichel <sebastian.reichel@collabora.com>
Date: Fri, 12 Jun 2026 18:21:44 +0200
Subject: [PATCH v5 06/18] phy: rockchip: usbdp: Add missing mode_change
 update
Precedence: bulk
X-Mailing-List: devicetree@vger.kernel.org
List-Id: <devicetree.vger.kernel.org>
List-Subscribe: <mailto:devicetree+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:devicetree+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20260612-rockchip-usbdp-cleanup-v5-6-efc83069869f@collabora.com>
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
X-Developer-Signature: v=1; a=openpgp-sha256; l=2006;
 i=sebastian.reichel@collabora.com; h=from:subject:message-id;
 bh=fH5mubes2SOS68X9ZiYq/N2c6YI1cho4HC4nJ2SpDZg=;
 b=owJ4nAFtApL9kA0DAAoB2O7X88g7+poByyZiAGosMiFYALoVetLRBjtCjGI62MJSBAfqV5I0i
 AQqkyEZm4/T1YkCMwQAAQoAHRYhBO9mDQdGP4tyanlUE9ju1/PIO/qaBQJqLDIhAAoJENju1/PI
 O/qaHtsP+gJDT1+JUU/jL4rE3Eg3XUOAQ0v5G+dh2jwEZVNLhHWgY6Mo9UbCzGNCqNcg0HTbc/X
 9L7CfZbhijBhRk7PqXliFw+Vwh4jTPhBTLbb/hOMRMVtMnyPNomflwvUHu2tCtWjx9o5F6nrIQi
 7BNu67rXWV5RnNHFOOpzSPoKSxU1JUH6Uko5kYjjGj3QaZkUKWgggeqaOFYFjmoJm5Bqh+7NOGc
 18LV/uQjEaS330jyUF0pFpdE37qMNGaazX71gnOH7s+w/abJUEyeO1ET+z8u4b1cXft2dwlb7YJ
 YNqqFief+NpjiseXdaHZk9lmB8Md4B/SU2PYv02jWpv5DnPska9i0CDJ/tZOw9KSlsiMYF1fEz9
 F1Os4ELa/7tCKMANzTq9Kbg4uuzowEAZ6kA0t+C9PWxJKo4nSo6ym2xNLprv2l6bLAgUx8A4wo/
 erHLf7OgHXvMr3RoE9Aeurv54mpBtmUdUBLG1YybkR2qviq2NQn1mBUYnJ+YmA/Pw+n7konOkeG
 M0sDXh1pQ2RK8eMVtj+hNw62TANBsJC0gRZo1KKojDHQlpZ25thCF7RAdLhhh4jmvMW9jsYfjER
 Fd0Zf2MAHsc0iilGBUSRDWjoy+f9kKlR1eF23WOoLMSaFJ+D7chrNNFg3nULXDtHAttOCnLptqF
 qS218jwCMjsGmyZOfvlEqog==
X-Developer-Key: i=sebastian.reichel@collabora.com; a=openpgp;
 fpr=EF660D07463F8B726A795413D8EED7F3C83BFA9A

rk_udphy_set_typec_default_mapping() updates the available modes,
but does not set the mode_change as required. This results in
missing re-initialization and thus non-working DisplayPort.

Fix this issue by introducing a new helper to update the available
modes.

Reviewed-by: Neil Armstrong <neil.armstrong@linaro.org>
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

