Received: from smtp.kernel.org (aws-us-west-2-korg-mail-alma10-1.taild15c8.ts.net [100.103.45.18])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 0EC223FBEC1
	for <devicetree@vger.kernel.org>; Tue, 30 Jun 2026 13:02:07 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=100.103.45.18
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1782824529; cv=none; b=kSOSOKEjTMxtdMh0uLtXASMf2v5IxP48cPv+br21Xa8+FelZcqocvM5i5vnVwS2uCrZ3/Leo6UIKf4vKtjjR6lc7s3miQgkqYspPOt4ngKAwWeePV8HCxGdI8gVWRrQx0d2eSwp1kVrXPRU94Jc9J2hsNDvn18HuHJoZi/tTguI=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1782824529; c=relaxed/simple;
	bh=jTTS8YtXvT+OdSpIU8jbt6wJuOwABUCWoFzCswO3cwM=;
	h=From:Subject:To:Cc:In-Reply-To:References:Content-Type:Date:
	 Message-Id; b=t/iN7YIIAhlVHHVp4MMDxYpgqXA/6xnRkaFm7o/0qce6Ctvw8khaxz3Ry01tgLMIDE9Kaz/dzkp9l189QA4U4SbO7K2KRzxShoAT+hzCauVOQwcLz1kl61DuFU76ui4RV20cKokdN0INM099d3PnqadzZq2u6egQf09vPUtBr64=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=f3Fjc38l; arc=none smtp.client-ip=100.103.45.18
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="f3Fjc38l"
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 52EED1F00ADB;
	Tue, 30 Jun 2026 13:02:06 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kernel.org;
	s=k20260515; t=1782824527;
	bh=JsTLkyJUuogvoEA1PXCpjrXY8tIbg6Dy1/hsuOh+iWw=;
	h=From:Subject:Reply-To:To:Cc:In-Reply-To:References:Date;
	b=f3Fjc38lXPR/bMvYGH/p1MSA/oyD5mZKg9wfip9YtW9LKQqzIxkSm4ub0CEXG1nxy
	 7e+2OFMYapUUWc98aft5LQNVGCippDTh/eWffJZsYCLCjHAijMo7NxCSfuP9VbI4rj
	 Tr3ex1ubAlX33DXbUrxSYrX/Ykgp0fpIYqyWAYHUzxg/Y2qUC53upniucBN8DnybrA
	 61eqFoJmNmUpjl9mhZyYYfMpi8W76qc/GIrQKHZzkSsVBKvK0+eGGcIMjeLomIfkCv
	 wPDLwbHBfppB9Jwozp3U4sRIQ4uH0u/RbfLMRoZyTRTnSeIAxDe5q2WSdyKQtZQm4w
	 VNUyYa7YYEm0Q==
From: sashiko-bot@kernel.org
Subject: Re: [PATCH v2 4/6] Bluetooth: Introduce Qualcomm IPQ5018 IPC based
 HCI driver
Reply-To: sashiko-reviews@lists.linux.dev
To: "George Moussalem via B4 Relay" <devnull+george.moussalem.outlook.com@kernel.org>
Cc: conor+dt@kernel.org, devicetree@vger.kernel.org, robh@kernel.org
In-Reply-To: <20260629-ipq5018-bluetooth-v2-4-02770f03b6bb@outlook.com>
References: <20260629-ipq5018-bluetooth-v2-0-02770f03b6bb@outlook.com>
 <20260629-ipq5018-bluetooth-v2-4-02770f03b6bb@outlook.com>
Content-Type: text/plain; charset=utf-8
Content-Transfer-Encoding: quoted-printable
Date: Tue, 30 Jun 2026 13:02:06 +0000
Message-Id: <20260630130207.52EED1F00ADB@smtp.kernel.org>
Precedence: bulk
X-Mailing-List: devicetree@vger.kernel.org
List-Id: <devicetree.vger.kernel.org>
List-Subscribe: <mailto:devicetree+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:devicetree+unsubscribe@vger.kernel.org>

Thank you for your contribution! Sashiko AI review found 22 potential issue=
(s) to consider:
- [High] Vulnerability / Integer Overflow in Firmware ELF Parsing
- [High] Vulnerability / Heap Buffer Overflow in Firmware Splitting
- [High] Vulnerability / Invalid Pointer Dereference in Ring Buffer Iterati=
on
- [High] Vulnerability / Divide by Zero from Untrusted Firmware Memory
- [High] Concurrency / Data Race in TX Ring Buffer
- [High] Vulnerability / Out-of-Bounds Read in Split Firmware Segment Loadi=
ng
- [High] Logic Error / Endianness Conversion Missing on Shared Structures
- [High] Race Condition / NULL Pointer Dereference on Early IRQ
- [High] Logic Bug / State Machine Failure on Device Close
- [High] Logic Error / Endianness Issue in Packet Length Conversion
- [High] Vulnerability / Out-of-Bounds Read on Short Messages
- [High] Teardown Ordering / Hanging and Resource Leak on Driver Unbind
- [High] Vulnerability / Heap Buffer Overflow due to Integer Underflow
- [High] Vulnerability / Denial of Service via Linked List Cycle
- [High] I/O Memory Access Violation and Missing Memory Barriers
- [High] Logic Error / Ring Buffer Configuration Memory Corruption
- [Medium] Resource Leak / Leaked Workqueue on Probe Error
- [Medium] Resource Leak / Missing TrustZone PAS Shutdown on Open Timeout
- [Low] Build Failure / Missing Dependencies
- [Low] Code Style / Cleanup Rule Violation (Goto Mixing)
- [Low] API Misuse / Incorrect Free Function for Success Path
- [Low] Logic Error / Statistics Corruption on Failed Transmissions
--

commit ec79eeaa3b7302e6db1f42d811d3977beecf78c1
Author: George Moussalem <george.moussalem@outlook.com>

Bluetooth: Introduce Qualcomm IPQ5018 IPC based HCI driver

Add support for the Bluetooth controller found in the IPQ5018 SoC.
This driver implements firmware loading and the transport layer between
the HCI core and the Bluetooth controller.

> diff --git a/drivers/bluetooth/Kconfig b/drivers/bluetooth/Kconfig
> --- a/drivers/bluetooth/Kconfig
> +++ b/drivers/bluetooth/Kconfig
> @@ -453,6 +453,17 @@ config BT_MTKUART
>  	  Say Y here to compile support for MediaTek Bluetooth UART devices
>  	  into the kernel or say M to compile it as module (btmtkuart).
> =20
> +config BT_QCOMIPC
> +	tristate "Qualcomm IPQ5018 IPC based HCI support"
> +	select BT_QCA

[Severity: Low]
Does this Kconfig entry miss required dependencies? It appears that
select QCOM_MDT_LOADER and depends on QCOM_SCM are required to successfully
compile and link the driver.

[ ... ]

> diff --git a/drivers/bluetooth/btqcomipc.c b/drivers/bluetooth/btqcomipc.c
> --- /dev/null
> +++ b/drivers/bluetooth/btqcomipc.c

[ ... ]

> +static void *btss_alloc_lmsg(struct qcom_btss *desc, u32 len,
> +			     struct ipc_aux_ptr *aux_ptr, bool *is_lbuf_full)
> +{
> +	struct device *dev =3D desc->dev;
> +	u8 idx, blks, blks_consumed;
> +	void *ret_ptr;
> +	u32 lsz;
> +
> +	if (desc->tx_ctxt->lring_buf =3D=3D 0) {
> +		dev_err(dev, "no long message buffer initialized\n");
> +		return ERR_PTR(-ENODEV);
> +	}
> +
> +	lsz =3D IPC_LBUF_SZ(desc->tx_ctxt, total_size, lring_buf, lmsg_buf_cnt);

[Severity: High]
Can this calculation result in data corruption on big-endian systems?
The IPC_LBUF_SZ macro operates directly on fields in desc->tx_ctxt which are
defined as __le16 and __le32. It looks like they are being used in arithmet=
ic
without conversions like le16_to_cpu() or le32_to_cpu().

[ ... ]

> +static struct ring_buffer_info *btss_get_tx_rbuf(struct qcom_btss *desc,
> +						 bool *is_sbuf_full)
> +{
> +	u8 idx;
> +	struct ring_buffer_info *rinfo;
> +
> +	for (rinfo =3D &(desc->tx_ctxt->sring_buf_info);	rinfo !=3D NULL;
> +		rinfo =3D (struct ring_buffer_info *)(uintptr_t)(rinfo->next)) {

[Severity: High]
Is it safe to directly cast rinfo->next to a kernel pointer?
The rinfo->next value is an untrusted 32-bit little-endian physical offset
provided by the firmware. On a 64-bit kernel, casting this directly into a
pointer might result in an unmapped address, potentially causing a kernel
panic when dereferenced in the next loop iteration.

[Severity: High]
Could an adversary trigger a denial of service here?
Since the list traversal reads the next pointer from untrusted shared memor=
y,
a malicious firmware could form a circular linked list. Without cycle
detection, the worker thread might spin indefinitely.

> +		idx =3D (rinfo->widx + 1) % (desc->tx_ctxt->smsg_buf_cnt);

[Severity: High]
Could this lead to a divide-by-zero crash?
The driver trusts smsg_buf_cnt which is located in the shared context rings
and writable by the Bluetooth processor. A compromised firmware could set t=
his
count to zero.

[ ... ]

> +static int btss_send(struct qcom_btss *desc, u16 msg_hdr,
> +		     struct sk_buff *skb)
> +{

[ ... ]

> +complete_tx:
> +	rbuf->msg_hdr =3D cpu_to_le16(hdr);
> +	rbuf->len =3D cpu_to_le16(len);

[Severity: High]
Can these assignments to I/O memory cause data corruption?
The desc->mem_region is mapped via devm_ioremap(), but this code accesses
the shared memory using normal pointer assignments instead of proper
accessors. Furthermore, there are no memory barriers (like dma_wmb()) betwe=
en
copying the payload and updating the header, so the compiler or CPU might
reorder the writes and expose incomplete payloads.

[ ... ]

> +static inline int btss_recv_hci_frame(struct qcom_btss *desc, const u8 *=
data,
> +				      size_t len)
> +{

[ ... ]

> +	case HCI_COMMAND_PKT: {
> +		if (len < 1 + HCI_COMMAND_HDR_SIZE)
> +			return -EILSEQ;
> +		struct hci_command_hdr *hdr =3D (struct hci_command_hdr *)(data + 1);
> +
> +		pkt_len =3D HCI_COMMAND_HDR_SIZE + le16_to_cpu(hdr->plen);

[Severity: High]
Will this corrupt packet lengths on big-endian platforms?
The hdr->plen field is defined as __u8. Passing a __u8 to le16_to_cpu()
implicitly casts it to __u16 before byte-swapping, so a length of 0x05 might
become 0x0500.

[ ... ]

> +	skb =3D bt_skb_alloc(pkt_len, GFP_ATOMIC);
> +	if (!skb) {
> +		desc->hdev->stat.err_rx++;

[Severity: High]
Can this cause a NULL pointer dereference during early IRQ handling?
The interrupt is enabled in btqcomipc_probe() before desc->hdev is allocate=
d.
If the firmware was left running and a pending interrupt fires immediately,
the worker will eventually call btss_recv_hci_frame() and try to increment
stat.err_rx on a NULL desc->hdev.

[ ... ]

> +static inline int btss_process_rx(struct qcom_btss *desc,
> +				  struct ring_buffer_info *rinfo,
> +				  bool *ack, u8 *rx_count)
> +{

[ ... ]

> +	while (ridx !=3D rinfo->widx) {
> +		memset(&aux_ptr, 0, sizeof(struct ipc_aux_ptr));
> +
> +		rbuf =3D &((struct ring_buffer *)(TO_APPS_ADDR(rinfo->rbuf)))[ridx];
> +
> +		if (rbuf->msg_hdr & IPC_HDR_LONG_MSG) {

[Severity: High]
Is this an endianness conversion issue?
The msg_hdr field is explicitly __le16, but is being evaluated natively
against a host constant without using le16_to_cpu().

> +			rxbuf =3D TO_APPS_ADDR(rbuf->payload.lmsg_data);
> +			lsz =3D IPC_LBUF_SZ(desc->rx_ctxt, total_size, lring_buf,
> +				   lmsg_buf_cnt);
> +
> +			if (IS_RX_MEM_NON_CONTIGIOUS(rbuf->payload.lmsg_data,
> +						     rbuf->len, lsz)) {
> +				lbuf_idx =3D GET_RX_INDEX_FROM_BUF(
> +						rbuf->payload.lmsg_data, lsz);
> +
> +				blks_consumed =3D desc->rx_ctxt->lmsg_buf_cnt -
> +					lbuf_idx;
> +				aux_ptr.len =3D rbuf->len - (blks_consumed * lsz);

[Severity: High]
Could this subtraction result in an integer underflow?
Both rbuf->len and aux_ptr.len are controlled by the untrusted firmware.
An attacker could manipulate them so that aux_ptr.len becomes larger than
rbuf->len, underflowing into a massive value.

[ ... ]

> +		switch (pkt_type) {
> +		case IPC_HDR_PKT_TYPE_HCI:
> +			buf =3D kmalloc(rbuf->len, GFP_ATOMIC);
> +			if (!buf) {
> +				rinfo->ridx =3D ridx;
> +				return -ENOMEM;
> +			}
> +
> +			memcpy_fromio(buf, rxbuf, rbuf->len - aux_ptr.len);

[Severity: High]
Does this allow out-of-bounds reads on short messages?
For short messages, rxbuf points to a fixed 40-byte array (smsg_data). If
the firmware maliciously provides an rbuf->len greater than 40, this could
read past the end of the array.

Additionally, if the aux_ptr.len subtraction underflowed as noted above,
this memcpy_fromio() could overwrite the allocated buf bounds with a
massive copy size.

[ ... ]

> +		ridx =3D (ridx + 1) % rinfo->ring_buf_cnt;
> +
> +		if (rx_count)
> +			(*rx_count)++;

[Severity: High]
Is this incrementing the maximum capacity configuration field?
When btss_worker() passes &desc->rx_ctxt->smsg_buf_cnt as the rx_count
parameter, this will increment the shared hardware configuration field that
defines the ring's maximum capacity, corrupting the hardware contract.

[ ... ]

> +static void btss_process_ack(struct qcom_btss *desc)
> +{

[ ... ]

> +		while (tidx !=3D rinfo->ridx) {
> +			if (rbuf[tidx].msg_hdr & IPC_HDR_LONG_MSG) {
> +				btss_free_lmsg(desc,
> +					       rbuf[tidx].payload.lmsg_data,
> +					       rbuf[tidx].len);
> +			}
> +
> +			tidx =3D (tidx + 1) % desc->tx_ctxt->smsg_buf_cnt;

[Severity: High]
Could this also lead to a divide-by-zero crash?
Like earlier, if the firmware sets the shared smsg_buf_cnt to zero, this
modulo operation will trigger a divide-by-zero exception.

[ ... ]

> +static void btss_worker(struct work_struct *work)
> +{

[ ... ]

> +	for (rinfo =3D &(desc->rx_ctxt->sring_buf_info);
> +	     rinfo !=3D NULL;
> +	     rinfo =3D (struct ring_buffer_info *)(uintptr_t)(rinfo->next)) {
> +		ret =3D btss_process_rx(desc, rinfo, &ack,
> +				      &desc->rx_ctxt->smsg_buf_cnt);

[Severity: High]
Is it safe to directly cast rinfo->next to a kernel virtual pointer here?
This suffers from the same issue as in btss_get_tx_rbuf() and could lead to
an invalid pointer dereference or infinite loop without cycle detection.

[ ... ]

> +static int btcomqipc_firmware_load(struct qcom_btss *desc)
> +{
> +	const struct elf32_phdr *phdrs;
> +	const struct firmware *seg_fw;
> +	const struct elf32_phdr *phdr;
> +	const struct elf32_hdr *ehdr;
> +	const struct firmware *fw;
> +	int i, ret;
> +
> +	ret =3D request_firmware(&fw, desc->firmware, desc->dev);
> +	if (ret) {
> +		dev_err(desc->dev, "Failed to request firmware: %d\n",
> +			ret);
> +		return ret;
> +	}
> +
> +	ehdr =3D (const struct elf32_hdr *)fw->data;
> +	phdrs =3D (const struct elf32_phdr *)(ehdr + 1);
> +
> +	ret =3D qcom_mdt_pas_init(desc->dev, fw, desc->firmware,
> +				BTSS_PAS_ID, desc->mem_phys, NULL);

[Severity: Low]
Is this function call correct?
It seems that qcom_mdt_pas_init() is an internal function not exported in
include/linux/soc/qcom/mdt_loader.h. Should this be qcom_mdt_pas_load()
instead?

> +	if (ret) {
> +		dev_err(desc->dev, "PAS init failed: %d\n", ret);
> +		goto release_fw;
> +	}
> +
> +	for (i =3D 0; i < ehdr->e_phnum; i++) {
> +		char *seg_name __free(kfree) =3D kstrdup(desc->firmware,
> +						       GFP_KERNEL);
> +		if (!seg_name) {
> +			ret =3D -ENOMEM;
> +			goto release_fw;
> +		}

[Severity: Low]
Does this mix goto-based error handling with scope-based cleanup?
The kernel guidelines indicate that functions should not mix goto-based
cleanup labels (like goto release_fw) with __free() variable declarations.

> +
> +		phdr =3D &phdrs[i];
> +
> +		/* Only process valid loadable data segments */
> +		if (phdr->p_type !=3D PT_LOAD || !phdr->p_memsz)
> +			continue;
> +
> +		if (phdr->p_vaddr + phdr->p_filesz > desc->mem_size) {

[Severity: High]
Could this be vulnerable to a 32-bit integer overflow?
The fields p_vaddr and p_filesz are read from the ELF header. A maliciously
crafted firmware could supply extremely large values to trigger a wraparoun=
d,
bypassing this boundary check before the memcpy_toio().

> +			dev_err(desc->dev,
> +				"Segment data exceeds the reserved memory area!\n");
> +			goto release_fw;
> +		}
> +
> +		/* Check if firmware is split across multiple segment files */
> +		if (phdr->p_offset > fw->size ||
> +		    phdr->p_offset + phdr->p_filesz > fw->size) {
> +			sprintf(seg_name + strlen(seg_name) - 3, "b%02d", i);

[Severity: High]
Can this result in a heap buffer underflow or overflow?
The seg_name buffer is allocated exactly to the length of desc->firmware.
If the firmware name length is less than 3, the pointer arithmetic wraps
around causing a wild out-of-bounds write. Furthermore, if i >=3D 100,
the format specifier %02d writes 3 or more characters plus a null terminato=
r,
which will exceed the allocated string boundary.

> +			ret =3D request_firmware(&seg_fw, seg_name,
> +					       desc->dev);
> +			if (ret) {
> +				dev_err(desc->dev,
> +					"Could not find split segment binary: %s\n",
> +					seg_name);
> +				goto release_fw;
> +			}
> +
> +			/*
> +			 * Use the virtual instead of the physical address as
> +			 * the offset
> +			 */
> +			memcpy_toio(desc->mem_region + phdr->p_vaddr,
> +				    seg_fw->data, phdr->p_filesz);

[Severity: High]
Does this copy implicitly trust phdr->p_filesz?
The driver does not appear to verify that the loaded file size (seg_fw->siz=
e)
is at least phdr->p_filesz. A truncated segment file could cause memcpy_toio
to read past the end of the seg_fw->data buffer.

[ ... ]

> +static int btqcomipc_open(struct hci_dev *hdev)
> +{

[ ... ]

> +	/* Boot firmware */
> +	ret =3D qcom_scm_pas_auth_and_reset(BTSS_PAS_ID);
> +	if (ret) {
> +		bt_dev_err(hdev, "Failed to boot firmware: %d", ret);
> +		return ret;
> +	}
> +
> +	msleep(BTSS_PWR_CTRL_DELAY_MS);
> +	ret =3D wait_event_timeout(desc->wait_q, READ_ONCE(desc->running),
> +				 msecs_to_jiffies(1000));
> +
> +	if (!ret) {
> +		bt_dev_err(hdev, "Timeout waiting for BTSS start");
> +		return -ETIMEDOUT;
> +	}

[Severity: Medium]
Is the TrustZone PAS allocation leaked if this timeout triggers?
If wait_event_timeout() times out, the function returns -ETIMEDOUT without
cleaning up the PAS allocation. The Bluetooth core subsystem does not invoke
close() when open() fails, leaving the peripheral core running.

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

[Severity: High]
Should desc->running be reset to false here?
When the device is brought down, desc->running remains true. If the device
is opened again, the wait_event_timeout() check in btqcomipc_open() will see
it as true from the previous session and return immediately without actually
waiting for the firmware to initialize.

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
Can this cause a data race in the TX ring buffer?
The btss_send() function is invoked without acquiring desc->lock, modifying
shared TX ring state like widx and free counters. Concurrently, btss_worker=
()
runs in process context with the lock held and modifies the exact same state
via btss_process_ack().

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
> +		} else {
> +			bt_dev_err(hdev, "Failed to send message: %d", ret);
> +			hdev->stat.err_tx++;
> +		}
> +	}
> +
> +	btqcomipc_update_stats(desc->hdev, skb);

[Severity: Low]
Is it intentional to update statistics on failed transmissions?
If btss_send() fails and falls through to this point, byte_tx and cmd_tx wi=
ll
be incremented for packets that were actually dropped.

> +
> +free_skb:
> +	kfree_skb(skb);

[Severity: Low]
Should this use consume_skb() for successful transmissions?
If the packet was successfully consumed by the hardware, using kfree_skb()
can cause network monitoring tools to falsely report these packets as dropp=
ed.

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

[Severity: Medium]
Is the workqueue permanently leaked if the IRQ request fails?
If devm_request_threaded_irq() returns an error, the function exits without
calling destroy_workqueue(), leaking the non-devres managed workqueue.

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

[Severity: High]
Could this teardown ordering cause a hang during unbind?
By calling btqcomipc_deinit() first, the driver disables the IRQ. Then,
hci_unregister_dev() tries to gracefully shut down the controller by sending
an HCI_OP_RESET command. Because the IRQ is disabled, the response is never
received, leading to a multi-second timeout.

--=20
Sashiko AI review =C2=B7 https://sashiko.dev/#/patchset/20260629-ipq5018-bl=
uetooth-v2-0-02770f03b6bb@outlook.com?part=3D4
