Received: from smtp.kernel.org (aws-us-west-2-korg-mail-alma10-1.taild15c8.ts.net [100.103.45.18])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 22701379C33
	for <devicetree@vger.kernel.org>; Wed, 26 Aug 2026 10:34:00 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=100.103.45.18
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1787740442; cv=none; b=pkwkOtxL3636IZ/iEbogYQvljKmIwz9z73ip0mT+Y7HBuEl5jucIZoJjhxu+sBMVKD13Ul/lX9Kluehdl6sR1l2VOTNowoYg0JWwEsb8Cqus5C+NRhSBlgZwBwILyLmGsfknz5qx2GcZ/QehN9gDvqpmXzM42Sy38vVshNHI3v8=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1787740442; c=relaxed/simple;
	bh=9e4EfrsYTLzhHPjn/O6m4AUs8olNsWkY2YRKl8zcWH4=;
	h=From:Subject:To:Cc:In-Reply-To:References:Content-Type:Date:
	 Message-Id; b=pKJGGvIN4Ojpxq0nzeOi4q+kyA/2R7LYtm88pHkfbRMEPyfZirl7oKkSUUyWkrQn0jFoqOrkcnZ5tacAfsU3GV3+xi+aD+rYIli41oF3efaUG0mLPkiFlyPn2DDv52MmpILAUZXB95hfixaW0q9dMeZFXBzTu9Qh1SDL8w1l2Ic=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=Vtaj21Hh; arc=none smtp.client-ip=100.103.45.18
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="Vtaj21Hh"
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 74D2C1F00A3A;
	Wed, 26 Aug 2026 10:34:00 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kernel.org;
	s=k20260515; t=1787740440;
	bh=REUxp5goRw9NJV50Q6YH/+XzMtSei1XZIq6HDR7Kz0o=;
	h=From:Subject:Reply-To:To:Cc:In-Reply-To:References:Date;
	b=Vtaj21Hh02GwSUefu1tQNNEvNBMsD/2HR1ITT7Qf2AQpvFV/111I6t0EfnS/3FZF2
	 /sINLFMBOMpBkOYgxb66udK6uXT6xkt6UTA+OmWcJ74lz4O+EqjoAdrJsiwJ3UEz47
	 Myx3JMzf/0G9itXEcY3j4kGeLWO+KwoU2eaY54ry3Gyw2o8BMEheJBO7hOw7urclKo
	 7zBzspOoo6d37JxgkRta0Q6oDj7p4vfrsi/aQcIV86yw/ThL35oDPflTTAI0cpMPE1
	 WW4zGyXv7FQh2Trms8csVMvj3u+55LJj/AcrlObYUBuShUgOOePRrxdr5rG5y8znIN
	 /49JqF9WGd+iw==
From: sashiko-bot@kernel.org
Subject: Re: [PATCH v5 03/10] dtc: dt-check-style: Fix alignment of values
 in continued property lines
Reply-To: sashiko-reviews@lists.linux.dev
To: "Krzysztof Kozlowski" <krzysztof.kozlowski@oss.qualcomm.com>
Cc: conor+dt@kernel.org, robh@kernel.org, devicetree@vger.kernel.org
In-Reply-To: <20260826-n-dts-style-checker-continued-v5-3-fdd16ca6e771@oss.qualcomm.com>
References: <20260826-n-dts-style-checker-continued-v5-0-fdd16ca6e771@oss.qualcomm.com>
 <20260826-n-dts-style-checker-continued-v5-3-fdd16ca6e771@oss.qualcomm.com>
Content-Type: text/plain; charset=utf-8
Content-Transfer-Encoding: quoted-printable
Date: Wed, 26 Aug 2026 10:34:00 +0000
Message-Id: <20260826103400.74D2C1F00A3A@smtp.kernel.org>
Precedence: bulk
X-Mailing-List: devicetree@vger.kernel.org
List-Id: <devicetree.vger.kernel.org>
List-Subscribe: <mailto:devicetree+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:devicetree+unsubscribe@vger.kernel.org>

Thank you for your contribution! Sashiko AI review found 2 potential issue(=
s) to consider:
- [Medium] String index calculated from stripped string is used to slice th=
e unstripped string, causing incorrect column alignment if a comment preced=
es the first '<' or '"'. The `check_continuation_alignment` function uses `=
_strip_strings_and_comments` to strip comments from `rest`, reducing its le=
ngth. It then runs `re.search` on `rest` to find `<` or `"`. The resulting =
match index (`m.start(1)`) is then incorrectly used to slice the original u=
nstripped `dl.raw` string. If a block comment exists between `=3D` and the =
first value, the slice truncates prematurely, discarding the visual width o=
f the comment and resulting in a `target_col` that is too small.
- [Medium] Incomplete detection of closed values for space-separated arrays=
 and concatenated strings causes false positive alignment errors. The `chec=
k_continuation_alignment` function tracks whether a value block is closed u=
sing `endswith('",') or endswith('>,')`. This strict check assumes that com=
pleted values must end with a comma. In valid DTS, cell arrays or strings c=
an be concatenated across lines without commas (e.g., `ranges =3D <...>
<...>;` or `prop =3D "first"
"second";`). If a line ends with `>` or `"` without a comma, the block is c=
losed, but `dl_value_complete` incorrectly evaluates to `False`. The script=
 then unconditionally applies `target_offset =3D 1` to the subsequent line,=
 improperly demanding that the new `<...>` or string be indented one space =
to the right (aligned with inner values) rather than aligning with the lead=
ing `<` or `"`.
--

commit 3c5fcc59a610ff8a5dc6318a90c848ba441566f3
Author: Krzysztof Kozlowski <krzysztof.kozlowski@oss.qualcomm.com>

dtc: dt-check-style: Fix alignment of values in continued property lines

Continued lines in property assignments should be indented to opening
'<' or '"' if they also start with that character. If the continued line
is part of previous phandle, then alignment should be to inner values to
make it more readable.

> diff --git a/scripts/dtc/dt-check-style b/scripts/dtc/dt-check-style
> --- a/scripts/dtc/dt-check-style
> +++ b/scripts/dtc/dt-check-style
> @@ -938,17 +939,26 @@ def check_continuation_alignment(ctx):
>          eq =3D dl.raw.find('=3D')
>          if eq < 0:
>              continue
> -        # First '<' or '"' after '=3D'
> -        rest =3D dl.raw[eq + 1:]
> -        m =3D re.search(r'[<"]', rest)
> +        # First '<' or '"' after '=3D', but ignore comments and strip tr=
ailing
> +        # whitespace (e.g. remaining after removing the comment)
> +        rest =3D _strip_strings_and_comments(dl.raw[eq + 1:]).rstrip()
> +        m =3D re.search(r'\s*([<"])', rest)
>          if not m:
>              continue
> -        target_col =3D _display_col(dl.raw[:eq + 1 + m.start()])
> +        dl_value_complete =3D rest.endswith('",') or rest.endswith('>,')

[Severity: Medium]
Does this strict check correctly identify closed values in space-separated
arrays and concatenated strings?

In valid DTS, cell arrays or strings can be concatenated across lines witho=
ut
commas:

    ranges =3D <...>
             <...>;

If a line ends with a closing bracket or double quote without a comma, the
block is closed, but dl_value_complete will incorrectly evaluate to False h=
ere.

> +        target_col =3D _display_col(_strip_strings_and_comments(dl.raw[:=
eq + 1 + m.start(1)]))

[Severity: Medium]
Will this calculate the correct column alignment if a block comment exists
between the =3D and the first opening bracket or double quote?

Because rest is populated using _strip_strings_and_comments(), any block
comments are removed, shortening the string. Using m.start(1) from this
stripped string as an index to slice the unstripped dl.raw discards the
visual width of those block comments, resulting in a target_col that is
too small.

>          for cont in dl.continuations:
> -            if _display_col(cont.indent_str) !=3D target_col:
> +            target_offset =3D 0
> +            err_msg_explanation =3D 'to < or "'
> +            if not dl_value_complete:
> +                target_offset =3D 1
> +                err_msg_explanation =3D 'to the value under <'

[Severity: Medium]
Since dl_value_complete evaluates to False for comma-less concatenations as
noted above, doesn't this unconditionally apply target_offset =3D 1?

This would force developers to misalign their properly styled code by adding
an extra space, producing a false positive warning in the style checker.

> +            if _display_col(cont.indent_str) !=3D target_col + target_of=
fset:
>                  yield (cont.lineno,
>                         'continuation should align to column %d '
> -                       '(under < or ")' % (target_col + 1))
> +                       '(%s)' % (target_col + target_offset + 1, err_msg=
_explanation))
> +            # Align to the value within <> or "" of continuation (so the=
 previous line)
> +            dl_value_complete =3D cont.stripped.endswith('",') or cont.s=
tripped.endswith('>,')

[Severity: Medium]
This check appears to have the same flaw for updating the state on subseque=
nt
continuation lines when valid comma-less arrays or strings are used.

--=20
Sashiko AI review =C2=B7 https://sashiko.dev/#/patchset/20260826-n-dts-styl=
e-checker-continued-v5-0-fdd16ca6e771@oss.qualcomm.com?part=3D3
