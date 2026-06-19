Received: from smtp.kernel.org (aws-us-west-2-korg-mail-alma10-1.taild15c8.ts.net [100.103.45.18])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 556DC175A94
	for <devicetree@vger.kernel.org>; Fri, 19 Jun 2026 12:39:16 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=100.103.45.18
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1781872757; cv=none; b=G9A1/LQxdI7bIN0Zo8tUEjMJcbDAv+axGLGWtTYcrLI9Zl7ng2L0FZ7sLybK7U3vEiOIWrvcDlcGPBJXhmnN/xHMJKIESSP6CbkHklDezpIgVLeo/MkJyUqpByMb0WKwrL8eWsBw88aDk1IMNzIOopQ3eNK8SbS5KN+acpjfnsA=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1781872757; c=relaxed/simple;
	bh=qCpmKPTi+inbiC6NLlEgpGHPR2gu8VrqXpK1V6gcB3c=;
	h=From:Subject:To:Cc:In-Reply-To:References:Content-Type:Date:
	 Message-Id; b=M/AzB9dRpReqKVpDM80DwN9e3ONFzAnA6wwEygNQ9f7j04/kXVFGhBu4DtCmYutC3NIVpXV+Ks1CerO2FHf3erQaAbGFZ2XD6aKS/G7zx6WIQdpxphdlXOFJSzZCuSnuuGDZ7h9ghRL/uk72ktc0hhOoLiF8JfdiaCIYYo7u4B4=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=j+JlxjHj; arc=none smtp.client-ip=100.103.45.18
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="j+JlxjHj"
Received: by smtp.kernel.org (Postfix) with ESMTPSA id BC7B31F000E9;
	Fri, 19 Jun 2026 12:39:15 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kernel.org;
	s=k20260515; t=1781872756;
	bh=xYd6qvL/8G+Ro508737Z6AE2FvHCkj2SEmBeKrL1bts=;
	h=From:Subject:Reply-To:To:Cc:In-Reply-To:References:Date;
	b=j+JlxjHjAf+hrrSYUOt5Toaw5D+36gCgjjbV/ev+HKHkf+s9soTKxoxCuGlGVOPZk
	 wCAaAuPHhtJGtz9+DqpRJo4lBAZj9948Azp6iA8h1ZAgfpJTiAEW0JC5WaqMxCGIsk
	 vsHb+h7nCiUvdVlhKHpVsDYLLGLHbtrPq/GfkPCSBEwjd4gRQTi11kmCP0JHmpun6V
	 hgi3GxXfh4SYOTDF+1FzcQXdRvYISG6RwV7O51ig2IYdvXtiZM4S336+y586efDTA3
	 V4jQGaWAyb7f+SciC8zm+/oh8hFDrGBrsV7UBpGB2M3aviMm114tUCEWnTxJWHprar
	 EaqWrkCHJT8Og==
From: sashiko-bot@kernel.org
Subject: Re: [PATCH v3] dt-bindings: misc: convert lis302.txt to YAML
Reply-To: sashiko-reviews@lists.linux.dev
To: "Jad Keskes" <inasj268@gmail.com>
Cc: robh@kernel.org, conor+dt@kernel.org, devicetree@vger.kernel.org
In-Reply-To: <20260619122446.867091-1-inasj268@gmail.com>
References: <20260619115649.840676-1-inasj268@gmail.com>
 <20260619122446.867091-1-inasj268@gmail.com>
Content-Type: text/plain; charset=utf-8
Content-Transfer-Encoding: quoted-printable
Date: Fri, 19 Jun 2026 12:39:15 +0000
Message-Id: <20260619123915.BC7B31F000E9@smtp.kernel.org>
Precedence: bulk
X-Mailing-List: devicetree@vger.kernel.org
List-Id: <devicetree.vger.kernel.org>
List-Subscribe: <mailto:devicetree+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:devicetree+unsubscribe@vger.kernel.org>

Thank you for your contribution! Sashiko AI review found 1 potential issue(=
s) to consider:
- [Medium] Redundant 'select' block fails its stated purpose in the commit =
message
--

commit 7b1f6ec4590fb8fea27ae6accf9a20a8de12ccd1
Author: Jad Keskes <inasj268@gmail.com>

dt-bindings: misc: convert lis302.txt to YAML

Replace the old lis302.txt with a YAML binding covering four compatibles.
The commit message states it includes a select block to avoid validating
nodes against both the misc and IIO schemas.

> Use a select block that matches only nodes with misc-driver
> compatibles (including standalone st,lis3lv02d for omap3-n950-n9
> and similar), paired with the IIO schema which handles the IIO
> side. This avoids both schemas validating the same node.

[Severity: Medium]
Does this select block actually prevent the IIO schema from validating
the node?

In the dt-schema architecture, schemas evaluate independently. A select
block in this misc schema only determines if this specific schema applies;
it has no effect on whether the IIO schema also matches the compatible
string.

The testing note mentioning "Pre-existing IIO schema errors on paired
compatible nodes unchanged" seems to confirm both schemas are still
validating the node.

> diff --git a/Documentation/devicetree/bindings/misc/st,lis3lv02d.yaml b/D=
ocumentation/devicetree/bindings/misc/st,lis3lv02d.yaml
> new file mode 100644
> index 0000000000000..c73371b754a1e
> --- /dev/null
> +++ b/Documentation/devicetree/bindings/misc/st,lis3lv02d.yaml
[ ... ]
> +select:
> +  anyOf:
> +    - properties:
> +        compatible:
> +          contains:
> +            const: st,lis302dl-spi
> +    - properties:
> +        compatible:
> +          contains:
> +            const: st,lis331dlh
> +    - properties:
> +        compatible:
> +          contains:
> +            const: st,lis33de
> +    - properties:
> +        compatible:
> +          contains:
> +            const: st,lis3lv02d
> +  required:
> +    - compatible

[Severity: Medium]
Is this explicit select block necessary?

Since this block exactly mirrors the default select block automatically
generated by dt-schema from the compatible property definition below it,
could this be removed entirely to simplify the binding?

--=20
Sashiko AI review =C2=B7 https://sashiko.dev/#/patchset/20260619122446.8670=
91-1-inasj268@gmail.com?part=3D1
