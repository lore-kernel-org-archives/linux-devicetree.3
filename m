Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=100.103.45.18
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1795480843;
	b=TDYANPE/u0GmvOZggkYSTRQZ8sF+h4x8QRhEiGUroxhR1oDsXWzmuzysOPFpDYWWcZ35
	 FrVXqIVh80K9Q6Mdu6uXGPL9O5Ap/09A5QHuCU121W9CB3H4gw7jLWymd2rMN333Fa22Q
	 k3LDXfe/enWN0FhU9k/ksuvoZJGWCS/dJp0Ya26J0WwuOm3+7aCRYcomsPG+uA810fvh2
	 WkJhhnKpb20tU6gyk2P2VG/7DCw9L6MPZ3Zbh4TRZ8Zm062irJ+TLJ5NkGqCf2XUUpnBw
	 pJxd58+eWNz3HB+HzeLOEv2X1wXsFhB9aASPlWWFJeaRReOcDJmMEMk42DiRaGcfKlw==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1795480843;
	h=Received:DKIM-Signature:Subject:From:To:Cc:Date:Message-ID:
	 In-Reply-To:References:X-sashiko-severity:Content-Type:
	 Content-Transfer-Encoding:MIME-Version;
	bh=VDnPQ8ZznQPrOMKAfbknlPeRdMBTvRLr+XXDkT7qBJQ=;
	b=AX4eac8PZVcptBK1pjPsCCVDlRSg5mCyZLQ9tnMwAN57pSPFD5GL+5LiRkAOrD8aKdo4
	 2qwnSKK7sZGCW4iWRM0PVQDYWYObKf+rmQUQaV39p4b5LpkaCgVNjvrvkzAnf+YZaVC3d
	 9seBIIztB0uegDX2wib5lp+whyQVYs+SdnY3jF2z/56tFiuPEhSUhn+I7ajrmRpbnAAXk
	 L6AjAebktMveQiHZaxI1WhKo5M6eV9eWFC16DncQD8vTFck0B7FqmlQUUpgPpYkRVd5HT
	 QTsyM43sM2GcF95E0Z9h0vIk8tM8D4w181XBhnex+WPJ2qHJhuZggAXnz/+LkLjDKNA==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dkim=pass header.d=kernel.org header.i=@kernel.org header.a=rsa-sha256 header.s=k20260515 header.b=GKtHyfyu;
	arc=none smtp.remote-ip=100.103.45.18
Received: from smtp.kernel.org (quasi.space.kernel.org [100.103.45.18])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 9E02A606A680;
	Tue, 24 Nov 2026 00:40:43 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.a=rsa-sha256 header.s=k20260515 header.b=GKtHyfyu
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 814BA1F00A19;
	Tue, 24 Nov 2026 00:40:42 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kernel.org;
	s=k20260515; t=1795480843;
	bh=VDnPQ8ZznQPrOMKAfbknlPeRdMBTvRLr+XXDkT7qBJQ=;
	h=Subject:From:To:Cc:Date:In-Reply-To:References;
	b=GKtHyfyuW3/2cAE/oHCjD5YmJLpjcApS5mHj9DIStZViZE/vqNk2n851dQfa6QKyS
	 0wuYzqdE/BBFrWj8BlcIDo3yk4cylf0HRaCVJpy+ggtm6bLi4EaN/jGpcB3LRFo9L+
	 nLN0NXDIKCEkX4OpGb5avyiyuIXhrYEnq6CrrlR+ENp5QoDUbtygKoeBVAxqKXsIqx
	 2pdAVihZOSquBLJk7DFrnuLgS+g9ocHzJfvNUkrVFNNoxr3FKlby8EqclvhBqU6SOV
	 bstmmZBM42APpnPXfJegcGTXOEi4OVn4SD7GPuNLH8XNRxLA9BRw0XzWYdSiZT0V/u
	 wlv4UKBUy19Dg==
Subject:
 Re: [PATCH net-next v16 06/13] dpll: sit9531x: register DPLL devices and pins
From: netdev-bot+sashiko@kernel.org
To: arouhi@sitime.com
Cc: jiri@resnulli.us, vadim.fedorenko@linux.dev,
 arkadiusz.kubalewski@intel.com, ivecera@redhat.com, kuba@kernel.org,
 pabeni@redhat.com, robh@kernel.org, krzk+dt@kernel.org, conor+dt@kernel.org,
 cjubran@nvidia.com, Oleg.Zadorozhnyi@devoxsoftware.com,
 prabhakar.mahadev-lad.rj@bp.renesas.com, devicetree@vger.kernel.org,
 netdev@vger.kernel.org, linux-kernel@vger.kernel.org
Date: Tue, 24 Nov 2026 00:40:42 +0000
Message-ID: <179548084210.3135.16370816331062292914@kernel.org>
In-Reply-To: <20261119225752.41846-7-arouhi@sitime.com>
References: <20261119225752.41846-7-arouhi@sitime.com>
X-sashiko-severity: Medium
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 8bit
X-Mailing-List: devicetree@vger.kernel.org
List-Id: <devicetree.vger.kernel.org>
List-Post: <mailto:devicetree@vger.kernel.org>
List-Help: <mailto:devicetree+help@vger.kernel.org>
List-Subscribe: <mailto:devicetree+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:devicetree+unsubscribe@vger.kernel.org>
List-Owner: <mailto:devicetree+owner@vger.kernel.org>
Precedence: list
MIME-Version: 1.0

Thank you for your contribution! Sashiko AI review found 6 potential
issue(s) to consider.

Critical: 0 · High: 0 · Medium: 4 · Low: 2

If you believe none of the issues are legitimate, please reply to each
issue of Medium severity or higher and explain why the AI is wrong.
If any of them are legitimate and you plan to respin, please let patchwork
know by including "pw-bot: cr" as a separate line at the end of your reply
(one such reply per series is enough).

- [Medium] sit9531x_derive_clock_id() (drivers/dpll/sit9531x/core.c)
  computes clock_id = SIT9531X_OUI << 24 | (u64)adap << 8 | client->addr.
- [Medium] sit9531x_irq_thread_fn() (drivers/dpll/sit9531x/core.c) writes
  0xFF to a fixed set of eight W1C notification registers in…
- [Medium] sit9531x_resume() (drivers/dpll/sit9531x/core.c) assumes the
  part may have lost power ('After power loss the part is on page 0')…
- [Medium] dpll: sit9531x: lock error reported on inactive PLL in
  sit9531x_dpll_lock_status_get()
- [Low] Two statements do not match the code.
- [Low] sit9531x_out_state_fetch() prints 'OUT%u is in the output-enable
  mask of more than one PLL ...' using the die slot (slot =…

--

dpll: sit9531x: register DPLL devices and pins

This commit registers each SiT9531x PLL as a DPLL device with lock status
and mode callbacks, and registers the XO as a pin on each. A kthread
worker polls the status registers twice a second into a cache, and INTRB
(where wired) schedules an early tick. The clock_id is built from the
SiTime OUI, the I2C bus number and the I2C address.

> diff --git a/drivers/dpll/sit9531x/core.c b/drivers/dpll/sit9531x/core.c
> index 99dd5e70dc5e6..8a63b92fb7d62 100644
> --- a/drivers/dpll/sit9531x/core.c
> +++ b/drivers/dpll/sit9531x/core.c

[ ... ]

> @@ -181,132 +206,1419 @@ int sit9531x_update_pll_u8(struct sit9531x_dev *sitdev, u8 pll_idx,

[ ... ]

> +static int sit9531x_out_state_fetch(struct sit9531x_dev *sitdev, u8 index)
> +{
> +	struct sit9531x_out *out = &sitdev->out[index];
> +	u8 map_lo, map_hi, slot, bit, claimed;
> +	int pll_idx;
> +	bool muted, part;
> +	u16 mask;
> +	int rc;
> +
> +	slot = sitdev->info->clkout_map[index];

[ ... ]

> +	if (claimed & (claimed - 1))
> +		dev_warn(sitdev->dev,
> +			 "OUT%u is in the output-enable mask of more than one PLL (0x%x); taking PLL%c\n",
> +			 slot, claimed, 'A' + out->pll_idx);

[Severity: Low]
This warning names the output by its die slot. In prop.c,
sit9531x_prop_pin_package_label_set() labels output pins "OUT%u" by the
package index, and its own comment says the two numbers differ on the
SiT95317.

On the SiT95317, clkout_map is {0, 3, 4, 5, 7, 8, 9, 11}. So the pin that
userspace sees as "OUT1" shows up here as "OUT3".

Should this print the package index (or both numbers), so one output has
one name? This looks the same later in the series.

[ ... ]

> +/* Queue an immediate poll tick; polling continues as a fallback. */
> +static irqreturn_t sit9531x_irq_thread_fn(int irq, void *data)
> +{
> +	struct sit9531x_dev *sitdev = data;
> +	int rc;
> +
> +	/*
> +	 * Acknowledge here: IRQF_ONESHOT unmasks the line on return, and a
> +	 * still-asserted INTRB would fire again at once.
> +	 */
> +	mutex_lock(&sitdev->multiop_lock);
> +	rc = sit9531x_clear_notifications(sitdev);
> +	mutex_unlock(&sitdev->multiop_lock);
> +	if (rc) {

[ ... ]

> +	sitdev->irq_ack_fails = 0;
> +
> +	kthread_mod_delayed_work(sitdev->kworker, &sitdev->work, 0);
> +	return IRQ_HANDLED;
> +}

[Severity: Medium]
What happens if INTRB is still asserted after this handler returns?

sit9531x_clear_notifications() writes 0xFF to a fixed list of eight
latches: OUTER_LOL, HO_FREEZE, INNER_LOL and CMON on page 0, plus four
clock-monitor latches on page 6. The driver does not program or check the
INTRB source mask, so it relies on whatever the EEPROM/efuse profile set
up.

One example is NOTIFY_4 (SIT9531X_REG_EEPROM_NOTIF, page 0 reg 0x97).
regs.h describes it as sticky, with READ_DONE set on every good load.
sit9531x_eeprom_state_report() reads it, but nothing clears it.

If the profile routes such a latch to INTRB, IRQF_ONESHOT unmasks a line
that is still asserted. The thread then runs again at once, and every
pass calls kthread_mod_delayed_work(..., 0).

IRQ_HANDLED is returned every time, so the core's spurious interrupt
detection never disables the line. irq_ack_fails only counts I2C write
errors.

Can this loop forever, with back-to-back poll ticks of about a hundred
paged I2C transfers each? Would it help to read which source asserted
INTRB and return IRQ_NONE when no source the driver handles is pending?
This looks the same later in the series.

[ ... ]

> +static int sit9531x_dev_start(struct sit9531x_dev *sitdev)
> +{

[ ... ]

> +	kthread_queue_delayed_work(sitdev->kworker, &sitdev->work, 0);
> +
> +	return 0;

[Severity: Low]
The commit message says:

  "Probe also reports the EEPROM profile and its CRC and clears the
  notification registers"

The only callers of sit9531x_clear_notifications() are
sit9531x_dev_periodic_work() and sit9531x_irq_thread_fn(). Probe just
queues the poll here, so the latches are cleared asynchronously, after
probe has returned and the IRQ has been requested.

Could the commit message be reworded to match?

On a similar note, the dpll.c file header says:

  " * DPLL device ops, pin ops (separate input/output), pin registration,"

The device and pin registration code (sit9531x_dpll_pin_register(),
sit9531x_dpll_pins_register(), sit9531x_dpll_register() and so on) lives
in core.c, and it is still there later in the series.

[ ... ]

> +static int sit9531x_derive_clock_id(struct sit9531x_dev *sitdev)
> +{
> +	int adap = i2c_adapter_id(sitdev->client->adapter);
> +
> +	/*
> +	 * The OUI with its EUI-64 filler takes the top 40 bits; the bus gets 16
> +	 * bits.
> +	 */
> +	if (adap > U16_MAX)
> +		return dev_err_probe(sitdev->dev, -EINVAL,
> +				     "I2C adapter number %d does not fit the clock id\n",
> +				     adap);
> +
> +	sitdev->clock_id = SIT9531X_OUI << 24 | (u64)adap << 8 |
> +			   sitdev->client->addr;
> +
> +	return 0;
> +}

[Severity: Medium]
The adapter number is range-checked here. client->addr is not masked to
8 bits, though, and I2C_CLIENT_TEN is not rejected.

With a 10-bit address (up to 0x3FF), bits 8-9 overlap the adapter field.
For example, adapter 0 at 10-bit address 0x150 and adapter 1 at address
0x50 both produce:

  SIT9531X_OUI << 24 | 0x150

dpll_device_get() matches on (clock_id, device_idx, module). The second
chip would therefore get the first chip's struct dpll_device for every
PLL index, and the first chip's XO pin through dpll_pin_get().

dpll_device_register() returns -EEXIST only for an identical (ops, priv)
pair. Each instance has its own ops copy and priv, so the second
registration is accepted without any error.

If the part can be addressed with 10-bit addresses, can two chips end up
merged into one DPLL device, with callbacks answered from the first
registration's priv? Would rejecting I2C_CLIENT_TEN, or masking the
address, be enough to avoid this?

The commit message also says:

  "an i2c alias in the firmware description keeps it the same across
  boots."

That only applies to DT. On ACPI, or with dynamically numbered adapters,
the id can change between boots. Could the message say so?

This code looks the same later in the series.

[ ... ]

> +static int sit9531x_resume(struct device *dev)
> +{
> +	struct sit9531x_dev *sitdev = dev_get_drvdata(dev);
> +
> +	/*
> +	 * After power loss the part is on page 0, not the cached page. The
> +	 * configuration read at probe is not read again.
> +	 */
> +	sit9531x_page_cache_drop(sitdev);
> +	if (sitdev->irq > 0)
> +		enable_irq(sitdev->irq);
> +	kthread_queue_delayed_work(sitdev->kworker, &sitdev->work, 0);
> +
> +	return 0;
> +}

[Severity: Medium]
This comment assumes the part may have lost power. Probe waits for the
internal boot:

	fsleep(10000);	/* internal boot after release */

Resume, though, enables the IRQ and queues the poll at delay 0 straight
away. Can the first I2C transfers from the IRQ thread or the poll reach
the part before it has finished booting?

After a power loss the part also reloads its EEPROM/efuse profile. Any
configuration pushed over I2C before probe would be gone;
sit9531x_eeprom_state_report() even detects that case. The driver still
uses state cached at probe time by sit9531x_dev_state_fetch():

  ref[].sig_mode selects the DE or SE registers in
  sit9531x_input_get_regs()

  out[].cmos selects the Hi-Z pairs in sit9531x_output_forced_hiz()

  the output routing, ref[].pll_mask, and chan[].manual_input, which
  sit9531x_dpll_mode_get() and sit9531x_dpll_supported_modes_get() return

Could resume then read the wrong register pairs and report wrong lock,
pin and mode state, with no warning?

Later in the series, resume re-reads the INTSYNC owner, the output mutes
and the delays. It still applies no boot delay, and it still does not
re-read sig_mode, cmos, routing or manual_input. The output mute refresh
also depends on the stale out[].cmos.

[ ... ]

> diff --git a/drivers/dpll/sit9531x/dpll.c b/drivers/dpll/sit9531x/dpll.c
> --- /dev/null
> +++ b/drivers/dpll/sit9531x/dpll.c
> @@ -0,0 +1,295 @@
> +// SPDX-License-Identifier: GPL-2.0
> +/*
> + * SiTime SiT9531x DPLL subsystem callbacks and registration
> + *
> + * Copyright (C) 2026 SiTime Corp.
> + * Author: Ali Rouhi <arouhi@sitime.com>
> + * Author: Oleg Zadorozhnyi <Oleg.Zadorozhnyi@devoxsoftware.com>
> + *
> + * DPLL device ops, pin ops (separate input/output), pin registration,
> + * and periodic change detection.
> + */
> +
> +#include <linux/dpll.h>
> +#include <linux/err.h>
> +#include <linux/kthread.h>
> +#include <linux/list.h>
> +#include <linux/netlink.h>
> +#include <linux/slab.h>
> +
> +#include "core.h"
> +#include "dpll.h"
> +#include "prop.h"
> +#include "regs.h"
> +
> +static bool sit9531x_dpll_is_input_pin(const struct sit9531x_dpll_pin *pin)
> +{
> +	return pin->dir == DPLL_PIN_DIRECTION_INPUT;
> +}
> +
> +static bool
> +sit9531x_dpll_is_xo_pin(const struct sit9531x_dpll_pin *pin)
> +{
> +	return sit9531x_dpll_is_input_pin(pin) &&
> +	       pin->id == SIT9531X_MAX_INPUTS;
> +}
> +
> +/*
> + * Report the lock status from the last poll: outer LOL (page 0 reg 0x06), PLL
> + * mode (PLL page reg 0x31), inner LOL (reg 0x92), holdover freeze (reg 0x0A)
> + * and holdover-valid (PLL page reg 0x06).
> + */
> +static int
> +sit9531x_dpll_lock_status_get(const struct dpll_device *dpll, void *dpll_priv,
> +			      enum dpll_lock_status *status,
> +			      enum dpll_lock_status_error *status_error,
> +			      struct netlink_ext_ack *extack)
> +{
> +	struct sit9531x_dpll *sitdpll = dpll_priv;
> +	struct sit9531x_dev *sitdev = sitdpll->dev;
> +	const struct sit9531x_chan *chan;
> +
> +	if (status_error)
> +		*status_error = DPLL_LOCK_STATUS_ERROR_NONE;
> +
> +	chan = sit9531x_chan_state_get(sitdev, sitdpll->id);
> +
> +	mutex_lock(&sitdev->multiop_lock);
> +
> +	if (chan->stale) {
> +		*status = DPLL_LOCK_STATUS_UNLOCKED;
> +		if (status_error)
> +			*status_error = DPLL_LOCK_STATUS_ERROR_UNDEFINED;
> +	} else if (!chan->active) {
> +		/*
> +		 * An unused PLL never goes active and its loss-of-lock bit is
> +		 * not driven.
> +		 */
> +		*status = DPLL_LOCK_STATUS_UNLOCKED;
> +	} else if (chan->inner_lol) {
> +		/*
> +		 * The core reports the error detail only with an unlocked or
> +		 * holdover status.
> +		 */
> +		*status = chan->ho_freeze ? DPLL_LOCK_STATUS_HOLDOVER :
> +					    DPLL_LOCK_STATUS_UNLOCKED;
> +	} else if (chan->mode) {
> +		/*
> +		 * In free-run the outer loop is disabled and its loss-of-lock
> +		 * bit is meaningless.
> +		 */
> +		*status = DPLL_LOCK_STATUS_UNLOCKED;
> +	} else if (chan->ho_freeze) {
> +		/*
> +		 * Test freeze before lock: a frozen PLL tracks no reference
> +		 * whatever its outer loss-of-lock bit reads.
> +		 */
> +		*status = DPLL_LOCK_STATUS_HOLDOVER;
> +	} else if (chan->locked) {
> +		if (chan->ho_valid)
> +			*status = DPLL_LOCK_STATUS_LOCKED_HO_ACQ;
> +		else
> +			*status = DPLL_LOCK_STATUS_LOCKED;
> +	} else {
> +		*status = DPLL_LOCK_STATUS_UNLOCKED;
> +	}
> +
> +	if (status_error && chan->inner_lol)
> +		*status_error = DPLL_LOCK_STATUS_ERROR_UNDEFINED;
> +
> +	mutex_unlock(&sitdev->multiop_lock);
> +
> +	return 0;
> +}
> +
> +/*
> + * Record the lock status the create notification carried as the poll baseline.
> + * Call once the device is registered.
> + */
> +void sit9531x_dpll_lock_status_baseline(struct sit9531x_dpll *sitdpll)
> +{
> +	sit9531x_dpll_lock_status_get(sitdpll->dpll_dev, sitdpll,
> +				      &sitdpll->lock_status,
> +				      &sitdpll->lock_status_error, NULL);
> +}
> +
> +/*
> + * Report AUTOMATIC for a PLL on its priority table, also on manual active
> + * select, which uses the same nibble, and MANUAL on manual input select
> + * (MISCINNER_PLL bit 5), where the select pins or GPIO_INPUT_FUNC_CTRL5..8
> + * choose the input. Free-run (PLL page reg 0x31[5]) shows in the lock status.
> + */
> +static int
> +sit9531x_dpll_mode_get(const struct dpll_device *dpll, void *dpll_priv,
> +		       enum dpll_mode *mode, struct netlink_ext_ack *extack)
> +{
> +	struct sit9531x_dpll *sitdpll = dpll_priv;
> +
> +	/* Read once at probe, before the device is registered. */
> +	if (sit9531x_chan_state_get(sitdpll->dev, sitdpll->id)->manual_input)
> +		*mode = DPLL_MODE_MANUAL;
> +	else
> +		*mode = DPLL_MODE_AUTOMATIC;
> +
> +	return 0;
> +}
> +
> +static int
> +sit9531x_dpll_supported_modes_get(const struct dpll_device *dpll,
> +				  void *dpll_priv, unsigned long *modes,
> +				  struct netlink_ext_ack *extack)
> +{
> +	struct sit9531x_dpll *sitdpll = dpll_priv;
> +
> +	if (sit9531x_chan_state_get(sitdpll->dev, sitdpll->id)->manual_input)
> +		__set_bit(DPLL_MODE_MANUAL, modes);
> +	else
> +		__set_bit(DPLL_MODE_AUTOMATIC, modes);
> +
> +	return 0;
> +}
> +
> +const struct dpll_device_ops sit9531x_dpll_device_ops = {
> +	.lock_status_get	= sit9531x_dpll_lock_status_get,
> +	.mode_get		= sit9531x_dpll_mode_get,
> +	.supported_modes_get	= sit9531x_dpll_supported_modes_get,
> +};
> +
> +static int
> +sit9531x_dpll_input_pin_direction_get(const struct dpll_pin *pin,
> +				      void *pin_priv,
> +				      const struct dpll_device *dpll,
> +				      void *dpll_priv,
> +				      enum dpll_pin_direction *direction,
> +				      struct netlink_ext_ack *extack)
> +{
> +	*direction = DPLL_PIN_DIRECTION_INPUT;
> +	return 0;
> +}
> +
> +static const struct dpll_pin_ops sit9531x_dpll_input_pin_ops = {
> +	.direction_get		= sit9531x_dpll_input_pin_direction_get,
> +};
> +
> +/*
> + * INTSYNC is the inter-PLL sync line: one PLL drives it and other PLLs may lock
> + * to it. Each DPLL registers a source pin to drive the line and a destination
> + * pin to lock to it.
> + */
> +
> +static int
> +sit9531x_dpll_output_pin_direction_get(const struct dpll_pin *pin,
> +				       void *pin_priv,
> +				       const struct dpll_device *dpll,
> +				       void *dpll_priv,
> +				       enum dpll_pin_direction *direction,
> +				       struct netlink_ext_ack *extack);
> +
> +/* The XO feeds every PLL and is always connected. */
> +
> +static int
> +sit9531x_dpll_xo_pin_state_on_dpll_get(const struct dpll_pin *pin,
> +				       void *pin_priv,
> +				       const struct dpll_device *dpll,
> +				       void *dpll_priv,
> +				       enum dpll_pin_state *state,
> +				       struct netlink_ext_ack *extack)
> +{
> +	*state = DPLL_PIN_STATE_CONNECTED;
> +	return 0;
> +}
> +
> +static const struct dpll_pin_ops sit9531x_dpll_xo_pin_ops = {
> +	.direction_get		= sit9531x_dpll_input_pin_direction_get,
> +	.state_on_dpll_get	= sit9531x_dpll_xo_pin_state_on_dpll_get,
> +};
> +
> +static int
> +sit9531x_dpll_output_pin_direction_get(const struct dpll_pin *pin,
> +				       void *pin_priv,
> +				       const struct dpll_device *dpll,
> +				       void *dpll_priv,
> +				       enum dpll_pin_direction *direction,
> +				       struct netlink_ext_ack *extack)
> +{
> +	*direction = DPLL_PIN_DIRECTION_OUTPUT;
> +	return 0;
> +}
> +
> +static const struct dpll_pin_ops sit9531x_dpll_output_pin_ops = {
> +	.direction_get		= sit9531x_dpll_output_pin_direction_get,
> +};
> +
> +const struct dpll_pin_ops *
> +sit9531x_dpll_pin_ops_get(const struct sit9531x_dpll_pin *pin)
> +{
> +	if (!sit9531x_dpll_is_input_pin(pin))
> +		return &sit9531x_dpll_output_pin_ops;
> +	if (sit9531x_dpll_is_xo_pin(pin))
> +		return &sit9531x_dpll_xo_pin_ops;
> +	return &sit9531x_dpll_input_pin_ops;
> +}
> +
> +/*
> + * Send notifications for changed lock status and pin state; called from
> + * sit9531x_dev_periodic_work().
> + */
> +void sit9531x_dpll_changes_check(struct sit9531x_dpll *sitdpll)
> +{
> +	enum dpll_lock_status_error status_error = DPLL_LOCK_STATUS_ERROR_NONE;
> +	struct sit9531x_dev *sitdev = sitdpll->dev;
> +	enum dpll_lock_status lock_status;
> +	struct sit9531x_dpll_pin *pin;
> +	int rc;
> +
> +	rc = sit9531x_dpll_lock_status_get(sitdpll->dpll_dev, sitdpll,
> +					   &lock_status, &status_error, NULL);
> +	if (rc) {
> +		dev_err(sitdev->dev, "Failed to get DPLL%u lock status: %d\n",
> +			sitdpll->id, rc);
> +		return;
> +	}
> +
> +	/*
> +	 * The core publishes the error detail with the status, so a change in
> +	 * either is notified.
> +	 */
> +	if (sitdpll->lock_status != lock_status ||
> +	    sitdpll->lock_status_error != status_error) {
> +		sitdpll->lock_status = lock_status;
> +		sitdpll->lock_status_error = status_error;
> +		sitdpll->ntf_pending = true;
> +	}
> +
> +	if (sitdpll->ntf_pending && !dpll_device_change_ntf(sitdpll->dpll_dev))
> +		sitdpll->ntf_pending = false;
> +
> +	list_for_each_entry(pin, &sitdpll->pins, list) {
> +		const struct dpll_pin_ops *ops;
> +		enum dpll_pin_state state;
> +		bool changed;
> +
> +		/*
> +		 * Only references and the INTSYNC destination change state
> +		 * without a request.
> +		 */
> +		if (!sit9531x_dpll_is_input_pin(pin) ||
> +		    sit9531x_dpll_is_xo_pin(pin))
> +			continue;
> +
> +		ops = sit9531x_dpll_pin_ops_get(pin);
> +		rc = ops->state_on_dpll_get(pin->dpll_pin, pin,
> +					    sitdpll->dpll_dev, sitdpll,
> +					    &state, NULL);
> +		if (rc)
> +			continue;
> +
> +		changed = pin->seen && state != pin->pin_state;
> +		pin->pin_state = state;
> +		pin->seen = true;
> +		if (changed) {
> +			dev_dbg(sitdev->dev, "%s state changed\n", pin->label);
> +			dpll_pin_change_ntf(pin->dpll_pin);
> +		}
> +	}
> +}

[Severity: Medium]
The !chan->active branch is ordered ahead of inner_lol so that an
unused PLL reports a plain DPLL_LOCK_STATUS_UNLOCKED. Its comment says
the loss-of-lock bit is not driven there.

This check runs after the whole chain, though. On an inactive PLL with
its bit set in SIT9531X_REG_PLL_INNER_LOL_STATUS, status_error is still
overwritten with DPLL_LOCK_STATUS_ERROR_UNDEFINED.

The DPLL core puts DPLL_A_LOCK_STATUS_ERROR in the message whenever the
status is unlocked and the error is not NONE. Userspace would then be
told that a PLL the loaded configuration does not use has an undefined
lock error.

sit9531x_dpll_changes_check() also compares lock_status_error. Each
time that bit toggles on an unused PLL, it sends a
dpll_device_change_ntf() as well.

Every branch after the inner_lol one only runs with inner_lol clear,
and the stale branch sets the error on its own. Could the assignment
move into the inner_lol branch, so an inactive PLL keeps
DPLL_LOCK_STATUS_ERROR_NONE? Or is the inner loss-of-lock bit
meaningful on a PLL that never reached its active state?

This looks the same later in the series.

-- 
Sashiko AI review · https://netdev-ai.bots.linux.dev/sashiko/#/patchset/20261119225752.41846-1-arouhi%40sitime.com
