Received: from bali.collaboradmins.com (bali.collaboradmins.com [148.251.105.195])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 890FB3AE188;
	Fri, 19 Jun 2026 15:28:59 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=148.251.105.195
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1781882941; cv=none; b=djEEPKQi1T1eOOeCkVn8t/T9SbATjaZJ78VvkDQAIWF1+7FpoCC/R+/lPM46kARgfNRNhtZ6FY6qFCn04kCv+pMOq68f62q9Hiuc/KrRrlNrGvC93Eq27YxTvmUBh9F0e51E3BskwpBQkdJe/ynBKs24b0I2WjltWpi8oSaPElw=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1781882941; c=relaxed/simple;
	bh=USg1ohYmbXwetA6mCilQyNqt0XA2ZTz/AW7yPMSqQVI=;
	h=From:Date:Subject:MIME-Version:Content-Type:Message-Id:References:
	 In-Reply-To:To:Cc; b=AjopZ+QSUkNsDjbomUHD+8zBadcBvsfyDCkd53EGaRGrlhKRofWBdlmAyyWfNaJLH2EHl3kbrvHmPup+1WTvUlFYay5/C0YKU78pcGFL69eEyrXpWjFkv54vrZ6K3UNbu2FxKoKZoMFU9aGVW278YO0bNqrzV//yea2N93ZmxiQ=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=collabora.com; spf=pass smtp.mailfrom=collabora.com; dkim=pass (2048-bit key) header.d=collabora.com header.i=@collabora.com header.b=APFA5oHL; arc=none smtp.client-ip=148.251.105.195
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=collabora.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=collabora.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=collabora.com header.i=@collabora.com header.b="APFA5oHL"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=collabora.com;
	s=mail; t=1781882938;
	bh=USg1ohYmbXwetA6mCilQyNqt0XA2ZTz/AW7yPMSqQVI=;
	h=From:Date:Subject:References:In-Reply-To:To:Cc:From;
	b=APFA5oHLHPKMurd24iLfm8crvvjb3PlAJPFmIa4M89JfhiDwYeAeqA19km2CcLUye
	 BcZRHxzifvmAJrexpHUHdNWzYMxve4nBDOjZs5AxDgyCs4ecSP1JLsKzlG8nv2T9NR
	 3rwf9eee8+2BxKZy4TwNfKPLO66CRg/NymBc24MDaOD8QZeLqPnBsXDB/a+pYzr37p
	 /99apPhmd9WfMhfeMm+n4vsLSgzZE1om1PuaE7/sHolzwLLGLk9X1P1HqemTnOlNsK
	 m7N+JWPi8s9w2rYW4aMi/Nwi0ydEQID4bYXMm4wAKR0bI1hhZPcEy1FN2TzOP7XFPw
	 9gILTfmlcdD6g==
Received: from jupiter.universe (unknown [100.64.1.62])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (4096 bits) server-digest SHA256)
	(No client certificate requested)
	(Authenticated sender: sre)
	by bali.collaboradmins.com (Postfix) with ESMTPSA id D2ED517E0D6A;
	Fri, 19 Jun 2026 17:28:57 +0200 (CEST)
Received: by jupiter.universe (Postfix, from userid 1000)
	id 88DD3480029; Fri, 19 Jun 2026 17:28:57 +0200 (CEST)
From: Sebastian Reichel <sebastian.reichel@collabora.com>
Date: Fri, 19 Jun 2026 17:28:53 +0200
Subject: [PATCH v6 02/23] phy: rockchip: usbdp: Update mode_change after
 error handling
Precedence: bulk
X-Mailing-List: devicetree@vger.kernel.org
List-Id: <devicetree.vger.kernel.org>
List-Subscribe: <mailto:devicetree+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:devicetree+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20260619-rockchip-usbdp-cleanup-v6-2-3bb1f54b3f35@collabora.com>
References: <20260619-rockchip-usbdp-cleanup-v6-0-3bb1f54b3f35@collabora.com>
In-Reply-To: <20260619-rockchip-usbdp-cleanup-v6-0-3bb1f54b3f35@collabora.com>
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
X-Developer-Signature: v=1; a=openpgp-sha256; l=1789;
 i=sebastian.reichel@collabora.com; h=from:subject:message-id;
 bh=USg1ohYmbXwetA6mCilQyNqt0XA2ZTz/AW7yPMSqQVI=;
 b=owJ4nAFtApL9kA0DAAoB2O7X88g7+poByyZiAGo1YDcdZNFXYXYCdsSwKoVIWO/Y07Ka4a0ql
 MlxWYsft257U4kCMwQAAQoAHRYhBO9mDQdGP4tyanlUE9ju1/PIO/qaBQJqNWA3AAoJENju1/PI
 O/qahB8P/1xp5dCUyut8roRmyejr993KUiroWhw3aCgwLg197hQNW/aOZSHML6elpEjlYWHTGwF
 SpcyvgdOaWycIe2DwYf6iiF3tzzkFGovweZUuEDOGRJgo0XOQmoZPlXoB4tslxL+ilPup6PoT3T
 6T8buMzKljA4IHJFdSaRzKiUY58QK9fdQAWKWLXz4eIxQ3+f4zMT5m3EDleNPRssk21eRjTvzx6
 upr7BW9OKRAqmyLqH9Ljy/wHeyBoT1VAqrfFFVn6/bTd+IytZkO6ptjyXASFM8A2Dz+vjuHqhfi
 7lHtzdVPzhXnfcPxA8Y2aJ4CKMclwZgg+9xKudCkJKJf3vD09w39sMiZUuGqxXskhlsuXknzYJB
 clnSSYT8hVSRuvD8vmB4+YfPexvbSfhKnW7N2jE1EVo3a2lQIuBp/WKKVw8vpS7m4pgedvPtX6J
 D0n/c27IIy/qOB/NnY9FYYGIl/WKLgPcxf2uzukO7Engkc+HVJgZnvdHEMOccQFEvRD0A8emPZQ
 5ehKdr4ZXOks04vx8c1kYhrOucdx/F6l4py7EwGyanflicJav1eB/ue4u1zJsjHHYz/fYdxW3Il
 uVjqBCv9vkW8T+/x3wCP8YvAGYY7S0nv6JGJdRO11aJarObnpxlyEN/88hdiObDy3YXKSkx8s0E
 6E/Qaa44unrF5chVHHZg7Qw==
X-Developer-Key: i=sebastian.reichel@collabora.com; a=openpgp;
 fpr=EF660D07463F8B726A795413D8EED7F3C83BFA9A

If rk_udphy_init() or rk_udphy_setup() fails, the reinit will not be
tried again. Fix this by only updating the variable after all potential
errors have been handled.

Note, that no errors have been seen on real hardware and failures would
most likely be fatal and require at least a full reboot as the function
already asserts the PHY reset lines. So this is more of a theoretical
issue.

Fixes: 2f70bbddeb45 ("phy: rockchip: add usbdp combo phy driver")
Reported-by: Sashiko <sashiko-bot@kernel.org>
Closes: https://lore.kernel.org/linux-phy/20260612163835.8D5471F000E9@smtp.kernel.org/
Signed-off-by: Sebastian Reichel <sebastian.reichel@collabora.com>
---
 drivers/phy/rockchip/phy-rockchip-usbdp.c | 4 ++--
 1 file changed, 2 insertions(+), 2 deletions(-)

diff --git a/drivers/phy/rockchip/phy-rockchip-usbdp.c b/drivers/phy/rockchip/phy-rockchip-usbdp.c
index fba35510d88c..a5ffdf7a6e76 100644
--- a/drivers/phy/rockchip/phy-rockchip-usbdp.c
+++ b/drivers/phy/rockchip/phy-rockchip-usbdp.c
@@ -1000,15 +1000,14 @@ static int rk_udphy_power_on(struct rk_udphy *udphy, u8 mode)
 	}
 
 	if (udphy->status == UDPHY_MODE_NONE) {
-		udphy->mode_change = false;
 		ret = rk_udphy_setup(udphy);
 		if (ret)
 			return ret;
 
 		if (udphy->mode & UDPHY_MODE_USB)
 			rk_udphy_u3_port_disable(udphy, false);
-	} else if (udphy->mode_change) {
 		udphy->mode_change = false;
+	} else if (udphy->mode_change) {
 		udphy->status = UDPHY_MODE_NONE;
 		if (udphy->mode == UDPHY_MODE_DP)
 			rk_udphy_u3_port_disable(udphy, true);
@@ -1017,6 +1016,7 @@ static int rk_udphy_power_on(struct rk_udphy *udphy, u8 mode)
 		ret = rk_udphy_setup(udphy);
 		if (ret)
 			return ret;
+		udphy->mode_change = false;
 	}
 
 	udphy->status |= mode;

-- 
2.53.0

