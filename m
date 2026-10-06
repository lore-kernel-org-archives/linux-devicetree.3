Received: from smtp.kernel.org (aws-us-west-2-korg-mail-alma10-1.taild15c8.ts.net [100.103.45.18])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 69FA249E156
	for <devicetree@vger.kernel.org>; Tue,  6 Oct 2026 15:54:29 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=100.103.45.18
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1791302070; cv=none; b=WWLY6WUWxizsWb+VmMoPvJHDocies+B80lh1NpKks/SEXhfrCXjEaZlzldsZECCEZDlQAF3YL4fdGKk5azqoImuRYYqCig/pdphToCutgt8hZJ/seK48StZj5p6YHXIC0wvgjzv+2kUnxrPrG4RyS2qfKgH/C3ffCjANM67LuBc=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1791302070; c=relaxed/simple;
	bh=8audsDyLKUtbfqrHNy+aytZPsajCgtdwZwkG7hjGcA4=;
	h=From:Subject:To:Cc:In-Reply-To:References:Content-Type:Date:
	 Message-Id; b=kQAeRjNDfpS5Ew8TC8Qe89WgYLMXqYkxD/+0agUOFuf7ljNkm15512r7CmcpSQAReG4oz4VXXRZbYN0xD9NcRLY+w4bcWw7V65RMVWXFA2wvQzvcgLWmZ92qeTEUZ6jyab/s9KQ5PoJYt22B6g1PpezOBKHHxziIJfKIVrkc2PI=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=XjbwRoBc; arc=none smtp.client-ip=100.103.45.18
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="XjbwRoBc"
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 028401F0089B;
	Tue,  6 Oct 2026 15:54:28 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kernel.org;
	s=k20260515; t=1791302069;
	bh=VNEVbihaXmhz0rdd4jqF9KmSCYsuxf0FfeKJ70zbBIo=;
	h=From:Subject:Reply-To:To:Cc:In-Reply-To:References:Date;
	b=XjbwRoBcZoKPb7ihR2JLuFJSovY//NnFEArxkaJNoDqt60wAk/3SooHyUDCuVMqkF
	 DoP0gxg3qvfxFrl3qOs6HlvvB6zB9u4vKwQQmLZ5BM1M/W/+62XR8EMgNpB8e42QK3
	 Wo72igJ2Y/8JZY1NRNv0Z6V6eWm/j1OS49mkQPzVGM4UuGQWXVsE7SRDhu+92vv7qv
	 KGVQZof1/KjdzVgclM65Ie027SIZZ47/PJ43NGZcfkRmvb5hW815IamvUE4A55Rylb
	 DUhEgmm5TEK8W3bbC0Dk9DCyJ9hIVJ2wDy/Uxsv5PPdhF5YKfeZpytlDR9a3FYMUmZ
	 XfK460LQmwH0Q==
From: sashiko-bot@kernel.org
Subject: Re: [PATCH v1 1/7] regulator: dt-bindings: ti,lp872x: Convert to DT
 schema
Reply-To: sashiko-reviews@lists.linux.dev
To: "Svyatoslav Ryhel" <clamor95@gmail.com>
Cc: devicetree@vger.kernel.org, conor+dt@kernel.org, robh@kernel.org
In-Reply-To: <20261006154431.318936-2-clamor95@gmail.com>
References: <20261006154431.318936-1-clamor95@gmail.com>
 <20261006154431.318936-2-clamor95@gmail.com>
Content-Type: text/plain; charset=utf-8
Content-Transfer-Encoding: quoted-printable
Date: Tue, 06 Oct 2026 15:54:28 +0000
Message-Id: <20261006155429.028401F0089B@smtp.kernel.org>
Precedence: bulk
X-Mailing-List: devicetree@vger.kernel.org
List-Id: <devicetree.vger.kernel.org>
List-Subscribe: <mailto:devicetree+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:devicetree+unsubscribe@vger.kernel.org>

Thank you for your contribution! Sashiko AI review found 1 potential issue(=
s) to consider:
- [Critical] dt-bindings: ti,lp872x: ABI breakage by renaming ti,dvs-gpio
--

commit c03dfe1db500df8cb1f0e6fb4b50fc47567114c6
Author: Svyatoslav Ryhel <clamor95@gmail.com>

regulator: dt-bindings: ti,lp872x: Convert to DT schema

Convert TI LP872x regulator binding from text to DT schema.

> diff --git a/Documentation/devicetree/bindings/regulator/lp872x.txt b/Doc=
umentation/devicetree/bindings/regulator/lp872x.txt
> deleted file mode 100644
> index ab895cd1cac1a..0000000000000
> --- a/Documentation/devicetree/bindings/regulator/lp872x.txt
> +++ /dev/null
> @@ -1,161 +0,0 @@
[ ... ]
> -Optional properties:
> -  - ti,general-config: the value of LP872X_GENERAL_CFG register (u8)
[ ... ]
> -  - ti,update-config: define it when LP872X_GENERAL_CFG register should =
be set
> -  - ti,dvs-gpio: GPIO specifier for external DVS pin control of LP872x d=
evices.
> -  - ti,dvs-vsel: DVS selector. 0 =3D SEL_V1, 1 =3D SEL_V2.
> -  - ti,dvs-state: initial DVS pin state. 0 =3D DVS_LOW, 1 =3D DVS_HIGH.
[ ... ]
> diff --git a/Documentation/devicetree/bindings/regulator/ti,lp8720.yaml b=
/Documentation/devicetree/bindings/regulator/ti,lp8720.yaml
> new file mode 100644
> index 0000000000000..f2384749314f1
> --- /dev/null
> +++ b/Documentation/devicetree/bindings/regulator/ti,lp8720.yaml
> @@ -0,0 +1,232 @@
[ ... ]
> +  enable-gpios:
> +    description: GPIO specifier for EN pin control.
> +    maxItems: 1
> +
> +  dvs-gpios:
> +    description: GPIO specifier for external DVS pin control.

[Severity: Critical]
Does renaming ti,dvs-gpio to dvs-gpios cause a regression for existing
device trees?

The original text binding specifies ti,dvs-gpio for DVS pin control, but the
new YAML schema renames it to dvs-gpios and uses additionalProperties: fals=
e.
Existing valid device trees using ti,dvs-gpio will fail schema validation.

Furthermore, looking at lp872x_init_dvs() in drivers/regulator/lp872x.c,
when the driver is updated to use devm_gpiod_get_optional(dev, "dvs", ...)
instead of the legacy ti,dvs connection ID, it will only look for dvs-gpios
or dvs-gpio. The driver will silently ignore the legacy ti,dvs-gpio propert=
y,
breaking DVS functionality for existing hardware unless explicit fallback
logic is provided.

Should the schema retain ti,dvs-gpio as a deprecated property or support
both names to maintain backward compatibility?

--=20
Sashiko AI review =C2=B7 https://sashiko.dev/#/patchset/20261006154431.3189=
36-1-clamor95@gmail.com?part=3D1
