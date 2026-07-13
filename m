Received: from smtp.kernel.org (aws-us-west-2-korg-mail-alma10-1.taild15c8.ts.net [100.103.45.18])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 8581163B9
	for <devicetree@vger.kernel.org>; Mon, 13 Jul 2026 06:51:37 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=100.103.45.18
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1783925498; cv=none; b=LF1QnDfkBefndrmvOx1enWX+K8PMDIsyA7S6GIf6FlTm4ib1a9aG2hNUyL6oaTY7XjRxGUAdbVtDU6mnOWvr+I+qm9H/6W+Em86E7nhIAALoONNDowPFOCNj+miWtcUspT9ilFB2KG0LqvkbildwwET3dRSIL7sZpWhPLbPqGsY=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1783925498; c=relaxed/simple;
	bh=zhHNYW/b7dArHNqF6jiNuj1ekglhhGCG57262MVSg1g=;
	h=From:Subject:To:Cc:In-Reply-To:References:Content-Type:Date:
	 Message-Id; b=mLX0YFS893owljffiGgvMsiQKXEjo4hhaWXsIJfydqXf+/Jz5wX4MQrVNjxWsaVHDvpmzXlHQW5WqKcVuKgoTmsX+nwcmIhLjAWMJMjX1EMxoh6iWCDth51SDQnuuzthuXzDMcjTKo7K/V2YgdZ5dzAd14aFusjzQd05WbJDgrE=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=fMXjXXAR; arc=none smtp.client-ip=100.103.45.18
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="fMXjXXAR"
Received: by smtp.kernel.org (Postfix) with ESMTPSA id DC33A1F000E9;
	Mon, 13 Jul 2026 06:51:36 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kernel.org;
	s=k20260515; t=1783925497;
	bh=CtVS6SOIKqRmgJym02WHReamyTRbyXw+QbDB2sH1Z0U=;
	h=From:Subject:Reply-To:To:Cc:In-Reply-To:References:Date;
	b=fMXjXXAR3GJyLDkdHbt348y9EesJknO66eRpC4lsY6Ytbxd0hY7ziCNc7haZxybTB
	 ci2rgDiooIkGMro+Syf/sLh/tzXy8QgYMtHlovPgSrNRd7peiwokadQQ5Y3WOzFzd7
	 Z2alcFONBOteNkr/5ULPHLoSHsngh9gJZPTp6Gf7ZWfY8Gkeyb0bwH0B0RmvapfPSv
	 pCd347sbEveRrRZ6iSn7GouH7DwJBNLVOdX01OUY5Lrx9+s7bPiE/Iez/IeRriWQQ4
	 9IFrjXoLhjSqXlVGQU8Pq2YOZvHxVb0n/xmKVkqrbhM6u29UHJDMX2eUhaAiQbTsjy
	 lq0Zmi6ohL7Ew==
From: sashiko-bot@kernel.org
Subject: Re: [PATCH v13 3/6] remoteproc: qcom: add hexagon based WCSS secure
 PIL driver
Reply-To: sashiko-reviews@lists.linux.dev
To: "Varadarajan Narayanan" <varadarajan.narayanan@oss.qualcomm.com>
Cc: conor+dt@kernel.org, robh@kernel.org, devicetree@vger.kernel.org
In-Reply-To: <20260713-rproc-v13-3-41011cbcda3e@oss.qualcomm.com>
References: <20260713-rproc-v13-0-41011cbcda3e@oss.qualcomm.com>
 <20260713-rproc-v13-3-41011cbcda3e@oss.qualcomm.com>
Content-Type: text/plain; charset=utf-8
Content-Transfer-Encoding: quoted-printable
Date: Mon, 13 Jul 2026 06:51:36 +0000
Message-Id: <20260713065136.DC33A1F000E9@smtp.kernel.org>
Precedence: bulk
X-Mailing-List: devicetree@vger.kernel.org
List-Id: <devicetree.vger.kernel.org>
List-Subscribe: <mailto:devicetree+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:devicetree+unsubscribe@vger.kernel.org>

Thank you for your contribution! Sashiko AI review found 7 potential issue(=
s) to consider:
- [High] The coredump segment copy logic unmaps the I/O region without copy=
ing the final chunk of data, and leaks the mapping on partial reads.
- [High] Incorrect teardown sequence using `devm_rproc_add()` causes Use-Af=
ter-Free and missed subdevice cleanup during removal.
- [High] Incorrect error checking for `devm_ioremap_resource_wc()` leads to=
 unhandled error pointers and kernel panic.
- [High] `wcss_sec_start()` unconditionally falls through to the error clea=
nup path on success, unpreparing the successfully started processor.
- [Medium] Missing `qcom_q6v5_deinit()` call in the probe error path leaks =
the QMP device handle.
- [Medium] Failure to set `is_iomem` flag in `wcss_sec_da_to_va` implementa=
tion causes improper I/O access.
- [Low] Integer truncation in `wcss_sec_da_to_va()` allows bounds check byp=
ass for out-of-bounds device addresses.
--

--- Patch [3]: [PATCH v13 3/6] remoteproc: qcom: add hexagon based WCSS sec=
ure PIL driver ---
commit bd0a3df0198fbc98aeb1c2a316d62a018ed12f78
Author: Vignesh Viswanathan <vignesh.viswanathan@oss.qualcomm.com>
Subject: remoteproc: qcom: add hexagon based WCSS secure PIL driver

Add support to bring up hexagon based WCSS using secure PIL. All IPQxxxx
SoCs support secure Peripheral Image Loading (PIL).

[ ... ]

> diff --git a/drivers/remoteproc/qcom_q6v5_wcss_sec.c b/drivers/remoteproc=
/qcom_q6v5_wcss_sec.c
> new file mode 100644
> index 0000000000000..10a69fcd20f04
> --- /dev/null
> +++ b/drivers/remoteproc/qcom_q6v5_wcss_sec.c
> @@ -0,0 +1,325 @@

[ ... ]

> +static int wcss_sec_start(struct rproc *rproc)
> +{
> +	struct wcss_sec *wcss =3D rproc->priv;
> +	struct device *dev =3D wcss->dev;
> +	int ret;
> +
> +	ret =3D qcom_q6v5_prepare(&wcss->q6);
> +	if (ret)
> +		return ret;
> +
> +	ret =3D qcom_scm_pas_auth_and_reset(wcss->desc->pasid);
> +	if (ret) {
> +		dev_err(dev, "wcss_reset failed\n");
> +		goto unprepare;
> +	}
> +
> +	ret =3D qcom_q6v5_wait_for_start(&wcss->q6, Q6_WAIT_TIMEOUT);
> +	if (ret =3D=3D -ETIMEDOUT)
> +		dev_err(dev, "start timed out\n");
> +
> +unprepare:
> +	qcom_q6v5_unprepare(&wcss->q6);
> +
> +	return ret;
> +}

[Severity: High]
Does wcss_sec_start() unintentionally disable the processor on success?

If qcom_q6v5_wait_for_start() succeeds and returns 0, the execution falls
through directly to the unprepare label, which drops the interconnect
bandwidth vote and load state.

Also, if wait_for_start() times out, the code falls through without
calling qcom_scm_pas_shutdown(), leaving TrustZone's peripheral
authentication system in an inconsistent state. Should there be a return
before the unprepare label and a pas shutdown on timeout?

[ ... ]

> +static void *wcss_sec_da_to_va(struct rproc *rproc, u64 da, size_t len,
> +			       bool *is_iomem)
> +{

[Severity: Medium]
Should this function set *is_iomem to true?

Since wcss->mem_region is mapped using devm_ioremap_resource_wc(),
the returned address is I/O memory. If *is_iomem is not set, the
remoteproc core might use standard memory accessors instead of I/O
specific accessors, which could lead to unaligned access faults on some
architectures.

> +	struct wcss_sec *wcss =3D rproc->priv;
> +	int offset;
> +
> +	offset =3D da - wcss->mem_reloc;

[Severity: Low]
Can this integer truncation bypass the subsequent bounds check?

The variable offset is declared as a 32-bit signed int, but da is a
64-bit u64 and mem_reloc is phys_addr_t. If an out-of-bounds device
address is evaluated, the large 64-bit difference could be truncated
into a small positive 32-bit integer, bypassing the offset + len >
wcss->mem_size check later in the function.

> +	if (offset < 0 || offset + len > wcss->mem_size)
> +		return NULL;
> +
> +	return wcss->mem_region + offset;
> +}

[ ... ]

> +static void wcss_sec_copy_segment(struct rproc *rproc,
> +				  struct rproc_dump_segment *segment,
> +				  void *dest, size_t offset, size_t size)
> +{
> +	struct wcss_sec *wcss =3D rproc->priv;
> +	struct device *dev =3D wcss->dev;
> +
> +	if (!segment->io_ptr)
> +		segment->io_ptr =3D ioremap_wc(segment->da, segment->size);
> +
> +	if (!segment->io_ptr) {
> +		dev_err(dev, "Failed to ioremap segment %pad size 0x%zx\n",
> +			&segment->da, segment->size);
> +		return;
> +	}
> +
> +	if (offset + size < segment->size) {
> +		memcpy(dest, segment->io_ptr + offset, size);
> +	} else {
> +		iounmap(segment->io_ptr);
> +		segment->io_ptr =3D NULL;
> +	}
> +}

[Severity: High]
Does this else block skip copying the final chunk of data?

When reading the final chunk of a segment where offset + size >=3D
segment->size, the code falls into the else block and unmaps the I/O
memory but completely misses the memcpy() call. This leaves the last
chunk of the coredump uninitialized in the destination buffer.

Additionally, if userspace performs a partial read or aborts the dump,
the else block is never executed. Since rproc_coredump_cleanup() does
not unmap private pointers like io_ptr, does this permanently leak the
I/O mapping?

[ ... ]

> +static int wcss_sec_alloc_memory_region(struct wcss_sec *wcss)
> +{
> +	struct device *dev =3D wcss->dev;
> +	struct resource res;
> +	int ret;
> +
> +	ret =3D of_reserved_mem_region_to_resource(dev->of_node, 0, &res);
> +	if (ret) {
> +		dev_err(dev, "unable to acquire memory-region resource\n");
> +		return ret;
> +	}
> +
> +	wcss->mem_phys =3D res.start;
> +	wcss->mem_reloc =3D res.start;
> +	wcss->mem_size =3D resource_size(&res);
> +	wcss->mem_region =3D devm_ioremap_resource_wc(dev, &res);
> +	if (!wcss->mem_region) {

[Severity: High]
Is this error check sufficient for devm_ioremap_resource_wc()?

The function devm_ioremap_resource_wc() returns an ERR_PTR on failure,
not NULL. Evaluating !wcss->mem_region will pass if an error pointer
is returned, which could later lead to a kernel panic when
wcss->mem_region is dereferenced in wcss_sec_load().

> +		dev_err(dev, "unable to map memory region: %pR\n", &res);
> +		return -ENOMEM;
> +	}
> +
> +	return 0;
> +}

[ ... ]

> +static int wcss_sec_probe(struct platform_device *pdev)
> +{

[ ... ]

> +	rproc->auto_boot =3D false;
> +	rproc->dump_conf =3D RPROC_COREDUMP_INLINE;
> +	rproc_coredump_set_elf_info(rproc, ELFCLASS32, EM_NONE);
> +
> +	ret =3D devm_rproc_add(&pdev->dev, rproc);
> +	if (ret) {
> +		qcom_remove_glink_subdev(rproc, &wcss->glink_subdev);
> +		qcom_remove_ssr_subdev(rproc, &wcss->ssr_subdev);
> +		return ret;
> +	}

[Severity: Medium]
Is a call to qcom_q6v5_deinit() missing in this error path?

Earlier in probe, qcom_q6v5_init() acquires a reference to the QMP
device handle via qmp_get(). If devm_rproc_add() fails, returning
here without calling qcom_q6v5_deinit() will permanently leak the
QMP device handle.

> +
> +	platform_set_drvdata(pdev, rproc);
> +
> +	return 0;
> +}
> +
> +static void wcss_sec_remove(struct platform_device *pdev)
> +{
> +	struct rproc *rproc =3D platform_get_drvdata(pdev);
> +	struct wcss_sec *wcss =3D rproc->priv;
> +
> +	qcom_remove_glink_subdev(rproc, &wcss->glink_subdev);
> +	qcom_remove_ssr_subdev(rproc, &wcss->ssr_subdev);
> +	qcom_q6v5_deinit(&wcss->q6);
> +}

[Severity: High]
Does this sequence create a Use-After-Free during device teardown?

Because the remoteproc was registered using devm_rproc_add() in probe,
the rproc_del() function is scheduled to execute automatically during
the devres teardown phase, which runs after wcss_sec_remove() returns.

If qcom_q6v5_deinit() drops the q6v5->qmp handle via qmp_put() here,
when rproc_del() later tries to stop the running remoteproc, it will
call wcss_sec_stop() -> qcom_q6v5_unprepare(). This will attempt to
toggle the load state using the already-freed q6v5->qmp pointer,
causing a kernel panic.

--=20
Sashiko AI review =C2=B7 https://sashiko.dev/#/patchset/20260713-rproc-v13-=
0-41011cbcda3e@oss.qualcomm.com?part=3D3
