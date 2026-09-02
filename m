Received: from smtp.kernel.org (aws-us-west-2-korg-mail-alma10-1.taild15c8.ts.net [100.103.45.18])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 7EFC1450909
	for <devicetree@vger.kernel.org>; Wed,  2 Sep 2026 22:34:56 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=100.103.45.18
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1788388502; cv=none; b=pzsJuguY8UXirGgJxUeZuk+ZDt0oWm8TT2m1HLC8GWIx77bIDet+503QY0Vw4D6tCiGCQ6im7oLi6iISoDBZp0b709VtV6BrYbKGV6NpGKaEAnRD3bLW6NW7zNJYULIHUbFzjXyheLGPrXUX17gLTejRRLycHbYzaY9Ku1b1mtE=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1788388502; c=relaxed/simple;
	bh=wp5LjiWqv4qJtjlJlnwfbG0YFx+mW5VsPeJGKYZqjgk=;
	h=From:Subject:To:Cc:In-Reply-To:References:Content-Type:Date:
	 Message-Id; b=qdIThfZJPXJfTzXOQmPsCXDKX6EGhQCd2GC7a9GJcNbFsO9vZZCZOLwCHYc2txafDCc0Bh3l2xrPtLk+K6hCJel33q47HmfjUv9/3ogFKrXIbaxadnzJgG4BTYpBDRADJRWjLW2dM0HUyh0w51GCOUR8hCOnQ6pSZGrZdb7xgUA=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=TNIDYx+4; arc=none smtp.client-ip=100.103.45.18
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="TNIDYx+4"
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 52B461F00A3A;
	Wed,  2 Sep 2026 22:34:55 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kernel.org;
	s=k20260515; t=1788388495;
	bh=KZL9S6vMYjDEcfM9iHHw7OSzU9w53wTiFzvS39B+wJA=;
	h=From:Subject:Reply-To:To:Cc:In-Reply-To:References:Date;
	b=TNIDYx+4d6/+TSeTzseF1IgpfouUOrvOH6mG4klw9mTxihzYd2luTUPAl6HpI83gg
	 wAphvGl4B7h1U74kdahKmKOImr3kpNcxlSqg7/Z0H9N+ogf5GDUx2cCqofrfYfkCW4
	 aLjHo/DPgne+hlg55FidGO68xNKseQKZnRC/JQcE1P9dEj85OL3gIoZmJ+yl24jBUH
	 rvWWbHCjtGIhF6+0bZI0qiZMNH0Kfo6eUwyMBa+PLwALtquY5l+Na7F6O8q7ZvE8A0
	 pS6acWAizZMB+GI4HXgYzra0WdZ/LhbVnNUG+W+i6arg7gItDmL5Blc2kjV/OFxBdd
	 BbQH5inxCEjVw==
From: sashiko-bot@kernel.org
Subject: Re: [PATCH v2 1/3] dt-bindings: nvmem: uniphier-efuse: Add
 ti,am62p-efuse compatible
Reply-To: sashiko-reviews@lists.linux.dev
To: "Judith Mendez" <jm@ti.com>
Cc: conor+dt@kernel.org, devicetree@vger.kernel.org, robh@kernel.org
In-Reply-To: <20260902222759.736124-2-jm@ti.com>
References: <20260902222759.736124-1-jm@ti.com>
 <20260902222759.736124-2-jm@ti.com>
Content-Type: text/plain; charset=utf-8
Content-Transfer-Encoding: quoted-printable
Date: Wed, 02 Sep 2026 22:34:54 +0000
Message-Id: <20260902223455.52B461F00A3A@smtp.kernel.org>
Precedence: bulk
X-Mailing-List: devicetree@vger.kernel.org
List-Id: <devicetree.vger.kernel.org>
List-Subscribe: <mailto:devicetree+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:devicetree+unsubscribe@vger.kernel.org>

Thank you for your contribution! Sashiko AI review found 1 potential issue(=
s) to consider:
- [Low] The Device Tree binding groups an unrelated Texas Instruments compa=
tible string (`ti,am62p-efuse`) into the Socionext Uniphier eFuse schema st=
rictly to reuse a Linux driver, violating the rule that DT bindings must de=
scribe hardware.
--

commit bf8e60a2409a1898bd121ebca26b279cdf4f85e7
Author: Judith Mendez <jm@ti.com>

dt-bindings: nvmem: uniphier-efuse: Add ti,am62p-efuse compatible

This commit adds the ti,am62p-efuse compatible string to the Socionext
Uniphier eFuse binding. The commit message notes this is done so the
existing uniphier-efuse Linux driver can be used to read AM62P efuse
registers for silicon revision detection.

> diff --git a/Documentation/devicetree/bindings/nvmem/socionext,uniphier-e=
fuse.yaml b/Documentation/devicetree/bindings/nvmem/socionext,uniphier-efus=
e.yaml
> index e27cbae2d63a0..5e1b90fc1ae45 100644
> --- a/Documentation/devicetree/bindings/nvmem/socionext,uniphier-efuse.ya=
ml
> +++ b/Documentation/devicetree/bindings/nvmem/socionext,uniphier-efuse.ya=
ml
> @@ -16,7 +16,9 @@ allOf:
> =20
>  properties:
>    compatible:
> -    const: socionext,uniphier-efuse
> +    enum:
> +      - socionext,uniphier-efuse
> +      - ti,am62p-efuse

[Severity: Low]
Does grouping an unrelated Texas Instruments compatible string into a
Socionext binding conflict with the rule that Device Tree schemas must
describe hardware blocks rather than software driver mappings? Grouping
hardware from different vendors strictly to reuse a Linux driver creates
an inaccurate hardware description.

--=20
Sashiko AI review =C2=B7 https://sashiko.dev/#/patchset/20260902222759.7361=
24-1-jm@ti.com?part=3D1
