Received: from smtp.kernel.org (aws-us-west-2-korg-mail-alma10-1.taild15c8.ts.net [100.103.45.18])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 93B4B4E430B
	for <devicetree@vger.kernel.org>; Tue, 29 Sep 2026 23:02:27 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=100.103.45.18
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1790722949; cv=none; b=lqIocuAm3lmb2OAnGup/OHtL0m2ne5mpdp8+6o4jRAOTGd0xhWnCGSji9XKe5toDDbyVtx8AVe+KPsLUblxADuYHdojREl3ZH0WsmasMnZFCZtNWrSa8DUsSDxWJ05LkClYgQy5WnaYCdnP6UUMlCy6USb5YRobFWpis+fMR/Rw=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1790722949; c=relaxed/simple;
	bh=xhnY8t5qZ9IWRWSK43jms9zjm7xckMlvs0S74Yk0Q1Q=;
	h=From:Subject:To:Cc:In-Reply-To:References:Content-Type:Date:
	 Message-Id; b=FL/Unq/vnB7fZJ08vzl7JlyUKQowtbcv6bCoacvlqChn++6Izs2Zs69csVjVoV5WoOvD0EkDYBQNf9MQYpu0VDlwUjCc/ma+J27YQCvGb+3CSFfzp6gbMgT3fawKbK4LUAttnQkiM3qE+FwVkn3MtOyGLpFB8njvHcov+GEFeMU=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=eZVhyEo5; arc=none smtp.client-ip=100.103.45.18
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="eZVhyEo5"
Received: by smtp.kernel.org (Postfix) with ESMTPSA id DDDAE1F00898;
	Tue, 29 Sep 2026 23:02:26 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kernel.org;
	s=k20260515; t=1790722947;
	bh=974aWfff8MJa16YbwK6ZLJLUDffSYMqXFdRTn0P7Fpg=;
	h=From:Subject:Reply-To:To:Cc:In-Reply-To:References:Date;
	b=eZVhyEo5sI8IYYpsdqktkyDBV9SobLNn/BNkcAty816Wr+ZXIy7vaOP8suIv1EUnP
	 p/TOyRVb71u1P/wjXARxqVKvzeSs5Bw0CGjM9HSVsd4GcrkSYaXPPF0tc1gg6tCdZJ
	 vcVpaq62NSsUkhqLLlmIn2892HTL81uCsl7hL8hbvyrnpODVzgqB6oRuZjvf4rX+kl
	 SgAX44zeP/Mk+CgwtanI+zP6LcrYRUyHqXXvJBQnKUjjhNP9SIv/siWShbX+k3w60U
	 Wai4qES8OwXcWBiIZbT2SfDv2Y27xckLAbLeG3CuImmUDdnkhps5iI3tpGGZrRIEMz
	 3kBCNYpVoI8fA==
From: sashiko-bot@kernel.org
Subject: Re: [PATCH v3 08/13] dt-bindings: iio: adc: adi,ad4134: Document
 SPI connection mode
Reply-To: sashiko-reviews@lists.linux.dev
To: "Marcelo Schmitt" <marcelo.schmitt@analog.com>
Cc: conor+dt@kernel.org, robh@kernel.org, devicetree@vger.kernel.org
In-Reply-To: <12e5af9d96f6c5e800ad860d3cfa6ac8006a22e2.1790719425.git.marcelo.schmitt@analog.com>
References: <cover.1790719424.git.marcelo.schmitt@analog.com>
 <12e5af9d96f6c5e800ad860d3cfa6ac8006a22e2.1790719425.git.marcelo.schmitt@analog.com>
Content-Type: text/plain; charset=utf-8
Content-Transfer-Encoding: quoted-printable
Date: Tue, 29 Sep 2026 23:02:26 +0000
Message-Id: <20260929230226.DDDAE1F00898@smtp.kernel.org>
Precedence: bulk
X-Mailing-List: devicetree@vger.kernel.org
List-Id: <devicetree.vger.kernel.org>
List-Subscribe: <mailto:devicetree+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:devicetree+unsubscribe@vger.kernel.org>

Thank you for your contribution! Sashiko AI review found 3 potential issue(=
s) to consider:
- [Medium] dt-bindings: validation loophole bypasses #daisy-chained-devices=
 requirement
- [Medium] dt-bindings: malformed YAML const constraint for spi-rx-bus-widt=
h array
- [Medium] dt-bindings: missing required enforcement for spi-rx-bus-width i=
n chained mode
--

commit 8253152c0a129fd35b9669cd3adc3c7039f4e2b2
Author: Marcelo Schmitt <marcelo.schmitt@analog.com>

dt-bindings: iio: adc: adi,ad4134: Document SPI connection mode

This commit updates the binding to document how AD4134 chips are connected
to the host SPI controller under different wiring configurations. It
specifies the requirements for daisy-chained SPI modes and corresponding
bus width constraints.

> diff --git a/Documentation/devicetree/bindings/iio/adc/adi,ad4134.yaml b/=
Documentation/devicetree/bindings/iio/adc/adi,ad4134.yaml
> index ea6d7e0264190..0b2a2cbfadae8 100644
> --- a/Documentation/devicetree/bindings/iio/adc/adi,ad4134.yaml
> +++ b/Documentation/devicetree/bindings/iio/adc/adi,ad4134.yaml
[ ... ]
> @@ -141,13 +161,30 @@ required:
[ ... ]
> +  - oneOf:
> +      - required: [adi,spi-mode, '#daisy-chained-devices']
> +        properties:
> +          adi,spi-mode:
> +            const: one-channel-chain
> +          spi-rx-bus-width:
> +            const: 1
> +      - required: [adi,spi-mode, '#daisy-chained-devices']

[Severity: Medium]
Could this regression allow incomplete device trees to pass validation?

In JSON Schema, property value constraints only apply if the property is
actually present in the node instance. Without including spi-rx-bus-width
in the required array for the two-channel-chain branch, a node could omit
the property entirely and bypass the multi-lane constraint, falling back
to an incorrect 1-lane default at runtime.

Should spi-rx-bus-width be added to the required list here?

> +        properties:
> +          adi,spi-mode:
> +            const: two-channel-chain
> +          spi-rx-bus-width:
> +            const: 1, 1

[Severity: Medium]
Does this YAML constraint evaluation cause a regression where valid inputs
are rejected?

In YAML, const: 1, 1 parses as the literal string "1, 1". Since
spi-rx-bus-width is defined as a uint32-array, the JSON representation is
parsed as an array. Comparing an array against a string using const always
fails.

This would prevent valid hardware descriptions from passing dt_binding_check
validation. Should this be formatted as an explicit array to match the type?

> +      - properties:
> +          '#daisy-chained-devices': false

[Severity: Medium]
Does this regression in the fallback branch bypass the intended daisy chain
property enforcement?

Using oneOf with a fallback that evaluates '#daisy-chained-devices': false
allows any configuration missing this property to evaluate to true for
this branch.

For instance, if adi,spi-mode is set to one-channel-chain but the daisy
chain property is missing, the schema matches exactly this fallback
subschema. This causes the oneOf requirement to pass entirely, skipping the
intended validation.

--=20
Sashiko AI review =C2=B7 https://sashiko.dev/#/patchset/cover.1790719424.gi=
t.marcelo.schmitt@analog.com?part=3D8
