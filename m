Received: from smtp.kernel.org (aws-us-west-2-korg-mail-alma10-1.taild15c8.ts.net [100.103.45.18])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 5243046D543;
	Tue, 21 Jul 2026 15:44:57 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=100.103.45.18
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1784648698; cv=none; b=MoEVJVqhlVk82jwDGYZc7qf9E3I6qZGh7Q9nUvV7D1wPZxFrmvKpoNq1rB8PZR4SQoo4W1+FBaABXd3xi1iDfK31bHJlaN9MV6Huv8EljN7UmidIWImCi9ls0/oDn/emW4kpytxKA5XCvJJnYXw40Ye4wkfZOzii0JNp5ufHGB8=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1784648698; c=relaxed/simple;
	bh=G1LvEnpYRwETccdMyGGoc47+IIvuRkfmd6oiQ/3O16E=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=PhGrth1HCNp0khJa049R6PRshfhD9eQbC1T9lKNdbKzF1t6qt/oJN51c5OV4fzi3IyGqIZs58g0A2vXo0CD9WMM0/G0SnVZ3itiw2UJKr1OH0t2sZPkBG7hG7Pxiyn+A5oxIQ9RGagvD9TT7/wi8vesYqPEQbZlv9pQ+Lt8cxLk=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=AgzulwmO; arc=none smtp.client-ip=100.103.45.18
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="AgzulwmO"
Received: by smtp.kernel.org (Postfix) with ESMTPSA id E74281F00A3A;
	Tue, 21 Jul 2026 15:44:55 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kernel.org;
	s=k20260515; t=1784648697;
	bh=Pgc3kJFwvAs7qksMub+wopJ+VMV2AMEN4SugeBGp/FA=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To;
	b=AgzulwmOFOsZRY13yHpvmGLOYDTMhI1N5aKUu3NKTYRc2nGYBc1gC3wtj2y0z0iNK
	 nS5yLCrPSxW7aWtlpkgKo5+CZKDHuWPIC+TuUPYQ7zv/Xtv3tz89WZAOWJpI/WicRh
	 Ex0bsB8pgBcriu9UxFWkx1ebPnt2flyyhQD1ARyl27GjuANADKRlYGFzzZotVJ4ycc
	 tdzH1qxYsu+12EzCUoBgvjKF8XLoJl+pbNSYbkX5vqWXLNpaLnBPPzUiDijSCD8Luy
	 NWg91pRp6bUFEr14yIA3WWEHF5wnlp/wcvOSAnvx5F2F+5vA8TrdASzrBz8eJ/GsIy
	 Uuly8MDLQLNgw==
Date: Tue, 21 Jul 2026 16:44:53 +0100
From: Conor Dooley <conor@kernel.org>
To: Krzysztof Kozlowski <krzysztof.kozlowski@oss.qualcomm.com>
Cc: Rob Herring <robh@kernel.org>, Krzysztof Kozlowski <krzk+dt@kernel.org>,
	Conor Dooley <conor+dt@kernel.org>, devicetree@vger.kernel.org,
	linux-kernel@vger.kernel.org
Subject: Re: [PATCH] docs: dt: writing-schema: Extend expectations about
 example part of binding
Message-ID: <20260721-pancreas-chive-3b9bd907a4de@spud>
References: <20260721103031.82188-2-krzysztof.kozlowski@oss.qualcomm.com>
Precedence: bulk
X-Mailing-List: devicetree@vger.kernel.org
List-Id: <devicetree.vger.kernel.org>
List-Subscribe: <mailto:devicetree+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:devicetree+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: multipart/signed; micalg=pgp-sha512;
	protocol="application/pgp-signature"; boundary="AyjlMYM6SwZB67gI"
Content-Disposition: inline
In-Reply-To: <20260721103031.82188-2-krzysztof.kozlowski@oss.qualcomm.com>

--AyjlMYM6SwZB67gI
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
Content-Transfer-Encoding: quoted-printable

On Tue, Jul 21, 2026 at 12:30:32PM +0200, Krzysztof Kozlowski wrote:
> Document already used rules about example DTS in the binding:
>=20
>  - All final device bindings (except sub-block of more complex devices)
>    should have an example.
>=20
>  - Phandles do not need to be resolvable - Sashiko already provided
>    incorrect review, so this might help it to understand the concept.
>=20
>  - Example should be complete, readable (use known defines), without
>    'status' property.
>=20
> Signed-off-by: Krzysztof Kozlowski <krzysztof.kozlowski@oss.qualcomm.com>
> ---
>  .../devicetree/bindings/writing-schema.rst          | 13 ++++++++++---
>  1 file changed, 10 insertions(+), 3 deletions(-)
>=20
> diff --git a/Documentation/devicetree/bindings/writing-schema.rst b/Docum=
entation/devicetree/bindings/writing-schema.rst
> index 3ffd0828617a..0f665b13c126 100644
> --- a/Documentation/devicetree/bindings/writing-schema.rst
> +++ b/Documentation/devicetree/bindings/writing-schema.rst
> @@ -127,9 +127,16 @@ additionalProperties / unevaluatedProperties
>          two above cases ('false').
> =20
>  examples
> -  Optional. A list of one or more DTS hunks implementing this binding on=
ly.
> -  Example should not contain unrelated device nodes, e.g. consumer nodes=
 in a
> -  provider binding, other nodes referenced by phandle.
> +  Optional, although expected in every device binding. A list of one or =
more

I think this first sentence doesn't really get across the "final device"
point you were going for. I think it should probably say something like
"although expected outside of bindings describing common properties or
sub-blocks of more complex devices." I think being clear only benefits
us here.

> +  DTS hunks implementing this binding only.  Example should not contain
> +  unrelated device nodes, e.g. consumer nodes in a provider binding, oth=
er
> +  nodes referenced by phandles or node labels which are not directly ref=
erenced
> +  in the example itself. Phandles in the example do not have to be resol=
vable.
> +  The example must be complete as much as possible - have most of the
> +  properties - and look readable to developers, thus for example use kno=
wn
> +  defines for interrupt or GPIO flags. Example should not contain 'statu=
s'
> +  property in normal cases.
> +
>    Note: YAML doesn't allow leading tabs, so spaces must be used instead.
> =20
>  Unless noted otherwise, all above schema properties are required.
> --=20
> 2.53.0
>=20

--AyjlMYM6SwZB67gI
Content-Type: application/pgp-signature; name=signature.asc

-----BEGIN PGP SIGNATURE-----

iHUEABYKAB0WIQRh246EGq/8RLhDjO14tDGHoIJi0gUCal+T9QAKCRB4tDGHoIJi
0k4IAP9b8/b52HmEhjfVgJiRnDo6l7eY20txPJOOx87I12r2HAEAjNq1w55obB+S
4L9SbW16jjIFw3SdrWqMWAgvTBDi1Q8=
=sTKA
-----END PGP SIGNATURE-----

--AyjlMYM6SwZB67gI--
