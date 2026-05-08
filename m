Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 998CD39BFF9
	for <devicetree@vger.kernel.org>; Fri,  8 May 2026 22:20:31 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=10.30.226.201
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1778278831; cv=none; b=Jeorp1NcnEUpGde3/OZ6on6Gmhy7RHq3Ss5Ppqi3K7kgl1V2+nhrHCBNbVWQI/BzCweyYeyktCA8bZ27RJIMzg4vXyWR81XMaB75S0bPLzWPKsQrVi23kQn9B6T5tfPHrKuscjeja4db95oMLNASmuaQx7aG6zw4zYQDtb40+cg=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1778278831; c=relaxed/simple;
	bh=JD+FF0A6lenLFJqf4AYKkTzmhHUJE9bUHB/SlVdzFWw=;
	h=From:Subject:To:Cc:In-Reply-To:References:Content-Type:Date:
	 Message-Id; b=bVp7WQq/tM37U35+C09P4Ks6Gmm3Aqelz9Q5Y04bNsOAeDKAOMQIHx3RRip6bZaouriZ/bSxYUeuuVF4Jgbxg2xCRUNxPvuBvH8h+Ud84udsp18ZE27EwwQ1RXd/2k8JShoogwSR9MjPFLeeco3u0rflMgEfJPn+2RmVFguS67I=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=piAWkGrW; arc=none smtp.client-ip=10.30.226.201
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="piAWkGrW"
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 19E23C2BCB0;
	Fri,  8 May 2026 22:20:31 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1778278831;
	bh=JD+FF0A6lenLFJqf4AYKkTzmhHUJE9bUHB/SlVdzFWw=;
	h=From:Subject:Reply-To:To:Cc:In-Reply-To:References:Date:From;
	b=piAWkGrWfVj26Xjsbs/g3qH7KwpC5W/0RpjjM1e0+gk8RcFONKmNDa7NZ+ApABue/
	 eAoH9dtdRxnbhCyqcRsRUIxAq5cIzNlRu5/5pkS1ZMQlep+tXtBP3l/2oZEGhGTXYj
	 p+q2dofNhXzF6Es4xffeUNhyRs79VVi1DQKeQUf4T5eigcWf4oX4SOKgl4q/NvHQHb
	 jHh+hm9DuJ54lphxJwH6obcaQmLzfvGsXYsBHvQ/hqRJ6uHv+dRja0jEYwfSO0I1Oq
	 tnkBmqotU4uGrxL3cSpduEcoG4+xDAE8PPIgpnqMxAY0Mb5J+/QcUv7ReCovc99/Sg
	 ie3abMOCdqv2A==
From: sashiko-bot@kernel.org
Subject: Re: [PATCH RFC v4 02/10] iio: core: support 64-bit register through
 debugfs
Reply-To: sashiko@lists.linux.dev
To: "Rodrigo Alencar via B4 Relay" <devnull+rodrigo.alencar.analog.com@kernel.org>
Cc: devicetree@vger.kernel.org, robh@kernel.org, krzk+dt@kernel.org, conor+dt@kernel.org
In-Reply-To: <20260508-ad9910-iio-driver-v4-2-d26bfd20ee3d@analog.com>
References: <20260508-ad9910-iio-driver-v4-2-d26bfd20ee3d@analog.com>
Content-Type: text/plain; charset=utf-8
Content-Transfer-Encoding: quoted-printable
Date: Fri, 08 May 2026 22:20:30 +0000
Message-Id: <20260508222031.19E23C2BCB0@smtp.kernel.org>
Precedence: bulk
X-Mailing-List: devicetree@vger.kernel.org
List-Id: <devicetree.vger.kernel.org>
List-Subscribe: <mailto:devicetree+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:devicetree+unsubscribe@vger.kernel.org>

Thank you for your contribution! Sashiko AI review found 4 potential issue(=
s) to consider:
- [High] Uninitialized stack memory read when file offset is non-zero
- [Medium] Missing newline character in debugfs read output
- [Medium] Silent truncation of 64-bit values for 32-bit registers
- [Low] Format specifier type mismatch in sscanf
--

commit 2208ef2b9ad567bd166f4ac44a53f42c899c021b
Author: Rodrigo Alencar <rodrigo.alencar@analog.com>

iio: core: support 64-bit register through debugfs

This patch adds a debugfs_reg64_access function pointer to iio_info to
support 64-bit registers. It also updates the read and write debugfs file
operations to use the 64-bit variant when available, falling back to 32-bit.

> diff --git a/drivers/iio/industrialio-core.c b/drivers/iio/industrialio-c=
ore.c
> index bd6f4f9f45330..cb4e2ade25c0e 100644
> --- a/drivers/iio/industrialio-core.c
> +++ b/drivers/iio/industrialio-core.c
[ ... ]
> @@ -403,7 +412,7 @@ static ssize_t iio_debugfs_read_reg(struct file *file=
, char __user *userbuf,
> =20
>  	iio_dev_opaque->read_buf_len =3D snprintf(iio_dev_opaque->read_buf,
>  						sizeof(iio_dev_opaque->read_buf),
> -						"0x%X\n", val);
> +						"0x%llX", val64);

Does this inadvertently drop the newline character?

[ ... ]
> @@ -429,7 +439,7 @@ static ssize_t iio_debugfs_write_reg(struct file *fil=
e,
> =20
>  	buf[ret] =3D '\0';

Could buf be read uninitialized here if *ppos > 0?

fs/libfs.c:simple_write_to_buffer() writes user data to buf + *ppos and
returns the number of bytes written:

	res =3D copy_from_user(to + pos, from, count);
	if (res =3D=3D count)
		return -EFAULT;
	count -=3D res;
	*ppos =3D pos + count;
	return count;

If *ppos > 0, the first *ppos bytes of buf remain uninitialized. The
subsequent sscanf() reads starting from buf[0], parsing up to count bytes
of uninitialized kernel stack memory.

> =20
> -	ret =3D sscanf(buf, "%i %i", &reg, &val);
> +	ret =3D sscanf(buf, "%i %lli", &reg, &val64);

Can this trigger compiler warnings? val64 is of type u64, but %lli is the
specifier for a signed long long pointer.

> =20
>  	switch (ret) {
>  	case 1:
> @@ -437,8 +447,12 @@ static ssize_t iio_debugfs_write_reg(struct file *fi=
le,
>  		break;
>  	case 2:
>  		iio_dev_opaque->cached_reg_addr =3D reg;
> -		ret =3D indio_dev->info->debugfs_reg_access(indio_dev, reg,
> -							  val, NULL);
> +		if (indio_dev->info->debugfs_reg64_access)
> +			ret =3D indio_dev->info->debugfs_reg64_access(indio_dev, reg,
> +								    val64, NULL);
> +		else
> +			ret =3D indio_dev->info->debugfs_reg_access(indio_dev, reg,
> +								  val64, NULL);

Does this silently truncate 64-bit values for 32-bit registers?

If a user provides a 64-bit value but the driver only implements the 32-bit
debugfs_reg_access callback, val64 is passed directly as the unsigned int
argument. This discards the upper 32 bits without returning an error.

--=20
Sashiko AI review =C2=B7 https://sashiko.dev/#/patchset/20260508-ad9910-iio=
-driver-v4-0-d26bfd20ee3d@analog.com?part=3D2
