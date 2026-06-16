Received: from smtp.kernel.org (aws-us-west-2-korg-mail-alma10-1.taild15c8.ts.net [100.103.45.18])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 9532840801C
	for <devicetree@vger.kernel.org>; Tue, 16 Jun 2026 07:31:20 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=100.103.45.18
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1781595081; cv=none; b=LzPHajLDKmAEbASBWToiGOkOkAUsAU3Ly7MsYDV0Wp5NdmA7UEnUCr6JPJ9+M3QahqXNbXrT2t7BfVqSeZPM3CzmwsJ/eGomCttu3NkjapAJFJ9kqKbg6sGb9KDvHZHVxDutEk6wI0kpx/phwACPA9B8rwZev8QcYgxQiEFmchA=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1781595081; c=relaxed/simple;
	bh=MUvXesPFyZ2Y8sg0qQbkeioxs2j0YpJnqCRGVvvcNHk=;
	h=From:Subject:To:Cc:In-Reply-To:References:Content-Type:Date:
	 Message-Id; b=mXmUH/+KwL7h5NEDxsWOCMSyVjr13MXHQrytYfUFlNwFFietIOgmhAV3cXjxWq6I+61ylzMnpu1JvMTupSbFHp88LGGtzPQUIfKvHGPbFiewNDaYOsN0LMtApfH6d8XEqU7fi45ByRSrIo8aXtuGiu3VX7Iacp8FEXifQ33vOpE=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=ZttlWelk; arc=none smtp.client-ip=100.103.45.18
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="ZttlWelk"
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 0530A1F000E9;
	Tue, 16 Jun 2026 07:31:19 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kernel.org;
	s=k20260515; t=1781595080;
	bh=Pb4xMFYA4+98XP5PXlkyTWl/J6Gi4mR7gtcLmsmTCIk=;
	h=From:Subject:Reply-To:To:Cc:In-Reply-To:References:Date;
	b=ZttlWelkbjumcE6zHN6KWMdddVzvpsrDnjCRr68YZ3ThqtJwoXq9CUWMdMvEawLNL
	 Ln7WGWMWWWd3dz6/x6hGhO30ca2FQGiyuPPyz1xtRIyT2BqVpIHfDs8kv5cmVCMun7
	 hzQWDJJJDDssKRhAktsxMsQWqBdJZEGH0ht6woEu2TH7KcOX6StfTH5QctG4sDhSyj
	 8jLy2AqTcjRHlNulZqiv2A/EjYQZaBp+3TlWFnZFL2T5ezqjQLCXIdn+XvdvRtLAFD
	 8elJ/JKvzSMQHA7Mr/9M4u6K3J3QaYPq02kOCHW/Am620w8DgJaj/DTAtjNAXrvGmr
	 xqdlBnZ458TYg==
From: sashiko-bot@kernel.org
Subject: Re: [PATCH RFC v5 1/6] dt-bindings: iio: add Open Sensor Fusion
 device
Reply-To: sashiko-reviews@lists.linux.dev
To: "Jinseob Kim" <kimjinseob88@gmail.com>
Cc: robh@kernel.org, conor+dt@kernel.org, devicetree@vger.kernel.org
In-Reply-To: <20260616072242.3942-2-kimjinseob88@gmail.com>
References: <20260616072242.3942-2-kimjinseob88@gmail.com>
Content-Type: text/plain; charset=utf-8
Content-Transfer-Encoding: quoted-printable
Date: Tue, 16 Jun 2026 07:31:19 +0000
Message-Id: <20260616073120.0530A1F000E9@smtp.kernel.org>
Precedence: bulk
X-Mailing-List: devicetree@vger.kernel.org
List-Id: <devicetree.vger.kernel.org>
List-Subscribe: <mailto:devicetree+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:devicetree+unsubscribe@vger.kernel.org>

Thank you for your contribution! Sashiko AI review found 1 potential issue(=
s) to consider:
- [Medium] The binding uses a generic software protocol as the compatible s=
tring instead of describing specific hardware.
--

commit d9858298f5a88a8d0d1665f79878488487e06393
Author: Jinseob Kim <kimjinseob88@gmail.com>

dt-bindings: iio: add Open Sensor Fusion device

Adds the generic Open Sensor Fusion device binding for a serdev-attached IIO
sensor aggregation hub and documents the vendor prefix.

>     The opensensorfusion,osf compatible describes the generic Open Sensor
>     Fusion host interface. OSF GREEN is not the Linux compatible identity.
>     Likewise, OSF0 is the current wire magic and a wire-format detail, not
>     the Linux driver identity.

[Severity: Medium]
Does this approach align with Device Tree design principles?

Device Tree is typically intended to describe specific hardware components
(such as vendor,chip-model), rather than software interfaces or generic wire
protocols.

> diff --git a/Documentation/devicetree/bindings/iio/opensensorfusion,osf.y=
aml b/Documentation/devicetree/bindings/iio/opensensorfusion,osf.yaml
> new file mode 100644
> index 0000000000000..012a07fd69fe4
> --- /dev/null
> +++ b/Documentation/devicetree/bindings/iio/opensensorfusion,osf.yaml

[ ... ]

> +properties:
> +  compatible:
> +    const: opensensorfusion,osf
> +
> +  vcc-supply:
> +    description:
> +      Regulator supplying power to the Open Sensor Fusion device.
> +
> +required:
> +  - compatible
> +  - vcc-supply

[Severity: Medium]
Is it appropriate to constrain the compatible string to a generic software
protocol identifier here instead of a hardware-specific string?

Because this generic compatible string also requires specific hardware
constraints like vcc-supply, will future hardware variants that speak the
same OSF protocol but have different electrical needs (such as needing a
vddio-supply or reset GPIOs) be able to distinguish themselves without
clashing with these generic constraints?

--=20
Sashiko AI review =C2=B7 https://sashiko.dev/#/patchset/20260616072242.3942=
-1-kimjinseob88@gmail.com?part=3D1
