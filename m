Received: from smtp.kernel.org (aws-us-west-2-korg-mail-alma10-1.taild15c8.ts.net [100.103.45.18])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id D7A2840B394;
	Mon, 15 Jun 2026 16:28:42 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=100.103.45.18
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1781540923; cv=none; b=XjOMzJORhLbz3toyRbqmwHU7Gp9V0Oc5RXW9sQxnqu4Qwytv5pegbx6BAqctOnuV8uOpKZ58kmkvYA3Am/W3ixBgHY6ztMf3RzR92WCRotaoVBHOv+RIvKZs9eM0AI00rMq7QcLwTr9jhB/twBBld1vOIM4Ohgr5FEqXUIzd2aw=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1781540923; c=relaxed/simple;
	bh=LtiaY6QkUhVPRmtzJlVuTtvbFWD6FEX68xiHFcuKEhQ=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=qWC+AJAUKF8ut37JXfL0Yq6M86aQR8MKQqlrmRg7LM/umoP+NvvXO5wca33BIg9L8RaDUzqxCYvVQxprBeBdgb42502pjtloO2sCohUMK568587MXGK17IYbA4wAAiEhJ/cYw55NIDiAvwaA8Td1Qk5Wd8GM6VV1yANRUZgNDWw=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=M4310Af4; arc=none smtp.client-ip=100.103.45.18
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="M4310Af4"
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 8CE731F00A3A;
	Mon, 15 Jun 2026 16:28:39 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kernel.org;
	s=k20260515; t=1781540922;
	bh=wYvIhixzTwQa3Wj++bivo33Io38lxJyx7TobgBUnf74=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To;
	b=M4310Af4AQg7Cbbcyg9QPA1rPUF8NTBagIVGYJqh9Aal/U6WKuJjzqus8QSu9oEf9
	 rgFHSisgIMw/MYweaOSB7JblVvTi9gX9rQ7NJQSzGNTTVrSxV8oWGrRnf1oB0U2Yoo
	 TC4ig3P79GV3qSDSzw5yM+gyj6ZzMwLcEtRhpVddMlitOmKvO6fuWsBSlPV4vTjoN4
	 eWeWQA1vM2GlL7srLe36SQC+q1CQ97IkYdrxskqUFZ8dRA2z/OIaar2fsH2XMUaugZ
	 pJkWOp2n6GZ0PkR6IKY0gDwhWaXi8oVAKESvtZCBRmIjMxCKLPu8SOWQuKTbzZSd0b
	 dPcvLMlIyKn+g==
Date: Mon, 15 Jun 2026 17:28:37 +0100
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
Subject: Re: [PATCH 4/7] dt-bindings: mfd: syscon: add ESWIN EIC7700
 compatible
Message-ID: <20260615-buccaneer-garland-0617394e9a45@spud>
References: <20260615122016.1110206-1-pinkesh.vaghela@einfochips.com>
 <20260615122016.1110206-5-pinkesh.vaghela@einfochips.com>
Precedence: bulk
X-Mailing-List: devicetree@vger.kernel.org
List-Id: <devicetree.vger.kernel.org>
List-Subscribe: <mailto:devicetree+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:devicetree+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: multipart/signed; micalg=pgp-sha512;
	protocol="application/pgp-signature"; boundary="QzOTKnhbdMQfujJ1"
Content-Disposition: inline
In-Reply-To: <20260615122016.1110206-5-pinkesh.vaghela@einfochips.com>


--QzOTKnhbdMQfujJ1
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
Content-Transfer-Encoding: quoted-printable

On Mon, Jun 15, 2026 at 05:50:13PM +0530, Pinkesh Vaghela wrote:
> Document ESWIN EIC7700 SoC compatible for syscon registers.

Some detail about what this syscon does would be nice.

Acked-by: Conor Dooley <conor.dooley@microchip.com>
pw-bot: not-applicable

>=20
> Signed-off-by: Pinkesh Vaghela <pinkesh.vaghela@einfochips.com>
> ---
>  Documentation/devicetree/bindings/mfd/syscon.yaml | 2 ++
>  1 file changed, 2 insertions(+)
>=20
> diff --git a/Documentation/devicetree/bindings/mfd/syscon.yaml b/Document=
ation/devicetree/bindings/mfd/syscon.yaml
> index e22867088063..7d3365601249 100644
> --- a/Documentation/devicetree/bindings/mfd/syscon.yaml
> +++ b/Documentation/devicetree/bindings/mfd/syscon.yaml
> @@ -62,6 +62,7 @@ select:
>            - cirrus,ep7209-syscon3
>            - cnxt,cx92755-uc
>            - econet,en751221-chip-scu
> +          - eswin,eic7700-syscfg
>            - freecom,fsg-cs2-system-controller
>            - fsl,imx93-aonmix-ns-syscfg
>            - fsl,imx93-wakeupmix-syscfg
> @@ -175,6 +176,7 @@ properties:
>                - cirrus,ep7209-syscon3
>                - cnxt,cx92755-uc
>                - econet,en751221-chip-scu
> +              - eswin,eic7700-syscfg
>                - freecom,fsg-cs2-system-controller
>                - fsl,imx93-aonmix-ns-syscfg
>                - fsl,imx93-wakeupmix-syscfg
> --=20
> 2.34.1
>=20

--QzOTKnhbdMQfujJ1
Content-Type: application/pgp-signature; name=signature.asc

-----BEGIN PGP SIGNATURE-----

iHUEABYKAB0WIQRh246EGq/8RLhDjO14tDGHoIJi0gUCajAoNQAKCRB4tDGHoIJi
0gNPAP9sNaKKakr1WOIxxXV6OrawVVKnPTVbyEABUhmDFsbmBAEA9qRBENKajLM+
JEPrvLMmhm5ZjzU6auRP6Hb8/+l24AI=
=oLrU
-----END PGP SIGNATURE-----

--QzOTKnhbdMQfujJ1--
