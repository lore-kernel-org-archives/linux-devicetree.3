Received: from smtp.kernel.org (aws-us-west-2-korg-mail-alma10-1.taild15c8.ts.net [100.103.45.18])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id D77702C325C
	for <devicetree@vger.kernel.org>; Tue,  6 Oct 2026 00:55:23 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=100.103.45.18
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1791248125; cv=none; b=hqLVlTekX6Tb2T3W/TYxZ8oGvCTB22mqjZQyXbm4ioaHs2ZTpgE9IhUwrN1pLgsjWCuYI9fEU9VHE9OHBf7E2DsZFW10ONI0DN2VDn4tT3IJUvbMq2hlhfnMW5QsoDoaC/6Z45qndta3lCMpGicJ7qxpnVO49HlRGUxXLfAzRco=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1791248125; c=relaxed/simple;
	bh=427tMjZ3wJl46ROxD3zEIctZ/F1GGxBrTbAvHATc87c=;
	h=From:Subject:To:Cc:In-Reply-To:References:Content-Type:Date:
	 Message-Id; b=E6r9aI+bHCAWV5tbZ6UPotDZKxSDA4btyxEleq9Qweoh14ga+D3IrdmXNhxh6HkMYMPuFxEC4577YdC1eCiu0Y/+NLUREcyqjYu0okW2Vil3LmCCjsaXANjjOcyOdvnmX+zZ0CH+03vKXUYEdTffprFZbZCKOgIuUCTy3a59YDM=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=ju3sN1GO; arc=none smtp.client-ip=100.103.45.18
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="ju3sN1GO"
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 3C10B1F000FF;
	Tue,  6 Oct 2026 00:55:23 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kernel.org;
	s=k20260515; t=1791248123;
	bh=nWK/meZh44t0lMtn4aetccfR6khdxxb5Bn/z/u+7y/Q=;
	h=From:Subject:Reply-To:To:Cc:In-Reply-To:References:Date;
	b=ju3sN1GOGEeVOPv/tdmclpc9sXcl84Kuz6TRj6za5edMAeSWkI/Fl2fUKuLi40tNp
	 iewj6bp99UohVuMMXIpTrbdK91dQSaX126M+/VRDvsYy5GzznrCHwLNAAShU8U3RW2
	 dGBfCbyu6z2LFKmYzSpXQPs2Xt1zJu72W6Ga1mVoLbn/pXo4vgeUlrBEQ3niS3Q/sM
	 rY4Bq+bbHIf4CfWvo9rmK+ux6MvJuR/cGT6m2ijQ79bKCBAoiXA8QrmHXzgiRSKEbY
	 QHS0pvvBYB0mQYRJgzj909/MUL9tXajd3CQPe6ObpBHBgZes1HnMpRTBSpbiMG9QIm
	 ud0Vk9hP4t6Ug==
From: sashiko-bot@kernel.org
Subject: Re: [PATCH RFC v2 4/8] tee: optee: add RPMI dynamic shared-memory
 pool
Reply-To: sashiko-reviews@lists.linux.dev
To: "Amirreza Zarrabi" <amirreza.zarrabi@oss.qualcomm.com>
Cc: conor+dt@kernel.org, devicetree@vger.kernel.org, robh@kernel.org
In-Reply-To: <20261005-rpmi-tee-service-grp-dev-v2-4-72f222e23ec1@oss.qualcomm.com>
References: <20261005-rpmi-tee-service-grp-dev-v2-0-72f222e23ec1@oss.qualcomm.com>
 <20261005-rpmi-tee-service-grp-dev-v2-4-72f222e23ec1@oss.qualcomm.com>
Content-Type: text/plain; charset=utf-8
Content-Transfer-Encoding: quoted-printable
Date: Tue, 06 Oct 2026 00:55:22 +0000
Message-Id: <20261006005523.3C10B1F000FF@smtp.kernel.org>
Precedence: bulk
X-Mailing-List: devicetree@vger.kernel.org
List-Id: <devicetree.vger.kernel.org>
List-Subscribe: <mailto:devicetree+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:devicetree+unsubscribe@vger.kernel.org>

Thank you for your contribution! Sashiko AI review found 2 potential issue(=
s) to consider:
- [High] tee: optee: UAF in optee_rpmi_shm_rht_rm() due to synchronous kfre=
e()
- [Low] build: unused static function optee_rpmi_shm_pool_alloc breaks bise=
ct
--

commit c8c597113db02649177403939240e1d7feefbedd
Author: Amirreza Zarrabi <amirreza.zarrabi@oss.qualcomm.com>

tee: optee: add RPMI dynamic shared-memory pool

This patch adds a page-based dynamic shared-memory pool for the RPMI backend
using the common TEE allocation and free helpers. It registers allocated
pages as RPMI parcels so OP-TEE can access them, and unregisters the parcels
before freeing their backing pages.

> diff --git a/drivers/tee/optee/rpmi_abi.c b/drivers/tee/optee/rpmi_abi.c
> index e7fc853cfb150..c29b7ac4552a9 100644
> --- a/drivers/tee/optee/rpmi_abi.c
> +++ b/drivers/tee/optee/rpmi_abi.c

[ ... ]

> +static void optee_rpmi_pool_free(struct tee_shm_pool *pool, struct tee_s=
hm *shm)
> +{
> +	tee_dyn_shm_free_helper(shm, optee_rpmi_shm_unregister);
> +}

[Severity: High]
Is there a risk of a use-after-free during bucket traversal here?

When tee_dyn_shm_free_helper() executes optee_rpmi_shm_unregister() in
drivers/tee/optee/rpmi_abi.c, it subsequently calls optee_rpmi_shm_rht_rm()
to remove the hash table entry. This same path is also triggered via
optee_rpmi_shm_unregister_supp().

In optee_rpmi_shm_rht_rm():

	if (entry)
		ret =3D rhashtable_remove_fast(&optee->rpmi.shm_rht,
					     &entry->node,
					     optee_rpmi_shm_rht_params);
	if (!ret)
		kfree(entry);

Because rhashtable uses RCU-based worker threads (rht_deferred_worker) to
traverse the hash table concurrently during automatic resizing, freeing
the entry synchronously via kfree() instead of kfree_rcu() might cause a
use-after-free if a rehash worker is actively traversing the removed node's
bucket list.

Note that this issue is reachable from unprivileged user space by repeatedly
registering and unregistering memory, driving the size of the table up and
down to trigger rehashing.

[ ... ]

> +static struct tee_shm_pool *optee_rpmi_shm_pool_alloc(void)
> +{
> +	struct tee_shm_pool *pool;
> +
> +	pool =3D kzalloc_obj(*pool);
> +	if (!pool)
> +		return ERR_PTR(-ENOMEM);
> +
> +	pool->ops =3D &optee_rpmi_pool_ops;
> +
> +	return pool;
> +}

[Severity: Low]
Could this unused function break git bisect?

The static function optee_rpmi_shm_pool_alloc() in
drivers/tee/optee/rpmi_abi.c is defined here but is never invoked in this
patch. Under CONFIG_WERROR=3Dy, the compiler warning for an unused function
promotes to a build error.

While this is fixed later in the series by commit
3ef22394684ff6d8b2126c91fa4c8bb2d1960d68 (tee: optee: bind RPMI services and
negotiate backend capabilities), each individual patch in a series
should compile cleanly to ensure git bisect continues to work.

--=20
Sashiko AI review =C2=B7 https://sashiko.dev/#/patchset/20261005-rpmi-tee-s=
ervice-grp-dev-v2-0-72f222e23ec1@oss.qualcomm.com?part=3D4
