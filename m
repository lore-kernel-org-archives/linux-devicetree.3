Received: from smtpout-03.galae.net (smtpout-03.galae.net [185.246.85.4])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 88687423EAB
	for <devicetree@vger.kernel.org>; Thu, 13 Aug 2026 07:25:25 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=185.246.85.4
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1786605929; cv=none; b=u6kUKur3OnJVXf6WnzjuU1ZmDyndMf/vYrZra77fpS4C3uhfs1rYDqudEdFW2f2R8XZ1Sceo6tFzFHMVacYbsODfEoJM7FoiS95I14pfebY45xi/xSxTrGtbUNFojLsw6eSi/0aFOcS/s9qMVPCkIP/1xunWSoGidNnp2n7sFXs=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1786605929; c=relaxed/simple;
	bh=S/gwlQHtMYJBkJtOUPqLjgtA/Ci8NP8tDeUbvxSnKs8=;
	h=From:Subject:Date:Message-Id:MIME-Version:Content-Type:To:Cc; b=DDNZasa0m4BmI6s+zHCXxWpBil2lL9CpgrDy/hIZKbqDw0Tso+SnOijkUDW+L7lTiR+adUkC3nZs5ftd0tel77cyUDqgtVsb+6eEJdbyDQgG9ILSTSjKCwmgH0eByWzAXgVHehYS0LpX2iJRvfDUCswWDGiO7tqulnBTAEHf0Ac=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=bootlin.com; spf=pass smtp.mailfrom=bootlin.com; dkim=pass (2048-bit key) header.d=bootlin.com header.i=@bootlin.com header.b=bQ1XmX7Z; arc=none smtp.client-ip=185.246.85.4
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=bootlin.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=bootlin.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=bootlin.com header.i=@bootlin.com header.b="bQ1XmX7Z"
Received: from smtpout-01.galae.net (smtpout-01.galae.net [212.83.139.233])
	by smtpout-03.galae.net (Postfix) with ESMTPS id 650694E411DE;
	Thu, 13 Aug 2026 07:25:23 +0000 (UTC)
Received: from mail.galae.net (mail.galae.net [212.83.136.155])
	by smtpout-01.galae.net (Postfix) with ESMTPS id 1A0D6602B8;
	Thu, 13 Aug 2026 07:25:23 +0000 (UTC)
Received: from [127.0.0.1] (localhost [127.0.0.1]) by localhost (Mailerdaemon) with ESMTPSA id 6F66711C4D9FD;
	Thu, 13 Aug 2026 09:25:11 +0200 (CEST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=bootlin.com; s=dkim;
	t=1786605918; h=from:subject:date:message-id:to:cc:mime-version:content-type:
	 content-transfer-encoding; bh=gi9z0zpx+ayou6Y3PPf7EqHXan2g8ulf19Ed0YKK120=;
	b=bQ1XmX7Zja82hyUTkT4mPesDx8oWs929yPKcRrUwI0/m20hHg4eA3HStZyMfRwR3o0Ajd5
	ypxAxkRMVKQwN5iuuM3BrSKjx3Rz3RFUVvRaL6mrlVitk/yh6kyZ2z31OcHJk5B/PiC0Li
	1+m82NRQvYcPf1bChBf4MqZnXv6WyunRg6Hfgx1duFFhPuDPaBTHHrznJBeUD7utvij2VK
	n6tBaH5al3KnhsB3uPREFx91Ktz+IucFmanRK9OxIeTJhr89mW+UCmlAiQOyndM4aBFUnL
	HQrf26ALjz0DoHjjaKChXgkWzqwcVuIB0gjCVxYGvsnlQyYJ9JCEN19ouc47gQ==
From: Miquel Raynal <miquel.raynal@bootlin.com>
Subject: [PATCH 0/2] arm64: dts: nuvoton: Improve MA35D1 support
Date: Thu, 13 Aug 2026 09:25:05 +0200
Message-Id: <20260813-perso-ma35d1-upstream-dts-v1-0-bb237fd7c3c2@bootlin.com>
Precedence: bulk
X-Mailing-List: devicetree@vger.kernel.org
List-Id: <devicetree.vger.kernel.org>
List-Subscribe: <mailto:devicetree+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:devicetree+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
X-B4-Tracking: v=1; b=H4sIAAAAAAAC/x3MwQqDMAyA4VeRnBdoKpa5Vxk7lDZqDtWSOBmI7
 77i8Tv8/wnGKmzw6k5QPsRkWxvo0UFa4jozSm4G73xwT+qxstqGJfZDJvxW25VjwbwbjuMUKLN
 PjhK0vipP8rvf7891/QHHhWJ0awAAAA==
X-Change-ID: 20260813-perso-ma35d1-upstream-dts-99f61de2c01c
To: Jacky Huang <ychuang3@nuvoton.com>, Shan-Chun Hung <schung@nuvoton.com>, 
 Andrew Jeffery <andrew@codeconstruct.com.au>, 
 Avi Fishman <avifishman70@gmail.com>, Tomer Maimon <tmaimon77@gmail.com>, 
 Tali Perry <tali.perry1@gmail.com>, Patrick Venture <venture@google.com>, 
 Nancy Yuen <yuenn@google.com>, Benjamin Fair <benjaminfair@google.com>, 
 Rob Herring <robh@kernel.org>, Krzysztof Kozlowski <krzk+dt@kernel.org>, 
 Conor Dooley <conor+dt@kernel.org>
Cc: Thomas Petazzoni <thomas.petazzoni@bootlin.com>, 
 Steam Lin <STLin2@winbond.com>, linux-arm-kernel@lists.infradead.org, 
 openbmc@lists.ozlabs.org, devicetree@vger.kernel.org, 
 linux-kernel@vger.kernel.org, Miquel Raynal <miquel.raynal@bootlin.com>
X-Mailer: b4 0.14.3
X-Last-TLS-Session-Version: TLSv1.3

I am in possession of an MA35D1 NuMaker board. The SPI controller has
been contributed, but:
1- it lacks a DT description
2- it does not work with current clock driver
3- it can be improved

This series is addressing #1.

Signed-off-by: Miquel Raynal <miquel.raynal@bootlin.com>
---
Miquel Raynal (2):
      arm64: dts: nuvoton: Add QSPI0 node
      arm64: dts: nuvoton: Add NuMaker board

 arch/arm64/boot/dts/nuvoton/Makefile           |  1 +
 arch/arm64/boot/dts/nuvoton/ma35d1-numaker.dts | 37 ++++++++++++++++++++++++++
 arch/arm64/boot/dts/nuvoton/ma35d1.dtsi        | 11 ++++++++
 3 files changed, 49 insertions(+)
---
base-commit: 1ec281b42ee249cfe9bad52a54149de29ed6aa78
change-id: 20260813-perso-ma35d1-upstream-dts-99f61de2c01c

Best regards,
-- 
Miquel Raynal <miquel.raynal@bootlin.com>

