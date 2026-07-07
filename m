Received: from gloria.sntech.de (gloria.sntech.de [185.11.138.130])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 6239433F390
	for <devicetree@vger.kernel.org>; Tue,  7 Jul 2026 19:11:14 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=185.11.138.130
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1783451477; cv=none; b=CBbgTWbmHPALzGLeuIIH+4VFMod1fl+Cu7rzaK5ocwIOJrqNrcBK+GvtZvkbD7hWrXuBo3c7hPVNNa4TlCaHpsuNmUjE7Yyj9UVgOdhpD7Ic/0f6jD13dVRyepPN7uTt2u8CpIhtLeWxZxzwT5/BKnQPXiBFgLbtrEmDr5CKHLQ=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1783451477; c=relaxed/simple;
	bh=CzSD/WRXSlgKfw1SIJ9ztQiHBCfypInUCvizihETDao=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version:Content-Type; b=TCYF2yup6/e3T4tPu+BNVlUZsbkKCIa/1BtOtLjVcc3ADCj9JCHFnFbnM7NseE/EGfwaZYhHoXforxUO5XzD+203qMdlpviofdEoTD8akOhsBR8MCEyUV6p1NZPXfIXJUnnktYMEo4uVMLpr73vkvUKT0ZZgfoSCS/I5Qps5jj0=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=sntech.de; spf=pass smtp.mailfrom=sntech.de; dkim=pass (2048-bit key) header.d=sntech.de header.i=@sntech.de header.b=0tNkP0sM; arc=none smtp.client-ip=185.11.138.130
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=sntech.de
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=sntech.de
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=sntech.de header.i=@sntech.de header.b="0tNkP0sM"
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed; d=sntech.de;
	s=gloria202408; h=Content-Type:Content-Transfer-Encoding:MIME-Version:
	References:In-Reply-To:Message-ID:Date:Subject:Cc:To:From:Reply-To;
	bh=CzSD/WRXSlgKfw1SIJ9ztQiHBCfypInUCvizihETDao=; b=0tNkP0sM9hr4FZjY++IN4eXAym
	vUXoSgMGph9rYpY5YQiICFxdvkb4gWX5CkBKDtyzVM95S6pBYN3Tg6g4mEHcUCkogYvGpdWjP4bW9
	D6xOzbUOg0NJZMg12EspXxOL9FEq0QPcmXEHq5mmSVwRlxEsyiGwE0t985yqwAbAXTlUUv56B1wxg
	Wko+DbvaIYA0Q07bIRq8H1ArSEHrkXFHBHUm1gLrtWzk8xnSeRU8fE+RJXY5KiqzDyLdHoZJ15+6v
	FS5nYLb1LZPj45gwqQa9ItRL6q5n1lTyXfUaAhjfu/Mz8dn13ZFXOsi4XTtX8pnUquUUPnHRef3GM
	E0IQcJVw==;
From: Heiko Stuebner <heiko@sntech.de>
To: Diederik de Haas <diederik@cknow-tech.com>,
 Joachim Eastwood <joachim.eastwood@gmail.com>
Cc: Rob Herring <robh@kernel.org>, Krzysztof Kozlowski <krzk+dt@kernel.org>,
 Conor Dooley <conor+dt@kernel.org>, devicetree@vger.kernel.org,
 linux-arm-kernel@lists.infradead.org, linux-rockchip@lists.infradead.org
Subject: Re: [PATCH 00/12] arm64: dts: rockchip: Add NanoPi M6 board
Date: Tue, 07 Jul 2026 21:11:10 +0200
Message-ID: <118899013.nniJfEyVGO@phil>
In-Reply-To:
 <CAPSPb=tZ1FenNfEM5P+DWcksKvpQjyQQjAWTRdyxb7=YYxY_rw@mail.gmail.com>
References:
 <20260703-nanopi-m6-v1-0-8344a1559519@gmail.com>
 <DJOWHH5K7P76.3JPJVO47K1SZE@cknow-tech.com>
 <CAPSPb=tZ1FenNfEM5P+DWcksKvpQjyQQjAWTRdyxb7=YYxY_rw@mail.gmail.com>
Precedence: bulk
X-Mailing-List: devicetree@vger.kernel.org
List-Id: <devicetree.vger.kernel.org>
List-Subscribe: <mailto:devicetree+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:devicetree+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: quoted-printable
Content-Type: text/plain; charset="utf-8"

Am Freitag, 3. Juli 2026, 22:23:32 Mitteleurop=C3=A4ische Sommerzeit schrie=
b Joachim Eastwood:
> Hi Diederik,
>=20
> On Fri, 3 Jul 2026 at 13:30, Diederik de Haas <diederik@cknow-tech.com> w=
rote:
> >
> > On Fri Jul 3, 2026 at 12:07 AM CEST, Joachim Eastwood via B4 Relay wrot=
e:
> > > This patch series add support for the NanoPi M6. This board is very
> > > similar to the NanoPi R6C and R6S boards which are already supported.
> > >
> > > Main differences:
> > > * M.2 M-key slot with PCIe (Also present on R6C)
> > > * M.2 E-key slot with PCIe and USB (from hub)
> > > * 1 additional USB 2.0 port from an on-board USB hub
> > > * RT5616 audio CODEC
> >
> > This seems to be the M6 (2405 aka 'V1')?
> Yes, correct. This patch set is for the original M6 board. V1 if you like.
>=20
> > Because there is now also a M6V2 (2603), which uses an ES8389 CODEC:
> > https://www.friendlyelec.com/index.php?route=3Dproduct/product&path=3D6=
9&product_id=3D319
> I did notice there was a new version, but I hadn't given it much thought.
>=20
> > Is it useful to already take the 2 M6 variants into account with this p=
atch set?
> Yes, I think you are right.
>=20
> How about this setup:
> rk3588s-nanopi-m6.dtsi
> rk3588s-nanopi-m6v1.dts
> rk3588s-nanopi-m6v2.dts
> This mimics the setup for the R6 series boards with rk3588s-nanopi-r6.dtsi
> and rk3588s-nanopi-r6[cs].dts.

yes, that would be the nicest way I think.

Thanks for taking this into account
Heiko


