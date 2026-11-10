Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=103.168.172.149
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1794299056;
	b=qCbI792+DJW4dHORVU8lNLxrYeJUlWV84GNjKKKCYmV5YKy1Y0oBMiehCXcndSu6U010
	 tEhcb0gb6vHThMh4b5TIuKVLrlL8du/u0JtVl+NupDgSPJ6W/Y0pDvR3dGxY4JreLfZsz
	 KMpQmqbtr3Mg/zXXi1Q8+KyZiPVixGJZwfJ9XJwPFRS1kGYuXl/7yB1tSKQ60Mq+Ng1uQ
	 sySDYAPaY7Og2v4bQYyUO3p3VjYUnvm1KjMrrFrLoW71zHwuihyVhtyCG9b0ArcsRw0lm
	 s9Gd8SpauczQIYuTlKkA+9aVj767bf0wdcP6zqEfxJWjVSBuGqw6yU3Yau1Vqqsu6dw==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1794299056;
	h=DMARC-Filter:Received:Received:DKIM-Signature:DKIM-Signature:
	 X-DKIM2-Info:DKIM2-Signature:X-DKIM2-Info:Message-Instance:
	 X-ME-Sender:X-ME-Proxy-Cause:X-ME-Proxy:Feedback-ID:Received:X-Mailer:
	 MIME-Version:X-ThreadId:Date:From:To:Cc:Message-Id:In-Reply-To:
	 References:Subject:Content-Type:Content-Transfer-Encoding;
	bh=pJ7kZ9nUY1FS8i9+F2Sr6CiD7I+mA4vNUnLZI2Bguvc=;
	b=i2omwFzW0pDyplgKxv7b20oxKKVek/M8UMbrbymaHrAbNW8A+61EkzNbAA04sjFvG3iX
	 +9w+/vJuK4mbGiGN80Su+pN/QByGJkywsQNoZOHb0MDmgjx62l93KIaL3nUNu9stXhIFO
	 70VEqZZiKe397sAqy7aLW6MQ0hSPPJvz0mMMAriBq2yXLlTEaV+gux/HN/hCxI3DyW7Lt
	 X8uTfyx7EIfSeP5gjUSWPKFU0Vb/E+E6XvYrbwbE/XqQ7aAcVcSRmMzwvkiU5WHxkzlJf
	 6HB7WcKmnydPu7obXQSGRR5FBJc37I8FPFw7l/JKgs9Gj48xRXmY7u7J7mmL8TySvuw==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=arndb.de;
	spf=pass smtp.mailfrom=arndb.de;
	dkim=pass header.d=arndb.de header.i=@arndb.de header.a=rsa-sha256 header.s=fm2 header.b=dNpiQxcm;
	dkim=pass header.d=messagingengine.com header.i=@messagingengine.com header.a=rsa-sha256 header.s=fm3 header.b=Q7HuxEpV;
	arc=none smtp.remote-ip=103.168.172.149
Received: from fout-a6-smtp.messagingengine.com (fout-a6-smtp.messagingengine.com [103.168.172.149])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id E5CEE606A31C
	for <devicetree@vger.kernel.org>; Tue, 10 Nov 2026 08:24:15 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org E5CEE606A31C
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=arndb.de
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=arndb.de
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key, unprotected) header.d=arndb.de header.i=@arndb.de header.a=rsa-sha256 header.s=fm2 header.b=dNpiQxcm;
	dkim=pass (2048-bit key, unprotected) header.d=messagingengine.com header.i=@messagingengine.com header.a=rsa-sha256 header.s=fm3 header.b=Q7HuxEpV
Received: from ams-compute-02.internal (ams-compute-02.internal [10.64.2.62])
	by mailfout.phl.internal (Postfix) with ESMTP id 1B0E2EC0591
	for <devicetree@vger.kernel.org>; Tue, 10 Nov 2026 03:24:15 -0500 (EST)
Received: from ams-imap-03 ([10.64.2.23])
  by ams-compute-02.internal (MEProxy); Tue, 10 Nov 2026 03:24:15 -0500
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=arndb.de; h=cc
	:cc:content-transfer-encoding:content-type:content-type:date
	:date:from:from:in-reply-to:in-reply-to:message-id:mime-version
	:references:reply-to:subject:subject:to:to; s=fm2; t=1794299045;
	 x=1794385445; bh=pJ7kZ9nUY1FS8i9+F2Sr6CiD7I+mA4vNUnLZI2Bguvc=; b=
	dNpiQxcm/LTlEH+ENPBJvoiFcYsHoAYRUPxxiWnMnZvx0bcOleaFPTnP4ajNucix
	iRbUa46O2NvgQ2gOC9ZH6JVUlLAWc0uALNMBhiOg+hq82+IiLP/bZMC6aCHNXCFb
	iJbsKTYmgzGwzt7ooDMT00ZpU3FV1jizbHO9Sl1dIXTNu1HXk0qjK3BoWqKRbUVL
	ShAR1NCT+Q9sQIGdiXxly6wOPRw4/oY4Ia0uOePastoa5MeGPlCq37HnA0yBIkGJ
	NSx3vOy9xbHXSVFswyN+1yPQR9odChV2+vB+v2mxwpr1vXh8Yqskj3uLhRlTiNGi
	SVLfC3XsTwaC2kRLLWKJXQ==
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=
	messagingengine.com; h=cc:cc:content-transfer-encoding
	:content-type:content-type:date:date:feedback-id:feedback-id
	:from:from:in-reply-to:in-reply-to:message-id:mime-version
	:references:reply-to:subject:subject:to:to:x-me-proxy
	:x-me-sender:x-me-sender:x-sasl-enc; s=fm3; t=1794299045; x=
	1794385445; bh=pJ7kZ9nUY1FS8i9+F2Sr6CiD7I+mA4vNUnLZI2Bguvc=; b=Q
	7HuxEpVd0l+Y1znEZuutAuPCK1IvS5vSA1eYwtm6S/V2FMpuNLY9ITRzSvVcg5MV
	rqtyqvCCyutLDbaNFvMsr4BUa9Vd+6Tcrdk6UKVfUJlK7/U/G47yVrYhNSoS2CXT
	WRs+pa/tBWsQLbxtHOS1sZCosn0MJ1y+XVI9zXwVHWY2m9r/0jKf1h2Xnmm4ewI5
	SAaXG9PalmiOv0EM4GtDG6V2GyvyUXRtLX5S+zcn9siKVgOnFAHnqlBWM8ToDkVg
	Gs4xfgslPooxfQbbR40RfmLAQOUsb+OdQue1x5M9STT34FNniEtq/6K2iexyYuWI
	ox+4Na261koKbSU/TxK+Q==
X-DKIM2-Info: draft=ietf-dkim-dkim2-spec-09;
	repo=github.com/dkim2wg/interop; date=2026-11-03; sw=lmtpprox;
	action=sign d=arndb.de a=rsa-sha256;
DKIM2-Signature: i=1; m=1; t=1794299045; d=arndb.de;
	mf=PGFybmRAYXJuZGIuZGU+;
	rt=PGRldmljZXRyZWVAdmdlci5rZXJuZWwub3JnPg==;
	s=fm2:rsa-sha256:l5PU4Nndu/iJxLFuGvPywTCcUDLLPFG9Aui0DU3I0Gz8esV
	gxl7evjsGBgQLL0rxvk+Spwhr7DShWMfKU029nbEzOFrv1ZznCSijQrtyacdzV9T
	Hyl4TtBiPb/06dpvzsyfqUEXG5d2DixDvq2rs39D8RjfesHmWRcfHyxun/ziEw66
	lheA1QJywlkyA5+ocKw5d0ESfiFpMDVLLOP0HU4BlHy9VEYhXOqvxuMx7MlJrQ5/
	/RWUOEutl+p8PUK6nU/qdrIHUielHNfBNItIxgvw1p6pIVFPwt84MTrfBJSxuL95
	UsrGnx7zkKZBs/HWBfBSQWom44ePoeV/sw/IrHw==;
X-DKIM2-Info: draft=ietf-dkim-dkim2-spec-09;
	repo=github.com/dkim2wg/interop; date=2026-11-03; sw=lmtpprox;
	action=mi-m=1; hc=12;
	hn=cc,content-transfer-encoding,content-type,date,feedback-id,
	from,in-reply-to,message-id,mime-version,references,subject,to;
Message-Instance: m=1; h=sha256:ktkt6ltiBGKbSI1Dv4eMdW/rPon5WRacUu/yJWvAbFM=:YHe1sRh1MG0Z87scZREWOS/U54FxdcAzg54EAvaJvyM=;
X-ME-Sender: <xms:ntTyai159Zd1TWTFb8disCIbX-ESvHK6iER0DnaW1P1yFFn3BPS-mA>
    <xme:ntTyav7ZbdXs1acK2ek2q1NrSAQLPptJX-kA8SrkFj68JoAnHM7cU2yl_W90tVrn7
    WR_lijJeUQiLGtL2zVu6nfC0xy6zkrgcMVB4S6oAxfS0J0zyo552yLD>
X-ME-Proxy-Cause: dmFkZTFhnp+eSghulVC5JWADloFkUjjFVGSalw0CVyEdMRmlAiSUDb7+3LfuLl3igcWhrv
    rxwikOVoj6lne5AbCik35y+9S6btewepACyIhyG90ycgGUYbwMNhaKkA64CoB4aB5y/I60
    cMtl1TZXAzhvHDdO2oMYLvai3+H6wMrcPNFHwTDXMM0Kjbs1XA9ZS6itTWdU5hRvnkUxkP
    ad4R+WVBoKTvmiH4LNLGAVG86/jTgDEkLgB7rX0PL5U6tW7XpOJEssncm/1a1JaF6CcvmG
    yiOpEF6KRUz+RDTu7fs+tbNhQq1fIT1ral92Q28jjJT9XIT/eDIUC6zbGzGKkpbK5czYTn
    afXL1tsd35fxMj8mT54b1hKMZ2BVznP2Oe4/mRFh5QYiPLqdxmd+XvPSiPbpXbEm2AcYjc
    bhmOSTCGNaDDZALeu7FHIoJuFeNryO3porVnFS8ZIn00T/dLZUnKvfst2bsbXg00go9Qzv
    OkAvBUz+QeTI5teT8YR+WF0CPD43gPElAaBPgnYQrXb3eERb15ZCfNzzxAZoAjF911X7Ub
    63csgRLyBuqOqcgACZHxmZ4yFF2i6FeVlEAXt5u3DQUrbCQRCCwpC9D6qBgEvStRMuL2KN
    k5sKSCWxkwfJsAeCeDWGoe4aMYJx4mZ5fdDMuJq8irFnYAcOsyTPP1OCPBpQ
X-ME-Proxy: <xmx:odTyavhCNDjOH-wzRpLquum4MOhNTbNjM5N-FMB7oUXl9n35geZwUQ>
    <xmx:odTyajrMwqZ1TsWy7i4c74538Rp37lQXTUfWB16cSovXoyoS6-u_2A>
    <xmx:odTyavQXrqvAhbwrt_LRb0k6nDLqtld5g-cuP37ngUj7rErjnNwBVA>
    <xmx:odTyakRQV5b1qZQl2gcWE6c267k7X66XhBWjbGCdpsHKSDQotltrig>
    <xmx:pdTyai6-zP5L2uLUegPSsdJ_F-fX7biOcPtSyo02lUVSD-CD1YdDA0Ij>
Feedback-ID: i56a14606:Fastmail
Received: by mailuser.ams.internal (Postfix, from userid 501)
	id 0680B32A0097; Tue, 10 Nov 2026 03:23:58 -0500 (EST)
X-Mailer: MessagingEngine.com Webmail Interface
X-Mailing-List: devicetree@vger.kernel.org
List-Id: <devicetree.vger.kernel.org>
List-Post: <mailto:devicetree@vger.kernel.org>
List-Help: <mailto:devicetree+help@vger.kernel.org>
List-Subscribe: <mailto:devicetree+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:devicetree+unsubscribe@vger.kernel.org>
List-Owner: <mailto:devicetree+owner@vger.kernel.org>
Precedence: list
MIME-Version: 1.0
X-ThreadId: A4QaHkHhrVgc
Date: Tue, 10 Nov 2026 09:23:27 +0100
From: "Arnd Bergmann" <arnd@arndb.de>
To: "Krzysztof Kozlowski" <krzk@kernel.org>,
 "Brian Masney" <masneyb@kernel.org>
Cc: "Long Zhao" <longzhao@ambarella.com>,
 "Alexandre Belloni" <alexandre.belloni@bootlin.com>, soc@lists.linux.dev,
 linux-arm-kernel@lists.infradead.org,
 "Michael Turquette" <mturquette@baylibre.com>,
 "Stephen Boyd" <sboyd@kernel.org>, "Jerome Brunet" <jbrunet@baylibre.com>,
 linux-clk@vger.kernel.org,
 "Andy Shevchenko" <andriy.shevchenko@linux.intel.com>,
 "Rob Herring" <robh@kernel.org>, "Krzysztof Kozlowski" <krzk+dt@kernel.org>,
 "Krzysztof Kozlowski" <krzysztof.kozlowski@oss.qualcomm.com>,
 "Conor Dooley" <conor+dt@kernel.org>,
 "Catalin Marinas" <catalin.marinas@arm.com>, "Will Deacon" <will@kernel.org>,
 devicetree@vger.kernel.org, "Long Zhao" <zl020895@163.com>,
 linux-kernel@vger.kernel.org, "Linus Walleij" <linusw@kernel.org>
Message-Id: <7eeaf54d-2d7d-420c-a34e-eebc6dd0effe@app.fastmail.com>
In-Reply-To: <20261110-interesting-hilarious-shark-2dbfc0@quoll>
References: <20261105-cv75-soc-v11-0-aa6ee0b2380d@ambarella.com>
 <179427375370.1061670.4050288038934218487.b4-review@b4>
 <20261110-interesting-hilarious-shark-2dbfc0@quoll>
Subject: Re: [PATCH v11 0/5] arm64: add Ambarella CV75 SoC support
Content-Type: text/plain
Content-Transfer-Encoding: 7bit

On Tue, Nov 10, 2026, at 09:02, Krzysztof Kozlowski wrote:
> On Mon, Nov 09, 2026 at 08:22:33PM -0500, Brian Masney wrote:

>> - I can then merge patches 3 and 5 into clk-pile.
>
> You will have code depending on non-exisitng ARCH_AMBARELLA symbol, but
> if that's fine for you then sure.
>
>> 
>> - The DTS folks will take patch 4.
>
> The entire platform is for SoC tree. This sounds ok for
> me, but I am not sure if Arnd was merging pulls with
> dependencies. If not, then worse case the arm64 bits will
> wait a cycle. Anyway, I guess you can take clock bits.

The way I usually handle new SoC families is to have
a separate branch for those beside the usual dt/driver/defconfig
updates, possibly for multiple new SoC families, and
possibly including required drivers. The idea is that
whatever we merge here has at least a chance to boot
into an initramfs with a console.

If it can boot without the clk driver, the easiest way
would be to just keep the clk and arch/arm64 bits
separate. If the clk driver is required to boot, I would
suggest having a branch with the two clk patches that
can get merged (not applied) into both the clk tree
and the soc/newsoc branch to put the other patches
on top. This would make sure we only have each commit
once, but still have a clean history that includes the
driver in both sides.

     Arnd
