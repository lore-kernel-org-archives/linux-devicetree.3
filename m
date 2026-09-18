Received: from smtp.kernel.org (aws-us-west-2-korg-mail-alma10-1.taild15c8.ts.net [100.103.45.18])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id B74DA51E43E
	for <devicetree@vger.kernel.org>; Fri, 18 Sep 2026 19:07:23 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=100.103.45.18
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1789758446; cv=none; b=sWD7sW9dsHLc3hZ6cP8YbD+WFq+WZuIHf1UpM2Oh40p9d0jy+Xpke4sN+c2x0OToMjyoqyxADPjTL6d0CFls5WRQjnvzXlhDBC4wKjWq/C/f7EDBUbfB+WAR1Vhut4SNW/nncxzkWuml+f36ceho8sQIf3O8Cn/3cXbhUi1a4R0=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1789758446; c=relaxed/simple;
	bh=M41wMBEhxBW2a430dZIWsF3N10lwPs66ix4W5j2qxUI=;
	h=From:Subject:To:Cc:In-Reply-To:References:Content-Type:Date:
	 Message-Id; b=Ka+P7xgg+1/yZ8QV4kQ1/hiFzLRRWxAIVzB7vFxen/zKs40wqIwywoCAgrjsEYcqb1bKfVw0+Sc4bch+0geLCFDJjvdtOXu2pL6GXwnyxL/zZcdG7lpyjZmQSsJna0/7UmwsM2khcgFK4WP+bywS3iSim9EIj6MefoJEX8p8enU=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=SvA7v9CN; arc=none smtp.client-ip=100.103.45.18
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="SvA7v9CN"
Received: by smtp.kernel.org (Postfix) with ESMTPSA id E26511F000FF;
	Fri, 18 Sep 2026 19:07:20 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kernel.org;
	s=k20260515; t=1789758441;
	bh=TBtgY9xv41BJ+QtJsAQp8APSUwRHrHY7TiocUnfIDwQ=;
	h=From:Subject:Reply-To:To:Cc:In-Reply-To:References:Date;
	b=SvA7v9CN33A8TOY1oXc2rmRR6p7H8oyVlzhefgH1krx3NO/eBbyN1xf48soNCrkB/
	 rWKGEknOiaS7+Tpny8ynLaqIuBbhJQf0CiXHdVIut0txfYDkI80Jla7RVizv5dz+oN
	 rPGL5Kes2YrddfELcp6GGx8SiNu51B58IOgt/DCa5pAQ2DZV6zwiSt7nnzOZ2eAe4n
	 NZ3y4KPcvBS7Bi+18KShS7iM1dL/dvbxumo8ZFsphRRKiFK0YLqM9rEuj3W5jfnNjf
	 So//25fSdwD0+ZZRV9VQhQZuzMGmfc9c1toBc8YgQlxMlS1VBGQwn96CEe4c8CG9Rw
	 rbl9awr7lftHQ==
From: sashiko-bot@kernel.org
Subject: Re: [PATCH v3] dt-bindings: iio: adc: Add dt binding to xlnx,xadc
Reply-To: sashiko-reviews@lists.linux.dev
To: "Omer PALA" <palaomer100@gmail.com>
Cc: devicetree@vger.kernel.org, robh@kernel.org, conor+dt@kernel.org
In-Reply-To: <20260918185813.5070-1-palaomer100@gmail.com>
References: <20260918174809.17502-1-palaomer100@gmail.com>
 <20260918185813.5070-1-palaomer100@gmail.com>
Content-Type: text/plain; charset=utf-8
Content-Transfer-Encoding: quoted-printable
Date: Fri, 18 Sep 2026 19:07:20 +0000
Message-Id: <20260918190720.E26511F000FF@smtp.kernel.org>
Precedence: bulk
X-Mailing-List: devicetree@vger.kernel.org
List-Id: <devicetree.vger.kernel.org>
List-Subscribe: <mailto:devicetree+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:devicetree+unsubscribe@vger.kernel.org>

Thank you for your contribution! Sashiko AI review found 2 potential issue(=
s) to consider:
- [Medium] dt-bindings: validation bypass for default xlnx,external-mux mode
- [Medium] dt-bindings: ineffective minimum/maximum constraints on reg array
--

commit d006447af566b762c0496dc6711694fae6c9194a
Author: Omer PALA <palaomer100@gmail.com>

dt-bindings: iio: adc: Add dt binding to xlnx,xadc

Add yaml devicetree binding for xlnx,zynq-xadc-1.00.a,
xlnx,axi-xadc-1.00.a and xlnx,system-management-wiz-1.3 from
xilinx-xadc.txt file.

> diff --git a/Documentation/devicetree/bindings/iio/adc/xlnx,xadc.yaml b/D=
ocumentation/devicetree/bindings/iio/adc/xlnx,xadc.yaml
> new file mode 100644
> index 0000000000000..ffaada52f9a6e
> --- /dev/null
> +++ b/Documentation/devicetree/bindings/iio/adc/xlnx,xadc.yaml
> @@ -0,0 +1,191 @@

[ ... ]

> +  xlnx,channels:
> +    type: object
> +    description: List of external channels that are connected to the ADC.
> +    properties:
> +      "#address-cells":
> +        const: 1
> +      "#size-cells":
> +        const: 0
> +    required:
> +      - "#address-cells"
> +      - "#size-cells"
> +    patternProperties:
> +      "^channel@[0-9a-f]+$":
> +        type: object
> +        properties:
> +          reg:
> +            description: Pair of pins the channel is connected to
> +            minimum: 0
> +            maximum: 16

[Severity: Medium]
Will these constraints actually provide bounds checking?

Because dt-schema treats standard properties like reg as arrays,
applying numeric constraints like minimum and maximum directly to the
property rather than its items results in them being silently ignored
by the validator.

Could invalid reg values silently pass schema validation here?

> +          xlnx,bipolar:
> +            description: If set the channel is used in bipolar mode.
> +            $ref: /schemas/types.yaml#/definitions/flag

[ ... ]

> +allOf:
> +  - if:
> +      properties:
> +        xlnx,external-mux:
> +          const: none
> +      required:
> +        - xlnx,external-mux
> +    then:
> +      properties:
> +        xlnx,external-mux-channel: false

[Severity: Medium]
Does this conditionally restrict xlnx,external-mux-channel correctly when
xlnx,external-mux is omitted?

Because none is the default external mux mode, it seems a device tree could
omit xlnx,external-mux entirely.

However, the required array containing xlnx,external-mux in the if block
causes the block to evaluate as false and be skipped when the property
is absent.

Will this allow a device tree with xlnx,external-mux-channel specified but
xlnx,external-mux omitted to erroneously pass validation?

--=20
Sashiko AI review =C2=B7 https://sashiko.dev/#/patchset/20260918185813.5070=
-1-palaomer100@gmail.com?part=3D1
