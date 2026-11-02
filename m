Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=100.103.45.18
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1793636240;
	b=hxXzqa8SOFkLwQUxtz51kJBVe2Lf8fWDV2NSRemGpqHvJmZdOaOp+5x3/xM3LklGRapC
	 97v+I7oHfbv0LtY9aaUtkFgPoVEJkDyxmsqnkYyH87wEwcvmBXt2uJONrfz4c6gfiQQaf
	 5Pp/2rP3e0irB5VjqmMrCdie6ophn4561ADd8K6G9v+SnuP628fB4/4IkR3ltxshjz6Zn
	 YklRc2+/1TkhB9eOaBNz+fLXPk8USFNfE1DiJ+LfDCtxVRnrc5IsuvSqMuCYqGzie4qvU
	 ZQGpUYpKo6qDZ32tCW+LEOYm4Dg80sJe3sduNQmKvqQeWoOXyljBbmqC2jbJZONNNxw==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1793636240;
	h=Received:DKIM-Signature:Message-ID:From:Subject:Reply-To:To:Cc:
	 In-Reply-To:References:Content-Type:Content-Transfer-Encoding:Date;
	bh=0uil3qZ1+L3ffcGbu+A5qDi2CDtJapmk4dus4KXxq8A=;
	b=cnJJAHP7pdly+Ob8T4WND625/qe5d8QDdfWsT1w70lO0VjhwJK5yOhUcsTdqG4f84AK4
	 by775uI5Nxds2uVbCK/7EpXRyflxT1cbB4gp5I385OlQotqkfbD687cps6PezbYvjczjZ
	 nDxCjWsAScMOZlChobYzBTB9VZ44d39a2HAXzdOJUswFUYAEVQGxCNsEPEgwjYHsdyVJ1
	 kNLLie27kaSWEx4w/IbWXHSKZEI1zlMC3sf3DO/sXFivjkL2v5Al+YQR2mWcXV4V6Dwhp
	 VD0fUzJkh6Y3L5jRNZyt7EDjN2UJk2vJm4rRhFWD697byAi059OJ4TAvRfT3InZE2jw==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dkim=pass header.d=kernel.org header.i=@kernel.org header.a=rsa-sha256 header.s=k20260515 header.b=QLG1FnfA;
	arc=none smtp.remote-ip=100.103.45.18
Received: from smtp.kernel.org (quasi.space.kernel.org [100.103.45.18])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 66FBF6070CB2
	for <devicetree@vger.kernel.org>; Mon,  2 Nov 2026 16:17:20 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key, unprotected) header.d=kernel.org header.i=@kernel.org header.a=rsa-sha256 header.s=k20260515 header.b=QLG1FnfA
Received: by smtp.kernel.org (Postfix) with ESMTPSA id C86C41F00A16;
	Mon,  2 Nov 2026 16:17:19 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kernel.org;
	s=k20260515; t=1793636240;
	bh=0uil3qZ1+L3ffcGbu+A5qDi2CDtJapmk4dus4KXxq8A=;
	h=From:Subject:Reply-To:To:Cc:In-Reply-To:References:Date;
	b=QLG1FnfAmX1EjLj2mQSLhELZDZUDsJZ8F/lKJoQLtY++ab3bSMy8gHvJYueaDzAEq
	 M7wyjW7kUMRfBaXncCgSW5o4K0vux8hNa6q203Hbi9Ms8DiDXneaxmnRcF9cJ/w/3S
	 W41pUsqyEr8l6QcgCbJXiDzASotqC6X0lcBSQB1/HkEYBAM5ybBvHRK/bR8+DNfDBI
	 La4bArn27AxAj1tDJwYSijTcCq4YRr6ppWy3VMXdBZi+uueHHyUKc6gc9rMBkchJFA
	 5GFodn/g68dHivuFeTzQ+K04Io8tq8T8I/4wqOqFdR8Fky+C4O+dH44/C3cdrsxRTz
	 uLRUPek4Fo6Jg==
Message-ID: <sashiko-outbox-193745@kernel.org>
From: sashiko-bot@kernel.org
Subject: Re: [PATCH v12 5/9] media: Documentation: uapi: Add qcom-camss ISP
 params documentation
Reply-To: sashiko-reviews@lists.linux.dev
To: "Loic Poulain" <loic.poulain@oss.qualcomm.com>
Cc: devicetree@vger.kernel.org, robh@kernel.org, conor+dt@kernel.org, media-ci@linuxtv.org
In-Reply-To: <20261102-camss-isp-ope-v12-5-702254689feb@oss.qualcomm.com>
References: <20261102-camss-isp-ope-v12-0-702254689feb@oss.qualcomm.com>
 <20261102-camss-isp-ope-v12-5-702254689feb@oss.qualcomm.com>
Content-Type: text/plain; charset=utf-8
Content-Transfer-Encoding: quoted-printable
Date: Mon, 02 Nov 2026 16:17:19 +0000
X-Mailing-List: devicetree@vger.kernel.org
List-Id: <devicetree.vger.kernel.org>
List-Post: <mailto:devicetree@vger.kernel.org>
List-Help: <mailto:devicetree+help@vger.kernel.org>
List-Subscribe: <mailto:devicetree+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:devicetree+unsubscribe@vger.kernel.org>
List-Owner: <mailto:devicetree+owner@vger.kernel.org>
Precedence: list

Thank you for your contribution! Sashiko AI review found 1 potential issue(=
s) to consider:
- [Low] media: Documentation: Sphinx indentation errors via qcom-camss-conf=
ig.h
--

commit a20a54d2387cdb60e4b3cbece3fab3f39bdd075e
Author: Loic Poulain <loic.poulain@oss.qualcomm.com>

media: Documentation: uapi: Add qcom-camss ISP params documentation

This commit adds documentation for the Qualcomm CAMSS ISP parameters metada=
ta
format (V4L2_META_FMT_QCOM_ISP_PARAMS) and wires
include/uapi/linux/qcom-camss-config.h into the Sphinx documentation build =
via
a kernel-doc directive.

> diff --git a/Documentation/userspace-api/media/v4l/metafmt-qcom-isp.rst b=
/Documentation/userspace-api/media/v4l/metafmt-qcom-isp.rst
> new file mode 100644
> index 0000000000000..da0dd9b0884ea
> --- /dev/null
> +++ b/Documentation/userspace-api/media/v4l/metafmt-qcom-isp.rst

[ ... ]

> +	/* Identity curve (pass-through, gamma 1.0) */
> +	for (unsigned int i =3D 0; i < CAMSS_GAMMA_LUT_SIZE; i++)
> +		gamma->glut[i] =3D gamma->blut[i] =3D gamma->rlut[i] =3D i;
> +
> +Qualcomm CAMSS ISP uAPI data types
> +=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=
=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D
> +
> +.. kernel-doc:: include/uapi/linux/qcom-camss-config.h

[Severity: Low]
Does wiring include/uapi/linux/qcom-camss-config.h into the documentation
build via this kernel-doc directive trigger Sphinx unexpected indentation
errors during make htmldocs?

In include/uapi/linux/qcom-camss-config.h, the kernel-doc comment for
struct camss_params_wb_gain has an indented numbered list immediately
following a two-line paragraph without a blank comment line in between:

 * Implements the CLC_WB pipeline module.  The pipeline applies three
 * sequential operations per channel:
 *   1. Subtract sub-offset (black-level subtraction)
 *   2. Multiply by gain    (colour balance)
 *   3. Add add-offset      (output pedestal)

Similarly, in struct camss_params_chroma_enhan, two multi-line paragraphs
are followed immediately by indented lines without a blank comment line:

 * RGB2Cb - Chroma (Cb) coefficients
 * Cb =3D a x ((B - G) + b(R - G)) + KCb
 * with:
 *   a =3D ap, when (B-G) + b(R-G) > 0; a =3D am, when (B-G) + b(R-G) =E2=
=89=A4 0;
 *   b =3D bp when (R-G) > 0; b =3D bm when (R-G) =E2=89=A4 0

and:

 * RGB2Cr - Chroma (Cr) coefficients:
 * Cr =3D c x ((R - G) + d(B - G)) + KCr
 * with:
 *   c =3D cp, when (R-G) + d(B-G) > 0; c =3D cm, when (R-G) + d(B-G) =E2=
=89=A4 0
 *   d =3D dp when (B-G) > 0; d =3D dm when (B-G) =E2=89=A4 0

When docutils parses the extracted reStructuredText, an indented line
immediately following a multi-line flush-left paragraph without an
intervening blank line raises UnexpectedIndentationError.

Also in include/uapi/linux/qcom-camss-config.h, the unprefixed RGB2Y,
RGB2Cb, and RGB2Cr paragraphs placed between member descriptions in
struct camss_params_chroma_enhan get appended to the trailing Description
section by kernel-doc, and the single-colon indented blocks in
struct camss_params_color_correct and struct camss_params_gamma are parsed
as reStructuredText definition lists rather than literal blocks because
they use ":" instead of "::".

Should the kernel-doc comments in include/uapi/linux/qcom-camss-config.h
be adjusted so that make htmldocs builds cleanly and renders these blocks
as intended?

--=20
Sashiko AI review =C2=B7 https://sashiko.dev/#/patchset/20261102-camss-isp-=
ope-v12-0-702254689feb@oss.qualcomm.com?part=3D5
