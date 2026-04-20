Received: from layka.disroot.org (layka.disroot.org [178.21.23.139])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 387893C457F;
	Mon, 20 Apr 2026 19:20:25 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=178.21.23.139
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1776712828; cv=none; b=Jg6wK5b1U5D4noup4OnaWvEexQoEEpgDL1TDNH8aBcXLjcZ/WW5woeTqqcaNGM4WUwHrqNUbQqbB5tIb396FiOM6jCl44nm4XiYqH6D/H3A2vdq2EjdUfYauQ0NfQgqzLEMuLV8Fnvc10JsexQnRhNAW715ObzmnSsRF703aOz4=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1776712828; c=relaxed/simple;
	bh=Fsbxr1KoI6nvNJg1iQcsK0ER51AzQq33E2rDDFIUpTE=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version; b=GU2q9zfDOysba9Moi8zs27Mclpb7WDbzSOlHHTQiTe4h18JTAGMby6zucW1g4i87MygV2p1FxwnVqzigtks/00bMzzxrGRh1G56Id4hbvOrw0Xx3dMf2WbqnFoOJcx9sBvbJsLJdwXvvJPsnjDJ4zy8SDko6kL7NIuz+g5im1Rw=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=disroot.org; spf=pass smtp.mailfrom=disroot.org; dkim=pass (2048-bit key) header.d=disroot.org header.i=@disroot.org header.b=aInaYlC/; arc=none smtp.client-ip=178.21.23.139
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=disroot.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=disroot.org
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=disroot.org header.i=@disroot.org header.b="aInaYlC/"
Received: from mail01.disroot.lan (localhost [127.0.0.1])
	by disroot.org (Postfix) with ESMTP id 8962926F22;
	Mon, 20 Apr 2026 21:20:23 +0200 (CEST)
X-Virus-Scanned: SPAM Filter at disroot.org
Received: from layka.disroot.org ([127.0.0.1])
 by localhost (disroot.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id zyzU4oivZufu; Mon, 20 Apr 2026 21:20:23 +0200 (CEST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=disroot.org; s=mail;
	t=1776712823; bh=Fsbxr1KoI6nvNJg1iQcsK0ER51AzQq33E2rDDFIUpTE=;
	h=From:To:Cc:Subject:Date:In-Reply-To:References;
	b=aInaYlC/7dzZhmMg15U1Ny2/11f4aKXfT2xj6SVuqjjVt90OwEDAL+TsUNj/ZEibn
	 Fv+qYgTfg4gdUWrdyjWfJp/nxaXur27nk9BSlD9y9Cf3rugzQmvJBQ3WHL7NCEAPKx
	 Rib6wVsFFv0PNICLtCCgXYJAzTmQFBWhdC1uf3MHtwHILeAtP1xIQYSF8dt9oK6Z4n
	 JnGgieWjAciESDw+1vTlZE0sYSzW7778w+pXwAUkcwCAYfIvkxBe1lK7sFYnuouEZm
	 /uKSB98u9V7CwrpUgN84jQiTRozt6p4d+DFCGdsA9KGzT7KXkdh3q806Rh6xmwAoZi
	 BAuKg051yH3jg==
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
Subject: [PATCH v5 6/6] phy: realtek: Make configs available for MACH_REALTEK_RTL
Date: Tue, 21 Apr 2026 00:19:41 +0500
Message-ID: <20260420191941.81834-7-adilov@disroot.org>
In-Reply-To: <20260420191941.81834-1-adilov@disroot.org>
References: <20260420191941.81834-1-adilov@disroot.org>
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

