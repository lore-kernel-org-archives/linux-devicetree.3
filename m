Received: from smtp.kernel.org (aws-us-west-2-korg-mail-alma10-1.taild15c8.ts.net [100.103.45.18])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id C83C84028FA
	for <devicetree@vger.kernel.org>; Mon, 31 Aug 2026 12:32:35 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=100.103.45.18
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1788179557; cv=none; b=cqrX50JxB8G23AUnOeOLWE86xBRTvOMrQ4v43kuJT3Q633qrbpT5R4zrFqf7QIUy/wPJ3sGC5tgNK69M/FQV5tRlspxvikv2kGyL52tPhlzHs+2so9nc5cR+PvvnV7dLZcFkqNL3NJ/Y5fO7Zv5mtz9Gr31jZpfEuF0DIULghTU=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1788179557; c=relaxed/simple;
	bh=xCasVCC/JKR4p5177KuthM96Caf+jpEjhkT8MhJmu88=;
	h=From:Subject:To:Cc:In-Reply-To:References:Content-Type:Date:
	 Message-Id; b=iTscgbnOaxOuy6CytGmOV8vYMSBJ/Y3Z6Xg+Ip9cmTALyqFURd64nAMSvhmR/0BCR6VKBDjoBlNpsTCLGqpMkp0mQcWG0aAwgYF7l/+h4KQ9YLy3GqAJtwYe290y+R5ZZ1Ty3+zyCZVAYbThU8jftg3iyaIAL5QKKeRaEo/9rPw=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=M7G6+/tm; arc=none smtp.client-ip=100.103.45.18
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="M7G6+/tm"
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 466E81F00A3D;
	Mon, 31 Aug 2026 12:32:35 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kernel.org;
	s=k20260515; t=1788179555;
	bh=gusFBigGHLX98z+wiSTjvGRMt9TRdXJmwELWgBYf8MY=;
	h=From:Subject:Reply-To:To:Cc:In-Reply-To:References:Date;
	b=M7G6+/tmcGU3Suxf1G6e9cNIgk7Zedr/nQI5ESk/U2aFIb8EUFdzz4uuwS6AciOLU
	 xE9zSJpjHTRhrIrWLZv3rHuTu3A9blBvbTN69YHeuyuW2W7jOSQmCEosjxW20usQMF
	 Xox1nym7QweR9G0VMgXDSAGvoIgC3pkBVuiVTVEn2BBCIdi2Hgvtwxqx016w1uRLy8
	 7i/GZwW2xJCmYj9wSC4TEekKgy7336rJ8BWDqN/4akEDhsBmBAtWxQ94mxQVmBDxvZ
	 4DoYVAXw++U50hDEuJJF23k4cdPICEO5v8FJV29/nPcO1WHGeFBAqKkQ/pgmswL/Yu
	 4qxpiTIKEc3pQ==
From: sashiko-bot@kernel.org
Subject: Re: [PATCH v7 3/8] iio: accel: mma8452: Only apply trigger type
 when not set by firmware
Reply-To: sashiko-reviews@lists.linux.dev
To: "Esben Haabendal" <esben@geanix.com>
Cc: robh@kernel.org, conor+dt@kernel.org, devicetree@vger.kernel.org
In-Reply-To: <20260831-mma8452-open-drain-v7-3-22946812c928@geanix.com>
References: <20260831-mma8452-open-drain-v7-0-22946812c928@geanix.com>
 <20260831-mma8452-open-drain-v7-3-22946812c928@geanix.com>
Content-Type: text/plain; charset=utf-8
Content-Transfer-Encoding: quoted-printable
Date: Mon, 31 Aug 2026 12:32:34 +0000
Message-Id: <20260831123235.466E81F00A3D@smtp.kernel.org>
Precedence: bulk
X-Mailing-List: devicetree@vger.kernel.org
List-Id: <devicetree.vger.kernel.org>
List-Subscribe: <mailto:devicetree+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:devicetree+unsubscribe@vger.kernel.org>

Thank you for your contribution! Sashiko AI review found 2 potential issue(=
s) to consider:

New issues:
- [High] Hardware Configuration Mismatch for Interrupt Trigger Type

Pre-existing issues:
- [High] Unbalanced regulator disables and unpowered I2C access on driver r=
emove if runtime PM is suspended
--

commit 4e5790a8b828438ae278194b6cc6f95e4fa39c50
Author: Esben Haabendal <esben@geanix.com>

iio: accel: mma8452: Only apply trigger type when not set by firmware

Instead of unconditionally overriding the trigger type, it is better to
only apply a default when no trigger type is set by firmware. This should
be reasonably backward compatible, and should only potentially cause
problems if systems exist where firmware specifies an incorrect trigger typ=
e.

> diff --git a/drivers/iio/accel/mma8452.c b/drivers/iio/accel/mma8452.c
> index f645a5c6fd1c2..1fb43c5b0b72f 100644
> --- a/drivers/iio/accel/mma8452.c
> +++ b/drivers/iio/accel/mma8452.c
> @@ -1683,9 +1683,16 @@ static int mma8452_probe(struct i2c_client *client)
>  		goto trigger_cleanup;
> =20
>  	if (client->irq) {
> +		unsigned long irq_flags;
> +
> +		irq_flags =3D irq_get_trigger_type(client->irq);
> +		if (irq_flags =3D=3D IRQ_TYPE_NONE) {
> +			dev_info(dev, "invalid irq type, setting default active low\n");
> +			irq_flags =3D IRQF_TRIGGER_LOW;
> +		}
> +		irq_flags |=3D IRQF_ONESHOT;
>  		ret =3D request_threaded_irq(client->irq, NULL, mma8452_interrupt,
> -					   IRQF_TRIGGER_LOW | IRQF_ONESHOT,
> -					   client->name, indio_dev);

[Severity: High]
Does this code configure the sensor's hardware polarity to match the reques=
ted
trigger type?

If the firmware configures the interrupt with an active-high trigger (such =
as
IRQ_TYPE_LEVEL_HIGH), the patch reads this via irq_get_trigger_type() and
requests the interrupt from the host controller using this flag. However, t=
he
driver never sets the IPOL bit (Interrupt Polarity, bit 1 of CTRL_REG3) to
match this configuration.

Since the sensor remains in its default active-low state, can this hardware
configuration mismatch result in the interrupt signal going unrecognized or
causing an interrupt storm on systems with an active-high trigger?

While reviewing this, I also noticed a pre-existing issue in mma8452_remove=
():

drivers/iio/accel/mma8452.c:mma8452_remove() {
	...
	pm_runtime_disable(&client->dev);
	pm_runtime_set_suspended(&client->dev);

	if (client->irq)
		free_irq(client->irq, indio_dev);

	iio_triggered_buffer_cleanup(indio_dev);
	mma8452_trigger_cleanup(indio_dev);
	mma8452_standby(iio_priv(indio_dev));

	regulator_disable(data->vddio_reg);
	regulator_disable(data->vdd_reg);
}

[Severity: High]
This is a pre-existing issue, but can this cause a regulator enable count
underflow and I2C timeouts?

If the module is removed while the device is in a runtime-suspended state
(where mma8452_runtime_suspend() has already disabled both regulators),
mma8452_remove() calls pm_runtime_disable() which does not resume the devic=
e.

It then calls mma8452_standby(), which performs I2C writes to the unpowered
device, and unconditionally disables the regulators again, causing an under=
flow.

Is there a way to ensure the device is woken up or the regulator states are
checked before proceeding with removal?

--=20
Sashiko AI review =C2=B7 https://sashiko.dev/#/patchset/20260831-mma8452-op=
en-drain-v7-0-22946812c928@geanix.com?part=3D3
