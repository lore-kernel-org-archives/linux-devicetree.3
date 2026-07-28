Received: from bali.collaboradmins.com (bali.collaboradmins.com [148.251.105.195])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 3C9D941A543;
	Tue, 28 Jul 2026 17:40:56 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=148.251.105.195
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1785260458; cv=none; b=oPjUBH7dmvCOKC9nPG3mdQ5dcPcKFWuEhlk869NkASGkazWr+ln9aH3eSM8r3xJNHJxWrkfAVTLxwKusHrxSpUBJ4M2iq1lUN47n/ehhkRPGAycmGYgQgBdx5EDzDw+Nnw8CHuNpUgIDbP27BsVLSV7i4tJ9US3I+6sD4bAKA8c=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1785260458; c=relaxed/simple;
	bh=k6sF2HKDGpbYJ4giz4Isms+1Pyqz8ej1CUvnf29xAd0=;
	h=From:Date:Subject:MIME-Version:Content-Type:Message-Id:References:
	 In-Reply-To:To:Cc; b=f7liHD1mXlebo//IrhpGepBHFY7oHM0tWhaFRjkyDUtHW9xEKOCCvJYTDgw3MVoOjeOTD+p+bj5LVzZa3l7DzfvtucxuuKuTQ3l52G+G2g9gUUSceqQ6G9yhvtVn+D42kTji9/gXEJOsEyfnHKDZJP28n3FI/L8vF4mNJn+Rmus=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=collabora.com; spf=pass smtp.mailfrom=collabora.com; dkim=pass (2048-bit key) header.d=collabora.com header.i=@collabora.com header.b=UBwARCCH; arc=none smtp.client-ip=148.251.105.195
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=collabora.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=collabora.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=collabora.com header.i=@collabora.com header.b="UBwARCCH"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=collabora.com;
	s=mail; t=1785260447;
	bh=k6sF2HKDGpbYJ4giz4Isms+1Pyqz8ej1CUvnf29xAd0=;
	h=From:Date:Subject:References:In-Reply-To:To:Cc:From;
	b=UBwARCCHu6jzLlnY3v9sdyNX0XBl1fffHZOvWGHX0k3hWtgReUB6ErY97P+/rR0UV
	 uGfz30jqJpyXmm97fsDm0tUB4oE2gVdJ57tyeCG1cmXkstFNmpFxqmG89CYxBiy1cI
	 X7e6lZwsk6XwTGr/OSCl5WQlpLIsoE9CePECzax41TiAqBTenvq98IMNicMINyjvCj
	 WRnfChZAXCgUgwFMb/qXQhcoyg6pu362Cs7L23yxcAuKMPr4NyZZCBCwVCbcGPVtiU
	 RGSfFfT7v4kOqnoXq0gIleGuc/or9aklyFm1f5ADsXzBCA45OUy/8KA7aUkNSqtvXW
	 EicDjezGKk6hQ==
Received: from jupiter.universe (unknown [100.64.1.62])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange x25519)
	(No client certificate requested)
	(Authenticated sender: sre)
	by bali.collaboradmins.com (Postfix) with ESMTPSA id D3F5917E07B5;
	Tue, 28 Jul 2026 19:40:46 +0200 (CEST)
Received: by jupiter.universe (Postfix, from userid 1000)
	id 1E7C7480052; Tue, 28 Jul 2026 19:40:46 +0200 (CEST)
From: Sebastian Reichel <sebastian.reichel@collabora.com>
Date: Tue, 28 Jul 2026 19:40:50 +0200
Subject: [PATCH v7 14/18] drm/bridge: synopsys: dw-dp: Protect sdp_reg_bank
 from concurrent access
Precedence: bulk
X-Mailing-List: devicetree@vger.kernel.org
List-Id: <devicetree.vger.kernel.org>
List-Subscribe: <mailto:devicetree+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:devicetree+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20260728-synopsys-dw-dp-improvements-v7-14-b7640fa8cf48@collabora.com>
References: <20260728-synopsys-dw-dp-improvements-v7-0-b7640fa8cf48@collabora.com>
In-Reply-To: <20260728-synopsys-dw-dp-improvements-v7-0-b7640fa8cf48@collabora.com>
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
 Luca Ceresoli <luca.ceresoli@bootlin.com>
Cc: Cristian Ciocaltea <cristian.ciocaltea@collabora.com>, 
 Damon Ding <damon.ding@rock-chips.com>, Dmitry Baryshkov <lumag@kernel.org>, 
 Alexey Charkov <alchark@flipper.net>, dri-devel@lists.freedesktop.org, 
 linux-rockchip@lists.infradead.org, linux-kernel@vger.kernel.org, 
 devicetree@vger.kernel.org, kernel@collabora.com, 
 linux-arm-kernel@lists.infradead.org, 
 Sebastian Reichel <sebastian.reichel@collabora.com>
X-Mailer: b4 0.15.2
X-Developer-Signature: v=1; a=openpgp-sha256; l=2444;
 i=sebastian.reichel@collabora.com; h=from:subject:message-id;
 bh=k6sF2HKDGpbYJ4giz4Isms+1Pyqz8ej1CUvnf29xAd0=;
 b=owJ4nAFtApL9kA0DAAoB2O7X88g7+poByyZiAGpo6Z2AGJLeE3hrxzZ6A/40rWPxeBi/HIfR+
 AA3Wc341MW6mokCMwQAAQoAHRYhBO9mDQdGP4tyanlUE9ju1/PIO/qaBQJqaOmdAAoJENju1/PI
 O/qaq0YP/2z3MS7BUW4ZpNYzgGIleur8LZHDRUEYYR2z0ye2vP1lfVvmYlxuNQ1PpUnZzAPpXo9
 Pz+O3pVSqmvN4Ind8fzmZA+lcHjjSrDeoLriMr+2wC3Xn7GKKVza/CW8+EveG0qqJBO6DgaybrZ
 zGWKhNGr3dl4PkUpxBFYRk6xPNmJDhaBXXo34J63/dCJlOqjkaXI8uHPRs4dkLw+lHbvlFgrIht
 RGvWdTYTzEiONrMuoneHQbwoOHLOsureXAlpdKZkhIJyfhVQKz1gXsfd4JRUTfYAXUfuB/OLVag
 eMcSNDSSnIktFAsk7navbKDOWJ0t74EdTWjbAbwOrgct5HVYdDBQo0usSOOktP+cfMjNmGFOxRf
 MABSTnCgPdC23VyG89PQmifLSvpBmXhIcj7Ir/WgjzURLpds+SsTmDls6Abfz5mfZk+jQImsNtA
 D2IYMpshXBgPl6rKG8TRo4wkmaUhJwSQhkymYgL6cQ4c+gXNCJGIWki6QYNouXX97qqBGTDYD5h
 QSKjqVDbLPFc4/MeYGUj1Ks0lVAfFl1kioclZ9G+FUS1+DnXOqZmFAjmz1w2GiGm5eoY55OA0Pv
 3lRonEa3XsLYSTspqf/967e5M6X0S75BzmTx0Fsdv7Y5V3xsxx8kX/WulCkqvWgKxy6nHy4Y33V
 qY+BY9FxfUq4+Rb8oijEt9A==
X-Developer-Key: i=sebastian.reichel@collabora.com; a=openpgp;
 fpr=EF660D07463F8B726A795413D8EED7F3C83BFA9A

Right now sdp_reg_bank is only used during atomic enable/disable and
thus there is no risk of two threads accidently claiming the same bit.

This changes once more SDP users (like audio support) are added, so
introduce a mutex to protect concurrent access to the bitmap.

Signed-off-by: Sebastian Reichel <sebastian.reichel@collabora.com>
---
 drivers/gpu/drm/bridge/synopsys/dw-dp.c | 24 +++++++++++++++++-------
 1 file changed, 17 insertions(+), 7 deletions(-)

diff --git a/drivers/gpu/drm/bridge/synopsys/dw-dp.c b/drivers/gpu/drm/bridge/synopsys/dw-dp.c
index 8b650f904575..50eb7a467932 100644
--- a/drivers/gpu/drm/bridge/synopsys/dw-dp.c
+++ b/drivers/gpu/drm/bridge/synopsys/dw-dp.c
@@ -322,6 +322,8 @@ struct dw_dp {
 	struct dw_dp_hotplug hotplug;
 	/* Serialize hpd status access */
 	struct mutex irq_lock;
+	/* Serialize sdp_reg_bank access */
+	struct mutex sdp_lock;
 
 	struct drm_dp_aux aux;
 
@@ -1047,11 +1049,13 @@ static int dw_dp_send_sdp(struct dw_dp *dp, struct dw_dp_sdp *sdp)
 	u32 reg;
 	int i, nr;
 
-	nr = find_first_zero_bit(dp->sdp_reg_bank, SDP_REG_BANK_SIZE);
-	if (nr < SDP_REG_BANK_SIZE)
-		set_bit(nr, dp->sdp_reg_bank);
-	else
-		return -EBUSY;
+	scoped_guard(mutex, &dp->sdp_lock) {
+		nr = find_first_zero_bit(dp->sdp_reg_bank, SDP_REG_BANK_SIZE);
+		if (nr < SDP_REG_BANK_SIZE)
+			set_bit(nr, dp->sdp_reg_bank);
+		else
+			return -EBUSY;
+	}
 
 	reg = DW_DP_SDP_REGISTER_BANK + nr * 9 * 4;
 
@@ -1691,7 +1695,8 @@ static void dw_dp_bridge_atomic_enable(struct drm_bridge *bridge,
 		return;
 	}
 
-	set_bit(0, dp->sdp_reg_bank);
+	scoped_guard(mutex, &dp->sdp_lock)
+		set_bit(0, dp->sdp_reg_bank);
 
 	ret = dw_dp_link_enable(dp);
 	if (ret < 0) {
@@ -1735,7 +1740,8 @@ static void dw_dp_bridge_atomic_disable(struct drm_bridge *bridge,
 
 	dw_dp_video_disable(dp);
 	dw_dp_link_disable(dp);
-	bitmap_zero(dp->sdp_reg_bank, SDP_REG_BANK_SIZE);
+	scoped_guard(mutex, &dp->sdp_lock)
+		bitmap_zero(dp->sdp_reg_bank, SDP_REG_BANK_SIZE);
 	dw_dp_reset(dp);
 	pm_runtime_put_autosuspend(dp->dev);
 }
@@ -2204,6 +2210,10 @@ struct dw_dp *dw_dp_probe(struct platform_device *pdev, const struct dw_dp_plat_
 	if (ret)
 		return ERR_PTR(ret);
 
+	ret = devm_mutex_init(dev, &dp->sdp_lock);
+	if (ret)
+		return ERR_PTR(ret);
+
 	res = devm_platform_ioremap_resource(pdev, 0);
 	if (IS_ERR(res))
 		return ERR_CAST(res);

-- 
2.53.0

