Received: from smtp.kernel.org (aws-us-west-2-korg-mail-alma10-1.taild15c8.ts.net [100.103.45.18])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 28183356754
	for <devicetree@vger.kernel.org>; Sun, 13 Sep 2026 13:03:57 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=100.103.45.18
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1789304639; cv=none; b=KPnoUhn1MG0r24boeS7acqtmWuiOwu+BrOIEfavUy4JW0+Z5jQb2zbOtrmtU7LjprhuUlIN12oyXpluOX8lNAGdEwraeQ6xF1/L++Hvo9+vEmMlT/Lz/9JpAUngMHqy8/sfkgMNmM4yHfl0OLo00UlsJI6XkTLVhhc+bnqW1saI=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1789304639; c=relaxed/simple;
	bh=CcFzbvlS6qiMTusKulc81kyxmkRKpD+kU8bP1rZgdhE=;
	h=From:Subject:To:Cc:In-Reply-To:References:Content-Type:Date:
	 Message-Id; b=Zpa+suH/91RZ2vOWOwZMiT14a6Ag1DxhCfcnplxFj0Lf1FXbN5ZX4gRyh6JUkqgBx+STW6hg21nugHi9hT0aUVhTx6jGNqWfEcTZkWATThktT4fiqx1miGLrTfo///H5J5X8vxAJeR3vshR6ytVETk6JUNtA0X4nvVk5k/9jpAQ=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=cZaMUPKK; arc=none smtp.client-ip=100.103.45.18
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="cZaMUPKK"
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 689C71F000FF;
	Sun, 13 Sep 2026 13:03:57 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kernel.org;
	s=k20260515; t=1789304637;
	bh=e5byQ+X4+Ed4tgVtcPOxITcdTQjlV7H7D9n1PmB/N5Q=;
	h=From:Subject:Reply-To:To:Cc:In-Reply-To:References:Date;
	b=cZaMUPKKlLfLBjc0+gQWrHC/3Ogz1rwCVSiR43jE1fgX26r3AG+Gm4AZ63ztyHU6Z
	 Y3s214/+dBJzFf3aCV60T59tZAp39NS79DMLNg+w/AOI/eMXkO1cPib9uP7b9yx1hK
	 t7Nl4QSuuHHD+v/41jQSc9K4xbecIYYLAhddRR2dRMfNptAHfNufjsWGy5sYfXLdx3
	 VRH7aXn8YkBav1AGUHfhpCKXvUJCWuEbW+HEMDgUwv68m2aUypmeAHxt55OAzM29Tr
	 ktfIRpz+w3Ynt9G8q/gBuQOcuQCccV7DO70mBvesKAP1iPHk+7TJRYK+5jaoD3kVYG
	 +0iS3p8n6iqMg==
From: sashiko-bot@kernel.org
Subject: Re: [PATCH 3/4] dt-bindings: arm: airoha: Allow one thermal sensor
 cell for AN7583
Reply-To: sashiko-reviews@lists.linux.dev
To: "Vitaliy Sochnev" <sochnev.v.74@gmail.com>
Cc: robh@kernel.org, devicetree@vger.kernel.org, conor+dt@kernel.org
In-Reply-To: <20260913145226.34643-4-sochnev.v.74@gmail.com>
References: <20260913145226.34643-1-sochnev.v.74@gmail.com>
 <20260913145226.34643-4-sochnev.v.74@gmail.com>
Content-Type: text/plain; charset=utf-8
Content-Transfer-Encoding: quoted-printable
Date: Sun, 13 Sep 2026 13:03:56 +0000
Message-Id: <20260913130357.689C71F000FF@smtp.kernel.org>
Precedence: bulk
X-Mailing-List: devicetree@vger.kernel.org
List-Id: <devicetree.vger.kernel.org>
List-Subscribe: <mailto:devicetree+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:devicetree+unsubscribe@vger.kernel.org>

Thank you for your contribution! Sashiko AI review found 1 potential issue(=
s) to consider:
- [Medium] The `#thermal-sensor-cells` property uses an `enum` constraint i=
nstead of a `const` constraint.
--

commit a2ea4a9a05333c50b5a23468b0906bdb46e74f5f
Author: Vitaliy Sochnev <sochnev.v.74@gmail.com>

dt-bindings: arm: airoha: Allow one thermal sensor cell for AN7583

This commit modifies the AN7583 chip SCU device tree binding to allow
the #thermal-sensor-cells property to accept either 0 or 1. It updates
the validation constraints to use an enum instead of a strict constant.

> diff --git a/Documentation/devicetree/bindings/arm/airoha,en7581-chip-scu=
.yaml b/Documentation/devicetree/bindings/arm/airoha,en7581-chip-scu.yaml
> index cc564dc7b414d..da159b7572f37 100644
> --- a/Documentation/devicetree/bindings/arm/airoha,en7581-chip-scu.yaml
> +++ b/Documentation/devicetree/bindings/arm/airoha,en7581-chip-scu.yaml
> @@ -26,7 +26,10 @@ properties:
>      maxItems: 1
> =20
>    '#thermal-sensor-cells':
> -    const: 0
> +    description:
> +      0 refers to the bandgap sensor. 1 selects the sensor with one cell,
> +      0 bandgap, 1 GbE, 2 CPU.
> +    enum: [0, 1]

[Severity: Medium]
Does using an enum for this cell-count property violate the subsystem
architectural rules?

The Device Tree binding subsystem guidelines explicitly mandate that
every cell-count property must have a strict const constraint matching
the hardware.

Using an enum here allows variable cell counts for the same compatible
string, which causes schema validation to accept ambiguous hardware
configurations rather than enforcing a single hardware-matching constant
size.

--=20
Sashiko AI review =C2=B7 https://sashiko.dev/#/patchset/20260913145226.3464=
3-1-sochnev.v.74@gmail.com?part=3D3
