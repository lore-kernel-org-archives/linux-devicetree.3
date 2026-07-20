Received: from smtp.kernel.org (aws-us-west-2-korg-mail-alma10-1.taild15c8.ts.net [100.103.45.18])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 2D24B3D170E
	for <devicetree@vger.kernel.org>; Mon, 20 Jul 2026 08:58:44 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=100.103.45.18
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1784537926; cv=none; b=aRkhXkBK5WVP+QqzruKFL2fJ/XS5Fiw6kZ+NyBNSevWdsgBBaxx+mF7ZQdk0BSqMXE0ETCFlT+HZloXVS1Gc03+HJVmylVH4zS0kk0UHhGt9OJ4mIM72KQtV5YZT+b8Z9gJCXxuIurkpcsmOcpwOb1Kgc1pJRVUWsjTWv8YUtEw=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1784537926; c=relaxed/simple;
	bh=T/zOlZGiVHt1xceARjbjW0+fEmEM+23crgQQQr3p8Tc=;
	h=From:Subject:To:Cc:In-Reply-To:References:Content-Type:Date:
	 Message-Id; b=KIS2WgJsCMVzBC8Mu0FnVbUS4WwzQ6pVRbXu+MxRxkCHyf35TQNfT5svq2NEhFPmkYGapJCaSo1jTqPtiyHevOCfdSRLQ5KEKIeY+X0y+9A3AmfkikUfF6NXm88uqlhykkZpSe9WwmY0l2DExSoXqgIkGUBj+s9gNk3Pa3pSMAs=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=GYDYIwSJ; arc=none smtp.client-ip=100.103.45.18
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="GYDYIwSJ"
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 9B1221F000E9;
	Mon, 20 Jul 2026 08:58:44 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kernel.org;
	s=k20260515; t=1784537924;
	bh=Iijv4ZpqfnV0aD7drMae5ETUPImumQ+IgL5SHeKN1hE=;
	h=From:Subject:Reply-To:To:Cc:In-Reply-To:References:Date;
	b=GYDYIwSJYBw+av0ZrMJdQZzCXYPg4IoFB+5piq2pCnLuDVsjUBlN79OOxS4BUVSyc
	 if4BvZF3YOCmBxsYLfZiLxt+xdy0k1ePXvkOEm3qGD5+AoOZ7RcbOvJZQYBmFBq1QE
	 vtN1JgI8N0V0XZ7+oGthCIRTBY88NptQRYO7GXcLB6r9k92ivEonYSy58+5rYfewte
	 m1u3c3oZe+c+iKkMVgi2L3WMglwbe6NT6m7Z74dWxsXLaBdnlYGcT2J57TWqPAiroN
	 EblBLoaUIGbcpPAePxU1Jj3iHF3H8IHkiGwd5lA42n0rqHSR0Akux2ee/e6CPwcEE+
	 3QBpLFsIQMkUg==
From: sashiko-bot@kernel.org
Subject: Re: [PATCH 2/3] drm/msm/mdss: Enable INT2_GDSC alongside CORE_GDSC
Reply-To: sashiko-reviews@lists.linux.dev
To: "Yongxing Mou" <yongxing.mou@oss.qualcomm.com>
Cc: dri-devel@lists.freedesktop.org, robh@kernel.org, conor+dt@kernel.org, devicetree@vger.kernel.org
In-Reply-To: <20260720-msm_gdsc2-v1-2-4687866d6cb0@oss.qualcomm.com>
References: <20260720-msm_gdsc2-v1-0-4687866d6cb0@oss.qualcomm.com>
 <20260720-msm_gdsc2-v1-2-4687866d6cb0@oss.qualcomm.com>
Content-Type: text/plain; charset=utf-8
Content-Transfer-Encoding: quoted-printable
Date: Mon, 20 Jul 2026 08:58:44 +0000
Message-Id: <20260720085844.9B1221F000E9@smtp.kernel.org>
Precedence: bulk
X-Mailing-List: devicetree@vger.kernel.org
List-Id: <devicetree.vger.kernel.org>
List-Subscribe: <mailto:devicetree+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:devicetree+unsubscribe@vger.kernel.org>

Thank you for your contribution! Sashiko AI review found 1 potential issue(=
s) to consider:
- [High] Missing cleanup for IRQ domain and chained handler on power domain=
 attach failure.
--

--- Patch [2]: [PATCH 2/3] drm/msm/mdss: Enable INT2_GDSC alongside CORE_GD=
SC ---
commit 9d271e868146fa30f583363d709a200283bfe76e
Author: Yongxing Mou <yongxing.mou@oss.qualcomm.com>

drm/msm/mdss: Enable INT2_GDSC alongside CORE_GDSC

This patch explicitly attaches and manages the secondary INT2_GDSC power
domain for platforms that use it. It also ensures both power domains are
enabled during MDSS runtime PM activation.

> diff --git a/drivers/gpu/drm/msm/msm_mdss.c b/drivers/gpu/drm/msm/msm_mds=
s.c
> index 9087c4b290dba..63ece55c4f2ec 100644
> --- a/drivers/gpu/drm/msm/msm_mdss.c
> +++ b/drivers/gpu/drm/msm/msm_mdss.c

[ ... ]

> @@ -421,6 +451,27 @@ static struct msm_mdss *msm_mdss_init(struct platfor=
m_device *pdev, bool is_mdp5
>  	irq_set_chained_handler_and_data(irq, msm_mdss_irq,
>  					 msm_mdss);
> =20
> +	/*
> +	 * When two power domains are listed in DT, the core framework does not
> +	 * auto-attach either of them.  Attach and manage both explicitly so
> +	 * that INT2_GDSC (needed for VIG2/VIG3) is enabled alongside the main
> +	 * CORE_GDSC.  Single-domain platforms are unaffected.
> +	 */
> +	if (of_count_phandle_with_args(pdev->dev.of_node, "power-domains",
> +				       "#power-domain-cells") > 1) {
> +		static const char * const mdss_pd_names[] =3D { "core", "int2" };
> +		static const struct dev_pm_domain_attach_data pd_data =3D {
> +			.pd_names =3D mdss_pd_names,
> +			.num_pd_names =3D ARRAY_SIZE(mdss_pd_names),
> +			.pd_flags =3D PD_FLAG_NO_DEV_LINK,
> +		};
> +
> +		ret =3D devm_pm_domain_attach_list(&pdev->dev, &pd_data,
> +						 &msm_mdss->pd_list);
> +		if (ret < 0)
> +			return ERR_PTR(ret);

[Severity: High]
If devm_pm_domain_attach_list() fails here, we return directly with an error
pointer. Since the msm_mdss structure is allocated with devm_kzalloc(), it
will be automatically freed by the devres subsystem when the probe fails.

However, irq_set_chained_handler_and_data() was already called just above to
register msm_mdss_irq() with msm_mdss as its data pointer.

Could this leave a dangling pointer in the active chained handler, resulting
in a use-after-free if an interrupt fires? Also, do we need to clean up the
IRQ domain created by _msm_mdss_irq_domain_add() before returning on this
error path?

> +	}
> +
>  	pm_runtime_enable(&pdev->dev);
> =20
>  	return msm_mdss;

--=20
Sashiko AI review =C2=B7 https://sashiko.dev/#/patchset/20260720-msm_gdsc2-=
v1-0-4687866d6cb0@oss.qualcomm.com?part=3D2
