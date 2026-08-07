Received: from smtp.kernel.org (aws-us-west-2-korg-mail-alma10-1.taild15c8.ts.net [100.103.45.18])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 2A7FB3B27E3
	for <devicetree@vger.kernel.org>; Fri,  7 Aug 2026 07:54:09 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=100.103.45.18
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1786089255; cv=none; b=jpKA8ULliM9jyu1pXc0Zt0cB2m8ATbUWHPefuunaDwPszgBkpJ6RaPh1384BVaNxmB7IuFxkTyiJq+AehzjtdR32YHcM9fdCQFmTs/Y4W1OH3+zuitUSu/Dl4t1gUcwY1RQHDAVppEjpgR+Whj98OGxP5ddkUI+rsBsZ1yzISvE=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1786089255; c=relaxed/simple;
	bh=zfNE/AZIWJCP4hLR2qDgOmZj7elUIdZ06L88kgQNOfY=;
	h=From:Subject:To:Cc:In-Reply-To:References:Content-Type:Date:
	 Message-Id; b=KvKtcIzLvpfTFz5Plg8pgjJNoUBdfPIF0IBpO4DqArZ3jcW2Dxw5WskNTVp5PkwpoPRmgZbe6NCnFhyOzK48/xgjGdKrzdQEuCl/74o68vQ5plI9yOJDExWVESXoqOLxbgDLHDXJT3z+cRN8Et9sZhR8wEjCHGcMxnkg62buAa0=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=hhSCQ9rR; arc=none smtp.client-ip=100.103.45.18
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="hhSCQ9rR"
Received: by smtp.kernel.org (Postfix) with ESMTPSA id D5D8D1F000E9;
	Fri,  7 Aug 2026 07:54:05 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kernel.org;
	s=k20260515; t=1786089246;
	bh=A6e7uXCs0+N8BlbgXrFfD/nULOTn3DIQOyqfzyRV5l4=;
	h=From:Subject:Reply-To:To:Cc:In-Reply-To:References:Date;
	b=hhSCQ9rRVL02fftysb4p9pqOTVjfhdm5w+apyKzgGr/KPIPH7CJkDURLMg+gpE02k
	 6hM9IE7ikPcB/m7JisaEjLpbTWul+oJHrGoJCi0GuUaveCAY9U9n/JQ3Cd4jrWmV+x
	 Zujb+hD/G18s0nkkhyEOG4QU+ZBClTJfGe1wRZSqevxSeXtt+XaAdhXPI9Kf++yTb7
	 sZM2UR0AZb/oyf+PQTNRaTIA3mhfysZQC512dANMOpNDNgh83BukK5XF7AARwXTLeK
	 RmHgM4bGvQTFb8dcJghpNBy7L9H3Z38CBJ9oeYjncGvba3bxCCztqESA7nLtpJ4kQe
	 wvudPqFbwCd7A==
From: sashiko-bot@kernel.org
Subject: Re: [RFC PATCH v3 4/6] virt: bao: add I/O dispatcher driver
Reply-To: sashiko-reviews@lists.linux.dev
To: =?utf-8?b?Sm/Do28gUGVpeG90bw==?= <jpeixoto@osyx.tech>
Cc: devicetree@vger.kernel.org, robh@kernel.org, conor+dt@kernel.org
In-Reply-To: <2190b6e083a2f2e0485b27e5e203647189bb1d1d.1786010512.git.jpeixoto@osyx.tech>
References: <cover.1786010512.git.jpeixoto@osyx.tech>
 <2190b6e083a2f2e0485b27e5e203647189bb1d1d.1786010512.git.jpeixoto@osyx.tech>
Content-Type: text/plain; charset=utf-8
Content-Transfer-Encoding: quoted-printable
Date: Fri, 07 Aug 2026 07:54:05 +0000
Message-Id: <20260807075405.D5D8D1F000E9@smtp.kernel.org>
Precedence: bulk
X-Mailing-List: devicetree@vger.kernel.org
List-Id: <devicetree.vger.kernel.org>
List-Subscribe: <mailto:devicetree+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:devicetree+unsubscribe@vger.kernel.org>

Thank you for your contribution! Sashiko AI review found 16 potential issue=
(s) to consider:
- [High] Userspace can spoof the `dm_id` in `BAO_IOCTL_IO_REQUEST_COMPLETE`=
, allowing one device model instance to interfere with others.
- [High] Unrecoverable self-deadlock in the I/O client kernel thread during=
 teardown.
- [High] Global interrupt handler pointer breaks multi-DM support by starvi=
ng active DMs of interrupts.
- [High] TOCTOU Use-After-Free race in `bao_irqfd_assign()` when polling th=
e eventfd.
- [High] Missing workqueue cancellation during irqfd shutdown causes Use-Af=
ter-Free on asynchronous POLLHUP.
- [High] Device unbind frees `struct bao_dm` while userspace holds open fil=
e descriptors.
- [High] Calling `destroy_workqueue` before removing eventfd wait queues cr=
eates a Use-After-Free on the irqfd workqueue.
- [High] Passing a stack-allocated string as the 'name' argument to request=
_irq() leads to a Use-After-Free.
- [High] A missing return statement in `bao_ioeventfd_client_config` silent=
ly breaks ioeventfd deassignment.
- [High] The I/O dispatcher workqueue queues `bao_io_request` structures un=
boundedly, allowing a malicious frontend VM to cause a kernel OOM.
- [Medium] The `struct bao_dm_info` UAPI structure contains uninitialized i=
mplicit padding holes, leaking kernel stack memory to userspace.
- [Medium] Ioeventfd deassignment matches only by eventfd, breaking targete=
d range deregistration.
- [Medium] Signals are incorrectly handled in `bao_io_client_attach`, trans=
lating normal signal interruptions into spurious `-EFAULT` errors in usersp=
ace.
- [Medium] The `bao_io_client_destroy` function fails to free pending I/O r=
equests.
- [Medium] Unused kernel memory mapping of backend shared memory wastes vma=
lloc space.
- [Medium] Silent discard of I/O requests when `copy_to_user` fails or memo=
ry allocation fails.
--

--- Patch [4]: [RFC PATCH v3 4/6] virt: bao: add I/O dispatcher driver ---
commit fc6ea3f8ec16168d50252a311b2bf53f0409c312
Author: Jo=C3=A3o Peixoto <jpeixoto@osyx.tech>
Subject: virt: bao: add I/O dispatcher driver

Add the Bao I/O dispatcher, used by backend VMs to service I/O on behalf
of frontend guests. It bridges Bao's Remote I/O mechanism to userspace
VirtIO backend device models.

> --- a/include/uapi/linux/bao.h
> +++ b/include/uapi/linux/bao.h
> @@ -68,6 +68,13 @@ struct bao_irqfd {
>  };
> =20
> +struct bao_dm_info {
> +	__u32 id;
> +	__u64 shmem_addr;
> +	__u64 shmem_size;
> +	__u32 irq;
> +};

[Severity: Medium]
Does this UAPI structure leak kernel stack memory to userspace? The structu=
re
contains implicit padding holes after the 32-bit fields.

When it is allocated on the stack in bao_io_dispatcher_driver_probe() and
copied to userspace via bao_dm_ioctl() using copy_to_user(), the uninitiali=
zed
4-byte holes are leaked.

> --- a/drivers/virt/bao/io-dispatcher/dm.c
> +++ b/drivers/virt/bao/io-dispatcher/dm.c
> @@ -34,6 +34,107 @@ static int bao_dm_release(struct inode *inode, struct=
 file *filp)
> +static long bao_dm_ioctl(struct file *filp, unsigned int cmd, unsigned l=
ong arg)
> +{
> +	struct bao_dm *dm =3D filp->private_data;

[ ... ]

> +	case BAO_IOCTL_IO_CLIENT_ATTACH: {
> +		struct bao_virtio_request *req;
> +
> +		req =3D memdup_user((void __user *)arg, sizeof(*req));
> +		if (IS_ERR(req)) {
> +			rc =3D PTR_ERR(req);
> +			break;
> +		}
> +
> +		if (!dm->control_client) {
> +			rc =3D -ENOENT;
> +			goto out_free;
> +		}
> +
> +		rc =3D bao_io_client_attach(dm->control_client);
> +		if (rc)
> +			goto out_free;
> +
> +		rc =3D bao_io_client_request(dm->control_client, req);
> +		if (rc)
> +			goto out_free;
> +
> +		if (copy_to_user((void __user *)arg, req, sizeof(*req))) {
> +			rc =3D -EFAULT;
> +			goto out_free;
> +		}

[Severity: Medium]
What happens to the I/O request if copy_to_user() fails here? The request
is permanently popped from the queue in bao_io_client_request().

If copying it to userspace fails, the request appears to be silently discar=
ded,
which would leave the frontend guest VM hanging indefinitely.

> +	case BAO_IOCTL_IO_REQUEST_COMPLETE: {
> +		struct bao_virtio_request *req;
> +		struct bao_remio_hypercall_ctx ctx;
> +
> +		req =3D memdup_user((void __user *)arg, sizeof(*req));
> +		if (IS_ERR(req)) {
> +			rc =3D PTR_ERR(req);
> +			break;
> +		}
> +
> +		ctx.dm_id =3D req->dm_id;
> +		ctx.addr =3D req->addr;
> +		ctx.op =3D req->op;
> +		ctx.value =3D req->value;
> +		ctx.access_width =3D req->access_width;
> +		ctx.request_id =3D req->request_id;
> +
> +		rc =3D bao_remio_hypercall(&ctx);

[Severity: High]
Can userspace spoof the dm_id in this hypercall context? The request's dm_id
is blindly copied from userspace instead of being validated against the dm
associated with the file descriptor (dm->info.id).

Could this allow an unprivileged frontend process to complete or corrupt
requests belonging to other device models?

[ ... ]

> +struct bao_dm *bao_dm_create(struct bao_dm_info *info, struct device *de=
v)
> +{
> +	struct bao_dm *dm;
> +	int ret;

[ ... ]

> +	dm->shmem_base_addr =3D memremap(dm->info.shmem_addr, dm->info.shmem_si=
ze,
> +				       MEMREMAP_WB);

[Severity: Medium]
Is this kernel memory mapping necessary? The mapped physical memory pointer
dm->shmem_base_addr is never dereferenced by the kernel for reading or writ=
ing.

Since userspace maps the memory directly via remap_pfn_range() using the
physical address, does this just waste kernel virtual address space?

[ ... ]

> +void bao_dm_destroy(struct bao_dm *dm)
> +{
> +	if (WARN_ON_ONCE(!dm))
> +		return;
> +
> +	misc_deregister(&dm->miscdev);
> +
> +	if (dm->shmem_base_addr)
> +		memunmap(dm->shmem_base_addr);
> +
> +	bao_irqfd_server_destroy(dm);
> +	bao_io_clients_destroy(dm);
> +	bao_io_dispatcher_destroy(dm);
> +
> +	kfree(dm);
> +}

[Severity: High]
Is it safe to unconditionally free the dm structure here? This runs during =
the
driver's remove callback, but misc_deregister() does not revoke existing op=
en
file descriptors.

If userspace holds the device open and issues an ioctl() or mmap() after the
driver unbinds, the VFS callbacks will dereference the freed dm pointer,
leading to a use-after-free.

> --- a/drivers/virt/bao/io-dispatcher/intc.c
> +++ b/drivers/virt/bao/io-dispatcher/intc.c
> @@ -13,6 +13,52 @@
> +/* Top-level handler registered by the Bao interrupt controller */
> +static void (*bao_intc_handler)(struct bao_dm *dm);

[Severity: High]
Does this global function pointer break multi-DM support? When any single DM
is paused or destroyed, bao_intc_remove_handler() sets this global pointer
to NULL.

This would silently disable I/O interrupt dispatching for all other active =
DMs
on the system.

[ ... ]

> +int bao_intc_init(struct bao_dm *dm)
> +{
> +	char name[BAO_NAME_MAX_LEN];
> +
> +	if (WARN_ON_ONCE(!dm))
> +		return -EINVAL;
> +
> +	scnprintf(name, sizeof(name), "bao-iodintc%d", dm->info.id);
> +
> +	return request_irq(dm->info.irq, bao_interrupt_handler, 0, name, dm);
> +}

[Severity: High]
Can this lead to a use-after-free when reading /proc/interrupts? The charac=
ter
array name is allocated on the stack and passed to request_irq().

The IRQ subsystem stores this pointer directly without copying the string. =
When
this function returns and the stack frame is destroyed, any subsequent acce=
ss
to the interrupt name will dereference a stale stack pointer.

> --- a/drivers/virt/bao/io-dispatcher/io_client.c
> +++ b/drivers/virt/bao/io-dispatcher/io_client.c
> @@ -45,6 +45,356 @@ static inline bool bao_io_client_is_destroying(struct=
 bao_io_client *client)
> +bool bao_io_client_push_request(struct bao_io_client *client,
> +				struct bao_virtio_request *req)
> +{
> +	struct bao_io_request *io_req;
> +
> +	if (WARN_ON_ONCE(!client || !req))
> +		return false;
> +
> +	io_req =3D kzalloc_obj(*io_req, GFP_KERNEL);

[Severity: High]
Could this allow a malicious frontend VM to cause a host kernel OOM? The
io_dispatcher workqueue continually pulls pending I/O requests from the
hypervisor and pushes them here, which allocates memory with GFP_KERNEL.

There doesn't appear to be any limit or backpressure mechanism if userspace
processes requests slower than they are produced.

[ ... ]

> +static void bao_io_client_destroy(struct bao_io_client *client)
> +{
> +	struct bao_io_client *range;
> +	struct bao_io_client *next;
> +	struct bao_dm *dm;
> +
> +	if (WARN_ON_ONCE(!client))
> +		return;
> +
> +	dm =3D client->dm;
> +
> +	bao_io_dispatcher_pause(dm);
> +
> +	set_bit(BAO_IO_CLIENT_DESTROYING, &client->flags);
> +
> +	if (client->is_control) {
> +		wake_up_interruptible(&client->wq);
> +	} else {
> +		bao_ioeventfd_client_destroy(dm);
> +		if (client->thread)
> +			kthread_stop(client->thread);
> +	}

[Severity: High]
Could this cause an unrecoverable self-deadlock? In bao_io_client_attach(),
when kthread_should_stop() is true, the kthread recursively calls
bao_io_client_destroy() on itself.

Inside this call, it invokes kthread_stop() on its own thread context, which
blocks waiting for the thread to exit.

[ ... ]

> +	down_write(&dm->io_clients_lock);
> +	if (client->is_control)
> +		dm->control_client =3D NULL;
> +	else
> +		dm->ioeventfd_client =3D NULL;
> +
> +	list_del(&client->list);
> +	up_write(&dm->io_clients_lock);
> +
> +	bao_io_dispatcher_resume(dm);
> +
> +	kfree(client);
> +}

[Severity: Medium]
Is there a memory leak here? When the client is destroyed, its range_list is
cleaned up, but it does not iterate over the virtio_requests list to free
pending struct bao_io_request items before calling kfree(client).

> +int bao_io_client_attach(struct bao_io_client *client)
> +{
> +	if (WARN_ON_ONCE(!client))
> +		return -EINVAL;
> +
> +	if (client->is_control) {
> +		wait_event_interruptible(client->wq,
> +					 bao_io_client_has_pending_requests(client) ||
> +					 bao_io_client_is_destroying(client));
> +		if (bao_io_client_is_destroying(client))
> +			return -EPERM;

[Severity: Medium]
Does this mishandle signals? The wait_event_interruptible() macro returns
-ERESTARTSYS if interrupted by a signal, but this return value is ignored.

As a result, normal signal interruptions cause bao_dm_ioctl() to attempt to
pop an empty queue, failing and returning a spurious -EFAULT to userspace.

> --- a/drivers/virt/bao/io-dispatcher/io_dispatcher.c
> +++ b/drivers/virt/bao/io-dispatcher/io_dispatcher.c
> @@ -25,6 +25,156 @@ struct bao_io_dispatcher_work {
> +int bao_dispatch_io(struct bao_dm *dm)
> +{
> +	struct bao_io_client *client;
> +	struct bao_remio_hypercall_ctx ctx;
> +	struct bao_virtio_request req;

[ ... ]

> +	if (!bao_io_client_push_request(client, &req)) {
> +		up_read(&dm->io_clients_lock);
> +		return -EINVAL;
> +	}

[Severity: Medium]
Are requests silently discarded here if bao_io_client_push_request() fails?
If memory exhaustion prevents the allocation, the request fetched from the
hypervisor is dropped, permanently hanging the frontend guest waiting for
I/O completion.

> --- a/drivers/virt/bao/io-dispatcher/ioeventfd.c
> +++ b/drivers/virt/bao/io-dispatcher/ioeventfd.c
> @@ -201,6 +201,122 @@ static int bao_ioeventfd_deassign(struct bao_dm *dm,
> +	list_for_each_entry(p, &dm->ioeventfds, list) {
> +		if (p->eventfd !=3D eventfd)
> +			continue;
> +
> +		bao_io_client_range_del(dm->ioeventfd_client, p->addr,
> +					p->addr + p->length - 1);
> +
> +		bao_ioeventfd_shutdown(dm, p);
> +		break;
> +	}

[Severity: Medium]
Does this deassignment loop match solely on the eventfd context and ignore
the requested memory address range? If userspace registers multiple memory
ranges to trigger the same eventfd, this will arbitrarily delete the first
matching entry rather than the specific range requested by userspace.

[ ... ]

> +int bao_ioeventfd_client_config(struct bao_dm *dm, struct bao_ioeventfd =
*config)
> +{
> +	if (WARN_ON_ONCE(!dm || !config))
> +		return -EINVAL;
> +
> +	if (config->flags & BAO_IOEVENTFD_FLAG_DEASSIGN)
> +		bao_ioeventfd_deassign(dm, config);
> +
> +	return bao_ioeventfd_assign(dm, config);
> +}

[Severity: High]
Is a return statement missing here? Because there is no return after calling
bao_ioeventfd_deassign(), execution falls through to bao_ioeventfd_assign(),
immediately recreating the ioeventfd that was just destroyed.

> --- a/drivers/virt/bao/io-dispatcher/irqfd.c
> +++ b/drivers/virt/bao/io-dispatcher/irqfd.c
> @@ -34,6 +34,280 @@ struct irqfd {
> +static void bao_irqfd_shutdown(struct irqfd *irqfd)
> +{
> +	u64 cnt;
> +
> +	if (WARN_ON_ONCE(!irqfd || !irqfd->dm))
> +		return;
> +
> +	lockdep_assert_held(&irqfd->dm->irqfds_lock);
> +
> +	list_del_init(&irqfd->list);
> +
> +	eventfd_ctx_remove_wait_queue(irqfd->eventfd, &irqfd->wait, &cnt);
> +
> +	eventfd_ctx_put(irqfd->eventfd);
> +
> +	kfree(irqfd);
> +}

[Severity: High]
Is it safe to free the irqfd here without cancelling the asynchronous shutd=
own
work? If userspace closes the eventfd concurrently, a POLLHUP event queues
the shutdown work.

The irqfd is then freed, and when the workqueue executes irqfd_shutdown_wor=
k(),
it dereferences the freed memory to access irqfd->dm.

[ ... ]

> +static int bao_irqfd_assign(struct bao_dm *dm, struct bao_irqfd *args)
> +{
> +	struct eventfd_ctx *eventfd =3D NULL;
> +	struct irqfd *irqfd;

[ ... ]

> +	list_add_tail(&irqfd->list, &dm->irqfds);
> +	mutex_unlock(&dm->irqfds_lock);
> +
> +	events =3D vfs_poll(fd_file(f), &irqfd->pt);

[Severity: High]
Could this cause a use-after-free race? The newly created irqfd is published
to the globally visible dm->irqfds list, and the lock is dropped before
calling vfs_poll().

A concurrent thread calling deassign can remove and free this irqfd while
vfs_poll() proceeds to access the freed &irqfd->pt.

[ ... ]

> +void bao_irqfd_server_destroy(struct bao_dm *dm)
> +{
> +	struct irqfd *irqfd;
> +	struct irqfd *next;
> +
> +	if (WARN_ON_ONCE(!dm))
> +		return;
> +
> +	if (dm->irqfd_server)
> +		destroy_workqueue(dm->irqfd_server);
> +
> +	mutex_lock(&dm->irqfds_lock);
> +	list_for_each_entry_safe(irqfd, next, &dm->irqfds, list)
> +		bao_irqfd_shutdown(irqfd);
> +	mutex_unlock(&dm->irqfds_lock);
> +}

[Severity: High]
Can this lead to a use-after-free on the irqfd workqueue? Calling
destroy_workqueue() before shutting down the active eventfds leaves their
wait queues active.

If an eventfd receives an event in this window, bao_irqfd_wakeup() will exe=
cute
queue_work() on the destroyed and freed workqueue pointer.

--=20
Sashiko AI review =C2=B7 https://sashiko.dev/#/patchset/cover.1786010512.gi=
t.jpeixoto@osyx.tech?part=3D4
