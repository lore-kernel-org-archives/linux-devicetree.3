Received: from smtp.kernel.org (aws-us-west-2-korg-mail-alma10-1.taild15c8.ts.net [100.103.45.18])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id A907638944D
	for <devicetree@vger.kernel.org>; Mon,  6 Jul 2026 16:07:25 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=100.103.45.18
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1783354046; cv=none; b=VFKEdzM3RIKSJL/6Ka1ydklB9NYs9LLen7SjozBZt8VHc6OHPhrs75zmxfzt/Y952K8dFR4jo+MV6PecDTesI2vv5hMONN08tTNsMCUXlz9o+irY7zg68dXkoHiU6dZsjZ0f55a8YiFczbkL35GkunDS52wuZpmNgonVwDRXqSs=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1783354046; c=relaxed/simple;
	bh=I/AZO73UZ7EcZcDoC2eJ4b8WDbkCrj0XYORZOeMoNOk=;
	h=From:Subject:To:Cc:In-Reply-To:References:Content-Type:Date:
	 Message-Id; b=T81J9Ig4D2wfp70bnDg5Bfl3PDaKzyQ21mIlE/1H4xQT+S9VGsbAVX5mpiJkEy3MwzAPj1Ef0TMYg1YjlurjCyh0617R8dyIlDgM7Jl28XKEqtuCje/BHh0nx82YbnVKmgN1bSLThCFqVeFWuBOVNDM97x7acA25ymb7xJEBHac=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=gh3oqjnk; arc=none smtp.client-ip=100.103.45.18
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="gh3oqjnk"
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 07FD11F000E9;
	Mon,  6 Jul 2026 16:07:24 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kernel.org;
	s=k20260515; t=1783354045;
	bh=uFuBX1Gor0zOuk8xrHXesm4EZpTsZ4iu69Jv2H6SuS0=;
	h=From:Subject:Reply-To:To:Cc:In-Reply-To:References:Date;
	b=gh3oqjnkptwz97NFKdz4/Hd5BGNmc8s/yHpp0OJuyzk/jV54KI8DAh1nfudObGYEL
	 bz3rlYCaexZi9ZZ/iikzx8jaw6IAsDtCXgukkLKTQ6UPwt9JIvdUFEFNGFmKC1JH5S
	 8hF4dcQwFPmLpIDqUHbD5i301kN82FLIQxw9yw92drhzSZgWm+paRkYhel2CsFQ+ln
	 uEw44a+uvG7kxdwc5lQkMa37w/p633TDi6EUrjJyHizUs8At2fqvgyEG3BaDaMKJDM
	 cTdrjFzUo4p/mY/m8fZ5uOUq8angSe5jNyfBZst6LXhUadFktaHPKZzv5w2kU1m/b9
	 r21ijulXF7J/w==
From: sashiko-bot@kernel.org
Subject: Re: [PATCH v3 4/6] dtc: dt-check-style: Expect first device_type
Reply-To: sashiko-reviews@lists.linux.dev
To: "Krzysztof Kozlowski" <krzysztof.kozlowski@oss.qualcomm.com>
Cc: conor+dt@kernel.org, devicetree@vger.kernel.org, robh@kernel.org
In-Reply-To: <20260706-dts-style-checker-v3-4-03ffacff9226@oss.qualcomm.com>
References: <20260706-dts-style-checker-v3-0-03ffacff9226@oss.qualcomm.com>
 <20260706-dts-style-checker-v3-4-03ffacff9226@oss.qualcomm.com>
Content-Type: text/plain; charset=utf-8
Content-Transfer-Encoding: quoted-printable
Date: Mon, 06 Jul 2026 16:07:24 +0000
Message-Id: <20260706160725.07FD11F000E9@smtp.kernel.org>
Precedence: bulk
X-Mailing-List: devicetree@vger.kernel.org
List-Id: <devicetree.vger.kernel.org>
List-Subscribe: <mailto:devicetree+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:devicetree+unsubscribe@vger.kernel.org>

Thank you for your contribution! Sashiko AI review found 1 potential issue(=
s) to consider:
- [Low] Docstrings in `dt-check-style` were not fully updated to reflect th=
e new `device_type` canonical order.
--

commit bb6e224694e154bb051ff9fc5122693c0b1a4366
Author: Krzysztof Kozlowski <krzysztof.kozlowski@oss.qualcomm.com>

dtc: dt-check-style: Expect first device_type

A few nodes do have "device_type" property which is mostly, but not always,
the first property in a device node, when applicable. Adjust the DTS
coding style rules to actually expect the device_type first and improve
the dt-check-style to handle this correctly.

> diff --git a/scripts/dtc/dt-check-style b/scripts/dtc/dt-check-style
> index cf61e92d0568e..d9080297bd4db 100755
> --- a/scripts/dtc/dt-check-style
> +++ b/scripts/dtc/dt-check-style
> @@ -558,28 +558,31 @@ def check_child_name_order(ctx):
> =20
>  def _property_bucket(name):
>      """Return the canonical bucket index for a property:
> -       0 compatible
> -       1 reg / reg-names
> -       2 ranges
> -       3 standard properties (no vendor comma in #-stripped name)
> -       4 vendor-specific properties
> -       5 status
> +       0 device_type
> +       1 compatible
> +       2 reg / reg-names
> +       3 ranges
> +       4 standard properties (no vendor comma in #-stripped name)
> +       5 vendor-specific properties
> +       6 status
>      Plus a sub-key inside the bucket for fixed slots (compatible, reg,
>      reg-names, ranges, status). 'standard' and 'vendor' return None for
>      the sub-key, signalling that the within-bucket key is computed by
>      the pairing rules."""

[Severity: Low]
This isn't a bug, but the explanatory text directly below the list wasn't
updated. Should "device_type" also be added to the enumerated list of
fixed slots in the "(compatible, reg, reg-names, ranges, status)" text?

Also, in check_property_order() further down the file, the docstring
describing the overall canonical property order still starts with
"compatible, reg(/reg-names)..." and misses "device_type". Should that
be updated as well?

>      stripped =3D name.lstrip('#')
> -    if name =3D=3D 'compatible':
> +    if name =3D=3D 'device_type':
>          return (0, 0)
> -    if name =3D=3D 'reg':
> +    if name =3D=3D 'compatible':
>          return (1, 0)
> +    if name =3D=3D 'reg':
> +        return (2, 0)
>      if name =3D=3D 'reg-names':
> -        return (1, 1)
> +        return (2, 1)
>      if name =3D=3D 'ranges':
> -        return (2, 0)
> +        return (3, 0)
>      if name =3D=3D 'status':
> -        return (5, 0)
> -    return (4 if ',' in stripped else 3, None)
> +        return (6, 0)
> +    return (5 if ',' in stripped else 4, None)
> =20
> =20
>  # Declarative pairing rules: each is a callable

--=20
Sashiko AI review =C2=B7 https://sashiko.dev/#/patchset/20260706-dts-style-=
checker-v3-0-03ffacff9226@oss.qualcomm.com?part=3D4
