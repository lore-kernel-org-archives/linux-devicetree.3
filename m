Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=119.15.109.137
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1795611982;
	b=arrvx/MWgE2WnPcrFZsUs/mtk+tKRF4TCImynTwXS/GecZpsBhETdcj1FeCmyDA6SdCf
	 w1/B5x2Jen5w8Vp3XAM2bncYhyxVSiyxY2hbIKEV3EG/Bs8bTK4qI1ms7lkGUOVEVvIV6
	 R/a1+uTyJDPK/YC4vliP4JJv1Mw1sJJ5irvTI8TLHkLipVVN9IQyG24rh3EJ7Zy3fAGU3
	 ZGxu8doT6MClkCoiUEusq5YJ/3DRwOk0bO9yv21weD1zKIvuZBE/ZMQI0iEEHk8Rw9pSw
	 b61c3ceMPdmdjiAM6j2WfZYwt46q1ng+F6l5FRqEI6vshmfpFwEv8mEWZtSlEhIwdRw==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1795611982;
	h=DMARC-Filter:Received:DKIM-Signature:X-GPT-Reason:From:To:Cc:Subject:
	 Date:Message-ID:X-Mailer:MIME-Version:Content-Transfer-Encoding;
	bh=Jg8loi+2ynL/HcVXNJPBCeevVszZXfU1/mqjlIfP4CE=;
	b=blOLENhhpbpl/UZG5U2uTc16R4IHo488BjzYdjk06eASjFRKHT46t/Cf/ojCo52rgin8
	 KvOLHmrgAhS/7W3WmCBd3lzjKPtL6wobF/0z9q6TZoW7G8nCZK2iIWvXheEX9F/YVHt1K
	 gEuOqUgsXTAbEvGIvn82IhPGQyJQEV80DCnPt6q2XmHMEEGUOhdpEpgRFbiKYecw6BB2D
	 0hnktuIHm6kzLE5Y9byVvqIlZ8v2epOP3Giuyeg9HB6j2SQFJ5BsIpBmgylptNc83sj1s
	 lZHzVk1RmZdQ1VU/5rQvo6wKcSVwvDHumVXCJst04mbTxUCphHlEqNDwVHeDHw69Rwg==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=d-silva.org;
	spf=pass smtp.mailfrom=d-silva.org;
	dkim=pass header.d=d-silva.org header.i=@d-silva.org header.a=rsa-sha256 header.s=2025a header.b=aJG9kLhb;
	arc=none smtp.remote-ip=119.15.109.137
Received: from www.nmnhosting.com (watt.d-silva.org [119.15.109.137])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 2BA93606A321;
	Wed, 25 Nov 2026 13:06:20 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org 2BA93606A321
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=d-silva.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=d-silva.org
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=d-silva.org header.i=@d-silva.org header.a=rsa-sha256 header.s=2025a header.b=aJG9kLhb
Received: from Hawking.lan (hawking.lan [10.0.1.4])
	by www.nmnhosting.com (Postfix) with ESMTP id 2DBA44C949;
	Thu, 26 Nov 2026 00:06:13 +1100 (AEDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=d-silva.org; s=2025a;
	t=1795611973;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:
	 content-transfer-encoding:content-transfer-encoding;
	bh=Jg8loi+2ynL/HcVXNJPBCeevVszZXfU1/mqjlIfP4CE=;
	b=aJG9kLhbOziqz4bHnYF2bLyHdddoNAiSKiwgOQ/hl3XP8VBht5YenAHPpYdyiGbVo2taBp
	wEDmLsbvwhlxgISuVfSQ6z87enxMx8f3SOydnAa+9zzN/ZbK5sWNJoKaLE4V81ta/bI7yx
	wtvv83HJWSqie1ASTCGiRGeY4+htKeHoXQ6ZRBJVwHSIT/VQ6c4Yj6zG1OI5jW1h4UlrfR
	5TourmIwfpT3sTskmj4WggaQRjDx8MuZeC5Pfh7m+TZR7KP5bW9QpdWF4QyPb7XEmcOzJl
	v8yoaT36DA+WI29jul6LW1F3dJtjWrOVJsPyL2VP/YK3cYgXBB3oojTiTIapLQ==
X-GPT-Reason: legitimate; this is a technical software patch notification
	(Linux kernel style) that perfectly aligns with the recipient's
	personal/professional domain; the From domain (d-silva.org) matches
	the recipient's known mailbox (alastair@d-silva.org); the content
	is purely technical (stmmac, GMAC210, SoC support) with no marketing,
	urgency, or suspicious links; and there are no authentication failures
	or mismatched Reply-To headers.
From: Alastair D'Silva <alastair@d-silva.org>
To: netdev@vger.kernel.org,
	devicetree@vger.kernel.org,
	linux-sunxi@lists.linux.dev
Cc: linux-kernel@vger.kernel.org,
	Andrew Lunn <andrew+netdev@lunn.ch>,
	"David S . Miller" <davem@davemloft.net>,
	Eric Dumazet <edumazet@kernel.org>,
	Jakub Kicinski <kuba@kernel.org>,
	Paolo Abeni <pabeni@redhat.com>,
	Rob Herring <robh@kernel.org>,
	Krzysztof Kozlowski <krzk+dt@kernel.org>,
	Conor Dooley <conor+dt@kernel.org>,
	Chen-Yu Tsai <wens@kernel.org>,
	Jernej Skrabec <jernej.skrabec@gmail.com>,
	Samuel Holland <samuel@sholland.org>,
	Maxime Chevallier <maxime.chevallier@bootlin.com>,
	Maxime Ripard <mripard@kernel.org>,
	Alastair D'Silva <alastair@d-silva.org>
Subject: [PATCH 0/5] net: stmmac: dwmac-sun55i: Add Allwinner A733 GMAC210 support
Date: Thu, 26 Nov 2026 00:06:08 +1100
Message-ID: <20261125130613.4191841-1-alastair@d-silva.org>
X-Mailer: git-send-email 2.53.0
X-Mailing-List: devicetree@vger.kernel.org
List-Id: <devicetree.vger.kernel.org>
List-Post: <mailto:devicetree@vger.kernel.org>
List-Help: <mailto:devicetree+help@vger.kernel.org>
List-Subscribe: <mailto:devicetree+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:devicetree+unsubscribe@vger.kernel.org>
List-Owner: <mailto:devicetree+owner@vger.kernel.org>
Precedence: list
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

This series enables Gigabit Ethernet (GMAC0) on the Allwinner A733 SoC
and the Xunlong Orange Pi 4 Pro board.

The goal is working 1000BASE-T RGMII Ethernet with mainline drivers and
bindings. Tested on the Orange Pi 4 Pro with a YT8531 PHY (DHCP, ping,
and iperf3 at 1Gbps/Full).

Dependencies:
This series depends on the Allwinner A733 SoC and OrangePi 4 Pro core
bring-up series:
  Based-on: <20261125124407.4098345-1-alastair@d-silva.org>

Alastair D'Silva (5):
  dt-bindings: net: allwinner,sun8i-a83t-emac: Add Allwinner A733
    GMAC210
  net: stmmac: dwmac-sun55i: Add per-compatible match data
  net: stmmac: dwmac-sun55i: Add Allwinner A733 GMAC210 support
  arm64: dts: allwinner: sun60i-a733: Add GMAC0 node
  arm64: dts: allwinner: sun60i-a733-orangepi-4-pro: Enable GMAC0
    Ethernet

 .../net/allwinner,sun8i-a83t-emac.yaml        | 136 ++++++++++-
 .../allwinner/sun60i-a733-orangepi-4-pro.dts  |  28 +++
 .../arm64/boot/dts/allwinner/sun60i-a733.dtsi |  41 ++++
 .../ethernet/stmicro/stmmac/dwmac-sun55i.c    | 230 +++++++++++++++---
 4 files changed, 389 insertions(+), 46 deletions(-)

-- 
2.53.0

