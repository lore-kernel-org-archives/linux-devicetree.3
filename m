Received: from smtp.kernel.org (aws-us-west-2-korg-mail-alma10-1.taild15c8.ts.net [100.103.45.18])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 0EAA730ACE6
	for <devicetree@vger.kernel.org>; Tue, 13 Oct 2026 05:56:59 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=100.103.45.18
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1791871021; cv=none; b=n0LJmVPFW/H1SSK5CtctFZQBSEgkHjlmCnAW5N6QPFSo+hERJXneL4aj/1nMOGBSfTVPBo5upflQarx8iUYnZtEOg07htIKNLAILmCh1gLHgze0adnFdRfSx3p89laTevxkKofXLY6raxtnKIJ4UblDV9lLkpmEEHcsnxFD/la0=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1791871021; c=relaxed/simple;
	bh=DkplK+iulD8vCeEraef3gqMyMoa1PyMWW6NzyLf12uo=;
	h=Message-ID:From:Subject:To:Cc:In-Reply-To:References:Content-Type:
	 Date; b=CYupS/thcAzWqM7NnJoGivzeMFrvAkkp3o7qXvNE5C3hu3fxQsFLVBEPF5kvOs1tQEpIYEoD7dY0SybKH8W3Z6ZmqLlqDpe2OHtzo7OKgolkrH/8hUUtJrJQ4KheEw5M1obDXMYMffCqHE29jJe5cCzudBG6QgdEcJXt39FdpN4=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=XW4Ix/kh; arc=none smtp.client-ip=100.103.45.18
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="XW4Ix/kh"
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 59EDE1F000FF;
	Tue, 13 Oct 2026 05:56:59 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kernel.org;
	s=k20260515; t=1791871019;
	bh=rpd79/xEYe8Jkm7B5R7EkodpqSJ7Mv3nDGykjmeuIlE=;
	h=From:Subject:Reply-To:To:Cc:In-Reply-To:References:Date;
	b=XW4Ix/khNaGlta/jpdp88+aAkVCLZ/iAqsXFwLSiWs4aaE5c7AmAAVJG+0zH48frU
	 2hFcSr2u7UIj8F9GJY9PQ7KbBoy9VY6e8bKmjLdPgMvDJRQntphF/whRtApYrf/DWG
	 lzrdohwpnjt862a7vA+AfhaMU/gd+DMNSrB18nkJYNwjFh16lvORBRlNQuZy60qk06
	 EaurxZDUdqNt9NK+2f9/GKlogJd/K82zDFeXaVGbZvosn3ud+u7l3I1b9BBS2cRWIV
	 B9S0scn7ExZSFFNdn1VZ3Pesem+sgNeBuxIKVo+57DIjnaNZ0UfPul3n6li5aOtQM/
	 aoPJaFOlWJumg==
Message-ID: <sashiko-outbox-169022@kernel.org>
From: sashiko-bot@kernel.org
Subject: Re: [PATCH RFC v3 7/9] tee: optee: execute yielding RPMI calls
Reply-To: sashiko-reviews@lists.linux.dev
To: "Amirreza Zarrabi" <amirreza.zarrabi@oss.qualcomm.com>
Cc: devicetree@vger.kernel.org, robh@kernel.org, conor+dt@kernel.org
In-Reply-To: <20261012-rpmi-tee-service-grp-dev-v3-7-975b574667e2@oss.qualcomm.com>
References: <20261012-rpmi-tee-service-grp-dev-v3-0-975b574667e2@oss.qualcomm.com>
 <20261012-rpmi-tee-service-grp-dev-v3-7-975b574667e2@oss.qualcomm.com>
Content-Type: text/plain; charset=utf-8
Content-Transfer-Encoding: quoted-printable
Date: Tue, 13 Oct 2026 05:56:59 +0000
Precedence: bulk
X-Mailing-List: devicetree@vger.kernel.org
List-Id: <devicetree.vger.kernel.org>
List-Subscribe: <mailto:devicetree+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:devicetree+unsubscribe@vger.kernel.org>

Thank you for your contribution! Sashiko AI review found 1 potential issue(=
s) to consider:
- [High] optee: missing bounds check on rpc_arg->num_params allows OOB acce=
ss
--

commit 5f5afbcfcd90452c0729b00f504945e1e4f52c26
Author: Amirreza Zarrabi <amirreza.zarrabi@oss.qualcomm.com>

tee: optee: execute yielding RPMI calls

This patch adds the RPMI yielding-call path used by the common OP-TEE
session operations. It submits the command and RPC argument buffers as
ranges within a shared memory parcel and handles RPC requests while the
call is suspended.

> diff --git a/drivers/tee/optee/rpmi_abi.c b/drivers/tee/optee/rpmi_abi.c
> index 8b90c3653e80d..9a6439e15a33f 100644
> --- a/drivers/tee/optee/rpmi_abi.c
> +++ b/drivers/tee/optee/rpmi_abi.c

[ ... ]

> +static int optee_rpmi_yielding_call(struct tee_context *ctx,
> +				    const struct optee_rpmi_call_req *req,
> +				    struct optee_msg_arg *rpc_arg,
> +				    bool system_thread)
> +{

[ ... ]

> +		result =3D le32_to_cpu(resp.result);
> +		if (result =3D=3D OPTEE_RPMI_YIELDING_CALL_RETURN_DONE)
> +			goto done;
> +
> +		cond_resched();
> +		optee_rpmi_handle_rpc(ctx, optee, result, rpc_arg);

[Severity: High]
Does this code allow an out-of-bounds access if the firmware returns a
maliciously large num_params?

In optee_rpmi_do_call_with_arg() below, the RPC buffer is bounded in shared
memory by optee->rpc_param_count.

However, when the firmware populates rpc_arg and optee_rpmi_handle_rpc()
is called here, the num_params field isn't validated. The call chain
optee_rpmi_handle_rpc()->optee_rpmi_handle_rpc_cmd()->optee_rpc_cmd() reach=
es
handle_rpc_supp_cmd() in drivers/tee/optee/rpc.c, which uses the unvalidated
num_params:

	params =3D kmalloc_objs(struct tee_param, arg->num_params);
	if (!params) {
		arg->ret =3D TEEC_ERROR_OUT_OF_MEMORY;
		return;
	}

	if (optee->ops->from_msg_param(optee, params, arg->num_params,
				       arg->params)) {

This processes the RPC arguments using the firmware-supplied arg->num_param=
s,
which can lead to out-of-bounds reads and writes on the arg->params shared
memory array if arg->num_params > optee->rpc_param_count.

[ ... ]

> +static int optee_rpmi_do_call_with_arg(struct tee_context *ctx,
> +				       struct tee_shm *shm, u_int offs,
> +				       bool system_thread)
> +{
> +	struct optee *optee =3D tee_get_drvdata(ctx->teedev);
> +	struct optee_msg_arg *arg, *rpc_arg;

[ ... ]

> +	arg_size =3D OPTEE_MSG_GET_ARG_SIZE(arg->num_params);
> +	rpc_size =3D OPTEE_MSG_GET_ARG_SIZE(optee->rpc_param_count);
> +	rpc_offset =3D offs + arg_size;
> +	rpc_arg =3D tee_shm_get_va(shm, rpc_offset);
> +	if (IS_ERR(rpc_arg))
> +		return PTR_ERR(rpc_arg);
> +
> +	req.arg_offset =3D cpu_to_le64((u64)shm->offset + offs);
> +	req.rpc_offset =3D cpu_to_le64((u64)shm->offset + rpc_offset);
> +	req.arg_size =3D cpu_to_le32(arg_size);
> +	req.rpc_size =3D cpu_to_le32(rpc_size);
> +
> +	return optee_rpmi_yielding_call(ctx, &req, rpc_arg, system_thread);
> +}

--=20
Sashiko AI review =C2=B7 https://sashiko.dev/#/patchset/20261012-rpmi-tee-s=
ervice-grp-dev-v3-0-975b574667e2@oss.qualcomm.com?part=3D7
