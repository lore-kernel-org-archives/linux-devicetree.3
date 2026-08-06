Received: from smtp.kernel.org (aws-us-west-2-korg-mail-alma10-1.taild15c8.ts.net [100.103.45.18])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id E4BB734BA24
	for <devicetree@vger.kernel.org>; Thu,  6 Aug 2026 04:09:03 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=100.103.45.18
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1785989345; cv=none; b=J47Zaw9BQ/gQdEBY63vKI6IKCqbIDG9FtedXaPCONdgT8tTl68KG4OxWjkXpGm7lOLs5B2NmwzDVT7Izr99mAS81ZN3sVWEygzUVs/0383UHzyUzGiYf7A0jdkc4pw6284U123sjN8OFXtCHD2/tpTywHuFcxoAknxfgGla+U1w=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1785989345; c=relaxed/simple;
	bh=v393h4pX6K7Y1vBQ4qndTD4AqXlr+yLQjlyIXbBR9yc=;
	h=From:Subject:To:Cc:In-Reply-To:References:Content-Type:Date:
	 Message-Id; b=esdODqZpXYNMcTkxANc60oboMExVjj2o1cmLQwYryLibdxATxGbt5doC15NEuZg9HCqzZBMHGrIxZSBsStDWsKzglfwmPWpmAfpuNqK8K9YL9y2HZ2rsGbqkZhR+dXc8TNtSII6X35BQEqoEvwqFMOF1wsDxuFRgSACujCHAFZM=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=Aun1fzvU; arc=none smtp.client-ip=100.103.45.18
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="Aun1fzvU"
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 55EAC1F000E9;
	Thu,  6 Aug 2026 04:09:03 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kernel.org;
	s=k20260515; t=1785989343;
	bh=CqAiNLw6+gauEd+kTfquyhoRbVS1FVJhYDTFeKTBu1U=;
	h=From:Subject:Reply-To:To:Cc:In-Reply-To:References:Date;
	b=Aun1fzvUBXGAteT5cllDetJ1uEMRXrWPIXq5n3EeK7t51s814aIXL3egFDNc6fz8G
	 +Y86AMGWx8GBqgTlZbXH1BskNR3JoPPbQsglr9grQBl8kvc74hbizh9oFtsBSNt819
	 Mo4n+f/8jRbM40RS4o3TGq5hR8U9VxCUUW29ZtOpX5UKsHcvHuhUd9N5p/Ik1C+LPz
	 ntykGCs+pnJgVsp57qXnUmvOnQUJzDTuBYQ+vvrfDp2kqxMS0L5f6lfR0NOw68WSCt
	 +4Ixh+Kgr0e9lsIBNzBvKly0qFe61aPbKqyYPKhsiKec/tBFaend9myWEgXd9EG0QZ
	 XqbaR1SaTfRWQ==
From: sashiko-bot@kernel.org
Subject: Re: [PATCH v6 2/3] i2c: nt72676: Add Novatek NT72676 I2C controller
 driver
Reply-To: sashiko-reviews@lists.linux.dev
To: nina_kuo@novatek.com.tw
Cc: conor+dt@kernel.org, robh@kernel.org, devicetree@vger.kernel.org
In-Reply-To: <20260806035632.777782-3-nina_kuo@novatek.com.tw>
References: <20260806035632.777782-1-nina_kuo@novatek.com.tw>
 <20260806035632.777782-3-nina_kuo@novatek.com.tw>
Content-Type: text/plain; charset=utf-8
Content-Transfer-Encoding: quoted-printable
Date: Thu, 06 Aug 2026 04:09:02 +0000
Message-Id: <20260806040903.55EAC1F000E9@smtp.kernel.org>
Precedence: bulk
X-Mailing-List: devicetree@vger.kernel.org
List-Id: <devicetree.vger.kernel.org>
List-Subscribe: <mailto:devicetree+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:devicetree+unsubscribe@vger.kernel.org>

Thank you for your contribution! Sashiko AI review found 8 potential issue(=
s) to consider:
- [High] The driver incorrectly rejects or silently drops valid 2-message I=
2C transfers instead of falling back to standard sequential processing.
- [High] Dereferencing `i2c->comp_data` immediately after `of_device_get_ma=
tch_data()` crashes the kernel on non-Device-Tree platforms.
- [High] Operation flags and address bits in `I2C_REG_CTRL` are not cleared=
 between messages, corrupting multi-message transfers.
- [High] The driver requests a shared IRQ before initializing the hardware =
and performing the STBC ownership switch.
- [High] A timeout races with the ISR calling `complete()`, causing subsequ=
ent I2C transfers to falsely complete immediately.
- [High] Unprotected read-modify-write on `I2C_REG_INTR` in the ISR races w=
ith controller initialization, permanently disabling hardware interrupts.
- [Medium] Racy read-modify-write on shared syscon register.
- [Medium] The driver rejects 0-length messages but fails to advertise the =
`I2C_AQ_NO_ZERO_LEN` quirk.
--

--- Patch [2]: [PATCH v6 2/3] i2c: nt72676: Add Novatek NT72676 I2C control=
ler driver ---
commit d2fac04a827f176bd9abae1b40ac427895796aa5
Author: Ben Huang <Ben_Huang@novatek.com.tw>

    i2c: nt72676: Add Novatek NT72676 I2C controller driver
   =20
    This driver performs the fundamental read/write functions as an I2C
    controller and supports Standard-mode and Fast-mode.
    Default operation is Standard-mode.

> diff --git a/drivers/i2c/busses/i2c-nt72676.c b/drivers/i2c/busses/i2c-nt=
72676.c
> new file mode 100644
> index 0000000000000..b675097676805
> --- /dev/null
> +++ b/drivers/i2c/busses/i2c-nt72676.c
> @@ -0,0 +1,728 @@

[ ... ]

> +static int nvt_i2c_stbc_auth(struct nvt_i2c_bus *i2c)
> +{
> +	unsigned int val;
> +	int ret;
> +
> +	if (!i2c->comp_data->stbc_i2c)
> +		return 0;
> +
> +	ret =3D regmap_write(i2c->stbc_regmap, STBC_REG_PSWD, STBC_PSWD_DATA1);
> +	if (ret)
> +		return ret;
> +
> +	ret =3D regmap_write(i2c->stbc_regmap, STBC_REG_PSWD, STBC_PSWD_DATA2);
> +	if (ret)
> +		return ret;
> +
> +	ret =3D regmap_write(i2c->stbc_regmap, STBC_REG_KEYPASS, STBC_KEYPASS_E=
NABLE);
> +	if (ret)
> +		return ret;
> +
> +	ret =3D regmap_read(i2c->stbc_regmap, STBC_REG_I2C_SWITCH, &val);
> +	if (ret)
> +		return ret;
> +
> +	val |=3D STBC_AGPIO_SWITCH_TO_CPU;
> +	return regmap_write(i2c->stbc_regmap, STBC_REG_I2C_SWITCH, val);

[Severity: Medium]
Could a concurrent modification by another driver to this shared syscon
register be silently overwritten here? Should this use regmap_update_bits()
instead to ensure the read and write are atomic?

[ ... ]

> +static int nvt_i2c_init(struct nvt_i2c_bus *i2c)
> +{
> +	if (i2c->comp_data->stbc_i2c) {
> +		int ret =3D nvt_i2c_stbc_auth(i2c);
> +
> +		if (ret) {
> +			dev_err(i2c->dev, "[%s] STBC authentication failed, ret =3D %d\n",
> +				i2c->adapter.name, ret);
> +			return ret;
> +		}
> +	}
> +	nvt_i2c_set_clk(i2c);
> +	nt72676_i2c_writel(I2C_BUF_LITTLE_ENDIAN, i2c, I2C_REG_PINGPONG);
> +	nt72676_i2c_writel(I2C_IRQ_ENABLE_SETTING | I2C_IRQ_CLEAR_ALL,
> +			   i2c, I2C_REG_INTR);

[Severity: High]
Could writing the interrupt enable bits without holding i2c->lock race with
the ISR? If the ISR runs concurrently (since the IRQ is shared and requested
earlier), it could read the register before this write and write it back
afterward, permanently clearing the enable bits.

[ ... ]

> +static irqreturn_t nvt_i2c_isr(int irq, void *dev_id)
> +{
> +	struct nvt_i2c_bus *i2c =3D dev_id;
> +	unsigned int status, clr =3D 0;
> +	struct i2c_msg *msg;
> +	int do_complete =3D 0;
> +
> +	spin_lock(&i2c->lock);
> +	status =3D nt72676_i2c_readl(i2c, I2C_REG_INTR);
> +	/* IRQ from other I2C, ignored */
> +	if (!(status & I2C_IRQ_FLAG)) {
> +		spin_unlock(&i2c->lock);
> +		return IRQ_NONE;
> +	}
> +
> +	msg =3D i2c->current_msg;
> +	if (!msg) {
> +		status &=3D ~I2C_IRQ_FLAG;
> +		status |=3D I2C_IRQ_CLEAR_ALL;
> +		nt72676_i2c_writel(status, i2c, I2C_REG_INTR);
> +		spin_unlock(&i2c->lock);
> +		return IRQ_HANDLED;
> +	}

[ ... ]

> +	nt72676_i2c_writel(status | clr, i2c, I2C_REG_INTR);
> +	spin_unlock(&i2c->lock);
> +	if (do_complete)
> +		complete(&i2c->msg_complete);

[Severity: High]
Could this complete() call outside the spinlock race with the start of a
new transfer? If a previous transfer times out and cleans up, a delayed
interrupt might execute this and complete() right after reinit_completion()
is called for the next transfer, causing the new transfer to falsely succee=
d.

[ ... ]

> +static int nvt_i2c_check_msg(const struct i2c_msg *msg)
> +{
> +	if (!msg || !msg->buf || !msg->len || msg->len > MAX_MSG_SIZE)
> +		return -EINVAL;

[Severity: Medium]
Does rejecting 0-length messages here require setting I2C_AQ_NO_ZERO_LEN in
the adapter quirks? Standard I2C clients might expect 0-length messages to
work unless the quirk is explicitly advertised.

[ ... ]

> +static int nvt_i2c_write(struct nvt_i2c_bus *i2c, struct i2c_msg *msg)
> +{
> +	int ret, offset =3D 0, write_bytes, fifo_num;
> +	const unsigned char *buf =3D msg->buf;
> +	unsigned int ctrl_mask;
> +	unsigned long flags;

[ ... ]

> +	ctrl_mask =3D nt72676_i2c_readl(i2c, I2C_REG_CTRL);
> +	ctrl_mask |=3D (((msg->addr << 1) << 8) | I2C_ENABLE |
> +			I2C_CLOCK_DUTY_ENABLE | I2C_CLOCK_STRETCH_ENABLE |
> +			I2C_MASTER_CLK_STRETCH_ENABLE | I2C_TRIGGER);
> +	nt72676_i2c_writel(ctrl_mask, i2c, I2C_REG_CTRL);

[Severity: High]
Does this OR new flags into I2C_REG_CTRL without clearing previous flags or
addresses? In a multi-message transfer, could a read followed by a write
leave I2C_READ_OPERATION set, causing the write to execute as a read?

[ ... ]

> +static int nvt_i2c_read(struct nvt_i2c_bus *i2c, struct i2c_msg *msg)
> +{
> +	unsigned int ctrl_mask;
> +	unsigned long flags;
> +	int ret;

[ ... ]

> +	ctrl_mask =3D nt72676_i2c_readl(i2c, I2C_REG_CTRL);
> +	ctrl_mask |=3D (((msg->addr << 1) << 8) | I2C_ENABLE |
> +			I2C_REPEAT_ENABLE | I2C_READ_OPERATION |
> +			I2C_CLOCK_DUTY_ENABLE | I2C_CLOCK_STRETCH_ENABLE |
> +			I2C_MASTER_CLK_STRETCH_ENABLE | I2C_TRIGGER);
> +	nt72676_i2c_writel(ctrl_mask, i2c, I2C_REG_CTRL);

[Severity: High]
Similarly, does this need to mask out previous operation and address bits
from the register to prevent corruption from earlier messages?

[ ... ]

> +static int nvt_i2c_xfer(struct i2c_adapter *adap,
> +			struct i2c_msg msgs[],
> +			int num)
> +{
> +	struct nvt_i2c_bus *i2c =3D i2c_get_adapdata(adap);
> +	struct i2c_msg *msg =3D NULL;
> +	int ret =3D 0, i =3D 0;
> +
> +	nvt_i2c_ctrl_init(i2c);
> +
> +	if (num =3D=3D 2) {
> +		if (!nvt_i2c_set_subaddr(i2c, msgs, num))
> +			return -EOPNOTSUPP;
> +
> +		msg =3D &msgs[1];
> +		if (msg->flags & I2C_M_RD)

[Severity: High]
If nvt_i2c_set_subaddr() fails to match the hardware optimization criteria,
should this fall back to standard sequential processing instead of failing
the entire transfer with -EOPNOTSUPP?

Also, if msgs[0].len is 0, nvt_i2c_set_subaddr() returns true from its else
block. Does this cause the driver to silently skip processing msgs[0] and
only process msgs[1]?

[ ... ]

> +static int nvt_i2c_parse_dts(struct nvt_i2c_bus *i2c)
> +{
> +	struct device *dev =3D i2c->dev;
> +	struct device_node *np =3D dev->of_node;
> +	int ret;
> +
> +	i2c->comp_data =3D of_device_get_match_data(dev);
> +
> +	/* read DTS(novatek,stbc-syscon) for STBC I2C */
> +	if (i2c->comp_data->stbc_i2c) {

[Severity: High]
Since the driver depends on OF || COMPILE_TEST, it can be built and probed
without a Device Tree. If probed without DT, of_device_get_match_data()
will return NULL. Does dereferencing i2c->comp_data immediately here
cause a kernel crash on those platforms?

[ ... ]

> +static int nvt_i2c_probe(struct platform_device *pdev)
> +{
> +	struct nvt_i2c_bus *i2c;
> +	int ret;

[ ... ]

> +	ret =3D devm_request_irq(&pdev->dev, i2c->irq, nvt_i2c_isr,
> +			       IRQF_SHARED | IRQF_TRIGGER_HIGH, dev_name(&pdev->dev), i2c);
> +	if (ret)
> +		return dev_err_probe(&pdev->dev, ret, "[%s] devm_request_irq fail\n",
> +				     dev_name(&pdev->dev));
> +
> +	ret =3D nvt_i2c_init(i2c);

[Severity: High]
If the requested IRQ is shared and triggers immediately, the ISR will try
to read I2C_REG_INTR. For devices needing stbc_i2c, does accessing these
registers before nvt_i2c_init() switches hardware ownership to the CPU
result in a synchronous external abort or bus hang?

--=20
Sashiko AI review =C2=B7 https://sashiko.dev/#/patchset/20260806035632.7777=
82-1-nina_kuo@novatek.com.tw?part=3D2
