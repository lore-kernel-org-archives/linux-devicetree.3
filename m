Received: from smtp.kernel.org (aws-us-west-2-korg-mail-alma10-1.taild15c8.ts.net [100.103.45.18])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id DF4AE39656C
	for <devicetree@vger.kernel.org>; Mon,  6 Jul 2026 07:21:35 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=100.103.45.18
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1783322498; cv=none; b=IupT2Mxzb9CCBIQ/caJdIfnyTOD97UNnWRu11uL1IILDDi15MoG5gm70lSXsTz2xsYO8LxOapZYJt+QKR9bb9PFnRixV/gvciqpQVT4EcSB7Q8cmf3HOoQ1IfXYyewhOgMawlBsts7ENDlrZfWStYW1KDQnybJFvunxTAPQjhmM=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1783322498; c=relaxed/simple;
	bh=xjstjERXUgoWcCqs7D16Glo95PwMBc3Qs8ZDWbSkg14=;
	h=From:Subject:To:Cc:In-Reply-To:References:Content-Type:Date:
	 Message-Id; b=LULGBbUuoo96slPI13+U5+Gc6BzzpnKJCpT3XOg5xG9r5lKQ8C/Lr0gVbavO1Xc4GgNE/ZQ5ExPe3q+5MeDDFUq+bi55joTu+B/b4ZNVIGwQ7/T3prZhwD583zkZldpr4SkSFg05trIg05q45yIEwoSOcNndJZvvRMIDINNlcHU=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=TYtzTMVw; arc=none smtp.client-ip=100.103.45.18
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="TYtzTMVw"
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 965D31F000E9;
	Mon,  6 Jul 2026 07:21:29 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kernel.org;
	s=k20260515; t=1783322489;
	bh=KI7heArpRkFs5/c5bdp1+WoyxzchayCSUcQHrm8d54U=;
	h=From:Subject:Reply-To:To:Cc:In-Reply-To:References:Date;
	b=TYtzTMVwWlS3z+CMlvPgrINDrbEf/ZrOfxhB+v6rK3if/fTbFyXAbQ7bHFwmmrsSZ
	 pXdn7JZsT59AlM0CKlGAWb6DY/epxhpDSeqXjzluQcpmGWVhIw+KKl6ZG7t+903fTE
	 5k+R2+OdbKdBhFtfqST3e2WBwbqqqwDqo8im5ggPTAUswe6Nxg7kMCOgOuy71m7u8n
	 V8n0Bu9cgzln3vpWdWnr9dhkSHEUdpwHuIQvA0tgj7qV3Fpp3qXv3BZuUwz95/JxYg
	 9l6htkkdG37DLZVpg1IrYrB1f7KePPvNE+Mu1BY5HrecwbX4LTeSA3ubwnMv9+QQ9Y
	 3tRun2OrI7o4A==
From: sashiko-bot@kernel.org
Subject: Re: [PATCH] dtc: dt-check-style: Allow space-aligning indentation
 in DTS
Reply-To: sashiko-reviews@lists.linux.dev
To: "Krzysztof Kozlowski" <krzysztof.kozlowski@oss.qualcomm.com>
Cc: robh@kernel.org, devicetree@vger.kernel.org, conor+dt@kernel.org
In-Reply-To: <20260706071446.87669-2-krzysztof.kozlowski@oss.qualcomm.com>
References: <20260706071446.87669-2-krzysztof.kozlowski@oss.qualcomm.com>
Content-Type: text/plain; charset=utf-8
Content-Transfer-Encoding: quoted-printable
Date: Mon, 06 Jul 2026 07:21:29 +0000
Message-Id: <20260706072129.965D31F000E9@smtp.kernel.org>
Precedence: bulk
X-Mailing-List: devicetree@vger.kernel.org
List-Id: <devicetree.vger.kernel.org>
List-Subscribe: <mailto:devicetree+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:devicetree+unsubscribe@vger.kernel.org>

Thank you for your contribution! Sashiko AI review found 2 potential issue(=
s) to consider:
- [Low] The relaxed indentation check in `check_mixed_indent_chars` permits=
 the 'space before tab' anti-pattern.
- [Low] Docstring and rule registry description contradict the new code beh=
avior.
--

commit 097e3ef5e7d164bd1c9be0d6781e53f6f27aaa64
Author: Krzysztof Kozlowski <krzysztof.kozlowski@oss.qualcomm.com>
Subject: dtc: dt-check-style: Allow space-aligning indentation in DTS

This commit relaxes the DTS style checking to allow spaces after tabs in
indentation. This is intended to permit space-aligning for continued lines
of comments or list properties.

> diff --git a/scripts/dtc/dt-check-style b/scripts/dtc/dt-check-style
> index 2d5723d41ea39..6d02d045f92d1 100755
> --- a/scripts/dtc/dt-check-style
> +++ b/scripts/dtc/dt-check-style
> @@ -365,8 +365,13 @@ def check_mixed_indent_chars(ctx):

[Severity: Low]
Does the docstring for check_mixed_indent_chars() need to be updated?

The new implementation explicitly allows mixing spaces and tabs in DTS file=
s up
to 7 spaces, which contradicts the assertion in the docstring that they can
never be mixed on one line. This contradiction also applies to the rule
registry description further down in the file.

>              continue
>          if dl.linetype =3D=3D LineType.PREPROCESSOR:
>              continue
> -        if ' ' in dl.indent_str and '\t' in dl.indent_str:
> -            yield (dl.lineno, 'mixed tabs and spaces in indent')
> +        if ctx.indent_kind =3D=3D 'spaces':
> +            if ' ' in dl.indent_str and '\t' in dl.indent_str:
> +                yield (dl.lineno, 'mixed tabs and spaces in indent')
> +        else:
> +            # Spaces are used to align indentation in comments or contin=
ued lines
> +            if dl.indent_str.count(' ') > 7:

[Severity: Low]
Does this condition properly enforce the "spaces after tabs" intent mention=
ed
in the commit message?

By only checking if the total space count exceeds 7, the code appears to st=
ill
allow "space before tab" combinations, provided the total number of spaces =
is 7
or fewer. Could this lead to invalid indentation slipping through the style
checker?

> +                yield (dl.lineno, 'too many space characters in indent (=
more than 7)')
> =20
> =20
>  def detect_indent_unit(ctx):

--=20
Sashiko AI review =C2=B7 https://sashiko.dev/#/patchset/20260706071446.8766=
9-2-krzysztof.kozlowski@oss.qualcomm.com?part=3D1
