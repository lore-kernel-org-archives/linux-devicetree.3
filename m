Received: from smtp.kernel.org (aws-us-west-2-korg-mail-alma10-1.taild15c8.ts.net [100.103.45.18])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 3A368402B8A
	for <devicetree@vger.kernel.org>; Wed, 22 Jul 2026 07:24:45 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=100.103.45.18
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1784705087; cv=none; b=foudu7EmSx1eKd/C/f8jHC2e/XDZNbbCGsRUK5/e49Hx+aFi89ql9p0r/LPW+YRRqlqTELxeS5E7u4YDbJ4E+VcpJf+uIa8V34YBjKzw8JnABXmlfTewjo+N0LUwupKp0af/EQgheWt/6hEtk1pAu/lQIg5kDtG7AqHwcuNksPE=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1784705087; c=relaxed/simple;
	bh=KLl5SyVy1En02+8woY47MAapxP7f4/Cu/6xzTvgXArA=;
	h=From:Subject:To:Cc:In-Reply-To:References:Content-Type:Date:
	 Message-Id; b=CIwSlFHC6/RbZxONDP+goupf6LMy6xvqeYHaUb07P/qTucxOLwlIk+9AFut0pNkGNO/w297i6tUH2NRX8ayi2S1PwnL/Kz82HqOquaZv8FT917l98ELESxtuCij7G/ckbM0tfojnta+I/fGt2LvnyPmBrEOvR4UWUKgPhz144c0=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=cWLbz1AR; arc=none smtp.client-ip=100.103.45.18
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="cWLbz1AR"
Received: by smtp.kernel.org (Postfix) with ESMTPSA id DD96E1F000E9;
	Wed, 22 Jul 2026 07:24:44 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kernel.org;
	s=k20260515; t=1784705085;
	bh=KwWMoDlD5SKsj5BWyoTQ2XPBDseOtegmrfV6UOh0Xo0=;
	h=From:Subject:Reply-To:To:Cc:In-Reply-To:References:Date;
	b=cWLbz1ARFHTXy3MytSnUaQjY2Lvs468Djj1BPh1mXDDo001dXlZEgSONDb1iRLQXb
	 Rd6rSRE289mQC/Tdu+kllu8udlQV3LzkmZ8HG2NE+qOVpwMNusSReErVDQo3vt5wo1
	 JUmdCSx9cd1IuEHo6ZzDTptqcP3RYIDlHg/2zNIB2Vp7AJA+NJA9zyddf4XEibwWqb
	 gWyIG4qP2+MKgGRKDyzCgA63ZU5JyOM5QAxT8mEGZHz32eT+V+mKkkF6G10ARJqPHf
	 +/1QwjNKk+Rrhp5YMRlG07x/g2rKe2gXOqXEUeGSzFy/rxjGixcNSxmCkhlMuuQ6hL
	 iv5qeL9wmzR5A==
From: sashiko-bot@kernel.org
Subject: Re: [PATCH v4 5/7] of/overlay: return ERR_PTR from
 dup_and_fixup_symbol_prop()
Reply-To: sashiko-reviews@lists.linux.dev
To: "Abdurrahman Hussain" <abdurrahman@nexthop.ai>
Cc: conor+dt@kernel.org, robh@kernel.org, devicetree@vger.kernel.org
In-Reply-To: <20260722-nh-of-alias-overlay-v4-5-fc96a40d2761@nexthop.ai>
References: <20260722-nh-of-alias-overlay-v4-0-fc96a40d2761@nexthop.ai>
 <20260722-nh-of-alias-overlay-v4-5-fc96a40d2761@nexthop.ai>
Content-Type: text/plain; charset=utf-8
Content-Transfer-Encoding: quoted-printable
Date: Wed, 22 Jul 2026 07:24:44 +0000
Message-Id: <20260722072444.DD96E1F000E9@smtp.kernel.org>
Precedence: bulk
X-Mailing-List: devicetree@vger.kernel.org
List-Id: <devicetree.vger.kernel.org>
List-Subscribe: <mailto:devicetree+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:devicetree+unsubscribe@vger.kernel.org>

Thank you for your contribution! Sashiko AI review found 1 potential issue(=
s) to consider:

Pre-existing issues:
- [High] When an overlay targets the root node (`/`), `dup_and_fixup_symbol=
_prop` creates malformed device tree paths with a double slash (`//`), prev=
enting the symbol or alias from being resolved.
--

--- Patch [5]: [PATCH v4 5/7] of/overlay: return ERR_PTR from dup_and_fixup=
_symbol_prop() ---
commit 5d340ac0a28e3bab97719502d9467e332f065d74
Author: Abdurrahman Hussain <abdurrahman@nexthop.ai>

of/overlay: return ERR_PTR from dup_and_fixup_symbol_prop()

This commit modifies dup_and_fixup_symbol_prop() to return distinct ERR_PTR
values instead of NULL for different failure cases. It also adds verificati=
on
to ensure the value descends through the matched fragment's __overlay__ node
before slicing it.

> diff --git a/drivers/of/overlay.c b/drivers/of/overlay.c
> index 284c9bc6c9cfc..d4d2591e735ac 100644
> --- a/drivers/of/overlay.c
> +++ b/drivers/of/overlay.c
[ ... ]
> @@ -243,18 +249,27 @@ static struct property *dup_and_fixup_symbol_prop(
[ ... ]
>  	path_tail =3D path + overlay_name_len;
>  	path_tail_len =3D strlen(path_tail);
> =20
>  	target_path =3D kasprintf(GFP_KERNEL, "%pOF", fragment->target);
>  	if (!target_path)
> -		return NULL;
> +		return ERR_PTR(-ENOMEM);
>  	target_path_len =3D strlen(target_path);
> =20

[Severity: High]
This is a pre-existing issue, but since the commit message notes this helper
is being prepared for /aliases, could the concatenation of target_path and
path_tail further down in dup_and_fixup_symbol_prop() create invalid paths
when the overlay targets the root node?

When fragment->target is the root node, target_path evaluates to "/". If
path_tail references a fragment-internal path and starts with a slash
(e.g., "/my_node"), unconditionally concatenating them without deduplicating
the connecting slash creates a path like "//my_node":

    memcpy(new_prop->value, target_path, target_path_len);
    memcpy(new_prop->value + target_path_len, path_tail, path_tail_len);

Because __of_find_node_by_full_path() fails on empty path components, any
alias or symbol in an overlay targeting the root node will silently fail to
resolve. Does this need to be addressed so drivers relying on these aliases
do not fail to probe?

[ ... ]

--=20
Sashiko AI review =C2=B7 https://sashiko.dev/#/patchset/20260722-nh-of-alia=
s-overlay-v4-0-fc96a40d2761@nexthop.ai?part=3D5
