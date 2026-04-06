Received: from layka.disroot.org (layka.disroot.org [178.21.23.139])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 539183932C0;
	Mon,  6 Apr 2026 18:13:32 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=178.21.23.139
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1775499215; cv=none; b=toJiALXM4hYe3bFfcb15O1tOAi4vFDoDGboVdLz/6LiPl4ZiRSPlpShC/hahApRdXRnbI0Pl/fYhPwEQeedoaBIFKHlW7YS6j+EbltaKMCCXq9qXMPWse9unO4oB3ibS5hEKScx2KTURdBCNlpncEtxBHx90KlMhYxg7ljVyJME=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1775499215; c=relaxed/simple;
	bh=Fsbxr1KoI6nvNJg1iQcsK0ER51AzQq33E2rDDFIUpTE=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version; b=bUpTTcI4bxcysgjRqXgTY097PGbi6gSQcWTAypl7+iYi16pI/gkBbCmqSHGiRxrcyqPgKsD9SKYImgnGtXryQg/EcSMw0r9QNoeiZKO+Hu7ekgepAu0TsZzVMtM+6FnGfm1ZgCSFFA9Yn/YBjoOm3VRT52DYTicGFWtJQ3yWPoc=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=disroot.org; spf=pass smtp.mailfrom=disroot.org; dkim=pass (2048-bit key) header.d=disroot.org header.i=@disroot.org header.b=HPtLwA4i; arc=none smtp.client-ip=178.21.23.139
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=disroot.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=disroot.org
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=disroot.org header.i=@disroot.org header.b="HPtLwA4i"
Received: from [127.0.0.1] (localhost [127.0.0.1])
	by disroot.org (Postfix) with ESMTP id 6E0A727143;
	Mon,  6 Apr 2026 20:13:29 +0200 (CEST)
X-Virus-Scanned: SPAM Filter at disroot.org
Received: from layka.disroot.org ([127.0.0.1])
 by localhost (disroot.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id 6faqmuIb3mDs; Mon,  6 Apr 2026 20:13:24 +0200 (CEST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=disroot.org; s=mail;
	t=1775499204; bh=Fsbxr1KoI6nvNJg1iQcsK0ER51AzQq33E2rDDFIUpTE=;
	h=From:To:Cc:Subject:Date:In-Reply-To:References;
	b=HPtLwA4i3jzwxFGuYS2km+VjEA3rmAC9POyflymmmEGyyHdy/XlHrZaeVa5YMbG5k
	 Xp2BM1kgOa1giOrjgcj8QFAWU1GBrSKhDxJhaCswrbQQ70loXJn1TOPg8YV7NRXV6o
	 glKkpV+LQS0cr2zl3IIQQSBIhJOJHw3tUIHJm7ZgR3ptAPwRoi5CtTPqwlmeOb/AKH
	 C2qKYWZaVd3o+EI9m+rqStqgyg7kQ9kcAg/inDvrFVulI8Wall6M+/o/IuPps0gkQT
	 R8vETunyScMLbQwP+AepcZoZE6TBXbTNuP3QwUkAzN/rPtx+B5S2nyss5xtnUM8c8L
	 +k2JqtzugFp0g==
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
Subject: [PATCH v4 6/6] phy: realtek: Make configs available for MACH_REALTEK_RTL
Date: Mon,  6 Apr 2026 23:12:28 +0500
Message-ID: <20260406181228.25892-7-adilov@disroot.org>
In-Reply-To: <20260406181228.25892-1-adilov@disroot.org>
References: <20260406181228.25892-1-adilov@disroot.org>
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
2.53.0

