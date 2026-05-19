Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id C5F6E3D9DC4
	for <devicetree@vger.kernel.org>; Tue, 19 May 2026 07:34:01 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=10.30.226.201
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1779176041; cv=none; b=aujCou+1dmQ64PDCVvcrQoStFt8HZcBzHh8bjU9NWjXE45nu1Qn9Uxts5uoVre8UVGOSVtAX8kRSB5w6ojGltiDQe/u7EGyF4jciW1VnO9rAFlGk9scK1/75F4//Io2RZtfMV2K3kgLx5sTh8E121bQC4wlCKUQMcZ+REeMD208=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1779176041; c=relaxed/simple;
	bh=Z67sT99nluKY/JniV6as2CbAodYP11fBr8LBaQX5+q8=;
	h=From:Subject:To:Cc:In-Reply-To:References:Content-Type:Date:
	 Message-Id; b=deQa5nQ013UA0nGwHg3dKrxKyYUZEPl8hntvjJFSxA9oAXqfRhpXFG3gIElvEmVY/6RmgFuZsoe2WqX9Xn0VVZhLOFXw3zxDvK56MoAhZx8Qk//E4ir3HIsbV2LGvA/sfhnvmRVYWsqfo+IyFQe918HJ4a0CUzhgAy3UDZWuZuU=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=hHM0Fjbi; arc=none smtp.client-ip=10.30.226.201
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="hHM0Fjbi"
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 98831C2BCB3;
	Tue, 19 May 2026 07:33:55 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1779176041;
	bh=Z67sT99nluKY/JniV6as2CbAodYP11fBr8LBaQX5+q8=;
	h=From:Subject:Reply-To:To:Cc:In-Reply-To:References:Date:From;
	b=hHM0Fjbim2hdWNKqxOKPvavNI5+zcD5vnFr+Z6D+iDZVOygbXfSxVUJmmBUt7vbsG
	 Ncv87mZbnyuqDhLg7H7C61hUVhB4JFOzXHAN9ouuwoVCYXFQ4OZMiU6v0uD2cGgu3u
	 tTKcZ5hE59Mel6qBlXl28VXe93FYlEwq9P9xkK1H7wL+4dpYDt8Dd1fH+hBKvRcmE8
	 lnr53nKCAGJZBPiSoZ1/Eq23Q35OP9OURpNhRcptuqA5qNSfpHqwtHpzT3GhoCHp9G
	 tPBFstrbCQuPYPmjSgmDjDLTDQNqWd01Eivelrtn4VNfQfjqamjoZEkl0djRVxY+tu
	 xacukrdZqv4Tg==
From: sashiko-bot@kernel.org
Subject: Re: [PATCH v6 05/16] remoteproc: qcom_q6v5_pas: Switch over to
 generic PAS TZ APIs
Reply-To: sashiko-reviews@lists.linux.dev
To: "Sumit Garg" <sumit.garg@kernel.org>
Cc: robh@kernel.org, conor+dt@kernel.org, devicetree@vger.kernel.org
In-Reply-To: <20260518072856.22790-6-sumit.garg@kernel.org>
References: <20260518072856.22790-6-sumit.garg@kernel.org>
Content-Type: text/plain; charset=utf-8
Content-Transfer-Encoding: quoted-printable
Date: Tue, 19 May 2026 07:33:55 +0000
Message-Id: <20260519073355.98831C2BCB3@smtp.kernel.org>
Precedence: bulk
X-Mailing-List: devicetree@vger.kernel.org
List-Id: <devicetree.vger.kernel.org>
List-Subscribe: <mailto:devicetree+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:devicetree+unsubscribe@vger.kernel.org>

Thank you for your contribution! Sashiko AI review found 4 potential issue(=
s) to consider:
- [Critical] Unconditionally calling `qcom_scm_assign_mem()` without checki=
ng SCM availability causes a NULL pointer dereference on non-SCM platforms.
- [High] MDT firmware loading is not abstracted and continues to hardcode S=
CM APIs, causing both a build warning and functional failure on non-SCM bac=
kends.
- [High] The DTB subsystem (dtb_pas_id) is authenticated but never shut dow=
n in the error paths of qcom_pas_start().
- [High] The firmware object pas->dtb_firmware is leaked on the success pat=
h of qcom_pas_load().
--

commit e21bc74de5d7e3215e46e9baa1c3a6b26f353409
Author: Sumit Garg <sumit.garg@oss.qualcomm.com>

remoteproc: qcom_q6v5_pas: Switch over to generic PAS TZ APIs

This patch switches the qcom_q6v5_pas client driver over to generic PAS TZ
APIs. This allows supporting multiple TrustZone implementation backends
such as QTEE and OP-TEE.

> diff --git a/drivers/remoteproc/qcom_q6v5_pas.c b/drivers/remoteproc/qcom=
_q6v5_pas.c
> index da27d1d3c9da6..847249c28c1be 100644
> --- a/drivers/remoteproc/qcom_q6v5_pas.c
> +++ b/drivers/remoteproc/qcom_q6v5_pas.c
[ ... ]
> @@ -118,8 +119,8 @@ struct qcom_pas {
>  	struct qcom_rproc_ssr ssr_subdev;
>  	struct qcom_sysmon *sysmon;
> =20
> -	struct qcom_scm_pas_context *pas_ctx;
> -	struct qcom_scm_pas_context *dtb_pas_ctx;
> +	struct qcom_pas_context *pas_ctx;
> +	struct qcom_pas_context *dtb_pas_ctx;
>  };

Does changing this struct cause a compiler warning and functional regression
for non-SCM backends?

Since this patch changes the context type to struct qcom_pas_context * but
still passes it to qcom_mdt_pas_load(), it appears to cause an incompatible
pointer type warning.

Furthermore, qcom_mdt_pas_load() internally hardcodes calls to SCM-specific
APIs like qcom_scm_pas_init_image(), bypassing the generic PAS backend
entirely. This seems to prevent the driver from working on non-SCM backends
like OP-TEE.

I notice this is fixed later in the series in the commit "soc: qcom:
mdtloader: Switch to generic PAS TZ APIs", but I am pointing it out here as
it breaks the build and functionality at this step.

[ ... ]
> @@ -250,7 +251,7 @@ static int qcom_pas_load(struct rproc *rproc, const s=
truct firmware *fw)
>  	return 0;
> =20
>  release_dtb_metadata:
> -	qcom_scm_pas_metadata_release(pas->dtb_pas_ctx);
> +	qcom_pas_metadata_release(pas->dtb_pas_ctx);
>  	release_firmware(pas->dtb_firmware);
> =20
>  	return ret;

Is there a pre-existing resource leak here?

When request_firmware() allocates the DTB firmware and qcom_mdt_pas_load()
succeeds, the function returns 0 and skips the release_dtb_metadata label
where release_firmware() is called.

The pas->dtb_firmware pointer appears to be retained but never freed in any
teardown function like qcom_pas_unprepare() or qcom_pas_stop(). Could this
permanently leak the firmware object and its backing buffer on every
successful start?

[ ... ]
> @@ -339,13 +340,13 @@ static int qcom_pas_start(struct rproc *rproc)
>  	ret =3D qcom_q6v5_wait_for_start(&pas->q6v5, msecs_to_jiffies(5000));
>  	if (ret =3D=3D -ETIMEDOUT) {
>  		dev_err(pas->dev, "start timed out\n");
> -		qcom_scm_pas_shutdown(pas->pas_id);
> +		qcom_pas_shutdown(pas->pas_id);
>  		goto unmap_carveout;
>  	}

Does this error path miss shutting down the DTB subsystem?

While this was not introduced by this patch, if the DTB authentication
step earlier in this function succeeds, but a subsequent step like
qcom_q6v5_wait_for_start() fails, the error path shuts down the main PAS but
misses calling qcom_pas_shutdown(pas->dtb_pas_id).

The code then jumps to unmap_dtb_carveout and unmaps the Linux-side memory,
leaving the DTB subsystem active in TrustZone while its backing memory is
unmapped.

[ ... ]
> @@ -746,7 +747,7 @@ static int qcom_pas_probe(struct platform_device *pde=
v)
>  	if (!desc)
>  		return -EINVAL;
> =20
> -	if (!qcom_scm_is_available())
> +	if (!qcom_pas_is_available())
>  		return -EPROBE_DEFER;
> =20
>  	fw_name =3D desc->firmware_name;

Could this change lead to a NULL pointer dereference on non-SCM platforms?

By replacing the qcom_scm_is_available() check with qcom_pas_is_available(),
the probe function can now continue on platforms using non-SCM backends like
OP-TEE.

However, further down in probe, qcom_pas_assign_memory_region() is still
unconditionally called if pas->region_assign_idx is set:

qcom_pas_assign_memory_region()
   qcom_scm_assign_mem()

qcom_scm_assign_mem() accesses __scm->mempool without checking if __scm is
NULL. On non-SCM platforms, __scm will be NULL, which seems like it would
cause a kernel panic during probe for devices requiring memory region
assignment.

--=20
Sashiko AI review =C2=B7 https://sashiko.dev/#/patchset/20260518072856.2279=
0-1-sumit.garg@kernel.org?part=3D5
