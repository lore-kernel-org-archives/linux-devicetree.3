Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=185.246.84.56
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1795702451;
	b=s+XFwpi85G6ev15e8bUBBB8Bp6euxG1fLJ0RRYhqEo0ERWMo/fJjKWIJw4cznA+4MUMu
	 heDIjZrLIn3jOBIoUJ8fSJViRw2V3JUUShnkMrNILyiYl4WP4HWuGH9dj9RJmfUILlvG9
	 +TuF2bi0h5LHbnNm7M0qaz6i/x9Npjoo/YXDEBG/CFqsRj0Tu2XW147Yd4kia4GHS20Rg
	 7otYjzEDYyltJ6KT6k95rpvVr5DDYfW2o6Vb0r4yiY/7hXIqX48RfnhTo79xbRSbWu+mE
	 P/cm890gmYPVA6kcn6YAO0ae//ehn4CqC1gloD+AFI/6CruqstNLLjoxmA4HpFb+iRQ==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1795702451;
	h=DMARC-Filter:Received:Received:Received:DKIM-Signature:From:Subject:
	 Date:Message-Id:MIME-Version:Content-Type:Content-Transfer-Encoding:
	 X-B4-Tracking:X-Change-ID:To:Cc:X-Mailer:X-Developer-Signature:
	 X-Developer-Key:X-Last-TLS-Session-Version;
	bh=s2a9AvV/AgdGHUQnq3iKJwMA5eBsGeLbNvEBzUN1awg=;
	b=fkoNqgDUK7x8NsNuTN9vC0qO3u7f7LI2h3ZSBkEtNNykmnrr8UGLSGIDlTV7hQDE4g/d
	 wmH9exsSjUISI5FZFsUC0Ae9m3sD4VWE3U/69osIj8oGQ6XTylzQ8oKgy45r5ggHFuJPa
	 gOjC5mtGONfO9hNOaBma9CqOYG2tBpoybgEF3JjYH0aB9L5kBtzmr9sAN9Qm4JbOhOwgx
	 FXdR1y73wyx2e4mfdKVBRIkOGsOF13H4Re7Aq66QEN9Mt4e5VFA53JlUGepBAqNAUSPuk
	 uuhB94kR/4d7lHWSfiM4ZF4yo8jSG7LgG8wETG5pm347b5H1sMqKrlxFElbBYvaSyUA==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=bootlin.com;
	spf=pass smtp.mailfrom=bootlin.com;
	dkim=pass header.d=bootlin.com header.i=@bootlin.com header.a=rsa-sha256 header.s=dkim header.b=FM7l+q0z;
	arc=none smtp.remote-ip=185.246.84.56
Received: from smtpout-02.galae.net (smtpout-02.galae.net [185.246.84.56])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 1B6ED606A31E
	for <devicetree@vger.kernel.org>; Thu, 26 Nov 2026 14:14:10 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org 1B6ED606A31E
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=bootlin.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=bootlin.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=bootlin.com header.i=@bootlin.com header.a=rsa-sha256 header.s=dkim header.b=FM7l+q0z
Received: from smtpout-01.galae.net (smtpout-01.galae.net [212.83.139.233])
	by smtpout-02.galae.net (Postfix) with ESMTPS id 9B62A1A17D9;
	Thu, 26 Nov 2026 14:14:09 +0000 (UTC)
Received: from mail.galae.net (mail.galae.net [212.83.136.155])
	by smtpout-01.galae.net (Postfix) with ESMTPS id 6E3A4604ED;
	Thu, 26 Nov 2026 14:14:09 +0000 (UTC)
Received: from [127.0.0.1] (localhost [127.0.0.1]) by localhost (Mailerdaemon) with ESMTPSA id 243CC11E68394;
	Thu, 26 Nov 2026 15:14:02 +0100 (CET)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=bootlin.com; s=dkim;
	t=1795702447; h=from:subject:date:message-id:to:cc:mime-version:content-type:
	 content-transfer-encoding; bh=s2a9AvV/AgdGHUQnq3iKJwMA5eBsGeLbNvEBzUN1awg=;
	b=FM7l+q0zErVfEUB1xeGnmIc+yH6UrWbmtGIVo9lDJA2rnwhRgLkYPHmDAxOwQNvF2iYnbZ
	pt851rk97jymEDQ7TxqVDe9u29CB6p18kpEE3UlEMBO3TtNPXgptRwNxHUXAiy3kvX6zBW
	we0Dtoc0MJgc1wQsF7Ys10Fiv/0aSFJskXW+uPZHX37DVlmo3LwFL8YbCR+PgchPTYzj6b
	czA5cNAjEsdTf4FVy/NzN4rtHUtD+9CvnKemSofr59m7OM9f8ipbuPwDJopmoSKp2wFID3
	jDEPd0WTUXcKVyi1+TZgPWP52zQD7a57OBtnrqbWrhEilHfWkAOZx6n5rlS1BQ==
From: Paul Louvel <paul.louvel@bootlin.com>
Subject: [PATCH net-next 0/3] net: dsa: lan9303: add LED mode configuration
Date: Thu, 26 Nov 2026 15:13:42 +0100
Message-Id: <20261126-lan9303-leds-v1-0-a96731317859@bootlin.com>
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
X-B4-Tracking: v=1; b=H4sIAAAAAAAC/yWMQQ6CMBAAv0L27Ca0IFW/YjyUdoE1ZDXdakgIf
 6fKcTKZWUEpMSncqhUSfVn5JQXMqYIweRkJORYGW9vOGHvG2cu1qRucKSp674K7ONO3Q4SSvBM
 NvPx3dxDKKLRkeBxGP/2TQv7dYNt2/MbtDnoAAAA=
X-Change-ID: 20261125-lan9303-leds-aa7c7871b4fd
To: Andrew Lunn <andrew@lunn.ch>, Vladimir Oltean <olteanv@gmail.com>, 
 "David S. Miller" <davem@davemloft.net>, Eric Dumazet <edumazet@kernel.org>, 
 Jakub Kicinski <kuba@kernel.org>, Paolo Abeni <pabeni@redhat.com>, 
 Rob Herring <robh@kernel.org>, Krzysztof Kozlowski <krzk+dt@kernel.org>, 
 Conor Dooley <conor+dt@kernel.org>, Frank Li <Frank.Li@nxp.com>, 
 Jerry Ray <jerry.ray@microchip.com>
Cc: netdev@vger.kernel.org, devicetree@vger.kernel.org, 
 linux-kernel@vger.kernel.org, Bo Mellberg <bo.mellberg@se.com>, 
 Pascal Eberhard <pascal.eberhard@se.com>, 
 Thomas Petazzoni <thomas.petazzoni@bootlin.com>, 
 Miquel Raynal <miquel.raynal@bootlin.com>, 
 Paul Louvel <paul.louvel@bootlin.com>
X-Mailer: b4 0.15.2
X-Developer-Signature: v=1; a=ed25519-sha256; t=1795702442; l=1417;
 i=paul.louvel@bootlin.com; s=20260313; h=from:subject:message-id;
 bh=DEG5WV9o47C96zqF0vii+oCLUP9d16Gtee40hniLtLQ=;
 b=84gDsLAlN0vjKVWg3ZZp/P+E6kY4UpiptRsUvZniPfgdKh+a1mnOzpEOYwgIOJk0M6IA7vp+P
 oHHPVFG+FBbDnWt5GUxfvlfHK1kClwLZ4FPtgDj7L48h0PXvIeB/hSx
X-Developer-Key: i=paul.louvel@bootlin.com; a=ed25519;
 pk=eLW50NT18UAvUT5cAcYf88zNbBCZDLFXuptpyLVhVIU=
X-Last-TLS-Session-Version: TLSv1.3

Hello,

The LAN9303 and LAN9354 has 6 different LEDs, 3 LEDs are used per
external port.
On some boards the LED straps double as configuration straps for other
functions, such as the PHY address or the EEPROM size, so the desired
LED mode cannot be strapped and has to be programmed by the driver.

This series add the ability to program the LEDs function via the
vendor-defined property 'smsc,led-mode' at setup.

The first commit document the compatible LAN9354 that is missing in the
bindings. The binding was converted to YAML, but the compatible property
was never added [1].

[1]: https://lore.kernel.org/all/Yw0R7u1qV9tLSCnu@lunn.ch/

Thanks.

Signed-off-by: Paul Louvel <paul.louvel@bootlin.com>
---
Paul Louvel (3):
      dt-bindings: net: dsa: lan9303: add Microchip LAN9354 compatible
      dt-bindings: net: dsa: lan9303: add smsc,led-mode property
      net: dsa: lan9303: add LED mode configuration

 .../devicetree/bindings/net/dsa/smsc,lan9303.yaml  | 35 ++++++++--
 drivers/net/dsa/lan9303-core.c                     | 74 +++++++++++++++++++++-
 include/linux/dsa/lan9303.h                        |  8 +++
 3 files changed, 111 insertions(+), 6 deletions(-)
---
base-commit: 3dd8c790a7b7027abdd568e36db5e82ffaea7c77
change-id: 20261125-lan9303-leds-aa7c7871b4fd

Best regards,
--  
Paul Louvel, Bootlin
Embedded Linux and Kernel engineering
https://bootlin.com

