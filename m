Received: from smtp.kernel.org (aws-us-west-2-korg-mail-alma10-1.taild15c8.ts.net [100.103.45.18])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id B628C376BE0
	for <devicetree@vger.kernel.org>; Mon, 17 Aug 2026 06:45:50 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=100.103.45.18
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1786949151; cv=none; b=J3nkEq5j7Td2BlLF/ZxdqTAvjH1Q5jZ+noniZQN5FP494hAPPwSncb3MbCXuY/gBM1hQgI7Nm3QXmygH8eo5nWGwoq7pLLuPQGCMnexfVKe9DZE7TdZ2VAd4cW4SSsnzvMJ+Kds1QenxIsBG81M7LOT/q54AAQY5NEOb4pwPo0s=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1786949151; c=relaxed/simple;
	bh=mZ6l3idusShsrs/9sVEfYm5bxE7hwbFgqjeeKcAGFSM=;
	h=From:Subject:To:Cc:In-Reply-To:References:Content-Type:Date:
	 Message-Id; b=mIjQFqTzyjxD6UBZoe1TfriNv6HsF0FWhy9n82vBeTf8ZYb7JxcLDfqurGeTzgdjirolITR7642W0kGKCXTp1AKiWdRpYB/0S+luCODdT8RjDaa6XFGP4ti4hSo2GgmX3UWkqJuhw92YsglqeSLP7cUF9C9QRxhzYghvR2umM6I=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=GB2J0UYr; arc=none smtp.client-ip=100.103.45.18
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="GB2J0UYr"
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 09D0B1F00A3A;
	Mon, 17 Aug 2026 06:45:49 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kernel.org;
	s=k20260515; t=1786949150;
	bh=Q5UMmKG+ikqNtMyBwf4KxS3LBkP6thQPAa7cmFn3HJ8=;
	h=From:Subject:Reply-To:To:Cc:In-Reply-To:References:Date;
	b=GB2J0UYrwNNPdBwtoQ/AX/IwBIaGmDvjDX+qFg/mqATUnyFRL+Yj30u+PBkVGxAg0
	 013QL8aSgx9rCgRy/iKBwSySxLDFHWAtIO2uYetNaLoME9ke3OLPzwlKJRGk+S2NH9
	 Cjp5H5Hwbvh5jfYShHME61JGjaH8SUPuDia5+52ybM0/ttsIIZmPjrkcxwUrWYJX7x
	 f7J9keDzJJFgHAt1JBpJkFynGctsDiRIGXHOB260bjF0G+B9Mbbthx+zASfqsaOhb5
	 1qb8LBN4u9nHnuQqwMKLwYFm3Y1oDEqIG1M88IFhABGrYnpAFzwW0VAOzEZUq8uXFU
	 oFFSkS5RrKpuw==
From: sashiko-bot@kernel.org
Subject: Re: [PATCH v3 2/4] dt-bindings: iio: dac: add adi,ad5710r.yaml
Reply-To: sashiko-reviews@lists.linux.dev
To: "Kim Seer Paller" <kimseer.paller@analog.com>
Cc: robh@kernel.org, devicetree@vger.kernel.org, conor+dt@kernel.org
In-Reply-To: <20260817-iio-ad5710r-upstream-v3-2-3a4bf7b9c78b@analog.com>
References: <20260817-iio-ad5710r-upstream-v3-0-3a4bf7b9c78b@analog.com>
 <20260817-iio-ad5710r-upstream-v3-2-3a4bf7b9c78b@analog.com>
Content-Type: text/plain; charset=utf-8
Content-Transfer-Encoding: quoted-printable
Date: Mon, 17 Aug 2026 06:45:49 +0000
Message-Id: <20260817064550.09D0B1F00A3A@smtp.kernel.org>
Precedence: bulk
X-Mailing-List: devicetree@vger.kernel.org
List-Id: <devicetree.vger.kernel.org>
List-Subscribe: <mailto:devicetree+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:devicetree+unsubscribe@vger.kernel.org>

Thank you for your contribution! Sashiko AI review found 2 potential issue(=
s) to consider:
- [Medium] The device tree binding uses a global custom boolean property (`=
adi,range-double`) to configure the output range for all channels simultane=
ously, which contradicts the hardware's per-channel capability and ignores =
the standard IIO properties.
- [Low] The new device tree binding is incorrectly grouped under an unrelat=
ed driver section in the MAINTAINERS file.
--

--- Patch [2]: [PATCH v3 2/4] dt-bindings: iio: dac: add adi,ad5710r.yaml -=
--
commit b2de4e5383bdec1581e94efdee27327a62fd9078
Author: Kim Seer Paller <kimseer.paller@analog.com>

dt-bindings: iio: dac: add adi,ad5710r.yaml

Add device tree bindings for the Analog Devices AD5710R/AD5711R
8-channel 12-/16-bit Configurable IDAC/VDAC.

> diff --git a/Documentation/devicetree/bindings/iio/dac/adi,ad5710r.yaml b=
/Documentation/devicetree/bindings/iio/dac/adi,ad5710r.yaml
> new file mode 100644
> index 0000000000000..259866ca87cff
> --- /dev/null
> +++ b/Documentation/devicetree/bindings/iio/dac/adi,ad5710r.yaml

[ ... ]

> +  ldac-gpios:
> +    description:
> +      LDAC pin to be used as a hardware trigger to update the DAC channe=
ls. If
> +      not present, the DAC channels are updated by Software LDAC.
> +    maxItems: 1
> +
> +  adi,range-double:
> +    description:
> +      Configure the output range for all channels. If the property is pr=
esent,
> +      the output will range from 0V to 2 x Vref. If the property is not =
present,
> +      the output will range from 0V to Vref.
> +    type: boolean

[Severity: Medium]
Does this global custom property restrict the per-channel hardware capabili=
ty
and ignore standard IIO range properties?

The binding description earlier in this file states "Each channel can be
independently configured as a voltage output (0V to VREF or 0V to 2 x VREF)=
".
However, `adi,range-double` is defined here as a global setting, which prev=
ents
configuring voltage ranges independently for different channels.

Would it be better to move this to the per-channel `patternProperties` and
utilize the standard IIO property `output-range-microvolt` instead of a cus=
tom
boolean?

[ ... ]

> diff --git a/MAINTAINERS b/MAINTAINERS
> index 3c5084fec2023..bed05d0cccb73 100644
> --- a/MAINTAINERS
> +++ b/MAINTAINERS
> @@ -1444,6 +1444,7 @@ L:	linux-iio@vger.kernel.org
>  S:	Supported
>  W:	https://ez.analog.com/linux-software-drivers
>  F:	Documentation/devicetree/bindings/iio/dac/adi,ad3530r.yaml
> +F:	Documentation/devicetree/bindings/iio/dac/adi,ad5710r.yaml

[Severity: Low]
This isn't a bug, but is the new device tree binding incorrectly grouped
under an unrelated driver section?

The `adi,ad5710r.yaml` file appears to be appended to the
"ANALOG DEVICES INC AD3530R DRIVER" section, which could be misleading
when using standard maintainer tools.

>  F:	drivers/iio/dac/ad3530r.c
> =20
>  ANALOG DEVICES INC AD3552R DRIVER

--=20
Sashiko AI review =C2=B7 https://sashiko.dev/#/patchset/20260817-iio-ad5710=
r-upstream-v3-0-3a4bf7b9c78b@analog.com?part=3D2
