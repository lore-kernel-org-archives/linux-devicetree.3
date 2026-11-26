Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=100.103.45.18
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1795688614;
	b=k6OKaxDVslrYpNys85kSAT8IyDPB0vFoswmozPAaMztgDrLMve/ToFqeqXxEvY1BNrHV
	 UnxL4nMuVvHki0z12WBOjx7iflv8YHac3uTqXwTdTaBzxPbwpZN+Ien6gkS10thiiIlOs
	 aVTd6ZLSanWrDMrhOWpFEBKLW5ox84Ob03p1wba4udflXWR1chzjoA/bY/YVYl6JT11Sc
	 PmXtzUW5idrW8KB4YVWhhUrjFd+My997ipuA0v2zVanGBM0Ctu9MNIgFbFK6LBz/9PXQN
	 jlrvb9rVlm3W2tUSV7tX9TedJnE8roZ0oa3eoR12LedRGO6nsdzQWzlp5rJPq3rqFjA==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1795688614;
	h=Received:DKIM-Signature:Message-ID:From:Subject:Reply-To:To:Cc:
	 In-Reply-To:References:Content-Type:Content-Transfer-Encoding:Date;
	bh=1TBLnN/uwJQGe0oNrHHVufG+6IER1P7eBYCgKbgXUHQ=;
	b=dvYfvYJjqG3I7A/MapQx1n43z0IrJm6IJDvaLTWHQYb3HAh8uAB9PWRzTNN8ZG7qPVKj
	 0atiFQJyuCDhjRo/CCm2yIdWNzI3AkIPoquBv4xRedClkPwFZdxRBjpLvtWok6Cebfm6l
	 CLUgTC/AKU8I9q2So6ywUBj4RfXOWveTyk2GQn47t3jcrhYXZOsFsOlbtsRBETmFueMLK
	 mRoBkMZfxE4mDHJhqGGMr7F7wpkWTii6O6vOqKGU1NzeTdeofRSxCy7Nyspb6Cy8FDmIT
	 LC6bB4RzDfFLDe6DC8oT78Re7g15oyp253OnZ+C1rKXT80D0iOoPFCWrfPE9Uj+bvZQ==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dkim=pass header.d=kernel.org header.i=@kernel.org header.a=rsa-sha256 header.s=k20260515 header.b=i4aEdWcD;
	arc=none smtp.remote-ip=100.103.45.18
Received: from smtp.kernel.org (quasi.space.kernel.org [100.103.45.18])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id E47D1606A326
	for <devicetree@vger.kernel.org>; Thu, 26 Nov 2026 10:23:33 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.a=rsa-sha256 header.s=k20260515 header.b=i4aEdWcD
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 7AB861F00A36;
	Thu, 26 Nov 2026 10:23:33 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kernel.org;
	s=k20260515; t=1795688613;
	bh=1TBLnN/uwJQGe0oNrHHVufG+6IER1P7eBYCgKbgXUHQ=;
	h=From:Subject:Reply-To:To:Cc:In-Reply-To:References:Date;
	b=i4aEdWcDV86b9jKQBy1saotIjM+M+yjrZZI3HPLKiweMQYXkQzvcIBvMvbBj/435b
	 U8WJIbx9+7B+0e2Ua2yMDVaai6mHcPsoa9ObkoqgZovHbX4IjuMkw+eqThpUFGYKD1
	 GRyUE67FuP7U5Y2r6vE4IP/+bphuCR8WKnsMEOlhYgaCyH+clMcR9+vat6gQ8m19JC
	 yPKh7P75WD+ZsPZLyIGV6OpCKqflF/tPnuaZq99RJQ4qyI8v6Eg2whGhgp/clFWIQY
	 5qObZyMumNkhrLSsPSzTstkYqdBGca/4nPP1kOWIHSDaMCd4nJ8NWm0fpPJhnQ1skK
	 UAhhgS3pciSsw==
Message-ID: <sashiko-outbox-235274@kernel.org>
From: sashiko-bot@kernel.org
Subject: Re: [PATCH v7 11/14] gtrace: Add perf driver for tracing using perf
 tool
Reply-To: sashiko-reviews@lists.linux.dev
To: "Mayuresh Chitale" <mayuresh.chitale@oss.qualcomm.com>
Cc: devicetree@vger.kernel.org, robh@kernel.org, conor+dt@kernel.org
In-Reply-To: <52d43c11157ac39610889fed1d7192c9f5a82a0c.1795512532.git.mayuresh.chitale@oss.qualcomm.com>
References: <cover.1795512532.git.mayuresh.chitale@oss.qualcomm.com>
 <52d43c11157ac39610889fed1d7192c9f5a82a0c.1795512532.git.mayuresh.chitale@oss.qualcomm.com>
Content-Type: text/plain; charset=utf-8
Content-Transfer-Encoding: quoted-printable
Date: Thu, 26 Nov 2026 10:23:33 +0000
X-Mailing-List: devicetree@vger.kernel.org
List-Id: <devicetree.vger.kernel.org>
List-Post: <mailto:devicetree@vger.kernel.org>
List-Help: <mailto:devicetree+help@vger.kernel.org>
List-Subscribe: <mailto:devicetree+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:devicetree+unsubscribe@vger.kernel.org>
List-Owner: <mailto:devicetree+owner@vger.kernel.org>
Precedence: list

Thank you for your contribution! Sashiko AI review found 6 potential
issues to consider:
- [Critical] gtrace: NULL pointer dereference of event->owner in
  gtrace_setup_aux()
- [High] gtrace: gtrace_event_init() returns -EINVAL instead of -ENOENT
  on type mismatch
- [High] gtrace: unclosed AUX handle and leaked refcount in
  gtrace_event_stop()
- [High] gtrace: missing PERF_PMU_CAP_NO_EXCLUDE allows unprivileged
  kernel tracing
- [Medium] gtrace: missing perf_event_itrace_started() call in
  gtrace_event_start()
- [Medium] gtrace: race between gtrace_path_stop() and
  gtrace_path_copyto_auxbuf()
--

commit 3ba5b474daf5f255e16143a11ae06c6b2b9c9dd7
Author: Mayuresh Chitale <mayuresh.chitale@oss.qualcomm.com>

gtrace: Add perf driver for tracing using perf tool

This commit adds a perf PMU driver for the gtrace hardware tracing framework
to record trace data into perf AUX buffers.

> diff --git a/drivers/hwtracing/gtrace/gtrace-perf.c b/drivers/hwtracing/g=
trace/gtrace-perf.c
> new file mode 100644
> index 0000000000000..3ed0003f29e5a
> --- /dev/null
> +++ b/drivers/hwtracing/gtrace/gtrace-perf.c
> @@ -0,0 +1,368 @@

[ ... ]

> +static void *gtrace_setup_aux(struct perf_event *event, void **pages,
> +			       int nr_pages, bool overwrite)
> +{
> +	struct gtrace_event_data *event_data =3D NULL;
> +	struct page **pagelist;
> +	int cpu =3D event->cpu, i;
> +	cpumask_t *mask;
> +
> +	event_data =3D alloc_event_data(cpu);
> +	if (!event_data)
> +		return NULL;
> +
> +	mask =3D &event_data->mask;
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
> +		gtrace_put_component(src);
> +		if (IS_ERR(path)) {
> +			cpumask_clear_cpu(cpu, mask);
> +			continue;
> +		}
> +
> +		path->owner =3D task_pid_nr(event->owner);

[Severity: Critical]
Can task_pid_nr(event->owner) dereference a NULL or freed task_struct here?

If the thread that called perf_event_open() exits while another thread or
child process still holds the event file descriptor and calls mmap() to set
up the AUX buffer, perf_event_exit_task() clears event->owner to NULL before
the exiting task_struct is freed via RCU.  task_pid_nr() unconditionally
dereferences tsk->pid, and gtrace_setup_aux() reads event->owner across
sleeping calls without RCU protection or a NULL check.

[ ... ]

> +static int gtrace_event_init(struct perf_event *event)
> +{
> +	if (event->attr.type !=3D gtrace_pmu.type)
> +		return -EINVAL;
> +
> +	return 0;
> +}

[Severity: High]
Should gtrace_event_init() return -ENOENT instead of -EINVAL when
event->attr.type does not match gtrace_pmu.type?

When perf_init_event() walks the global pmus list to resolve an event, it
stops iterating as soon as any PMU callback returns an error other than
-ENOENT, so returning -EINVAL here causes unrelated perf_event_open() calls
to fail prematurely.

> +
> +static void gtrace_event_start(struct perf_event *event, int flags)
> +{
> +	struct gtrace_ctxt *ctxt =3D this_cpu_ptr(&gtrace_ctxt);
> +	struct perf_output_handle *handle =3D &ctxt->handle;
> +	struct gtrace_event_data *event_data;
> +	int cpu =3D smp_processor_id();
> +	struct gtrace_path *path;
> +
> +	if (WARN_ON(ctxt->event_data))
> +		goto fail;
> +
> +	/*
> +	 * Deal with the ring buffer API and get a handle on the
> +	 * session's information.
> +	 */
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
> +		dev_err_ratelimited(gtrace_pmu.dev, "Error. Path not found on cpu %d\n=
", cpu);
> +		goto fail_end;
> +	}
> +
> +	if (gtrace_path_start(path)) {
> +		dev_err_ratelimited(gtrace_pmu.dev, "Error. Tracing not started on cpu=
 %d\n", cpu);
> +		goto fail_end;
> +	}
> +
> +	/* Report the hardware source ID once per CPU for this AUX buffer. */
> +	if (path->trace_id !=3D GTRACE_INVALID_TRACE_ID &&
> +	    !cpumask_test_cpu(cpu, &event_data->aux_hwid_done)) {
> +		cpumask_set_cpu(cpu, &event_data->aux_hwid_done);
> +		perf_report_aux_output_id(event, path->trace_id);
> +	}
> +
> +out:
> +	/* Tell the perf core the event is alive */
> +	event->hw.state =3D 0;

[Severity: Medium]
Should gtrace_event_start() call perf_event_itrace_started(event)?

Because gtrace_pmu sets PERF_PMU_CAP_ITRACE, perf_log_itrace_start() checks
PERF_ATTACH_ITRACE on every event_sched_in().  Without
perf_event_itrace_started() setting PERF_ATTACH_ITRACE, perf emits a
PERF_RECORD_ITRACE_START record into the main ring buffer on every context
switch instead of only once when tracing starts.

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
> +	u64 aux_flags =3D PERF_AUX_FLAG_GTRACE_FORMAT_UNKNOWN;
> +	struct gtrace_event_data *event_data;
> +	int ret, cpu =3D smp_processor_id();
> +	struct gtrace_path *path;
> +	size_t size =3D 0;
> +
> +	if (event->hw.state =3D=3D PERF_HES_STOPPED)
> +		return;
> +
> +	if (handle->event && WARN_ON(perf_get_aux(handle) !=3D ctxt->event_data=
))
> +		return;
> +
> +	event_data =3D ctxt->event_data;
> +	ctxt->event_data =3D NULL;
> +
> +	if (WARN_ON(!event_data))
> +		return;
> +
> +	if (!cpumask_test_cpu(cpu, &event_data->mask))
> +		goto out_end;
> +
> +	/* stop tracing */
> +	path =3D *gtrace_event_cpu_path_ptr(event_data, cpu);
> +	if (!path) {
> +		dev_err_ratelimited(gtrace_pmu.dev, "Error. Path not found on cpu %d\n=
", cpu);
> +		goto out_end;
> +	}
> +
> +	if (gtrace_path_stop(path)) {
> +		dev_err_ratelimited(gtrace_pmu.dev, "Error. Tracing not stopped on cpu=
 %d\n", cpu);
> +		goto out_end;
> +	}
> +
> +	event->hw.state =3D PERF_HES_STOPPED;
> +	if (handle->event && (mode & PERF_EF_UPDATE)) {
> +		if (WARN_ON_ONCE(handle->event !=3D event))
> +			return;
> +		size =3D event_data->overwrite ? event_data->buf.length : handle->size;
> +		ret =3D gtrace_path_copyto_auxbuf(path, &event_data->buf, &size, &aux_=
flags);

[Severity: Medium]
Can another CPU start or stop a path sharing the same sink in the window
between gtrace_path_stop() and gtrace_path_copyto_auxbuf()?

CPU0                                  CPU1
gtrace_event_stop()
  gtrace_path_stop(path)
    __gtrace_comp_stop(sink)
      raw_spin_lock(&sink->lock)
      sink->start_count-- (becomes 0)
      gtdrv->stop(sink)
      raw_spin_unlock(&sink->lock)
                                      gtrace_event_start()
                                        gtrace_path_start(path)
                                          __gtrace_comp_start(sink)
                                            raw_spin_lock(&sink->lock)
                                            sink->start_count++ (becomes 1)
                                            gtdrv->start(sink)
                                            raw_spin_unlock(&sink->lock)
  gtrace_path_copyto_auxbuf()
    raw_spin_lock(&sink->lock)
    if (sink->start_count)
      *size =3D 0;  <-- trace data dropped

Similarly, if two CPUs sharing a sink stop concurrently, both can finish
gtrace_path_stop() and decrement sink->start_count to 0 before either enters
gtrace_path_copyto_auxbuf(), causing both CPUs to see sink->start_count =3D=
=3D 0
and copy from the sink.

> +		WARN_ON_ONCE(ret);
> +		aux_flags &=3D ~PERF_AUX_FLAG_PMU_FORMAT_TYPE_MASK;
> +		aux_flags |=3D gtrace_path_aux_format(path);
> +		if (READ_ONCE(handle->event)) {
> +			/* Snapshot overwrites are expected; TRUNCATED would disable the even=
t. */
> +			if (event_data->overwrite) {
> +				aux_flags &=3D ~PERF_AUX_FLAG_TRUNCATED;
> +				handle->head +=3D size;
> +			}
> +			/* Tag the AUX data with the source's trace format. */
> +			perf_aux_output_flag(handle, aux_flags);
> +			perf_aux_output_end(handle, size);
> +		} else
> +			WARN_ON(size);
> +	}
> +
> +	return;
> +
> +out_end:
> +	event->hw.state =3D PERF_HES_STOPPED;
> +	if (handle->event && (mode & PERF_EF_UPDATE))
> +		perf_aux_output_end(handle, 0);
> +}

[Severity: High]
Does gtrace_event_stop() leave the AUX output handle open and leak
rb->aux_refcount when called without PERF_EF_UPDATE?

When gtrace_event_stop() is called with mode =3D=3D 0 (for example, when a
grouped software sampling event throttles via perf_event_throttle_group()),
it clears ctxt->event_data and sets event->hw.state =3D PERF_HES_STOPPED
without calling perf_aux_output_end().  When gtrace_event_del() later calls
gtrace_event_stop(event, PERF_EF_UPDATE), it returns immediately because
event->hw.state is already PERF_HES_STOPPED, leaving handle->event active
and leaking the AUX buffer and event_data.

[ ... ]

> +int __init gtrace_perf_init(void)
> +{
> +	gtrace_pmu.capabilities	=3D (PERF_PMU_CAP_EXCLUSIVE | PERF_PMU_CAP_ITRA=
CE);

[Severity: High]
Should gtrace_pmu.capabilities include PERF_PMU_CAP_NO_EXCLUDE (or
gtrace_event_init() enforce perf_allow_kernel())?

Neither gtrace nor the encoder interface implements privilege-level trace
filtering.  Without PERF_PMU_CAP_NO_EXCLUDE, an unprivileged user can pass
attr.exclude_kernel =3D 1 to perf_event_open() to bypass the
perf_allow_kernel() check in sys_perf_event_open() while the hardware
still records kernel execution into the user's AUX buffer.

--=20
Sashiko AI review =C2=B7 https://sashiko.dev/#/patchset/cover.1795512532.gi=
t.mayuresh.chitale@oss.qualcomm.com?part=3D11
