Received: from layka.disroot.org (layka.disroot.org [178.21.23.139])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 5CB943FC5CA;
	Wed, 20 May 2026 17:58:23 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=178.21.23.139
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1779299906; cv=none; b=d4jU2vPZmU/LMQP9WUmj+FNOulUaHpuof+c88cJFzySF071OpffnpqN2GNcdxtIpLVpnAOUEQ2wWG21iZKXE1hSDNTK62UT9Ovt1ZZVVEb6THCdgdTBzWloFZ270PGMCyEyzUHCaCTYAoLjum7j2fRg3u5n7fwbOrZroMbMYp9w=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1779299906; c=relaxed/simple;
	bh=i3OzWIEXdFwM3ZDGDOHhTGJfsv6YbfoWvLpJPcKy9QU=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version; b=asRWrZH1J44BHOeRGYXqgU/1+418I63m9KIskNwR9QSltHVrkGtN9q6EnCGbHnekzyvrAEV4IilhD4Mf+4Jgbe/g7Cb0UqP5RWhB/5XAbd4JDg/O3H8lCqhrZ67xDH5V7lD2X0oqWBq8cvThy4QlnWZGXxwaTf3RGort3IPQs+M=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=disroot.org; spf=pass smtp.mailfrom=disroot.org; dkim=pass (2048-bit key) header.d=disroot.org header.i=@disroot.org header.b=heVl+B+T; arc=none smtp.client-ip=178.21.23.139
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=disroot.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=disroot.org
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=disroot.org header.i=@disroot.org header.b="heVl+B+T"
Received: from mail01.disroot.lan (localhost [127.0.0.1])
	by disroot.org (Postfix) with ESMTP id 6A746277FF;
	Wed, 20 May 2026 19:58:21 +0200 (CEST)
X-Virus-Scanned: SPAM Filter at disroot.org
Received: from layka.disroot.org ([127.0.0.1])
 by localhost (disroot.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id uewAjqfCNRrl; Wed, 20 May 2026 19:58:20 +0200 (CEST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=disroot.org; s=mail;
	t=1779299900; bh=i3OzWIEXdFwM3ZDGDOHhTGJfsv6YbfoWvLpJPcKy9QU=;
	h=From:To:Cc:Subject:Date:In-Reply-To:References;
	b=heVl+B+T3XhjLIYE4U2Vr8H1QlP/ZswiZWlHEhrcgRw9KMQlNDh4uWFe7OmW4vFMH
	 N0F8Q++TnD5wDekf4cyJxRWJgEV1uzy3hDUZbMDvL1YfLBg89RUVD4vbz1SvS6ahhP
	 KFjzsgzt7Hdr8UPVSlsW1i6lb+aYhSZXdWJCG/QYMzo0TRXp1h/7+D03hmZHJ8pXGC
	 LXNsN9ER49Ihh51aq+K4o8Q1tX48cwQXd1VAvDUcgw8tWsUKOIqpmt3/ytwMj/Dgw5
	 EIA1mYo527PQfQeOxwRHaBAKYT6GWYtucY1bCyLthw3o2A+inQxYIUfi30Fy9Cdbhi
	 YZufWycaJs56w==
From: Rustam Adilov <adilov@disroot.org>
To: Vinod Koul <vkoul@kernel.org>,
	Neil Armstrong <neil.armstrong@linaro.org>,
	Rob Herring <robh@kernel.org>,
	Krzysztof Kozlowski <krzk+dt@kernel.org>,
	Conor Dooley <conor+dt@kernel.org>,
	Stanley Chang <stanley_chang@realtek.com>,
	Philipp Zabel <p.zabel@pengutronix.de>,
	linux-phy@lists.infradead.org,
	devicetree@vger.kernel.org,
	linux-kernel@vger.kernel.org
Cc: Rustam Adilov <adilov@disroot.org>
Subject: [PATCH v6 6/6] phy: realtek: Make configs available for MACH_REALTEK_RTL
Date: Wed, 20 May 2026 22:57:28 +0500
Message-ID: <20260520175728.720877-7-adilov@disroot.org>
In-Reply-To: <20260520175728.720877-1-adilov@disroot.org>
References: <20260520175728.720877-1-adilov@disroot.org>
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
 drivers/phy/realtek/Kconfig | 4 ++--
 1 file changed, 2 insertions(+), 2 deletions(-)

diff --git a/drivers/phy/realtek/Kconfig b/drivers/phy/realtek/Kconfig
index 75ac7e7c31ae..76f9215d8b94 100644
--- a/drivers/phy/realtek/Kconfig
+++ b/drivers/phy/realtek/Kconfig
@@ -3,7 +3,7 @@
 # Phy drivers for Realtek platforms
 #
 
-if ARCH_REALTEK || COMPILE_TEST
+if ARCH_REALTEK || MACH_REALTEK_RTL || COMPILE_TEST
 
 config PHY_RTK_RTD_USB2PHY
 	tristate "Realtek RTD USB2 PHY Transceiver Driver"
@@ -29,4 +29,4 @@ config PHY_RTK_RTD_USB3PHY
 	  DWC3 USB IP. This driver will do the PHY initialization
 	  of the parameters.
 
-endif # ARCH_REALTEK || COMPILE_TEST
+endif # ARCH_REALTEK || MACH_REALTEK_RTL || COMPILE_TEST
-- 
2.54.0

