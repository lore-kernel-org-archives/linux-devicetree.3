Received: from smtp.kernel.org (aws-us-west-2-korg-mail-alma10-1.taild15c8.ts.net [100.103.45.18])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 21EB93A9870
	for <devicetree@vger.kernel.org>; Sun, 18 Oct 2026 19:56:05 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=100.103.45.18
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1792353367; cv=none; b=AxVGrgQpWIla6Z4TlW93cAIoMcThVvZ4scKq94j/mKxMc2SGm4fIlRJSVHFAGS+uZXeneKralRmtAleg6WqzxipCDoIPN4KI39pwxv/GY2zgQjD3l88A4IUAB7vuSLFEJgKT49SR9kH/O2r9fb+x/4KYiUETXIS8JCMDCr7QJQs=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1792353367; c=relaxed/simple;
	bh=KG0wtFCEWFkhmKX3HLocydGQ1DexT8O0QodK4Hi/KUY=;
	h=Message-ID:From:Subject:To:Cc:In-Reply-To:References:Content-Type:
	 Date; b=cpDHTcbQg4h55iwUa1q0yIeE5CK2lY0sSqtXeQ+EQf42G8zNCOEJ3mOSYCLhJuI0tiHe+SybvWe7eHxkH0oD/Y6riwzWpThKGTLImYsPK25+GyYoz7Xf7JqIqbjn7JoIV/HPCL2R15rUULIgkLzXBqYN+2PWlgQNgKfO+5n5EAY=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=bWRp61jj; arc=none smtp.client-ip=100.103.45.18
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="bWRp61jj"
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 6A0DB1F000C4;
	Sun, 18 Oct 2026 19:56:05 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kernel.org;
	s=k20260515; t=1792353365;
	bh=cwIJgNP8GC4Pzau49VHSXUNjWchFnN9H0oxmEB1x0Co=;
	h=From:Subject:Reply-To:To:Cc:In-Reply-To:References:Date;
	b=bWRp61jjaYzh1HzSJYXQPgqM6LVQ6bQwPQWQCmagxbCEwdFFBSjQ7My1/tn+vbI7A
	 PTeuHBjcdFRAT28Lsfs9CQ1guiGrwhklzfH5H1ZvZKELJrm5JyS467aghM/SV6mFi1
	 HFpelJZOc4oHnvUNOQn4ZSolCXKkVIaX9j54I0W5upkmT7/3fvmlTS10GpIZ5eF6Hm
	 Ht5cTCAzlSQn6YxqQcwEo07L1g71NY3RoF241OwzdyrLQRdxJ7ZbtNDaxYi6MWLHkU
	 9goGo95IZDWcSLJzLKsBvgRcAtH3UF3cDfjq5WPJnsgusasGUz/R+yytta0ow6PBxC
	 rl9JErwyrb6Jw==
Message-ID: <sashiko-outbox-176354@kernel.org>
From: sashiko-bot@kernel.org
Subject: Re: [PATCH 1/2] dt-bindings: i2c: add GPIO buses sharing one SCL
 line
Reply-To: sashiko-reviews@lists.linux.dev
To: "Ross Cawston" <ross@r-sc.ca>
Cc: devicetree@vger.kernel.org, robh@kernel.org, conor+dt@kernel.org
In-Reply-To: <20261018194315.945-2-ross@r-sc.ca>
References: <20261018194315.945-1-ross@r-sc.ca>
 <20261018194315.945-2-ross@r-sc.ca>
Content-Type: text/plain; charset=utf-8
Content-Transfer-Encoding: quoted-printable
Date: Sun, 18 Oct 2026 19:56:04 +0000
Precedence: bulk
X-Mailing-List: devicetree@vger.kernel.org
List-Id: <devicetree.vger.kernel.org>
List-Subscribe: <mailto:devicetree+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:devicetree+unsubscribe@vger.kernel.org>

Thank you for your contribution! Sashiko AI review found 1 potential issue(=
s) to consider:
- [Medium] dt-bindings: i2c: redundant i2c-gpio-shared-scl binding duplicat=
es i2c-gpio
--

commit ee80c5111c8336e97eace1faedb4188f4c454089
Author: Ross Cawston <ross@r-sc.ca>

dt-bindings: i2c: add GPIO buses sharing one SCL line

This commit adds a Device Tree binding for bit-banged I2C buses that share
a single SCL GPIO line across child bus nodes, each with its own SDA GPIO
line.

> diff --git a/Documentation/devicetree/bindings/i2c/i2c-gpio-shared-scl.ya=
ml b/Documentation/devicetree/bindings/i2c/i2c-gpio-shared-scl.yaml
> new file mode 100644
> index 0000000000000..e725120973ad2
> --- /dev/null
> +++ b/Documentation/devicetree/bindings/i2c/i2c-gpio-shared-scl.yaml
> @@ -0,0 +1,94 @@
> +# SPDX-License-Identifier: (GPL-2.0-only OR BSD-2-Clause)
> +%YAML 1.2
> +---
> +$id: http://devicetree.org/schemas/i2c/i2c-gpio-shared-scl.yaml#
> +$schema: http://devicetree.org/meta-schemas/core.yaml#
> +
> +title: Bit-banged I2C buses sharing one SCL line
> +
> +maintainers:
> +  - Ross Cawston <ross@r-sc.ca>
> +
> +description: |
> +  Several I2C buses bit-banged on GPIOs, with one SCL line common to all=
 of
> +  them and one SDA line per bus. Each child node is a separate I2C bus.
> +  Transfers are serialized, so only one bus clocks SCL at a time.
> +
> +properties:
> +  compatible:
> +    const: i2c-gpio-shared-scl
> +
> +  scl-gpios:
> +    description: The shared SCL line, usually open drain.
> +    maxItems: 1
> +
> +  i2c-gpio,delay-us:
> +    description: Half the clock period in microseconds, as for i2c-gpio.
> +    default: 5
> +
> +  i2c-gpio,timeout-ms:
> +    description: Clock stretching timeout in milliseconds, as for i2c-gp=
io.
> +    default: 100
> +
> +  "#address-cells":
> +    const: 1
> +
> +  "#size-cells":
> +    const: 0
> +
> +patternProperties:
> +  "^i2c@[0-9a-f]+$":
> +    $ref: /schemas/i2c/i2c-controller.yaml#
> +    unevaluatedProperties: false
> +
> +    properties:
> +      reg:
> +        description: Index of the bus, for naming only.
> +        maxItems: 1
> +
> +      sda-gpios:
> +        description: The SDA line of this bus, usually open drain.
> +        maxItems: 1
> +
> +    required:
> +      - reg
> +      - sda-gpios

[Severity: Medium]
Is a separate i2c-gpio-shared-scl binding needed here? The existing
i2c-gpio binding in Documentation/devicetree/bindings/i2c/i2c-gpio.yaml and
the driver in drivers/i2c/busses/i2c-gpio.c already support multiple buses
sharing a single SCL GPIO line (added in commit 645c3d7d07fa ("i2c:
i2c-gpio: Enhance driver for buses with shared SCL") for Realtek switches).

In drivers/i2c/busses/i2c-gpio.c, i2c_gpio_create_scl() and
i2c_gpio_lookup_scl() match the scl-gpios phandle and specifier cells across
standard i2c-gpio nodes:

drivers/i2c/busses/i2c-gpio.c:i2c_gpio_create_scl() {
	if (fwnode) {
		ret =3D fwnode_property_get_reference_args(fwnode, "scl-gpios",
							 "#gpio-cells", 0, 0, &args);
		if (ret)
			/* try the ancient way */
			ret =3D fwnode_property_get_reference_args(fwnode, "gpios",
								 "#gpio-cells", 0, 1, &args);

		if (!ret) {
			if (args.nargs >=3D 1)
				sharable =3D true;
			else
				fwnode_handle_put(args.fwnode);
		}
	}
}

That existing mechanism refcounts the shared struct gpio_desc and serializes
transfers across all adapters sharing the SCL line via i2c_gpio_lock_ops and
scl->lock, while preserving standard per-bus i2c-gpio properties (such as
per-bus i2c-gpio,delay-us, i2c-gpio,timeout-ms, i2c-gpio,sda-output-only,
and i2c-gpio,scl-output-only).

Also, defining a virtual parent container node and child reg properties
described as "Index of the bus, for naming only" runs counter to
Documentation/devicetree/bindings/writing-bindings.rst regarding driver-only
container nodes and arbitrary software instance indices. Could standard
i2c-gpio nodes referencing the same scl-gpios phandle be used instead?

[ ... ]

--=20
Sashiko AI review =C2=B7 https://sashiko.dev/#/patchset/20261018194315.945-=
1-ross@r-sc.ca?part=3D1
