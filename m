Received: from smtp.kernel.org (aws-us-west-2-korg-mail-alma10-1.taild15c8.ts.net [100.103.45.18])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id D2E443A5449
	for <devicetree@vger.kernel.org>; Tue,  8 Sep 2026 10:25:14 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=100.103.45.18
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1788863115; cv=none; b=LyYhwpbETOT4BwQou569CP/9RSOisfyKI9AWSS1tKdXNAFo1hUrrVQSP/EIbmhV9ezMWyzygpXcTI9PQjswkwmwkCuFQOsJGd9nlle9ULHPtv0hONNs7iZ35VAKGftlsAOKRmoVnMquZnz2YgxOOuICEhGmbnAuJh8tQnga2MkM=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1788863115; c=relaxed/simple;
	bh=uzlunk3uha53WwPGqdhuMA3lYxgOc1yCiBR27zIifFU=;
	h=From:Subject:To:Cc:In-Reply-To:References:Content-Type:Date:
	 Message-Id; b=D57MUBG+i5/fa7Nw5ezalSOQn09/I86rMdhfPdGcJs7HHoN0kn8cU4Z76D2BAwl3A8IYa0fOHgAAo/bQVkycCHTrw2zTx/bKRTP7RjipYRK17PY7lrLG3/d53GKmMMU1lmNdBIW2vGmRYQn9ccaTVuIJyk7y8O/olfh6XQZGoJc=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=AmnXjVEu; arc=none smtp.client-ip=100.103.45.18
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="AmnXjVEu"
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 2DC421F00A3A;
	Tue,  8 Sep 2026 10:25:14 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kernel.org;
	s=k20260515; t=1788863114;
	bh=rEzQ6ayJAg7RrHmfB+EXUB5y77SWHviAFKVUFK7K8uA=;
	h=From:Subject:Reply-To:To:Cc:In-Reply-To:References:Date;
	b=AmnXjVEuOj44Pa+C1Ux8nACrkUom/s1IagJM6bemqrgZAwAO9NXqcYO7XiRcwu11L
	 I1fmUmmYGAI/Owm97+8KUW3MSH8hIQX7iOYmP2R7StCSf1iGLHRyeZWQYxafbS7eHu
	 nCxkbIWVTExVsXAmgbcJHz4ZwyTt8xBblj/ntToevsVngqlkh1r9lVggd2vGxRt1/E
	 sCy6ABbfaKGFseQ6jF/TvzWNqPNgCT2txh5yjg7eaMz3sGTqOwzeILGFBF6DH7RCzP
	 1ireD5I5UmAEzxuIYX5VpfsRrpK8maheAswLqoMfQkrpRVeBy7wt5RsSXfTopoItfj
	 yicbpy1ISDzGg==
From: sashiko-bot@kernel.org
Subject: Re: [PATCH v6 6/6] drm/verisilicon: extend Kconfig to support
 ARCH_MA35 platforms
Reply-To: sashiko-reviews@lists.linux.dev
To: "Joey Lu" <a0987203069@gmail.com>
Cc: dri-devel@lists.freedesktop.org, conor+dt@kernel.org, devicetree@vger.kernel.org, robh@kernel.org
In-Reply-To: <20260908092840.225220-7-a0987203069@gmail.com>
References: <20260908092840.225220-1-a0987203069@gmail.com>
 <20260908092840.225220-7-a0987203069@gmail.com>
Content-Type: text/plain; charset=utf-8
Content-Transfer-Encoding: quoted-printable
Date: Tue, 08 Sep 2026 10:25:13 +0000
Message-Id: <20260908102514.2DC421F00A3A@smtp.kernel.org>
Precedence: bulk
X-Mailing-List: devicetree@vger.kernel.org
List-Id: <devicetree.vger.kernel.org>
List-Subscribe: <mailto:devicetree+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:devicetree+unsubscribe@vger.kernel.org>

Thank you for your contribution! Sashiko AI review found 1 potential issue(=
s) to consider:
- [High] The CRTC pixel clock is disabled before the hardware is instructed=
 to disable the CRTC.
--

commit c35af4d919e849e303afa29d897c4d1581720138
Author: Joey Lu <a0987203069@gmail.com>

drm/verisilicon: introduce per-variant hardware ops table

The DC8200 and DCUltraLite share a broadly similar register layout but
differ in how the bridge, CRTC, primary plane and IRQ paths are driven.
This commit introduces a vs_dc_funcs vtable so each variant can supply
its own implementation without scattering conditionals across multiple file=
s.

> diff --git a/drivers/gpu/drm/verisilicon/vs_crtc.c b/drivers/gpu/drm/veri=
silicon/vs_crtc.c
> index 0b8a35d09cd2e..1c4aac7086694 100644
> --- a/drivers/gpu/drm/verisilicon/vs_crtc.c
> +++ b/drivers/gpu/drm/verisilicon/vs_crtc.c
> @@ -30,6 +53,9 @@ static void vs_crtc_atomic_disable(struct drm_crtc *crt=
c,
>  	drm_crtc_vblank_off(crtc);
> =20
>  	clk_disable_unprepare(dc->pix_clk[output]);
> +
> +	if (dc->funcs->crtc_disable_ex)
> +		dc->funcs->crtc_disable_ex(dc, output);

[Severity: High]
Are hardware registers written after the pixel clock is disabled here?

In vs_crtc_atomic_disable(), dc->funcs->crtc_disable_ex() executes
out-of-order, writing to MMIO registers after the associated pixel clock has
been disabled via clk_disable_unprepare().

Writing to hardware registers after disabling the pixel clock can cause bus
hangs (asynchronous external aborts) resulting in kernel panics, or silently
fail to latch the register value, leaving the hardware in an inconsistent
state.

This sequence can be triggered by local userspace through DRM atomic mode
setting ioctls when the CRTC is disabled, such as when turning off the
screen or performing a mode switch.

Could the hardware disable callback be moved before the clock is disabled to
correctly mirror the enable sequence?

>  }

--=20
Sashiko AI review =C2=B7 https://sashiko.dev/#/patchset/20260908092840.2252=
20-1-a0987203069@gmail.com?part=3D6
