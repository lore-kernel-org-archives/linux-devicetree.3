Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=100.103.45.18
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1795687516;
	b=RQk56/33k9yDH11NW/6foO2cALbJ3YCBrj4xqF75OCJE+eTUmykeeAniVvhPPAy8L/Cq
	 K0OhyFW9eSVSIZFzE5mGEwKXuALsTmTI/DgE1canlTgpe+7UHQfv932f1C+4eU8nxAwFs
	 k/nnXSE0PlHKWnOxt+sgVZjJ3mhD8paAKmSIY6XnodpHfmvyUShDtujg6VcGBWx/CB95D
	 tRDuV7vpY3s7S6fLgStBB8X1sJbGndPekaCSEM2vTTr20zpfkGcRJI2NT2pT8OO8qHVrO
	 lo0f2LcPWeKP24OMQZj1JLjlaR+KsHMb3VeB9xtT3FPxUz6R3JYRIKNtl0vyGlm882Q==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1795687516;
	h=Received:DKIM-Signature:Message-ID:From:Subject:Reply-To:To:Cc:
	 In-Reply-To:References:Content-Type:Content-Transfer-Encoding:Date;
	bh=GoEnz7tgeUvV3KKgt+92Vea2ta67Mlm/v0rPv68X4tY=;
	b=WTJ1El1ORrv8fAO4Tdx5PFZWzFLBaSoDQQTf3f3/fWbamSzzIldiGb2SgJDmmShBxDky
	 B7zC3QV+EjxKrah96WhXrC3sCdj67uV82ssTO6g8lXmZMcMibyUa7nz+3H9QqaWuJ4LhU
	 b3H2efc0YuDzEEKauLPedI0caxagktvke1nlUWWliICna9fJehS0arjss/5hfxwsOgbC1
	 WPhtoDnYWx0nTOe3OxcEUNBq4Zn8DmO+AcdHkIf3L+tRMymOInCp+EuY9902NJUnsPSXq
	 GmFeuv/49cR6mcB6gIPzv+SY0U2oexn2/cE5tciV1GoTG/7t2K2qmnB34Ue/5YHPZEg==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dkim=pass header.d=kernel.org header.i=@kernel.org header.a=rsa-sha256 header.s=k20260515 header.b="iEcjdIy/";
	arc=none smtp.remote-ip=100.103.45.18
Received: from smtp.kernel.org (quasi.space.kernel.org [100.103.45.18])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 2F260606A31C
	for <devicetree@vger.kernel.org>; Thu, 26 Nov 2026 10:05:16 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.a=rsa-sha256 header.s=k20260515 header.b=iEcjdIy/
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 7C34F1F000C4;
	Thu, 26 Nov 2026 10:05:15 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kernel.org;
	s=k20260515; t=1795687515;
	bh=GoEnz7tgeUvV3KKgt+92Vea2ta67Mlm/v0rPv68X4tY=;
	h=From:Subject:Reply-To:To:Cc:In-Reply-To:References:Date;
	b=iEcjdIy/6p5WrHpnme1vkKcgGM7ViH0cTSrHJnHaXQpFR4i6B3eJhnqD8aUzE0TjM
	 TrnChA0//RefdpwO9956HVNHeVt9QC4KNLd0+1g54B0Rm9748SMlrfRo0l/No44y72
	 Ur1JPClojm21C6tDjq+3mQaqsU9Uu8fP2Mau59qq2s7ivam7vyIbIoY4ve5P4VO/62
	 6DaCDmq48LBJ9iDAkvwQ+EiP1vUl0Yexd7Va53VOBfEfkABVeIxP55DBOkitCQvT+0
	 S2YwvY35WLEjXP5cfYoUhy3es8XMY445dJMiLqVaX0F3JNotCclVdExiH0JjHCFrnw
	 2fvtZIUPoe9DA==
Message-ID: <sashiko-outbox-235231@kernel.org>
From: sashiko-bot@kernel.org
Subject: Re: [PATCH v7 07/14] gtrace: Add function to copy into perf AUX
 buffer
Reply-To: sashiko-reviews@lists.linux.dev
To: "Mayuresh Chitale" <mayuresh.chitale@oss.qualcomm.com>
Cc: devicetree@vger.kernel.org, robh@kernel.org, conor+dt@kernel.org
In-Reply-To: <115ef070f1edfe8be3e7862dc4c90ef9eb19d568.1795512532.git.mayuresh.chitale@oss.qualcomm.com>
References: <cover.1795512532.git.mayuresh.chitale@oss.qualcomm.com>
 <115ef070f1edfe8be3e7862dc4c90ef9eb19d568.1795512532.git.mayuresh.chitale@oss.qualcomm.com>
Content-Type: text/plain; charset=utf-8
Content-Transfer-Encoding: quoted-printable
Date: Thu, 26 Nov 2026 10:05:15 +0000
X-Mailing-List: devicetree@vger.kernel.org
List-Id: <devicetree.vger.kernel.org>
List-Post: <mailto:devicetree@vger.kernel.org>
List-Help: <mailto:devicetree+help@vger.kernel.org>
List-Subscribe: <mailto:devicetree+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:devicetree+unsubscribe@vger.kernel.org>
List-Owner: <mailto:devicetree+owner@vger.kernel.org>
Precedence: list

Thank you for your contribution! Sashiko AI review found 1 potential
issue to consider:
- [Medium] gtrace: TOCTOU race between gtrace_path_stop() and
  gtrace_path_copyto_auxbuf()
--

commit 316c0ae2e4a3dbc8091e2e7c9a0a691103a47556
Author: Anup Patel <anup.patel@oss.qualcomm.com>

gtrace: Add function to copy into perf AUX buffer

This commit adds gtrace_path_copyto_auxbuf() and the corresponding
copyto_auxbuf() driver callback to copy trace data from a sink into a perf
AUX buffer.

> diff --git a/drivers/hwtracing/gtrace/gtrace-core.c b/drivers/hwtracing/g=
trace/gtrace-core.c
> index 754c5f71168ba..af282cc95b551 100644
> --- a/drivers/hwtracing/gtrace/gtrace-core.c
> +++ b/drivers/hwtracing/gtrace/gtrace-core.c
> @@ -818,6 +818,48 @@ int gtrace_path_stop(struct gtrace_path *path)
>  }
>  EXPORT_SYMBOL_GPL(gtrace_path_stop);
> =20
> +int gtrace_path_copyto_auxbuf(struct gtrace_path *path,
> +			      struct gtrace_perf_auxbuf *buf,
> +			      size_t *size, u64 *aux_flags)
> +{
> +	struct gtrace_component *comp =3D gtrace_path_sink(path);
> +	struct gtrace_comp_priv *sink =3D to_gtrace_comp_priv(comp);
> +	const struct gtrace_driver *gtdrv;
> +	int ret =3D -EOPNOTSUPP;
> +	unsigned long flags;
> +
> +	/*
> +	 * Copy only after every path using the sink has stopped; otherwise the
> +	 * hardware may overwrite data being copied, or the same data may be co=
pied
> +	 * to aux buffer twice. The last path to stop does the copy. Holding the
> +	 * sink's lock also stops another path from starting the sink before co=
py
> +	 * completes.
> +	 */
> +	raw_spin_lock_irqsave(&sink->lock, flags);
> +	if (sink->start_count) {
> +		*size =3D 0;
> +		ret =3D 0;
> +		goto out;
> +	}
> +
> +	if (!sink->ready) {
> +		ret =3D -ENODEV;
> +		goto out;
> +	}
> +
> +	gtdrv =3D to_gtrace_driver(comp->dev.driver);
> +	if (gtdrv && gtdrv->copyto_auxbuf) {
> +		*size =3D gtdrv->copyto_auxbuf(comp, buf, *size, aux_flags);
> +		ret =3D 0;
> +	}

[Severity: Medium]
Can two paths sharing a sink both copy the same trace data, or miss the
copy entirely, because sink->lock is dropped between gtrace_path_stop()
and gtrace_path_copyto_auxbuf()?

__gtrace_comp_stop() decrements sink->start_count and releases sink->lock
before the caller reaches gtrace_path_copyto_auxbuf():

CPU0                                  CPU1
gtrace_path_stop()
  __gtrace_comp_stop(sink)
    lock(&sink->lock)
    sink->start_count-- (2 -> 1)
    unlock(&sink->lock)
                                      gtrace_path_stop()
                                        __gtrace_comp_stop(sink)
                                          lock(&sink->lock)
                                          sink->start_count-- (1 -> 0)
                                          gtdrv->stop(comp)
                                          unlock(&sink->lock)
gtrace_path_copyto_auxbuf()
  lock(&sink->lock)
  sink->start_count =3D=3D 0
  gtdrv->copyto_auxbuf(...)
  unlock(&sink->lock)
                                      gtrace_path_copyto_auxbuf()
                                        lock(&sink->lock)
                                        sink->start_count =3D=3D 0
                                        gtdrv->copyto_auxbuf(...)
                                          <-- duplicate copy

Conversely, if another path sharing the sink calls gtrace_path_start() in
that window after the last active path drops sink->lock in
__gtrace_comp_stop(), sink->start_count becomes 1 and the sink restarts
before gtrace_path_copyto_auxbuf() runs, so the stopped path sees
sink->start_count !=3D 0 and skips the copy.

--=20
Sashiko AI review =C2=B7 https://sashiko.dev/#/patchset/cover.1795512532.gi=
t.mayuresh.chitale@oss.qualcomm.com?part=3D7
