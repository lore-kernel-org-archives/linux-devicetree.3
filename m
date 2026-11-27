Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=100.103.45.18
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1795766570;
	b=oqXtmxvr7fKfJygr+Q+8YYb7NtuLLS8tcDqakZt9X0BrRLdI9oV5sGILwhzm2degNx6L
	 X2aj9c2MKwfCQWmZFNKrNvCb6RmHUtUN+E3N0t75GMJ5i7SULo8HYKnJqnQjMRCkHu7ZD
	 KIsZQZChdHq/xVaplEa7nu8NKz3nFCn8PLjWJqEY2mcCbDnL44ateWYxFAcZh3mqRycGr
	 Kktv16usCOdTBtY03FJyBiUIlTevooavIbnRssw3cPHd+uvMJZRV9A/1umbWGSEh/JrQ7
	 qXUXOk3jUwVjr8sm8U1Kp93ALRz9PryoLk2iZFWgYKKy2eusV/oRzekIa2xM54gTCNg==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1795766570;
	h=Received:DKIM-Signature:Message-ID:From:Subject:Reply-To:To:Cc:
	 In-Reply-To:References:Content-Type:Content-Transfer-Encoding:Date;
	bh=LEyBP/hp2/6v7EL6wMFANhoYVvua5nBRMttUdGMXpiI=;
	b=s3xYoEJrqxJqzAsFx6ZbvWQrYkw29dmjSSKTINgTv1GpSu4Tscmtq3jK5HVm/bfOEHig
	 7FPKkr6saCqaa7gWLvN17MJq3D+ftMSC5FttVyLiSDitDzXuFheqqbnpp3lfIEtsNkl7q
	 8/1UcgNQGKeXEFau6y1snTkMQT63oauKcEyPC6fWKCmNzSMSPRBFf3Ni6dOus//iilbNC
	 BRKfFUQYvd8ptzsosowKuyZvfL48BBK4Uy/pLXHMukVo1ifz6xadJzzVMAkc3bOTbSM7D
	 Hcaw0YhSjW7lnkNW1v46hdoMTbnKwxrw9W95UtFun5aLLPQiU0zuJjNbZEfhWQjjm6Q==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dkim=pass header.d=kernel.org header.i=@kernel.org header.a=rsa-sha256 header.s=k20260515 header.b=WZQ4eb2e;
	arc=none smtp.remote-ip=100.103.45.18
Received: from smtp.kernel.org (quasi.space.kernel.org [100.103.45.18])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 068FA606A31C
	for <devicetree@vger.kernel.org>; Fri, 27 Nov 2026 08:02:49 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.a=rsa-sha256 header.s=k20260515 header.b=WZQ4eb2e
Received: by smtp.kernel.org (Postfix) with ESMTPSA id D85CA1F00893;
	Fri, 27 Nov 2026 08:02:48 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kernel.org;
	s=k20260515; t=1795766569;
	bh=LEyBP/hp2/6v7EL6wMFANhoYVvua5nBRMttUdGMXpiI=;
	h=From:Subject:Reply-To:To:Cc:In-Reply-To:References:Date;
	b=WZQ4eb2eRl4LAbtc+m8Ji8w+7Hp2jGrI9BnB8rDn//VGvak3+RPMOsrm0gg3jKAJM
	 ttUfjiKGEpPTLA/Ms3rM2pVNebvX9+VUJENI2KDYrzNDLlbWWCX3YFKe7r7UAVgr8h
	 l236DeRCiPACGrwXxVslvOJOl2QbvOX4xefIYLFXyovqz8KJQ4j4FjojY6Xz13hmlm
	 lMuS3+9fV5U98+6OXi6SzCIeOWr2EdYk5A8OkFp1MGzcywzjn3yliJKubr86ELyid1
	 mkaQBhUTu6TtJMgjWGQ0gqGNCbtOJDbhggpNkgB5wrJDcz9PfG7nBr9DiNp8lk/cBw
	 0yoPq4/BhFjbg==
Message-ID: <sashiko-outbox-236854@kernel.org>
From: sashiko-bot@kernel.org
Subject: Re: [PATCH v7 4/5] drm/bridge: trilinear: add the DPTX core and
 build glue
Reply-To: sashiko-reviews@lists.linux.dev
To: "Luo Liu" <Luo.Liu@cixtech.com>
Cc: dri-devel@lists.freedesktop.org, devicetree@vger.kernel.org, robh@kernel.org, conor+dt@kernel.org
In-Reply-To: <20261127074639.277959-5-Luo.Liu@cixtech.com>
References: <20261127074639.277959-1-Luo.Liu@cixtech.com>
 <20261127074639.277959-5-Luo.Liu@cixtech.com>
Content-Type: text/plain; charset=utf-8
Content-Transfer-Encoding: quoted-printable
Date: Fri, 27 Nov 2026 08:02:48 +0000
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
- [Medium] drm/bridge: trilinear: dptx_deinit() race skips
  aux_unregister() on detach
--

commit b7015f37668416cb2e6bc1550b44c2c5d2b795c6
Author: Luo Liu <Luo.Liu@cixtech.com>

drm/bridge: trilinear: add the DPTX core and build glue

This commit adds the Trilinear DPTX bridge core implementation, including
probe, power management, hotplug handling, and stream management, along
with Kconfig and Makefile build integration.

> diff --git a/drivers/gpu/drm/bridge/trilinear/dptx_core.c b/drivers/gpu/d=
rm/bridge/trilinear/dptx_core.c
> new file mode 100644
> index 0000000000000..ff80ba42a1140
> --- /dev/null
> +++ b/drivers/gpu/drm/bridge/trilinear/dptx_core.c

[ ... ]

> +static void dptx_deinit(struct dptx_dev *dp)
> +{
> +	struct device_link *link =3D NULL;
> +
> +	if (!(dp->state & DPTX_STATE_CONFIGURED))
> +		return;
> +
> +	scoped_guard(mutex, &dp->lock) {
> +		WRITE_ONCE(dp->hpd_stopped, true);
> +		dp->released =3D true;
> +		dptx_irq_off(dp);
> +	}
> +
> +	dptx_cancel_hpd_works(dp);
> +
> +	scoped_guard(mutex, &dp->lock) {
> +		dptx_stop_streams(dp);
> +		dptx_host_deinit(dp);
> +		dp->hw->ops->aux_unregister(dp->hw);
> +		dp->state &=3D ~(DPTX_STATE_CONFIGURED);
> +		link =3D dp->link;
> +		dp->link =3D NULL;
> +	}
> +
> +	if (link)
> +		device_link_del(link);
> +}

[Severity: Medium]
Can dptx_bridge_detach() return while dp->hw->aux is still registered if
it races with dptx_deinit()?

drivers/gpu/drm/bridge/trilinear/dptx_drm.c:dptx_bridge_detach() {
	...
	scoped_guard(mutex, &dp->lock) {
		dp->attached =3D false;

		if (!dp->released)
			dp->hw->ops->aux_unregister(dp->hw);

		link =3D dp->link;
		dp->link =3D NULL;
	}
	...
}

Because the device link uses DL_FLAG_STATELESS, the bridge device and
the DRM consumer device can tear down concurrently:

CPU0                                  CPU1
dptx_deinit()                         dptx_bridge_detach()
  lock(&dp->lock)
  dp->released =3D true
  unlock(&dp->lock)
  dptx_cancel_hpd_works(dp)
                                        dptx_quiesce_hpd(dp)
                                        lock(&dp->lock)
                                        if (!dp->released) /* false */
                                        unlock(&dp->lock)
                                      /* DRM device teardown proceeds
                                         while dp->hw->aux is still
                                         registered with aux.drm_dev */
  lock(&dp->lock)
  dp->hw->ops->aux_unregister(dp->hw)

Also, dptx_deinit() checks dp->state & DPTX_STATE_CONFIGURED without
holding dp->lock, while other paths update dp->state with non-atomic
read-modify-write operations under dp->lock.

--=20
Sashiko AI review =C2=B7 https://sashiko.dev/#/patchset/20261127074639.2779=
59-1-Luo.Liu@cixtech.com?part=3D4
