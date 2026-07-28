Received: from smtp.kernel.org (aws-us-west-2-korg-mail-alma10-1.taild15c8.ts.net [100.103.45.18])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 64FCC3CBE71
	for <devicetree@vger.kernel.org>; Tue, 28 Jul 2026 18:14:43 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=100.103.45.18
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1785262484; cv=none; b=nZ0phF6qQD4DpuRL2qzAnulg2JpW9e5f/UHagm1Zk+E6uubMLJlg0OdbWnN5drkIEkL7dzrkaJIZJbd2UUfynz80y5MThVr6EJZXB94f5nqiKOHXkEbEYZwK3VatfFZ7KBcNrl/xMh5obXXiT/WGEdY8S5DsAtfJoSWue39MmLU=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1785262484; c=relaxed/simple;
	bh=EC6aA9Q8JLdRJEwxG4yffW8F7mC9lxIy0k23Ifj2PsQ=;
	h=From:Subject:To:Cc:In-Reply-To:References:Content-Type:Date:
	 Message-Id; b=HTpKhstJVvnV9LqFfnxRp+8jQneBb+JNeZP80cp3go5ooB8TS5cNTXEE3xMhhnbHtQK1oOI3TWJ8s/NjcHylqrGWpuwpb6tE5EBEB9UKqyk48Vj3jHZ9vV/98WE7M/HygzZmlkCqS/MqqjcUUFSo1k2rMEHPU6sgAdfyRwrCbIg=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=PRDdvdl3; arc=none smtp.client-ip=100.103.45.18
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="PRDdvdl3"
Received: by smtp.kernel.org (Postfix) with ESMTPSA id A7CDC1F000E9;
	Tue, 28 Jul 2026 18:14:42 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kernel.org;
	s=k20260515; t=1785262483;
	bh=2qwp5LAUuaXArgTQqY4BywVwBmsQlveKZEsLbR3mFxY=;
	h=From:Subject:Reply-To:To:Cc:In-Reply-To:References:Date;
	b=PRDdvdl3L7SqC3eZTl5R0FtLMnZor/G/K+eItQV+y1Xi5SpyL8qJaGr/WkVUQU+Ec
	 1Cza5XKjyEiWIFXGfd/aAxUx2I/w8UmYWdOlZ6eAMpQIYlrSNuUHpw/Aj1sFnYs75H
	 VfAYtQ7bsPVHS3XoPDtMGrFYKTPy4UXQbwiG8HnirYZbFcRpU+gYkMDy9oCuI0ARyZ
	 HmAIKjIHVBAZc9fnBmqA3kHsH0Yg5OchkRUC81aAqZAfXqt/hxp9Z/qTNi54OtqVVS
	 +owWLoXqzViRoVmIz5ItbbOXi2BNacfkw0jSND6eUUQOoDXlOaljChaRDNHCKp4uCt
	 +JGEKsr+7ReyQ==
From: sashiko-bot@kernel.org
Subject: Re: [PATCH 5/8] platform: arm64: qcom-hamoa-ec: Verify required I2C
 adapter functionality
Reply-To: sashiko-reviews@lists.linux.dev
To: "Anvesh Jain P" <anvesh.p@oss.qualcomm.com>
Cc: conor+dt@kernel.org, robh@kernel.org, devicetree@vger.kernel.org
In-Reply-To: <20260728-ec_add_more_commands-v1-5-771abd65ee1a@oss.qualcomm.com>
References: <20260728-ec_add_more_commands-v1-0-771abd65ee1a@oss.qualcomm.com>
 <20260728-ec_add_more_commands-v1-5-771abd65ee1a@oss.qualcomm.com>
Content-Type: text/plain; charset=utf-8
Content-Transfer-Encoding: quoted-printable
Date: Tue, 28 Jul 2026 18:14:42 +0000
Message-Id: <20260728181442.A7CDC1F000E9@smtp.kernel.org>
Precedence: bulk
X-Mailing-List: devicetree@vger.kernel.org
List-Id: <devicetree.vger.kernel.org>
List-Subscribe: <mailto:devicetree+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:devicetree+unsubscribe@vger.kernel.org>

Thank you for your contribution! Sashiko AI review found 1 potential issue(=
s) to consider:
- [High] The IRQ handler is requested and SCI events are enabled before the=
 `ec->ec_cdev` array is allocated, creating a race condition that can lead =
to a NULL pointer dereference during `qcom_ec_probe()`.
--

--- Patch [5]: [PATCH 5/8] platform: arm64: qcom-hamoa-ec: Verify required =
I2C adapter functionality ---
commit a6f49e31946f2ee0f2b44aae1db005b085a4d77b
Author: Anvesh Jain P <anvesh.p@oss.qualcomm.com>

platform: arm64: qcom-hamoa-ec: Verify required I2C adapter functionality

Check the underlying I2C adapter supports both the raw I2C transfers
used by the fan RPM/LUT commands and the SMBus byte and block-write
transfers used by the other EC commands, and fail probe early with a
clear error if it doesn't.

> diff --git a/drivers/platform/arm64/qcom-hamoa-ec.c b/drivers/platform/ar=
m64/qcom-hamoa-ec.c
> index d0c45d9970eee..a420a180a1948 100644
> --- a/drivers/platform/arm64/qcom-hamoa-ec.c
> +++ b/drivers/platform/arm64/qcom-hamoa-ec.c
> @@ -1195,6 +1195,11 @@ static int qcom_ec_probe(struct i2c_client *client)
>  	unsigned int i;
>  	int ret;
> =20
> +	if (!i2c_check_functionality(client->adapter,
> +				     I2C_FUNC_I2C | I2C_FUNC_SMBUS_BYTE_DATA |
> +				     I2C_FUNC_SMBUS_WRITE_I2C_BLOCK))
> +		return -EOPNOTSUPP;
> +
>  	ec =3D devm_kzalloc(dev, sizeof(*ec), GFP_KERNEL);
>  	if (!ec)
>  		return -ENOMEM;
[Severity: High]
Could this regression result in a race condition where the interrupt handle=
r is
requested and sci events are enabled before the ec->ec_cdev array is
allocated?

If an interrupt fires immediately after devm_request_threaded_irq() and
qcom_ec_sci_evt_control(dev, true) enable it, the handler could execute:

drivers/platform/arm64/qcom-hamoa-ec.c:qcom_ec_irq()
  -> qcom_ec_restore_fan_state()
    -> queues ec->fan_calib_work

The asynchronous workqueue function would then run:

drivers/platform/arm64/qcom-hamoa-ec.c:qcom_ec_fan_calib_work_fn() {
    ...
    ret =3D qcom_ec_fan_calibrate(ec, &ec->ec_cdev[i]);
    ...
}

If devm_kcalloc() hasn't yet allocated the ec->ec_cdev array later in
qcom_ec_probe(), couldn't this cause a null pointer dereference when
qcom_ec_fan_calibrate() accesses ec_cdev->parent_dev?

--=20
Sashiko AI review =C2=B7 https://sashiko.dev/#/patchset/20260728-ec_add_mor=
e_commands-v1-0-771abd65ee1a@oss.qualcomm.com?part=3D5
