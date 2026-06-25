Received: from smtp.kernel.org (aws-us-west-2-korg-mail-alma10-1.taild15c8.ts.net [100.103.45.18])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 2066626B08F
	for <devicetree@vger.kernel.org>; Thu, 25 Jun 2026 16:15:30 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=100.103.45.18
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1782404132; cv=none; b=g0uHXZXeeqCAzeLFu6ynCfZ6Pmsgyy6LhKJza45fbq9N5bx7A4lGrNVW2cJ0R3sJ0/rhMP9M2fg3PwIVm/uw24YZa0iP1p+tdwAwPzL2Z9gmI78y4XzuYN5PVrNMCWadXbgcjs5+3C5KB0QiA/m5Y0dllIUbna4IxWac8ilgfm8=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1782404132; c=relaxed/simple;
	bh=vqoEd1fTaNgD0KwNREBnbjttCsnEaKqkM+Ha3/zGLK8=;
	h=From:Subject:To:Cc:In-Reply-To:References:Content-Type:Date:
	 Message-Id; b=bMQfmBvf1R8eSr64blVfnbBconKIExeRgQJImIoqMWD5s7h4wI0gvsC+Yj4Henm6xMZmtQXbaFoUMiLpj32Eta5JqJ46BXrna6nyHjftOHgmMj6VVHxw10mU7h7q54sDJMnWFMTG2XeVD/BLdt19x/aozZ2gNX/o9JPCj/zRPhg=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=WYiRdr6j; arc=none smtp.client-ip=100.103.45.18
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="WYiRdr6j"
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 515111F000E9;
	Thu, 25 Jun 2026 16:15:30 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kernel.org;
	s=k20260515; t=1782404130;
	bh=wOOBZwz5eCgEyI3oLta2s3f0UFVviIGBUEjqErdTsbc=;
	h=From:Subject:Reply-To:To:Cc:In-Reply-To:References:Date;
	b=WYiRdr6jp5SOARDSak0OTpwFjU2xzyaJoXEHxE84d8C/dXiHijkS9mG5KhToty3xp
	 SkDJvBkRdpmc/FcrPzM8JxvH1B1bjbdtZkQ/nsg0V5CCCuOr5/D9OlwSOoI/5JTXVh
	 e97EFrkEZaLHsYGUs1qkcbdth+fDCwbE2qE2kybhWaW57qaRols59GIzgY2dAd0xuv
	 4FKtnZIQCVrnlFOdcR5MdIyET6qKGgi76fCPO1y8HwWw62PHhBN7bbEEWGRKTp6lre
	 7nrUI9FRMH4FqCxgpsVtlhJNbhMK/ZUZxFwNzPReiQbbypha8V4JyJqkTjiMinXLaA
	 V0IL2luizHVGw==
From: sashiko-bot@kernel.org
Subject: Re: [PATCH 1/2] dt-bindings: arm: ti: Add bindings for PHYTEC AM67x
 based hardware
Reply-To: sashiko-reviews@lists.linux.dev
To: "Nathan Morrisson" <nmorrisson@phytec.com>
Cc: conor+dt@kernel.org, robh@kernel.org, devicetree@vger.kernel.org
In-Reply-To: <20260625160214.4001298-1-nmorrisson@phytec.com>
References: <20260625160214.4001298-1-nmorrisson@phytec.com>
Content-Type: text/plain; charset=utf-8
Content-Transfer-Encoding: quoted-printable
Date: Thu, 25 Jun 2026 16:15:29 +0000
Message-Id: <20260625161530.515111F000E9@smtp.kernel.org>
Precedence: bulk
X-Mailing-List: devicetree@vger.kernel.org
List-Id: <devicetree.vger.kernel.org>
List-Subscribe: <mailto:devicetree+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:devicetree+unsubscribe@vger.kernel.org>

Thank you for your contribution! Sashiko AI review found 1 potential issue(=
s) to consider:
- [Low] The patch introduces a tab character for indentation in a YAML file=
, which is forbidden by the YAML specification and breaks schema validation.
--

commit 969d143e093fd0e0c150cfa118a1a7839d600df9
Author: Nathan Morrisson <nmorrisson@phytec.com>

dt-bindings: arm: ti: Add bindings for PHYTEC AM67x based hardware

This commit adds device tree bindings for the AM67x based phyCORE-AM67x SoM
and phyBOARD-Rigel.

> diff --git a/Documentation/devicetree/bindings/arm/ti/k3.yaml b/Documenta=
tion/devicetree/bindings/arm/ti/k3.yaml
> index 2a6a9441c23de..9abe252fc7080 100644
> --- a/Documentation/devicetree/bindings/arm/ti/k3.yaml
> +++ b/Documentation/devicetree/bindings/arm/ti/k3.yaml
> @@ -215,6 +215,13 @@ properties:
>                - ti,j722s-evm
>            - const: ti,j722s
> =20
> +      - description: K3 AM67 SoC PHYTEC phyBOARD-Rigel
> +        items:
> +          - enum:
> +	      - phytec,am6754-phyboard-rigel

[Severity: Low]
Does this line use a tab character for indentation? YAML syntax strictly
forbids the use of tabs for indentation, which will cause dt_binding_check
to fail with a parsing syntax error.

> +          - const: phytec,am67-phycore-som
> +          - const: ti,j722s
> +

--=20
Sashiko AI review =C2=B7 https://sashiko.dev/#/patchset/20260625160214.4001=
298-1-nmorrisson@phytec.com?part=3D1
