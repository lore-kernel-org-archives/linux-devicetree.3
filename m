Received: from smtp.kernel.org (aws-us-west-2-korg-mail-alma10-1.taild15c8.ts.net [100.103.45.18])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id EF6131A267
	for <devicetree@vger.kernel.org>; Sat, 20 Jun 2026 04:52:26 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=100.103.45.18
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1781931147; cv=none; b=AruGHPHT2rOODOYhbqhEXD3O2mX+KhK7mWSfAIYMhrU8zBi1z980d3kDnD6uY2n9ZFfowP19lgmU9+80J/4Hdh4H/SGLXx1Fe3ZhHiidxaGUHCPF+EA2wyivgfA7t5LuYRemwZ9JvxH0i6so7Y8Cuj9oPUec9VjLSE0tIu2caz8=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1781931147; c=relaxed/simple;
	bh=xF6Z++0+4I2nN1x/41pEwGnyY8ar81XhTIQDlM/8Jro=;
	h=From:Subject:To:Cc:In-Reply-To:References:Content-Type:Date:
	 Message-Id; b=ROxUdxvFZM95rszSWoHWS860G3anZhRlxgGGSfd9ZUTBfj9moVi6bn5paHPu8c/PME/rHLu8SGiWM0m9mfG8YsU6UcDJ5b1N6GpdY9GarG4sIJXyVi7iTk/JnifFs47vs2HJQb7G4GcYIlx0kfIsqnD4aMqkg1R/7j8tDdXsrHo=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=Ag1ssYML; arc=none smtp.client-ip=100.103.45.18
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="Ag1ssYML"
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 57DC61F000E9;
	Sat, 20 Jun 2026 04:52:26 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kernel.org;
	s=k20260515; t=1781931146;
	bh=XylbR0Quot1s2aFrRfjy/uIdqRt7qKwdxKhXp+XS2vc=;
	h=From:Subject:Reply-To:To:Cc:In-Reply-To:References:Date;
	b=Ag1ssYMLx/qHUZE2LdOAJKtzMDnRxtaKk3DgM1QRu/4EAOynFei8WQfI0FnCAPkAh
	 oA4mwpFVcMZXc8yZJfbgOgvqIZ05nL9XzOc3NfNIT5wTvDAV+GR+0TrjLantDGyxDi
	 RayUumhVsukhNfv834vBPTasYutTv4tlgx+uV/tSCkrusWcreb6MJT7tMDu+kZQAdu
	 lkFi5/a9N7HLFzZ3YVEbpYr1ykwJ2AzNJs/ez22afWKAHS9d1Y/wGEsgvkMW+8/2jm
	 up303DsaBsBk8HwWe6IaO+8mCOTlMbL9p3CQL8obHFtRkgCglX8KLJ1WFHbTfQdMyd
	 s6REeWQHkwLog==
From: sashiko-bot@kernel.org
Subject: Re: [RFC PATCH 1/3] dt-bindings: iio: temperature: Add STS30
 devicetree bindings
Reply-To: sashiko-reviews@lists.linux.dev
To: "Maxwell Doose" <m32285159@gmail.com>
Cc: devicetree@vger.kernel.org, robh@kernel.org, conor+dt@kernel.org
In-Reply-To: <20260620044010.1082621-2-m32285159@gmail.com>
References: <20260620044010.1082621-1-m32285159@gmail.com>
 <20260620044010.1082621-2-m32285159@gmail.com>
Content-Type: text/plain; charset=utf-8
Content-Transfer-Encoding: quoted-printable
Date: Sat, 20 Jun 2026 04:52:25 +0000
Message-Id: <20260620045226.57DC61F000E9@smtp.kernel.org>
Precedence: bulk
X-Mailing-List: devicetree@vger.kernel.org
List-Id: <devicetree.vger.kernel.org>
List-Subscribe: <mailto:devicetree+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:devicetree+unsubscribe@vger.kernel.org>

Thank you for your contribution! Sashiko AI review found 1 potential issue(=
s) to consider:
- [Medium] The STS30 device tree binding omits the `interrupts` property, p=
reventing users from modeling the hardware's ALERT pin.
--

commit 91523cd6a186b322c33e0fb78f1316cdc24a39af
Author: Maxwell Doose <m32285159@gmail.com>

dt-bindings: iio: temperature: Add STS30 devicetree bindings

This commit adds device tree bindings for the Sensirion STS30 family of=20
digital temperature sensors, which includes the STS30, STS31, and STS35.

> diff --git a/Documentation/devicetree/bindings/iio/temperature/sensirion,=
sts30.yaml b/Documentation/devicetree/bindings/iio/temperature/sensirion,st=
s30.yaml
> new file mode 100644
> index 0000000000000..dc0c6b7832fb8
> --- /dev/null
> +++ b/Documentation/devicetree/bindings/iio/temperature/sensirion,sts30.y=
aml

[ ... ]

> +properties:
> +  compatible:
> +    enum:
> +      - sensirion,sts30
> +      - sensirion,sts31
> +      - sensirion,sts35
> +
> +  reg:
> +    maxItems: 1
> +
> +  vdd-supply: true
> +
> +required:
> +  - compatible
> +  - reg
> +
> +additionalProperties: false

[Severity: Medium]
Does this schema prevent modeling the hardware's ALERT pin?

The Sensirion STS3x family hardware features an ALERT pin that can be wired
to an interrupt controller to signal high and low temperature thresholds.
Because this schema enforces additionalProperties: false but omits the
interrupts property from the properties block, any device tree that
accurately models the physical hardware connection will fail
dt_binding_check.

Should the interrupts property be explicitly listed to allow accurately
describing the hardware capabilities, even if the current IIO driver does
not yet utilize the ALERT pin?

> +
> +examples:

[ ... ]

--=20
Sashiko AI review =C2=B7 https://sashiko.dev/#/patchset/20260620044010.1082=
621-1-m32285159@gmail.com?part=3D1
