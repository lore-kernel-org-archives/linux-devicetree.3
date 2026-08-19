Received: from smtp.kernel.org (aws-us-west-2-korg-mail-alma10-1.taild15c8.ts.net [100.103.45.18])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 08AEF3AE184
	for <devicetree@vger.kernel.org>; Wed, 19 Aug 2026 17:03:17 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=100.103.45.18
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1787158999; cv=none; b=PpqXzWM7XAPJGqYeZQzwse9rhRt6Vy8ImmF3QO4mIkkUyc0yfqtrqOU82XKHVuwv/NhH+3kINhexw1bxBi62MWMQX/17DRWNOJjTIs3u5EWDGs7O4HbE3b/gFlfqEwuOiaDW99QgSlGIPBA8ivSdWyRXuVlnP0BT0l21PDnYU3g=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1787158999; c=relaxed/simple;
	bh=+R9oyb/VW7/Bl2doAiWzH+xyTTVjkDuRRnpay6hPZKE=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=bDa9VZfoy4kcGn/ZOfknrExEOL3aialNbmyQdLdIP0TAziIjwFj3dCKVS8xgCz8mKd3bYPSw+60WDuJub21yklzd3/pSKQ9DWG1n94Z+q3niqeuz9R8LQBalOK/JclqinVdk7WXnoyewQsOfLhhVBrHPNwcTmxLeQYXDHscTnp8=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=gdOIotAo; arc=none smtp.client-ip=100.103.45.18
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="gdOIotAo"
Received: by smtp.kernel.org (Postfix) with ESMTPSA id EBB461F000E9;
	Wed, 19 Aug 2026 17:03:14 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kernel.org;
	s=k20260515; t=1787158997;
	bh=0gp3VyYOMdGHK42yR9w7EY3RDGcSJHOd19lsKKn2S+o=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To;
	b=gdOIotAoNtVOSdgwQhmtNFCSNg7aCpmPjSDk96J0wV6oEXAm37RRoebAJ6CZszI/e
	 eftl7m5a2l65rNyUC1eAqlesPnsQY0Sh9Rdx/RzI0w1z0N+bpUM8IQtPh83s1Z10rp
	 +lhmgBmlkmSTrGXH5DtsuMGzqq5xPjBxzTFg8PnH2R+4KmoDCIDGNf12qik705dHMv
	 tVb2J86MtdiovRbCruIgMCALR1Y0vkQKcqH60w7qLTMHTWWo+QmhLeflE3YW1r1uV8
	 H4/g3jIdaKD8LXtbGTvDuRpufeqnaGjS7KNA/i4jieboNp9ix7+6f/S0oyh2Lgtjw+
	 nFp/IoTSJgdyQ==
Date: Wed, 19 Aug 2026 18:03:12 +0100
From: Conor Dooley <conor@kernel.org>
To: Yaxing Guo <guoyaxing@bosc.ac.cn>
Cc: Rob Herring <robh@kernel.org>, Krzysztof Kozlowski <krzk+dt@kernel.org>,
	Conor Dooley <conor+dt@kernel.org>, Paul Walmsley <pjw@kernel.org>,
	Palmer Dabbelt <palmer@dabbelt.com>,
	Albert Ou <aou@eecs.berkeley.edu>, Alexandre Ghiti <alex@ghiti.fr>,
	devicetree@vger.kernel.org, inux-kernel@vger.kernel.org,
	linux-riscv@lists.infradead.org, yangyinglu@bosc.ac.cn,
	yangyinglu <yangyinglu@bosc.cn>
Subject: Re: [PATCH] dt-bindings: riscv: firmware: Add OpenSBI configuration
 binding
Message-ID: <20260819-extent-decrease-0483d66a87af@spud>
References: <20260819090411.18561-1-guoyaxing@bosc.ac.cn>
Precedence: bulk
X-Mailing-List: devicetree@vger.kernel.org
List-Id: <devicetree.vger.kernel.org>
List-Subscribe: <mailto:devicetree+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:devicetree+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: multipart/signed; micalg=pgp-sha512;
	protocol="application/pgp-signature"; boundary="AaeJ4SPdX0PPAsBI"
Content-Disposition: inline
In-Reply-To: <20260819090411.18561-1-guoyaxing@bosc.ac.cn>

--AaeJ4SPdX0PPAsBI
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
Content-Transfer-Encoding: quoted-printable

On Wed, Aug 19, 2026 at 05:04:11PM +0800, Yaxing Guo wrote:
> From: yangyinglu <yangyinglu@bosc.cn>
>=20
> Add a Devicetree binding for OpenSBI configuration data in the
> chosen node, including the cold-boot-harts property.
>=20
> OpenSBI supports describing certain Generic Platform configurations in
> the device tree passed by the previous boot stage. The OpenSBI source
> tree documents the `opensbi,config` node and provides the corresponding
> device tree parsing flow.
>=20
> The `/chosen/opensbi-config` node can be used to configure OpenSBI,
> including the set of harts permitted to perform a cold boot through the
> `cold-boot-harts` property. OpenSBI parses this node during the boot
> phase and removes it from the device tree after cold boot.
>=20
> Add the Devicetree binding for this OpenSBI configuration node to
> document the supported `compatible` and `cold-boot-harts` properties.
>=20
> Signed-off-by: yangyinglu <yangyinglu@bosc.cn>
> ---
>  .../bindings/firmware/opensbi,config.yaml     | 38 +++++++++++++++++++
>  1 file changed, 38 insertions(+)
>  create mode 100644 Documentation/devicetree/bindings/firmware/opensbi,co=
nfig.yaml
>=20
> diff --git a/Documentation/devicetree/bindings/firmware/opensbi,config.ya=
ml b/Documentation/devicetree/bindings/firmware/opensbi,config.yaml
> new file mode 100644
> index 000000000000..86b1e1e673a8
> --- /dev/null
> +++ b/Documentation/devicetree/bindings/firmware/opensbi,config.yaml
> @@ -0,0 +1,38 @@
> +# SPDX-License-Identifier: (GPL-2.0-only OR BSD-2-Clause)
> +%YAML 1.2
> +---
> +$id: http://devicetree.org/schemas/firmware/opensbi,config.yaml#
> +$schema: http://devicetree.org/meta-schemas/core.yaml#
> +
> +title: OpenSBI Firmware Configuration
> +
> +maintainers:

You probably should've waited for a response to your question about who
should maintain it before sending, becuase I am not entirely sure this
software configuration node should be documented or if the maintainers
of opensbi would want it to be.

Cheers,
Conor.

> +
> +description: |
> +  OpenSBI configuration data passed in the chosen node.
> +
> +properties:
> +  compatible:
> +    const: opensbi,config
> +
> +  cold-boot-harts:
> +    $ref: /schemas/types.yaml#/definitions/phandle-array
> +    description:
> +      List of hart CPU nodes selected as cold boot harts by OpenSBI.
> +
> +required:
> +  - compatible
> +
> +additionalProperties: false
> +
> +examples:
> +  - |
> +    / {
> +        chosen {
> +            opensbi-config {
> +                compatible =3D "opensbi,config";
> +                cold-boot-harts =3D <&cpu0>;
> +            };
> +        };
> +    };
> +...
> --=20
> 2.43.0
>=20

--AaeJ4SPdX0PPAsBI
Content-Type: application/pgp-signature; name=signature.asc

-----BEGIN PGP SIGNATURE-----

iHQEABYKAB0WIQRh246EGq/8RLhDjO14tDGHoIJi0gUCaoXh0AAKCRB4tDGHoIJi
0hAgAP9iZc/Vjyv2t7oMgTJef0tLRpRYzg9LpjDOV4Z2aFzYPQD4zArzLmonHrjO
81f/gVpfnmIDblnPGBbk/N+hLqSjDA==
=eeVi
-----END PGP SIGNATURE-----

--AaeJ4SPdX0PPAsBI--
