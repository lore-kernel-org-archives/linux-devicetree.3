Received: from smtp.kernel.org (aws-us-west-2-korg-mail-alma10-1.taild15c8.ts.net [100.103.45.18])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id AC1E53264C7
	for <devicetree@vger.kernel.org>; Fri, 17 Jul 2026 11:38:43 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=100.103.45.18
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1784288324; cv=none; b=OaW6sqrM3QcpZKk+kgplFOfZIxocs7snKCPhc4ffjIU77d/eOGD0M6gYnWNHj58rnHk+sqY1buUQav9/QOdzbyi77VB0rwaV+bZ4puuiwA6i0zZpYKZijH5XHD9lxgpX3FluBATGex753yCsCPupXaaK7FBDXPEstWc4jRk6j1w=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1784288324; c=relaxed/simple;
	bh=b2ptLegdjgLTw2mCpbk+J/wHkKueQwDVlvq9JpiGvx0=;
	h=From:Subject:To:Cc:In-Reply-To:References:Content-Type:Date:
	 Message-Id; b=bfPjAQvUG0sGtEn9Vyw5dWZLWFBANiBUrj01BdumYGRNXY6kmrGL/eWMWtTcCglK90WMnXFrLFcKtXsZZugSYI7GzfC4jtaXmVKWQryZPYpBDLuV9NXDRrYzlByXZIi/rqF96ubKTo2HHy8WcBMHCaBP5nyFRFBTwQmhEo7X2bc=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=IYLryoE2; arc=none smtp.client-ip=100.103.45.18
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="IYLryoE2"
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 20D271F000E9;
	Fri, 17 Jul 2026 11:38:43 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kernel.org;
	s=k20260515; t=1784288323;
	bh=RoViZDo48y/mJlTTjKvpRzm6gH4+FjtUR0S1MdKn9p8=;
	h=From:Subject:Reply-To:To:Cc:In-Reply-To:References:Date;
	b=IYLryoE2U1WKexr397b8Lkcc4s+X8whlil8mxMkfKCloWOkjACpxL5k1V6m48C3r7
	 3G5CHnaHgLd2xID7kb5Tyb6Ber9UyYNEIXpLnKR68awVsdqeQpM/bZGgiwuC9iFgsn
	 mB5NedGOCcKRH5DSd3Ey3NX1R+a2mdv8HbYbYxWo3W9n0kkuv3uEjO0ZZcIpuH1s3O
	 E9hTbQ0xkFE2ZhONewaJbIEBzU7D+rsgzD//0NXpohdpc6BP4yuTsK2FPYNhjncw0A
	 8/CHzALb1BMRabsd1n/6Oyac0D6+SX6PuwXFP0n+Gh7a9Yy0XDFeVgL1ws6tXZk0dP
	 QrA1li92mZ9nw==
From: sashiko-bot@kernel.org
Subject: Re: [PATCH net-next v2 1/2] dt-bindings: net: add DAPU Telecom
 DAP8211R(I) PHY binding
Reply-To: sashiko-reviews@lists.linux.dev
To: "Artem Shimko" <a.shimko.dev@gmail.com>
Cc: robh@kernel.org, devicetree@vger.kernel.org, conor+dt@kernel.org
In-Reply-To: <20260716113805.593215-2-a.shimko.dev@gmail.com>
References: <20260716113805.593215-1-a.shimko.dev@gmail.com>
 <20260716113805.593215-2-a.shimko.dev@gmail.com>
Content-Type: text/plain; charset=utf-8
Content-Transfer-Encoding: quoted-printable
Date: Fri, 17 Jul 2026 11:38:42 +0000
Message-Id: <20260717113843.20D271F000E9@smtp.kernel.org>
Precedence: bulk
X-Mailing-List: devicetree@vger.kernel.org
List-Id: <devicetree.vger.kernel.org>
List-Subscribe: <mailto:devicetree+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:devicetree+unsubscribe@vger.kernel.org>

Thank you for your contribution! Sashiko AI review found 1 potential issue(=
s) to consider:
- [Low] The 'dapu' vendor prefix used in 'dapu,tx-inverted-clk' is not docu=
mented in vendor-prefixes.yaml.
--

--- Patch [1]: [PATCH net-next v2 1/2] dt-bindings: net: add DAPU Telecom D=
AP8211R(I) PHY binding ---
commit 05e0cd0742ef4792c4b9865b36c3662e45293902
Author: Artem Shimko <a.shimko.dev@gmail.com>

dt-bindings: net: add DAPU Telecom DAP8211R(I) PHY binding

This commit adds device tree binding documentation for the DAPU Telecom
DAP8211R(I) Gigabit Ethernet PHY, including properties for configuring
TX and RX clock delays and a vendor-specific flag for clock inversion.

> diff --git a/Documentation/devicetree/bindings/net/dapu,dap8211r.yaml b/D=
ocumentation/devicetree/bindings/net/dapu,dap8211r.yaml
> new file mode 100644
> --- /dev/null
> +++ b/Documentation/devicetree/bindings/net/dapu,dap8211r.yaml
[ ... ]
> +  tx-internal-delay-ps:
> +    description:
> +      RGMII TX clock delay in picoseconds (0 to maximum).
> +    multipleOf: 150
> +    maximum: 2250
> +    default: 1950
> +
> +  dapu,tx-inverted-clk:

[Severity: Low]
Is the dapu vendor prefix documented in vendor-prefixes.yaml?

The dt-schema tool strictly validates all vendor prefixes against the
registry. Because it appears to be missing from
Documentation/devicetree/bindings/vendor-prefixes.yaml, running
make dt_binding_check will result in a schema validation error for an
undocumented vendor prefix.

> +    $ref: /schemas/types.yaml#/definitions/flag
> +    description:
> +      If present, the RGMII TX clock to the MAC is inverted (180 degree
[ ... ]

--=20
Sashiko AI review =C2=B7 https://sashiko.dev/#/patchset/20260716113805.5932=
15-1-a.shimko.dev@gmail.com?part=3D1
