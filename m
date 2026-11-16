Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=212.227.126.131
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1794829971;
	b=MBgXhYbpPZ+D4/b/XPTvWNB1aven172HOy6aQNXHjXY/xbFojZWRZ7xquZFyOdmIuzlW
	 bMvBDYgm2nelyr031YSk5GUWZfIK25pbUyFw8DZpSIxNZ6fUlz4P6ZFWzyw8KP9X+H2Md
	 2LzgYQnxwF15FRNYZ/AV7CC+jCuudhVN59m7Z64v4aiOf4vVszyQis3qk0rMxMxHusI4X
	 KKvJoyQnm0PquN+LQ6J2NaVWcGxkvdZj+sA/EK0BfXWEc77Cp9prCwibSYjxNX50dVjWR
	 rpClGpzKsLCy9ROcQGLxLVedLnLzuguf2ppKoJAU98yjbTpOeNdPBdfaPXsh4aQKYag==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1794829971;
	h=DMARC-Filter:DKIM2-Signature:Message-Instance:DKIM-Signature:
	 X-UI-Sender-Class:Received:From:To:Cc:Subject:Date:Message-ID:
	 X-Mailer:MIME-Version:Content-Transfer-Encoding:X-Provags-ID:
	 X-Spam-Flag:UI-OutboundReport;
	bh=QKl6biuHmVZ144osj+Y/bygxREL7j7/9qjYKZx6b0pM=;
	b=cY7rAbhlRZ2T4iIhYIhtgnTtaR61U+PFaCR3sPCYu2uT0k053K6qoqrEDx+eqLXoiwms
	 JS3xH/GWD8tIw613dE/kTLQL8+icCBpf2Qa9ix7DS9fkNe9FDW0yl+OxTTlLHHx8Ptu/J
	 nGWviBNaAh+/aUrwPjVw21pCXVaBWZ9XNnSm2AgHK5ZTC84XyAXB/SA6hPOTfquABMFlT
	 KJPdUVI+hkNfgKjj2n/qcBMKUK+41kz2/8uz4lAtGLWOEIg7GUFlIFvJNy/IkCdGkG1Bl
	 8d5sVgPEh2LL6caKq7EMGXBPozBFpHpZUy58h/FNuheXImTL+mIZuycmTvQMK6slaGg==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=jonasjelonek.de;
	spf=pass smtp.mailfrom=jonasjelonek.de;
	dkim=pass header.d=jonasjelonek.de header.i=jonas@jonasjelonek.de header.a=rsa-sha256 header.s=s1-ionos header.b=T6oX4GLN;
	arc=none smtp.remote-ip=212.227.126.131
Received: from mout.kundenserver.de (mout.kundenserver.de [212.227.126.131])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange ECDHE (prime256v1) server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 3F059606A32F
	for <devicetree@vger.kernel.org>; Mon, 16 Nov 2026 11:52:49 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org 3F059606A32F
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=jonasjelonek.de
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=jonasjelonek.de
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key, unprotected) header.d=jonasjelonek.de header.i=jonas@jonasjelonek.de header.a=rsa-sha256 header.s=s1-ionos header.b=T6oX4GLN
DKIM2-Signature:  i=1; m=1; t=1794829962;
 mf=PGpvbmFzQGpvbmFzamVsb25lay5kZT4=;
 rt=PGRldmljZXRyZWVAdmdlci5rZXJuZWwub3JnPg==;
 d=jonasjelonek.de;
 s=s1-ionos:rsa-sha256:QVfGMNLI8QcL5LrYPYgK20y0byQ2
   v97B4FR89k6x06Ut1LjHKE1VrYrcZSiNJ/zhqGchkQDz5hLIDI7FEOQy6Q6984u5SIHSTEOzvYO
   Da1BrkfNKIGQ/OIT5EHL/bon83ZWe6lzQM/1TQOQX5cC2BkYQjdsIVudWEsBOrsJa3JuWUmpNBZ
   tB8PAmV7Xt/hfxEALj3KZvq0OrraYcDIKcA5jzWPnzwTAYGLpEs/5jZ+2V6fL1hqgNIb5h42so/
   aHH/ZYdPhPDbaZKWYKCn04WKtRF5c50fLp2kn9Lzsob1C7yR7AC9tD2dRrligx3hbGJgb9ThvtW
   hLFDw2IaEgB1TQ==;
Message-Instance:  m=1;
 h=sha256:
   f63jc5kGLHV+/hqch2Kfu6jdGgJLLAm1sBEooQkribg=:
   bX4DJCoFLICTzjh9AkalZDfwids4N9EPguPfzH1fqto=,
  sha512:
   jiYm9YWEcNgz3bvH6nxOP/R5NcWkBVT1Fa3nzK7PjR8roYnmrT3XPvw3iKuMTqpFjOTOMGrZnhTVtZehM22sUg==:
   +isPgwurQCoXtuBiycGNn/bjlRPgSaozdpKVGWLsf8tkWNRHYObgwR3Oju8TXW6N1kAQSeKCrSJHaFGU1s9aXQ==;
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=jonasjelonek.de;
	s=s1-ionos; t=1794829961; x=1795434761; i=jonas@jonasjelonek.de;
	bh=QKl6biuHmVZ144osj+Y/bygxREL7j7/9qjYKZx6b0pM=;
	h=X-UI-Sender-Class:From:To:Cc:Subject:Date:Message-ID:
	 MIME-Version:Content-Transfer-Encoding:cc:
	 content-transfer-encoding:content-type:date:from:message-id:
	 mime-version:reply-to:subject:to;
	b=T6oX4GLNyCp3gEl1dNojtNmO2JfgaMflc0PsJ6ZbtzJFDsjgZ4BfzJ+kaFBhpWEJ
	 u/55JQVEke5caMX1eVh5wsFYW706xY0b4c+ZZPy6De2A7fFPtcTygcBn6Mwx3pDVC
	 S+L0Q5qCE/CM5cj94FU86cqokprt8SPSqPi6ogveaew1QcGszdX6F5gpk4vYWQf5K
	 Ry7Q1npCXw9amyC1ZJAkZ8FH3SydqCijy2VWPO2OIReMUaI8KiI9tsl4XiisNnyM4
	 gDNmtY+GnwtlvmR+NYLEjpuBGEUK1GROAKjhzlaJNlLvMj4SKio4w168nQ1BtV6j1
	 weJCJPSANurCUO4NYw==
X-UI-Sender-Class: 55c96926-9e95-11ee-ae09-1f7a4046a0f6
Received: from client.hidden.invalid by mrelayeu.kundenserver.de (mreue011
 [213.165.67.97]) with ESMTPSA (Nemesis) id 1MAOa3-1xHbX82yx1-00HTjE; Mon, 16
 Nov 2026 12:52:41 +0100
From: Jonas Jelonek <jonas@jonasjelonek.de>
To: Oleksij Rempel <o.rempel@pengutronix.de>,
	Kory Maincent <kory.maincent@bootlin.com>,
	Andrew Lunn <andrew+netdev@lunn.ch>,
	"David S . Miller" <davem@davemloft.net>,
	Eric Dumazet <edumazet@kernel.org>,
	Jakub Kicinski <kuba@kernel.org>,
	Paolo Abeni <pabeni@redhat.com>,
	netdev@vger.kernel.org,
	Rob Herring <robh@kernel.org>,
	Krzysztof Kozlowski <krzk+dt@kernel.org>,
	Conor Dooley <conor+dt@kernel.org>
Cc: linux-kernel@vger.kernel.org,
	devicetree@vger.kernel.org,
	Sander Vanheule <sander@svanheule.net>,
	Russell Senior <russell@personaltelco.net>,
	Jonas Jelonek <jonas@jonasjelonek.de>
Subject: [PATCH net-next v2 0/3] net: pse-pd: realtek-pse-mcu: establish power management configuration
Date: Mon, 16 Nov 2026 11:52:21 +0000
Message-ID: <20261116115224.1454885-1-jonas@jonasjelonek.de>
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
Content-Transfer-Encoding: quoted-printable
X-Provags-ID: V03:K1:+zceGRhBo551DQ4jTZ2hiD/C9ASkWfBaCbYrcvOSoi1JfewI9ea
 Fo2WCSIt5pgWygumBQ16PbG55lpMIeCcDwdirxsCp2pkk2xAXKFWIup0Y1Irt7hlF2RxI1v
 r+wAoAxcqbGXjJVJtpSHGgS/0unwFLwoHZSZydgxsXM7p9yg00BJ5SOlddjhA9pe6QQrY0u
 KZejuYrXYm9ml2ah/xjiw==
X-Spam-Flag: NO
UI-OutboundReport: notjunk:1;M01:P0:OqVoz7ENvKg=;x+S4+mTPwVvFhVrFT5JyKbvq1kX
 +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

Realtek PSE MCUs may start with a power-management configuration inherited
from firmware defaults or previous host configuration. This series
establishes an explicit configuration during probe: dynamic power manageme=
nt
with port priorities and, when a VMAIN regulator is provided, an aggregate
limit matching the board's usable PoE allowance.

The budget and management mode are configured before ungating ports.
VMAIN is used only for budget accounting, with managed reservation cleanup=
;
the rail is available independently of the host driver.

Validation includes W=3D1 builds and checkpatch.pl. OpenCode assisted with
review, implementation refinements and drafting this cover letter.

=2D--
Changes in v2:
- Move the binding first and clarify accounting-only use of VMAIN.
- Preserved Acked-by from Rob and Reviewed-by from Kory
- Set the mode directly in the helper and shorten names to "mgmt".
- Remove explicit VMAIN enable/disable; retain managed budget cleanup.
- Drop the unrelated global-disable teardown patch.

v1: https://lore.kernel.org/netdev/20261103220312.860629-1-jonas@jonasjelo=
nek.de/

=2D--
Jonas Jelonek (2):
  dt-bindings: net: pse-pd: realtek,pse-mcu: add VMAIN supply
  net: pse-pd: realtek-pse-mcu: configure global power budget

Russell Senior (1):
  net: pse-pd: realtek-pse-mcu: ensure MCU does dynamic power management

 .../net/pse-pd/realtek,pse-mcu-gen1.yaml      |   9 +
 drivers/net/pse-pd/realtek-pse-mcu-core.c     | 155 +++++++++++++++++-
 drivers/net/pse-pd/realtek-pse-mcu.h          |   3 +
 3 files changed, 164 insertions(+), 3 deletions(-)


base-commit: 7ccc5e05043b1bb84326b19a2b05938d8f7a2ae6
=2D-=20
2.53.0

