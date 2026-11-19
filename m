Authentication-Results: smtp.subspace.kernel.org; arc=pass header.oldest-pass=0 smtp.remote-ip=209.85.221.41
ARC-Seal: i=2; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=pass;
	t=1795102575;
	b=hHimgX+yY0mRe2p9/dTYsj+rhCiwVt8UGxiBWMdl6WHjFkaNBCr93cCT+Iizm+Z5ASmg
	 mgNU+lXgICGm1GWYAJD3H4i7EBXVLvclUVyu6P8q+SLZth7PWvYULumsgt+eHOqYiaRM2
	 fGcVAxIFqCzC6MQC/hGHMIGFoM6afYljyxdpV1bs+qjND795v4QqD/+tUOhII1IIdAs/p
	 +XASceHZ8TCKk688+6jj/HykypnSJxpNtgZkZ8IBXOO3poDY0Temy291saXL03jBqtZj9
	 OUPa1+cAb5OZAz/cWld7Fg6ERj3kfGYWUoKm6e/OMQNWrO6jFGtpBU/XjnIY02oAxCw==
ARC-Message-Signature: i=2; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1795102575;
	h=DMARC-Filter:Received:DKIM-Signature:X-Google-DKIM-Signature:
	 X-Forwarded-Encrypted:X-Gm-Message-State:X-Gm-Gg:X-Received:
	 MIME-Version:References:In-Reply-To:From:Date:X-Gm-Features:
	 Message-ID:Subject:To:Cc:Content-Type:Content-Transfer-Encoding;
	bh=WJfLh02jhGDmJ0EUFJgx7atkBkA7JgkXwKZPwWOi/vA=;
	b=mrndFaFW00WfbukZ/WVxVOwATEOL3/TMmntLv6ZgV6JPS59X4ylIbu6W1LUq9o7NNdFF
	 8TU4Tr4crvzbDfxGvzOzPdzWjZeZ+u9U90h15OSZo69B9NvfG7YtqRpWpeahitbMlHynf
	 q0W8y6FCldOqpZtBnifP0+dit6GaqzjXpCsU+jU1uM33LzAlvXyIi/KHe+XQgb6rLXakC
	 c19WN4nONKHjB+xhdvWJyREsJHugtKxdwdOc5aYTAhz+xGb1wG9obcNYbcMXguY12DB8g
	 0NhZyUGnMyoTtncVUInrHo4b8kT6wWMjRF/IXUkpvXYgPMcOsp7CSf+wRyHt3ZnJrug==
ARC-Authentication-Results: i=2; smtp.subspace.kernel.org; 
	dmarc=none header.from=brainfault.org;
	spf=none smtp.mailfrom=brainfault.org;
	dkim=pass header.d=brainfault.org header.i=@brainfault.org header.a=rsa-sha256 header.s=google header.b=iVk+H+ff;
	arc=pass header.oldest-pass=0 smtp.remote-ip=209.85.221.41
Received: from mail-wr1-f41.google.com (mail-wr1-f41.google.com [209.85.221.41])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 48BA560A2607
	for <devicetree@vger.kernel.org>; Thu, 19 Nov 2026 15:36:13 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org 48BA560A2607
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=brainfault.org
Authentication-Results: smtp.subspace.kernel.org; spf=none smtp.mailfrom=brainfault.org
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=brainfault.org header.i=@brainfault.org header.a=rsa-sha256 header.s=google header.b=iVk+H+ff
Received: by mail-wr1-f41.google.com with SMTP id ffacd0b85a97d-490d59c3edaso796672f8f.1
        for <devicetree@vger.kernel.org>; Thu, 19 Nov 2026 07:36:13 -0800 (PST)
ARC-Seal: i=1; a=rsa-sha256; t=1795102572; cv=none;
        d=google.com; s=arc-20260327;
        b=QzAoYUsNNF4MT1zkH+dyNlR2h2QoirOEdaaaKIcwYemc9bJzByHS0XjUnf2lGwWsbJ
         LmC/0qo/aeUzF5W9W3MZ0P93b0IPZMVaVItwsCVB5b/Sw83NnORLHevJT/zHyZEito1h
         eEkRBPneJ1qTDblqz+a/vFwsIQzW7xpRDN+toPT54mFRnTxDXKiN9L6JjP2SAP89E1bJ
         H6BDMFxjOqMTNOM2Trn1MZ/uOMEut/Mn2WWZMvN+PFk5nsLDU0+KG8u2JWP5n3uCk5Jb
         GmCbdSqAVHXzFTxBpUQQkPFdIk8rTb3LpBS2bWPLpnDJIrNy0SHk2oQ304uznU2kh4WX
         80JA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20260327;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:dkim-signature;
        bh=WJfLh02jhGDmJ0EUFJgx7atkBkA7JgkXwKZPwWOi/vA=;
        fh=nlWe3CXDD3wTuaMdvZTfY9/8WJ4xZ5CLANSf6Gxp+vA=;
        b=rqX0xRRL5BpRxsYi2cm7SordUDvzfziyWNVCWlIYQrBh7PSGvHeq3Ficy2mas3NBWY
         hK4CDpF+BnqXbXGbAS0yNljXy0B8kkEO7iLywUWaGdpL30Lh95eKOSfsoW6YccGLW9hg
         gS4NEPRaPtknewfP8AmVpVYdn8p1P+QgltgPAXY6e9su/XFxRVdiD9BVM+YUxhnWbEun
         Sj90AhgqripONqZEQXjdT/BPcW5XZiNJlkEoBjfmzL8qdvOazXB7BHWyETFmNPPwx7va
         TnxuV1sXEcvS/nFkcNpgeatRGG+n/IafwnSwkRgV+kczQFkwhOq3+aTPc1kWWm4oiEYE
         xI1g==;
        darn=vger.kernel.org
ARC-Authentication-Results: i=1; mx.google.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=brainfault.org; s=google; t=1795102572; x=1795707372; darn=vger.kernel.org;
        h=content-transfer-encoding:content-type:cc:to:subject:message-id
         :date:from:in-reply-to:references:mime-version:from:to:cc:subject
         :date:message-id:reply-to:content-type;
        bh=WJfLh02jhGDmJ0EUFJgx7atkBkA7JgkXwKZPwWOi/vA=;
        b=iVk+H+ffp1rqFwM1QSxpqMbz8NwzqhWrqO/25zObdEiB4wH/z6ph7oRz5JX9/+ThNp
         T2Z9hZ6gAADKQXjMQphZuNBnsO+iNppHcFsNNRDfYi7eEoI3zVBn+stBrW5i94Px7QeG
         ND6OPNIrV8LkO+bH/2K/CkPmKzE3mn6tuIg9dNFGEvqJVMM/+wUn3j+uBr3s6qgZ0EhB
         ebvam5Y+6vNV8WWZpxsY+OTfkr2VCLMh26b0ZZMYvDqsDecGnZYTHzYNtFsnTnBguRm3
         y1WZAdgPMiiveH1TTXxX3XJzzeZqGNpKu8xBXrhMFwu1dc2aV8/PUz3MZ37J5clUW46g
         1eFg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1795102572; x=1795707372;
        h=content-transfer-encoding:content-type:cc:to:subject:message-id
         :date:from:in-reply-to:references:mime-version:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=WJfLh02jhGDmJ0EUFJgx7atkBkA7JgkXwKZPwWOi/vA=;
        b=B+xnhGY+ehAeHUn/nugqzIaO+/ZW8L8cC4VJHDtasJ645vHdOIZAmpYI1OpTIQ0aFT
         xsFKoYXSBZ+IBODtUAU3WWDcztC+cIXM6i3r7QaavNCAqGVTw1k0T2TJYpxGHOK3dHXC
         E5Z2HU+LaGoHJ3GAjXHCnLDmNh0YA6qfNgcUz8Cwu6d9pL7jYAhXsorHzxwFQjn/jV5H
         1u9QKPHRxpLDzuHgVKEkuRZl0fysTmgIhcQvEI6sPap9x2cu3CxdyhU6veeLQB6TnORr
         wGIbHqIPewI2EsclRKbkaqaiBk4M0feszSZuZ6Sqf5Bq1nPmxAN4DkoXf/OKKgKLeXkZ
         i8YQ==
X-Forwarded-Encrypted: i=1; AL+hErHM5X2LqUKC8oy+7gkTbNTk1zcwi5AOuR7e2g9xkKsIObAKNYHvROWVevGoSJsbfgsRX4EMIUvsm2MJ@vger.kernel.org
X-Gm-Message-State: APuU4Z+WIArQgOEuL94xx0pSDHyblZ34xPWeMaFEOVv5SYoxFP1fGctf
	b6y2MxBI+DuC69kCfdhsoYNjDAYH1fY9BLK3G4xq0HRGvGA3veGIK4s18EJCBn139F3hhF0jWLY
	HmQH1y5ac+/N1eC+zYN0He7kO6ji0dNfaJW3bs7PZzQ==
X-Gm-Gg: AZFdTZeIAkj7+C2KCSiTcipScR+in9s9aYEzr9n9hKmDl9fZS28qIESXU3CzIHNGt0z
	laouPELIyFmtp3B6Aq5Vv7WhoXZ3nQ7BEl+fFx4LNQhsQdf4/bbMvQ8WcVUrM69tplXqVrxGxwo
	W3FeZiNMLDQx02++XrEnHopf+t7fBXFmAsWBYiYdrocEDEqfzgTxVHrtzJJKznSPh07YTusDqtZ
	EuloSaih3jeZwf3YC9l+9eaOPC5ewxsU72oEaDbvZVcDTJosQ4pIWZirUCcDO4JfydplNpG69m8
	3hnBXS/xgvwaonSpQyObw8WK4NpIXcukS2rOiM9YTYiQ8N63Or+q4iA5NegjSrsk2yHm+Zb581Q
	Zj7yFwlN9TVPzf53d1lqQUUY6ZB4J1bKmZsxLPOWnczJcdf5XzXuCAEhVDFKCNfX5pkRuPcdDFO
	MjG0F2ID4Y4eAg8wWGRKzh5MN1iOF2PhX+NPPVPVKOITNw7pW+UDb4v4Y=
X-Received: by 2002:a05:6000:2903:b0:491:c392:1f31 with SMTP id
 ffacd0b85a97d-4aa5ab788d1mr3852229f8f.28.1795102571521; Thu, 19 Nov 2026
 07:36:11 -0800 (PST)
X-Mailing-List: devicetree@vger.kernel.org
List-Id: <devicetree.vger.kernel.org>
List-Post: <mailto:devicetree@vger.kernel.org>
List-Help: <mailto:devicetree+help@vger.kernel.org>
List-Subscribe: <mailto:devicetree+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:devicetree+unsubscribe@vger.kernel.org>
List-Owner: <mailto:devicetree+owner@vger.kernel.org>
Precedence: list
MIME-Version: 1.0
References: <20261118095053.3871267-1-vikram.singh3@oss.qualcomm.com> <20261118095053.3871267-7-vikram.singh3@oss.qualcomm.com>
In-Reply-To: <20261118095053.3871267-7-vikram.singh3@oss.qualcomm.com>
From: Anup Patel <anup@brainfault.org>
Date: Thu, 19 Nov 2026 21:05:59 +0530
X-Gm-Features: Aa3M54rnDKWA8w7Y4rJmmE_fS3tPOuMM_ZzdffiEjwoFDQtL4x53zCglx7T-XA4
Message-ID: <CAAhSdy1sQcepYMT52e211e9nKTwDA8FXC1P2KhTAjU8rTYQTzg@mail.gmail.com>
Subject: Re: [PATCH v5 6/7] riscv: pmu: Integrate CTR Ext support in
 riscv_pmu_dev driver
To: Vikram Singh <vikram.singh3@oss.qualcomm.com>
Cc: peterz@infradead.org, mingo@redhat.com, acme@kernel.org, 
	namhyung@kernel.org, mark.rutland@arm.com, alexander.shishkin@linux.intel.com, 
	jolsa@kernel.org, irogers@google.com, adrian.hunter@intel.com, 
	paul.walmsley@sifive.com, palmer@dabbelt.com, aou@eecs.berkeley.edu, 
	alex@ghiti.fr, atishp@rivosinc.com, anup.patel@oss.qualcomm.com, 
	will@kernel.org, robh@kernel.org, krzk+dt@kernel.org, conor+dt@kernel.org, 
	beeman@rivosinc.com, linux-perf-users@vger.kernel.org, 
	linux-kernel@vger.kernel.org, linux-riscv@lists.infradead.org, 
	linux-arm-kernel@lists.infradead.org, Conor Dooley <conor@kernel.org>, 
	devicetree@vger.kernel.org, Rajnesh Kanwal <rajnesh.kanwal49@gmail.com>
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

On Wed, Nov 18, 2026 at 3:21=E2=80=AFPM Vikram Singh
<vikram.singh3@oss.qualcomm.com> wrote:
>
> This integrates recently added CTR ext support in riscv_pmu_dev driver
> to enable branch stack sampling using PMU events.
>
> This mainly adds CTR enable/disable callbacks in rvpmu_ctr_stop()
> and rvpmu_ctr_start() function to start/stop branch recording along
> with the event.
>
> PMU overflow handler rvpmu_ovf_handler() is also updated to sample
> CTR entries in case of the overflow for the particular event programmed
> to records branches. The recorded entries are fed to core perf for
> further processing.
>
> Co-developed-by: Rajnesh Kanwal <rajnesh.kanwal49@gmail.com>
> Signed-off-by: Rajnesh Kanwal <rajnesh.kanwal49@gmail.com>
> Signed-off-by: Vikram Singh <vikram.singh3@oss.qualcomm.com>
> Link: https://lore.kernel.org/r/20261106173942.3175069-7-vikram.singh3@os=
s.qualcomm.com
> Signed-off-by: Anup Patel <anup@brainfault.org>

As mentioned in PATCH1, drop the "Link:" and the subsequent
"Signed-off-by:" lines.

> ---
>  drivers/perf/riscv_pmu.c     |  2 +-
>  drivers/perf/riscv_pmu_sbi.c | 72 ++++++++++++++++++++++++++++++++++--
>  2 files changed, 70 insertions(+), 4 deletions(-)
>
> diff --git a/drivers/perf/riscv_pmu.c b/drivers/perf/riscv_pmu.c
> index d4826eb73b16..fa9ae4e659d2 100644
> --- a/drivers/perf/riscv_pmu.c
> +++ b/drivers/perf/riscv_pmu.c
> @@ -327,7 +327,7 @@ static int riscv_pmu_event_init(struct perf_event *ev=
ent)
>         uint64_t cmask;
>
>         /* driver does not support branch stack sampling */
> -       if (has_branch_stack(event))
> +       if (has_branch_stack(event) && !riscv_pmu_ctr_supported(rvpmu))
>                 return -EOPNOTSUPP;
>
>         hwc->flags =3D 0;
> diff --git a/drivers/perf/riscv_pmu_sbi.c b/drivers/perf/riscv_pmu_sbi.c
> index b14b3acf7567..637b9d97e20a 100644
> --- a/drivers/perf/riscv_pmu_sbi.c
> +++ b/drivers/perf/riscv_pmu_sbi.c
> @@ -678,6 +678,9 @@ static int pmu_sbi_event_map(struct perf_event *event=
, u64 *econfig)
>          */
>         flush_work(&check_std_events_work);
>
> +       if (needs_branch_stack(event) && !riscv_pmu_ctr_valid(event))
> +               return -EOPNOTSUPP;
> +
>         return riscv_pmu_get_event_info(type, config, econfig);
>  }
>
> @@ -827,10 +830,14 @@ static void pmu_sbi_reset_scounteren(void *arg)
>
>  static void pmu_sbi_ctr_add(struct perf_event *event, int flags)
>  {
> +       if (needs_branch_stack(event))
> +               riscv_pmu_ctr_add(event);
>  }
>
>  static void pmu_sbi_ctr_del(struct perf_event *event, int flags)
>  {
> +       if (needs_branch_stack(event))
> +               riscv_pmu_ctr_del(event);
>  }
>
>  static void pmu_sbi_ctr_start(struct perf_event *event, u64 ival)
> @@ -847,6 +854,10 @@ static void pmu_sbi_ctr_start(struct perf_event *eve=
nt, u64 ival)
>         ret =3D sbi_ecall(SBI_EXT_PMU, SBI_EXT_PMU_COUNTER_START, hwc->id=
x,
>                         1, flag, ival);
>  #endif
> +
> +       if (needs_branch_stack(event))
> +               riscv_pmu_ctr_enable(event);
> +
>         if (ret.error && (ret.error !=3D SBI_ERR_ALREADY_STARTED))
>                 pr_err("Starting counter idx %d failed with error %d\n",
>                         hwc->idx, sbi_err_map_linux_errno(ret.error));
> @@ -864,6 +875,9 @@ static void pmu_sbi_ctr_stop(struct perf_event *event=
, unsigned long flag)
>         struct cpu_hw_events *cpu_hw_evt =3D this_cpu_ptr(pmu->hw_events)=
;
>         struct riscv_pmu_snapshot_data *sdata =3D cpu_hw_evt->snapshot_ad=
dr;
>
> +       if (needs_branch_stack(event) && flag !=3D RISCV_PMU_STOP_FLAG_RE=
SET)
> +               riscv_pmu_ctr_disable(event);
> +
>         if ((hwc->flags & PERF_EVENT_FLAG_USER_ACCESS) &&
>             (hwc->flags & PERF_EVENT_FLAG_USER_READ_CNT))
>                 pmu_sbi_reset_scounteren((void *)event);
> @@ -896,7 +910,7 @@ static void pmu_sbi_ctr_stop(struct perf_event *event=
, unsigned long flag)
>  static void pmu_sbi_sched_task(struct perf_event_pmu_context *pmu_ctx, s=
truct task_struct *task,
>                                bool sched_in)
>  {
> -       /* Call CTR specific Sched hook. */
> +       riscv_pmu_ctr_sched_task(pmu_ctx, task, sched_in);
>  }
>
>  static int pmu_sbi_find_num_ctrs(void)
> @@ -1179,6 +1193,12 @@ static irqreturn_t pmu_sbi_ovf_handler(int irq, vo=
id *dev)
>                 hw_evt->state |=3D PERF_HES_UPTODATE;
>                 perf_sample_data_init(&data, 0, hw_evt->last_period);
>                 if (riscv_pmu_event_set_period(event)) {
> +                       if (needs_branch_stack(event)) {
> +                               riscv_pmu_ctr_consume(cpu_hw_evt, event);
> +                               perf_sample_save_brstack(&data, event,
> +                                                        &cpu_hw_evt->bra=
nches->branch_stack, NULL);
> +                       }
> +
>                         /*
>                          * Unlike other ISAs, RISC-V don't have to disabl=
e interrupts
>                          * to avoid throttling here. As per the specifica=
tion, the
> @@ -1222,6 +1242,8 @@ static int pmu_sbi_starting_cpu(unsigned int cpu, s=
truct hlist_node *node)
>                 enable_percpu_irq(riscv_pmu_irq, IRQ_TYPE_NONE);
>         }
>
> +       riscv_pmu_ctr_starting_cpu();
> +
>         if (sbi_pmu_snapshot_available())
>                 return pmu_sbi_snapshot_setup(pmu, cpu);
>
> @@ -1237,6 +1259,8 @@ static int pmu_sbi_dying_cpu(unsigned int cpu, stru=
ct hlist_node *node)
>         /* Disable all counters access for user mode now */
>         csr_write(CSR_SCOUNTEREN, 0x0);
>
> +       riscv_pmu_ctr_dying_cpu();
> +
>         if (sbi_pmu_snapshot_available())
>                 return pmu_sbi_snapshot_disable();
>
> @@ -1367,7 +1391,30 @@ static void riscv_pmu_destroy(struct riscv_pmu *pm=
u)
>                 cpuhp_state_remove_instance(CPUHP_AP_PERF_RISCV_STARTING,=
 &pmu->node);
>  }
>
> -static void pmu_sbi_event_init(struct perf_event *event)
> +static int branch_records_alloc(struct riscv_pmu *pmu)
> +{
> +       struct branch_records __percpu *tmp_alloc_ptr;
> +       struct branch_records *records;
> +       struct cpu_hw_events *events;
> +       int cpu;
> +
> +       if (!riscv_pmu_ctr_supported(pmu))
> +               return 0;
> +
> +       tmp_alloc_ptr =3D alloc_percpu_gfp(struct branch_records, GFP_KER=
NEL);
> +       if (!tmp_alloc_ptr)
> +               return -ENOMEM;
> +
> +       for_each_possible_cpu(cpu) {
> +               events =3D per_cpu_ptr(pmu->hw_events, cpu);
> +               records =3D per_cpu_ptr(tmp_alloc_ptr, cpu);
> +               events->branches =3D records;
> +       }
> +
> +       return 0;
> +}
> +
> +static int pmu_sbi_event_init(struct perf_event *event)
>  {
>         /*
>          * The permissions are set at event_init so that we do not depend
> @@ -1379,6 +1426,11 @@ static void pmu_sbi_event_init(struct perf_event *=
event)
>                 event->hw.flags |=3D PERF_EVENT_FLAG_USER_ACCESS;
>         else
>                 event->hw.flags |=3D PERF_EVENT_FLAG_LEGACY;
> +
> +       if (branch_sample_call_stack(event))
> +               event->attach_state |=3D PERF_ATTACH_TASK_DATA;
> +
> +       return 0;
>  }
>
>  static void pmu_sbi_event_mapped(struct perf_event *event, struct mm_str=
uct *mm)
> @@ -1516,9 +1568,16 @@ static int pmu_sbi_device_probe(struct platform_de=
vice *pdev)
>                 pmu->pmu.capabilities |=3D PERF_PMU_CAP_NO_EXCLUDE;
>         }
>         irq_requested =3D (ret =3D=3D 0);
> -
>         pmu->pmu.attr_groups =3D riscv_pmu_attr_groups;
>         pmu->pmu.parent =3D &pdev->dev;
> +       ret =3D riscv_pmu_ctr_init(pmu);
> +       if (ret)
> +               goto out_free;
> +
> +       ret =3D branch_records_alloc(pmu);
> +       if (ret)
> +               goto out_ctr_finish;
> +
>         bitmap_copy(pmu->cmask, cmask, RISCV_MAX_COUNTERS);
>         pmu->ctr_add =3D pmu_sbi_ctr_add;
>         pmu->ctr_del =3D pmu_sbi_ctr_del;
> @@ -1535,6 +1594,10 @@ static int pmu_sbi_device_probe(struct platform_de=
vice *pdev)
>         pmu->csr_index =3D pmu_sbi_csr_index;
>         pmu->sched_task =3D pmu_sbi_sched_task;
>
> +       ret =3D cpuhp_state_add_instance(CPUHP_AP_PERF_RISCV_STARTING, &p=
mu->node);
> +       if (ret)
> +               goto out_ctr_finish;
> +
>         ret =3D riscv_pm_pmu_register(pmu);
>         if (ret)
>                 goto out_destroy;
> @@ -1592,6 +1655,9 @@ static int pmu_sbi_device_probe(struct platform_dev=
ice *pdev)
>                 riscv_pmu_irq =3D 0;
>         }
>
> +out_ctr_finish:
> +       riscv_pmu_ctr_finish(pmu);
> +
>  out_free:
>         free_percpu(pmu->hw_events);
>         kfree(pmu_ctr_list);
> --
> 2.43.0
>

Regards,
Anup
