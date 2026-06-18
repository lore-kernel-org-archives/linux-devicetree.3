Received: from smtp.kernel.org (aws-us-west-2-korg-mail-alma10-1.taild15c8.ts.net [100.103.45.18])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id BA65527FD4B
	for <devicetree@vger.kernel.org>; Thu, 18 Jun 2026 14:43:17 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=100.103.45.18
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1781793798; cv=none; b=uEYUjGMvN2/UOL91+4gwI61R5C77SReoV69DK7yjbVrvt92lbNM3kzg2cSSAfrTj+F1Emjzs2Eud2LAqkqO4zwXtDpOkgaVUD9P5x76TtK70ata0U1sbT12RBDk9J27zp6BYcmKHcB8Wi3RDZ9B+qcB3WdhlKkV6z3NZoZHcIV4=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1781793798; c=relaxed/simple;
	bh=AxEyuWdl8xQ7/PJeXxGRN4mPA08LN0DLBLo0E1pHh+U=;
	h=From:Subject:To:Cc:In-Reply-To:References:Content-Type:Date:
	 Message-Id; b=i5zTK56zTT+vkvfcMXdZC9fR8j9mpLECWxSXDvbWNt3ViOAFEtQChDnPAB6BS1rfgxSb/G3FNP9hcLjwqQU4zcjD7AYYbX7JbKbs4oKe6zhYVW+z1dOMCY3KMkXRyFQpHeBf6gB6SZXzJAIYJ+L2FNZ5lTHAgkt/FXudiTMEOnQ=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=YnyaDmA7; arc=none smtp.client-ip=100.103.45.18
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="YnyaDmA7"
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 2CB721F000E9;
	Thu, 18 Jun 2026 14:43:17 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kernel.org;
	s=k20260515; t=1781793797;
	bh=q8bZDvFvaQHseMZ2vrTSmay5pjK2UPdohW8f+2DccUQ=;
	h=From:Subject:Reply-To:To:Cc:In-Reply-To:References:Date;
	b=YnyaDmA7U2ghmMnoHCpoHB70rFAVnJKSrYKGUCpK5Dp2xYmrTJsfMsCOtnR8iLC9R
	 gWFRvRUXBn7uvv1VeTChZBItclSaFJSWSMh+ovCwXJzhbhO0A4GQKwvnf78S+YBE3W
	 m0Impg86GwabuA1E7SLAmwnxOkTRUWDGpGEsqFu1mttjkFxGOfU5ihh2mekAbUYGHN
	 aRyJnsGhWFInG7b8xspIOgMSp43MDNT+gCkkWEr2Wo9cMNx86Y6TrKq14ZxGV2P9Xi
	 WdmAALmotPrqwkE6oITMnKVttNRE7+1tK2zfrfwo5tnP+yhYX8goFKDvmIhy+CDFr7
	 P5WLdd/35WAXw==
From: sashiko-bot@kernel.org
Subject: Re: [PATCH RFC] dt-bindings: sound: Convert cirrus,cs35l36 to DT
 schema
Reply-To: sashiko-reviews@lists.linux.dev
To: "David Heidelberg via B4 Relay" <devnull+david.ixit.cz@kernel.org>
Cc: robh@kernel.org, devicetree@vger.kernel.org, conor+dt@kernel.org
In-Reply-To: <20260618-dt-cirrus-cs35l36-v1-1-1a43515666ad@ixit.cz>
References: <20260618-dt-cirrus-cs35l36-v1-1-1a43515666ad@ixit.cz>
Content-Type: text/plain; charset=utf-8
Content-Transfer-Encoding: quoted-printable
Date: Thu, 18 Jun 2026 14:43:16 +0000
Message-Id: <20260618144317.2CB721F000E9@smtp.kernel.org>
Precedence: bulk
X-Mailing-List: devicetree@vger.kernel.org
List-Id: <devicetree.vger.kernel.org>
List-Subscribe: <mailto:devicetree+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:devicetree+unsubscribe@vger.kernel.org>

Thank you for your contribution! Sashiko AI review found 4 potential issue(=
s) to consider:
- [Low] The `$id` field in the YAML schema omits the `sound/` subdirectory =
component, which breaks the schema cross-reference system.
- [Low] The `dt_binding_check` validation will fail because the example use=
s properties that are not defined in the schema.
- [Low] The default value for `cirrus,classh-wk-fet-delay` is set to `100`,=
 which violates the property's own enum constraints.
- [Low] An incorrect and completely unrelated maintainer (Bjorn Helgaas) is=
 listed for this Cirrus Logic audio codec binding.
--

commit 6ae17828fc1b1804817814b5209c4fcb2dc8b463
Author: David Heidelberg <david@ixit.cz>

dt-bindings: sound: Convert cirrus,cs35l36 to DT schema

Converts the CS35L36 Speaker Amplifier from a text binding to a DT schema.
It updates the maintainer to the generic Cirrus email, makes VP-supply
optional based on datasheet behavior, and incorporates dai-common.yaml.

> diff --git a/Documentation/devicetree/bindings/sound/cirrus,cs35l36.yaml =
b/Documentation/devicetree/bindings/sound/cirrus,cs35l36.yaml
> new file mode 100644
> index 0000000000000..af0acaaefb68e
> --- /dev/null
> +++ b/Documentation/devicetree/bindings/sound/cirrus,cs35l36.yaml
> @@ -0,0 +1,224 @@
> +# SPDX-License-Identifier: GPL-2.0-only
> +%YAML 1.2
> +---
> +$id: http://devicetree.org/schemas/cirrus,cs35l36.yaml#

[Severity: Low]
Does this `$id` path need to include the `sound/` subdirectory? Without it,
the schema cross-reference system might break.

> +$schema: http://devicetree.org/meta-schemas/core.yaml#
> +
> +title: Cirrus Logic CS35L36 Speaker Amplifier
> +
> +maintainers:
> +  - patches@opensource.cirrus.com
> +  - Bjorn Helgaas <bhelgaas@google.com>

[Severity: Low]
Is Bjorn Helgaas the correct maintainer to list here for this Cirrus Logic
audio codec? Since he typically maintains PCI, listing him here might
misdirect queries and patches.

[ ... ]

> +  cirrus,classh-wk-fet-delay:
> +    description: Weak-FET entry delay in ms
> +    $ref: /schemas/types.yaml#/definitions/uint32
> +    default: 100

[Severity: Low]
Will this default value of 100 cause schema validation to fail? The enum
below only allows values from 0 to 7, where 4 seems to map to 100ms.

> +    enum:
> +      - 0 # 0
> +      - 1 # 5
> +      - 2 # 10
> +      - 3 # 50
> +      - 4 # 100
> +      - 5 # 200
> +      - 6 # 500
> +      - 7 # 1000

[ ... ]

> +            cirrus,boost-ind-nanohenry =3D <1000>;
> +            cirrus,boost-ctl-millivolt =3D <10000>;
> +            cirrus,boost-peak-milliamp =3D <4500>;
> +            cirrus,boost-ctl-select =3D <0x00>;
> +            cirrus,weak-fet-delay =3D <4>;
> +            cirrus,weak-fet-thld =3D <0x01>;

[Severity: Low]
Could this example cause `dt_binding_check` to fail? It uses
`cirrus,weak-fet-delay` and `cirrus,weak-fet-thld`, but the schema actually
defines these properties as `cirrus,classh-wk-fet-delay` and
`cirrus,classh-weak-fet-thld-millivolt` respectively. With
`unevaluatedProperties: false` set, undocumented properties will trigger a
fatal schema error.

> +            cirrus,temp-warn-threshold =3D <1>;
> +            cirrus,multi-amp-mode;
> +            cirrus,irq-drive-select =3D <1>;
> +            cirrus,irq-gpio-select =3D <0x01>;

--=20
Sashiko AI review =C2=B7 https://sashiko.dev/#/patchset/20260618-dt-cirrus-=
cs35l36-v1-1-1a43515666ad@ixit.cz?part=3D1
