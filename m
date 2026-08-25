Received: from smtp.kernel.org (aws-us-west-2-korg-mail-alma10-1.taild15c8.ts.net [100.103.45.18])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id E47F93CAE99
	for <devicetree@vger.kernel.org>; Tue, 25 Aug 2026 22:41:29 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=100.103.45.18
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1787697691; cv=none; b=M742DgcwG6OJRz6eAE6CdqdJG0U2lq/GSG+T5UBdBCRCX5azUtNY4V/HjJ1biG14BHK02669aLmNr51QfjoVU7bEvujppd7n9x8izpxs6f1ZE/YUPV/ifif9yHi08/SSqedXJ9UQhRYL3qRlM2HdEj2BTXKdmkUoA95586PLfh4=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1787697691; c=relaxed/simple;
	bh=YiDNu7sAbrJKRsw3hw8eS6BIj2o1Qmqe2ZDt4sHCVEo=;
	h=From:Subject:To:Cc:In-Reply-To:References:Content-Type:Date:
	 Message-Id; b=ix7qgoNtIz8R7w/b6dOTW6juty5q0ePC7GIU98pJOClswVOUQNpbYV8t2bq6Y8SVkqoJAvg3hwOL7ZJps52crPoUhMustDB3LScZUd/cHDRaMuWg11xF8fx9YuMFdomvolFVTu8aR3XbI6xnhBwKQXdCwuRzTBuyRun/lfQbmsA=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=R8q1gtos; arc=none smtp.client-ip=100.103.45.18
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="R8q1gtos"
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 3AC111F000E9;
	Tue, 25 Aug 2026 22:41:29 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kernel.org;
	s=k20260515; t=1787697689;
	bh=pYv8drhWeK6ipGbTWdD+4ILApGlxVnnpY3LuOSDaGyI=;
	h=From:Subject:Reply-To:To:Cc:In-Reply-To:References:Date;
	b=R8q1gtosQuE/mzz1eeFFHA0VovuWvxz1xqsgr8Ezcr1AjPTyFfuUWpaxu8x++M9Y/
	 BKPfclj6Hu1XBGbTdq3dsJyZyHvMs1/ajVa+u1+yHYW/tf27qjJpR3iFli+wlsk8bl
	 v1XJYv/xbRIPjqioyue+14H2ijmDqthkB8aQ65OxVWCpoi6TdR8O4QsrPvEmcrJ8Al
	 /Pfd9Eqzh/KzwOG62ej5Yvxq/1jWSxzjfiYGLu2COlFoio8YD2GvjzcawXAo88XY2I
	 hufMSNIVM1v5j6IRQAi42FYdUGhLq3l5+MfyHdEuhFKx8IWFqPXWyhth7TEVVK5Jh6
	 4TnaATu53/OFw==
From: sashiko-bot@kernel.org
Subject: Re: [PATCH v4 14/19] crypto: cmh - add ECDH/X25519 kpp
Reply-To: sashiko-reviews@lists.linux.dev
To: "Alex Ousherovitch" <aousherovitch@rambus.com>
Cc: robh@kernel.org, conor+dt@kernel.org, devicetree@vger.kernel.org
In-Reply-To: <20260825221539.255951-15-aousherovitch@rambus.com>
References: <20260825221539.255951-1-aousherovitch@rambus.com>
 <20260825221539.255951-15-aousherovitch@rambus.com>
Content-Type: text/plain; charset=utf-8
Content-Transfer-Encoding: quoted-printable
Date: Tue, 25 Aug 2026 22:41:28 +0000
Message-Id: <20260825224129.3AC111F000E9@smtp.kernel.org>
Precedence: bulk
X-Mailing-List: devicetree@vger.kernel.org
List-Id: <devicetree.vger.kernel.org>
List-Subscribe: <mailto:devicetree+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:devicetree+unsubscribe@vger.kernel.org>

Thank you for your contribution! Sashiko AI review found 2 potential issue(=
s) to consider:
- [High] Lack of synchronization in `cmh_ecdh_scratch_free` causes a data r=
ace and Use-After-Free/NULL-dereference with active TFMs.
- [High] Async PKE operations directly reference `ctx->key.raw.dma` without=
 taking a reference, leading to a DMA Use-After-Free if `set_secret` is cal=
led concurrently.
--

commit 9c7dc04a32751847394f5938e43b1f3fa2bfd7c8
Author: Alex Ousherovitch <aousherovitch@rambus.com>

crypto: cmh - add ECDH/X25519 kpp

Register ECDH and X25519 kpp algorithms using the CMH PKE core.
Supports P-256, P-384, and Curve25519 for key agreement.

> diff --git a/drivers/crypto/cmh/cmh_pke_ecdh.c b/drivers/crypto/cmh/cmh_p=
ke_ecdh.c
> new file mode 100644
> index 0000000000000..2264fea1facbb
> --- /dev/null
> +++ b/drivers/crypto/cmh/cmh_pke_ecdh.c
[ ... ]
> +static int cmh_ecdh_generate_public_key(struct kpp_request *req)
> +{
[ ... ]
> +	vcq_add_sys_write(&vcq[idx], SYS_REF_TEMP, ctx->key.raw.dma,
> +			  SYS_REF_NONE, ctx->key.raw.len,
> +			  ctx->key.raw.sys_type);

[Severity: High]
Does this code risk a DMA use-after-free if the key is updated concurrently?

This queues an asynchronous hardware command using the transform's key DMA
address (ctx->key.raw.dma) as the data source, and then returns -EINPROGRES=
S.
However, the kernel crypto API does not serialize set_secret against in-fli=
ght
asynchronous operations.

If set_secret is called concurrently, cmh_ecdh_commit_key() delegates to
cmh_key_setkey_raw(), which destroys the key:

drivers/crypto/cmh/cmh_key.c:cmh_key_destroy() {
	if (ctx->mode =3D=3D CMH_KEY_RAW && ctx->raw.data) {
		cmh_dma_unmap_single(ctx->raw.dma, ctx->raw.len,
				     DMA_TO_DEVICE);
		kfree_sensitive(ctx->raw.data);
	...
}

This immediately executes cmh_dma_unmap_single() and kfree_sensitive() on t=
he
key material without waiting for pending operations to complete. Could this
allow the hardware to read from unmapped or freed memory?

[ ... ]
> +static void cmh_ecdh_scratch_free(void)
> +{
> +	u32 i;
> +
> +	if (!cmh_ecdh_key_scratch)
> +		return;
> +
> +	for (i =3D 0; i < cmh_ecdh_scratch_count; i++) {
> +		struct vcq_cmd vcq[3];
> +
> +		if (!cmh_ecdh_key_scratch[i])
> +			continue;
> +
> +		vcq_set_header(&vcq[0], 3);
> +		vcq_add_sys_grant(&vcq[1], cmh_ecdh_key_scratch[i], 0, 0, 0);
> +		vcq_add_sys_flush(&vcq[2]);
> +		cmh_tm_submit_sync_mbx(vcq, 3, 1, (s32)i);
> +		cmh_ecdh_key_scratch[i] =3D 0;
> +	}
> +
> +	kfree(cmh_ecdh_key_scratch);
> +	cmh_ecdh_key_scratch =3D NULL;
> +	cmh_ecdh_scratch_count =3D 0;
> +	cmh_ecdh_scratch_ready =3D false;
> +}

[Severity: High]
Does this cleanup path safely handle active TFMs?

This function frees the cmh_ecdh_key_scratch array without holding the
cmh_ecdh_scratch_lock mutex and without waiting for active TFMs to be
destroyed.

If the device is unbound (e.g., via sysfs unbind) while a user holds an
active AF_ALG socket, the remove path calls cmh_remove() ->
cmh_pke_ecdh_unregister() -> cmh_ecdh_scratch_free().

If the user submits a request via the active socket concurrently:

drivers/crypto/cmh/cmh_pke_ecdh.c:cmh_ecdh_compute_shared_secret() {
	...
	if (dd.mbx_idx < 0 || (u32)dd.mbx_idx >=3D cmh_ecdh_scratch_count ||
	    !cmh_ecdh_key_scratch[dd.mbx_idx]) {
		ret =3D -EIO;
		goto out_unmap;
	}
	...
}

This locklessly accesses cmh_ecdh_key_scratch, leading to a NULL pointer
dereference or reading unmapped memory.

--=20
Sashiko AI review =C2=B7 https://sashiko.dev/#/patchset/20260825221539.2559=
51-1-aousherovitch@rambus.com?part=3D14
