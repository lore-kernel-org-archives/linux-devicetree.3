Received: from smtp.kernel.org (aws-us-west-2-korg-mail-alma10-1.taild15c8.ts.net [100.103.45.18])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 2C83D23AE87
	for <devicetree@vger.kernel.org>; Sun,  9 Aug 2026 13:41:02 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=100.103.45.18
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1786282864; cv=none; b=fDd7eUOyctzVhqsHDx68efWITjxftfGyXQ6c6SwccSVF3hc3C6x1TpRG/QvqUhz3QrPdXF+weckfROb1DjTLk0VAF8m0GA+b7XxjT2rtsvlgkUv93Z+Eg/T99xC9kyhk8yN19wD92VPrJtVuHxGnRu9M8kbelP31fvxdHVS4pwg=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1786282864; c=relaxed/simple;
	bh=0DbZlom1yrVaTEKNy7MZgUVcyI/zgYns9ZkCzeLxDG0=;
	h=From:Subject:To:Cc:In-Reply-To:References:Content-Type:Date:
	 Message-Id; b=SiSIoVmUqs/ZFOVtUrqIfHNGP5X1QKL1A9FFwFYtRll/0Ez1U9o3suKWNihBelMwh1QaU6A6Un9Y8CQ9sJqtC5sx0G8g/XxhnT4nrkv2JH45zA9mERN0N4Jkj36Ag9yJzi0Ss7ruMcNTSge/hisN+22w8YF+XDcFVkMafBy2znk=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=i9PBQ2P4; arc=none smtp.client-ip=100.103.45.18
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="i9PBQ2P4"
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 7462F1F000E9;
	Sun,  9 Aug 2026 13:41:02 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kernel.org;
	s=k20260515; t=1786282862;
	bh=N4+pr40uvXvX9gG+n03S/KvJLYb+6Xf/8JnR0rtxWo0=;
	h=From:Subject:Reply-To:To:Cc:In-Reply-To:References:Date;
	b=i9PBQ2P46FQMmrXuGsnkoraO5oixoDE+ja1OAjHviih4yx8cZPa0sp62VLl7R+qAw
	 WSHfHTYxWLBhDz6dF10EGIdDpNLUrrglNzooifaTkOmDEUIzi9JEkH4BQAChBlyztb
	 jBhmjJXKZkf1JugyTRqAURUABSjzpBim5aJ4wqP7Q1jTJo+C6YHs/XYJiXpbRld6Ws
	 MESIumhUs8hl9eVZlClqJ6f6H90HbGSfxQkH/me3RZn522IkZnoBqDDeqhtu75QIlx
	 eS83NsjwzYgvikox4G4XyjhIv1remxAZTPzFNJSScwNIEYPWuY57rq4Y0lYtGUqR+w
	 Gl0pEhR3qFG0w==
From: sashiko-bot@kernel.org
Subject: Re: [PATCH v4 1/3] dt-bindings: platform: introduce EC for Dell XPS
 13 9345
Reply-To: sashiko-reviews@lists.linux.dev
To: "Aleksandrs Vinarskis" <alex@vinarskis.com>
Cc: conor+dt@kernel.org, devicetree@vger.kernel.org, robh@kernel.org
In-Reply-To: <20260809-dell-xps-9345-ec-v4-1-88306dbbc7aa@vinarskis.com>
References: <20260809-dell-xps-9345-ec-v4-0-88306dbbc7aa@vinarskis.com>
 <20260809-dell-xps-9345-ec-v4-1-88306dbbc7aa@vinarskis.com>
Content-Type: text/plain; charset=utf-8
Content-Transfer-Encoding: quoted-printable
Date: Sun, 09 Aug 2026 13:41:01 +0000
Message-Id: <20260809134102.7462F1F000E9@smtp.kernel.org>
Precedence: bulk
X-Mailing-List: devicetree@vger.kernel.org
List-Id: <devicetree.vger.kernel.org>
List-Subscribe: <mailto:devicetree+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:devicetree+unsubscribe@vger.kernel.org>

Thank you for your contribution! Sashiko AI review found 1 potential issue(=
s) to consider:
- [Low] The device tree binding example includes a non-existent header `<ar=
m64/qcom/qcom-adc5-gen3.h>` and uses invalid macro syntax `ADC5_GEN3_AMUX3_=
GPIO_100K_PU(1)`.
--

--- Patch [1]: [PATCH v4 1/3] dt-bindings: platform: introduce EC for Dell =
XPS 13 9345 ---
commit 7f91f574545d4b995c0bfefa74700011122fb8e1
Author: Aleksandrs Vinarskis <alex@vinarskis.com>

dt-bindings: platform: introduce EC for Dell XPS 13 9345

Add bindings for Embedded Controller (EC) in Dell XPS 13 9345 (platform
codename 'tributo'). It may be partially or fully compatible with EC
found in Snapdragon-based Dell Latitude, Inspiron ('thena').

> diff --git a/Documentation/devicetree/bindings/embedded-controller/dell,x=
ps13-9345-ec.yaml b/Documentation/devicetree/bindings/embedded-controller/d=
ell,xps13-9345-ec.yaml
> new file mode 100644
> index 0000000000000..3485117b505cc
> --- /dev/null
> +++ b/Documentation/devicetree/bindings/embedded-controller/dell,xps13-93=
45-ec.yaml

[ ... ]

> +examples:
> +  - |
> +    #include <dt-bindings/interrupt-controller/irq.h>
> +    #include <arm64/qcom/qcom-adc5-gen3.h>
> +    i2c {
> +        #address-cells =3D <1>;
> +        #size-cells =3D <0>;
> +
> +        embedded-controller@3b {
> +            compatible =3D "dell,xps13-9345-ec";
> +            reg =3D <0x3b>;
> +            interrupts-extended =3D <&tlmm 66 IRQ_TYPE_LEVEL_LOW>;
> +
> +            io-channels =3D <&pmk8550_vadc ADC5_GEN3_AMUX3_GPIO_100K_PU(=
1)>,

[Severity: Low]
Will this example cause make dt_binding_check to fail with a C preprocessor
error?

The included file <arm64/qcom/qcom-adc5-gen3.h> does not seem to exist in t=
he
kernel source tree.

Additionally, the constant macro ADC5_GEN3_AMUX3_GPIO_100K_PU typically does
not take arguments, making the (1) syntax invalid.

--=20
Sashiko AI review =C2=B7 https://sashiko.dev/#/patchset/20260809-dell-xps-9=
345-ec-v4-0-88306dbbc7aa@vinarskis.com?part=3D1
