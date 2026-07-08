Received: from smtp.kernel.org (aws-us-west-2-korg-mail-alma10-1.taild15c8.ts.net [100.103.45.18])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id B4DB43EFFC4
	for <devicetree@vger.kernel.org>; Wed,  8 Jul 2026 07:24:38 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=100.103.45.18
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1783495490; cv=none; b=Fw9uiZVKpSLUcPXyRF937eaWBm2kB0LTCgI8JRz4vOrcyjXzrmUlQQ+NfmjQGGRE/31m5bvRQo00iN3xyTEnMoVMhydr+F6WdaB9X4Q+NXe8TIhdvFdmMSlqGZatClwr4wgx4qDkmR52DgIiKWAcRdM7llOZA7/lRv6WV6prxq8=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1783495490; c=relaxed/simple;
	bh=SsLFigvesMEIHd20e/R2WYHsJ9mAbZk3c2gOeGq+DJk=;
	h=From:Subject:To:Cc:In-Reply-To:References:Content-Type:Date:
	 Message-Id; b=eBFXyiLnOb5dqYvUEKzunOhEIvCRM8z/27Lhcx6Hoz8s6tvEujCWSexWilghHtD5MIaMhmlo9D6JsUEszmcb6THXK1qcyZurCS94Timx4PMF4V6Jr9BhVt+2tuz//SNJkySP8fvsMDJoczDum3GG2OfbZV4U2pH1OnO4Usas8Pg=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=YG1Bd7Zs; arc=none smtp.client-ip=100.103.45.18
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="YG1Bd7Zs"
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 590E81F000E9;
	Wed,  8 Jul 2026 07:24:36 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kernel.org;
	s=k20260515; t=1783495476;
	bh=33mh9Awz1pwFX9S5L01cw4bsUSApe5wLe2ECJawhhps=;
	h=From:Subject:Reply-To:To:Cc:In-Reply-To:References:Date;
	b=YG1Bd7ZsxRlR+2kN+BxyzryF5qHsnd8dZGoQO37TukixqI6ga95LtGrbRoLvGLxi1
	 GuLriotTzInBUh3dpWVbsteEMwh7NNeorukDUzuxEN8qtZxcY9UsJfugMJShdoJgLL
	 BlIdztbb2C20AbZbUjOd7oxky+faMxR+Lt+1pRis1p6PjpqE1DnnUDO4y3auJlllY7
	 GLkHpwDyOYN3/nhRUb9PbvUf7FNfoT4VXrRca5YYi1nJYP6o6wAiOW3ffnWWrXRc9Y
	 Jj30C5cySi5EgxLoD+uwdNZh+RqT1ZUP50W9Ld+4k2+nXIv5mnscsk1Z0O1yP37qz1
	 tjur7UyVooIUg==
From: sashiko-bot@kernel.org
Subject: Re: [PATCH v3 21/26] printk: Register information into meminspect
Reply-To: sashiko-reviews@lists.linux.dev
To: "Mukesh Ojha" <mukesh.ojha@oss.qualcomm.com>
Cc: devicetree@vger.kernel.org, conor+dt@kernel.org, robh@kernel.org
In-Reply-To: <20260708-meminspect-v3-v3-21-7aa5a0a74d5c@oss.qualcomm.com>
References: <20260708-meminspect-v3-v3-0-7aa5a0a74d5c@oss.qualcomm.com>
 <20260708-meminspect-v3-v3-21-7aa5a0a74d5c@oss.qualcomm.com>
Content-Type: text/plain; charset=utf-8
Content-Transfer-Encoding: quoted-printable
Date: Wed, 08 Jul 2026 07:24:35 +0000
Message-Id: <20260708072436.590E81F000E9@smtp.kernel.org>
Precedence: bulk
X-Mailing-List: devicetree@vger.kernel.org
List-Id: <devicetree.vger.kernel.org>
List-Subscribe: <mailto:devicetree+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:devicetree+unsubscribe@vger.kernel.org>

Thank you for your contribution! Sashiko AI review found 1 potential issue(=
s) to consider:
- [Medium] The dynamic log buffer is registered into meminspect with a size=
 of 0.
--

--- Patch [21]: [PATCH v3 21/26] printk: Register information into meminspe=
ct ---
commit 898d5571e45a9513c93cedd97dbc95171637944b
Author: Mukesh Ojha <mukesh.ojha@oss.qualcomm.com>

printk: Register information into meminspect

This commit annotates vital static and dynamic printk variables for the
meminspect debugging tool. It registers variables like the dynamic log
buffers and info structures into the meminspect table during setup.

> diff --git a/kernel/printk/printk.c b/kernel/printk/printk.c
> index 2fe9a963c823a..f7f32c09b9b81 100644
> --- a/kernel/printk/printk.c
> +++ b/kernel/printk/printk.c

[ ... ]

> @@ -1238,6 +1246,10 @@ void __init setup_log_buf(int early)
> =20
>  	local_irq_restore(flags);
> =20
> +	meminspect_lock_register_va(new_log_buf, new_log_buf_len);

[Severity: Medium]
Will this register the region with a size of 0?

Looking earlier in setup_log_buf(), new_log_buf_len is explicitly
zeroed out before this call:

	log_buf_len =3D new_log_buf_len;
	log_buf =3D new_log_buf;
	new_log_buf_len =3D 0;

Could this call be changed to use log_buf_len instead so the proper size
is registered?

> +	meminspect_lock_register_va(new_descs, new_descs_size);
> +	meminspect_lock_register_va(new_infos, new_infos_size);

--=20
Sashiko AI review =C2=B7 https://sashiko.dev/#/patchset/20260708-meminspect=
-v3-v3-0-7aa5a0a74d5c@oss.qualcomm.com?part=3D21
