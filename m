Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=185.246.85.4
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1795793341;
	b=XUeI/z7rwsjChtw3f45P1EbrBM5TQmznO4dD+5TL9dyQJvhEvGpBODsIyiD0O6zHBKao
	 tlwm7J8QDB5AG6CnZRtDt5lWGOWDqlCuZuiSD4HMswImBcGrniiuGrsOePGn/eN32NlTb
	 XTKuuf47XcJvjup6V37rG3+x7tolijruCTuEmfMP/m2hhKXySQWLwVtiLj1f4Pq/324oK
	 0Mx5FfBuqkxPDSkmJrM2tFKl1Ylpg3cYjAmt/OSwNy+d+iNKk588e2uZ+RrvFuEfigDHI
	 X1EaigCjOHNPiwfx9srPOvq4gpaos7Z7AWyu76xa0rXSP5coaUN3vu0/PtaRsmdrc1A==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1795793341;
	h=DMARC-Filter:Received:Received:Received:DKIM-Signature:From:To:Cc:
	 Subject:In-Reply-To:References:Date:Message-ID:MIME-Version:
	 Content-Type:Content-Transfer-Encoding:X-Last-TLS-Session-Version;
	bh=jYioDbmV2lkNLd/xY1Lk394T4HvjLuyRvjfb+TZF9bM=;
	b=Vnd6ZJ8M+fogWIsULwMSZ+B47u5v2Fve75CWjO6GhFb6ONlghc6aodSJyaKbVTd7tmZz
	 qNbmFJwCC79+ExYEHqE0WljtKxv7eHvAGi6p5ah/isKjYKgAnjHlOipfFMSwWG8dogGH2
	 kFTlMPDoUJaeOWk5ftK6KB02R7IKyvnf9IDhV7LMPC+CDcdbnhAkdk1vA4d2tv8/bPxks
	 eHeo9VUufCkNq0SElE0yFvgrd7eJyKm8GsOhFdqQ1FiiZGh5Y3PR+/5G9DTbsFaJTfrV0
	 Dp/HirnnclvNeMGiyyCYrVe1JOgJ1KOHkza0wU2B0/EdaSWfkpbCZPpGuIkB+1LnyRg==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=bootlin.com;
	spf=pass smtp.mailfrom=bootlin.com;
	dkim=pass header.d=bootlin.com header.i=@bootlin.com header.a=rsa-sha256 header.s=dkim header.b=sT9JE1O0;
	arc=none smtp.remote-ip=185.246.85.4
Received: from smtpout-03.galae.net (smtpout-03.galae.net [185.246.85.4])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 1672260A383D
	for <devicetree@vger.kernel.org>; Fri, 27 Nov 2026 15:29:00 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org 1672260A383D
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=bootlin.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=bootlin.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=bootlin.com header.i=@bootlin.com header.a=rsa-sha256 header.s=dkim header.b=sT9JE1O0
Received: from smtpout-01.galae.net (smtpout-01.galae.net [212.83.139.233])
	by smtpout-03.galae.net (Postfix) with ESMTPS id AABB44E417C7;
	Fri, 27 Nov 2026 15:28:59 +0000 (UTC)
Received: from mail.galae.net (mail.galae.net [212.83.136.155])
	by smtpout-01.galae.net (Postfix) with ESMTPS id 7F4E56049C;
	Fri, 27 Nov 2026 15:28:59 +0000 (UTC)
Received: from [127.0.0.1] (localhost [127.0.0.1]) by localhost (Mailerdaemon) with ESMTPSA id 9827111E90AD2;
	Fri, 27 Nov 2026 16:28:56 +0100 (CET)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=bootlin.com; s=dkim;
	t=1795793338; h=from:subject:date:message-id:to:cc:mime-version:content-type:
	 content-transfer-encoding:in-reply-to:references;
	bh=jYioDbmV2lkNLd/xY1Lk394T4HvjLuyRvjfb+TZF9bM=;
	b=sT9JE1O0y/Q8g/zTZCiOZ51Wk1PnCeeuTAz2PjQQ/0z9s9zuyJXKDVus1SaiB9mGpE7Ixo
	R2T/xpYkSs17GEwKMBsnMv/uJ1htROw4LBTVXSerSXjj2modU1bONXI6KBapa0j/XIbeT9
	pTQRPzPwmPVxpCb3XN7Zaw8x8uXJsBLtoDbZV0Q98K+tRftUA16LjLw/GHId8/SlgEnaYz
	ADSQMr4BMGP6AMWHQrRz6J2YPgwBYmCPeMRlFaVl7tU8DWCy1/IOKmgOwLSUIFO2Mt+nP0
	MIAVlasIxNcukDy5zJglrAGUU+FxdZSjA1EaS9/5Ao/OOTQQAqP23Iam04WQZw==
From: Gregory CLEMENT <gregory.clement@bootlin.com>
To: "Rob Herring (Arm)" <robh@kernel.org>, Lee Jones <lee@kernel.org>,
 Krzysztof Kozlowski <krzk+dt@kernel.org>, Conor Dooley
 <conor+dt@kernel.org>, Andrew Lunn <andrew@lunn.ch>, Sebastian Hesselbarth
 <sebastian.hesselbarth@gmail.com>
Cc: mfd@lists.linux.dev, devicetree@vger.kernel.org,
 linux-kernel@vger.kernel.org, linux-arm-kernel@lists.infradead.org
Subject: Re: [PATCH v2 0/9] arm64: dts: marvell: DT warning fixes
In-Reply-To: <20261124-dtbs-marvell-v2-0-663009a769da@kernel.org>
References: <20261124-dtbs-marvell-v2-0-663009a769da@kernel.org>
Date: Fri, 27 Nov 2026 16:28:55 +0100
Message-ID: <87a4mu1efc.fsf@BLaptop.bootlin.com>
X-Mailing-List: devicetree@vger.kernel.org
List-Id: <devicetree.vger.kernel.org>
List-Post: <mailto:devicetree@vger.kernel.org>
List-Help: <mailto:devicetree+help@vger.kernel.org>
List-Subscribe: <mailto:devicetree+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:devicetree+unsubscribe@vger.kernel.org>
List-Owner: <mailto:devicetree+owner@vger.kernel.org>
Precedence: list
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Transfer-Encoding: quoted-printable
X-Last-TLS-Session-Version: TLSv1.3

"Rob Herring (Arm)" <robh@kernel.org> writes:

> Another batch of DT schema warning fixes for Marvell platforms. This
> fixes most of the remaining warnings on Marvell platforms.
>
> It's best if the whole series is taken together.
>
> Signed-off-by: Rob Herring (Arm) <robh@kernel.org>
> ---
> Changes in v2:
> - Update the system controller compatible strings to avoid using the old
>   legacy ones.=20
> - Drop patch dropping 'phy-supply'.
> - New patch to rework ac5-98dx25xx 'behind-32bit-controller@7f000000'=20
>   bus.
> - Link to v1: https://patch.msgid.link/20261111-dtbs-marvell-v1-0-938788a=
ff3ae@kernel.org
>
> ---
> Rob Herring (Arm) (9):
>       dt-bindings: mfd: Add Marvell AP806/CP110 system controller schema
>       arm64: dts: marvell: Add AP806/CP110 syscon compatibles
>       arm64: dts: marvell: Drop SPI max frequency
>       arm64: dts: marvell: armada-8040: Fix node names
>       arm64: dts: marvell: Fix w25q32 compatible strings
>       arm64: dts: marvell: Drop unused USB 'phy-names'
>       arm64: dts: marvell: cn9131-cf-solidwan: Drop st,m41t80 reset-gpios
>       arm64: dts: marvell: armada-3720-gl-mv1000: Add switch fixed-link
>       arm64: dts: marvell: ac5-98dx25xx: Rework 'behind-32bit-controller'=
 bus
>

All series applied on mvebu/dt64

Thanks,

Gregory



>  .../mfd/marvell,ap806-cp110-system-controller.yaml |  59 ++++++++++++
>  arch/arm64/boot/dts/marvell/ac5-98dx25xx.dtsi      | 101 +++++++++------=
------
>  .../boot/dts/marvell/armada-3720-gl-mv1000.dts     |   6 ++
>  .../dts/marvell/armada-8040-clearfog-gt-8k.dts     |   4 +-
>  arch/arm64/boot/dts/marvell/armada-8040-mcbin.dtsi |   2 +-
>  .../boot/dts/marvell/armada-8040-puzzle-m801.dts   |  10 +-
>  arch/arm64/boot/dts/marvell/armada-ap80x.dtsi      |   6 +-
>  arch/arm64/boot/dts/marvell/armada-cp11x.dtsi      |   6 +-
>  arch/arm64/boot/dts/marvell/cn9130-crb-A.dts       |   2 -
>  arch/arm64/boot/dts/marvell/cn9130-sr-som.dtsi     |   2 -
>  arch/arm64/boot/dts/marvell/cn9131-cf-solidwan.dts |   1 -
>  .../boot/dts/marvell/cn9131-db-comexpress.dtsi     |   4 +-
>  12 files changed, 127 insertions(+), 76 deletions(-)
> ---
> base-commit: 3191063649dbf7c0d0b768e1f3655e4c5fc6edb5
> change-id: 20261111-dtbs-marvell-3ae21c8ac47d
>
> Best regards,
> --=20=20
> Rob Herring (Arm) <robh@kernel.org>
>

--=20
Gr=C3=A9gory CLEMENT, Bootlin
Embedded Linux and Kernel engineering
https://bootlin.com
