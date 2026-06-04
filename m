Received: from smtp.kernel.org (aws-us-west-2-korg-mail-alma10-1.taild15c8.ts.net [100.103.45.18])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id E06C738DD3
	for <devicetree@vger.kernel.org>; Thu,  4 Jun 2026 06:16:31 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=100.103.45.18
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1780553793; cv=none; b=mBl5El1Kr1zF7uSeOOeauaRFoV5nPiHWRfJHjrG0t+ubWtzkh6US9Px+cRodsACxZNOrq0igCMev/HrXjbgFgd5A0iPfaLaCdw5IxShi8F9GW9bG8+uEd+5qf1G1gqKPIpzUcUXFG4NZDfHWQAJGyVmZ3MoQS2z8kfjQwN9xY9Y=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1780553793; c=relaxed/simple;
	bh=zdKPr4O7URfXxE1lBmxSDGBFGz2PI5AE+cvAVwsMI+Q=;
	h=From:Subject:To:Cc:In-Reply-To:References:Content-Type:Date:
	 Message-Id; b=Yp2UvxDrflh9ujkYr5D4NZZW4jzBDNjyKrLC+wSFcEYIts95PB2RlvFa4Z7WDHE/yt399tbAYHHvrc+l81VVc22sjCoGAsHpeD294zg3AnnhYP1gRL3rFwEDgP7Py3jH8E1y0t/hp2YqIJOMJLmIypIkUa4IynYd3HoqNpyfHHU=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=KBWDDKYK; arc=none smtp.client-ip=100.103.45.18
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="KBWDDKYK"
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 5DE951F00893;
	Thu,  4 Jun 2026 06:16:31 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kernel.org;
	s=k20260515; t=1780553791;
	bh=RolzxYb7Qda/9GD65WbZ3jLva45xCO1Qh8MnQGuGXag=;
	h=From:Subject:Reply-To:To:Cc:In-Reply-To:References:Date;
	b=KBWDDKYKpFXkeB4W8sNABDH2VjMm/YZ557yBlJGMtd2e4/Pnbak1uEY25VmUfzlB+
	 5+XNEdPBbQgDSLQ0g4vxwplEMQrPY6zqHQ97BCTcZzHTNp+kbknRJY7jCG2qWnLK8V
	 FCCB6ePB2FZJgVFnTDOw5Bp1+nvLD84LI0M64LXEPzMf/Rd6pJj4KMg3UgA7Kxhti6
	 Ai55MIECIAaSiG3bu9Xkw+sUqQTA26shNUl7phTxccjwSZJwiR460atzSh3XVj0V67
	 6b7hXPwVXBBbStsVazRC3DoYHaReYlmDZ3n25rUrmGkRTksvj+1JcTqoCzG5PHyLHb
	 YeAqwOZ++GC+Q==
From: sashiko-bot@kernel.org
Subject: Re: [PATCH 2/3] dt-bindings: i2c: add Novatek NT726xx SoC i2c
 controller
Reply-To: sashiko-reviews@lists.linux.dev
To: SP_ISW1_AT@novatek.com.tw
Cc: conor+dt@kernel.org, devicetree@vger.kernel.org, robh@kernel.org
In-Reply-To: <20260604060430.355733-1-SP_ISW1_AT@novatek.com.tw>
References: <20260604060430.355733-1-SP_ISW1_AT@novatek.com.tw>
Content-Type: text/plain; charset=utf-8
Content-Transfer-Encoding: quoted-printable
Date: Thu, 04 Jun 2026 06:16:30 +0000
Message-Id: <20260604061631.5DE951F00893@smtp.kernel.org>
Precedence: bulk
X-Mailing-List: devicetree@vger.kernel.org
List-Id: <devicetree.vger.kernel.org>
List-Subscribe: <mailto:devicetree+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:devicetree+unsubscribe@vger.kernel.org>

Thank you for your contribution! Sashiko AI review found 6 potential issue(=
s) to consider:
- [High] The commit message includes a restrictive corporate confidentialit=
y boilerplate.
- [High] Redefinition of the standard `clock-frequency` property units to k=
Hz instead of Hz.
- [High] Custom properties `nvt,hwmods` and `bus-enable` improperly reinven=
t standard Devicetree bindings and framework mechanisms.
- [Medium] Missing explicit type definitions for the custom properties `nvt=
,hwmods` and `bus-enable`.
- [Low] The custom property `bus-enable` is missing a vendor prefix.
- [Low] The compatible string uses an underscore instead of a hyphen.
--

commit b57b0e4f8d5415ed28a61406a5c742ff25ba61db
Author: SP_ISW1_AT@novatek.com.tw <SP_ISW1_AT@novatek.com.tw>

dt-bindings: i2c: add Novatek NT726xx SoC i2c controller

This commit adds device tree binding documentation for the Novatek NT726xx
SoC I2C master controller.

>     CONFIDENTIALITY NOTICE: This message, including attachments, contains=
 information which may be confidential and privileged, and is intended only=
 for use by the addressees designated above. Unless you are the intended re=
cipient, any use, copying, disclosure, or distribution is prohibited. If yo=
u have received the message in error, please immediately delete the message=
 and destroy all copies thereof and notify the sender by reply email. =E6=
=9C=AC=E9=83=B5=E4=BB=B6=E5=8F=8A=E4=BB=BB=E4=BD=95=E9=99=84=E4=BB=B6=E5=9D=
=87=E5=B1=AC=E6=A9=9F=E5=AF=86=EF=BC=8C=E5=83=85=E4=BE=9B=E5=85=B6=E4=B8=8A=
=E6=8C=87=E5=AE=9A=E5=9C=B0=E5=9D=80=E4=B9=8B=E6=94=B6=E4=BB=B6=E4=BA=BA=E4=
=BD=BF=E7=94=A8=E3=80=82=E9=99=A4=E9=9D=9E=E6=82=A8=E6=98=AF=E6=8C=87=E5=AE=
=9A=E4=B9=8B=E6=94=B6=E4=BB=B6=E4=BA=BA=EF=BC=8C=E5=90=A6=E5=89=87=E8=AB=8B=
=E5=8B=BF=E4=BD=BF=E7=94=A8=E3=80=81=E8=A4=87=E8=A3=BD=E3=80=81=E6=8F=AD=E9=
=9C=B2=E6=88=96=E6=95=A3=E5=B8=83=E6=9C=AC=E9=83=B5=E4=BB=B6=E4=B9=8B=E4=BB=
=BB=E4=BD=95=E9=83=A8=E4=BB=BD=E3=80=82=E8=8B=A5=E6=82=A8=E9=8C=AF=E8=AA=A4=
=E5=9C=B0=E6=94=B6=E5=88=B0=E6=AD=A4=E9=83=B5=E4=BB=B6=EF=BC=8C=E8=AB=8B=E7=
=AB=8B=E5=8D=B3=E5=9B=9E=E8=A6=86=E9=9B=BB=E5=AD=90=E9=83=B5=E4=BB=B6=E9=80=
=9A=E7=9F=A5=E5=AF=84=E4=BB=B6=E4=BA=BA=EF=BC=8C=E4=B8=A6=E8=AB=8B=E5=AE=8C=
=E5=85=A8=E5=88=AA=E9=99=A4=E4=B8=94=E9=8A=B7=E6=AF=80=E6=9C=AC=E9=83=B5=E4=
=BB=B6=E5=8F=8A=E5=85=B6=E8=A4=87=E6=9C=AC=E3=80=82

[Severity: High]
Is it possible to remove this confidentiality boilerplate from the commit
message?

Such legal disclaimers conflict with the open-source nature of the Linux
kernel, the GPL-2.0 license, and the Developer's Certificate of Origin.

> diff --git a/Documentation/devicetree/bindings/i2c/novatek,nt726xx-i2c.ya=
ml b/Documentation/devicetree/bindings/i2c/novatek,nt726xx-i2c.yaml
> new file mode 100644
> index 0000000000000..0826ee9ec8315
> --- /dev/null
> +++ b/Documentation/devicetree/bindings/i2c/novatek,nt726xx-i2c.yaml

[ ... ]

> +properties:
> +  compatible:
> +    const: novatek,nt726xx_i2c

[Severity: Low]
Does this compatible string follow the standard naming conventions?

Device tree guidelines typically suggest using hyphens rather than undersco=
res
in compatible strings, which would make this novatek,nt726xx-i2c instead.

> +  nvt,hwmods:
> +    description: Name of each i2c pin, must be named with "i2cX" (X is
> +                 an integer starting from 0)
> +    minItems: 1

[Severity: High]
Is this custom property intended to encode the I2C adapter number?

Standard practice is to rely on the standard aliases node for this purpose,
like aliases { i2c0 =3D &i2c0; };, rather than bypassing it with a custom s=
tring.

[Severity: Medium]
Could we add an explicit type definition for nvt,hwmods?

Custom vendor properties require type definitions, such as referencing the
string type schema, because constraints like minItems are insufficient for
validation tools to deduce the type.

> +  bus-enable:
> +    description: enable this i2c pin function or not
> +    maxItems: 1

[Severity: High]
Does this property reinvent the standard status property?

Usually, device enablement is handled with status =3D "okay" or
status =3D "disabled" rather than creating a custom enable flag.

[Severity: Medium]
Since this is a custom property, shouldn't it include an explicit type
definition?

Additionally, using maxItems: 1 on what appears to be a scalar flag without=
 an
array type definition will cause validation tools to fail.

[Severity: Low]
If this property is kept instead of using the standard status property, sho=
uld
it include a vendor prefix like nvt,bus-enable to prevent future namespace
collisions with generic bindings?

[ ... ]

> +  clock-frequency:
> +    description: Operation clock frequency of i2c in kHz. Default is 100=
kHz.
> +    default: 100
> +    maxItems: 1

[Severity: High]
Is it safe to redefine the standard clock-frequency units to kHz here?

The generic i2c-controller schema and device tree specification define
clock-frequency in Hertz (Hz). If a standard device tree configures
clock-frequency =3D <100000> for 100 kHz, the driver might interpret it as
100,000 kHz, potentially leading to a misconfigured hardware clock divisor =
and
bus malfunction.

--=20
Sashiko AI review =C2=B7 https://sashiko.dev/#/patchset/20260604060430.3557=
33-1-SP_ISW1_AT@novatek.com.tw?part=3D2
