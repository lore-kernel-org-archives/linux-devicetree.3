Received: from smtp.kernel.org (aws-us-west-2-korg-mail-alma10-1.taild15c8.ts.net [100.103.45.18])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 7A3DC41F5E6
	for <devicetree@vger.kernel.org>; Tue, 28 Jul 2026 09:33:14 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=100.103.45.18
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1785231195; cv=none; b=Bn3kntccL+SUvitIUToZrrT/Cjpj+M16osTLW/vcymYOoWS6yojDtZthnQMxLKvh8r+WekmjlyOqdoYgqqRuWl+ewhvEhHjwtl5cBhJRBSRAk7cT4PV1jWJD6KxGD6DxczlFPxvm1cSydm2LyEHJ/9OD7MpPXMM40OZ/g9vebY8=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1785231195; c=relaxed/simple;
	bh=V3a3KdQL+jKRvMxBXC0C/ZvCqBo/JLxdghprJHotWgY=;
	h=From:Subject:To:Cc:In-Reply-To:References:Content-Type:Date:
	 Message-Id; b=WoL/+vHXxTt/ld9IR+Bwt7WvcqpD1ge9YLU9dDSEPLX4vMx5Tf1UL3usiufZBAMoh4qN+QDn4FXnWq96M4XL7+QGV6AQCw1Z2geHMCySLcJwdIPLXh9uKF+p8TEp5K27LlPJ9gV8i2sqT16ebA4rwKzTKuPwTEdgavaxUAt6e/0=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=BuRXv+nG; arc=none smtp.client-ip=100.103.45.18
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="BuRXv+nG"
Received: by smtp.kernel.org (Postfix) with ESMTPSA id C20F21F00A3F;
	Tue, 28 Jul 2026 09:33:13 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kernel.org;
	s=k20260515; t=1785231194;
	bh=4x3tOCKZlnms/uqkQUUsYBdF7GPV3oaCX9rn20gJsfM=;
	h=From:Subject:Reply-To:To:Cc:In-Reply-To:References:Date;
	b=BuRXv+nGbfrKo6ps/GWEPis4Y4Jy/tf4xNtxSomQscoz6KnRfjFj/OluBlUeugcWe
	 gy9YCmbJS4olM72yEjBDCb3aWZin8XFn8DsvqQacE4Vk7cW2xUx9Wj6BQMuRUDgDPF
	 SFOk2qMs4ChcOVe/UD9X/qo1xLnDd6T88I3wlL9OeIEKVDLQyR/vFnHjXhLaBlr8pz
	 AdpqIKIt5/MvbUo4M5ALv6zOw/+Q7Xls/pHa4S5kzczK+POR/juJvDAWwQesI2sC9Y
	 +EaUhCNkpzFeCHy/e+tcYGVubGrZ5NpXByJ6lIRL9nQ29cyLEWaQwrtcrnAiunGFyK
	 arV8FyHrCQI2w==
From: sashiko-bot@kernel.org
Subject: Re: [PATCH v2 1/7] dt-bindings: spmi: apple,spmi: Add t603x
Reply-To: sashiko-reviews@lists.linux.dev
To: "Sasha Finkelstein" <k@chaosmail.tech>
Cc: robh@kernel.org, conor+dt@kernel.org, devicetree@vger.kernel.org
In-Reply-To: <20260728-t603x-spmi-v2-1-f43e5f10e583@chaosmail.tech>
References: <20260728-t603x-spmi-v2-0-f43e5f10e583@chaosmail.tech>
 <20260728-t603x-spmi-v2-1-f43e5f10e583@chaosmail.tech>
Content-Type: text/plain; charset=utf-8
Content-Transfer-Encoding: quoted-printable
Date: Tue, 28 Jul 2026 09:33:13 +0000
Message-Id: <20260728093313.C20F21F00A3F@smtp.kernel.org>
Precedence: bulk
X-Mailing-List: devicetree@vger.kernel.org
List-Id: <devicetree.vger.kernel.org>
List-Subscribe: <mailto:devicetree+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:devicetree+unsubscribe@vger.kernel.org>

Thank you for your contribution! Sashiko AI review found 1 potential issue(=
s) to consider:
- [Medium] The binding introduces interrupt controller capabilities but fai=
ls to add `interrupt-controller` and `#interrupt-cells` to the `required` l=
ist, violating the dt-bindings subsystem guide.
--

--- Patch [1]: [PATCH v2 1/7] dt-bindings: spmi: apple,spmi: Add t603x ---
commit 3993abab519c4cf9121f6e121ee3a9b9ac214c43
Author: Sasha Finkelstein <k@chaosmail.tech>

dt-bindings: spmi: apple,spmi: Add t603x

This commit adds t603x compatibles, interrupt support, and support for
SPMI controllers that are not always-on.

> Keeping the "interrupt-controller" property as optional, as taking the
> j514c as an example, we only need this functionality on 3 out of 10
> SPMI controllers present on this SoC.

[Severity: Medium]
Device tree bindings are meant to describe hardware capabilities rather
than operating system usage.

If the hardware itself has interrupt controller capabilities, they should be
defined as required.

If only specific hardware instances possess this capability, they can be
enforced using an if/then conditional block instead of making the properties
globally optional.

Does keeping these properties optional here conflate operating system
usage with hardware capabilities?

> diff --git a/Documentation/devicetree/bindings/spmi/apple,spmi.yaml b/Doc=
umentation/devicetree/bindings/spmi/apple,spmi.yaml
> --- a/Documentation/devicetree/bindings/spmi/apple,spmi.yaml
> +++ b/Documentation/devicetree/bindings/spmi/apple,spmi.yaml

[ ... ]

> @@ -34,6 +36,18 @@ properties:
>    reg:
>      maxItems: 1
> =20
> +  interrupts:
> +    maxItems: 1
> +    description: Optional, operates in polled mode if not present
> +
> +  interrupt-controller: true
> +
> +  "#interrupt-cells":
> +    const: 2
> +
> +  power-domains:
> +    maxItems: 1
> +
>  required:
>    - compatible
>    - reg

[Severity: Medium]
The device tree binding guidelines specify that when a hardware variant adds
provider capabilities, the corresponding standard properties (in this case,
interrupt-controller and #interrupt-cells) must appear in the required list
with appropriate constraints.

Leaving them optional allows incomplete device tree nodes missing these
properties to silently pass schema validation, which can lead to runtime
driver failures.

Should interrupt-controller and #interrupt-cells be added to this required
list?

--=20
Sashiko AI review =C2=B7 https://sashiko.dev/#/patchset/20260728-t603x-spmi=
-v2-0-f43e5f10e583@chaosmail.tech?part=3D1
