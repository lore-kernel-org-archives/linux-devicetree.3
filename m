Received: from smtp.kernel.org (aws-us-west-2-korg-mail-alma10-1.taild15c8.ts.net [100.103.45.18])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id DE8DB331200
	for <devicetree@vger.kernel.org>; Wed, 26 Aug 2026 11:23:42 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=100.103.45.18
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1787743424; cv=none; b=Ffh/Wu/bZ2yGXZ+fOpLr69aet+hzznqtHDgdZZhfK08QEZrXOBKTaPGrFsrFvW+ae6PUmCyreJhxRkL8fh5xTkDSh3N7ETrl3fh/3xnhNRYu8mhDZiqA8iTw3RY14QWzWux6WIMq9YVce9rCY8/WPOGoX9efpe3wvf7xbzQikRo=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1787743424; c=relaxed/simple;
	bh=j1Ye1/FYGOeZazO4RIxw3LOLwps9bDLaEAh2LI/8P/Q=;
	h=From:Subject:To:Cc:In-Reply-To:References:Content-Type:Date:
	 Message-Id; b=gG707VFk7lqJnPBo6Aofix3ojMmIuv0Lo1TFHBuuOQQ9zbuWoPVcWoBAgTprgVYeGhTGnI7X19S0PJWBA1D1OsC5gDe01RVGhOVnYw5RNbs539P2s9pIOULxjmMwsrN+JqvUgjV+rsbfuNU6iqNylF6uMJnmnnf7iJz0KihR19k=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=VQZhqz2F; arc=none smtp.client-ip=100.103.45.18
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="VQZhqz2F"
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 7BF861F000E9;
	Wed, 26 Aug 2026 11:23:42 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kernel.org;
	s=k20260515; t=1787743422;
	bh=nDSsta1UhWkbWEV2l3sMGfrYpZab5LdWGuVzRkOEoLM=;
	h=From:Subject:Reply-To:To:Cc:In-Reply-To:References:Date;
	b=VQZhqz2F0IwB8C0FXZhWWa4qHxE8U5sQlRU1/w8MPTjnuC/tP/yoPevgLG6ZwDfPR
	 Ya7Rtgd/ldvq4wd+iq0JO6lm4axVx0TxIC/kxQ6S3JImLAa+kVhL/J5zAFXvZnO2at
	 P72m1d7eDByC6fqU429AsZnxt/5P8WsOr7SHRlP8pf/EPOi4KSELwzzoyBNGc5iRoP
	 lWPh/lO5IjgxXOwdkmCTUGGqkaOrPOUOBWETjxYZsKT4In0tcvpG1rnIs1x70anjYT
	 MkYXFiGGLzAvDoUCKsBTES1yscQDlx9nzolauTRTHpjaBp8n/ai5nXBnqD+w+2bYFs
	 /5e9oP1LxjcSg==
From: sashiko-bot@kernel.org
Subject: Re: [PATCH v6 03/10] dtc: dt-check-style: Fix alignment of values
 in continued property lines
Reply-To: sashiko-reviews@lists.linux.dev
To: "Krzysztof Kozlowski" <krzysztof.kozlowski@oss.qualcomm.com>
Cc: robh@kernel.org, conor+dt@kernel.org, devicetree@vger.kernel.org
In-Reply-To: <20260826-n-dts-style-checker-continued-v6-3-f270b1e81f8e@oss.qualcomm.com>
References: <20260826-n-dts-style-checker-continued-v6-0-f270b1e81f8e@oss.qualcomm.com>
 <20260826-n-dts-style-checker-continued-v6-3-f270b1e81f8e@oss.qualcomm.com>
Content-Type: text/plain; charset=utf-8
Content-Transfer-Encoding: quoted-printable
Date: Wed, 26 Aug 2026 11:23:42 +0000
Message-Id: <20260826112342.7BF861F000E9@smtp.kernel.org>
Precedence: bulk
X-Mailing-List: devicetree@vger.kernel.org
List-Id: <devicetree.vger.kernel.org>
List-Subscribe: <mailto:devicetree+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:devicetree+unsubscribe@vger.kernel.org>

Thank you for your contribution! Sashiko AI review found 1 potential issue(=
s) to consider:
- [Medium] Incorrect continuation alignment target column calculation when =
block comments precede the first '<' or '"'.
--

commit 88a2bc80735f633fd569467a745101b91a3872d0
Author: Krzysztof Kozlowski <krzysztof.kozlowski@oss.qualcomm.com>

dtc: dt-check-style: Fix alignment of values in continued property lines

This patch updates dt-check-style to check alignment of continued property
values to inner values if they are part of a previous phandle. It ignores
comments and trailing whitespace when determining the continuation alignment
target column.

> diff --git a/scripts/dtc/dt-check-style b/scripts/dtc/dt-check-style
> index 22e1ceac7f8b7..eb5045f0ad9e4 100755
> --- a/scripts/dtc/dt-check-style
> +++ b/scripts/dtc/dt-check-style

[ ... ]

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
> +        target_col =3D _display_col(_strip_strings_and_comments(dl.raw[:=
eq + 1 + m.start(1)]))

[Severity: Medium]
Will this calculate an incorrect target column if a block comment precedes
the first '<' or '"'?

In check_continuation_alignment(), m.start(1) provides an index derived
from rest, which has had comments stripped via _strip_strings_and_comments(=
).=20
However, it is then used to slice dl.raw, which is the original unstripped=
=20
string.=20

If a device tree property assignment contains a block comment between the=20
'=3D' sign and the first '<' or '"' (for example: reg =3D /* comment */ <..=
.>),=20
the m.start(1) index will be too small. This will prematurely truncate=20
dl.raw during the slice (often in the middle of the comment), causing=20
_display_col() to evaluate a much smaller target column than expected.=20

This can lead to false positive warnings for correctly aligned property
continuations.

[ ... ]

--=20
Sashiko AI review =C2=B7 https://sashiko.dev/#/patchset/20260826-n-dts-styl=
e-checker-continued-v6-0-f270b1e81f8e@oss.qualcomm.com?part=3D3
