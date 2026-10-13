Received: from smtp.kernel.org (aws-us-west-2-korg-mail-alma10-1.taild15c8.ts.net [100.103.45.18])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id D281747A0A9
	for <devicetree@vger.kernel.org>; Tue, 13 Oct 2026 05:59:02 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=100.103.45.18
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1791871143; cv=none; b=qKzHuquKg+dcNSWgFhOSElpNOtmEFZChoZBVnD16q/0LhfopFAX0J40veOdeUVdGELIhKks6IbJmV0YMQhmN8SnORcWyvYxtgfa5ekH0NBYkgnSmeSCqtF4sqdjankkcu4G21mTuZGvLv1hl4zmx9V4jBga+sQVPXYEqVLtd+Ds=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1791871143; c=relaxed/simple;
	bh=RYTiKcZXZuYfy1GZ3O601X1MSQ0M09VMkW5F09qgqTg=;
	h=Message-ID:From:Subject:To:Cc:In-Reply-To:References:Content-Type:
	 Date; b=FZzNneD31gThUgRS2yygYsCfUs7vD7v3sEnUPP+rFYaDsU8YOPif5SV/hgWQTuk+BgoBq/Qiif29dZ2B0ZR65R6ydy9vCLnlBEFE6Zvf3xhALEGwQcbIARgBSAzG725q0l2PQqEvpZuHi0oNXT4wxpNg5sc8+Blv5yg/PCDg+Uk=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=XH/6wRba; arc=none smtp.client-ip=100.103.45.18
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="XH/6wRba"
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 7E8E31F000FF;
	Tue, 13 Oct 2026 05:59:02 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kernel.org;
	s=k20260515; t=1791871142;
	bh=grNF8NrMJrJsf0jCVXNyCC8qgOaJS1baygpuMpNE2uY=;
	h=From:Subject:Reply-To:To:Cc:In-Reply-To:References:Date;
	b=XH/6wRbaB1PcsI/3UKnOabPr84HdujZajIZdbAsIQI4xXVQaU8y2VHUMBsaI5Pvfd
	 CLTCkD8mX5YYHu6nB6jaZk69HfiSGy5IMmOKmZ9Vb3XjzSO7wQ9CzIYoXFG/RJU0H/
	 tlGD6BBFgMwTrj6oQhlwZxCuIUdqNfMxCMGGE/EicqzMklGwfuCmySW5vPn5pKj1J3
	 3W5spx2Bj0PImfn2hMwiLg1Zu4vsi6XYZn6xv+6tT+zrNzUneuOMoVI9dEk31VznhU
	 4BtaIDrAhMgv3io1ykJCBu5JSRg3j0XsRXCbxY49wLqEmFxp6o5yQHPx6aqkEb0GoL
	 kb1xtz9UE0/DA==
Message-ID: <sashiko-outbox-169029@kernel.org>
From: sashiko-bot@kernel.org
Subject: Re: [PATCH RFC v3 6/9] tee: optee: add RPMI RPC handling
Reply-To: sashiko-reviews@lists.linux.dev
To: "Amirreza Zarrabi" <amirreza.zarrabi@oss.qualcomm.com>
Cc: devicetree@vger.kernel.org, robh@kernel.org, conor+dt@kernel.org
In-Reply-To: <20261012-rpmi-tee-service-grp-dev-v3-6-975b574667e2@oss.qualcomm.com>
References: <20261012-rpmi-tee-service-grp-dev-v3-0-975b574667e2@oss.qualcomm.com>
 <20261012-rpmi-tee-service-grp-dev-v3-6-975b574667e2@oss.qualcomm.com>
Content-Type: text/plain; charset=utf-8
Content-Transfer-Encoding: quoted-printable
Date: Tue, 13 Oct 2026 05:59:02 +0000
Precedence: bulk
X-Mailing-List: devicetree@vger.kernel.org
List-Id: <devicetree.vger.kernel.org>
List-Subscribe: <mailto:devicetree+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:devicetree+unsubscribe@vger.kernel.org>

Thank you for your contribution! Sashiko AI review found 2 potential issue(=
s) to consider:
- [High] tee/optee: Use-After-Free race in SHM_FREE RPC due to missing refc=
ount
- [Medium] tee/optee: Memory leak via type confusion in SHM_FREE RPC
--

commit 3440aa8b7411752d7f5d5849d15211a269875fce
Author: Amirreza Zarrabi <amirreza.zarrabi@oss.qualcomm.com>

tee: optee: add RPMI RPC handling

OP-TEE can suspend a yielding call to request services from normal world
through RPC. This patch adds handlers for shared-memory allocation and
free requests, returning RPMI parcel references. It routes other
commands through the common OP-TEE RPC dispatcher.

> diff --git a/drivers/tee/optee/rpmi_abi.c b/drivers/tee/optee/rpmi_abi.c
> index bbb219ddab381..8b90c3653e80d 100644
> --- a/drivers/tee/optee/rpmi_abi.c
> +++ b/drivers/tee/optee/rpmi_abi.c

[ ... ]

> +static void optee_rpmi_handle_rpc_shm_free(struct tee_context *ctx,
> +					   struct optee *optee,
> +					   struct optee_msg_arg *arg)
> +{
> +	struct tee_shm *shm;
> +	u64 type, global_id;
> +
> +	if (arg->num_params !=3D 1 ||
> +	    arg->params[0].attr !=3D OPTEE_MSG_ATTR_TYPE_VALUE_INPUT)
> +		goto err_bad_param;
> +
> +	type =3D arg->params[0].u.value.a;
> +	global_id =3D arg->params[0].u.value.b;
> +	/* SHM_FREE requires a non-NULL identity. */
> +	if (!optee_rpmi_nonce(global_id) || arg->params[0].u.value.c)
> +		goto err_bad_param;
> +
> +	shm =3D optee_shm_handle_map_lookup(&optee->rpmi.shm_map, global_id);

[Severity: High]
Does this code allow a use-after-free if concurrent free requests are made?

If a compromised or buggy TEE issues concurrent OPTEE_RPC_CMD_SHM_FREE RPC
requests for the same global_id, multiple kernel threads could obtain the s=
ame
unrefcounted shm pointer from optee_shm_handle_map_lookup() before it is
removed from the map.

Both threads would then concurrently call tee_shm_free() (or
optee_rpc_cmd_free_suppl()), causing a use-after-free when the second thread
attempts to drop the reference count.

> +	if (!shm)
> +		goto err_bad_param;
> +
> +	switch (type) {

[Severity: Medium]
Could this code cause a memory leak by trusting the type from the message?

The type is read directly from the untrusted secure world message without
verifying that the shm object actually corresponds to that allocation type.

If the secure world requests to free a supplicant-allocated buffer but spoo=
fs
the type as OPTEE_RPC_SHM_TYPE_KERNEL, the kernel will execute
tee_shm_free(shm).

This bypasses optee_rpc_cmd_free_suppl(), preventing the free message from
reaching the user-space supplicant, which will then permanently leak the
memory.

> +	case OPTEE_RPC_SHM_TYPE_APPL:
> +		optee_rpc_cmd_free_suppl(ctx, shm);
> +		break;
> +	case OPTEE_RPC_SHM_TYPE_KERNEL:
> +		tee_shm_free(shm);
> +		break;
> +	default:
> +		goto err_bad_param;
> +	}
> +
> +	arg->ret =3D TEEC_SUCCESS;
> +	return;
> +
> +err_bad_param:
> +	arg->ret =3D TEEC_ERROR_BAD_PARAMETERS;
> +}

--=20
Sashiko AI review =C2=B7 https://sashiko.dev/#/patchset/20261012-rpmi-tee-s=
ervice-grp-dev-v3-0-975b574667e2@oss.qualcomm.com?part=3D6
