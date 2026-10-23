Authentication-Results: smtp.subspace.kernel.org; arc=pass header.oldest-pass=0 smtp.remote-ip=209.85.221.51
ARC-Seal: i=2; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=pass;
	t=1792765978;
	b=g4xklgwO1D0N8uOWblCeP90nNjOXISVAZOe+1mZsfdvyUvL0kDv0q5qJXGuQIvs8FQkr
	 7oq/yRNH9rrGUx3qL/LEtyaZzOecKVfYJA5OeR9FnN6EvPVyHf+5TqnHd1hDcSx6qjzpk
	 X7PiXbeh5MoXHTHyfjDOOkNTU1GCKZahO/pqnWm2m3PCyc7wK2KB8pLOATxfgE/UTJQW7
	 gs8uNEQYemn8UHEGb3CU9aINIo4RrFV/po6cPcKOX9L2rCUTxUxULhj9o6KhQGEW+rK6X
	 026rygRWryiEXf+gtUVupnYn/NOQxBqaWswiE1e3Z8CZ6HsHR3UMBaZAmhWtAIBSjvQ==
ARC-Message-Signature: i=2; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1792765978;
	h=DMARC-Filter:Received:DKIM-Signature:X-Google-DKIM-Signature:
	 X-Forwarded-Encrypted:X-Gm-Message-State:X-Gm-Gg:X-Received:
	 MIME-Version:References:In-Reply-To:From:Date:X-Gm-Features:
	 Message-ID:Subject:To:Cc:Content-Type:Content-Transfer-Encoding;
	bh=BtTFuZT5+MM6BXl03nzl/xze0mtyv9q8vQbCGm5J8HQ=;
	b=S47sv6XVbTKxmy8jMqlfN3CLSek7NicbSgiWLHAWpFbxHNmteZXS2wJNGuh6/tbDq5lj
	 w/tUDdFXalzhzwPHAQ65lW3DVcoWaGxwDuCjQLw6BVXLetb2SpLbg6T2DEnFEIbFUVf0V
	 mPC6uhd4ZkkgMZXB/1p9zyBMdAwLrj+ZwXCg9wYlslRnVM+y3l3BuJGp1l8TFiwrGMLtV
	 ekz9sjBAPbp89xWsm8aiZTJE7S0h1lAOVdCX2PlOoMgJK7oSV9C9fnurZtWCaMK5lUAfZ
	 rleMMUcFvA7OmJ8vyQGbQ6/sVkjepknXSDYxOvzI1lGpnNyEJvG3cA1xxA4tmbdLt4g==
ARC-Authentication-Results: i=2; smtp.subspace.kernel.org; 
	dmarc=none header.from=brainfault.org;
	spf=none smtp.mailfrom=brainfault.org;
	dkim=pass header.d=brainfault.org header.i=@brainfault.org header.a=rsa-sha256 header.s=google header.b=DdQLebKa;
	arc=pass header.oldest-pass=0 smtp.remote-ip=209.85.221.51
Received: from mail-wr1-f51.google.com (mail-wr1-f51.google.com [209.85.221.51])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 46E22606A31B
	for <devicetree@vger.kernel.org>; Fri, 23 Oct 2026 14:32:57 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org 46E22606A31B
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=brainfault.org
Authentication-Results: smtp.subspace.kernel.org; spf=none smtp.mailfrom=brainfault.org
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key, unprotected) header.d=brainfault.org header.i=@brainfault.org header.a=rsa-sha256 header.s=google header.b=DdQLebKa
Received: by mail-wr1-f51.google.com with SMTP id ffacd0b85a97d-48e09aa5264so573726f8f.2
        for <devicetree@vger.kernel.org>; Fri, 23 Oct 2026 07:32:57 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1792765976; cv=none;
        d=google.com; s=arc-20260327;
        b=Mrrft4bTasSO9b6N6bF2n1bWjUyauIb5/vMTjLhgQV+77cskLfKFKpl7ciPvVDGVTy
         67Bk0LsOTfH3t08DjfNM6BYkIBooPJauWQFbjN3uNpYZuy5dGWKi6T598lccUVR8FhzP
         4QDaUUGiERPHO3Gaq1vM4CzAt1b6ufAuMHAm/0OadSdkiga+u6uWAFLTyXu2OA5Pb+/0
         g5YavkLC4GQslo1sJLFAH8f1quebAwb0O0NiCxDkvYHkc7WEmfW4gj+0Pvv3dxFUSX/2
         rASWgfHAgM5SFidAWyUhJ65oIgw3tbdK27Ix3Gdwj+RsiCdEiVxSP0+Q4y5ZXM8mWxXp
         YX/A==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20260327;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:dkim-signature;
        bh=BtTFuZT5+MM6BXl03nzl/xze0mtyv9q8vQbCGm5J8HQ=;
        fh=mRi6RkgbiYZt2bL1XhkVk3ktWiCl+0izqwfXdrl1M0c=;
        b=sqHCJ5OInyrxxMvfmMeYp12qCIXiAN36KkEAVjrOZ7OU18WLNGTP7J1gLPRQ01L0qh
         jSbB25jZ1sGr7Bavt7BRpxV/Kay8WG87Fgtw9CtRjwz4uDsw+RodqVXLFfv3/X8LE6fI
         MxE1qCsfjdkUSzwGDP0ph+UqdRhkwApckpGeYBYPboH4aAE3L8J4WESqeCqnxsnaexAp
         zhPcW5FRokrC6XfM3NIBSRpkLNYuJAZwNakiX4FfZc+jpw4clHd9mWQ1xeIWebda1Y6y
         +84B0j4HwR3/MKnxefaNa0f/DvbOLusAfMuKXGeEcNDFif46fzl3W6c6bT7HXoTpMxqh
         R+AA==;
        darn=vger.kernel.org
ARC-Authentication-Results: i=1; mx.google.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=brainfault.org; s=google; t=1792765976; x=1793370776; darn=vger.kernel.org;
        h=content-transfer-encoding:content-type:cc:to:subject:message-id
         :date:from:in-reply-to:references:mime-version:from:to:cc:subject
         :date:message-id:reply-to:content-type;
        bh=BtTFuZT5+MM6BXl03nzl/xze0mtyv9q8vQbCGm5J8HQ=;
        b=DdQLebKaOmKTCCVUyMX+Olo/Pq/0PVNENxMV8gqNJd4xgisxgJXEmmtnLXT9G9JoBv
         NvR0tT2DeNnzO40CdwzEo1Dseu2FQU1FEV5poQ+8iZUFuyy0KzfESuEFAVeEKw+g7kia
         h8PUYTjlZoXCSL0msYzZWeP3uoPWCp2FZTkOZnA8wSDdlP9Zzrb976d18wYpLZPY+r3a
         bjcf3j3XpuQ6tXvT762bOwfZDhLlA21NiPTVVXD/6w2imdO+AO/qiG5onUUIQqX3GpaN
         SI0q1tuIYy5Eq2/R8qZszapT6y1gcn1WgQ3hCLGwTDpZOmXrVIyjPb7BMzHMucthChHw
         otkQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1792765976; x=1793370776;
        h=content-transfer-encoding:content-type:cc:to:subject:message-id
         :date:from:in-reply-to:references:mime-version:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=BtTFuZT5+MM6BXl03nzl/xze0mtyv9q8vQbCGm5J8HQ=;
        b=f78tJviXkTcEpwHbc6PPm3XT/6mEAlrMhpjJagO7xXTOeA2gqTddgoj4wtBiCEI7k/
         u4P4gmXrx43NjbTUyIyXHby4EbnuYlhnT9J42NbaJNHNvAPBgySACLl1Nk9dCP3WjLsj
         u8LcK5Kqtt3qMgxgDuJ7myu9VC8udtJdtKVGsDQCk+36Eyv8xKGQvCfV8hqhP4c5u+Mk
         +Etlx0VBbMc2xb50zE3UimcKHpaLHJmOwfU4gYcnk9wYTlzt9WjJTLZ7fbTI1Rh6Z88Q
         UGbw5Y7Szkutl6d3CZ4d8QuDeEoKN1qkaohpaYZyhdXE+Kw+znRfGxMKYZLMc1d5uNKj
         +Jkg==
X-Forwarded-Encrypted: i=1; AKwUvBxyb3kDGKVCvlr9Dqi0PxahFQ7PLAuhiVhkuNRhsSG7m8ytZGcEw56z9FXBpqOx4OytHJHS1CQVPgSM@vger.kernel.org
X-Gm-Message-State: AFq9FYJyA5oRCsltNea8hYbDy6bU/hu4n6BECIU/pAUs0x523ij5omJj
	r9oFdm0145Y4ACV5WWlpk4fCL75L/ZoBzgX++Dqk++7y0ooiPNstiaZ/cCfb6824/QHNraJGpeC
	EPaSdFZE5WducnEFARx9pPQ4+N0k+q+rKpjQUBch8Rg==
X-Gm-Gg: AYBFou3Qk0CwImE4Pc8WgGt9B3S5b5UFFNyOF6Tk5vrrUttq40fCfvkt10Yb+lfbAQx
	Nio4sPSDPfq5E1UhErtaHFIhx5ba+d0yZ0vvzPGYi2c/x4ZvcDT1R6uv4mWnhcjYAGm7jjhXTFP
	y8O5f0/9LOyYG4kdq3HAl4JrZh5c7U0QwtXejV6tY0+PRgFsMplFlQh97ZlviWRycLyvwpwxJ7P
	70Yd5mcLW+L8GxVoR7kYFgO7CYbD7FHU+Dj6TB6+tbEq6ojl90F/0HBBp6z4QPLJ7ls5k7rMnpW
	5HlXTQQEVFoLI+hPkvkVwi7l4oir5AiJfvVyDgkS/wK27WrxJR8N84BQ5KsfhibOvtztmLQOTYb
	iUoGd6cIcZMLP2E/nnYDHxvlZpbc6TRiAxEpf3H+LWWR+/AFcYhtpUHyMn19SumoBoLmlhXfqJc
	w0hl6zXs840UTEzBzWsjnkWWE0mJwdgbSRYn601QfxE1rZ9E4gG4Ak/M8o
X-Received: by 2002:a05:6000:1446:b0:48d:ff81:5201 with SMTP id
 ffacd0b85a97d-48e385ba525mr4177360f8f.41.1792765975206; Fri, 23 Oct 2026
 07:32:55 -0700 (PDT)
X-Mailing-List: devicetree@vger.kernel.org
List-Id: <devicetree.vger.kernel.org>
List-Post: <mailto:devicetree@vger.kernel.org>
List-Help: <mailto:devicetree+help@vger.kernel.org>
List-Subscribe: <mailto:devicetree+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:devicetree+unsubscribe@vger.kernel.org>
List-Owner: <mailto:devicetree+owner@vger.kernel.org>
Precedence: list
MIME-Version: 1.0
References: <20260807-counter_delegation-v9-0-58658104e487@meta.com> <20260807-counter_delegation-v9-11-58658104e487@meta.com>
In-Reply-To: <20260807-counter_delegation-v9-11-58658104e487@meta.com>
From: Anup Patel <anup@brainfault.org>
Date: Fri, 23 Oct 2026 20:02:40 +0530
X-Gm-Features: AclHuK9Dg5IfUteMMASuBrJvRHMjyCMGxwj9xHcUtzds_tJQTVPB63HrkWtZPSA
Message-ID: <CAAhSdy1xGc0vD_5UPoXcHvGE8tq2R6ddUZ3O5NfjK-0AFWpAWQ@mail.gmail.com>
Subject: Re: [PATCH v9 11/20] RISC-V: perf: Restructure the SBI PMU code
To: Atish Patra <atish.patra@linux.dev>
Cc: Will Deacon <will@kernel.org>, Arnaldo Carvalho de Melo <acme@kernel.org>, Ian Rogers <irogers@google.com>, 
	Rob Herring <robh@kernel.org>, Paul Walmsley <pjw@kernel.org>, Mark Rutland <mark.rutland@arm.com>, 
	Jiri Olsa <jolsa@kernel.org>, Krzysztof Kozlowski <krzk+dt@kernel.org>, 
	James Clark <james.clark@linaro.org>, Namhyung Kim <namhyung@kernel.org>, 
	linux-riscv@lists.infradead.org, linux-arm-kernel@lists.infradead.org, 
	Conor Dooley <conor@kernel.org>, linux-kernel@vger.kernel.org, 
	linux-perf-users@vger.kernel.org, devicetree@vger.kernel.org
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

On Fri, Aug 7, 2026 at 1:40=E2=80=AFPM Atish Patra <atish.patra@linux.dev> =
wrote:
>
> From: Atish Patra <atishp@rivosinc.com>
>
> With Ssccfg/Smcdeleg, supervisor mode can program and access the
> hpmcounters and events directly, without the SBI PMU extension. The SBI
> PMU extension is still required for firmware counters. Restructure the
> existing SBI PMU code so the hpmcounter/event helpers can be shared
> between the SBI and the counter delegation paths that follow.
>
> The driver, file, module and Kconfig names are intentionally kept
> unchanged to avoid backport churn and userspace breakage (module listings=
,
> udev rules, cmdline options).
>
> No functional change intended.
>
> Signed-off-by: Atish Patra <atishp@rivosinc.com>

LGTM.

Reviewed-by: Anup Patel <anup@brainfault.org>

Regards,
Anup


> ---
>  drivers/perf/Kconfig         |  14 ++-
>  drivers/perf/riscv_pmu_sbi.c | 238 +++++++++++++++++++++++++------------=
------
>  2 files changed, 150 insertions(+), 102 deletions(-)
>
> diff --git a/drivers/perf/Kconfig b/drivers/perf/Kconfig
> index 245e7bb763b9..190cf0ee7065 100644
> --- a/drivers/perf/Kconfig
> +++ b/drivers/perf/Kconfig
> @@ -97,13 +97,17 @@ config RISCV_PMU_LEGACY
>
>  config RISCV_PMU_SBI
>         depends on RISCV_PMU && RISCV_SBI
> -       bool "RISC-V PMU based on SBI PMU extension"
> +       bool "RISC-V PMU based on SBI PMU extension and/or counter delega=
tion"
>         default y
>         help
> -         Say y if you want to use the CPU performance monitor
> -         using SBI PMU extension on RISC-V based systems. This option pr=
ovides
> -         full perf feature support i.e. counter overflow, privilege mode
> -         filtering, counter configuration.
> +         Say y if you want to use the CPU performance monitor on RISC-V =
based
> +         systems. This single driver supports both hardware counter acce=
ss
> +         mechanisms: it uses the counter delegation (Smcdeleg/Ssccfg) IS=
A
> +         extension to program and read the hpmcounters directly in super=
visor
> +         mode when available, and uses the SBI PMU extension for firmwar=
e
> +         counters and when counter delegation is not present. This optio=
n
> +         provides full perf feature support i.e. counter overflow, privi=
lege
> +         mode filtering, counter configuration.
>
>  config STARFIVE_STARLINK_PMU
>         depends on ARCH_STARFIVE || COMPILE_TEST
> diff --git a/drivers/perf/riscv_pmu_sbi.c b/drivers/perf/riscv_pmu_sbi.c
> index 50220f7b46d9..a8a197d341c3 100644
> --- a/drivers/perf/riscv_pmu_sbi.c
> +++ b/drivers/perf/riscv_pmu_sbi.c
> @@ -87,6 +87,8 @@ static const struct attribute_group *riscv_pmu_attr_gro=
ups[] =3D {
>  static int sysctl_perf_user_access __read_mostly =3D SYSCTL_USER_ACCESS;
>
>  /*
> + * This structure is SBI specific but counter delegation also require co=
unter
> + * width, csr mapping. Reuse it for now.
>   * RISC-V doesn't have heterogeneous harts yet. This need to be part of
>   * per_cpu in case of harts with different pmu counters
>   */
> @@ -99,7 +101,7 @@ static unsigned int riscv_pmu_irq;
>  /* Cache the available counters in a bitmask */
>  static unsigned long cmask;
>
> -static int pmu_event_find_cache(u64 config);
> +static int sbi_pmu_event_find_cache(u64 config);
>  struct sbi_pmu_event_data {
>         union {
>                 union {
> @@ -120,7 +122,7 @@ struct sbi_pmu_event_data {
>         };
>  };
>
> -static struct sbi_pmu_event_data pmu_hw_event_map[] =3D {
> +static struct sbi_pmu_event_data pmu_hw_event_sbi_map[] =3D {
>         [PERF_COUNT_HW_CPU_CYCLES]              =3D {.hw_gen_event =3D {
>                                                         SBI_PMU_HW_CPU_CY=
CLES,
>                                                         SBI_PMU_EVENT_TYP=
E_HW, 0}},
> @@ -154,7 +156,7 @@ static struct sbi_pmu_event_data pmu_hw_event_map[] =
=3D {
>  };
>
>  #define C(x) PERF_COUNT_HW_CACHE_##x
> -static struct sbi_pmu_event_data pmu_cache_event_map[PERF_COUNT_HW_CACHE=
_MAX]
> +static struct sbi_pmu_event_data pmu_cache_event_sbi_map[PERF_COUNT_HW_C=
ACHE_MAX]
>  [PERF_COUNT_HW_CACHE_OP_MAX]
>  [PERF_COUNT_HW_CACHE_RESULT_MAX] =3D {
>         [C(L1D)] =3D {
> @@ -301,7 +303,7 @@ static struct sbi_pmu_event_data pmu_cache_event_map[=
PERF_COUNT_HW_CACHE_MAX]
>
>  static int pmu_sbi_check_event_info(void)
>  {
> -       int num_events =3D ARRAY_SIZE(pmu_hw_event_map) + PERF_COUNT_HW_C=
ACHE_MAX *
> +       int num_events =3D ARRAY_SIZE(pmu_hw_event_sbi_map) + PERF_COUNT_=
HW_CACHE_MAX *
>                          PERF_COUNT_HW_CACHE_OP_MAX * PERF_COUNT_HW_CACHE=
_RESULT_MAX;
>         struct riscv_pmu_event_info *event_info_shmem;
>         phys_addr_t base_addr;
> @@ -312,14 +314,14 @@ static int pmu_sbi_check_event_info(void)
>         if (!event_info_shmem)
>                 return -ENOMEM;
>
> -       for (i =3D 0; i < ARRAY_SIZE(pmu_hw_event_map); i++)
> -               event_info_shmem[count++].event_idx =3D pmu_hw_event_map[=
i].event_idx;
> +       for (i =3D 0; i < ARRAY_SIZE(pmu_hw_event_sbi_map); i++)
> +               event_info_shmem[count++].event_idx =3D pmu_hw_event_sbi_=
map[i].event_idx;
>
> -       for (i =3D 0; i < ARRAY_SIZE(pmu_cache_event_map); i++) {
> -               for (j =3D 0; j < ARRAY_SIZE(pmu_cache_event_map[i]); j++=
) {
> -                       for (k =3D 0; k < ARRAY_SIZE(pmu_cache_event_map[=
i][j]); k++)
> +       for (i =3D 0; i < ARRAY_SIZE(pmu_cache_event_sbi_map); i++) {
> +               for (j =3D 0; j < ARRAY_SIZE(pmu_cache_event_sbi_map[i]);=
 j++) {
> +                       for (k =3D 0; k < ARRAY_SIZE(pmu_cache_event_sbi_=
map[i][j]); k++)
>                                 event_info_shmem[count++].event_idx =3D
> -                                                       pmu_cache_event_m=
ap[i][j][k].event_idx;
> +                                                       pmu_cache_event_s=
bi_map[i][j][k].event_idx;
>                 }
>         }
>
> @@ -335,19 +337,19 @@ static int pmu_sbi_check_event_info(void)
>                 goto free_mem;
>         }
>
> -       for (i =3D 0; i < ARRAY_SIZE(pmu_hw_event_map); i++) {
> +       for (i =3D 0; i < ARRAY_SIZE(pmu_hw_event_sbi_map); i++) {
>                 if (!(event_info_shmem[i].output & RISCV_PMU_EVENT_INFO_O=
UTPUT_MASK))
> -                       pmu_hw_event_map[i].event_idx =3D -ENOENT;
> +                       pmu_hw_event_sbi_map[i].event_idx =3D -ENOENT;
>         }
>
> -       count =3D ARRAY_SIZE(pmu_hw_event_map);
> +       count =3D ARRAY_SIZE(pmu_hw_event_sbi_map);
>
> -       for (i =3D 0; i < ARRAY_SIZE(pmu_cache_event_map); i++) {
> -               for (j =3D 0; j < ARRAY_SIZE(pmu_cache_event_map[i]); j++=
) {
> -                       for (k =3D 0; k < ARRAY_SIZE(pmu_cache_event_map[=
i][j]); k++) {
> +       for (i =3D 0; i < ARRAY_SIZE(pmu_cache_event_sbi_map); i++) {
> +               for (j =3D 0; j < ARRAY_SIZE(pmu_cache_event_sbi_map[i]);=
 j++) {
> +                       for (k =3D 0; k < ARRAY_SIZE(pmu_cache_event_sbi_=
map[i][j]); k++) {
>                                 if (!(event_info_shmem[count].output &
>                                       RISCV_PMU_EVENT_INFO_OUTPUT_MASK))
> -                                       pmu_cache_event_map[i][j][k].even=
t_idx =3D -ENOENT;
> +                                       pmu_cache_event_sbi_map[i][j][k].=
event_idx =3D -ENOENT;
>                                 count++;
>                         }
>                 }
> @@ -359,7 +361,7 @@ static int pmu_sbi_check_event_info(void)
>         return result;
>  }
>
> -static void pmu_sbi_check_event(struct sbi_pmu_event_data *edata)
> +static void rvpmu_sbi_check_event(struct sbi_pmu_event_data *edata)
>  {
>         struct sbiret ret;
>
> @@ -374,7 +376,7 @@ static void pmu_sbi_check_event(struct sbi_pmu_event_=
data *edata)
>         }
>  }
>
> -static void pmu_sbi_check_std_events(struct work_struct *work)
> +static void rvpmu_sbi_check_std_events(struct work_struct *work)
>  {
>         int ret;
>
> @@ -385,23 +387,23 @@ static void pmu_sbi_check_std_events(struct work_st=
ruct *work)
>                 return;
>         }
>
> -       for (int i =3D 0; i < ARRAY_SIZE(pmu_hw_event_map); i++)
> -               pmu_sbi_check_event(&pmu_hw_event_map[i]);
> +       for (int i =3D 0; i < ARRAY_SIZE(pmu_hw_event_sbi_map); i++)
> +               rvpmu_sbi_check_event(&pmu_hw_event_sbi_map[i]);
>
> -       for (int i =3D 0; i < ARRAY_SIZE(pmu_cache_event_map); i++)
> -               for (int j =3D 0; j < ARRAY_SIZE(pmu_cache_event_map[i]);=
 j++)
> -                       for (int k =3D 0; k < ARRAY_SIZE(pmu_cache_event_=
map[i][j]); k++)
> -                               pmu_sbi_check_event(&pmu_cache_event_map[=
i][j][k]);
> +       for (int i =3D 0; i < ARRAY_SIZE(pmu_cache_event_sbi_map); i++)
> +               for (int j =3D 0; j < ARRAY_SIZE(pmu_cache_event_sbi_map[=
i]); j++)
> +                       for (int k =3D 0; k < ARRAY_SIZE(pmu_cache_event_=
sbi_map[i][j]); k++)
> +                               rvpmu_sbi_check_event(&pmu_cache_event_sb=
i_map[i][j][k]);
>  }
>
> -static DECLARE_WORK(check_std_events_work, pmu_sbi_check_std_events);
> +static DECLARE_WORK(check_std_events_work, rvpmu_sbi_check_std_events);
>
> -static int pmu_sbi_ctr_get_width(int idx)
> +static int rvpmu_ctr_get_width(int idx)
>  {
>         return pmu_ctr_list[idx].width;
>  }
>
> -static bool pmu_sbi_ctr_is_fw(int cidx)
> +static bool rvpmu_ctr_is_fw(int cidx)
>  {
>         union sbi_pmu_ctr_info *info;
>
> @@ -420,10 +422,10 @@ int riscv_pmu_get_event_info(u32 type, u64 config, =
u64 *econfig)
>         case PERF_TYPE_HARDWARE:
>                 if (config >=3D PERF_COUNT_HW_MAX)
>                         return -EINVAL;
> -               ret =3D pmu_hw_event_map[config].event_idx;
> +               ret =3D pmu_hw_event_sbi_map[config].event_idx;
>                 break;
>         case PERF_TYPE_HW_CACHE:
> -               ret =3D pmu_event_find_cache(config);
> +               ret =3D sbi_pmu_event_find_cache(config);
>                 break;
>         case PERF_TYPE_RAW:
>                 /*
> @@ -508,12 +510,12 @@ int riscv_pmu_get_hpm_info(u32 *hw_ctr_width, u32 *=
num_hw_ctr)
>  }
>  EXPORT_SYMBOL_GPL(riscv_pmu_get_hpm_info);
>
> -static uint8_t pmu_sbi_csr_index(struct perf_event *event)
> +static uint8_t rvpmu_csr_index(struct perf_event *event)
>  {
>         return pmu_ctr_list[event->hw.idx].csr - CSR_CYCLE;
>  }
>
> -static unsigned long pmu_sbi_get_filter_flags(struct perf_event *event)
> +static unsigned long rvpmu_sbi_get_filter_flags(struct perf_event *event=
)
>  {
>         unsigned long cflags =3D 0;
>         bool guest_events =3D false;
> @@ -534,7 +536,7 @@ static unsigned long pmu_sbi_get_filter_flags(struct =
perf_event *event)
>         return cflags;
>  }
>
> -static int pmu_sbi_ctr_get_idx(struct perf_event *event)
> +static int rvpmu_sbi_ctr_get_idx(struct perf_event *event)
>  {
>         struct hw_perf_event *hwc =3D &event->hw;
>         struct riscv_pmu *rvpmu =3D to_riscv_pmu(event->pmu);
> @@ -544,7 +546,7 @@ static int pmu_sbi_ctr_get_idx(struct perf_event *eve=
nt)
>         uint64_t cbase =3D 0, cmask =3D rvpmu->cmask;
>         unsigned long cflags =3D 0;
>
> -       cflags =3D pmu_sbi_get_filter_flags(event);
> +       cflags =3D rvpmu_sbi_get_filter_flags(event);
>
>         /*
>          * In legacy mode, we have to force the fixed counters for those =
events
> @@ -581,7 +583,7 @@ static int pmu_sbi_ctr_get_idx(struct perf_event *eve=
nt)
>                 return -ENOENT;
>
>         /* Additional sanity check for the counter id */
> -       if (pmu_sbi_ctr_is_fw(idx)) {
> +       if (rvpmu_ctr_is_fw(idx)) {
>                 if (!test_and_set_bit(idx, cpuc->used_fw_ctrs))
>                         return idx;
>         } else {
> @@ -592,7 +594,7 @@ static int pmu_sbi_ctr_get_idx(struct perf_event *eve=
nt)
>         return -ENOENT;
>  }
>
> -static void pmu_sbi_ctr_clear_idx(struct perf_event *event)
> +static void rvpmu_ctr_clear_idx(struct perf_event *event)
>  {
>
>         struct hw_perf_event *hwc =3D &event->hw;
> @@ -600,13 +602,13 @@ static void pmu_sbi_ctr_clear_idx(struct perf_event=
 *event)
>         struct cpu_hw_events *cpuc =3D this_cpu_ptr(rvpmu->hw_events);
>         int idx =3D hwc->idx;
>
> -       if (pmu_sbi_ctr_is_fw(idx))
> +       if (rvpmu_ctr_is_fw(idx))
>                 clear_bit(idx, cpuc->used_fw_ctrs);
>         else
>                 clear_bit(idx, cpuc->used_hw_ctrs);
>  }
>
> -static int pmu_event_find_cache(u64 config)
> +static int sbi_pmu_event_find_cache(u64 config)
>  {
>         unsigned int cache_type, cache_op, cache_result, ret;
>
> @@ -622,7 +624,7 @@ static int pmu_event_find_cache(u64 config)
>         if (cache_result >=3D PERF_COUNT_HW_CACHE_RESULT_MAX)
>                 return -EINVAL;
>
> -       ret =3D pmu_cache_event_map[cache_type][cache_op][cache_result].e=
vent_idx;
> +       ret =3D pmu_cache_event_sbi_map[cache_type][cache_op][cache_resul=
t].event_idx;
>
>         return ret;
>  }
> @@ -638,7 +640,7 @@ static bool pmu_sbi_is_fw_event(struct perf_event *ev=
ent)
>                 return false;
>  }
>
> -static int pmu_sbi_event_map(struct perf_event *event, u64 *econfig)
> +static int rvpmu_sbi_event_map(struct perf_event *event, u64 *econfig)
>  {
>         u32 type =3D event->attr.type;
>         u64 config =3D event->attr.config;
> @@ -735,7 +737,7 @@ static int pmu_sbi_snapshot_setup(struct riscv_pmu *p=
mu, int cpu)
>         return 0;
>  }
>
> -static u64 pmu_sbi_ctr_read(struct perf_event *event)
> +static u64 rvpmu_sbi_ctr_read(struct perf_event *event)
>  {
>         struct hw_perf_event *hwc =3D &event->hw;
>         int idx =3D hwc->idx;
> @@ -777,25 +779,25 @@ static u64 pmu_sbi_ctr_read(struct perf_event *even=
t)
>         return val;
>  }
>
> -static void pmu_sbi_set_scounteren(void *arg)
> +static void rvpmu_set_scounteren(void *arg)
>  {
>         struct perf_event *event =3D (struct perf_event *)arg;
>
>         if (event->hw.idx !=3D -1)
>                 csr_write(CSR_SCOUNTEREN,
> -                         csr_read(CSR_SCOUNTEREN) | BIT(pmu_sbi_csr_inde=
x(event)));
> +                         csr_read(CSR_SCOUNTEREN) | BIT(rvpmu_csr_index(=
event)));
>  }
>
> -static void pmu_sbi_reset_scounteren(void *arg)
> +static void rvpmu_reset_scounteren(void *arg)
>  {
>         struct perf_event *event =3D (struct perf_event *)arg;
>
>         if (event->hw.idx !=3D -1)
>                 csr_write(CSR_SCOUNTEREN,
> -                         csr_read(CSR_SCOUNTEREN) & ~BIT(pmu_sbi_csr_ind=
ex(event)));
> +                         csr_read(CSR_SCOUNTEREN) & ~BIT(rvpmu_csr_index=
(event)));
>  }
>
> -static void pmu_sbi_ctr_start(struct perf_event *event, u64 ival)
> +static void rvpmu_sbi_ctr_start(struct perf_event *event, u64 ival)
>  {
>         struct sbiret ret;
>         struct hw_perf_event *hwc =3D &event->hw;
> @@ -815,10 +817,10 @@ static void pmu_sbi_ctr_start(struct perf_event *ev=
ent, u64 ival)
>
>         if ((hwc->flags & PERF_EVENT_FLAG_USER_ACCESS) &&
>             (hwc->flags & PERF_EVENT_FLAG_USER_READ_CNT))
> -               pmu_sbi_set_scounteren((void *)event);
> +               rvpmu_set_scounteren((void *)event);
>  }
>
> -static void pmu_sbi_ctr_stop(struct perf_event *event, unsigned long fla=
g)
> +static void rvpmu_sbi_ctr_stop(struct perf_event *event, unsigned long f=
lag)
>  {
>         struct sbiret ret;
>         struct hw_perf_event *hwc =3D &event->hw;
> @@ -828,7 +830,7 @@ static void pmu_sbi_ctr_stop(struct perf_event *event=
, unsigned long flag)
>
>         if ((hwc->flags & PERF_EVENT_FLAG_USER_ACCESS) &&
>             (hwc->flags & PERF_EVENT_FLAG_USER_READ_CNT))
> -               pmu_sbi_reset_scounteren((void *)event);
> +               rvpmu_reset_scounteren((void *)event);
>
>         if (sbi_pmu_snapshot_available())
>                 flag |=3D SBI_PMU_STOP_FLAG_TAKE_SNAPSHOT;
> @@ -854,7 +856,7 @@ static void pmu_sbi_ctr_stop(struct perf_event *event=
, unsigned long flag)
>         }
>  }
>
> -static int pmu_sbi_find_num_ctrs(void)
> +static int rvpmu_sbi_find_num_ctrs(void)
>  {
>         struct sbiret ret;
>
> @@ -865,7 +867,7 @@ static int pmu_sbi_find_num_ctrs(void)
>                 return sbi_err_map_linux_errno(ret.error);
>  }
>
> -static int pmu_sbi_get_ctrinfo(int nctr, unsigned long *mask)
> +static int rvpmu_sbi_get_ctrinfo(int nctr, unsigned long *mask)
>  {
>         struct sbiret ret;
>         int i, num_hw_ctr =3D 0, num_fw_ctr =3D 0;
> @@ -896,7 +898,7 @@ static int pmu_sbi_get_ctrinfo(int nctr, unsigned lon=
g *mask)
>         return 0;
>  }
>
> -static inline void pmu_sbi_stop_all(struct riscv_pmu *pmu)
> +static inline void rvpmu_sbi_stop_all(struct riscv_pmu *pmu)
>  {
>         /*
>          * No need to check the error because we are disabling all the co=
unters
> @@ -906,7 +908,7 @@ static inline void pmu_sbi_stop_all(struct riscv_pmu =
*pmu)
>                   0, pmu->cmask, SBI_PMU_STOP_FLAG_RESET, 0, 0, 0);
>  }
>
> -static inline void pmu_sbi_stop_hw_ctrs(struct riscv_pmu *pmu)
> +static inline void rvpmu_sbi_stop_hw_ctrs(struct riscv_pmu *pmu)
>  {
>         struct cpu_hw_events *cpu_hw_evt =3D this_cpu_ptr(pmu->hw_events)=
;
>         struct riscv_pmu_snapshot_data *sdata =3D cpu_hw_evt->snapshot_ad=
dr;
> @@ -950,8 +952,8 @@ static inline void pmu_sbi_stop_hw_ctrs(struct riscv_=
pmu *pmu)
>   * while the overflowed counters need to be started with updated initial=
ization
>   * value.
>   */
> -static inline void pmu_sbi_start_ovf_ctrs_sbi(struct cpu_hw_events *cpu_=
hw_evt,
> -                                             u64 ctr_ovf_mask)
> +static inline void rvpmu_sbi_start_ovf_ctrs_sbi(struct cpu_hw_events *cp=
u_hw_evt,
> +                                               u64 ctr_ovf_mask)
>  {
>         int idx =3D 0, i;
>         struct perf_event *event;
> @@ -991,8 +993,8 @@ static inline void pmu_sbi_start_ovf_ctrs_sbi(struct =
cpu_hw_events *cpu_hw_evt,
>         }
>  }
>
> -static inline void pmu_sbi_start_ovf_ctrs_snapshot(struct cpu_hw_events =
*cpu_hw_evt,
> -                                                  u64 ctr_ovf_mask)
> +static inline void rvpmu_sbi_start_ovf_ctrs_snapshot(struct cpu_hw_event=
s *cpu_hw_evt,
> +                                                    u64 ctr_ovf_mask)
>  {
>         int i, idx =3D 0;
>         struct perf_event *event;
> @@ -1026,18 +1028,18 @@ static inline void pmu_sbi_start_ovf_ctrs_snapsho=
t(struct cpu_hw_events *cpu_hw_
>         }
>  }
>
> -static void pmu_sbi_start_overflow_mask(struct riscv_pmu *pmu,
> -                                       u64 ctr_ovf_mask)
> +static void rvpmu_sbi_start_overflow_mask(struct riscv_pmu *pmu,
> +                                         u64 ctr_ovf_mask)
>  {
>         struct cpu_hw_events *cpu_hw_evt =3D this_cpu_ptr(pmu->hw_events)=
;
>
>         if (sbi_pmu_snapshot_available())
> -               pmu_sbi_start_ovf_ctrs_snapshot(cpu_hw_evt, ctr_ovf_mask)=
;
> +               rvpmu_sbi_start_ovf_ctrs_snapshot(cpu_hw_evt, ctr_ovf_mas=
k);
>         else
> -               pmu_sbi_start_ovf_ctrs_sbi(cpu_hw_evt, ctr_ovf_mask);
> +               rvpmu_sbi_start_ovf_ctrs_sbi(cpu_hw_evt, ctr_ovf_mask);
>  }
>
> -static irqreturn_t pmu_sbi_ovf_handler(int irq, void *dev)
> +static irqreturn_t rvpmu_ovf_handler(int irq, void *dev)
>  {
>         struct perf_sample_data data;
>         struct pt_regs *regs;
> @@ -1069,7 +1071,7 @@ static irqreturn_t pmu_sbi_ovf_handler(int irq, voi=
d *dev)
>         }
>
>         pmu =3D to_riscv_pmu(event->pmu);
> -       pmu_sbi_stop_hw_ctrs(pmu);
> +       rvpmu_sbi_stop_hw_ctrs(pmu);
>
>         /* Overflow status register should only be read after counter are=
 stopped */
>         if (sbi_pmu_snapshot_available())
> @@ -1138,13 +1140,55 @@ static irqreturn_t pmu_sbi_ovf_handler(int irq, v=
oid *dev)
>                 hw_evt->state =3D 0;
>         }
>
> -       pmu_sbi_start_overflow_mask(pmu, overflowed_ctrs);
> +       rvpmu_sbi_start_overflow_mask(pmu, overflowed_ctrs);
>         perf_sample_event_took(sched_clock() - start_clock);
>
>         return IRQ_HANDLED;
>  }
>
> -static int pmu_sbi_starting_cpu(unsigned int cpu, struct hlist_node *nod=
e)
> +static void rvpmu_ctr_start(struct perf_event *event, u64 ival)
> +{
> +       rvpmu_sbi_ctr_start(event, ival);
> +       /* TODO: Counter delegation implementation */
> +}
> +
> +static void rvpmu_ctr_stop(struct perf_event *event, unsigned long flag)
> +{
> +       rvpmu_sbi_ctr_stop(event, flag);
> +       /* TODO: Counter delegation implementation */
> +}
> +
> +static int rvpmu_find_num_ctrs(void)
> +{
> +       return rvpmu_sbi_find_num_ctrs();
> +       /* TODO: Counter delegation implementation */
> +}
> +
> +static int rvpmu_get_ctrinfo(int nctr, unsigned long *mask)
> +{
> +       return rvpmu_sbi_get_ctrinfo(nctr, mask);
> +       /* TODO: Counter delegation implementation */
> +}
> +
> +static int rvpmu_event_map(struct perf_event *event, u64 *econfig)
> +{
> +       return rvpmu_sbi_event_map(event, econfig);
> +       /* TODO: Counter delegation implementation */
> +}
> +
> +static int rvpmu_ctr_get_idx(struct perf_event *event)
> +{
> +       return rvpmu_sbi_ctr_get_idx(event);
> +       /* TODO: Counter delegation implementation */
> +}
> +
> +static u64 rvpmu_ctr_read(struct perf_event *event)
> +{
> +       return rvpmu_sbi_ctr_read(event);
> +       /* TODO: Counter delegation implementation */
> +}
> +
> +static int rvpmu_starting_cpu(unsigned int cpu, struct hlist_node *node)
>  {
>         struct riscv_pmu *pmu =3D hlist_entry_safe(node, struct riscv_pmu=
, node);
>         struct cpu_hw_events *cpu_hw_evt =3D this_cpu_ptr(pmu->hw_events)=
;
> @@ -1159,7 +1203,7 @@ static int pmu_sbi_starting_cpu(unsigned int cpu, s=
truct hlist_node *node)
>                 csr_write(CSR_SCOUNTEREN, 0x2);
>
>         /* Stop all the counters so that they can be enabled from perf */
> -       pmu_sbi_stop_all(pmu);
> +       rvpmu_sbi_stop_all(pmu);
>
>         if (riscv_pmu_use_irq) {
>                 cpu_hw_evt->irq =3D riscv_pmu_irq;
> @@ -1173,7 +1217,7 @@ static int pmu_sbi_starting_cpu(unsigned int cpu, s=
truct hlist_node *node)
>         return 0;
>  }
>
> -static int pmu_sbi_dying_cpu(unsigned int cpu, struct hlist_node *node)
> +static int rvpmu_dying_cpu(unsigned int cpu, struct hlist_node *node)
>  {
>         if (riscv_pmu_use_irq) {
>                 disable_percpu_irq(riscv_pmu_irq);
> @@ -1188,7 +1232,7 @@ static int pmu_sbi_dying_cpu(unsigned int cpu, stru=
ct hlist_node *node)
>         return 0;
>  }
>
> -static int pmu_sbi_setup_irqs(struct riscv_pmu *pmu, struct platform_dev=
ice *pdev)
> +static int rvpmu_setup_irqs(struct riscv_pmu *pmu, struct platform_devic=
e *pdev)
>  {
>         int ret;
>         struct cpu_hw_events __percpu *hw_events =3D pmu->hw_events;
> @@ -1230,7 +1274,7 @@ static int pmu_sbi_setup_irqs(struct riscv_pmu *pmu=
, struct platform_device *pde
>                 goto err;
>         }
>
> -       ret =3D request_percpu_irq(riscv_pmu_irq, pmu_sbi_ovf_handler, "r=
iscv-pmu", hw_events);
> +       ret =3D request_percpu_irq(riscv_pmu_irq, rvpmu_ovf_handler, "ris=
cv-pmu", hw_events);
>         if (ret) {
>                 pr_err("registering percpu irq failed [%d]\n", ret);
>                 irq_dispose_mapping(riscv_pmu_irq);
> @@ -1312,7 +1356,7 @@ static void riscv_pmu_destroy(struct riscv_pmu *pmu=
)
>                 cpuhp_state_remove_instance(CPUHP_AP_PERF_RISCV_STARTING,=
 &pmu->node);
>  }
>
> -static void pmu_sbi_event_init(struct perf_event *event)
> +static void rvpmu_event_init(struct perf_event *event)
>  {
>         /*
>          * The permissions are set at event_init so that we do not depend
> @@ -1326,7 +1370,7 @@ static void pmu_sbi_event_init(struct perf_event *e=
vent)
>                 event->hw.flags |=3D PERF_EVENT_FLAG_LEGACY;
>  }
>
> -static void pmu_sbi_event_mapped(struct perf_event *event, struct mm_str=
uct *mm)
> +static void rvpmu_event_mapped(struct perf_event *event, struct mm_struc=
t *mm)
>  {
>         if (event->hw.flags & PERF_EVENT_FLAG_NO_USER_ACCESS)
>                 return;
> @@ -1354,14 +1398,14 @@ static void pmu_sbi_event_mapped(struct perf_even=
t *event, struct mm_struct *mm)
>          * that it is possible to do so to avoid any race.
>          * And we must notify all cpus here because threads that currentl=
y run
>          * on other cpus will try to directly access the counter too with=
out
> -        * calling pmu_sbi_ctr_start.
> +        * calling rvpmu_sbi_ctr_start.
>          */
>         if (event->hw.flags & PERF_EVENT_FLAG_USER_ACCESS)
>                 on_each_cpu_mask(mm_cpumask(mm),
> -                                pmu_sbi_set_scounteren, (void *)event, 1=
);
> +                                rvpmu_set_scounteren, (void *)event, 1);
>  }
>
> -static void pmu_sbi_event_unmapped(struct perf_event *event, struct mm_s=
truct *mm)
> +static void rvpmu_event_unmapped(struct perf_event *event, struct mm_str=
uct *mm)
>  {
>         if (event->hw.flags & PERF_EVENT_FLAG_NO_USER_ACCESS)
>                 return;
> @@ -1383,7 +1427,7 @@ static void pmu_sbi_event_unmapped(struct perf_even=
t *event, struct mm_struct *m
>
>         if (event->hw.flags & PERF_EVENT_FLAG_USER_ACCESS)
>                 on_each_cpu_mask(mm_cpumask(mm),
> -                                pmu_sbi_reset_scounteren, (void *)event,=
 1);
> +                                rvpmu_reset_scounteren, (void *)event, 1=
);
>  }
>
>  static void riscv_pmu_update_counter_access(void *info)
> @@ -1426,7 +1470,7 @@ static const struct ctl_table sbi_pmu_sysctl_table[=
] =3D {
>         },
>  };
>
> -static int pmu_sbi_device_probe(struct platform_device *pdev)
> +static int rvpmu_device_probe(struct platform_device *pdev)
>  {
>         struct riscv_pmu *pmu =3D NULL;
>         int ret =3D -ENODEV;
> @@ -1438,7 +1482,7 @@ static int pmu_sbi_device_probe(struct platform_dev=
ice *pdev)
>         if (!pmu)
>                 return -ENOMEM;
>
> -       num_counters =3D pmu_sbi_find_num_ctrs();
> +       num_counters =3D rvpmu_find_num_ctrs();
>         if (num_counters < 0) {
>                 pr_err("SBI PMU extension doesn't provide any counters\n"=
);
>                 goto out_free;
> @@ -1451,10 +1495,10 @@ static int pmu_sbi_device_probe(struct platform_d=
evice *pdev)
>         }
>
>         /* cache all the information about counters now */
> -       if (pmu_sbi_get_ctrinfo(num_counters, &cmask))
> +       if (rvpmu_get_ctrinfo(num_counters, &cmask))
>                 goto out_free;
>
> -       ret =3D pmu_sbi_setup_irqs(pmu, pdev);
> +       ret =3D rvpmu_setup_irqs(pmu, pdev);
>         if (ret < 0) {
>                 pr_info("Perf sampling/filtering is not supported as ssco=
f extension is not available\n");
>                 pmu->pmu.capabilities |=3D PERF_PMU_CAP_NO_INTERRUPT;
> @@ -1465,17 +1509,17 @@ static int pmu_sbi_device_probe(struct platform_d=
evice *pdev)
>         pmu->pmu.attr_groups =3D riscv_pmu_attr_groups;
>         pmu->pmu.parent =3D &pdev->dev;
>         pmu->cmask =3D cmask;
> -       pmu->ctr_start =3D pmu_sbi_ctr_start;
> -       pmu->ctr_stop =3D pmu_sbi_ctr_stop;
> -       pmu->event_map =3D pmu_sbi_event_map;
> -       pmu->ctr_get_idx =3D pmu_sbi_ctr_get_idx;
> -       pmu->ctr_get_width =3D pmu_sbi_ctr_get_width;
> -       pmu->ctr_clear_idx =3D pmu_sbi_ctr_clear_idx;
> -       pmu->ctr_read =3D pmu_sbi_ctr_read;
> -       pmu->event_init =3D pmu_sbi_event_init;
> -       pmu->event_mapped =3D pmu_sbi_event_mapped;
> -       pmu->event_unmapped =3D pmu_sbi_event_unmapped;
> -       pmu->csr_index =3D pmu_sbi_csr_index;
> +       pmu->ctr_start =3D rvpmu_ctr_start;
> +       pmu->ctr_stop =3D rvpmu_ctr_stop;
> +       pmu->event_map =3D rvpmu_event_map;
> +       pmu->ctr_get_idx =3D rvpmu_ctr_get_idx;
> +       pmu->ctr_get_width =3D rvpmu_ctr_get_width;
> +       pmu->ctr_clear_idx =3D rvpmu_ctr_clear_idx;
> +       pmu->ctr_read =3D rvpmu_ctr_read;
> +       pmu->event_init =3D rvpmu_event_init;
> +       pmu->event_mapped =3D rvpmu_event_mapped;
> +       pmu->event_unmapped =3D rvpmu_event_unmapped;
> +       pmu->csr_index =3D rvpmu_csr_index;
>
>         ret =3D riscv_pm_pmu_register(pmu);
>         if (ret)
> @@ -1542,14 +1586,14 @@ static int pmu_sbi_device_probe(struct platform_d=
evice *pdev)
>         return ret;
>  }
>
> -static struct platform_driver pmu_sbi_driver =3D {
> -       .probe          =3D pmu_sbi_device_probe,
> +static struct platform_driver rvpmu_driver =3D {
> +       .probe          =3D rvpmu_device_probe,
>         .driver         =3D {
>                 .name   =3D RISCV_PMU_SBI_PDEV_NAME,
>         },
>  };
>
> -static int __init pmu_sbi_devinit(void)
> +static int __init rvpmu_devinit(void)
>  {
>         int ret;
>         struct platform_device *pdev;
> @@ -1567,20 +1611,20 @@ static int __init pmu_sbi_devinit(void)
>
>         ret =3D cpuhp_setup_state_multi(CPUHP_AP_PERF_RISCV_STARTING,
>                                       "perf/riscv/pmu:starting",
> -                                     pmu_sbi_starting_cpu, pmu_sbi_dying=
_cpu);
> +                                     rvpmu_starting_cpu, rvpmu_dying_cpu=
);
>         if (ret) {
>                 pr_err("CPU hotplug notifier could not be registered: %d\=
n",
>                        ret);
>                 return ret;
>         }
>
> -       ret =3D platform_driver_register(&pmu_sbi_driver);
> +       ret =3D platform_driver_register(&rvpmu_driver);
>         if (ret)
>                 return ret;
>
>         pdev =3D platform_device_register_simple(RISCV_PMU_SBI_PDEV_NAME,=
 -1, NULL, 0);
>         if (IS_ERR(pdev)) {
> -               platform_driver_unregister(&pmu_sbi_driver);
> +               platform_driver_unregister(&rvpmu_driver);
>                 return PTR_ERR(pdev);
>         }
>
> @@ -1589,4 +1633,4 @@ static int __init pmu_sbi_devinit(void)
>
>         return ret;
>  }
> -device_initcall(pmu_sbi_devinit)
> +device_initcall(rvpmu_devinit)
>
> --
> 2.53.0-Meta
>
