Received: from gloria.sntech.de (gloria.sntech.de [185.11.138.130])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 4B90D382F01;
	Mon, 30 Mar 2026 08:28:13 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=185.11.138.130
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1774859297; cv=none; b=BbntPzIDorHZGKp3qXClhACraRa46v2dhQphtpnMfHgwkwXrIkcc+a1qjN2YWsi27I/yaqGVTjaGn7c73y2+x2FB9lcSdZqQxZd2qrImAOqEG2btwF5D4WU95P30KHUAkOF9vvWx/OaaS0phoA+HnU540bveDJsCiUk687iUnyg=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1774859297; c=relaxed/simple;
	bh=/+3Ho70scmMY0l1174Jc0V5ZPFuRAeYgT9Dg8UWlO+o=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version:Content-Type; b=R7lWVCrHDL+RWAEQmE/V9zkJ5OllmJHJ/A3AGB1QZItyT+pOmW5GpG5pAd/4kfxxSQKw1FLLLAFt3UKy7sBESGw0H1APBJaPq/FrRIbFw0Rz9pWmbrCuDvBtB8mWl8HpxVnIEbLJGcXi98XkOQ0b2beDd2JbWXLz36yKDfPhKgc=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=sntech.de; spf=pass smtp.mailfrom=sntech.de; dkim=pass (2048-bit key) header.d=sntech.de header.i=@sntech.de header.b=PwF6o3Bu; arc=none smtp.client-ip=185.11.138.130
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=sntech.de
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=sntech.de
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=sntech.de header.i=@sntech.de header.b="PwF6o3Bu"
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed; d=sntech.de;
	s=gloria202408; h=Content-Type:Content-Transfer-Encoding:MIME-Version:
	References:In-Reply-To:Message-ID:Date:Subject:Cc:To:From:Reply-To;
	bh=IWDxnURTi+IF8/iD9M37ASLzznD8KgRMZxGLGGi0MIw=; b=PwF6o3Bus4nqDZmEr/pMzIT22J
	cHfd1EIWui1UH5vO2QOorMssuZJ2Dd+kF8s0DHsXcOXkSM7RbdTalDnd735//E5P1Yti+6YjnhZv/
	5zPB7X25VbAw/OQzLPETrJDw9kkSjgmnL1k9CjnCgOT5oQEf7eSEN+WyhAofuwnplR7+h2Js/6Ahc
	BJREJ6pAUjAXqVJgMDKgw2c0gys1jAUwcrmMynoqJbsYzhrRn12lJzzagV+d7zqrs6QX60wfMl3v3
	GrnLKJnas26fbqcy6YestrjuvOi5Lxdsq8bK6gn8W1HWeHXLmReGzbnzqUZUJNgxn/FaK8jle9kav
	4wAoCBYA==;
From: Heiko Stuebner <heiko@sntech.de>
To: =?UTF-8?B?6LCi6Ie06YKmIChYSUUgWmhpYmFuZyk=?= <Yeking@red54.com>,
 linux-rockchip@lists.infradead.org, Krzysztof Kozlowski <krzk@kernel.org>
Cc: Rob Herring <robh@kernel.org>, Krzysztof Kozlowski <krzk+dt@kernel.org>,
 Conor Dooley <conor+dt@kernel.org>, Kever Yang <kever.yang@rock-chips.com>,
 Finley Xiao <finley.xiao@rock-chips.com>, devicetree@vger.kernel.org,
 linux-arm-kernel@lists.infradead.org, linux-kernel@vger.kernel.org
Subject: Re: [PATCH] arm64: dts: rockchip: Add RK3562 serial aliases
Date: Mon, 30 Mar 2026 10:27:52 +0200
Message-ID: <1954782.CQOukoFCf9@phil>
In-Reply-To: <9b3ee9e9-d44d-49b1-81ac-9c3806dc0efb@kernel.org>
References:
 <tencent_4BED6C3FFB8102B4BB3D08D6F47F2CCFC908@qq.com>
 <9b3ee9e9-d44d-49b1-81ac-9c3806dc0efb@kernel.org>
Precedence: bulk
X-Mailing-List: devicetree@vger.kernel.org
List-Id: <devicetree.vger.kernel.org>
List-Subscribe: <mailto:devicetree+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:devicetree+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: quoted-printable
Content-Type: text/plain; charset="utf-8"

Am Samstag, 28. M=C3=A4rz 2026, 16:08:57 Mitteleurop=C3=A4ische Sommerzeit =
schrieb Krzysztof Kozlowski:
> On 28/03/2026 14:05, =E8=B0=A2=E8=87=B4=E9=82=A6 (XIE Zhibang) wrote:
> > This fixes the stdout-path in rk3562-evb2-v10.dts.
> >=20
> > Fixes: ceb6ef1ea900 ("arm64: dts: rockchip: Add RK3562 evb2 devicetree")
> > Signed-off-by: =E8=B0=A2=E8=87=B4=E9=82=A6 (XIE Zhibang) <Yeking@Red54.=
com>
> > ---
> >  arch/arm64/boot/dts/rockchip/rk3562.dtsi | 10 ++++++++++
> >  1 file changed, 10 insertions(+)
> >=20
> > diff --git a/arch/arm64/boot/dts/rockchip/rk3562.dtsi b/arch/arm64/boot=
/dts/rockchip/rk3562.dtsi
> > index e4816aa3dae0..14e74e8ac7df 100644
> > --- a/arch/arm64/boot/dts/rockchip/rk3562.dtsi
> > +++ b/arch/arm64/boot/dts/rockchip/rk3562.dtsi
> > @@ -26,6 +26,16 @@ aliases {
> >  		gpio2 =3D &gpio2;
> >  		gpio3 =3D &gpio3;
> >  		gpio4 =3D &gpio4;
> > +		serial0 =3D &uart0;
> > +		serial1 =3D &uart1;
> > +		serial2 =3D &uart2;
> > +		serial3 =3D &uart3;
> > +		serial4 =3D &uart4;
> > +		serial5 =3D &uart5;
> > +		serial6 =3D &uart6;
> > +		serial7 =3D &uart7;
> > +		serial8 =3D &uart8;
> > +		serial9 =3D &uart9;
>=20
> UART aliases are properties of the boards, not SoC.

We had this argument a lot of times for those numbered aliases
where everything on all soc documentation, schematics and also
user documentation for individual boards, generally references
exactly those numbers :-)

But fiiiiiine, if it comes up all the time ...

I really hope, you're okay with intermitend ordering though:

	serial0 =3D &uart0;
	serial2 =3D &uart2;
	serial5 =3D &uart5;

because otherwise, this would cause pure chaos everywhere.

Because as I said this serial number is used on board-schematics,
board-user-level documentation, SoC documentation, even silcscreen
on boards ... so everywhere.

Similar for all the numbered busses ofthe SoCs.


Heiko



