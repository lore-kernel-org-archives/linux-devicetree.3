Received: from smtp.kernel.org (aws-us-west-2-korg-mail-alma10-1.taild15c8.ts.net [100.103.45.18])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 9C5453C0A1E
	for <devicetree@vger.kernel.org>; Sun, 27 Sep 2026 21:41:10 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=100.103.45.18
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1790545271; cv=none; b=gLuAyIyjT0twQAxyHAU6e/gVwOcRo+Zd+KZe5uVpO7dwqYXLgukQem9Jr6GIhi0tRbybxRfTf2KERdiS2aM1qSVzbUzQPxGFiy4x8Vjq5BjK1CEOEUpzLmScVj0H6QOTZWf+aLgdZ2sUgik5gbtjiSbbgeO9h26LT2a37Vo6kRQ=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1790545271; c=relaxed/simple;
	bh=mAszazHTopX9pDCFZIk0M4yEKtlkKilYCoVz6n/nb1A=;
	h=From:Subject:To:Cc:In-Reply-To:References:Content-Type:Date:
	 Message-Id; b=fuPBLmGt+W+FF9pHNvglJRW4Qk9xyRMX/RyzBavoLGPlmwfvSzUMtHQOU6qCzy6ixsuUvX3USw6oGuR14CXm9Kpwja9gY1N5XEupeFqT/kUStSB5+zz0jL8ZrS59+WWFIYPHTjDcU748yu0ypHgJor5vj7DaMI/EDMGwhPq2snU=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=TfyP0IAC; arc=none smtp.client-ip=100.103.45.18
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="TfyP0IAC"
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 34B2A1F000FF;
	Sun, 27 Sep 2026 21:41:10 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kernel.org;
	s=k20260515; t=1790545270;
	bh=lawUdhBEzDFUWw0DQtjfgvrdgr7dZzjarzYHTihFixg=;
	h=From:Subject:Reply-To:To:Cc:In-Reply-To:References:Date;
	b=TfyP0IACncbhbXN8E3uOTdAEjbw4xSQs2x15ALSIO3TfcnW0NupjTWxvNz55NSwxy
	 uOJBMME/shvuDppmTxXhcXECGkYAAET5coVC+noBYse2eI55T+f54AMy4WatcCvRc4
	 lFS1cC9FOBuw0VyBivq+fLxQSW2JlAjiiZMaJfvy+mdPFmOZRMqEokFDcR48AaNeSn
	 rSfunPVZEWtrHQZORTQ7yzyM06Im6GrsppXqG0lx70N0KvKBsmiOIYvJ/fDwHNiIpO
	 mw0R8VCyIfbiM5yot5Gw6LBdVv+T97hL4ZC5gbSnS2ADKIBkCaUNi2gflCMu3LFw58
	 wM0rAznLZp2kw==
From: sashiko-bot@kernel.org
Subject: Re: [PATCH] powerpc: dts: eiger: add placeholder reg to ndfc node
Reply-To: sashiko-reviews@lists.linux.dev
To: "Rosen Penev" <rosenp@gmail.com>
Cc: robh@kernel.org, conor+dt@kernel.org, devicetree@vger.kernel.org
In-Reply-To: <20260927213540.132854-1-rosenp@gmail.com>
References: <20260927213540.132854-1-rosenp@gmail.com>
Content-Type: text/plain; charset=utf-8
Content-Transfer-Encoding: quoted-printable
Date: Sun, 27 Sep 2026 21:41:09 +0000
Message-Id: <20260927214110.34B2A1F000FF@smtp.kernel.org>
Precedence: bulk
X-Mailing-List: devicetree@vger.kernel.org
List-Id: <devicetree.vger.kernel.org>
List-Subscribe: <mailto:devicetree+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:devicetree+unsubscribe@vger.kernel.org>

Thank you for your contribution! Sashiko AI review found 1 potential issue(=
s) to consider:
- [Medium] powerpc: dts: reg mismatch in ndfc@1,0 and commit message halluc=
ination
--

commit afb12c63aa6cb278745948eaa45ee1e2d6983ea8
Author: Rosen Penev <rosenp@gmail.com>

powerpc: dts: eiger: add placeholder reg to ndfc node

This commit adds a zeroed reg placeholder to the ndfc node in eiger.dts to
satisfy a new IBM NDFC binding requirement. It claims this matches an
existing placeholder in the nor_flash node.

>     Add a zeroed placeholder, as the nor_flash@0,0 node in the same file
>     already does.

[Severity: Medium]
Is this statement accurate? Looking at the nor_flash@0,0 node in
arch/powerpc/boot/dts/eiger.dts, there is no zeroed reg placeholder present,
only a comment indicating that the property is supplied by U-Boot:

				nor_flash@0,0 {
					compatible =3D "amd,s29gl512n", "cfi-flash";
					bank-width =3D <2>;
					/* reg property is supplied in by U-Boot */

> diff --git a/arch/powerpc/boot/dts/eiger.dts b/arch/powerpc/boot/dts/eige=
r.dts
> index 7a1231d9d6f04..fe7b518dae45d 100644
> --- a/arch/powerpc/boot/dts/eiger.dts
> +++ b/arch/powerpc/boot/dts/eiger.dts
> @@ -196,7 +196,7 @@ partition@3fa0000 {
> =20
>  				ndfc@1,0 {
>  					compatible =3D "ibm,ndfc";
> -					/* reg property is supplied by U-boot */
> +					reg =3D <0x00000000 0x00000000 0x00000000>; /* Filled in by U-Boot =
*/

[Severity: Medium]
Because the node's unit address is @1,0, does the first address cell in the
reg property need to be 0x1 to match? Setting it to 0x0 introduces a
unit_address_vs_reg dtc compiler warning.

--=20
Sashiko AI review =C2=B7 https://sashiko.dev/#/patchset/20260927213540.1328=
54-1-rosenp@gmail.com?part=3D1
