Received: from smtp.kernel.org (aws-us-west-2-korg-mail-alma10-1.taild15c8.ts.net [100.103.45.18])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id F0A114F4754
	for <devicetree@vger.kernel.org>; Mon,  7 Sep 2026 14:58:09 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=100.103.45.18
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1788793093; cv=none; b=hCO+ims4dJRsGsOOxhCSVdYg0Z5P9c5MNisW8CfaWRH02tNRB5yfEsSkhqBnhhSNCluLH9g0tQp2pLid5IR075Fi7NQoaMIlX0dXpofhrGZATm8FUv66CVapFmw7Iv5bRMk94opS++Aep05nHTag0wQn7MnjPJqSwsaN8v5uUhc=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1788793093; c=relaxed/simple;
	bh=TbZ1yNPpepoLoYwzHBklPh/fFSAknMzxr7AToQ3buUA=;
	h=From:Subject:To:Cc:In-Reply-To:References:Content-Type:Date:
	 Message-Id; b=drdi4Ky4KvSMN9f9yVtMlFz4bdIDY0FPiEJcIfa8oBboDG/bCzsFNfwZDasveAM7lmdEpdqEZNz9xdHUeKXzlpmbgNBgtmXLEb9FcxSRlAMf8s6kPYxfBlMy3VgmXfsyWbFG+B4vJLIoy5gIW/UhzoW0LjBEWv3vBdjsFQ8Mz1k=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=NxeYPjdZ; arc=none smtp.client-ip=100.103.45.18
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="NxeYPjdZ"
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 4E6121F00A3A;
	Mon,  7 Sep 2026 14:58:07 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kernel.org;
	s=k20260515; t=1788793087;
	bh=QaAvOuS8zI0uGcnxmR8D7BCtsQGg1H7z7IJy+n0oMwg=;
	h=From:Subject:Reply-To:To:Cc:In-Reply-To:References:Date;
	b=NxeYPjdZQj4bsB2LB/JLAM3S4pjkMejr8wflEJ0awog4L1QphiuiPKNVy4knXv51/
	 xCHMK2ZJ33RaQONHirvG0vTMCnR0vvJaIgNJUTytMpNpPqTrOMKaf5oDs5f81s3vAp
	 J36p3b6SpJDmkY/1QLjLIBLg6eMHXIMcDCWS3jAgkZO3xqPFn3sjuo0EebHEWvu008
	 i/OlmbH76Q1OCvnHGp8IrO522eVDeFT5oFGjGz0tDJb/YkF07zsGrfkDSzwFy4kVYL
	 9MGHCpWlYdc5flvoiR/H5vpRFDcnXeBfQsdlj+CBRvGi570SnbmkODStRlU+w/2GMn
	 SiCOg8plOkQkQ==
From: sashiko-bot@kernel.org
Subject: Re: [PATCH v8 6/9] iio: accel: mma8452: Add comment block for
 struct mma8452_data
Reply-To: sashiko-reviews@lists.linux.dev
To: "Esben Haabendal" <esben@geanix.com>
Cc: robh@kernel.org, conor+dt@kernel.org, devicetree@vger.kernel.org
In-Reply-To: <20260907-mma8452-open-drain-v8-6-c17407e22118@geanix.com>
References: <20260907-mma8452-open-drain-v8-0-c17407e22118@geanix.com>
 <20260907-mma8452-open-drain-v8-6-c17407e22118@geanix.com>
Content-Type: text/plain; charset=utf-8
Content-Transfer-Encoding: quoted-printable
Date: Mon, 07 Sep 2026 14:58:06 +0000
Message-Id: <20260907145807.4E6121F00A3A@smtp.kernel.org>
Precedence: bulk
X-Mailing-List: devicetree@vger.kernel.org
List-Id: <devicetree.vger.kernel.org>
List-Subscribe: <mailto:devicetree+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:devicetree+unsubscribe@vger.kernel.org>

Thank you for your contribution! Sashiko AI review found 1 potential issue(=
s) to consider:
- [Low] The newly added kernel-doc block for `struct mma8452_data` document=
s non-existent fields (`@vdd_reg` and `@vddio_reg`) and omits the existing =
field `regs`, leading to kernel-doc validation warnings.
--

commit 9d34500f2316c8f0c0c1541db98718ec0f302931
Author: Esben Haabendal <esben@geanix.com>

iio: accel: mma8452: Add comment block for struct mma8452_data
   =20
The struct mma8452_data is central for this driver, and it makes sense to
have a description of the fields in it to make it easier to work with the
driver.

> diff --git a/drivers/iio/accel/mma8452.c b/drivers/iio/accel/mma8452.c
> index c6af68d2a297a..2c1b97b77bc19 100644
> --- a/drivers/iio/accel/mma8452.c
> +++ b/drivers/iio/accel/mma8452.c
> @@ -104,6 +104,22 @@
> =20
>  #define MMA8452_AUTO_SUSPEND_DELAY_MS		2000
> =20
> +/**
> + * struct mma8452_data - IIO device private data structure
> + * @client:			the I2C client object
> + * @lock:			mutex for synchronziation of register
> + *				read-modify-write and holding chip in STANDBY
> + *				mode while writing to registers
> + * @orientation:		mounting matrix, flipped axis etc
> + * @chip_info:			chip specific data
> + * @vdd_reg:			reference to VDD regulator
> + * @vddio_reg:			reference to VDDIO regulator

[Severity: Low]
Does this kernel-doc block accurately reflect the struct definition?

The newly added documentation lists @vdd_reg and @vddio_reg, but these
fields do not actually exist in struct mma8452_data.

This mismatch will trigger kernel-doc validation warnings when building
with W=3D1 or running kernel-doc tooling. Note that while a later commit
in this series adds the missing @open_drain field, this @vdd_reg and
@vddio_reg mismatch appears to remain unresolved.

> + * @buffer:			triggered buffer
> + * @sleep_val:			time in ms to sleep while waiting for drdy
> + * @ctrl_reg1:			CTRL_REG1 register shadow value
> + * @data_cfg:			DATA_CFG register shadow value
> + * @open_drain:			true for irq pin in open-drain mode
> + */
>  struct mma8452_data {
>  	struct i2c_client *client;
>  	struct mutex lock;

[Severity: Low]
Is an existing field missing from this documentation block?

The actual struct mma8452_data contains the following field which is
completely omitted from the newly added kernel-doc:

	struct regulator_bulk_data regs[2];

Like the non-existent fields above, omitting the documentation for the
existing regs field will result in kernel-doc validation warnings.

--=20
Sashiko AI review =C2=B7 https://sashiko.dev/#/patchset/20260907-mma8452-op=
en-drain-v8-0-c17407e22118@geanix.com?part=3D6
