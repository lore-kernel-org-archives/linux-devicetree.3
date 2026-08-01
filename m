Received: from mail-pj2-f4.google.com (mail-pj2-f4.google.com [74.125.227.132])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 980A51AAE28
	for <devicetree@vger.kernel.org>; Sat,  1 Aug 2026 14:24:22 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=74.125.227.132
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1785594273; cv=none; b=UWP/QMU0wjRq++whI70zPsNZ8H/NV0qHv5oRrg/E0Phs6lfHf/r1bYt00TDXss5DAC9HRDMRy548Pl7F4GV+fU228WOO9xH0TnhocyoWPqPjmmcv1c1ZFotoNRxMfFVHxyLZjpJJOXxl5zcFF+w3GERZ6+6mTrtYNNXmIaChr2Q=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1785594273; c=relaxed/simple;
	bh=ekhQayFdhTwRrW5sTrt8sRRbZApqgEdJGIrgdXRA6io=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version; b=EZeWYjXuk3d/HQmzIXZLUysh1J3fniLX40Nfy6LUGS0KFK+NVFWW6GxMyQR+2g3tB0+xtvKe+/ZBBCvTAIdczb7sYY11SieLuF5TRpmfPe+nKmuICMv5eNpHC3BJiS0yb28thzlAxdrSf+Cz5il8i6DqHM0ys0Ea9kHB5FINVbE=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=UlbUe3dw; arc=none smtp.client-ip=74.125.227.132
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="UlbUe3dw"
Received: by mail-pj2-f4.google.com with SMTP id d9443c01a7336-2cc80544c74so5203895ad.0
        for <devicetree@vger.kernel.org>; Sat, 01 Aug 2026 07:24:22 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1785594262; x=1786199062; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=q83Sos7xhYVmpTWu/ghFNGUmMBURB6KpF38DP5+YZjg=;
        b=UlbUe3dwqkpzWG1CxMDtYmOmrqjbxvyR3c20U9beftkwsHsEgVCkRf6ZwcBOZPUjLO
         4v58Bk0ax4qQ2/EDKMc9HZWnM8CBo93mZbZ8kU8JVhb1Eg88l1aakU82+N/EDJVe3bZw
         KZa/RiMYJSELmfgNC9lczJCth7+DcGeW+g9enYDKcKS+wZlw3+iKmTO9jd4xH/NzcQc3
         UCw9kkMvLweDeKBjvGtP7PZWk4r4rTVjmDRWZKt2zqMG4exk6X6e6peoRavWiSz4L5Hq
         g5gMqCKJ+i0Dzo0oSDFUaWb67sJTXDAUWL9e9NSV4pkPHsMnIwUcP0Ikf9zbgQARu0T2
         ze2w==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1785594262; x=1786199062;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to:content-type;
        bh=q83Sos7xhYVmpTWu/ghFNGUmMBURB6KpF38DP5+YZjg=;
        b=BiNEbhzbk8dLz+wFDLZMG9MFMbQKu5MzhFh+WNZiJZCWIfQ/VHOoDCR1Aidl7gxQH2
         Patf+dRPnPgRmuUT24hRiPvRPIdTc3jH5q+dXkvKZ5+3qTb18tmJePVDZAK7ss4klJYc
         1GT2luHW9x9jo+NACasiY8/waFrQ2sTxGf65Lj3chxewnysFKufFpq2yM0cBEkq/qHKH
         YwcH/SLC3aAoMlJF8jB+5yOt7EakeCui+fJQJ85eKr/m7baTat9Ml3NJhZPH5/w6rZLc
         tRN53rb4O0RkrbVH8HsgneikJu6ROwZDV+qU6KFdQxARO8KK/loAJq94Cj/1CPq1W9DO
         i9nA==
X-Forwarded-Encrypted: i=1; AHgh+RpdJH/CzPKG3Mv1yBbuM5tnlbfshMlHdONfZP5e9FaxUA/ZVleCk0mypI/DJjFLRj9D00/DQJUQQvns@vger.kernel.org
X-Gm-Message-State: AOJu0YzcX9H41KOuYlq576NseCFqaK8zEJAMqXrlHc0lJy399Ns/zGk9
	YeJyvAfION07NCKmh6eAuqZn0bjBmEoO5wqhJzlCEYEqCN/7UXyMO61E
X-Gm-Gg: AR+sD13LsXGNgBRRbmqbuGpLni4FJ5T6QBWsH3LNlBgU4c1NtduajFZMur4rsXQXu4F
	Ue5DrIRzJG9i52u7MKTjVP0y0cazlwLy8PHFB8KVVpwh1ZF73wnqB7lz6cWd17MHzaRF3xjeYnW
	zTJXRsjkA2XahzGME44ieKrAxlctGyWOXtnX7jvXVm2InQ46/bcL1a9mtbp/qyiBXorVRVpjE+h
	2qKXGYpAM0FgiNcWKJ7ZDWdDASmwSgmU0fTXJswUNIOs5+HLWORt6IKNNb20I6Q/fdnI4TuL9TL
	rjGXHP2Y9T8QmHqJI1hs8iEJET9Rz5DZnsbUiVtdEPmchwAuZfSG/x/3rz48bMruuD9Kju6C7dS
	ZPiIP47KZcPlSEbK5mzF3CnFQCoTHwUErYRNc9udXajVgImO7uSOeFWS/m7DL0EUFGETy1Ri/9X
	n+LS1cEWh3fQLt+wX/yL5Gn2COYy0SlfFQmBt9y+o6MHSP2DvuloXS6Mo=
X-Received: by 2002:a17:903:234b:b0:2c7:f12d:5d37 with SMTP id d9443c01a7336-2d0521b8488mr34096625ad.17.1785594261862;
        Sat, 01 Aug 2026 07:24:21 -0700 (PDT)
Received: from server.lan ([103.213.4.16])
        by smtp.gmail.com with ESMTPSA id d9443c01a7336-2d04ae5ac3dsm18043845ad.23.2026.08.01.07.24.13
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Sat, 01 Aug 2026 07:24:20 -0700 (PDT)
From: Coia Prant <coiaprant@gmail.com>
To: Andrew Lunn <andrew+netdev@lunn.ch>,
	"David S . Miller" <davem@davemloft.net>,
	Eric Dumazet <edumazet@google.com>,
	Jakub Kicinski <kuba@kernel.org>,
	Paolo Abeni <pabeni@redhat.com>,
	Rob Herring <robh@kernel.org>,
	Krzysztof Kozlowski <krzk+dt@kernel.org>,
	Conor Dooley <conor+dt@kernel.org>,
	Heiko Stuebner <heiko@sntech.de>,
	Vinod Koul <vkoul@kernel.org>,
	Maxime Chevallier <maxime.chevallier@bootlin.com>,
	Maxime Coquelin <mcoquelin.stm32@gmail.com>,
	Alexandre Torgue <alexandre.torgue@foss.st.com>,
	Lad Prabhakar <prabhakar.mahadev-lad.rj@bp.renesas.com>,
	Romain Gantois <romain.gantois@bootlin.com>,
	Heiner Kallweit <hkallweit1@gmail.com>,
	Coia Prant <coiaprant@gmail.com>
Cc: Neil Armstrong <neil.armstrong@linaro.org>,
	Russell King <linux@armlinux.org.uk>,
	Shawn Lin <shawn.lin@rock-chips.com>,
	David Heidelberg <david@ixit.cz>,
	netdev@vger.kernel.org,
	linux-rockchip@lists.infradead.org,
	devicetree@vger.kernel.org,
	linux-arm-kernel@lists.infradead.org,
	linux-kernel@vger.kernel.org,
	linux-phy@lists.infradead.org,
	linux-stm32@st-md-mailman.stormreply.com,
	linux-renesas-soc@vger.kernel.org
Subject: [PATCH v2 10/10] MAINTAINERS: add entry for Rockchip XPCS driver
Date: Sat,  1 Aug 2026 22:22:34 +0800
Message-ID: <20260801142244.679437-12-coiaprant@gmail.com>
X-Mailer: git-send-email 2.47.3
In-Reply-To: <20260801142244.679437-2-coiaprant@gmail.com>
References: <20260801142244.679437-2-coiaprant@gmail.com>
Precedence: bulk
X-Mailing-List: devicetree@vger.kernel.org
List-Id: <devicetree.vger.kernel.org>
List-Subscribe: <mailto:devicetree+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:devicetree+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

Add a MAINTAINERS entry for the Rockchip RK3568 XPCS platform driver
and its device tree binding.

Include the relevant mailing lists (netdev and linux-rockchip) so that
future patches are properly distributed.

Signed-off-by: Coia Prant <coiaprant@gmail.com>
---
 MAINTAINERS | 9 +++++++++
 1 file changed, 9 insertions(+)

diff --git a/MAINTAINERS b/MAINTAINERS
index 5114e6db7307d..cd5ffae6afd34 100644
--- a/MAINTAINERS
+++ b/MAINTAINERS
@@ -23468,6 +23468,15 @@ S:	Maintained
 F:	Documentation/devicetree/bindings/sound/rockchip,rk3576-sai.yaml
 F:	sound/soc/rockchip/rockchip_sai.*
 
+ROCKCHIP XPCS DRIVER
+M:	Coia Prant <coiaprant@gmail.com>
+L:	netdev@vger.kernel.org
+L:	linux-rockchip@lists.infradead.org
+S:	Maintained
+F:	Documentation/devicetree/bindings/net/pcs/rockchip-dwxpcs.yaml
+F:	drivers/net/pcs/pcs-xpcs-rk.c
+F:	include/linux/pcs/pcs-xpcs-rk.h
+
 ROCKER DRIVER
 M:	Jiri Pirko <jiri@resnulli.us>
 L:	netdev@vger.kernel.org
-- 
2.47.3

