Received: from metis.whiteo.stw.pengutronix.de (metis.whiteo.stw.pengutronix.de [185.203.201.7])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 2F8E340803F
	for <devicetree@vger.kernel.org>; Thu, 11 Jun 2026 18:12:49 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=185.203.201.7
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1781201572; cv=none; b=kOmETj7lr8+YT4w06yw5aUcqKPgKQhQsSyjXTTn+adNn6jgRJQYIRyA/StH7bWxH6WrbNsbvvN80R+SyygkfLR5NQER1PPnJ5kY/R/3SXOHi3q4ANbyQyXnxgmQ2FDS5dJvtx0IMJDkES377yX21OREN3Wy2AnTvCkVibiTo4FQ=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1781201572; c=relaxed/simple;
	bh=HkGhT3NjYzPW2BC9L4lIdXyXEwI8DQLjwA7FwJ5RTNI=;
	h=From:Subject:Date:Message-Id:MIME-Version:Content-Type:To:Cc; b=dQz+cScBWrcXDJKcAKDymOcV0frRJP6Xyi3xU94EgFp0FScQSLR8VKsV1iWnfmj98UhJnh/UObit7W9JWQRfLWIKa/Q/HMdwKOTv3M/AwR8mTNuhtA8eiL9rlffSTiqZ9mqX1EIe2DWGkBf32vkMgmZ/GBR33BLwLQlTiX0F2g0=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=pengutronix.de; spf=pass smtp.mailfrom=pengutronix.de; arc=none smtp.client-ip=185.203.201.7
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=pengutronix.de
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=pengutronix.de
Received: from drehscheibe.grey.stw.pengutronix.de ([2a0a:edc0:0:c01:1d::a2])
	by metis.whiteo.stw.pengutronix.de with esmtp (Exim 4.92)
	(envelope-from <a.fatoum@pengutronix.de>)
	id 1wXjtM-0003nU-U2; Thu, 11 Jun 2026 20:12:36 +0200
Received: from dude05.red.stw.pengutronix.de ([2a0a:edc0:0:1101:1d::54])
	by drehscheibe.grey.stw.pengutronix.de with esmtps  (TLS1.3) tls TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384
	(Exim 4.96)
	(envelope-from <a.fatoum@pengutronix.de>)
	id 1wXjtM-002Fqt-14;
	Thu, 11 Jun 2026 20:12:36 +0200
Received: from [::1] (helo=dude05.red.stw.pengutronix.de)
	by dude05.red.stw.pengutronix.de with esmtp (Exim 4.98.2)
	(envelope-from <a.fatoum@pengutronix.de>)
	id 1wXjtM-00000003Ffp-10qe;
	Thu, 11 Jun 2026 20:12:36 +0200
From: Ahmad Fatoum <a.fatoum@pengutronix.de>
Subject: [PATCH 0/3] ARM: dts: stm32: lxa: change stdout-path baud rate
 from 9600 to 115200
Date: Thu, 11 Jun 2026 20:12:32 +0200
Message-Id: <20260611-lxa-stdout-path-baudrate-v1-0-59b60a5069ff@pengutronix.de>
Precedence: bulk
X-Mailing-List: devicetree@vger.kernel.org
List-Id: <devicetree.vger.kernel.org>
List-Subscribe: <mailto:devicetree+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:devicetree+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
X-B4-Tracking: v=1; b=H4sIAJD6KmoC/yXMwQqDMAyA4VeRnBdoxSnsVcYOsY2aMVSaVATx3
 dfN43f4/wOUk7DCozog8SYqy1zgbxWEieaRUWIx1K5uXes9fnZCtbhkw5Vswp5yTGSMXRiaexM
 iseug5GviQfb/+vm6rLl/c7DfD87zC2FpymF8AAAA
X-Change-ID: 20260611-lxa-stdout-path-baudrate-7cf454cdae07
To: Alexandre Torgue <alexandre.torgue@foss.st.com>, 
 Maxime Coquelin <mcoquelin.stm32@gmail.com>, Rob Herring <robh@kernel.org>, 
 Krzysztof Kozlowski <krzk+dt@kernel.org>, 
 Conor Dooley <conor+dt@kernel.org>, 
 =?utf-8?q?Leonard_G=C3=B6hrs?= <l.goehrs@pengutronix.de>, 
 Marc Kleine-Budde <mkl@pengutronix.de>
Cc: Alexandre Torgue <alexandre.torgue@st.com>, devicetree@vger.kernel.org, 
 linux-stm32@st-md-mailman.stormreply.com, 
 linux-arm-kernel@lists.infradead.org, linux-kernel@vger.kernel.org, 
 kernel@pengutronix.de, Ahmad Fatoum <a.fatoum@pengutronix.de>
X-Mailer: b4 0.15.2
X-SA-Exim-Connect-IP: 2a0a:edc0:0:c01:1d::a2
X-SA-Exim-Mail-From: a.fatoum@pengutronix.de
X-SA-Exim-Scanned: No (on metis.whiteo.stw.pengutronix.de); SAEximRunCond expanded to false
X-PTX-Original-Recipient: devicetree@vger.kernel.org

The LXA boards are the only STM32 boards that set stdout-path = &uart*
instead of explicitly specifying a baud rate.

This would mean the default of 9600 is used, but it goes unnoticed when
booting normally as barebox fixes up a console= line that includes a
baud rate.

When EFI booting GRUB however, GRUB will not pass along the console=
line and thus the board ends up with a 9600 baud Linux console,
confusing users.

This series fixes this. As the device trees were added at different
times, they are fixed each in a separate commit with its own Fixes: tag.

---
Ahmad Fatoum (3):
      ARM: dts: stm32: lxa-mc1: change stdout-path baud rate from 9600 to 115200
      ARM: dts: stm32: lxa-tac: change stdout-path baud rate from 9600 to 115200
      ARM: dts: stm32: fairytux2: change stdout-path baud rate from 9600 to 115200

 arch/arm/boot/dts/st/stm32mp153c-lxa-fairytux2.dtsi | 2 +-
 arch/arm/boot/dts/st/stm32mp157c-lxa-mc1.dts        | 2 +-
 arch/arm/boot/dts/st/stm32mp15xc-lxa-tac.dtsi       | 2 +-
 3 files changed, 3 insertions(+), 3 deletions(-)
---
base-commit: 4549871118cf616eecdd2d939f78e3b9e1dddc48
change-id: 20260611-lxa-stdout-path-baudrate-7cf454cdae07

Best regards,
--  
Ahmad Fatoum <a.fatoum@pengutronix.de>

