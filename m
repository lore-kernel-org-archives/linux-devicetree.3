Received: from smtp.kernel.org (aws-us-west-2-korg-mail-alma10-1.taild15c8.ts.net [100.103.45.18])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id DF4B11F4611
	for <devicetree@vger.kernel.org>; Sat,  8 Aug 2026 02:24:21 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=100.103.45.18
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1786155862; cv=none; b=AINJEdbum5YOaITQM93H8V9b9PqYCtXvhnJ7xcDqejfzxqjANQVMx8VGwpilUVfROqqbficR2ZQV3AS5wgjI2SqDjJrfq9VFSei3K+O2xYbJEj2Y56eMfF05eN2DnxkZwMdio9CB5oxU8F5oqb3QOzsZzlCKQJMLk+JjR+gyInE=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1786155862; c=relaxed/simple;
	bh=ckTNoaXwBh2mfZgQp8onl3cmEMdZD/2QnKNTxAyR/RY=;
	h=From:Subject:To:Cc:In-Reply-To:References:Content-Type:Date:
	 Message-Id; b=FlLY8H8K7Tw49fQ5Jmp5rq9dLRMswiF4zQbNd9kyB3psLE5jcZKpIlvfqo7OB8VhESmKpkl4n9Ai4tFIaF9KJpVxnOi/CqUXALdoGU+JCgMaijRcPT81Y7f+Dd+zbI9KU4YtOvDvxbaYIUg3SXYANCBR/cGs/3xvqC1ETFRUfYk=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=Uc/nSYOE; arc=none smtp.client-ip=100.103.45.18
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="Uc/nSYOE"
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 896231F00A3A;
	Sat,  8 Aug 2026 02:24:21 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kernel.org;
	s=k20260515; t=1786155861;
	bh=xxSscEfz/hFvohk5vcJI+zugiodKV+NxzQfDw5h2NfA=;
	h=From:Subject:Reply-To:To:Cc:In-Reply-To:References:Date;
	b=Uc/nSYOEf21DjlpVxfH0prsxOIe0/uDVHyD+6c0r1GishyLq0n+UNgzD/Zq0nxCeH
	 d3Sv/gDs1BV4n1I7+7xmx7uq0OKCZyJlx+P5nexyLP0cqgMo5MVHeiQUWXGAGoqFnc
	 5AS1fo74Pt84l5clrhhtfV32uk71iUEJHfU3XjsQleQi4Ls2REgbjmFC2FiMnX8pOM
	 Bb/fC0jxu03ZCowYF2oxxVyGvk7WZh9TCcxlHDWvbledGT2OiadVnOH7h2DGo6ssiX
	 d1kmbFWDXuIP5CGsrnPJncosmbADpG9lAuPbUF9UkgvLKKMpWR3CjBmQQVWONYpXT2
	 fuYEZd45oi6uA==
From: sashiko-bot@kernel.org
Subject: Re: [PATCH v4 4/6] nfc: s3fwrn5: enable the PVDD supply
Reply-To: sashiko-reviews@lists.linux.dev
To: "Jorijn van der Graaf" <jorijnvdgraaf@catcrafts.net>
Cc: conor+dt@kernel.org, devicetree@vger.kernel.org, robh@kernel.org
In-Reply-To: <20260807021001.239389-5-jorijnvdgraaf@catcrafts.net>
References: <20260807021001.239389-1-jorijnvdgraaf@catcrafts.net>
 <20260807021001.239389-5-jorijnvdgraaf@catcrafts.net>
Content-Type: text/plain; charset=utf-8
Content-Transfer-Encoding: quoted-printable
Date: Sat, 08 Aug 2026 02:24:21 +0000
Message-Id: <20260808022421.896231F00A3A@smtp.kernel.org>
Precedence: bulk
X-Mailing-List: devicetree@vger.kernel.org
List-Id: <devicetree.vger.kernel.org>
List-Subscribe: <mailto:devicetree+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:devicetree+unsubscribe@vger.kernel.org>

Thank you for your contribution! Sashiko AI review found 1 potential issue(=
s) to consider:

Pre-existing issues:
- [High] The NCI device is registered and exposed to userspace before its I=
RQ handler is requested, creating a race condition.
--

--- Patch [4]: [PATCH v4 4/6] nfc: s3fwrn5: enable the PVDD supply ---
commit 3e46e47e27236d4ca640efa94f0c2940f401ccd7
Author: Jorijn van der Graaf <jorijnvdgraaf@catcrafts.net>

nfc: s3fwrn5: enable the PVDD supply

This commit retrieves and enables the PVDD supply in the I2C PHY probe
function. This ensures the controller is powered before any of its pins
are driven or its clock is started.

> diff --git a/drivers/nfc/s3fwrn5/i2c.c b/drivers/nfc/s3fwrn5/i2c.c
> index c528c085b43ef..f93d8b47b65e3 100644
> --- a/drivers/nfc/s3fwrn5/i2c.c
> +++ b/drivers/nfc/s3fwrn5/i2c.c

[ ... ]

> @@ -158,6 +159,11 @@ static int s3fwrn5_i2c_probe(struct i2c_client *clie=
nt)
>  	phy->i2c_dev =3D client;
>  	i2c_set_clientdata(client, phy);
> =20
> +	ret =3D devm_regulator_get_enable(&client->dev, "pvdd");
> +	if (ret)
> +		return dev_err_probe(&client->dev, ret,
> +				     "failed to enable pvdd\n");
> +

[Severity: High]
This isn't a bug introduced by this patch, but does this function expose
the device to userspace before the IRQ handler is set up?

Looking further down in s3fwrn5_i2c_probe():

	ret =3D s3fwrn5_probe(&phy->common.ndev, phy, &phy->i2c_dev->dev,
			    &i2c_phy_ops, variant);
	if (ret < 0)
		return ret;

	ret =3D devm_request_threaded_irq(&client->dev, phy->i2c_dev->irq, NULL,
		s3fwrn5_i2c_irq_thread_fn, IRQF_ONESHOT,
		"s3fwrn5_i2c", phy);

If userspace (like udev or neard) immediately opens the NCI device and
starts sending commands after s3fwrn5_probe() returns, can the hardware
generate an interrupt that is missed because devm_request_threaded_irq()
has not been called yet?

--=20
Sashiko AI review =C2=B7 https://sashiko.dev/#/patchset/20260807021001.2393=
89-1-jorijnvdgraaf@catcrafts.net?part=3D4
