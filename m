Received: from smtp.kernel.org (aws-us-west-2-korg-mail-alma10-1.taild15c8.ts.net [100.103.45.18])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 6F3E33D9DD7
	for <devicetree@vger.kernel.org>; Sun, 27 Sep 2026 12:02:43 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=100.103.45.18
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1790510564; cv=none; b=HH3qro4/Q6swTU+dTd5B4nC3FJEqyssCuww/R1ptdWnLkios/xs/hGOTRtd4rbu1GXuUuxVWS9b6RBz4UpOoaEXk7TnRe53rtRlyZU6Ecukv1lilN5MbH4Cx7VSABemulfPXOTfO+PBhAx/s+abRuLjaDFTc/EzbgwJw1S7lfFQ=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1790510564; c=relaxed/simple;
	bh=NWuhXycS92hoJS1iKUUdtO/jBO8j76uo7SLXl2FWNP0=;
	h=From:Subject:To:Cc:In-Reply-To:References:Content-Type:Date:
	 Message-Id; b=BD8G6YnSNAIVTRT3Z0jCAcWKO3trnamSkD1x1tsXegFrU8197Nd/yD/Qn8BbSiVc9msy5TxYujzNuRyrGB8IsV53gJ/bXYKBJRCgtaKEL99hZT34TNRcC5YR45ugZEK9dQEXsgYHb1WT+t9WZRvu7fHhGaBSy5OHdMONFOO+bgM=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=O3B3ZYcJ; arc=none smtp.client-ip=100.103.45.18
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="O3B3ZYcJ"
Received: by smtp.kernel.org (Postfix) with ESMTPSA id C344F1F000FF;
	Sun, 27 Sep 2026 12:02:42 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kernel.org;
	s=k20260515; t=1790510563;
	bh=WBT8e3LqEGPWdMpJRfmTEo2Dv0+9+7MINP9YWSAQhkM=;
	h=From:Subject:Reply-To:To:Cc:In-Reply-To:References:Date;
	b=O3B3ZYcJHo3aApN0PT6KuQrJ3y+k0CXC7xPCGI+JNGe9mmV1KBxRyvLFQcCSvdW1p
	 RspApLfVXfsHKpSzYinZ1J4qMVNrYMO3wfOkhWDHhJjPq15VlmL38ghBUsPXIRS827
	 minOlUEQihwKe8BWnDf7gw03A9SArrziSMzFf9TVbvCP1MfWrGq2Uih8bU2+EEc4U4
	 B+FYSztVShgPRoDuuoyvO6IWc8pwobvhm+pnpZPyUL6eU6L0mnCd7Yb7TLn/pnpkFW
	 biIyHPfmxOue87dXeabg+MM8mOluwSMd11VvD1oDnVYYdBUUIa4lIOM4w4THgv/8HU
	 jdUdh0WDrOmjA==
From: sashiko-bot@kernel.org
Subject: Re: [PATCH v4 2/3] virt: bao: add I/O dispatcher driver
Reply-To: sashiko-reviews@lists.linux.dev
To: =?utf-8?b?Sm/Do28gUGVpeG90bw==?= <jpeixoto@osyx.tech>
Cc: conor+dt@kernel.org, devicetree@vger.kernel.org, robh@kernel.org
In-Reply-To: <93a45bf74dc864c1cf3ef8f9164ef0051ef50c48.1790357735.git.jpeixoto@osyx.tech>
References: <cover.1790357735.git.jpeixoto@osyx.tech>
 <93a45bf74dc864c1cf3ef8f9164ef0051ef50c48.1790357735.git.jpeixoto@osyx.tech>
Content-Type: text/plain; charset=utf-8
Content-Transfer-Encoding: quoted-printable
Date: Sun, 27 Sep 2026 12:02:42 +0000
Message-Id: <20260927120242.C344F1F000FF@smtp.kernel.org>
Precedence: bulk
X-Mailing-List: devicetree@vger.kernel.org
List-Id: <devicetree.vger.kernel.org>
List-Subscribe: <mailto:devicetree+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:devicetree+unsubscribe@vger.kernel.org>

Thank you for your contribution! Sashiko AI review found 6 potential issue(=
s) to consider:
- [Critical] virt: bao: arbitrary physical memory mapping bypasses lockdown=
/CAP_SYS_RAWIO
- [High] virt: bao: arbitrary hardware interrupt hijacking via user-provide=
d IRQ
- [High] virt: bao: io_dispatcher workqueue permanently aborts fetching on =
request errors
- [High] virt: bao: unbounded allocation of ioeventfd structures allows DoS
- [Medium] virt: bao: queued I/O requests are silently dropped on client de=
struction
- [Medium] virt: bao: IRQ mapping leak in bao_intc_init error path
--

commit 59521b5bbcab95a835912872dd83d2870c2d8118
Author: Jo=C3=A3o Peixoto <jpeixoto@osyx.tech>

virt: bao: add I/O dispatcher driver

Add the Bao I/O dispatcher, used by backend VMs to service I/O on behalf
of frontend guests. It bridges Bao's Remote I/O mechanism to userspace
VirtIO backend device models through a control device.

> --- /dev/null
> +++ b/drivers/virt/bao/io-dispatcher/dm.c
[ ... ]
> +static int bao_dm_mmap(struct file *filp, struct vm_area_struct *vma)
> +{
> +	struct bao_dm *dm =3D filp->private_data;
> +	unsigned long vsize;
> +	unsigned long offset;
> +	phys_addr_t phys;
> +
> +	if (WARN_ON_ONCE(!dm))
> +		return -ENODEV;
> +
> +	vsize =3D vma->vm_end - vma->vm_start;
> +	offset =3D vma->vm_pgoff << PAGE_SHIFT;
> +
> +	if (!vsize || offset)
> +		return -EINVAL;
> +
> +	if (vsize > dm->info.shmem_size)
> +		return -EINVAL;
> +
> +	phys =3D dm->info.shmem_addr;
> +	if (!PAGE_ALIGNED(phys))
> +		return -EINVAL;
> +
> +	if (remap_pfn_range(vma, vma->vm_start, phys >> PAGE_SHIFT, vsize,
> +			    vma->vm_page_prot))
> +		return -EFAULT;
> +
> +	return 0;
> +}

[Severity: Critical]
Is there any validation on the physical address passed from userspace via
BAO_IOCTL_CREATE_DM?

Since dm->info.shmem_addr originates from userspace configuration without
any kernel-enforced bounds, an attacker could provide an arbitrary physical
address. Typically, mapping arbitrary physical memory requires lockdown
checks or CAP_SYS_RAWIO.

Could this bypass security boundaries by mapping kernel text, data,
or sensitive hardware registers directly into userspace?

> --- /dev/null
> +++ b/drivers/virt/bao/io-dispatcher/intc.c
[ ... ]
> +static int bao_intc_map_irq(u32 line)
> +{
[ ... ]
> +	switch (cells) {
> +	case 1:
> +		oirq.args[0] =3D line;
> +		break;
> +	case 2:
> +		oirq.args[0] =3D line;
> +		oirq.args[1] =3D IRQ_TYPE_EDGE_RISING;
> +		break;
[ ... ]
> +int bao_intc_init(struct bao_dm *dm)
> +{
> +	int virq;
> +
> +	if (WARN_ON_ONCE(!dm))
> +		return -EINVAL;
> +
> +	virq =3D bao_intc_map_irq(dm->info.irq);
> +	if (virq < 0)
> +		return virq;
> +
> +	dm->virq =3D virq;
> +
> +	scnprintf(dm->intc_name, sizeof(dm->intc_name), "bao-iodintc%u",
> +		  dm->info.id);
> +
> +	return request_irq(dm->virq, bao_interrupt_handler, 0, dm->intc_name,
> +			   dm);
> +}

[Severity: High]
Does this code allow an unprivileged userspace process to hijack arbitrary
hardware interrupts?

Since dm->info.irq is completely controlled by userspace, translating it in=
to
a Linux IRQ mapping and immediately requesting it could allow a malicious
process to intercept critical host system interrupts like timers or IPIs.

[Severity: Medium]
Also, if request_irq() fails here, is it possible we leak the IRQ mapping?

bao_intc_map_irq() calls irq_create_of_mapping(). Returning the error code
directly without calling irq_dispose_mapping() on dm->virq could result in
permanently leaking the descriptor mapping if the ioctl fails repeatedly.

> --- /dev/null
> +++ b/drivers/virt/bao/io-dispatcher/io_client.c
[ ... ]
> +static void bao_io_client_destroy(struct bao_io_client *client)
> +{
[ ... ]
> +	/* Free any I/O requests still queued but never consumed. */
> +	mutex_lock(&client->virtio_requests_lock);
> +	list_for_each_entry_safe(io_req, io_next, &client->virtio_requests,
> +				 list) {
> +		list_del(&io_req->list);
> +		kfree(io_req);
> +	}
> +	client->nr_requests =3D 0;
> +	mutex_unlock(&client->virtio_requests_lock);
> +
> +	kfree(client);
> +}

[Severity: Medium]
Are we silently dropping pending I/O requests without notifying the
hypervisor?

If a client is destroyed while it still has pending requests in the
virtio_requests queue, these requests are freed via kfree() but are never
completed back to the hypervisor.=20

Could this cause the frontend guest vCPU waiting for the synchronous
completion to hang permanently?

> --- /dev/null
> +++ b/drivers/virt/bao/io-dispatcher/io_dispatcher.c
[ ... ]
> +int bao_dispatch_io(struct bao_dm *dm)
> +{
[ ... ]
> +	down_read(&dm->io_clients_lock);
> +	client =3D bao_io_client_find(dm, &req);
> +	if (!client) {
> +		up_read(&dm->io_clients_lock);
> +		bao_io_request_complete_error(dm, &req);
> +		return -ENODEV;
> +	}
> +
> +	if (!bao_io_client_push_request(client, &req)) {
> +		up_read(&dm->io_clients_lock);
> +		bao_io_request_complete_error(dm, &req);
> +		return -ENOMEM;
> +	}
> +
> +	wake_up_interruptible(&client->wq);
> +	up_read(&dm->io_clients_lock);
> +
> +	return ctx.npend_req;
> +}
> +
> +/**
> + * io_dispatcher - Workqueue handler for dispatching I/O
> + * @work: Work struct representing this dispatch operation
> + *
> + * Handles all pending I/O requests for the associated Bao DM.
> + * Executed in process context by the workqueue.
> + */
> +static void io_dispatcher(struct work_struct *work)
> +{
> +	struct bao_dm *dm =3D container_of(work, struct bao_dm, io_work);
> +
> +	while (bao_dispatch_io(dm) > 0)
> +		cpu_relax();
> +}

[Severity: High]
Does this loop terminate prematurely if a single request fails to route?

When bao_dispatch_io() encounters an unroutable request or a full client
queue, it returns a negative error code (-ENODEV or -ENOMEM) instead of
the number of remaining pending requests (ctx.npend_req).

The while loop in io_dispatcher() terminates on a negative return value.

Since hypervisor notifications are edge-triggered, won't any remaining
requests in the hypervisor's queue be stranded indefinitely?

> --- /dev/null
> +++ b/drivers/virt/bao/io-dispatcher/ioeventfd.c
[ ... ]
> +static bool bao_ioeventfd_is_conflict(struct bao_dm *dm,
> +				      struct ioeventfd *ioeventfd)
> +{
> +	struct ioeventfd *p;
> +
> +	lockdep_assert_held(&dm->ioeventfds_lock);
> +
> +	if (WARN_ON_ONCE(!dm || !ioeventfd))
> +		return true;
> +
> +	list_for_each_entry(p, &dm->ioeventfds, list) {
> +		if (p->eventfd =3D=3D ioeventfd->eventfd &&
> +		    p->addr =3D=3D ioeventfd->addr &&
> +		    (p->wildcard || ioeventfd->wildcard ||
> +		     p->data =3D=3D ioeventfd->data)) {
> +			return true;
> +		}
> +	}
> +
> +	return false;
> +}
[ ... ]
> +static int bao_ioeventfd_assign(struct bao_dm *dm, struct bao_ioeventfd =
*config)
> +{
> +	struct eventfd_ctx *eventfd;
> +	struct ioeventfd *new;
> +	int rc =3D 0;
[ ... ]
> +	new =3D kzalloc_obj(*new, GFP_KERNEL);
> +	if (!new) {
> +		rc =3D -ENOMEM;
> +		goto err_put_eventfd;
> +	}

[Severity: High]
Could this allow an unbounded allocation of ioeventfd structures?

The BAO_IOCTL_IOEVENTFD ioctl dynamically allocates a new ioeventfd for each
call. The conflict check in bao_ioeventfd_is_conflict() verifies the exact
(eventfd, addr, data) tuple.

Would this allow an attacker to bypass file descriptor limits by repeatedly
registering the exact same eventfd with different addresses, leading to
unbounded kernel memory exhaustion and a potential denial of service?

--=20
Sashiko AI review =C2=B7 https://sashiko.dev/#/patchset/cover.1790357735.gi=
t.jpeixoto@osyx.tech?part=3D2
