Received: from smtp.kernel.org (aws-us-west-2-korg-mail-alma10-1.taild15c8.ts.net [100.103.45.18])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 087FE3D4123
	for <devicetree@vger.kernel.org>; Fri,  9 Oct 2026 07:33:32 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=100.103.45.18
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1791531214; cv=none; b=plxS9ChOCsC0FcNuDddSia16Nt1XUsADSRLJVHIgCM3FWFj9Ml7vIMmOIaX92acAK5kjdKao6BkfdkVcoOf+AxIcGzkgpKIyyQP5ay+IoAiYV5QlWv7GxCLDfusPnJw7Feplyx8Ley8PxLDX4oV9H6BVZ7d58p4a2IXEEj3DhRc=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1791531214; c=relaxed/simple;
	bh=wD/KeacrH+3CU87EMUoPlO07cxr7e1oHySpBrOZCxAg=;
	h=Message-ID:From:Subject:To:Cc:In-Reply-To:References:Content-Type:
	 Date; b=tZGDZIMLH3G16QAjGWbKonhg105y5Bs2l9SwJ/a2OC5q/eNz0K7k1Ip8XMFtpwgYRgz6/b1lMnDpKnGTyfcohK3mYsEOl+9VHYxeQLYJh66aLIx6VIKOgAU4WYMI9xZdMOGlCavII0tbcMtpKaNd567AKpzbj/hOb5CSo/qpiPM=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=Xvq1xcPF; arc=none smtp.client-ip=100.103.45.18
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="Xvq1xcPF"
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 5A1E91F000FF;
	Fri,  9 Oct 2026 07:33:32 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kernel.org;
	s=k20260515; t=1791531212;
	bh=ROht3u5Bofks8XMukSShKiGmfTJd8lIHv2ZWJDBHEnA=;
	h=From:Subject:Reply-To:To:Cc:In-Reply-To:References:Date;
	b=Xvq1xcPFdmET9cV7aMCenTxHoQskhq7Sg5QeAX7C/SRcJWg18l3iriqXt5gLmqsUE
	 Z27JjCCjwLjin0j9D519ZaS7jOoJ0NYJlmif9KkIBD39NeH2LcGroO3sLHLG2M/t1J
	 5YRdLijtBUArN5k9A9rpbX1yObmr+WRZSwh7W8TtjtIfmO8eQbOz8M3RKp9umN0UX6
	 Jm0kE1IwBXXW2RwzRi0r15iC3BGEi6KXNi8wtRPlCM3Z066ulP86lonlK7D/0VP8Bt
	 3PLzK0AhJJ/wAi9gj/kBsxvWocjKbwvlYXc2bZ4csB3q6cynRs5PODmd7zi3wxMM9n
	 2gybqsG46ykHw==
Message-ID: <sashiko-outbox-165007@kernel.org>
From: sashiko-bot@kernel.org
Subject: Re: [PATCH 4/4] remoteproc: qcom: pas: Add Glymur OOBMSS coredump
 support
Reply-To: sashiko-reviews@lists.linux.dev
To: "Anvesh Jain P" <anvesh.p@oss.qualcomm.com>
Cc: robh@kernel.org, devicetree@vger.kernel.org, conor+dt@kernel.org
In-Reply-To: <20261009-oob-support-glymur-v1-4-96cc8ffcced3@oss.qualcomm.com>
References: <20261009-oob-support-glymur-v1-0-96cc8ffcced3@oss.qualcomm.com>
 <20261009-oob-support-glymur-v1-4-96cc8ffcced3@oss.qualcomm.com>
Content-Type: text/plain; charset=utf-8
Content-Transfer-Encoding: quoted-printable
Date: Fri, 09 Oct 2026 07:33:31 +0000
Precedence: bulk
X-Mailing-List: devicetree@vger.kernel.org
List-Id: <devicetree.vger.kernel.org>
List-Subscribe: <mailto:devicetree+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:devicetree+unsubscribe@vger.kernel.org>

Thank you for your contribution! Sashiko AI review found 3 potential issue(=
s) to consider:
- [High] remoteproc: qcom_pas: Use-After-Unmap race in qcom_pas_da_to_va du=
ring concurrent coredump
- [Medium] remoteproc: qcom: coredump failure for relocatable firmware
- [Medium] mm: memory leak of rproc_dump_segment objects on module unload
--

commit 7e66e9e1579da74dff881b896ffcf919220e337d
Author: Anvesh Jain P <anvesh.p@oss.qualcomm.com>

remoteproc: qcom: pas: Add Glymur OOBMSS coredump support

Add coredump support for the secure and non-secure OOBMSS carveouts.
Register fixed dump segments at probe time for attached-state recovery.

> diff --git a/drivers/remoteproc/qcom_q6v5_pas.c b/drivers/remoteproc/qcom=
_q6v5_pas.c
> index 31fdde351beda..0dc9985f01f94 100644
> --- a/drivers/remoteproc/qcom_q6v5_pas.c
> +++ b/drivers/remoteproc/qcom_q6v5_pas.c

[ ... ]

> @@ -162,6 +163,28 @@ static void qcom_pas_segment_dump(struct rproc *rpro=
c,
>  	memcpy_fromio(dest, pas->mem_region + total_offset, size);
>  }
> =20
> +static bool qcom_pas_has_secondary(const struct qcom_pas *pas)
> +{
> +	return pas->secondary_pas_id && pas->secondary_dtb_pas_id;
> +}
> +
> +static int qcom_pas_register_dump_segments(struct rproc *rproc,
> +					   struct qcom_pas *pas)
> +{
> +	int ret;
> +
> +	ret =3D rproc_coredump_add_segment(rproc, pas->mem_phys, pas->mem_size);

[Severity: Medium]
Will this regression cause a coredump failure for relocatable firmware?

The segments are registered with the device address (da) set to the absolute
physical address (pas->mem_phys and pas->secondary_mem_phys). However, for
relocatable firmware, pas->mem_reloc is updated to a low virtual device
address (e.g., 0) during firmware loading.

This causes the bounds check in qcom_pas_da_to_va() to fail because the
calculation da - pas->mem_reloc will overflow the carveout's size, preventi=
ng
the coredump from being generated.

> +	if (ret)
> +		return ret;

[ ... ]

> @@ -572,16 +595,29 @@ static int qcom_pas_stop(struct rproc *rproc)
>  static void *qcom_pas_da_to_va(struct rproc *rproc, u64 da, size_t len, =
bool *is_iomem)
>  {
>  	struct qcom_pas *pas =3D rproc->priv;
> -	int offset;
> +	phys_addr_t base;
> +	void __iomem *region;
> +
> +	if (da >=3D pas->mem_reloc && len <=3D pas->mem_size &&
> +	    da - pas->mem_reloc <=3D pas->mem_size - len) {
> +		base =3D pas->mem_reloc;
> +		region =3D pas->mem_region;
> +	} else if (da >=3D pas->secondary_mem_reloc &&
> +		   len <=3D pas->secondary_mem_size &&
> +		   da - pas->secondary_mem_reloc <=3D pas->secondary_mem_size - len) {
> +		base =3D pas->secondary_mem_reloc;
> +		region =3D pas->secondary_mem_region;
> +	} else {
> +		return NULL;
> +	}
> =20
> -	offset =3D da - pas->mem_reloc;
> -	if (offset < 0 || offset + len > pas->mem_size)
> +	if (!region)
>  		return NULL;
> =20
>  	if (is_iomem)
>  		*is_iomem =3D true;
> =20
> -	return (__force void *)pas->mem_region + offset;
> +	return (__force void *)region + (da - base);
>  }

[Severity: High]
Does returning a direct pointer to transiently mapped I/O memory introduce a
use-after-unmap regression during a concurrent coredump?

When a coredump is active, region (pas->mem_region or
pas->secondary_mem_region) is transiently mapped. The debugfs trace reader
rproc_trace_read() calls qcom_pas_da_to_va() and accesses the returned
pointer locklessly via strnlen().

If the concurrent coredump finishes and executes iounmap() in
qcom_pas_coredump() while the trace reader is still accessing the string,
it will cause a system crash when userspace dereferences the unmapped I/O
memory.

[ ... ]

> @@ -1130,6 +1192,12 @@ static int qcom_pas_probe(struct platform_device *=
pdev)
>  	if (desc->early_boot)
>  		pas->rproc->state =3D RPROC_DETACHED;
> =20
> +	if (qcom_pas_has_secondary(pas)) {
> +		ret =3D qcom_pas_register_dump_segments(rproc, pas);
> +		if (ret)
> +			goto remove_ssr_sysmon;
> +	}
> +

[Severity: Medium]
Does proactively allocating the dump segments during probe cause a memory l=
eak
regression on module unload if the remoteproc is never started?

If the rproc remains in the RPROC_DETACHED or RPROC_OFFLINE state, module
unload calls rproc_del() -> __rproc_shutdown(). However, __rproc_shutdown()
bails out early for these states and skips the rproc_resource_cleanup() call
that would free the dump segments, causing the kzalloc() allocations to leak
permanently.

>  	ret =3D rproc_add(rproc);
>  	if (ret)
>  		goto remove_ssr_sysmon;

--=20
Sashiko AI review =C2=B7 https://sashiko.dev/#/patchset/20261009-oob-suppor=
t-glymur-v1-0-96cc8ffcced3@oss.qualcomm.com?part=3D4
