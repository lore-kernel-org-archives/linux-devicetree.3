Received: from smtp.kernel.org (aws-us-west-2-korg-mail-alma10-1.taild15c8.ts.net [100.103.45.18])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id D127D370AF8;
	Tue,  9 Jun 2026 16:08:57 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=100.103.45.18
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1781021338; cv=none; b=uDHFYQO6aJUaXD6uk11SMJEaLCOwqp3kI7tQOMEMa+/x59xEkN5TNfQcoZq5ky2Pw7M1G6K8xVL9H8KzlQH3XNj1LIU5yQDb8DgHmSs6XU/RJxOchUCcuE6lhF2C6SNCEseu5UoPNGJCT+WPQvT6xWY45rPRXVLwEyma2tohn7U=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1781021338; c=relaxed/simple;
	bh=vyCp2p5X5iqBR090E+xlLAPU8K1FYQKLJCFtd6nS6VQ=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=qp/L32jhrMGmJG8LLiy4+1UHDZN5hfJQ/+JMP/Sz9WJ9/y7hZNqDfia1g9AtOW0rWLu0Glc5zyzPAPWxwvIg71QZkcchBVpUeqO+axa+i9qnYAE01N4TfOlGguSz/vVrefpEYvfJ4n3WINUX70UAbi6SJE6QZJAO6JdBm37WNG0=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=hLbL7nRM; arc=none smtp.client-ip=100.103.45.18
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="hLbL7nRM"
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 14E931F00893;
	Tue,  9 Jun 2026 16:08:51 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kernel.org;
	s=k20260515; t=1781021337;
	bh=Jx0m1CTbUVR7hcsktvXo2yEe+jD7bQ3IVimdzKeqnnY=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To;
	b=hLbL7nRMN5Lln+OBoytoF8Fb4JIUzl2MvtqQlK+PsH/G2qO3P3fkIT5cBfi3u9ZbI
	 ACdbEsusPxCoygmPffviS2zuOcAnJ5fav55YdsIq1RxXwFn513YqBPmJyPCDIRixx3
	 ig8u6zCIs07WGvFsFJY88hIciHv7mgeaVnK51uAcIrHIRxyB0mxzjumUQVSRoMnNX2
	 +/4UYH13kVOCW2T1PRhUh9g5QGloQO5ilZ+1ksfRdv+YAzwQHL//LNVWT40Pd4hdV2
	 JQo/nsfSCQJv+LybS1uArM1ZsiDprBl2VeNx6pcIveQKzWJVwp/kBAI9noahsxXnL0
	 d/j3jCHGVZrBQ==
Date: Tue, 9 Jun 2026 17:08:49 +0100
From: Conor Dooley <conor@kernel.org>
To: Yunhui Cui <cuiyunhui@bytedance.com>
Cc: akpm@linux-foundation.org, alex@ghiti.fr, andrew+kernel@donnellan.id.au,
	aou@eecs.berkeley.edu, apatel@ventanamicro.com, apopple@nvidia.com,
	atishp@rivosinc.com, baolin.wang@linux.alibaba.com,
	cleger@rivosinc.com, conor+dt@kernel.org, debug@rivosinc.com,
	devicetree@vger.kernel.org, guodong@riscstar.com,
	hui.wang@canonical.com, krzk+dt@kernel.org,
	linux-kernel@vger.kernel.org, linux-riscv@lists.infradead.org,
	liu.xuemei1@zte.com.cn, namcao@linutronix.de, nick.hu@sifive.com,
	palmer@dabbelt.com, pincheng.plct@isrc.iscas.ac.cn, pjw@kernel.org,
	qingwei.hu@bytedance.com, ritesh.list@gmail.com,
	rmclure@linux.ibm.com, robh@kernel.org, wangruikang@iscas.ac.cn,
	zhangchunyan@iscas.ac.cn, zong.li@sifive.com
Subject: Re: [PATCH v3 1/3] dt-bindings: riscv: clarify Svadu boot-time
 behavior
Message-ID: <20260609-washboard-fantasize-ddf0a9752df8@spud>
References: <20260609130021.99899-1-cuiyunhui@bytedance.com>
 <20260609130021.99899-2-cuiyunhui@bytedance.com>
Precedence: bulk
X-Mailing-List: devicetree@vger.kernel.org
List-Id: <devicetree.vger.kernel.org>
List-Subscribe: <mailto:devicetree+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:devicetree+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: multipart/signed; micalg=pgp-sha512;
	protocol="application/pgp-signature"; boundary="XXuB5ejAtQyRxm8b"
Content-Disposition: inline
In-Reply-To: <20260609130021.99899-2-cuiyunhui@bytedance.com>


--XXuB5ejAtQyRxm8b
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
Content-Transfer-Encoding: quoted-printable

On Tue, Jun 09, 2026 at 09:00:18PM +0800, Yunhui Cui wrote:
> Clarify that systems which advertise only Svadu have hardware PTE A/D
> updating enabled at boot, while systems advertising both Svade and Svadu
> must enable Svadu explicitly with SBI FWFT.
>=20
> Signed-off-by: Yunhui Cui <cuiyunhui@bytedance.com>
> Reviewed-by: Qingwei Hu <qingwei.hu@bytedance.com>
> ---
>  Documentation/devicetree/bindings/riscv/extensions.yaml | 6 +++---
>  1 file changed, 3 insertions(+), 3 deletions(-)
>=20
> diff --git a/Documentation/devicetree/bindings/riscv/extensions.yaml b/Do=
cumentation/devicetree/bindings/riscv/extensions.yaml
> index 2b0a8a93bb214..b09888e9988de 100644
> --- a/Documentation/devicetree/bindings/riscv/extensions.yaml
> +++ b/Documentation/devicetree/bindings/riscv/extensions.yaml
> @@ -294,10 +294,10 @@ properties:
>                 of the PTE A/D bits or page faults when they need updated.
>              2) Only Svade present in DT =3D> Supervisor must assume Svad=
e to be
>                 always enabled.
> -            3) Only Svadu present in DT =3D> Supervisor must assume Svad=
u to be
> -               always enabled.
> +            3) Only Svadu present in DT =3D> Supervisor must assume Svad=
u is
> +               enabled at boot.

Commit message is missing an explanation of why this behaviour change is
not problematic. Although, to be honest, I am not sure what the changed text
actually means. If only Svadu is present, then the hardware doesn't support
Svade, and therefore Svadu would never be anything other than enabled so
changing the wording to specify "at boot" seems less clear?

>              4) Both Svade and Svadu present in DT =3D> Supervisor must a=
ssume
> -               Svadu turned-off at boot time. To use Svadu, supervisor m=
ust
> +               Svadu is disabled at boot time. To use Svadu, supervisor =
must

This change doesn't actually do anything, "turned-off" and "disabled"
are the same thing - although the latter is more desirable wording I
think. I have no problems with this portion of the patch.

>                 explicitly enable it using the SBI FWFT extension.
> =20
>          - const: svadu
> --=20
> 2.39.5
>=20

--XXuB5ejAtQyRxm8b
Content-Type: application/pgp-signature; name="signature.asc"

-----BEGIN PGP SIGNATURE-----

iHUEABYKAB0WIQRh246EGq/8RLhDjO14tDGHoIJi0gUCaig6kQAKCRB4tDGHoIJi
0qsZAPwId/1zTcbLJx60ON63GfqhF2b8UvLVSnZudmSdT6UhsQD/XAQQJuzW96SR
XFKW40bbtydXx+nfrNFUAL10XllnQgI=
=8vKN
-----END PGP SIGNATURE-----

--XXuB5ejAtQyRxm8b--
