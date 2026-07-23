Received: from smtp.kernel.org (aws-us-west-2-korg-mail-alma10-1.taild15c8.ts.net [100.103.45.18])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 17E024D90BE
	for <devicetree@vger.kernel.org>; Thu, 23 Jul 2026 15:55:30 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=100.103.45.18
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1784822132; cv=none; b=KXWGR5QSB1Apmgi80Esoe6ShKY/VdEpNL0Tp0/EWLaUk50Vioas7oGvCog5BKr6XRsPQNEaTLYFis+HliMPJKOqpwRTEj31udXho04rpU1cDHr+ou77qRND2cETCiX72nqMfdPExuw+WqZzx8Hw1euwlAY8QDaG3VdYFFGf1faE=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1784822132; c=relaxed/simple;
	bh=Ar9YbH1j4gLe1RUMMIgU6sGz8AZWlvSD9dVaDagIDJ4=;
	h=From:Subject:To:Cc:In-Reply-To:References:Content-Type:Date:
	 Message-Id; b=isgaQi8po/43uDJ60BQNEMTIfFdMwW0VXYGd+LsLvdHbsOgMgvjmwzPSIBDBP/uzE7xVhY40CHbRhWGtmMOx5ej+FKTyQsVie0DIDLZ5Gbum+S8+XcbrCQjSFC/8jcBt/MYrb9GMql0Qgr3Nh/GUutd22xZ1YKkygftymQljtrg=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=jIiCsOha; arc=none smtp.client-ip=100.103.45.18
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="jIiCsOha"
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 6829E1F00A3D;
	Thu, 23 Jul 2026 15:55:30 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kernel.org;
	s=k20260515; t=1784822130;
	bh=unHZ0cVT4D4LcOm+e+SeEfSXFrm460dp6sPgTMZx7bk=;
	h=From:Subject:Reply-To:To:Cc:In-Reply-To:References:Date;
	b=jIiCsOhacB1g7mgdihTNd4ADlYVXlf3FXcdeylnHMGjiJZLLVscPvJdYkdy0sKfNx
	 BICIeqXiDOJD+l4x57FkzgJ9XtJnxFtksk2BOSfL81D9x97ZpPETYIkV0zneHzhsKO
	 35NQFYl0Le4NwBxHe148OsNBi1j2bIag34fzGNiCMpDPaOO7uiQRqrY1HJfPUC2JM5
	 mwleIaZXZclWXmBIKSOuEoQ+WaC3qODAXjrrn4Px+4g79FFKum3FCbB2Bmofpe02+l
	 et8rAwe7ZfJVPqCC474t54+KGYfV+GOkmu/YPhLrPfkUCK2XHiAm5/34iAqZp/7vsa
	 l9wcYWfqeLjrg==
From: sashiko-bot@kernel.org
Subject: Re: [PATCH v2] dt-bindings: usb: ti,da830-ohci: Convert to DT
 schema
Reply-To: sashiko-reviews@lists.linux.dev
To: "Bhargav Joshi" <j.bhargav.u@gmail.com>
Cc: devicetree@vger.kernel.org, conor+dt@kernel.org, robh@kernel.org
In-Reply-To: <20260723-ti-da830-ohci-v2-1-41e54afc4703@gmail.com>
References: <20260723-ti-da830-ohci-v2-1-41e54afc4703@gmail.com>
Content-Type: text/plain; charset=utf-8
Content-Transfer-Encoding: quoted-printable
Date: Thu, 23 Jul 2026 15:55:25 +0000
Message-Id: <20260723155530.6829E1F00A3D@smtp.kernel.org>
Precedence: bulk
X-Mailing-List: devicetree@vger.kernel.org
List-Id: <devicetree.vger.kernel.org>
List-Subscribe: <mailto:devicetree+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:devicetree+unsubscribe@vger.kernel.org>

Thank you for your contribution! Sashiko AI review found 1 potential issue(=
s) to consider:
- [Low] The DT schema does not reference the common USB HCD schema (usb-hcd=
.yaml) and restricts properties with `additionalProperties: false`.
--

--- Patch [1]: [PATCH v2] dt-bindings: usb: ti,da830-ohci: Convert to DT sc=
hema ---
commit 71d5f694a3c66084670958199c0d6e277f1f74e5
Author: Bhargav Joshi <j.bhargav.u@gmail.com>
Date:   Thu Jul 23 15:43:29 2026 +0000

dt-bindings: usb: ti,da830-ohci: Convert to DT schema

Convert Texas Instruments da830-ohci bindings from legacy text to DT schema=
.=20
Name of binding is changed to match primary compatible property. Add requir=
ed=20
property clocks and optional property oc-gpios which were missing from lega=
cy=20
binding.

Link: https://patch.msgid.link/20260717-ti-da830-ohci-v1-1-3f2d111a2042@gma=
il.com

> diff --git a/Documentation/devicetree/bindings/usb/ti,da830-ohci.yaml b/D=
ocumentation/devicetree/bindings/usb/ti,da830-ohci.yaml
> new file mode 100644
> index 0000000000000..f7b9db6347fab
> --- /dev/null
> +++ b/Documentation/devicetree/bindings/usb/ti,da830-ohci.yaml

[ ... ]

> +required:
> +  - compatible
> +  - reg
> +  - interrupts
> +  - phys
> +  - phy-names
> +  - clocks
> +
> +additionalProperties: false

[Severity: Low]
Should this schema include a $ref to usb-hcd.yaml#?

Since additionalProperties is set to false, omitting the reference to the
common USB host controller schema means that any valid addition of standard=
=20
USB properties (such as #address-cells, #size-cells, or companion) will=20
result in dt_binding_check failures.

> +
> +examples:
> +  - |
> +    usb@225000 {
> +        compatible =3D "ti,da830-ohci";
> +        reg =3D <0x225000 0x1000>;
> +        interrupts =3D <59>;
> +        phys =3D <&usb_phy 1>;
> +        phy-names =3D "usb-phy";
> +        clocks =3D <&psc1 2>;
> +        vbus-supply =3D <&reg_usb_ohci>;
> +    };

--=20
Sashiko AI review =C2=B7 https://sashiko.dev/#/patchset/20260723-ti-da830-o=
hci-v2-1-41e54afc4703@gmail.com?part=3D1
