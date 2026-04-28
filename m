Received: from bali.collaboradmins.com (bali.collaboradmins.com [148.251.105.195])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 42E7E478E56;
	Tue, 28 Apr 2026 16:14:09 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=148.251.105.195
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1777392851; cv=none; b=Tek6hP/m2CZCSHZhRdrVwbijSMPShHtOX/x9960VlsAD+EETxTuzWeKmBN+mtjhRa9XW5I11xeHIARA5a/gMaC2OS8D8PP//4Suy8PI4CDlxY13wzigwiDqeriIHDbzebptCX6me0GF4ROzo4U050vq0yQumrnITVGHwKYs6+zM=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1777392851; c=relaxed/simple;
	bh=qFPX/4eUGg2atGILKlG0XCijsAsacnxtqfiBlRM0ujg=;
	h=From:Date:Subject:MIME-Version:Content-Type:Message-Id:References:
	 In-Reply-To:To:Cc; b=YbujZymq9GXzl3JDI5Xzwx0/gEgiekZTqRx+SfSVRPmMaV0/NAl3RdR8ZCC3lNLFDjpiR+ODhKOWSSPf1xJnN/xyZvVDTg9JoJLGKIHMJHlFpX23Z5ogSgetKQluclaVIyTmYV/5w45JNgFw8D0xJfCNKA8FU/kdbpTUTv2OMzk=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=collabora.com; spf=pass smtp.mailfrom=collabora.com; dkim=pass (2048-bit key) header.d=collabora.com header.i=@collabora.com header.b=lhGM6Xmk; arc=none smtp.client-ip=148.251.105.195
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=collabora.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=collabora.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=collabora.com header.i=@collabora.com header.b="lhGM6Xmk"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=collabora.com;
	s=mail; t=1777392842;
	bh=qFPX/4eUGg2atGILKlG0XCijsAsacnxtqfiBlRM0ujg=;
	h=From:Date:Subject:References:In-Reply-To:To:Cc:From;
	b=lhGM6XmkAS/XN9aac2Mtff66apwaHIF74CI/QMbV7FfYu/Ob3D/H0l1TDkYxpG+rg
	 yQJPS6X8SoDaiFfW+GEDDCRzCwB9/cNwZohWKTF+PdXzgwSetBn3nJrLAERflpq676
	 xlVgKFl3lTBFv7aImbRpiuVtQELupHgHIzRrZ9I+wl3aOiL8SbU51eDK67b0V3Cx8t
	 CL9lHbI8+dHKcKTR0bfoW6DDMERsJEpq1/W3RhDJ40neTjWDQbVSjtzYDpHKkw+yMd
	 4uv+io22OM/fxKY8nTgY3rfwocbcvu4fSjkRqf4MApsITYTZVNYX7A2pARab35qVhs
	 v/pAIWbjsPlyQ==
Received: from jupiter.universe (unknown [100.64.1.62])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (4096 bits))
	(No client certificate requested)
	(Authenticated sender: sre)
	by bali.collaboradmins.com (Postfix) with ESMTPSA id 59EA017E15A7;
	Tue, 28 Apr 2026 18:14:02 +0200 (CEST)
Received: by jupiter.universe (Postfix, from userid 1000)
	id 94DED480062; Tue, 28 Apr 2026 18:14:01 +0200 (CEST)
From: Sebastian Reichel <sebastian.reichel@collabora.com>
Date: Tue, 28 Apr 2026 18:13:53 +0200
Subject: [PATCH v4 14/16] phy: rockchip: usbdp: Re-init the PHY on
 orientation change
Precedence: bulk
X-Mailing-List: devicetree@vger.kernel.org
List-Id: <devicetree.vger.kernel.org>
List-Subscribe: <mailto:devicetree+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:devicetree+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20260428-rockchip-usbdp-cleanup-v4-14-7775671ece22@collabora.com>
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
X-Developer-Signature: v=1; a=openpgp-sha256; l=1257;
 i=sebastian.reichel@collabora.com; h=from:subject:message-id;
 bh=qFPX/4eUGg2atGILKlG0XCijsAsacnxtqfiBlRM0ujg=;
 b=owJ4nAFtApL9kA0DAAoB2O7X88g7+poByyZiAGnw3MmBkCuKWKXdwR9zUCQ9nXzhCA/OgTvUO
 D5O00vL6gEYpYkCMwQAAQoAHRYhBO9mDQdGP4tyanlUE9ju1/PIO/qaBQJp8NzJAAoJENju1/PI
 O/qa7nwQAI+Jwg6MSk5g3e70+TJtqWEdnCjKxIRL8rM6TRLLbms9APa4F25/iivCQNq4CRKm+af
 0bazVVRcb8QNDd5l3/6q5y5P6cEXFUmdMS2rAGazqdQgmZ5Qk9YOx060fCo2meLZ347Q7oFKYGI
 KfAMACMAoWbL/Y60ObYk71xYGWTF9U7Zv8YrlfqZHEdSPqWHnGlYEkav8Zq+fiKnxnoD/N+hKDA
 MEgX4u6pe8YwQwtVhONomXchiCRBoCxa+L1KjxdTfm39eKH0AePTGeN+SrNPgZXrhtcTnAQSttQ
 m3qdRtGEEGV9hsG/erk+hiIZZdNCsLpmh5tlXTNwUQzIUhaGoTHiCzOXEhJqeN07sFMyyfLQwqU
 O0g336YGifTLAYcpO8abgv4TftUNNYq44hWuZNa+o/1QwNdz+JgqneYMiry4B+hlMd8Aiorw7D1
 tBcXfvOQiIadT1Xr80NcAo/FhJxpsiRu2jSe8oN9Witc9dCZvYi4sxqA3Gi7tOR4zYJDli7w6Lm
 vg+JaNhpPejXbLxtTL0j7FJQKDNdE/mmnIHut07tK8vzR7Ch8c3oAcdzNXTAqziEIfX5OgzYNzZ
 ls93Q8rt2LcuDVOnj2rBHRbKVl25abMvjm7RjsfpelvzW5LHGEefWoeyEg4Bkd3Fypx+uGgcOi8
 vBkAT9uP7zpwCA0mnRQ4vaQ==
X-Developer-Key: i=sebastian.reichel@collabora.com; a=openpgp;
 fpr=EF660D07463F8B726A795413D8EED7F3C83BFA9A

Changing the cable orientation reconfigures the lane muxing, which
requires re-initializing the PHY. Without this DP functionality
breaks, if the cable is re-plugged with swapped orientation.

Signed-off-by: Sebastian Reichel <sebastian.reichel@collabora.com>
---
 drivers/phy/rockchip/phy-rockchip-usbdp.c | 6 +++++-
 1 file changed, 5 insertions(+), 1 deletion(-)

diff --git a/drivers/phy/rockchip/phy-rockchip-usbdp.c b/drivers/phy/rockchip/phy-rockchip-usbdp.c
index 694832cc161e..80fe5993c6c7 100644
--- a/drivers/phy/rockchip/phy-rockchip-usbdp.c
+++ b/drivers/phy/rockchip/phy-rockchip-usbdp.c
@@ -624,6 +624,7 @@ static int rk_udphy_orien_sw_set(struct typec_switch_dev *sw,
 				 enum typec_orientation orien)
 {
 	struct rk_udphy *udphy = typec_switch_get_drvdata(sw);
+	bool flipped = orien == TYPEC_ORIENTATION_REVERSE;
 
 	mutex_lock(&udphy->mutex);
 
@@ -635,7 +636,10 @@ static int rk_udphy_orien_sw_set(struct typec_switch_dev *sw,
 		goto unlock_ret;
 	}
 
-	udphy->flip = orien == TYPEC_ORIENTATION_REVERSE;
+	if (udphy->flip != flipped)
+		udphy->phy_needs_reinit = true;
+
+	udphy->flip = flipped;
 	rk_udphy_set_typec_default_mapping(udphy);
 	rk_udphy_usb_bvalid_enable(udphy, true);
 

-- 
2.53.0

