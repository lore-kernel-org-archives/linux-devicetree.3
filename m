Received: from bali.collaboradmins.com (bali.collaboradmins.com [148.251.105.195])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 94B52477985;
	Thu,  6 Aug 2026 17:02:33 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=148.251.105.195
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1786035755; cv=none; b=RyBsWRa5ceCi+rSb3H95sPtLjF8qLZEKeSF+f4/ggPDm+Qw6I2hNjvqfodsl94wp32vjjg3mX2EMyKqJKnDH7a5iWjhSfOVGl5ddaj++Q4mYuJdyFt3ZTw9bu5NyOKW53B3QtXi8ym+58yt16Iu5ut4yJ3Zht+7LIxPwsTgnhLc=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1786035755; c=relaxed/simple;
	bh=ZiVqmaGM3+H99exZj4TcN/QyJvPS1u6+KkUwem6kKEk=;
	h=From:Date:Subject:MIME-Version:Content-Type:Message-Id:References:
	 In-Reply-To:To:Cc; b=LSUFBbKAh6ekhyK/Ekl+YhePb1oVf2iBPcCmk4rUHlW4ABKK8H5Hkk4FQpgtJLVfjPV6NLFXIu4T54cKIyWFgXQ8zshGPxJwbmX/z598abhwMpjccgWToGabZ7anip8HUJiu97t6V5kFuEbgUkgWFup89MKbiW7vDFJIhW/qM9o=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=collabora.com; spf=pass smtp.mailfrom=collabora.com; dkim=pass (2048-bit key) header.d=collabora.com header.i=@collabora.com header.b=C3EMcZAq; arc=none smtp.client-ip=148.251.105.195
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=collabora.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=collabora.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=collabora.com header.i=@collabora.com header.b="C3EMcZAq"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=collabora.com;
	s=mail; t=1786035745;
	bh=ZiVqmaGM3+H99exZj4TcN/QyJvPS1u6+KkUwem6kKEk=;
	h=From:Date:Subject:References:In-Reply-To:To:Cc:From;
	b=C3EMcZAqreml5h3m2Ml6fRxe0X3k2bu3WHtdMH1W1676QUWC/QS/6mj+CD0EiOjmM
	 kzuE23Ch1ZPIOrSbtrLGPvsgdTFk6ItWtfOYR0prJG0mu0zezTW3YRPhU6zCtYTsRN
	 b8Qolru8aAodz8ZjB8gwWGxlwaA8qAKTy8EjN6cboeI6+V5fwvKxAgI0V6tfDruFhE
	 U1nJrf/q4S9cnK1qvSXl5aNaZBhfrQKsgfLciPXlPoX1LS8IfmZamq3GLKMN+lcvAf
	 wRBeKZnXqQim2IywvifE3EyizY6Wkp1+s4VfFEvgj9rTOg3bFUo4PVQ/2ym8e+fQhb
	 ZWiynw57noV4A==
Received: from jupiter.universe (unknown [100.64.1.62])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange x25519 server-signature RSA-PSS (4096 bits) server-digest SHA256)
	(No client certificate requested)
	(Authenticated sender: sre)
	by bali.collaboradmins.com (Postfix) with ESMTPSA id 4675717E0B39;
	Thu, 06 Aug 2026 19:02:25 +0200 (CEST)
Received: by jupiter.universe (Postfix, from userid 1000)
	id F02D248002F; Thu, 06 Aug 2026 19:02:24 +0200 (CEST)
From: Sebastian Reichel <sebastian.reichel@collabora.com>
Date: Thu, 06 Aug 2026 19:02:09 +0200
Subject: [PATCH v11 03/21] drm/bridge: synopsys: dw-dp: Fix error handling
 for DP link enablement
Precedence: bulk
X-Mailing-List: devicetree@vger.kernel.org
List-Id: <devicetree.vger.kernel.org>
List-Subscribe: <mailto:devicetree+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:devicetree+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20260806-synopsys-dw-dp-improvements-v11-3-0d508505f383@collabora.com>
References: <20260806-synopsys-dw-dp-improvements-v11-0-0d508505f383@collabora.com>
In-Reply-To: <20260806-synopsys-dw-dp-improvements-v11-0-0d508505f383@collabora.com>
To: Sandy Huang <hjc@rock-chips.com>, 
 =?utf-8?q?Heiko_St=C3=BCbner?= <heiko@sntech.de>, 
 Andy Yan <andy.yan@rock-chips.com>, 
 Maarten Lankhorst <maarten.lankhorst@linux.intel.com>, 
 Maxime Ripard <mripard@kernel.org>, Thomas Zimmermann <tzimmermann@suse.de>, 
 Andrzej Hajda <andrzej.hajda@intel.com>, 
 Neil Armstrong <neil.armstrong@linaro.org>, Robert Foss <rfoss@kernel.org>, 
 Laurent Pinchart <Laurent.pinchart@ideasonboard.com>, 
 Jonas Karlman <jonas@kwiboo.se>, Jernej Skrabec <jernej.skrabec@gmail.com>, 
 Rob Herring <robh@kernel.org>, Krzysztof Kozlowski <krzk+dt@kernel.org>, 
 Conor Dooley <conor+dt@kernel.org>, David Airlie <airlied@gmail.com>, 
 Simona Vetter <simona@ffwll.ch>, 
 Dmitry Baryshkov <dmitry.baryshkov@oss.qualcomm.com>, 
 Luca Ceresoli <luca.ceresoli@bootlin.com>, 
 Philipp Zabel <p.zabel@pengutronix.de>
Cc: Cristian Ciocaltea <cristian.ciocaltea@collabora.com>, 
 Damon Ding <damon.ding@rock-chips.com>, Dmitry Baryshkov <lumag@kernel.org>, 
 Alexey Charkov <alchark@flipper.net>, dri-devel@lists.freedesktop.org, 
 linux-rockchip@lists.infradead.org, linux-kernel@vger.kernel.org, 
 devicetree@vger.kernel.org, kernel@collabora.com, 
 linux-arm-kernel@lists.infradead.org, 
 Sebastian Reichel <sebastian.reichel@collabora.com>, 
 Sashiko <sashiko-bot@kernel.org>
X-Mailer: b4 0.15.2
X-Developer-Signature: v=1; a=openpgp-sha256; l=2301;
 i=sebastian.reichel@collabora.com; h=from:subject:message-id;
 bh=ZiVqmaGM3+H99exZj4TcN/QyJvPS1u6+KkUwem6kKEk=;
 b=owJ4nAFtApL9kA0DAAoB2O7X88g7+poByyZiAGp0viD9wrbCV2uQtPhobuEDk+7q82oZiJ99N
 Q6StU0enFhCb4kCMwQAAQoAHRYhBO9mDQdGP4tyanlUE9ju1/PIO/qaBQJqdL4gAAoJENju1/PI
 O/qaeU4QAJejIz6YLbMl0+CJgjTL2X6u+TxIhEyh+NgWc+eLf9io6OPqZPWPNbSsrlKEofdAdrz
 LAmseWMGIPoQmvbyV7Q5JeqjLUzDufRBEtBOF33/2U2fGaU9RhZtho+p0Scw5e+L5bDnKvOkkYM
 oBb9e+2i+3ZlpB4TyjWZG3257Bq9NwaK4UBtUUdiiPgkarf2EjPyn755NZw8f//vGWnrQOwo/yW
 aFVZawEj/H4MGtO2HoR933ZOBbBk55Nju33ef69kZxHYL5ceVP1FxSIQYtQeCFmuSyOkpnhta/q
 /bRGQh2a4R59s0o421VpiNEARfcCndmhjUx1Z+KNiPt8ekn5V17OUht58bVfQOcKpTY1DOmjkiL
 CytknU1u3Fk7dkbyVGb3vjWzwlt0nO9yEIwc3RKhcTfbzNbntHCj8q+FTOKtWoSj/BBN8ekkxqF
 ClVxWbyH0pCqW0UUWU5DmiGS2ZH6Fk6WA5JpidaFqDQxV5Humr//WOIWv4iLhiQb/3IVid+q+xX
 zLwjOlxpQqRrpa2Hfrr9A9mAzH/MNzJullIxIEi1qzp+9l3pjyFiaKAyYvwy7mVoKSzo8fGit3/
 dd6RUHbKy9CaVI0Ji/clU+xned40y9yoA9VWUw/5TRCr8iSRmYBOc9DlvLn3jdiHhzCO38O0jfC
 MLiOpMFTtBm8y0wiT/B4/gA==
X-Developer-Key: i=sebastian.reichel@collabora.com; a=openpgp;
 fpr=EF660D07463F8B726A795413D8EED7F3C83BFA9A

dw_dp_link_disable() may be called in atomic mode disable even when
dw_dp_link_enable() (or an earlier step) failed during atomic mode
enable as there is no error tracking. This would result in broken PHY
power state.

This is fixed by introducing a new enabled state in the link structure
to ensure the link disabling only happens if it has been properly
enabled in the first place.

The patch also adds missing error handling in dw_dp_link_enable()
itself to ensure the link enablement becomes an atomic operation.

Fixes: 86eecc3a9c2e ("drm/bridge: synopsys: Add DW DPTX Controller support library")
Reported-by: Sashiko <sashiko-bot@kernel.org>
Signed-off-by: Sebastian Reichel <sebastian.reichel@collabora.com>
---
 drivers/gpu/drm/bridge/synopsys/dw-dp.c | 19 ++++++++++++++++++-
 1 file changed, 18 insertions(+), 1 deletion(-)

diff --git a/drivers/gpu/drm/bridge/synopsys/dw-dp.c b/drivers/gpu/drm/bridge/synopsys/dw-dp.c
index d7945f7fe9f0..21d60e89126f 100644
--- a/drivers/gpu/drm/bridge/synopsys/dw-dp.c
+++ b/drivers/gpu/drm/bridge/synopsys/dw-dp.c
@@ -280,6 +280,7 @@ struct dw_dp_link {
 	unsigned char revision;
 	unsigned int rate;
 	unsigned int lanes;
+	bool enabled;
 	u8 sink_count;
 	u8 vsc_sdp_supported;
 	struct dw_dp_link_caps caps;
@@ -1615,6 +1616,9 @@ static void dw_dp_link_disable(struct dw_dp *dp)
 {
 	struct dw_dp_link *link = &dp->link;
 
+	if (!link->enabled)
+		return;
+
 	if (dw_dp_hpd_detect(dp))
 		drm_dp_link_power_down(&dp->aux, dp->link.revision);
 
@@ -1624,6 +1628,7 @@ static void dw_dp_link_disable(struct dw_dp *dp)
 
 	link->train.clock_recovered = false;
 	link->train.channel_equalized = false;
+	link->enabled = false;
 }
 
 static int dw_dp_link_enable(struct dw_dp *dp)
@@ -1636,10 +1641,22 @@ static int dw_dp_link_enable(struct dw_dp *dp)
 
 	ret = drm_dp_link_power_up(&dp->aux, dp->link.revision);
 	if (ret < 0)
-		return ret;
+		goto err_phy_power_off;
 
 	ret = dw_dp_link_train(dp);
+	if (ret < 0)
+		goto err_link_power_down;
+
+	dp->link.enabled = true;
 
+	return 0;
+
+err_link_power_down:
+	drm_dp_link_power_down(&dp->aux, dp->link.revision);
+	dw_dp_phy_xmit_enable(dp, 0);
+
+err_phy_power_off:
+	phy_power_off(dp->phy);
 	return ret;
 }
 

-- 
2.53.0

