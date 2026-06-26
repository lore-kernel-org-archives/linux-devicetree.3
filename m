Received: from smtp.kernel.org (aws-us-west-2-korg-mail-alma10-1.taild15c8.ts.net [100.103.45.18])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 3A9E73E1233
	for <devicetree@vger.kernel.org>; Fri, 26 Jun 2026 07:43:17 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=100.103.45.18
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1782459799; cv=none; b=lwTQbS+hKP4Spnut+dNVkABC5IuZjN2AwGDTg1sP5Vz6NUxvX9C2OYzgkUfpiaazgpKK2ORw+J1kCzqmdQw3kajaWBdZKRRDbs9wpJt+RgQ2quvtcRm2Eq6pnrqObGKqycfg3ZKvnlaxJtqJuOitHd41rXAW/TRoBEQQAlJY89c=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1782459799; c=relaxed/simple;
	bh=tmreJTTSXAS3Iu1jqusxPe2nT8YWD6b4b4TCa7X0Pko=;
	h=From:Subject:To:Cc:In-Reply-To:References:Content-Type:Date:
	 Message-Id; b=imejeTi/OrFOEFUj+9VgYYitVg3FVqQ35eSIbL/hCZcLp8AiZxSB+ce+aHOfLAEt100f9hXG5702udNSRbwC/73ueLVVMhik+gWJJ3LYoUOHv76WJnZVgRYmCcAr97RhZqGAl1fQsfSHvGILU4L0vF3OLaRwIYFRCmct48cRduc=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=jwkNbc8f; arc=none smtp.client-ip=100.103.45.18
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="jwkNbc8f"
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 16CC91F000E9;
	Fri, 26 Jun 2026 07:43:17 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kernel.org;
	s=k20260515; t=1782459797;
	bh=BZikA+Kv7qRc0LnyRjcDrtyySovdKv5Gmd0EGa8Me5c=;
	h=From:Subject:Reply-To:To:Cc:In-Reply-To:References:Date;
	b=jwkNbc8f+VGPR71HTuf6BeKzn0kFAV3cPQo45HNra1BX2pBG1q+mUbI5mmd+TkMUf
	 45rRLiZKlZ2EQ66ZElDqdjcNYxITFXoIRqLmFvHiruX0wVlb4oL0qK0N+MZcxrysj4
	 mji3rXXYGQIUJ34fxxSKDaY21CeH3C+Akhl2QVbJf3oVULKvnph89jSF+VYlxNJx5f
	 w4j06HuQPtZfn8lFQ1tz+xxEx1/V0wl+rIr22xtRRG5VYD1bLSxKrpc01VY9ocADVr
	 onRhHlYShPMQBUWFRb6PdcekxA62T3DbrNlQEX41CrIJag8HqzdPO91sbUMCBxlLKa
	 SKuGMpg1N5ASA==
From: sashiko-bot@kernel.org
Subject: Re: [PATCH 2/4] dt-bindings: raspberrypi,bcm2835-firmware: Include
 'reboot-mode.yaml'
Reply-To: sashiko-reviews@lists.linux.dev
To: "Gregor Herburger" <gregor.herburger@linutronix.de>
Cc: conor+dt@kernel.org, devicetree@vger.kernel.org, robh@kernel.org
In-Reply-To: <20260626-rpi-tryboot-v1-2-490b1c4c4970@linutronix.de>
References: <20260626-rpi-tryboot-v1-0-490b1c4c4970@linutronix.de>
 <20260626-rpi-tryboot-v1-2-490b1c4c4970@linutronix.de>
Content-Type: text/plain; charset=utf-8
Content-Transfer-Encoding: quoted-printable
Date: Fri, 26 Jun 2026 07:43:16 +0000
Message-Id: <20260626074317.16CC91F000E9@smtp.kernel.org>
Precedence: bulk
X-Mailing-List: devicetree@vger.kernel.org
List-Id: <devicetree.vger.kernel.org>
List-Subscribe: <mailto:devicetree+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:devicetree+unsubscribe@vger.kernel.org>

Thank you for your contribution! Sashiko AI review found 1 potential issue(=
s) to consider:
- [Low] Missing Device Tree Schema Restriction for reboot mode pattern prop=
erties
--

commit d367af481cae3dea3dd1bb270d9e4466fb383031
Author: Gregor Herburger <gregor.herburger@linutronix.de>

dt-bindings: raspberrypi,bcm2835-firmware: Include 'reboot-mode.yaml'

This commit updates the Raspberry Pi firmware binding to reference the
reboot-mode schema. This allows reboot mode properties to be used to set
reboot modes like tryboot.

> diff --git a/Documentation/devicetree/bindings/arm/bcm/raspberrypi,bcm283=
5-firmware.yaml b/Documentation/devicetree/bindings/arm/bcm/raspberrypi,bcm=
2835-firmware.yaml
> index 983ea80eaec97..30b490e0d9fb3 100644
> --- a/Documentation/devicetree/bindings/arm/bcm/raspberrypi,bcm2835-firmw=
are.yaml
> +++ b/Documentation/devicetree/bindings/arm/bcm/raspberrypi,bcm2835-firmw=
are.yaml
> @@ -133,11 +133,14 @@ properties:
>      required:
>        - compatible
> =20
> +allOf:
> +  - $ref: /schemas/power/reset/reboot-mode.yaml#

[Severity: Low]
Should this schema restrict the reboot mode pattern properties to a single
item?

The generic reboot-mode.yaml schema defines ^mode-.*$ as a uint32-array
without a length restriction. Because this binding doesn't override it with
maxItems: 1, the device tree schema will accept arrays of arbitrary length,
for example:

mode-tryboot =3D <1 2>;

Since the reboot-mode.c driver only evaluates a single 32-bit value using
of_property_read_u32(), this could lead to silent truncation of multi-cell
properties without any validation errors. Does it make sense to add a
patternProperties block here to restrict maxItems to 1?

> +
>  required:
>    - compatible
>    - mboxes
> =20
> -additionalProperties: false
> +unevaluatedProperties: false
> =20
>  examples:
>    - |

--=20
Sashiko AI review =C2=B7 https://sashiko.dev/#/patchset/20260626-rpi-tryboo=
t-v1-0-490b1c4c4970@linutronix.de?part=3D2
