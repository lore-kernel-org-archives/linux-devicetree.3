Received: from smtp.kernel.org (aws-us-west-2-korg-mail-alma10-1.taild15c8.ts.net [100.103.45.18])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 3448830B517
	for <devicetree@vger.kernel.org>; Wed,  8 Jul 2026 22:07:13 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=100.103.45.18
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1783548435; cv=none; b=FkHRyLn0vgG5i1k1uZHClPJaSknQuaCqtC/chdHbG1YEmIgLsDMx8yrf5uqPCw9gkE3+HfUNuinmJgtUgoBjrkx0/7Ks+CLtIaab44dDWZ3gdmRXynUi/+dbB50gfZ4ebPzy/RHHoU8+Pvk4cGrNkeX3xenfDf2i9gEE0xDneto=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1783548435; c=relaxed/simple;
	bh=Uy6BIeE2RxKRuBmhiJA6UyFIOEgixTaVS0XwhGP5jfU=;
	h=From:Subject:To:Cc:In-Reply-To:References:Content-Type:Date:
	 Message-Id; b=CcoVDLtd/z6fPdw6kbExVCof93XUU+qc/IOkC7AUycbKWHTu62jGSzQN4+9WiGHh1BATF8Eg1qFZrFfW08/MrmGbmWDf0bOrdiIq4cHshysFQlfniJbEdialO1UwA9jBjNVI4JH3bWxoeLcJChQveW31ibmT15bz7ajiol681DU=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=DqM1Ion3; arc=none smtp.client-ip=100.103.45.18
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="DqM1Ion3"
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 3CF3D1F000E9;
	Wed,  8 Jul 2026 22:07:13 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kernel.org;
	s=k20260515; t=1783548433;
	bh=cx7sCC72Rb5ZKhm5QhYr0VJzve760uPVVRldcv4QzG8=;
	h=From:Subject:Reply-To:To:Cc:In-Reply-To:References:Date;
	b=DqM1Ion30QKok/H+f7ErmpqQwYmnlAntEvmRhnSWOLpIL6bdHBkWGucLXTK52Jakf
	 vOXrT96Ws0uzmCWVgOhRvQ+UAJ7oxV+LJf/RqxNCWi06EZSX+MCSb224lCeXxwkBhY
	 XJyHV81sCdy9tVW783oEOzTNXpk6WaEAV55OJGVF1OStVAyAKFwdHpLPnzuphfYUmN
	 22KfEhEy7+cOhSnyr8AvVQp+S9kK6DW/CC9qOPiXvY7J7QU+oZXJuVMpjkC/tLOXx7
	 vMLpWPdii4N2TZ7+nkQF9ADTSeiGOg7j3pAM5AbXA7j6Fqa0Sqo97e7a+O3CQ80X2s
	 YSy7+wrIFRy6Q==
From: sashiko-bot@kernel.org
Subject: Re: [PATCH v3 02/14] drm/rockchip: vop2: Fix resource leak on
 vop2_enable() error path
Reply-To: sashiko-reviews@lists.linux.dev
To: "Cristian Ciocaltea" <cristian.ciocaltea@collabora.com>
Cc: conor+dt@kernel.org, devicetree@vger.kernel.org, dri-devel@lists.freedesktop.org, robh@kernel.org
In-Reply-To: <20260709-dw-hdmi-qp-yuv-v3-2-a4a982a9f2e7@collabora.com>
References: <20260709-dw-hdmi-qp-yuv-v3-0-a4a982a9f2e7@collabora.com>
 <20260709-dw-hdmi-qp-yuv-v3-2-a4a982a9f2e7@collabora.com>
Content-Type: text/plain; charset=utf-8
Content-Transfer-Encoding: quoted-printable
Date: Wed, 08 Jul 2026 22:07:12 +0000
Message-Id: <20260708220713.3CF3D1F000E9@smtp.kernel.org>
Precedence: bulk
X-Mailing-List: devicetree@vger.kernel.org
List-Id: <devicetree.vger.kernel.org>
List-Subscribe: <mailto:devicetree+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:devicetree+unsubscribe@vger.kernel.org>

Thank you for your contribution! Sashiko AI review found 1 potential issue(=
s) to consider:
- [High] The patch modifies `vop2_enable()` to return an error code and cle=
anly unwind resources on failure, but fails to update its caller `vop2_crtc=
_atomic_enable()` to check this return value. This converts a resource leak=
 into a critical double-free and system crash.
--

--- Patch [2]: [PATCH v3 02/14] drm/rockchip: vop2: Fix resource leak on vo=
p2_enable() error path ---
commit d8725e1d1e43785d7a93679c9bc6634b3ebd7fab
Author: Cristian Ciocaltea <cristian.ciocaltea@collabora.com>

drm/rockchip: vop2: Fix resource leak on vop2_enable() error path

vop2_enable() returns void, so callers cannot tell whether powering up
the VOP2 succeeded.

Additionally, if rockchip_drm_dma_attach_device() fails, vop2_enable()
returns without disabling the core clocks or dropping the runtime PM
reference taken earlier, leaking both.

Make vop2_enable() return int and unwind all resources on every failure
path.  As disabling the core clocks is also needed in vop2_disable(),
factor it out into a local helper used by both.

Link: https://lore.kernel.org/all/20260623202043.8BFE21F000E9@smtp.kernel.o=
rg/

> diff --git a/drivers/gpu/drm/rockchip/rockchip_drm_vop2.c b/drivers/gpu/d=
rm/rockchip/rockchip_drm_vop2.c
> index 4cce3e336f5b3..e11dc8c7f78ba 100644
> --- a/drivers/gpu/drm/rockchip/rockchip_drm_vop2.c
> +++ b/drivers/gpu/drm/rockchip/rockchip_drm_vop2.c

[ ... ]

> @@ -871,7 +878,7 @@ static void rk3588_vop2_power_domain_enable_all(struc=
t vop2 *vop2)
>  	vop2_writel(vop2, RK3588_SYS_PD_CTRL, pd);
>  }
> =20
> -static void vop2_enable(struct vop2 *vop2)
> +static int vop2_enable(struct vop2 *vop2)
>  {
>  	int ret;
>  	u32 version;

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
> +
> +	return ret;
>  }

[Severity: High]
Does this code leave vop2_crtc_atomic_enable() vulnerable to a crash if
vop2_enable() fails?

The newly added error path in vop2_enable() unwinds resources (power and
clocks), invalidating the assumption that the hardware is active.

However, the caller vop2_crtc_atomic_enable() still ignores the return
value:

	if (!vop2->enable_count)
		vop2_enable(vop2);

	vop2->enable_count++;

If vop2_enable() fails (e.g., due to DMA attach failure), it disables the
core clocks and puts the PM runtime.

Because vop2_crtc_atomic_enable() ignores the error, it unconditionally
increments enable_count and proceeds to access VOP2 MMIO registers.

Can this result in a system crash (Synchronous External Abort) due to MMIO
access to unpowered/unclocked hardware, followed by a double-free of PM
runtime and clock resources on teardown?

--=20
Sashiko AI review =C2=B7 https://sashiko.dev/#/patchset/20260709-dw-hdmi-qp=
-yuv-v3-0-a4a982a9f2e7@collabora.com?part=3D2
