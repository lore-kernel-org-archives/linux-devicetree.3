Received: from smtp.kernel.org (aws-us-west-2-korg-mail-alma10-1.taild15c8.ts.net [100.103.45.18])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id B3A693C1978
	for <devicetree@vger.kernel.org>; Mon, 20 Jul 2026 20:33:11 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=100.103.45.18
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1784579592; cv=none; b=gQxPMfc4k/8d5L+EyyOs8IcvTko9EY75ruoq2SuJyDemkrhIkOKODolviYmkjQl6q9yn+wnwXAFrM+2XC6WAhsp5jmXqG+6FUekAXnmkZvxzd0WoVqNT52+FjssVP0so2RPq1JD9zM2yrOedyH6S189W/DsMY3IF4eUuQk9a7ic=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1784579592; c=relaxed/simple;
	bh=ozel5HI5ePj2wglzc+mHI2odfZ8EbN7aVMl+0qFR6r0=;
	h=From:Subject:To:Cc:In-Reply-To:References:Content-Type:Date:
	 Message-Id; b=Yr1Ii0dV1nGTnG9Kp+AKxZTN/5Xa3fbe3yfDOcss5fklHPYYm4X9yh104ZT6kATj29uOF3Mw0ksMBuzLVUnPcD1D/Xb2bpvj/RSm4h6cZxYrnXuPs9Kql5lptYKgcC3x+LBB0oq8uFbVzNKMm3PsKG/rj5x+SfpEQZAE5PTHar0=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=RxDLMo+g; arc=none smtp.client-ip=100.103.45.18
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="RxDLMo+g"
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 145671F000E9;
	Mon, 20 Jul 2026 20:33:11 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kernel.org;
	s=k20260515; t=1784579591;
	bh=h3spzJZAMsTstqyxLc4PYRGtIyHZwy4+XperNFJK/gk=;
	h=From:Subject:Reply-To:To:Cc:In-Reply-To:References:Date;
	b=RxDLMo+g0zRFqOrk3s3wH/4JauMvjehh4QU7wlPJNsAlhOPqexXMTBK2JEqd0oNgj
	 sccH48GBfS6lQn8XlFmL3N6aSAs+1Mu58oYTv25o8irA07HtKW1NX9gSh92jevKLGk
	 g3jZJxZL1hdOxXDypQRL17ph5130lmXW5siVAbvBEgedN2gP/CcJ5EyG5cx6d6PvAB
	 Ek2c07XI/rUHFBQHa0iB7Lym6PDnlgVfmVSC1Xxs1vpYjGVkrbCOrhR+uS4FtmNfSg
	 EwdE0MajtmFQAgLuY6Cd1CLbFYwXMUc/gtngL/vajOwxRO+0oUlFPuc47wBPQmrLPi
	 CAneDxzdkL/Rg==
From: sashiko-bot@kernel.org
Subject: Re: [PATCH] dt-bindings: extcon: ti,extcon-palmas: Convert to DT
 schema
Reply-To: sashiko-reviews@lists.linux.dev
To: "Bhargav Joshi" <j.bhargav.u@gmail.com>
Cc: conor+dt@kernel.org, devicetree@vger.kernel.org, robh@kernel.org
In-Reply-To: <20260721-ti-extcon-palmas-v1-1-cd4071f0b9d9@gmail.com>
References: <20260721-ti-extcon-palmas-v1-1-cd4071f0b9d9@gmail.com>
Content-Type: text/plain; charset=utf-8
Content-Transfer-Encoding: quoted-printable
Date: Mon, 20 Jul 2026 20:33:10 +0000
Message-Id: <20260720203311.145671F000E9@smtp.kernel.org>
Precedence: bulk
X-Mailing-List: devicetree@vger.kernel.org
List-Id: <devicetree.vger.kernel.org>
List-Subscribe: <mailto:devicetree+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:devicetree+unsubscribe@vger.kernel.org>

Thank you for your contribution! Sashiko AI review found 1 potential issue(=
s) to consider:
- [Low] The device tree node name in the example uses an underscore (`palma=
s_usb`), which violates standard DT naming conventions. It should use a hyp=
hen (e.g., `palmas-usb` or a generic name like `usb-comparator`). This chan=
ge introduces a `dtc` warning (`node_name_chars_strict`) during `make dt_bi=
nding_check` that was not present in the original text binding.
--

--- Patch [1]: [PATCH] dt-bindings: extcon: ti,extcon-palmas: Convert to DT=
 schema ---
commit bda055e9092743c0cf88faae7d326b21581d09bb
Author: Bhargav Joshi <j.bhargav.u@gmail.com>

dt-bindings: extcon: ti,extcon-palmas: Convert to DT schema
   =20
This commit converts the Texas Instruments Palmas USB Comparator binding fr=
om
the legacy text format to a modern DT schema.

> diff --git a/Documentation/devicetree/bindings/extcon/ti,extcon-palmas.ya=
ml b/Documentation/devicetree/bindings/extcon/ti,extcon-palmas.yaml
> new file mode 100644
> index 0000000000000..0bcd8df79414a
> --- /dev/null
> +++ b/Documentation/devicetree/bindings/extcon/ti,extcon-palmas.yaml

[ ... ]

> +examples:
> +  - |
> +    #include <dt-bindings/gpio/gpio.h>
> +
> +    palmas_usb {

[Severity: Low]
Is the underscore in this node name intentional?=20

The original text binding used a hyphen (palmas-usb). Using an underscore
violates standard device tree naming conventions and will trigger a dtc=20
node_name_chars_strict warning during make dt_binding_check.

Would it be better to stick with the original palmas-usb or use a generic
node name like usb-comparator?

> +        compatible =3D "ti,palmas-usb-vid";
> +        ti,wakeup;
> +        ti,enable-id-detection;
> +        ti,enable-vbus-detection;
> +        id-gpios =3D <&palmas_gpio 0 GPIO_ACTIVE_HIGH>;
> +    };

--=20
Sashiko AI review =C2=B7 https://sashiko.dev/#/patchset/20260721-ti-extcon-=
palmas-v1-1-cd4071f0b9d9@gmail.com?part=3D1
