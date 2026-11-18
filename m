Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=100.103.45.18
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1794994400;
	b=tD/hNjKgh2eOBi6jJuhh9ChT/H9W8PK20DORoRNpJEnXfClfKpqggWF9B1y20LHj2Byw
	 /PoZjg7Ch/d2lYL2mPyexvP95Sj/XGMFrUkLZwkayzTYlqGANjr3mV867BUInwYf0npLW
	 OiEjbAn1CuQ/9HW1nISuib/FN6YMw1LF8Ib39yGmxuSCQj7y4BetO5h9Ha6gR+4nbUZra
	 xWvvhV/plD7/IFv0MFJEcqoPoxjqbx0XdTGKZC5dDj75sF99gtThnXmjVYk525dwtmsi+
	 +bS376Owe1nODZXqcBupUgooswkNAhaH+qPIszAmtKfEx5qlAbCy12SnHSVNeH1CSig==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1794994400;
	h=Received:DKIM-Signature:Message-ID:From:Subject:Reply-To:To:Cc:
	 In-Reply-To:References:Content-Type:Content-Transfer-Encoding:Date;
	bh=kYBGAk4/tu9M5WunYNZC2CjODhT2ow7TWa9KRX1RuGY=;
	b=eUGgoyDtjXYm+ufDrqs9Vc/d6FqTLfFmFVqaN1d1jZoS8nKeFf2Ak1XVlo9DAP2ke7hh
	 gLZAPZqGhedUecXT7UzlU3envmzXMAL1DZR5evcBxmjK8S/FO1tz3T7Ol9S7bRAdEMqH/
	 Io6cYM0r+d/dts1dDz3ein9kanRy/pBb89dP6LBipA3FWzZnCYQPZeQl6yFBbae5ECocx
	 d1zLwwdwWV0EQ9aCTlJgHMSurdFx22qlWz8+SSIYXVtQp1guESGGTKm8fXKamGcPB0NQ+
	 6ZFmw+k0eoRqzYeLBiV+8u3cqw9YPI4MfLk50xQF0Ji+6wFqHSEwii9JHmc/XAl4qvg==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dkim=pass header.d=kernel.org header.i=@kernel.org header.a=rsa-sha256 header.s=k20260515 header.b="F9a/ITe2";
	arc=none smtp.remote-ip=100.103.45.18
Received: from smtp.kernel.org (quasi.space.kernel.org [100.103.45.18])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id B4373606A332
	for <devicetree@vger.kernel.org>; Wed, 18 Nov 2026 09:33:20 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.a=rsa-sha256 header.s=k20260515 header.b=F9a/ITe2
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 5B1C41F000C6;
	Wed, 18 Nov 2026 09:33:20 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kernel.org;
	s=k20260515; t=1794994400;
	bh=kYBGAk4/tu9M5WunYNZC2CjODhT2ow7TWa9KRX1RuGY=;
	h=From:Subject:Reply-To:To:Cc:In-Reply-To:References:Date;
	b=F9a/ITe2er56/PdpKx/zSimEy34wRdNt8posvpGm6XsAM3AzUEGpOuttpyq0KCfJn
	 SkUoHbwtQU9XoS9Hls/O8R3fmfxJQehPtgbJsvSzIAYse9WywRCBiE4lPbSgeLN7MF
	 QxXRqqdBmaF5XRxscN1xHqmW0+BY4Xlb8FyQmaZcwwbqdfI9ccch474gkPto6Zp52W
	 0dkQX8lx+b8JH9/5zwcwbu6dDVM5KGWaEN72f6ga580zuQJdDJ5shzP2PWkNN++V9i
	 mMTqfF7rneIB+wtTyrBvPUkq3Y40fC1E0GKws/A9cBfh+nGngXcFJ1giPsx2iyHfdF
	 TTIXuE9b2f7QA==
Message-ID: <sashiko-outbox-220580@kernel.org>
From: sashiko-bot@kernel.org
Subject: Re: [PATCH 5/9] platform/chrome: Add SpacemiT K3 eSPI EC transport
Reply-To: sashiko-reviews@lists.linux.dev
To: "Wang Yang" <yang.wang@deepcomputing.io>
Cc: devicetree@vger.kernel.org, robh@kernel.org, conor+dt@kernel.org
In-Reply-To: <20261118085742.1817536-6-yang.wang@deepcomputing.io>
References: <20261118085742.1817536-1-yang.wang@deepcomputing.io>
 <20261118085742.1817536-6-yang.wang@deepcomputing.io>
Content-Type: text/plain; charset=utf-8
Content-Transfer-Encoding: quoted-printable
Date: Wed, 18 Nov 2026 09:33:19 +0000
X-Mailing-List: devicetree@vger.kernel.org
List-Id: <devicetree.vger.kernel.org>
List-Post: <mailto:devicetree@vger.kernel.org>
List-Help: <mailto:devicetree+help@vger.kernel.org>
List-Subscribe: <mailto:devicetree+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:devicetree+unsubscribe@vger.kernel.org>
List-Owner: <mailto:devicetree+owner@vger.kernel.org>
Precedence: list

Thank you for your contribution! Sashiko AI review found 5 potential
issues to consider:
- [Medium] platform/chrome: missing wakeup init in cros_ec_espi_probe()
- [Medium] platform/chrome: missing eSPI window bounds checks in
  lpc_to_espi_offset()
- [Medium] platform/chrome: race on event_data in cros_ec_espi_probe()
  IRQ drain
- [Medium] platform/chrome: missing post-ID delay in
  cros_ec_espi_wait_ready()
- [Low] platform/chrome: spurious error log on -EAGAIN in
  cros_ec_spacemit_k3
--

commit b0c80322a90e8c8d2c53ee26b39169afce373af6
Author: Wang Yang <yang.wang@deepcomputing.io>

platform/chrome: Add SpacemiT K3 eSPI EC transport

This commit adds a ChromeOS EC transport driver for the SpacemiT K3 eSPI
peripheral shared-memory window, supporting host command protocol versions
2 and 3, controller link recovery, and EC event interrupts.

> diff --git a/drivers/platform/chrome/cros_ec_spacemit_k3.c b/drivers/plat=
form/chrome/cros_ec_spacemit_k3.c
> new file mode 100644
> index 0000000000000..b3010e2bff6a5
> --- /dev/null
> +++ b/drivers/platform/chrome/cros_ec_spacemit_k3.c
[ ... ]
> +/* eSPI shared memory offsets */
> +#define ESPI_HOST_CMD_OFFSET 0x000 /* EC_LPC_ADDR_HOST_CMD -> 0x000 */
> +#define ESPI_HOST_DATA_OFFSET 0x001 /* EC_LPC_ADDR_HOST_DATA -> 0x001 */
> +#define ESPI_HOST_ARGS_OFFSET 0x010 /* EC_LPC_ADDR_HOST_ARGS -> 0x010 */
> +#define ESPI_HOST_PARAM_OFFSET 0x018 /* EC_LPC_ADDR_HOST_PARAM -> 0x018 =
*/
> +#define ESPI_HOST_PACKET_OFFSET 0x100 /* EC_LPC_ADDR_HOST_PACKET -> 0x10=
0 */
> +#define ESPI_MEMMAP_OFFSET 0x200 /* EC_LPC_ADDR_MEMMAP -> 0x200 */
[ ... ]
> +/* Convert LPC address to eSPI shared memory offset */
> +static inline u32 lpc_to_espi_offset(struct cros_ec_device *ec, u32 lpc_=
addr)
> +{
> +	switch (lpc_addr & 0xFF00) {
> +	case 0x200: /* HOST_CMD/DATA region */
> +		if (lpc_addr =3D=3D EC_LPC_ADDR_HOST_CMD)
> +			return ESPI_HOST_CMD_OFFSET;
> +		else if (lpc_addr =3D=3D EC_LPC_ADDR_HOST_DATA)
> +			return ESPI_HOST_DATA_OFFSET;
> +		break;
> +	case 0x800: /* HOST_ARGS/PARAM/PACKET region */
> +		/* Protocols 2 and 3 use the same LPC addresses. */
> +		if (ec->proto_version > 2)
> +			return ESPI_HOST_PACKET_OFFSET +
> +			       (lpc_addr - EC_LPC_ADDR_HOST_PACKET);
> +		else if (lpc_addr >=3D EC_LPC_ADDR_HOST_ARGS &&
> +			 lpc_addr < EC_LPC_ADDR_HOST_PARAM)
> +			return ESPI_HOST_ARGS_OFFSET +
> +			       (lpc_addr - EC_LPC_ADDR_HOST_ARGS);
> +		else if (lpc_addr >=3D EC_LPC_ADDR_HOST_PARAM)
> +			return ESPI_HOST_PARAM_OFFSET +
> +			       (lpc_addr - EC_LPC_ADDR_HOST_PARAM);
> +		break;
> +	case 0x900: /* MEMMAP region */
> +		return ESPI_MEMMAP_OFFSET + (lpc_addr - EC_LPC_ADDR_MEMMAP);
> +	}
> +
> +	/* Default mapping for unknown addresses */
> +	pr_warn_once("Unknown LPC address 0x%x, using direct offset\n",
> +		     lpc_addr);
> +	return lpc_addr & 0xFF;
> +}

[Severity: Medium]
Can lpc_to_espi_offset() read and write past the parameter and packet
sub-windows into adjacent regions of espi_shared_mem_base?

For protocol v2, ESPI_HOST_PARAM_OFFSET starts at 0x018 and only has 232
bytes before ESPI_HOST_PACKET_OFFSET at 0x100, but
cros_ec_cmd_xfer_espi_once() allows msg->outsize and msg->insize up to
EC_PROTO2_MAX_PARAM_SIZE (252 bytes).  A transfer of 233..252 bytes maps
EC_LPC_ADDR_HOST_PARAM + i to 0x100..0x113, overflowing into the packet
window.

Similarly, for protocol v3, cros_ec_pkt_xfer_espi_once() does not check
that the request length returned by cros_ec_prepare_tx() or
sizeof(response) + response.data_len fits within the 256-byte packet window
(EC_LPC_HOST_PACKET_SIZE).  When a packet exceeds 256 bytes,
EC_LPC_ADDR_HOST_PACKET + i reaches 0x900 and lpc_to_espi_offset()
translates it into ESPI_MEMMAP_OFFSET (0x200..0x2ff) and then wraps via
the default (lpc_addr & 0xff) fallback to 0x000, overwriting
ESPI_HOST_CMD_OFFSET and ESPI_HOST_DATA_OFFSET.

[ ... ]

> +static int cros_ec_espi_wait_ready(struct cros_ec_device *ec, const char=
 *reason)
> +{
> +	struct device *dev =3D ec->dev;
> +	unsigned long timeout =3D jiffies + msecs_to_jiffies(ESPI_READY_TIMEOUT=
_MS);
> +	unsigned long next_recover =3D
> +		jiffies + msecs_to_jiffies(ESPI_RECOVERY_RETRY_INTERVAL_MS);
> +	u8 buf[2] =3D {};
> +	int ret =3D 0;
> +
> +	do {
> +		ret =3D cros_ec_espi_read_id(ec, buf);
> +		if (ret >=3D 0 && cros_ec_espi_valid_id(buf))
> +			return 0;

[Severity: Medium]
Does cros_ec_espi_wait_ready() return before the EC has finished
initializing its command window?

In cros_ec_espi_probe(), the driver sleeps for 100 ms after seeing the EC
ID because the EC still initializes its command window after publishing
EC_MEMMAP_ID.  During runtime recovery, cros_ec_espi_xfer_retry() calls
cros_ec_espi_recover_controller() -> cros_ec_espi_wait_ready(), which
returns 0 as soon as 'E' and 'C' appear without that 100 ms delay, so the
single command retry in cros_ec_espi_xfer_retry() is sent immediately while
the command window may still be initializing.

[ ... ]

> +static int cros_ec_pkt_xfer_espi_once(struct cros_ec_device *ec,
> +				      struct cros_ec_command *msg)
> +{
[ ... ]
> +	/* Check result */
> +	ret =3D cros_ec_espi_read_bytes(ec, EC_LPC_ADDR_HOST_DATA, 1, &sum);
> +	if (ret < 0) {
> +		dev_err(ec->dev, "Read from HOST_DATA failed: %d\n", ret);
> +		goto done;
> +	}
> +
> +	msg->result =3D sum;
> +	ret =3D cros_ec_check_result(ec, msg);
> +	if (ret) {
> +		dev_err(ec->dev, "cros_ec_check_result failed: %d\n", ret);
> +		goto done;
> +	}

[Severity: Low]
Should cros_ec_pkt_xfer_espi_once() and cros_ec_cmd_xfer_espi_once() avoid
logging dev_err() when cros_ec_check_result() returns non-zero?

cros_ec_check_result() only returns non-zero (-EAGAIN) when msg->result is
EC_RES_IN_PROGRESS, which is normal for slow commands that
cros_ec_send_command() polls until completion via
cros_ec_wait_until_complete().  Logging dev_err() here prints an error on
every status poll while a command is in progress.

[ ... ]

> +static int cros_ec_espi_probe(struct platform_device *pdev)
> +{
[ ... ]
> +	if (irq > 0) {
> +		ec->irq =3D irq;
> +		ret =3D devm_request_threaded_irq(dev, irq, cros_ec_espi_irq_handler,
> +						cros_ec_irq_thread, IRQF_ONESHOT,
> +						"chromeos-ec", ec);
> +		if (ret) {
> +			cros_ec_unregister(ec);
> +			return dev_err_probe(dev, ret, "failed to request EC IRQ\n");
> +		}
> +
> +		/* Drain events queued before the edge-triggered IRQ was ready. */
> +		if (ec->mkbp_event_supported)
> +			cros_ec_irq_thread(irq, ec);
> +	}
> +
> +	return 0;
> +}

[Severity: Medium]
Can calling cros_ec_irq_thread() directly here race with the newly enabled
threaded IRQ handler on ec->event_data and ec->event_size?

devm_request_threaded_irq() enables the interrupt before the probe thread
calls cros_ec_irq_thread(irq, ec):

CPU0 (probe)                      CPU1 (irq/<irq>-chromeos-ec)
cros_ec_espi_probe()
  devm_request_threaded_irq()
  cros_ec_irq_thread()
    cros_ec_handle_event()
      cros_ec_get_next_event()
        get_next_event_xfer()
          ec_dev->event_data =3D ...
                                  cros_ec_irq_thread()
                                    ...
                                      get_next_event_xfer()
                                        ec_dev->event_data =3D ...
        ec_dev->event_data.event_type &=3D ...
      blocking_notifier_call_chain()  <-- reads overwritten event_data

In get_next_event_xfer() and cros_ec_get_next_event(), ec_dev->lock only
protects cros_ec_cmd_xfer_status(); updates to ec_dev->event_size and
ec_dev->event_data and the subsequent notifier callbacks run unlocked.
Waking the IRQ thread with irq_wake_thread(irq, ec) instead of calling
cros_ec_irq_thread() directly would serialize the initial drain with IRQ
delivery.

[ ... ]

> +static int cros_ec_espi_suspend_late(struct device *dev)
> +{
> +	struct cros_ec_device *ec_dev =3D dev_get_drvdata(dev);
> +
> +	return cros_ec_suspend_late(ec_dev);
> +}

[Severity: Medium]
Does EC wakeup from suspend work without calling device_init_wakeup() in
cros_ec_espi_probe()?

cros_ec_suspend_late() -> cros_ec_disable_irq() and cros_ec_handle_event()
check device_may_wakeup(ec_dev->dev) before calling enable_irq_wake() and
pm_wakeup_event():

drivers/platform/chrome/cros_ec.c:cros_ec_disable_irq() {
    ...
	if (device_may_wakeup(dev))
		ec_dev->wake_enabled =3D !enable_irq_wake(ec_dev->irq);
	else
		ec_dev->wake_enabled =3D false;

	disable_irq(ec_dev->irq);
}

Unlike the I2C core, the platform bus does not automatically initialize
wakeup capability from the devicetree wakeup-source property, so
device_may_wakeup(ec->dev) is always false and the EC IRQ is disabled
during suspend without wake enabled.

--=20
Sashiko AI review =C2=B7 https://sashiko.dev/#/patchset/20261118085742.1817=
536-1-yang.wang@deepcomputing.io?part=3D5
