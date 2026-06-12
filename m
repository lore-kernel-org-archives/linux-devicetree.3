Received: from codeconstruct.com.au (pi.codeconstruct.com.au [203.29.241.158])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 141DB2FD1CA;
	Fri, 12 Jun 2026 06:42:56 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=203.29.241.158
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1781246579; cv=none; b=cTvnatuWk3f6Ro7j690iYzgeMr2R74l2RaMw/VfoptDb0gCRg1k/abQtn8W2K3LuS5xdsVdOX6xIjVaXM5O+6zjqvl3u6kKQdBAoZHXLN5u/1FYa5jYRmCPcOvq1n/Sb347zFeuxXlJIe1y6Jtij6ntMEShzDzCF4hSyRyvo2q4=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1781246579; c=relaxed/simple;
	bh=aQ7NPvW21A0AuWMZ6hlNS1Fsd5TWjDus7fgr6XY/uQ0=;
	h=Message-ID:Subject:From:To:Cc:Date:In-Reply-To:References:
	 Content-Type:MIME-Version; b=pQpVRibxxJiFX0qtdY9ZP9DnLlKpwdJSvWXcXX+I3xS2dB2bQ7OQcDkW5e2vuQKRdp9BEUhZHuETt4fL9kUORMns/PQuDoy8G00s3+tXSJdkrtRJf6y7jnC2o6zCG8c0qT8kDORO+kuRsaDPv1kgjUmoM/xRKi/O2yxXQx8rqkI=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=codeconstruct.com.au; spf=pass smtp.mailfrom=codeconstruct.com.au; dkim=pass (2048-bit key) header.d=codeconstruct.com.au header.i=@codeconstruct.com.au header.b=V7d4Q44P; arc=none smtp.client-ip=203.29.241.158
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=codeconstruct.com.au
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=codeconstruct.com.au
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=codeconstruct.com.au header.i=@codeconstruct.com.au header.b="V7d4Q44P"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=codeconstruct.com.au; s=2022a; t=1781246569;
	bh=FWJYhiXqUMaYD6VeHN0j6mrscoHhjJw3Gq3j4k/FXLw=;
	h=Subject:From:To:Cc:Date:In-Reply-To:References;
	b=V7d4Q44PZOFAp2+7I7SwTT38ul/YbkTQd29va1hkNaH+zYcBobk7RogEOG2YbLVjl
	 K4uDyb9qwqOkpcPju15Khs68B+MFbXitLbTpHJlZil1TZu0K2DEnOGhFTzpEWc3lzt
	 eo3mS85M3neABGJ04Cqbbxs6rafta//qTCN2H8WCHcQv3ty+oyiSsinE4epJgdTRUV
	 IuYGhuAPsHkWFRufboSGJ+F0wULuG9fYPOK3NBYJLX+rTLwCkkIffodn8voB7uRYts
	 OXGeyQ7Fhgr5eiPEYgK9dopGq23+zCj1XGUOPLgWfUQnljeK2vTBJKZGAbOPK6T1fR
	 kMhVRBbkiH8CA==
Received: from [192.168.68.117] (unknown [180.150.112.11])
	by mail.codeconstruct.com.au (Postfix) with ESMTPSA id E6A3C60931;
	Fri, 12 Jun 2026 14:42:46 +0800 (AWST)
Message-ID: <b226339bb2abe42ce23e90eadbc654b426131083.camel@codeconstruct.com.au>
Subject: Re: [PATCH] arm64: dts: aspeed: Fix duplicate pinctrl labels and
 address scheme
From: Andrew Jeffery <andrew@codeconstruct.com.au>
To: Ryan Chen <ryan_chen@aspeedtech.com>, Rob Herring <robh@kernel.org>, 
 Krzysztof Kozlowski
	 <krzk+dt@kernel.org>, Conor Dooley <conor+dt@kernel.org>, Joel Stanley
	 <joel@jms.id.au>, Arnd Bergmann <arnd@arndb.de>
Cc: devicetree@vger.kernel.org, linux-arm-kernel@lists.infradead.org, 
	linux-aspeed@lists.ozlabs.org, linux-kernel@vger.kernel.org
Date: Fri, 12 Jun 2026 16:12:45 +0930
In-Reply-To: <20260611-dtsi_fix-v1-1-ef2b7cd86d6d@aspeedtech.com>
References: <20260611-dtsi_fix-v1-1-ef2b7cd86d6d@aspeedtech.com>
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable
User-Agent: Evolution 3.56.2-0+deb13u1 
Precedence: bulk
X-Mailing-List: devicetree@vger.kernel.org
List-Id: <devicetree.vger.kernel.org>
List-Subscribe: <mailto:devicetree+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:devicetree+unsubscribe@vger.kernel.org>
MIME-Version: 1.0

Hi Ryan,

On Thu, 2026-06-11 at 14:50 +0800, Ryan Chen wrote:
> Fix duplicate pinctrl_tach{0-15} and pinctrl_n{cts,dcd,dsr,ri}5 labels
> in aspeed-g7-soc1-pinctrl.dtsi.
>=20
> Drop the cpu-index from secondary/tertiary container nodes: reduce the
> "#address-cells" from 2 to 1 and update ssp_nvic/tsp_nvic unit-address
> and reg accordingly. Also remove URL comments from the DTS.
>=20
> Suggested-by: Andrew Jeffery <andrew@codeconstruct.com.au>
> Fixes: e77bb5dc5759 ("arm64: dts: aspeed: Add initial AST27xx SoC device =
tree")
> Signed-off-by: Ryan Chen <ryan_chen@aspeedtech.com>
> ---
> This series contains follow-up fixes for the AST27xx DTS support that
> was merged into linux-next (e77bb5dc5759).
>=20
> Two issues were identified after merge by Andrew Jeffery during review
> of the pending v11 series:

These were identified by the sashiko bot, not so much by me, as I
hadn't got around to looking at the patches at the time. I did comment
in the replies though:

https://lore.kernel.org/all/20260609025708.ADBFE1F00893@smtp.kernel.org/

Separately, the series at hand was v9, so any subsequent revision would
have been v10, not v11. This isn't significant on its own, but it is
another contribution to the collection of small errors that are
accumulating at this point, which concerns me. Please take care.

>=20
> 1. Duplicate pinctrl state labels in aspeed-g7-soc1-pinctrl.dtsi caused
> =C2=A0=C2=A0 dtc to abort with fatal label-redefinition errors.

However, it didn't. soc/dt @=C2=A0564edaca1486 ("Merge tag 'sunxi-dt-for-
7.2-2' of https://git.kernel.org/pub/scm/linux/kernel/git/sunxi/linux
into soc/dt"), which includes the v9 patches at e77bb5dc5759 ("arm64:
dts: aspeed: Add initial AST27xx SoC device tree"), builds without
error.

Why? Well, the report from sashiko appears misleading. Usually
duplicate labels do cause an error, for example:

   $ cat dle.dts
   /dts-v1/;
   / {
           inner: test1 {
                   prop-inner;
           };
           inner: test1 {
                   prop-inner;
           };
   };
   $ dtc -o /dev/null dle.dts
   dle.dts:6.15-8.4: ERROR (duplicate_node_names): /test1: Duplicate node n=
ame
   ERROR: Input tree has errors, aborting (use -f to force output)
  =20
   $ cat dle-1.dts
   /dts-v1/;
   / { };
   &{/} {
           inner: test0 {
                   prop-inner;
           };
           inner: test1 {
                   prop-inner;
           };
   };
   $ dtc -o /dev/null dle-1.dts
   dle-1.dts:8.15-10.4: ERROR (duplicate_label): /test1: Duplicate label 'i=
nner' on /test1 and /test0
   ERROR: Input tree has errors, aborting (use -f to force output)

However, a relatively minimal reproduction of the case at hand is:

   $ cat dlu.dts
   /dts-v1/;
   / { };
   &{/} {
           inner: test1 {
                   prop-inner;
           };
           inner: test1 {
                   prop-inner;
           };
   };
   $ dtc -o /dev/null dlu.dts
   $

This doesn't error out. I recommend not assuming reports from the bot
are entirely accurate. Please test that its claims make sense before
proceeding.

While it's not good that there were duplicate nodes and labels, it is
good that you've tidied them up.

If there are modifications to the aspeed-g7-soc*-pinctrl.dtsi files in
the future, I ask that you them sorted first so we can minimise the
chance of falling into this trap again. The current order seems fairly
haphazard and likely contributed to the oversight.

>=20
> 2. The synthetic container nodes (secondary, tertiary) for sub-processor

I'm not sure synthetic is the right word here. We're still describing
the hardware, just components that have their own distinct address
spaces.

On a separate note, if you feel the need to make a list when describing
the change (e.g. in the commit message or patch notes) it's usually an
indicator that the change should be split into separate commits. Please
keep this in mind for future changes.

> =C2=A0=C2=A0 interrupt controllers used a 2-cell address scheme to encode=
 a
> =C2=A0=C2=A0 <cpu-index reg-base> tuple.=C2=A0 Since the cpu-index adds n=
o value for
> =C2=A0=C2=A0 nodes that are purely phandle anchors, Andrew requested we d=
rop it
> =C2=A0=C2=A0 and use the bare register address instead.
> ---
> =C2=A0arch/arm64/boot/dts/aspeed/aspeed-g7-a35.dtsi=C2=A0=C2=A0=C2=A0=C2=
=A0=C2=A0 |=C2=A0 14 ++-
> =C2=A0.../boot/dts/aspeed/aspeed-g7-soc1-pinctrl.dtsi=C2=A0=C2=A0=C2=A0 |=
 102 ---------------------
> =C2=A02 files changed, 6 insertions(+), 110 deletions(-)
>=20
> diff --git a/arch/arm64/boot/dts/aspeed/aspeed-g7-a35.dtsi b/arch/arm64/b=
oot/dts/aspeed/aspeed-g7-a35.dtsi
> index ef283d95649a..58193c3c3696 100644
> --- a/arch/arm64/boot/dts/aspeed/aspeed-g7-a35.dtsi
> +++ b/arch/arm64/boot/dts/aspeed/aspeed-g7-a35.dtsi
> @@ -84,32 +84,30 @@ l2: l2-cache0 {
> =C2=A0	};
> =C2=A0
> =C2=A0	secondary {
> -		#address-cells =3D <2>;
> -		/* https://git.kernel.org/pub/scm/linux/kernel/git/torvalds/linux.git/=
tree/drivers/of/address.c?h=3Dv6.16#n491=C2=A0*/
> +		#address-cells =3D <1>;
> =C2=A0		#size-cells =3D <0>;
> -		/* https://git.kernel.org/pub/scm/linux/kernel/git/torvalds/linux.git/=
tree/drivers/of/address.c?h=3Dv6.16#n430=C2=A0*/
> =C2=A0
> -		ssp_nvic: interrupt-controller@1,e000e100 {
> +		ssp_nvic: interrupt-controller@e000e100 {
> =C2=A0			compatible =3D "arm,v7m-nvic";
> =C2=A0			#interrupt-cells =3D <2>;
> =C2=A0			#address-cells =3D <0>;
> =C2=A0			interrupt-controller;
> -			reg =3D <1 0xe000e100>;
> +			reg =3D <0xe000e100>;

Some other cleanups to consider are ensuring the property ordering
conforms to the DTS coding style:

   https://docs.kernel.org/devicetree/bindings/dts-coding-style.html#order-=
of-properties-in-device-node

The following grep is likely helpful:

   git grep -C1 -F 'compatible =3D' arch/arm64/boot/dts/aspeed

Andrew
