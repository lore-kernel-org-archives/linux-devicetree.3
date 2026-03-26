Received: from layka.disroot.org (layka.disroot.org [178.21.23.139])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id DF9D733EAE6;
	Thu, 26 Mar 2026 19:41:33 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=178.21.23.139
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1774554095; cv=none; b=fEyfjTEnoLug7kTujeyTTvaTQGOQAwgo9hVyLgyd7xWNX1tVtoayH4Fsws5dvPhkN+bkVXX0QygTEKVP6KD9fPpajyWTF8MNCmFIuEDRs/3Aq9kGJGcWjl1xBShI1Kqa+ELhS+++wBnqt1LB39Utty9TvhO5Bww2nBW2D53Vu08=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1774554095; c=relaxed/simple;
	bh=em8UZf/f+4PxDG3BVyhlRjFiAr/cgm2WnglEmMQ6Pbs=;
	h=From:To:Cc:Subject:Date:Message-ID:MIME-Version; b=rla/yt6C1Knrqx5nxpOb5yoohGLvk0iVTGQV+rLHfVAUzKdeaVKiMDVdrlUSUjOr/vW56hZ6QdA6SrUcfGvAji9UPZeFa/pF6KBBo7SjFIObKrS2TtX79N/iPknAqf1PFNlZwBNm1tojFP0EDQg4ugz7a2j5N9XCsUUjhyw4Gv4=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=disroot.org; spf=pass smtp.mailfrom=disroot.org; dkim=pass (2048-bit key) header.d=disroot.org header.i=@disroot.org header.b=hwE8Y/Mr; arc=none smtp.client-ip=178.21.23.139
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=disroot.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=disroot.org
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=disroot.org header.i=@disroot.org header.b="hwE8Y/Mr"
Received: from [127.0.0.1] (localhost [127.0.0.1])
	by disroot.org (Postfix) with ESMTP id 93DCB269C2;
	Thu, 26 Mar 2026 20:34:54 +0100 (CET)
X-Virus-Scanned: SPAM Filter at disroot.org
Received: from layka.disroot.org ([127.0.0.1])
 by localhost (disroot.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id UaiAd6agqRC4; Thu, 26 Mar 2026 20:34:53 +0100 (CET)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=disroot.org; s=mail;
	t=1774553693; bh=em8UZf/f+4PxDG3BVyhlRjFiAr/cgm2WnglEmMQ6Pbs=;
	h=From:To:Cc:Subject:Date;
	b=hwE8Y/MreRJqy40rH0Nl9HWQtmkgL24NpDSBuqkuuIZMptmsRTeyII1UgsDDpGFe2
	 byWof2wyjAjDIcwe0y/XP+L0LNUrb7SLuuo/KTV4U819O6F6LGpIhlSLgJQKE/a2ZD
	 X2kiAQoypp+mffsxNdsOdWVT0qNdoQPZco7mGzzP/ui2i6/Z2egx7/CKgkikewBejW
	 jQT16yBLVQMhfjjSZv9zFEQzIX9S4ngeB5eMXM4LR0su7MJne4ln0zEy/goVi7R1/R
	 hC8J8SNUybzp56UkpLLbObVYIAYtSnOhrtQyExSdQBt1SvA44DER9J2IRPcktuBdrG
	 qSBRrSeU3MVWg==
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
Subject: [PATCH 0/6]  phy: realtek: usb2: support for RTL9607C USB2 PHY
Date: Fri, 27 Mar 2026 00:34:13 +0500
Message-ID: <20260326193419.48419-1-adilov@disroot.org>
Precedence: bulk
X-Mailing-List: devicetree@vger.kernel.org
List-Id: <devicetree.vger.kernel.org>
List-Subscribe: <mailto:devicetree+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:devicetree+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

This patch series for Realtek USB2 PHY driver adds support for RTL9607C
USB2 PHY.

RTL9607C is a big endian MIPS CPU which is quite far from RTD series SoCs
supported by realtek usb2 phy driver, but the phy initilization is found
to be very indentical in most areas.

Most of the code was based on the Realtek's usb driver from the GPL tarball
in [1] and adjusted to fit into the realtek usb2 phy driver code format.

The patch series was split into smaller patches that add/change something
in the driver that are not exactly related to RTL9607C and that also
helps for easier review. That also means, patch 5 depends on all the prior
patches that come before it.

USB2 PHY on RTL9607C is primarly used for its internal OHCI/EHCI controllers.

[1] - https://github.com/jameywine/GPL-for-GP3000/blob/main/linux-5.10.x/arch/mips/rtl9607c/usb.c

Rustam Adilov (6):
  phy: realtek: usb2: introduce vstatus/new_reg_req variables to driver
    data
  phy: realtek: usb2: introduce read and write functions to driver data
  dt-bindings: phy: realtek,usb2phy.yaml: extend for resets and RTL9607C
    support
  phy: realtek: usb2: introduce reset controller struct
  phy: realtek: usb2: add support for RTL9607C USB2 PHY
  phy: realtek: usb2: Make configs available for MACH_REALTEK_RTL

 .../bindings/phy/realtek,usb2phy.yaml         |  23 ++-
 drivers/phy/realtek/Kconfig                   |   2 +-
 drivers/phy/realtek/phy-rtk-usb2.c            | 189 ++++++++++++++++--
 3 files changed, 194 insertions(+), 20 deletions(-)

-- 
2.53.0

