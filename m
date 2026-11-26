Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=100.103.45.18
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1795688354;
	b=zZKgolZnDeXMHNtGUPfJlpz++tIuKf7gV9+gg5HohPUSIpr6LCMgPsSc6gSlgLU5+IGv
	 M5BLxDJasf6mmUErbvWEPooOT4sSCadcda4IKgF/DT/a3FWUX/+9SKbvOQUu99kvOGzpw
	 AFvrcKWZhWkTm5U+pubYO7IaQjAkPK3LsIRm3c7ARTbxxXbjAL62fuXLTvJLsRQII4yRh
	 jD1rL+NuF3GX04UILZ0ZCTjYGTocrws7/LXsEYnfP1YsyMuKWD2jhr/3qJXdXROwJsl0u
	 5tcLupz9YyXJ3NJbjBFMQXNU7wZgMur637mdqLDNfhQL7obpPCrOu0eY4WOZVOvHQKw==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1795688354;
	h=Received:DKIM-Signature:Message-ID:From:Subject:Reply-To:To:Cc:
	 In-Reply-To:References:Content-Type:Content-Transfer-Encoding:Date;
	bh=yUV0jBK1iOfFkpsA73DAqDYsruYYSKa8V2Sc5aw0iek=;
	b=cz8P7+/PWrn2lJOHk+LzUWyK4i6nnSUUaYYDPVfirabDBDEQBNoJT3UTg7mIUM2gWpp5
	 apTp+G78Iq4NXQJa0N4fQBPR2ec8GzEKX9hdlKphgCj2jAG4ReFGuvZWhb+jGj4cR7fMd
	 ycZEj+qVgF6LB2JvfILKq0/GSR1MEl9bbGBm1KhvLSQIP26byc6pXW/SlnBqvzCndjKEa
	 lueFZAsyfwCjVE5ieF0QcpD6cweCCJztFPU98ttfhCexZEV8dFx7m0GNa+7fNNFMKa8DZ
	 CUwnPyFmf4GIs90/cxVX65UexWONyhmfPH1u1ZjYQ1H0wYq3DAaZs6eNG2o0IzAeosw==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dkim=pass header.d=kernel.org header.i=@kernel.org header.a=rsa-sha256 header.s=k20260515 header.b="JcwCg9y/";
	arc=none smtp.remote-ip=100.103.45.18
Received: from smtp.kernel.org (quasi.space.kernel.org [100.103.45.18])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 485A3606A31E
	for <devicetree@vger.kernel.org>; Thu, 26 Nov 2026 10:19:14 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.a=rsa-sha256 header.s=k20260515 header.b=JcwCg9y/
Received: by smtp.kernel.org (Postfix) with ESMTPSA id AD2A71F000CF;
	Thu, 26 Nov 2026 10:19:13 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kernel.org;
	s=k20260515; t=1795688353;
	bh=yUV0jBK1iOfFkpsA73DAqDYsruYYSKa8V2Sc5aw0iek=;
	h=From:Subject:Reply-To:To:Cc:In-Reply-To:References:Date;
	b=JcwCg9y/4hVT9X70rBzPslJ5IEwJpKnyuY1wAKujGNw1pagO73xP+oGdOMhEB+fAJ
	 6foH251xY+SGuX5arJ4h7x4avd4ArPqvdwNHKMlYBuMEkx2DB+qC6IpbseigiT/ZWX
	 dXfYc8kJAMie9+6/LZEC0e1L2G5w9fOu0TETaUR2w7pfd3zcms4Qhz/G0Zgi3HggCb
	 No98FLfdomwehweiEkYOrsd91bVR+vW3kClWiHqOASGnKdkf9dQ1SXPpGHNzPVfr1Q
	 Ia+V9fQMYf2NBSSA0TwLH4hV2Wq5xonnqnRTMdtkVZULg84lCp6J+3s8ZLSZMl9LLq
	 jCMOl2FDPfVuw==
Message-ID: <sashiko-outbox-235269@kernel.org>
From: sashiko-bot@kernel.org
Subject: Re: [PATCH v7 12/14] perf tools: Add RISC-V trace PMU record
 capabilities
Reply-To: sashiko-reviews@lists.linux.dev
To: "Mayuresh Chitale" <mayuresh.chitale@oss.qualcomm.com>
Cc: devicetree@vger.kernel.org, robh@kernel.org, conor+dt@kernel.org
In-Reply-To: <4755b47e4613daa764d2c50af1a1840afa2622b4.1795512532.git.mayuresh.chitale@oss.qualcomm.com>
References: <cover.1795512532.git.mayuresh.chitale@oss.qualcomm.com>
 <4755b47e4613daa764d2c50af1a1840afa2622b4.1795512532.git.mayuresh.chitale@oss.qualcomm.com>
Content-Type: text/plain; charset=utf-8
Content-Transfer-Encoding: quoted-printable
Date: Thu, 26 Nov 2026 10:19:13 +0000
X-Mailing-List: devicetree@vger.kernel.org
List-Id: <devicetree.vger.kernel.org>
List-Post: <mailto:devicetree@vger.kernel.org>
List-Help: <mailto:devicetree+help@vger.kernel.org>
List-Subscribe: <mailto:devicetree+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:devicetree+unsubscribe@vger.kernel.org>
List-Owner: <mailto:devicetree+owner@vger.kernel.org>
Precedence: list

Thank you for your contribution! Sashiko AI review found 2 potential
issues to consider:
- [Medium] perf riscv: gtrace PMU never sets pmu->auxtrace or
  pmu->selectable
- [Medium] perf riscv: rvtrace_recording_options() omits PERF_SAMPLE_CPU
  on gtrace evsel
--

commit 0c55086ce4e6f736821fda4e6c6b8b310252b04f
Author: Mayuresh Chitale <mayuresh.chitale@oss.qualcomm.com>

perf tools: Add RISC-V trace PMU record capabilities

This commit adds auxtrace recording callbacks and event definitions for
the RISC-V gtrace PMU in perf tools.

> diff --git a/tools/perf/arch/riscv/util/auxtrace.c b/tools/perf/arch/risc=
v/util/auxtrace.c
> new file mode 100644
> index 0000000000000..6331161dff7b0
> --- /dev/null
> +++ b/tools/perf/arch/riscv/util/auxtrace.c
> @@ -0,0 +1,220 @@

[ ... ]

> +static int rvtrace_recording_options(struct auxtrace_record *itr, struct=
 evlist *evlist,
> +				     struct record_opts *opts)
> +{
> +	struct rvtrace_recording *ptr =3D container_of(itr, struct rvtrace_reco=
rding, itr);
> +	struct perf_pmu *rvtrace_pmu =3D ptr->rvtrace_pmu;
> +	struct evsel *evsel, *rvtrace_evsel =3D NULL;
> +	struct evsel *tracking_evsel;
> +	int err;
> +
> +	ptr->evlist =3D evlist;
> +	evlist__for_each_entry(evlist, evsel) {
> +		if (evsel->core.attr.type =3D=3D rvtrace_pmu->type) {
> +			if (rvtrace_evsel) {
> +				pr_err("There may be only one " GTRACE_PMU_NAME " event\n");
> +				return -EINVAL;
> +			}
> +			evsel->core.attr.freq =3D 0;
> +			evsel->core.attr.sample_period =3D 1;
> +			evsel->needs_auxtrace_mmap =3D true;
> +			rvtrace_evsel =3D evsel;
> +			opts->full_auxtrace =3D true;
> +		}
> +	}
> +
> +	err =3D rvtrace_set_auxtrace_mmap_page(opts);
> +	if (err)
> +		return err;
> +	/*
> +	 * To obtain the auxtrace buffer file descriptor, the auxtrace event
> +	 * must come first.
> +	 */
> +	evlist__to_front(evlist, rvtrace_evsel);
> +	evsel__set_sample_bit(rvtrace_evsel, TIME);

[Severity: Medium]
Should rvtrace_recording_options() also set PERF_SAMPLE_CPU on
rvtrace_evsel?

The gtrace kernel driver calls perf_report_aux_output_id(event,
path->trace_id) per CPU in gtrace_event_start(), which relies on
PERF_SAMPLE_CPU in the event's sample_id to associate each hardware
trace_id with its CPU.  Without evsel__set_sample_bit(rvtrace_evsel,
CPU), per-thread recording (perf record -e gtrace// <workload> without
-a, -C or --sample-cpu) leaves PERF_SAMPLE_CPU unset, so
PERF_RECORD_AUX_OUTPUT_HW_ID and PERF_RECORD_AUX records have
sample.cpu =3D=3D -1 and cannot be matched to the CPU that produced the
trace.

[ ... ]

> +struct auxtrace_record *auxtrace_record__init(struct evlist *evlist, int=
 *err)
> +{
> +	struct perf_pmu	*rvtrace_pmu =3D NULL;
> +	struct perf_pmu *found_pmu =3D NULL;
> +	struct evsel *evsel;
> +
> +	if (!evlist)
> +		return NULL;
> +
> +	rvtrace_pmu =3D perf_pmus__find(GTRACE_PMU_NAME);

[Severity: Medium]
Does RISC-V need a perf_pmu__arch_init() implementation to set
pmu->auxtrace =3D true and pmu->selectable =3D true on the gtrace PMU?

evsel__is_aux_event() checks evsel->needs_auxtrace_mmap ||
pmu->auxtrace, and both parse_options() (for event grouping) and
record__auxtrace_init() (for auxtrace_parse_sample_options() and
auxtrace_parse_aux_action()) run before auxtrace_record__options() calls
rvtrace_recording_options() to set needs_auxtrace_mmap.  Because
pmu->auxtrace and pmu->selectable are never set for gtrace, event groups
led by gtrace// are split during parsing, --aux-sample and aux-action
terms fail validation, and gtrace// is omitted from perf list.

--=20
Sashiko AI review =C2=B7 https://sashiko.dev/#/patchset/cover.1795512532.gi=
t.mayuresh.chitale@oss.qualcomm.com?part=3D12
