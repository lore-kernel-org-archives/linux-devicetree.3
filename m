Received: from bali.collaboradmins.com (bali.collaboradmins.com [148.251.105.195])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 9464A442100;
	Thu,  6 Aug 2026 17:02:33 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=148.251.105.195
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1786035755; cv=none; b=u9ZmPW9V3eost4aXbXiJISW6VWLyAl+TywCUXWeuefrgOWXQdRBDZPL79ZdA8jjv5y+0ojRyjOEkOd9eYtH7NQcqVDYWtx0rZSCmEnIQWB3QREFoc8gua+6s2y87hTPURdcCBwWEzoIVJA3SS5Dsaxt4avghUI6Wy0O+FWhizsQ=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1786035755; c=relaxed/simple;
	bh=rc2RzDgpPH5o2b0zMeMdVVBwWMU2wvQAig61MwLzEiI=;
	h=From:Date:Subject:MIME-Version:Content-Type:Message-Id:References:
	 In-Reply-To:To:Cc; b=A16+Ma4PxGibzS1nuLuTVQks08ja69tsQ45ER5zUobKmASX1xjwp2eLpc10cNbU51uzt0k+Q7Xz/jGTrI60NjqxKZEmhPDhHu5Eumo0rpmz8ezSzM31crVRRe34gvPfE5/KlcoT4/NTxLmsvSCPmLA+S0qwybljh/PSIgqPuMgk=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=collabora.com; spf=pass smtp.mailfrom=collabora.com; dkim=pass (2048-bit key) header.d=collabora.com header.i=@collabora.com header.b=b3U4Nl6c; arc=none smtp.client-ip=148.251.105.195
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=collabora.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=collabora.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=collabora.com header.i=@collabora.com header.b="b3U4Nl6c"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=collabora.com;
	s=mail; t=1786035745;
	bh=rc2RzDgpPH5o2b0zMeMdVVBwWMU2wvQAig61MwLzEiI=;
	h=From:Date:Subject:References:In-Reply-To:To:Cc:From;
	b=b3U4Nl6c+AeRUP/1MKzyrGBPaqcmq8XgT5CbHXpys4p1fgsUCUg9GWxEsoWo/9TpQ
	 W6T4lMIY/AosQH5WbvMHpxlCAVakxxTakPzAgEXn9dT6fplV74iBi9TJv9pBv8zPQt
	 mzxEb84hnl58f8t4GB/rgHf5spRja5w0ToApQgNRNQqGWN1N7ZNMF8aW9wkhYDYvjx
	 fQDl5+6bJJ/FbQ4bRkZLmS7FCCezsv3BB9eTu8+u5RfFiWyQwVL5zFS1OQp9RFvSw9
	 yxLV3sJK6oMLF9dhgkCS6YVPVe6czdz6akD+yntzOvWAgLroL3mIVXRqRdemg/BiwW
	 rqjITrI/hftBA==
Received: from jupiter.universe (unknown [100.64.1.62])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange x25519 server-signature RSA-PSS (4096 bits) server-digest SHA256)
	(No client certificate requested)
	(Authenticated sender: sre)
	by bali.collaboradmins.com (Postfix) with ESMTPSA id 482E517E0F83;
	Thu, 06 Aug 2026 19:02:25 +0200 (CEST)
Received: by jupiter.universe (Postfix, from userid 1000)
	id F1B02480030; Thu, 06 Aug 2026 19:02:24 +0200 (CEST)
From: Sebastian Reichel <sebastian.reichel@collabora.com>
Date: Thu, 06 Aug 2026 19:02:10 +0200
Subject: [PATCH v11 04/21] drm/bridge: synopsys: dw-dp: Document missing
 reset line deassert
Precedence: bulk
X-Mailing-List: devicetree@vger.kernel.org
List-Id: <devicetree.vger.kernel.org>
List-Subscribe: <mailto:devicetree+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:devicetree+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20260806-synopsys-dw-dp-improvements-v11-4-0d508505f383@collabora.com>
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
X-Developer-Signature: v=1; a=openpgp-sha256; l=1609;
 i=sebastian.reichel@collabora.com; h=from:subject:message-id;
 bh=rc2RzDgpPH5o2b0zMeMdVVBwWMU2wvQAig61MwLzEiI=;
 b=owJ4nAFtApL9kA0DAAoB2O7X88g7+poByyZiAGp0viDr4+NxDx8KwqSZwqspKCl31BaCO23/t
 GBa3Dx6nqomkokCMwQAAQoAHRYhBO9mDQdGP4tyanlUE9ju1/PIO/qaBQJqdL4gAAoJENju1/PI
 O/qaj+sP/2YoP9r+VyQViNtrzlwAZePbVge3GnDl6TfX2LdjmQUJ/FxLiiH/Wjdwax/dGHeSVC/
 KjxWit02cp8y2bO9DF1zEbwxM+2Cc/Q/mlFbw/NIvTyyrfw+vFVfgLokxqJn+7B+8MURkPQL9TV
 mkTRpMj44BIY9dO0Q5GHGE1TFWBhTaE7W14uHwOKq5EwtxdHBzO/EKoBzxgrk+HidPZSdyXzZwb
 87rro5R2kg6oTwJtiacbALGJ/7cFnML2Pacyd/mYK1ih3ooglx2wq3yxxduYDGTPNisFKVV2nJ4
 fFW1CNTRdASdxcvxhdWS2fw0FbCEeQID+SChYCTlHxawFLO+Bt9Qcd8cDRmxiouWjS4UBQb7lJD
 pJWxg0QaGNc0DclD6bZmQ62WYQGoB11UQO9hzG5BOGVoHNzoQQN/C+SqlcaZ8HTHRucZr88sOuB
 Ssp8qApgCQNftyk7tiIovux01RwMoEqVS+Xfjt73uhJa4utEfQegDBWNtiBWbisQAc6NHlXltG2
 cG9+ruj3ILFkoGI8DhoUaXRSpgwFzdJ8ajFAMKJY1Keoik44+Pn1hY2CL6eLZ5Wc2w97Y5B8chm
 6shYSyyN5coP3MIe/NAOw4nGikCpyFYQxRCL3HZkpEiavXWBBj+ULbtK5qVRyj3sx2PGTwh8Smr
 SYPMOxptmxLLbWUYixysqPQ==
X-Developer-Key: i=sebastian.reichel@collabora.com; a=openpgp;
 fpr=EF660D07463F8B726A795413D8EED7F3C83BFA9A

If the driver uses devm_reset_control_get_exclusive_deasserted() instead
of devm_reset_control_get() and thus automatically deasserts during
probe, the SoC will hang when the device is unbound.

This does not happen, when runtime PM is being used (not yet supported
in mainline), which suggests the power-domain involved requires this reset
line to be deasserted.

Even with runtime PM there is no gurantee that the power-domain is
disabled as it is shared. Considering the power-domain does not have
the reset dependency described in DT, document the problem but leave
things in the current state until a better solution is found as the
reset line is deasserted by default on all supported platforms.

Reported-by: Sashiko <sashiko-bot@kernel.org>
Signed-off-by: Sebastian Reichel <sebastian.reichel@collabora.com>
---
 drivers/gpu/drm/bridge/synopsys/dw-dp.c | 4 ++++
 1 file changed, 4 insertions(+)

diff --git a/drivers/gpu/drm/bridge/synopsys/dw-dp.c b/drivers/gpu/drm/bridge/synopsys/dw-dp.c
index 21d60e89126f..52e3b37259a6 100644
--- a/drivers/gpu/drm/bridge/synopsys/dw-dp.c
+++ b/drivers/gpu/drm/bridge/synopsys/dw-dp.c
@@ -2090,6 +2090,10 @@ struct dw_dp *dw_dp_probe(struct platform_device *pdev, const struct dw_dp_plat_
 		return ERR_CAST(dp->hdcp_clk);
 	}
 
+	/*
+	 * This reset line is deasserted by default; asserting it hangs the SoC if the
+	 * related power-domain is still active.
+	 */
 	dp->rstc = devm_reset_control_get(dev, NULL);
 	if (IS_ERR(dp->rstc)) {
 		dev_err_probe(dev, PTR_ERR(dp->rstc), "failed to get reset control\n");

-- 
2.53.0

