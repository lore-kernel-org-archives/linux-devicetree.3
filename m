Received: from smtp.kernel.org (aws-us-west-2-korg-mail-alma10-1.taild15c8.ts.net [100.103.45.18])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 2308C3D6CA0
	for <devicetree@vger.kernel.org>; Thu,  9 Jul 2026 09:14:50 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=100.103.45.18
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1783588492; cv=none; b=CpHobTRlALRMi+6mmBZiNHUne4AMcb3toWs+fBG6Sa86MGaLzntrHT9J+HKFtDmrqZChbsN8k+1i7Laapryb3hMddK8VhqDtG3WOevFt0AjuMCNTABanDqLRSu8/dtrfhe0dhclu1t6Uyp+g/xYRKt6qsD3DcbJiptGXMJsgHQ8=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1783588492; c=relaxed/simple;
	bh=wYaUDUazmE0YOAWtjq7lTPtnxHTH/KJ/QTyCAeRJqjQ=;
	h=From:Subject:To:Cc:In-Reply-To:References:Content-Type:Date:
	 Message-Id; b=I2kRzlrFP5f4CBGfbZx9vlPxX0zO/2oyqIiwOqTR6Ye4U+MVCcaEJB+4EEHHpdn0vX0a6k087T6xfmheERpF+u1KRBIpmcPhK5wo2fzs6NxOzmUNplPN5oDh1lE7wlmZV6YHOpQ6RXPUoi0+61DraKUQBtKZb6yBcYUAi68d0MQ=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=M5+uuC1E; arc=none smtp.client-ip=100.103.45.18
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="M5+uuC1E"
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 855981F00A3A;
	Thu,  9 Jul 2026 09:14:50 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kernel.org;
	s=k20260515; t=1783588490;
	bh=K6Fj+u6d/DEEvwAfhmRDWqlPKg9MB/RnF++C9zBfP3E=;
	h=From:Subject:Reply-To:To:Cc:In-Reply-To:References:Date;
	b=M5+uuC1EitTpVS42kLt1fx3wSYiwg+VK+f8ky5g9bbc994+noba0o4cyOauLEhMvo
	 NGKP76vXba3CBL68BiIAYYncDgBz/wMztPM2AjfCEGltGEMWxjbPrFc1l82SU6GxBF
	 QCXUbrCTRGEwbNcVQmsR0/hwLvDe950nMHrdflDsMBYNKAuGXRxXLTlt08Bf3uvcK4
	 PCXHkMqdzlu9W/dmL7SS5CSOkQK4cJFE1ALz8GuqNm1vRm+17tT6EfOQ4v/ltTBxnk
	 swRENTUONnhUsGAsg6tCGG8FI2sQXDboR5GWDg/MT1fe2IeyNtFezA2Wz4+5NeRgWa
	 icfTGd1Qc7VHw==
From: sashiko-bot@kernel.org
Subject: Re: [PATCH 3/6] iio: adc: adi-axi-adc: Add support for CRC
Reply-To: sashiko-reviews@lists.linux.dev
To: "Janani Sunil" <janani.sunil@analog.com>
Cc: devicetree@vger.kernel.org, conor+dt@kernel.org, robh@kernel.org
In-Reply-To: <20260709-ad7768-driver-v1-3-44e1194fd96a@analog.com>
References: <20260709-ad7768-driver-v1-0-44e1194fd96a@analog.com>
 <20260709-ad7768-driver-v1-3-44e1194fd96a@analog.com>
Content-Type: text/plain; charset=utf-8
Content-Transfer-Encoding: quoted-printable
Date: Thu, 09 Jul 2026 09:14:49 +0000
Message-Id: <20260709091450.855981F00A3A@smtp.kernel.org>
Precedence: bulk
X-Mailing-List: devicetree@vger.kernel.org
List-Id: <devicetree.vger.kernel.org>
List-Subscribe: <mailto:devicetree+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:devicetree+unsubscribe@vger.kernel.org>

Thank you for your contribution! Sashiko AI review found 2 potential issue(=
s) to consider:

New issues:
- [Medium] Incomplete implementation: missing `crc_enable` and `crc_disable=
` callbacks in AD485X and AD408X specific operations structures.

Pre-existing issues:
- [High] The mutex `st->lock` is never initialized in the driver's probe fu=
nction.
--

--- Patch [3]: [PATCH 3/6] iio: adc: adi-axi-adc: Add support for CRC ---
commit c99754ea278319045472336d04b62842c05a3731
Author: Janani Sunil <janani.sunil@analog.com>

iio: adc: adi-axi-adc: Add support for CRC

Add support for enabling and disabling Cyclic Redundancy Check (CRC)
processing in the AXI ADC backend. CRC provides data integrity verification
for high-speed ADC data streams, ensuring reliable data transfer between
the ADC frontend and backend processing systems.

> diff --git a/drivers/iio/adc/adi-axi-adc.c b/drivers/iio/adc/adi-axi-adc.c
> index 26b9c75bd4d8e..8af42d26aac08 100644
> --- a/drivers/iio/adc/adi-axi-adc.c
> +++ b/drivers/iio/adc/adi-axi-adc.c

[ ... ]

> @@ -615,6 +633,8 @@ static const struct iio_backend_ops adi_axi_adc_ops =
=3D {
>  	.num_lanes_set =3D axi_adc_num_lanes_set,
>  	.debugfs_reg_access =3D iio_backend_debugfs_ptr(axi_adc_reg_access),
>  	.debugfs_print_chan_status =3D iio_backend_debugfs_ptr(axi_adc_debugfs_=
print_chan_status),
> +	.crc_enable =3D axi_adc_crc_enable,
> +	.crc_disable =3D axi_adc_crc_disable,
>  };

[Severity: Medium]
Did this patch introduce a regression where AD485X and AD408X backend
operations are missing the new CRC callbacks?

If a frontend driver for AD485X or AD408X tries to enable CRC via
iio_backend_crc_enable(), it will return -EOPNOTSUPP because the
callbacks are missing in their respective structures:

drivers/iio/adc/adi-axi-adc.c:
static const struct iio_backend_ops adi_ad485x_ops =3D {
	.enable =3D axi_adc_enable,
	...
	.debugfs_print_chan_status =3D
		iio_backend_debugfs_ptr(axi_adc_debugfs_print_chan_status),
	/* crc_enable and crc_disable are NULL */
};

Should adi_ad485x_ops and adi_ad408x_ops also be updated?

[Severity: High]
This isn't a bug introduced by this patch, but I noticed the mutex
st->lock is never initialized during probe:

drivers/iio/adc/adi-axi-adc.c:adi_axi_adc_probe() {
	...
	st =3D devm_kzalloc(dev, sizeof(*st), GFP_KERNEL);
	if (!st)
		return -ENOMEM;
	...
}

Because devm_kzalloc only zero-initializes the memory, the internal
wait_list for st->lock is left uninitialized.

When concurrent access occurs and hits the mutex slow path, won't this
cause a kernel panic due to a NULL pointer dereference? Should a call to
devm_mutex_init() be added here?

--=20
Sashiko AI review =C2=B7 https://sashiko.dev/#/patchset/20260709-ad7768-dri=
ver-v1-0-44e1194fd96a@analog.com?part=3D3
