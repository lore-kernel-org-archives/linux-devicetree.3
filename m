Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=100.103.45.18
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1795363132;
	b=EKu+f0+TupBpqyWF+Qv0VyqNO2d8aXfL/MgH8aRLNOxb04IBaPHDzel4qU8hXbRFTIXM
	 WWA2QBaJLPa0nzMVGTRuBLGHs309/x8mOUgf8NRvtdgui4mayAw6XAdyZlrRnxpl/Ixav
	 EuJ37cokBsXWFic2NZWdfnKRUrGQAB31mlW9Cw/LBUbqLdT0R77KJCB93YYQ+o24Z2dlf
	 OIcslQGaxw20Go9taBWAwXI+MbYBaXu8moL9wW6ybNjC5TFZJdGF2mSgYKlGw/zltlnFx
	 tcJC6Q1C3gNTPHMJOH8JJdUfWGYr8jF8Drshb8nPQjTLJ0OATlWSrNCS1wCXbjFZtZQ==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1795363132;
	h=Received:DKIM-Signature:Message-ID:From:Subject:Reply-To:To:Cc:
	 In-Reply-To:References:Content-Type:Content-Transfer-Encoding:Date;
	bh=VkNsouhm78R/+6qGXHRWt/S5fZecyxYZ6dmODAQUfIQ=;
	b=i2o94wzAeIyHYKYVuqF7LWcnHlJ9iFWYB4pkFS0egOHCoHk1xxdA+g6hyUn093guFs1l
	 Be5+Isgb444ly2nkEbPEQEJjNIm4s86hdd/yf8262N6p+BwcGVcA0raYKeO4nT42sjCQA
	 D1UvWt81mu0yLkCrP4rwdb4hiwSfGQIwE2jfxMA+MVEWzQzv1Q9dlSeGN4iVaN59+l6Hy
	 AZZB3b7VrmRSozIYTUoSyOv4WO3+afn9Trly9ylYnXEZKaum1Uo/k5rrTA8AlKn9iDTe+
	 bjZmsqP1bdE31itmE+1Ue0SSeUvZlCkIMpUCFrokGWEA1a/ZHXoxPOfAimGqYlfEoZQ==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dkim=pass header.d=kernel.org header.i=@kernel.org header.a=rsa-sha256 header.s=k20260515 header.b=RXwIkoeR;
	arc=none smtp.remote-ip=100.103.45.18
Received: from smtp.kernel.org (quasi.space.kernel.org [100.103.45.18])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 3577F606A320
	for <devicetree@vger.kernel.org>; Sun, 22 Nov 2026 15:58:51 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key, unprotected) header.d=kernel.org header.i=@kernel.org header.a=rsa-sha256 header.s=k20260515 header.b=RXwIkoeR
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 67BB61F000D0;
	Sun, 22 Nov 2026 15:58:51 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kernel.org;
	s=k20260515; t=1795363131;
	bh=VkNsouhm78R/+6qGXHRWt/S5fZecyxYZ6dmODAQUfIQ=;
	h=From:Subject:Reply-To:To:Cc:In-Reply-To:References:Date;
	b=RXwIkoeR372izVFEogyI+8JpQ1QTIpOZnbkhYNI1M+XheLmpwCqSKP4dUg4JirdXZ
	 GLSiN3AN8vAFH7wf8sCXRB50gs2hbTKAfHPcEY0ZJMsHDg0UI6RIYzOad4SsDIs9Vq
	 E7Ka+xiCR6L1JjTMd4Up24zg2K2Y1qO1dg/Dat2swqlPkwIfQczLR7eum8V8PhWH6F
	 NonYr4w3UZePAZSxJECBBvSe029sMFQxpwUl91kwLUEdqWAbdF9ZkKj49Ze/D07jCA
	 lsybAnJBrF7yquh2ek5lgjM8mQT7RyI6h9zdA/zcCpKdq1U3iVOZNsx7EY/hKLBySK
	 /B3kl8sSeXdrw==
Message-ID: <sashiko-outbox-228068@kernel.org>
From: sashiko-bot@kernel.org
Subject: Re: [PATCH 2/2] drm/v3d: Remove V3D 3.3 and 4.1 support
Reply-To: sashiko-reviews@lists.linux.dev
To: =?utf-8?b?TWHDrXJhIENhbmFs?= <mcanal@igalia.com>
Cc: dri-devel@lists.freedesktop.org, devicetree@vger.kernel.org, robh@kernel.org, conor+dt@kernel.org
In-Reply-To: <20261122-v3d-remove-33-41-v1-2-52152b454ad8@igalia.com>
References: <20261122-v3d-remove-33-41-v1-0-52152b454ad8@igalia.com>
 <20261122-v3d-remove-33-41-v1-2-52152b454ad8@igalia.com>
Content-Type: text/plain; charset=utf-8
Content-Transfer-Encoding: quoted-printable
Date: Sun, 22 Nov 2026 15:58:50 +0000
X-Mailing-List: devicetree@vger.kernel.org
List-Id: <devicetree.vger.kernel.org>
List-Post: <mailto:devicetree@vger.kernel.org>
List-Help: <mailto:devicetree+help@vger.kernel.org>
List-Subscribe: <mailto:devicetree+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:devicetree+unsubscribe@vger.kernel.org>
List-Owner: <mailto:devicetree+owner@vger.kernel.org>
Precedence: list

Thank you for your contribution! Sashiko AI review found 2 potential
issues to consider:
- [Low] drm/v3d: V3D 3.x OVRTMUOUT bit reported on V3D 4.2 in
  v3d_v3d_debugfs_ident()
- [Low] drm/v3d: stale V3D 3.3 and 4.1 deprecation notice in v3d_drv.c
  DOC comment
--

commit 24570297f583283eb9b4a58e9c2e78e6081f77f1
Author: Ma=C3=ADra Canal <mcanal@igalia.com>

drm/v3d: Remove V3D 3.3 and 4.1 support

This commit removes support for the deprecated V3D 3.3 and V3D 4.1 GPUs,
along with their device tree compatibles, GCA and bridge reset registers,
and V3D 3.x performance counter handling.

> diff --git a/drivers/gpu/drm/v3d/v3d_debugfs.c b/drivers/gpu/drm/v3d/v3d_=
debugfs.c
> index 634cc796ba232..938622c730d04 100644
> --- a/drivers/gpu/drm/v3d/v3d_debugfs.c
> +++ b/drivers/gpu/drm/v3d/v3d_debugfs.c

[ ... ]

> @@ -210,8 +194,6 @@ static int v3d_v3d_debugfs_ident(struct seq_file *m, =
void *unused)
>  		if (v3d->ver <=3D V3D_GEN_42) {
>  			seq_printf(m, "  BCG int:      %d\n",
>  				   (ident2 & V3D_IDENT2_BCG_INT) !=3D 0);
> -		}
> -		if (v3d->ver < V3D_GEN_41) {
>  			seq_printf(m, "  Override TMU: %d\n",
>  				   (misccfg & V3D_MISCCFG_OVRTMUOUT) !=3D 0);
>  		}

[Severity: Low]
Should the "Override TMU" line (along with the misccfg read in
v3d_v3d_debugfs_ident() and V3D_MISCCFG_OVRTMUOUT in v3d_regs.h) be removed
instead of folded into the v3d->ver <=3D V3D_GEN_42 block?

As noted in commit a7dde1b7a5c9 ("drm/v3d: Don't try to set OVRTMUOUT on V3D
4.x."), V3D_MISCCFG_OVRTMUOUT only existed on V3D 3.x, and this patch drops
the corresponding write from v3d_init_core().  Keeping it here causes
v3d_ident on V3D 4.2 to report a V3D 3.x bit that does not exist on V3D 4.x
hardware, and the new "/* Only V3D 4.x */" comment above
V3D_MISCCFG_OVRTMUOUT in v3d_regs.h is also inaccurate.

[ ... ]

> diff --git a/drivers/gpu/drm/v3d/v3d_drv.c b/drivers/gpu/drm/v3d/v3d_drv.c
> index b790be8a7face..0551e9abf17ea 100644
> --- a/drivers/gpu/drm/v3d/v3d_drv.c
> +++ b/drivers/gpu/drm/v3d/v3d_drv.c

[ ... ]

> @@ -421,18 +392,6 @@ static int v3d_platform_drm_probe(struct platform_de=
vice *pdev)
>  	 */
>  	WARN_ON(v3d->ver !=3D gen);
> =20
> -	/* V3D 3.3 and V3D 4.1 has had no in-tree userspace since Mesa
> -	 * dropped support in 2024 (MR#25851) and they have no known users.
> -	 * Due to that, support is scheduled for removal in the next release.
> -	 */
> -	if (v3d->ver <=3D V3D_GEN_41) {
> -		dev_warn(dev,
> -			 "V3D %u.%u support is deprecated and will be removed "
> -			 "in the next kernel release. If you rely on this hardware, "
> -			 "please report it to dri-devel@lists.freedesktop.org.\n",
> -			 v3d->ver / 10, v3d->ver % 10);
> -	}
> -
>  	v3d->cores =3D V3D_GET_FIELD(ident1, V3D_HUB_IDENT1_NCORES);

[Severity: Low]
Should the deprecation paragraph in the "DOC: Broadcom V3D Graphics Driver"
comment at the top of drivers/gpu/drm/v3d/v3d_drv.c also be removed now that
V3D 3.3 and 4.1 support is gone?

drivers/gpu/drm/v3d/v3d_drv.c:
    ...
     * This driver supports the Broadcom V3D 4.2 and 7.1 GPUs.
     *
     * Support for V3D 3.3 and 4.1 GPUs is deprecated and it will be removed
     * in the next kernel release.
    ...

--=20
Sashiko AI review =C2=B7 https://sashiko.dev/#/patchset/20261122-v3d-remove=
-33-41-v1-0-52152b454ad8@igalia.com?part=3D2
