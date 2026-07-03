Received: from out-180.mta1.migadu.com (out-180.mta1.migadu.com [95.215.58.180])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id B02231A267
	for <devicetree@vger.kernel.org>; Fri,  3 Jul 2026 17:37:37 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=95.215.58.180
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1783100260; cv=none; b=ZVYFM96TZ9A48H5pw7yYGmoWGpO/JaVz67jAsKzrWEFCyij/X3nP1WXIJa08wr2mQrs6q8/hEnX4Fr4fQbusPutxyi+rUJILHgfg9nmWPWCwhOCsdau+KQEJ/HkxMoW0RiglO599KKhAcAFxOz5lsH8ieB0arqnPsZSxdziAPFg=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1783100260; c=relaxed/simple;
	bh=KGI4eIa+Tc3+PYqIrsKEl5uD8wUoVjYR2VV1VEFx2wU=;
	h=Mime-Version:Content-Type:Date:Message-Id:Cc:Subject:From:To:
	 References:In-Reply-To; b=gcCHTsUB4D0gL84Ev/YLRbwffNcJ0EWrhxGcCezqUnSv70xMrvBkX5DLxwXunsr1Q0uYleXXVOGo69bNjJ+9TyIBsEEQCfokZedQKG1hCzNUBdnBgPuT2WKmJjkje8izRfDpTyP8i2TDaiiSAzqt3JINJ84r7EHJxYqmJ95XpsM=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=cknow-tech.com; spf=pass smtp.mailfrom=cknow-tech.com; dkim=pass (2048-bit key) header.d=cknow-tech.com header.i=@cknow-tech.com header.b=C2gvDjyW; arc=none smtp.client-ip=95.215.58.180
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=cknow-tech.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=cknow-tech.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=cknow-tech.com header.i=@cknow-tech.com header.b="C2gvDjyW"
Precedence: bulk
X-Mailing-List: devicetree@vger.kernel.org
List-Id: <devicetree.vger.kernel.org>
List-Subscribe: <mailto:devicetree+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:devicetree+unsubscribe@vger.kernel.org>
Mime-Version: 1.0
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=cknow-tech.com;
	s=key1; t=1783100255;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references;
	bh=PbkDpuoMBPcyBFEm988lbtXZYFu6aRBrtLIMJK35q3k=;
	b=C2gvDjyWf+uY2YButwXPZMYYNecozmKiTGL4jepsigtmA/Vep9MPoC54H7dI+6YbngNGwF
	EmWxLlGx9hXsNolKHhrd3o0vjszyLaJX6DZDC0Oqbupe/nW5gsDhXPVv+YklTcxQsTn3/u
	vfnvE8QhMilvjOHJKcGKB3oBYt01eb57UHay117sSK+oU5mV3NxjXEx6S0PsMIl+1A5+ui
	eK0IXGwIGLneVsGer+d9l+2h2z0wx/V3zaoE4Aa+vgfI2yYpwJ3IiuXwkl5YdpYyOFObCC
	INcVvGgDHGPc98FKGInmui3Q/igRN+H+XaBckc7+tcR9E3vlrd1q/8zWV9L20Q==
Content-Transfer-Encoding: quoted-printable
Content-Type: text/plain; charset=UTF-8
Date: Fri, 03 Jul 2026 19:37:14 +0200
Message-Id: <DJP4A331FN4E.3EI86SNT87QRP@cknow-tech.com>
Cc: "Rob Herring" <robh@kernel.org>, "Krzysztof Kozlowski"
 <krzk+dt@kernel.org>, "Conor Dooley" <conor+dt@kernel.org>, "Heiko
 Stuebner" <heiko@sntech.de>, <devicetree@vger.kernel.org>,
 <linux-arm-kernel@lists.infradead.org>,
 <linux-rockchip@lists.infradead.org>
Subject: Re: [PATCH 12/12] arm64: dts: rockchip: add support for NanoPi M6
 board
X-Report-Abuse: Please report any abuse attempt to abuse@migadu.com and include these headers.
From: "Diederik de Haas" <diederik@cknow-tech.com>
To: "Joachim Eastwood" <joachim.eastwood@gmail.com>, "Diederik de Haas"
 <diederik@cknow-tech.com>
References: <20260703-nanopi-m6-v1-0-8344a1559519@gmail.com>
 <20260703-nanopi-m6-v1-12-8344a1559519@gmail.com>
 <DJOWK4QYYMI1.F1TOWMR4BM22@cknow-tech.com>
 <CAPSPb=ustOuAkeWUL8x6aigO=5wkQUupZh2g5g0Pe=qTa3MeEA@mail.gmail.com>
In-Reply-To: <CAPSPb=ustOuAkeWUL8x6aigO=5wkQUupZh2g5g0Pe=qTa3MeEA@mail.gmail.com>
X-Migadu-Flow: FLOW_OUT

Hi Joachim,

On Fri Jul 3, 2026 at 7:14 PM CEST, Joachim Eastwood wrote:
> On Fri, 3 Jul 2026 at 13:34, Diederik de Haas <diederik@cknow-tech.com> w=
rote:
>> On Fri Jul 3, 2026 at 12:07 AM CEST, Joachim Eastwood via B4 Relay wrote=
:
>> > From: Joachim Eastwood <joachim.eastwood@gmail.com>
>> >
>> > The NanoPi M6 board shares most of the features of the R6 boards.
>> >
>> > Main differences:
>> > * M.2 M-key slot with PCIe (Also present on R6C)
>> > * M.2 E-key slot with PCIe and USB (from hub)
>> > * 1 additional USB 2.0 port from an on-board USB hub
>> > * RT5616 audio CODEC
>> >
>> > Signed-off-by: Joachim Eastwood <joachim.eastwood@gmail.com>
>> > ---
>>
>> [...]
>>
>> > +&i2c7 {
>> > +     clock-frequency =3D <200000>;
>> > +     status =3D "okay";
>> > +
>> > +     rt5616: codec@1b {
>> > +             compatible =3D "realtek,rt5616";
>> > +             reg =3D <0x1b>;
>> > +             clocks =3D <&cru I2S0_8CH_MCLKOUT>;
>> > +             clock-names =3D "mclk";
>> > +             #sound-dai-cells =3D <0>;
>> > +             assigned-clocks =3D <&cru I2S0_8CH_MCLKOUT>;
>>
>> s/I2S0_8CH_MCLKOUT/I2S0_8CH_MCLKOUT_TO_IO/ ?
>>
>> See these links for details:
>> https://lore.kernel.org/linux-rockchip/DJGDSS875DDO.22TYPVYK5X8KZ@cknow-=
tech.com/
>> https://git.kernel.org/pub/scm/linux/kernel/git/mmind/linux-rockchip.git=
/commit/?h=3Dv7.2-clk/fixes&id=3D946352b2f88fd2378f0341312e47dff1e8dc2fac
>
> Thanks for the feedback and pointers.
> I will use I2S0_8CH_MCLKOUT_TO_IO for the next version.
>
> Grepping through the other boards there doesn't seem to any other users
> of I2S0_8CH_MCLKOUT_TO_IO right now. But I assume the other boards
> will be converted over later(?)

That is indeed the idea; boards can(/should) be converted, ideally by someo=
ne
who has the board and can verify its result.

There's at least 'one' (or 3) being worked on ;-)
https://git.sr.ht/~diederik/linux-kernel/log/rk3588-nanopc-t6-plus

But for new boards, it's better to use the new _TO_IO variant.

Cheers,
  Diederik
