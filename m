Received: from smtp.kernel.org (aws-us-west-2-korg-mail-alma10-1.taild15c8.ts.net [100.103.45.18])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 9FCC63D9DBB
	for <devicetree@vger.kernel.org>; Mon,  3 Aug 2026 09:21:41 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=100.103.45.18
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1785748902; cv=none; b=OYkNCMjTdpqHZNJZH/6YR8kuBcBkz0wrq7ifOzpJfEuwFs/HHfMDnlRplxhBKvMcOr3lYF/RATXeKlTZ9x9BcgH1DwEqJD1lYS3PB80vRR2DdeSKQ+SjaYhnj3O6QvshO9JGFdzHax7egPXz1yQ6+TiotvhwNQcbyam9fZ2Y+Iw=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1785748902; c=relaxed/simple;
	bh=MYYuzdn4RjkKfdR25ThJPFdlIZDX1pyV+441ZEJKxkM=;
	h=From:Subject:To:Cc:In-Reply-To:References:Content-Type:Date:
	 Message-Id; b=EMxqPzUmEKEmWSsLKkpvfJaPLR0uqYwghQxBhBGzdpHM0Qn51YfEwd/SNaQKCylkRmuPCDfqts3zhb7gpDKj3bY2Jd3BOTrpEhnb1F83rzGl8bQTak9wuLadWMcKTuBqNsmRZGYGz3hPhSCTFohR1FKpjQhPvth3qV/pjD9ZiI0=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=QEtGWCdZ; arc=none smtp.client-ip=100.103.45.18
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="QEtGWCdZ"
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 279881F00A3A;
	Mon,  3 Aug 2026 09:21:41 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kernel.org;
	s=k20260515; t=1785748901;
	bh=7AS5OOnBiSCs1gQVFJmUhOyMV2rZi0VWV87Un//lRj8=;
	h=From:Subject:Reply-To:To:Cc:In-Reply-To:References:Date;
	b=QEtGWCdZoCCLyx+7gIsIBP538TZ4OG7uyE0jrXD+VOOSJHT8iGEitMFU4q39EJoHM
	 DG5u46CStqws9ZdT+u9NVpl4SXzp3/9syTVts+7P1nJpS+Zzq9U+AbGjtDnxF8+rHN
	 lBwpYRXmiTa9S5EY4IWlTPY83B3xCZrmjXYpw6BHlTcTP8NjKIjtpiOWUOIa3Hxu3H
	 Nbx8jnP1f9O0VWN5rZsxi7fW4dx6FQ6CtE3eLpW54+D7qrgOs3xJShcLThWCdwufzb
	 4VrRO6M5NCTkPwvIFA3TXCUnJxncKzv2+J0zYTARLvrD512hIOwlFc1bVa50a2GEfh
	 GNTQcie165Hpg==
From: sashiko-bot@kernel.org
Subject: Re: [PATCH v3 06/11] dtc: dt-check-style: Fix alignment of values
 in continued property lines
Reply-To: sashiko-reviews@lists.linux.dev
To: "Krzysztof Kozlowski" <krzysztof.kozlowski@oss.qualcomm.com>
Cc: devicetree@vger.kernel.org, conor+dt@kernel.org, robh@kernel.org
In-Reply-To: <20260803-n-dts-style-checker-continued-v3-6-6c9776928cea@oss.qualcomm.com>
References: <20260803-n-dts-style-checker-continued-v3-0-6c9776928cea@oss.qualcomm.com>
 <20260803-n-dts-style-checker-continued-v3-6-6c9776928cea@oss.qualcomm.com>
Content-Type: text/plain; charset=utf-8
Content-Transfer-Encoding: quoted-printable
Date: Mon, 03 Aug 2026 09:21:40 +0000
Message-Id: <20260803092141.279881F00A3A@smtp.kernel.org>
Precedence: bulk
X-Mailing-List: devicetree@vger.kernel.org
List-Id: <devicetree.vger.kernel.org>
List-Subscribe: <mailto:devicetree+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:devicetree+unsubscribe@vger.kernel.org>

Thank you for your contribution! Sashiko AI review found 1 potential issue(=
s) to consider:
- [Low] The dt-check-style continuation alignment heuristic misaligns C pre=
processor macros
--

--- Patch [6]: [PATCH v3 06/11] dtc: dt-check-style: Fix alignment of value=
s in continued property lines ---
commit 2e7f6260952152a0c0c19383e03e859b1a3c8092
Author: Krzysztof Kozlowski <krzysztof.kozlowski@oss.qualcomm.com>

dtc: dt-check-style: Fix alignment of values in continued property lines

This commit updates the dt-check-style script to enforce proper alignment
for continued property lines. If a continued line is part of a previous
phandle, it requires alignment to inner values rather than the opening
bracket to improve readability.

> diff --git a/scripts/dtc/dt-check-style b/scripts/dtc/dt-check-style
> index bdf36ba9e2744..1c67348fb5269 100755
> --- a/scripts/dtc/dt-check-style
> +++ b/scripts/dtc/dt-check-style

[ ... ]

> @@ -942,15 +943,20 @@ def check_continuation_alignment(ctx):
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
> +            err_msg_explanation =3D 'to < or "'
> +            if not re.match(r'[<"]', cont.stripped):
> +                target_offset =3D 1

[Severity: Low]
Does this heuristic unintentionally force misalignment for C preprocessor m=
acros
when they appear as top-level elements in comma-separated property lists?

Looking at check_continuation_alignment() in scripts/dtc/dt-check-style, if=
 a
macro is used in a list alongside <...> elements:

clocks =3D <&foo>,
         CLOCK_MACRO;

The macro does not start with < or ". As a result, this check treats the ma=
cro
as an inner value and applies the target_offset =3D 1. This would mandate an
extra column of indentation, forcing the macro to misalign from the opening=
 <
of the previous line.

> +                err_msg_explanation =3D 'to the value under <'
> +            if _display_col(cont.indent_str) !=3D target_col + target_of=
fset:
>                  yield (cont.lineno,
>                         'continuation should align to column %d '
> -                       '(under < or ")' % (target_col + 1))
> +                       '(%s)' % (target_col + target_offset + 1, err_msg=
_explanation))

[ ... ]

--=20
Sashiko AI review =C2=B7 https://sashiko.dev/#/patchset/20260803-n-dts-styl=
e-checker-continued-v3-0-6c9776928cea@oss.qualcomm.com?part=3D6
