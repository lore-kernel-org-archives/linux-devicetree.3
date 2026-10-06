Received: from smtp.kernel.org (aws-us-west-2-korg-mail-alma10-1.taild15c8.ts.net [100.103.45.18])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 48ACD322A
	for <devicetree@vger.kernel.org>; Tue,  6 Oct 2026 00:55:49 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=100.103.45.18
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1791248150; cv=none; b=XKBCz3Z5jl4lQ2ZhWGuuDeX7CKSVyxG8GFA5Q0otXALlBBRb50GnOxkClfXjYNHlfAV6rQm/kxw5Mfd9XpR/a+4rECzWhTES4eKxaXPR6JWQ+rFAQCXo87Dq4MDvxNuq8s6feQ+TIJFLAXfF8ZKHiVmTemuL5V6ha/rbUmVOzKU=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1791248150; c=relaxed/simple;
	bh=xWbjz1OKwsbjRpw2PCXz9bxuI6Z51Wd/WdHEMXhR4SI=;
	h=From:Subject:To:Cc:In-Reply-To:References:Content-Type:Date:
	 Message-Id; b=KMCpszf1LW685S5OsIhAMCWEsYFlPAgCVw6pLbKvfMCKR3GPXzlKu5LR51yypx7x9HOfhmxYXwLqxH74IdFpua+ZlnbcnDw7j+FgGkftCn/MuwrX/nCPD6Pn/QiRlCipKzOvqgDGfMbYFcEv30Y2CLsUqN6mJ4SCF3r2N338/Zw=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=C7pAz0Rq; arc=none smtp.client-ip=100.103.45.18
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="C7pAz0Rq"
Received: by smtp.kernel.org (Postfix) with ESMTPSA id EA0BD1F000FF;
	Tue,  6 Oct 2026 00:55:48 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kernel.org;
	s=k20260515; t=1791248149;
	bh=ODSpKM1Bxn5GDmeq/H+DlcHbdyhWMa/tpU8CbxMH+7E=;
	h=From:Subject:Reply-To:To:Cc:In-Reply-To:References:Date;
	b=C7pAz0RqFeRY5AJydhDwxrcrpUKyxrYn/taUtqiu7IgqqAOjVLg7rsPPJ331s1zlg
	 NlQf99i10uwOyirNf4nytKUeoBy4SawfM8DSK9dMcymDqlMkWQKwdILl/JYRXzT1WO
	 8tc/NZHdt0pgEdYjfnZp1ujlQSnKe+8EY92oICdmuXVu9i83pX8Ly5gTEIkUxfkUng
	 hcX9fF3VDntvvu60JKoAWBWZt6WQgKWzjbGCeAof/Kf4mU8VABEfvEzCKJflaYIcIn
	 TL9FWYHAFCaJ7ApJ96Z+vEMfas6q+Amquqt+ONl/9mMHeteDaOXEk836Nzlv6Iuld4
	 vqJLnUnDDTzuQ==
From: sashiko-bot@kernel.org
Subject: Re: [PATCH RFC v2 6/8] tee: optee: execute yielding RPMI calls
Reply-To: sashiko-reviews@lists.linux.dev
To: "Amirreza Zarrabi" <amirreza.zarrabi@oss.qualcomm.com>
Cc: devicetree@vger.kernel.org, conor+dt@kernel.org, robh@kernel.org
In-Reply-To: <20261005-rpmi-tee-service-grp-dev-v2-6-72f222e23ec1@oss.qualcomm.com>
References: <20261005-rpmi-tee-service-grp-dev-v2-0-72f222e23ec1@oss.qualcomm.com>
 <20261005-rpmi-tee-service-grp-dev-v2-6-72f222e23ec1@oss.qualcomm.com>
Content-Type: text/plain; charset=utf-8
Content-Transfer-Encoding: quoted-printable
Date: Tue, 06 Oct 2026 00:55:48 +0000
Message-Id: <20261006005548.EA0BD1F000FF@smtp.kernel.org>
Precedence: bulk
X-Mailing-List: devicetree@vger.kernel.org
List-Id: <devicetree.vger.kernel.org>
List-Subscribe: <mailto:devicetree+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:devicetree+unsubscribe@vger.kernel.org>

Thank you for your contribution! Sashiko AI review found 4 potential issue(=
s) to consider:
- [High] optee: unhandled unknown RPC result causes infinite loop in yieldi=
ng call
- [High] optee: deadlock on RPMI_ERR_BUSY when no local threads are active
- [High] optee: uninitialized req.flags leaks stack memory to Secure World
- [Medium] optee: zero resume_token from suspended call causes infinite ret=
ry loop
--

commit e5243042ee3a40ae18df933976be9641326c5d08
Author: Amirreza Zarrabi <amirreza.zarrabi@oss.qualcomm.com>
Date:   Tue Oct 6 00:39:50 2026 +0000

    tee: optee: execute yielding RPMI calls
   =20
    OP-TEE commands can span multiple exchanges with normal world. A call
    may yield to request an RPC service or allow interrupt processing
    before continuing execution in secure world.
   =20
    Add the RPMI yielding-call path used by the common OP-TEE session
    operations. Submit the command and RPC argument buffers as ranges
    within a shared memory parcel.
   =20
    Handle RPC requests while the call is suspended and resume execution
    using the token returned by OP-TEE until the command completes.
   =20
    Use the common OP-TEE call queue to wait when an initial request is
    rejected with RPMI_ERR_BUSY, allowing another active call to complete
    before retrying.
   =20
    Signed-off-by: Amirreza Zarrabi <amirreza.zarrabi@oss.qualcomm.com>

> diff --git a/drivers/tee/optee/rpmi_abi.c b/drivers/tee/optee/rpmi_abi.c
> index 58d82678be98f..6e76316794c18 100644
> --- a/drivers/tee/optee/rpmi_abi.c
> +++ b/drivers/tee/optee/rpmi_abi.c

[ ... ]

> +/* Handle RPC command or interrupt returns from a yielding call. */
> +static void optee_rpmi_handle_rpc(struct tee_context *ctx, struct optee =
*optee,
> +				  u32 result, struct optee_msg_arg *arg)
> +{
> +	switch (result) {
> +	case OPTEE_RPMI_YIELDING_CALL_RETURN_RPC_CMD:
> +		optee_rpmi_handle_rpc_cmd(ctx, optee, arg);
> +		break;
> +	case OPTEE_RPMI_YIELDING_CALL_RETURN_INTERRUPT:
> +		break;
> +	default:
> +		pr_warn("Unknown RPC func 0x%x\n", result);
> +		break;
> +	}
> +}

[Severity: High]
Does this code risk entering an infinite loop? If the result is unknown,
optee_rpmi_handle_rpc() logs a warning but doesn't return an error code to
the caller.

The loop in optee_rpmi_yielding_call() below will then blindly update the
token and continue infinitely polling the TEE.

> +
> +/**
> + * optee_rpmi_yielding_call() - submit and resume a yielding RPMI command
> + * @ctx: calling context
> + * @req: initial command request
> + * @rpc_arg: shared RPC argument buffer
> + * @system_thread: caller requests TEE system thread support
> + *
> + * Only RPMI_ERR_BUSY rejection of the initial command permits retry.
> + *
> + * Return: zero on completion, or a negative error.
> + */
> +static int optee_rpmi_yielding_call(struct tee_context *ctx,
> +				    const struct optee_rpmi_call_req *req,
> +				    struct optee_msg_arg *rpc_arg,
> +				    bool system_thread)
> +{
> +	struct optee *optee =3D tee_get_drvdata(ctx->teedev);
> +	struct optee_rpmi_resume_req resume =3D {
> +		.op =3D cpu_to_le32(OPTEE_RPMI_YIELDING_CALL_RESUME),
> +		/* resume_token is nonzero after OP-TEE suspends the call. */
> +		.resume_token =3D 0,
> +	};
> +	struct optee_rpmi_call_resp resp;
> +	struct optee_call_waiter waiter;
> +	u32 result;
> +	s32 status;
> +	int ret;
> +
> +	optee_cq_wait_init(&optee->call_queue, &waiter, system_thread);
> +	while (true) {
> +		if (resume.resume_token)
> +			ret =3D optee_rpmi_call_with_status(optee, &resume,
> +							  sizeof(resume), &resp,
> +							  sizeof(resp), &status);
> +		else
> +			ret =3D optee_rpmi_call_with_status(optee, req, sizeof(*req),
> +							  &resp, sizeof(resp),
> +							  &status);

[Severity: Medium]
Will this correctly handle a zero resume_token from a suspended call?

If the firmware suspends the call but incorrectly provides a resume_token
of 0, resume.resume_token will be 0 on the next iteration. This if
statement will evaluate to false, falling back to resending the initial
request instead of the resume command, which could cause an infinite retry
loop.

> +		if (ret)
> +			goto done;
> +
> +		switch (status) {
> +		case RPMI_SUCCESS:
> +			break;
> +		case RPMI_ERR_BUSY:
> +			if (!resume.resume_token) {
> +				optee_cq_wait_for_completion(&optee->call_queue,
> +							     &waiter);
> +				continue;
> +			}

[Severity: High]
Can this cause a deadlock if the BUSY state was triggered by an external
client?

If RPMI_ERR_BUSY is returned on the initial command, the task blocks
indefinitely in optee_cq_wait_for_completion() waiting for a local
completion. If the shared mailbox or service is busy processing requests
from another VM and the local kernel has no other active threads, no thread
will ever call optee_cq_wait_final() to wake up this task.

> +
> +			fallthrough;

[ ... ]

> +/* The caller supplies SHM with room for command and RPC args. */
> +static int optee_rpmi_do_call_with_arg(struct tee_context *ctx,
> +				       struct tee_shm *shm, u_int offs,
> +				       bool system_thread)
> +{
> +	struct optee *optee =3D tee_get_drvdata(ctx->teedev);
> +	struct optee_msg_arg *arg, *rpc_arg;
> +	struct optee_rpmi_call_req req;

[Severity: High]
Does this leak uninitialized kernel stack memory to the Secure World?

The struct optee_rpmi_call_req req is allocated on the stack here but is
not zero-initialized.

> +	size_t arg_size, rpc_size, rpc_offset;
> +	u32 parcel_id, nonce;
> +
> +	arg =3D tee_shm_get_va(shm, offs);
> +	if (IS_ERR(arg))
> +		return PTR_ERR(arg);
> +
> +	arg_size =3D OPTEE_MSG_GET_ARG_SIZE(arg->num_params);
> +	rpc_size =3D OPTEE_MSG_GET_ARG_SIZE(optee->rpc_param_count);
> +	rpc_offset =3D offs + arg_size;
> +	rpc_arg =3D tee_shm_get_va(shm, rpc_offset);
> +	if (IS_ERR(rpc_arg))
> +		return PTR_ERR(rpc_arg);
> +
> +	optee_rpmi_shm_get_identity(shm, &parcel_id, &nonce);
> +
> +	req.op =3D cpu_to_le32(OPTEE_RPMI_YIELDING_CALL_WITH_ARG);
> +	req.parcel_id =3D cpu_to_le32(parcel_id);
> +	req.nonce =3D cpu_to_le32(nonce);
> +	req.arg_offset =3D cpu_to_le64((u64)shm->offset + offs);
> +	req.rpc_offset =3D cpu_to_le64((u64)shm->offset + rpc_offset);
> +	req.arg_size =3D cpu_to_le32(arg_size);
> +	req.rpc_size =3D cpu_to_le32(rpc_size);

[Severity: High]
The code explicitly initializes most fields but misses req.flags. This
leaves req.flags containing uninitialized stack memory when req is passed
to optee_rpmi_yielding_call() and sent over the RPMI mailbox.

Could we initialize the whole struct to zero?

> +
> +	return optee_rpmi_yielding_call(ctx, &req, rpc_arg, system_thread);
> +}

--=20
Sashiko AI review =C2=B7 https://sashiko.dev/#/patchset/20261005-rpmi-tee-s=
ervice-grp-dev-v2-0-72f222e23ec1@oss.qualcomm.com?part=3D6
