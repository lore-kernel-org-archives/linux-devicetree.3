Received: from smtp.kernel.org (aws-us-west-2-korg-mail-alma10-1.taild15c8.ts.net [100.103.45.18])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 3F15733689D
	for <devicetree@vger.kernel.org>; Sat, 12 Sep 2026 10:30:10 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=100.103.45.18
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1789209011; cv=none; b=N+q05OC8vGPLg0Bq/14vpczymc3qt/bbCCoXH1KWFvhSvkbNjOnDP/kw6dMcwftcIMOtHpXIaURqZX5SBkE3PV/OIcnEHrSPVigPR2kA9/qPWY1QSJoY0gYdEaTZL2Lb/lYVhkB39Y0dUqksbBra6WRRS9Ll3HUmiALpu3W87rc=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1789209011; c=relaxed/simple;
	bh=P1/p25eafvQVTrawhR/lBfVRByNPgSAPZYazzH6KBkk=;
	h=From:Subject:To:Cc:In-Reply-To:References:Content-Type:Date:
	 Message-Id; b=UZQt9Gi5NTlwjtn9XKd4da/RiF9pk+a02F9zRYAwe2JLcW37aiH//KcN1BV9e2k4sgpZfDpOBkHOye6vnCnwjxUzyIHdVcsYVRMArHkZJnj1XLusKef1rMz4O5hglMdMP8GfpVo7nxmcjiP5LrisZjf/bLDcSulbNTJZK3nFLt8=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=b8kc5p2q; arc=none smtp.client-ip=100.103.45.18
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="b8kc5p2q"
Received: by smtp.kernel.org (Postfix) with ESMTPSA id CFB8B1F00893;
	Sat, 12 Sep 2026 10:30:09 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kernel.org;
	s=k20260515; t=1789209010;
	bh=3N7FkWN84fVPlDmMkAHr4EDn/ERc/v2ey9bx+bpN5iA=;
	h=From:Subject:Reply-To:To:Cc:In-Reply-To:References:Date;
	b=b8kc5p2qwHNPo/QB8nWUz597HRJxxcjWjD1lKGMl4UmkIXSgEmLjVq6hGWrg9y5Th
	 Usv6tceWYyFjOew5Lyul53L1D9wPHbnbJjmvaXGoslwTZ9SXlFNtchENRrMbGnYlbP
	 9z7dBF9QLFhverTk5eF6GQaE1MM2ddYZ6wfHQkU4itAL5a48Gv/paWCLd7llQKZWXL
	 j1I4Hn2x+pd2Zlh6Qyy3pMM242A3Ge8moUCn/eDyBWBJVRQ3F49ZDlppcE92JshFXy
	 WDFNvvMcpN2E9YubBIk4eruezMzNGoCJ4QmTalxQlTey7Aqy8WZ7rr95Mm1jszrc4W
	 XjE4VEaL3zx6g==
From: sashiko-bot@kernel.org
Subject: Re: [PATCH RFC 3/5] optee: riscv: enable persistent shared argument
 cache
Reply-To: sashiko-reviews@lists.linux.dev
To: "Amirreza Zarrabi" <amirreza.zarrabi@oss.qualcomm.com>
Cc: robh@kernel.org, conor+dt@kernel.org, devicetree@vger.kernel.org
In-Reply-To: <20260912-rpmi-tee-service-grp-dev-v1-3-1d1d35c2a859@oss.qualcomm.com>
References: <20260912-rpmi-tee-service-grp-dev-v1-0-1d1d35c2a859@oss.qualcomm.com>
 <20260912-rpmi-tee-service-grp-dev-v1-3-1d1d35c2a859@oss.qualcomm.com>
Content-Type: text/plain; charset=utf-8
Content-Transfer-Encoding: quoted-printable
Date: Sat, 12 Sep 2026 10:30:09 +0000
Message-Id: <20260912103009.CFB8B1F00893@smtp.kernel.org>
Precedence: bulk
X-Mailing-List: devicetree@vger.kernel.org
List-Id: <devicetree.vger.kernel.org>
List-Subscribe: <mailto:devicetree+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:devicetree+unsubscribe@vger.kernel.org>

Thank you for your contribution! Sashiko AI review found 2 potential issue(=
s) to consider:

New issues:
- [High] Missing .system_session callback in optee_riscv_clnt_ops leads to =
-EINVAL and potential deadlocks in SCMI.

Pre-existing issues:
- [High] Preexisting heap out-of-bounds write and newly reachable memory ex=
haustion in optee_get_msg_arg() when Secure World provides a large rpc_para=
m_count.
--

commit 4888de794792f9ffe4984b86932a02db3b6e5b62
Author: Amirreza Zarrabi <amirreza.zarrabi@oss.qualcomm.com>

optee: riscv: enable persistent shared argument cache

This commit uses the OP-TEE shared argument cache when the secure world
advertises OPTEE_ABI_SEC_CAP_ARG_OFFSET. It allows the argument structure
to reside at an offset within a registered shared-memory buffer to reuse
buffers across calls.

> diff --git a/drivers/tee/optee/optee_riscv.c b/drivers/tee/optee/optee_ri=
scv.c
> index 36115326486d6..72c9eb85f4fed 100644
> --- a/drivers/tee/optee/optee_riscv.c
> +++ b/drivers/tee/optee/optee_riscv.c
[ ... ]
> @@ -1219,6 +1220,15 @@ static int optee_riscv_probe(struct platform_devic=
e *pdev)
>  		goto err_free_channels;
>  	}
> =20
> +	/*
> +	 * If OP-TEE can read the argument struct from an offset into a shared
> +	 * memory buffer, cache and reuse one buffer across calls instead of
> +	 * creating a fresh parcel per call. This is the persistent pool that
> +	 * matches the FF-A OPTEE_FFA_SEC_CAP_ARG_OFFSET path.
> +	 */
> +	if (sec_caps & OPTEE_ABI_SEC_CAP_ARG_OFFSET)
> +		arg_cache_flags |=3D OPTEE_SHM_ARG_SHARED;
> +

[Severity: High]
This is a pre-existing issue, but there appears to be a heap out-of-bounds
write and memory exhaustion in optee_get_msg_arg() when the Secure World
provides a large rpc_param_count. This becomes actively reachable memory
exhaustion when OPTEE_SHM_ARG_SHARED is enabled here.

During probe, optee_riscv_exchange_caps() reads out[1] into rpc_param_count,
which can be up to 255. optee_msg_arg_size() then calculates a required size
sz that can exceed SHM_ENTRY_SIZE (which is hardcoded to PAGE_SIZE).

In optee_get_msg_arg() in drivers/tee/optee/call.c:

    res =3D tee_shm_alloc_kernel_buf(ctx, SHM_ENTRY_SIZE);
    ...
    memset(ma, 0, sz);

Does this blindly allocate exactly SHM_ENTRY_SIZE bytes but then
unconditionally zero-fill sz bytes, leading to an out-of-bounds write?

Furthermore, because this patch explicitly enables OPTEE_SHM_ARG_SHARED, the
cache logic in optee_get_msg_arg() computes:

    args_per_entry =3D SHM_ENTRY_SIZE / sz;

If sz > SHM_ENTRY_SIZE, args_per_entry evaluates to 0.

This makes the cache reuse condition bit < args_per_entry (evaluated as
bit < 0) always false. Does this silently drop the allocation reference into
the cache list and allocate a fresh page on every TEE call without ever
reusing them, leading to memory exhaustion?

[ ... ]
> @@ -1266,7 +1276,7 @@ static int optee_riscv_probe(struct platform_device=
 *pdev)
>  	atomic_set(&optee->riscv.next_nonce, 0);
>  	optee_cq_init(&optee->call_queue, 0);
>  	optee_supp_init(&optee->supp);
> -	optee_shm_arg_cache_init(optee, 0);
> +	optee_shm_arg_cache_init(optee, arg_cache_flags);
>  	mutex_init(&optee->rpmb_dev_mutex);
>  	platform_set_drvdata(pdev, optee);

[Severity: High]
While enabling the persistent shared argument cache here, does the
optee_riscv_clnt_ops structure in drivers/tee/optee/optee_riscv.c lack the
.system_session callback?

The SCMI OP-TEE transport relies on tee_client_system_session() to mark its
sessions as system threads, which prevents thread exhaustion and deadlocks
under heavy load.

tee_client_system_session() unconditionally depends on the
tee_driver_ops->system_session callback. Without this callback assigned
(e.g. .system_session =3D optee_system_session), calls from the SCMI driver
fail with -EINVAL.

Could this force it to fall back to a non-system session and lead to deadlo=
cks
if SCMI is needed for power management during normal OP-TEE tasks?

--=20
Sashiko AI review =C2=B7 https://sashiko.dev/#/patchset/20260912-rpmi-tee-s=
ervice-grp-dev-v1-0-1d1d35c2a859@oss.qualcomm.com?part=3D3
