Received: from smtp.kernel.org (aws-us-west-2-korg-mail-alma10-1.taild15c8.ts.net [100.103.45.18])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id DF3F423645D
	for <devicetree@vger.kernel.org>; Wed, 26 Aug 2026 10:31:59 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=100.103.45.18
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1787740321; cv=none; b=bYqadejWXzTyhmV5rC7RVG8JgLRDugIz4+99nq4AR3NPwqx8WMMD+x+4fsM54Xb3VWVErKIuSImV0EAv5AnhgMEpVYuRdbd3NLXBR4y3yocPm3Lh+oSr6MR+dMVd/YCmE5LsZakS6LOrO4MvgjvOIon8favmzW/hOgXsxOGnge4=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1787740321; c=relaxed/simple;
	bh=VB7S20tvz046dc7GxGOpJlKIGZiWymOhcZ5r9FeJVKk=;
	h=From:Subject:To:Cc:In-Reply-To:References:Content-Type:Date:
	 Message-Id; b=HF9lwu5zJJAjwTse5z9OyvKeYNxkxlkWPH/bLLa8TE0YYiKBZO8hPg8UryNSlK1Y8qDNuFIuSWCVQ3fa8fiJrvHhSh9pjTWLlhTJsMMzLWmB3YvfN962XIWYXC+XPGwnuyCV6SravuN0RE4EJn58DNxBtkglW6e0+1Yuaa/tAWk=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=JmzIwy1e; arc=none smtp.client-ip=100.103.45.18
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="JmzIwy1e"
Received: by smtp.kernel.org (Postfix) with ESMTPSA id D89201F000E9;
	Wed, 26 Aug 2026 10:31:58 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kernel.org;
	s=k20260515; t=1787740319;
	bh=cvg6eogBvJ31EuGzROwHrfC9iT7c6ZwaS2Ewa82q6Zs=;
	h=From:Subject:Reply-To:To:Cc:In-Reply-To:References:Date;
	b=JmzIwy1e1RGkZJ5NuqlNfmmcRQDdv8PaRyJmhmpbmUH8ERjeTQ01l/1cKiM7m4v6J
	 74MgUDPAxTtr46TOZOg6b2WWF3bnLnT3LYq/MQXN01Ld5yTyHVWrrQrdfFaNBl8QAC
	 kyX7qKME2gyjrK2un+zOfexTjb2iorFLzZMP3ytPCdnmftxARY90BF9wWg+Fig3NPI
	 +D6C+Vfcf+GH6F+E/oCRAFJcaGqFi1LEaX39C8skWRcCm9/1j0JE0KNx4fx8hYe9zP
	 7cUfXIwyvsKWcSg3R/OPzAvB18tbvtheZPqVAH/I8HCrkM+56PaA7ppQp47KsPjmIR
	 KUdNzaoDW1Oow==
From: sashiko-bot@kernel.org
Subject: Re: [PATCH v5 07/10] dtc: dt-check-style: Call
 _strip_strings_and_comments() only once
Reply-To: sashiko-reviews@lists.linux.dev
To: "Krzysztof Kozlowski" <krzysztof.kozlowski@oss.qualcomm.com>
Cc: devicetree@vger.kernel.org, conor+dt@kernel.org, robh@kernel.org
In-Reply-To: <20260826-n-dts-style-checker-continued-v5-7-fdd16ca6e771@oss.qualcomm.com>
References: <20260826-n-dts-style-checker-continued-v5-0-fdd16ca6e771@oss.qualcomm.com>
 <20260826-n-dts-style-checker-continued-v5-7-fdd16ca6e771@oss.qualcomm.com>
Content-Type: text/plain; charset=utf-8
Content-Transfer-Encoding: quoted-printable
Date: Wed, 26 Aug 2026 10:31:58 +0000
Message-Id: <20260826103158.D89201F000E9@smtp.kernel.org>
Precedence: bulk
X-Mailing-List: devicetree@vger.kernel.org
List-Id: <devicetree.vger.kernel.org>
List-Subscribe: <mailto:devicetree+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:devicetree+unsubscribe@vger.kernel.org>

Thank you for your contribution! Sashiko AI review found 1 potential issue(=
s) to consider:
- [Medium] Removal of `.strip()` in check_value_whitespace introduces false=
 positive warnings for extra whitespace.
--

commit f4faff4b08497467646cdf648bcdf86e75cfd546
Author: Krzysztof Kozlowski <krzysztof.kozlowski@oss.qualcomm.com>

dtc: dt-check-style: Call _strip_strings_and_comments() only once
   =20
More than one rule evaluates pure code - stripped from comments and
indentation - thus store this pure code in DtsLine class for
better performance.

> diff --git a/scripts/dtc/dt-check-style b/scripts/dtc/dt-check-style
> index a1034f6b9cafd..da7edd5ea079d 100755
> --- a/scripts/dtc/dt-check-style
> +++ b/scripts/dtc/dt-check-style

[ ... ]

> @@ -860,9 +860,9 @@ def check_value_whitespace(ctx):
>      for dl in ctx.lines:
>          if dl.linetype !=3D LineType.PROPERTY:
>              continue
> -        segs =3D [_strip_strings_and_comments(dl.raw).strip()]
> +        segs =3D [dl.code]
>          for cont in dl.continuations:
> -            segs.append(_strip_strings_and_comments(cont.stripped).strip=
())
> +            segs.append(cont.code)

[Severity: Medium]
Does removing .strip() here introduce false positive warnings for extra
whitespace?

When an inline block comment is removed from a continuation line (for examp=
le
"/* comment */ 1>;"), the leading space is left behind. Without .strip(),
this space is preserved when the property segments are concatenated. This
could falsely trigger the strict mode regex match for extra whitespace insi=
de
brackets.

>          text =3D ''
>          for s in segs:
>              if not s:

--=20
Sashiko AI review =C2=B7 https://sashiko.dev/#/patchset/20260826-n-dts-styl=
e-checker-continued-v5-0-fdd16ca6e771@oss.qualcomm.com?part=3D7
