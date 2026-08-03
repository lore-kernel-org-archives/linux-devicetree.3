Received: from smtp.kernel.org (aws-us-west-2-korg-mail-alma10-1.taild15c8.ts.net [100.103.45.18])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 89D522727EB
	for <devicetree@vger.kernel.org>; Mon,  3 Aug 2026 09:09:07 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=100.103.45.18
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1785748148; cv=none; b=UofFynJU2RV91G1MugAfffHG7dKEjSVRCarrk1j0fqmNbU+syuY4EInJ2huf/MMZq4d0BDlGKjSufUl4Xb/QCI2dcqX5OitQy3UEv0zDyoQuEXJJiljYuZgCkd3wd4ASXn+5UKzhc14yiuv+8RKdgdJ+7L5AkqNfLDZ6YtWrWQk=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1785748148; c=relaxed/simple;
	bh=MUCKDFfzqD0up3CiWWySZZCooMDZ8OCjQGHfJBiji8M=;
	h=From:Subject:To:Cc:In-Reply-To:References:Content-Type:Date:
	 Message-Id; b=t+WUxhD62xNK65V14199WkrgULGcsEOE8ElLyE/mKkb3dOUFWIoV209PJ5oKFBFXfPwEFgLnVB0J1b7RtxXIVhYNXPTyDOUqE4uTyLlZmMqh/A2ehSvFBwMo9ARf/UUltVj1STjHpZltv6H3fLGIXc1eprUDfZWFaciYOZNJytE=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=JvUgu2zi; arc=none smtp.client-ip=100.103.45.18
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="JvUgu2zi"
Received: by smtp.kernel.org (Postfix) with ESMTPSA id E30441F000E9;
	Mon,  3 Aug 2026 09:09:06 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kernel.org;
	s=k20260515; t=1785748147;
	bh=SnY7NQE0n2qmeXu/99scZ1mrugfTC323IHlcH8tpIQo=;
	h=From:Subject:Reply-To:To:Cc:In-Reply-To:References:Date;
	b=JvUgu2zi+VwoK5lnqzA/9qdaWQU5XFgUKiDoF1VBLBhKgvro2MUpTCNPZn3dpE8v6
	 4c8k2h9z7rYeLVV3NeWzyL1BFP/Td5IBVwaQ3yhZlUoMAJB4WwoJuJaT7zqc2cwwc4
	 o34Wrb1mVnnUDVIQAeuBQNCnYQ5YYkWgekpNwU12bC+WkSl1GFKO9PGVOXGy19475v
	 kXNgoFNAN4B/gHlC4VXevV6eeQy9sSXctMKSrfSJmgSViIXVxI4QxKkIF7etVd24rc
	 rHVozSBmz55breSRAcNYnBJmBY8ooiWmAZ3n0F+TdbFDv6vKL/i3X0Rx9GuzCrqoNd
	 vGs2f+jCUfCqA==
From: sashiko-bot@kernel.org
Subject: Re: [PATCH v3 05/11] dtc: dt-check-style: Drop stray backslash
 before quote for continuation-alignment
Reply-To: sashiko-reviews@lists.linux.dev
To: "Krzysztof Kozlowski" <krzysztof.kozlowski@oss.qualcomm.com>
Cc: robh@kernel.org, conor+dt@kernel.org, devicetree@vger.kernel.org
In-Reply-To: <20260803-n-dts-style-checker-continued-v3-5-6c9776928cea@oss.qualcomm.com>
References: <20260803-n-dts-style-checker-continued-v3-0-6c9776928cea@oss.qualcomm.com>
 <20260803-n-dts-style-checker-continued-v3-5-6c9776928cea@oss.qualcomm.com>
Content-Type: text/plain; charset=utf-8
Content-Transfer-Encoding: quoted-printable
Date: Mon, 03 Aug 2026 09:09:06 +0000
Message-Id: <20260803090906.E30441F000E9@smtp.kernel.org>
Precedence: bulk
X-Mailing-List: devicetree@vger.kernel.org
List-Id: <devicetree.vger.kernel.org>
List-Subscribe: <mailto:devicetree+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:devicetree+unsubscribe@vger.kernel.org>

Thank you for your contribution! Sashiko AI review found 1 potential issue(=
s) to consider:
- [Low] Incomplete fix introduces inconsistency: The rule description for '=
continuation-alignment' in the RULES array was not updated to match the new=
 warning message.
--

--- Patch [5]: [PATCH v3 05/11] dtc: dt-check-style: Drop stray backslash b=
efore quote for continuation-alignment ---
commit cc9a0068ab7c4a58265d453026c1b235168a19bd
Author: Krzysztof Kozlowski <krzysztof.kozlowski@oss.qualcomm.com>

dtc: dt-check-style: Drop stray backslash before quote for continuation-ali=
gnment

This commit updates the continuation-alignment rule warning to drop the str=
ay
backslash and quotes around the character matching rules. It removes the
quotes around '<' and the escaped quote inside the parenthesis.

> diff --git a/scripts/dtc/dt-check-style b/scripts/dtc/dt-check-style
> index f9e5762862a51..bdf36ba9e2744 100755
> --- a/scripts/dtc/dt-check-style
> +++ b/scripts/dtc/dt-check-style
> @@ -950,7 +950,7 @@ def check_continuation_alignment(ctx):
>              if _display_col(cont.indent_str) !=3D target_col:
>                  yield (cont.lineno,
>                         'continuation should align to column %d '
> -                       '(under "<" or \\")' % (target_col + 1))
> +                       '(under < or ")' % (target_col + 1))

[Severity: Low]
Does the RULES array description need to be updated to match this new text?

Looking further down in scripts/dtc/dt-check-style in the RULES array, the
rule description still has the old escaping and quotes:

    Rule('continuation-alignment', 'strict',
         'multi-line property continuations align under "<" or "\\""',
         check_continuation_alignment),

This will cause dt-check-style --list-rules to display the old style text
while the actual warning output uses the new style.

[ ... ]

--=20
Sashiko AI review =C2=B7 https://sashiko.dev/#/patchset/20260803-n-dts-styl=
e-checker-continued-v3-0-6c9776928cea@oss.qualcomm.com?part=3D5
