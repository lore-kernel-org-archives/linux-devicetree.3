Received: from smtp.kernel.org (aws-us-west-2-korg-mail-alma10-1.taild15c8.ts.net [100.103.45.18])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 79A232D3727
	for <devicetree@vger.kernel.org>; Tue,  6 Oct 2026 00:53:02 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=100.103.45.18
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1791247983; cv=none; b=XJhcFWFTTIy5cIKwzn8Y5i2srYjzEVWhQCfeLT34x0bM4/rJd2lMk/B2x6t9N4cGBwmAWjLkevlC0L3W2vyo36kSnSAqPxngsDj+WvaWNIQJKCiNFCd7kHvdwizY3XT/CLfggPEzx05T8z2widvjaLatSPjag48a0Oe75jbDrXs=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1791247983; c=relaxed/simple;
	bh=7tsQRHj0JcV4UQOHqMjSmygtPRYbxBEVeX+PPeuTs4o=;
	h=From:Subject:To:Cc:In-Reply-To:References:Content-Type:Date:
	 Message-Id; b=A01sIlIqqs3ZpYkvCEec/u43F8vuv3EDIT9qWYiEIXhvd5dZaiHBtgViBavLwcMtK1hRKoMs12ObChPuGy3+wErDkx9/vj4cnoARnTWCgRGy7gZdqXkVk54rE/AjcIiV526zzLWG8joeeMm5dAEDy2pba3+D4gRaJv+HdKUYTt0=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=I3D3/Zpq; arc=none smtp.client-ip=100.103.45.18
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="I3D3/Zpq"
Received: by smtp.kernel.org (Postfix) with ESMTPSA id ACB591F000FF;
	Tue,  6 Oct 2026 00:53:01 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kernel.org;
	s=k20260515; t=1791247982;
	bh=8AV7aCgKaZyRmFogdnPvPIIh6WealSLOqpGlqmte+5U=;
	h=From:Subject:Reply-To:To:Cc:In-Reply-To:References:Date;
	b=I3D3/ZpqF1INIiF62cucPADSKNrhdxqXCfVwhrX19csBetEkVa68w4FlhYFHtfEp3
	 tzEYjF5fpjDCEv1lJi6m+lVq4Z/Pjo/b4YtL1k+tfd5o40LIFHu90nsAq3v4q5jnel
	 pGva2ZzKlVME0pwhAb2WmcCsy5fnIYhN2umkSJP9jRvFZKHlnkFkxwHSjrSEkqm6NK
	 7vMehNIVkmRas9Wlxu+qGhOA8XmJe5igbe2z/l61TCzYq4M1asTTFAT879jRm0XxXS
	 NTnKwDAvLykgzQf+sRorV675ZJRvOzHP5o7OxPVTLJnWQu37NnTd8VdnM2qZMuP/DG
	 jpnZpYNd59XvQ==
From: sashiko-bot@kernel.org
Subject: Re: [PATCH RFC v2 7/8] tee: optee: bind RPMI services and negotiate
 backend capabilities
Reply-To: sashiko-reviews@lists.linux.dev
To: "Amirreza Zarrabi" <amirreza.zarrabi@oss.qualcomm.com>
Cc: conor+dt@kernel.org, devicetree@vger.kernel.org, robh@kernel.org
In-Reply-To: <20261005-rpmi-tee-service-grp-dev-v2-7-72f222e23ec1@oss.qualcomm.com>
References: <20261005-rpmi-tee-service-grp-dev-v2-0-72f222e23ec1@oss.qualcomm.com>
 <20261005-rpmi-tee-service-grp-dev-v2-7-72f222e23ec1@oss.qualcomm.com>
Content-Type: text/plain; charset=utf-8
Content-Transfer-Encoding: quoted-printable
Date: Tue, 06 Oct 2026 00:53:01 +0000
Message-Id: <20261006005301.ACB591F000FF@smtp.kernel.org>
Precedence: bulk
X-Mailing-List: devicetree@vger.kernel.org
List-Id: <devicetree.vger.kernel.org>
List-Subscribe: <mailto:devicetree+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:devicetree+unsubscribe@vger.kernel.org>

Thank you for your contribution! Sashiko AI review found 2 potential issue(=
s) to consider:
- [Medium] tee: optee: mixing goto and __free() violates cleanup guidelines
- [Low] tee: optee: missing cleanup of shm_arg_cache on probe error paths
--

commit 3ef22394684ff6d8b2126c91fa4c8bb2d1960d68
Author: Amirreza Zarrabi <amirreza.zarrabi@oss.qualcomm.com>

tee: optee: bind RPMI services and negotiate backend capabilities

Register an RPMI service driver matching the OP-TEE service UUID and integr=
ate
it with OP-TEE module initialization and removal. It checks the service API
version, queries the trusted OS revision, initializes shared-memory trackin=
g,
and connects the RPMI backend to the common OP-TEE operations.

> diff --git a/drivers/tee/optee/rpmi_abi.c b/drivers/tee/optee/rpmi_abi.c
> index 6e76316794c18..db541f3de4250 100644
> --- a/drivers/tee/optee/rpmi_abi.c
> +++ b/drivers/tee/optee/rpmi_abi.c
[ ... ]
> +static int optee_rpmi_probe(struct rpmi_tee_device *rdev)
> +{
> +	struct tee_device *teedev;
> +	struct tee_context *ctx;
> +	int ret;
> +
> +	struct optee *optee __free(kfree) =3D kzalloc_obj(*optee);

[Severity: Medium]
Does this function mix goto-based error handling and scope-based cleanup?

According to the kernel cleanup subsystem guidelines, mixing goto and
scope-based cleanups like __free() in the same function creates confusing
ownership semantics and raises the risk of missed cleanups. The guidelines
suggest converting all resources to scope-based cleanup or none at all.

> +	if (!optee)
> +		return -ENOMEM;
> +
[ ... ]
> +	optee_cq_init(&optee->call_queue, 0);
> +	optee_supp_init(&optee->supp);
> +	optee_shm_arg_cache_init(optee, OPTEE_SHM_ARG_SHARED);
> +	mutex_init(&optee->rpmb_dev_mutex);
> +	INIT_WORK(&optee->rpmb_scan_bus_work, optee_bus_scan_rpmb);
> +	optee->rpmb_intf.notifier_call =3D optee_rpmb_intf_rdev;
> +	ret =3D optee_notif_init(optee, optee->rpmi.notification_count);
> +	if (ret)
> +		goto err_common;
[ ... ]
> +err_initialized:
> +	/* The remove path owns and frees the published backend state. */
> +	retain_and_null_ptr(optee);
> +	optee_rpmi_remove(rdev);
> +
> +	return ret;
> +err_devices:
> +	tee_device_unregister(optee->supp_teedev);
> +	tee_device_unregister(optee->teedev);
> +	optee_shm_arg_cache_uninit(optee);
> +err_notif:
> +	optee_notif_uninit(optee);
> +err_common:

[Severity: Low]
Are we missing the cleanup of the argument cache on the err_common path?

If optee_notif_init() fails, the code jumps to err_common, bypassing
err_devices where optee_shm_arg_cache_uninit() is called. This skips the
mutex_destroy() for the argument cache. The actual memory for the optee
struct is freed via the scope-based cleanup, but the logical teardown
is bypassed.

> +	optee_supp_uninit(&optee->supp);
> +	mutex_destroy(&optee->call_queue.mutex);
> +	rpmb_dev_put(optee->rpmb_dev);
> +	mutex_destroy(&optee->rpmb_dev_mutex);
> +	optee_rpmi_shm_rht_uninit(optee);
> +err_pool:
> +	tee_shm_pool_free(optee->pool);
> +
> +	return ret;
> +}

--=20
Sashiko AI review =C2=B7 https://sashiko.dev/#/patchset/20261005-rpmi-tee-s=
ervice-grp-dev-v2-0-72f222e23ec1@oss.qualcomm.com?part=3D7
