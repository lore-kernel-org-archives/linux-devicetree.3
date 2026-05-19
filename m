Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id D49523DA7E2
	for <devicetree@vger.kernel.org>; Tue, 19 May 2026 07:33:54 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=10.30.226.201
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1779176034; cv=none; b=eUgmUQ0rxhGefx491V94NW03FW8d87cJgGPGfSiEu/+3oBjLz57caTCddWlZ7iw3bk8+m6r8DPzvf8V1VOedIS+lOYELrEvaAPL8aU6C6VLYMle/QYvFktAmrl+ZI0CZIDAprAqY1TXb1HWAaxTitN7tmqKnoRa0BGv1oqCGR1U=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1779176034; c=relaxed/simple;
	bh=FPEum3P2EJBOxH1QMiPe3KjK35D7leF1vuL89AidJ9o=;
	h=From:Subject:To:Cc:In-Reply-To:References:Content-Type:Date:
	 Message-Id; b=cm1+z2sjdiSjeYiZpic88XgEXSIlKzJ3IIUIQ97KJL+rk4QyYKl0JRylEI3Owph/ksbsbylUFUBVGfCZEtzbtVjTTSpUHYPVNgpSsnopekpTaci3wwfF5AaKAHJ1yhLFXg/cYcGhNETtI+0K1Za0rqmIjfebDBvOcRV/CJxz0B0=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=eJjwMOZB; arc=none smtp.client-ip=10.30.226.201
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="eJjwMOZB"
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 03927C2BCB3;
	Tue, 19 May 2026 07:33:53 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1779176034;
	bh=FPEum3P2EJBOxH1QMiPe3KjK35D7leF1vuL89AidJ9o=;
	h=From:Subject:Reply-To:To:Cc:In-Reply-To:References:Date:From;
	b=eJjwMOZBBxyvFzLrF4YjykQ0D43AUcjuAL4zb3NQ+BvtCIlI6Lt2kr/qN0FrSKTAf
	 F23Zm7Qi1tkS57hnRX/5Kdb3+urcvQor4cckEiCNuaQV5u1b/lkqYauKKvZX/AQlk3
	 CI73+GuqPBLRF+5Hmzq2Hp3aCtOSheXp7OQ4aNvEQIrjNnssJ4VkKzEeUt7uXZ6p0v
	 hU3eXhK1EvAwd6OvqIvEEXCOwKc38yBLMyE7oZxg0Eq6L53gR0zi7CVgtVuyFESSxu
	 T9HBDOMng2RFR8M61cJne9VVf4E5isb1JHCwho9osn5Rpbf5WhrVtD6qM4ICPuKZ+n
	 eV26nCFitoZ6w==
From: sashiko-bot@kernel.org
Subject: Re: [PATCH v6 04/16] firmware: qcom: Add a PAS TEE service
Reply-To: sashiko-reviews@lists.linux.dev
To: "Sumit Garg" <sumit.garg@kernel.org>
Cc: robh@kernel.org, conor+dt@kernel.org, devicetree@vger.kernel.org
In-Reply-To: <20260518072856.22790-5-sumit.garg@kernel.org>
References: <20260518072856.22790-5-sumit.garg@kernel.org>
Content-Type: text/plain; charset=utf-8
Content-Transfer-Encoding: quoted-printable
Date: Tue, 19 May 2026 07:33:53 +0000
Message-Id: <20260519073354.03927C2BCB3@smtp.kernel.org>
Precedence: bulk
X-Mailing-List: devicetree@vger.kernel.org
List-Id: <devicetree.vger.kernel.org>
List-Subscribe: <mailto:devicetree+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:devicetree+unsubscribe@vger.kernel.org>

Thank you for your contribution! Sashiko AI review found 3 potential issue(=
s) to consider:
- [Critical] Unvalidated buffer sizes from TEE lead to heap buffer overflow=
 and out-of-bounds read.
- [High] The `shm_free` cleanup wrapper fails to handle `ERR_PTR`, causing =
a kernel crash on allocation failure.
- [High] Unconditional unregistration and global static ops structure corru=
ption in probe/remove.
--

commit 117a287c92ded04ad43f9ed963b43a8069a13f94
Author: Sumit Garg <sumit.garg@oss.qualcomm.com>

firmware: qcom: Add a PAS TEE service

Add support for Peripheral Authentication Service (PAS) driver based
on TEE bus with OP-TEE providing the backend PAS service implementation.

> diff --git a/drivers/firmware/qcom/qcom_pas_tee.c b/drivers/firmware/qcom=
/qcom_pas_tee.c
> new file mode 100644
> index 0000000000000..2067a43c44c37
> --- /dev/null
> +++ b/drivers/firmware/qcom/qcom_pas_tee.c
> @@ -0,0 +1,476 @@
[ ... ]
> +DEFINE_FREE(shm_free, struct tee_shm *, tee_shm_free(_T))

Will this crash if an allocation failure occurs? By default, DEFINE_FREE
only guards against NULL pointers. However, tee_shm_alloc_kernel_buf() can
return an ERR_PTR, which evaluates to true.

> +
> +static void *qcom_pas_tee_get_rsc_table(struct device *dev,
> +					struct qcom_pas_context *ctx,
> +					void *input_rt, size_t input_rt_size,
> +					size_t *output_rt_size)
> +{
[ ... ]
> +	if (param[1].u.memref.size) {
> +		struct tee_shm *rt_shm __free(shm_free) =3D
> +			tee_shm_alloc_kernel_buf(data->ctx,
> +						 param[1].u.memref.size);

If this allocation fails, rt_shm will be an ERR_PTR. When the function
returns early, shm_free will pass the ERR_PTR to tee_shm_free(), triggering
a kernel panic.

> +		void *rt_shm_va;
> +
> +		if (IS_ERR(rt_shm)) {
> +			dev_err(dev, "rt_shm allocation failed\n");
> +			return rt_shm;
> +		}
> +
> +		rt_shm_va =3D tee_shm_get_va(rt_shm, 0);
> +		if (IS_ERR(rt_shm_va)) {
> +			dev_err(dev, "rt_shm get VA failed\n");
> +			return ERR_CAST(rt_shm_va);
> +		}
> +		memcpy(rt_shm_va, input_rt, input_rt_size);

Can this cause a heap buffer overflow? The buffer is allocated using
param[1].u.memref.size, but the code unconditionally copies input_rt_size
bytes into it.

> +
> +		param[1].u.memref.shm =3D rt_shm;
> +		ret =3D tee_client_invoke_func(data->ctx, &inv_arg, param);
> +		if (ret < 0 || inv_arg.ret !=3D 0) {
> +			dev_err(dev, "PAS get RT failed, pas_id: %d, ret: %d, err: 0x%x\n",
> +				ctx->pas_id, ret, inv_arg.ret);
> +			return ret ? ERR_PTR(ret) : ERR_PTR(-EINVAL);
> +		}
> +
> +		if (param[1].u.memref.size) {
> +			*output_rt_size =3D param[1].u.memref.size;
> +			rt_buf =3D kmemdup(rt_shm_va, *output_rt_size, GFP_KERNEL);

Does this kmemdup() introduce an out-of-bounds read? The size returned by
the TEE in param[1].u.memref.size could potentially be larger than the
originally allocated size.

> +			if (!rt_buf)
> +				return ERR_PTR(-ENOMEM);
> +		}
> +	}
> +
> +	return rt_buf;
> +}
[ ... ]
> +static struct qcom_pas_ops qcom_pas_ops_tee =3D {
> +	.drv_name		=3D "qcom-pas-tee",
> +	.supported		=3D qcom_pas_tee_supported,
> +	.init_image		=3D qcom_pas_tee_init_image,
> +	.mem_setup		=3D qcom_pas_tee_mem_setup,
> +	.get_rsc_table		=3D qcom_pas_tee_get_rsc_table,
> +	.auth_and_reset		=3D qcom_pas_tee_auth_and_reset,
> +	.prepare_and_auth_reset	=3D qcom_pas_tee_prepare_and_auth_reset,
> +	.set_remote_state	=3D qcom_pas_tee_set_remote_state,
> +	.shutdown		=3D qcom_pas_tee_shutdown,
> +	.metadata_release	=3D qcom_pas_tee_metadata_release,
> +};
> +
> +static int optee_ctx_match(struct tee_ioctl_version_data *ver, const voi=
d *data)
> +{
> +	return ver->impl_id =3D=3D TEE_IMPL_ID_OPTEE;
> +}
> +
> +static int qcom_pas_tee_probe(struct tee_client_device *pas_dev)
> +{
> +	struct device *dev =3D &pas_dev->dev;
> +	struct qcom_pas_tee_private *data;
[ ... ]
> +	data->session_id =3D sess_arg.session;
> +	dev_set_drvdata(dev, data);
> +	qcom_pas_ops_tee.dev =3D dev;

Could concurrent probes overwrite this shared static structure? Since the o=
ps
structure is global, multiple devices probing at the same time could clobber
the dev pointer.

> +	qcom_pas_ops_register(&qcom_pas_ops_tee);

Should this check for a return value or register failure? If another backend
like SCM is already registered, this operation will fail, but the probe
routine proceeds as if it was successful.

> +
> +	return ret;
> +}
> +
> +static void qcom_pas_tee_remove(struct tee_client_device *pas_dev)
> +{
> +	struct device *dev =3D &pas_dev->dev;
> +	struct qcom_pas_tee_private *data =3D dev_get_drvdata(dev);
> +
> +	qcom_pas_ops_unregister();

If the registration failed in probe, will this unconditionally unregister t=
he
active SCM backend and break PAS functionality system-wide?

> +	tee_client_close_session(data->ctx, data->session_id);
> +	tee_client_close_context(data->ctx);
> +}

--=20
Sashiko AI review =C2=B7 https://sashiko.dev/#/patchset/20260518072856.2279=
0-1-sumit.garg@kernel.org?part=3D4
