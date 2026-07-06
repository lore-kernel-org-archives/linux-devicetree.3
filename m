Received: from smtp.kernel.org (aws-us-west-2-korg-mail-alma10-1.taild15c8.ts.net [100.103.45.18])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 5AFE83B47CD
	for <devicetree@vger.kernel.org>; Mon,  6 Jul 2026 17:42:59 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=100.103.45.18
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1783359780; cv=none; b=ujYpWRCe5qZ2Yl3ZzbqG+fF8mxD1RhJujZxR2oglJFXxT9h6m5XwX5mjOi9rOlhI7zh4IB1KyZEBmSoVq8pGMJXO7kJjCqO/Q1486XLbRbmg4R69t6QEw+6V5CcC+/HxQDlAY+JoNa6Q+qsdayMUl1Qq9P+b4KGE2RSRrRV6Ocg=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1783359780; c=relaxed/simple;
	bh=7jeGb6sr6Bzqn/u1zKG/vUZ4uWQ6QXiec/19Hv1d7/o=;
	h=From:Subject:To:Cc:In-Reply-To:References:Content-Type:Date:
	 Message-Id; b=O6IqS19bfNLE5gGDpw7tXp+/z7lHOhoZtlveTa6/3RFVv6wuHw4SDyb5GooXDx749som/uUOnSB2B9wXYrCiL+QQMeuV3UJZFEDYjHy5jIPwTDnJPylP1vNEZvXXr2nhrMoI6+sL0mfEIu6qo4LmGs4yKvXTNXRETNGFS7eEvVw=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=j3/EW+fF; arc=none smtp.client-ip=100.103.45.18
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="j3/EW+fF"
Received: by smtp.kernel.org (Postfix) with ESMTPSA id AE20F1F000E9;
	Mon,  6 Jul 2026 17:42:58 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kernel.org;
	s=k20260515; t=1783359778;
	bh=ttRWZQghMqm1H/Q/ZwAlM5xOOX4/Jz+2lHCrVc4Bi2M=;
	h=From:Subject:Reply-To:To:Cc:In-Reply-To:References:Date;
	b=j3/EW+fF7z8fX2ecvg+jSaxcs2ZFRnk/HC4DpCoAqtjCXIqXTAumpB6hFtKDhq5Xf
	 fn8GfOuxpUMUxzIsNj+VROQ0hNVBIS4AyoVu/EGOFRQxSmuEocvr+GApdlU7koJ0dv
	 JwMPwc8gCik5sOiNtZeeER/ZlwuMg1ed2TBP9PqkBdfySfmTmzqpZa7hvxbCChQdBY
	 d0Clyf3+NRUmNLhADgADhu1GT1nqvnTJjU3g2xp2Ixmi6/prCdNxobWcrcaxyDAjbn
	 iTkRdAFD/tT/+ajuOBoBNmGm986PyT9EZ3rs/ZOOw+UH4hHt28NQXkt8ARUsFv/koj
	 CNki979dhuCjg==
From: sashiko-bot@kernel.org
Subject: Re: [PATCH v4 4/6] Bluetooth: Introduce Qualcomm IPQ5018 IPC based
 HCI driver
Reply-To: sashiko-reviews@lists.linux.dev
To: "George Moussalem" <george.moussalem@outlook.com>
Cc: robh@kernel.org, devicetree@vger.kernel.org, conor+dt@kernel.org
In-Reply-To: <20260706-ipq5018-bluetooth-v4-4-350262a30959@outlook.com>
References: <20260706-ipq5018-bluetooth-v4-0-350262a30959@outlook.com>
 <20260706-ipq5018-bluetooth-v4-4-350262a30959@outlook.com>
Content-Type: text/plain; charset=utf-8
Content-Transfer-Encoding: quoted-printable
Date: Mon, 06 Jul 2026 17:42:58 +0000
Message-Id: <20260706174258.AE20F1F000E9@smtp.kernel.org>
Precedence: bulk
X-Mailing-List: devicetree@vger.kernel.org
List-Id: <devicetree.vger.kernel.org>
List-Subscribe: <mailto:devicetree+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:devicetree+unsubscribe@vger.kernel.org>

Thank you for your contribution! Sashiko AI review found 10 potential issue=
(s) to consider:
- [Critical] Unchecked failure of `request_firmware()` leads to a guarantee=
d NULL pointer dereference.
- [High] Missing bounds check on split firmware segment size allows out-of-=
bounds memory reads.
- [High] Use-After-Free of `hci_dev` during module removal due to incorrect=
 teardown order.
- [High] The `desc->running` flag is never reset on shutdown, breaking subs=
equent device opens.
- [High] Race condition in `btqcomipc_send` strands packets in the TX queue=
 indefinitely.
- [High] Endianness bugs in ring buffer macros cause memory corruption on b=
ig-endian architectures.
- [High] Missing validation of shared memory values allows division-by-zero=
 and heap overflow.
- [High] Spurious interrupt before firmware boot causes garbage memory dere=
ference.
- [High] Invalid direct dereference of packed structs mapped as I/O memory.
- [Medium] Missing read memory barrier (`dma_rmb`) in RX ring buffer proces=
sing.
--

commit b919a0d9e5de552fc0f99dc627213c500aff5dac
Author: George Moussalem <george.moussalem@outlook.com>
Date:   Mon Jul 6 17:26:20 2026 +0000

    Bluetooth: Introduce Qualcomm IPQ5018 IPC based HCI driver
   =20
    Add support for the Bluetooth controller found in the IPQ5018 SoC.
    This driver implements firmware loading and the transport layer between
    the HCI core and the Bluetooth controller.

> diff --git a/drivers/bluetooth/btqcomipc.c b/drivers/bluetooth/btqcomipc.c
> new file mode 100644
> index 0000000000000..bea3b83d9f2e1
> --- /dev/null
> +++ b/drivers/bluetooth/btqcomipc.c
[ ... ]
> +#define IS_RX_MEM_NON_CONTIGIOUS(buf, len, sz)		\
> +	((buf + len) > (desc->rx_ctxt->lring_buf +	\
> +	(sz * desc->rx_ctxt->lmsg_buf_cnt)))

[Severity: High]
Does this perform native host arithmetic on a little-endian value?

Looking at struct context_info, lring_buf is defined as __le32, but it
is being used in macros like IS_RX_MEM_NON_CONTIGIOUS and
GET_RX_INDEX_FROM_BUF without a le32_to_cpu() conversion.

Could this cause memory corruption or incorrect bounds checking on
big-endian architectures?

[ ... ]
> +static inline u32 btss_lbuf_size(struct qcom_btss *desc,
> +				 const struct context_info *ctxt)
> +{
> +	u32 total_size =3D le16_to_cpu(ctxt->total_size);
> +	u32 lring_buf =3D le32_to_cpu(ctxt->lring_buf);
> +
> +	return ((TO_BT_ADDR((void *)ctxt) + total_size) -
> +		lring_buf) / ctxt->lmsg_buf_cnt;
> +}

[Severity: High]
Is it possible for ctxt->lmsg_buf_cnt to be zero here?

Since this value is read directly from shared memory, a buggy or
compromised firmware providing a zero value would cause a division by zero
panic.

Could we add validation for these shared memory values before using them?

[ ... ]
> +static int btqcomipc_send(struct hci_dev *hdev, struct sk_buff *skb)
> +{
> +	u16 hdr =3D FIELD_PREP(IPC_HDR_PKT_TYPE_MASK, IPC_HDR_PKT_TYPE_HCI);
> +	struct qcom_btss *desc =3D hci_get_drvdata(hdev);
> +	unsigned long flags;
> +	int ret;
> +
> +	spin_lock_irqsave(&desc->lock, flags);
> +
> +	if (unlikely(!READ_ONCE(desc->running))) {
> +		spin_unlock_irqrestore(&desc->lock, flags);
> +		bt_dev_err(hdev,
> +			   "BTSS not initialized, failed to send message");
> +		ret =3D -ENODEV;
> +		goto free_skb;
> +	}
> +
> +	ret =3D btss_send(desc, hdr, skb);
> +	spin_unlock_irqrestore(&desc->lock, flags);
> +	if (ret) {
> +		if (ret =3D=3D -EAGAIN) {
> +			if (skb_queue_len(&desc->tx_q) >=3D IPC_TX_QSIZE) {
> +				bt_dev_err(hdev,
> +					   "TX queue full, dropping message");
> +				hdev->stat.err_tx++;
> +				ret =3D -ENOBUFS;
> +			} else {
> +				skb_queue_tail(&desc->tx_q, skb);
> +				return 0;
> +			}

[Severity: High]
Can this sequence strand packets in the TX queue indefinitely?

If btss_send() returns -EAGAIN, the driver releases desc->lock and then
queues the SKB via skb_queue_tail().

If a hardware ACK interrupt fires between the lock release and the queue
enqueue, btss_worker() could acquire the lock, free space in the ring
buffer, and call btss_process_tx_queue() while the queue still appears
empty.

Would it be safer to enqueue the packet before releasing the lock?

[ ... ]
> +static inline int btss_process_rx(struct qcom_btss *desc,
> +				  struct ring_buffer_info *rinfo,
> +				  bool *ack, u8 *rx_count)
> +{
> +	u8 ridx, lbuf_idx, blks_consumed, pkt_type, cmd;
> +	struct ipc_aux_ptr aux_ptr =3D { };
> +	struct ring_buffer *rbuf;
> +	uint8_t *rxbuf =3D NULL;
> +	unsigned char *buf;
> +	u16 msg_hdr;
> +	u16 msg_len;
> +	u32 lsz;
> +	int ret;
> +
> +	ridx =3D rinfo->ridx;
> +
> +	while (ridx !=3D rinfo->widx) {
> +		rbuf =3D &((struct ring_buffer *)(TO_APPS_ADDR(le32_to_cpu(rinfo->rbuf=
))))[ridx];
> +		msg_hdr =3D le16_to_cpu(rbuf->msg_hdr);

[Severity: Medium]
Is a read memory barrier needed here?

The driver reads the producer index (rinfo->widx) which is updated by
hardware, and then immediately dereferences rbuf->msg_hdr and rbuf->len
from the ring buffer.

Without a dma_rmb() between reading the index and the payload, could
the CPU speculatively fetch stale payload data before the device's write
is guaranteed visible?

[Severity: High]
Does this code safely access I/O memory on ARM64?

The memory region is mapped as Device memory via devm_ioremap(), but
the code casts offsets to struct ring_buffer (which is __packed) and
directly dereferences fields like rbuf->msg_hdr.

Since the compiler can optimize packed struct accesses using unaligned
load instructions, could this trigger synchronous external aborts on
ARM64 systems? Should standard I/O accessors like readw() be used instead?

[ ... ]
> +		if (msg_hdr & IPC_HDR_LONG_MSG) {
> +			rxbuf =3D TO_APPS_ADDR(le32_to_cpu(rbuf->payload.lmsg_data));
> +			lsz =3D btss_lbuf_size(desc, desc->rx_ctxt);
> +
> +			if (IS_RX_MEM_NON_CONTIGIOUS(le32_to_cpu(rbuf->payload.lmsg_data),
> +					     msg_len, lsz)) {
> +				lbuf_idx =3D GET_RX_INDEX_FROM_BUF(
> +						le32_to_cpu(rbuf->payload.lmsg_data), lsz);
> +
> +				blks_consumed =3D desc->rx_ctxt->lmsg_buf_cnt -
> +					lbuf_idx;
> +				aux_ptr.len =3D msg_len - (blks_consumed * lsz);

[Severity: High]
Can this subtraction underflow and cause a heap overflow later?

The values from the shared memory context are used to calculate
blks_consumed and then aux_ptr.len. If a compromised firmware provides
values where (blks_consumed * lsz) is greater than msg_len, aux_ptr.len
will wrap to a huge integer.

Could this huge length then cause the subsequent memcpy_fromio() to
overflow the allocated SKB buffer?

[ ... ]
> +static int btcomqipc_firmware_load(struct qcom_btss *desc)
> +{
[ ... ]
> +		/* Check if firmware is split across multiple segment files */
> +		if (phdr->p_offset > fw->size ||
> +		    phdr->p_filesz > fw->size - phdr->p_offset) {
> +			seg_name =3D kasprintf(GFP_KERNEL, "%.*sb%02d",
> +					     (int)stem_len, desc->firmware, i);
> +			if (!seg_name) {
> +				ret =3D -ENOMEM;
> +				goto release_fw;
> +			}
> +
> +			ret =3D request_firmware(&seg_fw, seg_name,
> +					       desc->dev);
> +			if (ret)
> +				dev_err(desc->dev,
> +					"Could not find split segment binary: %s\n",
> +					seg_name);
> +
> +			/*
> +			 * Use the virtual instead of the physical address as
> +			 * the offset
> +			 */
> +			memcpy_toio(desc->mem_region + phdr->p_vaddr, seg_fw->data,
> +				    phdr->p_filesz);
> +
> +			release_firmware(seg_fw);
> +			kfree(seg_name);
> +			seg_name =3D NULL;
> +
> +			if (ret)
> +				goto release_fw;

[Severity: Critical]
If request_firmware() fails, is seg_fw left uninitialized?

The error is logged with dev_err(), but execution falls through to
memcpy_toio() which will dereference the uninitialized or NULL seg_fw
pointer, causing a kernel panic.

Should the code jump out or abort immediately if request_firmware() fails?

[Severity: High]
Does this memcpy_toio() trust the ELF header size blindly?

It copies phdr->p_filesz bytes from seg_fw->data, but it doesn't verify
that the requested firmware file actually contains that many bytes
(seg_fw->size).

If a truncated or modified firmware file is loaded, could this result in
an out-of-bounds memory read?

[ ... ]
> +static int btqcomipc_close(struct hci_dev *hdev)
> +{
> +	int ret;
> +
> +	/*
> +	 * Trigger the controller to shutdown. Once the FW has completed its
> +	 * shutdown sequence, it will send an IPC_CMD_STOP message to the host
> +	 * upon which the desc->running flag is set to false.
> +	 */
> +	ret =3D qcom_scm_pas_shutdown(BTSS_PAS_ID);
> +	if (ret) {
> +		bt_dev_err(hdev, "Failed to stop firmware: %d", ret);
> +		return ret;
> +	}
> +
> +	msleep(BTSS_PWR_CTRL_DELAY_MS);
> +
> +	return 0;
> +}

[Severity: High]
Is desc->running reliably reset to false when the device is closed?

The comment mentions that the firmware will send an IPC_CMD_STOP message
which clears desc->running. However, qcom_scm_pas_shutdown() forcefully
halts the peripheral, which might prevent it from sending that final messag=
e.

If desc->running remains true, a subsequent call to btqcomipc_open()
will bypass initialization and leave pointers like desc->rx_ctxt in a
stale or invalid state. Should this explicitly reset desc->running?

[ ... ]
> +static int btqcomipc_init(struct qcom_btss *desc)
> +{
> +	struct device *dev =3D desc->dev;
> +	int ret;
> +
> +	init_waitqueue_head(&desc->wait_q);
> +	spin_lock_init(&desc->lock);
> +	skb_queue_head_init(&desc->tx_q);
> +
> +	desc->wq =3D devm_alloc_ordered_workqueue(dev, "btss_wq", 0);
> +	if (!desc->wq) {
> +		dev_err(dev, "Failed to initialize workqueue\n");
> +		return -ENOMEM;
> +	}
> +
> +	INIT_WORK(&desc->work, btss_worker);
> +
> +	ret =3D devm_request_threaded_irq(dev, desc->irq, NULL, btss_irq_handle=
r,
> +					IRQF_TRIGGER_RISING | IRQF_ONESHOT,
> +					"btss_irq", desc);

[Severity: High]
Could a spurious interrupt cause a crash before firmware initialization?

The IRQ is enabled here during probe, before the firmware is loaded and
the controller is booted in btqcomipc_open().

If a spurious interrupt fires, btss_worker() will run, see that
desc->running is false, and attempt to read offsets from the uninitialized
desc->mem_region to setup desc->rx_ctxt.

Would it be safer to request the IRQ later, or keep it disabled until
the firmware is actually booted?

[ ... ]
> +static void btqcomipc_remove(struct platform_device *pdev)
> +{
> +	struct qcom_btss *desc =3D platform_get_drvdata(pdev);
> +
> +	if (desc->hdev) {
> +		hci_unregister_dev(desc->hdev);
> +		hci_free_dev(desc->hdev);
> +		desc->hdev =3D NULL;
> +	}
> +
> +	btqcomipc_deinit(desc);
> +}

[Severity: High]
Is the HCI device freed before the background workqueue is stopped?

hci_free_dev() is called and desc->hdev is set to NULL before
btqcomipc_deinit() flushes the workqueue and disables IRQs.

If btss_worker() is still running or pending, it could attempt to access
desc->hdev (e.g., logging an error or updating stats), leading to a NULL
pointer dereference or use-after-free.

Should btqcomipc_deinit() be called before tearing down the HCI device?

--=20
Sashiko AI review =C2=B7 https://sashiko.dev/#/patchset/20260706-ipq5018-bl=
uetooth-v4-0-350262a30959@outlook.com?part=3D4
