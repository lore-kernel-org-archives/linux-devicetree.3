Received: from smtp.kernel.org (aws-us-west-2-korg-mail-alma10-1.taild15c8.ts.net [100.103.45.18])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 91386470EB3
	for <devicetree@vger.kernel.org>; Wed, 12 Aug 2026 15:00:50 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=100.103.45.18
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1786546858; cv=none; b=P5GkgZrnwI81HJX8fxuPsq2zQtqyBIOMA4yuhBWTSK/UJHuu53gAKvszz8uvAfoIIo0x5t5EwVCT7v7kTv42Md8bIhPP6tKvD4550n6RZj4W2ZjmfXu0c48s4ibaAlkBYXyR+l7jDj/qfp0faUutMLXRJ+yT9HQyOwkdsmY1yVs=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1786546858; c=relaxed/simple;
	bh=4dvU9aCKieGUynVE2/N83lbNdNN8kpxnCiqELqa3+Hs=;
	h=From:Subject:To:Cc:In-Reply-To:References:Content-Type:Date:
	 Message-Id; b=n7uEJ4JjR3JCXHNL4i7ws6CE4csaaq4EeHpAQ83bM0/jNbDONY1w20KYLvIsy2OtLvzf/KBeLJPg85TA5vcNWdgNqq+FQPfdt8R+O9BipAf6qiqStp04NfJBsmxncN5w5SrymIFcd6qM1EM34Y7vx3DiCfA96KbrH29nS8p0Voo=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=J7VozKiC; arc=none smtp.client-ip=100.103.45.18
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="J7VozKiC"
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 6A0251F00A3D;
	Wed, 12 Aug 2026 15:00:43 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kernel.org;
	s=k20260515; t=1786546843;
	bh=Xy0YSXXbrYTMQbeExN0QOv5YmiGzJKvf6DfxyUBrCWY=;
	h=From:Subject:Reply-To:To:Cc:In-Reply-To:References:Date;
	b=J7VozKiCVwNUuibrEdXVzuAmdFCIsemRfb9VyPewh2Ab4PX6m1F86HPwUbO+miYVA
	 8t/zeynBDZZVGez1PCVxInhBcPCqKNX7XXNgfQUFI9ZPJZvUtYe8sJoe17aUjtBEv2
	 TrwxpA2VmbgPTwvXZdTCnfvQqeHVi+gvgoIPvJI5+yXrH/aTNoS7EsBJ/9Bm9eSUdU
	 I1U9d6LnuPEVdm5l5jJc4G3f6H17vGqjTG1Gy0itPQzJDDnnpf/tNsFZcin2rCjO3n
	 ujP3TW5IHBc+AhbcgnG8Y4AYUt7yBDt+UN4K2ILOgIM5BkUcRn8nnZRnhN5qcVwZxz
	 eEIyvMmnaRgbw==
From: sashiko-bot@kernel.org
Subject: Re: [PATCH v4 1/6] dt-bindings: iio: accel: mma8452: Add
 drive-open-drain
Reply-To: sashiko-reviews@lists.linux.dev
To: "Esben Haabendal" <esben@geanix.com>
Cc: devicetree@vger.kernel.org, conor+dt@kernel.org, robh@kernel.org
In-Reply-To: <20260812-mma8452-open-drain-v4-1-bfca15d02b59@geanix.com>
References: <20260812-mma8452-open-drain-v4-0-bfca15d02b59@geanix.com>
 <20260812-mma8452-open-drain-v4-1-bfca15d02b59@geanix.com>
Content-Type: text/plain; charset=utf-8
Content-Transfer-Encoding: quoted-printable
Date: Wed, 12 Aug 2026 15:00:42 +0000
Message-Id: <20260812150043.6A0251F00A3D@smtp.kernel.org>
Precedence: bulk
X-Mailing-List: devicetree@vger.kernel.org
List-Id: <devicetree.vger.kernel.org>
List-Subscribe: <mailto:devicetree+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:devicetree+unsubscribe@vger.kernel.org>

Thank you for your contribution! Sashiko AI review found 1 potential issue(=
s) to consider:
- [High] Incomplete Implementation: The `drive-open-drain` property is adde=
d to the Device Tree bindings, but the corresponding driver implementation =
to actually configure the hardware is entirely missing.
--

--- Patch [1]: [PATCH v4 1/6] dt-bindings: iio: accel: mma8452: Add drive-o=
pen-drain ---
commit 43db06f651ed5305e7ec90f57f0128f294c32c55
Author: Esben Haabendal <esben@geanix.com>

dt-bindings: iio: accel: mma8452: Add drive-open-drain

This commit adds a new drive-open-drain boolean property to the MMA8452
device tree binding. This allows configuring the interrupt pin to open drain
mode instead of the default push-pull mode.

> diff --git a/Documentation/devicetree/bindings/iio/accel/fsl,mma8452.yaml=
 b/Documentation/devicetree/bindings/iio/accel/fsl,mma8452.yaml
> index b0dd2b4e116ab..20701aa725d07 100644
> --- a/Documentation/devicetree/bindings/iio/accel/fsl,mma8452.yaml
> +++ b/Documentation/devicetree/bindings/iio/accel/fsl,mma8452.yaml
> @@ -39,6 +39,12 @@ properties:
>      minItems: 1
>      maxItems: 2
> =20
> +  drive-open-drain:
> +    $ref: /schemas/types.yaml#/definitions/flag
> +    description: the interrupt line will be configured as open drain, wh=
ich is
> +      useful if several sensors share the same interrupt line. (This bin=
ding is
> +      taken from pinctrl.)

[Severity: High]
Is the corresponding driver implementation to actually configure the hardwa=
re
missing?

If a system integrator relies on this new property and physically wires
multiple sensor interrupts together, the missing driver implementation means
the sensors will silently remain in push-pull mode.

Looking at mma8452_probe() in drivers/iio/accel/mma8452.c, there appears
to be no logic to read drive-open-drain via device_property_read_bool()
and configure the sensor's CTRL_REG3 register (0x2C) accordingly.

If two push-pull outputs on a shared line drive different logic levels
simultaneously, can this create a short circuit that physically damages the
board?

> +
>    vdd-supply: true
>    vddio-supply: true

--=20
Sashiko AI review =C2=B7 https://sashiko.dev/#/patchset/20260812-mma8452-op=
en-drain-v4-0-bfca15d02b59@geanix.com?part=3D1
