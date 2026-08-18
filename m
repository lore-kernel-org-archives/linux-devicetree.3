Received: from smtp.kernel.org (aws-us-west-2-korg-mail-alma10-1.taild15c8.ts.net [100.103.45.18])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 171A5377000
	for <devicetree@vger.kernel.org>; Tue, 18 Aug 2026 06:12:34 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=100.103.45.18
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1787033556; cv=none; b=U5VgSeLVzF1N8wRVoUcN7JUeTGSFtQQaFFF+tvZb/gHJJL2USSCs1CCS605NtKGcO/D87wXMulpwquV4+zTr4o5xQVXdsyVBB0InsyEVKIMaWM+It1NqR1oDTudKme83J4AyjvsfhnhfszUGmzXKATaqVyfNhsFwc/fyUohHqMs=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1787033556; c=relaxed/simple;
	bh=+r+2xggaiAUmLqH7HxcaPDKbFVTPl9QQZNBzBkDlREw=;
	h=From:Subject:To:Cc:In-Reply-To:References:Content-Type:Date:
	 Message-Id; b=MB/o6iElJap1ZnF/HNjetQH+z2g/V+ilegv/PYL2qzF5qBf7REt5DZ1rifLSe06h66syEa31xain5Eh8hhzB+qaU6t+z/PQz7DbGsbFpSDo1iEb4OF//trS6tvXHCggtBuDr8Ihg+T2DPIZDFScsAjE8B6Lmz3Y+ZNZsbZ/TkeQ=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=ddhOYuEJ; arc=none smtp.client-ip=100.103.45.18
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="ddhOYuEJ"
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 9B3ED1F000E9;
	Tue, 18 Aug 2026 06:12:33 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kernel.org;
	s=k20260515; t=1787033553;
	bh=Q02aBjRglY87KNUzdGc5EkFcelW5w6ONo4Og8SrnNw4=;
	h=From:Subject:Reply-To:To:Cc:In-Reply-To:References:Date;
	b=ddhOYuEJCbeZN1x9W/m1L0qVS46D0Q1a5J4rviWUnUaOYiu8bTZpZgB+eTDtkbiL0
	 IW0WOQEl0Kpz3S0Yqokk8L2sHDld1qeuq2BtG85yy+5VOreJc+eRxZtRaHv5UGmzgk
	 89raJ9d+T87n0+YaiBCVAZLAKcE79xdXOpuP2AJYn+W6ECfkOX71louHRUyyRHrBjP
	 0ekigIBJhihag/E/qGhLaGL3OiGSoM8azFmwQhrqSTyANOLLcuBwp7FnRLjWvD9L7f
	 xMxE30ntAd7URzTGz7NCzYFMZ0teVmC1QaLZr/Qz9dLH0ytXytPKQORJtdcdMaABPI
	 pSA17acohONfw==
From: sashiko-bot@kernel.org
Subject: Re: [PATCH v2 2/2] usb: gadget: udc: add Axiado AX3000 and AX3005
 UDC driver
Reply-To: sashiko-reviews@lists.linux.dev
To: "Naveen Kumar Rajgiri Bassappa" <rbnaveenkumar@axiado.com>
Cc: conor+dt@kernel.org, robh@kernel.org, devicetree@vger.kernel.org
In-Reply-To: <20260817-axiado-ax3000-usb-device-controller-v2-2-0ef033dd0a68@axiado.com>
References: <20260817-axiado-ax3000-usb-device-controller-v2-0-0ef033dd0a68@axiado.com>
 <20260817-axiado-ax3000-usb-device-controller-v2-2-0ef033dd0a68@axiado.com>
Content-Type: text/plain; charset=utf-8
Content-Transfer-Encoding: quoted-printable
Date: Tue, 18 Aug 2026 06:12:33 +0000
Message-Id: <20260818061233.9B3ED1F000E9@smtp.kernel.org>
Precedence: bulk
X-Mailing-List: devicetree@vger.kernel.org
List-Id: <devicetree.vger.kernel.org>
List-Subscribe: <mailto:devicetree+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:devicetree+unsubscribe@vger.kernel.org>

Thank you for your contribution! Sashiko AI review found 22 potential issue=
(s) to consider:
- [Critical] 500ms busy-wait with local interrupts disabled during hardware=
 reset.
- [High] UDC driver automatically queues STATUS TRBs, conflicting with Gadg=
et API and causing double STATUS TRBs.
- [High] Hardware dequeue pointer is not advanced past a canceled request's=
 TRBs in `crg_udc_ep_dequeue`.
- [High] Multi-TRB Transfer Descriptors are exposed to the hardware prematu=
rely due to immediate Cycle bit updates.
- [High] Large requests requiring more than 32 TRBs will silently hang and =
never complete.
- [High] TRBs from multiple USB requests can be interleaved on the transfer=
 ring, corrupting data streams.
- [High] Transfer ring size mismatch leading to DMA ring corruption.
- [High] Failure to detect error returns from `*_virt_to_dma` functions res=
ults in hardware being programmed with DMA address 0.
- [High] Truncation of 64-bit DMA addresses on 32-bit architectures leads t=
o out-of-bounds TRB accesses.
- [High] `crg_udc_ep_nuke()` will infinite loop if a gadget driver resubmit=
s requests from its completion callback.
- [High] Undeclared identifier `kzalloc_obj` will cause build failures.
- [High] UAF in interrupt handler due to devm_request_threaded_irq and miss=
ing disable_irq.
- [High] Ring buffer capacity calculation allows the ring to become complet=
ely full, making it indistinguishable from empty.
- [High] Endpoint stall due to incorrect cycle state (pcs) after squeezing =
transfer ring.
- [High] Lock drop in `crg_udc_ep_dequeue` allows concurrent TRB queueing, =
causing a fatal hardware state mismatch.
- [High] Read-modify-write on hardware registers in `crg_gadget_pullup` lac=
ks lock protection.
- [High] Failure to clear endpoint descriptors and queues during controller=
 reset allows stale requests to persist across sessions.
- [Medium] Incorrect `actual` byte count calculation for short packets on s=
plit requests.
- [Medium] VBUS presence detection reads software-controlled enable bit.
- [Medium] Stuck endpoint and leaked request on deferred queueing error.
- [Medium] Event Ring Dequeue Pointer (ERDP) is not updated before yielding=
 the CPU, risking Event Ring Full errors.
- [Low] Unused loop variable in `ep_halt` causes redundant hardware command=
s.
--

--- Patch [2]: [PATCH v2 2/2] usb: gadget: udc: add Axiado AX3000 and AX300=
5 UDC driver ---
commit 3443453e5e9e5d73494d04cff64d7d014eadf93b
Author: Naveen Kumar Rajgiri Bassappa <rbnaveenkumar@axiado.com>

usb: gadget: udc: add Axiado AX3000 and AX3005 UDC driver

This commit introduces a new USB device controller driver for the Axiado
AX3000 and AX3005 SoCs. It utilizes a Corigine USB 3.1 IP core and an
xHCI-like programming model. The driver supports High-Speed and SuperSpeed
operations, various transfer types, and standard endpoint operations.

> diff --git a/drivers/usb/gadget/udc/crg_udc.c b/drivers/usb/gadget/udc/cr=
g_udc.c
> new file mode 100644
> index 0000000000000..bb3ed394d9847
> --- /dev/null
> +++ b/drivers/usb/gadget/udc/crg_udc.c
> @@ -0,0 +1,4491 @@

[ ... ]

> +static struct transfer_trb_s *tran_trb_dma_to_virt(struct crg_udc_ep *ud=
c_ep,
> +						   dma_addr_t address)
> +{
> +	unsigned long offset;
> +	struct transfer_trb_s *trb_virt;
> +
> +	if (lower_32_bits(address) & 0xf)
> +		return NULL;
> +
> +	offset =3D address - udc_ep->tran_ring_info.dma_addr;

[Severity: High]
Does this cause truncation on 32-bit architectures? The offset variable is
typed unsigned long instead of u64 or dma_addr_t, which could lead to
out-of-bounds TRB accesses when computing the address difference.

[ ... ]

> +static int crg_udc_epcx_update_dqptr(struct crg_udc_ep *udc_ep)
> +{
> +	struct crg_gadget_dev *crg_udc =3D udc_ep->crg_udc;
> +	u8 dci =3D udc_ep->dci;
> +	struct ep_cx_s *epcx =3D &crg_udc->p_epcx[dci - 2];
> +	u32 dw;
> +	dma_addr_t dqptaddr;
> +	u32 cmd_param0;
> +
> +	if (dci =3D=3D 0) {
> +		dev_err(crg_udc->dev, "cannot update dqptr for ep0\n");
> +		return -EINVAL;
> +	}
> +
> +	dqptaddr =3D tran_trb_virt_to_dma(udc_ep, udc_ep->deq_pt);
> +
> +	if (dma_mapping_error(crg_udc->dev, dqptaddr))

[Severity: High]
Is dma_mapping_error() the correct check here? The tran_trb_virt_to_dma()
routine returns 0 on error, which dma_mapping_error() might not catch,
potentially resulting in the hardware being programmed with DMA address 0.

[ ... ]

> +static void crg_udc_ep_nuke(struct crg_udc_ep *udc_ep, int status,
> +			    unsigned long *flags)
> +{
> +	struct crg_udc_request *req =3D NULL;
> +
> +	while (!list_empty(&udc_ep->queue)) {
> +		req =3D list_entry(udc_ep->queue.next, struct crg_udc_request,
> +				 queue);
> +
> +		req_done(udc_ep, req, status, flags);
> +	}
> +}

[Severity: High]
Could this loop indefinitely if a gadget driver resubmits requests from its
completion callback? Since req_done() drops the lock and invokes the
completion routine, new requests might be added to the queue if
crg_udc_ep_queue() doesn't reject them during teardown.

[ ... ]

> +static u32 room_on_ring(struct crg_gadget_dev *crg_udc, u32 num_trbs,
> +			struct transfer_trb_s *p_ring,
> +			struct transfer_trb_s *enq_pt,
> +			struct transfer_trb_s *dq_pt)
> +{
> +	u32 i =3D 0;
> +
> +	if (enq_pt =3D=3D dq_pt) {
> +		/* ring is empty */
> +		return num_trbs - 1;
> +	}

[Severity: High]
Is it intentional to return num_trbs - 1 for an empty ring? This capacity
calculation allows the ring to become completely full, making it
indistinguishable from being empty.

[ ... ]

> +static int crg_udc_queue_trbs(struct crg_udc_ep *udc_ep_ptr,
> +			      struct crg_udc_request *udc_req_ptr,
> +			      bool b_isoc, u32 xfer_ring_size,
> +			      u32 num_trbs_needed, u64 buffer_length)
> +{
> +	struct crg_gadget_dev *crg_udc =3D udc_ep_ptr->crg_udc;
> +	struct transfer_trb_s *p_xfer_ring =3D udc_ep_ptr->first_trb;
> +	struct transfer_trb_s *enq_pt =3D udc_ep_ptr->enq_pt;
> +	struct usb_request *usb_req =3D &udc_req_ptr->usb_req;
> +	u32 num_trbs_ava, count, i;
> +	u32 td_trbs;
> +	u32 td_size;
> +	u32 j =3D 1;
> +	u32 intr_rate =3D b_isoc ? ISOC_EP_INTERRUPT_RATE :
> +		BULK_EP_INTERRUPT_RATE;
> +	bool full_td =3D true;
> +	bool need_zlp =3D false;
> +	bool is_sg =3D usb_req->num_mapped_sgs;
> +
> +	if (!b_isoc && usb_req->zero && usb_req->length &&
> +	    !(usb_req->length % udc_ep_ptr->usb_ep.maxpacket))
> +		need_zlp =3D true;
> +
> +	if (!num_trbs_needed)
> +		return -EINVAL;
> +
> +	/* TD_SIZE is five bits and encodes the number of TRBs remaining
> +	 * in this TD minus one. A request may contain multiple TDs.
> +	 */
> +	td_trbs =3D min_t(u32, num_trbs_needed, 32);

[Severity: High]
Will large requests requiring more than 32 TRBs complete successfully? The
function clamps td_trbs to 32 and returns success without enqueuing the
rest of the required TRBs.

[ ... ]

> +		if (b_isoc) {
> +			setup_trb(enq_pt, trb_len, trb_buf_addr, td_size,
> +				  udc_ep_ptr->pcs, TRB_TYPE_XFER_DATA_ISOCH,
> +				  short_pkt, chain_bit, ioc, false, 0, true, 0, 1, 0);
> +		} else {
> +			u8 azp =3D ioc && !chain_bit && need_zlp;
> +
> +			setup_trb(enq_pt, trb_len, trb_buf_addr, td_size,
> +				  udc_ep_ptr->pcs, TRB_TYPE_XFER_NORMAL, short_pkt,
> +				  chain_bit, ioc, false, 0, false, 0, 0, azp);
> +		}

[Severity: High]
Are multi-TRB transfer descriptors exposed to the hardware prematurely? The
cycle bit is set immediately on every TRB via setup_trb() inside this loop,
which might allow the controller to execute incomplete descriptors.

[ ... ]

> +static int crg_udc_queue_ctrl(struct crg_udc_ep *udc_ep_ptr,
> +			      struct crg_udc_request *udc_req_ptr,
> +			      u32 num_of_trbs_needed)
> +{
> +	struct crg_gadget_dev *crg_udc =3D udc_ep_ptr->crg_udc;
> +	enum ep_state ep_state;
> +	struct transfer_trb_s *enq_pt =3D udc_ep_ptr->enq_pt;
> +	struct transfer_trb_s *dq_pt =3D udc_ep_ptr->deq_pt;

[ ... ]

> +			for (i =3D 0; i < num_of_trbs_needed; i++) {
> +				p_trb =3D enq_pt;
> +				transfer_length =3D crg_trb_chunk_len(trb_dma, remaining);
> +				ioc =3D (i =3D=3D num_of_trbs_needed - 1);
> +				azp =3D ioc && need_zlp;
> +				setup_datastage_trb(p_trb, trb_dma,
> +						    udc_ep_ptr->pcs, transfer_length,
> +						    num_of_trbs_needed - i - 1,
> +						    ioc, azp, dir, setup_tag);

[Severity: High]
Similarly, is the cycle bit set prematurely on these control TRBs before
the entire chain is ready?

[ ... ]

> +static void ep0_req_complete(struct crg_udc_ep *udc_ep_ptr,
> +			     unsigned long *flags)
> +{
> +	struct crg_gadget_dev *crg_udc =3D udc_ep_ptr->crg_udc;
> +
> +	switch (crg_udc->setup_status) {
> +	case DATA_STAGE_XFER:
> +		crg_udc->setup_status =3D STATUS_STAGE_RECV;
> +		build_ep0_status(udc_ep_ptr, true, -EINPROGRESS, NULL, 0, 0);
> +		break;
> +	case DATA_STAGE_RECV:
> +		crg_udc->setup_status =3D STATUS_STAGE_XFER;
> +		build_ep0_status(udc_ep_ptr, true, -EINPROGRESS, NULL, 0, 0);
> +		break;

[Severity: High]
Does this conflict with the Gadget API? The driver appears to automatically
queue status TRBs for control transfers, which might cause double status
TRBs if the gadget driver also queues its own status response.

[ ... ]

> +static int queue_pending_trbs(struct crg_udc_ep *udc_ep_ptr)
> +{
> +	struct crg_udc_request *udc_req_ptr;
> +	int ret;
> +
> +	list_for_each_entry(udc_req_ptr, &udc_ep_ptr->queue, queue) {
> +		if (udc_req_ptr->all_trbs_queued)
> +			continue;
> +
> +		ret =3D crg_udc_build_td(udc_ep_ptr, udc_req_ptr);
> +		if (ret) {
> +			dev_err(udc_ep_ptr->crg_udc->dev,
> +				"failed to build pending transfer: %d\n", ret);
> +			return ret;
> +		}

[Severity: Medium]
What happens to udc_req_ptr if crg_udc_build_td() fails here? Returning
directly propagates the error without removing the failed request from the
queue or completing it, potentially leaving the endpoint stuck.

[ ... ]

> +static void squeeze_xfer_ring(struct crg_udc_ep *udc_ep_ptr,
> +			      struct crg_udc_request *udc_req_ptr)
> +{
> +	struct transfer_trb_s *trb =3D udc_req_ptr->first_trb;
> +	struct crg_udc_request *next_req;
> +
> +	if (!trb)
> +		return;
> +
> +	while (trb !=3D udc_ep_ptr->enq_pt) {
> +		memset(trb, 0, sizeof(*trb));
> +		trb++;
> +		if (trb =3D=3D udc_ep_ptr->last_trb)
> +			trb =3D udc_ep_ptr->first_trb;
> +	}

[Severity: High]
Does wrapping trb from last_trb to first_trb require updating the endpoint's
pcs cycle state? Failing to toggle the cycle state could cause the endpoint
to stall due to a mismatch between software and hardware.

[ ... ]

> +static int ep_halt(struct crg_udc_ep *udc_ep_ptr, int halt, int ignore_w=
edge,
> +		   unsigned long *flags)
> +{

[ ... ]

> +		if (!list_empty(&udc_ep_ptr->queue)) {
> +			tmp =3D udc_ep_ptr->dci;
> +			tmp =3D FIELD_PREP(CRG_U3DC_DB_TARGET_MASK, tmp);
> +
> +			list_for_each_entry(udc_req_ptr, &udc_ep_ptr->queue,
> +					    queue) {
> +				struct transfer_trb_s *tmp_ptr =3D
> +					udc_ep_ptr->deq_pt + 1;

[Severity: Low]
Is tmp_ptr evaluated correctly? The loop body ignores udc_req_ptr and
redundantly evaluates deq_pt + 1 over and over, potentially causing
unnecessary hardware commands.

[ ... ]

> +static int crg_udc_ep_enable(struct usb_ep *ep,
> +			     const struct usb_endpoint_descriptor *desc)
> +{
> +	struct crg_udc_ep *udc_ep;
> +	struct crg_gadget_dev *crg_udc;
> +	u32 param0;
> +	int status;
> +	unsigned long flags =3D 0;

[ ... ]

> +	if (udc_ep->dci) {
> +		/* setup transfer ring */
> +		if (!udc_ep->tran_ring_info.cpu_addr) {
> +			dma_addr_t dma;
> +			u32 ring_size =3D 0;

[Severity: High]
If cpu_addr is non-NULL, does this skip reallocation without verifying that
the existing allocation size matches the new descriptor's requirements? This
might lead to DMA ring corruption if the new configuration requires a larger
ring.

[ ... ]

> +static struct usb_request *crg_udc_alloc_request(struct usb_ep *_ep,
> +						 gfp_t gfp_flags)
> +{
> +	struct crg_udc_request *udc_req_ptr;
> +
> +	udc_req_ptr =3D kzalloc_obj(*udc_req_ptr, gfp_flags);

[Severity: High]
Is kzalloc_obj defined anywhere? Using this undeclared identifier will cause
build failures.

[ ... ]

> +static int crg_udc_ep_queue(struct usb_ep *_ep, struct usb_request *_req,
> +			    gfp_t gfp_flags)
> +{

[ ... ]

> +	if (usb_endpoint_xfer_control(udc_ep_ptr->desc) && !_req->length) {
> +		crg_udc->setup_status =3D STATUS_STAGE_XFER;
> +		build_ep0_status(&crg_udc->udc_ep[0], false, -EINPROGRESS,
> +				 udc_req_ptr, 0, 0);
> +		spin_unlock_irqrestore(&crg_udc->udc_lock, flags);
> +		return 0;
> +	}

[Severity: High]
Is this hardcoded interception of 0-length requests overriding the direction
to TX? This may conflict with standard gadget zero-length responses.

[ ... ]

> +	if (udc_ep_ptr->tran_ring_full)
> +		status =3D 0;
> +	else
> +		status =3D crg_udc_build_td(udc_ep_ptr, udc_req_ptr);
> +
> +	if (!status)
> +		list_add_tail(&udc_req_ptr->queue, &udc_ep_ptr->queue);

[Severity: High]
Could TRBs from multiple USB requests be interleaved on the transfer ring?
If the endpoint queue has partially queued requests and tran_ring_full is
false, new TRBs might be appended to the ring before older requests finish
queueing, corrupting data streams.

[ ... ]

> +static int crg_udc_ep_dequeue(struct usb_ep *_ep, struct usb_request *_r=
eq)
> +{

[ ... ]

> +	} else {
> +		udc_req->usb_req.actual =3D
> +			crg_udc_actual_before(udc_ep_ptr, udc_req, pause_pt);
> +		req_done(udc_ep_ptr, udc_req, -ECONNRESET, &flags);
> +		udc_ep_ptr->deq_pt =3D pause_pt;
> +		if (crg_udc_epcx_update_dqptr(udc_ep_ptr)) {

[Severity: High]
req_done() drops the spinlock. Does this create a race condition where
concurrent TRB queueing modifies the state before crg_udc_epcx_update_dqptr=
()
is called?

[Severity: High]
Additionally, is setting the dequeue pointer to pause_pt correct? This does
not advance the hardware dequeue pointer past the canceled request's TRBs,
causing the hardware to resume executing canceled TRBs.

[ ... ]

> +static int crg_udc_reset(struct crg_gadget_dev *crg_udc, unsigned long *=
flags)
> +{
> +	struct crg_uccr __iomem *uccr =3D crg_udc->uccr;
> +	u32 i, tmp;
> +	struct crg_udc_ep *udc_ep_ptr;
> +	u32 val;
> +
> +	val =3D readl(&uccr->control);
> +	val |=3D CRG_U3DC_CTRL_SWRST;
> +	writel(val, &uccr->control);
> +	/* Poll until SWRST clears; hardware reset takes up to 500 ms */
> +	if (readl_poll_timeout_atomic(&uccr->control, tmp,
> +				      !(tmp & CRG_U3DC_CTRL_SWRST), 1000,
> +				      500000)) {
> +		dev_err(crg_udc->dev, "reset error\n");
> +		return -ETIMEDOUT;
> +	}

[Severity: Critical]
Is a 500ms busy-wait safe here? The atomic poll macro is invoked with a
500000us timeout while the udc_lock is held and local interrupts are
disabled in crg_gadget_handle_interrupt(), which could cause CPU starvation
and hard lockups.

[ ... ]

> +	/* Complete any reqs on EP1-EP15 queue */
> +	for (i =3D 2; i < CRG_NUM_EP_CX; i++) {
> +		udc_ep_ptr =3D &crg_udc->udc_ep[i];
> +
> +		if (udc_ep_ptr->desc)
> +			crg_udc_ep_nuke(udc_ep_ptr, -ESHUTDOWN, flags);
> +		udc_ep_ptr->tran_ring_full =3D false;
> +		udc_ep_ptr->ep_state =3D EP_STATE_DISABLED;
> +	}

[Severity: High]
Should udc_ep_ptr->desc be set to NULL here? Failing to clear the descriptor
leaves the endpoint logically open, which may allow stale requests to persi=
st
across sessions since crg_udc_ep_enable() doesn't reinitialize the list.

[ ... ]

> +static bool crg_udc_vbus_connected(struct crg_gadget_dev *crg_udc)
> +{
> +	return !!(readl(crg_udc->mmio_virt_base + CRG_UDC_VENDOR_REG) &
> +		  CRG_UDC_VBUS_DETECT);
> +}

[Severity: Medium]
Is CRG_UDC_VBUS_DETECT a software-controlled enable bit? In
crg_vbus_detect(), this same bit is written to enable detection, meaning
this function might just be reading the software override rather than the
actual hardware status.

[ ... ]

> +static int crg_gadget_pullup(struct usb_gadget *g, int is_on)
> +{
> +	struct crg_gadget_dev *crg_udc =3D gadget_to_udc(g);
> +	struct crg_uccr __iomem *uccr =3D crg_udc->uccr;
> +	u32 val;
> +
> +	if (is_on) {
> +		/* Enable event reporting and interrupts, then assert RUN */
> +		val =3D readl(&uccr->config1);
> +		val |=3D (CRG_U3DC_CFG1_CSC_EVENT_EN |
> +			CRG_U3DC_CFG1_PEC_EVENT_EN |
> +			CRG_U3DC_CFG1_PPC_EVENT_EN |
> +			CRG_U3DC_CFG1_PRC_EVENT_EN |
> +			CRG_U3DC_CFG1_PLC_EVENT_EN |
> +			CRG_U3DC_CFG1_CEC_EVENT_EN);
> +		writel(val, &uccr->config1);

[Severity: High]
Are these read-modify-write operations on shared hardware control registers
safe without lock protection?

[ ... ]

> +static int crg_handle_xfer_event(struct crg_gadget_dev *crg_udc,
> +				 struct event_trb_s *event,
> +				 unsigned long *flags)
> +{

[ ... ]

> +	case CMPL_CODE_SHORT_PKT:
> +		if (list_empty(&udc_ep_ptr->queue))
> +			break;
> +
> +		udc_req_ptr =3D list_first_entry(&udc_ep_ptr->queue,
> +					       struct crg_udc_request, queue);
> +		residual =3D FIELD_GET(EVE_TRB_TRAN_LEN_MASK,
> +				     le32_to_cpu(event->dw2));
> +		if (residual > udc_req_ptr->usb_req.length)
> +			residual =3D 0;
> +		udc_req_ptr->usb_req.actual =3D
> +			udc_req_ptr->usb_req.length - residual;

[Severity: Medium]
Does this correctly compute the actual byte count for short packets on
split requests? Using length - residual without considering earlier complet=
ed
segments or TRBs will yield an incorrect actual count.

[ ... ]

> +static int process_event_ring(struct crg_gadget_dev *crg_udc, int index,
> +			      unsigned long *flags)
> +{

[ ... ]

> +		if (++processed % CRG_EVENT_RING_BATCH =3D=3D 0) {
> +			spin_unlock_irqrestore(&crg_udc->udc_lock, *flags);
> +			cond_resched();
> +			spin_lock_irqsave(&crg_udc->udc_lock, *flags);
> +		}
> +	}
> +
> +	/* update dequeue pointer */
> +	erdp =3D event_trb_virt_to_dma(udc_event, udc_event->evt_dq_pt);
> +	if (dma_mapping_error(crg_udc->dev, erdp))
> +		return -EINVAL;
> +	writel(upper_32_bits(erdp), &uicr->erdphi);
> +	writel(lower_32_bits(erdp) | CRG_U3DC_ERDPLO_EHB, &uicr->erdplo);

[Severity: Medium]
If cond_resched() is called, the lock is dropped and the CPU yielded without
updating the ERDP register. Could this cause Event Ring Full errors if new
events arrive while yielded?

[ ... ]

> +static void crg_udc_free_resources(struct crg_gadget_dev *crg_udc)
> +{
> +	int i;
> +
> +	if (crg_udc->uccr) {
> +		u32 val =3D readl(&crg_udc->uccr->control);
> +
> +		val &=3D ~(CRG_U3DC_CTRL_INT_EN | CRG_U3DC_CTRL_RUN);
> +		writel(val, &crg_udc->uccr->control);
> +	}
> +	if (crg_udc->irq >=3D 0)
> +		synchronize_irq(crg_udc->irq);
> +
> +	for (i =3D 0; i < CRG_RING_NUM; i++) {
> +		struct crg_udc_event *udc_event =3D &crg_udc->udc_event[i];
> +
> +		if (udc_event->event_ring.cpu_addr) {
> +			dma_free_coherent(crg_udc->dev,

[Severity: High]
Could this cause a use-after-free in the interrupt handler? This frees DMA
memory while the devm-managed shared IRQ is still active and capable of
scheduling the thread, as synchronize_irq() does not disable the IRQ.

--=20
Sashiko AI review =C2=B7 https://sashiko.dev/#/patchset/20260817-axiado-ax3=
000-usb-device-controller-v2-0-0ef033dd0a68@axiado.com?part=3D2
