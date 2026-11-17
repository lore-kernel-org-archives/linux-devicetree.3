Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=100.103.45.18
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1794904928;
	b=Z+lRifQ3ZRmpSeiTJlxZ43Fty7x8CPpvMMljFFg10RxanJxAVA3Fn/6hNpAoowJ9MfpW
	 oBUIuVgmRZtYrT1rb1l61EGBdTmh40kq6y9ixE7sOl3ERDCnPKWkvYQgz3L/5xTNECG0R
	 wvuKsgneAOqBjpgbk/aasuOe610OACuWcVWUFJwrt1CkmEj/5Mjb8lSrDzfPEZdG8hdRy
	 2nL6RsquQzH5dIkubedoa8oc3CELMMqeNnvwLv7nJCb7wpU5RFx65SKr/Hk2f9KJOAamg
	 NOE6et+yAzBquCGkFye70PpGNWdR/Ht3MHeRTrEyeEj1JsCI5OmlgGVFYHu04W9QOqw==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1794904928;
	h=Received:DKIM-Signature:Message-ID:From:Subject:Reply-To:To:Cc:
	 In-Reply-To:References:Content-Type:Content-Transfer-Encoding:Date;
	bh=wvPqB2lsQFIdn40kdCMg7/FyAHdcjwvZkcJj5gHjf/w=;
	b=ZGhFtrC6DweUlIr0J+rF8wBrfkgD6/y5XAonEfh/4sdz6eDdKqg0e9aXpKPvzf9sRSdl
	 6MSjEPYNljNsmULPR9aZ1N4IlVlg7dyddzXL7xMMbMFiJD0+kJ52Nnxba8SbTYXsR/oQn
	 KGrTH6bagKLVXpKS5AqTHgcxiFSqm9poDCVmD7RyMV6r9se1JacvMn3QE0kduUAXzr+5R
	 17qEQ6g54a2p2+dYavtbpHx3Gzis4y3OIEVyioSXYdMbriDnNHkBt7eFg7XjI6RaMheX+
	 Mt6zt9F+eAQ9mxygj+r2TYRozyFqkGh3t4phkHoL00IBCCmLFlIX+LScv1qwloFCLZw==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dkim=pass header.d=kernel.org header.i=@kernel.org header.a=rsa-sha256 header.s=k20260515 header.b=LPtszB5g;
	arc=none smtp.remote-ip=100.103.45.18
Received: from smtp.kernel.org (quasi.space.kernel.org [100.103.45.18])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 2059C606A885
	for <devicetree@vger.kernel.org>; Tue, 17 Nov 2026 08:42:07 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.a=rsa-sha256 header.s=k20260515 header.b=LPtszB5g
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 694411F000C4;
	Tue, 17 Nov 2026 08:42:07 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kernel.org;
	s=k20260515; t=1794904927;
	bh=wvPqB2lsQFIdn40kdCMg7/FyAHdcjwvZkcJj5gHjf/w=;
	h=From:Subject:Reply-To:To:Cc:In-Reply-To:References:Date;
	b=LPtszB5gj5gY3XKD2mwjrIACXSKQUJqHvuYbDbPe3navSFC7jwKf0h5fK+ayYT8Au
	 dVvuUo8LIVrCfWGsswhkCtuzOe9uu6wyjSnOoQUju7J1XSKYtuxO4XG4U0k3J837+U
	 mfdPLvgVDWK+dAeGGeOQDfklDnYzHOd0NMqQzMXCcOMFVubQB9o5ADQLrxgbSIwX5X
	 lR67oFDzUVfr4Or0Bk//87CAJYwnHkwEEA0sqfxFCxSw29jYCnBFEJxnQFbYBYyPG6
	 oYjvE9ViStOFX0Wzi726zTEwtM0zokFey2KF6vSgfgC5SSuFHq4b0HJej84JZzzxr0
	 dTuoc4hlw6HvQ==
Message-ID: <sashiko-outbox-218423@kernel.org>
From: sashiko-bot@kernel.org
Subject: Re: [PATCH v5 2/3] dt-bindings: iio: adc: Add Nuvoton MA35D1 EADC
Reply-To: sashiko-reviews@lists.linux.dev
To: "Chi-Wen Weng" <cwweng.linux@gmail.com>
Cc: devicetree@vger.kernel.org, robh@kernel.org, conor+dt@kernel.org
In-Reply-To: <20261117082832.1551574-3-cwweng.linux@gmail.com>
References: <20261117082832.1551574-1-cwweng.linux@gmail.com>
 <20261117082832.1551574-3-cwweng.linux@gmail.com>
Content-Type: text/plain; charset=utf-8
Content-Transfer-Encoding: quoted-printable
Date: Tue, 17 Nov 2026 08:42:06 +0000
X-Mailing-List: devicetree@vger.kernel.org
List-Id: <devicetree.vger.kernel.org>
List-Post: <mailto:devicetree@vger.kernel.org>
List-Help: <mailto:devicetree+help@vger.kernel.org>
List-Subscribe: <mailto:devicetree+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:devicetree+unsubscribe@vger.kernel.org>
List-Owner: <mailto:devicetree+owner@vger.kernel.org>
Precedence: list

Thank you for your contribution! Sashiko AI review found 1 potential
issue to consider:
- [Medium] dt-bindings: iio: adc: ma35d1-eadc: missing io-channel
  specifier for VBAT
--

commit 9ca0b0a7e74294912e1ef88df7980f863b72d4d7
Author: Chi-Wen Weng <cwweng@nuvoton.com>

dt-bindings: iio: adc: Add Nuvoton MA35D1 EADC

This commit adds the Device Tree binding schema for the Nuvoton MA35D1
Enhanced Analog-to-Digital Converter (EADC).

> diff --git a/Documentation/devicetree/bindings/iio/adc/nuvoton,ma35d1-ead=
c.yaml b/Documentation/devicetree/bindings/iio/adc/nuvoton,ma35d1-eadc.yaml
> new file mode 100644
> index 0000000000000..1bf64913d67db
> --- /dev/null
> +++ b/Documentation/devicetree/bindings/iio/adc/nuvoton,ma35d1-eadc.yaml
[ ... ]
> +  The external inputs can be used as eight single-ended channels or as
> +  four fixed differential pairs: 0-4, 1-5, 2-6 and 3-7. The VBAT input
> +  needs no devicetree description.
[ ... ]
> +  '#io-channel-cells':
> +    const: 1
> +    description:
> +      The cell selects the logical external EADC channel identified by t=
he reg
> +      value of the corresponding channel child node. Only channels repre=
sented
> +      by child nodes are valid I/O channel specifiers.

[Severity: Medium]
As reported by Jonathan Cameron on v3 [1], how can a devicetree IIO
consumer reference the internal VBAT channel if VBAT has no child node and
#io-channel-cells only allows specifiers matching channel@[0-7] child
nodes?

The anyOf constraint also requires at least one channel@[0-7] child node,
preventing a board from using the EADC purely for VBAT monitoring without
defining an external channel node, and adding a VBAT specifier later would
require changing the #io-channel-cells binding contract.

[1] https://lore.kernel.org/r/20261101001934.23588aa2@jic23-hlaptop

--=20
Sashiko AI review =C2=B7 https://sashiko.dev/#/patchset/20261117082832.1551=
574-1-cwweng.linux@gmail.com?part=3D2
