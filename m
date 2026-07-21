Received: from smtp.kernel.org (aws-us-west-2-korg-mail-alma10-1.taild15c8.ts.net [100.103.45.18])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 81CF93BB13A
	for <devicetree@vger.kernel.org>; Tue, 21 Jul 2026 09:00:51 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=100.103.45.18
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1784624452; cv=none; b=obuyOLsYCwG1b6HQ1+TiXfdtLhXI7t1oBR3Lk3cnDEpFphx3NbH0pnUWe9DHF4HAKXtcQmWRdPeCDjyzpV890POpm/IDzE2AEHqCL2ulxfXXFMTLTst//z1mVt5XCX9Ui291Qe4jnLVkck2/5pjSa7QsA2pLMhlgJtrIbvKCph4=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1784624452; c=relaxed/simple;
	bh=G7OVymGAZ68fOsyVudMfDfVQ6j5IKcZYslwyklzHBKM=;
	h=From:Subject:To:Cc:In-Reply-To:References:Content-Type:Date:
	 Message-Id; b=oBXnj5tZMlOjPNbmFg0B8zlFkqkn+FGYNH9BPA3AtrWttQgJVxkzw4QugLfXnR5KYGGhEQy3AJUIdwxvX7dW6N9JaO9aibU2TmgeZoVqvRNC/yCh/e+c38zvsnOBpmZo+kkq9sJAE7fQ1W7wgYhFFijauCJVt1+GZWgVKKq4n3g=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=HQZdsiW6; arc=none smtp.client-ip=100.103.45.18
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="HQZdsiW6"
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 1B2831F000E9;
	Tue, 21 Jul 2026 09:00:51 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kernel.org;
	s=k20260515; t=1784624451;
	bh=h21z0qT/BkkREP5771hwXWAwAbvEvcrzEyYIvC7bzW8=;
	h=From:Subject:Reply-To:To:Cc:In-Reply-To:References:Date;
	b=HQZdsiW6NZ9WetovW9NtOp4nfumr5fBdIO3x6k9y1I9z+CW2qBNRlwqk6BXaUAFWy
	 ZT9zHD9pbvfsjwIKi/3ecIeV/M0T+VUWplWSW/veYFahuZN29Lxxrt2qMza8KHxqfR
	 vDEW4w981gT1xWaptD1Jgo6cv7Y5qFK7iFMk3RKR5iHGOg1F6CYdWWsrrF/IR1qeYi
	 QSUAkHB+Sv19HM/O3FzBffT+Bg4sbz/IQ58n6H3lltIek0tJ6lZMt/pr6sbdqW7FWq
	 ZeGP+/L3kaIwP2lRAEC/II1y6iy9P8aJV3T//ZuFuYXimZflRZXHwr4fh3TjExUeiQ
	 R61PAU59Tepvw==
From: sashiko-bot@kernel.org
Subject: Re: [PATCH v2 2/4] dt-bindings: iio: dac: add adi,ad5710r.yaml
Reply-To: sashiko-reviews@lists.linux.dev
To: "Kim Seer Paller" <kimseer.paller@analog.com>
Cc: robh@kernel.org, conor+dt@kernel.org, devicetree@vger.kernel.org
In-Reply-To: <20260721-iio-ad5710r-upstream-v2-2-324949dc72da@analog.com>
References: <20260721-iio-ad5710r-upstream-v2-0-324949dc72da@analog.com>
 <20260721-iio-ad5710r-upstream-v2-2-324949dc72da@analog.com>
Content-Type: text/plain; charset=utf-8
Content-Transfer-Encoding: quoted-printable
Date: Tue, 21 Jul 2026 09:00:50 +0000
Message-Id: <20260721090051.1B2831F000E9@smtp.kernel.org>
Precedence: bulk
X-Mailing-List: devicetree@vger.kernel.org
List-Id: <devicetree.vger.kernel.org>
List-Subscribe: <mailto:devicetree+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:devicetree+unsubscribe@vger.kernel.org>

Thank you for your contribution! Sashiko AI review found 2 potential issue(=
s) to consider:
- [Medium] The `adi,range-double` property is defined as a global device pr=
operty, artificially limiting the hardware's per-channel capabilities and c=
onflicting with current output modes.
- [Medium] The `reg` property inside `patternProperties` incorrectly uses `=
items` to apply numeric constraints, rendering channel bounds checking comp=
letely ineffective.
--

--- Patch [2]: [PATCH v2 2/4] dt-bindings: iio: dac: add adi,ad5710r.yaml -=
--
commit fe69da2e77f6f1de3acc9e529bec6856901e4e98
Author: Kim Seer Paller <kimseer.paller@analog.com>

dt-bindings: iio: dac: add adi,ad5710r.yaml

Add device tree bindings for the Analog Devices AD5710R/AD5711R
8-channel 12-/16-bit Configurable IDAC/VDAC.

> diff --git a/Documentation/devicetree/bindings/iio/dac/adi,ad5710r.yaml b=
/Documentation/devicetree/bindings/iio/dac/adi,ad5710r.yaml
> new file mode 100644
> index 0000000000000..17c1bf0092421
> --- /dev/null
> +++ b/Documentation/devicetree/bindings/iio/dac/adi,ad5710r.yaml

[ ... ]

> +  adi,range-double:
> +    description:
> +      Configure the output range for all channels. If the property is pr=
esent,
> +      the output will range from 0V to 2Vref. If the property is not pre=
sent,
> +      the output will range from 0V to Vref.
> +    type: boolean

[Severity: Medium]
Since the description notes that each channel can be independently configur=
ed
as either a voltage or current output, should this property be placed inside
the channel patternProperties block instead?=20

Defining it globally seems to restrict configuring the output range on a
per-channel basis, and might also semantically conflict with channels
configured for current output.

> +
> +patternProperties:
> +  "^channel@[0-7]$":
> +    $ref: /schemas/iio/dac/dac.yaml#
> +    type: object
> +    description:
> +      Represents the external channels which are connected to the DAC.
> +
> +    properties:
> +      reg:
> +        description: Channel number
> +        items:
> +          minimum: 0
> +          maximum: 7

[Severity: Medium]
Does placing minimum and maximum inside an items dictionary correctly apply
the constraints?=20

In dt-schema, the reg property is mapped to a matrix. Wrapping the constrai=
nts
in items applies them to the tuple array instead of the scalar integers,
causing schema validation to ignore them and silently accept out-of-bounds
channel numbers.=20

Could these bounds be placed directly under the reg property?

--=20
Sashiko AI review =C2=B7 https://sashiko.dev/#/patchset/20260721-iio-ad5710=
r-upstream-v2-0-324949dc72da@analog.com?part=3D2
