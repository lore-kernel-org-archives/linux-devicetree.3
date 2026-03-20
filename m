Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 8492E3D8916;
	Fri, 20 Mar 2026 17:57:58 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=10.30.226.201
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1774029478; cv=none; b=BbYO3lCbTs1h+FasOyf1KZSpzw5gC5v7x3lKz9vSQ4mz64A5ILCrsdsSCNh7FCPwl5Z10ueuV6Zhatt577wsomVU3Q69dKSz3RxjcGhIYrno5mETO3xjZ2YX4jSuDKXBAP4+7gdP6ePtXq2rhaGf6DEgdL0wi9YAW8yn4KTOr6U=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1774029478; c=relaxed/simple;
	bh=jmlZAFC0O6Wcr4/Nnsc+XHzmSxe0aADhPHpDWXnHAgE=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=oHEYCaoJrEvMacBGGrdvvmskLkJJ+QxSVPOX/giSlW1PCdOPJ1gKp7k+zSpbJwCbWQxJXd3JgrL9UkAJ0KPBFkRBjWUE6i+7nzLp3GHL+VQp5VQPeILXHnyktqziXdok43xpY0KFPWXMH05BTeEc4Sbk9xxQdouveC11641xPSg=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=apOam+80; arc=none smtp.client-ip=10.30.226.201
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="apOam+80"
Received: by smtp.kernel.org (Postfix) with ESMTPSA id DDB30C4CEF7;
	Fri, 20 Mar 2026 17:57:55 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1774029478;
	bh=jmlZAFC0O6Wcr4/Nnsc+XHzmSxe0aADhPHpDWXnHAgE=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
	b=apOam+80akB2uqBD3AaaDvLT9EFQT6f96GyTxo0DfHjxiyUel156WDhchmUyjhu/o
	 k7J+cw/jcOyb5CPHMJrHU6wCa2U3fQ1EmGwM7ucHlJdBV5DLq6RdTUJ6xC3SH6b5EX
	 SrEyl+JYwJA7girNHXQIyhe+PyFAE50WnMMeUTAo+F/1l8m8hFwlnfVG64k7aEg+77
	 tbFTZqtq1haLQagloeft1GVPjU1sA9pk4AJFPObAqEenD/5wq0g+1GyB0EIcFBEqOH
	 9W8qfS2Roa3iChWSflNuKZQwCcuzsGCbJPTZ2G5xtcp1Vv/22pBlEZD8lDC3aCh0XO
	 aPN84pcnlbKKA==
Date: Fri, 20 Mar 2026 17:57:53 +0000
From: Conor Dooley <conor@kernel.org>
To: =?iso-8859-1?Q?Andr=E9?= Svensson <andre.svensson@axis.com>
Cc: Support Opensource <support.opensource@diasemi.com>,
	Liam Girdwood <lgirdwood@gmail.com>,
	Mark Brown <broonie@kernel.org>, Rob Herring <robh@kernel.org>,
	Krzysztof Kozlowski <krzk+dt@kernel.org>,
	Conor Dooley <conor+dt@kernel.org>,
	Adam Ward <Adam.Ward.opensource@diasemi.com>,
	linux-kernel@vger.kernel.org, devicetree@vger.kernel.org,
	kernel@axis.com, Waqar Hameed <waqar.hameed@axis.com>
Subject: Re: [PATCH v2 1/2] regulator: dt-bindings: dlg,da9121: Add
 dlg,no-gpio-control
Message-ID: <20260320-banking-aerobics-7f32ef819d1a@spud>
References: <20260320-no-gpio-control-v2-0-dbc938e462cb@axis.com>
 <20260320-no-gpio-control-v2-1-dbc938e462cb@axis.com>
Precedence: bulk
X-Mailing-List: devicetree@vger.kernel.org
List-Id: <devicetree.vger.kernel.org>
List-Subscribe: <mailto:devicetree+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:devicetree+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: multipart/signed; micalg=pgp-sha512;
	protocol="application/pgp-signature"; boundary="kKFvItNu0VTBCqk4"
Content-Disposition: inline
In-Reply-To: <20260320-no-gpio-control-v2-1-dbc938e462cb@axis.com>


--kKFvItNu0VTBCqk4
Content-Type: text/plain; charset=iso-8859-1
Content-Disposition: inline
Content-Transfer-Encoding: quoted-printable

On Fri, Mar 20, 2026 at 08:33:24AM +0100, Andr=E9 Svensson wrote:
> Add the optional boolean property dlg,no-gpio-control. When present, it
> indicates that no DA91xx GPIO pins are configured/used with functions
> RELOAD/DVC/EN, which can affect the output voltage control, regulator
> mode control and enable signal control.
>=20
> The absence of relevant GPIO DT properties does not imply that the
> RELOAD/DVC/EN GPIO functions are unused. These functions are provided by
> DA91xx GPIO pins and may be controlled by external hardware without
> corresponding GPIO DT properties. The dlg,no-gpio-control property
> explicitly indicates that none of these GPIO functions are used.
>=20
> It is mutually exclusive with enable-gpios, regardless of whether the
> referenced GPIO is connected to a GPIO pin or the IC_EN pin, since
> enable-gpios allows the regulator to be controlled via an external
> hardware signal.
>=20
> Co-developed-by: Waqar Hameed <waqar.hameed@axis.com>
> Signed-off-by: Waqar Hameed <waqar.hameed@axis.com>
> Signed-off-by: Andr=E9 Svensson <andre.svensson@axis.com>

Acked-by: Conor Dooley <conor.dooley@microchip.com>
pw-bot: not-applicable

--kKFvItNu0VTBCqk4
Content-Type: application/pgp-signature; name="signature.asc"

-----BEGIN PGP SIGNATURE-----

iHUEABYKAB0WIQRh246EGq/8RLhDjO14tDGHoIJi0gUCab2KoQAKCRB4tDGHoIJi
0oEnAQCaXGxxG+f2BlEeAwMbBn4YDjk2cr87i+YQ7OAEqyfnzgD/VlgrtObRGoS1
/H5po9pdcL2PLEi6ot1IpsOj8ESQjQE=
=/TEg
-----END PGP SIGNATURE-----

--kKFvItNu0VTBCqk4--
