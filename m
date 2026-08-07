Received: from smtp.kernel.org (aws-us-west-2-korg-mail-alma10-1.taild15c8.ts.net [100.103.45.18])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 231E337DAA2
	for <devicetree@vger.kernel.org>; Fri,  7 Aug 2026 07:56:45 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=100.103.45.18
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1786089409; cv=none; b=tXOY5TO3nAxhbm5Oy8/jV8kou03W9Alf/LR1DfHfJOES3uAHH7PzHmJKV8L+2VUgVFNSYbxBI+rxaHz+2dmcbsvyAatwpes+4pafgGD7Hk3VoFIPEAcvaI1P1sHsWhCUaODYF74uagplE2KTd404aYaQxNzwSr9Tt506sz6eUxs=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1786089409; c=relaxed/simple;
	bh=c0rFNYNU4xvJkBEpP+yTnzZYhYhqzB/db/PwLQ6eYko=;
	h=From:Subject:To:Cc:In-Reply-To:References:Content-Type:Date:
	 Message-Id; b=DpkysQBQXlc9j266zGshUmUxP+2tXqZsEXHRnmSYOM34xJliVFXLAtdIPS3GtBUcXfzirF0d95l3FcLXg8QF6/li1SJkZTEhi3ijcZXwJl/L6HHBQrzrx5LvdWuPhMDoAwBFyzErbvCcRvFGFj0PxblHTx6FNogqBMI6l4pSrQs=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=gBZ+h12Y; arc=none smtp.client-ip=100.103.45.18
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="gBZ+h12Y"
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 91E091F000E9;
	Fri,  7 Aug 2026 07:56:44 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kernel.org;
	s=k20260515; t=1786089404;
	bh=Fxxf1kdt3W1wAX/s73JCnZx9awT3F47T1p/WDgZUcaU=;
	h=From:Subject:Reply-To:To:Cc:In-Reply-To:References:Date;
	b=gBZ+h12YFjpDFy/7vOEmk3bj0IdbdNjhsDG1WrsjU1IaKmsIkOmCPCNcXMnnlXXvY
	 6NlvyGd80jhef0IcWtQtIP99Qf7Ifq28sltaXn1SLSLG46ynMzAuSPkZmQXtBkFS8z
	 yYrQY6338sVPJEGWVzuNfvlZRRsPaPWhEyq3tAdPx92cOKE7yh6AxFSTME/y0Xhcox
	 2u4SNYCxumk/OCuZGlicRDNfSbqrM/EU8s2B06b/dnsZDKxogDXxbUm3HXrL9VF/CW
	 XoCNpJ+sp/6dcLj4yHEUmGXNBBoIzSk194icLNXfg4QwHTHR2JCo0mjhzp80LwQA4V
	 qy2Bwquqf4+ow==
From: sashiko-bot@kernel.org
Subject: Re: [RFC PATCH v3 2/6] virt: bao: add IPC shared-memory driver
Reply-To: sashiko-reviews@lists.linux.dev
To: =?utf-8?b?Sm/Do28gUGVpeG90bw==?= <jpeixoto@osyx.tech>
Cc: robh@kernel.org, conor+dt@kernel.org, devicetree@vger.kernel.org
In-Reply-To: <33a72238392b1feb519d5721b5aacf693929e15c.1786010512.git.jpeixoto@osyx.tech>
References: <cover.1786010512.git.jpeixoto@osyx.tech>
 <33a72238392b1feb519d5721b5aacf693929e15c.1786010512.git.jpeixoto@osyx.tech>
Content-Type: text/plain; charset=utf-8
Content-Transfer-Encoding: quoted-printable
Date: Fri, 07 Aug 2026 07:56:43 +0000
Message-Id: <20260807075644.91E091F000E9@smtp.kernel.org>
Precedence: bulk
X-Mailing-List: devicetree@vger.kernel.org
List-Id: <devicetree.vger.kernel.org>
List-Subscribe: <mailto:devicetree+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:devicetree+unsubscribe@vger.kernel.org>

Thank you for your contribution! Sashiko AI review found 8 potential issue(=
s) to consider:
- [High] Unbinding the device while the misc character device is open cause=
s a Use-After-Free of the driver context and unmapped memory access.
- [High] Missing memory barrier before notifying the peer guest via hyperca=
ll, causing potential data corruption due to stale memory observation.
- [High] Missing write-protection enforcement allows userspace to mmap the =
read region with write permissions, triggering a hypervisor stage-2 fault.
- [Medium] The mmap offset calculation uses `unsigned long`, which overflow=
s on 32-bit architectures, contradicting the author's intent to fix u32 ove=
rflows.
- [Medium] The mmap logic fails entirely for the write region if the read r=
egion's size is not page-aligned.
- [Medium] Missing `.llseek` operation prevents userspace from resetting th=
e file position, allowing the device to be read or written only once per op=
en.
- [Low] The device label string buffer is too small to hold the maximum dev=
ice ID, leading to truncation and potential naming collisions.
- [Low] Missing architecture dependencies in Kconfig will cause build failu=
res on unsupported architectures.
--

--- Patch [2]: [RFC PATCH v3 2/6] virt: bao: add IPC shared-memory driver -=
--
commit 79e4d2a70a45b49aa525420ee0e59987417ec11f
Author: Jo=C3=A3o Peixoto <jpeixoto@osyx.tech>
Subject: virt: bao: add IPC shared-memory driver

Adds a driver for guests running on the Bao static-partitioning hypervisor
to communicate through shared memory. Userspace accesses the regions through
a misc character device using read(), write(), and mmap(), where a write()
notifies the peer guest through an architecture-specific hypercall.

> diff --git a/drivers/virt/bao/ipcshmem/Kconfig b/drivers/virt/bao/ipcshme=
m/Kconfig
> --- /dev/null
> +++ b/drivers/virt/bao/ipcshmem/Kconfig
> @@ -0,0 +1,10 @@
> +# SPDX-License-Identifier: GPL-2.0
> +config BAO_SHMEM
> +	tristate "Bao hypervisor shared memory support"

[Severity: Low]
Does this config need an architecture dependency?

Building this on an unsupported architecture like x86 (e.g., via
allmodconfig) might fail because it unconditionally includes <asm/bao.h>
which only exists for ARM, ARM64, and RISC-V.

[ ... ]
> diff --git a/drivers/virt/bao/ipcshmem/ipcshmem.c b/drivers/virt/bao/ipcs=
hmem/ipcshmem.c
> --- /dev/null
> +++ b/drivers/virt/bao/ipcshmem/ipcshmem.c
[ ... ]
> +static int bao_ipcshmem_mmap(struct file *filp, struct vm_area_struct *v=
ma)
> +{
> +	struct bao_ipcshmem *bao =3D filp->private_data;
> +	unsigned long vsize =3D vma->vm_end - vma->vm_start;
> +	unsigned long offset =3D vma->vm_pgoff << PAGE_SHIFT;

[Severity: Medium]
Will this offset calculation overflow on 32-bit architectures?

Since unsigned long is 32 bits there, an offset larger than 4GB might cause
an overflow. This seems to contradict the commit message's goal to avoid u32
overflows.

> +	phys_addr_t region_phys;
> +	size_t region_size;
> +
> +	if (!vsize)
> +		return -EINVAL;
> +
> +	/*
> +	 * The read region is exposed at offset 0 and the write region right
> +	 * after it. A single mapping cannot span both regions, since they are
> +	 * not guaranteed to be physically contiguous.
> +	 */
> +	if (offset < bao->read_size) {
> +		region_phys =3D bao->read_phys;
> +		region_size =3D bao->read_size;

[Severity: High]
Can a user map the read region with write permissions here?

If userspace opens the device O_RDWR and maps this region with PROT_WRITE,
the kernel will create writable PTEs because vma->vm_page_prot is used
directly during remap_pfn_range().

If the hypervisor maps the read region as read-only at Stage-2, a subsequent
write from userspace could trigger a Stage-2 permission fault and crash the
guest VM. Does this need a check to enforce !(vma->vm_flags & VM_WRITE)?

> +	} else if (offset < bao->read_size + bao->write_size) {
> +		offset -=3D bao->read_size;

[Severity: Medium]
What happens if the device tree specifies a read_size that is not
page-aligned?

Subtracting an unaligned read_size from a page-aligned offset would result
in an unaligned offset. This would then cause the PAGE_ALIGNED(region_phys)
check below to fail unconditionally, preventing userspace from mapping the
write region.

> +		region_phys =3D bao->write_phys;
> +		region_size =3D bao->write_size;
> +	} else {
> +		return -EINVAL;
> +	}
[ ... ]
> +static ssize_t bao_ipcshmem_write(struct file *filp, const char __user *=
buf,
> +				  size_t count, loff_t *ppos)
> +{
[ ... ]
> +	if (copy_from_user(bao->write_base + *ppos, buf, count))
> +		return -EFAULT;
> +
> +	*ppos +=3D count;
> +
> +	/* Notify Bao hypervisor */
> +	bao_ipcshmem_hypercall(BAO_IPCSHMEM_HYPERCALL_ID, bao->id);

[Severity: High]
Is a memory barrier needed here before notifying the peer guest?

The hypercall provides a Context Synchronization Event, but it does not
guarantee that prior memory stores to the MEMREMAP_WB (cacheable) memory are
globally visible.

Could the peer guest observe stale data if the local CPU's store buffer
hasn't drained before the hypervisor wakes it up?

> +	return count;
> +}
[ ... ]
> +static const struct file_operations bao_ipcshmem_fops =3D {
> +	.owner =3D THIS_MODULE,
> +	.read =3D bao_ipcshmem_read,
> +	.write =3D bao_ipcshmem_write,
> +	.mmap =3D bao_ipcshmem_mmap,
> +	.open =3D bao_ipcshmem_open,
> +	.release =3D bao_ipcshmem_release,
> +};

[Severity: Medium]
Does this file operations structure need an .llseek callback (such as
default_llseek)?

Without it, the VFS will clear the FMODE_LSEEK flag during open(). Any
subsequent lseek() calls will return -ESPIPE. Once a read() or write() hits
the end of the shared memory region, userspace might be completely unable to
rewind the offset without closing and reopening the character device.

> +static int bao_ipcshmem_probe(struct platform_device *pdev)
> +{
[ ... ]
> +	bao =3D devm_kzalloc(dev, sizeof(*bao), GFP_KERNEL);
> +	if (!bao)
> +		return -ENOMEM;
> +
> +	bao->read_base =3D devm_memremap(dev, read_res->start,
> +				       resource_size(read_res), MEMREMAP_WB);
> +	if (IS_ERR(bao->read_base))
> +		return PTR_ERR(bao->read_base);
[ ... ]
> +	bao->id =3D id;
> +	bao->read_phys =3D read_res->start;
> +	bao->read_size =3D resource_size(read_res);

[Severity: Medium]
Will resource_size() be truncated here on 32-bit systems with LPAE?

The resource_size() helper returns a 64-bit resource_size_t, but read_size
(and write_size) are defined as size_t in the bao_ipcshmem struct, which
will be 32 bits on those platforms.

> +	bao->write_phys =3D write_res->start;
> +	bao->write_size =3D resource_size(write_res);
> +
> +	scnprintf(bao->label, BAO_IPCSHMEM_NAME_LEN, "baoipc%u", id);

[Severity: Low]
Can this label string be truncated?

If the bao,id from the device tree is a 10-digit number (e.g., 4294967295),
the formatted string requires 17 bytes including the null terminator. Since
BAO_IPCSHMEM_NAME_LEN is 16, the last digit could be truncated, potentially
leading to naming collisions.

[ ... ]
> +static void bao_ipcshmem_remove(struct platform_device *pdev)
> +{
> +	struct bao_ipcshmem *bao =3D platform_get_drvdata(pdev);
> +
> +	misc_deregister(&bao->miscdev);
> +}

[Severity: High]
Can this result in a use-after-free if the driver is unbound while the
character device is still open?

While misc_deregister() removes the device, it does not revoke existing open
file descriptors. When bao_ipcshmem_remove() returns, devres will
automatically free the bao structure and unmap the MEMREMAP_WB regions.

If a user process subsequently calls read, write, or mmap on the open file
descriptor, could it dereference the freed bao structure and access unmapped
memory?

--=20
Sashiko AI review =C2=B7 https://sashiko.dev/#/patchset/cover.1786010512.gi=
t.jpeixoto@osyx.tech?part=3D2
