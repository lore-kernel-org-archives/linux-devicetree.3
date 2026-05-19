Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 470A93DA5D6
	for <devicetree@vger.kernel.org>; Tue, 19 May 2026 07:33:49 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=10.30.226.201
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1779176029; cv=none; b=meVynjnflj7daUyAebtsWAdMOAdBKkOn/n+XjYwZLZum5ZpSN1k3VwK+jgc+P/xy5+VAXKWtVK/f/afl8gU7hgNqjzRCU4q2Y7u3xQ7NnkMjTxSNonSzdbDOqgU10Cuf1s8mBcCTJK6y/BLJmsxWhlvYnY7pvDE4yidVbHhL9/Y=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1779176029; c=relaxed/simple;
	bh=z+3Xus2gkd8zh+iqFVEJIa26an+BsOREo2hhJKPIGOs=;
	h=From:Subject:To:Cc:In-Reply-To:References:Content-Type:Date:
	 Message-Id; b=QP1779klnKquRvyreJjvHh8J7F4kOeC3bybZqZAsCyxPvlH+a+r2JZUrOIZq8V7W+ToLJmJiw0CvYZjxis3mJmfQpmd0kAwt6zTOWV0ZasIxD42Zr9IHWwxIKA8xnssQO5hGiS68+kMF4sL9NXkYuB0gvAcNgI8rYR48gXGCaEQ=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=ZV9z+bRz; arc=none smtp.client-ip=10.30.226.201
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="ZV9z+bRz"
Received: by smtp.kernel.org (Postfix) with ESMTPSA id B9F5BC2BCC6;
	Tue, 19 May 2026 07:33:48 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1779176029;
	bh=z+3Xus2gkd8zh+iqFVEJIa26an+BsOREo2hhJKPIGOs=;
	h=From:Subject:Reply-To:To:Cc:In-Reply-To:References:Date:From;
	b=ZV9z+bRza8a25EfjC5+PITSIiJ8LgE7MHewbkZUc8ZlyYnIRq3G3uKa2ed3d1y5Of
	 TLezOW99xTrVs0NCDeDGIeB16Qeacj/Kjl695f0eAU9w2tEZd7m+r1/tJ3Gom2TCPf
	 6mR6cDBvbC+5lQCPVTXPFdtCfrvLTUmNfR9VD3YcK3JGycsyfulqDfhui7NzfrF3a+
	 C4ohOO+cdyQGUqKHZ4JP7sGJti2KX3NmwwAfgASQgINfACXhF7+/o1rT52XufprzfA
	 aIXCy0QpQXPOrdvBkiWeQtimGiHcOG3CoSbwBSSRUM39J/v3I6NyG/OeJPdzzeZZZp
	 Xv8nDHYeAbKJw==
From: sashiko-bot@kernel.org
Subject: Re: [PATCH v6 02/16] firmware: qcom: Add a generic PAS service
Reply-To: sashiko-reviews@lists.linux.dev
To: "Sumit Garg" <sumit.garg@kernel.org>
Cc: conor+dt@kernel.org, robh@kernel.org, devicetree@vger.kernel.org
In-Reply-To: <20260518072856.22790-3-sumit.garg@kernel.org>
References: <20260518072856.22790-3-sumit.garg@kernel.org>
Content-Type: text/plain; charset=utf-8
Content-Transfer-Encoding: quoted-printable
Date: Tue, 19 May 2026 07:33:48 +0000
Message-Id: <20260519073348.B9F5BC2BCC6@smtp.kernel.org>
Precedence: bulk
X-Mailing-List: devicetree@vger.kernel.org
List-Id: <devicetree.vger.kernel.org>
List-Subscribe: <mailto:devicetree+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:devicetree+unsubscribe@vger.kernel.org>

Thank you for your contribution! Sashiko AI review found 3 potential issue(=
s) to consider:
- [High] TOCTOU race condition and missing memory barriers on global `ops_p=
tr` accesses
- [High] Race condition in `qcom_pas_ops_register()` allows silent overwrit=
es and NULL pointer dereference
- [High] Use-After-Free vulnerability due to missing module lifetime synchr=
onization
--

commit 2f5e5371b4bb3e1c42fab23cd3a647eabe758865
Author: Sumit Garg <sumit.garg@oss.qualcomm.com>

firmware: qcom: Add a generic PAS service

This commit introduces a generic Peripheral Authentication Service layer for
Qualcomm platforms. It acts as a common interface for different TrustZone
backends to support both SCM and TEE bus-based PAS services.

Reviewed-by: Mukesh Ojha <mukesh.ojha@oss.qualcomm.com>
Tested-by: Mukesh Ojha <mukesh.ojha@oss.qualcomm.com> # Lemans
Reviewed-by: Harshal Dev <harshal.dev@oss.qualcomm.com>
Signed-off-by: Sumit Garg <sumit.garg@oss.qualcomm.com>

> diff --git a/drivers/firmware/qcom/qcom_pas.c b/drivers/firmware/qcom/qco=
m_pas.c
> new file mode 100644
> index 0000000000000..bc6c42f2b3c61
> --- /dev/null
> +++ b/drivers/firmware/qcom/qcom_pas.c
[ ... ]
> +int qcom_pas_init_image(u32 pas_id, const void *metadata, size_t size,
> +			struct qcom_pas_context *ctx)
> +{
> +	if (!ops_ptr)
> +		return -ENODEV;
> +
> +	return ops_ptr->init_image(ops_ptr->dev, pas_id, metadata, size, ctx);
> +}

Could a race condition occur here if qcom_pas_ops_unregister() is called
concurrently? The global ops_ptr is read twice via plain C reads. If it
becomes NULL after the check, the second read might cause a NULL pointer
dereference.

Also, since there is no smp_load_acquire() or READ_ONCE() used to cache the
pointer locally, could weakly ordered architectures observe a non-NULL
ops_ptr but read uninitialized callback pointers?

[ ... ]
> +void qcom_pas_ops_register(struct qcom_pas_ops *ops)
> +{
> +	if (!qcom_pas_is_available())
> +		/* Paired with smp_load_acquire() in qcom_pas_is_available() */
> +		smp_store_release(&ops_ptr, ops);
> +	else
> +		pr_err("qcom_pas: ops already registered by %s\n",
> +		       ops_ptr->drv_name);
> +}

What happens if two backend drivers attempt to register concurrently?
The check in qcom_pas_is_available() and the subsequent store do not seem
to be protected by a lock or atomic operation, which might allow the second
driver to silently overwrite the first.

Furthermore, if the else branch executes, and a concurrent thread
unregisters the ops immediately after the check, could ops_ptr->drv_name
trigger a NULL pointer dereference?

> diff --git a/drivers/firmware/qcom/qcom_pas.h b/drivers/firmware/qcom/qco=
m_pas.h
> new file mode 100644
> index 0000000000000..8643e2760602e
> --- /dev/null
> +++ b/drivers/firmware/qcom/qcom_pas.h
[ ... ]
> +struct qcom_pas_ops {
> +	const char *drv_name;
> +	struct device *dev;
> +	bool (*supported)(struct device *dev, u32 pas_id);

Is there a risk of a use-after-free here if the backend module is unloaded
while its callbacks are actively executing?

It doesn't appear that the framework pins the backend module using an owner
field and try_module_get(), or waits for ongoing callbacks to finish before
unregistration completes.

--=20
Sashiko AI review =C2=B7 https://sashiko.dev/#/patchset/20260518072856.2279=
0-1-sumit.garg@kernel.org?part=3D2
