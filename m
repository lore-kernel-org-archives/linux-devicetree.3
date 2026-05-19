Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 441C23DA5A2
	for <devicetree@vger.kernel.org>; Tue, 19 May 2026 07:33:52 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=10.30.226.201
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1779176033; cv=none; b=VliJGY05/2Do13gyH45OK8mRgn44/r6bwwttsz53Wo3HkPtBfr51Dyr2cl78K76HZltTdnsd+/APE4ve1ijI+04dLvl9UpvB48/Hh/JFLaC28Uhg+VmdDttlzVh9GlULSWOKQHPc432BNnrRAFeFauDgDVGLRfJS0IsW3v2Vfrg=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1779176033; c=relaxed/simple;
	bh=4vn61TyH5zJZ516Br9u8qB5MLUXBvXGd+Vn5WoYFM+I=;
	h=From:Subject:To:Cc:In-Reply-To:References:Content-Type:Date:
	 Message-Id; b=P623BTWoHqHr1cNswU8uS6i2K/ARZ6vvT11TK+loBNlLIc/ZUOVJkTtaOZRF/xxdVIuKx1wdg4ISUTGT9+eGm+kOusGBnCr708TUiGzih2zEFkOaPLymqmnuMIBbH72V38egIDMPIsR4fngKDIL4RkB2xsKjDdnskvAldHT0ZTM=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=mWjfZOoi; arc=none smtp.client-ip=10.30.226.201
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="mWjfZOoi"
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 97144C2BCB3;
	Tue, 19 May 2026 07:33:52 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1779176032;
	bh=4vn61TyH5zJZ516Br9u8qB5MLUXBvXGd+Vn5WoYFM+I=;
	h=From:Subject:Reply-To:To:Cc:In-Reply-To:References:Date:From;
	b=mWjfZOoiG1y3UdllOfrGpwWhBocFhLNFSS9GdZqRs7M+tOKv9lL1dIiQOlLKS2czP
	 bPacNOR6ehmFt+U6OKVlNe2gF7/a5+LDir8Yu0zwqv6GvSCTEb130Tig/N+a/+KYzF
	 QhpUxxhsWvW32kV99cua6lY/J+MLVbzRON1nkQQ+byLZz/2yWDeaORRg7f0kQn9XwG
	 dXvyRff+5eUoXZjMJnDb0Ia4xlafUMhAvNTBLzW7hb7enQGagH08S8z1r+NZ61U7cv
	 Dl0DOKqpKpHlrxnjpXK3m2pEqs/JCm3jX+qpF/+c0PH5effUzQ3QPSoLT854n/ZhyX
	 DsZrMAJto3g6g==
From: sashiko-bot@kernel.org
Subject: Re: [PATCH v6 07/16] soc: qcom: mdtloader: Switch to generic PAS TZ
 APIs
Reply-To: sashiko-reviews@lists.linux.dev
To: "Sumit Garg" <sumit.garg@kernel.org>
Cc: robh@kernel.org, conor+dt@kernel.org, devicetree@vger.kernel.org
In-Reply-To: <20260518072856.22790-8-sumit.garg@kernel.org>
References: <20260518072856.22790-8-sumit.garg@kernel.org>
Content-Type: text/plain; charset=utf-8
Content-Transfer-Encoding: quoted-printable
Date: Tue, 19 May 2026 07:33:52 +0000
Message-Id: <20260519073352.97144C2BCB3@smtp.kernel.org>
Precedence: bulk
X-Mailing-List: devicetree@vger.kernel.org
List-Id: <devicetree.vger.kernel.org>
List-Subscribe: <mailto:devicetree+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:devicetree+unsubscribe@vger.kernel.org>

Thank you for your contribution! Sashiko AI review found 4 potential issue(=
s) to consider:
- [Critical] Heap buffer overflow and out-of-bounds read in `qcom_mdt_read_=
metadata()` due to unvalidated ELF header sizes.
- [High] TOCTOU race condition and Use-After-Free (UAF) due to lockless mod=
ule access in the generic PAS API.
- [High] Integer overflow in `__qcom_mdt_pas_init()` memory range calculati=
on allows TrustZone protection bypass.
- [Medium] The Kconfig dependency for QCOM_MDT_LOADER statically forces the=
 SCM backend to be built, defeating the architectural decoupling.
--

commit 0eade83fd1eec1ecc430d6891b709c0f53c865ba
Author: Sumit Garg <sumit.garg@oss.qualcomm.com>
Subject: soc: qcom: mdtloader: Switch to generic PAS TZ APIs

This commit switches the mdtloader client driver to use generic PAS TZ APIs,
abstracting away the specific SCM backend. This allows support for multiple
TrustZone implementations such as QTEE and OP-TEE.

> Switch mdtloader client driver over to generic PAS TZ APIs. Generic PAS
> TZ service allows to support multiple TZ implementation backends like QTEE
> based SCM PAS service, OP-TEE based PAS service and any further future TZ
> backend service.

Does the Kconfig entry for QCOM_MDT_LOADER still statically select
QCOM_SCM?

Retaining the hardcoded SCM selection might prevent compiling a kernel
configured exclusively with the OP-TEE PAS backend. Should this be updated
to select QCOM_PAS instead, to match the goal of decoupling the client
driver from the specific SCM backend?

> diff --git a/drivers/soc/qcom/mdt_loader.c b/drivers/soc/qcom/mdt_loader.c
> index c004d444d6985..137992456b712 100644
> --- a/drivers/soc/qcom/mdt_loader.c
> +++ b/drivers/soc/qcom/mdt_loader.c

[ ... ]

> @@ -271,7 +271,7 @@ static int __qcom_mdt_pas_init(struct device *dev, co=
nst struct firmware *fw,
>  		goto out;
>  	}
> =20
> -	ret =3D qcom_scm_pas_init_image(pas_id, metadata, metadata_len, ctx);
> +	ret =3D qcom_pas_init_image(pas_id, metadata, metadata_len, ctx);

Is it possible for this to trigger a Use-After-Free or NULL pointer
dereference?

Looking at qcom_pas_init_image() in drivers/firmware/qcom/qcom_pas.c, it
checks if ops_ptr is NULL and then dereferences ops_ptr->init_image():

drivers/firmware/qcom/qcom_pas.c:qcom_pas_init_image() {
        if (!ops_ptr)
                return -ENODEV;

        return ops_ptr->init_image(ops_ptr->dev, pas_id, metadata, size, ct=
x);
}

Since there appears to be no locking, RCU, or module refcounting, could the
backend module be unregistered and unloaded concurrently? This might set
ops_ptr to NULL between the check and the dereference, or unload the module
while its operations are executing.

Is there also a missing bounds check when allocating metadata in
qcom_mdt_read_metadata() before it is passed here?

If ehdr_size and hash_size are derived directly from unauthenticated 32-bit
ELF program headers (phdrs[0].p_filesz) without validating they are within
the loaded firmware file size (fw->size), an attacker could supply an
enormous p_filesz.

This might wrap around during the kmalloc calculation to allocate a tiny
heap buffer, followed by an out-of-bounds read and massive heap buffer
overflow when copying the data.

>  	kfree(metadata);
>  	if (ret) {
>  		/* Invalid firmware metadata */
> @@ -280,7 +280,7 @@ static int __qcom_mdt_pas_init(struct device *dev, co=
nst struct firmware *fw,
>  	}
> =20
>  	if (relocate) {
> -		ret =3D qcom_scm_pas_mem_setup(pas_id, mem_phys, max_addr - min_addr);
> +		ret =3D qcom_pas_mem_setup(pas_id, mem_phys, max_addr - min_addr);

Does the calculation of max_addr and min_addr used here have an integer
overflow vulnerability?

In the loop earlier in __qcom_mdt_pas_init(), phdr->p_paddr + phdr->p_memsz
evaluates using 32-bit arithmetic since both fields are read from
Elf32_Phdr. If a maliciously crafted firmware triggers a wrap-around (for
example, 0xFFFFF000 + 0x2000 =3D 0x1000), max_addr could be incorrectly
calculated as a small value while min_addr remains large.

The resulting max_addr - min_addr passed to qcom_pas_mem_setup() would then
underflow. Could this trick TrustZone into applying memory protections to
only a tiny fraction of the firmware, bypassing secure boot protections?

--=20
Sashiko AI review =C2=B7 https://sashiko.dev/#/patchset/20260518072856.2279=
0-1-sumit.garg@kernel.org?part=3D7
