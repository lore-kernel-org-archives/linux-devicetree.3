Authentication-Results: smtp.subspace.kernel.org; arc=pass header.oldest-pass=0 smtp.remote-ip=100.103.45.18
ARC-Seal: i=2; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=pass;
	t=1795466447;
	b=LTBvPacoJ/Xo4szI7/KlkXTlEJwXtYavrRRcigjwykNaSyscDcASLx4HTF1MbT1IeJvA
	 K7v/h+0OlT1oaNAuOaoXM0FQw7d5NnFKhCkMFYkfQ5gjL/jh0BKXMrT7xal1+6PYTad3l
	 oN4vK+85R7ngJQofF7U8CiKMng9gU9YdYaHt8idfKcwD7/rP7kGminOCfZg6rngQZLqgB
	 I6a6pSsHSTXwvcvxsoD9Lzr/EZJ49afU8hnlIyxhpZH+dPLs87Cw7oQz8lK8cJMQWuO+x
	 y9Hg3rSlkk++Kl1AtZKfkT4C61sO7AwJsRdXKtus6RE+VKa034UJ82CgOs5x619XfSg==
ARC-Message-Signature: i=2; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1795466447;
	h=Received:DKIM-Signature:Received:From:Subject:Date:Message-Id:
	 MIME-Version:Content-Type:Content-Transfer-Encoding:X-B4-Tracking:
	 X-Change-ID:To:Cc:X-Mailer:X-Developer-Signature:X-Developer-Key:
	 X-Endpoint-Received:X-Original-From:Reply-To;
	bh=1JuztqqewvbOzyvkkNc0deMlrjYEC/N7iEQ6kq5xmUc=;
	b=NMq/vVhbs3j9Psl03oCVReBqgB5HXr7kdFSOO8f6ohaElhErrnYZjVb/uPofmUUJc/YS
	 ccaoI4Y6y66woaqvIFbL/nL/xiNvbKrNtP4Jp3ASIrk87sArlz/9x9cZO21qtiQWcitGP
	 188Ye5VlsEKjumk98QjhIN+XXZWsgpf7Ba37BuUbC2yEfZ40Phz8G9f10lEEBybEEWlBx
	 rYspHeiiQDezvXF8gxIPCsnNuvUWw4HWt4IKBuONox8YrOijQ6cnShSEpSAlsNyirxAwp
	 Bi9g4pa+65RzVL8gORlDEfeSkgXsikxDrHhY2ptGJfO11nz1Z88LVrlclcBbypqgDRw==
ARC-Authentication-Results: i=2; smtp.subspace.kernel.org; 
	dkim=pass header.d=kernel.org header.i=@kernel.org header.a=rsa-sha256 header.s=k20260515 header.b=jkJfFc1E;
	arc=pass header.oldest-pass=0 smtp.remote-ip=100.103.45.18
Received: from smtp.kernel.org (quasi.space.kernel.org [100.103.45.18])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 42CFA606A31E;
	Mon, 23 Nov 2026 20:40:47 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.a=rsa-sha256 header.s=k20260515 header.b=jkJfFc1E
Authentication-Results: smtp.kernel.org; arc=none smtp.remote-ip=100.80.115.77
ARC-Seal: i=1; d=kernel.org; s=arc20260519; a=rsa-sha256; cv=none;
	t=1795466446;
	b=fdjiYrKNJxP/ho8qxvW848sXooXyZ7lrF16AyF1+TtY0QXEjt+kGc6pjWXewBao5HYHz
	 CJL6V8CzF89q9DD2fZl2FM+iVSapcedXtWddZf68geqEclPzlnyPkffQ7J8a3ogvDStQS
	 d0Rc9pQkOqD6+O+QsBzKQ9b3XxWmt90ddbrHOptgRT2b0xpuvPNW/7hO3fFs+jp+yfUA9
	 31YwsJGx1Wr12Ne7qCfegJ7xmfk3ESIWrCOuWNo2B3H6zD8QvxCVXZ/oaIjtESgPfl4Ga
	 HmteRgtbhuBpshT1rKP2CGADN25I4iPc31c86izLu/PId7IDRa7Eg0VHcimo+o5En5A==
ARC-Message-Signature: i=1; d=kernel.org; s=arc20260519; a=rsa-sha256;
	c=relaxed/relaxed; t=1795466446;
	h=DKIM-Signature:Received:From:Subject:Date:Message-Id:MIME-Version:
	 Content-Type:Content-Transfer-Encoding:X-B4-Tracking:X-Change-ID:To:
	 Cc:X-Mailer:X-Developer-Signature:X-Developer-Key:X-Endpoint-Received:
	 X-Original-From:Reply-To;
	bh=1JuztqqewvbOzyvkkNc0deMlrjYEC/N7iEQ6kq5xmUc=;
	b=JSkHuFq8wgtntUBKk7UOMxcsCC6R0tJiBJWAAYL4lDhVwtlewJ26NkLVVbD0B/WQmnB9
	 lNX70vGdd8JFJAQAxD8lhkDD8uQEJlyvMp+tL7g2o+kJTtFJD8hVUWbb14JAZlvHhQRCt
	 0ZiG0eec/BtcmODFmCoVWHGTvTAON3eeDeHh4yp727cFBAUPxxtUlsQK1GBufZG89K4uL
	 J8y5j9Ys5ecHa+dNwhOPjOA3Ze6N9TUsQJzLaFcdvOsftj4UyYtmdmUstMJbMLQG+Cy8H
	 1/SVb+IlheYoruOdZQuGvMJ0EkLopdu92PZNTEkgvf1e1iLntN7rAJNZd+zPMTlZSzQ==
ARC-Authentication-Results: i=1; smtp.kernel.org; 
	arc=none smtp.remote-ip=100.80.115.77
Received: from lkml.kernel.org (nexus.subspace.kernel.org [100.80.115.77])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.kernel.org (Postfix) with ESMTPS id E2CC61F000CF;
	Mon, 23 Nov 2026 20:40:39 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kernel.org;
	s=k20260515; t=1795466446;
	bh=1JuztqqewvbOzyvkkNc0deMlrjYEC/N7iEQ6kq5xmUc=;
	h=From:Subject:Date:To:Cc:Reply-To;
	b=jkJfFc1EyEjLSYyeF5fKPH440x+mUY7cTDfPGA0bVZzAiO8kW2GEZcp63dPfCUdXj
	 HZ5tFh8LT1MvU329OiZG/ptOfi6dpLsDBDyyWq/U580vkS/XxMl1eRRC/ELonXqKJM
	 D5BXNAdyit5S0pJuog5b2ipgSXIl7T6yPX3WsT1dt2z91kD0Jrl/2TxL1oevOdCdt5
	 w6waLydglrkBtSOZR/woUO1Vbnf5+lM8Y/3aEyHxh9CnxifXzg/DtsjrQHbD8H45be
	 QSnigPnMW4fS48dvcFztsigUWN1YhCG6SEgdEc8+J3OBNEL/jobtNYGM7ECmzhJZc/
	 bMlqQ0L9WdQ0w==
Received: from nexus.subspace.kernel.org (localhost [IPv6:::1])
	by lkml.kernel.org (Postfix) with ESMTP id 439604C71A;
	Mon, 23 Nov 2026 20:40:39 +0000 (UTC)
From: Fil Dunsky via B4 Relay <devnull+filipp.dunsky.gmail.com@kernel.org>
Subject: [PATCH net-next v2 0/3] Add Cortina Systems CS7542 MDIO controller
 support
Date: Mon, 23 Nov 2026 23:40:37 +0300
Message-Id: <20261123-b4-cs7542-mdio-v2-0-30465e831853@gmail.com>
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
X-B4-Tracking: v=1; b=H4sIAAAAAAAC/3WNwQ6CMBBEf4Xs2TVtKWA8+R+GA7QrrJGWtJVgC
 P8u4Nnjy8y8WSBSYIpwzRYINHFk7zZQpwxM37iOkO3GoIQqpVQ5thpNrAqtcLDskYzWVBUVXZS
 GbTQGevB8CO/gKKGjOUH9S+K7fZJJu2/v9hyTD5/je5LH4t/NJFFgqUorGkF5q+2tGxp+nY0fo
 F7X9QvVey6HyAAAAA==
X-Change-ID: 20261123-b4-cs7542-mdio-ec44e757e824
To: "David S. Miller" <davem@davemloft.net>, 
 Eric Dumazet <edumazet@kernel.org>, Jakub Kicinski <kuba@kernel.org>, 
 Paolo Abeni <pabeni@redhat.com>, Rob Herring <robh@kernel.org>, 
 Krzysztof Kozlowski <krzk+dt@kernel.org>, 
 Conor Dooley <conor+dt@kernel.org>, Andrew Lunn <andrew@lunn.ch>, 
 Heiner Kallweit <hkallweit1@gmail.com>, 
 Russell King <linux@armlinux.org.uk>, Andrew Lunn <andrew+netdev@lunn.ch>
Cc: netdev@vger.kernel.org, devicetree@vger.kernel.org, 
 linux-kernel@vger.kernel.org
X-Mailer: b4 0.16.0
X-Developer-Signature: v=1; a=ed25519-sha256; t=1795466438; l=3043;
 i=filipp.dunsky@gmail.com; s=20260930; h=from:subject:message-id;
 bh=2XRyBPIMRh1j+zYtAlcrPeywf0p5acJiOwhwhsnWEZw=;
 b=mIwMxphAuGSFzxUDwNw4M+d85hXwZXqjFAxuvk1bs6bmvGsfJ8ukAoR//oKgVXE+sbFzzWhlT
 E4qP9FegumEAdgbYHEiC0me+BI+N6rKcMfY96I/hhX7kFKgzrb3A6OQ
X-Developer-Key: i=filipp.dunsky@gmail.com; a=ed25519;
 pk=JAYP8e2rJ54DHOmhNtXud8rl1igAaAXoOHxtJmVXI1g=
X-Endpoint-Received: by B4 Relay for filipp.dunsky@gmail.com/20260930 with
 auth_id=1085
X-Original-From: Fil Dunsky <filipp.dunsky@gmail.com>
Reply-To: filipp.dunsky@gmail.com

Add the Clause 22 MDIO controller used by the CS7542 network engine.
The driver retains the MDC prescaler initialized by platform firmware and
uses bounded polling for each transaction. It is independent of the
pending Cortina platform series and COMPILE_TEST.

V2 follows Andrew Lunn's review: remove the pending-frame state and keep
one straightforward transaction/poll per read or write. No timeout was
observed at the normal firmware-selected MDC rate. The timeout mentioned
in v1 validation was deliberately induced only in a RAM test by slowing
the prescaler; it was not evidence of a normal bus failure. No clock-loss
recovery guarantee is provided by this driver.

Validation:
- Full independent ARM vmlinux/modules builds with driver=y and=m,
  COMPILE_TEST=n, without the platform series.
- Actual driver read/write/wait functions: 5125 address, data and timeout
  cases under UBSan, including no data read after timeout.
- Binding and strict driver checks; b4 dependency/preflight checks.

V2 booted Linux 7.4 in RAM on Almond+: PHY IDs 004d:d036, the firmware
prescaler 00200001, and same-value advertisement write/readback passed.
A deliberately slowed MDC produced ETIMEDOUT at about 14ms; restoring the
prescaler returned the correct IDs. Final RAM result: failures=0 and
automatic return to installed OpenWrt. No NAND driver was loaded and no
flash writes were performed.

---
Changes in v2:
- Drop the pending-frame state as requested by Andrew Lunn.
- Sort Kconfig by prompt after MDIO_CAVIUM and sort the Makefile entry.
- Add Andrew's Reviewed-by to the MAINTAINERS patch only.
- Link to v1: https://patch.msgid.link/20261123-b4-cs7542-mdio-v1-0-626d0a0e3b4d@gmail.com

To: Fil Dunsky <filipp.dunsky@gmail.com>
To: Andrew Lunn <andrew+netdev@lunn.ch>
To: "David S. Miller" <davem@davemloft.net>
To: Eric Dumazet <edumazet@kernel.org>
To: Jakub Kicinski <kuba@kernel.org>
To: Paolo Abeni <pabeni@redhat.com>
To: Rob Herring <robh@kernel.org>
To: Krzysztof Kozlowski <krzk+dt@kernel.org>
To: Conor Dooley <conor+dt@kernel.org>
To: Andrew Lunn <andrew@lunn.ch>
To: Heiner Kallweit <hkallweit1@gmail.com>
To: Russell King <linux@armlinux.org.uk>
Cc: netdev@vger.kernel.org
Cc: devicetree@vger.kernel.org
Cc: linux-kernel@vger.kernel.org

---
Fil Dunsky (3):
      dt-bindings: net: Add Cortina CS7542 MDIO controller
      net: mdio: Add Cortina CS7542 bus controller
      MAINTAINERS: Add Cortina CS7542 MDIO controller entry

 .../bindings/net/cortina,cs7542-mdio.yaml          |  48 +++++++++
 MAINTAINERS                                        |   7 ++
 drivers/net/mdio/Kconfig                           |  12 +++
 drivers/net/mdio/Makefile                          |   1 +
 drivers/net/mdio/mdio-cs75xx.c                     | 119 +++++++++++++++++++++
 5 files changed, 187 insertions(+)
---
base-commit: b6a9fa34ce4187cb69d3c588a4bbffc31ce5db8f
change-id: 20261123-b4-cs7542-mdio-ec44e757e824

Best regards,
--  
Fil Dunsky <filipp.dunsky@gmail.com>


