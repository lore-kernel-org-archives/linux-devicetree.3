Received: from gloria.sntech.de (gloria.sntech.de [185.11.138.130])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 56A49211466;
	Sat, 27 Jun 2026 10:06:46 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=185.11.138.130
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1782554808; cv=none; b=nQMG+kbkr1YivsF55xeb6NXFOtHUdsuft89Y3NpQ+6Hz8igQrRJtUkfMK/baptKc3Hd6gSNEPNCS7ZoQKN3xJZV/16NUpP3eqVxRMSXK7fO/nHBS3Zxs7JM9VZyAFo0bGJnIUnEtxRyKYbn9eUCvLKWv5Zz/XKpA2IvKGeZc8YQ=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1782554808; c=relaxed/simple;
	bh=HnXZE2BGgHpN1ydt6fHo0oeITB2RYr+DCqDexeWneIY=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version:Content-Type; b=evGeDPudmNRb2LL3s6shMckiwlAf88DG8LiRoTWeZ2eFcieTEMqFVNl435YdneYEBl71J5uD5yPuJqZ64Q3gDbV7OeK7fhI5yPdbik4taiKiqt9pLTQDbm+kFVpeNQUhB+jXOvZRYeJS2YYEsy/YNRChR2saL569kHGBAnanqro=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=sntech.de; spf=pass smtp.mailfrom=sntech.de; dkim=pass (2048-bit key) header.d=sntech.de header.i=@sntech.de header.b=vJsYREIE; arc=none smtp.client-ip=185.11.138.130
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=sntech.de
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=sntech.de
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=sntech.de header.i=@sntech.de header.b="vJsYREIE"
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed; d=sntech.de;
	s=gloria202408; h=Content-Type:Content-Transfer-Encoding:MIME-Version:
	References:In-Reply-To:Message-ID:Date:Subject:Cc:To:From:Reply-To;
	bh=eSxG+0Qg7/F1OJdh0uQRGtMrVTwzrmRupcfCq3GTC4Y=; b=vJsYREIEKhJTKXk6PO0NetGKm1
	VYXWRdXUfNdwL15Zr6rFb4XYQmKwssoRR+CR0O1tMVVKFJ3tCByYe4j5h+RgY4WF9E1aeBT5e87Gq
	lXQXW/MNJFiDtwu+N335ivsg71NJL00mmoPHmk1sjC9DtnqG3aFmYyMdCH6nvyCC2df7x+ZoVdwEI
	LxhmZaBbWZkkWBGDHaL/dMcC6W4FPlBSmVxG2KCaG2SLI0g96Mcao18+1gQJ2QM+n1jXsrxe+q9s5
	C6YWXYQaYSCaRLnyfgDik3jPuo50VmX1RJ3hvHJ+R5qtY3nYxysdrmi/0FiFywFDf+skE9aw1mKB9
	fnfsXeGg==;
From: Heiko =?UTF-8?B?U3TDvGJuZXI=?= <heiko@sntech.de>
To: linux-rockchip@lists.infradead.org, devicetree@vger.kernel.org,
 linux-arm-kernel@lists.infradead.org, linux-kernel@vger.kernel.org,
 Hrushiraj Gandhi <hrushirajg23@gmail.com>
Cc: robh@kernel.org, krzk+dt@kernel.org, conor+dt@kernel.org,
 Hrushiraj Gandhi <hrushirajg23@gmail.com>
Subject:
 Re: [PATCH 0/2] arm64: dts: rockchip: Add Vicharak Vaaman2 board support
Date: Sat, 27 Jun 2026 12:06:43 +0200
Message-ID: <8106243.lvqk35OSZv@diego>
In-Reply-To: <1999863.IobQ9Gjlxr@diego>
References:
 <20260627094854.81564-1-hrushirajg23@gmail.com> <1999863.IobQ9Gjlxr@diego>
Precedence: bulk
X-Mailing-List: devicetree@vger.kernel.org
List-Id: <devicetree.vger.kernel.org>
List-Subscribe: <mailto:devicetree+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:devicetree+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: quoted-printable
Content-Type: text/plain; charset="utf-8"

Am Samstag, 27. Juni 2026, 12:05:35 Mitteleurop=C3=A4ische Sommerzeit schri=
eb Heiko St=C3=BCbner:
> Hi,
>=20
> Am Samstag, 27. Juni 2026, 11:48:52 Mitteleurop=C3=A4ische Sommerzeit sch=
rieb Hrushiraj Gandhi:
> > This patch series adds device tree support for the Vicharak Vaaman2,
> > a single-board computer based on the Rockchip RK3588 SoC.
>=20
> please use proper versioning when sending new patches
>=20
> If I'm reading this correctly, this should be
>=20
> [PATCH v3 0/2] ....

correction .. v2 ;-)

The other was the Axon board.

>=20
> Please also provide a changelog on what changed between versions.
> See all the other patchsets on the mailinglist for reference.
>=20
> Heiko
>=20
> > The Vaaman2 board features include:
> > - RK3588 SoC
> > - eMMC storage and microSD support
> > - RK806 PMIC and multiple RK8602/RK8603 regulators
> > - Real-time clock and status LED
> > - UART serial console and SARADC
> >=20
> > Note: This series was generated on top of the pending Vicharak Axon
> > board support patches (v7) and includes the Axon entry in the context
> > of the YAML binding patch.
> >=20
> > Patch 1 adds the binding documentation for the Vaaman2 board.
> > Patch 2 adds the actual device tree file and Makefile entry.
> >=20
> > Hrushiraj Gandhi (2):
> >   dt-bindings: arm: rockchip: Add Vicharak Vaaman2
> >   arm64: dts: rockchip: Add Vicharak Vaaman2 board
> >=20
> >  .../devicetree/bindings/arm/rockchip.yaml     |   5 +
> >  arch/arm64/boot/dts/rockchip/Makefile         |   1 +
> >  .../dts/rockchip/rk3588-vicharak-vaaman2.dts  | 547 ++++++++++++++++++
> >  3 files changed, 553 insertions(+)
> >  create mode 100644 arch/arm64/boot/dts/rockchip/rk3588-vicharak-vaaman=
2.dts
> >=20
> >=20
>=20
>=20




