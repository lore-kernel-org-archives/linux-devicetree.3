Received: from smtp.kernel.org (aws-us-west-2-korg-mail-alma10-1.taild15c8.ts.net [100.103.45.18])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 3855930E0EE
	for <devicetree@vger.kernel.org>; Thu, 15 Oct 2026 06:09:09 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=100.103.45.18
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1792044552; cv=none; b=phb1IC9ry4nR36KFcbGDSkN8OPPGM0TY3hrwFZC9c3FQxmcQs3xTgaRz7PCpBaBdfm1TzQkRg8jkgJHpGbQP9E5F9ZfSi0ZOcR9SCVus6IpPQcf037mg0WH7pl3Tnqq0AF2gcYvcr4XFMEA2tk4T0VA3knUIEc9Gq3wQ6vkvItY=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1792044552; c=relaxed/simple;
	bh=GjL4+gc9z0F3k9oy4GepjNMZ28B3PTeRZOGfMJ3c+qA=;
	h=Message-ID:From:Subject:To:Cc:In-Reply-To:References:Content-Type:
	 Date; b=onJpktCJ4uU7Q8A+ztGv8yxp2/aZ+mYWi34s9spsd648Dvk+RTXMjeSRciT+BhMHO+zPnxCQVfTgGqOF0nbuZkveS4zUtomvEUzlrdMyk59b5eT2xOSJZZHUHneRhzx65qOYaXlPUlPeCywCS6OPdjYFLCWqoRdmzcnFbC9siWk=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=H2wFn7o5; arc=none smtp.client-ip=100.103.45.18
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="H2wFn7o5"
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 6DBEB1F000C4;
	Thu, 15 Oct 2026 06:09:09 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kernel.org;
	s=k20260515; t=1792044549;
	bh=qFpIwQLzMOylvUEobHZid5TO1ei2B4hrz1kYM/a0D6A=;
	h=From:Subject:Reply-To:To:Cc:In-Reply-To:References:Date;
	b=H2wFn7o5YmTiyvCbnHg1Qid8AdcGuGiK1OFKoOLhFol9L4G+nwMEPBpgFkA8SNsaQ
	 H58PGg8P8/w07OM5hKlG+GsqDqgWVJRkHvss7Wu/wn0U1hE7S90xkslcGOxL1ChXkK
	 ND8LVNCcrafyUYEMYHKGNcbPNUmmCdy/K7+ga54Zju1NRDGsezZoo1DG1yEbg9k8dd
	 SqzRespf0GM6kpVnJGViVOti9mfqUC5fv1SX2mNfF4fT0X3hISelxQtVbz74tNPtH1
	 8FCUjHo24VQFnZVZ6gbjA7oq1pgME0WyrYcsUw46vPU3aeN1dFrRhKR1D4Hz46gIZY
	 cQHbgss+K+Mvg==
Message-ID: <sashiko-outbox-172330@kernel.org>
From: sashiko-bot@kernel.org
Subject: Re: [PATCH 1/2] ASoC: dt-bindings: Add Iron Device MA5311
Reply-To: sashiko-reviews@lists.linux.dev
To: "Hyunuk Son" <hyunuk.son@irondevice.com>
Cc: devicetree@vger.kernel.org, robh@kernel.org, conor+dt@kernel.org
In-Reply-To: <20261015060408.128711-2-hyunuk.son@irondevice.com>
References: <20261015060408.128711-1-hyunuk.son@irondevice.com>
 <20261015060408.128711-2-hyunuk.son@irondevice.com>
Content-Type: text/plain; charset=utf-8
Content-Transfer-Encoding: quoted-printable
Date: Thu, 15 Oct 2026 06:09:08 +0000
Precedence: bulk
X-Mailing-List: devicetree@vger.kernel.org
List-Id: <devicetree.vger.kernel.org>
List-Subscribe: <mailto:devicetree+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:devicetree+unsubscribe@vger.kernel.org>

Thank you for your contribution! Sashiko AI review found 1 potential issue(=
s) to consider:
- [Low] dt-bindings: additionalProperties: false with allOf breaks inherite=
d properties
--

commit 28fede9028d5369d7e76bfe368a2b05ad5391a52
Author: Hyunuk Son <hyunuk.son@irondevice.com>

ASoC: dt-bindings: Add Iron Device MA5311
   =20
Add a Device Tree binding for the Iron Device MA5311 audio codec.

> diff --git a/Documentation/devicetree/bindings/sound/irondevice,ma5311.ya=
ml b/Documentation/devicetree/bindings/sound/irondevice,ma5311.yaml
> new file mode 100644
> index 0000000000000..ae4a13c2981ab
> --- /dev/null
> +++ b/Documentation/devicetree/bindings/sound/irondevice,ma5311.yaml
> @@ -0,0 +1,69 @@
> +# SPDX-License-Identifier: (GPL-2.0-only OR BSD-2-Clause)
> +%YAML 1.2
> +---
> +$id: http://devicetree.org/schemas/sound/irondevice,ma5311.yaml#
> +$schema: http://devicetree.org/meta-schemas/core.yaml#

[ ... ]

> +allOf:
> +  - $ref: dai-common.yaml#
> +
> +properties:

[ ... ]

> +required:
> +  - compatible
> +  - reg
> +  - reg-names
> +  - '#sound-dai-cells'
> +
> +additionalProperties: false

[Severity: Low]
Because this schema includes dai-common.yaml# in its allOf block, will
additionalProperties: false incorrectly reject standard DAI properties?

In JSON schema, additionalProperties: false only evaluates explicitly defin=
ed
properties in the local properties dictionary, ignoring properties brought =
in
via a $ref. This causes make dt_binding_check to fail with "additional
property is not allowed" errors when valid common DAI properties are used
in the device tree.

Should this use unevaluatedProperties: false instead, as documented in
writing-schema.rst?

--=20
Sashiko AI review =C2=B7 https://sashiko.dev/#/patchset/20261015060408.1287=
11-1-hyunuk.son@irondevice.com?part=3D1
