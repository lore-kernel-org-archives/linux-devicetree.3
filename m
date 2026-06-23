Received: from smtp.kernel.org (aws-us-west-2-korg-mail-alma10-1.taild15c8.ts.net [100.103.45.18])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 7584A395ADC
	for <devicetree@vger.kernel.org>; Tue, 23 Jun 2026 20:40:13 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=100.103.45.18
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1782247214; cv=none; b=mbQTO9qkUUaPAtgJeCUfE+j9Z2L+/qRj2oBSitgpvaffxvnTf4WonWRvVRDb4iusqi2BSP+lkHGyj19xxrKqPD3AzlZZS808yRzILO3MqlZoaBYGSspj0CAxvKVYblYvdi49VNWC0UvWtkUvirQz6QYPuHWo+Iq03qqH60Ipr8Q=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1782247214; c=relaxed/simple;
	bh=sD/zksH2mE1kkAJhidqgTnXb1+/8APImKquJezqD1Io=;
	h=From:Subject:To:Cc:In-Reply-To:References:Content-Type:Date:
	 Message-Id; b=N6rTceLhuDHI/f71q3Lu5gUCPnu9qN0g3F52Bnl4JxYrb/1u5vJQo8EQqBfgFIQOmKTe1cmwzAMuttP7B2uKeJMOgiTjHr2rLGjRcevcASBjUStxFKTp6cQk5Y6h+c0KN0zH43P4BzdVSm9QWFrjOOVmwEW4I8g9Kcp5UfAHcf0=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=EyQ1t7bW; arc=none smtp.client-ip=100.103.45.18
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="EyQ1t7bW"
Received: by smtp.kernel.org (Postfix) with ESMTPSA id BF44B1F00A3D;
	Tue, 23 Jun 2026 20:40:12 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kernel.org;
	s=k20260515; t=1782247213;
	bh=rz/Uz3MDqqp3Q062hRrjhSkgMloIHqoA66u6jsIgMVs=;
	h=From:Subject:Reply-To:To:Cc:In-Reply-To:References:Date;
	b=EyQ1t7bWONcoOiFV8j5/QofZL0Ww3DEwIGqHFfAyaWIZsOp613kVh6uT4SSFEZwTI
	 P1A0FlFD57OSSn1+TSC+u1QS99j0ZNhz+ue58WwErJdkFsIEulloexLDg7fVKRBbC4
	 9Xh63s9KOqi2KuwRR3K5JHgoUcLdnvfzouQVzxdA306zLuSB5GlHDrKRU5WZ+t8IFL
	 UfscbAFvIQBOGqfY/KMaWafnDFdYfJKJSM8ti5Jd6jj1CBLu1O9hKmVL/HryaPFj/z
	 0TcW8HiJ44x3VnflhTN05vwSgSs/On75wAN+DZElVq/gG5CjMBaHIhnT8V/egJ0p6y
	 nbSvT15P7EeBw==
From: sashiko-bot@kernel.org
Subject: Re: [PATCH 4/9] drm/rockchip: vop2: Consolidate HDMI PHY PLL clock
 parent switch
Reply-To: sashiko-reviews@lists.linux.dev
To: "Cristian Ciocaltea" <cristian.ciocaltea@collabora.com>
Cc: dri-devel@lists.freedesktop.org, conor+dt@kernel.org, devicetree@vger.kernel.org, robh@kernel.org
In-Reply-To: <20260617-dw-hdmi-qp-yuv-v1-4-a665cfd06d7d@collabora.com>
References: <20260617-dw-hdmi-qp-yuv-v1-0-a665cfd06d7d@collabora.com>
 <20260617-dw-hdmi-qp-yuv-v1-4-a665cfd06d7d@collabora.com>
Content-Type: text/plain; charset=utf-8
Content-Transfer-Encoding: quoted-printable
Date: Tue, 23 Jun 2026 20:40:12 +0000
Message-Id: <20260623204012.BF44B1F00A3D@smtp.kernel.org>
Precedence: bulk
X-Mailing-List: devicetree@vger.kernel.org
List-Id: <devicetree.vger.kernel.org>
List-Subscribe: <mailto:devicetree+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:devicetree+unsubscribe@vger.kernel.org>

Thank you for your contribution! Sashiko AI review found 1 potential issue(=
s) to consider:

Pre-existing issues:
- [High] Calling sleepable functions (`mutex_lock` and CCF APIs) inside an =
atomic context.
--

commit daeb5d187e2f25bcf364f65898a9cf55a75558aa
Author: Cristian Ciocaltea <cristian.ciocaltea@collabora.com>

drm/rockchip: vop2: Consolidate HDMI PHY PLL clock parent switch

This commit refactors the DCLK parent switch logic for HDMI0 and HDMI1
PHY PLLs. It consolidates duplicated clk_get_parent() and clk_set_parent()
calls into a single shared code path based on the active HDMI endpoint.

> diff --git a/drivers/gpu/drm/rockchip/rockchip_drm_vop2.c b/drivers/gpu/d=
rm/rockchip/rockchip_drm_vop2.c
> --- a/drivers/gpu/drm/rockchip/rockchip_drm_vop2.c
> +++ b/drivers/gpu/drm/rockchip/rockchip_drm_vop2.c
[ ... ]
> @@ -1932,42 +1932,34 @@ static void vop2_crtc_atomic_enable(struct drm_cr=
tc *crtc,
[ ... ]
> +		if (pll_hdmiphy) {
> +			if (!vp->dclk_src)
> +				vp->dclk_src =3D clk_get_parent(vp->dclk);
> +
> +			ret =3D clk_set_parent(vp->dclk, pll_hdmiphy);

[Severity: High]
This is a pre-existing issue, but does calling clk_set_parent() here
result in a sleep inside an atomic context?

The vop2_crtc_atomic_enable() function executes as a CRTC atomic enable
callback, which runs in an atomic context where sleeping is forbidden.

Both clk_set_parent() and clk_prepare_enable() (called earlier in this
function) acquire sleepable mutexes, and vop2_lock() internally calls
mutex_lock(). Can this lead to kernel warnings or potential deadlocks
during the atomic commit phase?

> +			if (ret < 0)
> +				drm_warn(vop2->drm,
> +					 "Failed to switch DCLK to HDMI PHY PLL: %d\n",
> +					 ret);
> +		}
>  	}

--=20
Sashiko AI review =C2=B7 https://sashiko.dev/#/patchset/20260617-dw-hdmi-qp=
-yuv-v1-0-a665cfd06d7d@collabora.com?part=3D4
