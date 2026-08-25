Received: from smtp.kernel.org (aws-us-west-2-korg-mail-alma10-1.taild15c8.ts.net [100.103.45.18])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 3C0B3374A1B
	for <devicetree@vger.kernel.org>; Tue, 25 Aug 2026 10:52:07 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=100.103.45.18
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1787655129; cv=none; b=LYbdR1mRw+C1aRRdaXCWWKEyi3og7NiLXI42/fMVw06bN5gd98BgKPR6Ptcq5SSE5ClCJMstKh0F9qmKh4dexffE5OOeN5Qm42Sq0o8cLT8+lLRC5Q10BTAQenLXvTlirUvBIeCLy2yCr6OKQWNK8fO1Ififvqa86A6W+olNnUw=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1787655129; c=relaxed/simple;
	bh=q2VeD+YW6UbyJ/7uSVrJ+zf5hz0uP1LN87vORH2ljFs=;
	h=From:Subject:To:Cc:In-Reply-To:References:Content-Type:Date:
	 Message-Id; b=OVJIsSNHzU0ONSzevI1+l4msjwH/yn7TI8EOLVSShrHcIWWq+ydKpPrq9U1Gwi8nEaT5JmeJG5Qo8zBw7f4M4HshKalad3iyCVS6mGcgh5w9t1cegqsV2xuTZd9YLdasdVjcMbtO6iqy7ENXXjwhXdORC/xW1E53GolAO3SMMUc=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=mbAwdSz4; arc=none smtp.client-ip=100.103.45.18
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="mbAwdSz4"
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 6CA5F1F000E9;
	Tue, 25 Aug 2026 10:52:07 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kernel.org;
	s=k20260515; t=1787655127;
	bh=woTGqOaWhAQB9nG56K6RNCU6AMogQOzDl7sQNSPE6QI=;
	h=From:Subject:Reply-To:To:Cc:In-Reply-To:References:Date;
	b=mbAwdSz4RsvaArRFWAuj3wevv1PrmPnvzFKGv9Q4o4eIbnNqdsocC0eIizM3H0YQ+
	 m6B2PA6FOO08aFak9L2Tl8vCqMhAo1zrkfMd6MKF4RPzQbndYpgVUrUci3SXXjEgPJ
	 vX+pvlbbBHzhAwoWMN0tlYEZQo4ec6qTLdxr2wwuB0OfWzXxzE8Ph8wkdBHGuabHfl
	 TDzKs8agBcwDUZwMa5cO8+9NA08epThHncsF350bWMk7bVu02wAqdo/toc0TuKWPXK
	 RFjrp1K8s6CGi4plrwuUwnIK0BoslKMM/meTLT6I7Wul/pcaH7B4qtPHDbtxo/mrUd
	 eeffxDKEU21MA==
From: sashiko-bot@kernel.org
Subject: Re: [PATCH 1/9] dt-bindings: usb: qcom,snps-dwc3: Add ability to
 select UTMI as reference clock
Reply-To: sashiko-reviews@lists.linux.dev
To: "George Moussalem" <george.moussalem@outlook.com>
Cc: conor+dt@kernel.org, devicetree@vger.kernel.org, robh@kernel.org
In-Reply-To: <20260825-ipq-flatten-usb-v1-1-5c1f3170bbe9@outlook.com>
References: <20260825-ipq-flatten-usb-v1-0-5c1f3170bbe9@outlook.com>
 <20260825-ipq-flatten-usb-v1-1-5c1f3170bbe9@outlook.com>
Content-Type: text/plain; charset=utf-8
Content-Transfer-Encoding: quoted-printable
Date: Tue, 25 Aug 2026 10:52:06 +0000
Message-Id: <20260825105207.6CA5F1F000E9@smtp.kernel.org>
Precedence: bulk
X-Mailing-List: devicetree@vger.kernel.org
List-Id: <devicetree.vger.kernel.org>
List-Subscribe: <mailto:devicetree+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:devicetree+unsubscribe@vger.kernel.org>

Thank you for your contribution! Sashiko AI review found 2 potential issue(=
s) to consider:
- [Medium] Addition of a bespoke boolean property `qcom,select-utmi-as-ref-=
clk` to dictate software behavior instead of describing hardware.
- [Medium] The commit message references a non-existent deprecated DT prope=
rty (`snps,quirk-ref-clk-period-ns`) and contains typos.
--

--- Patch [1]: [PATCH 1/9] dt-bindings: usb: qcom,snps-dwc3: Add ability to=
 select UTMI as reference clock ---
commit bbfd7925c484a6ab77f42b767c8fcd756476cd44
Author: George Moussalem <george.moussalem@outlook.com>

dt-bindings: usb: qcom,snps-dwc3: Add ability to select UTMI as reference c=
lock

This commit introduces a new device tree property to select the UTMI clock
as the reference clock for DWC3. It aims to support chipsets that have a
reference clock rate different from the default 19.2 MHz.

> In the flattened snsp-dwc3 model, it is currently not possible to pass a

[Severity: Low]
This isn't a bug, but there is a typo in the text above ("snsp-dwc3" instead
of "snps-dwc3").

> The existing DT property 'snps,quirk-ref-clk-period-ns' has been
> deprecated.

[Severity: Medium]
Is this property name accurate?

Searching the tree reveals no property named snps,quirk-ref-clk-period-ns.

Could this be referencing snps,ref-clock-period-ns, which is the property
defined in snps,dwc3-common.yaml?

> diff --git a/Documentation/devicetree/bindings/usb/qcom,snps-dwc3.yaml b/=
Documentation/devicetree/bindings/usb/qcom,snps-dwc3.yaml
> index ea60f7220afe3..aa263dfd42a1c 100644
> --- a/Documentation/devicetree/bindings/usb/qcom,snps-dwc3.yaml
> +++ b/Documentation/devicetree/bindings/usb/qcom,snps-dwc3.yaml
> @@ -155,6 +155,15 @@ properties:
>        HS/FS/LS modes are supported.
>      type: boolean
> =20
> +  qcom,select-utmi-as-ref-clk:
> +    description:
> +      If present, pass the UTMI clock as the reference clock to the DWC3=
 core to

[Severity: Medium]
Does this property dictate driver software behavior rather than describing
the hardware?

The hardware's connection to the UTMI clock is already fully described via
the clocks property (e.g., mock_utmi).

Can the driver deduce the need to pass this clock based on the SoC's
compatible string, or by checking the clock's presence, rather than relying
on a new bespoke boolean property?

> +      use its clock rate to calculate the reference clock period and fra=
me
> +      length adjustment in GUCTL and GFLADJ registers. This is needed wh=
en these
> +      values based on the standard clock rate deviate from the hardware =
default
> +      values. If not set, the hardware default values are used.
> +    type: boolean
> +
>    wakeup-source: true
> =20
>  required:

--=20
Sashiko AI review =C2=B7 https://sashiko.dev/#/patchset/20260825-ipq-flatte=
n-usb-v1-0-5c1f3170bbe9@outlook.com?part=3D1
