Received: from smtp.kernel.org (aws-us-west-2-korg-mail-alma10-1.taild15c8.ts.net [100.103.45.18])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 9F2E11FF7C8
	for <devicetree@vger.kernel.org>; Mon,  1 Jun 2026 10:19:49 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=100.103.45.18
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1780309191; cv=none; b=AJnFCi+st/wbhc5K8xQUxfqrtEBao11wYQRnscJ6+gVcbmoUxuwcmcrkae7ZG9ps//bMkV1PnzOMuMf8flZeoULT/+m5XFLdqs4NCE53SQIb2Ahxpltxw1af5enSuchptGghZ0Zxz0cn0xa7uzagx8IOsMYmtjmPtSzpsu5m/vo=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1780309191; c=relaxed/simple;
	bh=95ukIHxfe1JBh8KTu3NiwPCr7WlbYxxGSS30GuzJrTQ=;
	h=From:Subject:To:Cc:In-Reply-To:References:Content-Type:Date:
	 Message-Id; b=alBG5bJ9ly06nfikkHO1uguthXPUp3We4V4iREb/gHBVwAHHNtheCnsQY9WeLeSBtolb6Ym9RcondHKhMWzEGPkqQpF3LRRFKiSkCuQurBlKIP5ktJjOePCEWjDF4bx6cvbjGk8hDO0sfameXw2cxeguLycDhIG3neARvYBDYvg=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=TbtgbRn8; arc=none smtp.client-ip=100.103.45.18
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="TbtgbRn8"
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 904CA1F00893;
	Mon,  1 Jun 2026 10:19:48 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kernel.org;
	s=k20260515; t=1780309188;
	bh=4BkuD3YkbfrMAt3V18V8M+IEmkW77njbAT9uXbEKhms=;
	h=From:Subject:Reply-To:To:Cc:In-Reply-To:References:Date;
	b=TbtgbRn8raittxRs4RcCxqfVDUpedlWSogDLDDlPNygglJkUvnuULStoOzBjRaQo7
	 Ma/No3QiYe3DrrNWF54gBFMOZMFc3O2EO3KdZvG346gCCqGgRO+4fREuH0fpv2PmdS
	 zMacKg6kAAfddysTjG2a7Y5sJDCgj/AZ2EggIDf1+PajvDq4V6mka0bHeO16G07hkg
	 zsx8zRu+LPdQ98ARcUdstBNfrWt6PhLfKBfms7oOMnywPBpWlqYyyH/FBDvYLzRkJk
	 YNu3hU+vKRXkIsEkXwkIYxg1PBBpF6c+e3Wqy4uQcAFQWqdDjkwKSLCx0uCWxDmeGU
	 r2MVjC+Yes0ew==
From: sashiko-bot@kernel.org
Subject: Re: [PATCH v15 07/23] arm64: kexec_file: Fix CMA page leaks during
 segment placement retry loops
Reply-To: sashiko-reviews@lists.linux.dev
To: "Jinjie Ruan" <ruanjinjie@huawei.com>
Cc: robh@kernel.org, conor+dt@kernel.org, devicetree@vger.kernel.org
In-Reply-To: <20260601094805.2928614-8-ruanjinjie@huawei.com>
References: <20260601094805.2928614-8-ruanjinjie@huawei.com>
Content-Type: text/plain; charset=utf-8
Content-Transfer-Encoding: quoted-printable
Date: Mon, 01 Jun 2026 10:19:48 +0000
Message-Id: <20260601101948.904CA1F00893@smtp.kernel.org>
Precedence: bulk
X-Mailing-List: devicetree@vger.kernel.org
List-Id: <devicetree.vger.kernel.org>
List-Subscribe: <mailto:devicetree+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:devicetree+unsubscribe@vger.kernel.org>

Thank you for your contribution! Sashiko AI review found 1 potential issue(=
s) to consider:

Pre-existing issues:
- [High] CMA page leak during kimage destruction due to kernel segment mems=
z truncation
--

commit 92b0521f40a064f818d922d92b679f992a0b9e1d
Author: Jinjie Ruan <ruanjinjie@huawei.com>

arm64: kexec_file: Fix CMA page leaks during segment placement retry loops

This commit addresses CMA memory leaks during arm64 kexec image placement
retry loops. It explicitly calls kexec_free_segment_cma() to release aborted
kernel segments before truncation. It also adds a backward iteration in the
error path of load_other_segments() to free any orphaned allocations.

> diff --git a/arch/arm64/kernel/kexec_image.c b/arch/arm64/kernel/kexec_im=
age.c
> index b70f4df15a1ae..ffcb7f9075e62 100644
> --- a/arch/arm64/kernel/kexec_image.c
> +++ b/arch/arm64/kernel/kexec_image.c
> @@ -107,6 +107,7 @@ static void *image_load(struct kimage *image,
>  		 * We couldn't find space for the other segments; erase the
>  		 * kernel segment and try the next available hole.
>  		 */
> +		kexec_free_segment_cma(image, kernel_segment_number);
>  		image->nr_segments -=3D 1;
>  		kbuf.buf_min =3D kernel_segment->mem + kernel_segment->memsz;
>  		kbuf.mem =3D KEXEC_BUF_MEM_UNKNOWN;

[Severity: High]
This is a pre-existing issue, but could modifying the segment size later in
image_load() cause a CMA leak if the image is later unloaded or if the
syscall fails?

If the segment is successfully placed, the code modifies the segment size:

arch/arm64/kernel/kexec_image.c:image_load() {
    ...
    kernel_segment =3D &image->segment[kernel_segment_number];
    kernel_segment->mem +=3D text_offset;
    kernel_segment->memsz -=3D text_offset;
    ...
}

Since kexec_free_segment_cma() computes the number of pages to release by
shifting the now-decremented memsz, will dma_release_from_contiguous()
receive a smaller page count than was originally allocated, permanently
leaking text_offset worth of CMA pages?

--=20
Sashiko AI review =C2=B7 https://sashiko.dev/#/patchset/20260601094805.2928=
614-1-ruanjinjie@huawei.com?part=3D7
