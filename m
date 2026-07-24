Received: from smtp.kernel.org (aws-us-west-2-korg-mail-alma10-1.taild15c8.ts.net [100.103.45.18])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 2C8773939B6
	for <devicetree@vger.kernel.org>; Fri, 24 Jul 2026 07:13:51 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=100.103.45.18
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1784877233; cv=none; b=bBGc0DFuNTK2TJY7GTU6OXJrWizow7OVwQGWq4TZ9RfdhPuJHVAq/fpmpJmUEudsR6KeyPYKT2PROUowv1QaaJnHwgkM8P5HgObAyf7N+pBu1ksuyeSFxFu4PU/A8hQGI9hA/vnxzJlSTvmJTlWKk+mYryA17Xqnp63x50pSV38=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1784877233; c=relaxed/simple;
	bh=Uggy1hgkHndMbKnYqSniTt3zRHewLC1RfyBrESb3F/k=;
	h=From:Subject:To:Cc:In-Reply-To:References:Content-Type:Date:
	 Message-Id; b=WG+SZ9s1pLdgcoTl451QFKVKo1Zmed103PXPqy1cq4moaV2YTd4iqJw6eC1iheULZddahSNSiT0Ar/2jX/I4BPE+4IcG1Gs+9rs901cf9iOI6uW+PSCT7ZnrMJtJpuIWEgdL9PNgm/S1CtUexR3xwpgD7LspyFpRASwLvsN1P6g=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=E8XfNRRT; arc=none smtp.client-ip=100.103.45.18
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="E8XfNRRT"
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 3EF411F000E9;
	Fri, 24 Jul 2026 07:13:51 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kernel.org;
	s=k20260515; t=1784877231;
	bh=Eu0D8k7gCIluWZCHDKO6pkMJ4BT1HYY8LQCwUpUWD/E=;
	h=From:Subject:Reply-To:To:Cc:In-Reply-To:References:Date;
	b=E8XfNRRTtAgRvwpamx1uWRbzfCPfdj8b/X6qfATtPXwjgNLdQF3kxXUhti/vJa3jc
	 vVjO2lnpxBOrMwvQ1mBvrgGebZWEJRgAJvJ2zCpFtJj05YSgplDOgEc4aGyR5r7enn
	 HMU1P+/JvQT7ohIsAyDwrFx1dS64MJ0vuBDw/Bimc7/H81IkcrBuTKm1ST+zudjQbS
	 oP9KDiE2YpntvKu+vpjbpdfhti6HVrW1w4h5fYDxaBK+16tEuIgYaJHMhn0eVeW0bz
	 og3vfSdaj5vyoHOz9SGzGX51s6abkBwVZOYgn/7Lk/nH/vRGFJKEwk5D0G40LKhok9
	 xqJt7hOoOxujw==
From: sashiko-bot@kernel.org
Subject: Re: [PATCH v6 3/6] media: dt-bindings: Add Amlogic V4L2 video
 decoder
Reply-To: sashiko-reviews@lists.linux.dev
To: "Zhentao Guo" <zhentao.guo@amlogic.com>
Cc: robh@kernel.org, conor+dt@kernel.org, neil.armstrong@linaro.org, devicetree@vger.kernel.org, media-ci@linuxtv.org, linux-amlogic@lists.infradead.org
In-Reply-To: <20260724-b4-s4-vdec-upstream-v6-3-6072a7ee7428@amlogic.com>
References: <20260724-b4-s4-vdec-upstream-v6-0-6072a7ee7428@amlogic.com>
 <20260724-b4-s4-vdec-upstream-v6-3-6072a7ee7428@amlogic.com>
Content-Type: text/plain; charset=utf-8
Content-Transfer-Encoding: quoted-printable
Date: Fri, 24 Jul 2026 07:13:50 +0000
Message-Id: <20260724071351.3EF411F000E9@smtp.kernel.org>
Precedence: bulk
X-Mailing-List: devicetree@vger.kernel.org
List-Id: <devicetree.vger.kernel.org>
List-Subscribe: <mailto:devicetree+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:devicetree+unsubscribe@vger.kernel.org>

Thank you for your contribution! Sashiko AI review found 2 potential issue(=
s) to consider:
- [Medium] The `interrupts` property allows up to 3 items but lacks descrip=
tions (`items:`) and omits an `interrupt-names` definition.
- [Medium] The `resets` property is defined and used in the example but is =
missing from the `required` list.
--

--- Patch [3]: [PATCH v6 3/6] media: dt-bindings: Add Amlogic V4L2 video de=
coder ---
commit 289a73f667fca4eaf3038cecf5c55be6082f5801
Author: Zhentao Guo <zhentao.guo@amlogic.com>

media: dt-bindings: Add Amlogic V4L2 video decoder

This commit describes the initial support for the V4L2 stateless video deco=
der
driver used with the Amlogic S4 (S805X2) platform.

> diff --git a/Documentation/devicetree/bindings/media/amlogic,s4-vdec.yaml=
 b/Documentation/devicetree/bindings/media/amlogic,s4-vdec.yaml
> new file mode 100644
> --- /dev/null
> +++ b/Documentation/devicetree/bindings/media/amlogic,s4-vdec.yaml
> @@ -0,0 +1,103 @@
> +# SPDX-License-Identifier: (GPL-2.0-only OR BSD-2-Clause)

[ ... ]

> +  reg-names:
> +    items:
> +      - const: dos
> +      - const: dmc
> +
> +  interrupts:
> +    maxItems: 3

[Severity: Medium]
Is it possible to add descriptions or an interrupt-names array here?

Without descriptions for each array item or an interrupt-names property,
device tree authors do not have documentation on the required order and
purpose of the 3 interrupts.

Additionally, dt_binding_check cannot enforce the exact number of interrupts
or their order without an items list, meaning a device tree node with only
1 or 2 interrupts could silently pass validation.

> +
> +  clocks:
> +    maxItems: 3

[ ... ]

> +  amlogic,canvas:
> +    description: should point to a canvas provider node
> +    $ref: /schemas/types.yaml#/definitions/phandle
> +
> +  secure-monitor:
> +    description: phandle to the secure-monitor node
> +    $ref: /schemas/types.yaml#/definitions/phandle
> +
> +required:
> +  - compatible
> +  - reg
> +  - reg-names
> +  - interrupts
> +  - clocks
> +  - clock-names
> +  - power-domains
> +  - power-domain-names
> +  - amlogic,canvas
> +  - secure-monitor

[Severity: Medium]
Should resets be included in this required properties list?

The resets property is defined above in the schema and used in the example.

Since Amlogic video decoder hardware blocks typically require a hardware
reset line (e.g., the DOS reset) for proper initialization, omitting resets
from the required list might allow an incomplete device tree node to
silently pass schema validation but fail at runtime.

> +
> +additionalProperties: false

[ ... ]

--=20
Sashiko AI review =C2=B7 https://sashiko.dev/#/patchset/20260724-b4-s4-vdec=
-upstream-v6-0-6072a7ee7428@amlogic.com?part=3D3
