Authentication-Results: smtp.subspace.kernel.org; arc=pass header.oldest-pass=0 smtp.remote-ip=185.203.200.13
ARC-Seal: i=2; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=pass;
	t=1795433145;
	b=3CoifAlox9BjVPK67/H3h9bH72vBBQTHF6y8CQkZAX96WYmY2d7P0ZOJwNZPMVbNaXcU
	 Z7ZR9Ra9Z0DtfK2SgivHpDqsIRw52HMwyQoAkuaxlYSebNvQOq4P3wId3Xt+g4tlUhyoj
	 TVmcHL6PJIQCC5l8yVogxc0GYGOnIxT5fCaHJEL0MM1+oL9kyW/t+QVd6iGtDXQTRfCl/
	 PIE4u3ZV34IWDb5bYxH7LD9dGAUflz2AWRiHCRNpC0hki6ElXu4Z3Qb57fnEpKmk/Pvw+
	 e8MJm6dRTGdNLWexBwWRbmt3ILhFCeDPm5aWFaE/Ujv2plnf3/pyTy3/YKO1jydkvKg==
ARC-Message-Signature: i=2; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1795433145;
	h=DMARC-Filter:Received:DKIM-Signature:Received:From:Subject:Date:
	 Message-Id:MIME-Version:Content-Type:Content-Transfer-Encoding:
	 X-B4-Tracking:X-Change-ID:To:Cc:X-Mailer;
	bh=FZTB+VKUReCx8XgfvlzddrAeMA7GwaWZltQEpDEq+1w=;
	b=KEqClZUZmMFfIxvOcIyof5qak6zoQOTW45DrpdkArfx1qTVVU68MzkGYyFACXUu7c0w5
	 cDMNRBwa3e4aU8LM5jShHJndRxJxv1+hq2Hl1oWP0HnZwwks1MaXJ2RPFWFBmSZfZSpc7
	 +1N+kIR/DwaUNdPIMiW+GLdoPfAyrrRHplDP5lgLhyh8/59jtibD0YYe3Ink4qV1b+GS9
	 4645pIGvyIvRVEtcMqXiPGwsCkHyNmK3eZsVV1q/56U8cg2KVa0EAh9AnxAN+wLPUFhcu
	 oMHcul1hkYiYtSN8ht0XVlmHhuFjAARU4+Lc6IzTMFpY17hRySOIYXTGBuPsOB2vdNA==
ARC-Authentication-Results: i=2; smtp.subspace.kernel.org; 
	dmarc=none header.from=pengutronix.de;
	spf=pass smtp.mailfrom=pengutronix.de;
	dkim=pass header.d=pengutronix.de header.i=@pengutronix.de header.a=rsa-sha256 header.s=20260414 header.b="XC7/GABB";
	arc=pass header.oldest-pass=0 smtp.remote-ip=185.203.200.13
Received: from mx1.white.stw.pengutronix.de (mx1.white.stw.pengutronix.de [185.203.200.13])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 515E4606A32A;
	Mon, 23 Nov 2026 11:25:44 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org 515E4606A32A
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=pengutronix.de
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=pengutronix.de
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=pengutronix.de header.i=@pengutronix.de header.a=rsa-sha256 header.s=20260414 header.b=XC7/GABB
Received: from drehscheibe.grey.stw.pengutronix.de (drehscheibe.grey.stw.pengutronix.de [IPv6:2a0a:edc0:0:c01:1d::a2])
	(Authenticated sender: relay-from-drehscheibe.grey.stw.pengutronix.de)
	by mx1.white.stw.pengutronix.de (Postfix) with ESMTPSA id 4FAA92004F5;
	Mon, 23 Nov 2026 12:25:42 +0100 (CET)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=pengutronix.de;
	s=20260414; t=1795433142;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
	 content-transfer-encoding:content-transfer-encoding;
	bh=FZTB+VKUReCx8XgfvlzddrAeMA7GwaWZltQEpDEq+1w=;
	b=XC7/GABBbVCy6qSUBLzaxbF1Tgdso6abzV0o+CLMO7Pyrc+E4bpaPHhMYOPvqBcnH6d8Kz
	pS744332w9d2Kp0QSlr2pLp+O5LG9/ly1US6YHoFz3jhhV4uM7cFIFjCgkeLnqFaedQ/8X
	t59iSGt91W1E5YUbdEfD5WV/CvRzJFxllHa5BlVFlLGFnpt08gEWlnnm92Qalp8YzLgSLM
	EhOje00UR1YbhXNIkbvE1YUmdZC3FMOe8XXkBTblXQzLoTUXRdK6aIoL+B25EFCLoV/oie
	gwBhmddDSciXPsBhRIct8uprObwmvLzcF1sv0cLEFyP88X/pa4wtRjCzai+/6g==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=pengutronix.de;
	s=20260414; t=1795433142;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
	 content-transfer-encoding:content-transfer-encoding;
	bh=FZTB+VKUReCx8XgfvlzddrAeMA7GwaWZltQEpDEq+1w=;
	b=CZKb7kQBUh/XBdr74KsMTSaav0Yi7PRhKkXpjI35Isabftlf1S41trm1bBY9rQ2Q/hl2YL
	Qmmjad12VNfrJkN/zhHa+QjU9aaLXBq5A7vtjkyLRSRoqZ8axd4oPN3e5BEBkRERDYX1hb
	CH1HCW9BLduGvjeWfcOI2e3zQrC2BT9jDEpalwF4oaKewpLpzMJi2NxB26aOfVHY+hCYk+
	rKK/3nj8XKBy1stxatUc925dn6NSryBENfIeK7M/S6ex5y4ucm3jEfuFKA5h5nuJ2MZWIA
	fyx94IpDLymJ9rdQstIPhuRROPv97OXsA3Fsy5DQfkD6m85/bhu4ryET8OANiw==
ARC-Authentication-Results: i=1;
	ORIGINATING;
	auth=pass smtp.auth=relay-from-drehscheibe.grey.stw.pengutronix.de smtp.mailfrom=f.diener@pengutronix.de
ARC-Seal: i=1; s=20260414; d=pengutronix.de; t=1795433142; a=rsa-sha256;
	cv=none;
	b=Px/bp4ZMaZED356D0hsShG2xnXTdCwbJlF2VKHrd0g1sRd1h9xMausOhY1EmQISVZ/QMUO
	tqqidIDPAUp1tgz2WaxyEVIDpYuvafWx5Oe9BJkefHqTwfE8WUwdvixgM5En6vdWpT7W4T
	znkivYous1GncOc4DJT0vdwepOQM9fjksa9J/SeSNXEdUSP10aXUInxU8SAtxeG9jL2j7p
	1Sn30dYn+ygxqbYanRUTyU7QOrD2vIrFkJCrBrU+Ww3TSJIVYgoM+ocb3LOyxhRaZ0qgEg
	UOY7FA7qYrZN/jomXKqWInUUR2p15ehJFz2/3qGS33qwc8SZbTZcOMgHj4luaw==
Received: from ptz.office.stw.pengutronix.de ([2a0a:edc0:0:900:1d::77] helo=[127.0.0.2])
	by drehscheibe.grey.stw.pengutronix.de with esmtp (Exim 4.96)
	(envelope-from <f.diener@pengutronix.de>)
	id 1xVSB3-0016XI-2L;
	Mon, 23 Nov 2026 12:25:42 +0100
From: Freimut Diener <f.diener@pengutronix.de>
Subject: [PATCH v2 0/5] arm64: dts: freescale: Fix i.MX93 FRDM hardware
 descriptions
Date: Mon, 23 Nov 2026 12:25:14 +0100
Message-Id: <20261123-imx93-frdm-fixes-v2-0-dd97c7fca4b1@pengutronix.de>
X-Mailing-List: devicetree@vger.kernel.org
List-Id: <devicetree.vger.kernel.org>
List-Post: <mailto:devicetree@vger.kernel.org>
List-Help: <mailto:devicetree+help@vger.kernel.org>
List-Subscribe: <mailto:devicetree+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:devicetree+unsubscribe@vger.kernel.org>
List-Owner: <mailto:devicetree+owner@vger.kernel.org>
Precedence: list
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
X-B4-Tracking: v=1; b=H4sIAAAAAAAC/22NwQ6CMBBEf4Xs2TVtDRU98R+GA9ItrAmFtIVgC
 P9uQY8eX2bmzQqBPFOAe7aCp5kDDy6BOmXQdLVrCdkkBiWUllIK5H65XdB606PlhQLm2hYmJys
 arSHNRk9HkFaP6sther6oibtnb3Qc4uDfx+cs995Pr/7oZ4kCr4UxpFSdvqgcybVT9IPj5WwIq
 m3bPsgMzwnHAAAA
X-Change-ID: 20261110-imx93-frdm-fixes-56f8d5ef0c66
To: Rob Herring <robh@kernel.org>, Krzysztof Kozlowski <krzk+dt@kernel.org>, 
 Conor Dooley <conor+dt@kernel.org>, Frank Li <Frank.Li@nxp.com>, 
 Sascha Hauer <s.hauer@pengutronix.de>, 
 Pengutronix Kernel Team <kernel@pengutronix.de>, 
 Fabio Estevam <festevam@gmail.com>
Cc: devicetree@vger.kernel.org, imx@lists.linux.dev, 
 linux-arm-kernel@lists.infradead.org, linux-kernel@vger.kernel.org, 
 kernel@pengutronix.de, Freimut Diener <f.diener@pengutronix.de>, 
 Marco Felsch <m.felsch@pengutronix.de>
X-Mailer: b4 0.15.2

This series fixes and completes several hardware descriptions for the
NXP FRDM-i.MX93 board and the common i.MX91/i.MX93 device tree.

The changes enable the PMIC's I2C level shifter, describe the PCAL6524
GPIO expander supply and USB2 VBUS supply, and restrict USDHC3 probing
to SDIO devices.

Additionally, the missing EL2 virtual timer interrupt is added to the
common i.MX91/i.MX93 timer description, allowing VHE-enabled Linux to
use the EL2 virtual timer.

The changes have been tested on an NXP FRDM-i.MX93 board.

Signed-off-by: Freimut Diener <f.diener@pengutronix.de>
---
Changes in v2:
- Keep USDHC3 at 4-bit bus width and restrict probing to SDIO.
- Move the I2C level shifter configuration to the common DTSI.
- Address review feedback.
- Link to v1: https://patch.msgid.link/20261120-imx93-frdm-fixes-v1-0-78dde22a56fe@pengutronix.de

To: Rob Herring <robh@kernel.org>
To: Krzysztof Kozlowski <krzk+dt@kernel.org>
To: Conor Dooley <conor+dt@kernel.org>
To: Frank Li <Frank.Li@nxp.com>
To: Sascha Hauer <s.hauer@pengutronix.de>
To: Pengutronix Kernel Team <kernel@pengutronix.de>
To: Fabio Estevam <festevam@gmail.com>
Cc: devicetree@vger.kernel.org
Cc: imx@lists.linux.dev
Cc: linux-arm-kernel@lists.infradead.org
Cc: linux-kernel@vger.kernel.org

---
Freimut Diener (5):
      arm64: dts: freescale: imx93-11x11-frdm-common: Enable I2C level shifter
      arm64: dts: freescale: imx93-11x11-frdm-common: Describe PCAL6524 supply
      arm64: dts: freescale: imx93-11x11-frdm: restrict USDHC3 to SDIO
      arm64: dts: freescale: imx91-93-common: Add EL2 virtual timer interrupt
      arm64: dts: freescale: imx93-11x11-frdm-common: Describe USB2 VBUS supply

 arch/arm64/boot/dts/freescale/imx91_93_common.dtsi |  3 ++-
 .../dts/freescale/imx93-11x11-frdm-common.dtsi     | 29 ++++++++++++++++++++--
 arch/arm64/boot/dts/freescale/imx93-11x11-frdm.dts |  2 ++
 3 files changed, 31 insertions(+), 3 deletions(-)
---
base-commit: 6628e7d4c6b25c8d18f1345e3a20d21829aae7e4
change-id: 20261110-imx93-frdm-fixes-56f8d5ef0c66

Best regards,
--  
Freimut Diener <f.diener@pengutronix.de>

