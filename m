Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=100.103.45.18
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1795654111;
	b=CEIZPi+MiNeO/aqBQRZm3MlD/zmNuNf0HrkbicHWj+q94Aqsm/SLSvJ9gNmaHm58i92L
	 H1OS4ahEW5WeScq8ptVD+iOP8GFhmhhEyFiZ9zAEb81t4bBbCQ9zAdKm9TxoAV0qWk5iF
	 o02ho/zbYViT+oXd73ccXgsJnfUhf52StXS9Ot15DAwz0KTkupuLBOT3CMhosdokaiURS
	 kEuSJQWK+hzJkN1M4GD19Wjyz5jXJ6PSm4ZuEoAY0zjqdEGd0lSbBI5jJuvLWwd5Ubwhh
	 WfGaVHeLO96S+m+WEZARQ8bXxTcXfaqTMUxO2Aoihm54b78aD7N/vqws7lpWAQBQ7lA==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1795654111;
	h=Received:DKIM-Signature:Message-ID:From:Subject:Reply-To:To:Cc:
	 In-Reply-To:References:Content-Type:Content-Transfer-Encoding:Date;
	bh=VqmiSTmYxrQoWuRsuvKjcG5xO/7EjZCUfPgZljSpIJU=;
	b=vqOYdvhiR7V5S4dCmB+Z4ohaNF6BkwaU6PR4MngfjBt/fRDZgsTv4iJhIkBI/TR5cUNN
	 1+1P2lBF+0Cq+skvXscJgoWHUkx3c0NvIadPRiGfoOhSbXQFWvY/L4KIAhnHeNuGftXJt
	 aADthLMq7Uu8bvRmAP9JHfNxqq1zA41AyvBEF78Hq411cnqx0UAEWkUubvbgnBOMPk+3k
	 9LcmhVrnQ4J3N/Bk7r9EJLtsjWh63PjplrtVD8RUIhyyK4herVh31xGUyIChE7T5YX/sA
	 CdIGZag34RcQLFfiuWEuvL7NBi0uVpPR4oRbl8TjMOLQ7h7+ngAPGyokCO434wJ68KA==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dkim=pass header.d=kernel.org header.i=@kernel.org header.a=rsa-sha256 header.s=k20260515 header.b=kRpk91S7;
	arc=none smtp.remote-ip=100.103.45.18
Received: from smtp.kernel.org (quasi.space.kernel.org [100.103.45.18])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 71EA0606A31E
	for <devicetree@vger.kernel.org>; Thu, 26 Nov 2026 00:48:31 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.a=rsa-sha256 header.s=k20260515 header.b=kRpk91S7
Received: by smtp.kernel.org (Postfix) with ESMTPSA id C98F91F000ED;
	Thu, 26 Nov 2026 00:48:30 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kernel.org;
	s=k20260515; t=1795654111;
	bh=VqmiSTmYxrQoWuRsuvKjcG5xO/7EjZCUfPgZljSpIJU=;
	h=From:Subject:Reply-To:To:Cc:In-Reply-To:References:Date;
	b=kRpk91S73bs+X05VY1fEI5BQ89g98mu0JJXmp67HVP/Tqcp8hzrMBEy70emXVxWJG
	 itdqV/r2A93Qp9e1P4BxH/piogedkVDoR8p7eZNCOlxRrxb6o4bCY7kMLTBGkWiytN
	 ZVakxwCgED1LNJunfCXQttAU/N2PXfS/fGz6p8KiD1OCOjzBr9B7JzCh9UflCE9RiU
	 rEwhmqguecGzf4XY3N8ywAleeXXM9lSDUbRbELMNJVIwejuvgNT8oNIYjRffwQ9JIT
	 1daVGnC/yerJRu6wryy4OQfTnQ/pOpiyFVm5HBz5BJUN13+jCIhVak1ftsf6HpZoP+
	 nzw0zBBrBn5CA==
Message-ID: <sashiko-outbox-234500@kernel.org>
From: sashiko-bot@kernel.org
Subject: Re: [PATCH 20/20] ARM: dts: ux500: Connect the AB8500 ULP PLL
 supply
Reply-To: sashiko-reviews@lists.linux.dev
To: "Linus Walleij" <linusw@kernel.org>
Cc: devicetree@vger.kernel.org, robh@kernel.org, conor+dt@kernel.org
In-Reply-To: <20261126-ux500-dts-after-powerdomains-v1-20-791cd62d8870@kernel.org>
References: <20261126-ux500-dts-after-powerdomains-v1-0-791cd62d8870@kernel.org>
 <20261126-ux500-dts-after-powerdomains-v1-20-791cd62d8870@kernel.org>
Content-Type: text/plain; charset=utf-8
Content-Transfer-Encoding: quoted-printable
Date: Thu, 26 Nov 2026 00:48:30 +0000
X-Mailing-List: devicetree@vger.kernel.org
List-Id: <devicetree.vger.kernel.org>
List-Post: <mailto:devicetree@vger.kernel.org>
List-Help: <mailto:devicetree+help@vger.kernel.org>
List-Subscribe: <mailto:devicetree+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:devicetree+unsubscribe@vger.kernel.org>
List-Owner: <mailto:devicetree+owner@vger.kernel.org>
Precedence: list

Thank you for your contribution! Sashiko AI review found 1 potential
issue to consider:
- [Medium] ARM: dts: ux500: undocumented and unused vintcore-supply on
  ab8500_clock
--

commit da09fb76db4a45fe111bfab60f65ea5efd602e97
Author: Linus Walleij <linusw@kernel.org>

ARM: dts: ux500: Connect the AB8500 ULP PLL supply

This commit adds the vintcore-supply property pointing to
ab8500_ldo_intcore_reg on the ab8500_clock node in ste-ab8500.dtsi.

> diff --git a/arch/arm/boot/dts/st/ste-ab8500.dtsi b/arch/arm/boot/dts/st/=
ste-ab8500.dtsi
> index 03cee37ae4783..30c3870c6cea1 100644
> --- a/arch/arm/boot/dts/st/ste-ab8500.dtsi
> +++ b/arch/arm/boot/dts/st/ste-ab8500.dtsi
> @@ -34,6 +34,7 @@ ab8500 {
>  				ab8500_clock: clock-controller {
>  					compatible =3D "stericsson,ab8500-clk";
>  					#clock-cells =3D <1>;
> +					vintcore-supply =3D <&ab8500_ldo_intcore_reg>;
>  				};

[Severity: Medium]
Does adding vintcore-supply to clock-controller break dtbs_check against
Documentation/devicetree/bindings/mfd/stericsson,ab8500.yaml?

In stericsson,ab8500.yaml, the clock-controller node sets
additionalProperties: false and only allows compatible and #clock-cells,
so all AB8500 board device trees will fail schema validation without a
binding update.

The stericsson,ab8500-clk driver in drivers/clk/ux500/abx500-clk.c also
does not request or enable vintcore-supply when registering or gating
ulpclk, and the sibling arch/arm/boot/dts/st/ste-ab8505.dtsi defines the
same clock-controller and ab8500_ldo_intcore_reg nodes without this
property.

--=20
Sashiko AI review =C2=B7 https://sashiko.dev/#/patchset/20261126-ux500-dts-=
after-powerdomains-v1-0-791cd62d8870@kernel.org?part=3D20
