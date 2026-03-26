Received: from layka.disroot.org (layka.disroot.org [178.21.23.139])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 468A23A7582;
	Thu, 26 Mar 2026 19:35:14 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=178.21.23.139
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1774553716; cv=none; b=XjJxTQX2Idieo4uJqPrLbHvuEbFevOHBFFapPGN2oFcCW3L42n9KeaBxa/t6lCkvCEGWj+H9IRAPLyRmpiagYpbPwn6vBO5tcgOczmxPdm5EygdLSdwaPX3re/8XLZm8K12wPRAQETXfWTyImoRUACkzEYP7Yyo6KhSJzBoKEvY=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1774553716; c=relaxed/simple;
	bh=6B7686z3QUopU/zWMAAwBVlHDWV9IFVlgjbzHESJ76k=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version; b=RXulOzhCqqBrRlZeic9JjVN/oDNVMdSrNBVVeG6kZJRf/PNO7j0jZ3qYBXuR2SjU+8cezQj+T1Sae61NaSNXUnDyw9dZ79xxM9Bnq5MNwOZVxuWrQnRkfz5Rl1Fuu0WnlJ0fhkfkrm3OhPwWrI9P6BFovBM+cZyT6WssABq/9A0=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=disroot.org; spf=pass smtp.mailfrom=disroot.org; dkim=pass (2048-bit key) header.d=disroot.org header.i=@disroot.org header.b=mV7euzOo; arc=none smtp.client-ip=178.21.23.139
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=disroot.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=disroot.org
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=disroot.org header.i=@disroot.org header.b="mV7euzOo"
Received: from [127.0.0.1] (localhost [127.0.0.1])
	by disroot.org (Postfix) with ESMTP id 7A83A267D8;
	Thu, 26 Mar 2026 20:35:13 +0100 (CET)
X-Virus-Scanned: SPAM Filter at disroot.org
Received: from layka.disroot.org ([127.0.0.1])
 by localhost (disroot.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id 3UicETYF_tVn; Thu, 26 Mar 2026 20:35:12 +0100 (CET)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=disroot.org; s=mail;
	t=1774553712; bh=6B7686z3QUopU/zWMAAwBVlHDWV9IFVlgjbzHESJ76k=;
	h=From:To:Cc:Subject:Date:In-Reply-To:References;
	b=mV7euzOoPEwIOGE4BSw0d9ECKi2Rt49aJrN2gZ+qi6hq7mbpy6jeBLKq54Ybs+gsr
	 l4U9GEX2BFR+Xeswy+jbyoWl4+fRXdkMlHAN1/eaYvPxHWtp9pTVeAEJFNUvvya0Pi
	 juaXWgLvqZJMkjGZ9uy9hsGCr38z+g8lu35GP0pbGW6BII+MvBELBIsYsf5vALNm6c
	 Ge2R7kN3Phq7aX8J0i4mRhM3ov11SgkKnbkoFfwUV72tnT2zjkevqbm/9Vqxjw1Uj4
	 pTRxyL58SOffIqVMKrgzHcw58MRGLSSkUy101AWD2DlVg6efcTjY9N/jFoQUA0Ec3m
	 mdXe3QM76Kw9Q==
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
Subject: [PATCH 6/6] phy: realtek: usb2: Make configs available for MACH_REALTEK_RTL
Date: Fri, 27 Mar 2026 00:34:19 +0500
Message-ID: <20260326193419.48419-7-adilov@disroot.org>
In-Reply-To: <20260326193419.48419-1-adilov@disroot.org>
References: <20260326193419.48419-1-adilov@disroot.org>
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

