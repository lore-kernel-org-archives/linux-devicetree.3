Received: from smtp.kernel.org (aws-us-west-2-korg-mail-alma10-1.taild15c8.ts.net [100.103.45.18])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id EEEA7483BC8
	for <devicetree@vger.kernel.org>; Thu, 24 Sep 2026 13:20:26 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=100.103.45.18
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1790256033; cv=none; b=BibAzAEDhDViQ/nBVyv2iqtCS2gN281wNp4ZcRB6ctBGn6Xhym7CjZvcJFYDVHaXLGVRsxzFwcENy/CmMRZ1vWT8v/qT6Qzvzyh3/wkcAyMRVvFFNgIyAb8Rwq1N6ew89l5jwZyJT6F8JKeSC6DfRjYF8KIMG12vHtZnuOTSuFQ=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1790256033; c=relaxed/simple;
	bh=qbR8PoaCzvQeuKMKy8WTNK7OPXgDhd+2NO4UGrxR4FE=;
	h=From:Subject:To:Cc:In-Reply-To:References:Content-Type:Date:
	 Message-Id; b=rXZJtHJXpcRpoDFHRgMq3W8rekcH0Hf4gLQ0nSJWN5zYbUQL3IVciyFC4stc5iIlnJQvvuqdX/sSoVv0WlCnbkTaDTD1zj011YaTojuWs3rsobNHQcO0QbY6eJ+GwaECTMnXOLrWOZI6mlLcIYZhue5MhxSTKlLX8pZMrOqQCDA=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=K9DMTo4B; arc=none smtp.client-ip=100.103.45.18
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="K9DMTo4B"
Received: by smtp.kernel.org (Postfix) with ESMTPSA id D479F1F000FF;
	Thu, 24 Sep 2026 13:20:22 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kernel.org;
	s=k20260515; t=1790256023;
	bh=4XLSXhgIv0FdmTXIpnankXEt2iiMQafvH+lhoHWlzdQ=;
	h=From:Subject:Reply-To:To:Cc:In-Reply-To:References:Date;
	b=K9DMTo4BqZ/z/Kab93VTG6qx+NblwdJvfvRk+xAD9J9C+gfm/pm5JL8Xch79y15DM
	 jJlIu9yCe9V8mkhgGj9ge3QlD3Zp3I8ue4mSBijbE+k6uOnH+axfnXupTTD2CjTuVG
	 oOdOrfk10ywj+gJL/pTuwHdhOEvlw689o5CoighTY98hAd9gPxksuhR9hDV/wKVoeh
	 xwbrlZ1lhmcW+eHqzx20NDTlWMihzZNa2zOtPhd7UqtCvUj5kdnEwz2C2v9fX9njrj
	 Wdoc1JJwR6+XWsoOqTV4H6z0NeuMhOcW+XEcYj2FpYJlsxQlpHMLdOZj/gTqd7XcNy
	 LrguWCshiETBA==
From: sashiko-bot@kernel.org
Subject: Re: [PATCH v2 1/2] dt-bindings: iio: add: document the MAX34417
 Four-Channel High Dynamic Range Power Accumulator
Reply-To: sashiko-reviews@lists.linux.dev
To: "Neil Armstrong" <neil.armstrong@linaro.org>
Cc: robh@kernel.org, devicetree@vger.kernel.org, conor+dt@kernel.org
In-Reply-To: <20260924-topic-sm8x50-iio-max34417-adc-v2-1-9a0609e72f5c@linaro.org>
References: <20260924-topic-sm8x50-iio-max34417-adc-v2-0-9a0609e72f5c@linaro.org>
 <20260924-topic-sm8x50-iio-max34417-adc-v2-1-9a0609e72f5c@linaro.org>
Content-Type: text/plain; charset=utf-8
Content-Transfer-Encoding: quoted-printable
Date: Thu, 24 Sep 2026 13:20:22 +0000
Message-Id: <20260924132022.D479F1F000FF@smtp.kernel.org>
Precedence: bulk
X-Mailing-List: devicetree@vger.kernel.org
List-Id: <devicetree.vger.kernel.org>
List-Subscribe: <mailto:devicetree+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:devicetree+unsubscribe@vger.kernel.org>

Thank you for your contribution! Sashiko AI review found 1 potential issue(=
s) to consider:
- [Medium] dt-bindings: max34417: arbitrarily restrictive minimum on shunt =
resistor
--

commit 3650a83bfbfc37f2001988362d1f90e712127acc
Author: Neil Armstrong <neil.armstrong@linaro.org>

dt-bindings: iio: add: document the MAX34417 Four-Channel High Dynamic Rang=
e Power Accumulator

Document the Maxim MAX34417 Four-Channel High Dynamic Range Power
Accumulator used to monitor power consumption of portable systems.

> diff --git a/Documentation/devicetree/bindings/iio/adc/maxim,max34417.yam=
l b/Documentation/devicetree/bindings/iio/adc/maxim,max34417.yaml
> new file mode 100644
> index 0000000000000..058af61cc04e2
> --- /dev/null
> +++ b/Documentation/devicetree/bindings/iio/adc/maxim,max34417.yaml

[ ... ]

> +patternProperties:
> +  "^channel@[0-3]$":
> +    $ref: adc.yaml
> +    type: object
> +    description:
> +      Represents the internal channels of the sensor.
> +
> +    properties:
> +      reg:
> +        items:
> +          - minimum: 0
> +            maximum: 3
> +
> +      label: true
> +
> +      shunt-resistor-micro-ohms:
> +        description:
> +          Value in micro Ohms of the shunt resistor connected between th=
e RS+ and RS- inputs.
> +        minimum: 1000

[Severity: Medium]
Does this minimum set an artificially restrictive lower bound for the
shunt-resistor-micro-ohms property?

Valid hardware configurations could utilize sub-milliohm shunt resistors=20
(e.g., 250 or 500 micro-ohms), which would fail device tree validation and
prevent the driver from probing.

> +        maximum: 100000
> +        default: 1000
> +
> +    required:
> +      - reg

--=20
Sashiko AI review =C2=B7 https://sashiko.dev/#/patchset/20260924-topic-sm8x=
50-iio-max34417-adc-v2-0-9a0609e72f5c@linaro.org?part=3D1
