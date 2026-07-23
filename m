Received: from bali.collaboradmins.com (bali.collaboradmins.com [148.251.105.195])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 32A024071E2;
	Thu, 23 Jul 2026 22:17:32 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=148.251.105.195
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1784845054; cv=none; b=L1thZLfxssfSjnhAfI8JhOa5cbxU+jQOinpeuvD34h29JuSI8y/YHxaefUSOViLM/LBqPKQslZcljL+cVVfhy9lPwFI+S5rfawA0c2pFcx6b8Na7voTyYjzMViXRfwiiHTnJUyvj/MR+qNZPH385VrmEE0O1eJmmWwQVP9UuCCk=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1784845054; c=relaxed/simple;
	bh=yiVcOQ4cf/0UvZlieIJedpMgqZji9/jQ/GmCQgXnTqI=;
	h=From:Date:Subject:MIME-Version:Content-Type:Message-Id:References:
	 In-Reply-To:To:Cc; b=WAJ2zDIb1LgTrRaQofGvhQiSyqefZ1wcrIK5ea0weW1Rmg51jsAjdIsQjtDy6COd2JPRqUEsoahWE8p4zJM9cxkCmcxu/CYA70sLQAzfsPiRmf3/mxCZmtVLwIKiyYp9nkSq3hW7RGe4TjOpz1oPpocp9BpHMUM0qbNZgW0yhXs=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=collabora.com; spf=pass smtp.mailfrom=collabora.com; dkim=pass (2048-bit key) header.d=collabora.com header.i=@collabora.com header.b=Z85Mkh3D; arc=none smtp.client-ip=148.251.105.195
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=collabora.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=collabora.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=collabora.com header.i=@collabora.com header.b="Z85Mkh3D"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=collabora.com;
	s=mail; t=1784845043;
	bh=yiVcOQ4cf/0UvZlieIJedpMgqZji9/jQ/GmCQgXnTqI=;
	h=From:Date:Subject:References:In-Reply-To:To:Cc:From;
	b=Z85Mkh3DNHW7qzU/LG6t8wfGogFx5Zb89EabGl4dpXzH/RKTVZ/bc11+Sk7lkqVQ8
	 yzVnpQnBTfu0m3MMwdgrTXCTLsb7evM8/bCIjytav23AzjBdXA4KC/qsr2aQ0pFjj4
	 BObSGvyJ4zNyvsvlTrHIr6cYH08mbGeycU1c7LHgaiH0OiDz9dJHec4FErtXhSHa/2
	 hTot6SEJvhvXdvoq3kwjqZiqdDakQrSCjb6AaJj2r4op59VunRtQHHuZZPEzW7WuBB
	 2ktSgZ1DLjsQcnenOFhf2abMN/hLQ0u03aXhIDeyyR3kdWXJhE5VkSAMYiVNRJQ9SP
	 sj0l0GmoDOoUg==
Received: from jupiter.universe (unknown [100.64.1.62])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange x25519)
	(No client certificate requested)
	(Authenticated sender: sre)
	by bali.collaboradmins.com (Postfix) with ESMTPSA id C6C9C17E3BAA;
	Fri, 24 Jul 2026 00:17:22 +0200 (CEST)
Received: by jupiter.universe (Postfix, from userid 1000)
	id 1DC1548004C; Fri, 24 Jul 2026 00:17:22 +0200 (CEST)
From: Sebastian Reichel <sebastian.reichel@collabora.com>
Date: Fri, 24 Jul 2026 00:17:20 +0200
Subject: [PATCH v5 12/15] drm/bridge: synopsys: dw-dp: Protect sdp_reg_bank
 from concurrent access
Precedence: bulk
X-Mailing-List: devicetree@vger.kernel.org
List-Id: <devicetree.vger.kernel.org>
List-Subscribe: <mailto:devicetree+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:devicetree+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20260724-synopsys-dw-dp-improvements-v5-12-9445c2e87441@collabora.com>
References: <20260724-synopsys-dw-dp-improvements-v5-0-9445c2e87441@collabora.com>
In-Reply-To: <20260724-synopsys-dw-dp-improvements-v5-0-9445c2e87441@collabora.com>
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
X-Mailer: b4 0.14.3
X-Developer-Signature: v=1; a=openpgp-sha256; l=2444;
 i=sebastian.reichel@collabora.com; h=from:subject:message-id;
 bh=yiVcOQ4cf/0UvZlieIJedpMgqZji9/jQ/GmCQgXnTqI=;
 b=owJ4nAFtApL9kA0DAAoB2O7X88g7+poByyZiAGpikvHEw4LvDdG8llV+u2zZRHNqbeIAiaSlG
 72XvR6XhYdaIYkCMwQAAQoAHRYhBO9mDQdGP4tyanlUE9ju1/PIO/qaBQJqYpLxAAoJENju1/PI
 O/qafXMP/jFMp4SCX2G92JHFicza/4wAJs3ZJ7EjVOVrMINYPnw4RPXnUXgs72lT5CoC/SOlRYe
 6pnYqUqhUk6tFYZ0XF3o+hg1D+TVSibh6RlRoCVNMNkEdnn15YLGEuVLIyEdtV0wN2jxcmsG4CJ
 DylLIw5NXZt4P+Aa+2xXRMXExGawmW3+NGZtuRRSPg0/CtVXwDQ+hyVJJanuvLfehd6M2ovajx4
 u6x3D+DrfFyA49To61kU7oUf6cE8QInoLf4DKxCQ0L+j9tyvt+0Qk9S1MXGfgA8aFEjydukvZdu
 Zeuc+QPR/p55Dm7IvIRw6kLtHICpUntdVlG1wynE/GxHA4/Dmv6k3saAAPe+s/wCR2mOhoHRbTi
 XUJMhY0YORAIZf25w9ubQN0GkphrpfBx4ezqkArm1sF9nkfSvt2Gvpf4e7d6zoFTwyRpmmdTDah
 xCrEzXxUp1xovrdDibt+fZJ8OP9u25bwDsxF7UY5SDPS2GoTTJrerr4u81i0cwsPWc2CXKMErUt
 johLykS/swqPvWlaJ2J4VIle0PYL2TVufzYZs7IJqLw78wFnard7Q+bik5B07KDAAC566uInHne
 tlWoLQd+AJJw61vxSag9WRlOK/ildlMfx7l7woWXjKPXWMnnnGM8PEzaVMZPKmZTY+Iwk5oFXf9
 0qtrAtKPnc/wgBsEQLqU88g==
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
index bcf7ad84f217..435f23fe391e 100644
--- a/drivers/gpu/drm/bridge/synopsys/dw-dp.c
+++ b/drivers/gpu/drm/bridge/synopsys/dw-dp.c
@@ -322,6 +322,8 @@ struct dw_dp {
 	struct dw_dp_hotplug hotplug;
 	/* Serialize hpd status access */
 	struct mutex irq_lock;
+	/* Serialize sdp_reg_bank access */
+	struct mutex sdp_lock;
 
 	struct drm_dp_aux aux;
 
@@ -1045,11 +1047,13 @@ static int dw_dp_send_sdp(struct dw_dp *dp, struct dw_dp_sdp *sdp)
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
 
@@ -1740,7 +1744,8 @@ static void dw_dp_bridge_atomic_enable(struct drm_bridge *bridge,
 		return;
 	}
 
-	set_bit(0, dp->sdp_reg_bank);
+	scoped_guard(mutex, &dp->sdp_lock)
+		set_bit(0, dp->sdp_reg_bank);
 
 	ret = dw_dp_link_enable(dp);
 	if (ret < 0) {
@@ -1780,7 +1785,8 @@ static void dw_dp_bridge_atomic_disable(struct drm_bridge *bridge,
 
 	dw_dp_video_disable(dp);
 	dw_dp_link_disable(dp);
-	bitmap_zero(dp->sdp_reg_bank, SDP_REG_BANK_SIZE);
+	scoped_guard(mutex, &dp->sdp_lock)
+		bitmap_zero(dp->sdp_reg_bank, SDP_REG_BANK_SIZE);
 	dw_dp_reset(dp);
 	pm_runtime_put_autosuspend(dp->dev);
 }
@@ -2173,6 +2179,10 @@ struct dw_dp *dw_dp_probe(struct platform_device *pdev, const struct dw_dp_plat_
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

