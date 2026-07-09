Received: from smtp.kernel.org (aws-us-west-2-korg-mail-alma10-1.taild15c8.ts.net [100.103.45.18])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id C5B7F3A3E67
	for <devicetree@vger.kernel.org>; Thu,  9 Jul 2026 09:30:24 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=100.103.45.18
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1783589426; cv=none; b=EHvRn7iNB0w34gTviY0xY+d+l/nbwsEoXEDpWJxia+scJ+BXRj1tnlThrISjBSCQAD5mlGdgG8IbwUs/3qkOIsLE2EOX8cbGsbwHo94YwLNnvITAsI1SGKmJXU06+hkmaMbxh1p9ar3tyAU/DDZSwk86036jGILlJD20LLgQ4Uk=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1783589426; c=relaxed/simple;
	bh=iqKZrmwSv+xFYojZ0RIZHKm1p1EXC0etNzGcg0k5I5Y=;
	h=From:Subject:To:Cc:In-Reply-To:References:Content-Type:Date:
	 Message-Id; b=Rhpfnpa0Jl8ipIt4kEss8taAPuz+HDUlLD6xaxU3FoPEluH25tKUszbHstxDxFu456ZLzR5dmj3Qb8W0+JbP7AazB5czHDXzAzg8qB2Dzag/Pso80By6duQueAXSOS/2NbsA5HC1y9DQxDmGO/bbfYDgM5W9z1HbluBcas73QRc=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=Z8tbkv4R; arc=none smtp.client-ip=100.103.45.18
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="Z8tbkv4R"
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 0449E1F000E9;
	Thu,  9 Jul 2026 09:30:23 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kernel.org;
	s=k20260515; t=1783589424;
	bh=N3/NfBe21r7hVTTq9JaJuq5pvrcHRImB0Md5zH07yLE=;
	h=From:Subject:Reply-To:To:Cc:In-Reply-To:References:Date;
	b=Z8tbkv4R+W4z+830lTC71bItJouHb1VRxmNuQ0vTRWtP4mAy/niBuXAFH7fboxzDk
	 brsK5vEXQtDvwJPILlIH5vKbLgox3rR35vAn8qSXj3AMTwUs0E1NBR+ttu7UDN1QZG
	 pGk8mOtvEY9Kv1ehMFrUUuIZ/einrTFq5dLex/j01GPTCRE1gnYm1R02lXgtVIug0k
	 mc7xlNhoJOGW7mBY/5w7zDACOZw1w8CRJNeRgD7Xs6XTwGYE1zBf/xhfvn1a5JAl+6
	 SVlvghiK0KtjlKkvd37SvtXFv3D8kjOHyxN8ZBeydyWhJpRxMe/cjSdQzqcchwQ2sJ
	 8tMxNsOgw+mVg==
From: sashiko-bot@kernel.org
Subject: Re: [PATCH v5 4/6] Bluetooth: Introduce Qualcomm IPQ5018 IPC based
 HCI driver
Reply-To: sashiko-reviews@lists.linux.dev
To: "George Moussalem" <george.moussalem@outlook.com>
Cc: conor+dt@kernel.org, devicetree@vger.kernel.org, robh@kernel.org
In-Reply-To: <20260709-ipq5018-bluetooth-v5-4-e476c41f03b8@outlook.com>
References: <20260709-ipq5018-bluetooth-v5-0-e476c41f03b8@outlook.com>
 <20260709-ipq5018-bluetooth-v5-4-e476c41f03b8@outlook.com>
Content-Type: text/plain; charset=utf-8
Content-Transfer-Encoding: quoted-printable
Date: Thu, 09 Jul 2026 09:30:23 +0000
Message-Id: <20260709093024.0449E1F000E9@smtp.kernel.org>
Precedence: bulk
X-Mailing-List: devicetree@vger.kernel.org
List-Id: <devicetree.vger.kernel.org>
List-Subscribe: <mailto:devicetree+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:devicetree+unsubscribe@vger.kernel.org>

Thank you for your contribution! Sashiko AI review found 11 potential issue=
(s) to consider:
- [Critical] Unvalidated ring buffer offsets read from shared memory allow =
arbitrary kernel memory read and write via `TO_APPS_ADDR`.
- [High] Missing bounds check on ELF segment `p_memsz` during firmware load=
 allows out-of-bounds memory zeroing.
- [High] Inconsistent spinlock context for `desc->lock` causes a potential =
deadlock between `btss_worker()` and `btqcomipc_send()`.
- [High] Unvalidated ring buffer linked list traversal allows untrusted fir=
mware to hang the host CPU.
- [High] Flawed mathematical validation for wrapped long RX frames allows o=
ut-of-bounds I/O memory reads.
- [High] Missing workqueue cancellation and unsafe firmware shutdown order =
in `btqcomipc_close()` leads to a hardware fault or UAF.
- [High] Time-of-check to time-of-use (TOCTOU) and missing size bounds chec=
ks on `rx_ctxt->total_size` lead to an out-of-bounds `tx_ctxt` pointer.
- [High] Missing validation of buffer counts from shared memory triggers di=
vide-by-zero panics.
- [Medium] Directly sending short messages bypasses queued long messages, v=
iolating HCI FIFO ordering.
- [Medium] Overwriting the `ack` parameter in `btss_process_rx` leads to si=
lently dropped interrupt ACKs.
- [Medium] The driver accesses I/O-mapped memory via direct C pointer deref=
erences, causing potential alignment faults.
--

--- Patch [4]: [PATCH v5 4/6] Bluetooth: Introduce Qualcomm IPQ5018 IPC bas=
ed HCI driver ---
commit bc9200dabd0dfb475dc74e5c716cbd6ea1df35df
Author: George Moussalem <george.moussalem@outlook.com>
Subject: Bluetooth: Introduce Qualcomm IPQ5018 IPC based HCI driver

This commit adds support for the Bluetooth controller found in the IPQ5018
SoC. It implements firmware loading and the transport layer between the
HCI core and the controller using a shared memory ring buffer topology.

> diff --git a/drivers/bluetooth/btqcomipc.c b/drivers/bluetooth/btqcomipc.c
> index 0000000000000..9d71fe6117723
> --- /dev/null
> --- b/drivers/bluetooth/btqcomipc.c

[ ... ]

> @@ -275,12 +275,13 @@ static int btss_send(struct qcom_btss *desc, u16 ms=
g_hdr,
>      if (is_sbuf_full || is_lbuf_full)
>          hdr |=3D IPC_HDR_REQ_ACK;
> =20
>  complete_tx:
>      rbuf->msg_hdr =3D cpu_to_le16(hdr);
>      rbuf->len =3D cpu_to_le16(len);
> =20
>      dma_wmb();
> =20
[Severity: High]
Does this modulo operation rely on desc->tx_ctxt->smsg_buf_cnt being
non-zero?

If the firmware modifies the count to zero in shared memory, could this
cause a kernel panic via division-by-zero?

>      rinfo->widx =3D (rinfo->widx + 1) % desc->tx_ctxt->smsg_buf_cnt;
> =20
>      regmap_set_bits(desc->regmap, desc->offset, BIT(desc->bit));
> =20
>      return 0;
>  }

[ ... ]

> @@ -375,15 +376,16 @@ static int btss_recv_cust_frame(struct qcom_btss *d=
esc, u8 cmd)
>          WRITE_ONCE(desc->running, false);
>          break;
>      case IPC_CMD_START:
>          spin_unlock(&desc->lock);
>          ret =3D qcom_scm_pas_set_bluetooth_power_mode(BTSS_PAS_ID, false=
);
>          spin_lock(&desc->lock);
>          if (ret && ret !=3D -EOPNOTSUPP) {
>              bt_dev_err(desc->hdev,
>                     "Failed to apply BTSS active power mode: %d",
>                     ret);
>              return ret;
>          }
> =20
[Severity: High]
Does this code read total_size directly from shared memory without bounds
checking?

Since this bypasses the validation in btss_worker(), could it result in
desc->tx_ctxt pointing to unallocated memory if the firmware modifies it
after initialization?

>          desc->tx_ctxt =3D (struct context_info *)((void *)desc->rx_ctxt +
>                  le16_to_cpu(desc->rx_ctxt->total_size));
>          desc->lmsg_ctxt.widx =3D 0;

[ ... ]

> @@ -458,16 +460,25 @@ static inline int btss_process_rx(struct qcom_btss =
*desc,
>      lring_buf =3D le32_to_cpu(desc->rx_ctxt->lring_buf);
>      widx =3D READ_ONCE(rinfo->widx);
> =20
>      while (ridx !=3D widx) {
>          struct ipc_aux_ptr aux_ptr =3D { };
> =20
>          dma_rmb();
> =20
[Severity: Critical]
Are rinfo->rbuf and ridx validated against the bounds of the shared memory
region before being used?

If the controller writes arbitrary offsets here, could TO_APPS_ADDR result
in reading from or writing to arbitrary host kernel memory?

>          rbuf =3D &((struct ring_buffer *)(TO_APPS_ADDR(le32_to_cpu(rinfo=
->rbuf))))[ridx];
[Severity: Medium]
Is it safe to directly dereference iomem-mapped memory pointers like
rbuf->msg_hdr and rbuf->len without using the proper readw() or readl()
I/O accessors?

Could this trigger alignment faults on certain architectures?

>          msg_hdr =3D le16_to_cpu(rbuf->msg_hdr);
>          msg_len =3D le16_to_cpu(rbuf->len);
> =20
>          if (!(msg_hdr & IPC_HDR_LONG_MSG) && msg_len > IPC_MSG_PLD_SZ) {
>              desc->hdev->stat.err_rx++;
>              bt_dev_err(desc->hdev,
>                     "Dropping short RX frame with invalid len %u",
>                     msg_len);
>              goto continue_rx;
>          }
> =20
>          if (msg_hdr & IPC_HDR_LONG_MSG) {
[Severity: Critical]
Is there a risk of leaking arbitrary kernel memory here?

Since lmsg_data is read straight from the shared ring buffer, an attacker
controlling the firmware could provide an arbitrary pointer that becomes
converted to a host address via TO_APPS_ADDR.

>              lmsg_data =3D le32_to_cpu(rbuf->payload.lmsg_data);
>              rxbuf =3D TO_APPS_ADDR(lmsg_data);
>              lsz =3D btss_lbuf_size(desc, desc->rx_ctxt);

[ ... ]

>              /*
>               * Check if the long message buffer extends past the end
>               * of the ring buffer
>               */
>              if (msg_len > lring_end - lmsg_data) {
>                  lbuf_idx =3D btss_get_buf_idx(desc->rx_ctxt,
>                                  lmsg_data, lsz);
> =20
>                  blks_consumed =3D desc->rx_ctxt->lmsg_buf_cnt - lbuf_idx;
[Severity: High]
Can this validation ever evaluate to true?

Based on the preceding checks, if msg_len > blks_consumed * lsz, then
mathematically msg_len / lsz must be greater than or equal to blks_consumed.

Could a malformed msg_len completely bypass this check and cause an
out-of-bounds memcpy_fromio()?

>                  if (blks_consumed > msg_len / lsz) {
>                      desc->hdev->stat.err_rx++;
>                      bt_dev_err(desc->hdev,
>                             "Dropping long RX frame with invalid length %=
u",
>                             msg_len);
>                      goto continue_rx;
>                  }
>                  aux_ptr.len =3D msg_len - (blks_consumed * lsz);
>                  aux_ptr.buf =3D lring_buf;
>              }
>          } else {
>              rxbuf =3D rbuf->payload.smsg_data;
>          }
> =20
[Severity: Medium]
Will this overwrite the ack flag instead of accumulating it?

If an earlier message in the loop requested an ACK but the final message
does not, will the hardware signaling loop silently drop the ACK request?

>          *ack =3D msg_hdr & IPC_HDR_REQ_ACK;
> =20
>          pkt_type =3D FIELD_GET(IPC_HDR_PKT_TYPE_MASK, msg_hdr);

[ ... ]

>  continue_rx:
[Severity: High]
Does this modulo operation rely on rinfo->ring_buf_cnt being non-zero?

If the firmware modifies the count to zero in shared memory, could this
cause a kernel panic via division-by-zero?

>          ridx =3D (ridx + 1) % rinfo->ring_buf_cnt;
>          rinfo->ridx =3D ridx;
> =20
>          if (rx_count)
>              (*rx_count)++;
>      }

[ ... ]

> @@ -515,16 +526,26 @@ static void btss_worker(struct work_struct *work)
>      struct qcom_btss *desc =3D container_of(work, struct qcom_btss, work=
);
>      struct ring_buffer_info *rinfo;
>      bool ack =3D false;
>      u32 offset, next;
>      u16 total_size;
>      int ret;
> =20
[Severity: High]
Could this lead to a deadlock?

The btss_worker runs in process context and acquires desc->lock without
disabling softirqs. If a network softirq interrupts this CPU and calls
btqcomipc_send() which uses spin_lock_irqsave(), will it spin forever
waiting for this lock?

>      spin_lock(&desc->lock);
> =20
>      if (unlikely(!READ_ONCE(desc->running))) {
>          /*
>           * FW sets offset of RX context info at the start of the memory
>           * region upon boot
>           */
>          offset =3D readl(desc->base);
>          if (offset > desc->mem_size - sizeof(struct context_info)) {
>              bt_dev_err(desc->hdev,
>                     "Invalid offset after firmware boot: 0x%08x",
>                     offset);
>              goto spin_unlock;
>          }
>          dev_dbg(desc->dev, "offset after firmware boot: 0x%08x\n",
>              offset);
> =20
>          desc->rx_ctxt =3D (struct context_info *)(desc->base + offset);
> =20
>          total_size =3D le16_to_cpu(desc->rx_ctxt->total_size);
[Severity: High]
Is this bounds check sufficient for the tx_ctxt pointer?

The check ensures rx_ctxt total_size is within mem_size, but tx_ctxt is
later set to rx_ctxt + total_size. Should it also verify that there is
enough room for the sizeof(struct context_info) of tx_ctxt itself at the
end of the region?

>          if (total_size < sizeof(struct context_info) ||
>          total_size > desc->mem_size - offset) {
>              bt_dev_err(desc->hdev, "Invalid total size: %u",
>                     total_size);
>              desc->rx_ctxt =3D NULL;
>              goto spin_unlock;
>          }

[ ... ]

>      rinfo =3D &(desc->rx_ctxt->sring_buf_info);
>      while (rinfo !=3D NULL) {
>          ret =3D btss_process_rx(desc, rinfo, &ack,
>                        &desc->rx_ctxt->smsg_buf_cnt);
>          if (ret) {
>              bt_dev_err(desc->hdev,
>                     "Failed to process peer msgs: %d", ret);
>              goto spin_unlock;
>          }
[Severity: High]
Could untrusted firmware hang the host CPU here?

The next pointer is read from shared memory. If the firmware intentionally
creates a cycle in the linked list, will this while loop execute
indefinitely and cause a Denial of Service?

>          next =3D le32_to_cpu(rinfo->next);
>          rinfo =3D next ? (struct ring_buffer_info *)TO_APPS_ADDR(next) :=
 NULL;
>      }

[ ... ]

> @@ -661,16 +672,21 @@ static int btcomqipc_firmware_load(struct qcom_btss=
 *desc)
>              memcpy_toio(desc->base + phdr->p_vaddr,
>                      seg_fw->data, phdr->p_filesz);
>              if (phdr->p_memsz > phdr->p_filesz)
>                  memset_io(desc->base + phdr->p_vaddr +
>                        phdr->p_filesz, 0,
>                        phdr->p_memsz - phdr->p_filesz);
> =20
>  release_seg_fw:
>              release_firmware(seg_fw);
>  release_seg_name:
>              kfree(seg_name);
>              seg_name =3D NULL;
> =20
>              if (ret)
>                  goto release_fw;
>          } else {
>              memcpy_toio(desc->base + phdr->p_vaddr,
>                      fw->data + phdr->p_offset, phdr->p_filesz);
[Severity: High]
Does this memset_io call lack a bounds check on phdr->p_memsz?

The earlier validation only ensures that p_filesz fits within
desc->mem_size. If a malformed ELF file has a massive p_memsz, could this
zero out kernel memory beyond the mapped desc->base region?

>              if (phdr->p_memsz > phdr->p_filesz)
>                  memset_io(desc->base + phdr->p_vaddr +
>                        phdr->p_filesz, 0,
>                        phdr->p_memsz - phdr->p_filesz);
>          }

[ ... ]

> @@ -731,16 +747,21 @@ static int btqcomipc_close(struct hci_dev *hdev)
>      struct qcom_btss *desc =3D hci_get_drvdata(hdev);
>      unsigned long flags;
>      int ret;
> =20
>      ret =3D qcom_scm_pas_shutdown(BTSS_PAS_ID);
>      if (ret) {
>          bt_dev_err(hdev, "Failed to stop firmware: %d", ret);
>          return ret;
>      }
> =20
>      disable_irq(desc->irq);
> =20
[Severity: High]
Is it safe to shut down the physical IP without canceling the asynchronous
worker first?

If btss_worker() is actively running and reading from desc->base, could
powering down the controller via SCM cause a Synchronous External Abort or
hardware fault before the running flag is set to false?

>      spin_lock_irqsave(&desc->lock, flags);
>      WRITE_ONCE(desc->running, false);
>      spin_unlock_irqrestore(&desc->lock, flags);

[ ... ]

> @@ -779,16 +800,21 @@ static int btqcomipc_send(struct hci_dev *hdev, str=
uct sk_buff *skb)
>      u16 hdr =3D FIELD_PREP(IPC_HDR_PKT_TYPE_MASK, IPC_HDR_PKT_TYPE_HCI);
>      struct qcom_btss *desc =3D hci_get_drvdata(hdev);
>      unsigned long flags;
>      int ret;
> =20
>      spin_lock_irqsave(&desc->lock, flags);
> =20
>      if (unlikely(!READ_ONCE(desc->running))) {
>          bt_dev_err(hdev,
>                 "BTSS not initialized, failed to send message");
>          ret =3D -ENODEV;
>          goto spin_unlock;
>      }
> =20
[Severity: Medium]
Will this bypass the FIFO order for HCI frames?

If a previous long frame failed to send and was queued to desc->tx_q via
-EAGAIN, will attempting to send a new short frame directly leapfrog the
backlog, causing silent protocol violations?

>      ret =3D btss_send(desc, hdr, skb);
>      if (ret) {
>          if (ret =3D=3D -EAGAIN) {
>              if (skb_queue_len(&desc->tx_q) >=3D IPC_TX_QSIZE) {

--=20
Sashiko AI review =C2=B7 https://sashiko.dev/#/patchset/20260709-ipq5018-bl=
uetooth-v5-0-e476c41f03b8@outlook.com?part=3D4
