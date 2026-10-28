Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=100.103.45.18
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1793204276;
	b=fxD7pXfav+pqDnsLWFVqxJ7pUNZ6GcLq5hu/SzlfU+Od6Ubx0HmODI4XEUQbFOMjPXit
	 vCPeLnax+F+7umq+Pu1bKjMeTmVjSCbbRDcqXrHKm+Y5R/o+yvAT/Hs1d1dXOLdnTurgT
	 2MST9DTRSvXFgusvIs3XVUDoyYWUxns31lucKBq66EA2B8TRdD87NfuiQAqxpWSqofRZx
	 CQiTKYNbwa+X4RIstYVJiU1ci20gRSeW4Vf/xpPxqM6PeDuljMxD97+NlwcMPzJuSjSJ2
	 M17TaAUvpcJlOVnKF7vWqUkknpGCCMcCm+PS9dcj80vitDwS4V/KLcRh+Vi5+TFqQqw==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1793204276;
	h=Received:DKIM-Signature:Message-ID:From:Subject:Reply-To:To:Cc:
	 In-Reply-To:References:Content-Type:Content-Transfer-Encoding:Date;
	bh=2mGkvX8vQ36N89gfVD8zSD8X6Ou7+v1TIto3wuhSmHo=;
	b=oFk0xLzq/fAoGAp1te+Ia61u5ZUypcl9DF+Cg21hWY5XeAO4kbcprtcpzgft2lRgHDV8
	 SB1ZhFfOq/r/u2Jt+CUMCfy4hStZrxy6nGYPIbz3a7qCGGx+emb+uDh6ajbyhjNjBVkoN
	 JHjjTHpeuP8tQDeNX+ZZFr2VHBqOVfB2UNi8uEmnIyuXmPuGudjd7VZ2n17YhB9AJ+pmo
	 NWtikQCSUCSQed7gJBcOTA/yrbLt2PiGibTjHcBjxWzFME/8XYCKkTVvXav8CLGncaI2F
	 lth0/dq9UAfpYUxe7BmI7qOwU10AhiNib9A7MCWw69QbkBaVOtFNU4IiEc9fG7QUriQ==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dkim=pass header.d=kernel.org header.i=@kernel.org header.a=rsa-sha256 header.s=k20260515 header.b=oiLz1bnq;
	arc=none smtp.remote-ip=100.103.45.18
Received: from smtp.kernel.org (quasi.space.kernel.org [100.103.45.18])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id D9532606A31C
	for <devicetree@vger.kernel.org>; Wed, 28 Oct 2026 16:17:55 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key, unprotected) header.d=kernel.org header.i=@kernel.org header.a=rsa-sha256 header.s=k20260515 header.b=oiLz1bnq
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 42CE41F01825;
	Wed, 28 Oct 2026 16:17:55 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kernel.org;
	s=k20260515; t=1793204275;
	bh=2mGkvX8vQ36N89gfVD8zSD8X6Ou7+v1TIto3wuhSmHo=;
	h=From:Subject:Reply-To:To:Cc:In-Reply-To:References:Date;
	b=oiLz1bnqZ4IeN2Wg5E8RBqiEpzs+iO6LiTCjKax4QDvgT31ZDyRHB/IyWt6d6pZ6u
	 8FxXYBQJjjVlt5lgfbU7+H3BJuopoyovwa6yrAE5LeLcKXLNtnZEVNC2Mmc+weq12v
	 mp5Fnxpv6o1mdeeAYFbMJCQrHv5eT0B+g9yI/a+EiOS5nWOva6xbvLUkEgITQuLcF0
	 1EWw6Y0eLhsCpSOikrvWbdN71IlTeSbXPmZNC/QwytiboKRG4BtxRoFTz+D80WBsrI
	 mIM1wfhOl49yvTvPFX16IR+AfvHUzzr/ZGp+ewYPxPMW1ZpdTMOzYoKOljqGF439zO
	 13O2150ImBsuw==
Message-ID: <sashiko-outbox-188151@kernel.org>
From: sashiko-bot@kernel.org
Subject: Re: [PATCH 1/4] dt-bindings: interrupt-controller: add Mobileye
 EyeQ5 PCIe MSI controller
Reply-To: sashiko-reviews@lists.linux.dev
To: "Gregory CLEMENT" <gregory.clement@bootlin.com>
Cc: devicetree@vger.kernel.org, robh@kernel.org, conor+dt@kernel.org
In-Reply-To: <20261028-eyeq5_msi-v1-1-c464752fb55f@bootlin.com>
References: <20261028-eyeq5_msi-v1-0-c464752fb55f@bootlin.com>
 <20261028-eyeq5_msi-v1-1-c464752fb55f@bootlin.com>
Content-Type: text/plain; charset=utf-8
Content-Transfer-Encoding: quoted-printable
Date: Wed, 28 Oct 2026 16:17:54 +0000
X-Mailing-List: devicetree@vger.kernel.org
List-Id: <devicetree.vger.kernel.org>
List-Post: <mailto:devicetree@vger.kernel.org>
List-Help: <mailto:devicetree+help@vger.kernel.org>
List-Subscribe: <mailto:devicetree+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:devicetree+unsubscribe@vger.kernel.org>
List-Owner: <mailto:devicetree+owner@vger.kernel.org>
Precedence: list

Thank you for your contribution! Sashiko AI review found 1 potential issue(=
s) to consider:
- [Low] dt-bindings: interrupt-controller: invalid gic node in eyeq5-msi ex=
ample
--

commit 07c2faf713f271c288290325080b191a291097be
Author: Gregory CLEMENT <gregory.clement@bootlin.com>

dt-bindings: interrupt-controller: add Mobileye EyeQ5 PCIe MSI controller

This commit adds the Device Tree binding schema for the Mobileye EyeQ5 PCIe
MSI controller.

> diff --git a/Documentation/devicetree/bindings/interrupt-controller/mobil=
eye,eyeq5-msi.yaml b/Documentation/devicetree/bindings/interrupt-controller=
/mobileye,eyeq5-msi.yaml
> new file mode 100644
> index 0000000000000..919af55fc8a60
> --- /dev/null
> +++ b/Documentation/devicetree/bindings/interrupt-controller/mobileye,eye=
q5-msi.yaml
> @@ -0,0 +1,120 @@

[ ... ]

> +examples:
> +  - |
> +    #include <dt-bindings/interrupt-controller/mips-gic.h>
> +    #include <dt-bindings/interrupt-controller/irq.h>
> +
> +    / {
> +        #address-cells =3D <2>;
> +        #size-cells =3D <2>;
> +
> +        gic: interrupt-controller {
> +            compatible =3D "mti,cpu-interrupt-controller";
> +            interrupt-controller;
> +            #interrupt-cells =3D <3>;
> +        };

[Severity: Low]
Does this gic node in examples cause dt_binding_check to fail against
Documentation/devicetree/bindings/interrupt-controller/mti,cpu-interrupt-co=
ntroller.yaml?

In mti,cpu-interrupt-controller.yaml, nodes matching mti,cpu-interrupt-cont=
roller
are required to have #address-cells set to 0 and #interrupt-cells set to 1:

  properties:
    compatible:
      const: mti,cpu-interrupt-controller

    '#interrupt-cells':
      const: 1

    '#address-cells':
      const: 0

    interrupt-controller: true

  additionalProperties: false

  required:
    - compatible
    - '#interrupt-cells'
    - '#address-cells'
    - interrupt-controller

Since msi0 uses a 3-cell MIPS GIC interrupt specifier
(<GIC_SHARED 7 IRQ_TYPE_LEVEL_HIGH>), should the dummy gic provider node and
root wrapper be dropped from the example, or updated to match mti,gic.yaml?

--=20
Sashiko AI review =C2=B7 https://sashiko.dev/#/patchset/20261028-eyeq5_msi-=
v1-0-c464752fb55f@bootlin.com?part=3D1
