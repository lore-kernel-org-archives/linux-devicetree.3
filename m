Received: from smtp.kernel.org (aws-us-west-2-korg-mail-alma10-1.taild15c8.ts.net [100.103.45.18])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 68D4C414A15
	for <devicetree@vger.kernel.org>; Tue,  4 Aug 2026 03:45:16 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=100.103.45.18
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1785815118; cv=none; b=IjYXE+zx6QH/0xGIl7OUQwqHF4V9UZmi8HX/vsEnvexY6SIM+SWg+onnA3PQQUyHxQvEZgYchwjIATL2QHCcIkS2RiUITW99StAnTxmPaJp+D6CUctX/PWF8ulwc/8j5dMpQ6iyFD8YXliSioSZ6oLmmBuU6BiV8sbYyc8IhWgc=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1785815118; c=relaxed/simple;
	bh=zR9TMie0YSeYvbLWPGq/CLqeJAHQ6Fsxd5QxN4F6QH4=;
	h=From:Subject:To:Cc:In-Reply-To:References:Content-Type:Date:
	 Message-Id; b=WuG0EG3MJrJYOuyn+3qUdkDH2mVGPW8tDqfM5RHLvfsnpa1OuKzRw26Qfc6zHynAdUWoacQoWWx19+85bF54aa/XtZ9g61uNYYRRUVDpXt6pkczVzr1Yapcq+o6VYpma9O2J6DLFFt0X1OX7U7n81Ei3kn22giv+y0INyr4bNT8=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=oRpIcE6h; arc=none smtp.client-ip=100.103.45.18
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="oRpIcE6h"
Received: by smtp.kernel.org (Postfix) with ESMTPSA id BF09C1F000E9;
	Tue,  4 Aug 2026 03:45:15 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kernel.org;
	s=k20260515; t=1785815116;
	bh=MdAmIo7hrhWzVQpZTF428Jx1BTLkaqe3SyxRaJhFqRI=;
	h=From:Subject:Reply-To:To:Cc:In-Reply-To:References:Date;
	b=oRpIcE6hCkLMG9xbh6/qcGReM61mXVodNHT3TruKceVRK/xKGPMpW4NfecoTLiURh
	 16Sb0krM/GU7frpOTtdrw0ChfhI2HnH+aLJo2Ui2kkdAI+m8DTR5+ZygHxK4JGXTj9
	 +j63OuKQWnrkgoR6Idr2BmT8qnPztAOgkX3bAGrgcuHfUwMYdOXz3gYgFkwDq8rfVt
	 /N9/MlfENq+SNJCwpcejpcmrMo5JXh7TjyU88IetAbqRfyHTxUR17LIgeN78X31Zz9
	 4BeC8xoqB1NjPTnMaIa/eCDlAVQhe30IgOND+Ph5wVgdPpM1+1qMO5MuAY1hNttDDA
	 rx40LYi/b4nfg==
From: sashiko-bot@kernel.org
Subject: Re: [PATCH v5 2/3] i2c: nt72676: Add Novatek NT72676 I2C controller
 driver
Reply-To: sashiko-reviews@lists.linux.dev
To: nina_kuo@novatek.com.tw
Cc: conor+dt@kernel.org, robh@kernel.org, devicetree@vger.kernel.org
In-Reply-To: <20260804033419.693819-3-nina_kuo@novatek.com.tw>
References: <20260804033419.693819-1-nina_kuo@novatek.com.tw>
 <20260804033419.693819-3-nina_kuo@novatek.com.tw>
Content-Type: text/plain; charset=utf-8
Content-Transfer-Encoding: quoted-printable
Date: Tue, 04 Aug 2026 03:45:15 +0000
Message-Id: <20260804034515.BF09C1F000E9@smtp.kernel.org>
Precedence: bulk
X-Mailing-List: devicetree@vger.kernel.org
List-Id: <devicetree.vger.kernel.org>
List-Subscribe: <mailto:devicetree+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:devicetree+unsubscribe@vger.kernel.org>

Thank you for your contribution! Sashiko AI review found 6 potential issue(=
s) to consider:
- [High] The driver unconditionally treats the first message of any 2-messa=
ge transfer as a subaddress write, silently dropping it or misinterpreting =
read operations.
- [High] The interrupt handler returns IRQ_NONE without clearing the hardwa=
re interrupt if current_msg is NULL, causing an interrupt storm.
- [High] Lack of synchronization between the I2C transfer timeout path and =
the interrupt handler leads to a use-after-free of the message buffer.
- [High] The I2C controller hardware is disabled before unregistering the a=
dapter, breaking concurrent ongoing transfers and client device removal.
- [High] The ISR fails to handle the enabled CLK_STR_TIMEOUT interrupt, lea=
ving it asserted and causing an interrupt storm.
- [Medium] Hardware interrupts are left enabled if `i2c_add_adapter` fails =
during probe.
--

--- Patch [2]: [PATCH v5 2/3] i2c: nt72676: Add Novatek NT72676 I2C control=
ler driver ---
commit 2546eac52465a246476611598e7130d303e3cc7f
Author: Ben Huang <Ben_Huang@novatek.com.tw>

i2c: nt72676: Add Novatek NT72676 I2C controller driver
   =20
This driver performs the fundamental read/write functions as an I2C
controller and supports Standard-mode and Fast-mode.
Default operation is Standard-mode.

> diff --git a/drivers/i2c/busses/i2c-nt72676.c b/drivers/i2c/busses/i2c-nt=
72676.c
> new file mode 100644
> index 0000000000000..48750b02537fb
> --- /dev/null
> +++ b/drivers/i2c/busses/i2c-nt72676.c

[ ... ]

> +static irqreturn_t nvt_i2c_isr(int irq, void *dev_id)
> +{
> +	struct nvt_i2c_bus *i2c =3D dev_id;
> +	struct i2c_msg *msg =3D i2c->current_msg;
> +	unsigned int status =3D nt72676_i2c_readl(i2c, I2C_REG_INTR);
> +	unsigned int clr =3D 0;
> +	int do_complete =3D 0;
> +
> +	if (!(status & I2C_IRQ_FLAG) || !i2c->current_msg)
> +		return IRQ_NONE;

[Severity: High]
Could this early return cause an interrupt storm if a spurious interrupt
fires, or if current_msg is NULL after a timeout? Since it returns
IRQ_NONE without writing to the clear register, the level-triggered
hardware interrupt might remain asserted indefinitely.

> +
> +	if (status & I2C_IRQ_NACK) {
> +		i2c->error_code =3D -ENXIO;
> +		clr |=3D I2C_IRQ_NACK << 8;
> +	} else if (status & I2C_IRQ_RX_FULL) {

[Severity: High]
What happens if the hardware asserts I2C_IRQ_CLK_STR_TIMEOUT? The
I2C_IRQ_ENABLE_SETTING macro enables this interrupt (bit 12), but it is
omitted from this if/else chain. Does this mean it won't be added to
the clr variable, leaving it asserted and causing an interrupt storm?

> +		if (i2c->remaining > 0)
> +			nvt_i2c_handle(i2c, msg, true);
> +		clr |=3D I2C_IRQ_RX_FULL << 8;
> +	} else if (status & I2C_IRQ_TX_EMPTY) {

[ ... ]

> +static int nvt_i2c_write(struct nvt_i2c_bus *i2c, struct i2c_msg *msg)
> +{

[ ... ]

> +	ret =3D wait_for_completion_timeout(&i2c->msg_complete, i2c->adapter.ti=
meout);
> +	if (ret =3D=3D 0) {
> +		i2c->error_code =3D -ETIMEDOUT;
> +		nvt_i2c_reset(i2c);
> +	}
> +	if (i2c->error_code)
> +		dev_err(i2c->dev, "[%s]: write failed (err:%d); SA[0x%X]\n",
> +			i2c->adapter.name, i2c->error_code, msg->addr);
> +
> +	i2c->current_msg =3D NULL;

[Severity: High]
Can the timeout path race with the interrupt handler here? If the transfer
times out, current_msg is set to NULL and the function returns, leading the
caller to free the message buffer. If the ISR executes concurrently on anot=
her
CPU, could it access the freed buffer via current_msg before it gets fully
nullified, causing a use-after-free?

> +
> +	return i2c->error_code;
> +}

[ ... ]

> +static int nvt_i2c_xfer(struct i2c_adapter *adap,
> +			struct i2c_msg msgs[],
> +			int num)
> +{
> +	struct nvt_i2c_bus *i2c =3D i2c_get_adapdata(adap);
> +	int ret =3D 0, i =3D 0;
> +	struct i2c_msg *msg =3D NULL;
> +
> +	nvt_i2c_ctrl_init(i2c);
> +
> +	if (num =3D=3D 2) {
> +		nvt_i2c_set_subaddr(i2c, &msgs[0]);
> +		msg =3D &msgs[1];

[Severity: High]
Is it correct to unconditionally treat the first message of any 2-message
transfer as a subaddress write? If a user-space caller sends a 2-message ar=
ray
where the first message is a read, has a length > 4, or targets a different
device address, won't this silently drop or misinterpret the first message =
and
only execute the second one?

> +
> +		if (msg->flags & I2C_M_RD)
> +			ret =3D nvt_i2c_read(i2c, msg);
> +		else
> +			ret =3D nvt_i2c_write(i2c, msg);
> +	} else {

[ ... ]

> +static int nvt_i2c_probe(struct platform_device *pdev)
> +{

[ ... ]

> +	ret =3D nvt_i2c_init(i2c);
> +	if (ret)
> +		return ret;
> +
> +	/* Setup I2C adapter */
> +	i2c->adapter.owner =3D THIS_MODULE;
> +	i2c->adapter.algo =3D &nvt_i2c_algo;
> +	i2c->adapter.dev.of_node =3D pdev->dev.of_node;
> +	i2c->adapter.dev.parent =3D &pdev->dev;
> +	i2c->adapter.timeout =3D 3 * HZ;
> +	strscpy(i2c->adapter.name, dev_name(&pdev->dev), sizeof(i2c->adapter.na=
me));
> +	i2c_set_adapdata(&i2c->adapter, i2c);
> +
> +	ret =3D i2c_add_adapter(&i2c->adapter);
> +	if (ret)
> +		return dev_err_probe(&pdev->dev, ret, "Failed to add adapter\n");

[Severity: Medium]
Does this error path need to disable the hardware interrupts that were
enabled earlier in nvt_i2c_init()? Returning directly might leave
interrupts enabled on a shared IRQ line.

> +
> +	platform_set_drvdata(pdev, i2c);
> +
> +	return 0;
> +}
> +
> +static void nvt_i2c_remove(struct platform_device *pdev)
> +{
> +	struct nvt_i2c_bus *i2c =3D platform_get_drvdata(pdev);
> +
> +	nt72676_i2c_writel(I2C_IRQ_DISABLE_SETTING, i2c, I2C_REG_INTR);
> +	nt72676_i2c_writel(nt72676_i2c_readl(i2c, I2C_REG_CTRL) & ~I2C_ENABLE,
> +			   i2c, I2C_REG_CTRL);
> +	i2c_del_adapter(&i2c->adapter);

[Severity: High]
Should the adapter be deleted before disabling the I2C controller hardware?
Disabling interrupts and clocks first could break concurrent ongoing
transfers or client device removal operations that happen during
i2c_del_adapter().

> +}

--=20
Sashiko AI review =C2=B7 https://sashiko.dev/#/patchset/20260804033419.6938=
19-1-nina_kuo@novatek.com.tw?part=3D2
