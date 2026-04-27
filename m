Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 025F63D6486;
	Mon, 27 Apr 2026 19:02:33 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=10.30.226.201
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1777316556; cv=none; b=WZfE5wryYui8KFCAtG2vkosyLtaGk0/FaYTlwSk/ljpklztArbymAWOlDXnDmecBYVqSkA3dy5lLHCUecKC70x8ijXJ/RFUYUaQJ0cd+zKHAy9Y/hZySxRH6Y2A3pbwWPLQSBOO46gUSnGgU2YHzssfrYqq/Mn21c1TjyalU3ZI=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1777316556; c=relaxed/simple;
	bh=QiOW0pRNHKjZQb0GCanC1NBjMtUFbjV5l/TrrAVmxWs=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=ULhoopjh+muDpIqr3QPdFSe4EuElvaahxHPT4dDLPTSkHimmViA++hmvjttHZh921W44lPja3W2h6Ilv2lQRObOQp2JE7zAUDOuXIWeF39kbi4avqjNLOpUBl4sfULkgDlXj5iejSePnyV8KlzcTAt9gpKULQShHU/Swa4s1dgA=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=ipzDKaxZ; arc=none smtp.client-ip=10.30.226.201
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="ipzDKaxZ"
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 333DCC19425;
	Mon, 27 Apr 2026 19:02:32 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1777316553;
	bh=QiOW0pRNHKjZQb0GCanC1NBjMtUFbjV5l/TrrAVmxWs=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
	b=ipzDKaxZTuYcAn0cwLm7hq2XD+tz2MXHj3hQCRF6ub1hXDlCIYhssR2xm92TremKK
	 O/qRkTwREQsWry8sV74JN5RCnXLRNr4JeghoNVLrRWjm6aLxotzbvmQ3v/tsh7VWhP
	 ktrJsy9iRPx3UyRP5J3TdSLoEPEjJOt9bzM8r5eMhBY5zMKDHBhD1lFf0yleY/YHTu
	 05NKP7JCd+sQjg5kt5itL3MYDSzmGWmgof+C5Db+5StrwBxr+8IBqP+nl8FwfN4qS6
	 wu1NYpNpjul+Im+HFfD3zj9YbQt/F7/L+ufDX9t2CID8X2zjWwqqIMX6D0zT1PE1zt
	 k7JsDI3/nHjhQ==
Date: Mon, 27 Apr 2026 20:02:29 +0100
From: Conor Dooley <conor@kernel.org>
To: Krzysztof Kozlowski <krzysztof.kozlowski@oss.qualcomm.com>
Cc: Rob Herring <robh@kernel.org>, Krzysztof Kozlowski <krzk+dt@kernel.org>,
	Conor Dooley <conor+dt@kernel.org>, devicetree@vger.kernel.org,
	linux-kernel@vger.kernel.org,
	Conor Dooley <conor.dooley@microchip.com>
Subject: Re: [PATCH v2] docs: dt: writing-bindings: Extend compatible
 fallbacks guideline
Message-ID: <20260427-squishier-outclass-bb25f2f83dd1@spud>
References: <20260427160739.175451-2-krzysztof.kozlowski@oss.qualcomm.com>
Precedence: bulk
X-Mailing-List: devicetree@vger.kernel.org
List-Id: <devicetree.vger.kernel.org>
List-Subscribe: <mailto:devicetree+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:devicetree+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: multipart/signed; micalg=pgp-sha512;
	protocol="application/pgp-signature"; boundary="Bx6+VBo+jgc1wxgT"
Content-Disposition: inline
In-Reply-To: <20260427160739.175451-2-krzysztof.kozlowski@oss.qualcomm.com>


--Bx6+VBo+jgc1wxgT
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
Content-Transfer-Encoding: quoted-printable

On Mon, Apr 27, 2026 at 06:07:40PM +0200, Krzysztof Kozlowski wrote:
> Extend the guidelines when to use fallback compatibles to cover to
> common review responses.  Devices are most likely compatible and should
> use fallbacks when having:
>=20
> 1. Compatible programming interface, meaning one is a subset, and Linux
>    device drivers can use the subset to correctly match/bind and still
>    operate with the subset features.
>=20
> 2. Device variant discovery through some means, like registers.
>=20
> Devices are incompatible and fallback is not suitable when that
> fallback cannot be used by the drivers to match/bind.  In the same time
> commit message should clearly explain when the code suggests devices
> are compatible, but the binding does not define them as such.
>=20
> Acked-by: Conor Dooley <conor.dooley@microchip.com>
> Signed-off-by: Krzysztof Kozlowski <krzysztof.kozlowski@oss.qualcomm.com>
>=20
> ---
>=20
> Changes in v2:
> 1. Include Conor's suggestion about commit msg, a bit rephrased.

Ye, it's better than my double use of the same term.

> 2. Add tag
> 3. Drop double-space, because file does not use that format (old habit).
> ---
>  .../devicetree/bindings/writing-bindings.rst         | 12 +++++++++++-
>  1 file changed, 11 insertions(+), 1 deletion(-)
>=20
> diff --git a/Documentation/devicetree/bindings/writing-bindings.rst b/Doc=
umentation/devicetree/bindings/writing-bindings.rst
> index 667816dd7d50..1a51764833a1 100644
> --- a/Documentation/devicetree/bindings/writing-bindings.rst
> +++ b/Documentation/devicetree/bindings/writing-bindings.rst
> @@ -53,7 +53,17 @@ Properties
>     - DON'T use wildcards or device-family names in compatible strings.
> =20
>     - DO use fallback compatibles when devices are the same as or a super=
set of
> -     prior implementations.
> +     prior implementations. Fallback compatibles are applicable especial=
ly
> +     when sharing a programming interface or when able to discover the
> +     variants.
> +
> +   - DON'T add fake fallback compatibles when software cannot use such t=
o match
> +     and bind to a device, and still operate correctly.
> +
> +   - DO use the commit message to explain why devices that may appear
> +     compatible in a diff (e.g. no differences in property use, same han=
dling
> +     by the software) but are not made compatible in the binding, are not
> +     compatible.
> =20
>     - DO add new compatibles in case there are new features or bugs.
> =20
> --=20
> 2.51.0
>=20

--Bx6+VBo+jgc1wxgT
Content-Type: application/pgp-signature; name="signature.asc"

-----BEGIN PGP SIGNATURE-----

iHUEABYKAB0WIQRh246EGq/8RLhDjO14tDGHoIJi0gUCae+yxQAKCRB4tDGHoIJi
0qbhAQDfy8lQlSn6/HD1jVJZE0bmvAWinM/vTVsXO8NRK3ujEAEA7E/H7gqtBzUv
yYEdndf1mc/a36YFZhlbf105Y974iwI=
=pj18
-----END PGP SIGNATURE-----

--Bx6+VBo+jgc1wxgT--
