Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=100.103.45.18
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1795687554;
	b=JstWtB1r0jtY+aX1PZgtButmvjHNSjz0zO2It/AjhdaYWgPU+RjOYF6OboRFB05lqSrq
	 JnoSdCGkHugihYiKABtviCfYll5rzE0eMxBjFzQ45PldWB/Ssfs8VJ1PJnKhCKM1MU/VS
	 zTVCufeJc2OjFHPeItCNWwCUWPYb8SdwX2z2DFoLrmeKvg3wLWzoHTv0zJqkwHMnErMXr
	 abIN6FLPQy4XnI/ACK2WShESi/r+Wa+ojATwN2eJ1dXDEpdErayZix9f9fv6fT+KJa7Ss
	 5ofvh6JyO7Ff2Y88pMnpz0om4NKs1HYvRZm4EzbfNaunyIGVKT55z2Rle/xYD+4Hb5w==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1795687554;
	h=Received:DKIM-Signature:Message-ID:From:Subject:Reply-To:To:Cc:
	 In-Reply-To:References:Content-Type:Content-Transfer-Encoding:Date;
	bh=+QF8yeKrtSIaCYz96L+CzWuLpjtz2trrNR6efljgbr4=;
	b=raJXTEjKl3RfUahodfkb5MbvLR1Cot89px73GqH5t8CNQKxzr8zOx8o+fd3IIJjzsGXl
	 g5Fs8AYWoDnn24CouMkkLzdwF+bvQVOK5uZGyaU8di+p9FdcV8Yn5p7DeZ7Wlv+VdkUYU
	 i1/29+/YuUgdlfoROw16xE1BcPnyR+qV3QJefjH+aVa+vYRV0q9ZgrJ344OoU+fusVw8u
	 4WvqZ3ABJxWtiSMUWGatD8roBpI9455qvqDgfLF2k1u7w1SDNdG4oTjDe9+9Y/LTl/+B2
	 eje63LGH21zzGfvnwDBV4D9crzUpmEJIyVHhomgdHLarPaOErLsnTQULvwm/G4j6H1g==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dkim=pass header.d=kernel.org header.i=@kernel.org header.a=rsa-sha256 header.s=k20260515 header.b="LPv5yUy/";
	arc=none smtp.remote-ip=100.103.45.18
Received: from smtp.kernel.org (quasi.space.kernel.org [100.103.45.18])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id EA061606A321
	for <devicetree@vger.kernel.org>; Thu, 26 Nov 2026 10:05:53 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.a=rsa-sha256 header.s=k20260515 header.b=LPv5yUy/
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 01B831F000D2;
	Thu, 26 Nov 2026 10:05:52 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kernel.org;
	s=k20260515; t=1795687553;
	bh=+QF8yeKrtSIaCYz96L+CzWuLpjtz2trrNR6efljgbr4=;
	h=From:Subject:Reply-To:To:Cc:In-Reply-To:References:Date;
	b=LPv5yUy/ZV/PDpYDbJgVG0jBiFSLddxALaj6+LYVFnPokMgjLvS4JUb/B6kAUZyYT
	 e32SGe6wQ2WCdVBpD6uHGnYAVJlQ7zGQ4ULSjDO56v8zJfOOIODZ6NX5XAuZxb1Ufs
	 0B28QixLaltCZ7YgXK2HIy+FO/5mcuGF0hUlZTvg+54QEwLokgDxeOYp2FEX3e3uR8
	 eMaZr6RDXoXXUf392u9eRFVbGMiw4WZpGmpOQ38kPXGKsOJsmHQn5D26QBaNfQy/9+
	 LdtSlZFuLCrunSvAS5KIAHZ2hbhEBve0019NHXuH6cagJ093kV7nWkkVc9OEvHIvqv
	 JNu+uFsV8zdbw==
Message-ID: <sashiko-outbox-235233@kernel.org>
From: sashiko-bot@kernel.org
Subject: Re: [PATCH v7 05/14] gtrace: Add functions to start/stop tracing on
 a component path
Reply-To: sashiko-reviews@lists.linux.dev
To: "Mayuresh Chitale" <mayuresh.chitale@oss.qualcomm.com>
Cc: devicetree@vger.kernel.org, robh@kernel.org, conor+dt@kernel.org
In-Reply-To: <6fcdae2ebe6a263f872357b2aff272f9cf7ebe32.1795512532.git.mayuresh.chitale@oss.qualcomm.com>
References: <cover.1795512532.git.mayuresh.chitale@oss.qualcomm.com>
 <6fcdae2ebe6a263f872357b2aff272f9cf7ebe32.1795512532.git.mayuresh.chitale@oss.qualcomm.com>
Content-Type: text/plain; charset=utf-8
Content-Transfer-Encoding: quoted-printable
Date: Thu, 26 Nov 2026 10:05:52 +0000
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
- [Medium] gtrace: active component not stopped on driver removal in
  gtrace_remove()
- [Low] gtrace: missing @owner kernel-doc entry for struct gtrace_path
--

commit 3c35cac2de4c3236ac92bfa75608dd492c2b0158
Author: Mayuresh Chitale <mayuresh.chitale@oss.qualcomm.com>

gtrace: Add functions to start/stop tracing on a component path

This commit adds gtrace_path_start() and gtrace_path_stop() along with
per-component start reference counting and driver start/stop callbacks to
start and stop tracing across all components in a path.

> diff --git a/drivers/hwtracing/gtrace/gtrace-core.c b/drivers/hwtracing/g=
trace/gtrace-core.c
> index 728235fc9bfe2..754c5f71168ba 100644
> --- a/drivers/hwtracing/gtrace/gtrace-core.c
> +++ b/drivers/hwtracing/gtrace/gtrace-core.c
[ ... ]
> @@ -137,8 +151,11 @@ static void gtrace_remove(struct device *dev)
>  	const struct gtrace_driver *gtdrv =3D to_gtrace_driver(dev->driver);
>  	struct gtrace_component *comp =3D to_gtrace_component(dev);
>  	struct gtrace_comp_priv *cpriv =3D to_gtrace_comp_priv(comp);
> +	unsigned long flags;
> =20
> +	raw_spin_lock_irqsave(&cpriv->lock, flags);
>  	cpriv->ready =3D false;
> +	raw_spin_unlock_irqrestore(&cpriv->lock, flags);
>  	if (gtdrv->remove)
>  		gtdrv->remove(comp);
>  }

[Severity: Medium]
Should gtrace_remove() stop the component when cpriv->start_count is
non-zero?

If a component driver is unbound while a trace path is active,
gtrace_remove() clears cpriv->ready without calling gtdrv->stop(comp).
When gtrace_path_stop() later calls __gtrace_comp_stop(), it decrements
cpriv->start_count to 0, sees !cpriv->ready, and returns -ENODEV without
calling gtdrv->stop(comp) either, leaving hardware tracing active.

Also, if the driver is re-probed before existing active paths are
stopped, cpriv->ready becomes true again while cpriv->start_count is still
positive from the previous binding, causing later start/stop calls to skip
gtdrv->start(comp) or call gtdrv->stop(comp) on a newly probed component
that was never started.

> diff --git a/include/linux/gtrace.h b/include/linux/gtrace.h
> index 562cd1eca1626..77b2835c1647d 100644
> --- a/include/linux/gtrace.h
> +++ b/include/linux/gtrace.h
> @@ -295,6 +295,7 @@ struct gtrace_path {
>  	enum gtrace_component_mode	mode;
>  	u32				trace_id;
>  #define GTRACE_INVALID_TRACE_ID	U32_MAX
> +	pid_t				owner;
>  };

[Severity: Low]
struct gtrace_path has a kernel-doc comment block above it, so adding the
owner member without an @owner description will trigger a kernel-doc
warning under W=3D1 builds.

--=20
Sashiko AI review =C2=B7 https://sashiko.dev/#/patchset/cover.1795512532.gi=
t.mayuresh.chitale@oss.qualcomm.com?part=3D5
