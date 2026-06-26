Received: from smtp.kernel.org (aws-us-west-2-korg-mail-alma10-1.taild15c8.ts.net [100.103.45.18])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 5B5853F99E9
	for <devicetree@vger.kernel.org>; Fri, 26 Jun 2026 16:08:10 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=100.103.45.18
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1782490092; cv=none; b=ZmI3FSEu3nu1nILhHyHTNBFYgADn7h6rCkPhCBl+htHk4plqVSSoM3zBgrhsFKdlZq+O9lb+qASoB3Oh3l2y/kj5K6GUt28ewuoAl7W4+wKiJK+yBZ9bRa6x8Zxu4r+jIvh9Gl7uNbE7WgiFWuagWTlB0V+Vl42nUQ0j1AwUz5I=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1782490092; c=relaxed/simple;
	bh=+dovF1l3udCgS3KqZXRWceNeLcgAIy7Yn+0U43BDcYE=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=lYQ+PJC0Rn2uippMiBZoPzGSyTOAu+CR5OBrbmOLAO+0woDcD8H2BOsEJslT9HPryutCqWnl54groDbYKXrw+Th2+vtFHOBFD/GnDw7HMagvRgY6H+fZwp0BFJEo57VINzgrDO7jC8I34W1qYt97YWiJyPDO2MnTo52zo7W2Ljo=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=F6ICiGG4; arc=none smtp.client-ip=100.103.45.18
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="F6ICiGG4"
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 4C86B1F000E9;
	Fri, 26 Jun 2026 16:08:08 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kernel.org;
	s=k20260515; t=1782490089;
	bh=jobGyZzc3+nJRMGa+9IqIMXAKIKutK28bD6s2GJlifM=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To;
	b=F6ICiGG4jarR1sldVu7ux5M8P9pcub8fVIEcplFIXVOOk6FKM4rxeIIgZu7BfQS2w
	 sF5XgiOV8Obyiam96yjkHpYh9RyLGnR/+WzW6tMxdgVPB9Eg+jTD6eOX0g33QwYO1R
	 +5sTQi0bXxNj5OSspAJ+wyRb6dJtQlJh4cf+b0k8A1jlKJHHYx3FUy5x9RskMzqCW0
	 zpDprY6Qub8An/hQskWlJzgpbgqtgJSRbWwgXC/PlsEoxyZOWyTZo6e4XbeCSms8nU
	 klvvHf/31wQ0dbdCakYUkRw3u1aDK/D3qmtCJohZe/F5B/d+RBpWJagqTGzxv8yQ+m
	 Boqu5Y0Hmf3Rg==
Date: Fri, 26 Jun 2026 17:08:06 +0100
From: Conor Dooley <conor@kernel.org>
To: Dinh Nguyen <dinguyen@kernel.org>
Cc: robh@kernel.org, krzk+dt@kernel.org, conor+dt@kernel.org,
	devicetree@vger.kernel.org,
	muhammad.nazim.amirul.nazle.asmade@altera.com
Subject: Re: [PATCH 1/2] dt-bindings: net: altr,socfpga-stmmac: add more
 interrupts for Agilex5
Message-ID: <20260626-atypical-causing-1d9c437ef7ce@spud>
References: <20260626042541.1091774-1-dinguyen@kernel.org>
Precedence: bulk
X-Mailing-List: devicetree@vger.kernel.org
List-Id: <devicetree.vger.kernel.org>
List-Subscribe: <mailto:devicetree+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:devicetree+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: multipart/signed; micalg=pgp-sha512;
	protocol="application/pgp-signature"; boundary="TVMhMnNFRFiMaBhP"
Content-Disposition: inline
In-Reply-To: <20260626042541.1091774-1-dinguyen@kernel.org>


--TVMhMnNFRFiMaBhP
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
Content-Transfer-Encoding: quoted-printable

On Thu, Jun 25, 2026 at 11:25:40PM -0500, Dinh Nguyen wrote:
> The stmmac hardware on Agilex5 supports 8 TX/RX queue pairs and is
> dma-coherent. Update the schema to handle the hardware differences
> between SoC variants.
>=20
> Signed-off-by: Dinh Nguyen <dinguyen@kernel.org>
> ---
>  .../bindings/net/altr,socfpga-stmmac.yaml     | 51 +++++++++++++++++--
>  1 file changed, 46 insertions(+), 5 deletions(-)
>=20
> diff --git a/Documentation/devicetree/bindings/net/altr,socfpga-stmmac.ya=
ml b/Documentation/devicetree/bindings/net/altr,socfpga-stmmac.yaml
> index fc445ad5a1f1..9bae17688992 100644
> --- a/Documentation/devicetree/bindings/net/altr,socfpga-stmmac.yaml
> +++ b/Documentation/devicetree/bindings/net/altr,socfpga-stmmac.yaml
> @@ -62,12 +62,28 @@ properties:
>        - const: stmmaceth
>        - const: ptp_ref
> =20
> -  interrupts:
> -    maxItems: 1
> -

The top level should retain the widest constraints, so this should say
min 1 max 17.

>    interrupt-names:
> -    items:
> -      - const: macirq
> +    oneOf:
> +      - items:
> +          - const: macirq

This is unneeded, just have one list with everything, since entry 1 is
the same for both.

> +      - items:
> +          - const: macirq
> +          - const: tx-queue-0
> +          - const: tx-queue-1
> +          - const: tx-queue-2
> +          - const: tx-queue-3
> +          - const: tx-queue-4
> +          - const: tx-queue-5
> +          - const: tx-queue-6
> +          - const: tx-queue-7
> +          - const: rx-queue-0
> +          - const: rx-queue-1
> +          - const: rx-queue-2
> +          - const: rx-queue-3
> +          - const: rx-queue-4
> +          - const: rx-queue-5
> +          - const: rx-queue-6
> +          - const: rx-queue-7
> =20
>    iommus:
>      minItems: 1
> @@ -149,10 +165,35 @@ required:
>    - clocks
>    - clock-names
>    - altr,sysmgr-syscon
> +  - interrupts
> +  - interrupt-names

No mention in the commit message of an ABI change.
> =20
>  allOf:
>    - $ref: snps,dwmac.yaml#
> =20
> +  - if:
> +      properties:
> +        compatible:
> +          contains:
> +            const: altr,socfpga-stmmac-agilex5
> +    then:
> +      properties:
> +        interrupts:
> +          minItems: 17
> +          maxItems: 17

With the change I suggest for the list, the maxItems here can be
removed.

> +
> +        interrupt-names:
> +          minItems: 17
> +          maxItems: 17

And here.

> +
> +        dma-coherent: true
> +    else:
> +      properties:
> +        interrupts:
> +          minItems: 1

This should have been maxItems: 1 I think.

pw-bot: changes-requested

Thanks,
Conor.

> +
> +        dma-coherent: false
> +
>  unevaluatedProperties: false
> =20
>  examples:
> --=20
> 2.42.0.411.g813d9a9188
>=20

--TVMhMnNFRFiMaBhP
Content-Type: application/pgp-signature; name=signature.asc

-----BEGIN PGP SIGNATURE-----

iHUEABYKAB0WIQRh246EGq/8RLhDjO14tDGHoIJi0gUCaj6j5gAKCRB4tDGHoIJi
0uS2AQDo9olxVUR24JTpEghPWex6Pq58VklftDvShVM4kgegrAEAsEFufkZfP8n0
hhRXh+olrfWrtYsv5SfLKyfy7v7ySgc=
=k8a1
-----END PGP SIGNATURE-----

--TVMhMnNFRFiMaBhP--
