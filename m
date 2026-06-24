Received: from smtp.kernel.org (aws-us-west-2-korg-mail-alma10-1.taild15c8.ts.net [100.103.45.18])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 6045E7080D
	for <devicetree@vger.kernel.org>; Wed, 24 Jun 2026 21:39:47 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=100.103.45.18
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1782337188; cv=none; b=Wf4PX5CHrxyINIIhhKsf0acxQdqKs1UVeJZKF2KCknh8uu/pO9zw8yDESMQqJA3C9fwLYFchrs/ULCChpSZKZn/NBu3qyEpzKSaTY6FZL2UaHFDuQdC8xeQ6WFED3XsNCCTNJYjxIn6O5UEoGC9GA7cCYGa6WfYiHQz5I1k9j14=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1782337188; c=relaxed/simple;
	bh=SCuueNgSG/pXiu5sVqko8f78737iil6bCvWfHHg8JEY=;
	h=From:Subject:To:Cc:In-Reply-To:References:Content-Type:Date:
	 Message-Id; b=B/CnA5ztLwhO1G7Xk2irS96UVaWiGMVt8Dcd9UQHzfDK54dUiqMsd8dapr4dj/NKenBcAXDb3sSMo3/zBLxacsAApFdaTzFCdMpHzTxZJXTPPgvztbPub1Vqf1NloguLfgLXLoXFyq1UkaoG2TLN695In05zTTDSxW1h9wU+kzI=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=RDDefeq4; arc=none smtp.client-ip=100.103.45.18
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="RDDefeq4"
Received: by smtp.kernel.org (Postfix) with ESMTPSA id CC62A1F000E9;
	Wed, 24 Jun 2026 21:39:46 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kernel.org;
	s=k20260515; t=1782337187;
	bh=j6GK8aBiKHe0wN7c7+wRDvCLV2NRgEymNrFZohPjEOk=;
	h=From:Subject:Reply-To:To:Cc:In-Reply-To:References:Date;
	b=RDDefeq4N3Ya9XNe7hYFoynM86kkETO4fK22/mwshlk7KaLo2hZUnWSIaDStjoAHV
	 4ooNaYo4308kmHcbVLmRdyL3xQF/1Nx5da9c/b4QtbfRnVghWqGoh4y8LAh2Pd9nYd
	 o5fT8FMltR55+tjfspd0soKMWpU/jWmH4JG4o699cVROuDSjKIbKQkKB3kgn0OGO9g
	 ipgyGAkxMyUt7uBH61CQ9V/9jpAdfNtRx2xCLUbI2DweQG4CWc0V3RuIuCFKNriWMf
	 cBmPOF/Nn9tqA+4tRCohoC7vD9doFEfG5Z168HuRarGUUitz8FB6YwfPk2qrvtNH/W
	 Q9Tmy046f0Pfw==
From: sashiko-bot@kernel.org
Subject: Re: [PATCH v3 3/4] firmware: xilinx: Add support for Xilsem scan
 operations
Reply-To: sashiko-reviews@lists.linux.dev
To: "Rama devi Veggalam" <rama.devi.veggalam@amd.com>
Cc: robh@kernel.org, conor+dt@kernel.org, devicetree@vger.kernel.org
In-Reply-To: <20260624212545.2850787-4-rama.devi.veggalam@amd.com>
References: <20260624212545.2850787-1-rama.devi.veggalam@amd.com>
 <20260624212545.2850787-4-rama.devi.veggalam@amd.com>
Content-Type: text/plain; charset=utf-8
Content-Transfer-Encoding: quoted-printable
Date: Wed, 24 Jun 2026 21:39:46 +0000
Message-Id: <20260624213946.CC62A1F000E9@smtp.kernel.org>
Precedence: bulk
X-Mailing-List: devicetree@vger.kernel.org
List-Id: <devicetree.vger.kernel.org>
List-Subscribe: <mailto:devicetree+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:devicetree+unsubscribe@vger.kernel.org>

Thank you for your contribution! Sashiko AI review found 4 potential issue(=
s) to consider:

New issues:
- [High] Uninitialized memory use and potential information leak via uninit=
ialized stack buffer.
- [Medium] Potential address truncation and misleading parameter type for D=
MA addresses.
- [Low] API contract mismatch and typo in Kernel-Doc.

Pre-existing issues:
- [High] Lockless concurrent modification of global hashtable and arrays ca=
using data races and UAF.
--

commit e939c99be4b47a8ba5e7ed4d9aaf024781ae5543
Author: Rama devi Veggalam <rama.devi.veggalam@amd.com>

firmware: xilinx: Add support for Xilsem scan operations

Add the ATF EEMI call support for Xilsem scan operations.
Initialize, start, stop scan, error inject, read configuration,
status and register for software error events.

Add macros for XilSem correctable and uncorrectable error events.

> diff --git a/drivers/firmware/xilinx/zynqmp-sem.c b/drivers/firmware/xili=
nx/zynqmp-sem.c
> new file mode 100644
> index 0000000000000..5cd399b165f55
> --- /dev/null
> +++ b/drivers/firmware/xilinx/zynqmp-sem.c
> @@ -0,0 +1,176 @@
> +// SPDX-License-Identifier: GPL-2.0
> +/*
> + * Firmware layer for XilSEM APIs.
> + *
> + * Copyright (C), 2026 Advanced Micro Devices, Inc.
> + */

[ ... ]

> +/**
> + * zynqmp_pm_xilsem_cntrl_ops - PM call to perform XilSEM operations
> + * @cmd:	Command for XilSEM scan control operations
> + * @slrid:	SLR id on which scan operation to be done
> + * @response:	Output response (command header, error code or status, slr=
 id)

[Severity: Low]
Does the documentation accurately reflect the response size? The documentat=
ion
specifies 3 elements, but the function below writes 6 elements to the array.
Could this lead future callers to allocate undersized stack arrays?

> + *
> + * Return: Returns 0 on success or error value on failure.
> + */
> +int zynqmp_pm_xilsem_cntrl_ops(u32 cmd, u32 slrid, u32 *const response)
> +{
> +	u32 ret_buf[PAYLOAD_ARG_CNT];
> +	int ret;
> +
> +	ret =3D zynqmp_pm_invoke_fn(PM_XSEM_HEADER | cmd, ret_buf, 1, slrid);

[Severity: High]
This is a pre-existing issue, but can multiple concurrent drivers calling i=
nto
zynqmp_pm_invoke_fn() cause race conditions or use-after-free?

Looking at zynqmp_pm_invoke_fn(), it calls zynqmp_pm_feature() which leads
to lockless hash table insertions into pm_api_features_map:

zynqmp_pm_invoke_fn()
  zynqmp_pm_feature()
    do_feature_check_call()
      hash_add(pm_api_features_map, &feature_data->hentry, api_id);

Since hlist_add_head() is not thread-safe, could concurrent insertions
corrupt the hash bucket's linked list?

Additionally, zynqmp_firmware_remove() frees these hashtable entries
locklessly, which could expose concurrent callers to use-after-free.

> +	response[0] =3D ret_buf[1];

[Severity: High]
Does this code copy uninitialized memory to response if zynqmp_pm_invoke_fn=
()
returns an error?

If zynqmp_pm_invoke_fn() fails early (for example, if zynqmp_pm_feature()
returns -EOPNOTSUPP), it returns without writing to ret_buf. The values
from ret_buf are then unconditionally copied into the response array.
Could this lead to reading uninitialized kernel stack memory?

> +	response[1] =3D ret_buf[2];
> +	response[2] =3D ret_buf[3];
> +	response[3] =3D ret_buf[4];
> +	response[4] =3D ret_buf[5];
> +	response[5] =3D ret_buf[6];
> +
> +	return ret;
> +}
> +EXPORT_SYMBOL_GPL(zynqmp_pm_xilsem_cntrl_ops);

[ ... ]

> +/**
> + * zynqmp_pm_xilsem_read_ssit_status - PM call to perform Xilsem SSIT st=
atus
> + * @slrid:	SLR id for which ECC read to be done
> + * @bufaddr:	Buffer address to get the status information
> + * @response:	Output response (status read header, slr id)
> + *
> + * Return: Returns 0 on success or error value on failure.
> + */
> +int zynqmp_pm_xilsem_read_ssit_status(u32 slrid, u32 bufaddr, u32 *const=
 response)
                                                          ^^^^^^^
[Severity: Medium]
Can this parameter cause address truncation? The EDAC driver may allocate a
coherent DMA buffer typed as dma_addr_t and pass it to bufaddr. Since
bufaddr is typed as u32, this could truncate a 64-bit DMA address to 32
bits, causing the firmware to write to an incorrect physical address.

> +{
> +	u32 ret_buf[PAYLOAD_ARG_CNT];
> +	int ret;
> +
> +	ret =3D zynqmp_pm_invoke_fn(PM_XSEM_SSIT_RD_STS, ret_buf, 2, slrid, buf=
addr);
> +	response[0] =3D ret_buf[1];
> +	response[1] =3D ret_buf[2];
> +
> +	return ret;
> +}
> +EXPORT_SYMBOL_GPL(zynqmp_pm_xilsem_read_ssit_status);

[ ... ]

> +/**
> + * zynqmp_pm_xilsem_cram_getcrc - PM call to perform CRAM Row CRC read
> + * @slrid:	SLR id for which CRC read to be done
> + * @rowindex:	CFRAME row number to be used for reading CRC
> + * @response:	Output response (Get CRC header, CRC values, status)
> + *
> + * Return: Returns 0 on success or error value on failure.
> + */
> +int zynqmp_pm_xilsem_cram_getcrc(u32 slrid, u32 rowindex, u32 *const res=
ponse)
> +{
> +	u32 ret_buf[PAYLOAD_ARG_CNT];
> +	int ret;
> +
> +	ret =3D zynqmp_pm_invoke_fn(PM_XSEM_SSIT_GET_CRC, ret_buf, 2, slrid, ro=
windex);
> +	response[0] =3D ret_buf[1];

[Severity: High]
Does this code also copy uninitialized memory to response if
zynqmp_pm_invoke_fn() returns an error? If it fails early, ret_buf is
not written to, resulting in uninitialized kernel stack memory being
read and copied unconditionally.

> +	response[1] =3D ret_buf[2];
> +	response[2] =3D ret_buf[3];
> +	response[3] =3D ret_buf[4];
> +	response[4] =3D ret_buf[5];
> +	response[5] =3D ret_buf[6];
> +
> +	return ret;
> +}
> +EXPORT_SYMBOL_GPL(zynqmp_pm_xilsem_cram_getcrc);
> +
> +/**
> + * zynqmp_pm_xilsem_cram_ssit_totframes - PM call to perform total frame=
s read
> + * @slrid:	SLR id for which total frames read to be done
> + * @row:	CFRAME row number to be used for reading ECC
> + * @framecnt: Buffer address to get toral frames data

[Severity: Low]
Is there a typo in the documentation here? Should toral be total?

> + * @response:	Output response (Total frames header, slr id, row, status)
> + *
> + * Return: Returns 0 on success or error value on failure.
> + */
> +int zynqmp_pm_xilsem_cram_ssit_totframes(u32 slrid, u32 row, u32 framecn=
t, u32 *const response)
                                                                 ^^^^^^^^^^=
^^
[Severity: Medium]
Does framecnt suffer from address truncation similar to bufaddr? The
parameter name framecnt is somewhat misleading since it receives a DMA
buffer address rather than a count. Since it is typed as u32, passing
a 64-bit dma_addr_t could cause truncation.

> +{
> +	u32 ret_buf[PAYLOAD_ARG_CNT];
> +	int ret;
> +
> +	ret =3D zynqmp_pm_invoke_fn(PM_XSEM_SSIT_GET_FRAMES, ret_buf, 3, slrid,=
 row, framecnt);
> +	response[0] =3D ret_buf[1];
> +	response[1] =3D ret_buf[2];
> +	response[2] =3D ret_buf[3];
> +	response[3] =3D ret_buf[4];
> +
> +	return ret;
> +}

--=20
Sashiko AI review =C2=B7 https://sashiko.dev/#/patchset/20260624212545.2850=
787-1-rama.devi.veggalam@amd.com?part=3D3
