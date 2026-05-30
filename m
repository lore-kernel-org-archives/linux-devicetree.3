Received: from smtp.kernel.org (aws-us-west-2-korg-mail-alma10-1.taild15c8.ts.net [100.103.45.18])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 0D45632B106
	for <devicetree@vger.kernel.org>; Sat, 30 May 2026 15:29:12 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=100.103.45.18
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1780154954; cv=none; b=rhO2LpPbZeM6UOGLlVvmH5N+jk8clrFxhBwkvH5c3mFkOxFDZVo5jQxrdc+gnkvirTLE9Lml3C1pII6hBXWQMkyaPxzqlsqvraTE/ERDZmQsJTPBep6GSDRZpla9bFooutLvCEBlT45Nfhp9JkTyCsrka3S9Xu1Ju2dru8oFp1c=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1780154954; c=relaxed/simple;
	bh=vTTSdCiXB+rELetVBC54OcrK3GBkGnvqpbCyjfAVCa0=;
	h=From:Subject:To:Cc:In-Reply-To:References:Content-Type:Date:
	 Message-Id; b=eCdnYQY1m0C5Yi4anFDa5OAk7U+LS/NfCrNDaAnDNtvdHzsLEtiiq5iAWZnK6GG9uvcpqiDAX9u07i8SPPJpWiu/nRidnc5qqzBQBzXmCj6/+fhj9FvJiAJQ0zfZVFSRzMMfOhSs9jvtz4GH/A/K1fNKHqIbJr2leOGISGJhViU=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=U+dTaJNa; arc=none smtp.client-ip=100.103.45.18
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="U+dTaJNa"
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 67F511F00893;
	Sat, 30 May 2026 15:29:12 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kernel.org;
	s=k20260515; t=1780154952;
	bh=0JDsj1da4fFA/7LzHSm4edO6sY1MhFU1MAIg8a0es6E=;
	h=From:Subject:Reply-To:To:Cc:In-Reply-To:References:Date;
	b=U+dTaJNaOMebMxaFDJky76fWTQx9H48ra6cGJap3294Bgpy8FXGmI0uvRZRlDHYNq
	 ZQLMy7SLDfeBTKU6gBssISoycFlExCxfloJFTf6aT3triaEw2FFoPLbf0w1GF6TSpU
	 Ljio3xdzo6SJ2h72pyMGSL4q1OcpsPYfMSLjgu90RqbMd9bONQLqoY+bjkqsQtV7WJ
	 6cjG2GSVnFQ4620VRZVwgBQ6VK9qBx4Sbaq4zU/wJFaHr8u+Uq4Fyu/ZRDRGFrwW7t
	 zWcZ2ylcEBonaJpDVEanQDPa5M1A9+tV+Bo3c8P7qAdyD3TlPh9ExxCU5mzYItDOPQ
	 S3L+6wN7AvEAA==
From: sashiko-bot@kernel.org
Subject: Re: [PATCH v8 4/6] dt-bindings: pinctrl: mediatek,mt6779-pinctrl:
 Document MT6765 pin controller
Reply-To: sashiko-reviews@lists.linux.dev
To: "Yassine Oudjana" <yassine.oudjana@gmail.com>
Cc: conor+dt@kernel.org, robh@kernel.org, devicetree@vger.kernel.org
In-Reply-To: <20260530145800.1029920-5-y.oudjana@protonmail.com>
References: <20260530145800.1029920-5-y.oudjana@protonmail.com>
Content-Type: text/plain; charset=utf-8
Content-Transfer-Encoding: quoted-printable
Date: Sat, 30 May 2026 15:29:11 +0000
Message-Id: <20260530152912.67F511F00893@smtp.kernel.org>
Precedence: bulk
X-Mailing-List: devicetree@vger.kernel.org
List-Id: <devicetree.vger.kernel.org>
List-Subscribe: <mailto:devicetree+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:devicetree+unsubscribe@vger.kernel.org>

Thank you for your contribution! Sashiko AI review found 3 potential issue(=
s) to consider:

New issues:
- [High] The documented `drive-strength` values [1, 2, 4, 16] for MT6765 in=
clude values that will cause runtime `-EINVAL` failures in the driver.
- [Medium] The schema for MT6795 conditionally allows 2 interrupts, but the=
 top-level property restricts `interrupts` to `maxItems: 1`.

Pre-existing issues:
- [High] Pre-existing schema mismatch for MT6779 and MT6797 drive-strength =
values, causing identical runtime failures.
--

commit 51d39da1313cce768284322ddb8ef56f47955b24
Author: Yassine Oudjana <y.oudjana@protonmail.com>

dt-bindings: pinctrl: mediatek,mt6779-pinctrl: Document MT6765 pin controll=
er

The MT6765 pin controller has had a driver for a while, but DT
bindings were never documented for it.

> diff --git a/Documentation/devicetree/bindings/pinctrl/mediatek,mt6779-pi=
nctrl.yaml b/Documentation/devicetree/bindings/pinctrl/mediatek,mt6779-pinc=
trl.yaml
> index 2124804c88631..1f65f0fd41bdf 100644
> --- a/Documentation/devicetree/bindings/pinctrl/mediatek,mt6779-pinctrl.y=
aml
> +++ b/Documentation/devicetree/bindings/pinctrl/mediatek,mt6779-pinctrl.y=
aml
[ ... ]
> @@ -61,6 +62,41 @@ required:
> =20
>  allOf:
>    - $ref: pinctrl.yaml#
> +  - if:
> +      properties:
> +        compatible:
> +          contains:
> +            const: mediatek,mt6765-pinctrl
> +    then:
[ ... ]
> +      patternProperties:
> +        '-pins$':
> +          patternProperties:
> +            '^pins':
> +              properties:
> +                drive-strength:
> +                  enum: [1, 2, 4, 16]

[Severity: High]
Will the value 16 cause runtime probe failures?

Looking at the driver in pinctrl-mt6765.c, .drive_set is assigned to
mtk_pinconf_drive_set_raw(), which passes the DT argument directly to
mtk_hw_set_value() without converting it from mA to a register value.

The maximum field width for DRV fields in mt6765_pin_drv_range is 3 bits
(a bitmask of 7). Passing 16 causes mtk_hw_set_value() to reject it
with -EINVAL because 16 > 7, aborting the probe for dependent devices.

>    - if:
>        properties:
>          compatible:
>            contains:
>              const: mediatek,mt6779-pinctrl

[Severity: High]
This is a pre-existing issue, but does the MT6779 (and MT6797) drive-streng=
th
also exceed the hardware raw register bitmask?

Similar to the MT6765 issue, the MT6779 and MT6797 pinctrl drivers use
mtk_pinconf_drive_set_raw() which expects raw 3-bit register values (0-7).

However, the schema defines drive-strength enums with values representing
mA (8, 12, and 16). Using these higher values will cause mtk_hw_set_value()
to fail with -EINVAL at runtime.

[Severity: Medium]
Does the top-level interrupts constraint conflict with the MT6795 condition=
al
block?

The root level of the schema defines interrupts: maxItems: 1. However, the
if block for mediatek,mt6795-pinctrl conditionally provides an items array
with 2 descriptions.

Since JSON Schema evaluates constraints cumulatively via allOf, the global
maxItems: 1 takes precedence. Any MT6795 device tree providing 2 interrupts
will fail schema validation.

Could the top-level maxItems be relaxed to 2 and constrained to 1 inside
specific if blocks?

--=20
Sashiko AI review =C2=B7 https://sashiko.dev/#/patchset/20260530145800.1029=
920-1-y.oudjana@protonmail.com?part=3D4
