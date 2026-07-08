Received: from smtp.kernel.org (aws-us-west-2-korg-mail-alma10-1.taild15c8.ts.net [100.103.45.18])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 4D133478869
	for <devicetree@vger.kernel.org>; Wed,  8 Jul 2026 14:50:05 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=100.103.45.18
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1783522207; cv=none; b=BjAxTbWy5eDUui1kgtPvteTz7L2vYlwvGwVp33mMRkrMBvao5ndYCS4hHSX/RTnOXskRBl1PMJcsp79hq2QeH6TGaa8kpGe0DGCL8ITOr9CWjB+OnCoKjeREsinOwub6hD7aWiXKv7sam6ruuRZSy2ofmLo2A4isnJzej3Sg0tQ=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1783522207; c=relaxed/simple;
	bh=tKikO0bSg47/jitw94DYQrY/Cn1s5w/tqQg0dlL9mRU=;
	h=From:Subject:To:Cc:In-Reply-To:References:Content-Type:Date:
	 Message-Id; b=dcWORvk2YofN1dysyomGJAywidj2shGmeTV5k/v55ZuUk1hb/OC3jx4Hn29EJ7CupUYt+M/PTaR82BVfOWlKaFkrcsaCIj8raVHZvNatgKKO/yCXK3+fXpauaSU3EWOqkcF5KZvKTDpHrFKfTKajsTKbtB7dWC0rB5kK3CvpmI0=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=XBVfqp86; arc=none smtp.client-ip=100.103.45.18
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="XBVfqp86"
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 5B69A1F000E9;
	Wed,  8 Jul 2026 14:50:05 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kernel.org;
	s=k20260515; t=1783522205;
	bh=bG3yXgiC4pqNteP1dm3BJT74ixUUew1YH/EhTXISUyw=;
	h=From:Subject:Reply-To:To:Cc:In-Reply-To:References:Date;
	b=XBVfqp86G/zbAgwoc/XnfbfxRBIilOZzUz7GqY5T+n4WNoNejABa/45U5QS14PT0i
	 E3DwJYtUIR8Se0bjB7jK4eFYkcnnkZ/v6NvfB/giNDby35dF3dfdtHWsGofu0J9lfu
	 /TvnzmIXOIe4TS22IByBfDcHi3li5Dxe/Zh3f2mefmxOzlAT8lQqIv+2Rviahe7x1d
	 e6alUAcB3XlANQopzl4oeaHTF4zqVLBMMDsiCeHyUDNS1RyPtzxEXrxJC3/qXOUQPC
	 Uu4xdIBooHSlEFBGTvDWTcVLHoxy0eiBABqWliEx3uLbqd7WwZWjBJWNeW4qKlVjRv
	 4t83KZN95uJxA==
From: sashiko-bot@kernel.org
Subject: Re: [PATCH v4 2/7] dtc: dt-check-style: Allow space-aligning
 indentation in DTS
Reply-To: sashiko-reviews@lists.linux.dev
To: "Krzysztof Kozlowski" <krzysztof.kozlowski@oss.qualcomm.com>
Cc: devicetree@vger.kernel.org, conor+dt@kernel.org, robh@kernel.org
In-Reply-To: <20260708-dts-style-checker-v4-2-c175e6401150@oss.qualcomm.com>
References: <20260708-dts-style-checker-v4-0-c175e6401150@oss.qualcomm.com>
 <20260708-dts-style-checker-v4-2-c175e6401150@oss.qualcomm.com>
Content-Type: text/plain; charset=utf-8
Content-Transfer-Encoding: quoted-printable
Date: Wed, 08 Jul 2026 14:50:04 +0000
Message-Id: <20260708145005.5B69A1F000E9@smtp.kernel.org>
Precedence: bulk
X-Mailing-List: devicetree@vger.kernel.org
List-Id: <devicetree.vger.kernel.org>
List-Subscribe: <mailto:devicetree+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:devicetree+unsubscribe@vger.kernel.org>

Thank you for your contribution! Sashiko AI review found 1 potential issue(=
s) to consider:
- [Medium] The `check_mixed_indent_chars` rule silently bypasses property c=
ontinuation lines, rendering its newly added space-limit validation ineffec=
tive for list properties and undermining the patch's stated goal.
--

--- Patch [2]: [PATCH v4 2/7] dtc: dt-check-style: Allow space-aligning ind=
entation in DTS ---
commit 7913e7da3c58b0a74f8737f725c2117139d9183f
Author: Krzysztof Kozlowski <krzysztof.kozlowski@oss.qualcomm.com>

dtc: dt-check-style: Allow space-aligning indentation in DTS

This commit relaxes the mixed indent check in dt-check-style to allow=20
space-aligning indentation in DTS files for comments or continued lines.=20
It replaces the strict mixed-indent rule with checks for space-followed-by-=
tab=20
and excessive space counts (more than 7).

v2: https://lore.kernel.org/r/20260706102421.343639-4-krzysztof.kozlowski@o=
ss.qualcomm.com/
v1: https://lore.kernel.org/r/20260706071446.87669-2-krzysztof.kozlowski@os=
s.qualcomm.com/

> diff --git a/scripts/dtc/dt-check-style b/scripts/dtc/dt-check-style
> index 29b25ecf15c66..5d7765f35ecbc 100755
> --- a/scripts/dtc/dt-check-style
> +++ b/scripts/dtc/dt-check-style
> @@ -359,14 +359,17 @@ def check_tab_in_yaml_example(ctx):
> =20
> =20
>  def check_mixed_indent_chars(ctx):
> -    """Indent must be all-spaces or all-tabs, never mixed on one line."""
> +    """Indent must be all-tabs, except for aligning indentation (comments
> +    or continued lines)."""
>      for dl in ctx.lines:

[Severity: Medium]
Does this loop miss checking property continuation lines?

By iterating only over ctx.lines, it appears to skip evaluating=20
dl.continuations where property continuations are stored. This prevents the=
=20
newly added space-limit validation from executing for list properties, whic=
h=20
the rule explicitly claims to check in the docstring.

>          if not dl.indent_str:
>              continue
>          if dl.linetype =3D=3D LineType.PREPROCESSOR:
>              continue
> -        if ' ' in dl.indent_str and '\t' in dl.indent_str:
> +        if re.search(r' \t', dl.indent_str):
>              yield (dl.lineno, 'mixed tabs and spaces in indent')
> +        if dl.indent_str.count(' ') > 7:
> +            yield (dl.lineno, 'too many space characters in indent (more=
 than 7)')

[ ... ]

> diff --git a/scripts/dtc/dt-style-selftest/bad/dts-mixed-indent.dts b/scr=
ipts/dtc/dt-style-selftest/bad/dts-mixed-indent.dts
> new file mode 100644
> index 0000000000000..f0e40cfc910c7
> --- /dev/null
> +++ b/scripts/dtc/dt-style-selftest/bad/dts-mixed-indent.dts
> @@ -0,0 +1,20 @@

[ ... ]

> +		clocks =3D <1>,
> +			 <2>,
> +		         <3>;

[Severity: Medium]
As a consequence of skipping continuations above, does this line evade the
"more than 7 spaces" check?

This line contains 9 spaces of indentation before the `<3>;`, but because i=
t=20
is a property continuation, the tool does not yield the expected warning.

--=20
Sashiko AI review =C2=B7 https://sashiko.dev/#/patchset/20260708-dts-style-=
checker-v4-0-c175e6401150@oss.qualcomm.com?part=3D2
