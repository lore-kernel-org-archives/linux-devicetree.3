Received: from smtp.kernel.org (aws-us-west-2-korg-mail-alma10-1.taild15c8.ts.net [100.103.45.18])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id AB815518138
	for <devicetree@vger.kernel.org>; Tue, 22 Sep 2026 20:59:53 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=100.103.45.18
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1790110796; cv=none; b=Zs1Pc67/et8Q2+hW5g806aWPXGYOOxyc83b5DcQmXBzeSQIokgZg9+NJ+6YHRVGrZ5pvzOEWq7pHQUlNeTes7DDi0mf5bROMHUqpaBqcf9SiQ7WI3yw+A6W4We3pI1PrHDjLKg37/nasMS8npuIeJFQXu8+/5whzQDVbUkVTtFc=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1790110796; c=relaxed/simple;
	bh=S6ciNmtXz9JyZn/9uPLuMAtwQZ3fEGJyrZdfS1qi2r8=;
	h=From:Subject:To:Cc:In-Reply-To:References:Content-Type:Date:
	 Message-Id; b=SlP6Vm5e/T5GuwQDE5cq2IMrE9fcrvW4+AqQSCBTjJjOlHbusADcDFGj0W6MEGNMS/YzvrbTGw/RTY+SNHbzrTnIQGktu4UW6NEEOOITH1WAIIOsiS6x9DdjWBWLxMLofMxnMQ4a3NkYPE1tbgxTnWJI6KXzeRGmrzyofqBbu7Y=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=P48wmHZM; arc=none smtp.client-ip=100.103.45.18
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="P48wmHZM"
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 1CCDA1F000FF;
	Tue, 22 Sep 2026 20:59:50 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kernel.org;
	s=k20260515; t=1790110790;
	bh=nCqCiBd47wBWC5Eb0XdKdzzGD05QG1ZYd0Q4poNzVY4=;
	h=From:Subject:Reply-To:To:Cc:In-Reply-To:References:Date;
	b=P48wmHZM7k+446b+3Osy676EU49hn8UX5azs1IuBS6kGD9d2Lq7O9IQGDKAnNMt+n
	 VG89quOZOraBFNpxPfvokuivzEV8BJyV+LOe8MYkKhQjUFewq1hGZ8Ns3MfjcvIgAq
	 kKq8rTvYj6H+X3/W+VAiNZ+SbnSWjeVQY9+D+S7/3o4jKTXKNAJNASzzGuXZaWlDtU
	 2Rvd2rdIKTwvMiJ6Jga8UQuJAHCtY9GuKaHgC6KTawb9gc6yMJqmMvslylYvjTRE3X
	 xgEjeLJbJ39/juOCDOADEuwGv4flJKS+BtJX3WdKvIXswLjiVFYJGfwyhPl2RL36/a
	 LQxeR/hNJk+2A==
From: sashiko-bot@kernel.org
Subject: Re: [PATCH v1 12/27] dt-bindings: gpu: panthor: Document
 panthor-arbitration bindings
Reply-To: sashiko-reviews@lists.linux.dev
To: "Karunika Choo" <karunika.choo@arm.com>
Cc: conor+dt@kernel.org, dri-devel@lists.freedesktop.org, robh@kernel.org, devicetree@vger.kernel.org
In-Reply-To: <20260922204535.2850094-13-karunika.choo@arm.com>
References: <20260922204535.2850094-1-karunika.choo@arm.com>
 <20260922204535.2850094-13-karunika.choo@arm.com>
Content-Type: text/plain; charset=utf-8
Content-Transfer-Encoding: quoted-printable
Date: Tue, 22 Sep 2026 20:59:49 +0000
Message-Id: <20260922205950.1CCDA1F000FF@smtp.kernel.org>
Precedence: bulk
X-Mailing-List: devicetree@vger.kernel.org
List-Id: <devicetree.vger.kernel.org>
List-Subscribe: <mailto:devicetree+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:devicetree+unsubscribe@vger.kernel.org>

Thank you for your contribution! Sashiko AI review found 2 potential issue(=
s) to consider:
- [Low] dt-bindings: hardcoded driver-specific node name 'panthor-arbitrati=
on'
- [Low] dt-bindings: missing const constraints on #address-cells and #size-=
cells
--

commit 5958d9241a2d1add1102ff00e882946446a4e494
Author: Karunika Choo <karunika.choo@arm.com>

dt-bindings: gpu: panthor: Document panthor-arbitration bindings

Mali 5th-Gen AM GPUs expose arbitration registers outside the GPU node.
The arbitration device contains partition-control and resource-group
register blocks used to grant, yield, and close access windows.

Document partition and resource-group child nodes, each with its own
register range, interrupt and hardware ID.

> diff --git a/Documentation/devicetree/bindings/gpu/arm,mali-gen5-am-arbit=
ration.yaml b/Documentation/devicetree/bindings/gpu/arm,mali-gen5-am-arbitr=
ation.yaml
> new file mode 100644
> index 0000000000000..9ea2b4bb9a344
> --- /dev/null
> +++ b/Documentation/devicetree/bindings/gpu/arm,mali-gen5-am-arbitration.=
yaml

[ ... ]

> +properties:
> +  $nodename:
> +    const: panthor-arbitration

[Severity: Low]
Does this enforce an invalid, driver-specific naming convention on all
devicetrees using this hardware?

Any devicetree author attempting to instantiate this hardware must use the
Linux-specific driver name panthor-arbitration to pass schema validation.
This violates the DT specification requirement for generic,
hardware-reflective naming.=20

Could this be changed to use a generic term like arbitrator or
gpu-arbitrator instead of incorporating the DRM driver name?

> +
> +  compatible:
> +    const: arm,mali-gen5-am-arbitration
> +
> +  "#address-cells": true
> +
> +  "#size-cells": true

[Severity: Low]
Should these cell-count properties have a strict const constraint matching
the hardware, such as const: 1 as shown in the examples, rather than just
true?

Without a strict constraint, the schema allows arbitrary integers for cell
counts. This weakens schema validation for child nodes' reg array dimension=
s,
and a device tree with incorrectly sized reg properties might silently pass
the dt_binding_check.

> +
> +  ranges: true

[ ... ]

> diff --git a/Documentation/devicetree/bindings/gpu/arm,mali-gen5-am-syste=
m.yaml b/Documentation/devicetree/bindings/gpu/arm,mali-gen5-am-system.yaml
> index f0689bb8f05a2..a027dc5f4f890 100644
> --- a/Documentation/devicetree/bindings/gpu/arm,mali-gen5-am-system.yaml
> +++ b/Documentation/devicetree/bindings/gpu/arm,mali-gen5-am-system.yaml

[ ... ]

> @@ -41,6 +41,15 @@ properties:
> =20
>    dma-coherent: true
> =20
> +  "#address-cells": true
> +
> +  "#size-cells": true

[Severity: Low]
Similar to the arbitration bindings, should these cell-count properties also
be defined with strict const constraints?

Allowing arbitrary integers weakens schema validation for child nodes' reg
array dimensions.

> +
> +  ranges: true
> +
> +  panthor-arbitration:
> +    $ref: arm,mali-gen5-am-arbitration.yaml#

--=20
Sashiko AI review =C2=B7 https://sashiko.dev/#/patchset/20260922204535.2850=
094-1-karunika.choo@arm.com?part=3D12
