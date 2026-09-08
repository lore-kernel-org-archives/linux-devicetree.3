Received: from smtp.kernel.org (aws-us-west-2-korg-mail-alma10-1.taild15c8.ts.net [100.103.45.18])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 5126051E420
	for <devicetree@vger.kernel.org>; Tue,  8 Sep 2026 11:17:50 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=100.103.45.18
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1788866275; cv=none; b=Drb2R0r1x4O7QlLn/IgbNMILHHN8UoK/yExTDtN1W+NR4byRYReK9ukln1WtukXnn6V2+w4e9c2YvoehJ5YhbDtW4qkmkLw2+5k6dzRmaaHIDACQWk1/IgJybPVXm4LwSG0iNyyFgD24+W2Qq+cr5Um3CmZfaw3NsX+F3Iq8MZo=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1788866275; c=relaxed/simple;
	bh=GfnlMwPTgUmccSO6EFqq7WzJlcW+k3KtYJufG5t0O44=;
	h=From:Subject:To:Cc:In-Reply-To:References:Content-Type:Date:
	 Message-Id; b=FOxSjJyO6/95IG/YxaHyk+XCyI97cLC4H7ZpDKqYVJI28uqaCfnAJLQUFMOuaW5jjNQ5rh0UVOsm694zpNcNDrkUIWz8eVaauaVfqOOYV4ceJLE2CjQhrkmkhnDXA1ToFZMeM73P87KTxa4fW9H0AlTKhtwAMZ0TptRdTkytP50=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=YM5oSijT; arc=none smtp.client-ip=100.103.45.18
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="YM5oSijT"
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 5A1DB1F00A3A;
	Tue,  8 Sep 2026 11:17:46 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kernel.org;
	s=k20260515; t=1788866266;
	bh=7WerRF0RmeufOKgk6DYuDq+dOMUjYdWC9aSFWlEeo+I=;
	h=From:Subject:Reply-To:To:Cc:In-Reply-To:References:Date;
	b=YM5oSijTmV5LmSwTfT6pCA0sZp3kfi+TLw+v+UENTTqvprpdYg6cQnKVW3lV5hgtH
	 OZKZO1c+Cf/sWOVy4JOhDP+GaIC8Crd6RQNem8sIe5EZAvM3I95QpljBcTe91m186z
	 sQewALpKCWIcJKQHlywtQr2rroN7q/FDZrUKmVuF+KbPhJvYflT9zh6X/hYfWpK0z4
	 R8okQtkm8WaH0rEQ/zsiTGONAq+XYFsw3A6cPg8xLJdwnesaZsSgVZuNFme0Q3YaX3
	 CGHA2LXGxRF24I07jWdvLCbbDqeZ+HIAe7fOv/7JpulZZ79hnDKCTjW1AcUwoJqqZu
	 m2+7yD4r3enhg==
From: sashiko-bot@kernel.org
Subject: Re: [PATCH v2 1/1] ARM: dts: draeger: Add socfpga devicetree for
 Draeger's M48 board.
Reply-To: sashiko-reviews@lists.linux.dev
To: "Petko Manolov" <petko.manolov@konsulko.com>
Cc: robh@kernel.org, conor+dt@kernel.org, devicetree@vger.kernel.org
In-Reply-To: <20260908111011.960876-2-petko.manolov@konsulko.com>
References: <20260908111011.960876-1-petko.manolov@konsulko.com>
 <20260908111011.960876-2-petko.manolov@konsulko.com>
Content-Type: text/plain; charset=utf-8
Content-Transfer-Encoding: quoted-printable
Date: Tue, 08 Sep 2026 11:17:45 +0000
Message-Id: <20260908111746.5A1DB1F00A3A@smtp.kernel.org>
Precedence: bulk
X-Mailing-List: devicetree@vger.kernel.org
List-Id: <devicetree.vger.kernel.org>
List-Subscribe: <mailto:devicetree+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:devicetree+unsubscribe@vger.kernel.org>

Thank you for your contribution! Sashiko AI review found 1 potential issue(=
s) to consider:
- [Low] Undocumented and invalid property 'bank-name' is used in 'snps,dw-a=
pb-gpio-port' child nodes.
--

commit 47ed41fa3ef1281bd4bccc254d37939ac832d285
Author: Petko Manolov <petko.manolov@konsulko.com>

ARM: dts: draeger: Add socfpga devicetree for Draeger's M48 board.

This commit adds a new device tree for the Draeger M48 board, based on the
Intel/Altera Cyclone V SoC FPGA. It updates the yaml bindings, adds the new
dtb to the Makefile, and introduces the new socfpga_cyclone5_draeger_m48.dts
file.

> diff --git a/arch/arm/boot/dts/intel/socfpga/socfpga_cyclone5_draeger_m48=
.dts b/arch/arm/boot/dts/intel/socfpga/socfpga_cyclone5_draeger_m48.dts
> new file mode 100644
> index 0000000000000..423c76cd1d4a7
> --- /dev/null
> +++ b/arch/arm/boot/dts/intel/socfpga/socfpga_cyclone5_draeger_m48.dts

[ ... ]

> +	soc {
> +		gpio3: gpio@ff202000 {
> +			#address-cells =3D <1>;
> +			#size-cells =3D <0>;
> +			compatible =3D "snps,dw-apb-gpio";
> +			reg =3D <0xff202000 0x20>;
> +			status =3D "okay";
> +
> +			portd: gpio-controller@0 {
> +				compatible =3D "snps,dw-apb-gpio-port";
> +				gpio-controller;
> +				#gpio-cells =3D <2>;
> +				snps,nr-gpios =3D <2>;
> +				reg =3D <0>;
> +				bank-name =3D "SYNC_I";

[Severity: Low]
Does this undocumented bank-name property break device tree schema validati=
on?

The snps,dw-apb-gpio.yaml schema limits properties on child nodes since it
uses additionalProperties: false, which might cause a failure when running
make dtbs_check on socfpga_cyclone5_draeger_m48.dts.

> +			};
> +		};
> +
> +		gpio4: gpio@ff202020 {
> +			#address-cells =3D <1>;
> +			#size-cells =3D <0>;
> +			compatible =3D "snps,dw-apb-gpio";
> +			reg =3D <0xff202020 0x20>;
> +			status =3D "okay";
> +
> +			porte: gpio-controller@0 {
> +				compatible =3D "snps,dw-apb-gpio-port";
> +				gpio-controller;
> +				#gpio-cells =3D <2>;
> +				snps,nr-gpios =3D <2>;
> +				reg =3D <0>;
> +				bank-name =3D "SYNC_O";

[Severity: Low]
Could this bank-name property be removed here as well to avoid a second
schema validation error on the gpio4.porte node?

> +			};
> +		};
> +	};
> +};

--=20
Sashiko AI review =C2=B7 https://sashiko.dev/#/patchset/20260908111011.9608=
76-2-petko.manolov@konsulko.com?part=3D1
