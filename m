Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id CE7A33806A6;
	Wed, 15 Apr 2026 14:46:45 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=10.30.226.201
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1776264405; cv=none; b=vCDRgSjEruYQiP11rV6hvShfDiWgmseTZTGz6BrCGyAslQ0l8TLP8oPDLG89BNfAfMQrkVUNaU8e2nT9tu4VMAllY8WxsjmFumphUwsbvPsCa/dUs4d6USQ1y584JYPBnRceC1Jgh+wjwUlfMCvEVOolmN3/O8tJxD68/1ymrFY=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1776264405; c=relaxed/simple;
	bh=Df7sEiD8rbNH6f0QBcSo3vTb6HODcM2EnP8UyOVA41E=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=S34+gkXeuTFPX+lhkU4JWOK0FVtbdK3xgHzPtQbGnYEmNXqXLov9oJZ4rNx+hlenSVchGa/kx5HChnDsSzx2/b+yCUnLFwiVrkLr7dMHTwBju/0Kr6EegxH+uLGURbOSpAcRlRSctQ21UWS3gXrOgRpixGxmKMyakbd+jZXHjww=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=imhi3uH/; arc=none smtp.client-ip=10.30.226.201
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="imhi3uH/"
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 270C4C19424;
	Wed, 15 Apr 2026 14:46:43 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1776264405;
	bh=Df7sEiD8rbNH6f0QBcSo3vTb6HODcM2EnP8UyOVA41E=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
	b=imhi3uH/P1Uk8JSR4e8nhvpxP8FWN81LoH+HThxxyjhX7rUikV3bEhMjkw7tF5XVr
	 g/90NVeCDRg6BKZr5FCK/swpvo26dGdFmE7evnOt39963JkFM0JgT2uG84vZnKHYPi
	 EvhFotZ07UfkSgELBBYR/o2t7NTPmvklWn4JJlwsBUHgmriPsiJfKj6xyvTCgXKliu
	 DOBt2oijMs24n4DFMmVtVIolR4D3RX9PgjSgLUWF4A2ark/+Aze9iDfZHIDJOxZUpf
	 xOnfBwcmJFTa9bbkEDdySJ/Dyi7//jqUciQBxDGMZomK78arKIr6JHZG+5Bkb6+xpt
	 ER2TinS0PaCzA==
Date: Wed, 15 Apr 2026 15:46:41 +0100
From: Conor Dooley <conor@kernel.org>
To: Krzysztof Kozlowski <krzysztof.kozlowski@oss.qualcomm.com>
Cc: Rob Herring <robh@kernel.org>, Krzysztof Kozlowski <krzk+dt@kernel.org>,
	Conor Dooley <conor+dt@kernel.org>, devicetree@vger.kernel.org,
	linux-kernel@vger.kernel.org
Subject: Re: [PATCH] docs: dt: writing-bindings: Extend compatible fallbacks
 guideline
Message-ID: <20260415-rinsing-pushup-ba81cc249086@spud>
References: <20260415082113.22775-2-krzysztof.kozlowski@oss.qualcomm.com>
Precedence: bulk
X-Mailing-List: devicetree@vger.kernel.org
List-Id: <devicetree.vger.kernel.org>
List-Subscribe: <mailto:devicetree+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:devicetree+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: multipart/signed; micalg=pgp-sha512;
	protocol="application/pgp-signature"; boundary="PL4PO5LQw84Z+gcI"
Content-Disposition: inline
In-Reply-To: <20260415082113.22775-2-krzysztof.kozlowski@oss.qualcomm.com>


--PL4PO5LQw84Z+gcI
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
Content-Transfer-Encoding: quoted-printable

On Wed, Apr 15, 2026 at 10:21:14AM +0200, Krzysztof Kozlowski wrote:
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
> fallback cannot be used by the drivers to match/bind.
>=20
> Signed-off-by: Krzysztof Kozlowski <krzysztof.kozlowski@oss.qualcomm.com>
> ---
>  Documentation/devicetree/bindings/writing-bindings.rst | 7 ++++++-
>  1 file changed, 6 insertions(+), 1 deletion(-)
>=20
> diff --git a/Documentation/devicetree/bindings/writing-bindings.rst b/Doc=
umentation/devicetree/bindings/writing-bindings.rst
> index 667816dd7d50..03e29e2d50af 100644
> --- a/Documentation/devicetree/bindings/writing-bindings.rst
> +++ b/Documentation/devicetree/bindings/writing-bindings.rst
> @@ -53,7 +53,12 @@ Properties
>     - DON'T use wildcards or device-family names in compatible strings.
> =20
>     - DO use fallback compatibles when devices are the same as or a super=
set of
> -     prior implementations.
> +     prior implementations.  Fallback compatibles are applicable especia=
lly
> +     when sharing a programming interface or when able to discover the
> +     variants.
> +
> +   - DON'T add fake fallback compatibles when software cannot use such t=
o match
> +     and bind to a device, and still operate correctly.
> =20
>     - DO add new compatibles in case there are new features or bugs.

Acked-by: Conor Dooley <conor.dooley@microchip.com>

     - DO use the commit message explain why devices that may appear
       compatible in a diff (e.g. no differences in property use) but
       are not compatible, are not compatible.

--PL4PO5LQw84Z+gcI
Content-Type: application/pgp-signature; name="signature.asc"

-----BEGIN PGP SIGNATURE-----

iHUEABYKAB0WIQRh246EGq/8RLhDjO14tDGHoIJi0gUCad+k0QAKCRB4tDGHoIJi
0tgKAQDDSNRcnSCt2aP42OSv1ldhVWCslyiVM9CvkMjzoxMfqQD8D99oiara1TOl
aVrvBc2U0Gotu8IVpv7qiMWHcMfBBQE=
=A5BV
-----END PGP SIGNATURE-----

--PL4PO5LQw84Z+gcI--
