Received: from smtp.kernel.org (aws-us-west-2-korg-mail-alma10-1.taild15c8.ts.net [100.103.45.18])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 2A9D24052C9;
	Mon, 10 Aug 2026 16:25:15 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=100.103.45.18
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1786379117; cv=none; b=lyAu5W7rW9FYHArIiWMSe3OtfKPACzbIv9SFtXhTVXbFClxUa15PCS6oBxcOb1L7sjFoI7k8KrgIvFxnuznnybo8PmlzfX+2FeMcbckvmCXsvgdViKCbO6aTlA5Pw5A1KszIuRF3LHu0/Oja38mha7XtIXmnU6ONd4lz+Y6OPiY=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1786379117; c=relaxed/simple;
	bh=CJ/USOXX6aUvTnNwHjJvYHTVpPAzXKoZJF4QI4i+dLE=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=Wrr2/M7g+1pK2JBTi8YWEZo9p51dbr8CM29MrUMIo+0qev3KxmWYGBtXzk+Hn5PnOXtiiPYvmYeVnenhN5M9+EFhQrMsJkt5Nvm/ZHCu2QQfRxbS1NxZ75ayOjL+aHAu3QzZpXu9l6JxgRg1D+NUqaM4wKHJ43adLLlbtiF77Ks=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=nq+01urf; arc=none smtp.client-ip=100.103.45.18
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="nq+01urf"
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 382A01F000E9;
	Mon, 10 Aug 2026 16:25:10 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kernel.org;
	s=k20260515; t=1786379115;
	bh=pAh3v8DSOricP8c8IdomHmGR384D8GLRdHwe8ZhhfrM=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To;
	b=nq+01urfpOf3tSS6UIVs7/4WXxunBYnb+DDgCzWxsKV8RSxnWCAdzqcSlygfU7GuL
	 vmsJIuLfdzPHWglGKyY8r4xSb8a4RSQ1tyM5m6IGCU0KZ9h6HG5qsEWl6Aaobl7O3D
	 Yby4KfuiW+2rjjFbak/6Ejs+EX6N/UkYltRbyanztdNPQYOmsPj/FyZj9oaNwIRliy
	 pQd8tzXsl+1sk0cmr4m4fcqqKj7LCHuYPXjyum8y5jW7M1lcIgLTUe6xAgMF6P5GJ8
	 lCAUhECwi3svbQ1IJvUc6nLN2WCsFt5A0hYbFABvtY4CFvJTuoaMCkSc/9i85bZnOI
	 VK0o+Lh9L0e1g==
Date: Mon, 10 Aug 2026 17:25:08 +0100
From: Conor Dooley <conor@kernel.org>
To: Yu-Chien Peter Lin <peter.lin@sifive.com>
Cc: devicetree@vger.kernel.org, linux-riscv@lists.infradead.org,
	linux-kernel@vger.kernel.org, robh@kernel.org, krzk+dt@kernel.org,
	conor+dt@kernel.org, pjw@kernel.org, palmer@dabbelt.com,
	aou@eecs.berkeley.edu, alex@ghiti.fr, samuel.holland@sifive.com,
	dlan@kernel.org, guodong@riscstar.com, dfustini@oss.tenstorrent.com,
	michal.simek@amd.com, junhui.liu@pigmoral.tech,
	darshan.prajapati@einfochips.com, akpm@linux-foundation.org,
	zhangchunyan@iscas.ac.cn, luxu.kernel@bytedance.com,
	pincheng.plct@isrc.iscas.ac.cn, nick.hu@sifive.com,
	jim.shu@sifive.com, zong.li@sifive.com, greentime.hu@sifive.com,
	robin.randhawa@sifive.com, scott@riscstar.com,
	dave.patel@riscstar.com, raymond.mao@riscstar.com,
	anup@brainfault.org, pawandeep.oza@oss.qualcomm.com
Subject: Re: [PATCH v2 1/3] dt-bindings: riscv: Add Worlds ISA extensions
Message-ID: <20260810-penpal-aluminum-772319e5fc10@spud>
References: <20260729163908.249838-1-peter.lin@sifive.com>
 <20260729163908.249838-2-peter.lin@sifive.com>
Precedence: bulk
X-Mailing-List: devicetree@vger.kernel.org
List-Id: <devicetree.vger.kernel.org>
List-Subscribe: <mailto:devicetree+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:devicetree+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: multipart/signed; micalg=pgp-sha512;
	protocol="application/pgp-signature"; boundary="LORA+nUn+PLrFGWG"
Content-Disposition: inline
In-Reply-To: <20260729163908.249838-2-peter.lin@sifive.com>

--LORA+nUn+PLrFGWG
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
Content-Transfer-Encoding: quoted-printable

On Thu, Jul 30, 2026 at 12:39:06AM +0800, Yu-Chien Peter Lin wrote:
> Add DT bindings for five RISC-V Worlds ISA extensions
> that implement World ID tagging for hardware-enforced
> context isolation. Also, add checks for extension
> dependency requirements.
>=20
> Signed-off-by: Yu-Chien Peter Lin <peter.lin@sifive.com>
> ---
>  .../devicetree/bindings/riscv/extensions.yaml | 53 +++++++++++++++++++
>  1 file changed, 53 insertions(+)
>=20
> diff --git a/Documentation/devicetree/bindings/riscv/extensions.yaml b/Do=
cumentation/devicetree/bindings/riscv/extensions.yaml
> index 2b0a8a93bb21..7a57191a0293 100644
> --- a/Documentation/devicetree/bindings/riscv/extensions.yaml
> +++ b/Documentation/devicetree/bindings/riscv/extensions.yaml
> @@ -193,12 +193,35 @@ properties:
>              ratified at commit d70011dde6c2 ("Update to ratified state")
>              of riscv-j-extension.
> =20
> +        - const: smlwid
> +          description: |
> +            The standard Smlwid extension for M-mode control of lower
> +            privilege World ID via the mlwid CSR as ratified at commit
> +            TBD ("TBD") of riscv-worlds.


btw, when you send a v3 of this please mark it RFC, since you're using
placeholders here for the commit hashes of the extension being frozen.

Cheers,
Conor.

--LORA+nUn+PLrFGWG
Content-Type: application/pgp-signature; name=signature.asc

-----BEGIN PGP SIGNATURE-----

iHUEABYKAB0WIQRh246EGq/8RLhDjO14tDGHoIJi0gUCann7ZAAKCRB4tDGHoIJi
0vC+AQDjP2ByBSbSrh+lcSWq4XN0Z9/ci23W+K7QuvES9ZjwbwEAlxtv2WRXDNPa
W5wysXy5T+CWHJdCnJFL6PUn9c4UMAs=
=KR6P
-----END PGP SIGNATURE-----

--LORA+nUn+PLrFGWG--
