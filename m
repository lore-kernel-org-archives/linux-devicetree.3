Received: from mxout2.routing.net (mxout2.routing.net [134.0.28.12])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id D2A942749DC;
	Thu,  9 Apr 2026 13:28:11 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=134.0.28.12
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1775741293; cv=none; b=mCYKsJWzx5Y609j1zqDzOA+IzyXjhVuxqPvrU46LgsbcHOSNebheb76kvS1eo3YFDPoQUU6qWWPJpDMO+Q4rh3R8+ia22GgWENt16FW1nfnLRRIgP0HZ7oIAb6Jl0sKCg3h1E65NRRBLJODp901X9B+NXpAN7rt3M2bucyby7Qg=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1775741293; c=relaxed/simple;
	bh=ae09sqB13GgQ8iilwv+mxqv7g7wWbssjdcrudWI9b3M=;
	h=From:To:Cc:Subject:Date:Message-ID:MIME-Version:Content-Type; b=PvbhP8hAURRSC24brbztGKJtMutOxnEo/u0nRNdb2zrBfXWTfqxo5MPzrLBYFP93HySJqsOzmqMXUZtdhE/pQy0CqEB5G8c/WT44RFhWsJDSMBZN+uzGWP/IiJFy3ypH+RWRDHIsgiKLEvYYplUbeQ3QSHSvAYPynTG0uE5fCUk=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=fw-web.de; spf=pass smtp.mailfrom=fw-web.de; dkim=pass (1024-bit key) header.d=mailerdienst.de header.i=@mailerdienst.de header.b=KBruie1K; arc=none smtp.client-ip=134.0.28.12
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=fw-web.de
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=fw-web.de
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=mailerdienst.de header.i=@mailerdienst.de header.b="KBruie1K"
Received: from mxbulk.masterlogin.de (unknown [192.168.10.85])
	by mxout2.routing.net (Postfix) with ESMTP id 3E3345FCDE;
	Thu,  9 Apr 2026 13:18:04 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=mailerdienst.de;
	s=routing; t=1775740684;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
	 content-transfer-encoding:content-transfer-encoding;
	bh=mryd7M4BBNCf0x0XGUmEBpmyy0q21EcRX27SGthtwuU=;
	b=KBruie1KLoeO9Oq624VdhuqzP2Gwf5S3GXX202bCwsXxYZYoqdsKBTsv26sL1M3q9ym7nS
	s+P3x93XtbgEqXHiwxsNaHIsQyPkpfcP1L3Z0eCesC6lOXprSWI3mhPeB4MPfo9v8dZ0WB
	GtJrJIyvSATrYlCHUzMzpFGFBFQmnOQ=
Received: from frank-u24.. (fttx-pool-217.61.155.21.bambit.de [217.61.155.21])
	by mxbulk.masterlogin.de (Postfix) with ESMTPSA id 10CEA1226C0;
	Thu,  9 Apr 2026 13:18:04 +0000 (UTC)
From: Frank Wunderlich <linux@fw-web.de>
To: Matthias Brugger <matthias.bgg@gmail.com>,
	AngeloGioacchino Del Regno <angelogioacchino.delregno@collabora.com>,
	Rob Herring <robh@kernel.org>,
	Krzysztof Kozlowski <krzk+dt@kernel.org>,
	Conor Dooley <conor+dt@kernel.org>
Cc: Frank Wunderlich <frank-w@public-files.de>,
	linux-kernel@vger.kernel.org,
	linux-arm-kernel@lists.infradead.org,
	linux-mediatek@lists.infradead.org,
	devicetree@vger.kernel.org,
	Daniel Golle <daniel@makrotopia.org>,
	Andrew LaMarche <andrewjlamarche@gmail.com>
Subject: [PATCH v1 0/3] some BPI-R4Pro dts updates
Date: Thu,  9 Apr 2026 15:17:48 +0200
Message-ID: <20260409131754.121737-1-linux@fw-web.de>
X-Mailer: git-send-email 2.43.0
Precedence: bulk
X-Mailing-List: devicetree@vger.kernel.org
List-Id: <devicetree.vger.kernel.org>
List-Subscribe: <mailto:devicetree+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:devicetree+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit

From: Frank Wunderlich <frank-w@public-files.de>

There are some parts of BPI-R4Pro DTS that need to be changed. Currently
there should be not much users of the mainline-dts and we noticed some
things while openwrt integration.

Frank Wunderlich (3):
  arm64: dts: mediatek: mt7988a-bpi-r4pro: drop duplicate fan properties
  arm64: dts: mediatek: mt7988a-bpi-r4pro: update gpio-leds
  arm64: dts: mediatek: mt7988a-bpi-r4pro: rework pcie gpio-hog handling

 arch/arm64/boot/dts/mediatek/Makefile         |  8 ++++++++
 .../mt7988a-bananapi-bpi-r4-pro-cn13.dtso     | 20 +++++++++++++++++++
 .../mt7988a-bananapi-bpi-r4-pro-cn14.dtso     | 20 +++++++++++++++++++
 .../mediatek/mt7988a-bananapi-bpi-r4-pro.dtsi | 15 ++++----------
 4 files changed, 52 insertions(+), 11 deletions(-)
 create mode 100644 arch/arm64/boot/dts/mediatek/mt7988a-bananapi-bpi-r4-pro-cn13.dtso
 create mode 100644 arch/arm64/boot/dts/mediatek/mt7988a-bananapi-bpi-r4-pro-cn14.dtso

-- 
2.43.0

