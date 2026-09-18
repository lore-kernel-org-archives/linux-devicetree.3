Received: from smtp.kernel.org (aws-us-west-2-korg-mail-alma10-1.taild15c8.ts.net [100.103.45.18])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 29ACD4F93DD
	for <devicetree@vger.kernel.org>; Fri, 18 Sep 2026 15:03:38 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=100.103.45.18
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1789743820; cv=none; b=tukoQmbqTofFVSq+pcTu0LtMUanncC8Hk3pnlX+tMxzBvVxVggTC+ouVKlN19K2ErBmW/1k/3Gf8D3PMeTWM4pLxMKbA30581nh3oRX4Py6w8EBcu+PGmPTckO3y3y2KWBhYQOKOC3D3McLE8YThhWgkQTDaDoubx5MDKvKjX04=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1789743820; c=relaxed/simple;
	bh=nKQVXDybAK+Er+p+uyIKqjXNVbYERnp+ZaogDQ5XDkg=;
	h=From:Subject:To:Cc:In-Reply-To:References:Content-Type:Date:
	 Message-Id; b=WdZbrAkVNRjV/43uakoKxcUPYyylWivbyBQfgMubnUuz1weRkwqQlZcEuFA8cYgx54ZJY9zzwonRXOEMeToz5JfeCLALv8NX1dHMwmavkgb703/Pb4GjbGzd8asLIyQ8Pqp2yXqSuXhRbshbTPshMK021Bn0e9IJ3+vS9hRhFM8=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=QLvxT2cW; arc=none smtp.client-ip=100.103.45.18
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="QLvxT2cW"
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 569D71F000FF;
	Fri, 18 Sep 2026 15:03:38 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kernel.org;
	s=k20260515; t=1789743818;
	bh=TgrEdSinsacpoaCC9CUJbzvoefjX/T52raAJ4xPP1mE=;
	h=From:Subject:Reply-To:To:Cc:In-Reply-To:References:Date;
	b=QLvxT2cWmWtCSKjzXGiwn+vZMpDHlkljFqbR9PDP5fO/2sZM00hZZQovI4RFgR9GB
	 +4Gjs5QL0RzeIy9YMmWARyJyu9f5UPMKMrbrM4cpaCLEzy5hhfLfXdxRgxmmuAMvpi
	 eL+PexoCXR4bcXGYxhJm7SfDa8Rr2F0AaLcLwxBQ8ufTXfpMszX6yBhF9yDzlXXNYz
	 W/1MacOvwdN/SUxvtlS/2ypTiHaX6OfF1yak0iHXGpwa0hDzmTiZnq75jZ8h/BtFWu
	 xRepnCkWx7t5nBrWRCp5uapErNAw2K6Nw6eoMto1du/aU6Pb2QP8h7OH3Q1k/oeo8Y
	 uovVUX6Sk9N6g==
From: sashiko-bot@kernel.org
Subject: Re: [PATCH] dt-bindings: iio: adc: Add dt binding to xlnx,xadc
Reply-To: sashiko-reviews@lists.linux.dev
To: "Omer PALA" <palaomer100@gmail.com>
Cc: robh@kernel.org, conor+dt@kernel.org, devicetree@vger.kernel.org
In-Reply-To: <20260918145804.26957-1-palaomer100@gmail.com>
References: <20260918145804.26957-1-palaomer100@gmail.com>
Content-Type: text/plain; charset=utf-8
Content-Transfer-Encoding: quoted-printable
Date: Fri, 18 Sep 2026 15:03:37 +0000
Message-Id: <20260918150338.569D71F000FF@smtp.kernel.org>
Precedence: bulk
X-Mailing-List: devicetree@vger.kernel.org
List-Id: <devicetree.vger.kernel.org>
List-Subscribe: <mailto:devicetree+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:devicetree+unsubscribe@vger.kernel.org>

Thank you for your contribution! Sashiko AI review found 2 potential issue(=
s) to consider:
- [Medium] dt-bindings: missing required constraint for xlnx,external-mux-c=
hannel
- [Medium] dt-bindings: missing required constraint for #address-cells and =
#size-cells under xlnx,channels
--

commit 7f09f8169e0c3778bfd860a9b73695d153e538cf
Author: Omer PALA <palaomer100@gmail.com>

dt-bindings: iio: adc: Add dt binding to xlnx,xadc

This commit converts the text-based devicetree binding for the Xilinx 7
Series XADC and UltraScale/UltraScale+ System Monitor into YAML format.

> diff --git a/Documentation/devicetree/bindings/iio/adc/xlnx,xadc.yaml b/D=
ocumentation/devicetree/bindings/iio/adc/xlnx,xadc.yaml
> new file mode 100644
> index 0000000000000..6031de7630a2c
> --- /dev/null
> +++ b/Documentation/devicetree/bindings/iio/adc/xlnx,xadc.yaml
[ ... ]
> +  xlnx,channels:
> +    type: object
> +    description: List of external channels that are connected to the ADC.
> +    properties:
> +      "#address-cells":
> +        const: 1
> +      "#size-cells":
> +        const: 0
> +    patternProperties:

[Severity: Medium]
Should "#address-cells" and "#size-cells" be added to a required array for=
=20
the xlnx,channels node? Without a required list here, schema validation=20
might silently accept nodes that are missing these mandatory properties.

[ ... ]
> +allOf:
> +  - if:
> +      properties:
> +        xlnx,external-mux:
> +          const: single
> +    then:
> +      properties:
> +        xlnx,external-mux-channel:
> +          minimum: 0
> +          maximum: 16

[Severity: Medium]
Does this if-then block need a required declaration for=20
xlnx,external-mux-channel? Currently, it only restricts the bounds of the=20
property but doesn't mandate its presence when xlnx,external-mux is set to=
=20
single. This could allow incomplete device trees to pass validation.

> +
> +  - if:
> +      properties:
> +        xlnx,external-mux:
> +          const: dual
> +    then:
> +      properties:
> +        xlnx,external-mux-channel:
> +          minimum: 1
> +          maximum: 8

[Severity: Medium]
Similarly, should xlnx,external-mux-channel be marked as required in this=20
block when xlnx,external-mux is dual?

--=20
Sashiko AI review =C2=B7 https://sashiko.dev/#/patchset/20260918145804.2695=
7-1-palaomer100@gmail.com?part=3D1
