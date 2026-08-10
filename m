Received: from smtp.kernel.org (aws-us-west-2-korg-mail-alma10-1.taild15c8.ts.net [100.103.45.18])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 2159828B7EA
	for <devicetree@vger.kernel.org>; Mon, 10 Aug 2026 15:48:15 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=100.103.45.18
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1786376896; cv=none; b=JI3Vtk4ZOtpxxv+2UzObd4wVVUQ5Di3VdHEw1OdroaC0fGip1aJKSAKNwn36NGOfw/QzQWWOi1cYWrUc7GRNaYCl7I4HPvlFUWsho8ut38Sx7bfcg5geWoIpRx5IAZAKH8fSRp78p75t5XctRaA3hUScwz27QcmliW9loKn1xq8=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1786376896; c=relaxed/simple;
	bh=dquFBDCizMGwl5LrvVgMWRVAZkeb7n45Om4b33RXeok=;
	h=From:Subject:To:Cc:In-Reply-To:References:Content-Type:Date:
	 Message-Id; b=FD12eRhbJYXL6lvZa/BPN7eLTR5SUqJWhuwVFWXCvWulhGCWb5SSqfRCkcQg6bFIwu39YY18/ONp59F2rhs0GVD30TWuBjLGCDmtAuEKFNWskENvNbupdxe2P2aBd2sAIcq5hiyGovX19Q2tLHjy9QslJILe2xYlL2ZtpIPo+6o=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=MmMsng+/; arc=none smtp.client-ip=100.103.45.18
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="MmMsng+/"
Received: by smtp.kernel.org (Postfix) with ESMTPSA id C51491F000E9;
	Mon, 10 Aug 2026 15:48:14 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kernel.org;
	s=k20260515; t=1786376895;
	bh=KxkMlkWWG5X2vkA3QDxWQF+0KQSgZaAGGHjQ9S89Itc=;
	h=From:Subject:Reply-To:To:Cc:In-Reply-To:References:Date;
	b=MmMsng+/69MzbDmcICVpvZcH8zRgLWCMNkA8LGIu7LNNsW+KRv5nuo+c8AH2sM38U
	 p6NIiDW0+5f7JPj898TL7sJFlNKQHvRsg+tL4OlsbBakROy80+6r+WYpGJudentKcH
	 2LAxKI2kb2/+hMsJFmnjARzu+5/UAaV19k8quD3rAKddnhPzMJcr3PkITBzxauKzSv
	 5chobmxfDnVxAPY/JAaJrlPRy7g3AOND17oGYZEhLbgObTw3TIbAWJzUO57caD+wbo
	 USxrTrQuIhKYQ9cU4vmAcukupRvgw8JrX8sVBLa6YvOFAPhBq5C04B7WNfZQwHrWJZ
	 cjRL//GsB0ZWA==
From: sashiko-bot@kernel.org
Subject: Re: [PATCH v5 11/14] gtrace: Add perf driver for tracing using perf
 tool
Reply-To: sashiko-reviews@lists.linux.dev
To: "Mayuresh Chitale" <mayuresh.chitale@oss.qualcomm.com>
Cc: conor+dt@kernel.org, devicetree@vger.kernel.org, robh@kernel.org
In-Reply-To: <20260810152223.3946743-12-mayuresh.chitale@oss.qualcomm.com>
References: <20260810152223.3946743-1-mayuresh.chitale@oss.qualcomm.com>
 <20260810152223.3946743-12-mayuresh.chitale@oss.qualcomm.com>
Content-Type: text/plain; charset=utf-8
Content-Transfer-Encoding: quoted-printable
Date: Mon, 10 Aug 2026 15:48:13 +0000
Message-Id: <20260810154814.C51491F000E9@smtp.kernel.org>
Precedence: bulk
X-Mailing-List: devicetree@vger.kernel.org
List-Id: <devicetree.vger.kernel.org>
List-Subscribe: <mailto:devicetree+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:devicetree+unsubscribe@vger.kernel.org>

Thank you for your contribution! Sashiko AI review found 10 potential issue=
(s) to consider:
- [High] Unchecked return value of alloc_percpu() leads to NULL pointer der=
eference on allocation failure.
- [High] gtrace_setup_aux() checks for !path instead of IS_ERR(path), stori=
ng error pointers that cause crashes later.
- [High] Skipped CPUs are not cleared from event_data->mask, causing valida=
tion bypass and NULL pointer dereferences in cleanup.
- [High] The virtual memory mapped via vmap() for the AUX buffer is never u=
nmapped, permanently leaking vmalloc space.
- [High] Error paths in gtrace_event_start() and gtrace_event_stop() return=
 directly without calling perf_aux_output_end(), leaking the active AUX buf=
fer handle.
- [High] gtrace_event_stop() passes uninitialized size and format variables=
 to the perf core if gtrace_path_copyto_auxbuf() fails.
- [High] gtrace_path_start and gtrace_path_stop abort on the first componen=
t error without rolling back already-modified components.
- [High] Lock ordering violation: gtrace_event_stop() acquires a spinlock_t=
 inside the PMU stop callback, violating wait-context nesting.
- [High] Module unload race in gtrace_perf_exit() with pending asynchronous=
 work leads to use-after-free of module text.
- [Medium] The dynamically allocated pagelist array is permanently leaked o=
n the success path of gtrace_setup_aux().
--

--- Patch [11]: [PATCH v5 11/14] gtrace: Add perf driver for tracing using =
perf tool ---
commit 7444340c1bfa224d9b35f7fb63e614992d6414e2
Author: Mayuresh Chitale <mayuresh.chitale@oss.qualcomm.com>

gtrace: Add perf driver for tracing using perf tool
   =20
Add perf driver for the gtrace similar to ARM Coresight and Hisilicon
PTT drivers. The driver adds 'gtrace' event descriptor which can be used
by the perf tool to record the trace data. The actual data format depends
on type of encoder device and optionally the PMU specific trace format
type.

> diff --git a/drivers/hwtracing/gtrace/gtrace-perf.c b/drivers/hwtracing/g=
trace/gtrace-perf.c
> new file mode 100644
> index 0000000000000..ed9155bbbdb7a
> --- /dev/null
> +++ b/drivers/hwtracing/gtrace/gtrace-perf.c
> @@ -0,0 +1,347 @@
[ ... ]
> +static void *alloc_event_data(int cpu)
> +{
> +	struct gtrace_event_data *event_data;
> +	cpumask_t *mask;
> +
> +	event_data =3D kzalloc_obj(*event_data);
> +	if (!event_data)
> +		return NULL;
> +
> +	/* Update mask as per selected CPUs */
> +	mask =3D &event_data->mask;
> +	if (cpu !=3D -1)
> +		cpumask_set_cpu(cpu, mask);
> +	else
> +		cpumask_copy(mask, cpu_present_mask);
> +
> +	event_data->path =3D alloc_percpu(struct gtrace_path *);
> +	return event_data;
> +}

[Severity: High]
Can alloc_percpu() fail here?=20

If it returns a NULL pointer, event_data->path will be NULL. Later in
gtrace_setup_aux(), this pointer is passed to per_cpu_ptr(), which blindly
adds the CPU offset to the NULL pointer and generates an invalid kernel
address, resulting in an oops on dereference.

[ ... ]
> +static void free_event_data(struct work_struct *work)
> +{
> +	struct gtrace_event_data *event_data;
> +	struct gtrace_path *path;
> +	cpumask_t *mask;
> +	int cpu;
> +
> +	event_data =3D container_of(work, struct gtrace_event_data, work);
> +	mask =3D &event_data->mask;
> +	for_each_cpu(cpu, mask) {
> +		path =3D *gtrace_event_cpu_path_ptr(event_data, cpu);
> +		gtrace_destroy_path(path);
> +	}

[Severity: High]
When gtrace_setup_aux() skips CPUs due to initialization failures (e.g., if
gtrace_cpu_source() returns NULL), it leaves those CPUs in the mask.=20

Will this loop blindly pass uninitialized or NULL paths to
gtrace_destroy_path(), causing a NULL pointer dereference when accessing
path->comp_list?

> +	free_percpu(event_data->path);
> +	kfree(event_data);
> +}

[Severity: High]
Looking at the setup path in gtrace_setup_aux(), the buffer is mapped using
vmap(), but this cleanup function does not call vunmap(event_data->buf.base=
).

Will this permanently leak the vmalloc space each time a session is destroy=
ed?

[ ... ]
> +static void *gtrace_setup_aux(struct perf_event *event, void **pages,
> +			       int nr_pages, bool overwrite)
> +{
[ ... ]
> +	/*
> +	 * Create the path for each CPU in the mask. In case of any failure ski=
p the CPU
> +	 */
> +	for_each_cpu(cpu, mask) {
> +		struct gtrace_component *src;
> +		struct gtrace_path *path;
> +
> +		src =3D gtrace_cpu_source(cpu);
> +		if (!src)
> +			continue;
> +
> +		path =3D gtrace_create_path(src, NULL, GTRACE_COMPONENT_MODE_PERF);
> +		if (!path)
> +			continue;

[Severity: High]
When skipping a CPU due to these error paths, should the CPU be cleared from
event_data->mask?=20

Leaving it in the mask bypasses the check for valid CPUs below and causes
the cleanup function to operate on uninitialized pointers.

[Severity: High]
Does gtrace_create_path() return NULL on failure? Looking at its
implementation, it returns an error pointer like ERR_PTR(-ENOMEM).

Using !path here evaluates to false for error pointers, storing an invalid
pointer that will later cause a kernel panic when dereferenced.

> +
> +		*gtrace_event_cpu_path_ptr(event_data, cpu) =3D path;
> +	}
[ ... ]
> +	pagelist =3D kcalloc(nr_pages, sizeof(*pagelist), GFP_KERNEL);
> +	if (!pagelist)
> +		goto err;
> +
> +	for (i =3D 0; i < nr_pages; i++)
> +		pagelist[i] =3D virt_to_page(pages[i]);
> +
> +	event_data->buf.base =3D vmap(pagelist, nr_pages, VM_MAP, PAGE_KERNEL);
> +	if (!event_data->buf.base) {
> +		kfree(pagelist);
> +		goto err;
> +	}
> +
> +	event_data->buf.nr_pages =3D nr_pages;
> +	event_data->buf.length =3D nr_pages * PAGE_SIZE;
> +	event_data->buf.pos =3D 0;
> +	return event_data;

[Severity: Medium]
Is the pagelist array leaked on this success path?=20

The error path correctly frees it, but it appears vmap() only maps the pages
without taking ownership of the array itself.

[ ... ]
> +static void gtrace_event_start(struct perf_event *event, int flags)
> +{
[ ... ]
> +	event_data =3D perf_aux_output_begin(handle, event);
> +	if (!event_data)
> +		goto fail;
> +
> +	if (!cpumask_test_cpu(cpu, &event_data->mask))
> +		goto out;
> +
> +	event_data->buf.pos =3D handle->head % event_data->buf.length;
> +	path =3D *gtrace_event_cpu_path_ptr(event_data, cpu);
> +	if (!path) {
> +		pr_err("Error. Path not found\n");
> +		return;
> +	}

[Severity: High]
Because perf_aux_output_begin() successfully acquired a handle to the AUX
ring buffer, does this error path need to call perf_aux_output_end() before
returning? Returning directly leaves the ring buffer permanently locked.

> +
> +	if (gtrace_path_start(path)) {
> +		pr_err("Error. Tracing not started\n");
> +		return;
> +	}

[Severity: High]
Looking at gtrace_path_start(), if a component fails to start in the middle
of its initialization loop, it returns an error immediately.=20

Does this lack of rollback strand previously started hardware components in=
 an
active state?

[ ... ]
> +static void gtrace_event_stop(struct perf_event *event, int mode)
> +{
[ ... ]
> +	/* stop tracing */
> +	path =3D *gtrace_event_cpu_path_ptr(event_data, cpu);
> +	if (!path) {
> +		pr_err("Error. Path not found\n");
> +		return;
> +	}

[Severity: High]
If we hit this error path after an active handle is established, do we need
to call perf_aux_output_end() to properly close the session?

> +
> +	if (gtrace_path_stop(path)) {
> +		pr_err("Error. Tracing not stopped\n");
> +		return;
> +	}

[Severity: High]
Similar to gtrace_path_start(), gtrace_path_stop() aborts its loop early
if a single component fails to stop. Could this leave hardware components
running indefinitely?

> +
> +	event->hw.state =3D PERF_HES_STOPPED;
> +	if (handle->event && (mode & PERF_EF_UPDATE)) {
> +		if (WARN_ON_ONCE(handle->event !=3D event))
> +			return;
> +		spin_lock(&perf_buf_lock);

[Severity: High]
Is it safe to acquire perf_buf_lock here?=20

The perf events core invokes PMU stop callbacks with a raw_spinlock_t held.
Acquiring a regular spinlock_t while holding a raw lock is an invalid
wait-context nesting order and will trigger a BUG on PREEMPT_RT kernels.

> +		ret =3D gtrace_path_copyto_auxbuf(path, &event_data->buf, &size, &form=
at);
> +		spin_unlock(&perf_buf_lock);
> +		WARN_ON_ONCE(ret);
> +		if (READ_ONCE(handle->event)) {
> +			/* Tag the AUX data with the format reported by the sink. */
> +			perf_aux_output_flag(handle, format);
> +			if (size > handle->size) {
> +				size =3D handle->size;
> +				perf_aux_output_flag(handle, PERF_AUX_FLAG_TRUNCATED);
> +			}
> +			perf_aux_output_end(handle, size);

[Severity: High]
If gtrace_path_copyto_auxbuf() returns an error, size and format might
remain uninitialized.=20

Since this code emits a warning but continues execution, will it pass
stack-garbage values to perf_aux_output_flag() and perf_aux_output_end(),
corrupting the ring buffer head pointer?

[ ... ]
> +void __exit gtrace_perf_exit(void)
> +{
> +	perf_pmu_unregister(&gtrace_pmu);
> +}

[Severity: High]
The driver schedules asynchronous work items via schedule_work(&event_data-=
>work)
to clean up event data.=20

Does this exit function need to call flush_work() or flush_scheduled_work()
before returning? If the module unloads while work is pending, the workqueue
thread will execute freed memory.

--=20
Sashiko AI review =C2=B7 https://sashiko.dev/#/patchset/20260810152223.3946=
743-1-mayuresh.chitale@oss.qualcomm.com?part=3D11
