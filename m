Received: from smtp.kernel.org (aws-us-west-2-korg-mail-alma10-1.taild15c8.ts.net [100.103.45.18])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id D0C7A3D7A03
	for <devicetree@vger.kernel.org>; Wed, 20 May 2026 12:19:00 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=100.103.45.18
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1779279541; cv=none; b=nzQDvttyg5cDHwBS0eNFGIqID0Q5GuW0FNt/QGQPDQRVsWhus2XTWuDglzShnGy6KOgj4gpd4iXM2zt73TdinZnwMYRua3eKplJwXLr5xMJCv0Nm39I2oGOe4XHQggCuNb56rCxtJZAlZXybMGk1DUcZ1qnkyhOGcbrkX684qHM=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1779279541; c=relaxed/simple;
	bh=taDXSlOb7ejwRT0H5RgT2/xaqf6RPnnCVMosam40/zE=;
	h=From:Subject:To:Cc:In-Reply-To:References:Content-Type:Date:
	 Message-Id; b=Sr34H/WFNtp9gDt7K/3ATIQArEoGMjWLXVJzqxq5V+k0obHD6+KMxlArInqxX4KrnQ+S9hssW3FQBGNjY9gcLyjhMmkarjyvF4VbV1ku4Hh+VSNDOFI1ZU0dGr9zF6vpfh/vWHXH7hnQss4lfQCbjZgRTS3KW+vTYhjvW6GkYtM=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=b4yXqtwV; arc=none smtp.client-ip=100.103.45.18
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="b4yXqtwV"
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 50EDB1F000E9;
	Wed, 20 May 2026 12:18:59 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kernel.org;
	s=k20260515; t=1779279540;
	bh=OpkxJt8I5vWa7467XgL3oUdWKmEM0M9cmnAKZ8LbELA=;
	h=From:Subject:Reply-To:To:Cc:In-Reply-To:References:Date;
	b=b4yXqtwVZjLsxMFGqSzZxdPE1zyC0gtPpaZXg+UHtB1o4ktK9uPMkOx8gbRJzBgrF
	 YAAIZINytrvvSw2wo4TP0vikaChWpZyqM7ZTzG65Na+/z+M8oOubV2FstkvREAxTC3
	 3IBQ/OUPsztN/RwTVlSeRWWRxptoGM67NiD0kQdyEKn7rO1olFlr324a4FkvUPCQH0
	 vy2dHpPH/aUcEUI4NzOh+Z6IZFgkw9E7PGKDfcihEh6zuFQvvKZLjlIQe9m94Jodgb
	 3J9W25Pb1L4dQm2erR0Gn8kh5WCGf6yrIKKEtylNZoeWWoa7pLxA+38Litye63iVoC
	 kyg6o2zulegPA==
From: sashiko-bot@kernel.org
Subject: Re: [PATCH v5 1/2] dt-bindings: ti: Update audio-refclk binding and
 j721e system controller
Reply-To: sashiko-reviews@lists.linux.dev
To: "Moteen Shah" <m-shah@ti.com>
Cc: robh@kernel.org, devicetree@vger.kernel.org, conor+dt@kernel.org
In-Reply-To: <20260520115603.2662930-2-m-shah@ti.com>
References: <20260520115603.2662930-2-m-shah@ti.com>
Content-Type: text/plain; charset=utf-8
Content-Transfer-Encoding: quoted-printable
Date: Wed, 20 May 2026 12:18:59 +0000
Message-Id: <20260520121900.50EDB1F000E9@smtp.kernel.org>
Precedence: bulk
X-Mailing-List: devicetree@vger.kernel.org
List-Id: <devicetree.vger.kernel.org>
List-Subscribe: <mailto:devicetree+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:devicetree+unsubscribe@vger.kernel.org>

Thank you for your contribution! Sashiko AI review found 1 potential issue(=
s) to consider:
- [Medium] Standard `clock@...` node names for the audio reference clock wi=
ll fail validation because they will match the existing SERDES control patt=
ern in `ti,j721e-system-controller.yaml`.
--

commit e99145dc81945477b02ec4f36bbd799351ed4236
Author: Moteen Shah <m-shah@ti.com>

dt-bindings: ti: Update audio-refclk binding and j721e system controller

This commit adds ti,j721s2-audio-refclk as a supported compatible string
in the ti,am62-audio-refclk binding. It also extends the
ti,j721e-system-controller clock-controller@ child pattern to accept
audio-refclk schemas alongside ehrpwm-tbclk.

> diff --git a/Documentation/devicetree/bindings/soc/ti/ti,j721e-system-con=
troller.yaml b/Documentation/devicetree/bindings/soc/ti/ti,j721e-system-con=
troller.yaml
> index f3bd0be3b279f..364be49f8c7c7 100644
> --- a/Documentation/devicetree/bindings/soc/ti/ti,j721e-system-controller=
.yaml
> +++ b/Documentation/devicetree/bindings/soc/ti/ti,j721e-system-controller=
.yaml

[ ... ]

> @@ -53,9 +53,11 @@ patternProperties:
> =20
>    "^clock-controller@[0-9a-f]+$":
>      type: object
> -    $ref: /schemas/clock/ti,am654-ehrpwm-tbclk.yaml#
> +    oneOf:
> +      - $ref: /schemas/clock/ti,am62-audio-refclk.yaml#
> +      - $ref: /schemas/clock/ti,am654-ehrpwm-tbclk.yaml#
>      description:
> -      Clock provider for TI EHRPWM nodes.
> +      Clock provider for TI EHRPWM or Audio Reference Clock nodes.

[Severity: Medium]
Does placing the audio reference clock schema under the
clock-controller@... pattern force device tree authors to use that specific
node name to pass validation?

In ti,j721e-system-controller.yaml, the ^clock@[0-9a-f]+$ pattern is strict=
ly
bound to the SerDes control schema (ti,am654-serdes-ctrl.yaml).

If an author attempts to use the standard clock@... naming as demonstrated =
in
the ti,am62-audio-refclk.yaml example, does the node mistakenly trigger the
SerDes schema validation and fail, forcing an inconsistency in generic node
naming conventions?

--=20
Sashiko AI review =C2=B7 https://sashiko.dev/#/patchset/20260520115603.2662=
930-1-m-shah@ti.com?part=3D1
