Received: from bali.collaboradmins.com (bali.collaboradmins.com [148.251.105.195])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id CAA223BFACF;
	Fri, 26 Jun 2026 21:02:21 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=148.251.105.195
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1782507743; cv=none; b=LIwi9jttqzs8517SMPMQ8vemPJQaLtrfK+sp2RCg6lwxV3GvL3SD9pS+cqnQ0tTlaeUt58vRaqWNw85xA3apBVX+MATnSGSQNqWojmLdhUQ2G6w5IPjNms5AhbjdTFC0jqIVIdI7qZcK8y+kRIpkACiN+i2tUHuil3flStiqDTo=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1782507743; c=relaxed/simple;
	bh=z5ArQie+25lpzfxR5vY7ueV2Ks9qhlwHdmy+YLbUGgc=;
	h=From:Date:Subject:MIME-Version:Content-Type:Message-Id:References:
	 In-Reply-To:To:Cc; b=B0he7Bag3FwMkGnA47ogLE94CPNlsyi87FbFReMDaKC+DzkqmccowaZhkj5kVPsSBTMvulznfV68jB0nP/msJpdcXVDBcydCvj3qgtx+La6uLgtVTQXktLIxArJlszN8/bIsFdHFnbs4UowniWU8dnXHVFl701VBzsVXDkVMK14=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=collabora.com; spf=pass smtp.mailfrom=collabora.com; dkim=pass (2048-bit key) header.d=collabora.com header.i=@collabora.com header.b=SmgbsxtM; arc=none smtp.client-ip=148.251.105.195
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=collabora.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=collabora.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=collabora.com header.i=@collabora.com header.b="SmgbsxtM"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=collabora.com;
	s=mail; t=1782507740;
	bh=z5ArQie+25lpzfxR5vY7ueV2Ks9qhlwHdmy+YLbUGgc=;
	h=From:Date:Subject:References:In-Reply-To:To:Cc:From;
	b=SmgbsxtMR/Odv0/RjgMDVe2rJfu7LrX3cMxNawjRMvp8gQxtTzirj8P4JotCmtwrg
	 cZoDZxyC6uni5k/Wnh01Q46Pcmo9ko5LThCsLZrfvbZ1bnqC89Sz+duwP0c7L+GdXy
	 EqD90ImRPMVhLsC2DscUfi8plcg2JaYP/PqgGetoot8VVeP9pwRCIPAqXwfPzzVDFU
	 4TIeR5mvPttaJ6aiGq4VMAq+ciEa+KLKMUAkL+VBGG1jTexockFg7W1OdGKg7RnFwE
	 Y4eqLA6zU9Oii0ETj/Gl9TvJI0hV3mAvEYYiaZp7mNLUmYjzwK4lcS9CG9db+bALZe
	 BQC/LtZs4/KKA==
Received: from jupiter.universe (unknown [100.64.1.62])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (4096 bits))
	(No client certificate requested)
	(Authenticated sender: sre)
	by bali.collaboradmins.com (Postfix) with ESMTPSA id 0632C17E0F8B;
	Fri, 26 Jun 2026 23:02:20 +0200 (CEST)
Received: by jupiter.universe (Postfix, from userid 1000)
	id 2B88A480067; Fri, 26 Jun 2026 22:55:02 +0200 (CEST)
From: Sebastian Reichel <sebastian.reichel@collabora.com>
Date: Fri, 26 Jun 2026 22:55:15 +0200
Subject: [PATCH v8 22/29] phy: rockchip: usbdp: Properly handle
 TYPEC_STATE_SAFE and TYPEC_STATE_USB
Precedence: bulk
X-Mailing-List: devicetree@vger.kernel.org
List-Id: <devicetree.vger.kernel.org>
List-Subscribe: <mailto:devicetree+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:devicetree+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20260626-rockchip-usbdp-cleanup-v8-22-47f682987895@collabora.com>
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
 Sebastian Reichel <sebastian.reichel@collabora.com>, 
 Sashiko <sashiko-bot@kernel.org>
X-Mailer: b4 0.14.3
X-Developer-Signature: v=1; a=openpgp-sha256; l=1759;
 i=sebastian.reichel@collabora.com; h=from:subject:message-id;
 bh=z5ArQie+25lpzfxR5vY7ueV2Ks9qhlwHdmy+YLbUGgc=;
 b=owJ4nAFtApL9kA0DAAoB2O7X88g7+poByyZiAGo+5yUnIBGtcaw3J9f2Jxg0XrKKTU088zOC1
 1VM6QB28LabEokCMwQAAQoAHRYhBO9mDQdGP4tyanlUE9ju1/PIO/qaBQJqPuclAAoJENju1/PI
 O/qa1tQP/isoWK3Wwe8hDfeIEFNRp81dcRt+EnorGMXCQZcYPnAODIoJ1cvlG5QtMHRV1H5x8NI
 yoRlPnWwAq7h/Ivpbjp2W2SkIYVsD8eEssas7d2yWxPbPbAyg7/KCji4bjNpxxX7pl+Pum7znT5
 /Lt9A+dSUn4J4VX7wFI6YXTrHvK0L+YzBc3hM6nbSVH8BFKe3ZXanRXPIdMKuM1vLmA8i5o+1qV
 tTHLjhJlWExfcUCmCIFzSruQvMFRB+2930wraLlBlt/RGdm6MxKUbI+HdFEo8JHF4a8gzsY0Whi
 3KJZiKv8lnynZGejyCDDkRRQXHd6V6uJdtTisaFYGhI1Mga1I4Y6O3Uoe+7RjcFmJZyQ9LQZ6Za
 LHOz9a3s83N8JDs+PhUv8wcFzRRAkQeE4x2cey5QkBENtXNxDqYloK288c3P/fbfheX50mHxew6
 rIaTPAATYWE9AKgPVCyE9bSyrRQXg/DYAajaA2FDte3PiHdbb8e+Inql+q0DALWNz/tiuA/YP0B
 tUXk0r0Sj84zfPD9laP3p0em5Z/TNWgmVntcjqLXEo0fryMulbgZe/uiWrUwZtBSK6AwVmyA8Oy
 Pry9LxH8JaPTvSq5dsUSLulvczDGF4+2NNIV+Ecz5TnElgexgfekt179oStXVYuP/VKoGGj44fQ
 7F6MRwxP2X8PKYYd6vWAtTQ==
X-Developer-Key: i=sebastian.reichel@collabora.com; a=openpgp;
 fpr=EF660D07463F8B726A795413D8EED7F3C83BFA9A

Handle TYPEC_STATE_SAFE and TYPEC_STATE_USB Type-C state events,
so that the muxing is properly updated when exiting DP AltMode.

Fixes: 2f70bbddeb45 ("phy: rockchip: add usbdp combo phy driver")
Reported-by: Sashiko <sashiko-bot@kernel.org>
Closes: https://sashiko.dev/#/message/20260619155020.CC7361F000E9%40smtp.kernel.org
Signed-off-by: Sebastian Reichel <sebastian.reichel@collabora.com>
---
 drivers/phy/rockchip/phy-rockchip-usbdp.c | 21 +++++++++++++++------
 1 file changed, 15 insertions(+), 6 deletions(-)

diff --git a/drivers/phy/rockchip/phy-rockchip-usbdp.c b/drivers/phy/rockchip/phy-rockchip-usbdp.c
index 7c3b0d45d938..63fb41ad0199 100644
--- a/drivers/phy/rockchip/phy-rockchip-usbdp.c
+++ b/drivers/phy/rockchip/phy-rockchip-usbdp.c
@@ -1327,17 +1327,26 @@ static const struct phy_ops rk_udphy_usb3_phy_ops = {
 	.owner		= THIS_MODULE,
 };
 
+static bool rk_udphy_is_supported_mode(struct typec_mux_state *state)
+{
+	/* Handle Safe State and USB State */
+	if (state->mode < TYPEC_STATE_MODAL)
+		return true;
+
+	/* Handle DP AltMode */
+	if (state->alt && state->alt->svid == USB_TYPEC_DP_SID)
+		return true;
+
+	return false;
+}
+
 static int rk_udphy_typec_mux_set(struct typec_mux_dev *mux,
 				  struct typec_mux_state *state)
 {
 	struct rk_udphy *udphy = typec_mux_get_drvdata(mux);
 
-	/*
-	 * Ignore mux events not involving DP AltMode, because
-	 * the mode field is being reused, e.g. state->mode == 4
-	 * could be either TYPEC_MODE_USB4 or TYPEC_DP_STATE_C.
-	 */
-	if (!state->alt || state->alt->svid != USB_TYPEC_DP_SID)
+	/* Ignore mux events not involving USB or DP */
+	if (!rk_udphy_is_supported_mode(state))
 		return 0;
 
 	mutex_lock(&udphy->mutex);

-- 
2.53.0

