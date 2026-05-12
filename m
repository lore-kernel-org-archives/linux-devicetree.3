Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 581B620E334
	for <devicetree@vger.kernel.org>; Tue, 12 May 2026 00:45:34 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=10.30.226.201
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1778546734; cv=none; b=AAdgm6ddDqgtzb7ofI9lKFuDWwE48XCTPCpjVmQtsUTxxY65IYTX0eIAeSE5fQQjN2aBJL7t4CdhjVaDsfFUIUCZcjqcArAEe3xD3O5wX+ZpBYFUM9J+lHdukgBxZWEq8uDccqrUeUEKVSNXevao5VttmfsZ1zs2SHLa3pW6Xmg=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1778546734; c=relaxed/simple;
	bh=Perfz6BiP5RJAzoC4JolcyvVMcgO3b+HpB/dr5aM/SU=;
	h=From:Subject:To:Cc:In-Reply-To:References:Content-Type:Date:
	 Message-Id; b=bj7Y61nKbYOcHNqBuVk2NXvw+OkJtOAXCY0WYPsPPZh+mPEOqozzXICN6AtYXYovMq43z0OLPr34Fba6denQoQMTvMEwW2DXGyY9+akXu/qxcnQxagMMTN+zC0Zks+/8OLci9fQdWlrNQkTa8K7awBb1PScWTr7TpMLX4jpEdcU=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=l90fa1rl; arc=none smtp.client-ip=10.30.226.201
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="l90fa1rl"
Received: by smtp.kernel.org (Postfix) with ESMTPSA id B4863C2BCB0;
	Tue, 12 May 2026 00:45:33 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1778546734;
	bh=Perfz6BiP5RJAzoC4JolcyvVMcgO3b+HpB/dr5aM/SU=;
	h=From:Subject:Reply-To:To:Cc:In-Reply-To:References:Date:From;
	b=l90fa1rlSAB+N82LSktN4ZoKFFeNON93KRzIQLtcXi3cs/qJ4M5Yojtlvafg/Uz7N
	 s3FZLf8/DQjyKUZz8Va6ySV7PtSTNz4sjUdcNP+vDtmkfwtQBPPpUopB0nTiFDPZyw
	 9KL4apMsPpDRF3xBmCMKiokwtPQmU3bihbHtslTlPYc/zTIGQp8Hno2tZ1xKMi+xoH
	 gfvC3i8mAejkpbP8Ox7Wu1CWsy+OFruwoZ1VXUQcc/0J9N8k9QD05+t/p+WHZbKcHS
	 A2zrdJ9m/Vi/xzTIrPO2XlfLtVcLFWbtwluuC6LnfNOglhgtNaXRXkldFq2/3oWlGF
	 Fq9d7PyYdhc3Q==
From: sashiko-bot@kernel.org
Subject: Re: [PATCH v13 04/15] arm64: kexec_file: Fix potential buffer
 overflow in prepare_elf_headers()
Reply-To: sashiko@lists.linux.dev
To: "Jinjie Ruan" <ruanjinjie@huawei.com>
Cc: devicetree@vger.kernel.org, robh@kernel.org, krzk+dt@kernel.org, conor+dt@kernel.org
In-Reply-To: <20260511030454.1730881-5-ruanjinjie@huawei.com>
References: <20260511030454.1730881-5-ruanjinjie@huawei.com>
Content-Type: text/plain; charset=utf-8
Content-Transfer-Encoding: quoted-printable
Date: Tue, 12 May 2026 00:45:33 +0000
Message-Id: <20260512004533.B4863C2BCB0@smtp.kernel.org>
Precedence: bulk
X-Mailing-List: devicetree@vger.kernel.org
List-Id: <devicetree.vger.kernel.org>
List-Subscribe: <mailto:devicetree+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:devicetree+unsubscribe@vger.kernel.org>

Thank you for your contribution! Sashiko AI review found 1 potential issue(=
s) to consider:
- [High] Memory leak of image->elf_headers on error paths in load_other_seg=
ments().
--

commit 176ac9ad5382c8a7611ce5e111bc472c392e772b
Author: Jinjie Ruan <ruanjinjie@huawei.com>

arm64: kexec_file: Fix potential buffer overflow in prepare_elf_headers()

This commit fixes a race condition between the kexec_load() system call and
memory hotplug operations that can lead to a buffer overflow. It adds an
explicit bounds check to prevent out-of-bounds access when populating
the memory ranges array.

Closes: https://sashiko.dev/#/patchset/20260323072745.2481719-1-ruanjinjie%=
40huawei.com

> diff --git a/arch/arm64/kernel/machine_kexec_file.c b/arch/arm64/kernel/m=
achine_kexec_file.c
> index fba260ad87a96..df52ac4474c96 100644
> --- a/arch/arm64/kernel/machine_kexec_file.c
> +++ b/arch/arm64/kernel/machine_kexec_file.c
> @@ -59,6 +59,11 @@ static int prepare_elf_headers(void **addr, unsigned l=
ong *sz)
>  	cmem->max_nr_ranges =3D nr_ranges;
>  	cmem->nr_ranges =3D 0;
>  	for_each_mem_range(i, &start, &end) {
> +		if (cmem->nr_ranges >=3D cmem->max_nr_ranges) {
> +			ret =3D -ENOMEM;
> +			goto out;
> +		}
> +
>  		cmem->ranges[cmem->nr_ranges].start =3D start;
>  		cmem->ranges[cmem->nr_ranges].end =3D end - 1;
>  		cmem->nr_ranges++;

While reviewing this commit, I noticed a pre-existing issue in the
surrounding code.

Could the error paths in load_other_segments() leak the memory
allocated by prepare_elf_headers()?

If a failure occurs later in load_other_segments(), for example when
adding the initrd or dtb, the function jumps to out_err:

arch/arm64/kernel/machine_kexec_file.c:load_other_segments() {
	[ ... ]
		ret =3D kexec_add_buffer(&kbuf);
		if (ret) {
			vfree(headers);
			goto out_err;
		}
		image->elf_headers =3D headers;
	[ ... ]
	if (initrd) {
	[ ... ]
		ret =3D kexec_add_buffer(&kbuf);
		if (ret)
			goto out_err;
	[ ... ]
out_err:
	image->nr_segments =3D orig_segments;
	kvfree(dtb);
	return ret;
}

The out_err path returns an error but does not free image->elf_headers.

This seems problematic because the caller in kexec_image.c
handles placement failures by erasing the segment and retrying in a loop:

arch/arm64/kernel/kexec_image.c:image_load() {
	[ ... ]
	while ((ret =3D kexec_add_buffer(&kbuf)) =3D=3D 0) {
		kernel_segment =3D &image->segment[kernel_segment_number];
		ret =3D load_other_segments(image, kernel_segment->mem, ...);
		if (!ret)
			break;
	[ ... ]
}

Does this retry loop unconditionally allocate new ELF headers on each
iteration and permanently leak the previously allocated buffers?

--=20
Sashiko AI review =C2=B7 https://sashiko.dev/#/patchset/20260511030454.1730=
881-1-ruanjinjie@huawei.com?part=3D4
