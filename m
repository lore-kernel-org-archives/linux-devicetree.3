Received: from smtp.kernel.org (aws-us-west-2-korg-mail-alma10-1.taild15c8.ts.net [100.103.45.18])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 56A6C4A3D25
	for <devicetree@vger.kernel.org>; Wed, 14 Oct 2026 13:14:18 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=100.103.45.18
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1791983660; cv=none; b=YdvHwvWk9ihDUTMXeq61LwMl+07V9Ne1FpOiVBPj23JqhZlkAKw4x15pJSus+uuiyClWhfPeTqU6F+r1H6u3OGJAkhz+z956s3hwQhMWSF6AG9llOAk2MeNKpuT9joo42YnSB6Uth2Gn+MESUedu8VFLI4IA1hjjA5d0skox9pI=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1791983660; c=relaxed/simple;
	bh=B1uwWMwhWd7wt0VScz3s08Pv+crkDqnzzeFqNBqNSls=;
	h=Message-ID:From:Subject:To:Cc:In-Reply-To:References:Content-Type:
	 Date; b=rPVHmPm0M42mldsPbMASBATaO7LBwS9k36wcvIp18ZDVRAaplDNi3LtPbfPsCPGtMfniN/y5IQS9o1L4tlrz+5dg3F+jeSassEyWjs//y4hbt8UlPvJ1WVCznrzQssbLnOpf3kW7Ju25NpxiXsAjInuc2R9+lGsKrWYCiKySQMM=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=dC5+pDjU; arc=none smtp.client-ip=100.103.45.18
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="dC5+pDjU"
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 92E501F00899;
	Wed, 14 Oct 2026 13:14:18 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kernel.org;
	s=k20260515; t=1791983658;
	bh=tltVb2X5sEX4IVLl1aNsVetEBt3Eoak84yG5YUYf8gw=;
	h=From:Subject:Reply-To:To:Cc:In-Reply-To:References:Date;
	b=dC5+pDjU84s1veNwtiZEREYNmwktx8PPkl0r/0gaO3DowSMabHcwqi0ir5ZE0Lh1b
	 x/e/7HQLpttPmCOJ22YbcXKNlqyO9ar/pdfAaN4vBoJUsW3+m+2W9C4yflzHvxhqxe
	 kq8LIk6gGurB/MJfymHFjZ42sf+SkBeBLTo4PglRPRL3xBfAwzRiMR4t0SZ2x84JVk
	 EavPAEg8rCAQkVHI8/QmABTIwaLumaDl+g1TQFb4Pv/l0tfHv949C1J+v2XxnwA++i
	 nxEhJA39RNK79SLT4VZziKr85A4yUWdVrB8UzdecLU6KvPkVk4h+tOKHB6825BJPT1
	 CN8Hk1jbuqP8A==
Message-ID: <sashiko-outbox-171325@kernel.org>
From: sashiko-bot@kernel.org
Subject: Re: [PATCH RFC 2/5] nvmem: Add UEFI variable NVMEM provider
Reply-To: sashiko-reviews@lists.linux.dev
To: "Abel Vesa" <abel.vesa@oss.qualcomm.com>
Cc: devicetree@vger.kernel.org, robh@kernel.org, conor+dt@kernel.org
In-Reply-To: <20261014-b4-nvmem-efivar-v1-2-187c85f65018@oss.qualcomm.com>
References: <20261014-b4-nvmem-efivar-v1-0-187c85f65018@oss.qualcomm.com>
 <20261014-b4-nvmem-efivar-v1-2-187c85f65018@oss.qualcomm.com>
Content-Type: text/plain; charset=utf-8
Content-Transfer-Encoding: quoted-printable
Date: Wed, 14 Oct 2026 13:14:18 +0000
Precedence: bulk
X-Mailing-List: devicetree@vger.kernel.org
List-Id: <devicetree.vger.kernel.org>
List-Subscribe: <mailto:devicetree+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:devicetree+unsubscribe@vger.kernel.org>

Thank you for your contribution! Sashiko AI review found 1 potential issue(=
s) to consider:
- [High] nvmem: efivar: missing efivars_lock during EFI variable API calls
--

commit 95924ede9aa4d9717fd0738df67a068299d524f1
Author: Abel Vesa <abel.vesa@oss.qualcomm.com>

nvmem: Add UEFI variable NVMEM provider

This commit adds a provider that reads a UEFI variable via the EFI runtime
GetVariable service and publishes its bytes as a read-only NVMEM device.

> diff --git a/drivers/nvmem/efivar.c b/drivers/nvmem/efivar.c
> new file mode 100644
> index 0000000000000..699b1d67aea44
> --- /dev/null
> +++ b/drivers/nvmem/efivar.c

[ ... ]

> @@ -68,26 +68,26 @@ static size_t efivar_nvmem_cells_extent(struct device=
 *dev)
>  /*
>   * Find the vendor GUID of a variable given only its (UCS-2) name, by
>   * enumerating the variable store.  Used when no 'efivar-guid' is provid=
ed.
>   */
>  static int efivar_nvmem_find_guid(const efi_char16_t *want, efi_guid_t *=
out)
>  {
>  	unsigned long max =3D 512; /* in UCS-2 chars; variable names are short =
*/
>  	efi_char16_t *name;
>  	efi_guid_t vendor =3D {};
>  	efi_status_t status;
>  	int ret =3D -ENODEV;
> =20
>  	name =3D kcalloc(max, sizeof(*name), GFP_KERNEL);
>  	if (!name)
>  		return -ENOMEM;
>  	name[0] =3D 0;
> =20
>  	for (;;) {
>  		unsigned long name_size =3D max * sizeof(*name);
> =20
>  		status =3D efivar_get_next_variable(&name_size, name, &vendor);

[Severity: High]
Does this call to efivar_get_next_variable() require efivars_lock to be held
via efivar_lock()?

As documented in drivers/firmware/efi/vars.c, EFI variable APIs mandate that
efivars_lock is held by the caller. The lock protects the global __efivars
pointer and underlying firmware operations from concurrent state changes.

If the EFI variable backend (such as uefisecapp) is concurrently unregister=
ed
via efivars_unregister(), __efivars is set to NULL under the lock. Without
serialization, the unprotected __efivars->ops->get_next_variable call inside
the EFI core will trigger a NULL pointer dereference.

>  		if (status =3D=3D EFI_BUFFER_TOO_SMALL) {
>  			efi_char16_t *tmp;

[ ... ]

> @@ -180,24 +180,24 @@ static int efivar_nvmem_probe(struct platform_devic=
e *pdev)
>  		status =3D ret ? EFI_NOT_FOUND : EFI_SUCCESS;
>  	}
> =20
>  	/* First attempt with a modest buffer; grow if the firmware asks. */
>  	size =3D 512;
>  	buf =3D kzalloc(size, GFP_KERNEL);
>  	if (!buf) {
>  		kfree(name16);
>  		return -ENOMEM;
>  	}
> =20
>  	if (status =3D=3D EFI_SUCCESS) {
>  		status =3D efivar_get_variable(name16, &guid, &attr, &size, buf);

[Severity: High]
Similar to efivar_get_next_variable() above, should this call to
efivar_get_variable() be protected by efivar_lock()?

Without the lock, an unprotected __efivars->ops->get_variable call inside
the EFI core can trigger a NULL pointer dereference if the backend is
concurrently unregistered.

>  		if (status =3D=3D EFI_BUFFER_TOO_SMALL) {
>  			kfree(buf);
>  			buf =3D kzalloc(size, GFP_KERNEL);
>  			if (!buf) {
>  				kfree(name16);
>  				return -ENOMEM;
>  			}
>  			status =3D efivar_get_variable(name16, &guid, &attr,
>  						     &size, buf);

[Severity: High]
Does this second call to efivar_get_variable() also need to be protected
by efivar_lock()?

>  		}
>  	}
>  	kfree(name16);

--=20
Sashiko AI review =C2=B7 https://sashiko.dev/#/patchset/20261014-b4-nvmem-e=
fivar-v1-0-187c85f65018@oss.qualcomm.com?part=3D2
