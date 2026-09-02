Received: from smtp.kernel.org (aws-us-west-2-korg-mail-alma10-1.taild15c8.ts.net [100.103.45.18])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 2101845560E
	for <devicetree@vger.kernel.org>; Wed,  2 Sep 2026 23:03:28 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=100.103.45.18
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1788390209; cv=none; b=Mcv3UEmBJp5pRRFJl5FDAHI7tiTBoycWQ2Nei070Aym2hpqzqk/eBWzCzE8iWX2eRTkr6aZOThdEC8i6nDe4Qf/NB1+rDn6JElz1ntYH9R94LQxnXKQ2YHpxiqYAIMgrwrZ5a5/fSE48zf5kV7KstdVW0qzGQlTxN00I1LWMtqk=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1788390209; c=relaxed/simple;
	bh=rqx5QF93VRsl1GFA0XRQH0usvnywT//cWSd4EbiJDzI=;
	h=From:Subject:To:Cc:In-Reply-To:References:Content-Type:Date:
	 Message-Id; b=gbd6MJkXrCW6wbXsqKCDzQ79VT/1uishjO093IlWqtyo3oy5cGuuuR7jIPDu6jff2pVdtPKC9u9FzQm06TS8SJVf3NohB7e8XLN/5IZ+uhjPqcUVti/KjygeQ1M4PAPHm9161Mw818HSCsVBewhjRx7Al9M087NJeDj8WZJYacQ=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=QibbOJz3; arc=none smtp.client-ip=100.103.45.18
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="QibbOJz3"
Received: by smtp.kernel.org (Postfix) with ESMTPSA id C326D1F000E9;
	Wed,  2 Sep 2026 23:03:27 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kernel.org;
	s=k20260515; t=1788390208;
	bh=g52ZWyW1G8Ft6mgwhCooyKuPcNZkzn7OWWCpY26FdPo=;
	h=From:Subject:Reply-To:To:Cc:In-Reply-To:References:Date;
	b=QibbOJz3IbquYPia9ePQ4tZ3PWFjrlIAhhjctOZamqMkgvMJ4wuk1/KsJ4aetG9Ah
	 3g162MAYA/5biAIDd2AWULnZJmR8dyI5YlNrI2N/OOGJGgFGs1sgeaH4yGMmLS8qGS
	 sJ77tN0zbTBRfX/SKfpn0PtEbWiBi6j0eYcj+oX2O+bbgxUAovrxO8pSx+Yf7cJxLx
	 1q87WQ8BMJ/Bf7GZ2EDhgn/JhvQwOdDly6bcjep+6IgaK0LrlNuwsgWIbg+/q2SmU3
	 +xAGgi8TW1a5COEb4XgZoB1vagxOr/HcDwPtk2j1K7yS/387er3dBSEzRZTl1dcFQk
	 7Li2/eAgJoeWA==
From: sashiko-bot@kernel.org
Subject: Re: [PATCH v4 02/14] drm/rockchip: vop2: Fix resource leak on
 vop2_enable() error path
Reply-To: sashiko-reviews@lists.linux.dev
To: "Cristian Ciocaltea" <cristian.ciocaltea@collabora.com>
Cc: robh@kernel.org, devicetree@vger.kernel.org, conor+dt@kernel.org, dri-devel@lists.freedesktop.org
In-Reply-To: <20260903-dw-hdmi-qp-yuv-v4-2-fb45bf4147eb@collabora.com>
References: <20260903-dw-hdmi-qp-yuv-v4-0-fb45bf4147eb@collabora.com>
 <20260903-dw-hdmi-qp-yuv-v4-2-fb45bf4147eb@collabora.com>
Content-Type: text/plain; charset=utf-8
Content-Transfer-Encoding: quoted-printable
Date: Wed, 02 Sep 2026 23:03:27 +0000
Message-Id: <20260902230327.C326D1F000E9@smtp.kernel.org>
Precedence: bulk
X-Mailing-List: devicetree@vger.kernel.org
List-Id: <devicetree.vger.kernel.org>
List-Subscribe: <mailto:devicetree+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:devicetree+unsubscribe@vger.kernel.org>

Thank you for your contribution! Sashiko AI review found 1 potential issue(=
s) to consider:

Pre-existing issues:
- [High] Use of sleeping functions in an atomic context path.
--

commit 3156fa20e2cac505ec1966277bb361639a86a353
Author: Cristian Ciocaltea <cristian.ciocaltea@collabora.com>

drm/rockchip: vop2: Fix resource leak on vop2_enable() error path

This commit modifies vop2_enable() to return an int and gracefully unwind
resources such as clocks and runtime PM references if initialization steps=
=20
like rockchip_drm_dma_attach_device() fail. It addresses a resource leak=20
where previously the function returned void without disabling clocks or=20
dropping the PM reference on error.

Link: https://lore.kernel.org/all/20260623202043.8BFE21F000E9@smtp.kernel.o=
rg/

> diff --git a/drivers/gpu/drm/rockchip/rockchip_drm_vop2.c b/drivers/gpu/d=
rm/rockchip/rockchip_drm_vop2.c
> --- a/drivers/gpu/drm/rockchip/rockchip_drm_vop2.c
> +++ b/drivers/gpu/drm/rockchip/rockchip_drm_vop2.c
[ ... ]
> @@ -932,6 +938,17 @@ static void vop2_enable(struct vop2 *vop2)
>  		    VOP2_INT_BUS_ERRPR << 16 | VOP2_INT_BUS_ERRPR);
>  	vop2_writel(vop2, RK3568_SYS1_INT_EN,
>  		    VOP2_INT_BUS_ERRPR << 16 | VOP2_INT_BUS_ERRPR);
> +
> +	return 0;
> +
> +err_detach_dma:
> +	rockchip_drm_dma_detach_device(vop2->drm, vop2->dev);
> +err_disable_clks:
> +	vop2_core_clks_disable_unprepare(vop2);
> +err_put_pm:
> +	pm_runtime_put_sync(vop2->dev);

[Severity: High]
This is a pre-existing issue, but is it safe to execute a sleeping function
here?=20

The DRM subsystem guidelines indicate that CRTC atomic_enable callbacks are
atomic context paths where sleeping is strictly forbidden. Since vop2_enabl=
e()
is called from the vop2_crtc_atomic_enable() callback, wouldn't executing
pm_runtime_put_sync() (as well as clk_prepare_enable() and
pm_runtime_resume_and_get() earlier in this function) cause system panics
such as scheduling while atomic or deadlocks during a display bring-up
or modeset?

> +
> +	return ret;
>  }

--=20
Sashiko AI review =C2=B7 https://sashiko.dev/#/patchset/20260903-dw-hdmi-qp=
-yuv-v4-0-fb45bf4147eb@collabora.com?part=3D2
