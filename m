Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=100.103.45.18
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1794040159;
	b=Fmk6gLfquPxyzRUCPhR3U/44mDJPtXia+JhqHH5SaauXGhQ1JM4SIKhZImeR0EbMzjzO
	 GvksCWjxRulizzt/JzousldJW4lGT2opgwRIXCTB9PZ+P5MLXDTDeNCMubMeCa7Jj8frT
	 Rnh3R12Xc2ERTkY8vARrk0/dwl6ALjDNcl0DdtmHSBEC8kirFn7d9oLHytdPa/Rpn9fRR
	 Kh//zqTNQmgOD259HampGMgRlm4BV+vNfgHDNZAtrQR4/+yLBN7KXV3eo2Zqkh7B4rk2q
	 RH5HiWc/3XTcDLlkEbtiFOrUR0gPwBVW2bbgUiDGT7WkTRR3nrCHiLhX0EPJHrvBsFw==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1794040159;
	h=Received:DKIM-Signature:Message-ID:From:Subject:Reply-To:To:Cc:
	 In-Reply-To:References:Content-Type:Content-Transfer-Encoding:Date;
	bh=6gQ9Zr0DaEb8gGwtpBB/z6Myn8JoIsTKf7WojtqAvnM=;
	b=ToIdCT+6N8tDeV3J4XqwBGRwWYyhqykuoKdLj8kC8GpVz89Lx9yoVGu7dRed3+sTVkOA
	 oo5hRIbIS0k8+NcHRjA8Ev7glIQ49c3G+Ubqjo/vgHoIqQ2iSyCsrsbqKlAytoq5ZSqnc
	 tTNyAapnezXc4NfCkdt8JpjDK/Infno7dqNyux29Ad24TXGiFI20ztHGn/Pwr1717ebkF
	 CxHgYYUS6Nb7hvM3ewlRMfiZHv07tCsdIpcVooTlZuODcMSrcw0XSVEgToa8wx4BV8MKl
	 9Nlv5RgMv2F62QtVvz0FaEnHq9oJ9N1YSuq98zYZcZ4joIVW4pz9YoZ8VL90wLNE+4g==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dkim=pass header.d=kernel.org header.i=@kernel.org header.a=rsa-sha256 header.s=k20260515 header.b=OBWT4FV0;
	arc=none smtp.remote-ip=100.103.45.18
Received: from smtp.kernel.org (quasi.space.kernel.org [100.103.45.18])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id D1BDF606A32C
	for <devicetree@vger.kernel.org>; Sat,  7 Nov 2026 08:29:18 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.a=rsa-sha256 header.s=k20260515 header.b=OBWT4FV0
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 29E511F0089F;
	Sat,  7 Nov 2026 08:29:18 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kernel.org;
	s=k20260515; t=1794040158;
	bh=6gQ9Zr0DaEb8gGwtpBB/z6Myn8JoIsTKf7WojtqAvnM=;
	h=From:Subject:Reply-To:To:Cc:In-Reply-To:References:Date;
	b=OBWT4FV0cna9OTfY4uPWMg+hBHJ3dBMucpcBWyV+uY8YXVFELWv8JXY/ug/MQNDHB
	 RSI5zZx5dsLU6k3HVnEebrxAQOgeU7+gDGGci4SMlY09tok3gD5p53pRlPOv8y3JTB
	 ZxRtuDuwN1NU2ULt4zeCubgPa8M2UnC3UCJ/Z0U4rQvqDiZ9KJTcIeLF9gZU7cIlSo
	 BkwxOpSLIF88pnhPknqcbNQZO32LawtV5ex/9EYa1OatCbHBPLtJ6+UDyDTic01FdQ
	 2jxA8VO1WQGKniMZ8Ctb6iSILzbTdYws+YhFO2EYLjZNAAagvbvaWaeoZvlkjKeQNa
	 DMiOFh2yWqUDA==
Message-ID: <sashiko-outbox-202742@kernel.org>
From: sashiko-bot@kernel.org
Subject: Re: [PATCH v5 2/3] virt: bao: add I/O dispatcher driver
Reply-To: sashiko-reviews@lists.linux.dev
To: =?utf-8?b?Sm/Do28gUGVpeG90bw==?= <jpeixoto@osyx.tech>
Cc: devicetree@vger.kernel.org, robh@kernel.org, conor+dt@kernel.org
In-Reply-To: <c900781e2f68a7dc4e262cbb856dd3eee354974f.1794038390.git.jpeixoto@osyx.tech>
References: <cover.1794038390.git.jpeixoto@osyx.tech>
 <c900781e2f68a7dc4e262cbb856dd3eee354974f.1794038390.git.jpeixoto@osyx.tech>
Content-Type: text/plain; charset=utf-8
Content-Transfer-Encoding: quoted-printable
Date: Sat, 07 Nov 2026 08:29:17 +0000
X-Mailing-List: devicetree@vger.kernel.org
List-Id: <devicetree.vger.kernel.org>
List-Post: <mailto:devicetree@vger.kernel.org>
List-Help: <mailto:devicetree+help@vger.kernel.org>
List-Subscribe: <mailto:devicetree+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:devicetree+unsubscribe@vger.kernel.org>
List-Owner: <mailto:devicetree+owner@vger.kernel.org>
Precedence: list

Thank you for your contribution! Sashiko AI review found 7 potential
issues to consider:
- [Medium] virt: bao: race between attach error path and complete in
  bao_dm_ioctl()
- [Medium] virt: bao: missing 32-bit size_t truncation check in
  bao_dm_info_valid()
- [Medium] virt: bao: 32-bit unsigned long truncation on RV32 in
  bao_remio_hypercall()
- [Medium] virt: bao: broken client teardown order in
  bao_io_client_destroy()
- [Medium] virt: bao: missing eventfd read and -ENOENT in
  bao_irqfd_wakeup()/deassign()
- [Medium] virt: bao: broken conflict and datamatch handling in
  bao_ioeventfd_handler()
- [Low] virt: bao: range overflow and width truncation in
  bao_ioeventfd_match()
--

commit c7f53fde4f821f921b87ccd26ae05833f79dbbe0
Author: Jo=C3=A3o Peixoto <jpeixoto@osyx.tech>

virt: bao: add I/O dispatcher driver

This commit adds the Bao hypervisor I/O dispatcher driver, exposing a
/dev/bao control device and per-device-model file descriptors to bridge
Bao Remote I/O requests, ioeventfds, and irqfds to userspace VirtIO
backends.

[Severity: Medium]
In drivers/virt/bao/io-dispatcher/Kconfig (line 4), BAO_IO_DISPATCHER
depends on ARM64 || RISCV_SBI, which allows building the driver on 32-bit
RISC-V (CONFIG_32BIT=3Dy && CONFIG_RISCV_SBI=3Dy). Can bao_remio_hypercall()
in drivers/virt/bao/bao_hypercall.h (line 174) and the dm->inflight XArray
operations in drivers/virt/bao/io-dispatcher/dm.c (lines 53, 144, and 166)
silently truncate 64-bit values on RV32?

In bao_remio_hypercall(), the u64 fields of struct bao_remio_hypercall_ctx
(dm_id, addr, op, value, request_id) are loaded into unsigned long
registers a0-a4, truncating 64-bit MMIO addresses, 8-byte I/O values, and
request IDs to 32 bits. Similarly, xa_insert() and xa_erase() on
dm->inflight take an unsigned long index, truncating the upper 32 bits of
req->request_id. Should BAO_IO_DISPATCHER depend on ARM64 || (RISCV_SBI &&
64BIT)?

[Severity: Medium]
In drivers/virt/bao/io-dispatcher/dm.c, within bao_dm_ioctl() at lines
132-184, can the BAO_IOCTL_IO_CLIENT_ATTACH error path race with a
concurrent BAO_IOCTL_IO_REQUEST_COMPLETE on the same file descriptor and
complete the same request twice?

CPU0                                  CPU1
bao_dm_ioctl(IO_CLIENT_ATTACH)
  bao_dm_inflight_add(dm, &req)
                                      bao_dm_ioctl(IO_REQUEST_COMPLETE)
                                        xa_erase(&dm->inflight, id)
                                        bao_remio_hypercall(&ctx)
  copy_to_user(...) -> -EFAULT
  kfree(xa_erase(&dm->inflight, id))
  bao_io_request_complete_error(...)  <-- duplicate completion

bao_dm_inflight_add() publishes req.request_id into dm->inflight before
copy_to_user(). If another thread completes that request_id while
copy_to_user() faults, xa_erase() on the error path returns NULL (or
erases a newly attached request if the hypervisor reused request_id), and
bao_io_request_complete_error() issues a second completion hypercall to
the hypervisor. Copy req to userspace before inserting it into
dm->inflight, or only call bao_io_request_complete_error() when xa_erase()
returns the entry.

[Severity: Medium]
In drivers/virt/bao/io-dispatcher/dm.c, within bao_dm_info_valid() at
line 348, can a 64-bit info->shmem_size with zero lower 32 bits bypass
validation on 32-bit builds by truncating to 0 in size_t and unsigned
long?

When sizeof(size_t) < sizeof(u64), passing info->shmem_addr =3D 0 and
info->shmem_size =3D 0x100000000ULL passes !info->shmem_size,
PAGE_ALIGNED(info->shmem_size), and upper_32_bits(end) =3D=3D 0, but trunca=
tes
to size 0 in region_intersects() and request_mem_region() while leaving
dm->info.shmem_size set to 4 GiB. Adding a check for sizeof(size_t) <
sizeof(u64) && upper_32_bits(info->shmem_size) (matching
bao_ipcshmem_region_valid()) would prevent this.

[Severity: Medium]
In drivers/virt/bao/io-dispatcher/io_client.c, within
bao_io_client_destroy() at lines 140-161, does the teardown sequence
destroy dm->ioeventfds before stopping the kernel thread and then
prematurely resume the I/O dispatcher during DM teardown?

First, at line 140, bao_io_client_destroy() calls
bao_ioeventfd_client_destroy(dm) before kthread_stop(client->thread),
emptying and freeing dm->ioeventfds while bao_io_client_kernel_thread() is
still draining queued requests via bao_ioeventfd_handler(), which silently
drops those eventfd notifications.

Second, at line 161, bao_io_client_destroy() calls
bao_io_dispatcher_resume(dm), which re-installs dm->intc_handler and
queues dm->io_work on dm->io_wq. Because bao_io_client_destroy() is only
called from bao_io_clients_destroy() during full DM teardown (in
bao_dm_destroy() or the error unwind of bao_dm_create()), resuming the
dispatcher mid-teardown causes io_dispatcher() to run BAO_IO_ASK
hypercalls when a BAO_IOCTL_CREATE_DM call fails after creating
control_client (for example, when bao_intc_init() fails), and during
bao_dm_release() it re-queues dm->io_work between destroying
ioeventfd_client and control_client, misrouting or error-completing
requests before bao_io_dispatcher_destroy() finally drains the workqueue.
Pausing or destroying the dispatcher at the start of bao_dm_destroy()
(before completing inflight requests and destroying clients) and removing
bao_io_dispatcher_resume() from bao_io_client_destroy() would avoid this.

[Severity: Low]
In drivers/virt/bao/io-dispatcher/io_client.c, within
bao_io_request_in_range() at line 398, and
drivers/virt/bao/io-dispatcher/ioeventfd.c, within bao_ioeventfd_match()
at line 124 and bao_ioeventfd_handler() at line 294, can a malformed or
top-of-address-space request wrap around in the range check or truncate
req->access_width?

In bao_io_request_in_range(), evaluating (req->addr + req->access_width -
1) <=3D range->end without checking that req->access_width > 0 and does not
overflow u64 allows a zero access_width or an address near U64_MAX to wrap
around and falsely match the range. In addition, passing u64
req->access_width into the signed int len parameter of
bao_ioeventfd_match() and testing p->length >=3D len without requiring len >
0 allows a zero or negative-truncated length to match any registered
ioeventfd.

[Severity: Medium]
In drivers/virt/bao/io-dispatcher/ioeventfd.c, within
bao_ioeventfd_is_conflict() at line 103 and bao_ioeventfd_handler() at
line 292, are conflicting eventfds at the same address allowed, and are
non-matching writes to a datamatch range silently dropped?

First, bao_ioeventfd_is_conflict() checks p->eventfd =3D=3D
ioeventfd->eventfd, which allows registering two different eventfds for
the exact same address and data match even though bao_ioeventfd_match()
only ever signals the first matching entry on dm->ioeventfds.

Second, bao_ioeventfd_assign() adds [addr, addr + length - 1] to
dm->ioeventfd_client, and bao_io_client_find() in
drivers/virt/bao/io-dispatcher/io_client.c (line 415) routes every request
in that address range to dm->ioeventfd_client without checking whether any
ioeventfd matches the request's data value, exact address, or access
width. When a guest writes a virtqueue index with no registered ioeventfd
to a shared QueueNotify register that has a BAO_IOEVENTFD_FLAG_DATAMATCH
entry, bao_ioeventfd_handler() finds no match in bao_ioeventfd_match() and
returns 0, completing the hypercall and dropping the write instead of
forwarding it to dm->control_client.

[Severity: Medium]
In drivers/virt/bao/io-dispatcher/irqfd.c, within bao_irqfd_wakeup() at
line 86 and bao_irqfd_deassign() at line 237, does irqfd signaling leave
the eventfd counter unconsumed, and does deassigning an unknown irqfd
succeed?

In bao_irqfd_wakeup(), EPOLLIN triggers bao_irqfd_inject() without calling
eventfd_ctx_do_read() to consume the eventfd counter, leaving the eventfd
permanently readable (and eventually saturating its counter at ULLONG_MAX
- 1). Also, in bao_irqfd_deassign(), if no matching entry is found in
dm->irqfds, the function still flushes dm->irqfd_server and returns 0
instead of -ENOENT.

--=20
Sashiko AI review =C2=B7 https://sashiko.dev/#/patchset/cover.1794038390.gi=
t.jpeixoto@osyx.tech?part=3D2
