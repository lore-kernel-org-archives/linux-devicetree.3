Received: from smtp.kernel.org (aws-us-west-2-korg-mail-alma10-1.taild15c8.ts.net [100.103.45.18])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id CA8FB40BCC1;
	Mon, 15 Jun 2026 16:30:52 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=100.103.45.18
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1781541053; cv=none; b=BEiVaZVytoxiW8GO3Ks0oBzgNxgcNolp4HlwXbUrWcYDoVzKKzhypdrRkzAGqAhlDaC73uGy3i/iB/fNLm9HBZaEPcL8mvEYhIa2782D+tkBqDfWSxBnQe4s2qfFB5DcdVRYEH1ZCY1crNrWbyvpqQF3JYoStqR2mWEGKjwrkqE=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1781541053; c=relaxed/simple;
	bh=UjNlXO6+kwY63ewxYTFHB3SDqh2M81NFkxUP/0SvWzw=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=ZEntlbrP+8p6BeNaaPZvPEL2DoupIg4BfWNz1eCQ/lvOI1a3+6U36X7S3p6LPM0mMz0gjgV9LRdYhQZuazJgW/203jWB5GeLCOKnkv59v2YOe+mxTJATJPgRHXYRdocRtRqu9PWIVf5ndJyZ9JjRvrcMmGp3ZOe2xRtigJ3Xe5M=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=ROKTnVLF; arc=none smtp.client-ip=100.103.45.18
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="ROKTnVLF"
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 83F9F1F000E9;
	Mon, 15 Jun 2026 16:30:49 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kernel.org;
	s=k20260515; t=1781541052;
	bh=hZSOvkR/9xRjUoYEm9Vszi7Sj0kgXvwwgT2+fMbNQyc=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To;
	b=ROKTnVLFeXsBapapjUro9pjic2Tj2kkU18SpEPVaWAjSJGAsOwXLkzC1OFuW0v7sy
	 3oBuvGfvDn6opJ69YnslYE2EcLpfLuAVUC5M0+SzwoLdU6dRvbA7VpZU47uzZKfmgC
	 PtG86yNzfAbDBj4mEtJhZeds1nOYKp7CgMwR7UfMh8iL9HE6zQYOR92jGZXwsPuKKM
	 qjoofxlltcctj0eiGiBb+poMUvoQLNmpfTif0ck6HzICdqWo2vGvUUyo8tczw6axbV
	 FXFnKxJiPeleRd21dDAt2becl6VHILtzmfgb4lKTK2W14n+xdsgQ0nM64QME1yYMYM
	 oqs2kZ39zhIAA==
Date: Mon, 15 Jun 2026 17:30:47 +0100
From: Conor Dooley <conor@kernel.org>
To: Pinkesh Vaghela <pinkesh.vaghela@einfochips.com>
Cc: Lee Jones <lee@kernel.org>, Rob Herring <robh@kernel.org>,
	Krzysztof Kozlowski <krzk+dt@kernel.org>,
	Conor Dooley <conor+dt@kernel.org>, Paul Walmsley <pjw@kernel.org>,
	Palmer Dabbelt <palmer@dabbelt.com>,
	Albert Ou <aou@eecs.berkeley.edu>, Alexandre Ghiti <alex@ghiti.fr>,
	devicetree@vger.kernel.org, linux-kernel@vger.kernel.org,
	linux-riscv@lists.infradead.org,
	Min Lin <linmin@eswincomputing.com>,
	Yulin Lu <luyulin@eswincomputing.com>,
	Samuel Holland <samuel.holland@sifive.com>,
	Darshan Prajapati <darshan.prajapati@einfochips.com>,
	Pritesh Patel <pritesh.patel@einfochips.com>
Subject: Re: [PATCH 2/7] riscv: dts: eswin: add clock generator for EIC7700
 SoC
Message-ID: <20260615-overshot-pellet-5e527a14133e@spud>
References: <20260615122016.1110206-1-pinkesh.vaghela@einfochips.com>
 <20260615122016.1110206-3-pinkesh.vaghela@einfochips.com>
Precedence: bulk
X-Mailing-List: devicetree@vger.kernel.org
List-Id: <devicetree.vger.kernel.org>
List-Subscribe: <mailto:devicetree+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:devicetree+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: multipart/signed; micalg=pgp-sha512;
	protocol="application/pgp-signature"; boundary="nSYe+Q7ynD6q88tQ"
Content-Disposition: inline
In-Reply-To: <20260615122016.1110206-3-pinkesh.vaghela@einfochips.com>


--nSYe+Q7ynD6q88tQ
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
Content-Transfer-Encoding: quoted-printable

On Mon, Jun 15, 2026 at 05:50:11PM +0530, Pinkesh Vaghela wrote:
> From: Pritesh Patel <pritesh.patel@einfochips.com>
>=20
> Add clock generator node for EIC7700 SoC.
> HiFive Premier P550 boards have 24MHz crystal oscillator to provide
> the input clock.
>=20
> Signed-off-by: Pritesh Patel <pritesh.patel@einfochips.com>
> Signed-off-by: Pinkesh Vaghela <pinkesh.vaghela@einfochips.com>
> ---
>  .../boot/dts/eswin/eic7700-hifive-premier-p550.dts  |  5 +++++
>  arch/riscv/boot/dts/eswin/eic7700.dtsi              | 13 +++++++++++++
>  2 files changed, 18 insertions(+)
>=20
> diff --git a/arch/riscv/boot/dts/eswin/eic7700-hifive-premier-p550.dts b/=
arch/riscv/boot/dts/eswin/eic7700-hifive-premier-p550.dts
> index 131ed1fc6b2e..1fb92f0e7c55 100644
> --- a/arch/riscv/boot/dts/eswin/eic7700-hifive-premier-p550.dts
> +++ b/arch/riscv/boot/dts/eswin/eic7700-hifive-premier-p550.dts
> @@ -20,6 +20,11 @@ chosen {
>  	};
>  };
> =20
> +&xtal {
> +	clock-frequency =3D <24000000>;
> +	clock-output-names =3D "xtal24m";
> +};
> +
>  &uart0 {
>  	status =3D "okay";
>  };
> diff --git a/arch/riscv/boot/dts/eswin/eic7700.dtsi b/arch/riscv/boot/dts=
/eswin/eic7700.dtsi
> index 430a210f01e6..a7ebb1115958 100644
> --- a/arch/riscv/boot/dts/eswin/eic7700.dtsi
> +++ b/arch/riscv/boot/dts/eswin/eic7700.dtsi
> @@ -4,6 +4,7 @@
>   */
> =20
>  /dts-v1/;
> +#include <dt-bindings/clock/eswin,eic7700-clock.h>
>  #include <dt-bindings/reset/eswin,eic7700-reset.h>
> =20
>  / {
> @@ -203,6 +204,11 @@ pmu {
>  				<0x00000000 0x0000000f 0xfffffffc 0x000000ff 0x00000078>;
>  	};
> =20
> +	xtal: oscillator {

Sashiko feedback here on making this clk-<hz> or clk-<something> should
be implemented.

> +		compatible =3D "fixed-clock";
> +		#clock-cells =3D <0>;
> +	};
> +
>  	soc {
>  		compatible =3D "simple-bus";
>  		ranges;
> @@ -343,6 +349,13 @@ gpioD: gpio-port@3 {
>  			};
>  		};
> =20
> +		clk: clock-controller@51828000 {
> +			compatible =3D "eswin,eic7700-clock";
> +			reg =3D <0x0 0x51828000 0x0 0x300>;
> +			clocks =3D <&xtal>;
> +			#clock-cells =3D <1>;
> +		};
> +
>  		reset: reset-controller@51828300 {
>  			compatible =3D "eswin,eic7700-reset";
>  			reg =3D <0x0 0x51828300 0x0 0x200>;
> --=20
> 2.34.1
>=20

--nSYe+Q7ynD6q88tQ
Content-Type: application/pgp-signature; name=signature.asc

-----BEGIN PGP SIGNATURE-----

iHUEABYKAB0WIQRh246EGq/8RLhDjO14tDGHoIJi0gUCajAotwAKCRB4tDGHoIJi
0utAAP9a+aQfGKwmJYttBtoX6OX0l+ih2J+zVfH+wCYttEb/ZgEAqCT+qNqzadiA
dnWyn1pwqRHtuSrnFR5Da/eKRcXOggE=
=TsHk
-----END PGP SIGNATURE-----

--nSYe+Q7ynD6q88tQ--
