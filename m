Received: from smtp.kernel.org (aws-us-west-2-korg-mail-alma10-1.taild15c8.ts.net [100.103.45.18])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id E538D3EB0E7
	for <devicetree@vger.kernel.org>; Fri,  4 Sep 2026 12:23:13 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=100.103.45.18
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1788524595; cv=none; b=m/t0D0JN5eDGLUCFVxRZSAaumKcOfSxSF/vQ/q3LQPFO5nwuKjVLRZ4ZLsdWxs4sFChKLxMv/tBLZY/OfZBD/Ygm5CaT1r6rKhB0hel2tRMk+2pP5OLbdvrVtuxncZct7FnovNuovwLUBIziVYra2rzNb+CuoHI3R9xWxr4Dtv4=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1788524595; c=relaxed/simple;
	bh=LW9hQdd90Ss8LHsYVnBHmkouPj4pm6DuAQPO96vDSOk=;
	h=From:Subject:To:Cc:In-Reply-To:References:Content-Type:Date:
	 Message-Id; b=ZesA9NhO8TTl8gzF9W75OdlLqDm9JchVgaHYNxDGg8MKdJ7N13G9ttYKV6PDKHfR8LYwR0iFb0sEcuas2YviDidoopWwVHzfF8ZkzV9fBTeL/81pRvtMT9A/jmiXKDx2Vw3A3dC8SjXNyVoi07ch3EqGfQeJ3Y1y0/yePmCdq8Q=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=McjxdWyP; arc=none smtp.client-ip=100.103.45.18
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="McjxdWyP"
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 86F7B1F00A3D;
	Fri,  4 Sep 2026 12:23:13 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kernel.org;
	s=k20260515; t=1788524593;
	bh=wT/xDjh4zdlnFfBiDXc+fb8f8J/3LCl0diRxHjw2wus=;
	h=From:Subject:Reply-To:To:Cc:In-Reply-To:References:Date;
	b=McjxdWyPfPzGYYoyaioxyQxOWFBVYAlMcvkIAn8x1of+zQ5pWhsIb34aWDoy/0KhE
	 JCzVIZlLRcRkSt4JWdl8jBnqTQJ/QAP5G1Xvt+hBrtv9WHoQ0f5HFsR2qU5hWMevFc
	 zN39rDvI5jlQuXQvf5hi7Kq7dD5fPJxytp2eag+RqHje8MyqRR5F3yrszd6jOB2lN5
	 p2XwqeewuSZXR28HJeYAcNdBxmnhrTfiza72WrrLNHdIMOpR1/O+Y+xfQZ/tV8E7To
	 1HRXjEi2uBcuhhSgIehgVcHjbTmdQ6hPE/+2OtNCu6fC4P5Ut5aVsZrsFv0fj6YG4w
	 WsUJh3LxaLf4A==
From: sashiko-bot@kernel.org
Subject: Re: [PATCH v3 1/2] dt-bindings: pinctrl: qcom: Add MSM8952 pinctrl
Reply-To: sashiko-reviews@lists.linux.dev
To: "Muzaffer Kadir" <muzafferkadir@mainlining.org>
Cc: devicetree@vger.kernel.org, robh@kernel.org, conor+dt@kernel.org
In-Reply-To: <20260904-msm8952-pinctrl-v3-1-110515fff513@mainlining.org>
References: <20260904-msm8952-pinctrl-v3-0-110515fff513@mainlining.org>
 <20260904-msm8952-pinctrl-v3-1-110515fff513@mainlining.org>
Content-Type: text/plain; charset=utf-8
Content-Transfer-Encoding: quoted-printable
Date: Fri, 04 Sep 2026 12:23:13 +0000
Message-Id: <20260904122313.86F7B1F00A3D@smtp.kernel.org>
Precedence: bulk
X-Mailing-List: devicetree@vger.kernel.org
List-Id: <devicetree.vger.kernel.org>
List-Subscribe: <mailto:devicetree+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:devicetree+unsubscribe@vger.kernel.org>

Thank you for your contribution! Sashiko AI review found 1 potential issue(=
s) to consider:
- [Low] Inconsistent GPIO pin count constraints and off-by-one error in pin=
s regex.
--

commit ef5e44784233c9aad2c47ecf25b2914eec5fa936
Author: Muzaffer Kadir <muzafferkadir@mainlining.org>

dt-bindings: pinctrl: qcom: Add MSM8952 pinctrl

This commit adds device tree bindings for the TLMM pin controller
found on the Qualcomm MSM8952 platform.

> diff --git a/Documentation/devicetree/bindings/pinctrl/qcom,msm8952-pinct=
rl.yaml b/Documentation/devicetree/bindings/pinctrl/qcom,msm8952-pinctrl.ya=
ml
> new file mode 100644
> --- /dev/null
> +++ b/Documentation/devicetree/bindings/pinctrl/qcom,msm8952-pinctrl.yaml
[ ... ]
> +properties:
> +  compatible:
> +    const: qcom,msm8952-pinctrl
> +
> +  reg:
> +    maxItems: 1
> +
> +  interrupts:
> +    maxItems: 1
> +
> +  gpio-reserved-ranges:
> +    minItems: 1
> +    maxItems: 61

[Severity: Low]
Should maxItems for gpio-reserved-ranges be 67 instead of 61?

The MSM8952 has 134 pins, meaning there can be up to 67 reserved ranges. The
limit of 61 appears to be a leftover from a 122-pin part like the MSM8916.
This restricts the maximum number of items incorrectly and rejects valid
device trees that need to reserve more ranges up to the correct max of 67.

> +
> +  gpio-line-names:
> +    maxItems: 134

[ ... ]

> +    properties:
> +      pins:
> +        description:
> +          List of gpio pins affected by the properties specified in this
> +          subnode.
> +        items:
> +          oneOf:
> +            - pattern: "^gpio([0-9]|[1-9][0-9]|1[0-2][0-9]|13[0-4])$"

[Severity: Low]
Does this regex incorrectly allow "gpio134" to pass DT validation?

The regex matches up to 13[0-4], which includes "gpio134" (the 135th GPIO).
However, the gpio-line-names property above is correctly restricted to 134
items (indices 0 to 133).=20

Since the maximum valid GPIO index is 133, a device tree author specifying
"gpio134" in a configuration node will pass validation but fail at runtime.

--=20
Sashiko AI review =C2=B7 https://sashiko.dev/#/patchset/20260904-msm8952-pi=
nctrl-v3-0-110515fff513@mainlining.org?part=3D1
