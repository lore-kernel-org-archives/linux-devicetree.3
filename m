Received: from smtp.kernel.org (aws-us-west-2-korg-mail-alma10-1.taild15c8.ts.net [100.103.45.18])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 550D32D94B5
	for <devicetree@vger.kernel.org>; Sat, 23 May 2026 19:24:30 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=100.103.45.18
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1779564271; cv=none; b=RXBrUd5+dufd3m4wvheFPfSx2jxIhCuemQBzQG9YleuTubJlURfstBfXDeXIr8MDL0+IRih3dUFN87cyOU1HDm+1rDvJUNluJVTNAmo2OhKoOrj5Z4rs67uOAOQpN2UGt7OfmdrV9ZGSx/01uf/RBj1o+CY39Rfx9EgObNq8vbE=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1779564271; c=relaxed/simple;
	bh=jUccmi8Db/tVAeIz5sogiMwGZEG8y6vB1WZ7nSu7dlg=;
	h=From:Subject:To:Cc:In-Reply-To:References:Content-Type:Date:
	 Message-Id; b=ugXGMA0xqbGkgb6JHQjfSpVOMSsQ0I+rqfyHrID9hEg1H5q/k5Pizrr7GCtrgtm63N0J8atknKy4HxE9ZcbgKPP1ptJohWxfcZDhaihjB674qFK95xjML4+vIPFKzQaDfy++cO3NGHJa3z2ZxnTKLeIjy2INXfW0RVuHipvIU60=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=eUnOuh5j; arc=none smtp.client-ip=100.103.45.18
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="eUnOuh5j"
Received: by smtp.kernel.org (Postfix) with ESMTPSA id BDBB31F000E9;
	Sat, 23 May 2026 19:24:29 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kernel.org;
	s=k20260515; t=1779564269;
	bh=NwYdkVfM8OS98mQ8RAFJZpFVjMZn3HXhHLiLTprVk/k=;
	h=From:Subject:Reply-To:To:Cc:In-Reply-To:References:Date;
	b=eUnOuh5j5OdhBP1+Sjarj2o0o1h9AW0+iZ3dQsidpy0OZaNqUzfD0edsS2We0H2op
	 PH8Gfi9ys/gZV7onBWU9TiGyArDeNskTCsiW6h2DGJ+vWq7/pNycvFIDNhG8U1qcU7
	 9JtfKQKf96vqv8pyVxmi3zRfsguJhmjRLz8alqrZCbVOYd4rlcAK4fNaQJeLkFXzhe
	 30JKpA6rHaIHQ8/ws6bgf5keogWFQ8w83Caz6CUf97rr4p2eOBceYvcOIuMojpHQ20
	 1nxhtjxWT/rbZOD30VUFSmgLNvDB/GPCTSmUFgZ1JbvQV0z18frunFHbKL6jFXbYwt
	 RRncoLbNyjyFA==
From: sashiko-bot@kernel.org
Subject: Re: [PATCH 2/2] devicetree: Mark QCE bindings as deprecated
Reply-To: sashiko-reviews@lists.linux.dev
To: "Demi Marie Obenour via B4 Relay" <devnull+demiobenour.gmail.com@kernel.org>
Cc: conor+dt@kernel.org, robh@kernel.org, devicetree@vger.kernel.org
In-Reply-To: <20260523-delete-qce-v1-2-86105cd7f406@gmail.com>
References: <20260523-delete-qce-v1-2-86105cd7f406@gmail.com>
Content-Type: text/plain; charset=utf-8
Content-Transfer-Encoding: quoted-printable
Date: Sat, 23 May 2026 19:24:28 +0000
Message-Id: <20260523192429.BDBB31F000E9@smtp.kernel.org>
Precedence: bulk
X-Mailing-List: devicetree@vger.kernel.org
List-Id: <devicetree.vger.kernel.org>
List-Subscribe: <mailto:devicetree+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:devicetree+unsubscribe@vger.kernel.org>

Thank you for your contribution! Sashiko AI review found 1 potential issue(=
s) to consider:
- [Medium] Improper deprecation of a Device Tree binding based on Linux dri=
ver usage, along with missing `deprecated: true` property.
--

commit b96bab0a35ba5a2a033dd44bb8dfef71eb077fa4
Author: Demi Marie Obenour <demiobenour@gmail.com>

devicetree: Mark QCE bindings as deprecated

This commit updates the description of the QCE crypto controller binding
to state that it is no longer used by the kernel and is kept only for
backwards compatibility.

> devicetree: Mark QCE bindings as deprecated
>
> They are no longer used by the kernel.  Keep them to avoid unnecessary
> churn and because I know next to nothing about devicetree.

[Severity: Medium]
Aren't device tree bindings intended to describe hardware independently of
OS or software drivers? Deprecating a hardware binding solely because the
Linux kernel driver was removed appears to violate the principle of
OS-agnostic hardware description.

> diff --git a/Documentation/devicetree/bindings/crypto/qcom-qce.yaml b/Doc=
umentation/devicetree/bindings/crypto/qcom-qce.yaml
> index 08febd66c22ba..0f378073ddf55 100644
> --- a/Documentation/devicetree/bindings/crypto/qcom-qce.yaml
> +++ b/Documentation/devicetree/bindings/crypto/qcom-qce.yaml
> @@ -14,6 +14,9 @@ description:
>    This document defines the binding for the QCE crypto
>    controller found on Qualcomm parts.
> =20
> +  This driver is no longer used and so this binding only exists
> +  for backwards compatibility.
> +
>  properties:
>    compatible:
>      oneOf:

[Severity: Medium]
If this binding should legitimately be marked as deprecated, does it also
need the standard deprecated: true JSON schema property at the root level?

By only adding an informal note to the description, validation tools like
dtbs_check cannot parse this state and will fail to issue standard
deprecation warnings.

--=20
Sashiko AI review =C2=B7 https://sashiko.dev/#/patchset/20260523-delete-qce=
-v1-0-86105cd7f406@gmail.com?part=3D2
