Received: from smtp.kernel.org (aws-us-west-2-korg-mail-alma10-1.taild15c8.ts.net [100.103.45.18])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id ED2C23A254A
	for <devicetree@vger.kernel.org>; Tue, 13 Oct 2026 05:56:08 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=100.103.45.18
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1791870970; cv=none; b=bMEFIMw6+S5GfnrNvmH/PK/g8Rv6XppuUy08vIb937E8trsAd4mZDFQ9DpuhaMGcd8/2FYVNNewMskF9HlnZcnHhO1wcSYScBvSpCc2lwBEey6+ngLRkxvgWmNQsINmBDOOSoh6BiYHGGupsLEnmAc1z8vXfdiBgR+mfSJ64pPE=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1791870970; c=relaxed/simple;
	bh=K02yvicQkF3ubq9m72QMYVXdp7HAl5mOJP73FA2QjFc=;
	h=Message-ID:From:Subject:To:Cc:In-Reply-To:References:Content-Type:
	 Date; b=Fw6S5LqiJRLcQuCalIGDWboNPnneVNvRAoVlSryN15HC6IXbGZqFRqPbQ+jv1mVBjLuhbjTRIjCaAcFP3yI3uGcHY/WVBFvWiLBT/TwFhp6SH5NKZqsN80qHP8oaExyEmmHVUTxHs7ac5IsRdzmAjpYP021ePsyn8YV4FvVr4kg=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=Of4Tb2IG; arc=none smtp.client-ip=100.103.45.18
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="Of4Tb2IG"
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 8EF2E1F000FF;
	Tue, 13 Oct 2026 05:56:08 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kernel.org;
	s=k20260515; t=1791870968;
	bh=2jLPNk1LsDU0lDPIBGm2w8ke2Ogx1gFBQWwRjf76WZ8=;
	h=From:Subject:Reply-To:To:Cc:In-Reply-To:References:Date;
	b=Of4Tb2IGzKRI3aFOzcyTe/cywgJSuUMXen6yQGXnJBWD9y3Y+F2hm3h4Fc9xm2Zko
	 m5OWxEVLEQVN7M4b1+3PVrZDOfi3DYoZ+0gEnOkEOu84Q/MGGfKi1YyP+8SmutGqmU
	 JuFQj9qGt3ivgxKqId5aXD+ZAd0Cr5ImT3DtLryt82a9d62qEUwrn0xLV7DBQ6E3Ui
	 TIOLfJyGeEXDsOm4eZPUtockFjvawtXFr5YsDezp4QCkeiEC0odtX1zgJZ3H99DItz
	 WKc6ikYxjcV4TyuJW5QZP8itLYSVbneDz8apGJyUmWrsv4fN5RgtQmHeQy/eHrjF1V
	 lu6CYFCNaa2eA==
Message-ID: <sashiko-outbox-169021@kernel.org>
From: sashiko-bot@kernel.org
Subject: Re: [PATCH RFC v3 1/9] tee: optee: share the global shared-memory
 ID mapping
Reply-To: sashiko-reviews@lists.linux.dev
To: "Amirreza Zarrabi" <amirreza.zarrabi@oss.qualcomm.com>
Cc: devicetree@vger.kernel.org, robh@kernel.org, conor+dt@kernel.org
In-Reply-To: <20261012-rpmi-tee-service-grp-dev-v3-1-975b574667e2@oss.qualcomm.com>
References: <20261012-rpmi-tee-service-grp-dev-v3-0-975b574667e2@oss.qualcomm.com>
 <20261012-rpmi-tee-service-grp-dev-v3-1-975b574667e2@oss.qualcomm.com>
Content-Type: text/plain; charset=utf-8
Content-Transfer-Encoding: quoted-printable
Date: Tue, 13 Oct 2026 05:56:08 +0000
Precedence: bulk
X-Mailing-List: devicetree@vger.kernel.org
List-Id: <devicetree.vger.kernel.org>
List-Subscribe: <mailto:devicetree+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:devicetree+unsubscribe@vger.kernel.org>

Thank you for your contribution! Sashiko AI review found 1 potential issue(=
s) to consider:
- [High] tee: optee: UAF race in SHM free via unreferenced lookup
--

commit 39c6675fd3cd9df49f5b14024b5f0c43a9129fe8
Author: Amirreza Zarrabi <amirreza.zarrabi@oss.qualcomm.com>

tee: optee: share the global shared-memory ID mapping

This commit moves the FF-A backend's hash table mapping secure-world memory
handles to TEE shared-memory objects into common helpers. It also converts
the FF-A backend to use this new shared mapping API.

> diff --git a/drivers/tee/optee/ffa_abi.c b/drivers/tee/optee/ffa_abi.c
> --- a/drivers/tee/optee/ffa_abi.c
> +++ b/drivers/tee/optee/ffa_abi.c
> @@ -488,7 +404,8 @@ static void handle_ffa_rpc_func_cmd_shm_free(struct t=
ee_context *ctx,
>  	    arg->params[0].attr !=3D OPTEE_MSG_ATTR_TYPE_VALUE_INPUT)
>  		goto err_bad_param;
> =20
> -	shm =3D optee_shm_from_ffa_handle(optee, arg->params[0].u.value.b);
> +	shm =3D optee_shm_handle_map_lookup(&optee->ffa.shm_map,
> +					  arg->params[0].u.value.b);
>  	if (!shm)
>  		goto err_bad_param;

[Severity: High]
Could this lookup introduce a Use-After-Free race if multiple RPCs are
processed concurrently?

If a compromised Secure World sends concurrent OPTEE_RPC_CMD_SHM_FREE RPCs
for the same shared memory global_id, both threads can look up the pointer
before either has a chance to free it.

Since optee_shm_handle_map_lookup() returns the tee_shm pointer without
incrementing its reference count, both threads will then proceed down to
tee_shm_free() or optee_rpc_cmd_free_suppl(). The first thread will drop
the reference to 0, freeing the object, and the second thread will
subsequently access shm->refcount on the freed pointer.

> diff --git a/drivers/tee/optee/shm_handle_map.c b/drivers/tee/optee/shm_h=
andle_map.c
> --- /dev/null
> +++ b/drivers/tee/optee/shm_handle_map.c
[ ... ]
> +struct tee_shm *
> +optee_shm_handle_map_lookup(struct optee_shm_handle_map *map, u64 global=
_id)
> +{
> +	struct optee_shm_handle_map_entry *entry;
> +	struct tee_shm *shm =3D NULL;
> +
> +	mutex_lock(&map->mutex);
> +	entry =3D rhashtable_lookup_fast(&map->rht, &global_id,
> +				       shm_handle_map_params);
> +	if (entry)
> +		shm =3D entry->shm;
> +	mutex_unlock(&map->mutex);
> +
> +	return shm;
> +}

[Severity: High]
Since this new API helper retrieves the shared memory pointer without acqui=
ring
a reference, does it allow the object to be freed concurrently by another
thread once the mutex is released?

The kerneldoc above this function mentions "The caller must keep the SHM
object alive; no reference is acquired here", but as seen in
handle_ffa_rpc_func_cmd_shm_free(), the caller isn't guaranteed to hold a
reference when handling incoming RPCs from the secure world.

--=20
Sashiko AI review =C2=B7 https://sashiko.dev/#/patchset/20261012-rpmi-tee-s=
ervice-grp-dev-v3-0-975b574667e2@oss.qualcomm.com?part=3D1
