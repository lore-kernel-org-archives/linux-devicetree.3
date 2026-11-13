Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=100.103.45.18
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1794590841;
	b=NBZT+lMGOjKVKhdfo8UhrAjUtAszmBhIYYHRebHGtmUV/4v3mq2WUYQC8DUozYz2n85j
	 05tcDqnf+zD9fVL+osP2lJw14YEU0FLJF6XBH9fg3ciuXpTjfxbMngWC9f/AZG/z4jy6z
	 sBJUSHS0pwGDiiaOG59SEsezOZmExgiPJhROxm0/81A9pe2XXQpJkORBBkKl1wchcrXgo
	 SC4GGiUXLF6YynzGa2/ioThcaJZq38XQ4VY6Fy9xT91h4EYfnnwn4CE+OejcMPgxOTGYs
	 a/GqUaXBB+dRIboDsXb5xlrHBqogDC/JnSHrgK4NPqy2oNC3nOOIiRiNswQZiBrC47A==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1794590841;
	h=Received:DKIM-Signature:Message-ID:From:Subject:Reply-To:To:Cc:
	 In-Reply-To:References:Content-Type:Content-Transfer-Encoding:Date;
	bh=htIPAAhk2CtRelD3x0bkLrB0216noo/lMM8hbl6XOa4=;
	b=4VlTFSINvpI1QDLo0zmXNou9AwD+VvDEOSX1pG1H07xHXIjCGwByRxMGrnV+SeMAXk5i
	 0IBHvoyrXl2t5sojiQuS0Oko9427l7L7oDUsMb1wQCPCszibnZJt9hJEENZXCpWO5Eh0K
	 kaIJlSqKmBed6H6ga5NaQ8HwNRh5zE5p/AU3+kLkZYz/07hyFTeSp7CaLiOYMk/cvlrkx
	 sHW2fRVHwjEhADZn+8dQfkzP1WRw++OA7qYes88QYBCVRL2h1vcTbcQLNh5PNkTBUNR/1
	 H0FvR8YZS+0bvoxszbgbney+NENMhej++O68bUr5w+coEMeDPQVACPxIg2Vhu19vfRA==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dkim=pass header.d=kernel.org header.i=@kernel.org header.a=rsa-sha256 header.s=k20260515 header.b=fIRuldel;
	arc=none smtp.remote-ip=100.103.45.18
Received: from smtp.kernel.org (quasi.space.kernel.org [100.103.45.18])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id A0217607E07B
	for <devicetree@vger.kernel.org>; Fri, 13 Nov 2026 17:27:21 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.a=rsa-sha256 header.s=k20260515 header.b=fIRuldel
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 04E191F000C4;
	Fri, 13 Nov 2026 17:27:20 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kernel.org;
	s=k20260515; t=1794590841;
	bh=htIPAAhk2CtRelD3x0bkLrB0216noo/lMM8hbl6XOa4=;
	h=From:Subject:Reply-To:To:Cc:In-Reply-To:References:Date;
	b=fIRuldelUHe25dyPWUBiJkJEALxRBFaMpG0nL5sgmy+5yHNaBwGW+R49Enhd11Eew
	 by6BHVUiHIP3yK9tHaYd3g+xAVKB0PrJxb/jD9ZyTZsOhmSEjtq9sOxOJbmn7oDA0z
	 qR5llbrsywL1spziUbKXhxeMQ/AYffFxCdlYuZ1HE5hZwBDepBMiLx0/bCy1GM2kQR
	 SxJMWvejOdjL6Yxs04aGKVWNVI93A/iminoKfThhZClsk1ambvZU5zoVHrQzZBwC+L
	 bVfWIwvkVIpFgjNGY5hL6e9mXrAzSbRa7j1NQvJ4e89/ioz2PQclh2LjD+ZlxI3a3K
	 lZpj/4pLTGIZw==
Message-ID: <sashiko-outbox-213306@kernel.org>
From: sashiko-bot@kernel.org
Subject: Re: [PATCH v6 2/3] virt: bao: add I/O dispatcher driver
Reply-To: sashiko-reviews@lists.linux.dev
To: =?utf-8?b?Sm/Do28gUGVpeG90bw==?= <jpeixoto@osyx.tech>
Cc: devicetree@vger.kernel.org, robh@kernel.org, conor+dt@kernel.org
In-Reply-To: <4e725d9d94cfd425ac0ff4352b21f7bf7b7a1296.1794589639.git.jpeixoto@osyx.tech>
References: <cover.1794589639.git.jpeixoto@osyx.tech>
 <4e725d9d94cfd425ac0ff4352b21f7bf7b7a1296.1794589639.git.jpeixoto@osyx.tech>
Content-Type: text/plain; charset=utf-8
Content-Transfer-Encoding: quoted-printable
Date: Fri, 13 Nov 2026 17:27:20 +0000
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
- [Medium] virt: bao: race in bao_irqfd_queue_shutdown() causes UAF on
  teardown
--

commit a54931ee06339bcb9128b2ac3b46c8d5cb3569c1
Author: Jo=C3=A3o Peixoto <jpeixoto@osyx.tech>

virt: bao: add I/O dispatcher driver

This commit adds the Bao hypervisor I/O dispatcher driver, exposing
/dev/bao and per-DM file descriptors to bridge Remote I/O requests,
shared memory, ioeventfds, and irqfds between frontend guests and
userspace VirtIO device models.

> diff --git a/drivers/virt/bao/io-dispatcher/irqfd.c b/drivers/virt/bao/io=
-dispatcher/irqfd.c
> new file mode 100644
> index 0000000000000..8d01bef4e7abd
> --- /dev/null
> +++ b/drivers/virt/bao/io-dispatcher/irqfd.c
> @@ -0,0 +1,330 @@

[ ... ]

> +/* Queue the cleanup work at most once. Safe from atomic context. */
> +static void bao_irqfd_queue_shutdown(struct irqfd *irqfd)
> +{
> +	if (!test_and_set_bit(BAO_IRQFD_SHUTDOWN, &irqfd->flags))
> +		queue_work(irqfd->dm->irqfd_server, &irqfd->shutdown);
> +}

[ ... ]

> +static int bao_irqfd_wakeup(wait_queue_entry_t *wait, unsigned int mode,
> +			    int sync, void *key)
> +{
> +	struct irqfd *irqfd =3D container_of(wait, struct irqfd, wait);
> +	__poll_t flags =3D key_to_poll(key);
> +	u64 cnt;
> +
> +	if (flags & EPOLLIN) {
> +		eventfd_ctx_do_read(irqfd->eventfd, &cnt);
> +		bao_irqfd_inject(irqfd->dm->info.id);
> +	}
> +
> +	if (flags & EPOLLHUP)
> +		/* Defer teardown to the cleanup work; can't sleep here. */
> +		bao_irqfd_queue_shutdown(irqfd);
> +
> +	return 0;
> +}

[ ... ]

> +void bao_irqfd_server_destroy(struct bao_dm *dm)
> +{
> +	struct irqfd *irqfd;
> +	struct irqfd *next;
> +
> +	if (WARN_ON_ONCE(!dm))
> +		return;
> +
> +	mutex_lock(&dm->irqfds_lock);
> +	list_for_each_entry_safe(irqfd, next, &dm->irqfds, list) {
> +		list_del_init(&irqfd->list);
> +		dm->nr_irqfds--;
> +		bao_irqfd_queue_shutdown(irqfd);
> +	}
> +	mutex_unlock(&dm->irqfds_lock);
> +
> +	/* Drain all cleanup work before tearing the workqueue down. */
> +	if (dm->irqfd_server) {
> +		flush_workqueue(dm->irqfd_server);
> +		destroy_workqueue(dm->irqfd_server);
> +	}
> +}

[Severity: Medium]
Can bao_irqfd_queue_shutdown() race with bao_irqfd_server_destroy() and
cause a use-after-free of dm and dm->irqfd_server?

bao_irqfd_wakeup() runs on EPOLLHUP without holding dm->irqfds_lock.  Once
it sets BAO_IRQFD_SHUTDOWN in bao_irqfd_queue_shutdown(), a concurrent
teardown caller sees the bit already set and moves on to flush and destroy
dm->irqfd_server before the work item is actually queued:

CPU0                                  CPU1
eventfd_release()                     bao_dm_release()
  wake_up_poll(..., EPOLLHUP)           bao_dm_destroy()
    bao_irqfd_wakeup()                    bao_irqfd_server_destroy()
      bao_irqfd_queue_shutdown()            mutex_lock(&dm->irqfds_lock)
        test_and_set_bit(...) -> 0          bao_irqfd_queue_shutdown()
                                              test_and_set_bit(...) -> 1
                                            mutex_unlock(&dm->irqfds_lock)
                                            flush_workqueue(dm->irqfd_serve=
r)
                                            destroy_workqueue(dm->irqfd_ser=
ver)
                                          kfree(dm)
        queue_work(irqfd->dm->irqfd_server, ...)
          <-- use-after-free

The same race with bao_irqfd_deassign() lets flush_workqueue() return
before irqfd->shutdown has been queued and run.

Since queue_work() already ignores a work_struct that is currently
pending, bao_irqfd_queue_shutdown() can call queue_work() unconditionally
without BAO_IRQFD_SHUTDOWN so that both paths guarantee the work is queued
before returning.

--=20
Sashiko AI review =C2=B7 https://sashiko.dev/#/patchset/cover.1794589639.gi=
t.jpeixoto@osyx.tech?part=3D2
