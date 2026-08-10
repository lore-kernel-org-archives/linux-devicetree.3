Received: from smtp.kernel.org (aws-us-west-2-korg-mail-alma10-1.taild15c8.ts.net [100.103.45.18])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 21AE13BD63B
	for <devicetree@vger.kernel.org>; Mon, 10 Aug 2026 14:39:21 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=100.103.45.18
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1786372762; cv=none; b=c/hqf/8Mp5RmxG4Ws8c2trvnvHalZro1NJsB5siXppUUOJ2HRmBa1g1ULlvK3x5rrNpZuBTU+jQBYEIDts4C4A+KjQ+htXdLC9xhZRWMO4EHym1cxYKjH6SdEMLsmKzzbMsu2+cSaQu0f0sFDrRr2195k318uAisajOO7BSgqls=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1786372762; c=relaxed/simple;
	bh=+MLM+65Gz+a9CgKuMoKgY+3lxh7e9Rzfkj7HidHEJt8=;
	h=From:Subject:To:Cc:In-Reply-To:References:Content-Type:Date:
	 Message-Id; b=Yr0KWCS2E/UAmUv3qV9qi8oD6IWMMnxdONpK/SAOaZg2XMd5g0HkcQ+kUtfe75XaaJ9jQrIbGhN2WtX7k3yS+5U7ryaPCzhAVUkuVKOV1FJY98vyfcHWXm4Y64/VqLbSIVMMdLp4pJ4gGjIkANmQ4MRo69596A+fPzvEenblvXY=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=mNG+Tl4c; arc=none smtp.client-ip=100.103.45.18
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="mNG+Tl4c"
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 9D0D41F000E9;
	Mon, 10 Aug 2026 14:39:20 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kernel.org;
	s=k20260515; t=1786372761;
	bh=IjvRqYzCj0ge6oeW5rgR9qhqlWgpLMJAXLwA/2S/gb4=;
	h=From:Subject:Reply-To:To:Cc:In-Reply-To:References:Date;
	b=mNG+Tl4c1S/CyuUFkiIw9nPQ1BQjb073yJ+L1S6GPoNDuBZbN8Wc9h4aFjABFMA3f
	 9bi2UDmPSpQTcsDJoVyZFbMK9SppiccmE8I33zfqlFGI3JfP+9F/PNH7e7W6oRhQ6y
	 xWjXEbefHvHUlC3NovNLS05LjL/DAAP1nUm+r8j5KDxvfRQV5Pl4c3pEwCz+2mVpKo
	 UeCHDWzSBGFXumTaTl8g/pwNdLEIrgo2ZVHJf8vjP2XdzPxcmOv0SSDdXN9CuUe2GO
	 W8a+5uwfN19P0bWntbLJkSew5nxDsBqFXLOLWBozSpbWTPka1RKQLNMVPvOW2RWF7M
	 upPQkLGVWqz0w==
From: sashiko-bot@kernel.org
Subject: Re: [PATCH 1/2] dt-bindings: devfreq: Document support for Airoha
 Subsystem devfreq
Reply-To: sashiko-reviews@lists.linux.dev
To: "Christian Marangi" <ansuelsmth@gmail.com>
Cc: conor+dt@kernel.org, robh@kernel.org, devicetree@vger.kernel.org
In-Reply-To: <20260810143057.651478-1-ansuelsmth@gmail.com>
References: <20260810143057.651478-1-ansuelsmth@gmail.com>
Content-Type: text/plain; charset=utf-8
Content-Transfer-Encoding: quoted-printable
Date: Mon, 10 Aug 2026 14:39:20 +0000
Message-Id: <20260810143920.9D0D41F000E9@smtp.kernel.org>
Precedence: bulk
X-Mailing-List: devicetree@vger.kernel.org
List-Id: <devicetree.vger.kernel.org>
List-Subscribe: <mailto:devicetree+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:devicetree+unsubscribe@vger.kernel.org>

Thank you for your contribution! Sashiko AI review found 3 potential issue(=
s) to consider:
- [Medium] The compatible string `airoha,devfreq` is overly generic and lac=
ks an SoC-specific identifier.
- [Medium] The binding introduces purely virtual nodes with OS-specific nam=
es (`*-devfreq`) instead of describing the actual hardware topology.
- [Low] Typos and grammatical errors in the binding description.
--

--- Patch [1]: [PATCH 1/2] dt-bindings: devfreq: Document support for Airoh=
a Subsystem devfreq ---
commit 372abcdd0c5df2cbcf3b1b6f064f1949fb955f9d
Author: Christian Marangi <ansuelsmth@gmail.com>

dt-bindings: devfreq: Document support for Airoha Subsystem devfreq

This commit documents the devicetree bindings for Airoha SoC subsystems
that scale to specific operating performance points (OPP) based on CPU
clock reference.

> diff --git a/Documentation/devicetree/bindings/devfreq/airoha,devfreq.yam=
l b/Documentation/devicetree/bindings/devfreq/airoha,devfreq.yaml
> new file mode 100644
> index 0000000000000..2f84486cb2096
> --- /dev/null
> +++ b/Documentation/devicetree/bindings/devfreq/airoha,devfreq.yaml
> @@ -0,0 +1,114 @@
[ ... ]
> +description:
> +  Airoha SoC contains multiple subsystem that are scaled to a
> +  specific OPP taking the CPU clock as reference. Such sybsystem
> +  can enter idle or performance state based on the system load
> +  and power consumption conditions.
> +
> +  Example of such subsystem are GSW (Gigabit Switch), NPU (Custom

[Severity: Low]
This isn't a bug, but there are a few typos in this description. Should
"multiple subsystem" and "Example of such subsystem" be plural? Also,
"sybsystem" appears to be misspelled.

> +  Risc Co-Processor for Network acceleration), SOE (Crypto Module) BUS...
> +
> +properties:
> +  compatible:
> +    const: airoha,devfreq

[Severity: Medium]
Will using a generic module string like airoha,devfreq prevent the OS from
distinguishing between hardware variants on future Airoha SoCs? Devicetree
best practices typically mandate SoC-specific compatible strings, such as
airoha,en7523-devfreq, to cleanly handle future hardware variations or quir=
ks
without breaking the DT ABI.

[ ... ]
> +examples:
> +  - |
> +    #include <dt-bindings/clock/en7523-clk.h>
[ ... ]
> +    npu-devfreq {
> +        compatible =3D "airoha,devfreq";
> +        operating-points-v2 =3D <&npu_opp_table>;
> +        clocks =3D <&scuclk EN7523_CLK_NPU>;
> +    };
> +
> +    emi-devfreq {
> +        compatible =3D "airoha,devfreq";
> +        operating-points-v2 =3D <&emi_opp_table>;
> +        clocks =3D <&scuclk EN7523_CLK_EMI>;
> +    };

[Severity: Medium]
Do these example nodes describe Linux driver frameworks rather than the act=
ual
hardware topology?=20

Since devicetree is meant to describe hardware, it appears these virtual no=
des
lack hardware resources like reg properties and use Linux subsystem termino=
logy
(devfreq) in their names purely to bind a Linux driver. Should the clocks a=
nd
OPP tables be defined directly within the hardware device nodes they scale,
such as the NPU, EMI, or GSW nodes?

--=20
Sashiko AI review =C2=B7 https://sashiko.dev/#/patchset/20260810143057.6514=
78-1-ansuelsmth@gmail.com?part=3D1
