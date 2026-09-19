Received: from mail-pz2-f9.google.com (mail-pz2-f9.google.com [74.125.228.9])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 50FC639B972
	for <devicetree@vger.kernel.org>; Sat, 19 Sep 2026 12:53:13 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=74.125.228.9
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1789822394; cv=none; b=HfpX5VXbzHske2Rz/4RdvdsSA0qNkavUbjmgoLBo44VIVrEdoq2HeroXflIazYQTddHYzYHUnwvNsB5/aoRF4Jldk4OxetdQRu3NfAmaDcITOv03LqoR1VV2UL5HhcEZLW0v2fI5E66LSjfg9fUN42leuE8RPz8ItWs1DXWZipU=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1789822394; c=relaxed/simple;
	bh=tCrgHNTqayWFj1XRarWJorXnl2XIBvQrDCQv89fV94M=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version; b=spbBXWzPMB4e+DcaqWF0U9Pk1cA7uv8JTn67qSwE2D2D8LBNfGyniIbpN4jlE2i+S+4L3GDvESlqwxAJfv/uukODG0R/bvihc+h8H0fucKn8a1KIvOzqoJEIjrAlJU3lgJW9S65oqxfhOn4rW8HiQDqWx1QHR9oD1EeFus/Kr2A=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=MYRJkC55; arc=none smtp.client-ip=74.125.228.9
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="MYRJkC55"
Received: by mail-pz2-f9.google.com with SMTP id 41be03b00d2f7-cc1631a57d2so1062860a12.0
        for <devicetree@vger.kernel.org>; Sat, 19 Sep 2026 05:53:13 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1789822393; x=1790427193; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=rQei+xFrWR/8tHZU0Qo/Qb7KMibEAMjL/DUhroeeXK4=;
        b=MYRJkC55yHwhHoONtGB5ttuGAyN5MCrfpYjCb1B2hzqkTPZ51muAILPGY/Nu/IwOb8
         dVCo8fyIH9bxEfRit6buo/MBTw+cA1lWDGVrzRz8eGIdzUgE9lq78U1RUcwmC4k5sMqy
         2QKZg/mn0r62aonntu/exwVXyEXYxfAY2MEM02f90Xa898AdqMZpJRe7gq5WhnqOCgik
         J94NQPk8o5SsbldFG6Igv27/a+vqb2g+Fm7xlMw2Lt2xYp8VysBP1zlFTsGfk575zrNa
         veF7VeSMu4iqddGsywnxxDcZmrtQH33m3RCivWj6FGuy31MuS4xtUvj12b8hwohb7BLc
         e/vQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1789822393; x=1790427193;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to:content-type;
        bh=rQei+xFrWR/8tHZU0Qo/Qb7KMibEAMjL/DUhroeeXK4=;
        b=f8jY8bp2SNa3CdWg3kpNvngeThVHjNyQRcVsbwz31PtNyRGkUUYPACesiqPyCyvqU8
         kAKh7FlQIEx4v2vV9iMKcu3O3rSnOZ271ADHKARSHEuMzuJmgAmY6IIluQjY3jzxBOqX
         OR402BU/TvV62oRn7KmTj+31fp3B0je/mWtvr/Ai7kPrXqRJRaEBAfFXOGJ4OeaBfipR
         AFqMpnLKQfXSbqnH7FfmWyfXWV7soanXZ8pOKY6SW6iD9WzdKw4EU/4uXKOF6Z0Ib2c3
         yIo7y1EbfUjsRHNUZbpo0twHgfP+qqWpCbmkfj6sCjEIuTK5aSIuGn9j+HzglOTAMPu3
         frCA==
X-Forwarded-Encrypted: i=1; AKwUvBxoVWwqRxOQy1H97OltPvBAMoxnvpXWqZQXdTicykaZ8d0FrJ5EHnnGbPujSbL3NiOvXowOCasQ14LF@vger.kernel.org
X-Gm-Message-State: AFuF++lMbPZbCNnD9N6lnKTzl70JE8p1YmCLCfUPQUx50fBsnCjB+QJo
	liIc+Ub21EAhzB/yfBtdzeslY9rw9orqgsDMV1NajiK8WIe9CAeMI0Mu
X-Gm-Gg: AYBFou3M7f5umICEgJaE6w9RZnZTpUOa+pxfuQyG+e/Gng6edjWk1TceaXglD4J3dLb
	OqmydTjj2v6sOFkd2ZVGH7gxexesbSRsS4WJ0KoM3QP4So5zOjM7RQbm2Rl7fxOPR6TIMx4Ezio
	Za9GYpMEme8Ycye2F6wJsvU4CvAoS6ukxEaPZgcRHZE/MYpwjZG4S8+qWitAqtkMgPmF87cb+2H
	ETxfGL57b4hfVwzrLaM3X8VTAcoC8LqTCeeKBW2XrydJHGcm8Zbfhx4lRHsZCmxGJToHyBV1vXl
	/PVp+gV08In5OaD5NEqYkGqYsC55KD/2NdsMqWgPxNxuFpuId56tVHUNq20cs9wJ2QD3GQEFX/X
	mQFQTvcdw0OWmzhJv+H3c8Ewcyf3OzMCJ7WfyLbYoeeg9KUvlOQFMNUlkpoM+xpYmOY2VHYa7xZ
	kr8HvZoxCA5lFNHEsGBiTRAB4IQajg5mh975iavs14cnP/5S4OamqzDvUWh26Zuo+nEp+jOw==
X-Received: by 2002:a05:6a00:1796:b0:874:706d:8573 with SMTP id d2e1a72fcca58-874ddef6806mr9062175b3a.27.1789822392717;
        Sat, 19 Sep 2026 05:53:12 -0700 (PDT)
Received: from server.lan ([168.138.199.194])
        by smtp.gmail.com with ESMTPSA id d2e1a72fcca58-877aa0026b2sm991805b3a.44.2026.09.19.05.53.05
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Sat, 19 Sep 2026 05:53:11 -0700 (PDT)
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
Subject: [PATCH net-next v8 11/11] MAINTAINERS: add entry for Rockchip XPCS driver
Date: Sat, 19 Sep 2026 20:51:18 +0800
Message-ID: <20260919125119.2107089-12-coiaprant@gmail.com>
X-Mailer: git-send-email 2.47.3
In-Reply-To: <20260919125119.2107089-1-coiaprant@gmail.com>
References: <20260919125119.2107089-1-coiaprant@gmail.com>
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
index 3b2eb2a7a89a8..f53a519da6298 100644
--- a/MAINTAINERS
+++ b/MAINTAINERS
@@ -23739,6 +23739,15 @@ S:	Maintained
 F:	Documentation/devicetree/bindings/sound/rockchip,rk3576-sai.yaml
 F:	sound/soc/rockchip/rockchip_sai.*
 
+ROCKCHIP XPCS DRIVER
+M:	Coia Prant <coiaprant@gmail.com>
+L:	netdev@vger.kernel.org
+L:	linux-rockchip@lists.infradead.org
+S:	Maintained
+F:	Documentation/devicetree/bindings/net/pcs/rockchip,rk3568-xpcs.yaml
+F:	drivers/net/pcs/pcs-xpcs-rk.c
+F:	include/linux/pcs/pcs-xpcs-rk.h
+
 ROCKER DRIVER
 M:	Jiri Pirko <jiri@resnulli.us>
 L:	netdev@vger.kernel.org
-- 
2.47.3

