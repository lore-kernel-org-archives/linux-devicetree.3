Received: from smtp.kernel.org (aws-us-west-2-korg-mail-alma10-1.taild15c8.ts.net [100.103.45.18])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 39705190462
	for <devicetree@vger.kernel.org>; Sat, 30 May 2026 03:06:12 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=100.103.45.18
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1780110373; cv=none; b=esZAkCts1EHPxfOCWKILvzWz1POpBKZlXxqPkarzFBZOL87Ec3zgsZ5PQoBlJsXk2DEQ99S7jc5i5K5hr8OTIvl7qJoawqTI/KYiu7xLvjOqszpCsbczTr3foBtE02S0qJfcaUvP1NU0rq/sasPxaC2LFAG2pJ3ojLCVoOT+uUE=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1780110373; c=relaxed/simple;
	bh=SYGBdqjYzj3QSdlAQhnOwThsfubv1i6GiMAQW/G1G1w=;
	h=From:Subject:To:Cc:In-Reply-To:References:Content-Type:Date:
	 Message-Id; b=M7HE3hdU1oCg0sJ5yNf7e4CTPY6N4x9/XiEyM6DRRFLJa/ZUqBTDfGvONHoJT0CdNmKfyRIQ9DfphVBeO17HoMqcMV342BZAE3ur750/L2NDy/A55tQj6m6UZVc1md/HZk85HQLMufI5IJZz0aUzX2b0A0MRZI6FsXgWvifxI+0=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=OCD6oduu; arc=none smtp.client-ip=100.103.45.18
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="OCD6oduu"
Received: by smtp.kernel.org (Postfix) with ESMTPSA id D2B191F00893;
	Sat, 30 May 2026 03:06:11 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kernel.org;
	s=k20260515; t=1780110372;
	bh=dpR6cydLP30ZXLgbOOVsuXHCZSSkFZMvdqYR79nmJ4Y=;
	h=From:Subject:Reply-To:To:Cc:In-Reply-To:References:Date;
	b=OCD6oduuSZ6Wsy7+o6AKx1ghPP3IRMqS+KbUCivQtjVp0yUKo6xjYUCcGx9WvQ8Az
	 p7kpQ5SLNW/GwgBJAgMOtxvyeaUJUvapXRC9svJnR16k2JirMEoDU0jxua3KsgryR/
	 C/PZJxEUYB30M3briEC5FYYKexr9I3IZtJskgn677d/Je4oQXarFz6hvEM1ZUUY4ys
	 Z/3tw2XzbcLkqm/XcwKwGiA4tLm4t9DzBVMilmNpO7Fju54CbFe3dKtuwR4EuSGxn8
	 AhXH4AHCt5Sz2zyC/XPlBRioYdEp8N6YE9vPGTgXf8dBGkXm/HYOPN7vQmQ+36khf0
	 9kcZJ9fl+SBGg==
From: sashiko-bot@kernel.org
Subject: Re: [PATCH v2] dt-bindings: usb: convert PXA USB bindings to YAML
Reply-To: sashiko-reviews@lists.linux.dev
To: "Jeremiah Bishop" <jbishop.dev@gmail.com>
Cc: devicetree@vger.kernel.org, conor+dt@kernel.org, robh@kernel.org
In-Reply-To: <20260530022955.32728-1-jbishop.dev@gmail.com>
References: <20260530022955.32728-1-jbishop.dev@gmail.com>
Content-Type: text/plain; charset=utf-8
Content-Transfer-Encoding: quoted-printable
Date: Sat, 30 May 2026 03:06:11 +0000
Message-Id: <20260530030611.D2B191F00893@smtp.kernel.org>
Precedence: bulk
X-Mailing-List: devicetree@vger.kernel.org
List-Id: <devicetree.vger.kernel.org>
List-Subscribe: <mailto:devicetree+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:devicetree+unsubscribe@vger.kernel.org>

Thank you for your contribution! Sashiko AI review found 2 potential issue(=
s) to consider:
- [Medium] YAML conversion incorrectly renames properties `marvell,power-se=
nse-low` to `marvell,port-sense-low` and `marvell,power_on_delay` to `marve=
ll,power-on-delay`, breaking validation and backward compatibility.
- [Medium] The `clocks` property is newly enforced as strictly required for=
 `marvell,pxa-ohci`, which breaks schema validation for existing device tre=
es.
--

commit 64a29827cc603985850c4a4a36ae40793189e8ff
Author: Jeremiah Bishop <jbishop.dev@gmail.com>
   =20
dt-bindings: usb: convert PXA USB bindings to YAML
   =20
Convert the legacy pxa-usb.txt binding documentation to YAML schemas. The
original text binding documented two distinct devices, which are now split
into marvell,pxa-ohci.yaml and marvell,pxa270-udc.yaml.
   =20
> diff --git a/Documentation/devicetree/bindings/usb/marvell,pxa-ohci.yaml =
b/Documentation/devicetree/bindings/usb/marvell,pxa-ohci.yaml
> new file mode 100644
> --- /dev/null
> +++ b/Documentation/devicetree/bindings/usb/marvell,pxa-ohci.yaml
[ ... ]
> +  marvell,enable-port3:
> +    type: boolean
> +    description: Enable USB port 3 if present.
> +
> +  marvell,port-sense-low:
> +    type: boolean
> +    description: Port sense pin in low-active.

[Severity: Medium]
The original text binding defined this property as "marvell,power-sense-low=
".
Will renaming "power" to "port" here cause validation failures for existing
device trees that use the legacy property name?

> +
> +  marvell,power-control-low:
> +    type: boolean
> +    description: Power control pin is low-active.
> +
> +  marvell,no-oc-protection:
> +    type: boolean
> +    description: Disable over-current protection.
> +
> +  marvell,oc-mode-perport:
> +    type: boolean
> +    description: Enable per-port over-current protection.
> +
> +  marvell,power-on-delay:
> +    $ref: /schemas/types.yaml#/definitions/uint32
> +    description: Power On to Power Good time in milliseconds.

[Severity: Medium]
The legacy binding documented this as "marvell,power_on_delay" with an
underscore. Could changing the underscore to a hyphen break ABI compatibili=
ty
with older device trees and drivers expecting the original format?

[ ... ]
> +required:
> +  - compatible
> +  - reg
> +  - interrupts
> +  - clocks

[Severity: Medium]
Is it intentional to enforce "clocks" as a strictly required property here?=
=20

The original pxa-usb.txt binding didn't list "clocks" as required for the=20
OHCI controller, and the original example omitted it. Since the schema uses
unevaluatedProperties: false, will enforcing this new requirement cause=20
existing valid device trees to fail schema validation?

--=20
Sashiko AI review =C2=B7 https://sashiko.dev/#/patchset/20260530022955.3272=
8-1-jbishop.dev@gmail.com?part=3D1
