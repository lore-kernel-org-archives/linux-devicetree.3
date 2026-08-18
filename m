Received: from smtp.kernel.org (aws-us-west-2-korg-mail-alma10-1.taild15c8.ts.net [100.103.45.18])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 4043D72630
	for <devicetree@vger.kernel.org>; Tue, 18 Aug 2026 00:00:47 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=100.103.45.18
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1787011248; cv=none; b=hHju7MDZXugvxPKiI8C5kaGYagaf5BnDnjy8ei83wSWQ+Ea1vOKWr4ncSKnBCnulrNzsstkqNqK8JdopDb1vywbvLTp63fRUhNhN5jKGOEk2bTnxd35x2dvt39g57N2oFuOLKP8H6QoIxqQTem93m35wBLTxSEB6ROekv1uNl7E=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1787011248; c=relaxed/simple;
	bh=umc6aDO0dHY1V02ISIPziaqBTQOExw7rT5jLd2mnJkI=;
	h=From:Subject:To:Cc:In-Reply-To:References:Content-Type:Date:
	 Message-Id; b=OXEoQJOtQnNFU1YDyjlcrQ54VFopmOLCTuI5D9XQHbtcKKPonrrn+1KNn/+i+5KyTY+8jDPcw5aqjAQt+3l7+HO5Y4WNjORfFke97OpWKDrl07yT/tIZWLSvk2GDDBWWyShTzzkODiCQD0KZLGEPoxe35LbCsWcw7HdXUORhlq8=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=oaheHEpA; arc=none smtp.client-ip=100.103.45.18
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="oaheHEpA"
Received: by smtp.kernel.org (Postfix) with ESMTPSA id D34CC1F000E9;
	Tue, 18 Aug 2026 00:00:46 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kernel.org;
	s=k20260515; t=1787011247;
	bh=P6o3QJDE05xzvWZBKw/nudzWQ6WUXCtf7YgBJA//WYM=;
	h=From:Subject:Reply-To:To:Cc:In-Reply-To:References:Date;
	b=oaheHEpAywd65XXmT7JbocrHd5fq/hDtgEroVgCZKGJBo5ZS4kEAX4V9d7U1TSHOk
	 C2iK1BPKR6K5ZGpNZHzIDckSGl+fbqqeJ7weFKkUyzsu1KgLBEZOKRz0MSdlMd0xeE
	 Pfk8T+nwUgm4AXyUOOEBAz03qPfXHnM5rSRn+9pYnggUYIi2NFOhXo0KReuyI1aBY0
	 fMQbeBJL+KOV+9UBosk3mBBRob9mw0eJpu4U5756lUo73Em2aY417DHQRuwecUroh0
	 8/8NXgEQ1B6OF+daVD9nD4j7JVK7E8NqBzlDSMJQygAk4/FJyabeq3mitnivsOZc2d
	 USOlX9fZzpPYw==
From: sashiko-bot@kernel.org
Subject: Re: [PATCH net-next v2 2/4] driver core: factor sync-state-only
 link cleanup
Reply-To: sashiko-reviews@lists.linux.dev
To: "James Hilliard" <james.hilliard1@gmail.com>
Cc: robh@kernel.org, conor+dt@kernel.org, devicetree@vger.kernel.org
In-Reply-To: <20260816-submit-phy-package-fwdevlink-v1-v2-2-23e55dd59fad@gmail.com>
References: <20260816-submit-phy-package-fwdevlink-v1-v2-0-23e55dd59fad@gmail.com>
 <20260816-submit-phy-package-fwdevlink-v1-v2-2-23e55dd59fad@gmail.com>
Content-Type: text/plain; charset=utf-8
Content-Transfer-Encoding: quoted-printable
Date: Tue, 18 Aug 2026 00:00:46 +0000
Message-Id: <20260818000046.D34CC1F000E9@smtp.kernel.org>
Precedence: bulk
X-Mailing-List: devicetree@vger.kernel.org
List-Id: <devicetree.vger.kernel.org>
List-Subscribe: <mailto:devicetree+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:devicetree+unsubscribe@vger.kernel.org>

Thank you for your contribution! Sashiko AI review found 1 potential issue(=
s) to consider:

Pre-existing issues:
- [High] Concurrent lockless list modification of `links.defer_sync` causes=
 list corruption, infinite loop, and use-after-free in `device_links_flush_=
sync_list`.
--

--- Patch [2]: [PATCH net-next v2 2/4] driver core: factor sync-state-only =
link cleanup ---
commit 1c995f67e6fafdae816a7fe7115a3a496dc0c968
Author: James Hilliard <james.hilliard1@gmail.com>

driver core: factor sync-state-only link cleanup

This commit factors out the existing sync-state-only link cleanup into a=20
lock-held helper to reuse it from device_links_driver_bound(). It also adds=
=20
a public wrapper so frameworks can drop temporary proxy links without=20
affecting real dependency links.

> diff --git a/drivers/base/core.c b/drivers/base/core.c
> index 4d026682944f2..627fcfa274f0e 100644
> --- a/drivers/base/core.c
> +++ b/drivers/base/core.c

[ ... ]

> @@ -1305,6 +1305,57 @@ static void device_link_drop_managed(struct device=
_link *link)
> +void device_links_drop_sync_state_only(struct device *dev)
> +{
> +	LIST_HEAD(sync_list);
> +
> +	device_links_write_lock();
> +	__device_links_drop_sync_state_only(dev, &sync_list);
> +	device_links_write_unlock();
> +

[Severity: High]
This is a pre-existing issue, but can a concurrent unbind corrupt this list
iteration?

Looking at device_links_flush_sync_list(), it iterates over the sync_list
without holding the device links write lock:

drivers/base/core.c:device_links_flush_sync_list() {
    ...
    list_for_each_entry_safe(dev, tmp, list, links.defer_sync) {
        list_del_init(&dev->links.defer_sync);
        ...
        put_device(dev);
    }
}

Concurrently, if a device currently queued in the sync_list is unbound,
device_links_driver_cleanup() modifies the same list node while holding
device_links_write_lock():

drivers/base/core.c:device_links_driver_cleanup() {
    ...
    list_del_init(&dev->links.defer_sync);
    ...
}

If device_links_driver_cleanup() modifies the node that happens to be the
tmp cursor in the lockless list_for_each_entry_safe() loop, wouldn't
tmp->next point to itself due to the list_del_init() call?

This appears like it would cause an infinite loop processing the same devic=
e,
calling put_device(dev) on each iteration until the refcount underflows
and triggers a use-after-free.

> +	device_links_flush_sync_list(&sync_list, NULL);
> +}
> +EXPORT_SYMBOL_GPL(device_links_drop_sync_state_only);

--=20
Sashiko AI review =C2=B7 https://sashiko.dev/#/patchset/20260816-submit-phy=
-package-fwdevlink-v1-v2-0-23e55dd59fad@gmail.com?part=3D2
