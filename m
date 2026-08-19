Received: from smtp.kernel.org (aws-us-west-2-korg-mail-alma10-1.taild15c8.ts.net [100.103.45.18])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 3ACA81E492D
	for <devicetree@vger.kernel.org>; Wed, 19 Aug 2026 08:50:51 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=100.103.45.18
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1787129453; cv=none; b=VEuvtP+eESLK0CbpQKyI4bBDTClla+nL8U9yTVxGoB7v6GgFKANgdSvrJY/hlwgwPWWG1nWh7uFb8NKgOmVP/MiCKv2/Jdt8eaqIyh2Mzexgc494egrpQcRXr08EtHBuNiv3vdZ8k3DJ5rckxOE3Rqyx1N/j7gCuuFypESD6Kpo=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1787129453; c=relaxed/simple;
	bh=ByTlSulzW3opqhZ0qXE9CDBNEuYPi4XRaBunMbLgzt4=;
	h=From:Subject:To:Cc:In-Reply-To:References:Content-Type:Date:
	 Message-Id; b=h+7Uol+GM+z6uXOVR9WfQnshi2KnA8nIGyUiX76WN0N91kZoETWunPmg2LGRiSjeBhRSvfR3TLFN3eaaCHXpBu8nTMVJ6rQSGCogyK72wwftY4reM2rm98TBNRHQZcMqtIz7Pm2ogKEQJdNVQDKdfFNCBTyQ1T4Q1HjRWqSVUi8=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=Gllqzj+2; arc=none smtp.client-ip=100.103.45.18
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="Gllqzj+2"
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 906DD1F000E9;
	Wed, 19 Aug 2026 08:50:51 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kernel.org;
	s=k20260515; t=1787129451;
	bh=myuOgtTXWNqQ1G0bbDXzSN7CpbpB3HJRv1mkfnpE2Uo=;
	h=From:Subject:Reply-To:To:Cc:In-Reply-To:References:Date;
	b=Gllqzj+2iUZtC+aLAfHYZMS6FylHKmgX1gH7hmg1AczKRzRxkDyzq6JDveze/PAM+
	 UAnIcsiL7kgWzipC6KD+sZ4On/eJxGkLZ66RrkYcn8j96Sw97IM1bovpoeTGqcQZ5R
	 Cx8qKR8z5Jpo/ApQdZy51yOWTQRHNfBY3DZOGTiUw508PoR+RAd0+tysE1TxHY4yCw
	 0p7EZFWJXLzDMvGupbywfd3+IzB1Hmd9l5f3+YCDSNptxYhSJZG5Fxt7UQMUgb8rVe
	 oVASFzLUvcym5f3jOBIpasQ+xwcuwPjhVPZVtAJ7nVBGiiZdSxOFLJDad2msI7AXx4
	 AnS/qAOB9zqnQ==
From: sashiko-bot@kernel.org
Subject: Re: [PATCH v4 3/3] tee: add MbedTEE driver
Reply-To: sashiko-reviews@lists.linux.dev
To: "Xing Loong" <xing.xl.loong@gmail.com>
Cc: conor+dt@kernel.org, devicetree@vger.kernel.org, robh@kernel.org
In-Reply-To: <20260819083559.1303348-4-xing.xl.loong@gmail.com>
References: <20260819083559.1303348-1-xing.xl.loong@gmail.com>
 <20260819083559.1303348-4-xing.xl.loong@gmail.com>
Content-Type: text/plain; charset=utf-8
Content-Transfer-Encoding: quoted-printable
Date: Wed, 19 Aug 2026 08:50:51 +0000
Message-Id: <20260819085051.906DD1F000E9@smtp.kernel.org>
Precedence: bulk
X-Mailing-List: devicetree@vger.kernel.org
List-Id: <devicetree.vger.kernel.org>
List-Subscribe: <mailto:devicetree+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:devicetree+unsubscribe@vger.kernel.org>

Thank you for your contribution! Sashiko AI review found 4 potential issue(=
s) to consider:
- [High] `mbedtee_supp_recv` leaks `tee_shm` references acquired by the gen=
eric TEE core when parameter validation fails.
- [High] Skipping a partially arrived, invalid async RPC payload drops avai=
lable bytes and permanently desynchronizes the TEE-to-REE RPC ring buffer.
- [High] Unclaimed TEE supplicant requests are never aborted when the suppl=
icant process exits, causing TEE threads to hang indefinitely.
- [High] The driver calls `xa_insert_irq()` with `GFP_KERNEL`, which can sl=
eep while holding an irq-disabled spinlock, causing a BUG.
--

--- Patch [3]: [PATCH v4 3/3] tee: add MbedTEE driver ---
commit a9ea3b44496edc967794a668ad0886985a5a2659
Author: Xing Loong <xing.xl.loong@gmail.com>

tee: add MbedTEE driver

This patch adds a Linux TEE driver that communicates with MbedTEE OS via a
fixed shared-memory RPC protocol over architecture-specific transports.

> diff --git a/drivers/tee/mbedtee/rpc_callee.c b/drivers/tee/mbedtee/rpc_c=
allee.c
> new file mode 100644
> --- /dev/null
> +++ b/drivers/tee/mbedtee/rpc_callee.c
[ ... ]
> +	if (cmd.waiter_id =3D=3D 0 &&
> +	    (cmd.size > ctx->t2r_ring_sz - sizeof(cmd) ||
> +	     t2r_available_size(ctx) < sizeof(cmd) + cmd.size)) {
> +		t2r_ring_advance(ctx, t2r_available_size(ctx));
> +		return NULL;
> +	}

[Severity: High]
Does skipping a partially arrived, invalid async RPC payload like this
permanently break the ring buffer framing? By advancing only the available
bytes instead of waiting for the full payload to arrive, the rest of the
payload might be read later as a new command header.

> diff --git a/drivers/tee/mbedtee/rpc_caller.c b/drivers/tee/mbedtee/rpc_c=
aller.c
> new file mode 100644
> --- /dev/null
> +++ b/drivers/tee/mbedtee/rpc_caller.c
[ ... ]
> +int mbedtee_rpc_call_alloc(struct mbedtee_device *mbedtee,
> +			   size_t payload_size, struct mbedtee_rpc_call **call)
> +{
[ ... ]
> +	mutex_lock(&mbedtee->rpc_calls_mutex);
> +	if (mbedtee->stopping) {
> +		mutex_unlock(&mbedtee->rpc_calls_mutex);
> +		kfree(rcall);
> +		return -ESHUTDOWN;
> +	}
> +	ret =3D xa_insert_irq(&mbedtee->rpc_calls, rpc_index, rcall, GFP_KERNEL=
);

[Severity: High]
Can this trigger a sleeping in atomic context warning? xa_insert_irq()
disables interrupts internally, but GFP_KERNEL allows sleeping. Since the
xarray was initialized with XA_FLAGS_LOCK_IRQ, should this use the standard
xa_insert() instead?

> diff --git a/drivers/tee/mbedtee/supp.c b/drivers/tee/mbedtee/supp.c
> new file mode 100644
> --- /dev/null
> +++ b/drivers/tee/mbedtee/supp.c
[ ... ]
> +void mbedtee_supp_release(struct mbedtee_supp *supp, struct tee_context =
*ctx)
> +{
> +	struct mbedtee_supp_req *r, *n;
> +
> +	mutex_lock(&supp->mutex);
> +
> +	/*
> +	 * Cancel only requests owned by @ctx.  Unclaimed requests and
> +	 * requests owned by other supplicant contexts are left alone.
> +	 */
> +	list_for_each_entry_safe(r, n, &supp->reqs, node) {
> +		if (r->ctx !=3D ctx)
> +			continue;
> +		mbedtee_supp_complete_req(r);
> +	}

[Severity: High]
Are unclaimed requests ever aborted if the supplicant process exits early?
When a request is added to supp->reqs, its ctx is NULL until popped by
the supplicant. If the supplicant exits before popping, r->ctx !=3D ctx
will be true and the request is skipped, which might leave the TEE thread
blocked indefinitely.

[ ... ]
> +int mbedtee_supp_recv(struct tee_context *ctx,
> +		      u32 *func, u32 *num_params, struct tee_param *param)
> +{
> +	struct tee_device *teedev =3D ctx->teedev;
> +	struct mbedtee_device *mbedtee =3D tee_get_drvdata(teedev);
> +	struct mbedtee_supp *supp =3D &mbedtee->supp;
> +	struct mbedtee_supp_req *req;
> +	struct mbedtee_context_data *d =3D ctx->data;
> +	struct tee_shm *shm;
> +	int ret;
> +
> +	ret =3D mbedtee_supp_check_recv_params(*num_params, param);
> +	if (ret !=3D 0)
> +		return ret;

[Severity: High]
Does this code leak tee_shm references when parameter validation fails?
The generic TEE core invokes tee_shm_get_from_id() for shared memory
parameters before calling this function, expecting the driver to clean
them up on error. If untrusted userspace passes invalid parameters
along with valid shared memory references, it could intentionally trigger
this resource leak.

--=20
Sashiko AI review =C2=B7 https://sashiko.dev/#/patchset/20260819083559.1303=
348-1-xing.xl.loong@gmail.com?part=3D3
