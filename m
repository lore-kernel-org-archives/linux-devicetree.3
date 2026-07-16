Received: from smtp.kernel.org (aws-us-west-2-korg-mail-alma10-1.taild15c8.ts.net [100.103.45.18])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 8342933DED5
	for <devicetree@vger.kernel.org>; Thu, 16 Jul 2026 08:13:01 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=100.103.45.18
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1784189582; cv=none; b=YDbSx5RqS7rRj+yAaQUuesvqXJFbWbxUGmbBMsgp+Q5gOuMQU2fVxE/4gC2TVMjyjkwGyrjvKF4LKqVaUIp8tZnowVMAmtW21ODw8/QgOAMAJLypKOc7A50OWzCozrYP7ji8/n5LCRedTc64h8YE4HnQcF9xM82kl2mVgl85MQo=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1784189582; c=relaxed/simple;
	bh=JabEcnxLLj/kgEwv2xXdwiWkj6WnAqP/2wVxAMxxoTg=;
	h=From:Subject:To:Cc:In-Reply-To:References:Content-Type:Date:
	 Message-Id; b=NAE8xbBhBG2gCyz4eEriuS1moDN/kNXSzrqC7JTz0tuzlWro3LUI3y+sRz7Rxo6L16eGiQeYGuvsjpnIUN0C0GvmcHvFdg08t1hLe6mGyEoygs/mehOK2K+LzvsweNZwu+kZX6NFJEAsXX92NNE81Ob8URzlCjot5gj5eMN4Ins=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=JOb9Q//z; arc=none smtp.client-ip=100.103.45.18
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="JOb9Q//z"
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 182221F000E9;
	Thu, 16 Jul 2026 08:13:01 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kernel.org;
	s=k20260515; t=1784189581;
	bh=mtJsyARLB6wnK2laYsPM2ArpQZBrTTd4M484W7GAXS4=;
	h=From:Subject:Reply-To:To:Cc:In-Reply-To:References:Date;
	b=JOb9Q//zYZkwMPF02qtnQ4gtkQDyvqDWaFD91kpQh5n4XxA/GmoN/YIRDTDCU8p46
	 GkPy2421vNwtHh5wz3ccMxJj4a8785mKU2qTLNII7CsoVVCVtp70ow+825ztYsXJgc
	 QAXmnZURtIQ1+/oTkDgcMh8s9V6StByYwmRNMOZg92u3Bs291WMz0TFOE8DMtK9CRq
	 zB1f+xlbpbrRbPSm4lfVdz9nrCN6E5GIGuhEWAqdiRyciSy5w4sEYbvqiQV5fZ1zKJ
	 9ozFgkU2Ie3RZAJilWhk4toE11g5J4BM7w/w4tcpsNfSZAgwBJZT9aw+vOWySgU7/T
	 AtnGb3dCjzBew==
From: sashiko-bot@kernel.org
Subject: Re: [PATCH 2/3] dt-bindings: iio: dac: add adi,ad5710r.yaml
Reply-To: sashiko-reviews@lists.linux.dev
To: "Kim Seer Paller" <kimseer.paller@analog.com>
Cc: devicetree@vger.kernel.org, robh@kernel.org, conor+dt@kernel.org
In-Reply-To: <20260716-iio-ad5710r-upstream-v1-2-e848a4bb701f@analog.com>
References: <20260716-iio-ad5710r-upstream-v1-0-e848a4bb701f@analog.com>
 <20260716-iio-ad5710r-upstream-v1-2-e848a4bb701f@analog.com>
Content-Type: text/plain; charset=utf-8
Content-Transfer-Encoding: quoted-printable
Date: Thu, 16 Jul 2026 08:13:00 +0000
Message-Id: <20260716081301.182221F000E9@smtp.kernel.org>
Precedence: bulk
X-Mailing-List: devicetree@vger.kernel.org
List-Id: <devicetree.vger.kernel.org>
List-Subscribe: <mailto:devicetree+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:devicetree+unsubscribe@vger.kernel.org>

Thank you for your contribution! Sashiko AI review found 2 potential issue(=
s) to consider:
- [Medium] The `minimum` and `maximum` constraints on the channel `reg` pro=
perty are incorrectly wrapped in an `items` list schema, causing them to be=
 silently ignored by the JSON Schema validator.
- [Medium] The binding introduces a custom global property `adi,range-doubl=
e` to configure the voltage range, which contradicts the hardware's per-cha=
nnel capability and ignores standard IIO properties.
--

--- Patch [2]: [PATCH 2/3] dt-bindings: iio: dac: add adi,ad5710r.yaml ---
commit cd748f09cddc4b7eb091c3829a62e52f260a76b0
Author: Kim Seer Paller <kimseer.paller@analog.com>

dt-bindings: iio: dac: add adi,ad5710r.yaml

This commit adds device tree bindings for the Analog Devices AD5710R/AD5711R
8-channel 12-/16-bit Configurable IDAC/VDAC.

> diff --git a/Documentation/devicetree/bindings/iio/dac/adi,ad5710r.yaml b=
/Documentation/devicetree/bindings/iio/dac/adi,ad5710r.yaml
> new file mode 100644
> index 0000000000000..17c1bf0092421
> --- /dev/null
> +++ b/Documentation/devicetree/bindings/iio/dac/adi,ad5710r.yaml
> @@ -0,0 +1,143 @@

[ ... ]

> +description: |
> +  The AD5710R (16-bit) and AD5711R (12-bit) are 8-channel, low-power,
> +  configurable current/voltage output digital-to-analog converters (DACs=
) with
> +  an on-chip 2.5V, 3ppm/=C2=B0C reference. Each channel can be independe=
ntly
> +  configured as a voltage output (0V to VREF or 0V to 2xVREF) or a curre=
nt

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
The description above explicitly states that "Each channel can be independe=
ntly
configured as a voltage output (0V to VREF or 0V to 2xVREF)". Does defining
this as a global property artificially limit the hardware's per-channel
capabilities?

Also, since the schema includes dac.yaml, could the standard per-channel
property output-range-microvolt be used instead of defining a custom global
boolean?

[ ... ]

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
Are these minimum and maximum constraints incorrectly wrapped in an items
list?

Since JSON Schema ignores numeric keywords when applied to an array type,
will these bounds be silently bypassed during dt_binding_check validation,
allowing out-of-bounds reg values? Should the minimum and maximum
constraints be placed directly under the reg property instead?

--=20
Sashiko AI review =C2=B7 https://sashiko.dev/#/patchset/20260716-iio-ad5710=
r-upstream-v1-0-e848a4bb701f@analog.com?part=3D2
