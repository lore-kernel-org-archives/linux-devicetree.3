Received: from smtp.kernel.org (aws-us-west-2-korg-mail-alma10-1.taild15c8.ts.net [100.103.45.18])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id AF5E33955D9
	for <devicetree@vger.kernel.org>; Thu, 25 Jun 2026 10:57:09 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=100.103.45.18
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1782385030; cv=none; b=A4FNqdGE5V5OIF2iVeinntvarpraHAF7B1sFY/VbkNyayzXUBrcL7MZ+eLLpPAsxAQe9+EB7ZysGjwYjpi0WEaZnDfsPgmZHKfWV2CQ5KqwHBCwQY9msI45vSL2dMtGaaJ4RbyyQojMImqKm3SWpnGs8V2boKfa178C5ufSqqN4=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1782385030; c=relaxed/simple;
	bh=GmPXOjMaYm/ihE6ccGODfpY6T3akMcy2BC8+odRq9Jw=;
	h=From:Subject:To:Cc:In-Reply-To:References:Content-Type:Date:
	 Message-Id; b=XqgT1AIrZ2+kDBYXNqly3P33Pi+x19CelFQekYcZLYr5oa1WCN5btFy/0ooiWVFRLcfBG5IhnDL8IJS+3dxQRYdTsQtaFgZ1vKaK+xz6Otqltj9Ncy320iRZiY04cjp/Q3ZoXQPikWzfUn3UbICo5wlw9zoF8ntXE1UaN6jY6OM=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=W8VRvhCA; arc=none smtp.client-ip=100.103.45.18
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="W8VRvhCA"
Received: by smtp.kernel.org (Postfix) with ESMTPSA id F2C181F00A3D;
	Thu, 25 Jun 2026 10:57:08 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kernel.org;
	s=k20260515; t=1782385029;
	bh=fV2ib659qezFrvaaL0rykM25EsJezf5x9GgDxkQTRgo=;
	h=From:Subject:Reply-To:To:Cc:In-Reply-To:References:Date;
	b=W8VRvhCAHM0niNlwGTsH+xNGALV37Dt/rZChItVrsROzB3LQ8yL/P1juXWKdcQ5TS
	 G9Ha+rTnumKwgIc/blXYA+q1wqB8G1PGLXALd4C8aS8ZRCzA1lZBMrRMAljz9JSyhK
	 SmZMc3mKiKXCSTLoyOoPH8vwHsW0kv5Nung0hSO4jC56zf1ABb/zMoS+55U0n/QJf+
	 pk4BRrzkR/JkZs6fWPoUqGeLPMCxaDLWmp264OJJy4nJ8MtRcHot536NB7Hx04mRgv
	 9gwfDKw1Z1ZSFXA8BFI0mQL3Rj+eCQjcv2ThjwXIwX4RgvzcOBojvcoq/vrzQa9V90
	 9M1v9pTEm9HMQ==
From: sashiko-bot@kernel.org
Subject: Re: [PATCH v3] dt-bindings: pwm: st,pwm: convert to DT schema
Reply-To: sashiko-reviews@lists.linux.dev
To: "Charan Pedumuru" <charan.pedumuru@gmail.com>
Cc: conor+dt@kernel.org, robh@kernel.org, devicetree@vger.kernel.org
In-Reply-To: <20260625-st-pwm-v3-1-ace9bff88529@gmail.com>
References: <20260625-st-pwm-v3-1-ace9bff88529@gmail.com>
Content-Type: text/plain; charset=utf-8
Content-Transfer-Encoding: quoted-printable
Date: Thu, 25 Jun 2026 10:57:08 +0000
Message-Id: <20260625105708.F2C181F00A3D@smtp.kernel.org>
Precedence: bulk
X-Mailing-List: devicetree@vger.kernel.org
List-Id: <devicetree.vger.kernel.org>
List-Subscribe: <mailto:devicetree+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:devicetree+unsubscribe@vger.kernel.org>

Thank you for your contribution! Sashiko AI review found 1 potential issue(=
s) to consider:
- [Low] The example device tree node uses an outdated compatible string ('s=
t,pwm') that violates the schema's own constraints ('st,sti-pwm'), causing =
dt_binding_check to fail.
--

commit d33b98ff54df0af652aa50944ad631d378f78938
Author: Charan Pedumuru <charan.pedumuru@gmail.com>

dt-bindings: pwm: st,pwm: convert to DT schema

This commit converts the STMicroelectronics STiH41x PWM/Capture controller
binding to DT schema. It changes the compatible string to "st,sti-pwm"
to match the hardware variant naming convention and removes pinctrl-names
from the required properties list.

> diff --git a/Documentation/devicetree/bindings/pwm/st,sti-pwm.yaml b/Docu=
mentation/devicetree/bindings/pwm/st,sti-pwm.yaml
> new file mode 100644
> index 0000000000000..c69073e79ce97
> --- /dev/null
> +++ b/Documentation/devicetree/bindings/pwm/st,sti-pwm.yaml

[ ... ]

> +examples:
> +  - |
> +    #include <dt-bindings/interrupt-controller/arm-gic.h>
> +    pwm@fe510000 {
> +        compatible =3D "st,pwm";

[Severity: Low]
Does this compatible string match the new schema?

The schema constraints above define the compatible property as "st,sti-pwm",
but the example node here still uses "st,pwm". Will this regression cause
the dt_binding_check validation to fail?

> +        reg =3D <0xfe510000 0x68>;
> +        interrupts =3D <GIC_SPI 128 IRQ_TYPE_LEVEL_HIGH>;
> +        #pwm-cells =3D <2>;

--=20
Sashiko AI review =C2=B7 https://sashiko.dev/#/patchset/20260625-st-pwm-v3-=
1-ace9bff88529@gmail.com?part=3D1
