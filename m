Received: from smtp.kernel.org (aws-us-west-2-korg-mail-alma10-1.taild15c8.ts.net [100.103.45.18])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 8917F3B810D
	for <devicetree@vger.kernel.org>; Sun, 26 Jul 2026 15:56:46 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=100.103.45.18
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1785081407; cv=none; b=KXgf6PJRolh/0MkMLGchbvuskeQToudZiNT7Yw1I3gtTRD8GCgKdQnNPIxMputUAKRHHHK13LDhmu838fWV1C0eErTJ8VTwvCMGiXqs66F9lo3zI2e9MxAQaqiNAoLK/Vn/M/H7MpFB3DFKtJ5F7CvrhEKbYaCnZ6AlDEoVAjiQ=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1785081407; c=relaxed/simple;
	bh=efir9Fkrk79QEr0/Hc9xIIfl0qqVRn4OriSKscaP/20=;
	h=From:Subject:To:Cc:In-Reply-To:References:Content-Type:Date:
	 Message-Id; b=jD0beH1JaV6H4JWnyTy9EgajNVupXkAD9XlpF2OFPLMOLkTX2wkOeuw/17jb+yg1ywXZ9togczK2KdyQBJ4oFRWGLhqdUXmT6Bwp6YzdO8dM634Zo/yTlR7FZlqD2tyDVDBlW1qu7MR3J/fNwUIrCyh/l8/uVVwAn1728Shy7eo=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=HwoI9/8g; arc=none smtp.client-ip=100.103.45.18
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="HwoI9/8g"
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 81CEF1F00A3A;
	Sun, 26 Jul 2026 15:56:45 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kernel.org;
	s=k20260515; t=1785081406;
	bh=WWorr3BhupwD7wbgN3AHUlzUX0npoKpHGfI3tdc4nXY=;
	h=From:Subject:Reply-To:To:Cc:In-Reply-To:References:Date;
	b=HwoI9/8gLF9sm2HoDEHE58flL4IKnt4j+4HJ6IkijrEkjIx1nS3/BcQfG8Fg/+g4r
	 OXRLm0nw7L7kLg/GQAgS8FJB4QnSVIWAgSYNPgS3UqnsVgfYs3Q36gkoJ3OvKzKpi4
	 H7VgacD6DjZh0JYuhMVOzkBlppz7t89uuGabISwkxFYcASW+dJrOndCrgwNOqCCwGT
	 0kVrRYyFKRt7m1+UBmC7KIlr3LecsD0CPW7aRmYsuYgNV+7o3BkZPq6mJ0W6omnGjv
	 uzVhxjkPnrnhkjdf1KorVkQPDsmab5xDC++WL0qZrCM5/1jVXvILP2MS5JGoZTYH1Z
	 JIhJZR/wYgFsA==
From: sashiko-bot@kernel.org
Subject: Re: [PATCH 6/9] dtc: dt-check-style: Fix alignment of values in
 continued property lines
Reply-To: sashiko-reviews@lists.linux.dev
To: "Krzysztof Kozlowski" <krzysztof.kozlowski@oss.qualcomm.com>
Cc: devicetree@vger.kernel.org, robh@kernel.org, conor+dt@kernel.org
In-Reply-To: <20260726-n-dts-style-checker-continued-v1-6-b05b8f897670@oss.qualcomm.com>
References: <20260726-n-dts-style-checker-continued-v1-0-b05b8f897670@oss.qualcomm.com>
 <20260726-n-dts-style-checker-continued-v1-6-b05b8f897670@oss.qualcomm.com>
Content-Type: text/plain; charset=utf-8
Content-Transfer-Encoding: quoted-printable
Date: Sun, 26 Jul 2026 15:56:44 +0000
Message-Id: <20260726155645.81CEF1F00A3A@smtp.kernel.org>
Precedence: bulk
X-Mailing-List: devicetree@vger.kernel.org
List-Id: <devicetree.vger.kernel.org>
List-Subscribe: <mailto:devicetree+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:devicetree+unsubscribe@vger.kernel.org>

Thank you for your contribution! Sashiko AI review found 2 potential issue(=
s) to consider:
- [Medium] The new alignment rule incorrectly forces a standalone closing b=
racket (e.g., '>;') to align with inner values instead of the opening brack=
et.
- [Low] The hardcoded error message is misleading when target_offset =3D=3D=
 1, as it claims the expected column is 'under < or "'.
--

--- Patch [6]: [PATCH 6/9] dtc: dt-check-style: Fix alignment of values in =
continued property lines ---
commit 3d17d86c35121d71a779318164c4a25fa384d8c1
Author: Krzysztof Kozlowski <krzysztof.kozlowski@oss.qualcomm.com>

dtc: dt-check-style: Fix alignment of values in continued property lines

This commit updates the dt-check-style script to enforce that continued
property lines aligning to inner values are indented one space past the
opening '<' or '"'. It also includes tests to verify this behavior.

> diff --git a/scripts/dtc/dt-check-style b/scripts/dtc/dt-check-style
> index 4d90fbec0e391..171a5e12fcbd8 100755
> --- a/scripts/dtc/dt-check-style
> +++ b/scripts/dtc/dt-check-style

[ ... ]

> @@ -928,15 +929,18 @@ def check_continuation_alignment(ctx):
>              continue
>          # First '<' or '"' after '=3D'
>          rest =3D dl.raw[eq + 1:]
> -        m =3D re.search(r'[<"]', rest)
> +        m =3D re.search(r'\s*([<"])', rest)
>          if not m:
>              continue
> -        target_col =3D _display_col(dl.raw[:eq + 1 + m.start()])
> +        target_col =3D _display_col(dl.raw[:eq + 1 + m.start(1)])
>          for cont in dl.continuations:
> -            if _display_col(cont.indent_str) !=3D target_col:
> +            target_offset =3D 0
> +            if not re.match(r'[<"]', cont.stripped):
> +                target_offset =3D 1

[Severity: Medium]
Will this new alignment rule incorrectly flag standalone closing brackets?

If a continuation line is just a closing bracket like ">;", the script
evaluates re.match(r'[<"]', cont.stripped) as false, which sets
target_offset =3D 1. This forces developers to indent the closing bracket
one space to the right of the opening bracket instead of aligning them.

> +            if _display_col(cont.indent_str) !=3D target_col + target_of=
fset:
>                  yield (cont.lineno,
>                         'continuation should align to column %d '
> -                       '(under < or ")' % (target_col + 1))
> +                       '(under < or ")' % (target_col + target_offset + =
1))

[Severity: Low]
Is this error message accurate when target_offset is 1?

When the script expects alignment to the inner value (target_offset =3D=3D =
1),
the error message still tells developers to align "(under < or ")". This
could be confusing since the target column provided is actually one space
to the right of the bracket or quote.

--=20
Sashiko AI review =C2=B7 https://sashiko.dev/#/patchset/20260726-n-dts-styl=
e-checker-continued-v1-0-b05b8f897670@oss.qualcomm.com?part=3D6
