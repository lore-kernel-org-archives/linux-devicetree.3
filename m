Received: from smtp.kernel.org (aws-us-west-2-korg-mail-alma10-1.taild15c8.ts.net [100.103.45.18])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 2ECF82F2910
	for <devicetree@vger.kernel.org>; Sat, 18 Jul 2026 17:11:45 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=100.103.45.18
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1784394707; cv=none; b=Sam/zbxLHpOBe+kOyFQ+aMArH9qD4d2ckkQrnoh/0EzY0PVXwp4yU0dKIDZq2FkXWECp6E1b5nYh7qv3aXW9No0o/svInaQra9OaDJk9kI18/0AIoFJWrT/rhJb4IWE/E/vCzcvcHN92Y7/gcAh7gr3u5flWinfoZAVCLsdkUTU=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1784394707; c=relaxed/simple;
	bh=HXJmmMNsAN0GhJbLivUaUiu1M6E1Il3d5CHIU0E0Mtk=;
	h=From:Subject:To:Cc:In-Reply-To:References:Content-Type:Date:
	 Message-Id; b=EKPgrhJaqxWz7WRZNw6/vUiEBfdqTG2o/Smz1iNZhYpPK25csqeSPqjP0ZPYTqg+llACZHQYM7ihnwdvBinE1S6kUHopd5HWkIQiWm4aWSKoZ4ibWBjaTiCdTkKn1osF10Q9t5ff2LfokLgnxpse8GLD2F0r1RTiVlDyZF8c3Kk=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=OQrpMzSw; arc=none smtp.client-ip=100.103.45.18
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="OQrpMzSw"
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 9B62E1F000E9;
	Sat, 18 Jul 2026 17:11:45 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kernel.org;
	s=k20260515; t=1784394705;
	bh=eZPCd++BnfpOP9TmdQBUqZoq9VnvCz3RBXYEY8u1ZQs=;
	h=From:Subject:Reply-To:To:Cc:In-Reply-To:References:Date;
	b=OQrpMzSw3AFPlyLnM5/wBGdthxww/6WGqrHks8KnqnIF7lGbHDsbAJl4ADxDUAh8W
	 xm2aEzXRetESHLaYTm0QgWFaoB0wHEcanWSelUm+7YheJjUqadwCeOdiAHPJeQFO2w
	 sqdE0qQg7S2S757caRVee6HeJ/XVHzFekTghh/C3fbTOr3Zg+PrJ+3irWeL6iniBUZ
	 Si8ioF2vpdlYVCjFL0CYPZaBt38XpqU4AmCqW5nxwyjPcO/Y0Ne2SLxOWt7Gs2stqI
	 4cqIVX1QS46NHgoez4fyd2CjPFa6gs/kEZqdxqgjh4sD6PwXrYh5O1mOsmIaj9XZys
	 Rp4DxH5yIHU8A==
From: sashiko-bot@kernel.org
Subject: Re: [PATCH 1/5] dt-bindings: usb: parade,ps8830: Add
 parade,disable-usb4 property
Reply-To: sashiko-reviews@lists.linux.dev
To: "Jens Glathe" <jens.glathe@oldschoolsolutions.biz>
Cc: robh@kernel.org, conor+dt@kernel.org, devicetree@vger.kernel.org
In-Reply-To: <20260718-ps883x-disable-usb4-v1-1-cec86d0b909e@oldschoolsolutions.biz>
References: <20260718-ps883x-disable-usb4-v1-0-cec86d0b909e@oldschoolsolutions.biz>
 <20260718-ps883x-disable-usb4-v1-1-cec86d0b909e@oldschoolsolutions.biz>
Content-Type: text/plain; charset=utf-8
Content-Transfer-Encoding: quoted-printable
Date: Sat, 18 Jul 2026 17:11:45 +0000
Message-Id: <20260718171145.9B62E1F000E9@smtp.kernel.org>
Precedence: bulk
X-Mailing-List: devicetree@vger.kernel.org
List-Id: <devicetree.vger.kernel.org>
List-Subscribe: <mailto:devicetree+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:devicetree+unsubscribe@vger.kernel.org>

Thank you for your contribution! Sashiko AI review found 2 potential issue(=
s) to consider:
- [Low] The device tree binding violates OS-agnostic design principles by d=
escribing Linux-specific software behavior and internal driver states inste=
ad of hardware properties.
- [Low] The commit message contains a malformed and non-standard patch trai=
ler 'Assisted-by: Grok(xAI):4.3'.
--

--- Patch [1]: [PATCH 1/5] dt-bindings: usb: parade,ps8830: Add parade,disa=
ble-usb4 property ---
commit 3e93d13f3a0b964fe4e6611bd03b162fa75d29a3
Author: Jens Glathe <jens.glathe@oldschoolsolutions.biz>

dt-bindings: usb: parade,ps8830: Add parade,disable-usb4 property

This commit documents a new optional boolean property parade,disable-usb4
for the parade,ps8830 device tree binding, which disables USB4 mode.

>     Assisted-by: Grok(xAI):4.3
>     Signed-off-by: Jens Glathe <jens.glathe@oldschoolsolutions.biz>

[Severity: Low]
Does the Assisted-by trailer conform to the standard patch submission
guidelines?=20

This tag is non-standard, and it is missing the expected Name <email>
formatting. Could this cause issues with automated patch parsing tools?

> diff --git a/Documentation/devicetree/bindings/usb/parade,ps8830.yaml b/D=
ocumentation/devicetree/bindings/usb/parade,ps8830.yaml
> index eaeab1c01a594..44242907461eb 100644
> --- a/Documentation/devicetree/bindings/usb/parade,ps8830.yaml
> +++ b/Documentation/devicetree/bindings/usb/parade,ps8830.yaml

[ ... ]

> @@ -66,6 +66,12 @@ properties:
>            Sideband Use (SBU) AUX lines endpoint to the Type-C connector =
for the purpose of
>            handling altmode muxing and orientation switching.
> =20
> +  parade,disable-usb4:
> +    type: boolean
> +    description:
> +      When present, the retimer rejects USB4 mode (returns -EOPNOTSUPP).
> +      This forces the Type-C stack to fall back to USB3 + DP Alternate M=
ode.

[Severity: Low]
Should the description for parade,disable-usb4 focus on the physical
hardware state or board constraints rather than Linux-specific driver
behavior?=20

Mentioning internal software details like returning -EOPNOTSUPP and the
Type-C stack seems to go against the principle that device tree bindings
should be OS-agnostic. Could this be rephrased to describe the hardware
limitations instead?

--=20
Sashiko AI review =C2=B7 https://sashiko.dev/#/patchset/20260718-ps883x-dis=
able-usb4-v1-0-cec86d0b909e@oldschoolsolutions.biz?part=3D1
