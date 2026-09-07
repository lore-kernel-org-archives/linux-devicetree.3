Received: from mail-wr1-f41.google.com (mail-wr1-f41.google.com [209.85.221.41])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 9C85518A6DB
	for <devicetree@vger.kernel.org>; Mon,  7 Sep 2026 06:47:30 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.221.41
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1788763652; cv=none; b=jP/eUsqsIqnLEu1gz2ojsQL9ZKsQlOvJPSnOl1/kYaNabMnDstsApx+CXFTzMzNuv7Ys9cBl4M1LvTA5JlwQfc/ibWDozQS0QXgGUOm1xMET3oeaqogeI1NEwDdUHfi+ZDUCyW6MvPa1rODoRai/LsFebHcRDNjUZGDDv9CLXSI=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1788763652; c=relaxed/simple;
	bh=gfWrSoeHVI8G8zOpNpxAVkXnMy09qAbqOf8byIMhbHI=;
	h=From:Subject:Date:Message-Id:MIME-Version:Content-Type:To:Cc; b=CW+l4BqT4Cu3Lml/+tMCnX2XvmQ39iynIzzVd+gWtSj/74Mj4op1BliUaNp0tL/be332l4HebzTksgEfgeZCRKwgH29CnL1oIL25UFTsR9D/p1fYpYT1vHcKhBDJJk+9mFIx37dpUrrya8thzO7/t5OVPDs+xdOGQEDaSchGdlM=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=Y5N/tzYa; arc=none smtp.client-ip=209.85.221.41
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="Y5N/tzYa"
Received: by mail-wr1-f41.google.com with SMTP id ffacd0b85a97d-4843e9c5960so3161255f8f.0
        for <devicetree@vger.kernel.org>; Sun, 06 Sep 2026 23:47:30 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1788763648; x=1789368448; darn=vger.kernel.org;
        h=cc:to:content-transfer-encoding:content-type:mime-version
         :message-id:date:subject:from:from:to:cc:subject:date:message-id
         :reply-to:content-type;
        bh=67I9fZQv05H07qwfT2ore1O1EeEbYTW4uGyAtywvhDg=;
        b=Y5N/tzYakfHLsg0SDnGHSS9sdCqpq0JfjiFdNSQS/J04tOt6t5ZlXOzQDHSrjek9lK
         MM9mcFGrEemLfcUOAaFzYmHet3Nh7SCGFfFBLPIYR+VvxQHw6EUO3PEhozYsIStcPiZ/
         /yDNVHu04aNzbpwpq8EH3N3xD/Ru2iHiKvT/8o5V36OBvXLC+oBGBdAPRcPZVQTG5fnZ
         ab/f5U/aE1h5mY8UN1f0GBWCyGw0I9om4YQYRBBXEq/aX84Bqtjmg9cj1S7dNCuLBhqo
         MhAYyj0IYyqop+3By+PfdlqA9kTE10+I3rbsbiGAARiH4YbYl9mf9A+M8E4CqKOUPDY6
         GJFA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1788763649; x=1789368449;
        h=cc:to:content-transfer-encoding:content-type:mime-version
         :message-id:date:subject:from:x-gm-gg:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to:content-type;
        bh=67I9fZQv05H07qwfT2ore1O1EeEbYTW4uGyAtywvhDg=;
        b=SvFzPVnoNlp6FOj/D5oBwHq97cQMoURafaolBDZTpsvXdupaeDgHqr8lyJ+fM1P+r7
         H0YoTr4JVTRZqZRpvcVgk6rPxeAtIpJ6s/JNV3ejE5PV2H4TkedkcvFO1HJTfW22e1Tr
         2q+7tOl2r0I9NT3Oc1p28g5woXIkRSwcBMrXS+pZGci/zmionmtuf1G4ajSL1wPpn4V8
         RLzwLLjkAmCdTvsxYjlE49iyZ9QE0e/G6VrN5flDCx1wFfobFZQk/HJbVuufZ0DRK6RP
         h/aqtHZjhnNyw8dZEoR1+0akSfO/Ke2TlsQScs72fK0xea2x+KwhHGIP7jrWjtzQr+W/
         fUKA==
X-Forwarded-Encrypted: i=1; AKwUvBxnrDP5HVTYv9/f8nwAA7h2odjCh1Om0cojDg50WSbXY5CwlwNFY+ZGDCpvptaLp56azGDdO2wIKaSg@vger.kernel.org
X-Gm-Message-State: AFuF++l3Fmu7Lr0trBsjpm7OfF2WxYTMMhD/ZNe0MkadAs0L8MxC0Nga
	yzQIXdXQtvmlRTU1ict6JMlURH2fXG0mxf0G8k96javw0AZwGF+aWN6S
X-Gm-Gg: AYBFou2H3KjDAmgEyTdehlniadJw+FMcb5qvenmo19/BhTg4wWlTT/3nDgVfTIV4QfH
	Xv33ESg7W7GixTtGDbdaB21ETye2G2lQqlEHb8MQmkusKKZxwnrZTgTx0bO28pCC1m/LGNNP77l
	WZ5sdrTeaCZ79J8rBC5EiQ5Gmw0+bxrC0bW3Nua10o7bgUfPZqjhBAoH8+IKAPgJSSLK8J2OYB5
	aE4FTyNBMM42udY3HRI+NZbQk93H2L+yS3ewQDCikz22BArg4yo9InmRuvS+BWbMakCPhGU2p9G
	49DAdJrZpzT6R5snB91OAFHbgj/WHemDOtyjcqy74WT0fg7JGM5C0SO6+AVm+Cel47Nulyc2XsI
	mZrsoVNkCAxWhbpPRsR7CS69ZCsN4/eIn0OBDvnIQaKwMQPn0VZnCLGTgqBcnW5HebnKJUzILX3
	q6vQjjVcDgpzOn2DwnR3hBLBjl725zjRBoxzRZIW0O9kHpOrye7a+97fRQNtQ2SthWUDga7IPAX
	ET/CLBqFDPDLqk6nCADa6vjkoQdKYY2/AWYUay7KwB2fXm0kqeSOZvAPC2MVYLhWJwZO+CvR/ip
	rONk8XjqBcDB5vUNQiNN6H4DmEKeCOgkpd8YK4PKnhUyXy3B
X-Received: by 2002:a05:600c:548b:b0:49b:92df:87be with SMTP id 5b1f17b1804b1-49cf81f3655mr208334755e9.4.1788763646919;
        Sun, 06 Sep 2026 23:47:26 -0700 (PDT)
Received: from [127.0.1.1] (248.201.173.83.static.wline.lns.sme.cust.swisscom.ch. [83.173.201.248])
        by smtp.gmail.com with ESMTPSA id 5b1f17b1804b1-49cfd3f815bsm200573845e9.4.2026.09.06.23.47.25
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Sun, 06 Sep 2026 23:47:26 -0700 (PDT)
From: Franz Schnyder <fra.schnyder@gmail.com>
Subject: [PATCH v2 0/2] arm64: dts: freescale: imx95: Add ENETC port 2 in
 SGMII mode on Toradex boards
Date: Mon, 07 Sep 2026 08:47:19 +0200
Message-Id: <20260907-add-enetc-port2-v2-0-e8f1f8b000c0@toradex.com>
Precedence: bulk
X-Mailing-List: devicetree@vger.kernel.org
List-Id: <devicetree.vger.kernel.org>
List-Subscribe: <mailto:devicetree+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:devicetree+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
X-B4-Tracking: v=1; b=H4sIAPddnmoC/2WNQQ6CMBBFr0Jm7Zh2CBBceQ/CoraD1ERK2tpgC
 He3YFy5fMn7768Q2FsOcClW8JxssG7KQKcC9KimO6M1mYEE1aIVhMoY5Imjxtn5SNiUVUW1ank
 gDXk1ex7schS7/svhdXuwjntmN0YbovPv4zLJ3fvVy796kiiQFElZtqZRjb7mqTK8nLV7Qr9t2
 wd/n0NVwgAAAA==
X-Change-ID: 20260902-add-enetc-port2-735526a9ef2c
To: Rob Herring <robh@kernel.org>, Krzysztof Kozlowski <krzk+dt@kernel.org>, 
 Conor Dooley <conor+dt@kernel.org>, Frank Li <Frank.Li@nxp.com>, 
 Sascha Hauer <s.hauer@pengutronix.de>, 
 Pengutronix Kernel Team <kernel@pengutronix.de>, 
 Fabio Estevam <festevam@gmail.com>
Cc: Francesco Dolcini <francesco@dolcini.it>, devicetree@vger.kernel.org, 
 imx@lists.linux.dev, linux-arm-kernel@lists.infradead.org, 
 linux-kernel@vger.kernel.org, Franz Schnyder <franz.schnyder@toradex.com>
X-Mailer: b4 0.15.2

Add the ENETC port 2 on Toradex SMARC and Aquila iMX95. The port
is connected as an SGMII Ethernet interface.

Enable the reference clock on the modules and enable the PHY connections
on the supported carrier boards.

Signed-off-by: Franz Schnyder <franz.schnyder@toradex.com>
---
Changes in v2:
- Fix node order on the imx95-aquila-dev.dts
- Link to v1: https://patch.msgid.link/20260903-add-enetc-port2-v1-0-2a21139d7a7c@toradex.com

---
Franz Schnyder (2):
      arm64: dts: freescale: imx95-toradex-smarc: Add ENETC port 2 in SGMII mode
      arm64: dts: freescale: imx95-aquila: Add ENETC port 2 in SGMII mode

 arch/arm64/boot/dts/freescale/imx95-aquila-clover.dts  | 18 ++++++++++++++++++
 arch/arm64/boot/dts/freescale/imx95-aquila-dev.dts     | 18 ++++++++++++++++++
 arch/arm64/boot/dts/freescale/imx95-aquila.dtsi        |  7 +++++++
 .../boot/dts/freescale/imx95-toradex-smarc-dev.dts     |  8 ++++++++
 arch/arm64/boot/dts/freescale/imx95-toradex-smarc.dtsi |  7 +++++++
 5 files changed, 58 insertions(+)
---
base-commit: ff1bb9ccce43cd06c766c3ddef796a7e40e623fe
change-id: 20260902-add-enetc-port2-735526a9ef2c

Best regards,
--  
Franz Schnyder <franz.schnyder@toradex.com>

