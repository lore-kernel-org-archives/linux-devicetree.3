Received: from smtp.forwardemail.net (smtp.forwardemail.net [149.28.215.223])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 7B10E4E06C1
	for <devicetree@vger.kernel.org>; Wed, 16 Sep 2026 20:55:38 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=149.28.215.223
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1789592155; cv=none; b=kxiegy+4WtvoJMKXGAem4J0khuZOJD5xjSSeMMjaN2ZR/G25wLM9A0xPKAHfGH7vai1Q5X6PW7N4eZEL39at9DT84AYDd97dwZR39baAXnD7YDQLrGHeoFc4P1zE4QXqHUAgyRQ8xC0G0OfMiqKNmZ8kVBT0Z9Klgu0lsPETx9s=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1789592155; c=relaxed/simple;
	bh=CzDD2R+HST2rpki6WrApi1bzIWeOuTLg/oljiGd86Eo=;
	h=From:To:Cc:Subject:Date:Message-ID:MIME-Version; b=eUjhnrz94rbptyZBJgOR4iWSoufSX8rGgzdX8f0Fp6XOrEqJtVKXK9huZTfjxSrANf6/s7zrSvWqMqloyD13alaBNg6fPWvgKAIfLzL6ks7PdcFv3q0xHNA+8gGpcTx7Ckxn+DYmmf+5nmCZ86v8k4Fh5jUYQrPI+BbXMQMZBLI=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=lineageos.org; spf=pass smtp.mailfrom=fe-bounces.lineageos.org; dkim=pass (1024-bit key) header.d=lineageos.org header.i=@lineageos.org header.b=Naaq9cf1; arc=none smtp.client-ip=149.28.215.223
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=lineageos.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=fe-bounces.lineageos.org
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=lineageos.org header.i=@lineageos.org header.b="Naaq9cf1"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=lineageos.org;
 h=Content-Transfer-Encoding: MIME-Version: Message-ID: Date: Subject: Cc:
 To: From; q=dns/txt; s=fe-2eefaa527c; t=1789592135;
 bh=WX0aF21R2mP7RGx/+rzffx7XjP8BJ0d9+NlEMIeB3pc=;
 b=Naaq9cf1blR7WlS8lBR9RNR+/G2671wUq9zF+67d9DBCawoJA25NWAxTFo8QKouzkdTTroFkq
 gmYwKR36OdgaY0VGP+z5S4UfAbBsB+Za6gya4QC61p4fCBbqDIjF6/SgdBTTsg084kTfpPFCklq
 Xeamj27K9rkxmMgOxq1DSG4=
X-Forward-Email-ID: 6aab024007c281602cddbec7
X-Forward-Email-Sender: rfc822; tturner@lineageos.org,
 smtp.forwardemail.net, 149.28.215.223
X-Forward-Email-Version: 2.14.2
X-Forward-Email-Website: https://forwardemail.net
X-Complaints-To: abuse@forwardemail.net
X-Report-Abuse: abuse@forwardemail.net
X-Report-Abuse-To: abuse@forwardemail.net
From: Thomas Turner <tturner@lineageos.org>
To: krzk@kernel.org,
	peter.griffin@linaro.org,
	robh@kernel.org,
	conor+dt@kernel.org,
	semen.protsenko@linaro.org,
	alexey.klimov@linaro.org
Cc: alim.akhtar@samsung.com,
	linux-arm-kernel@lists.infradead.org,
	linux-samsung-soc@vger.kernel.org,
	devicetree@vger.kernel.org,
	linux-kernel@vger.kernel.org
Subject: [PATCH v3 0/2] Add Samsung Galaxy A21s support
Date: Wed, 16 Sep 2026 21:55:20 +0100
Message-ID: <20260916205522.159393-1-tturner@lineageos.org>
X-Mailer: git-send-email 2.47.3
Precedence: bulk
X-Mailing-List: devicetree@vger.kernel.org
List-Id: <devicetree.vger.kernel.org>
List-Subscribe: <mailto:devicetree+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:devicetree+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

Hi all,

This is a small patch series which adds support to the Samsung Galaxy
A21s. This device is part of the Exynos850 SoC and its device tree is
very loosely based on the e850-95 one.

Thomas Turner (2):
  dt-bindings: arm: samsung: Add compatible for Samsung Galaxy A21s
    (SM-A217F)
  arm64: dts: exynos: Add initial support for Samsung Galaxy A21s
    (SM-A217F)

 .../bindings/arm/samsung/samsung-boards.yaml  |   1 +
 arch/arm64/boot/dts/exynos/Makefile           |   1 +
 .../arm64/boot/dts/exynos/exynos850-a217f.dts | 200 ++++++++++++++++++
 arch/arm64/boot/dts/exynos/exynos850.dtsi     |   2 +-
 4 files changed, 203 insertions(+), 1 deletion(-)
 create mode 100644 arch/arm64/boot/dts/exynos/exynos850-a217f.dts

-- 
2.47.3

