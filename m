Received: from layka.disroot.org (layka.disroot.org [178.21.23.139])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 1877B3E559F;
	Thu,  2 Apr 2026 15:45:01 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=178.21.23.139
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1775144703; cv=none; b=WQmw9UE7YCq8cp97L/1c3WW3Ek4RvhQXVVcKUDH4ZBEdzuEnlp8HXfuEAnDGivuSsGBnFFq4VbQt22bTqrX945Dob7B25gt69wfKfm6sYb0u1a77QjA/Q9JKEL3zYGxrz80tjdVdPMqUH3jPn30/PbAZllVI9WkKDQWOxnx7ex0=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1775144703; c=relaxed/simple;
	bh=Fsbxr1KoI6nvNJg1iQcsK0ER51AzQq33E2rDDFIUpTE=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version; b=izc/kmt+OhgmuSTmKSYytga78CGKzARKC+ud/iAusCtZGAWfWmxbGeCz8GD9CoRfwiT861UuYX4LT/NHvYI31KPfryCUgXsB2vekxOW4+ngUF78UZKKvJ3Z98MwP0PdwcWAV6CK0i4LXIPEBpNqrjD9kVAdRk+I/XFLDDCk0Xrg=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=disroot.org; spf=pass smtp.mailfrom=disroot.org; dkim=pass (2048-bit key) header.d=disroot.org header.i=@disroot.org header.b=Oaw1BJE7; arc=none smtp.client-ip=178.21.23.139
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=disroot.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=disroot.org
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=disroot.org header.i=@disroot.org header.b="Oaw1BJE7"
Received: from [127.0.0.1] (localhost [127.0.0.1])
	by disroot.org (Postfix) with ESMTP id ABC6E26EBC;
	Thu,  2 Apr 2026 17:45:00 +0200 (CEST)
X-Virus-Scanned: SPAM Filter at disroot.org
Received: from layka.disroot.org ([127.0.0.1])
 by localhost (disroot.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id 1bvd1Qxpz8Hf; Thu,  2 Apr 2026 17:45:00 +0200 (CEST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=disroot.org; s=mail;
	t=1775144700; bh=Fsbxr1KoI6nvNJg1iQcsK0ER51AzQq33E2rDDFIUpTE=;
	h=From:To:Cc:Subject:Date:In-Reply-To:References;
	b=Oaw1BJE7LnpxDGuJ1aGiJK2AufcxtklAYKsmnkIF9hc9KpHxEmIgBx2C0qaWBDfQo
	 VxKLsdGc84osNMCEmZlj4OlRz8kBujHRKrFT/KOaH9dIuLczZQ33tzfCcF0T+tFRM8
	 tHuBsOlS+qOvzaNu0OcUri59TqeTS4dtpnd2a5cS+11meHehH7fxVLDsK5Kdgfhfi7
	 SI0sA4qn5jvzfOoGf0H07fWOf7I/7lBulnBc8cJuNrnbfmTexgEdXQVx5iMZrg6atz
	 38YuoO8lfyrQq+IEyVOvAz0Kb8Bvq0JKzYXZ+VcfXMjxKJ7CBkiKLf1iiZQun1pu9e
	 dV53Tt0E8GPWg==
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
Subject: [PATCH v3 6/6] phy: realtek: Make configs available for MACH_REALTEK_RTL
Date: Thu,  2 Apr 2026 20:44:14 +0500
Message-ID: <20260402154414.196012-7-adilov@disroot.org>
In-Reply-To: <20260402154414.196012-1-adilov@disroot.org>
References: <20260402154414.196012-1-adilov@disroot.org>
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

