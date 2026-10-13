Received: from smtp.kernel.org (aws-us-west-2-korg-mail-alma10-1.taild15c8.ts.net [100.103.45.18])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 6BFFA48A8A4
	for <devicetree@vger.kernel.org>; Tue, 13 Oct 2026 17:57:41 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=100.103.45.18
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1791914263; cv=none; b=F2xpZHP1+peXv9+l2YscfE10Ow+7BzPLKILIH3ZPZqGS2JXshwP5m0ub+F+G/m1N5Uh5FNf1nCyX9gJIAjAS93SkUDdvw880/m/AbMjwNJvm/yQJqnkENIRvNt7lnfTPvCwjxgHNrTLybuuza+f18m3Ug0V09GWamqx4QzoQn0Q=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1791914263; c=relaxed/simple;
	bh=jqaNAnRSsfV8bObalWlXu/NbQCLLz7zZppBWlo8gFC0=;
	h=Message-ID:From:Subject:To:Cc:In-Reply-To:References:Content-Type:
	 Date; b=mf5rcCg4suwT7TbDH/3MJDR+iTmh8YxvILS3ML4GWUID/NwlEuxITfc9rWf0PRbNDZQnu6nWDf8t8n05VZbTRGdT/hCtiUiCcrGQUF+bAobHob8iYAhf5e2FVH3EGqUnXZ/hwKBgoYYeoOiEnTNdO0JBSfMNJHWz3VccX9XwbsU=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=mV90LPyG; arc=none smtp.client-ip=100.103.45.18
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="mV90LPyG"
Received: by smtp.kernel.org (Postfix) with ESMTPSA id DAF021F000FF;
	Tue, 13 Oct 2026 17:57:40 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kernel.org;
	s=k20260515; t=1791914261;
	bh=cWtpTuwN23onQgknLJF6EtvbRsy69y9WgIKzxv5QQNc=;
	h=From:Subject:Reply-To:To:Cc:In-Reply-To:References:Date;
	b=mV90LPyGUYcQr7rsE8bQWOR6tI422s4W01pWEuRCIdk6ui/ofX9ZHJKDtYo8iDtbd
	 Hq8xzdl4JsekTWqRjUVuPovRqgHzMjpbKqo9fap/pZnF98kZur4lomFPohpPk8PvPP
	 4NsS4sUjSTQ1m8mzfhuHGy9lNN7aTZPgC155d9NVAwpg6/Tc4YWWGt7rT1CVgsktNp
	 OUq4CVOXypyFe2jdeJuyZPjgEbYYd2TEdrES+hxMB+v4Cgyae+K97AVVF6vLkb0e56
	 LiRLYbf2hoCL5E1m1KWA2pZrYOY3ZdqmnstAXVjKwwy2B45DNShiwOWdHmTEsyqT75
	 OwJmKEJCZ5ntA==
Message-ID: <sashiko-outbox-170281@kernel.org>
From: sashiko-bot@kernel.org
Subject: Re: [PATCH 1/5] dt-bindings: crypto: add Rambus CryptoManager Hub
Reply-To: sashiko-reviews@lists.linux.dev
To: "Alex Ousherovitch" <aousherovitch@rambus.com>
Cc: devicetree@vger.kernel.org, robh@kernel.org, conor+dt@kernel.org
In-Reply-To: <20261013174847.2192609-2-aousherovitch@rambus.com>
References: <20261013174847.2192609-1-aousherovitch@rambus.com>
 <20261013174847.2192609-2-aousherovitch@rambus.com>
Content-Type: text/plain; charset=utf-8
Content-Transfer-Encoding: quoted-printable
Date: Tue, 13 Oct 2026 17:57:40 +0000
Precedence: bulk
X-Mailing-List: devicetree@vger.kernel.org
List-Id: <devicetree.vger.kernel.org>
List-Subscribe: <mailto:devicetree+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:devicetree+unsubscribe@vger.kernel.org>

Thank you for your contribution! Sashiko AI review found 1 potential issue(=
s) to consider:
- [Low] dt-bindings: impossible 'not: {}' compatible constraint and missing=
 examples
--

commit 113cff11f8b766425bbb8e592b3c6da3fc635bbd
Author: Alex Ousherovitch <aousherovitch@rambus.com>

dt-bindings: crypto: add Rambus CryptoManager Hub

Add device tree binding schema for the Rambus CryptoManager Hub (CMH)
hardware crypto accelerator.  The binding describes the parent
SoC-level node with its SIC register region and one queue@N child
node per mailbox the host owns.

> diff --git a/Documentation/devicetree/bindings/crypto/rambus,cmh-v1030.ya=
ml b/Documentation/devicetree/bindings/crypto/rambus,cmh-v1030.yaml
> new file mode 100644
> index 0000000000000..fb05cc636df66
> --- /dev/null
> +++ b/Documentation/devicetree/bindings/crypto/rambus,cmh-v1030.yaml
> @@ -0,0 +1,144 @@

[ ... ]

> +properties:
> +  compatible:
> +    items:
> +      - not: {}
> +        description: SoC-specific compatible, e.g. vendor,soc-cmh

[Severity: Low]
Will this unconditionally reject all inputs? Since the empty schema {}
matches any value, the not: {} constraint under properties:compatible will
fail validation for any string.

Usually not: {} is used within a oneOf fallback branch to enforce
SoC-specific compatibles, but there are no valid alternatives provided
here.

> +      - const: rambus,cmh-v1030

[ ... ]

> +required:
> +  - compatible
> +  - reg
> +  - "#address-cells"
> +  - "#size-cells"
> +
> +additionalProperties: false

[Severity: Low]
Is there an examples section missing from the end of this file?

Without an examples section, make dt_binding_check won't instantiate any
examples to validate against the schema. This omission avoids checking the
schema and seems to hide the fact that the not: {} constraint on the
compatible string makes it impossible to validate.

--=20
Sashiko AI review =C2=B7 https://sashiko.dev/#/patchset/20261013174847.2192=
609-1-aousherovitch@rambus.com?part=3D1
