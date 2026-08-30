Received: from smtp.kernel.org (aws-us-west-2-korg-mail-alma10-1.taild15c8.ts.net [100.103.45.18])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 7A9D1212564
	for <devicetree@vger.kernel.org>; Sun, 30 Aug 2026 20:32:59 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=100.103.45.18
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1788121980; cv=none; b=sQM/aQ5Gw+Ao59nBYeaNy7bem++71o5C0aXxD2zLFEw8o2qqjZjj2xswD0A2OL9zQ2YR4ACt4Z7+AIfWqNZRnDC+7CkobmKqr7jLzn52+/AZWAevGqE52tY2qdPVNWyjqQImnkMXIAFbR4SLUDEuW7uL1tg+s3cu6c9IuOrd6Bo=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1788121980; c=relaxed/simple;
	bh=iIZ75MGp77Zhl+lT5v7wH75rbWAQ34bTGw0+i3SrmBg=;
	h=From:Subject:To:Cc:In-Reply-To:References:Content-Type:Date:
	 Message-Id; b=QkJJ7jsBwXmPeFAVyDfNwo6ajUQelR0ZFRdd/115+KsoKzB/NNXe0LIsOV1E/hA++OaYp+sKgLj9eu0zHN6BclkFQ0LEq+RVni5pHf45Ska+W+LypzVpXrefssyk5YhFWKBDzsklK8meXx0eC6EKl/1q84aiRyCXvt6pRMpEAdk=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=oWpLNmm1; arc=none smtp.client-ip=100.103.45.18
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="oWpLNmm1"
Received: by smtp.kernel.org (Postfix) with ESMTPSA id D77391F000E9;
	Sun, 30 Aug 2026 20:32:58 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kernel.org;
	s=k20260515; t=1788121979;
	bh=UuFhX/jPHEV3HBLU1LZfbD+GFzmPcLWA3U5YQHgBf98=;
	h=From:Subject:Reply-To:To:Cc:In-Reply-To:References:Date;
	b=oWpLNmm1FSAX1aeBWZeTGqPg4IsGf0iwlYoCog8PbWWtdLwgRLOWv076BJvybdape
	 m2LGnlmO54ZATDyQziYU8MG8NjNWC3rAyEZm8hXKE7Z/zbHgJzfFHa2GCWhgs/w3R3
	 m+T5ONS0wb9ZInsyqwfitf7FXbC2I61+L3+oHkj9OcDAdrTEZHGuIfbzwMQCDhHyDW
	 Nryd+NCIViU9A+FTPwqJZh5AYuNv0t2qs1KwKEvQVYn5K/03Q4Y9IJ6i6pycnIM/VA
	 rCWLLM1XWyfQcs/F4ceraSD3pSlrr34TvmEib0voWn5iVzXYOL5ySWUyeQq1WjnU50
	 30H4nZg0K1nVA==
From: sashiko-bot@kernel.org
Subject: Re: [PATCH 08/19] thunderbolt: Allocate ring HopID before
 requesting the ring interrupt
Reply-To: sashiko-reviews@lists.linux.dev
To: "Sven Peter" <sven@kernel.org>
Cc: conor+dt@kernel.org, devicetree@vger.kernel.org, robh@kernel.org
In-Reply-To: <20260830-b4-apple-soc-tbt-v1-8-44bc9348683c@kernel.org>
References: <20260830-b4-apple-soc-tbt-v1-0-44bc9348683c@kernel.org>
 <20260830-b4-apple-soc-tbt-v1-8-44bc9348683c@kernel.org>
Content-Type: text/plain; charset=utf-8
Content-Transfer-Encoding: quoted-printable
Date: Sun, 30 Aug 2026 20:32:58 +0000
Message-Id: <20260830203258.D77391F000E9@smtp.kernel.org>
Precedence: bulk
X-Mailing-List: devicetree@vger.kernel.org
List-Id: <devicetree.vger.kernel.org>
List-Subscribe: <mailto:devicetree+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:devicetree+unsubscribe@vger.kernel.org>

Thank you for your contribution! Sashiko AI review found 1 potential issue(=
s) to consider:
- [High] The teardown order in tb_ring_free() was not updated to match the =
new reversed initialization order in tb_ring_alloc(), introducing a race co=
ndition where a hop ID is freed before its associated IRQ is released.
--

commit ed19fe4c2978aaf176d934b42ef25a517be4cd98
Author: Sven Peter <sven@kernel.org>

thunderbolt: Allocate ring HopID before requesting the ring interrupt

This commit changes the setup order in tb_ring_alloc() to allocate the
HopID before requesting the ring interrupt. This is necessary because
the Apple NHI picks the interrupt based on the HopID.

> diff --git a/drivers/thunderbolt/nhi.c b/drivers/thunderbolt/nhi.c
> index 5809809f64d42..6a97dcd57deb2 100644
> --- a/drivers/thunderbolt/nhi.c
> +++ b/drivers/thunderbolt/nhi.c

[ ... ]

> @@ -581,19 +591,18 @@ static struct tb_ring *tb_ring_alloc(struct tb_nhi =
*nhi, u32 hop, int size,
>  	if (!ring->descriptors)
>  		goto err_free_ring;
> =20
> +	if (nhi_alloc_hop(nhi, ring))
> +		goto err_free_descs;
> +
>  	if (!(flags & RING_FLAG_NO_INTERRUPT) && nhi->ops->request_ring_irq) {
>  		if (nhi->ops->request_ring_irq(ring, flags & RING_FLAG_NO_SUSPEND))
> -			goto err_free_descs;
> +			goto err_free_hop;
>  	}
> =20
> -	if (nhi_alloc_hop(nhi, ring))
> -		goto err_release_msix;

[Severity: High]
Since the allocation order in tb_ring_alloc() is reversed here so the hop ID
is allocated before the IRQ, does the teardown order in tb_ring_free() also
need to be updated to match?

Looking at tb_ring_free(), it clears the hop ID from the nhi arrays and dro=
ps
the lock before releasing the IRQ:

drivers/thunderbolt/nhi.c:tb_ring_free() {
    ...
    if (ring->is_tx)
        ring->nhi->tx_rings[ring->hop] =3D NULL;
    else
        ring->nhi->rx_rings[ring->hop] =3D NULL;
    ...
    spin_unlock_irq(&ring->nhi->lock);

    if (nhi->ops->release_ring_irq)
        nhi->ops->release_ring_irq(ring);
    ...
}

Could this leave a window during concurrent hotplug, stream/network
initialization, or teardown of multiple devices where another thread calling
tb_ring_alloc() dynamically reallocates this same, newly-available hop ID?

If that happens, especially on Apple NHI where the IRQ is determined direct=
ly
by the hop ID, the new thread might attempt to request an IRQ that is still
registered to the old ring. Would this cause devm_request_irq() to fail
with an unexpected -EBUSY?

--=20
Sashiko AI review =C2=B7 https://sashiko.dev/#/patchset/20260830-b4-apple-s=
oc-tbt-v1-0-44bc9348683c@kernel.org?part=3D8
