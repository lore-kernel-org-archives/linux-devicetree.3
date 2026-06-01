Received: from smtpout-04.galae.net (smtpout-04.galae.net [185.171.202.116])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 8230833ADAD
	for <devicetree@vger.kernel.org>; Mon,  1 Jun 2026 08:08:07 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=185.171.202.116
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1780301289; cv=none; b=V/Rkoa3i484WqgYPQflk1yyiw+zPANbFFKXd7PIPoK6e5fOpHVhX/Pp5YKBhAwXC8d1zDGLpZmlpHvfEgXLxbuOMEHMKgx4Lh2spmjr4uJHZW/ZZVZp4xsdF+Noi1cidvMFF28KeMqyoVWBKwzYM0/BCZZts4IsKpF1xtahDvZE=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1780301289; c=relaxed/simple;
	bh=PSXfO/IcWwSo3e3tzUFIFNZzInz67sy+6t6mf/M69LM=;
	h=From:To:Cc:Subject:In-Reply-To:References:Date:Message-ID:
	 MIME-Version:Content-Type; b=pFDTOrfDidfTC5CMToi+HaVBEkW4KhqATmuI6HcsW+CE2SAqBDkeFn85DTzCCJqGc5YOZZtjmpZAkvDvIfEiTw/SViIBzNCCSPcwY1KGqrnw/j/vIsdnYXcm+N2lfM7m0FHmBEPjVb0GbyJ3V3KFqlPHVz09O6v9BGck1MWRI4c=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=bootlin.com; spf=pass smtp.mailfrom=bootlin.com; dkim=pass (2048-bit key) header.d=bootlin.com header.i=@bootlin.com header.b=VP4ResRh; arc=none smtp.client-ip=185.171.202.116
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=bootlin.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=bootlin.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=bootlin.com header.i=@bootlin.com header.b="VP4ResRh"
Received: from smtpout-01.galae.net (smtpout-01.galae.net [212.83.139.233])
	by smtpout-04.galae.net (Postfix) with ESMTPS id 04B48C6247E;
	Mon,  1 Jun 2026 08:08:08 +0000 (UTC)
Received: from mail.galae.net (mail.galae.net [212.83.136.155])
	by smtpout-01.galae.net (Postfix) with ESMTPS id 153D2602AB;
	Mon,  1 Jun 2026 08:08:06 +0000 (UTC)
Received: from [127.0.0.1] (localhost [127.0.0.1]) by localhost (Mailerdaemon) with ESMTPSA id 8C7ED1088805A;
	Mon,  1 Jun 2026 10:08:01 +0200 (CEST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=bootlin.com; s=dkim;
	t=1780301285; h=from:subject:date:message-id:to:cc:mime-version:content-type:
	 content-transfer-encoding:in-reply-to:references;
	bh=7TivDAliLqNja1df1hxZ5aF3MEDj9hFJr+hYTLChCQM=;
	b=VP4ResRhgkhmp7jlvX1TMKeoc+wG63phGoZfOIqZdqtI2Yn9HiUetRA1gu0OBzMtaPC5iE
	5z7pCWJ3dy0WIDQ31MZ9Ympy55M28K0LRZx9z1OGdmw/XPa1ucvcH4uYwk5u/u67Xpw87R
	KfwIivyR6A1Gs3Q5vXbSS4Oy7nC3ed2N639JPmFnRP+lNE+8Sun6Otcm2+7aeT+D0l0/Oz
	Y1PGRzHY4yfXP2KwniHe3CP2ClgbRoN6wTQTmd5YMpRt0RIXKwLincQldg7D7ScxruOBvN
	nLQ2lAEXzOrA6WHBy76+dqfWHAs2XHyjVyHQVOybYjL6Qq2k4YC/Q1DlsrQ0AQ==
From: Gregory CLEMENT <gregory.clement@bootlin.com>
To: Aleksander Jan Bajkowski <olek2@wp.pl>, andrew@lunn.ch,
 sebastian.hesselbarth@gmail.com, robh@kernel.org, krzk+dt@kernel.org,
 conor+dt@kernel.org, linux-arm-kernel@lists.infradead.org,
 devicetree@vger.kernel.org, linux-kernel@vger.kernel.org
Cc: Aleksander Jan Bajkowski <olek2@wp.pl>
Subject: Re: [PATCH] arm64: dts: marvell: armada-37xx: mark EIP97 as
 dma-coherent
In-Reply-To: <20260524124456.350659-1-olek2@wp.pl>
References: <20260524124456.350659-1-olek2@wp.pl>
Date: Mon, 01 Jun 2026 10:08:00 +0200
Message-ID: <87zf1eznrz.fsf@BLaptop.bootlin.com>
Precedence: bulk
X-Mailing-List: devicetree@vger.kernel.org
List-Id: <devicetree.vger.kernel.org>
List-Subscribe: <mailto:devicetree+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:devicetree+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Transfer-Encoding: quoted-printable
X-Last-TLS-Session-Version: TLSv1.3

Hello Aleksander,

> Armada 37xx has coherent bus, similar to Armada 7k/8k. Cache
> synchronization consumes a lot of CPU cycles. Enabling coherent DMA
> increases IOPS performance up to 4 times. Some numbers:
> 					Data length
> Algo		MB	   16	  64	 128	 256	1024	1424	4096
> DES-ECB		1	+21 %	+5 %	+5 %	+7 %	+7 %	+3 %	+20 %
> AES-ECB-128	1	+21 %	+6 %	+6 %	+6 %	+9 %	+8 %	+22 %
> AES-CBC-128	1	+21 %	+5 %	+5 %	+5 %	+6 %	+7 %	+23 %
> AES-CBC-256	1	+23 %	+7 %	+8 %	+6 %	+11 %	+13 %	+20 %
>
> 					Data length
> Algo		MB	    16	    64	   256	  512	  1024	 1420	 4096	 8192
> AES-GCM-128	1	 +44 %	 +42 %	 +31 %	 +32 %	 +27 %	+30 %	+32 %	+30 %
> AES-GCM-128	8	+319 %	+326 %	+163 %	+148 %	 +75 %	+72 %	+74 %	+41 %
> AES-GCM-128	4096	+123 %	+128 %	 +90 %	 +83 %	+116 %	+59 %	+38 %	+28 %
>
> 					Data length
> Algo		MB	   16	   64	  256	 1024	 2048	 4096	 8192
> MD5		1	+21 %	+15 %	+29 %	+25 %	+50 %	+16 %	+20 %
> SHA1		1	+24 %	+22 %	+27 %	+22 %	+18 %	+20 %	+20 %
> SHA256		1	+30 %	+24 %	+25 %	+26 %	+21 %	+41 %	+19 %
> SHA512		1	 +4 %	 +3 %	 +8 %	+10 %	+24 %	+10 %	+11 %
>
> Tested on Armada 3720. Platform passes testmgr selftests.
>
> Signed-off-by: Aleksander Jan Bajkowski <olek2@wp.pl>

I'm surprised that we didn't enable it when submitting the support for
Armada 3700, but indeed the datasheet mentions I/O coherency support. I
didn't see any specific register to configure it. Moreover, if none of
the tests failed, we can assume that the bus is indeed coherent.

Applied on mvebu/dt64

Thanks,

Gregory


> ---
>  arch/arm64/boot/dts/marvell/armada-37xx.dtsi | 1 +
>  1 file changed, 1 insertion(+)
>
> diff --git a/arch/arm64/boot/dts/marvell/armada-37xx.dtsi b/arch/arm64/bo=
ot/dts/marvell/armada-37xx.dtsi
> index 360fc24fdde2..8418777042b8 100644
> --- a/arch/arm64/boot/dts/marvell/armada-37xx.dtsi
> +++ b/arch/arm64/boot/dts/marvell/armada-37xx.dtsi
> @@ -437,6 +437,7 @@ crypto: crypto@90000 {
>  				interrupt-names =3D "ring0", "ring1", "ring2",
>  						  "ring3", "eip", "mem";
>  				clocks =3D <&nb_periph_clk 15>;
> +				dma-coherent;
>  			};
>=20=20
>  			rwtm: mailbox@b0000 {
> --=20
> 2.53.0
>

--=20
Gr=C3=A9gory CLEMENT, Bootlin
Embedded Linux and Kernel engineering
https://bootlin.com
