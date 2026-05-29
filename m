Received: from smtp.kernel.org (aws-us-west-2-korg-mail-alma10-1.taild15c8.ts.net [100.103.45.18])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 8817F3C3456
	for <devicetree@vger.kernel.org>; Fri, 29 May 2026 10:22:39 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=100.103.45.18
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1780050161; cv=none; b=U96s8Vql9E8LESBnj8Et3/9fLNLOxnKoug4pft7FXrpKfP2OcXRxklWZt15i+ViP7BSSHl4Als2Xdlq9j7hnoPOwDLFneqSl+k0WTWt6AxLPc4QHEWspHlXkmyR0a9TkOv/rBD02RN5h2zF9g6X/Skz627uLABBzctQsXSig93A=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1780050161; c=relaxed/simple;
	bh=X63K1pZHS9hDhVs8aN9cjOBUuyxbVCFoHddhvLVeK/c=;
	h=From:Subject:To:Cc:In-Reply-To:References:Content-Type:Date:
	 Message-Id; b=Nie1WGVC9LGzBh0NpiobeJzp9/5jJbBZJl4JyYhcFmJ4WYWgf1oBCawwfAxKnFhWOWo0+QeYw4eu77sPwn5QijupT0xGWf0O7JENnbBH6plgovyKiwN1Pcr6JtWckXKNPYODHKV5cM9lfuEjfqP5qhDQfPLPPVcGkujf0++tJ00=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=LOlfUvUG; arc=none smtp.client-ip=100.103.45.18
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="LOlfUvUG"
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 9DBA41F00893;
	Fri, 29 May 2026 10:22:38 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kernel.org;
	s=k20260515; t=1780050159;
	bh=zI1Pth2HyIYan58cvWjEWKgrqwpBeysmOpER6ygpRbY=;
	h=From:Subject:Reply-To:To:Cc:In-Reply-To:References:Date;
	b=LOlfUvUGopOubC8jqzwNwu6y6vV9sOkVGUw8hw1OJ61uht/KFQaqk0YAnKtSM//rg
	 q8BOE/jHatlQ/V+uYpb4inObKCazIr7BziK086Nxea7nZRQFNuZxRDEj5whFu2K/Y8
	 Wp94xhaXw83GtKAXof58PmuhtE+lcERyEgY/MGoKU6bBlXzZYXjH5BT9vXZh2UG/SJ
	 1PgAYGLFmfYBNB345D+mMjP+e+kGn/YH6xD4EzgWomi+HyD6Iq7MsvscBnJ2SbeILM
	 MffqXqCfOt47EHZHgiwnIXgZyVPedvelXJYz/D3jSwjarbuipWw5GJoZH8kIg2QCSj
	 mmplOjV34K92Q==
From: sashiko-bot@kernel.org
Subject: Re: [PATCH v14 1/6] dt-bindings: iio: adc: add AD4691 family
Reply-To: sashiko-reviews@lists.linux.dev
To: "Radu Sabau via B4 Relay" <devnull+radu.sabau.analog.com@kernel.org>
Cc: robh@kernel.org, conor+dt@kernel.org, devicetree@vger.kernel.org
In-Reply-To: <20260529-ad4692-multichannel-sar-adc-driver-v14-1-e93c2747dc1f@analog.com>
References: <20260529-ad4692-multichannel-sar-adc-driver-v14-1-e93c2747dc1f@analog.com>
Content-Type: text/plain; charset=utf-8
Content-Transfer-Encoding: quoted-printable
Date: Fri, 29 May 2026 10:22:37 +0000
Message-Id: <20260529102238.9DBA41F00893@smtp.kernel.org>
Precedence: bulk
X-Mailing-List: devicetree@vger.kernel.org
List-Id: <devicetree.vger.kernel.org>
List-Subscribe: <mailto:devicetree+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:devicetree+unsubscribe@vger.kernel.org>

Thank you for your contribution! Sashiko AI review found 1 potential issue(=
s) to consider:
- [Medium] The device tree binding defines GPIO controller capabilities but=
 fails to include them in the 'required' list and the 'examples' section.
--

commit 602cb115d39dfc0437959b492ddbc73748531d1e
Author: Radu Sabau <radu.sabau@analog.com>

dt-bindings: iio: adc: add AD4691 family

This commit adds device tree bindings for the Analog Devices AD4691 family=
=20
of multichannel SAR ADCs. It defines the hardware constraints, compatible=20
strings, and necessary properties for the four variants in this family.

> diff --git a/Documentation/devicetree/bindings/iio/adc/adi,ad4691.yaml b/=
Documentation/devicetree/bindings/iio/adc/adi,ad4691.yaml
> new file mode 100644
> --- /dev/null
> +++ b/Documentation/devicetree/bindings/iio/adc/adi,ad4691.yaml
[ ... ]
> +  gpio-controller: true
> +
> +  '#gpio-cells':
> +    const: 2
> +
> +  '#trigger-source-cells':
[ ... ]
> +required:
> +  - compatible
> +  - reg
> +  - avdd-supply
> +  - vio-supply

[Severity: Medium]
Should gpio-controller and #gpio-cells be included in this required list?

According to the dt-bindings subsystem guidelines, when a binding defines
provider capabilities such as a GPIO controller, the corresponding standard
properties must be explicitly added to the required list.

Additionally, would it be necessary to update the examples section below to
include these properties?

The subsystem documentation notes that the examples section must include all
required properties to successfully pass the schema validation checks.

--=20
Sashiko AI review =C2=B7 https://sashiko.dev/#/patchset/20260529-ad4692-mul=
tichannel-sar-adc-driver-v14-0-e93c2747dc1f@analog.com?part=3D1
