Received: from smtp.kernel.org (aws-us-west-2-korg-mail-alma10-1.taild15c8.ts.net [100.103.45.18])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 3AA752F84F
	for <devicetree@vger.kernel.org>; Sat, 27 Jun 2026 01:04:14 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=100.103.45.18
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1782522256; cv=none; b=WPW2JwO9jCXxYo//r6wTezDMAGM0CuImXNNWH5WC4lH/jfE6BD0OabnomBtz9YYaLwWIXdGryYjYAHlB830hbPOnlRK+maTIC41BUZnIP/MFg3GPTv+kENEe7QmEME2gFPDvDpjoOZl6q50VAXhOpTYwofjWy8aZ3gPqNNpwCOc=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1782522256; c=relaxed/simple;
	bh=k7fsWatdOPMLrp/iB+dUHOjxnR08jEzJ5D1DHn4bdiI=;
	h=From:Subject:To:Cc:In-Reply-To:References:Content-Type:Date:
	 Message-Id; b=vBmLYCANh+TzY6WYYjMOEoewSLX28pBITFqAhVs+Q8AP+k9eqt+txqkkL1oMDeqXbmmjHrDTOAI6FW+Phs17nwSjxsbx0HpxDCJ/+x9TNGV3XnN4gTgaoRtf3lVO2wfUpI4f2VlTIWwjPAJVwO9WwkCMYQlwDq2UaQJ0hMcDn/A=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=J3vfGYVO; arc=none smtp.client-ip=100.103.45.18
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="J3vfGYVO"
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 95DE51F000E9;
	Sat, 27 Jun 2026 01:04:14 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kernel.org;
	s=k20260515; t=1782522254;
	bh=iFRbdWBD1Dx6EVhzLSeoPw6xBYqKgcC+jqRljnOXaP4=;
	h=From:Subject:Reply-To:To:Cc:In-Reply-To:References:Date;
	b=J3vfGYVORJ5E//FVq/4tiEsdq8CP9koEc4SgiQp/j8b0NPqYhUHY3q6PUMStxJmQg
	 Pr5BOwtTGSbOJFh1lCzGqSw+Kkn0Ur2oPreqJL0F6wMqyWPhSQPpCYYTBwfNCgRT1V
	 pNYG0eSZxWObU8s4pzFGfDad/5tFbDE52gbuLOrWTQ7XNvt9fR1NWtTClN2721QNCE
	 fjyKidhsuYTO2W5Y9LMjLAo9YJRAjPCa1E5F7IAhcH9NZX2KS+gAt0IsLvkEzeF+68
	 kUcw8l+trkEYsPqKdPiPPfepGcqdc3zXERQxn5Quzst6syr/BWfR8ceL8KKuO71aOd
	 yUU+la3a5CLqQ==
From: sashiko-bot@kernel.org
Subject: Re: [PATCH v3 1/2] dt-bindings: iio: magnetometer: add Melexis
 MLX90393
Reply-To: sashiko-reviews@lists.linux.dev
To: "Nikhil Gautam" <nikhilgtr@gmail.com>
Cc: devicetree@vger.kernel.org, robh@kernel.org, conor+dt@kernel.org
In-Reply-To: <20260627005843.7786-2-nikhilgtr@gmail.com>
References: <20260627005843.7786-1-nikhilgtr@gmail.com>
 <20260627005843.7786-2-nikhilgtr@gmail.com>
Content-Type: text/plain; charset=utf-8
Content-Transfer-Encoding: quoted-printable
Date: Sat, 27 Jun 2026 01:04:14 +0000
Message-Id: <20260627010414.95DE51F000E9@smtp.kernel.org>
Precedence: bulk
X-Mailing-List: devicetree@vger.kernel.org
List-Id: <devicetree.vger.kernel.org>
List-Subscribe: <mailto:devicetree+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:devicetree+unsubscribe@vger.kernel.org>

Thank you for your contribution! Sashiko AI review found 1 potential issue(=
s) to consider:
- [Low] The required properties `vdd-supply` and `vddio-supply` are omitted=
 from the `properties:` block and missing from the `examples:` node, causin=
g schema validation failures.
--

commit c1fe5f8c39a4b8113c50e154a6674ac296637f70
Author: Nikhil Gautam <nikhilgtr@gmail.com>

dt-bindings: iio: magnetometer: add Melexis MLX90393

Add devicetree bindings for the Melexis MLX90393 3-axis magnetometer and
temperature sensor.

> diff --git a/Documentation/devicetree/bindings/iio/magnetometer/melexis,m=
lx90393.yaml b/Documentation/devicetree/bindings/iio/magnetometer/melexis,m=
lx90393.yaml
> new file mode 100644
> index 0000000000000..33ab0be663450
> --- /dev/null
> +++ b/Documentation/devicetree/bindings/iio/magnetometer/melexis,mlx90393=
.yaml

[ ... ]

> +properties:
> +  compatible:
> +    const: melexis,mlx90393
> +
> +  reg:
> +    maxItems: 1
> +
> +  interrupts:
> +    maxItems: 1
> +
> +  trigger-gpios:
> +    maxItems: 1
> +
> +required:
> +  - compatible
> +  - reg
> +  - vdd-supply
> +  - vddio-supply
> +
> +additionalProperties: false

[Severity: Low]
Will this binding fail schema validation when running dt_binding_check?

The vdd-supply and vddio-supply properties are listed as required, but
they are not defined in the properties block.

Because additionalProperties is set to false, wouldn't the schema reject
these supply properties during validation?

> +examples:
> +  - |
> +    #include <dt-bindings/gpio/gpio.h>
> +    #include <dt-bindings/interrupt-controller/irq.h>
> +
> +    i2c {
> +        #address-cells =3D <1>;
> +        #size-cells =3D <0>;
> +
> +        magnetometer@c {
> +            compatible =3D "melexis,mlx90393";
> +            reg =3D <0x0c>;
> +
> +            interrupt-parent =3D <&gpio>;
> +            interrupts =3D <17 IRQ_TYPE_EDGE_RISING>;
> +
> +            trigger-gpios =3D <&gpio 18 GPIO_ACTIVE_HIGH>;
> +        };
> +    };

[Severity: Low]
Does this example node need to include the vdd-supply and vddio-supply
properties to pass validation, since they are marked as required above?

--=20
Sashiko AI review =C2=B7 https://sashiko.dev/#/patchset/20260627005843.7786=
-1-nikhilgtr@gmail.com?part=3D1
