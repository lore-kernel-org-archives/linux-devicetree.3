Received: from smtp.kernel.org (aws-us-west-2-korg-mail-alma10-1.taild15c8.ts.net [100.103.45.18])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 5FC17255F52
	for <devicetree@vger.kernel.org>; Wed, 29 Jul 2026 01:10:38 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=100.103.45.18
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1785287439; cv=none; b=K0RXfn2UDOHG80bzOdy6RS5lg4C9nfwVnQFc+h8/e7l+NFWjjqRLe7WuYgxX3Lt63faKuGg/o9ICil7ZgsJMEopxbPCH8F2JIsP8zcpVfxnGVsApKXItpY/ztTmAQC1GKPSRxXQ89bucTrEsF4hfaFS70k81ijiA28JuNZ5NGiA=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1785287439; c=relaxed/simple;
	bh=UUgMcxGEUAVTIKp+z6SUzqrIaLa97l76QiqIvm39pNg=;
	h=From:Subject:To:Cc:In-Reply-To:References:Content-Type:Date:
	 Message-Id; b=FxMZOdx3Sei9JHiAbPgnBAOjb1xxqVY8X7EdRBUXgaT7rFB5ORIku9J00IZ4RpvV40XZlJMPbjIliV1ynOSFjB2UaRj9WEFko3wbS4XQe8TFAeTOo87MTBrPoOk1M+OcUtnCElkLKGQGxSFzp90XT3wdnR0mrFBFlMMiMRG5ewM=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=he/H2uyx; arc=none smtp.client-ip=100.103.45.18
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="he/H2uyx"
Received: by smtp.kernel.org (Postfix) with ESMTPSA id A69F41F000E9;
	Wed, 29 Jul 2026 01:10:37 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kernel.org;
	s=k20260515; t=1785287438;
	bh=9HjQvjSUhFo3tVt4vU9LWNE7UomSesfGobd5FoHAkrY=;
	h=From:Subject:Reply-To:To:Cc:In-Reply-To:References:Date;
	b=he/H2uyxxaQNlwHAtJBCf0pgVqCJ2UPLCIx4dKPpCq1/uxb95es7uYn4ww4UJb827
	 Tm/XQ4d28ZOdzIg0GDnj1gXuTG0Yb6EZ1c+tN01LVZtKgLnQekoIlYqbR1WS3jVHGp
	 g0R/GrxIJSZilehbm3SIHfgnhZoRETrG7pO3WigQDwWsOWIGZ/EA7ob13QwBIhRbiW
	 r125fseon7mEuIgRMWQ8z6o7NTGw3M6A+ME1NuAUhz06ipOAxavzzz31FNwvRopTva
	 PFZYqtl0r8YxS5IIArMu1YuGXh1IM0b+h3mbnlqJxA6zGQms99QUSz1K8RRwdx4ILl
	 j+UHlX+oAj+cg==
From: sashiko-bot@kernel.org
Subject: Re: [PATCH v8 3/6] arm64: dts: qcom: Add device tree for Nord
 Embedded variant
Reply-To: sashiko-reviews@lists.linux.dev
To: "Shawn Guo" <shengchao.guo@oss.qualcomm.com>
Cc: robh@kernel.org, devicetree@vger.kernel.org, conor+dt@kernel.org
In-Reply-To: <20260729010022.875799-4-shengchao.guo@oss.qualcomm.com>
References: <20260729010022.875799-1-shengchao.guo@oss.qualcomm.com>
 <20260729010022.875799-4-shengchao.guo@oss.qualcomm.com>
Content-Type: text/plain; charset=utf-8
Content-Transfer-Encoding: quoted-printable
Date: Wed, 29 Jul 2026 01:10:37 +0000
Message-Id: <20260729011037.A69F41F000E9@smtp.kernel.org>
Precedence: bulk
X-Mailing-List: devicetree@vger.kernel.org
List-Id: <devicetree.vger.kernel.org>
List-Subscribe: <mailto:devicetree+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:devicetree+unsubscribe@vger.kernel.org>

Thank you for your contribution! Sashiko AI review found 1 potential issue(=
s) to consider:
- [Medium] Pin multiplexing conflicts due to copy-paste errors in QUP seria=
l engine pinctrl definitions.
--

--- Patch [3]: [PATCH v8 3/6] arm64: dts: qcom: Add device tree for Nord Em=
bedded variant ---
commit bf3ea50b3b635e297d8a3608bd66c8e13734144c
Author: Shawn Guo <shengchao.guo@oss.qualcomm.com>

arm64: dts: qcom: Add device tree for Nord Embedded variant

This commit adds a new device tree file for the Nord Embedded variant. It
defines platform resources like clocks, regulators, and pin control
configurations. It also describes how they wire up with existing components.

> diff --git a/arch/arm64/boot/dts/qcom/nord-embedded.dtsi b/arch/arm64/boo=
t/dts/qcom/nord-embedded.dtsi
> new file mode 100644
> index 0000000000000..032d384f6eb3e
> --- /dev/null
> +++ b/arch/arm64/boot/dts/qcom/nord-embedded.dtsi

[ ... ]

> +	qup_uart0_default: qup-uart0-default-state {
> +		pins =3D "gpio109", "gpio110";
> +		function =3D "qup0_se0";
> +		drive-strength =3D <2>;
> +		bias-disable;
> +	};
> +
> +	qup_uart1_default: qup-uart1-default-state {
> +		pins =3D "gpio109", "gpio110";
> +		function =3D "qup0_se1";

[Severity: Medium]
Does this code assign the same pins (gpio109, gpio110) to both SE0 and SE1?
If both are enabled, it looks like this will cause a pin control conflict
during driver probe.

[ ... ]

> +	qup_uart5_default: qup-uart5-default-state {
> +		pins =3D "gpio109", "gpio110";
> +		function =3D "qup0_se5";

[Severity: Medium]
Are gpio109 and gpio110 meant to be used for SE5 here? They appear to be
reused again from the SE0 and SE1 pin configurations above, which might lead
to a conflict.

[ ... ]

> +	qup_uart15_default: qup-uart15-default-state {
> +		pins =3D "gpio143", "gpio144";
> +		function =3D "qup2_se1";
> +		drive-strength =3D <2>;
> +		bias-disable;
> +	};

[ ... ]

> +	qup_uart18_default: qup-uart18-default-state {
> +		pins =3D "gpio143", "gpio144";
> +		function =3D "qup2_se4";

[Severity: Medium]
Is it intentional to reuse gpio143 and gpio144 for SE18? These same pins
were assigned to SE15 in qup_uart15_default, which could cause another
hardware mapping conflict.

--=20
Sashiko AI review =C2=B7 https://sashiko.dev/#/patchset/20260729010022.8757=
99-1-shengchao.guo@oss.qualcomm.com?part=3D3
