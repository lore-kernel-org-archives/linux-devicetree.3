Received: from smtp.kernel.org (aws-us-west-2-korg-mail-alma10-1.taild15c8.ts.net [100.103.45.18])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 717523C9EE8
	for <devicetree@vger.kernel.org>; Thu, 30 Jul 2026 08:39:50 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=100.103.45.18
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1785400791; cv=none; b=PGo3R9weU2Ibl2aWn2UQHdbkOl4RLdguhnuVhpoZT2TeVg8Jp3wyJYxcVpRQxBiS6/ifnL/B/0rq+e8XzBrUb5xSrXlTitacQcnp2JL1gydUGvyaj0UpzLBw17oC2vS8tQlicyB2iZ1CpodyTUHHoD9ux4b6CSePmN/smlrwAtc=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1785400791; c=relaxed/simple;
	bh=nA4loPs+iAynSdzPx+Hamg4ahGuHiFWuLMrF4MuzasY=;
	h=From:Subject:To:Cc:In-Reply-To:References:Content-Type:Date:
	 Message-Id; b=ZFGg+AiyNEyzr2KT5eUIUbvndYnnPFsTfMj0uSV4Ns17jNYeg7oLR26jH9Txvt0aVBpqMdDH5dKlg/AVHHJD9jzaA4Phu0N6NbMaCYUAtDbjp943LMT++JMmN4tPMHb4XQzNaljTJpPjRR3yabjjbIWFx9Q1eko3oGAk/KGx+70=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=DGs1FrGd; arc=none smtp.client-ip=100.103.45.18
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="DGs1FrGd"
Received: by smtp.kernel.org (Postfix) with ESMTPSA id AE0351F000E9;
	Thu, 30 Jul 2026 08:39:49 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kernel.org;
	s=k20260515; t=1785400790;
	bh=I5neRnxEJg/Y2z91Wkid8tiwafceSy3HKtSxVnoN0ow=;
	h=From:Subject:Reply-To:To:Cc:In-Reply-To:References:Date;
	b=DGs1FrGdUvznQV+Xag8MOGxayJdIoK4dTnwRXRkiBLN9KhBoa28127TFx+krwkfKl
	 47/R+Bu3eipwNAaxg7oegtLekbGGHdjlwqv+3emkeUu8YIHYjVL8knFHhGJdiVqak8
	 mIWnC/0/3lIHLbsEtu0edqlUWGumddILgIYx4JYGGm+te9pYA9fVQ/tXMBmlr4jTiv
	 KyegLQkc4i+I0NYYa+xCSZwVoQZSzXOfI88K9TCX6c2Pv5QBkSefbUJoSETNYJdkT2
	 pcMd5XkeG3BM20wxfPL2jnnv8LZwqIImcPZihaTEOPhNTb1/ei6QERXq9MX/tsoASf
	 +NX1HiJ5ES5qA==
From: sashiko-bot@kernel.org
Subject: Re: [PATCH 1/2] dt-bindings: thermal: amlogic: Add A9 thermal
 bindings
Reply-To: sashiko-reviews@lists.linux.dev
To: "Xianwei Zhao" <xianwei.zhao@amlogic.com>
Cc: robh@kernel.org, conor+dt@kernel.org, devicetree@vger.kernel.org, neil.armstrong@linaro.org, linux-amlogic@lists.infradead.org
In-Reply-To: <20260730-a9-thermal-v1-1-d786d37cba58@amlogic.com>
References: <20260730-a9-thermal-v1-0-d786d37cba58@amlogic.com>
 <20260730-a9-thermal-v1-1-d786d37cba58@amlogic.com>
Content-Type: text/plain; charset=utf-8
Content-Transfer-Encoding: quoted-printable
Date: Thu, 30 Jul 2026 08:39:49 +0000
Message-Id: <20260730083949.AE0351F000E9@smtp.kernel.org>
Precedence: bulk
X-Mailing-List: devicetree@vger.kernel.org
List-Id: <devicetree.vger.kernel.org>
List-Subscribe: <mailto:devicetree+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:devicetree+unsubscribe@vger.kernel.org>

Thank you for your contribution! Sashiko AI review found 1 potential issue(=
s) to consider:
- [Low] Typo in the YAML schema `else` block: `clocks-names: false` instead=
 of `clock-names: false` fails to forbid the property for non-A9 devices.
--

--- Patch [1]: [PATCH 1/2] dt-bindings: thermal: amlogic: Add A9 thermal bi=
ndings ---
commit 3a3c5b1f7b65f4d86068deda76be1b7141170b8c
Author: Xianwei Zhao <xianwei.zhao@amlogic.com>

dt-bindings: thermal: amlogic: Add A9 thermal bindings

This commit documents the thermal controller compatibles for the Amlogic
A9 SoC. It describes the core and pclk clocks, adds a hardware reset
temperature property, and updates schema constraints.

> diff --git a/Documentation/devicetree/bindings/thermal/amlogic,thermal.ya=
ml b/Documentation/devicetree/bindings/thermal/amlogic,thermal.yaml
> index 8cfa44dcda58c..5f5dc6f12851d 100644
> --- a/Documentation/devicetree/bindings/thermal/amlogic,thermal.yaml
> +++ b/Documentation/devicetree/bindings/thermal/amlogic,thermal.yaml

[ ... ]

> @@ -73,6 +84,22 @@ allOf:
>        required:
>          - amlogic,secure-monitor
> =20
> +  - if:
> +      properties:
> +        compatible:
> +          contains:
> +            enum:
> +              - amlogic,a9-thermal
> +    then:
> +      required:
> +        - clock-names
> +    else:
> +      properties:
> +        clocks:
> +          maxItems: 1
> +        clocks-names: false

[Severity: Low]
Does this code intend to restrict the clock-names property here? It appears
there is a typo in the property name (clocks-names instead of clock-names).
Could this typo allow non-A9 variants to define the clock-names property
without failing schema validation?

> +        amlogic,hw-reset-temp: false
> +
>  unevaluatedProperties: false
> =20
>  examples:

--=20
Sashiko AI review =C2=B7 https://sashiko.dev/#/patchset/20260730-a9-thermal=
-v1-0-d786d37cba58@amlogic.com?part=3D1
