Received: from gloria.sntech.de (gloria.sntech.de [185.11.138.130])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 9FF9D211466;
	Sat, 27 Jun 2026 10:05:51 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=185.11.138.130
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1782554754; cv=none; b=O2VWH2dXe8wH0M4pbRZjd5sRo4UjrE0WhFXYk099r4ZnMHfvPe6k8joUvcVi0siTkHX3U1RapdWgpXUbRFKKC2wbpzeUWVJuwnHqfEsmVF7x8R5XdrQZFwH0m0iqGN0buX7P3IAac9E8MJEqH2uCJIu6TBA2nW3pvdw253MHPKI=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1782554754; c=relaxed/simple;
	bh=iSdkoO2coFDA5RoXMnT+6QkJIk4cUomYH5ua2nc+mlc=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version:Content-Type; b=ssbQvUX5fCZZBLHNVVdNyPPrN2tLcKVj4a8bIvs/z4/RxK7yP+oFAWPuozBcC0JHOF7v0mhDh/Nw7bnZDt6o7Zl2vRSQs2jrY/GqpoRBVszRDcLo0izMY29MnCsQ3i7dsi9rio4jWChxDDRAVAKW9EAjbjKonRxH0634BUFNv7A=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=sntech.de; spf=pass smtp.mailfrom=sntech.de; dkim=pass (2048-bit key) header.d=sntech.de header.i=@sntech.de header.b=ozaG4J1l; arc=none smtp.client-ip=185.11.138.130
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=sntech.de
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=sntech.de
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=sntech.de header.i=@sntech.de header.b="ozaG4J1l"
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed; d=sntech.de;
	s=gloria202408; h=Content-Type:Content-Transfer-Encoding:MIME-Version:
	References:In-Reply-To:Message-ID:Date:Subject:Cc:To:From:Reply-To;
	bh=OSZiqCMi+0GOi5/NyLhgrD2BbljRo1J+9NIzBrNt8S4=; b=ozaG4J1l9KKqY3skznNd64asbi
	e7FQ6bgTfkBS0KujkIDeFNPsue0H4a2o7wC80hRh1jNAMbtDnzs74cM6JGY1r1GYS6Qee8S1jI4C+
	AjhHVddQXda1nuZgT7N4E8Iz58YsVWuaH5mYWh1iGZLUvpGIfRi45M6rHPgqQ7E0nIUV+G768cbYz
	E1lkr9FBKYRYeIwcFnN8TvWQrxyEZ8qKeJOaRSBnriZt1tx7bHmAeS4zVbxSlE8HoambdXUncQlP8
	iEbaeTQ0knPWf6BqwPpkbBboy9GFBegBvO5d7ssHepis5ugdqy/jsGe1zHx6ZfffLtH+Gv6UpAVJE
	esbW+ALQ==;
From: Heiko =?UTF-8?B?U3TDvGJuZXI=?= <heiko@sntech.de>
To: linux-rockchip@lists.infradead.org, devicetree@vger.kernel.org,
 linux-arm-kernel@lists.infradead.org, linux-kernel@vger.kernel.org,
 Hrushiraj Gandhi <hrushirajg23@gmail.com>
Cc: robh@kernel.org, krzk+dt@kernel.org, conor+dt@kernel.org,
 Hrushiraj Gandhi <hrushirajg23@gmail.com>
Subject:
 Re: [PATCH 0/2] arm64: dts: rockchip: Add Vicharak Vaaman2 board support
Date: Sat, 27 Jun 2026 12:05:35 +0200
Message-ID: <1999863.IobQ9Gjlxr@diego>
In-Reply-To: <20260627094854.81564-1-hrushirajg23@gmail.com>
References: <20260627094854.81564-1-hrushirajg23@gmail.com>
Precedence: bulk
X-Mailing-List: devicetree@vger.kernel.org
List-Id: <devicetree.vger.kernel.org>
List-Subscribe: <mailto:devicetree+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:devicetree+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: quoted-printable
Content-Type: text/plain; charset="utf-8"

Hi,

Am Samstag, 27. Juni 2026, 11:48:52 Mitteleurop=C3=A4ische Sommerzeit schri=
eb Hrushiraj Gandhi:
> This patch series adds device tree support for the Vicharak Vaaman2,
> a single-board computer based on the Rockchip RK3588 SoC.

please use proper versioning when sending new patches

If I'm reading this correctly, this should be

[PATCH v3 0/2] ....

Please also provide a changelog on what changed between versions.
See all the other patchsets on the mailinglist for reference.

Heiko

> The Vaaman2 board features include:
> - RK3588 SoC
> - eMMC storage and microSD support
> - RK806 PMIC and multiple RK8602/RK8603 regulators
> - Real-time clock and status LED
> - UART serial console and SARADC
>=20
> Note: This series was generated on top of the pending Vicharak Axon
> board support patches (v7) and includes the Axon entry in the context
> of the YAML binding patch.
>=20
> Patch 1 adds the binding documentation for the Vaaman2 board.
> Patch 2 adds the actual device tree file and Makefile entry.
>=20
> Hrushiraj Gandhi (2):
>   dt-bindings: arm: rockchip: Add Vicharak Vaaman2
>   arm64: dts: rockchip: Add Vicharak Vaaman2 board
>=20
>  .../devicetree/bindings/arm/rockchip.yaml     |   5 +
>  arch/arm64/boot/dts/rockchip/Makefile         |   1 +
>  .../dts/rockchip/rk3588-vicharak-vaaman2.dts  | 547 ++++++++++++++++++
>  3 files changed, 553 insertions(+)
>  create mode 100644 arch/arm64/boot/dts/rockchip/rk3588-vicharak-vaaman2.=
dts
>=20
>=20




