Received: from smtp.kernel.org (aws-us-west-2-korg-mail-alma10-1.taild15c8.ts.net [100.103.45.18])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id BF56E3803D1
	for <devicetree@vger.kernel.org>; Fri, 17 Jul 2026 18:23:09 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=100.103.45.18
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1784312592; cv=none; b=KpSdQmGbY/cVEndiD6ig2VgueViNwfAY6/gLJwquruj7GVqzF0ZhP8fxjkAwd8cFQUyUatYE6+CK9+nCRKo5gtwGVJjwzXS7NzZlO2sf352SLzo1G9DgcBbR7eCOVTWp4jE0L4TU/YfkOGCC4zVB+jcpCVnD6rCThyHJIksoTIg=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1784312592; c=relaxed/simple;
	bh=KJRmlR/74YAPxriQmno1CFE0I9N3j9YOsr5gPE14nQM=;
	h=From:Subject:To:Cc:In-Reply-To:References:Content-Type:Date:
	 Message-Id; b=Aq2LLNecMsQbSjR2oSodLk+CU1VNR8fSakhTYK8Zp9GJFdqI+iKjig/GpPHlqWaFoLiKJS3qk37lQNVHvOvP8HGx5+XlMojLcitglWZPgg1sn+wXY51x3FxcJ/JmRtOQyGRzutN8hl1sTVoE/bLLmJxJhc+4z3rwZedQ7Y+visw=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=jOjw5W2P; arc=none smtp.client-ip=100.103.45.18
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="jOjw5W2P"
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 025B31F00A3D;
	Fri, 17 Jul 2026 18:23:08 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kernel.org;
	s=k20260515; t=1784312589;
	bh=7vCCb9P46IthhXkM81luzLkzU+aDU0qBoRqmNW6H1dg=;
	h=From:Subject:Reply-To:To:Cc:In-Reply-To:References:Date;
	b=jOjw5W2PgIQKkXyx5VTobgcyUa5xYQg0y764ycLpaT6rI8Owmv2otcJrPBhlP0FK3
	 HpflJyidcAbouDzMTDxK+gmyl8L9ZhSaPysStFRAXr20xIzAgR9BbJSNG7SFhYeI+f
	 eExeDzlICUNjKP97zDg5BVFvicUdUlpSEJLCOw7dtuivi550nXh3JYE09IT7JO6gzr
	 hCa2u7BtLfuey2UazHpSX8PtzVvsdg7D035bBCiA3p3O64t2bIx45BKfKgO+wXeTHL
	 qFfsYuqgaOKPjd6jy9rSkmv0RVWL+JaOotUvfUTnioF77Fl3xvtMDf4XTiKbL96rPM
	 VxWDK3K1803Tg==
From: sashiko-bot@kernel.org
Subject: Re: [PATCH] dt-bindings: clock: ti,dm816-fapll-clock: Convert to DT
 schema
Reply-To: sashiko-reviews@lists.linux.dev
To: "Bhargav Joshi" <j.bhargav.u@gmail.com>
Cc: devicetree@vger.kernel.org, conor+dt@kernel.org, robh@kernel.org
In-Reply-To: <20260717-ti-fapll-clock-v1-1-1b684cb2543b@gmail.com>
References: <20260717-ti-fapll-clock-v1-1-1b684cb2543b@gmail.com>
Content-Type: text/plain; charset=utf-8
Content-Transfer-Encoding: quoted-printable
Date: Fri, 17 Jul 2026 18:23:08 +0000
Message-Id: <20260717182309.025B31F00A3D@smtp.kernel.org>
Precedence: bulk
X-Mailing-List: devicetree@vger.kernel.org
List-Id: <devicetree.vger.kernel.org>
List-Subscribe: <mailto:devicetree+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:devicetree+unsubscribe@vger.kernel.org>

Thank you for your contribution! Sashiko AI review found 2 potential issue(=
s) to consider:

Pre-existing issues:
- [Critical] Operator precedence bug causes an undersized array allocation =
leading to an out-of-bounds write
- [High] Incorrect array bounds tracking breaks clock lookup for sparse clo=
ck configurations
--

--- Patch [1]: [PATCH] dt-bindings: clock: ti,dm816-fapll-clock: Convert to=
 DT schema ---
commit 87daba9f6927df76d909d0fe50168fefb82110f5
Author: Bhargav Joshi <j.bhargav.u@gmail.com>

dt-bindings: clock: ti,dm816-fapll-clock: Convert to DT schema

Convert the Texas Instruments DM816 FAPLL clock binding from plain text
to YAML DT schema. The schema now strictly enforces #clock-cells =3D <1>,
and adds clock-indices and clock-output-names as required properties.

> diff --git a/Documentation/devicetree/bindings/clock/ti/ti,dm816-fapll-cl=
ock.yaml b/Documentation/devicetree/bindings/clock/ti/ti,dm816-fapll-clock.=
yaml
> new file mode 100644
> index 0000000000000..9b6b824faa305
> --- /dev/null
> +++ b/Documentation/devicetree/bindings/clock/ti/ti,dm816-fapll-clock.yaml
[ ... ]
> +  clock-indices:
> +    description:
> +      Maps child synthesizers to physical indices 1-7. Index 0 is physic=
ally
> +      reserved for the Master PLL.
> +    minItems: 1
> +    maxItems: 7
> +    items:
> +      minimum: 1
> +      maximum: 7

[Severity: Critical]
This is a pre-existing issue, but by officially documenting 7 as the maximum
index, this binding exposes an out-of-bounds write in the driver.

In the driver code:

drivers/clk/ti/fapll.c:ti_fapll_setup() {
    ...
        fd->outputs.clks =3D kzalloc(sizeof(struct clk *) *
                                   MAX_FAPLL_OUTPUTS + 1,
                                   GFP_KERNEL);
    ...
}

Due to C operator precedence, this evaluates to (8 * 7) + 1 =3D 57 bytes on
64-bit architectures, rather than the intended 8 * (7 + 1) =3D 64 bytes.

If a device tree uses a clock index of 7 (the maximum allowed, as demonstra=
ted
in the DT bindings example), the driver writes to fd->outputs.clks[7]. This
pointer write covers bytes 56 through 63, overflowing the 57-byte allocatio=
n by
7 bytes, which can cause memory corruption and a KASAN splat.

Could we fix the operator precedence in the driver by adding parentheses ar=
ound
MAX_FAPLL_OUTPUTS + 1?

[Severity: High]
This isn't a bug introduced by this patch, but there's a pre-existing issue=
 in
how the driver handles the sparse indices allowed by this binding.

drivers/clk/ti/fapll.c:ti_fapll_setup() {
    ...
        fd->outputs.clks[output_instance] =3D synth_clk;
        fd->outputs.clk_num++;
    ...
}

If the device tree specifies sparse indices (e.g., <1> and <5>), clk_num is
incremented to 3 instead of tracking the maximum index + 1.

When of_clk_src_onecell_get() performs a lookup for index 5, it checks
if (idx >=3D clk_data->clk_num) (i.e., 5 >=3D 3), which incorrectly rejects=
 the
valid lookup and returns -EINVAL.

Can the driver be updated to set clk_num to the maximum index + 1 instead of
just counting the number of registered clocks?

--=20
Sashiko AI review =C2=B7 https://sashiko.dev/#/patchset/20260717-ti-fapll-c=
lock-v1-1-1b684cb2543b@gmail.com?part=3D1
