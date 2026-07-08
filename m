Received: from smtp.kernel.org (aws-us-west-2-korg-mail-alma10-1.taild15c8.ts.net [100.103.45.18])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 44CF83033D6
	for <devicetree@vger.kernel.org>; Wed,  8 Jul 2026 11:27:29 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=100.103.45.18
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1783510050; cv=none; b=ericeE9IfeIOcSisVtk4cX/4sZDDZQOvdMPdLDJeaWWODw9f6ws1BTvdjSzuh91PiQk6s+3hVtvGTO87Flits0PydBHqkaQSj25uomBFymO5F8ejRc7aDTWuc82RhMOfCwuK/l0Pp8Cct8jP94xFeIHHqrswO0Y+A5NybGCne5w=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1783510050; c=relaxed/simple;
	bh=+NWRZeKKbLmflwuLA/sw0azAOGUyzX2K3XWChgIEt7U=;
	h=From:Subject:To:Cc:In-Reply-To:References:Content-Type:Date:
	 Message-Id; b=jiFrap5SZkY50yGz1D4JlkMtGZf0mAY3zGmcqALZcC56sxOSQR3OrMkjRLFQ3hL/BZdnCPMZv/QildjKfKQtsV7jPW5rzMHMJvUangS3SSjBmzdP7bIPFzMUyjoqtDorsfEuJuHognMLU50LugQPeGeuV2PdRff374jlQx06Wvc=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=M3t43ADN; arc=none smtp.client-ip=100.103.45.18
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="M3t43ADN"
Received: by smtp.kernel.org (Postfix) with ESMTPSA id B36141F00A3A;
	Wed,  8 Jul 2026 11:27:28 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kernel.org;
	s=k20260515; t=1783510049;
	bh=y0SHJinBoo2VyZo9ieobG68uxOKcqom7MZ+JNs4a5Zg=;
	h=From:Subject:Reply-To:To:Cc:In-Reply-To:References:Date;
	b=M3t43ADNVWxhbv9ca369e5Zj5Uoj3lSyJWFp6oORPT56RB7cjkAQ9G5IdCeEov6p7
	 HuKwm8YCw07p69mqrhlt7O1VzQHxEmSN1oeFFoyBK9AbANkKGktbEWo5amQN5sWZB3
	 oO9jAz/YrJcuaSHNvRP1pBgtBdtn3O0zp9Lf7d50WdlDJFrp64EzlQLfWZLQKQebiR
	 7ap8br0AOu/TcHwMTyRBY2NVQ99rRxZLlTy/wHDk/cNp4Lrwsm/TtNAUmTUO3M9MwT
	 YoQveids/oaFnMEGhx0yZApzzLpAy8mIUt44vpvCS+7Z+tgV2XBv+6fI0Xnpcxcw2P
	 xkVAPJgUlmbAA==
From: sashiko-bot@kernel.org
Subject: Re: [PATCH 1/2] arm64: dts: mediatek: alias all enabled serial
 ports on Genio boards
Reply-To: sashiko-reviews@lists.linux.dev
To: "Carlo Caione" <ccaione@baylibre.com>
Cc: devicetree@vger.kernel.org, robh@kernel.org, conor+dt@kernel.org
In-Reply-To: <20260708-ccaione-genio-serial-aliases-v1-1-bf22229e9383@baylibre.com>
References: <20260708-ccaione-genio-serial-aliases-v1-0-bf22229e9383@baylibre.com>
 <20260708-ccaione-genio-serial-aliases-v1-1-bf22229e9383@baylibre.com>
Content-Type: text/plain; charset=utf-8
Content-Transfer-Encoding: quoted-printable
Date: Wed, 08 Jul 2026 11:27:28 +0000
Message-Id: <20260708112728.B36141F00A3A@smtp.kernel.org>
Precedence: bulk
X-Mailing-List: devicetree@vger.kernel.org
List-Id: <devicetree.vger.kernel.org>
List-Subscribe: <mailto:devicetree+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:devicetree+unsubscribe@vger.kernel.org>

Thank you for your contribution! Sashiko AI review found 1 potential issue(=
s) to consider:

Pre-existing issues:
- [High] Incomplete fix: mt8390-tungsten-smarc.dtsi leaves multiple enabled=
 UARTs without aliases, remaining vulnerable to the console probe-deferral =
race condition.
--

--- Patch [1]: [PATCH 1/2] arm64: dts: mediatek: alias all enabled serial p=
orts on Genio boards ---
commit e24717bbabf68ad0b7411bc7cc53b4c950007efe
Author: Carlo Caione <ccaione@baylibre.com>

arm64: dts: mediatek: alias all enabled serial ports on Genio boards

Only serial0 is aliased, so the remaining enabled uarts get first-free
line numbers. When the console uart defers on its clocks, another uart
can win line 0: console=3DttyS0 then ends up on the wrong connector and
the boot looks like a hang on the serial console, depending on probe
order. Alias every enabled uart so line numbers are stable.

[ ... ]

> diff --git a/arch/arm64/boot/dts/mediatek/mt8390-genio-common.dtsi b/arch=
/arm64/boot/dts/mediatek/mt8390-genio-common.dtsi
> index b0c97930a0e6c..26e24431d467d 100644
> --- a/arch/arm64/boot/dts/mediatek/mt8390-genio-common.dtsi
> +++ b/arch/arm64/boot/dts/mediatek/mt8390-genio-common.dtsi
> @@ -33,6 +33,8 @@ aliases {
>  		mmc0 =3D &mmc0;
>  		mmc1 =3D &mmc1;
>  		serial0 =3D &uart0;
> +		serial1 =3D &uart1;
> +		serial2 =3D &uart2;
>  	};

[Severity: High]
This isn't a bug introduced by this patch, but does this incomplete fix
leave other MT8390 boards vulnerable to the console probe-deferral race?

Looking at the aliases node in
arch/arm64/boot/dts/mediatek/mt8390-tungsten-smarc.dtsi:

	aliases {
		dsi0 =3D &disp_dsi0;
		ethernet0 =3D &eth;
[ ... ]
		rtc1 =3D &mt6359rtc;
		serial0 =3D &uart0;
	};

It fails to define serial1 =3D &uart1; and serial2 =3D &uart2; for the enab=
led
secondary UARTs. If the primary console UART (uart0) defers during probe
due to clock dependencies, can a secondary enabled UART (uart1 or uart2)
successfully probe before uart0 is ready and take the first available
unaliased line (ttyS0)?

[ ... ]

--=20
Sashiko AI review =C2=B7 https://sashiko.dev/#/patchset/20260708-ccaione-ge=
nio-serial-aliases-v1-0-bf22229e9383@baylibre.com?part=3D1
