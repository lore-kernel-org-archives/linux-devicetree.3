Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=209.85.167.54
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1795638756;
	b=OSLlPpQWNyBy88/5tIvIe4eGGYEfbf8Sg06Un6XAEVyH13GJpl/RzcQMORppGeojXh0s
	 r7bD0kzqMBhTQWGMv+SiZ0HSn7wwSayhJtuAsChku9xx7OPFMlNQ4E+QjRa54F97Ww+Ue
	 3gWouOuhItEd3EU8nzY3DkbxrWjIkPDvkSJgpH70spnZyNGapsauT18xHF7h3XyirkKWB
	 Kdlp4pkE6NjfDbXJhawCSlaDeQ326bc+3DM39ypUYQlmOWnhT5ayIcdcApBLUGq4TqvYV
	 z1klQ8dalC1oo4IDkfEY5ofJQOCoQvX9sLPgafDyxUvZuZlM+zorZSHoSUw4ZK3xwCQ==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1795638756;
	h=DMARC-Filter:Received:DKIM-Signature:X-Google-DKIM-Signature:
	 X-Forwarded-Encrypted:X-Gm-Message-State:X-Gm-Gg:X-Received:Received:
	 Received:X-Forwarded-Encrypted:X-Received:MIME-Version:References:
	 In-Reply-To:From:Date:X-Gmail-Original-Message-ID:X-Gm-Features:
	 Message-ID:Subject:To:Cc:Content-Type;
	bh=mDhvBvovwpJTge71NdthCCdTa9trxCPJhLZ+RIaHARI=;
	b=E1qDbkNK4DtSi1UHix9O5mgKtotg0d2+G77lyg8QoT2kEv/rPFoleoH/nnsqzxEQy48K
	 kHWj3zEig0/9Dy9YRf+2WuZFxFne8pAmPsyZYWEWhwKwpRMOsDyVc6rXgcxpyYU0FlvKo
	 XDXewCKyN/wUiNS/ogDtreuNa2w2EXVtbqIjO7bZn4N3YjFbAtzKWVaUtEGWBnKChiJ1K
	 D/KFXT8XnxBJNJqOJM5bdK4sbACQX4GuWpGAVmHTqfIIJFBGwU2ZEmvf1e9DkHgT4/rdz
	 eaLfNQTEwqTTZyfl37xaWg9FfYSEvpKnC5O/LC+dElAov7dJ7pA2WCEoCjuKJoOXXuA==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=chromium.org;
	spf=pass smtp.mailfrom=chromium.org;
	dkim=pass header.d=chromium.org header.i=@chromium.org header.a=rsa-sha256 header.s=google header.b=jYfMT2QR;
	arc=none smtp.remote-ip=209.85.167.54
Received: from mail-lf1-f54.google.com (mail-lf1-f54.google.com [209.85.167.54])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 2480B606A31E
	for <devicetree@vger.kernel.org>; Wed, 25 Nov 2026 20:32:35 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org 2480B606A31E
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=chromium.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=chromium.org
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=chromium.org header.i=@chromium.org header.a=rsa-sha256 header.s=google header.b=jYfMT2QR
Received: by mail-lf1-f54.google.com with SMTP id 2adb3069b0e04-5c1479be604so4701227e87.1
        for <devicetree@vger.kernel.org>; Wed, 25 Nov 2026 12:32:35 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=chromium.org; s=google; t=1795638754; x=1796243554; darn=vger.kernel.org;
        h=content-type:cc:to:subject:message-id:date:from:in-reply-to
         :references:mime-version:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=mDhvBvovwpJTge71NdthCCdTa9trxCPJhLZ+RIaHARI=;
        b=jYfMT2QRXlsBwJleoGfUA9cSywsCCT50f6bBQEcfp9Y0Mzce7F22kXI2hLq52sL4J9
         QjXyfRqTufQR5gUA41TNhTcOOnTc9W8KdRqq2tya+sZZ5wndgZciK21HBXWNBfwa2j4a
         S+GgIqU1JqPa8Tu5HRmNX325vE4Xc5+eGUbuI=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1795638754; x=1796243554;
        h=content-type:cc:to:subject:message-id:date:from:in-reply-to
         :references:mime-version:x-gm-gg:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to:content-type;
        bh=mDhvBvovwpJTge71NdthCCdTa9trxCPJhLZ+RIaHARI=;
        b=R/d8cGmM3i7rAivwPGxcRbuBUkAn7guiGn0IK0avMpKN0lYENbPHyTZMXi9L/2Kufk
         I1CLlBbMVU9w3h4kAMCQWELHPJ3DcK2Q91EmUgqZ5nO9SOkOsBmxQL9xFLwz6yAV1X/j
         1Y08vncgfSZG7iWI3yx7bOs0T7eZF2VQcteLUUflF68zIQTy82uer61p94G014f0/MUW
         FrZ1k/PkcnB2/uaX1hyADu585FavKHQQJAQ0QL8jkevnDO2y0NehAsyEpJB5AjNP/CNv
         5IKKymssu/KXx6ta8jR9XwKL5FlFNAGZce4HAaT6v/He8yABAh5h7oilJILlVDribmxs
         imtw==
X-Forwarded-Encrypted: i=1; AL+hErF63ihAByVlb+87lkhWntEX7y5JDwThR6mqlaDFHLYKF7tBQnPy47ESPFHL1rMEXC8lxeWk+mfujSDJ@vger.kernel.org
X-Gm-Message-State: APuU4Z93W7RuGgVx1j38zrPIlPxIDHGP3WKu/WD4f0GFqyzlPfzO++tu
	4jDTpJj/q/gZJx84H8iF7tRhlhA9N8/d75j4QsOu4IHA/3OgZiyq5Hk4reUT14MnvXrSugC12ND
	mahEQKXKX
X-Gm-Gg: AZFdTZfx+8NChJobzC/xWaaWE77hVdFU5XK/LwlWkTa2mu7SUjxPNNFjlvcMzeV0SNe
	EricktE+6rujSHYfnAIMcaCXptqr5GaNP1adRubSW7HnRKp09g0Ab/cv4ia7vmx4mY4+96/BPWk
	EZVI1A2SfZCiOfH+E0NQwgx15TKAnzjbym/cMGRXOP/vZmzg5S59/pioF1BKxwdrftxmn/CNnYM
	A2ft+g36NYLP1vVwLwzo7uxyiRs9QpP4KWrE19CPRWW5ZZDbxPXAUxFOxBcmekYi/bKAihFsklP
	tvirF+eF0sU+YEwz+40BEKzQO4OE+8Iva20LEx1Kf5gp4PxgSw8snOax3S0jtbPFOLMW06wNUzd
	NrzxMJsDgO1kHT1wwOfLkzE2IMT4H6EHRV/rR6eVUmPcl6Aq545BYdsImGyvV2yDreUlKZ/uzS0
	FkAvpEDUeyxCKYOCq9BGzqFOuyeV7gEzJbNtAC4BTwPQcG0WmkeLf5Egq8/O0I/8XIUeKKtmob2
	7HX3+Z4gLURQC5uMiLRk5pCEIlXV6sjtGL5v5exl7ftawbaQAoes0zCzMNUfL8KK0Silp139B77
	qkISr9zfH9Fh3Kj21j2hUn6aS5JbPFAVv4LdmKmMDpTpzSviWq5joeWiuK3Z/iAI6ss6
X-Received: by 2002:a05:6512:31cd:b0:5c0:d78:ebb5 with SMTP id 2adb3069b0e04-5c1bc8a6154mr5409976e87.66.1795638754071;
        Wed, 25 Nov 2026 12:32:34 -0800 (PST)
Received: from mail-lf1-f42.google.com (mail-lf1-f42.google.com. [209.85.167.42])
        by smtp.gmail.com with ESMTPSA id 2adb3069b0e04-5c1bd0776edsm4973744e87.73.2026.11.25.12.32.33
        for <devicetree@vger.kernel.org>
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Wed, 25 Nov 2026 12:32:33 -0800 (PST)
Received: by mail-lf1-f42.google.com with SMTP id 2adb3069b0e04-5be3d5927ceso8283669e87.3
        for <devicetree@vger.kernel.org>; Wed, 25 Nov 2026 12:32:33 -0800 (PST)
X-Forwarded-Encrypted: i=1; AL+hErFEuKO9FDkQ2NdwIeOblh4IjbDO6BAT8vkFkxn/Ni2KYKUXG7n2oGhHyiPGmoQV2qOQq9tYWRBHdB/a@vger.kernel.org
X-Received: by 2002:a05:600c:8210:b0:4a2:1a:a116 with SMTP id
 5b1f17b1804b1-4bb887865b5mr380873225e9.0.1795638297387; Wed, 25 Nov 2026
 12:24:57 -0800 (PST)
X-Mailing-List: devicetree@vger.kernel.org
List-Id: <devicetree.vger.kernel.org>
List-Post: <mailto:devicetree@vger.kernel.org>
List-Help: <mailto:devicetree+help@vger.kernel.org>
List-Subscribe: <mailto:devicetree+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:devicetree+unsubscribe@vger.kernel.org>
List-Owner: <mailto:devicetree+owner@vger.kernel.org>
Precedence: list
MIME-Version: 1.0
References: <20261115180147.1208082-1-vamshigajjela@google.com> <20261115180147.1208082-3-vamshigajjela@google.com>
In-Reply-To: <20261115180147.1208082-3-vamshigajjela@google.com>
From: Doug Anderson <dianders@chromium.org>
Date: Wed, 25 Nov 2026 12:24:45 -0800
X-Gmail-Original-Message-ID: <CAD=FV=VJwuHaRhWGMHyPgudyB9ocdW8nzxYFdW5o+UKxn8x2RQ@mail.gmail.com>
X-Gm-Features: Aa3M54reZu_rV6EQr2mwr095PUCfeijuzUgiyBLvGVjyYCOWWagODc3ImgmqMIk
Message-ID: <CAD=FV=VJwuHaRhWGMHyPgudyB9ocdW8nzxYFdW5o+UKxn8x2RQ@mail.gmail.com>
Subject: Re: [PATCH v2 2/2] spmi: Add SmartDV SPMI controller driver
To: vamshi gajjela <vamshigajjela@google.com>
Cc: Stephen Boyd <sboyd@kernel.org>, Abel Vesa <abelvesa@kernel.org>, Rob Herring <robh@kernel.org>, 
	Krzysztof Kozlowski <krzk+dt@kernel.org>, Conor Dooley <conor+dt@kernel.org>, 
	=?UTF-8?Q?Uwe_Kleine=2DK=C3=B6nig?= <u.kleine-koenig@baylibre.com>, 
	Philipp Zabel <p.zabel@pengutronix.de>, Peter Griffin <peter.griffin@linaro.org>, 
	=?UTF-8?Q?Andr=C3=A9_Draszik?= <andre.draszik@linaro.org>, 
	Tudor Ambarus <tudor.ambarus@linaro.org>, Jim Wylder <jwylder@google.com>, 
	devicetree@vger.kernel.org, linux-arm-kernel@lists.infradead.org, 
	linux-kernel@vger.kernel.org, google-soc@lists.linux.dev
Content-Type: text/plain; charset="UTF-8"

Hi,

On Sun, Nov 15, 2026 at 10:01 AM vamshi gajjela
<vamshigajjela@google.com> wrote:
> diff --git a/drivers/spmi/Kconfig b/drivers/spmi/Kconfig
> index a80cf4047b86..e20fcc9f2c68 100644
> --- a/drivers/spmi/Kconfig
> +++ b/drivers/spmi/Kconfig
> @@ -54,4 +54,14 @@ config SPMI_MTK_PMIF
>    This is required for communicating with Mediatek PMICs and
>    other devices that have the SPMI interface.
>
> +config SPMI_SMARTDV
> + tristate "SmartDV Technologies SPMI Controller"
> + depends on HAS_IOMEM

Please add:

depends on ARCH_GOOGLE || COMPILE_TEST

Right now "google,lga-spmi" is the only compatible string supported,
and that matches how the other controller drivers in this Kconfig file
are scoped. When another SoC family is added later, its ARCH_* symbol
can be added here too.

> [...]
> diff --git a/drivers/spmi/spmi-smartdv.c b/drivers/spmi/spmi-smartdv.c
> new file mode 100644
> index 000000000000..d4671667596e
> --- /dev/null
> +++ b/drivers/spmi/spmi-smartdv.c
> [...]
> +/* SPMI controller CONTROL register bit masks */
> +#define SPMI_CONTROL_MASTER_EN BIT(0)
> +#define SPMI_CONTROL_ARB_ENABLE_MASK BIT(1)

nit: SPMI_CONTROL_MASTER_EN omits the _MASK suffix for a single BIT(),
whereas single-bit flags like SPMI_CONTROL_ARB_ENABLE_MASK,
SPMI_REQ_COMMAND_NEW_CMD_MASK, and SPMI_REQ_COMMAND_PRIMARY_ARB_MASK
keep _MASK. Dropping _MASK on single-bit BIT() definitions would be
more consistent.

> [...]
> +#define SPMI_IRQ_ARB_REQ_TIMER_TIMEOUT BIT(10)
> +#define SPMI_IRQ_IS_BOM BIT(11)
> +#define SPMI_IRQ_CONNECTED BIT(12)
> +
> +#define SPMI_ANY_ERROR_IRQ_FLAG \
> + ( \
> + SPMI_IRQ_ABORT_MST_CMD | \
> + SPMI_IRQ_READ_DATA_PAR_ERR | \
> + SPMI_IRQ_READ_NO_RESP_ERR | \
> + SPMI_IRQ_CMD_NACK_ERR | \
> + SPMI_IRQ_BUS_TIMEOUT | \
> + SPMI_IRQ_NO_BOM_CMD_PAR_ERR | \
> + SPMI_IRQ_NO_BOM_ADDR_LO_PAR_ERR | \
> + SPMI_IRQ_NO_BOM_WR_DATA_PAR_ERR \
> + )

SPMI_IRQ_ARB_REQ_TIMER_TIMEOUT is defined right above
SPMI_ANY_ERROR_IRQ_FLAG, but isn't included in it. Shouldn't an
arbitration request timer timeout also be treated as an error?

> [...]
> +#define REQ_COMMAND_TIMEOUT_MS 100
> +#define REQ_COMMAND_TIMEOUT_US (REQ_COMMAND_TIMEOUT_MS * USEC_PER_MSEC)
> +#define REQ_COMMAND_POLL_US 1

100 ms is a very long time to busy-poll with readl_poll_timeout_atomic()
while holding spin_lock_irqsave(). If a target stops responding or the
bus hangs, a CPU will sit with local interrupts disabled for 100 ms.

At 2.4 MHz SCL, even a full 16-byte SPMI transfer is under 100 us on
the wire, and other SPMI controller drivers (spmi-pmic-arb,
hisi-spmi-controller, spmi-mtk-pmif) use timeouts of 1 ms to 10 ms.
Can this be lowered to something in the 1-10 ms range?

> [...]
> +struct smartdv_spmi {
> + struct spmi_controller *ctrl;
> + struct device *dev;
> + void __iomem *base;
> + spinlock_t lock; /* Serialize bus access */
> + struct clk *i_clk;
> + struct reset_control *rst;
> + unsigned long clk_freq;
> + u32 ctrl_reg;
> +};

nit: ctrl, i_clk, rst, and clk_freq are never used after probe() (and
platform_set_drvdata() in smartdv_spmi_probe() has no corresponding
reader either). Keeping clk, rst, and clk_freq as locals during probe
would trim struct smartdv_spmi down to the fields actually used at
runtime.

> [...]
> +static int smartdv_spmi_wait_for_done(struct smartdv_spmi *sdrv, u32 *irq_status)
> +{
> + int ret;
> +
> + /* wait for cmd done status */
> + ret = readl_poll_timeout_atomic(sdrv->base + IRQ_STATUS, *irq_status,
> + (*irq_status & SPMI_IRQ_REQ_CMD_DONE) != 0,
> + REQ_COMMAND_POLL_US, REQ_COMMAND_TIMEOUT_US);
> + /* clear all interrupts */
> + smartdv_spmi_writel(sdrv, IRQ_STATUS, *irq_status);
> +
> + return ret;
> +}

Does the hardware guarantee that SPMI_IRQ_REQ_CMD_DONE is always set
even on fault conditions like SPMI_IRQ_ABORT_MST_CMD,
SPMI_IRQ_BUS_TIMEOUT, or SPMI_IRQ_ARB_REQ_TIMER_TIMEOUT? Or should the
poll condition check:

*irq_status & (SPMI_IRQ_REQ_CMD_DONE | SPMI_ANY_ERROR_IRQ_FLAG)

so that an error terminates the poll immediately rather than spinning
until timeout?

> +
> +static int smartdv_spmi_xfer(struct smartdv_spmi *sdrv,
> +     enum smartdv_spmi_xfer_type xfer_type,
> +     u8 opc, u8 sid, u16 saddr, size_t bc)
> +{
> + u32 irq_status;
> + u32 cmd = 0;
> + int ret;
> +
> + /* program control register, master enable */
> + smartdv_spmi_writel(sdrv, CONTROL, sdrv->ctrl_reg | SPMI_CONTROL_MASTER_EN);

Two questions/issues here:

1. IRQ_STATUS is never cleared in probe() or before writing REQ_COMMAND.
If an earlier boot stage left SPMI_IRQ_REQ_CMD_DONE latched, or if a
previous command timed out and finished on the bus right after
smartdv_spmi_wait_for_done() returned, the next transfer will see the
stale SPMI_IRQ_REQ_CMD_DONE bit immediately, read zeros out of
REQ_DATA0..3, and clear SPMI_CONTROL_MASTER_EN while the new frame is
still in flight. Clearing stale IRQ_STATUS bits before issuing
REQ_COMMAND (and after disabling MASTER_EN on timeout) would prevent
that.

2. Is there a hardware reason to toggle SPMI_CONTROL_MASTER_EN on and
off around every single transfer instead of enabling it once in probe()
(reprogramming CONTROL on resume if needed, and disabling via
devm_add_action_or_reset())?

> +
> + /* prepare req_command register */
> + cmd |= SPMI_REQ_COMMAND_NEW_CMD_MASK;
> + cmd |= SPMI_REQ_COMMAND_PRIMARY_ARB_MASK;
> + cmd |= FIELD_PREP(SPMI_REQ_COMMAND_OPCODE_MASK, opc);
> + cmd |= FIELD_PREP(SPMI_REQ_COMMAND_ADDR_MASK, sid);
> +
> + if (xfer_type != SMARTDV_SPMI_XFER_CMD) {
> + cmd |= FIELD_PREP(SPMI_REQ_COMMAND_BYTE_CNT_MASK, bc - 1);
> + cmd |= FIELD_PREP(SPMI_REQ_COMMAND_REQ_ADDR_MASK, saddr);
> + }
> +
> + /* request new command */
> + smartdv_spmi_writel(sdrv, REQ_COMMAND, cmd);
> +
> + ret = smartdv_spmi_wait_for_done(sdrv, &irq_status);
> + if (ret) {
> + dev_err(sdrv->dev, "request timeout.\n");
> + goto out;
> + }

nit: drop the trailing period in "request timeout.\n" to match the rest
of the driver, and consider logging sid, opc, saddr, and irq_status
here too like the error path below so it's clear which target timed
out.

> [...]
> +static int smartdv_spmi_read_cmd(struct spmi_controller *ctrl,
> + u8 opcode, u8 sid, u16 saddr, u8 *__buf, size_t bc)
> +{
> + struct smartdv_spmi *sdrv = spmi_controller_get_drvdata(ctrl);
> + unsigned long flags;
> + int ret;
> + u8 opc;
> +
> + switch (opcode) {
> + case SPMI_CMD_READ:
> + opc = SMARTDV_SPMI_CMD_REG_READ;
> + break;
> + case SPMI_CMD_EXT_READ:
> + opc = SMARTDV_SPMI_CMD_EXT_REG_READ;
> + break;
> + case SPMI_CMD_EXT_READL:
> + opc = SMARTDV_SPMI_CMD_EXT_REG_READ_L;
> + break;
> + default:
> + dev_err(&ctrl->dev, "invalid cmd %#x\n", opcode);
> + return -EINVAL;
> + }
> +
> + spin_lock_irqsave(&sdrv->lock, flags);
> +
> + /* clear req_data registers by writing zeros */
> + smartdv_spmi_clear_req_data_reg(sdrv);
> +
> + /* clear read status register */
> + smartdv_spmi_writel(sdrv, REQ_RD_STATUS, 0x0);

A few things in smartdv_spmi_read_cmd() (most apply to
smartdv_spmi_write_cmd() too):

1. Even though spmi-core currently bounds lengths to 1..16 in
spmi_ext_register_*(), REQ_DATA0..REQ_DATA3 is only 16 bytes and
REQ_RD_STATUS sits immediately at REQ_DATA3 + 4 (0x24), plus bc - 1
underflows if bc == 0. Please add a defensive bounds check (e.g.
!bc || bc > SMARTDV_SPMI_MAX_BYTES) in read_cmd and write_cmd like
spmi-pmic-arb, spmi-mtk-pmif, and hisi-spmi-controller do, so
smartdv_spmi_write_req_data() can never walk past REQ_DATA3 into
adjacent CSRs.

2. You clear REQ_RD_STATUS before a read, which is nice, but
smartdv_spmi_read_err_status_dump() also logs RD_ERR_INDEX. Should
RD_ERR_INDEX be cleared to 0 here too so an error dump doesn't report
stale bits from an earlier failed read?

3. nit: rename __buf to buf in both smartdv_spmi_read_cmd() and
smartdv_spmi_write_cmd() (there is no local buf variable shadowing it),
and consider guard(spinlock_irqsave)(&sdrv->lock) from
<linux/cleanup.h>.

4. nit: "invalid read cmd %#x\n" here to match "invalid write cmd %#x\n"
in smartdv_spmi_write_cmd().

> [...]
> +static int smartdv_spmi_init_clk_reset(struct smartdv_spmi *sdrv)
> +{
> + struct device *dev = sdrv->dev;
> +
> + sdrv->i_clk = devm_clk_get_enabled(dev, NULL);
> + if (IS_ERR(sdrv->i_clk))
> + return dev_err_probe(dev, PTR_ERR(sdrv->i_clk), "could not get i_clk\n");
> +
> + sdrv->clk_freq = clk_get_rate(sdrv->i_clk);
> + if (!sdrv->clk_freq)
> + return dev_err_probe(dev, -EINVAL, "i_clk rate not defined\n");
> +
> + sdrv->rst = devm_reset_control_get_exclusive_deasserted(dev, NULL);
> + if (IS_ERR(sdrv->rst))
> + return dev_err_probe(dev, PTR_ERR(sdrv->rst),
> +     "could not get and deassert reset\n");
> +
> + return 0;
> +}

1. The reset needs to be optional:

devm_reset_control_get_optional_exclusive_deasserted(dev, NULL);

I saw from the v1 review that resets was made required for v2, but on
Tensor G5 only the LSIO_E SPMI instance (0x3a1b0000, RST_LSIO_E_SPMI)
exposes a reset control to Linux. The CPM SPMI instance (0x053f1000,
connected to the MAX77779 PMIC) has its reset managed by CPM and has no
resets property, so probe() fails with -ENOENT there unless this is
optional.

2. Right now probe() fails if clk_get_rate() returns 0, yet
sdrv->clk_freq is never used for anything except a dev_dbg() print in
smartdv_spmi_pr_info(), while google_lga_spmi_cfg hardcodes
.prescaler = 4 below. That assumes i_clk is always 19.2 MHz (giving
2.4 MHz SCL), even though the LSIO_E SPMI instance is fed by a
CPM-managed clock (CLK_LSIO_E_SPMI) whose rate isn't hardcoded to
19.2 MHz. Wouldn't it be better to specify the target max bus frequency
(e.g. 2.4 MHz) in smartdv_spmi_config and compute prescaler from
clk_get_rate()? (Or if a fixed prescaler is really intended, please
don't fail probe() when clk_get_rate() returns 0.)

> +
> +static u32 smartdv_spmi_build_ctrl_reg(const struct smartdv_spmi_config *cfg)
> +{
> + return FIELD_PREP(SPMI_CONTROL_VERSION_MASK, cfg->spmi_version) |
> +       FIELD_PREP(SPMI_CONTROL_PRESCALER_MASK, cfg->prescaler);
> +}

In v1, DEFAULT_ARB_RETRY_LIMIT and DEFAULT_READ_LATENCY were both 32,
whereas v2 leaves SPMI_CONTROL_ARB_RETRY_LIMIT_MASK and
SPMI_CONTROL_RD_LATENCY_MASK as 0. Just want to double-check: is 0
intended for both fields on Tensor G5, or were those defaults dropped
accidentally when removing the v1 DT properties?

-Doug
