Received: from smtp.kernel.org (aws-us-west-2-korg-mail-alma10-1.taild15c8.ts.net [100.103.45.18])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 8526C33D4F8
	for <devicetree@vger.kernel.org>; Fri,  3 Jul 2026 05:15:27 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=100.103.45.18
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1783055737; cv=none; b=QsyWhKgrwaUj1TDd9Bav4Kpka8QE7HhqjSIYrAZbCqv5NJzfZDR4JJ73XUl69IzluirL3LEuNiyp+zdvWevRFMiHXJt79UyjzCL9wWmzor2cIFe8WsBwPWp9Bfl2fs+4S2Fsyk39aSPBDnV2yntjFbJwtO4pufuqwjbZbfrdVUs=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1783055737; c=relaxed/simple;
	bh=GdFJno77DeQvmUo/Nt78fuqsTKDUeGB0RaK0prcXmqg=;
	h=From:Subject:To:Cc:In-Reply-To:References:Content-Type:Date:
	 Message-Id; b=qB437CfhciwtktVdoU8S9bL2VvHKXQ/6JlNNeLN+bPvPKEbGpM/FsCAmNIed+9abUwVx77SlR/9gX1DiK1w/N5KJ7Lt9ru0q2MAfrwpPmp2YMvmh+TQScEpYiFQcg3Tc9phbRjkWC0HuCybDtzdO1Jz4YTYW1YWgq8JfAJksoCc=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=a1Pl00JP; arc=none smtp.client-ip=100.103.45.18
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="a1Pl00JP"
Received: by smtp.kernel.org (Postfix) with ESMTPSA id C87571F000E9;
	Fri,  3 Jul 2026 05:15:25 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kernel.org;
	s=k20260515; t=1783055726;
	bh=EI/A19u/1fDJCjdjG56XFKjv/qrRUuz5RrFxEQfd6Hs=;
	h=From:Subject:Reply-To:To:Cc:In-Reply-To:References:Date;
	b=a1Pl00JPYs4rOi8G6DB2h7InOdXSn771BsVAsIViRBfYSg5yKv4+zo5pIUKpBbGFe
	 KTTD4V+ZOqplM2NebsEO7CIMHR/e23UrkXRff3Si0RlsLavDgYr4ZURNhFjzpeJ9AJ
	 QC52CuT1ffuSTEc1qTtqaB6nHEcJHDBvHerIZnrvdOwXp7PevT9ttLrK82es7jdqUv
	 HYTHPRJ9g3OxmC8rlky5JNBRRJ2ljLI2xrZrnxVQFb2hCXQcnn00vomH+Dn1nONmpF
	 zr3vakGgbHKzwVpsUbx0VUju6quv933Wjd3vTQUIngG3i5xFYnq9TeCSQh0BMJVKPK
	 lcKq3nxdzoY3w==
From: sashiko-bot@kernel.org
Subject: Re: [PATCH v3 4/6] Bluetooth: Introduce Qualcomm IPQ5018 IPC based
 HCI driver
Reply-To: sashiko-reviews@lists.linux.dev
To: "George Moussalem" <george.moussalem@outlook.com>
Cc: robh@kernel.org, devicetree@vger.kernel.org, conor+dt@kernel.org
In-Reply-To: <20260703-ipq5018-bluetooth-v3-4-62da72818ab3@outlook.com>
References: <20260703-ipq5018-bluetooth-v3-0-62da72818ab3@outlook.com>
 <20260703-ipq5018-bluetooth-v3-4-62da72818ab3@outlook.com>
Content-Type: text/plain; charset=utf-8
Content-Transfer-Encoding: quoted-printable
Date: Fri, 03 Jul 2026 05:15:25 +0000
Message-Id: <20260703051525.C87571F000E9@smtp.kernel.org>
Precedence: bulk
X-Mailing-List: devicetree@vger.kernel.org
List-Id: <devicetree.vger.kernel.org>
List-Subscribe: <mailto:devicetree+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:devicetree+unsubscribe@vger.kernel.org>

Thank you for your contribution! Sashiko AI review found 16 potential issue=
(s) to consider:
- [High] Data race in `btqcomipc_send` corrupts shared ring buffer state.
- [High] Invalid pointer cast of 32-bit DSP value causes kernel panic.
- [High] Missing and incorrect endianness conversions break functionality o=
n big-endian architectures.
- [High] Unsafe firmware segment name formatting is vulnerable to buffer un=
derflow and overflow.
- [High] The RX worker inadvertently corrupts the ring buffer size configur=
ation.
- [High] Missing length bounds check on received short messages.
- [High] Spurious IRQ can trigger a NULL pointer dereference of `desc->hdev=
`.
- [High] Integer overflow in firmware segment address validation allows out=
-of-bounds write.
- [High] Incorrect teardown order in `btqcomipc_remove` leaks TX packets.
- [High] Missing memory barriers and improper I/O memory handling.
- [Medium] The workqueue is leaked if IRQ registration fails.
- [Medium] Resource leak on `btqcomipc_open` timeout.
- [Medium] Long message slots are leaked when the short TX ring is full.
- [Medium] Reopen state corruption due to missing flag reset in `btqcomipc_=
close`.
- [Medium] Missing structural validation of ELF file size.
- [Medium] Memory allocation failure in RX path causes permanent ring stall.
--

commit e292b0c9ddcf5a4d994ac5c30c3559ed0e18bb8d
Author: George Moussalem <george.moussalem@outlook.com>

Bluetooth: Introduce Qualcomm IPQ5018 IPC based HCI driver

Add support for the Bluetooth controller found in the IPQ5018 SoC.
This driver implements firmware loading and the transport layer between
the HCI core and the Bluetooth controller.

> diff --git a/drivers/bluetooth/btqcomipc.c b/drivers/bluetooth/btqcomipc.c
> new file mode 100644
> --- /dev/null
> +++ b/drivers/bluetooth/btqcomipc.c
[ ... ]
> +#define IPC_LBUF_SZ(w, x, y, z)	(((TO_BT_ADDR((void *)w) + w->x) - w->y)=
 / w->z)

[Severity: High]
Does this macro perform native arithmetic on little-endian fields?

When used with desc->tx_ctxt, fields like total_size and lring_buf are __le=
16
and __le32. Without endianness conversion, this could produce incorrect
results on big-endian architectures.

[ ... ]
> +	if (len > IPC_MSG_PLD_SZ) {
> +		hdr |=3D IPC_HDR_LONG_MSG;
> +
> +		ptr_buf =3D btss_alloc_lmsg(desc, len,
> +					  &aux_ptr, &is_lbuf_full);
> +		if (IS_ERR(ptr_buf)) {
> +			bt_dev_err(hdev, "TX long buffers full");
> +			hdev->stat.err_tx++;
> +			return PTR_ERR(ptr_buf);
> +		}
> +	}
> +
> +	rinfo =3D btss_get_tx_rbuf(desc, &is_sbuf_full);
> +	if (IS_ERR(rinfo)) {
> +		bt_dev_err(hdev, "TX short buffers full");
> +		hdev->stat.err_tx++;
> +		return PTR_ERR(rinfo);
> +	}

[Severity: Medium]
What happens to the allocated long message buffer if the short message ring
is full?

If btss_alloc_lmsg() succeeds but btss_get_tx_rbuf() subsequently fails, the
function returns an error without undoing the long message reservation. Cou=
ld
this permanently leak long message slots under heavy traffic?

[ ... ]
> +	rbuf->msg_hdr =3D cpu_to_le16(hdr);
> +	rbuf->len =3D cpu_to_le16(len);
> +
> +	rinfo->widx =3D (rinfo->widx + 1) % desc->tx_ctxt->smsg_buf_cnt;

[Severity: High]
Does this index update require a memory barrier?

The payload is written to the shared memory ring buffer, and then the widx
is updated. Without a dma_wmb(), is it possible for the CPU to reorder the
index update before the payload writes are fully visible to the firmware?

[ ... ]
> +	case HCI_COMMAND_PKT: {
> +		if (len < 1 + HCI_COMMAND_HDR_SIZE)
> +			return -EILSEQ;
> +		struct hci_command_hdr *hdr =3D (struct hci_command_hdr *)(data + 1);
> +
> +		pkt_len =3D HCI_COMMAND_HDR_SIZE + le16_to_cpu(hdr->plen);
> +		break;
> +	}

[Severity: High]
Is it safe to use le16_to_cpu() on the plen field?

The plen field in struct hci_command_hdr is an 8-bit unsigned integer. Call=
ing
le16_to_cpu() on it will zero-extend the value and byte-swap it on big-endi=
an
architectures, effectively shifting the length left by 8 bits and causing
large over-allocations.

[ ... ]
> +		case IPC_HDR_PKT_TYPE_HCI:
> +			buf =3D kmalloc(rbuf->len, GFP_ATOMIC);
> +			if (!buf) {
> +				rinfo->ridx =3D ridx;
> +				return -ENOMEM;
> +			}

[Severity: Medium]
Will this memory allocation failure permanently stall the RX queue?

If kmalloc() fails, the function returns -ENOMEM without advancing the ring
index. The next time the worker runs, it will attempt to process the exact
same packet. Unless the packet is dropped and the index advanced, this could
permanently block the ring.

> +
> +			memcpy_fromio(buf, rxbuf, rbuf->len - aux_ptr.len);

[Severity: High]
Does this code safely handle potentially large payload lengths from firmwar=
e?

If the packet is a short message, rxbuf points to the inline 40-byte smsg_d=
ata
buffer. The driver uses the unvalidated rbuf->len for the copy length. Coul=
d a
malfunctioning firmware provide a length greater than 40, leading to an
out-of-bounds read from shared memory?

[ ... ]
> +	for (rinfo =3D &(desc->rx_ctxt->sring_buf_info);
> +	     rinfo !=3D NULL;
> +	     rinfo =3D (struct ring_buffer_info *)(uintptr_t)(rinfo->next)) {

[Severity: High]
Does this properly convert the next pointer from the firmware?

The next field in struct ring_buffer_info is a little-endian offset or addr=
ess
value. Casting it directly to uintptr_t without address translation or endi=
an
conversion could cause a kernel panic due to an invalid page fault when
dereferenced on the next loop iteration.

> +		ret =3D btss_process_rx(desc, rinfo, &ack,
> +				      &desc->rx_ctxt->smsg_buf_cnt);

[Severity: High]
Are we inadvertently overwriting the ring buffer configuration here?

The fourth argument to btss_process_rx() is treated as an output counter and
incremented for every processed packet. However, we are passing the address=
 of
the firmware's fixed smsg_buf_cnt configuration parameter. Incrementing this
will break the modulo arithmetic used for ring buffer indexing.

[ ... ]
> +	for (i =3D 0; i < ehdr->e_phnum; i++) {

[Severity: Medium]
Does this loop verify that the program headers exist within the firmware im=
age?

The loop iterates based on the untrusted e_phnum field from the ELF header.
Could a malformed firmware file specify a high number of program headers,
causing out-of-bounds reads if fw->size is not properly validated?

[ ... ]
> +		if (phdr->p_vaddr + phdr->p_filesz > desc->mem_size) {
> +			dev_err(desc->dev,
> +				"Segment data exceeds the reserved memory area!\n");
> +			goto release_fw;
> +		}

[Severity: High]
Can this bounds check be bypassed by an integer overflow?

The check uses 32-bit arithmetic based on untrusted ELF header fields.
If p_vaddr and p_filesz sum to a value that exceeds 32 bits, they could wrap
around to a small result and pass this check, leading to an out-of-bounds
write when copying the segment data.

[ ... ]
> +		/* Check if firmware is split across multiple segment files */
> +		if (phdr->p_offset > fw->size ||
> +		    phdr->p_offset + phdr->p_filesz > fw->size) {
> +			sprintf(seg_name + strlen(seg_name) - 3, "b%02d", i);

[Severity: High]
Is this string formatting safe from buffer underflows and overflows?

If the original firmware name is less than 3 characters long, strlen - 3 wi=
ll
underflow to a huge value, writing out of bounds. Additionally, if the segm=
ent
index i is 100 or greater, the format string writes 5 bytes into a location
where only 4 bytes were expected, overflowing the kstrdup allocation.

[ ... ]
> +	desc->wq =3D create_singlethread_workqueue("btss_wq");
> +	if (!desc->wq) {
> +		dev_err(dev, "Failed to initialize workqueue\n");
> +		return -EAGAIN;
> +	}
> +
> +	INIT_WORK(&desc->work, btss_worker);
> +
> +	ret =3D devm_request_threaded_irq(dev, desc->irq, NULL, btss_irq_handle=
r,
> +					IRQF_TRIGGER_RISING | IRQF_ONESHOT,
> +					"btss_irq", desc);
> +
> +	if (ret)
> +		dev_err(dev, "error registering irq[%d] ret =3D %d\n",
> +			desc->irq, ret);
> +
> +	return ret;

[Severity: Medium]
Does this error path leak the newly created workqueue?

If devm_request_threaded_irq() fails, the function returns immediately. The
workqueue created by create_singlethread_workqueue() is never destroyed,
leading to a memory leak.

[ ... ]
> +	msleep(BTSS_PWR_CTRL_DELAY_MS);
> +	ret =3D wait_event_timeout(desc->wait_q, READ_ONCE(desc->running),
> +				 msecs_to_jiffies(1000));
> +
> +	if (!ret) {
> +		bt_dev_err(hdev, "Timeout waiting for BTSS start");
> +		return -ETIMEDOUT;
> +	}

[Severity: Medium]
Should we shut down the peripheral on this timeout path?

If the wait times out, the function returns -ETIMEDOUT. Because the open
operation failed, the networking core will not call btqcomipc_close(), which
abandons the DSP in a powered-on state without calling qcom_scm_pas_shutdow=
n().

[ ... ]
> +static int btqcomipc_close(struct hci_dev *hdev)
> +{
> +	int ret;
> +
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

[Severity: Medium]
Should desc->running be reset to false when closing the device?

The shutdown process stops the DSP, but does not clear the desc->running fl=
ag.
If the interface is brought up again, the next btqcomipc_open() might bypass
its wait_event_timeout() check because the flag is still true from the
previous session.

[ ... ]
> +	ret =3D btqcomipc_init(desc);
> +	if (ret)
> +		return dev_err_probe(dev, ret, "Failed to initialize\n");
> +
> +	hdev =3D hci_alloc_dev();

[Severity: High]
Does enabling the IRQ before the HCI device is allocated expose a race cond=
ition?

btqcomipc_init() requests the threaded IRQ, which enables it immediately. I=
f a
spurious interrupt fires before hdev is allocated and assigned to desc->hde=
v,
the worker thread could trigger a NULL pointer dereference when accessing
desc->hdev for logging or processing.

[ ... ]
> +static int btqcomipc_send(struct hci_dev *hdev, struct sk_buff *skb)
> +{
> +	u16 hdr =3D FIELD_PREP(IPC_HDR_PKT_TYPE_MASK, IPC_HDR_PKT_TYPE_HCI);
> +	struct qcom_btss *desc =3D hci_get_drvdata(hdev);
> +	int ret;
> +
> +	if (unlikely(!READ_ONCE(desc->running))) {
> +		bt_dev_err(hdev,
> +			   "BTSS not initialized, failed to send message");
> +		ret =3D -ENODEV;
> +		goto free_skb;
> +	}
> +
> +	ret =3D btss_send(desc, hdr, skb);

[Severity: High]
Is there a data race when accessing the TX ring buffer?

This entry point from the HCI stack calls btss_send() without acquiring
desc->lock. Concurrently, btss_worker() can also call btss_send() with
desc->lock held. Executing both paths simultaneously could corrupt the
ring buffer indices and free space counters.

[ ... ]
> +static void btqcomipc_remove(struct platform_device *pdev)
> +{
> +	struct qcom_btss *desc =3D platform_get_drvdata(pdev);
> +
> +	if (!desc)
> +		return;
> +
> +	btqcomipc_deinit(desc);
> +
> +	if (desc->hdev) {
> +		hci_unregister_dev(desc->hdev);
> +		hci_free_dev(desc->hdev);
> +	}
> +}

[Severity: High]
Could the teardown order lead to use-after-free or leaked packets?

btqcomipc_deinit() purges the TX queue and destroys the workqueue. If this
happens before hci_unregister_dev() removes the device from the networking
core, the core could still call hdev->send(), which would place packets into
the destroyed TX queue or attempt to schedule the destroyed workqueue.

--=20
Sashiko AI review =C2=B7 https://sashiko.dev/#/patchset/20260703-ipq5018-bl=
uetooth-v3-0-62da72818ab3@outlook.com?part=3D4
