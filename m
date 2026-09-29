Received: from smtp.kernel.org (aws-us-west-2-korg-mail-alma10-1.taild15c8.ts.net [100.103.45.18])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 81020401A0B
	for <devicetree@vger.kernel.org>; Tue, 29 Sep 2026 03:29:11 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=100.103.45.18
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1790652552; cv=none; b=F37S01QUZ66X0Ot1yrOYFuUwh2h0Sv4CCvu+U3EvzIPAxZrTN5hK1tmf3O46jYzBYRPCrekc3qqbf+IQm305N4y77NhU0Sa0VcpJwJ1siqi5Pnw4kn4rqExQ3KxwSKbN5d9CTN40TuuKDyJptAO4lr/OFuNLrS13Q0PBpRg9Mdo=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1790652552; c=relaxed/simple;
	bh=I2jpR0gH7OmdSnQPdp6WVXX7sw60yuGgdwrExW19PBo=;
	h=From:Subject:To:Cc:In-Reply-To:References:Content-Type:Date:
	 Message-Id; b=UOYtJpZz2soI0cfT/nf+rtCJj8dmx5I3mWR6TfJPHbaSGKTZuPZmaDEqtgQRmBQIX5HjKYhsPi5zYx6/jEs35JEnBCaQynBku4OU/vkrklUQpmuZh76nCahkxqPYnKlryjS3lsSdr/H10QVfvfV3uvTdPHqAQv01RVIzy3dhjCE=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=KrMP4iTA; arc=none smtp.client-ip=100.103.45.18
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="KrMP4iTA"
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 990E51F000FF;
	Tue, 29 Sep 2026 03:29:10 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kernel.org;
	s=k20260515; t=1790652550;
	bh=oD6EqwzZkohCibvERzvEMVYKA8lg3xDlU45kaLTT/0M=;
	h=From:Subject:Reply-To:To:Cc:In-Reply-To:References:Date;
	b=KrMP4iTA8jfHd8ELM57iWtWw0ycNbtVeqiac6eEsfD162JXvPXsr8mCVYwI6Nxk8i
	 QKInS6XOxpA2t+zBS9f4pqrINtC5vOY84YT2btVaDP/QE1SVZCZeZSHj78JIVAaBgq
	 LNbBEwgR3kZL2i30GXWYWCanWJRqdLceXt6/bhvGqvW6/7qm4rXKjp2FjUAo5IFLek
	 +hMUzkxOnR2veYttWtnhSe8tPw18gsvkQD+lqkz0O59gz8QCvut/FhTcprUbdmHLqt
	 PtsUPhyCAhjZqxzK5RaCRXgW5R5VGoM7/1aatR8rO8HtENBZZVgdvLE7hEOp9s2thd
	 pxfnmAbsfOz7w==
From: sashiko-bot@kernel.org
Subject: Re: [PATCH RFC 03/10] firmware: add RPMI TEE bus support
Reply-To: sashiko-reviews@lists.linux.dev
To: "Amirreza Zarrabi" <amirreza.zarrabi@oss.qualcomm.com>
Cc: conor+dt@kernel.org, devicetree@vger.kernel.org, robh@kernel.org
In-Reply-To: <20260928-riscv-rpmi-tee-abi-v1-3-04908b81d885@oss.qualcomm.com>
References: <20260928-riscv-rpmi-tee-abi-v1-0-04908b81d885@oss.qualcomm.com>
 <20260928-riscv-rpmi-tee-abi-v1-3-04908b81d885@oss.qualcomm.com>
Content-Type: text/plain; charset=utf-8
Content-Transfer-Encoding: quoted-printable
Date: Tue, 29 Sep 2026 03:29:10 +0000
Message-Id: <20260929032910.990E51F000FF@smtp.kernel.org>
Precedence: bulk
X-Mailing-List: devicetree@vger.kernel.org
List-Id: <devicetree.vger.kernel.org>
List-Subscribe: <mailto:devicetree+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:devicetree+unsubscribe@vger.kernel.org>

Thank you for your contribution! Sashiko AI review found 3 potential issue(=
s) to consider:
- [Medium] firmware: rpmi-tee: stub returns NULL instead of ERR_PTR
- [Medium] firmware: rpmi-tee: missing file2alias integration for module au=
to-loading
- [Low] firmware: rpmi-tee: missing newline in modalias sysfs attribute
--

commit c7783a9ac1224efdc38ee5d5e0d605481f36e278
Author: Amirreza Zarrabi <amirreza.zarrabi@oss.qualcomm.com>

    firmware: add RPMI TEE bus support
   =20
    Add a bus for RISC-V RPMI TEE services. Each service exposed by a
    TEE endpoint is registered as its own device on this bus, identified
    by a UUID, so that a single physical TEE can host multiple
    independently-bindable service drivers.

> diff --git a/drivers/firmware/riscv_rpmi_tee/bus.c b/drivers/firmware/ris=
cv_rpmi_tee/bus.c
> index 0000000000000..32f555c2f1f2a
> --- /dev/null
> +++ b/drivers/firmware/riscv_rpmi_tee/bus.c
> @@ -0,0 +1,202 @@
[ ... ]
> +#define RPMI_TEE_UEVENT_MODALIAS_FMT	"rpmi_tee:%pUb"
> +
> +static DEFINE_IDA(rpmi_tee_bus_id);

[Severity: Low]
Does this macro need a trailing newline?

When used by modalias_show() via sysfs_emit(), it will output a string
without a newline, which violates standard sysfs formatting conventions.

[ ... ]
> +static int rpmi_tee_device_uevent(const struct device *dev,
> +				  struct kobj_uevent_env *env)
> +{
> +	const struct rpmi_tee_device *rdev =3D to_rpmi_tee_dev(dev);
> +
> +	return add_uevent_var(env, "MODALIAS=3D" RPMI_TEE_UEVENT_MODALIAS_FMT,
> +			      &rdev->uuid);
> +}

[Severity: Medium]
Will this uevent fail to trigger automatic module loading?

If service drivers use MODULE_DEVICE_TABLE(rpmi_tee, ...) to export aliases,
the modpost tool will ignore them because scripts/mod/file2alias.c lacks
support for parsing the rpmi_tee_device_id structure.

[ ... ]
> diff --git a/include/linux/rpmi_tee.h b/include/linux/rpmi_tee.h
> index 0000000000000..c499f0427833e
> --- /dev/null
> +++ b/include/linux/rpmi_tee.h
[ ... ]
> +struct rpmi_tee_device_id {
> +	uuid_t uuid;
> +};

Should this structure be defined in include/linux/mod_devicetable.h to
properly integrate with file2alias.c?

[ ... ]
> +#else
> +static inline struct rpmi_tee_device *
> +rpmi_tee_device_register(const uuid_t *uuid, u32 endpoint_id,
> +			 const struct rpmi_tee_ops *ops, struct device *parent)
> +{
> +	return NULL;
> +}

[Severity: Medium]
Should this stub return an error pointer like ERR_PTR(-ENODEV) instead of
NULL?

The active implementation of rpmi_tee_device_register() guarantees an ERR_P=
TR
on failure. If a caller relies on IS_ERR() to check the return value, this
fallback stub will incorrectly pass the check and lead to a NULL pointer
dereference when the caller attempts to use the returned device pointer.

--=20
Sashiko AI review =C2=B7 https://sashiko.dev/#/patchset/20260928-riscv-rpmi=
-tee-abi-v1-0-04908b81d885@oss.qualcomm.com?part=3D3
