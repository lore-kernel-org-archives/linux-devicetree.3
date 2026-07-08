Received: from smtp.kernel.org (aws-us-west-2-korg-mail-alma10-1.taild15c8.ts.net [100.103.45.18])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id B6E4F274FDF
	for <devicetree@vger.kernel.org>; Wed,  8 Jul 2026 14:54:54 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=100.103.45.18
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1783522495; cv=none; b=hh1OioBH5SIinOZBy7qW1knan2Ynfsk8t3kWd+q0zF0tOjHh+Yi7CMx8cGgaUCMFS4PPDZeQ4/RGUGGwAYO6EYl5W6OYeA69o4mHHsdXXpdkFf0QDZdrJpig4TedM35/F8VryuxgakmUgb7MdXKaaVuZb1wRtXg/WY9q3oG6vU8=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1783522495; c=relaxed/simple;
	bh=kBOjahIJTBpdEWRT+hMOb62jMSWTPna0AkHUuw+iFuI=;
	h=From:Subject:To:Cc:In-Reply-To:References:Content-Type:Date:
	 Message-Id; b=SBfg1xTORWu7fkJdCaUJK0COYQsPV9I7tLc9AuRHowBCIa4l1Ej67llpA34weqDesUR7h8saRCPzeKyg6DNDLUMpYz9a8Pc0p3Ex0eiGDB3iAtc0AOiqcfclpHpPwbvyP9bXORYxeasTH2IS+Od1iDmi70og7quv3TlP5wdzvVw=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=dElyPSgT; arc=none smtp.client-ip=100.103.45.18
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="dElyPSgT"
Received: by smtp.kernel.org (Postfix) with ESMTPSA id E9AF91F000E9;
	Wed,  8 Jul 2026 14:54:52 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kernel.org;
	s=k20260515; t=1783522494;
	bh=Vr6JW8bM74XdeYYaBKjyN13pudKMM2d3UPOhnULFxN8=;
	h=From:Subject:Reply-To:To:Cc:In-Reply-To:References:Date;
	b=dElyPSgThvLGsntSvGUAYT99zOnyRbGZRD4VsnJiuhkyvPHQuDPIKVfZh3nudKQA3
	 syomEKUgP/ev9Dm0ukSj3cOJyHTUy8q7PFsldj9hZnLvcVrzG3pMbucQV8t4NVUGWk
	 5HVc+2nxIChD8d9xMIpwuLE3D0JEjIAAzm6DYX5XwegJDfAUvJ1ytOXk39aDwb7zyU
	 xt+0CsT4eoBxosDmPWXZl9kBibwkQkh+Vvk4tMbL82i/uY80/iXQA9yhAfZDLwJxuC
	 oJUInHt2WbNqkDqJ4HKhULbsQJ3QHsklkXrmwO0iMhrbygpQqc/I56DxQQ/0aQ9bJw
	 JvpAwS304OdYA==
From: sashiko-bot@kernel.org
Subject: Re: [PATCH v4 6/7] dtc: dt-check-style: Print proper line number of
 indentation detection place
Reply-To: sashiko-reviews@lists.linux.dev
To: "Krzysztof Kozlowski" <krzysztof.kozlowski@oss.qualcomm.com>
Cc: conor+dt@kernel.org, robh@kernel.org, devicetree@vger.kernel.org
In-Reply-To: <20260708-dts-style-checker-v4-6-c175e6401150@oss.qualcomm.com>
References: <20260708-dts-style-checker-v4-0-c175e6401150@oss.qualcomm.com>
 <20260708-dts-style-checker-v4-6-c175e6401150@oss.qualcomm.com>
Content-Type: text/plain; charset=utf-8
Content-Transfer-Encoding: quoted-printable
Date: Wed, 08 Jul 2026 14:54:52 +0000
Message-Id: <20260708145452.E9AF91F000E9@smtp.kernel.org>
Precedence: bulk
X-Mailing-List: devicetree@vger.kernel.org
List-Id: <devicetree.vger.kernel.org>
List-Subscribe: <mailto:devicetree+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:devicetree+unsubscribe@vger.kernel.org>

Thank you for your contribution! Sashiko AI review found 2 potential issue(=
s) to consider:
- [Low] Outdated docstring for detect_indent_unit()
- [Low] Unused variable `lineno` in `check_indent_consistent()`
--

--- Patch [6]: [PATCH v4 6/7] dtc: dt-check-style: Print proper line number=
 of indentation detection place ---
commit 0faea90fe4385d4895b11cc94353072a1a5f9347
Author: Krzysztof Kozlowski <krzysztof.kozlowski@oss.qualcomm.com>

dtc: dt-check-style: Print proper line number of indentation detection place

Script judges the indentation however always suggests it is the first
line which is wrong, e.g.:

  sigmastar/mstar-infinity2m.dtsi:1: [indent-unit-dts] indent unit must be =
1 tab in DTS, got '\t\t'

> diff --git a/scripts/dtc/dt-check-style b/scripts/dtc/dt-check-style
> index 9a5263a30663f..df056e4d0a5b5 100755
> --- a/scripts/dtc/dt-check-style
> +++ b/scripts/dtc/dt-check-style
> @@ -397,48 +397,48 @@ def detect_indent_unit(ctx):
>          if not dl.indent_str:
>              continue
>          if dl.indent_str =3D=3D '\t':
> -            return '\t'
> +            return ('\t', dl.lineno)

[Severity: Low]
Is there a documentation regression here?

Looking at the top of detect_indent_unit():
    """Find the indent unit used at depth 1 in this block.

    Returns one of: '  ' (2 spaces), '    ' (4 spaces), '\t' (tab),
    or None if depth-1 is empty or ambiguous."""

Since it now returns a 2-tuple instead, should the docstring be updated to
reflect this change?

[ ... ]

>  def check_indent_consistent(ctx):
>      """All indented lines must be a multiple of the detected unit."""
> -    unit =3D detect_indent_unit(ctx)
> +    (unit, lineno) =3D detect_indent_unit(ctx)
>      if unit is None:
>          return
>      if ctx.file_type =3D=3D 'yaml':

[Severity: Low]
Is there a minor regression here with an unused variable?

It appears lineno is unpacked from the tuple but never used anywhere in
check_indent_consistent().

--=20
Sashiko AI review =C2=B7 https://sashiko.dev/#/patchset/20260708-dts-style-=
checker-v4-0-c175e6401150@oss.qualcomm.com?part=3D6
