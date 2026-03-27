Received: from layka.disroot.org (layka.disroot.org [178.21.23.139])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id F311D33F8BC;
	Fri, 27 Mar 2026 16:07:40 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=178.21.23.139
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1774627662; cv=none; b=fX7Bathc8epVDk9WqFIrX/+UEym2o5H+iqSJzlRGdlpvb74kS8N6HL4zbLmWNJR7hBTbpXkkDZkiv/RoO5tYSM3I7oKr3d7jIQiOl8y7jCK7H/hg1uWdJs5B5jDFctD/KeAQwSLItZXFivy2SUAwUxwTdxGtmPm2Q0B0NSMoDa4=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1774627662; c=relaxed/simple;
	bh=6B7686z3QUopU/zWMAAwBVlHDWV9IFVlgjbzHESJ76k=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version; b=SxcJ99TVjVLYQxtU7U5YsImCnaxe3W/Aaia2UFDkQvm0m4dbFT23BwEVi+xuxGzMMbHFHfARK9PTl1SQz2Uo90Ztlx9jsp7LBFkf656MXmLQyuJ28D7WbttvS1ISgGSJUnRJcxnfJuAu+pntLDsyv+0HouI1OoB/IHwhkd93m1A=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=disroot.org; spf=pass smtp.mailfrom=disroot.org; dkim=pass (2048-bit key) header.d=disroot.org header.i=@disroot.org header.b=g+u0211I; arc=none smtp.client-ip=178.21.23.139
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=disroot.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=disroot.org
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=disroot.org header.i=@disroot.org header.b="g+u0211I"
Received: from [127.0.0.1] (localhost [127.0.0.1])
	by disroot.org (Postfix) with ESMTP id 9B99927063;
	Fri, 27 Mar 2026 17:07:39 +0100 (CET)
X-Virus-Scanned: SPAM Filter at disroot.org
Received: from layka.disroot.org ([127.0.0.1])
 by localhost (disroot.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id 9ZJsU4vKfg6x; Fri, 27 Mar 2026 17:07:39 +0100 (CET)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=disroot.org; s=mail;
	t=1774627653; bh=6B7686z3QUopU/zWMAAwBVlHDWV9IFVlgjbzHESJ76k=;
	h=From:To:Cc:Subject:Date:In-Reply-To:References;
	b=g+u0211IO9SL1On/JwORnsWBqRH3+PSiBCa+uWsCj1ljxfsSDqiwPcUM4uBEhW89I
	 3iMSV2uwMpbnioDJge7o4Se/Ral7+Yv/iL+jpFQPFZBLxhWdAw/CQbSYApXVgElkHj
	 O1Bo94OAAm0nSnJlW7dlLbUQQNsCdfXtvafZRBgEBpE/EwS2YyWS66yG2yZqPD/9fI
	 344G7stwPuu1dsz8ZLFoEQS2izrSknLud5E4RRpJEyinECUlGWxBtuKVbNJtCdVO8n
	 CFU5doIBAv5g6DyDu8fACOAxZI+1ZWBBmpdZQCmiAUrT0JrGOtqQP0tGtnaxZa4O/C
	 i5pk5cpiaGgyQ==
From: Rustam Adilov <adilov@disroot.org>
To: Vinod Koul <vkoul@kernel.org>,
	Neil Armstrong <neil.armstrong@linaro.org>,
	Rob Herring <robh@kernel.org>,
	Krzysztof Kozlowski <krzk+dt@kernel.org>,
	Conor Dooley <conor+dt@kernel.org>,
	Stanley Chang <stanley_chang@realtek.com>,
	linux-phy@lists.infradead.org,
	devicetree@vger.kernel.org,
	linux-kernel@vger.kernel.org
Cc: Rustam Adilov <adilov@disroot.org>
Subject: [PATCH v2 6/6] phy: realtek: usb2: Make configs available for MACH_REALTEK_RTL
Date: Fri, 27 Mar 2026 21:06:38 +0500
Message-ID: <20260327160638.15134-7-adilov@disroot.org>
In-Reply-To: <20260327160638.15134-1-adilov@disroot.org>
References: <20260327160638.15134-1-adilov@disroot.org>
Precedence: bulk
X-Mailing-List: devicetree@vger.kernel.org
List-Id: <devicetree.vger.kernel.org>
List-Subscribe: <mailto:devicetree+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:devicetree+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

Add the MACH_REALTEK_RTL to the if statement to make the config
options available for Realtek RTL SoCs as well.

Signed-off-by: Rustam Adilov <adilov@disroot.org>
---
 drivers/phy/realtek/Kconfig | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/drivers/phy/realtek/Kconfig b/drivers/phy/realtek/Kconfig
index 75ac7e7c31ae..f9eadffacd18 100644
--- a/drivers/phy/realtek/Kconfig
+++ b/drivers/phy/realtek/Kconfig
@@ -3,7 +3,7 @@
 # Phy drivers for Realtek platforms
 #
 
-if ARCH_REALTEK || COMPILE_TEST
+if ARCH_REALTEK || MACH_REALTEK_RTL || COMPILE_TEST
 
 config PHY_RTK_RTD_USB2PHY
 	tristate "Realtek RTD USB2 PHY Transceiver Driver"
-- 
2.53.0

