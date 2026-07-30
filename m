Received: from smtp.kernel.org (aws-us-west-2-korg-mail-alma10-1.taild15c8.ts.net [100.103.45.18])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id E945320010A
	for <devicetree@vger.kernel.org>; Thu, 30 Jul 2026 05:04:57 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=100.103.45.18
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1785387898; cv=none; b=RfZ8ElBq+nw9WQJFMj1cpHQGZaNr8/kC4IG3W/a7+yby/Ihi+8aEwLzff115OQIe2a1+QJl4ZnAe/1plDqXuZdVdH7QKLc4+d3SS5GYCpUNGyE36CcE42fN7j/BP8pEtcXFuri4z6QnOdt502vUowZt7smaoDKwCnzlmrHS/5N4=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1785387898; c=relaxed/simple;
	bh=x3wEUPJUZIgWIQn+snJAsjDIs7rJEK53E1zEICPkhgs=;
	h=From:Subject:To:Cc:In-Reply-To:References:Content-Type:Date:
	 Message-Id; b=J/GS5B8gSywjF95PFZ1DOlkRs8FHJRnWVsA8yuV4taVrfA9dTe8W80HQiVfh6JjJIibQVnTJa/zXvlYWDXLpq3brbdC3CixcvMqfiAstUnalYUn1Eca+z0zLbLtNLcdmulDESQGbdjXZ/ya87tc7g5e6u4OnL2YE02RaKOZq5Gs=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=SzsSN/ll; arc=none smtp.client-ip=100.103.45.18
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="SzsSN/ll"
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 3CC471F000E9;
	Thu, 30 Jul 2026 05:04:57 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kernel.org;
	s=k20260515; t=1785387897;
	bh=sd/12zOcIVzM7gXLkhk6ICHzD5XnXUqeU9cytUbKCfU=;
	h=From:Subject:Reply-To:To:Cc:In-Reply-To:References:Date;
	b=SzsSN/ll0Q/srsdeuY9Ochsip+x7QbRJzXNOcbaRq5qa6bgRw/N9tyJSMIRTQQuUE
	 zOKhy2kiTg3Y7RCSrEYL7wqCczAXzjsgvVM32nMFjDAOtnxgFlACPJNXxH9VCxSQ7O
	 vMnXoSQ72h1m0KIsytp2jQxFKlgLrQfhpoKPHM7UysbO7Ct0L1lt4oqcIjN57oN7Zt
	 1PgBpRsdlfH8Vu2Or1E8PwqZOjRhcPX8gqJp5jmroZ0zxyppz3/sghtEbcxu1Q0PYM
	 Rh79P3h4d6fXk+C7djDRVCOnQr+r7ysWBN/zAwujWc6EgYf/rgrvWYrL3PhvzMPm/V
	 /wNkOI3jlKQBw==
From: sashiko-bot@kernel.org
Subject: Re: [PATCH v3 1/2] dt-bindings: arm: rockchip: Add Vicharak Vaaman
 board
Reply-To: sashiko-reviews@lists.linux.dev
To: "Hrushiraj Gandhi" <hrushirajg23@gmail.com>
Cc: robh@kernel.org, conor+dt@kernel.org, devicetree@vger.kernel.org
In-Reply-To: <20260730045947.388660-2-hrushirajg23@gmail.com>
References: <20260730045947.388660-1-hrushirajg23@gmail.com>
 <20260730045947.388660-2-hrushirajg23@gmail.com>
Content-Type: text/plain; charset=utf-8
Content-Transfer-Encoding: quoted-printable
Date: Thu, 30 Jul 2026 05:04:56 +0000
Message-Id: <20260730050457.3CC471F000E9@smtp.kernel.org>
Precedence: bulk
X-Mailing-List: devicetree@vger.kernel.org
List-Id: <devicetree.vger.kernel.org>
List-Subscribe: <mailto:devicetree+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:devicetree+unsubscribe@vger.kernel.org>

Thank you for your contribution! Sashiko AI review found 1 potential issue(=
s) to consider:
- [Low] The commit introduces a new compatible string 'vicharak,vaaman' but=
 fails to document the 'vicharak' vendor prefix in vendor-prefixes.yaml, vi=
olating device tree binding requirements.
--

--- Patch [1]: [PATCH v3 1/2] dt-bindings: arm: rockchip: Add Vicharak Vaam=
an board ---
commit 002a19e13723e85ef3d5de1114afcf5868a4c28e
Author: Hrushiraj Gandhi <hrushirajg23@gmail.com>

dt-bindings: arm: rockchip: Add Vicharak Vaaman board

This commit documents the compatible string for the Vicharak Vaaman, an
RK3399-based single-board computer.

> diff --git a/Documentation/devicetree/bindings/arm/rockchip.yaml b/Docume=
ntation/devicetree/bindings/arm/rockchip.yaml
> index 1a9dde18626d0..7cfd3687768cf 100644
> --- a/Documentation/devicetree/bindings/arm/rockchip.yaml
> +++ b/Documentation/devicetree/bindings/arm/rockchip.yaml
> @@ -1306,6 +1306,11 @@ properties:
>            - const: turing,rk1
>            - const: rockchip,rk3588
> =20
> +      - description: Vicharak Vaaman
> +        items:
> +          - const: vicharak,vaaman

[Severity: Low]
Does this new compatible string require an update to vendor-prefixes.yaml?

Since the "vicharak" vendor prefix is newly introduced here, running
dt_binding_check will likely report a schema validation warning because
"vicharak" is not documented in
Documentation/devicetree/bindings/vendor-prefixes.yaml.=20

Should it be added there as well to ensure schema validation passes?

> +          - const: rockchip,rk3399
> +
>        - description: WolfVision PF5 mainboard
>          items:

--=20
Sashiko AI review =C2=B7 https://sashiko.dev/#/patchset/20260730045947.3886=
60-1-hrushirajg23@gmail.com?part=3D1
