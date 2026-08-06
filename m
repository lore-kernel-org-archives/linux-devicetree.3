Received: from bali.collaboradmins.com (bali.collaboradmins.com [148.251.105.195])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 578C73A382F;
	Thu,  6 Aug 2026 00:39:20 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=148.251.105.195
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1785976762; cv=none; b=LhfoGQHzwnILEChZmXf3sQMVBj5D7lF01KwoPibMvUdXhXyKk+Bl3R9gpGTDQTx0YV/vCFwa4DRL7nrjGVmT16Wr9GpWbGDxwH3BFIANxzPyKGGTWiZQKxBz3SyD5egHi+2gra6ArMdOmA53VvNZl1go0dUT32O5yH26xGErIww=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1785976762; c=relaxed/simple;
	bh=1tBl2R5rjtLWnLxWK1fLnuHlYl63j8aoeW5amYJufHI=;
	h=From:Date:Subject:MIME-Version:Content-Type:Message-Id:References:
	 In-Reply-To:To:Cc; b=r2qVHaBTw9M8akLb2uRBDJRhsHgEs8ePr2shZ6aMmRYP3vdbemPg/a8UrfGPiFNLLFc3qpzmjp4lR6rdictLvltaJJSBnRQSrTTVG6jIaOhmw2RLQospacYsfBihB+vbq13FWyrOhbLPp+yv9xk7zNZ7pnoShgHC6YnDCer2Se8=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=collabora.com; spf=pass smtp.mailfrom=collabora.com; dkim=pass (2048-bit key) header.d=collabora.com header.i=@collabora.com header.b=n5NWU49+; arc=none smtp.client-ip=148.251.105.195
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=collabora.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=collabora.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=collabora.com header.i=@collabora.com header.b="n5NWU49+"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=collabora.com;
	s=mail; t=1785976751;
	bh=1tBl2R5rjtLWnLxWK1fLnuHlYl63j8aoeW5amYJufHI=;
	h=From:Date:Subject:References:In-Reply-To:To:Cc:From;
	b=n5NWU49+UgvLrI5xitD2xkgap8HIZOOi+a3gxKcgDAbeTh4Ibq9m8laInzR0LJk98
	 C+Idom728G3gy2hm0LOKNZwKy35tBvxm0EvcZ+eGmqudK0H0VTqeNX71lcMEQjNWdT
	 Oxyd06MAIN05b/836S55EM8ladNK8gOaBN0LtF9ObdknGbgk5IS5XwYkQODJxWMKe+
	 FM5sk1MmG0NjNNHgUG+m1iRinzhXYCMY8Ch6HfS/7Yi0Gn9Uu45UlnNy62+RP7c53G
	 4W7MS6yDIVTnIIZJkLdMoNQiw612U96Y8woNJcDrm8qpVg8yGbvL5dNWZXKBFldrOE
	 zgEs41IVmRLWQ==
Received: from jupiter.universe (unknown [100.64.1.62])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange x25519)
	(No client certificate requested)
	(Authenticated sender: sre)
	by bali.collaboradmins.com (Postfix) with ESMTPSA id 99E5A17E0851;
	Thu, 06 Aug 2026 02:39:11 +0200 (CEST)
Received: by jupiter.universe (Postfix, from userid 1000)
	id A26ED480065; Thu, 06 Aug 2026 02:39:10 +0200 (CEST)
From: Sebastian Reichel <sebastian.reichel@collabora.com>
Date: Thu, 06 Aug 2026 02:39:25 +0200
Subject: [PATCH v10 19/21] drm/bridge: synopsys: dw-dp: Use regmap_set_bits
 in dw_dp_send_sdp
Precedence: bulk
X-Mailing-List: devicetree@vger.kernel.org
List-Id: <devicetree.vger.kernel.org>
List-Subscribe: <mailto:devicetree+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:devicetree+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20260806-synopsys-dw-dp-improvements-v10-19-d84a26c303d6@collabora.com>
References: <20260806-synopsys-dw-dp-improvements-v10-0-d84a26c303d6@collabora.com>
In-Reply-To: <20260806-synopsys-dw-dp-improvements-v10-0-d84a26c303d6@collabora.com>
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
 Sebastian Reichel <sebastian.reichel@collabora.com>
X-Mailer: b4 0.15.2
X-Developer-Signature: v=1; a=openpgp-sha256; l=1255;
 i=sebastian.reichel@collabora.com; h=from:subject:message-id;
 bh=1tBl2R5rjtLWnLxWK1fLnuHlYl63j8aoeW5amYJufHI=;
 b=owJ4nAFtApL9kA0DAAoB2O7X88g7+poByyZiAGpz164kNlhKjfk2jFVhjwubNZMf43ZFSWW+O
 FjFvoalJ5HeN4kCMwQAAQoAHRYhBO9mDQdGP4tyanlUE9ju1/PIO/qaBQJqc9euAAoJENju1/PI
 O/qa1PMP/jA/41vMMVbj3kqoYzG6ZxqIp/3/RmD+m6VPja9NGCw0diVtpIrSp6ZFqdhSNg4jdpG
 PPaL1oJIrj2u4CXVXkiqV4BaZNhjc/A6bgw5oVqiyVG0VUY5CL7qFKdYMNaZpeKOwZe7TKV21Pc
 +ue63WChRWVPP88hA1S9GVxNUkrJOeL35wUq05iB73wWD+OjHheCbRfIU96mfVtcJgzHrdiME6H
 ymWCuYSE7sNgFlQTWGkzzChOB5DlSNvBOBXOpu9YvT4vXvyPtE05aEmVIdX70nBdtIO7y4XmjHm
 uxCsNfWSoRw4BzfRF9bru6oDG8bfEQ87eAh9wpuq2QLn5VM7ipBmYlNneXd2Ikg7aajboTh6VQ7
 lbk+rejEkCUcBaBbPRdcI2dsIxuxLPN1JDExxSlz8XQcKzJ5W/plRMI7tX0eNUFH+m2iH5eHd14
 fOcCnbMVHFkbrLoETPDYS/yK2IDk0I6a8bViAEK7H96IrmJhTmB4dXIaCwagrwlKc04L6JcmhdX
 YSOMQd90fvyXTekexi1i5SL2dRmbpSZ1v51S53TalCdGbK4efaKz/tPKc3gfvXu2R7l+spNOIm4
 O+8i+tmBJ9zi2gv/5MjM+8PmrOC9/m3S5phxgstF3+y0t8V4pwwLoA5Gll7Q1U96faiLkhlGv5W
 B6PtTo22xrsgaCC1bdHkzWA==
X-Developer-Key: i=sebastian.reichel@collabora.com; a=openpgp;
 fpr=EF660D07463F8B726A795413D8EED7F3C83BFA9A

Simplify dw_dp_send_sdp() a little bit by making use of
regmap_set_bits.

No functional change intended.

Signed-off-by: Sebastian Reichel <sebastian.reichel@collabora.com>
---
 drivers/gpu/drm/bridge/synopsys/dw-dp.c | 10 ++++------
 1 file changed, 4 insertions(+), 6 deletions(-)

diff --git a/drivers/gpu/drm/bridge/synopsys/dw-dp.c b/drivers/gpu/drm/bridge/synopsys/dw-dp.c
index 2883922af969..35e45b5c3fc4 100644
--- a/drivers/gpu/drm/bridge/synopsys/dw-dp.c
+++ b/drivers/gpu/drm/bridge/synopsys/dw-dp.c
@@ -1070,14 +1070,12 @@ static int dw_dp_send_sdp(struct dw_dp *dp, struct dw_dp_sdp *sdp)
 			     FIELD_PREP(SDP_REGS, get_unaligned_le32(payload)));
 
 	if (sdp->flags & DW_DP_SDP_VERTICAL_INTERVAL)
-		regmap_update_bits(dp->regmap, DW_DP_SDP_VERTICAL_CTRL,
-				   EN_VERTICAL_SDP << nr,
-				   EN_VERTICAL_SDP << nr);
+		regmap_set_bits(dp->regmap, DW_DP_SDP_VERTICAL_CTRL,
+				EN_VERTICAL_SDP << nr);
 
 	if (sdp->flags & DW_DP_SDP_HORIZONTAL_INTERVAL)
-		regmap_update_bits(dp->regmap, DW_DP_SDP_HORIZONTAL_CTRL,
-				   EN_HORIZONTAL_SDP << nr,
-				   EN_HORIZONTAL_SDP << nr);
+		regmap_set_bits(dp->regmap, DW_DP_SDP_HORIZONTAL_CTRL,
+				EN_HORIZONTAL_SDP << nr);
 
 	return nr;
 }

-- 
2.53.0

