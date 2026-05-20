Received: from smtp.kernel.org (aws-us-west-2-korg-mail-alma10-1.taild15c8.ts.net [100.103.45.18])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 40D9F3D1718
	for <devicetree@vger.kernel.org>; Wed, 20 May 2026 09:51:00 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=100.103.45.18
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1779270661; cv=none; b=H1+E3tmJrOw315GkowKB9gWw8F94YqlU6wDguwEB195+luOtI4m4jkNCkl+ZkA6Vrw7VBnCF8wF095LrAIm/YJxjdtzWqRTutQD5kNN2Ii0dYYyd9Apr8FG2kQQPIjQoKyC6e/Ox8hlPdZf+BCubDXPVTMl1U+SKEVzUQzqPRro=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1779270661; c=relaxed/simple;
	bh=xzvtdKh/PfnqM/hYMrtUdOK0cFZtEk803EHU6cI/dE4=;
	h=From:Subject:To:Cc:In-Reply-To:References:Content-Type:Date:
	 Message-Id; b=e/Lu24dChw6UEx0hVy08JElzBxMD9X0EhCLAkC3vx1Esx2Sf/DIBkcHtOnsTjcUY40WfsnnyS6aCzK9eY4gQt0rZdlAFBqVxzFhnxu7GMY/QIgpo/9qrtqdXPyX+bUs/RfacLTvtxDV40oC1pnIbzyUF1Fl/2VVdHoh2KToKi0c=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=Jq1vLt+o; arc=none smtp.client-ip=100.103.45.18
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="Jq1vLt+o"
Received: by smtp.kernel.org (Postfix) with ESMTPSA id BD8671F000E9;
	Wed, 20 May 2026 09:50:59 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kernel.org;
	s=k20260515; t=1779270660;
	bh=SxhN2f6Ty2v4RgfBpmJXEndfxhWr76LKzj9pLOFVhdc=;
	h=From:Subject:Reply-To:To:Cc:In-Reply-To:References:Date;
	b=Jq1vLt+o6UnTKfRSJM8EhmEzwJuw8oB0l8/wFcBGJ2R2Sms9MY64WZcc968JvGH6h
	 bqYimewnviqJOTBhgNZ+4Gp7vKZWhuChld0p0tSsa6UlglfZ18I+MklPawo93u02g4
	 kXRM9cBoVY7i3KKJUwzdjHoKlsH3NU5RDOEZpmFyC7dHdmn0n44SP9KG0w+M1AjoVp
	 CeYr5mKBvarXVAP7RfmEVz54jFXAvbsk6ich+gZXSLvVuKVbf5aHHmR9QwwMW2cQdI
	 R3sLjSxLU6bfZm8x6BJd8t0d3jLndJWPA5xxaAYTskWJtPsZj8xyH2uF0cI+o2UIJE
	 eiIcdOtwb3YNg==
From: sashiko-bot@kernel.org
Subject: Re: [PATCH 1/3] dt-bindings: usb: typec: Add Cypress CYPD6129 UCSI
 controller compatible
Reply-To: sashiko-reviews@lists.linux.dev
To: "Akash Kumar" <akash.kumar@oss.qualcomm.com>
Cc: conor+dt@kernel.org, devicetree@vger.kernel.org, robh@kernel.org
In-Reply-To: <20260520093902.2064730-2-akash.kumar@oss.qualcomm.com>
References: <20260520093902.2064730-2-akash.kumar@oss.qualcomm.com>
Content-Type: text/plain; charset=utf-8
Content-Transfer-Encoding: quoted-printable
Date: Wed, 20 May 2026 09:50:59 +0000
Message-Id: <20260520095059.BD8671F000E9@smtp.kernel.org>
Precedence: bulk
X-Mailing-List: devicetree@vger.kernel.org
List-Id: <devicetree.vger.kernel.org>
List-Subscribe: <mailto:devicetree+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:devicetree+unsubscribe@vger.kernel.org>

Thank you for your contribution! Sashiko AI review found 3 potential issue(=
s) to consider:
- [Low] The new device tree example assigns an unauthorized value to the 'f=
irmware-name' property, which violates the schema constraints.
- [Low] The DT example fails to compile due to an undefined macro 'GPIO' an=
d an undefined phandle label '&node'.
- [Low] The second device tree example is missing its parent bus node, resu=
lting in an invalid 'reg' property length and incorrect node context.
--

commit 911d8bba6bd4939c0495f237ef6ddd1854af3dd2
Author: Akash Kumar <akash.kumar@oss.qualcomm.com>

dt-bindings: usb: typec: Add Cypress CYPD6129 UCSI controller compatible

This commit documents the "cypress,cypd6129" compatible string for the
Cypress/Infineon EZ-PD CCGx UCSI controller. It allows the new compatible
and permits the existing "cypress,cypd4226" fallback.

> diff --git a/Documentation/devicetree/bindings/usb/cypress,cypd4226.yaml =
b/Documentation/devicetree/bindings/usb/cypress,cypd4226.yaml
> --- a/Documentation/devicetree/bindings/usb/cypress,cypd4226.yaml
> +++ b/Documentation/devicetree/bindings/usb/cypress,cypd4226.yaml
[ ... ]
> @@ -63,10 +69,42 @@ examples:
>    - |
>      #include <dt-bindings/interrupt-controller/arm-gic.h>
>      i2c {
> -      #address-cells =3D <1>;
> -      #size-cells =3D <0>;
> +        #address-cells =3D <1>;
> +        #size-cells =3D <0>;
> +        #interrupt-cells =3D <2>;
> +
> +        typec@8 {
> +            compatible =3D "cypress,cypd6129";
> +            reg =3D <0x08>;
> +            interrupt-parent =3D <&node>;
> +            interrupts =3D <GPIO IRQ_TYPE_LEVEL_LOW>;

[Severity: Low]
Will this example compile successfully? The label "node" is not defined
anywhere in the example, and "GPIO" is not a defined C preprocessor macro.
This typically causes the device tree compiler to fail with syntax and
undefined reference errors during dt_binding_check.

> +            firmware-name =3D "ccg_primary.cyacd2";

[Severity: Low]
Will this cause dt_binding_check to fail schema validation? The schema
restricts the firmware-name property to an enum of specific values like
"nvidia,gpu" and "nvidia,jetson-agx-xavier". Using "ccg_primary.cyacd2"
appears to violate this constraint.

> +            #address-cells =3D <1>;
> +            #size-cells =3D <0>;
[ ... ]
> +    };
> +
> +  - |
> +    typec@8 {

[Severity: Low]
Does this second example lack a valid parent bus wrapper?

The original typec@8 example was wrapped inside an i2c node that provided
the required #address-cells and #size-cells context. Without the parent
node, the reg =3D <0x08> property will trigger a missing cells error during
dt_binding_check.

>          compatible =3D "cypress,cypd4226";
>          reg =3D <0x08>;
>          interrupts =3D <2 IRQ_TYPE_LEVEL_LOW>;
[ ... ]

--=20
Sashiko AI review =C2=B7 https://sashiko.dev/#/patchset/20260520093902.2064=
730-1-akash.kumar@oss.qualcomm.com?part=3D1
