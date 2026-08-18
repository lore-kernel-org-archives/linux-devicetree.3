Received: from smtp.kernel.org (aws-us-west-2-korg-mail-alma10-1.taild15c8.ts.net [100.103.45.18])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id D3231246762
	for <devicetree@vger.kernel.org>; Tue, 18 Aug 2026 18:46:46 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=100.103.45.18
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1787078808; cv=none; b=kg6e+qWSX6FUJIdmuCyW2ILdQjwtuAIJyIe7KYwoc41bn1ORTBWTsjP5YLma9FXZaof5zVLktiZbvnIO99XgczqWRkR3apv3lucE6ZQYFIH14FwgrjLEsdzhGvuFe2/1QAAZIFvaEMMyjVXwO0HvG7uAn2q9d/uIVncdf/zIQXk=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1787078808; c=relaxed/simple;
	bh=KOzwp38oqixUmy97Ip6Fg/h13AcLsJCyRpbfRAYmmwY=;
	h=From:Subject:To:Cc:In-Reply-To:References:Content-Type:Date:
	 Message-Id; b=NPeXY8h0kdSBKnHc5+RbE2+QuEYHxzL6VF9gVrrWZ4SqcMsBna2IDkrFh2+y0ZRclT91Nd90zYzVCZIxagBxu9totZDea/J9crzX/9M+zhsycqX6QYUxESQ+/PyG03V8XgDhxyLJYVaRMgLQlxNdJ53z/P0uqUnMHoHX+KfmzKg=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=hlqo+Yz+; arc=none smtp.client-ip=100.103.45.18
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="hlqo+Yz+"
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 944C61F000E9;
	Tue, 18 Aug 2026 18:46:46 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kernel.org;
	s=k20260515; t=1787078806;
	bh=5DDC/9DiqF0lw9j8KvUXvCXQQrC9Mbo/rimKIgsLlTY=;
	h=From:Subject:Reply-To:To:Cc:In-Reply-To:References:Date;
	b=hlqo+Yz+v8rqEp3p9K12dhzWIO6V39cP6dl1Es1r6GutiQigtagIiXJdsXbQZQFpx
	 /xS6v7gQSOJxzcNQnfIJHQiAV+NYXfAPujAUUaLeNT2iofbW6sE3UnWkBYATcyB0zr
	 94gcpVcG/RtcSl61ivuH8w0zzc0uclUcz/QjxeLBipDIN3V2My+m+PVRIm+G8JY0nt
	 vjdXLsWH1uE535ZfbENirjkygcIMeSjscslz65L+SbkGGTPoUMKRA0/KeO8CbvvLZA
	 RmH+6LfvnnFMGTnVY23Qvxk27esXuzgNvbhBg1GkERTO9gOVcUGlbUNkMSPjzrBQNu
	 aFe3352KtrjuQ==
From: sashiko-bot@kernel.org
Subject: Re: [PATCH v7 6/6] spmi: apple: Add interrupt functionality
Reply-To: sashiko-reviews@lists.linux.dev
To: "Sasha Finkelstein" <k@chaosmail.tech>
Cc: robh@kernel.org, conor+dt@kernel.org, devicetree@vger.kernel.org
In-Reply-To: <20260818-t603x-spmi-v7-6-dafebe6e7739@chaosmail.tech>
References: <20260818-t603x-spmi-v7-0-dafebe6e7739@chaosmail.tech>
 <20260818-t603x-spmi-v7-6-dafebe6e7739@chaosmail.tech>
Content-Type: text/plain; charset=utf-8
Content-Transfer-Encoding: quoted-printable
Date: Tue, 18 Aug 2026 18:46:46 +0000
Message-Id: <20260818184646.944C61F000E9@smtp.kernel.org>
Precedence: bulk
X-Mailing-List: devicetree@vger.kernel.org
List-Id: <devicetree.vger.kernel.org>
List-Subscribe: <mailto:devicetree+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:devicetree+unsubscribe@vger.kernel.org>

Thank you for your contribution! Sashiko AI review found 3 potential issue(=
s) to consider:
- [High] Spurious completions during timeout recovery cause subsequent comm=
ands to fail with -EIO.
- [High] Using a 64-bit `readq` on a 32-bit peripheral register array cause=
s a bus fault (SError) on Apple SoCs.
- [Medium] Incorrect use of register accessors (`writel`/`readl`) with `mem=
cpy()` for FIFO access causes byte reversal on big-endian architectures.
--

--- Patch [6]: [PATCH v7 6/6] spmi: apple: Add interrupt functionality ---
commit ed584cbe528c0915b9974fbcae3310e9b639b962
Author: Alba Mendez <me@alba.sh>

spmi: apple: Add interrupt functionality

Add support for interrupts sent by slave devices and use IRQ for
RX FIFO if possible, as that IRQ fires as soon as the reply is
available, which is usually takes a few us instead of the 10ms sleep
interval for polling.

> diff --git a/drivers/spmi/spmi-apple-controller.c b/drivers/spmi/spmi-app=
le-controller.c
> index fabccd25aa0da..2390174452ab4 100644
> --- a/drivers/spmi/spmi-apple-controller.c
> +++ b/drivers/spmi/spmi-apple-controller.c

[ ... ]

> @@ -84,8 +165,10 @@ static int spmi_raw_cmd(struct spmi_controller *ctrl,=
 u8 opc, u8 sid, u16 param,
> =20
>  	if (spmi->prev_fail) {
>  		writel(SPMI_ACT_FIFO_FLUSH, spmi->regs + SPMI_ACT_REG);
> +		apple_spmi_irq_ack_raw(spmi, SPMI_IRQ_NOTIFY);
>  		spmi->prev_fail =3D false;
>  	}
> +	reinit_completion(&spmi->fifo_rx);
> =20
>  	writel(spmi_cmd, spmi->regs + SPMI_CMD_REG);

[Severity: High]
Can a delayed interrupt cause spurious completions here?

If a previous command times out, apple_spmi_wait_rx_not_empty() returns
-ETIMEDOUT and sets prev_fail =3D true.

On the next command, spmi_raw_cmd() executes the recovery path and then cal=
ls
reinit_completion(). If a delayed interrupt arrives concurrently and the
IRQ handler calls complete() after reinit_completion() has executed, the ne=
xt
command's wait_for_completion_timeout() could return immediately before the
actual reply is ready. This would lead to an -EIO failure.

Does the recovery path need to synchronize with the IRQ handler to prevent
this?

[Severity: Medium]
Does using writel() and readl() with memcpy() later in this function cause
byte reversal on big-endian architectures?

When spmi_raw_cmd() handles payload data:

drivers/spmi/spmi-apple-controller.c:spmi_raw_cmd() {
    ...
    while (i < len_wr) {
        j =3D min_t(size_t, sizeof(spmi_cmd), len_wr - i);
        spmi_cmd =3D 0;
        memcpy(&spmi_cmd, buf_wr + i, j);
        writel(spmi_cmd, spmi->regs + SPMI_CMD_REG);
        i +=3D j;
    }
    ...
}

Using memcpy() to copy data to or from a u32 variable followed by writel()
or readl() causes implicit byte-swapping on big-endian CPUs. While Apple
SoCs run in little-endian mode, this could corrupt data during SPMI transfe=
rs
if the driver is compiled and run on a big-endian system (e.g., during
COMPILE_TEST).

Should this use stream-oriented accessors like writesl() and readsl() to
ensure consistent endianness?

[ ... ]

> +static void apple_spmi_irq_handler(struct irq_desc *desc)
> +{
> +	struct apple_spmi *spmi =3D irq_desc_get_handler_data(desc);
> +	struct irq_chip *chip =3D irq_desc_get_chip(desc);
> +	bool handled =3D false;
> +	unsigned long val, offset, bit;
> +
> +	chained_irq_enter(chip, desc);
> +	val =3D readl(spmi->regs + SPMI_IRQ_ACK_BASE + (SPMI_IRQ_NOTIFY / 32) *=
 4);
> +	if (val & BIT(SPMI_IRQ_NOTIFY % 32)) {
> +		apple_spmi_irq_ack_raw(spmi, SPMI_IRQ_NOTIFY);
> +		complete(&spmi->fifo_rx);
> +		handled =3D true;
> +	}
> +
> +	for (offset =3D 0; offset < SPMI_NUM_PERIPHERAL_IRQS / 8; offset +=3D s=
izeof(val)) {
> +		val =3D readq(spmi->regs + SPMI_IRQ_ACK_BASE + offset);

[Severity: High]
Does reading a 32-bit peripheral register using a 64-bit readq() cause a bus
fault on Apple SoCs?

Apple SoC peripheral fabrics strictly enforce MMIO access widths. Issuing a
64-bit read to the 32-bit SPMI_IRQ_ACK_BASE registers generates a Synchrono=
us
External Abort (SError), resulting in a kernel panic when a peripheral
interrupt fires.

--=20
Sashiko AI review =C2=B7 https://sashiko.dev/#/patchset/20260818-t603x-spmi=
-v7-0-dafebe6e7739@chaosmail.tech?part=3D6
