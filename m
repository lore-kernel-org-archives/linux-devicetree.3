Received: from smtp.kernel.org (aws-us-west-2-korg-mail-alma10-1.taild15c8.ts.net [100.103.45.18])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 957E0433E66
	for <devicetree@vger.kernel.org>; Thu,  1 Oct 2026 05:44:54 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=100.103.45.18
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1790833496; cv=none; b=QQEcUwHjKaMx/dHtBFueGMxZCyhfvE+7ByIhWq6nEunowEICgeR1r3LsW+b4TBc96JrxV4nfJbDXK4yNAWVq/gy5l/wZVb69XRmGTci+NMuQjqBZoPg+ZdlRMQuevd0JdK8ia1wZa17PW4KeMYQ+5E2lClQFYfB7mdalOoVrlCw=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1790833496; c=relaxed/simple;
	bh=ks2tUmj2A1D5boLz72xDlIzh4zr8YFEkSSFW6f5plQ8=;
	h=From:Subject:To:Cc:In-Reply-To:References:Content-Type:Date:
	 Message-Id; b=SbsRJ93YKI9H2cLbGjJ4yJbq5k9kp3z46E60dQBPLEtMbQiUTokMAsHCb0AFesCGO+O2ibff8Ykn/YUoDdVbXZ26qpQ8dD0uBke/WVMEwIN+C0Sqw9vwk5QWocAgNHSZ7Ery95Sef3IxDBVQkq8wWDPR84pBpDMOAWn8nfDSObc=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=DfpwiXso; arc=none smtp.client-ip=100.103.45.18
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="DfpwiXso"
Received: by smtp.kernel.org (Postfix) with ESMTPSA id F2C551F000FF;
	Thu,  1 Oct 2026 05:44:53 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kernel.org;
	s=k20260515; t=1790833494;
	bh=typllaz/Hs9RKwTdinkdDDdgaaYATJ3kVQWnawBFK90=;
	h=From:Subject:Reply-To:To:Cc:In-Reply-To:References:Date;
	b=DfpwiXsoV91bBeqr4Rwu+9khvpPli1ysJxyu6nvoFQC1KHN64fb8epWWqtMKZu6kA
	 tQJc3vqnaagmX0FLfB8Xj4zWRSJXWFQzTeWzvSJJ2efcwoHyp2OGtfTwD/18Awq+Lx
	 07dbxqe6OV+90tn/ERWUA0TWT1mEfWHswxFqoHWYJ766gbhn8Fq9iNgPLicSc+U9lk
	 UK6g7r1Rs2hyob6EyV5MUGTPh4uW88Q4f/sXR8nYfZjgRxYtBZBOrC3ycWhp3a1b4G
	 jYSNGIx7m9ReUpbhlGPcZegbPMCLHiJ0znBYKIi6LmBxI/Z4rzJRx3EPSZto7L2kvl
	 aPXxFIXroo+/Q==
From: sashiko-bot@kernel.org
Subject: Re: [PATCH v6 11/14] gtrace: Add perf driver for tracing using perf
 tool
Reply-To: sashiko-reviews@lists.linux.dev
To: "Mayuresh Chitale" <mayuresh.chitale@oss.qualcomm.com>
Cc: devicetree@vger.kernel.org, conor+dt@kernel.org, robh@kernel.org
In-Reply-To: <20261001052243.3042627-12-mayuresh.chitale@oss.qualcomm.com>
References: <20261001052243.3042627-1-mayuresh.chitale@oss.qualcomm.com>
 <20261001052243.3042627-12-mayuresh.chitale@oss.qualcomm.com>
Content-Type: text/plain; charset=utf-8
Content-Transfer-Encoding: quoted-printable
Date: Thu, 01 Oct 2026 05:44:53 +0000
Message-Id: <20261001054453.F2C551F000FF@smtp.kernel.org>
Precedence: bulk
X-Mailing-List: devicetree@vger.kernel.org
List-Id: <devicetree.vger.kernel.org>
List-Subscribe: <mailto:devicetree+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:devicetree+unsubscribe@vger.kernel.org>

Thank you for your contribution! Sashiko AI review found 6 potential issue(=
s) to consider:
- [Critical] gtrace: NULL pointer dereference of event->owner in gtrace_set=
up_aux
- [High] gtrace: deferred vunmap creates dangling page table entries mappin=
g freed pages
- [High] gtrace: unbounded copyto_auxbuf overwrites unconsumed perf ring bu=
ffer data
- [Medium] gtrace: sink driver format flags overwritten in gtrace_event_stop
- [Medium] gtrace: perf_report_aux_output_id reports logical CPU instead of=
 hardware trace ID
- [Medium] kconfig: GTRACE selects PERF_EVENTS without inheriting HAVE_PERF=
_EVENTS dependency
--

commit 94baa393278755b8b8c03ef3fec39f40b4499dbb
Author: Mayuresh Chitale <mayuresh.chitale@oss.qualcomm.com>

gtrace: Add perf driver for tracing using perf tool

Add perf driver for the gtrace similar to ARM Coresight and Hisilicon
PTT drivers. The driver adds 'gtrace' event descriptor which can be used
by the perf tool to record the trace data.

> diff --git a/drivers/hwtracing/gtrace/Kconfig b/drivers/hwtracing/gtrace/=
Kconfig
> index de4a3b5335911..e5b62d65e2fdb 100644
> --- a/drivers/hwtracing/gtrace/Kconfig
> +++ b/drivers/hwtracing/gtrace/Kconfig
> @@ -3,6 +3,7 @@
>  menuconfig GTRACE
>  	tristate "Generic Hardware Trace Support"
>  	depends on OF
> +	select PERF_EVENTS

[Severity: Medium]
Will this cause unmet direct dependency warnings or build failures?

The PERF_EVENTS config symbol depends on HAVE_PERF_EVENTS. By using
select PERF_EVENTS unconditionally here, it forces the configuration on
even on architectures that support OF but do not have HAVE_PERF_EVENTS.

>  	help
>  	  This framework provides an architecture-neutral kernel interface
>  	  for hardware trace drivers. It builds a topological view of the

[ ... ]

> diff --git a/drivers/hwtracing/gtrace/gtrace-perf.c b/drivers/hwtracing/g=
trace/gtrace-perf.c
> new file mode 100644
> index 0000000000000..928f0405c6c17
> --- /dev/null
> +++ b/drivers/hwtracing/gtrace/gtrace-perf.c

[ ... ]

> +static void gtrace_free_aux(void *data)
> +{
> +	struct gtrace_event_data *event_data =3D data;
> +
> +	queue_work(gtrace_wq, &event_data->work);
> +}

[Severity: High]
Does this defer the vunmap() operation too late?

The perf core calls the pmu->free_aux callback synchronously, and immediate=
ly
after it returns, calls __free_page() on the underlying physical pages.

Because gtrace_free_aux() defers the cleanup to a workqueue, the physical
pages are freed while valid kernel vmap page table entries still point to
them.

This creates a window where memory corruption could occur if the driver or
hardware accesses the vmap address before the workqueue executes vunmap().

> +
> +static struct gtrace_path **gtrace_event_cpu_path_ptr(struct gtrace_even=
t_data *data,
> +							int cpu)
> +{
> +	return per_cpu_ptr(data->path, cpu);
> +}
> +
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
> +	if (event_data->buf.base)
> +		vunmap(event_data->buf.base);

[Severity: High]
As mentioned above, executing vunmap() asynchronously here creates a race
where the underlying pages have already been returned to the page allocator.

> +	free_percpu(event_data->path);
> +	kfree(event_data);
> +}
> +
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
> +		if (!src) {
> +			cpumask_clear_cpu(cpu, mask);
> +			continue;
> +		}
> +
> +		path =3D gtrace_create_path(src, NULL, GTRACE_COMPONENT_MODE_PERF);
> +		if (IS_ERR(path)) {
> +			cpumask_clear_cpu(cpu, mask);
> +			continue;
> +		}
> +
> +		path->owner =3D task_pid_nr(event->owner);

[Severity: Critical]
Can event->owner be NULL or TASK_TOMBSTONE here?

If an unprivileged user creates a trace event, forks, and the parent exits,
event->owner is cleared to NULL via perf_event_exit_task(). If the child
then mmaps the inherited file descriptor, gtrace_setup_aux() unconditionally
dereferences event->owner via task_pid_nr().

Additionally, kernel counters set event->owner to TASK_TOMBSTONE
((void *)-1L), which would also cause a panic.

> +		*gtrace_event_cpu_path_ptr(event_data, cpu) =3D path;
> +	}

[ ... ]

> +static void gtrace_event_start(struct perf_event *event, int flags)
> +{

[ ... ]

> +	/*
> +	 * output cpu / trace ID in perf record, once for the lifetime
> +	 * of the event.
> +	 */
> +	if (!cpumask_test_cpu(cpu, &event_data->aux_hwid_done)) {
> +		cpumask_set_cpu(cpu, &event_data->aux_hwid_done);
> +		perf_report_aux_output_id(event, cpu);

[Severity: Medium]
Should this report the hardware trace ID instead of the logical CPU index?

If the hardware trace stream embeds the real hardware trace ID, passing the
logical CPU index here means the decoder in userspace won't be able to match
packets to CPUs, breaking trace decoding.

Could this pass path->trace_id instead of the local cpu variable?

> +	}
> +
> +out:
> +	/* Tell the perf core the event is alive */
> +	event->hw.state =3D 0;
> +	ctxt->event_data =3D event_data;
> +	return;
> +fail_end:
> +	perf_aux_output_end(handle, 0);
> +fail:
> +	event->hw.state =3D PERF_HES_STOPPED;
> +}
> +
> +static void gtrace_event_stop(struct perf_event *event, int mode)
> +{
> +	struct gtrace_ctxt *ctxt =3D this_cpu_ptr(&gtrace_ctxt);
> +	struct perf_output_handle *handle =3D &ctxt->handle;
> +	u64 format =3D PERF_AUX_FLAG_GTRACE_FORMAT_UNKNOWN;
> +	struct gtrace_event_data *event_data;
> +	int ret, cpu =3D smp_processor_id();
> +	struct gtrace_path *path;
> +	size_t size =3D 0;

[ ... ]

> +	event->hw.state =3D PERF_HES_STOPPED;
> +	if (handle->event && (mode & PERF_EF_UPDATE)) {
> +		if (WARN_ON_ONCE(handle->event !=3D event))
> +			return;
> +		ret =3D gtrace_path_copyto_auxbuf(path, &event_data->buf, &size, &form=
at);

[Severity: High]
Does this allow an unbounded copy that can corrupt unread ring buffer data?

The gtrace_path_copyto_auxbuf() function is only passed event_data->buf,
which only knows the total buffer length, ignoring the handle->size limit
indicating how much contiguous space is safely writable.

> +		WARN_ON_ONCE(ret);
> +		format =3D gtrace_path_aux_format(path);

[Severity: Medium]
Are the format flags returned by the sink driver being discarded?

The gtrace_path_copyto_auxbuf() call allows the sink driver to set format
flags in the format parameter (like truncation or formatting details).

Immediately following this, the format variable is unconditionally
overwritten with gtrace_path_aux_format(), discarding the driver's flags
rather than OR'ing them.

> +		if (READ_ONCE(handle->event)) {
> +			/* Tag the AUX data with the source's trace format. */
> +			perf_aux_output_flag(handle, format);
> +			if (size > handle->size) {
> +				size =3D handle->size;
> +				perf_aux_output_flag(handle, PERF_AUX_FLAG_TRUNCATED);
> +			}

[Severity: High]
The check for size > handle->size happens here, after the unbounded memory=
=20
copy has already been performed.

> +			perf_aux_output_end(handle, size);
> +		} else
> +			WARN_ON(size);
> +	}
> +
> +	return;

--=20
Sashiko AI review =C2=B7 https://sashiko.dev/#/patchset/20261001052243.3042=
627-1-mayuresh.chitale@oss.qualcomm.com?part=3D11
