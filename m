Received: from smtp.kernel.org (aws-us-west-2-korg-mail-alma10-1.taild15c8.ts.net [100.103.45.18])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 7363B42046F
	for <devicetree@vger.kernel.org>; Wed, 23 Sep 2026 20:17:10 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=100.103.45.18
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1790194632; cv=none; b=EG38nMhx7dw+ozGwSAidDAbgE+F5Pb5cuK/0EgJE0A/y/wJ8+ERWo7Zc7eyL9jGpL26h0avSeLMA/Thq58iLLg7SKykGeWwF1OBJ79nl/zQtGY3Kw9ABQxL3QUJBdYDSkvEt8sA9ArUSee+3cApemKaiNVJA0tf3j+6uMr+AamU=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1790194632; c=relaxed/simple;
	bh=9FJ0ACN8NtSIO45XhBBwxYi3C9hdtYzpE3fHDtHaKk8=;
	h=From:Subject:To:Cc:In-Reply-To:References:Content-Type:Date:
	 Message-Id; b=dGDuBAzyfEIzn6/Rts34B3CKy1DqeEivEvSUKZlaOJxjXBPoiGMtfyN2oAOwwvA7fhBkNYGzcyX7sTPr3ts7UkDYNep8nJiv6rOOc/JITtvI6hvjfJ7e3MipTmK2alsXdeMMhMSnGwQqGIVwSeL7Q948+H01JjMnSJmsTbrMycE=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=G8BZJWXH; arc=none smtp.client-ip=100.103.45.18
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="G8BZJWXH"
Received: by smtp.kernel.org (Postfix) with ESMTPSA id E6A6A1F00893;
	Wed, 23 Sep 2026 20:17:07 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kernel.org;
	s=k20260515; t=1790194628;
	bh=yAjqfAW5bufm+AVogJB9WGLnr3zM55n/7TxWBu55cXw=;
	h=From:Subject:Reply-To:To:Cc:In-Reply-To:References:Date;
	b=G8BZJWXH/AeQQt/z6NE8wb4XMPVGdgWGdjJmhBDRva83xstzQVZuBsx0/gKuo9unM
	 6PeI74aIai+EKLZF7xFbBUPALi/nv4W26DYp9zzxmiJAWVGesXKjhLRZYLsyNrc2HH
	 jzz3+3vyVfnMdetDuszTdk0s2/4Fs0lj59hTKDYUzClNatqSIepaOUthBMorXz8bpE
	 8xRzoXo4CfhBuksctE5rJZpkfpqYL5zP3HLLLG1uW5XmFsLdZJ2k5HLvze/ChdrahN
	 vnqDLEhB8c9XHF6uXGFqi6jXV2acxZMhrIbZjqr3sho3Ni9BJVvbYv+qbiwzq/fPh7
	 h+EymL7t5NJdw==
From: sashiko-bot@kernel.org
Subject: Re: [PATCH v3 5/7] dt-bindings: display: allow the boot logo in a
 reserved memory region
Reply-To: sashiko-reviews@lists.linux.dev
To: "Max Pedraza" <maximpedraza@gmail.com>
Cc: conor+dt@kernel.org, devicetree@vger.kernel.org, robh@kernel.org, dri-devel@lists.freedesktop.org
In-Reply-To: <20260923201035.51007-6-maximpedraza@gmail.com>
References: <20260923201035.51007-1-maximpedraza@gmail.com>
 <20260923201035.51007-6-maximpedraza@gmail.com>
Content-Type: text/plain; charset=utf-8
Content-Transfer-Encoding: quoted-printable
Date: Wed, 23 Sep 2026 20:17:07 +0000
Message-Id: <20260923201707.E6A6A1F00893@smtp.kernel.org>
Precedence: bulk
X-Mailing-List: devicetree@vger.kernel.org
List-Id: <devicetree.vger.kernel.org>
List-Subscribe: <mailto:devicetree+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:devicetree+unsubscribe@vger.kernel.org>

Thank you for your contribution! Sashiko AI review found 1 potential issue(=
s) to consider:
- [Low] dt-bindings: oneOf allows partial image properties with memory-regi=
on
--

commit 9a7a18d6778dd2101e7f626e61f0b37dcf103451
Author: Max Pedraza <maximpedraza@gmail.com>
Subject: dt-bindings: display: allow the boot logo in a reserved memory reg=
ion

This commit allows the boot logo to be specified via a reserved memory
region instead of inline properties, enabling the image to be shared across
multiple device trees. It introduces a oneOf constraint intended to make
the two methods mutually exclusive.

> diff --git a/Documentation/devicetree/bindings/display/boot-logo-clut224.=
yaml b/Documentation/devicetree/bindings/display/boot-logo-clut224.yaml
> index 9dc34717639e9..a71fc09a7c071 100644
> --- a/Documentation/devicetree/bindings/display/boot-logo-clut224.yaml
> +++ b/Documentation/devicetree/bindings/display/boot-logo-clut224.yaml

[ ... ]

> @@ -103,10 +122,17 @@ properties:
> =20
>  required:
>    - compatible
> -  - width
> -  - height
> -  - clut
> -  - data
> +
> +# The image either lives in the device tree or in a reserved memory regi=
on,
> +# never both.
> +oneOf:
> +  - required:
> +      - width
> +      - height
> +      - clut
> +      - data
> +  - required:
> +      - memory-region

[Severity: Low]
Does this schema validation fully enforce the intended mutual exclusivity if
partial image properties are provided?

If a device tree includes memory-region alongside just a few of the image
properties (for example, accidentally including width and height but not cl=
ut),
the first branch of the oneOf evaluates to false. The second branch evaluat=
es
to true.=20

Since exactly one branch is true, the overall oneOf constraint succeeds. Th=
is
allows invalid device trees with overlapping configurations to silently pass
dt_binding_check.

Should the schema explicitly disallow the other properties when memory-regi=
on
is present to prevent this?

--=20
Sashiko AI review =C2=B7 https://sashiko.dev/#/patchset/20260923201035.5100=
7-1-maximpedraza@gmail.com?part=3D5
