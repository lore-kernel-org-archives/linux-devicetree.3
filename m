Received: from smtp.kernel.org (aws-us-west-2-korg-mail-alma10-1.taild15c8.ts.net [100.103.45.18])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 87EAD42640A
	for <devicetree@vger.kernel.org>; Thu,  6 Aug 2026 09:07:49 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=100.103.45.18
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1786007270; cv=none; b=EKh8wNN1WtuSwk84Hw69j95GVCErA+5RhZPYCwSBq64YH/zCEIKs3DfYemFKXPOHvqvHYYTyTCmGjy9kxEp0ZgwY3pjnR025gvSNtZjTZvoqsYHoPzGxVGIw8jzKMZku3KXYdZUZGXd7j5vSUt59C5m+FK+HIw+j0sCcqaAplnw=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1786007270; c=relaxed/simple;
	bh=mshtW7/iFjMN9DJzGGuZ+AAKxFYEa61G7GSkLxHJGts=;
	h=From:Subject:To:Cc:In-Reply-To:References:Content-Type:Date:
	 Message-Id; b=LvJzw8l3uaIG+AITYLLGopZP+4XmtZ5nBDEFeeV83+Yq9JqDmml05xm72BSbTeN/UO4BxE1eZS9x8fDfFysrULQqWpP99eL1DEd/xZV/8qf20408av7l02dVMTzNY9RPrSRi1INK39/R+1+/UmF/ogfIfUuo/J/9mpfo6TswgQM=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=WO6BtsD6; arc=none smtp.client-ip=100.103.45.18
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="WO6BtsD6"
Received: by smtp.kernel.org (Postfix) with ESMTPSA id DF4CF1F000E9;
	Thu,  6 Aug 2026 09:07:48 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kernel.org;
	s=k20260515; t=1786007269;
	bh=Wm6wPUk5pto388tN0ExFnMazyoupZGK63/aCg1B/5VU=;
	h=From:Subject:Reply-To:To:Cc:In-Reply-To:References:Date;
	b=WO6BtsD6B6hbUYL36hvogQupJBykwSo7aAMfp0fxL5LaALq2c2qslDsUt+B97NYDx
	 x6Phdgy8HbTpkGF+tKAZUZqmuI+nUEAsixtd2jMNqHROOe2LNuF+GlLi2LgHU08YwN
	 jAXvSd7UJdI4aqlZbVProW6gd8smU4EWitsq/Zu1SCKnIFpKjiChp1U/yOg/8XsbeQ
	 HZGkgLWnikzwIlskA2ZdoHMHBs2w+Xb5Dcrsj7UnCjKvLxMjlLB9ImcwbO9gQxg+A4
	 hemWc7Au0Ad04WiZ8AxFLGHITpOM1GIysz5IXsuTjUqKaeqZvdBm48CUc/28a5WjLo
	 WTN9H3yS5oOWg==
From: sashiko-bot@kernel.org
Subject: Re: [PATCH v6 08/17] dt-bindings: nvmem: microchip,sama7g5-otpc:
 add sama7d65 and dt node example
Reply-To: sashiko-reviews@lists.linux.dev
To: "Varshini Rajendran" <varshini.rajendran@microchip.com>
Cc: devicetree@vger.kernel.org, robh@kernel.org, conor+dt@kernel.org
In-Reply-To: <20260806074024.531259-9-varshini.rajendran@microchip.com>
References: <20260806074024.531259-1-varshini.rajendran@microchip.com>
 <20260806074024.531259-9-varshini.rajendran@microchip.com>
Content-Type: text/plain; charset=utf-8
Content-Transfer-Encoding: quoted-printable
Date: Thu, 06 Aug 2026 09:07:48 +0000
Message-Id: <20260806090748.DF4CF1F000E9@smtp.kernel.org>
Precedence: bulk
X-Mailing-List: devicetree@vger.kernel.org
List-Id: <devicetree.vger.kernel.org>
List-Subscribe: <mailto:devicetree+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:devicetree+unsubscribe@vger.kernel.org>

Thank you for your contribution! Sashiko AI review found 2 potential issue(=
s) to consider:
- [Medium] The device tree example for `sama7d65-otpc` incorrectly uses an =
ASCII string packet payload TAG ('ACST' / `0x41435354`) as an NVMEM cell `r=
eg` offset, which breaks the driver's read implementation and nvmem API con=
tract.
- [Medium] The calibration scale for `sama7d65_temp_calib` divides the base=
line temperature by 1000, which contradicts the millicelsius requirement of=
 the temperature sensor formula unless the hardware stores the value in mic=
rocelsius.
--

--- Patch [8]: [PATCH v6 08/17] dt-bindings: nvmem: microchip,sama7g5-otpc:=
 add sama7d65 and dt node example ---
commit e1cdb410e4aef6d0fe6053ee57168bb1e5b19ab3
Author: Varshini Rajendran <varshini.rajendran@microchip.com>

dt-bindings: nvmem: microchip,sama7g5-otpc: add sama7d65 and dt node example

This commit adds support for the sama7d65 compatible string to the
microchip,sama7g5-otpc nvmem binding. It also includes a new device tree no=
de
example demonstrating how a tag can be used to reference a packet stored in
the OTP memory.

> diff --git a/Documentation/devicetree/bindings/nvmem/microchip,sama7g5-ot=
pc.yaml b/Documentation/devicetree/bindings/nvmem/microchip,sama7g5-otpc.ya=
ml
> index cc25f2927682e..04b44660554ea 100644
> --- a/Documentation/devicetree/bindings/nvmem/microchip,sama7g5-otpc.yaml
> +++ b/Documentation/devicetree/bindings/nvmem/microchip,sama7g5-otpc.yaml

[ ... ]

> @@ -48,4 +54,20 @@ examples:
>          };
>      };
> =20
> +  - |
> +    efuse@e8c00000 {
> +        compatible =3D "microchip,sama7d65-otpc", "microchip,sama7g5-otp=
c", "syscon";
> +        reg =3D <0xe8c00000 0x100>;
> +
> +        nvmem-layout {
> +            compatible =3D "fixed-layout";
> +            #address-cells =3D <1>;
> +            #size-cells =3D <1>;
> +
> +            calib@41435354 {
> +                reg =3D <0x41435354 0x2c>;    /* Temp calib data packet =
TAG */

[Severity: Medium]
Will using this packet tag as the reg offset cause a read failure at runtim=
e?

Looking at mchp_otpc_read() in drivers/nvmem/microchip-otpc.c, the driver
expects the offset to be the sequential packet ID multiplied by 4:

	packet =3D mchp_otpc_id_to_packet(otpc, off / 4);
	if (!packet)
		return -EINVAL;

If the ASCII string 'ACST' (0x41435354) is provided as the physical memory
offset, won't this systematically fail during nvmem cell reads and return
-EINVAL?


[Severity: Medium]
Does the calibration scale for sama7d65_temp_calib in the ADC driver
incorrectly calculate the temperature?

In drivers/iio/adc/at91-sama5d2_adc.c, p1_scale is defined as:

	.p1_scale =3D { .numerator =3D 1, .denominator =3D 1000 },

When the scale ratio is applied in at91_adc_temp_sensor_init():

	clb->p1 *=3D layout->p1_scale.numerator;
	clb->p1 /=3D layout->p1_scale.denominator;

Dividing the baseline temperature by 1000 contradicts the millicelsius
requirement of the temperature sensor formula. Unless the hardware stores t=
he
value natively in microcelsius, won't this round down or erroneously convert
the value to Celsius, corrupting the baseline temperature?

--=20
Sashiko AI review =C2=B7 https://sashiko.dev/#/patchset/20260806074024.5312=
59-1-varshini.rajendran@microchip.com?part=3D8
