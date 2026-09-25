Received: from smtp.kernel.org (aws-us-west-2-korg-mail-alma10-1.taild15c8.ts.net [100.103.45.18])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 95A6D3803D3
	for <devicetree@vger.kernel.org>; Fri, 25 Sep 2026 16:49:11 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=100.103.45.18
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1790354967; cv=none; b=YpDPKoSCIHYh106VWAqinZ9Dgbuuy1pcFK5GmrHDJGykRPhUHEp+rvzOraXwp/5PMaiOOAQ18MezSnQMoTo9FwslGaVtuV1gtr5BsOyKvTaH5g3mzAV+gNuy1XJ3JKuQpZs3EAeMEgJo8B54oWu5wvv6diMi3fvoGzWfd0kDGvQ=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1790354967; c=relaxed/simple;
	bh=P7Nra1/mZ00wO9rIsM4g0/165V9amk6hUGBOAODXVUM=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=I5+CbtHOtC9MlhhxfMbU9Je75Eg74LxUXiSRbqNGuGe5u0ErrC0Ua6Vl4lGCcYPKJ6vsHKQRYwtKaYASQrZ1L1nj2EEybE88lu5yPdXx88CbzeC88W8vXkr7XB4+2Rgty0VF3HIUJUwhCdEaaVJrh/o6FTdR74ZiAUYHLJP0N6k=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=AuAEb+Ve; arc=none smtp.client-ip=100.103.45.18
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="AuAEb+Ve"
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 04B0E1F000FF;
	Fri, 25 Sep 2026 16:49:07 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kernel.org;
	s=k20260515; t=1790354949;
	bh=GA1H+OxXP6KX0LKvAMZqOqInzKF4jduC38BdbsnlM5g=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To;
	b=AuAEb+VeI1z6pWxU4HjqZZQok62LH0qyTrgBi47q35kShO6PMrPe6n4SPcaoC3A+n
	 kCIhJP+hqwybi+AfGXPi1VmjgPSitXfGETMJ/zQCXX5MdDDfn/uOMlwSvhtjtyGLY2
	 GMdxadOyEKuhAICt29844HAMMJVs23QqTVSTfYY19cfMVpea0xjHlESRIX+dRFxhE2
	 bAUpzTdu0fd0ZEvJR5tVJzdQnE2Vp3NXCv4IeyHVmz3T8NrcpF0Q60vXLpe8Xe7EAE
	 1GUkREEef3efjqGmZQLtHXe7qV4BEijS9atHbXDDJhhZ9+xmFqaAo53tRokYH0nHC1
	 w5tv5hICCZ3LQ==
Date: Fri, 25 Sep 2026 17:49:05 +0100
From: Conor Dooley <conor@kernel.org>
To: Andrew Gaylard <ag@ffroot.co.za>
Cc: linux-arm-kernel@lists.infradead.org, devicetree@vger.kernel.org,
	qinjian@cqplus1.com, robh@kernel.org, krzk+dt@kernel.org,
	conor+dt@kernel.org, linux@armlinux.org.uk
Subject: Re: [PATCH v5 1/6] dt-bindings: vendor-prefixes: Add Tibbo
Message-ID: <20260925-entrap-demotion-e1506f8f426d@spud>
References: <20260924164922.117236-1-ag@ffroot.co.za>
 <20260924164922.117236-2-ag@ffroot.co.za>
Precedence: bulk
X-Mailing-List: devicetree@vger.kernel.org
List-Id: <devicetree.vger.kernel.org>
List-Subscribe: <mailto:devicetree+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:devicetree+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: multipart/signed; micalg=pgp-sha512;
	protocol="application/pgp-signature"; boundary="UlYi1erejnPlZT3w"
Content-Disposition: inline
In-Reply-To: <20260924164922.117236-2-ag@ffroot.co.za>

--UlYi1erejnPlZT3w
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
Content-Transfer-Encoding: quoted-printable

On Thu, Sep 24, 2026 at 06:49:17PM +0200, Andrew Gaylard wrote:
> Add the vendor prefix for Tibbo Technology, the LTPP3G2 board manufacture=
r.
>=20
> Signed-off-by: Andrew Gaylard <ag@ffroot.co.za>

Link: https://tibbo.com/

Acked-by: Conor Dooley <conor.dooley@microchip.com>
pw-bot: not-applicable

> ---
>  Documentation/devicetree/bindings/vendor-prefixes.yaml | 2 ++
>  1 file changed, 2 insertions(+)
>=20
> diff --git a/Documentation/devicetree/bindings/vendor-prefixes.yaml b/Doc=
umentation/devicetree/bindings/vendor-prefixes.yaml
> index 4a5cf436eb14..8a984fea11c3 100644
> --- a/Documentation/devicetree/bindings/vendor-prefixes.yaml
> +++ b/Documentation/devicetree/bindings/vendor-prefixes.yaml
> @@ -1728,6 +1728,8 @@ patternProperties:
>      description: Texas Instruments
>    "^tianma,.*":
>      description: Tianma Micro-electronics Co., Ltd.
> +  "^tibbo,.*":
> +    description: Tibbo Technology Inc.
>    "^tlm,.*":
>      description: Trusted Logic Mobility
>    "^tmt,.*":
> --=20
> 2.53.0
>=20

--UlYi1erejnPlZT3w
Content-Type: application/pgp-signature; name=signature.asc

-----BEGIN PGP SIGNATURE-----

iHUEABYKAB0WIQRh246EGq/8RLhDjO14tDGHoIJi0gUCaramAQAKCRB4tDGHoIJi
0lTTAQDGqGWo0Z147vFrs87W9XtSqSk4XY9MvDf5TcVrVGnp+QD+M2bvhTxKm+NA
uilgroWUMyUYURQoxL3phRkltvzK/g8=
=uLMg
-----END PGP SIGNATURE-----

--UlYi1erejnPlZT3w--
