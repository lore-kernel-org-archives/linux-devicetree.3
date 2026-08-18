Received: from smtp.kernel.org (aws-us-west-2-korg-mail-alma10-1.taild15c8.ts.net [100.103.45.18])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 62F7239A7EF;
	Tue, 18 Aug 2026 09:35:57 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=100.103.45.18
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1787045758; cv=none; b=afIt0wSsgIbmL6s/dm3i66orZav3reHa7PXExvsQ+Yea8JdgJxtgWJZK7p+FwGJo670CIqxsx5iW3FeJOCaiw39yj7zYt5UzhitgQpjVi0UzNjrUhY/wXe1Dd7OgKx/qCMymdzvWoGAjUbfpU5gRthlkt1lrGODmNmbyAsX6Uag=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1787045758; c=relaxed/simple;
	bh=MziyQlKDhBYELbIy54z1dLSG29a6AsmLDVLh6pAUZhs=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=s7/mQfuBhs9NtwFQlO/hxfiMXNDsZ714CM9PM8Vsar2Eqq9iiL0B8KkSJud4InIrxX//CdpwuQw8cQqB1d3MCv5WIr3ue61A1hu4C4hBpE63oxiw+kPuOQih+UAU9ck5v4qQQ04yj6S9EErHQgs+zHMK4lRCVjO10JqKvntKJ2Y=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=O+fUd7nA; arc=none smtp.client-ip=100.103.45.18
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="O+fUd7nA"
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 0D0CF1F000E9;
	Tue, 18 Aug 2026 09:35:53 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kernel.org;
	s=k20260515; t=1787045757;
	bh=b4BmVR02USpUiuj8iihPmQKITu4yz0lHFUqx56OCGT0=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To;
	b=O+fUd7nAvVseq7h4yoAtcdRhbaGsDiBvieu3cmO2oQxkcFjSmhfVeVJQIEZ/DU/Gf
	 NB7H3MIpu2jWTh8KNFY/llgzMmJT0WXEQ4erZMS1rUDOnj5CgAwu9FsBREMuznygSF
	 D364dDAuEUpPsyXNJY19GEt3YuWjiv/t83Ca4Iomgk6XW+ppm6TGjnZaymeYB+aMoe
	 94Q0Af9N4bY+Q2GISnBg4DnwtJJbIZ5aWbqcihEybD5jKrhuluOrImnTq1p2u1XPpx
	 m9CCgpFPea4Nx2OUwDjxSAEytJYG8CFbHnoEQ1iVGfyBVX1D1ETsf38E+HzBYDtewu
	 dKvX+LOXaiMnA==
Date: Tue, 18 Aug 2026 10:35:51 +0100
From: Conor Dooley <conor@kernel.org>
To: Mayuresh Chitale <mayuresh.chitale@oss.qualcomm.com>
Cc: Rob Herring <robh@kernel.org>, Krzysztof Kozlowski <krzk+dt@kernel.org>,
	Conor Dooley <conor+dt@kernel.org>, Paul Walmsley <pjw@kernel.org>,
	Palmer Dabbelt <palmer@dabbelt.com>,
	Albert Ou <aou@eecs.berkeley.edu>, Alexandre Ghiti <alex@ghiti.fr>,
	Guodong Xu <docular.xu@gmail.com>,
	Andrew Morton <akpm@linux-foundation.org>,
	Deepak Gupta <debug@rivosinc.com>,
	Xu Lu <luxu.kernel@bytedance.com>,
	Pincheng Wang <pincheng.plct@isrc.iscas.ac.cn>,
	devicetree@vger.kernel.org, linux-riscv@lists.infradead.org,
	linux-kernel@vger.kernel.org
Subject: Re: [RFC PATCH 1/3] dt-bindings: riscv: Add Sspesa and Ssplcofi
 extensions
Message-ID: <20260818-hunger-module-a44d9716010d@spud>
References: <20260817160222.3313295-1-mayuresh.chitale@oss.qualcomm.com>
 <20260817160222.3313295-2-mayuresh.chitale@oss.qualcomm.com>
Precedence: bulk
X-Mailing-List: devicetree@vger.kernel.org
List-Id: <devicetree.vger.kernel.org>
List-Subscribe: <mailto:devicetree+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:devicetree+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: multipart/signed; micalg=pgp-sha512;
	protocol="application/pgp-signature"; boundary="NXk010FMsqIWIm0u"
Content-Disposition: inline
In-Reply-To: <20260817160222.3313295-2-mayuresh.chitale@oss.qualcomm.com>

--NXk010FMsqIWIm0u
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
Content-Transfer-Encoding: quoted-printable

On Mon, Aug 17, 2026 at 09:32:17PM +0530, Mayuresh Chitale wrote:
> Document the RISC-V Performance Event Sampling extensions Sspesa
> (Precise Event Sample Attribution) and Ssplcofi (Precise Local Counter
> Overflow Interrupt) in the ISA extensions binding.
>=20
> Add a dependency rule requiring Sspesa to be present whenever Ssplcofi
> is present.
>=20
> Signed-off-by: Mayuresh Chitale <mayuresh.chitale@oss.qualcomm.com>

Why is this series RFC?

Cheers,
Conor.

> ---
>  .../devicetree/bindings/riscv/extensions.yaml | 19 +++++++++++++++++++
>  1 file changed, 19 insertions(+)
>=20
> diff --git a/Documentation/devicetree/bindings/riscv/extensions.yaml b/Do=
cumentation/devicetree/bindings/riscv/extensions.yaml
> index 5ffc40d599c0..f316b93754ff 100644
> --- a/Documentation/devicetree/bindings/riscv/extensions.yaml
> +++ b/Documentation/devicetree/bindings/riscv/extensions.yaml
> @@ -232,6 +232,18 @@ properties:
>              ratified at commit d70011dde6c2 ("Update to ratified state")
>              of riscv-j-extension.
> =20
> +        - const: sspesa
> +          description: |
> +            The standard Sspesa supervisor-level extension for precise e=
vent
> +            sample attribution, as defined in the RISC-V Performance Eve=
nt
> +            Sampling specification.
> +
> +        - const: ssplcofi
> +          description: |
> +            The standard Ssplcofi supervisor-level extension for precise=
 local
> +            counter overflow interrupts, as defined in the RISC-V Perfor=
mance
> +            Event Sampling specification. Ssplcofi depends on Sspesa.
> +
>          - const: ssstateen
>            description: |
>              The standard Ssstateen extension for supervisor-mode view of=
 the
> @@ -934,6 +946,13 @@ properties:
>                  const: smnpm
>              - contains:
>                  const: ssnpm
> +      # Ssplcofi depends on Sspesa
> +      - if:
> +          contains:
> +            const: ssplcofi
> +        then:
> +          contains:
> +            const: sspesa
>        # Za64rs and Ziccrse depend on Zalrsc or A
>        - if:
>            contains:
> --=20
> 2.43.0
>=20

--NXk010FMsqIWIm0u
Content-Type: application/pgp-signature; name=signature.asc

-----BEGIN PGP SIGNATURE-----

iHUEABYKAB0WIQRh246EGq/8RLhDjO14tDGHoIJi0gUCaoQndwAKCRB4tDGHoIJi
0tlJAP4w5GCA8+uqOuxxYbSrz/hjl8CHq4Te4t/0YaZ8pFJq0gD+Oi6+k8Ou20f5
YXvedETW9VAPBH9qq7MK++nt5cYEsgc=
=QFPg
-----END PGP SIGNATURE-----

--NXk010FMsqIWIm0u--
