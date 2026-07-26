Received: from smtp.kernel.org (aws-us-west-2-korg-mail-alma10-1.taild15c8.ts.net [100.103.45.18])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id BAC483BB133
	for <devicetree@vger.kernel.org>; Sun, 26 Jul 2026 15:53:55 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=100.103.45.18
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1785081236; cv=none; b=CcgXoVxcRJ8l2ZDCK+rfYfJF4tuLRg2SRIoPR/WFsZbXdXfVn31o50VWYJHU1il0zbF8ytp9uukCw34XrdDS+iHOvEu55otA1QntBvVIq4d5R1WotdgFA8MJlxI27DNOj9b6vOd+FisG4enWhJAbxqbq5xK0iEiGVV/9P28TJUY=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1785081236; c=relaxed/simple;
	bh=SkEM1PPh7wlJ4yWnlNcCjH5X+tu/PSWwKvFASbRPLOk=;
	h=From:Subject:To:Cc:In-Reply-To:References:Content-Type:Date:
	 Message-Id; b=M9naxl1QxXqwXWFek0hQMDlwXqViZ8HIePNTZ8PIh8qU5hERuguxlfcDGKxUDvNnalcw+XhQZqJHkjxAfXSvi/+zVbq9+KMoO/8wdZQk3nI97ekT4cb9FroyBdO/+BbV5NvRaN93iHGYF3UHy9eI2ez4Bg+w0sa40qst0WAaY9w=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=PGuwh+Uu; arc=none smtp.client-ip=100.103.45.18
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="PGuwh+Uu"
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 2A6091F000E9;
	Sun, 26 Jul 2026 15:53:54 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kernel.org;
	s=k20260515; t=1785081235;
	bh=WBcBkhBS5cA+tc45j5cw4QvmyzGSB9ZgoSmrTtS+/P8=;
	h=From:Subject:Reply-To:To:Cc:In-Reply-To:References:Date;
	b=PGuwh+UuKKXN+hnrQHddtSG2sUzQG0PA+tvxmC02D2aI2rz7Aslnr79GvgSpP2rX9
	 +Sy3OF6cC06APc2jaH4PUcsoBqTnLox4SZ8Cwb4y3XxlUu78IlRpklZiELU80XjMac
	 H7G5fPxTiS3xk3JPwV6fzva05miRg+OJLD4qrO/T8+jS5olsfx/npT8eKUI6gZHvNm
	 5L7APAUcamelhS5uYBoZkCc1BhIuX8Ov12sJaWmSkyMkaIb8gz6PwWFcrYRuFWvSZH
	 bMyLAEAW0gqP8wt1p81JgiGEDRMBUdH6SHnjH2UqsIG1anAy+d6h3Q0MnnMtZP2iW0
	 3pYApT4VT05yA==
From: sashiko-bot@kernel.org
Subject: Re: [PATCH 7/9] dtc: dt-check-style: Consistently call 'kind' as
 'file_type'
Reply-To: sashiko-reviews@lists.linux.dev
To: "Krzysztof Kozlowski" <krzysztof.kozlowski@oss.qualcomm.com>
Cc: devicetree@vger.kernel.org, robh@kernel.org, conor+dt@kernel.org
In-Reply-To: <20260726-n-dts-style-checker-continued-v1-7-b05b8f897670@oss.qualcomm.com>
References: <20260726-n-dts-style-checker-continued-v1-0-b05b8f897670@oss.qualcomm.com>
 <20260726-n-dts-style-checker-continued-v1-7-b05b8f897670@oss.qualcomm.com>
Content-Type: text/plain; charset=utf-8
Content-Transfer-Encoding: quoted-printable
Date: Sun, 26 Jul 2026 15:53:54 +0000
Message-Id: <20260726155355.2A6091F000E9@smtp.kernel.org>
Precedence: bulk
X-Mailing-List: devicetree@vger.kernel.org
List-Id: <devicetree.vger.kernel.org>
List-Subscribe: <mailto:devicetree+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:devicetree+unsubscribe@vger.kernel.org>

Thank you for your contribution! Sashiko AI review found 1 potential issue(=
s) to consider:
- [Low] Blind search-and-replace corrupted the docstring for `_natural_sort=
_key`.
--

--- Patch [7]: [PATCH 7/9] dtc: dt-check-style: Consistently call 'kind' as=
 'file_type' ---
commit 8e2fd209c720e5544c185a9ec09b15945051b1cb
Author: Krzysztof Kozlowski <krzysztof.kozlowski@oss.qualcomm.com>

dtc: dt-check-style: Consistently call 'kind' as 'file_type'

Script was using different names for variables or attributes with the
same meaning: the type of file (YAML, DTS, DTSI, DTSO).  Unify 'kind',
'input_kind' and function input_kind() to consistent 'file_type'.

> diff --git a/scripts/dtc/dt-check-style b/scripts/dtc/dt-check-style
> index 171a5e12fcbd8..8c049c04b865c 100755
> --- a/scripts/dtc/dt-check-style
> +++ b/scripts/dtc/dt-check-style

[ ... ]

> @@ -519,7 +519,7 @@ def _walk_bodies(lines):
> =20
> =20
>  def _natural_sort_key(s):
> -    """Split a string into a tuple of (kind, value) pairs that compares
> +    """Split a string into a tuple of (file_type, value) pairs that comp=
ares
>      numeric runs as ints, so 'foo10' sorts after 'foo2'."""
>      parts =3D []
>      for part in re.split(r'(\d+)', s):

[Severity: Low]
Does the docstring still accurately describe the return value of
_natural_sort_key()?

It looks like the global rename changed 'kind' to 'file_type' here, but in
this context, 'kind' referred to the type of the split part (numeric or
string) for natural sorting, rather than the type of file.

--=20
Sashiko AI review =C2=B7 https://sashiko.dev/#/patchset/20260726-n-dts-styl=
e-checker-continued-v1-0-b05b8f897670@oss.qualcomm.com?part=3D7
