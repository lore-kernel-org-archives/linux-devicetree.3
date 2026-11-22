Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=217.194.8.81
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1795367989;
	b=HfS2hJDvttFQNdYzURIMnw50kiGaZ9KxuZA7kBFXltYX6SYeGoc91tKAyBJYz50ogm/x
	 zHna4jEHT+eBsWibfzEvmPAdMLrMX5bL6KBVuPDclq+OT1EqM0Kq1VcdaYgoIKPYtC4DY
	 moVOEgQaqXHEo/gNsbO3Xl9CCCigyyHYqAsN7BaPl7JtxZT/hzUvG8GLjDNQ+RLdidAYd
	 H1fOJr+hNJ7UdCy9uTFuN985rrwouezYpzb1LDKek2WDRlwh0qi3I+L9Olr3ZabBIcgxB
	 RN5d10dX+HSK0571Qtsn4FAvoTzqRLlFhHmiICoIl7jYXkG1wPTgvN6sscbDqHUDj9g==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1795367989;
	h=DMARC-Filter:Received:DKIM-Signature:From:To:Cc:Subject:Date:
	 Message-ID:X-Mailer:MIME-Version:Content-Transfer-Encoding;
	bh=zdQCpGaqkRp6x/x58XyJ1tSRsHAfUx3qThyEUIIDCA8=;
	b=DwRR1JDNIUWzHdialuu+FiccljDZGoEdiQ6xhRAalMmRatsuZQ/GHHoG2FkJukM9NyQ1
	 /i1hMszkqRx+AqE3q87AlHfzWWrstJ3DkXYTX7bq6EelkOnmgMeQVBehRBM7EbtWrzNB/
	 e/zveCbpmHUvJkuB3lVfrKYeuQY19C51WDfCpaI2tdHR7zORWukOnvfe7U+Gep1S2UmR+
	 4OJyAD0+QbIYnM43KSiYYiG3EfQHuA+SiFMjyizu/cTbPirERZ8A21lo3T5d3TA7hdl3u
	 zcdVFLIHCvXHhew/JEzblqkPQ/Il5WH5IZ1K/Rjg9FZeKpND6ySiriDGx764h3vWlKw==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=dolcini.it;
	spf=pass smtp.mailfrom=dolcini.it;
	dkim=pass header.d=dolcini.it header.i=@dolcini.it header.a=rsa-sha256 header.s=default header.b="lV/STT9l";
	arc=none smtp.remote-ip=217.194.8.81
Received: from mail11.truemail.it (mail11.truemail.it [217.194.8.81])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 3E3CC606A320;
	Sun, 22 Nov 2026 17:19:46 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org 3E3CC606A320
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=dolcini.it
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=dolcini.it
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key, unprotected) header.d=dolcini.it header.i=@dolcini.it header.a=rsa-sha256 header.s=default header.b=lV/STT9l
Received: from francesco-nb.. (93-49-2-63.ip317.fastwebnet.it [93.49.2.63])
	by mail11.truemail.it (Postfix) with ESMTPA id 95BE923508;
	Sun, 22 Nov 2026 18:19:38 +0100 (CET)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=dolcini.it;
	s=default; t=1795367979;
	bh=zdQCpGaqkRp6x/x58XyJ1tSRsHAfUx3qThyEUIIDCA8=; h=From:To:Subject;
	b=lV/STT9lTgqGHaTrDFn+NryN+hq+GkUAAKri4PeWFaaq4jYsBnJnZqi0pD/QlMSim
	 ZLc0F2rXjameysaoC9UjJps1vv8fVtZO582i6NFvjMETeQfEyo946NL/bm3DHBB2Rf
	 Hf8JeF/EiqFOaKfba3+lNgezAIOxCmWHAqXnztVK9O1QPv1KFdX3vgERtcp3j+aKPW
	 /m05SR//UkfnY47jjET3pxjFMiWJ13VQlSAmIGWmpNhD98m/81MJFp1zmURAaCR3Yt
	 +5Z3FqPr5xC8L7R/60TqZVVgpZ3FL+1EmUQg5YsPos0Q5i/7sutU/5g7x97Q5Xlfem
	 OtB/UF4dSVDaQ==
From: Francesco Dolcini <francesco@dolcini.it>
To: Francesco Dolcini <francesco.dolcini@toradex.com>,
	Rob Herring <robh@kernel.org>,
	Krzysztof Kozlowski <krzk+dt@kernel.org>,
	Conor Dooley <conor+dt@kernel.org>,
	Frank Li <Frank.Li@nxp.com>,
	Sascha Hauer <s.hauer@pengutronix.de>,
	Pengutronix Kernel Team <kernel@pengutronix.de>,
	Fabio Estevam <festevam@gmail.com>
Cc: linux-bsp@toradex.com,
	devicetree@vger.kernel.org,
	imx@lists.linux.dev,
	linux-arm-kernel@lists.infradead.org,
	linux-kernel@vger.kernel.org
Subject: [PATCH v1 0/2] arm64: dts: freescale: imx9[135]-toradex-osm-dev: Fix SDIO_B interface
Date: Sun, 22 Nov 2026 18:19:27 +0100
Message-ID: <20261122171931.295307-1-francesco@dolcini.it>
X-Mailer: git-send-email 2.47.3
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

From: Francesco Dolcini <francesco.dolcini@toradex.com>

On the OSM Development Board, OSM SDIO_B goes to the M.2 Key E slot for
a Wi-Fi/Bluetooth module. The slot has no card detect signal, its supply
is not software controlled, and the SDIO_B signals are fixed at 1.8V.

This was noticed from an anomalous interrupt rate on an idle system:
with the slot empty, mmc2 fired about 45 interrupts per second, because
the empty slot was polled every second.

Describe the slot as non-removable, keep the module powered in suspend,
and add the fixed 1.8V I/O supply, on both the OSM iMX93/iMX91 and the
OSM iMX95 variants of the board.

Francesco Dolcini (2):
  arm64: dts: freescale: imx93-imx91-toradex-osm-dev: Fix SDIO_B
    definition
  arm64: dts: freescale: imx95-toradex-osm-dev: Fix SDIO_B definition

 .../boot/dts/freescale/imx93-imx91-toradex-osm-common.dtsi     | 1 +
 .../boot/dts/freescale/imx93-imx91-toradex-osm-dev-common.dtsi | 3 +++
 arch/arm64/boot/dts/freescale/imx95-toradex-osm-dev.dts        | 3 +++
 arch/arm64/boot/dts/freescale/imx95-toradex-osm.dtsi           | 1 +
 4 files changed, 8 insertions(+)

-- 
2.47.3

