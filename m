Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id A6AACCA4E
	for <devicetree@vger.kernel.org>; Sat,  9 May 2026 21:12:42 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=10.30.226.201
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1778361162; cv=none; b=TruW+JwypbCosd7ktkL/2YEkgTvKDwNqF1pQ+B+E4sWpEGYhxY+fNNl7dZc0XEfrXQ7AYIzSBzkrv/Yl3PM7ZKT0pHtNBSihp6Ebu1b9geRUabza7mA/ScVyTGTVGZ85xe9IBfN3p8PCqPuOfkscEmS1mCG6XC1TbC7JBfxqhBs=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1778361162; c=relaxed/simple;
	bh=PnWfTNYzvd7ZGvmZAxFmxEpY4LOK2wx6t/koD3P9sX8=;
	h=From:Subject:To:Cc:In-Reply-To:References:Content-Type:Date:
	 Message-Id; b=D861y4AfxNcKjOwGjfNo1tQ0f822kWcYbAC0M+OXfFXrlGdhfFZ45Lr3skHvsFlNcfxizLOOObZ54NI3v9cvOgvQjrlRa7C5UkZusy/C+DkUo1hc3zbedhahVJRObFqzRvThea6HTFz3znC281kBgjk+6GYEAtPSw4lsLv0/eXw=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=YFx5oCfn; arc=none smtp.client-ip=10.30.226.201
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="YFx5oCfn"
Received: by smtp.kernel.org (Postfix) with ESMTPSA id E9D02C2BCB2;
	Sat,  9 May 2026 21:12:41 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1778361162;
	bh=PnWfTNYzvd7ZGvmZAxFmxEpY4LOK2wx6t/koD3P9sX8=;
	h=From:Subject:Reply-To:To:Cc:In-Reply-To:References:Date:From;
	b=YFx5oCfnAqGf2lgpF7AwR5uow/ZqbQSMdu/Xw9lxGtYgAxHvOrrRrC8LSeF6us4Uh
	 G4Ej6tQfBylFEGQQQ5WL78L9E2hWp2nd8u7gkQm7SC2cV6Lol3xTq8mG1+WvijZH0B
	 et5cJczZ6wivpTZZEiXSOPw35k2aKSQwMNxw7zyTBT9wTTo+nYHya1aaGPo6R7UXuo
	 k6jK8xvKEmR70Pmexp6i/66JSp4pGQoSKqIpYcPZW4vZGXL9j68x1PCX61ZeUOky8k
	 FVEdH+w2gm2sRhav0MzKv0nwes8Zt36SKh64+o0DeYZxvISnBSkHbkYYcFWqJbqC4t
	 1bP6gcrPsrQpA==
From: sashiko-bot@kernel.org
Subject: Re: [PATCH v2 5/8] dt-bindings: display: allwinner: Add DE33 planes
Reply-To: sashiko@lists.linux.dev
To: "Jernej Skrabec" <jernej.skrabec@gmail.com>
Cc: devicetree@vger.kernel.org, conor+dt@kernel.org, krzk+dt@kernel.org, robh@kernel.org
In-Reply-To: <20260509190015.79086-6-jernej.skrabec@siol.net>
References: <20260509190015.79086-6-jernej.skrabec@siol.net>
Content-Type: text/plain; charset=utf-8
Content-Transfer-Encoding: quoted-printable
Date: Sat, 09 May 2026 21:12:41 +0000
Message-Id: <20260509211241.E9D02C2BCB2@smtp.kernel.org>
Precedence: bulk
X-Mailing-List: devicetree@vger.kernel.org
List-Id: <devicetree.vger.kernel.org>
List-Subscribe: <mailto:devicetree+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:devicetree+unsubscribe@vger.kernel.org>

Thank you for your contribution! Sashiko AI review found 1 potential issue(=
s) to consider:
- [High] The binding specifies an independent memory-mapped region (`reg`) =
but completely omits required hardware dependencies like `clocks` and `rese=
ts`.
--

commit c4cb2c3df2e7559ecf6e92deffc259a4516494c5
Author: Jernej Skrabec <jernej.skrabec@gmail.com>

dt-bindings: display: allwinner: Add DE33 planes

This commit adds a new device tree binding for the Allwinner Display Engine
3.3 planes. These planes act as shared resources between mixers and are
assigned using registers within the display clocks MMIO space.

> diff --git a/Documentation/devicetree/bindings/display/allwinner,sun50i-h=
616-de33-planes.yaml b/Documentation/devicetree/bindings/display/allwinner,=
sun50i-h616-de33-planes.yaml
> new file mode 100644
> index 0000000000000..0a07cb8a5f798
> --- /dev/null
> +++ b/Documentation/devicetree/bindings/display/allwinner,sun50i-h616-de3=
3-planes.yaml
[ ... ]
> +properties:
> +  compatible:
> +    enum:
> +      - allwinner,sun50i-h616-de33-planes
> +
> +  reg:
> +    maxItems: 1
> +
> +  allwinner,plane-mapping:
> +    $ref: /schemas/types.yaml#/definitions/phandle
> +    description:
> +      Phandle of the device responsible for assigning (mapping) planes
> +      between mixers.
> +
> +required:
> +  - compatible
> +  - reg
> +  - allwinner,plane-mapping

Does this binding also need to specify clocks and resets as required
properties?

Since this node represents an independent MMIO hardware block, omitting its
hardware dependencies relies on the sibling mixer driver to implicitly power
the bus.

If the sun8i-mixer driver is unbound or fails to probe, the shared display
bus clock is left disabled. Would a subsequent read of the planes regmap
exposed to userspace via debugfs perform an MMIO read on an unclocked bus
and result in a fatal external abort (SError)?

Should clocks and resets be added to the binding so the planes driver can
manage its own bus access safely (for example, by using
regmap_mmio_attach_clk())?

--=20
Sashiko AI review =C2=B7 https://sashiko.dev/#/patchset/20260509190015.7908=
6-1-jernej.skrabec@siol.net?part=3D5
