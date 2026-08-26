Received: from smtp.kernel.org (aws-us-west-2-korg-mail-alma10-1.taild15c8.ts.net [100.103.45.18])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 99C61311C1B
	for <devicetree@vger.kernel.org>; Wed, 26 Aug 2026 07:13:46 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=100.103.45.18
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1787728427; cv=none; b=dymcMz7j7f1AINFJC7zS1+6KNet+M3vutJTe+ixqFP8QAER+IbioSU3WteSoCmB0lGTFn70i20f+4DAMxbBdMUx8ev8kcXn23b0lkJxvA2qRczfbZPaJgXE2tbtt21eJ6TZX3U7QpPuF37tjN7LrX1fUkfYM0XGbofjIKV7D3io=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1787728427; c=relaxed/simple;
	bh=UDTCDlmgjO3UbATIKWOslb3WJwfkL8E874LPnW6bbgk=;
	h=From:Subject:To:Cc:In-Reply-To:References:Content-Type:Date:
	 Message-Id; b=NaSF1jHheXgQlwl7zL2sG7qVPnscWvyor5G2W1Qd9wU+vdkjbLhPUpeF1BS1KQqMeHlh2MGKFAt0ymUh7OhrbGvT3jAmW7bffH0RYBEDPDjhPxTGhxMFSh92Z65Rm8K8a0oRrfEJsqWmNxH7V7H8EFowFrtx8tqA5KQvfANrEGU=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=Vm9oy3yO; arc=none smtp.client-ip=100.103.45.18
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="Vm9oy3yO"
Received: by smtp.kernel.org (Postfix) with ESMTPSA id A3C2E1F000E9;
	Wed, 26 Aug 2026 07:13:45 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kernel.org;
	s=k20260515; t=1787728425;
	bh=lGlsPiZu17Mwo1XgevcdcC+jaG4iKfTOJO7wqfo+D6c=;
	h=From:Subject:Reply-To:To:Cc:In-Reply-To:References:Date;
	b=Vm9oy3yO+EYM65Q0gwKaUpt45B/RU1WEJeQdb117/QLWEv3ZRErAMIPPTwnCaOAOp
	 MxzmIKhvXJRIxoOYZNRUd06qWXhKSgkYEokeU8SGHvYHdHfFn2ErTIBOD5lExxglPo
	 SyZ2bdw3dpuvHnxjuB41CKT2Jugs3c0LPpeYtkHcyzUsnvmNEdWpY3Q1KibHO+Pe0Q
	 E+r181GtTdiMFQGDJkwupIAnHap/MmkxGBJCUDRyA9bpBHH/d5FujN6tTErYFmLKCc
	 rwELI9HJ43L0sQHtfBaigdiGvu3r+5yGuEg3hfHNT+n8s61owK6/sIraKIkQiXkbXR
	 SlmmaIoWnsVxw==
From: sashiko-bot@kernel.org
Subject: Re: [PATCH v4 03/10] dtc: dt-check-style: Fix alignment of values
 in continued property lines
Reply-To: sashiko-reviews@lists.linux.dev
To: "Krzysztof Kozlowski" <krzysztof.kozlowski@oss.qualcomm.com>
Cc: conor+dt@kernel.org, robh@kernel.org, devicetree@vger.kernel.org
In-Reply-To: <20260826-n-dts-style-checker-continued-v4-3-022e60091965@oss.qualcomm.com>
References: <20260826-n-dts-style-checker-continued-v4-0-022e60091965@oss.qualcomm.com>
 <20260826-n-dts-style-checker-continued-v4-3-022e60091965@oss.qualcomm.com>
Content-Type: text/plain; charset=utf-8
Content-Transfer-Encoding: quoted-printable
Date: Wed, 26 Aug 2026 07:13:45 +0000
Message-Id: <20260826071345.A3C2E1F000E9@smtp.kernel.org>
Precedence: bulk
X-Mailing-List: devicetree@vger.kernel.org
List-Id: <devicetree.vger.kernel.org>
List-Subscribe: <mailto:devicetree+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:devicetree+unsubscribe@vger.kernel.org>

Thank you for your contribution! Sashiko AI review found 1 potential issue(=
s) to consider:
- [Low] Trailing whitespace or comments break multi-line property alignment=
 validation.
--

commit aff0e119d6465ed21424e22c5bbba8149c80bcf4
Author: Krzysztof Kozlowski <krzysztof.kozlowski@oss.qualcomm.com>

dtc: dt-check-style: Fix alignment of values in continued property lines

This commit updates the device tree style checker to properly enforce
alignment rules for continued property lines. It adds logic to ensure inner
values inside phandles or strings are aligned correctly based on the
previous line's completion status.

> diff --git a/scripts/dtc/dt-check-style b/scripts/dtc/dt-check-style
> index 833f8a03ddc9b..486dd1d6bb9a7 100755
> --- a/scripts/dtc/dt-check-style
> +++ b/scripts/dtc/dt-check-style
[ ... ]
> @@ -940,15 +941,23 @@ def check_continuation_alignment(ctx):
>              continue
>          # First '<' or '"' after '=3D'
>          rest =3D dl.raw[eq + 1:]
> -        m =3D re.search(r'[<"]', rest)
> +        m =3D re.search(r'\s*([<"])', rest)
>          if not m:
>              continue
> -        target_col =3D _display_col(dl.raw[:eq + 1 + m.start()])
> +        dl_value_complete =3D rest.endswith('",') or rest.endswith('>,')

[Severity: Low]
Does this evaluation properly handle trailing inline comments or whitespace?

If the rest string retains trailing characters like inline comments=20
(e.g. >, /* foo */) or unexpected whitespace, endswith() will return false=
=20
even if the value is complete. This could cause the script to incorrectly=20
conclude the property is incomplete and mandate an incorrect indentation=20
for the continuation line.

> +        target_col =3D _display_col(dl.raw[:eq + 1 + m.start(1)])
>          for cont in dl.continuations:
> -            if _display_col(cont.indent_str) !=3D target_col:
> +            target_offset =3D 0
> +            err_msg_explanation =3D 'to < or "'
> +            if not dl_value_complete:
> +                target_offset =3D 1
> +                err_msg_explanation =3D 'to the value under <'
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

[Severity: Low]
Can this cause false positives for chained continuation lines?

Similarly to the rest variable above, if cont.stripped retains trailing
comments, endswith() will evaluate to false. Could this result in the same
false-positive warnings when checking the next continuation line?

--=20
Sashiko AI review =C2=B7 https://sashiko.dev/#/patchset/20260826-n-dts-styl=
e-checker-continued-v4-0-022e60091965@oss.qualcomm.com?part=3D3
