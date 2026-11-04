Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=100.103.45.18
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1793783939;
	b=xTUvyZ9pkP96tx6RVCWUaFdeYWM0l6W06mLX+HnP3cGCkf4zoLxcvZz7dtSvXALjSrJl
	 5en3qQhDfr+DsJg/kZynKnMGVaSx/K8ik37rcS6gQqy28cDTTjVO15tODv6wDPQZo8Tyd
	 tNlA6QoyJNqnjexc6m+aVLHiGQAvs7ReSTEqmCMt4leMkNh3j/rYGWIJVXjFmyRsoa3QS
	 qWNwKavMjADmtnCtDllT0P0QXsgCyHV+1pj6xU8XNn7xQ8CN1rNR6L6GYwe1OQ9kz25Ok
	 OOkiVDYhnX4IDLu3yu0r78PmxRu4GX9Zu1LIQ838f2xkE6rGu1SPChlejODqxA96mpg==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1793783939;
	h=Received:DKIM-Signature:Message-ID:From:Subject:Reply-To:To:Cc:
	 In-Reply-To:References:Content-Type:Content-Transfer-Encoding:Date;
	bh=q0UJEF4thylPhnZcj/+qC7srAGWS88AxXsw8j7Vl9eQ=;
	b=qO5rbNc8OLhPEsQsQfsfDgDL8zzJVpX8LfEIX6LVrFacItINgFDsrm1KZ3Q3JeZr2VXP
	 i9XHECS3wJyaoWOC4wltV5FZKsC+8NuFYrUGoIM/QzpansWkkbhWe2GB8MxgUopysRd/1
	 RJnC0oKVWox3w9N+lekpcZKmPO68KNPcm2et88Te3EqY+hjxp8jP6aP17So8E3cJmTMHT
	 XTr7Cmo5KtMlcwx/kaseudRGPApWJkzXY1QkPE8JUre++lk3e5uiYsnKBqyf6H+ppXx+n
	 iVtYyeBWafwzPqZ2X+OKPvxQHRZe7P0nXlnEzFuoO/MRzqZeRPfv5qImBdow+HETFEg==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dkim=pass header.d=kernel.org header.i=@kernel.org header.a=rsa-sha256 header.s=k20260515 header.b=INPUSIkH;
	arc=none smtp.remote-ip=100.103.45.18
Received: from smtp.kernel.org (quasi.space.kernel.org [100.103.45.18])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id DA862606A31B
	for <devicetree@vger.kernel.org>; Wed,  4 Nov 2026 09:18:58 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key, unprotected) header.d=kernel.org header.i=@kernel.org header.a=rsa-sha256 header.s=k20260515 header.b=INPUSIkH
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 316021F000C1;
	Wed,  4 Nov 2026 09:18:58 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kernel.org;
	s=k20260515; t=1793783938;
	bh=q0UJEF4thylPhnZcj/+qC7srAGWS88AxXsw8j7Vl9eQ=;
	h=From:Subject:Reply-To:To:Cc:In-Reply-To:References:Date;
	b=INPUSIkH8pneMgTDKnwKTYBoFSzx18Fb4e+O+imTeIaELIiwx00pb4MLhIDm5kvE5
	 1lSj1FIJjbCi/EUaqssWHJhoFusEsnot5upCyTPrs05Y5xCFzEekodyZLuPUCNy90i
	 KPmQ498otmBvBG5KiBgRO/BO28egozt27kjTI2qngRUUeFdOKbwOOocGSPYuJuR4cN
	 z4VxtqkLaX7Whh+li2KGqCDwVcLtqYwiR0aRLKdjuqRHZiz9hOFkPA3R/ZyvHLTraX
	 JI4qZlMeyDjhIRu95orknUEh6ZzWevg/NdU5ygEx/Ar/ssb2GPxG76HS1wy4pwA5Ba
	 kzsqqGlr40NFg==
Message-ID: <sashiko-outbox-196941@kernel.org>
From: sashiko-bot@kernel.org
Subject: Re: [PATCH v4 1/2] dt-bindings: iio: adc: Add Nuvoton MA35D1 EADC
Reply-To: sashiko-reviews@lists.linux.dev
To: "Chi-Wen Weng" <cwweng.linux@gmail.com>
Cc: devicetree@vger.kernel.org, robh@kernel.org, conor+dt@kernel.org
In-Reply-To: <20261104091136.151269-2-cwweng.linux@gmail.com>
References: <20261104091136.151269-1-cwweng.linux@gmail.com>
 <20261104091136.151269-2-cwweng.linux@gmail.com>
Content-Type: text/plain; charset=utf-8
Content-Transfer-Encoding: quoted-printable
Date: Wed, 04 Nov 2026 09:18:57 +0000
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
- [Medium] dt-bindings: iio: adc: ma35d1-eadc lacks io-channel specifier fo=
r VBAT
--

commit 10ca0224f7b8ba3a2de52a1dfd8d73f64b596541
Author: Chi-Wen Weng <cwweng@nuvoton.com>

dt-bindings: iio: adc: Add Nuvoton MA35D1 EADC

This commit adds the Device Tree binding schema for the Nuvoton MA35D1
Enhanced Analog-to-Digital Converter (EADC), describing its eight external
analog inputs (usable as single-ended channels or four fixed differential
pairs) and one internal VBAT input.

> diff --git a/Documentation/devicetree/bindings/iio/adc/nuvoton,ma35d1-ead=
c.yaml b/Documentation/devicetree/bindings/iio/adc/nuvoton,ma35d1-eadc.yaml
> new file mode 100644
> index 0000000000000..85b0feac0236b
> --- /dev/null
> +++ b/Documentation/devicetree/bindings/iio/adc/nuvoton,ma35d1-eadc.yaml
> @@ -0,0 +1,163 @@
> +# SPDX-License-Identifier: (GPL-2.0-only OR BSD-2-Clause)
> +%YAML 1.2
> +---
> +$id: http://devicetree.org/schemas/iio/adc/nuvoton,ma35d1-eadc.yaml#
> +$schema: http://devicetree.org/meta-schemas/core.yaml#
> +
> +title: Nuvoton MA35D1 Enhanced Analog-to-Digital Converter
> +
> +maintainers:
> +  - Chi-Wen Weng <cwweng@nuvoton.com>
> +
> +description: |
> +  The Nuvoton MA35D1 Enhanced Analog-to-Digital Converter (EADC) is a
> +  12-bit successive approximation converter with eight external analog
> +  inputs and one internally connected VBAT input.
> +
> +  The external inputs can be used as eight single-ended channels or as
> +  four fixed differential pairs: 0-4, 1-5, 2-6 and 3-7. The internally
> +  connected VBAT input is not described by a channel child node.
> +
> +  The controller provides four interrupt outputs, ADINT0 through ADINT3.

[ ... ]

> +  '#io-channel-cells':
> +    const: 1
> +    description:
> +      The cell selects the logical EADC channel identified by the reg va=
lue
> +      of the corresponding channel child node.

[Severity: Medium]
As reported by Jonathan Cameron on v3 [1], how can an IIO consumer in
Device Tree reference the internal VBAT input if #io-channel-cells in
Documentation/devicetree/bindings/iio/adc/nuvoton,ma35d1-eadc.yaml only
selects the logical EADC channel identified by the reg value of a
channel@[0-7] child node, while description states that the internally
connected VBAT input is not described by a channel child node?

Also, should the top-level description block use > rather than | since it
only needs to preserve paragraph breaks?

[1] https://lore.kernel.org/r/20261101001934.23588aa2@jic23-hlaptop

--=20
Sashiko AI review =C2=B7 https://sashiko.dev/#/patchset/20261104091136.1512=
69-1-cwweng.linux@gmail.com?part=3D1
