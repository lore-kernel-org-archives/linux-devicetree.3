Received: from smtp.kernel.org (aws-us-west-2-korg-mail-alma10-1.taild15c8.ts.net [100.103.45.18])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id D7E7837A834
	for <devicetree@vger.kernel.org>; Mon,  3 Aug 2026 10:15:07 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=100.103.45.18
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1785752109; cv=none; b=nqWIpHN49y46mQTE6RjhXFHuiMpCWS0yTMK2NXIMNClZnVT4AD+uzkgyAFX++iVGJwf93gzcYZpg92z5yVCQt+77T4A1GOp311FQZ7qzgDEkB7dlAM82HdxzpML+qlaz5Gv+7n3Y69RbNqeZlc4+h9I8Ix95Cd3tRGUy7eosTPQ=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1785752109; c=relaxed/simple;
	bh=/pyRAVNDIEq6vFgrZwcf41UgVrWHKw6l3jPIHkEHXO4=;
	h=From:Subject:To:Cc:In-Reply-To:References:Content-Type:Date:
	 Message-Id; b=RKY1ZC1WVOlUxUF2wboon2UnyfhUsvlvR3hB0/k6yiPbkUEM1bKlcUcxHPpPEdsuJnLc8bONl4SXyM5aoCgzQou5CLVrTXqUI+xV85ljj5ktZNA3HTntUMfKZ6b8qRhQiLck8zYAnGJMZ0OrYgRHFQiQbJXLoDCEuQgDewoOYCA=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=UczTt49R; arc=none smtp.client-ip=100.103.45.18
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="UczTt49R"
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 4A5A31F00A3A;
	Mon,  3 Aug 2026 10:15:07 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kernel.org;
	s=k20260515; t=1785752107;
	bh=RQ14st03S1Fk0hQ9k0f1AiHMPZt8uFh2XkQJ2oakYsQ=;
	h=From:Subject:Reply-To:To:Cc:In-Reply-To:References:Date;
	b=UczTt49R1qa0XYWW2GvDPRX56uqZtCba2hi4oc6xUtfmxwg8oKy04s6LiNiOk6RPe
	 mKeSxAvPIu/T40tXojBxUeGccXu1ze/XcnhMd8b5W77ncUZvi+1IVHsR0MF7WxMauS
	 gRpAKlIRLDeY74ETpyI8ChOK2yrLOryM4V9yMtaZKKkmE6WEcmk6Fs7BdPbe4jBIxL
	 pfKYJrULmnBgHCi9M5cl96K58V593UBJNBzLJITzDpmKR0YTiB/XZW9k/uqofr7CYw
	 SgprvsewgAqhiv0BLRQrt/b2lTTl+aXNE+gPr3je+FKQlpgQQ1HDqz4krGkivvi5px
	 TDWA2DPMTRqZw==
From: sashiko-bot@kernel.org
Subject: Re: [PATCH 1/2] dt-bindings: arm: bcm2835: Add Raspberry Pi 5 d0
 Stepping
Reply-To: sashiko-reviews@lists.linux.dev
To: "Gregor Herburger" <gregor.herburger@linutronix.de>
Cc: robh@kernel.org, conor+dt@kernel.org, devicetree@vger.kernel.org
In-Reply-To: <20260803-bcm2712-d-stepping-compatible-v1-1-401934357a44@linutronix.de>
References: <20260803-bcm2712-d-stepping-compatible-v1-0-401934357a44@linutronix.de>
 <20260803-bcm2712-d-stepping-compatible-v1-1-401934357a44@linutronix.de>
Content-Type: text/plain; charset=utf-8
Content-Transfer-Encoding: quoted-printable
Date: Mon, 03 Aug 2026 10:15:06 +0000
Message-Id: <20260803101507.4A5A31F00A3A@smtp.kernel.org>
Precedence: bulk
X-Mailing-List: devicetree@vger.kernel.org
List-Id: <devicetree.vger.kernel.org>
List-Subscribe: <mailto:devicetree+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:devicetree+unsubscribe@vger.kernel.org>

Thank you for your contribution! Sashiko AI review found 1 potential issue(=
s) to consider:
- [Medium] The `items` constraint for 'BCM2712 based Boards' was incorrectl=
y changed from a positional tuple list to a single `oneOf` object, breaking=
 sequence and length validation. Additionally, the fallback constraint was =
misplaced.
--

--- Patch [1]: [PATCH 1/2] dt-bindings: arm: bcm2835: Add Raspberry Pi 5 d0=
 Stepping ---
commit bd4958062ba25329e2f64d01ee33b181fa435216
Author: Gregor Herburger <gregor.herburger@linutronix.de>

dt-bindings: arm: bcm2835: Add Raspberry Pi 5 d0 Stepping

This commit updates the bcm2835 schema to add support for the Raspberry Pi 5
d0 stepping.

> diff --git a/Documentation/devicetree/bindings/arm/bcm/bcm2835.yaml b/Doc=
umentation/devicetree/bindings/arm/bcm/bcm2835.yaml
> index 2729a542c4f35..43729a887f846 100644
> --- a/Documentation/devicetree/bindings/arm/bcm/bcm2835.yaml
> +++ b/Documentation/devicetree/bindings/arm/bcm/bcm2835.yaml
> @@ -25,8 +25,15 @@ properties:
> =20
>        - description: BCM2712 based Boards
>          items:
> -          - enum:
> -              - raspberrypi,5-model-b
> +          oneOf:
> +            - enum:
> +                - raspberrypi,5-model-b
> +            - const: brcm,bcm2712

[Severity: Medium]
Does this change unintentionally break the strict tuple sequence validation=
 for
the base BCM2712 boards?

By changing the items constraint from a positional tuple list to a single
oneOf object, the schema now applies this oneOf validation independently to
each element in the array. This allows device trees with incorrectly ordered
compatible strings, or those completely missing the fallback string, to
silently pass validation.

> +
> +      - description: BCM2712 based Boards d0 stepping
> +        items:
> +          - const: raspberrypi,5-model-b-d0
> +          - const: raspberrypi,5-model-b
>            - const: brcm,bcm2712

[Severity: Medium]
Is this the original fallback item from the BCM2712 block above?

It appears the original items list was split, causing the fallback
brcm,bcm2712 constant to be absorbed as the third element of the new d0
stepping items block, leaving the original BCM2712 based Boards block witho=
ut
its fallback item.

> =20
>        - description: BCM2835 based Boards

--=20
Sashiko AI review =C2=B7 https://sashiko.dev/#/patchset/20260803-bcm2712-d-=
stepping-compatible-v1-0-401934357a44@linutronix.de?part=3D1
