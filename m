Received: from smtp.kernel.org (aws-us-west-2-korg-mail-alma10-1.taild15c8.ts.net [100.103.45.18])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 961CF42AF94
	for <devicetree@vger.kernel.org>; Fri, 24 Jul 2026 10:23:35 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=100.103.45.18
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1784888618; cv=none; b=oWZsiZjDby9JfvDYHLbTrEDCxAYSJlFUu0VdpZ5r8L5SRNSm1ZGu8VYQoKP1TufkXdrZljM+EbpOdbuVBHBAQ7sEnpUcXw0DdLGikZnm0OYe/S7iCBFzqYN5PzEvUB7DIjZtAiR0gUDrkMTXJOKVLejPL/wbW2w5IwRXqul0HIE=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1784888618; c=relaxed/simple;
	bh=NQvncYehI4C6XD6BCEGvui27ogfc3lxFERX9XYtn3lo=;
	h=From:Subject:To:Cc:In-Reply-To:References:Content-Type:Date:
	 Message-Id; b=atJFvvRNbGV+7Z6sA7gJu4enQX4XgX5RpVgxnp2aFWiMfmpvFLHkmgw8Bc216zQZwpWwAwj6IgMI2CrVTTlgIG27ORs9v9e+OHXRpxEZmcAzLIkenEypH9s1X03NWG34NseA8k9+PK0Otuzomnbd7xlaI6x/WP6kAWikXZo/pE0=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=j75jOjZU; arc=none smtp.client-ip=100.103.45.18
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="j75jOjZU"
Received: by smtp.kernel.org (Postfix) with ESMTPSA id ABB391F00A3A;
	Fri, 24 Jul 2026 10:23:34 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kernel.org;
	s=k20260515; t=1784888615;
	bh=/lqvVLeN/FLmV8c1ryNByEmWSMehnjNIxFLgZLWcP0k=;
	h=From:Subject:Reply-To:To:Cc:In-Reply-To:References:Date;
	b=j75jOjZUkHQHDU9jsN1P7N6Cm95ukAG7eXNxFh+nyI1Iw9b6U+rki0swJat43NFYw
	 Ac6pJE5l0Z9sotqeI29bm4mLcdsB8i6Jm/BlGKNElCij/G+Tnw2GR+ivNlwuG64l0h
	 tIZetSYYrPMXZNX3cA93QAGuZlOTBCcOotSfBNriIaheCSoOpFNdoijWEgwg0IsILu
	 WS4c++vs9oociDfdLORXOzOyNcw5aQhspj+LDp5pn+wzY/QhjVgS+UYp7cWqcWHVR9
	 qeL8aENgCy182Rl+XdsrevTm7vpsqqZG9X7NHwK+mNfps0QiXQv28EfDMF7EDl4Ebt
	 d4S9vdHw2QktA==
From: sashiko-bot@kernel.org
Subject: Re: [PATCH v5 2/2] usb: typec: ucsi: Add ITE IT8851/IT8853 Type-C
 PD controller driver
Reply-To: sashiko-reviews@lists.linux.dev
To: "Amber Kao" <amber.kao@ite.com.tw>
Cc: robh@kernel.org, devicetree@vger.kernel.org, conor+dt@kernel.org
In-Reply-To: <20260724-ucsi-itepd-v5-2-d1a83e5c9c77@ite.com.tw>
References: <20260724-ucsi-itepd-v5-0-d1a83e5c9c77@ite.com.tw>
 <20260724-ucsi-itepd-v5-2-d1a83e5c9c77@ite.com.tw>
Content-Type: text/plain; charset=utf-8
Content-Transfer-Encoding: quoted-printable
Date: Fri, 24 Jul 2026 10:23:34 +0000
Message-Id: <20260724102334.ABB391F00A3A@smtp.kernel.org>
Precedence: bulk
X-Mailing-List: devicetree@vger.kernel.org
List-Id: <devicetree.vger.kernel.org>
List-Subscribe: <mailto:devicetree+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:devicetree+unsubscribe@vger.kernel.org>

Thank you for your contribution! Sashiko AI review found 3 potential issue(=
s) to consider:
- [High] Stack-allocated buffers are passed directly to `i2c_transfer`, vio=
lating DMA constraints.
- [High] Race condition during driver removal leads to a use-after-free of =
`ucsi->connector` due to improper teardown ordering.
- [High] Unhandled hardware interrupts or I2C read failures return IRQ_HAND=
LED, causing an interrupt storm.
--

--- Patch [2]: [PATCH v5 2/2] usb: typec: ucsi: Add ITE IT8851/IT8853 Type-=
C PD controller driver ---
commit e9bebde0ac95c5792e010b2c998820bde558bc90
Author: Amber Kao <amber.kao@ite.com.tw>

usb: typec: ucsi: Add ITE IT8851/IT8853 Type-C PD controller driver

This commit adds a UCSI driver for the ITE IT8851 and IT8853 I2C-based
USB Type-C Power Delivery controllers. The driver communicates with the
controller over an I2C interface and forwards UCSI events to the core.

> diff --git a/drivers/usb/typec/ucsi/ucsi_itepd.c b/drivers/usb/typec/ucsi=
/ucsi_itepd.c
> new file mode 100644
> index 0000000000000..b95f5f9b91228
> --- /dev/null
> +++ b/drivers/usb/typec/ucsi/ucsi_itepd.c
[ ... ]
> +static int itepd_read_reg(struct itepd *itepd, u8 reg, void *data, u32 l=
en)
> +{
> +	struct i2c_client *client =3D itepd->client;
> +	struct i2c_msg msg[2] =3D {
> +		{
> +			.addr	=3D client->addr,
> +			.flags	=3D 0,
> +			.len	=3D 1,
> +			.buf	=3D &reg,
> +		},

[Severity: High]
Does this code pass a stack-allocated buffer to the I2C subsystem?

The reg pointer and the data argument (which points to local stack variables
like event and le_cci in caller functions) are passed directly into the
i2c_msg array.=20

When i2c_transfer() passes these structures to the underlying I2C host
controller driver, it may map them for DMA. Since the stack is often
virtually mapped in the kernel (CONFIG_VMAP_STACK=3Dy), passing stack memory
to the DMA API causes mapping failures.=20

Depending on the platform, this can trigger kernel panics, DMA API debug
warnings, or silent memory corruption.

> +		{
> +			.addr	=3D client->addr,
> +			.flags	=3D I2C_M_RD,
> +			.len	=3D len,
> +			.buf	=3D data,
> +		}
> +
> +	};
> +	int ret;
[ ... ]
> +static int itepd_write_reg(struct itepd *itepd, u8 reg, const void *data=
, u32 len)
> +{
> +	struct i2c_client *client =3D itepd->client;
> +	u8 buf[sizeof(u64) + 1];
> +	struct i2c_msg msg[1] =3D {
> +		{
> +			.addr	=3D client->addr,
> +			.flags	=3D 0,
> +			.len	=3D len + 1,
> +			.buf	=3D buf,
> +		}

[Severity: High]
Similarly, buf is a local stack array used as the write buffer for
i2c_transfer().=20

Is it possible to allocate these buffers dynamically or use a pre-allocated
DMA-safe buffer in the itepd structure to avoid DMA mapping issues on stack
memory?

[ ... ]
> +static irqreturn_t itepd_irq_process(struct itepd *itepd)
> +{
> +	u32 cci;
> +	int ret;
> +
> +	ret =3D itepd_process_event(itepd, &cci);
> +	if (ret =3D=3D ITEPD_EVENT_NONE)
> +		return IRQ_NONE;
> +
> +	if (ret < 0)
> +		return IRQ_HANDLED;

[Severity: High]
Could this return value cause an interrupt storm if I2C communication fails?

If itepd_process_event() fails due to an I2C error, it propagates a negative
error code. At that point, the hardware interrupt source has not been
acknowledged or cleared via a write to the ITEPD_VENDOR_WC_INT register.

By returning IRQ_HANDLED, the handler falsely signals to the IRQ subsystem
that the interrupt was successfully processed. For a level-triggered interr=
upt,
this prevents the kernel's spurious interrupt detector from disabling the
unhandled IRQ, leading to an infinite interrupt loop that can starve the CP=
U.

Should this return IRQ_NONE on failure instead to allow the spurious IRQ
detector to properly mask it?

> +
> +	if (ret =3D=3D ITEPD_EVENT_UCSI)
> +		ucsi_notify_common(itepd->ucsi, cci);
> +
> +	return IRQ_HANDLED;
> +}
[ ... ]
> +static void itepd_remove(struct i2c_client *client)
> +{
> +	struct itepd *itepd =3D i2c_get_clientdata(client);
> +
> +	ucsi_unregister(itepd->ucsi);
> +	free_irq(client->irq, itepd);

[Severity: High]
Is there a race condition between tearing down the UCSI subsystem and freei=
ng
the interrupt?

ucsi_unregister() sends an asynchronous command to disable notifications and
frees the ucsi->connector array. Since free_irq() has not yet been called to
synchronize and disable the IRQ thread, itepd_irq_thread_fn() can run
concurrently.

If the interrupt fires after ucsi->connector is freed, the IRQ handler will
call ucsi_notify_common(), which reads the freed ucsi->connector array.=20

Should free_irq() be called before ucsi_unregister() to guarantee that no
interrupts are processed while the subsystem dismantles its structures?

> +	ucsi_destroy(itepd->ucsi);
> +}

--=20
Sashiko AI review =C2=B7 https://sashiko.dev/#/patchset/20260724-ucsi-itepd=
-v5-0-d1a83e5c9c77@ite.com.tw?part=3D2
