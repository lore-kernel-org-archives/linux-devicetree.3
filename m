Received: from smtp.kernel.org (aws-us-west-2-korg-mail-alma10-1.taild15c8.ts.net [100.103.45.18])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 94CD93A254A
	for <devicetree@vger.kernel.org>; Tue, 13 Oct 2026 05:56:03 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=100.103.45.18
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1791870964; cv=none; b=AwX2vgxUcC/RGWHXiyJkhw8IyQtX6A8FkuvFYr5qWCvko8u3jHiZtnt7TRMUJvSfKTToS7tVBwgIl8gLkB6Kxb9MkIrvbiWH/sdGI4s/InD1kf8zfbHJIQ9yNxAU3HRPfZo+Daq/XN5MvSnkV0ZN2z/4ZDctOB48KtET16urRVo=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1791870964; c=relaxed/simple;
	bh=KY81en+xk/l2Dqnf3RFlZXjfICIRHaIWHLbWuasL4Ug=;
	h=Message-ID:From:Subject:To:Cc:In-Reply-To:References:Content-Type:
	 Date; b=U1gj3hoErWpOH1EdHM8sOUAOs3kIDXxQWdHPhxltXouUi2c2Co2pWUigsiZz5DdgAejflKtv2b3Xuwfm9SIUGDooJB+fjEkWp3qr+jSJT+mXh2jI9MqBVm9clveKmmowKVxjr11p7Siepi7qlg6vUsZw2a1AFHzBr5quP/6maOk=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=B07+JAM7; arc=none smtp.client-ip=100.103.45.18
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="B07+JAM7"
Received: by smtp.kernel.org (Postfix) with ESMTPSA id C2ABE1F000FF;
	Tue, 13 Oct 2026 05:56:02 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kernel.org;
	s=k20260515; t=1791870963;
	bh=yrib37QujEvOCGx34yxgO0m0crwEwM85549Yzme8dGs=;
	h=From:Subject:Reply-To:To:Cc:In-Reply-To:References:Date;
	b=B07+JAM7sT0XdfBZl0FI53MmVhwqNCfMuYXRqHRaPnkPiRZnRxs6FNaS+5IATkEUH
	 4PmCAoHFPp9AfQL5WFgoqvr3LVDwiTv2sivt7HZB58KQj1SGbDrFlqkC0miS6rZx+a
	 BfnKgtBV4vwUqPgGK+/Fu39ImxfxMzOSZGqLZEtbpFXd147zroXMJW7vgOtIQBq76n
	 t70CKobqDkbmh7O5hjKtokMUY0rVsdVnGCxuzIszar3wlEEiSp0Se0PcpRch2tMPeE
	 3PFdnZa+4BpNqjcZBkbQDr3OpTJAsWNLKklqP9D5AW89MG4DvIUw0by03OSOdIqPt6
	 r971zdwE93cGA==
Message-ID: <sashiko-outbox-169020@kernel.org>
From: sashiko-bot@kernel.org
Subject: Re: [PATCH RFC v3 8/9] tee: optee: bind RPMI services and negotiate
 backend capabilities
Reply-To: sashiko-reviews@lists.linux.dev
To: "Amirreza Zarrabi" <amirreza.zarrabi@oss.qualcomm.com>
Cc: devicetree@vger.kernel.org, robh@kernel.org, conor+dt@kernel.org
In-Reply-To: <20261012-rpmi-tee-service-grp-dev-v3-8-975b574667e2@oss.qualcomm.com>
References: <20261012-rpmi-tee-service-grp-dev-v3-0-975b574667e2@oss.qualcomm.com>
 <20261012-rpmi-tee-service-grp-dev-v3-8-975b574667e2@oss.qualcomm.com>
Content-Type: text/plain; charset=utf-8
Content-Transfer-Encoding: quoted-printable
Date: Tue, 13 Oct 2026 05:56:02 +0000
Precedence: bulk
X-Mailing-List: devicetree@vger.kernel.org
List-Id: <devicetree.vger.kernel.org>
List-Subscribe: <mailto:devicetree+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:devicetree+unsubscribe@vger.kernel.org>

Thank you for your contribution! Sashiko AI review found 2 potential issue(=
s) to consider:
- [High] tee: optee: buffer overflow in optee_get_msg_arg() due to unbounde=
d rpc_param_count
- [Medium] optee: missing optee_shm_arg_cache_uninit() on probe error paths
--

commit 8a4dd6e2611ab6b4ab7ba8d46b447719a90842db
Author: Amirreza Zarrabi <amirreza.zarrabi@oss.qualcomm.com>

tee: optee: bind RPMI services and negotiate backend capabilities

Register an RPMI service driver matching the OP-TEE service UUID and
integrate it with OP-TEE module initialization and removal. Check the servi=
ce
API version, query the trusted OS revision, and obtain the RPC parameter and
logical notification counts.

> diff --git a/drivers/tee/optee/rpmi_abi.c b/drivers/tee/optee/rpmi_abi.c
> index 9a6439e15a33f..0ed2de96758e2 100644
> --- a/drivers/tee/optee/rpmi_abi.c
> +++ b/drivers/tee/optee/rpmi_abi.c
[ ... ]
> +static int optee_rpmi_exchange_caps(struct optee *optee, u32 *rpc_param_=
count,
> +				    u32 *max_notif_key)
> +{
[ ... ]
> +	rc =3D optee_rpmi_call(optee, &req, sizeof(req), &caps, sizeof(caps));
> +	if (rc)
> +		return rc;
> +
> +	rpc_count =3D le32_to_cpu(caps.rpc_param_count);
> +	if (!rpc_count)
> +		return -EPROTO;
> +
> +	*rpc_param_count =3D rpc_count;

[Severity: High]
Does this code overflow the shared memory buffer in optee_get_msg_arg()?

Here rpc_count is read directly from the TEE response and assigned without
any upper bounds check.

Later, in optee_get_msg_arg(), sz =3D optee_msg_arg_size(optee->rpc_param_c=
ount)
is calculated. If sz exceeds SHM_ENTRY_SIZE (which is typically 4096),
the code falls back to allocating a new shared memory buffer using
tee_shm_alloc_kernel_buf(ctx, SHM_ENTRY_SIZE), which strictly allocates 4096
bytes regardless of the calculated sz.

Finally, memset(ma, 0, sz) is called, which writes sz bytes into the newly
allocated 4096-byte buffer.

Since rpc_param_count is unbounded, a large value from a compromised or
buggy secure world could lead to an out-of-bounds write.

[ ... ]
> +static int optee_rpmi_probe(struct rpmi_tee_device *rdev)
> +{
[ ... ]
> +	optee_cq_init(&optee->call_queue, 0);
> +	optee_supp_init(&optee->supp);
> +	optee_shm_arg_cache_init(optee, OPTEE_SHM_ARG_SHARED);
> +	mutex_init(&optee->rpmb_dev_mutex);
> +	INIT_WORK(&optee->rpmb_scan_bus_work, optee_bus_scan_rpmb);
> +	optee->rpmb_intf.notifier_call =3D optee_rpmb_intf_rdev;
> +	rc =3D optee_notif_init(optee, max_notif_key);
> +	if (rc)
> +		goto err_common;
> +
> +	teedev =3D tee_device_alloc(&optee_rpmi_clnt_desc, &rdev->dev,
> +				  optee->pool, optee);
> +	if (IS_ERR(teedev)) {
> +		rc =3D PTR_ERR(teedev);
> +		goto err_notif;
> +	}
[ ... ]
> +err_devices:
> +	tee_device_unregister(optee->supp_teedev);
> +	tee_device_unregister(optee->teedev);
> +	optee_shm_arg_cache_uninit(optee);
> +err_notif:
> +	optee_notif_uninit(optee);
> +err_common:
> +	optee_supp_uninit(&optee->supp);

[Severity: Medium]
Does this error path leak the argument cache resources?

optee_shm_arg_cache_init() is called unconditionally earlier in this functi=
on,
which allocates resources and initializes a mutex (optee->shm_arg_cache.mut=
ex).

If optee_notif_init() fails, execution jumps to the err_common label. If
tee_device_alloc() fails, execution jumps to the err_notif label.

Both of these labels bypass the required cleanup call
optee_shm_arg_cache_uninit() which is located under the err_devices label
above them, leading to a leaked mutex and other argument cache resources.

> +	mutex_destroy(&optee->call_queue.mutex);
> +	rpmb_dev_put(optee->rpmb_dev);

--=20
Sashiko AI review =C2=B7 https://sashiko.dev/#/patchset/20261012-rpmi-tee-s=
ervice-grp-dev-v3-0-975b574667e2@oss.qualcomm.com?part=3D8
