Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=103.168.172.158
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1795097955;
	b=Xl5SBBGWros7DnwKF9t43arHNMhta+HdiZj3bBMt3ZsHJJApJQwx1B5JUDN5gFIUrthu
	 EfQ3pslm30YWVZuPgonmgWU9Q54sG45kNxQgsJ5Dr0/ZMH+Z56EEXMjpPvVafkSjcpCH1
	 woVTUeN8tYsPk6jgTNOWbTrWQmFxbNG/hTk6HCy9GrXWl6wqPoE4XK0hYEttOAB2RtOb8
	 ymeOwlqMkDUGBM0QxgX0RVdi7EoH3mYcwRih7sIr8ZMg+sESY+oHAvsKBzYPdf6QOBPf7
	 Zjf5y9tS11dziul9Ca5bnLOgmEmpwoIo3LP2LZIb4g5/2rkvm8HCm0cMg4QfBEWHGpQ==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1795097955;
	h=DMARC-Filter:Received:Received:DKIM-Signature:DKIM-Signature:
	 X-DKIM2-Info:DKIM2-Signature:X-DKIM2-Info:Message-Instance:
	 X-ME-Sender:X-ME-Proxy-Cause:X-ME-Proxy:Feedback-ID:Received:X-Mailer:
	 MIME-Version:X-ThreadId:Date:From:To:Cc:Message-Id:In-Reply-To:
	 References:Subject:Content-Type:Content-Transfer-Encoding;
	bh=01otf33RxSte8QwJA3GEyoCTItE4iig/ZqEIZE6AbO8=;
	b=rlQT2lyReF8Uh6DGUV58iVO0+FSwnkpFaDFSTAhw79weEZy5HiskM8E1KeKB+z4HV+nz
	 FzFWWdEhUtFDd0xokYx0/U3Xe+Ay5hDnYJlpZWtFKk3InNniNv3HOfoazLu34akMz7ztB
	 dEhNrTcAnWGhbztDVRKOCQlY5JKkQCxiMH34P4w7QjSCP3yds53rINkZgDTk7iJiAlVaK
	 YIEMmQX1SDK8XwkaNqlsBi49ajQiBolVTysy4C5UyOW+x/s+qCu+RsVVvVUf2QZrKTUHV
	 d2m8pLsPNhkSGyaxt9q8IbsUuTT28ke6Sv3eC8sDySpbQyxXIM3G843s0AYPPDFOdkg==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=arndb.de;
	spf=pass smtp.mailfrom=arndb.de;
	dkim=pass header.d=arndb.de header.i=@arndb.de header.a=rsa-sha256 header.s=fm2 header.b=EoIUktnj;
	dkim=pass header.d=messagingengine.com header.i=@messagingengine.com header.a=rsa-sha256 header.s=fm3 header.b=h2KrdnBD;
	arc=none smtp.remote-ip=103.168.172.158
Received: from fhigh-a7-smtp.messagingengine.com (fhigh-a7-smtp.messagingengine.com [103.168.172.158])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 9F925606A324
	for <devicetree@vger.kernel.org>; Thu, 19 Nov 2026 14:19:14 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org 9F925606A324
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=arndb.de
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=arndb.de
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key, unprotected) header.d=arndb.de header.i=@arndb.de header.a=rsa-sha256 header.s=fm2 header.b=EoIUktnj;
	dkim=pass (2048-bit key, unprotected) header.d=messagingengine.com header.i=@messagingengine.com header.a=rsa-sha256 header.s=fm3 header.b=h2KrdnBD
Received: from ams-compute-02.internal (ams-compute-02.internal [10.64.2.62])
	by mailfhigh.phl.internal (Postfix) with ESMTP id BFE5A1400177
	for <devicetree@vger.kernel.org>; Thu, 19 Nov 2026 09:19:13 -0500 (EST)
Received: from ams-imap-03 ([10.64.2.23])
  by ams-compute-02.internal (MEProxy); Thu, 19 Nov 2026 09:19:13 -0500
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=arndb.de; h=cc
	:cc:content-transfer-encoding:content-type:content-type:date
	:date:from:from:in-reply-to:in-reply-to:message-id:mime-version
	:references:reply-to:subject:subject:to:to; s=fm2; t=1795097944;
	 x=1795184344; bh=01otf33RxSte8QwJA3GEyoCTItE4iig/ZqEIZE6AbO8=; b=
	EoIUktnjNoXwzv8dS6zIUjbqeifiPckygpbEgoj6jRRcoK34T29u7nMhNhKYF9Ao
	ElQgRp6/UiJLdioJ1Uw9NXUq7InWrJaGXtRicuvCwlls4sPG1fy9/9w8de14d6Xz
	prFerkCzfFFyNUj0VQJ+Cf2CxZY8xlK+OQAIkBSQas51pKRvZ+vjIwkb2MXQ9eTw
	JZFc2e9hYG4Qh3ayGiM7DygA6+zYV2Bq3C7k+rjrTb6z41AgPe+FkYRRtKZNbrFR
	Qfvm9/6S8rXBlcbkmXKLRHhtY9t0y4/LJ+aam+11oeTEHiIEp2opVuqZOjrxkY5s
	+XnBwBeSuYGeoALqdmqasA==
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=
	messagingengine.com; h=cc:cc:content-transfer-encoding
	:content-type:content-type:date:date:feedback-id:feedback-id
	:from:from:in-reply-to:in-reply-to:message-id:mime-version
	:references:reply-to:subject:subject:to:to:x-me-proxy
	:x-me-sender:x-me-sender:x-sasl-enc; s=fm3; t=1795097944; x=
	1795184344; bh=01otf33RxSte8QwJA3GEyoCTItE4iig/ZqEIZE6AbO8=; b=h
	2KrdnBD4oHFdj0rLXsqfNDuxtnGUP1LJU9wXMuoBdjK/QRcMkLk+AJDyvGZ2H5Xr
	48tJ97KYUHNWFeyM5skPiEgwGj3pwCeu974bBNVs1CEev1RdXwl+Xs3+/Cax9Jmn
	i3TnZAp+mg7tXKmNIo33v+QH2mjFlfUZXMYIN9iv7HusnVkP6h74oXSuBMV7W8D+
	QOQa6v81f1H0N0/P55oyG9719WJJPyqU/e3BXpjJR77L8RHNRcfYvV9o3jGE7wX7
	AIFSJ67ZuUJHsEStMbTuapuPQManwvq6Cd7QNdbOliG8Z2WpH1HkNts0qSmBfls6
	YTrXsm+S+ZyvUsDy9ZT7A==
X-DKIM2-Info: draft=ietf-dkim-dkim2-spec-09;
	repo=github.com/dkim2wg/interop; date=2026-11-03; sw=lmtpprox;
	action=sign d=arndb.de a=rsa-sha256;
DKIM2-Signature: i=1; m=1; t=1795097944; d=arndb.de;
	mf=PGFybmRAYXJuZGIuZGU+;
	rt=PGRldmljZXRyZWVAdmdlci5rZXJuZWwub3JnPg==;
	s=fm2:rsa-sha256:iIHzuxl9ivBoHYL0eRbEOORXjfOPISCdMpOy+xv9Pf8wV/7
	5hJ07tg85kBiYgeeeaVPWHTqBxhvaqHQV+7fzPl9XB5vTDXyvq6YFh7ZRKRZtrTQ
	KWHfeE1uJYKbDrqslQ06NuMgJhrnposhB+oBpoy3EMbjSrPCf5EkjQljkggLwPTm
	R3EP8FHHEO3D4LUGEIjAwHYSrkwnV9LOUqMAiof7MX1VnfGAQoHBpYYNRRoTA/GE
	TY03WyE3+HEGSnqGKDRovfcIwBSAsXvUqb8etF7oh6bSksWX1Maa6uvmL9WILB+Z
	f+g0/y/xHV4V0T90Gr4lqVR6E7KbI7IHRwEvetg==;
X-DKIM2-Info: draft=ietf-dkim-dkim2-spec-09;
	repo=github.com/dkim2wg/interop; date=2026-11-03; sw=lmtpprox;
	action=mi-m=1; hc=12;
	hn=cc,content-transfer-encoding,content-type,date,feedback-id,
	from,in-reply-to,message-id,mime-version,references,subject,to;
Message-Instance: m=1; h=sha256:krR0+YczFIO3+zdXy7Z/za6sK29LTPNQ/dPu1fbwuUE=:wrF4KQUa30FhL8Dr9keH2zmryDL7ZnCEKnekfBbv8Pk=;
X-ME-Sender: <xms:UAX_aqUwwYD29dnpJKfOnOqiOeeYmLycCx51Wm7kuD7rCfg4ezzOFw>
    <xme:UAX_ahbIoC1FHKNXhWwlYyrtoGYG6NDcIafBcpMy1XDFy9PlgvU26tzm92-8QQUmf
    nwGCPwhmW-x9JRJ1fJtprwt4vDrkhCCZ3ElJaNNBTtgddvtEqurPMmV>
X-ME-Proxy-Cause: dmFkZTERVl3HBLVOrb/B5W9SlCiGjcntYqbjfg2rc15q2Ityk3ssPrEgzYujGztlf0+i5y
    IUePtGtYcnB/oLsKiZjiV9ueq+oUrcMKwKJTDDqxuPSA/hy/FzPBrOKEcnLDWsbGzDryD9
    Zg2g9MKRlsfGLNeDKBJjkfK6s7NMH7UNYZ1eklYmKbno76Im0PjniL5ON/XVUGePe810Lf
    CQZIof1fML+kMgA208+AsvWtltCKuIDdFaCpFOAd7MCUoa/+TmRphnpjHilFEddz3Bk4Pj
    J4ICYtjHSS4AVOVCSDLUmQ3hWo8yqZ8bbxZsj8jM19cSWbJWi6uwTJLEghGJx01Fkmo2aQ
    JWkIMc+IzNqIgGCokQFd6rtQfeU/H9NOcj86/7PGyNR47Iq5ERKUDJPD0/dX7+2Pczq+cQ
    DHWPzBfYOke+EsTg8eEpWMH1X+cbPwywgCFSzVBCePBDne0z74e+y46Wpnm2y7RCppAbsE
    6xkC4pU+s2LwHUVGWzSC6viDczmwndPe7y1YDFaeJ+qWsVHmH5pfpOvv6WSzW8oslzvApA
    bISG02sOsFYEvdO5nq3Yzd3ZX+GXyIW5MslSF3U06KM6NA2quAwNJWkseqHCG/Mc4l7s3D
    cuILIX4Y2T/8DXDGBxUqYcB1/n/pTANF8nbNX4gwHawqOLMsipIvdVUXAulA
X-ME-Proxy: <xmx:VAX_aolMXSEpB77rIdMNX6Sq20r5bJvHfE0yr2-ifV9atgGlX1bj5Q>
    <xmx:VAX_alADAXppjckRX-rOXY3QsRH9NwwF9Zvxqx3SskCN6nIayoEI2w>
    <xmx:VAX_arLB30Ba-F0LXA5lIoXGOV_V6KNAv33Xgyx4azBpodr9T5bZoQ>
    <xmx:VAX_agxsLKnP0wF2ZPyiHy_qXWqwmJkxhT4jXtBqAjcvKcrJim1Alw>
    <xmx:WAX_atkZJp_YLsE5qL5ixsu0-xtRySH1ySqOzfHN1s8DsOLObf2lzhMq>
Feedback-ID: i56a14606:Fastmail
Received: by mailuser.ams.internal (Postfix, from userid 501)
	id D0F9D32A0099; Thu, 19 Nov 2026 09:18:56 -0500 (EST)
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
X-ThreadId: A-12XcIUUc5R
Date: Thu, 19 Nov 2026 15:18:26 +0100
From: "Arnd Bergmann" <arnd@arndb.de>
To: "Long Zhao" <longzhao@ambarella.com>,
 "Krzysztof Kozlowski" <krzk@kernel.org>,
 "Alexandre Belloni" <alexandre.belloni@bootlin.com>, soc@lists.linux.dev,
 linux-arm-kernel@lists.infradead.org,
 "Michael Turquette" <mturquette@baylibre.com>,
 "Stephen Boyd" <sboyd@kernel.org>
Cc: "Jerome Brunet" <jbrunet@baylibre.com>, linux-clk@vger.kernel.org,
 "Brian Masney" <masneyb@kernel.org>,
 "Andy Shevchenko" <andriy.shevchenko@linux.intel.com>,
 "Rob Herring" <robh@kernel.org>, "Krzysztof Kozlowski" <krzk+dt@kernel.org>,
 "Krzysztof Kozlowski" <krzysztof.kozlowski@oss.qualcomm.com>,
 "Conor Dooley" <conor+dt@kernel.org>,
 "Catalin Marinas" <catalin.marinas@arm.com>, "Will Deacon" <will@kernel.org>,
 devicetree@vger.kernel.org, "Long Zhao" <zl020895@163.com>,
 linux-kernel@vger.kernel.org, "Linus Walleij" <linusw@kernel.org>
Message-Id: <1148990d-dfa6-489d-99f8-4bf4417b2c4c@app.fastmail.com>
In-Reply-To: <20261119-cv75-soc-v12-0-e5a03cca8b05@ambarella.com>
References: <20261119-cv75-soc-v12-0-e5a03cca8b05@ambarella.com>
Subject: Re: [PATCH v12 0/6] arm64: add Ambarella CV75 SoC support
Content-Type: text/plain
Content-Transfer-Encoding: 7bit

On Thu, Nov 19, 2026, at 11:13, Long Zhao via B4 Relay wrote:
> Add the Ambarella CV75 SoC and EVK support: the board binding, the
> RCT clock binding and driver, ARCH_AMBARELLA, the devicetree and
> MAINTAINERS.
>
> Apply the patches in this order:
>
> 1. board binding
> 2. RCT clock binding and clock ID header
> 3. ARCH_AMBARELLA
> 4. RCT clock driver
> 5. CV75 SoC and EVK device tree, plus defconfig
> 6. MAINTAINERS
>
> The ambarella vendor prefix and the CV75 secure scratchpad syscon
> binding are already in linux-next. This series does not repeat
> either of them.
>
> GPIO, UART and pinctrl bindings and drivers are separate series.
> This devicetree references those compatibles.
>
> Tested on the CV75 EVK. The board boots. That boot used a local tree
> that also includes the GPIO, UART and pinctrl patches.

I merged this into the soc/newsoc branch now, which may get
additional SoCs from other vendors for the merge window. This
should be in linux-next starting tomorrow.

I also pushed the contents out in two branches:

https://git.kernel.org/pub/scm/linux/kernel/git/soc/soc.git/log/?h=newsoc/ambarella

contains all six patches, while

https://git.kernel.org/pub/scm/linux/kernel/git/soc/soc.git/log/?h=ambarella/common

contains only the first three and can be merged into the other
subsystems. As expected, I got warnings about the uart and gpio
device bindings not being present, as they are getting merged
through other trees:

WARNING: DT compatible string "ambarella,cv75-uart" appears un-documented -- check ./Documentation/devicetree/bindings/
#152: FILE: arch/arm64/boot/dts/ambarella/cv75.dtsi:76:
+				compatible = "ambarella,cv75-uart", "snps,dw-apb-uart";

WARNING: DT compatible string "ambarella,cv75-gpio" appears un-documented -- check ./Documentation/devicetree/bindings/
#177: FILE: arch/arm64/boot/dts/ambarella/cv75.dtsi:101:
+				compatible = "ambarella,cv75-gpio", "arm,primecell";

     Arnd
