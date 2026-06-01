Received: from smtp.kernel.org (aws-us-west-2-korg-mail-alma10-1.taild15c8.ts.net [100.103.45.18])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 082E9334692
	for <devicetree@vger.kernel.org>; Mon,  1 Jun 2026 20:55:17 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=100.103.45.18
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1780347318; cv=none; b=GWQ6t8wmQ+F2NlFP3zhS5XrDg6uYRBbVJ/A92P/CMF4vrz36IAEuKUpk/VEbgribYNyNYTr9bUakpV8Hgp2jsxnzuhi7th3EIlvwG1wzibf7s/uS1rQhl2AI26Jl8mF5OMESVUe9Onz2h/8sVQFF4Uu+lgTiIahgjKm1MmDmWXg=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1780347318; c=relaxed/simple;
	bh=B1OC+F+84LZ2bs4MIjM8ll8XRLD4w7brpsFj4GSbCjk=;
	h=From:Subject:To:Cc:In-Reply-To:References:Content-Type:Date:
	 Message-Id; b=DYfiEJL58m/oyJ0GkRIsZSpGX6ikZF5ehfg2hfgAvBnOq/SL6Sech6HocFeS8hoys3zNof3/j9UP6udG5zvKDgfbhAm5dQ7skP1oUFRk8EWWxhnvSv7Dlg1ao9OPXZ7QIwwmUJn7JQOtYMs68LXfSvLA0aakVk1lT1APU4miggo=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=DIAJP0tH; arc=none smtp.client-ip=100.103.45.18
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="DIAJP0tH"
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 7AAAC1F00893;
	Mon,  1 Jun 2026 20:55:17 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kernel.org;
	s=k20260515; t=1780347317;
	bh=bp48UHw2VpvGSTEXG8+XyIsw8wXpu7Oo261IBvBx86I=;
	h=From:Subject:Reply-To:To:Cc:In-Reply-To:References:Date;
	b=DIAJP0tHAhN4Z2pMozrv6VZOtomEq2XsiUQ80yQ9sG0AjNO6yU9wX3efhHWU5tAeD
	 wHWugFXItIDwkhIB0glebZHnuO/FUP9/eReUYswEORaOfsVtVUlhPduiNgyChKQ6ye
	 cLc5whL9MyQ3Kz7cekY+qhi2kqnQn0ieZ4ecT9y79wog7NnPl2C4/zeTKO857P8aN8
	 h+gNmmNfcXp8461Ghvj4SQTyfytZWL/hanw7viQyXDjHBItIz7fRGGTSXKNt6i30l7
	 x63XZ9SbXDeZhxHfcELzAWusx31ZYRlP97Nduavw0GBzHEETO7r62H6yiQdFP4M6iV
	 O99UahK2Zfj4w==
From: sashiko-bot@kernel.org
Subject: Re: [PATCH RFC v6 06/18] fs/resctrl: Let bandwidth resources
 default to min_bw at reset
Reply-To: sashiko-reviews@lists.linux.dev
To: "Drew Fustini" <fustini@kernel.org>
Cc: conor+dt@kernel.org, devicetree@vger.kernel.org, robh@kernel.org
In-Reply-To: <20260601-ssqosid-cbqri-rqsc-v7-0-v6-6-baf00f50028a@kernel.org>
References: <20260601-ssqosid-cbqri-rqsc-v7-0-v6-6-baf00f50028a@kernel.org>
Content-Type: text/plain; charset=utf-8
Content-Transfer-Encoding: quoted-printable
Date: Mon, 01 Jun 2026 20:55:17 +0000
Message-Id: <20260601205517.7AAAC1F00893@smtp.kernel.org>
Precedence: bulk
X-Mailing-List: devicetree@vger.kernel.org
List-Id: <devicetree.vger.kernel.org>
List-Subscribe: <mailto:devicetree+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:devicetree+unsubscribe@vger.kernel.org>

Thank you for your contribution! Sashiko AI review found 1 potential issue(=
s) to consider:

Pre-existing issues:
- [High] Incorrect generation of default cache allocation bitmask using BIT=
_MASK on 32-bit architectures.
--

commit f1fc8abd972980fe11863cf1116bc25deb926540
Author: Drew Fustini <fustini@kernel.org>

fs/resctrl: Let bandwidth resources default to min_bw at reset

This commit modifies bandwidth resources to default to min_bw instead of
max_bw upon reset and group creation when the hardware enforces a
sum-constrained reservation. The default_to_min flag is introduced in
struct resctrl_membw for this purpose.

> diff --git a/include/linux/resctrl.h b/include/linux/resctrl.h
> index 9529ed0d1fdf2..bcbc166412ef1 100644
> --- a/include/linux/resctrl.h
> +++ b/include/linux/resctrl.h

[ ... ]

> @@ -405,7 +412,7 @@ static inline u32 resctrl_get_default_ctrl(struct rdt=
_resource *r)
>  	case RESCTRL_SCHEMA_BITMAP:
>  		return BIT_MASK(r->cache.cbm_len) - 1;
[Severity: High]
This is a pre-existing issue, but does the use of BIT_MASK cause an incorre=
ct
default mask to be generated on 32-bit architectures?

If a system has a maximum cache bitmask length of 32, which is
architecturally allowed by the Intel CAT specification, BITS_PER_LONG is 32
on 32-bit systems. The BIT_MASK macro evaluates to=20
(1UL << ((nr) % BITS_PER_LONG)).

For a cbm_len of 32, 32 % 32 evaluates to 0, which makes BIT_MASK(32) equal
to 1. Subtracting 1 results in a default cache allocation mask of 0 instead
of the expected 0xFFFFFFFF. Could this functionally break the cache
allocation mechanism by starving groups of L3/L2 cache on group creation
and reset?

>  	case RESCTRL_SCHEMA_RANGE:
> -		return r->membw.max_bw;
> +		return r->membw.default_to_min ? r->membw.min_bw : r->membw.max_bw;
>  	}
> =20
>  	return WARN_ON_ONCE(1);

--=20
Sashiko AI review =C2=B7 https://sashiko.dev/#/patchset/20260601-ssqosid-cb=
qri-rqsc-v7-0-v6-0-baf00f50028a@kernel.org?part=3D6
