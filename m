Received: from smtp.kernel.org (aws-us-west-2-korg-mail-alma10-1.taild15c8.ts.net [100.103.45.18])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 8DCD728373
	for <devicetree@vger.kernel.org>; Fri,  7 Aug 2026 07:12:56 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=100.103.45.18
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1786086777; cv=none; b=hR1tsM0cGPRy0Rp76/VRvUei+JQiTNSyt8SoCS0PmLG95vroy4xbPyUB67cBLt8A5dUstcyo69nT9ahmZLKX5ZXfV4T340gA+pko1ttiQgTmlOE7Vbf37QoM4k/0FE7+THs9lK31QstP8eDEbv87LWJ31bzQW0JJbfp15Zab3MQ=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1786086777; c=relaxed/simple;
	bh=9xBYko1heeoD5R7iy0OeFPb9/Df5ywCnkhuI51bXT7U=;
	h=From:Subject:To:Cc:In-Reply-To:References:Content-Type:Date:
	 Message-Id; b=rKeTYm9T6X6aNTN/Nep/eOPUy11mLCtQYxubK2Vfl2ERl95pvUDMSEtB7VbB7Bj+WkpoBb1nVfBmIlmULXltB5dq+8r+nX5Re33Ax1geMsL83UVNg/oAdjzzXYVnwkKehGC0Oibz6PEACGi5mogY1CaPp5EccHq93QY/iLmNSGk=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=JDsHU0T6; arc=none smtp.client-ip=100.103.45.18
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="JDsHU0T6"
Received: by smtp.kernel.org (Postfix) with ESMTPSA id F412A1F000E9;
	Fri,  7 Aug 2026 07:12:55 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kernel.org;
	s=k20260515; t=1786086776;
	bh=MpjPon9keJcWpRNKCnzXVsxp1f1ChqocxUPJhQ34xDw=;
	h=From:Subject:Reply-To:To:Cc:In-Reply-To:References:Date;
	b=JDsHU0T6NvEdz2E3MwndGgM9uHktJkdeFMvc3JZgkbb/Lp5gShWMA1ZdXlFjVINIf
	 gkn3mlaRj2N8FHIEFUFI/fG4O20WmrdLaFjTEK9SPs6C3UlFZD9spj4UWoNaJi/NmX
	 QbUG7hd9NLT9T+8FRfJ/nLapKDMwDnKazsCuLdIhRUcfapNqeu02VBcXFNjvwUK7kW
	 jvYXVGm+CWB3MU9qkXo/GH/dxkd81ui45qJNLHqrJ2ZgWWkQe1gE0BzCD7eOCS4i3M
	 uNHhNyGKVC46LRDBgGr+uoYDvgimsgGOzGmdIcqli7EUzktbmdbuE+nKrLy5yP2yhp
	 MU1lzntSIN7aQ==
From: sashiko-bot@kernel.org
Subject: Re: [PATCH v2 03/12] clk: divider: Introduce
 CLK_DIVIDER_EVEN_INTEGERS_NO_OFFSET flag
Reply-To: sashiko-reviews@lists.linux.dev
To: "Luo Jie" <jie.luo@oss.qualcomm.com>
Cc: conor+dt@kernel.org, devicetree@vger.kernel.org, robh@kernel.org
In-Reply-To: <20260806-qcom_ipq5210_cmnpll-v2-3-cce718b8ec17@oss.qualcomm.com>
References: <20260806-qcom_ipq5210_cmnpll-v2-0-cce718b8ec17@oss.qualcomm.com>
 <20260806-qcom_ipq5210_cmnpll-v2-3-cce718b8ec17@oss.qualcomm.com>
Content-Type: text/plain; charset=utf-8
Content-Transfer-Encoding: quoted-printable
Date: Fri, 07 Aug 2026 07:12:55 +0000
Message-Id: <20260807071255.F412A1F000E9@smtp.kernel.org>
Precedence: bulk
X-Mailing-List: devicetree@vger.kernel.org
List-Id: <devicetree.vger.kernel.org>
List-Subscribe: <mailto:devicetree+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:devicetree+unsubscribe@vger.kernel.org>

Thank you for your contribution! Sashiko AI review found 3 potential issue(=
s) to consider:

New issues:
- [High] divider_ro_determine_rate() incorrectly returns -EINVAL for zero d=
ivisors when CLK_DIVIDER_ALLOW_ZERO is set, breaking valid pass-through sta=
tes.

Pre-existing issues:
- [High] The pre-existing CLK_DIVIDER_EVEN_INTEGERS flag suffers from the e=
xact same odd-divisor truncation bug described in the commit, but was left =
unfixed.
- [High] _div_round_closest() triggers a division-by-zero panic when the re=
quested rate exceeds the parent rate.
--

--- Patch [3]: [PATCH v2 03/12] clk: divider: Introduce CLK_DIVIDER_EVEN_IN=
TEGERS_NO_OFFSET flag ---
commit 2989085a3446885e07078514557377e58a8cade1
Author: Luo Jie <jie.luo@oss.qualcomm.com>

clk: divider: Introduce CLK_DIVIDER_EVEN_INTEGERS_NO_OFFSET flag

This patch adds a new CLK_DIVIDER_EVEN_INTEGERS_NO_OFFSET flag for hardware
dividers that derive an even divisor directly from the raw register value=20
(2 * val). It updates the divisor conversion functions, extends validation=
=20
to reject odd divisors, and ensures rounding maps to even divisors to=20
prevent truncation errors.

> diff --git a/drivers/clk/clk-divider.c b/drivers/clk/clk-divider.c
> index b3b485d23ea85..f062d77ee106b 100644
> --- a/drivers/clk/clk-divider.c
> +++ b/drivers/clk/clk-divider.c

[ ... ]

> @@ -181,6 +187,8 @@ static bool _is_valid_div(const struct clk_div_table =
*table, unsigned int div,
>  {
>  	if (flags & CLK_DIVIDER_POWER_OF_TWO)
>  		return is_power_of_2(div);
> +	if (flags & CLK_DIVIDER_EVEN_INTEGERS_NO_OFFSET)
> +		return div >=3D 2 && !(div & 1);

[Severity: High]
This is a pre-existing issue, but since this patch aims to prevent odd
divisors from being silently decoded into the wrong even value for the new
flag, shouldn't the pre-existing CLK_DIVIDER_EVEN_INTEGERS flag also reject
odd divisors here?

If _is_valid_div() allows an odd divisor (like 3) for
CLK_DIVIDER_EVEN_INTEGERS, _get_val() will map it to 0, causing the
hardware to run at a potentially out-of-spec faster rate (parent / 2).

>  	if (table)
>  		return _is_valid_table_div(table, div);

[ ... ]

> @@ -230,6 +238,8 @@ static int _div_round_up(const struct clk_div_table *=
table,
> =20
>  	if (flags & CLK_DIVIDER_POWER_OF_TWO)
>  		div =3D __roundup_pow_of_two(div);
> +	else if (flags & CLK_DIVIDER_EVEN_INTEGERS_NO_OFFSET)
> +		div =3D max(2, (div + 1) & ~1);

[Severity: High]
This is a pre-existing issue, but does the original
CLK_DIVIDER_EVEN_INTEGERS flag also need this rounding logic to force even
integers?

>  	if (table)
>  		div =3D _round_up_table(table, div);

[ ... ]

> @@ -249,6 +259,9 @@ static int _div_round_closest(const struct clk_div_ta=
ble *table,
>  	if (flags & CLK_DIVIDER_POWER_OF_TWO) {
>  		up =3D __roundup_pow_of_two(up);
>  		down =3D __rounddown_pow_of_two(down);
> +	} else if (flags & CLK_DIVIDER_EVEN_INTEGERS_NO_OFFSET) {
> +		up =3D max(2, (up + 1) & ~1);
> +		down =3D max(2, down & ~1);
>  	} else if (table) {

[Severity: High]
This isn't a bug introduced by this patch, but can down evaluate to 0
here and cause a division-by-zero panic?

Looking earlier in _div_round_closest(), down is computed as:

    down =3D parent_rate / rate;

If a caller requests a rate strictly greater than parent_rate, down
evaluates to 0. When later passed to DIV_ROUND_UP_ULL() in this function:

    down_rate =3D DIV_ROUND_UP_ULL((u64)parent_rate, down);

Does this result in a kernel panic?

>  		up =3D _round_up_table(table, up);
>  		down =3D _round_down_table(table, down);

[ ... ]

> @@ -372,6 +387,13 @@ int divider_ro_determine_rate(struct clk_hw *hw, str=
uct clk_rate_request *req,
> =20
>  	div =3D _get_div(table, val, flags, width);
> =20
> +	if (!div) {
> +		WARN(!(flags & CLK_DIVIDER_ALLOW_ZERO),
> +			"%s: Zero divisor and CLK_DIVIDER_ALLOW_ZERO not set\n",
> +			clk_hw_get_name(hw));
> +		return -EINVAL;
> +	}
> +

[Severity: High]
Does this unconditionally return -EINVAL for a zero divisor, even when
CLK_DIVIDER_ALLOW_ZERO is set?

If the hardware register contains 0 and CLK_DIVIDER_ALLOW_ZERO is set
(which implies a pass-through clock), this correctly suppresses the
WARN, but still fails the rate determination by returning -EINVAL
instead of successfully propagating the parent rate.

>  	/* Even a read-only clock can propagate a rate change */
>  	if (clk_hw_get_flags(hw) & CLK_SET_RATE_PARENT) {
>  		if (!req->best_parent_hw)

--=20
Sashiko AI review =C2=B7 https://sashiko.dev/#/patchset/20260806-qcom_ipq52=
10_cmnpll-v2-0-cce718b8ec17@oss.qualcomm.com?part=3D3
