Received: from layka.disroot.org (layka.disroot.org [178.21.23.139])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id DC00B37E5F3;
	Sat, 15 Aug 2026 09:14:51 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=178.21.23.139
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1786785293; cv=none; b=O3hO9rVnbL4bVmOW/Zon7hqEs2ml+Z/dz87CwjPKsmBGT+iYNrb0n7dQXcJZhtihnwrH4AJmtFhmgnIzujlu/wi+aEsSpbvccAvZxGph8V9RoP2jb1GchDY3yMDV6CQUtfcVBfuIAXgszw/Ey12wi8eMSA9NutRjNboMPfGTIL8=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1786785293; c=relaxed/simple;
	bh=dSApdouRs74AgqrQBX4yQQP2Zh1Ae09ZBK7ma9JanCg=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version; b=TJFbz+1lNDr65WarVo6mEwHsTKJ9crQdfHvYIPcSWl+jtDWdSKKl7hfLbvcf4qNeSKKvC1L2pwBbNofG0ee8l+pkPHPnp/+XpKMPDsGxKXZWQEd0DFJLuh8mkJ/tXvk7TKOaoG1wVySGL1yY11RP/LdbE9eCwt19Vn/uEpQqmpU=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=disroot.org; spf=pass smtp.mailfrom=disroot.org; dkim=pass (2048-bit key) header.d=disroot.org header.i=@disroot.org header.b=dFCKoU8D; arc=none smtp.client-ip=178.21.23.139
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=disroot.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=disroot.org
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=disroot.org header.i=@disroot.org header.b="dFCKoU8D"
Received: from mail01.layka.lan (localhost [127.0.0.1])
	by disroot.org (Postfix) with ESMTP id DE980882DB;
	Sat, 15 Aug 2026 11:14:49 +0200 (CEST)
X-Virus-Scanned: SPAM Filter at disroot.org
Received: from layka.disroot.org ([127.0.0.1])
 by localhost (disroot.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id 64-xFJu9MUjY; Sat, 15 Aug 2026 11:14:49 +0200 (CEST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=disroot.org; s=mail;
	t=1786785289; bh=dSApdouRs74AgqrQBX4yQQP2Zh1Ae09ZBK7ma9JanCg=;
	h=From:To:Cc:Subject:Date:In-Reply-To:References;
	b=dFCKoU8DbL4a5Bprz4F1PUCe+ZteIm2NW0HGwhqoM6cRmR/chURAkp0/3oyBU1s3q
	 cm2mlmRYOF6Mz1NJHuipuQb7UyjlPkL6qc4cC6vZisJhm8uhw6XwVeqg5BDZGYWyWH
	 k3B2RjGdCK66P/lm0HyjoqXUColQtBrukbwezIteFHJtyy+tEEQGq8g+l1+0vZwdxC
	 MFQv1U9i3vhiiqmZmm1/uhRT5CXrkjxEMmSVyzFpb4GwEwRiq4x/3vSkzF8q5mSQAe
	 P8OUPz9CdlX+XWqId3O5IEdkPJ4Fl7rpJlmTzv0sTNdITiZuoOhSxp+llAv84UF2B6
	 36lqX4i93kH0w==
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
Cc: Rustam Adilov <adilov@disroot.org>,
	Manivannan Sadhasivam <manivannan.sadhasivam@oss.qualcomm.com>
Subject: [PATCH v7 6/6] phy: realtek: Make configs available for MACH_REALTEK_RTL
Date: Sat, 15 Aug 2026 14:13:40 +0500
Message-ID: <20260815091340.26910-7-adilov@disroot.org>
In-Reply-To: <20260815091340.26910-1-adilov@disroot.org>
References: <20260815091340.26910-1-adilov@disroot.org>
Precedence: bulk
X-Mailing-List: devicetree@vger.kernel.org
List-Id: <devicetree.vger.kernel.org>
List-Subscribe: <mailto:devicetree+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:devicetree+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

Add the MACH_REALTEK_RTL to the if statement to make the config
options available for Realtek RTL SoCs as well.

Reviewed-by: Manivannan Sadhasivam <manivannan.sadhasivam@oss.qualcomm.com>
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
2.55.0

