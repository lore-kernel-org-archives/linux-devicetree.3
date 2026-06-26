Received: from smtp.kernel.org (aws-us-west-2-korg-mail-alma10-1.taild15c8.ts.net [100.103.45.18])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id D5FAC3F789B
	for <devicetree@vger.kernel.org>; Fri, 26 Jun 2026 14:10:49 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=100.103.45.18
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1782483051; cv=none; b=ZH4zFskJ8L2qQnOLs1khubuwXduCKSqbE1LX/MHT232+OpEhbMPE1A5ZIrj0EY1DuRB5rTwskWl9n86NLBdVhDhSjR5aTNOsJDkAVe5rehZv3rEP1JSbuH0EFCHURH3PV45fSh+X3MA2MT429DyxQb/jR6QbGWCshK/0fpwQ20M=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1782483051; c=relaxed/simple;
	bh=+MHzD6n7C7zp/s4uvnfpii+b9CeMe/8phRnA6Ywv9F8=;
	h=From:Subject:To:Cc:In-Reply-To:References:Content-Type:Date:
	 Message-Id; b=i+zLOhn6982qITaIMQeB6shSREXzJnHCTm1hfJXT+FAsvKTCDKJBmHsJND324n/TACPe3Nz30hCd3XrZA096QqdnUG9/ixVVFbT7q7dNKOSyhnwRTkrvXSgi54UZvvY4GvWU5GKmoQaLhnpFi3ExjVdzYuFsy/TVQ1JiT+ruPqo=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=U5NS+etV; arc=none smtp.client-ip=100.103.45.18
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="U5NS+etV"
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 57F871F00A3A;
	Fri, 26 Jun 2026 14:10:49 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kernel.org;
	s=k20260515; t=1782483049;
	bh=jc5/FEm3oIYUDxrJ7S5mS9YoOHTAv+DHD6X8/mzOqY0=;
	h=From:Subject:Reply-To:To:Cc:In-Reply-To:References:Date;
	b=U5NS+etVjq3G3PdjbON5OPMj4cpazk6KLv24P1AOjpmKKgt9SvbjEF03nDwdXp17r
	 Dt6Vewl+Gc69Fkq34XkuatrE67EPJUiezCJFm2GsEWe+hCcowwA2QEMgz/8Do4pCqh
	 mCKGF6/2aKPUZo3ysXB0o3XivAZWWce8P0nmIYMyTfX4PrApUTzCnL5d5lye+WwIBB
	 hnIpZYu94jsJEpPSIu+oIqdD73F2/BdlAdmRPTbuMybdSH5Us3XhyiVd5c9QdeUSCj
	 D+dG25SdEZzdBjriU3oqzJeixzKTDfDp5trrizAzIr/8ydxv5VSBcjl1piMlSw8E43
	 9OjVMmO4PSvDA==
From: sashiko-bot@kernel.org
Subject: Re: [PATCH 5/6] Bluetooth: Introduce Qualcomm IPQ5018 IPC based HCI
 driver
Reply-To: sashiko-reviews@lists.linux.dev
To: "George Moussalem via B4 Relay" <devnull+george.moussalem.outlook.com@kernel.org>
Cc: devicetree@vger.kernel.org, conor+dt@kernel.org, robh@kernel.org
In-Reply-To: <20260625-ipq5018-bluetooth-v1-5-d999be0e04f7@outlook.com>
References: <20260625-ipq5018-bluetooth-v1-0-d999be0e04f7@outlook.com>
 <20260625-ipq5018-bluetooth-v1-5-d999be0e04f7@outlook.com>
Content-Type: text/plain; charset=utf-8
Content-Transfer-Encoding: quoted-printable
Date: Fri, 26 Jun 2026 14:10:48 +0000
Message-Id: <20260626141049.57F871F00A3A@smtp.kernel.org>
Precedence: bulk
X-Mailing-List: devicetree@vger.kernel.org
List-Id: <devicetree.vger.kernel.org>
List-Subscribe: <mailto:devicetree+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:devicetree+unsubscribe@vger.kernel.org>

Thank you for your contribution! Sashiko AI review found 12 potential issue=
(s) to consider:
- [Critical] Integer underflow when computing auxiliary pointer lengths cau=
ses a heap buffer overflow.
- [Critical] Unvalidated shared memory offsets allow the M0 co-processor to=
 trigger arbitrary out-of-bounds reads/writes on the host.
- [High] Missing locking in the TX path corrupts shared IPC ring buffers an=
d state.
- [High] Lifecycle mismanagement of the workqueue and IRQ leads to memory l=
eaks and broken interface toggling.
- [High] Device memory offsets are cast directly to host virtual pointers i=
n ring buffer loops.
- [High] Off-by-one errors during HCI frame length validation allow out-of-=
bounds memory reads.
- [High] Directly dereferencing __iomem memory via struct pointers violates=
 safe I/O access and triggers synchronous aborts.
- [High] Permanent leak of shared long message buffer capacity on failed sh=
ort buffer acquires.
- [High] Unvalidated indices from shared memory can hang the workqueue thre=
ad in an infinite loop.
- [High] Lockless IPC ring buffers omit memory barriers, risking data corru=
ption due to reordering.
- [Medium] Native arithmetic and bitwise operations on little-endian IPC st=
ructures break big-endian compatibility.
- [Medium] Missing acquire/release memory barriers around `desc->running` f=
lag risk NULL pointer dereferences.
--

commit b13642cec5c040da0ea77113de5feea1556c0a79
Author: George Moussalem <george.moussalem@outlook.com>
Bluetooth: Introduce Qualcomm IPQ5018 IPC based HCI driver

This commit adds support for the Qualcomm IPQ5018 Bluetooth chip, using
shared memory for transport between the host and the M0 co-processor.
It implements ring buffers for communication and uses IPC registers
and interrupts for event notifications.

> --- /dev/null
> +++ b/drivers/bluetooth/btqcomipc.c
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
Can this direct pointer cast cause a panic?=20

The firmware provides the next ring buffer via rinfo->next, which is an=20
__le32 field in shared memory.=20

Directly casting this 32-bit device offset to a host virtual pointer might
result in an unmapped address being dereferenced on the next loop iteration.

[ ... ]
> +static int btss_send(struct qcom_btss *desc, u16 msg_hdr,
> +		     struct sk_buff *skb)
> +{
[ ... ]
> +	if (len > IPC_MSG_PLD_SZ) {
> +		hdr |=3D IPC_HDR_LONG_MSG;
> +
> +		ptr_buf =3D btss_alloc_lmsg(desc, len,
> +					  &aux_ptr, &is_lbuf_full);
> +		if (IS_ERR(ptr_buf)) {
> +			bt_dev_err(hdev, "long msg buf full");
> +			hdev->stat.err_tx++;
> +			return PTR_ERR(ptr_buf);
> +		}
> +	}
> +
> +	rinfo =3D btss_get_tx_rbuf(desc, &is_sbuf_full);
> +	if (IS_ERR(rinfo)) {
> +		bt_dev_err(hdev, "short msg buf full");
> +		hdev->stat.err_tx++;
> +		return PTR_ERR(rinfo);
> +	}

[Severity: High]
Does returning early here permanently leak the long message buffer?

When transmitting a large packet, btss_alloc_lmsg() reserves space in the
long message ring. If the short ring is full and btss_get_tx_rbuf() returns
-EAGAIN, the network stack requeues the packet.

The successfully allocated long message space doesn't appear to be freed,
which could exhaust the IPC transport's capability upon retries.

[ ... ]
> +	rbuf->msg_hdr =3D cpu_to_le16(hdr);
> +	rbuf->len =3D cpu_to_le16(len);
> +
> +	rinfo->widx =3D (rinfo->widx + 1) % desc->tx_ctxt->smsg_buf_cnt;

[Severity: High]
Are memory barriers required here to prevent reordering?=20

The IPC protocol uses lockless ring buffers across the CPU and coprocessor.
Without a wmb() before updating rinfo->widx, the M0 processor might perceive
the incremented write index before the payload writes are fully visible.

[ ... ]
> +static inline int btss_recv_hci_frame(struct qcom_btss *desc, const u8 *=
data, size_t len)
> +{
[ ... ]
> +	case HCI_EVENT_PKT:
> +	{
> +		if (len < HCI_EVENT_HDR_SIZE)
> +			return -EILSEQ;

[Severity: High]
Could this size check allow out-of-bounds reads?

The len parameter includes the 1-byte packet type prefix in data[0], but
validations like this one do not account for it. If len is exactly
HCI_EVENT_HDR_SIZE (2 bytes), the check passes.

Reading hdr->plen could then access out-of-bounds memory.

[ ... ]
> +	if (pkt_len > len)
> +		return -EINVAL;

[Severity: High]
Similarly, does this permit an out-of-bounds read during the skb data copy?

If pkt_len is exactly equal to len, the subsequent call to
skb_put_data(skb, data + 1, pkt_len) will copy len bytes from a buffer tail
that only contains len - 1 bytes.

[ ... ]
> +static inline int btss_process_rx(struct qcom_btss *desc,
> +				  struct ring_buffer_info *rinfo,
> +				  bool *ack, u8 *rx_count)
> +{
[ ... ]
> +	while (ridx !=3D rinfo->widx) {

[Severity: High]
Can this loop hang the workqueue thread?=20

The termination relies on ridx matching rinfo->widx, which is read from
shared memory. If the firmware provides a corrupted widx that is greater
than or equal to ring_buf_cnt, the modulo-wrapped ridx will never match it.

This could potentially cause an infinite loop, halting IPC processing.

[ ... ]
> +		if (rbuf->msg_hdr & IPC_HDR_LONG_MSG) {

[Severity: Medium]
Does this code safely handle endianness?=20

The IPC protocol structures define sizes and offsets as explicit __le16 and
__le32 fields. Performing bitwise operations like rbuf->msg_hdr &
IPC_HDR_LONG_MSG without conversion could yield reversed bytes on big-endian
architectures.

> +			rxbuf =3D TO_APPS_ADDR(rbuf->payload.lmsg_data);

[Severity: Critical]
Does this translation of the payload offset trust the M0 firmware too much?

TO_APPS_ADDR() translates the untrusted 32-bit value into a direct host
pointer. If the coprocessor supplies a maliciously large offset, the pointer
could aim outside the ioremapped mem_region.

This could allow arbitrary out-of-bounds reads.

[ ... ]
> +				blks_consumed =3D desc->rx_ctxt->lmsg_buf_cnt -
> +					lbuf_idx;
> +				aux_ptr.len =3D rbuf->len - (blks_consumed * lsz);

[Severity: Critical]
Can this calculation underflow and cause a heap buffer overflow?=20

Both blks_consumed and lsz are derived from inputs supplied by the
coprocessor. If (blks_consumed * lsz) is greater than rbuf->len,
aux_ptr.len will wrap to an excessively large 32-bit value.

[ ... ]
> +		case IPC_HDR_PKT_TYPE_HCI:
> +			buf =3D kmalloc(rbuf->len, GFP_ATOMIC);

[Severity: Medium]
As noted above, using the __le16 field rbuf->len directly in kmalloc() on
big-endian architectures could lead to excessively large allocation request=
s.

[ ... ]
> +			memcpy_fromio(buf, rxbuf, rbuf->len - aux_ptr.len);

[Severity: Critical]
If aux_ptr.len underflows, this subtraction evaluates back to the large
(blks_consumed * lsz) value.=20

Since buf is only allocated to rbuf->len, could this copy operation
write far out-of-bounds?

[ ... ]
> +static void btss_worker(struct work_struct *work)
> +{
[ ... ]
> +	if (unlikely(!READ_ONCE(desc->running))) {
> +		// FW sets offset of RX context info at start of memory region upon bo=
ot
> +		offset =3D readl(desc->mem_region);
> +		dev_dbg(desc->dev, "offset after M0 boot: 0x%08x\n", offset);
> +		desc->rx_ctxt =3D (struct context_info *)(desc->mem_region + offset);

[Severity: Critical]
Does this offset need bounds checking?=20

The offset is read directly from the coprocessor and used to set the context
pointer. If an abnormally large offset is provided, this could point outside
the allocated mem_size, leading to out-of-bounds accesses.

[Severity: High]
Does this directly dereference I/O memory using a host struct pointer?

The shared memory region is mapped as void __iomem, but here it is cast to
a native struct context_info pointer. Because the struct is packed, the
compiler might generate unaligned or byte-wise loads when its fields are
accessed.=20

On architectures like ARM64, unaligned loads to strongly-ordered device
memory can trigger synchronous external aborts.

[ ... ]
> +static int btss_init(struct qcom_btss *desc)
> +{
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

[ ... ]
> +static int btqcomipc_close(struct hci_dev *hdev)
> +{
> +	struct qcom_btss *desc =3D hci_get_drvdata(hdev);
> +
> +	rproc_shutdown(desc->rproc);
> +	msleep(POWER_CONTROL_DELAY_MS);
> +
> +	return 0;
> +}

[Severity: High]
Does this implementation leak the workqueue and break interface toggling?

During btqcomipc_open(), btss_init() allocates a new workqueue and requests
the IRQ line. However, btqcomipc_close() doesn't tear down the workqueue or
free the IRQ.=20

Toggling the interface via 'hciconfig hci0 down && hciconfig hci0 up'
would leak the workqueue, and the subsequent open might fail with -EBUSY
since the IRQ is already registered.

[ ... ]
> +static int btqcomipc_send(struct hci_dev *hdev, struct sk_buff *skb)
> +{
> +	u16 hdr =3D FIELD_PREP(IPC_HDR_PKT_TYPE_MASK, IPC_HDR_PKT_TYPE_HCI);
> +	struct qcom_btss *desc =3D hci_get_drvdata(hdev);
> +	int ret;
> +
> +	if (unlikely(!READ_ONCE(desc->running))) {

[Severity: Medium]
Is a memory barrier needed here to safely access the dependent context
pointers?=20

In btss_recv_cust_frame(), pointers to shared context regions are populated
before calling WRITE_ONCE(desc->running, true). Without smp_store_release()
and smp_load_acquire(), weakly-ordered architectures could reorder the
execution.

This could allow the path below to observe desc->running as true while
reading a stale or NULL tx_ctxt.

> +		bt_dev_err(hdev, "BTSS not initialized, failed to send message");
> +		ret =3D -ENODEV;
> +		goto free_skb;
> +	}
> +
> +	ret =3D btss_send(desc, hdr, skb);

[Severity: High]
Can this lockless call corrupt the shared IPC ring buffers?=20

btqcomipc_send() executes locklessly from the network stack context, while
btss_worker() can process the TX queue simultaneously. Both paths modify the
exact same ring buffer indices like rinfo->widx and internal state.=20

Could this race lead to ring buffer corruption or packet loss without
acquiring desc->lock?

--=20
Sashiko AI review =C2=B7 https://sashiko.dev/#/patchset/20260625-ipq5018-bl=
uetooth-v1-0-d999be0e04f7@outlook.com?part=3D5
