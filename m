Received: from smtp.kernel.org (aws-us-west-2-korg-mail-alma10-1.taild15c8.ts.net [100.103.45.18])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 8911642DA53
	for <devicetree@vger.kernel.org>; Thu,  6 Aug 2026 22:26:13 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=100.103.45.18
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1786055176; cv=none; b=VVWebrdMYUQpgIbNF7FhJX5V4ZA3WSP9KImmxLidsDCsTHHRRMTkRFX/BlnPLplMD1zpRVT9wD11KrK/QUrPScuApccMjwmxc9tOX4PWfotbUogvn+CoDAwFULPknrptoDh32Ajcsw/UGm/9xEJ2K5mvkidJEPdHQ1vRgJbKsdc=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1786055176; c=relaxed/simple;
	bh=BixdRpWe1jszEUcq/WksmUGcQSO0y1zSlHyNH+PlH8o=;
	h=From:Subject:To:Cc:In-Reply-To:References:Content-Type:Date:
	 Message-Id; b=CIr2EgDp2bjjufrzra4+FEAGxxpJAO/uVj3B8Jr2yVw5WlAkN201YTkbKXb02D5XWn6ROZ2yx+0jtH/XmjIS6eh4f7dwcfeKrFsN/KWdWn1SaAFO6yUGkn33NeqWyJyeyro2GbmstgLGyBtgIEfkvAqEp0atD8lJ0um5ujgTdrs=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=EOMgJrAH; arc=none smtp.client-ip=100.103.45.18
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="EOMgJrAH"
Received: by smtp.kernel.org (Postfix) with ESMTPSA id D271E1F000E9;
	Thu,  6 Aug 2026 22:26:10 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kernel.org;
	s=k20260515; t=1786055171;
	bh=HpvJC/abZDtHwDfxqAEo4TV24c4rGnzdIM7QXURL624=;
	h=From:Subject:Reply-To:To:Cc:In-Reply-To:References:Date;
	b=EOMgJrAHMbvwjKIGX4LkYsXeOBj5Clk23lDyrXc9vZZu7plikQCAVGX75dGi40x0E
	 Wll2DGt1ERjTBlqX6wCE/hLCTeOV6Spf+1Cm99zz+OH5dLMq+mOVxE7JOkQxyCXS6q
	 8U87LZiQe933ggV2zef0Fwaat3TCeYz7aq2cW4mWgfboeohmWZZoYAIWFS9nTIAMwj
	 OdBbobxWMdWmPAk4kvOLmfnzkum0qBn50K5wnCsVISz80qNblNvwfiC7S0eBUJGa6O
	 Sa9s9x22q3iTFxjxt0yONt6W32yLu/YGor0K/sddT/VKepBhT53QcrhKTmD5Dg05To
	 wJdrOzdYAATQQ==
From: sashiko-bot@kernel.org
Subject: Re: [PATCH v11 08/37] dt-bindings: pinctrl: airoha: an7583: allow
 configuration of non-gpio default pins as gpio and pwm
Reply-To: sashiko-reviews@lists.linux.dev
To: "Mikhail Kshevetskiy" <mikhail.kshevetskiy@iopsys.eu>
Cc: devicetree@vger.kernel.org, robh@kernel.org, conor+dt@kernel.org
In-Reply-To: <20260806220615.4078303-9-mikhail.kshevetskiy@iopsys.eu>
References: <20260806220615.4078303-1-mikhail.kshevetskiy@iopsys.eu>
 <20260806220615.4078303-9-mikhail.kshevetskiy@iopsys.eu>
Content-Type: text/plain; charset=utf-8
Content-Transfer-Encoding: quoted-printable
Date: Thu, 06 Aug 2026 22:26:09 +0000
Message-Id: <20260806222610.D271E1F000E9@smtp.kernel.org>
Precedence: bulk
X-Mailing-List: devicetree@vger.kernel.org
List-Id: <devicetree.vger.kernel.org>
List-Subscribe: <mailto:devicetree+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:devicetree+unsubscribe@vger.kernel.org>

Thank you for your contribution! Sashiko AI review found 1 potential issue(=
s) to consider:
- [Low] The added `gpio-ranges` property in the DT example references a non=
-existent `pinctrl` label, causing `make dt_binding_check` to fail.
--

--- Patch [8]: [PATCH v11 08/37] dt-bindings: pinctrl: airoha: an7583: allo=
w configuration of non-gpio default pins as gpio and pwm ---
commit fe2117a8a4dbc031149ba94f4003a2a7c07323ab
Author: Mikhail Kshevetskiy <mikhail.kshevetskiy@iopsys.eu>

dt-bindings: pinctrl: airoha: an7583: allow configuration of non-gpio defau=
lt pins as gpio and pwm

Some AN7583 pins have non-gpio default settings. This patch provides a way
to configure such pins as GPIO or PWM. Also add gpio-range property in the
dts example.

> diff --git a/Documentation/devicetree/bindings/pinctrl/airoha,an7583-pinc=
trl.yaml b/Documentation/devicetree/bindings/pinctrl/airoha,an7583-pinctrl.=
yaml
> index f52802a3ad79d..3e680c997fe26 100644
> --- a/Documentation/devicetree/bindings/pinctrl/airoha,an7583-pinctrl.yaml
> +++ b/Documentation/devicetree/bindings/pinctrl/airoha,an7583-pinctrl.yaml
[ ... ]
> @@ -337,6 +347,8 @@ examples:
>        interrupt-controller;
>        #interrupt-cells =3D <2>;
> =20
> +      gpio-ranges =3D <&pinctrl 0 2 53>;
> +
[Severity: Low]
Does this phandle reference cause dtc to fail during make dt_binding_check?

Looking at the examples section, the root node doesn't appear to have a lab=
el
defined for it. Without changing the definition from pinctrl { to
pinctrl: pinctrl {, the &pinctrl reference in gpio-ranges won't be resolved.

>        pcie1-rst-pins {
>          conf {
>            pins =3D "pcie_reset1";

--=20
Sashiko AI review =C2=B7 https://sashiko.dev/#/patchset/20260806220615.4078=
303-1-mikhail.kshevetskiy@iopsys.eu?part=3D8
