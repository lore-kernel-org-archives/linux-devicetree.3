Received: from smtp.kernel.org (aws-us-west-2-korg-mail-alma10-1.taild15c8.ts.net [100.103.45.18])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id A86B2282F15
	for <devicetree@vger.kernel.org>; Mon,  5 Oct 2026 22:19:14 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=100.103.45.18
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1791238755; cv=none; b=CuaiX9w7m6t5GTOpBNWTrRRjglwPnc/3tenr4/fyYP4OJ7GKc3+TEuS69XgIa1laVTWU4ZUrb78LEbaWfgJZkOp2dt5ElpF8MuMuoTnLuY2kelOAGtriOxGeMdWNaxv0dH4o3pzu4KHgfEGJsqI8seb8RAaMjIAbU28cpOS0LiI=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1791238755; c=relaxed/simple;
	bh=Br7v+sf+hMjTkOUEyeD54txLUD48L9exWiSgZs3iP80=;
	h=From:Subject:To:Cc:In-Reply-To:References:Content-Type:Date:
	 Message-Id; b=EFyf7cmmastFbHePVMrhK/YVgLcvWqbkOvKK0Pu2IxwxUasWTNuxRPn+lplsEzL6jGLW+Hdg8nGe31eTMczYlqmFNC9MmOrahtFjw9p33Yuj2kCsiiqpX2soYvdZZILBMCgPVJLJ0R5yiM5y3tXA5XWVWNYYjbTuAz8U8di/l3Y=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=aDaWt2JL; arc=none smtp.client-ip=100.103.45.18
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="aDaWt2JL"
Received: by smtp.kernel.org (Postfix) with ESMTPSA id D20A51F000FF;
	Mon,  5 Oct 2026 22:19:13 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kernel.org;
	s=k20260515; t=1791238754;
	bh=9V+Voe+BN23Z4CMadXnt0HkrJYx2YpQ/zBzSl6egvVk=;
	h=From:Subject:Reply-To:To:Cc:In-Reply-To:References:Date;
	b=aDaWt2JLvC65oueYRsauLAZDjpqB+SrGFEw3v2GgLnLKBGi4PQKytOCr91n6YU64G
	 6hjGGweXuMFAL5q6ab2A+tF0vJjBfv2Qo6yWT/nMybmN9viMNCSZ5kHLWxItVcai6x
	 hYJ1IAGsOIUN1Xu7gM0s1l2SBQhDCpWLhkpcDEkhq78qrdyjjeOJW/HzXhNT4F1vMt
	 4PZm8FsIZB3ER1uFUnBBZ0lkUvn6qEKRz0pjKD3f+5pPUWCzVUkh3RbmZTHGHrb4eN
	 PseshbFepC6g7gr+8bl0DPWBzBWDngu5bQmczOWHKyeL0KeDN0i4aqyVgEHKB2cDX3
	 qiKmAU4CHHcww==
From: sashiko-bot@kernel.org
Subject: Re: [PATCH v10 1/2] dt-bindings: phy: rockchip: naneng-combphy: add
 rockchip,sgmii-mac-sel property
Reply-To: sashiko-reviews@lists.linux.dev
To: "Coia Prant" <coiaprant@gmail.com>
Cc: devicetree@vger.kernel.org, vkoul@kernel.org, conor+dt@kernel.org, olteanv@gmail.com, linux-phy@lists.infradead.org, neil.armstrong@linaro.org, robh@kernel.org
In-Reply-To: <20261005221229.1095843-2-coiaprant@gmail.com>
References: <20261005221229.1095843-1-coiaprant@gmail.com>
 <20261005221229.1095843-2-coiaprant@gmail.com>
Content-Type: text/plain; charset=utf-8
Content-Transfer-Encoding: quoted-printable
Date: Mon, 05 Oct 2026 22:19:13 +0000
Message-Id: <20261005221913.D20A51F000FF@smtp.kernel.org>
Precedence: bulk
X-Mailing-List: devicetree@vger.kernel.org
List-Id: <devicetree.vger.kernel.org>
List-Subscribe: <mailto:devicetree+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:devicetree+unsubscribe@vger.kernel.org>

Thank you for your contribution! Sashiko AI review found 1 potential issue(=
s) to consider:
- [Medium] dt-bindings: schema validation fails for non-RK3568 variants due=
 to default injection
--

commit f30c2450528092b975c8899ad617f4fa20dab422
Author: Coia Prant <coiaprant@gmail.com>

dt-bindings: phy: rockchip: naneng-combphy: add rockchip,sgmii-mac-sel prop=
erty

On RK3568, the SGMII interface can be routed to either GMAC0 or
GMAC1 via the pipe_sgmii_mac_sel bit in the pipe GRF registers.
Add the optional "rockchip,sgmii-mac-sel" property to allow the
device tree to select which GMAC controller is used for SGMII.

> diff --git a/Documentation/devicetree/bindings/phy/phy-rockchip-naneng-co=
mbphy.yaml b/Documentation/devicetree/bindings/phy/phy-rockchip-naneng-comb=
phy.yaml
> index 379b08bd9e97a..8e898bce9af73 100644
> --- a/Documentation/devicetree/bindings/phy/phy-rockchip-naneng-combphy.y=
aml
> +++ b/Documentation/devicetree/bindings/phy/phy-rockchip-naneng-combphy.y=
aml
> @@ -80,6 +80,15 @@ properties:
>      description:
>        Some additional pipe settings are accessed through GRF regs.
> =20
> +  rockchip,sgmii-mac-sel:
> +    $ref: /schemas/types.yaml#/definitions/uint32
> +    enum: [0, 1]
> +    default: 1
> +    description:
> +      Select gmac0 or gmac1 to be used as SGMII controller.
> +      The hardware reset value is GMAC1 (1). Set this to 0 to route
> +      SGMII to GMAC0.
> +
>    "#phy-cells":
>      const: 1

[ ... ]

> @@ -105,6 +114,10 @@ allOf:
>            maxItems: 1
>          reset-names:
>            maxItems: 1
> +        rockchip,sgmii-mac-sel: true
> +    else:
> +      properties:
> +        rockchip,sgmii-mac-sel: false

[Severity: Medium]
Will this break dtbs_check for non-RK3568 platforms?

When the dtschema tooling processes a device node for a non-RK3568 compatib=
le
(like rockchip,rk3588-naneng-combphy), it injects the top-level default val=
ue
of 1 into the node data.

Then the allOf evaluation applies this else branch, which enforces
rockchip,sgmii-mac-sel: false (meaning the property must not exist).

The presence of the injected default value violates this constraint, causing
validation to fail.

--=20
Sashiko AI review =C2=B7 https://sashiko.dev/#/patchset/20261005221229.1095=
843-1-coiaprant@gmail.com?part=3D1
