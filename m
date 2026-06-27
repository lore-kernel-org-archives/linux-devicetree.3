Received: from mail-ot1-f52.google.com (mail-ot1-f52.google.com [209.85.210.52])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id DE88D1E32CF
	for <devicetree@vger.kernel.org>; Sat, 27 Jun 2026 09:38:40 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=pass smtp.client-ip=209.85.210.52
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1782553122; cv=pass; b=seELMXOZ2bAKmnaDKJbsya4ev83AGhnGbK43Jy1Y63hSWXIe5kzb8ceixrHYuvg6c+H5Nhp+h1Z7gMzyJ87jVdFESczYnWAQKrukLwvx5lq8s+b19gIw+fWTK2DaAvPhyROGP2QwApPeZRO6sCN0CnAk5fAPIXnPIGLlWAac6ic=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1782553122; c=relaxed/simple;
	bh=mNpdzX0fXmVGddnasfqr8M4cQVizblAPeNv9Q1Q8i7M=;
	h=MIME-Version:References:In-Reply-To:From:Date:Message-ID:Subject:
	 To:Cc:Content-Type; b=kar3WLd0FJRNRdBkf09Xx/aGEGqqbOowLQh2thsTXBUCLXQpoaqXT6MvqNdCDvBaFjZl+rgxonSqLRP4qfjMGdnLd+9T0GIBLehcYFEPUHdtjT0M4N5+oWTcLC2UjFl6iTpaizFjI9bOlS+uxG5TBRXekL/DeffgCwfMSG5CqZ8=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=bytedance.com; spf=pass smtp.mailfrom=bytedance.com; dkim=pass (2048-bit key) header.d=bytedance.com header.i=@bytedance.com header.b=FmBJVGCA; arc=pass smtp.client-ip=209.85.210.52
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=bytedance.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=bytedance.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=bytedance.com header.i=@bytedance.com header.b="FmBJVGCA"
Received: by mail-ot1-f52.google.com with SMTP id 46e09a7af769-7e94d272a86so1286073a34.2
        for <devicetree@vger.kernel.org>; Sat, 27 Jun 2026 02:38:40 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1782553120; cv=none;
        d=google.com; s=arc-20260327;
        b=W8t2Z8+rQLLvkJcevLhPS2N7CPFGaKyJ5YZA+irhEcx8+8H/esSPDkK9PvfWMQ5FZR
         b3fVDS0uVkX04uPF2ymwH011TRlD8ZuKsg5oyXnA4XoO6PtEVz+3oUM/ouqBMoC1R4z1
         qHftcqB6V8kS57vH8n6HCR6zBni5x0rB3ILv5lH1C2dfz9x9g9OOcV7Eem243O5lnSvm
         ZLckFfISCVzs+zfgPLt2DXhSFOYSq2n1+cbzXrh/qIdEj6DNforjomVSKayeZCGUQH+7
         D/NZVTXk+5xtLTHeFlpiZgpcJdGIDRyiy4PnF7KAgFchB+knFENVLegcYP9s9GGaXaSo
         kbqw==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20260327;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:dkim-signature;
        bh=SvcelzH1KVTORxzp7ubHIQHGLkNMGQJGCAmY4qtxwro=;
        fh=5BM9F1FJKqD+wIXPxUYVjByBb7lvGkM5zfsBvt6hLJA=;
        b=fsBxh7Aadie9udqXoIe8OXX3epIqSfPHWg0AyjE9RLVlrNuDHr242SR5+7BNsGFhFo
         xr9x4eu18Evt0nMheTTXw/1v7m649gg6MynXl8gIbZvpx3UBpBs7fTbqbnxv4MFngoAL
         HTw4U0TFuqjRzIupLMXrt2B6IQQ+eJMQBgr4EcUwiQkjccse9K4PsZlds08FjofTxCm3
         A/430NMI/vnunTVnE9FOPvvh2307ecihM4Eyy2vY8I0VlOF+3a+RvpB2flrd2AjoCKdp
         fT9WfKEbiNUzEXtki6TsN50Y+Aw82kjdt1Xhx5BDquW46ZrcyWquJ9Iw1ort/cwI+hW5
         +t8w==;
        darn=vger.kernel.org
ARC-Authentication-Results: i=1; mx.google.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=bytedance.com; s=google; t=1782553120; x=1783157920; darn=vger.kernel.org;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:from:to:cc:subject:date
         :message-id:reply-to;
        bh=SvcelzH1KVTORxzp7ubHIQHGLkNMGQJGCAmY4qtxwro=;
        b=FmBJVGCAyI6dsi6mLEEfuKkvJ2g4P/kT1j0Xwx03m+vw74o00h86NaspiyzTSqmu39
         Zl1yKEil9e7W2nTKkxcXYPy4dF5Z7PniS6M6sGJRYkekmJd+zCiDfONUYgAOKkMWp3oB
         962jB3T9g6rVJMqvX6SGfHkGlqSZbDa29G7oYX3o7oWjNMp45kJ+Wo4cXqrl1NGlWREe
         g9IaiJijH17DyCmwnEfKP5A2gg2aVQoSlDIdlHc9nt7DVrlsVCzes15kmH4pXtN5GHMt
         1T3x2ERDvafa1w/kif6jwleljGjUH5hjnKTiQvsVS7H1ebpSkpuTJHctzPqywzH1F9ts
         u9TA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1782553120; x=1783157920;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to;
        bh=SvcelzH1KVTORxzp7ubHIQHGLkNMGQJGCAmY4qtxwro=;
        b=mbgV+Mw8LNgpBHprNnQo1T9IWSWh60yEEXtoUtMHoLb9pp11IeLDl0/sIogDxr8DSX
         gSmnh04Ra1MDdomHC5MOH3FvHLY4prD8EIO9afQxZ+OFrusm0UwqbjjJCFpb7bF3EGT6
         okKFui42cXWJ8Ld+6Ygn9yrBFMGEiRoxqOdpZ3XzHwsdq6loYuL+mHhMFWONwqer3DCc
         EpRDkvu3OmsYD/OHg6tjnNeX6prL4ii3nI5jFUIkKEeXBjOix+3bgZjFIKKZGD9QL8ln
         39QHQ/5HKrqQ4ryKjwqzemWLyKZyZnuicR1SZuEtvksX2M7F+hAJ4qxTGewJtP+n/sZt
         qdow==
X-Forwarded-Encrypted: i=1; AFNElJ8rPH5ho9q+T2WCvMAIuomhOliPs+DlRfG8cAUkl8ozr6hpSC/cYAmwCHnPkpgP4pwybPe+jJYD1m/F@vger.kernel.org
X-Gm-Message-State: AOJu0YytR9Ye2Aee6MgxS3ibaEAE7mYL/omSkDqYRAMjWKdHEnqWK98+
	KaAsGvqXuX7VqXtkY53BoHpNULE22UOQRO54nu/yCGJJrJsY8J4QFq3R+n3KFDh1PKhOeBMIwPw
	KPE6Y4vUFKPbdjypxzXDDTZ9JfKGJQWa336Fo0jA1OQ==
X-Gm-Gg: AfdE7ckOjsetejvI+huQd9viy8iCxYEXMMKXemLk4rNJZVFIGxjdT9Y2RtpsgR6i7kH
	gyFdrWShGaIkBsDE4Ng1JecFyxm45f2AgPOiYg+hIPYKQLztjOhsYJa/BzSMWFJmoNXWtbsD8ld
	KVhRE1csJUOJUORhWJhf0BVy7SL1p1G5EhHlFEoGuzcSpXyzuyr+sgNisGQMC3DuhP4mjlFG7Ri
	RkD4w5iqB6YGL9a47T7GaYRX9fC62VX6r0jqUaYFICGi13T1p28Amt3FIAEGKQYgTKxGqKeLiI=
X-Received: by 2002:a05:6830:4125:b0:7e9:bf64:b70b with SMTP id
 46e09a7af769-7e9bf64bebemr1247190a34.1.1782553119722; Sat, 27 Jun 2026
 02:38:39 -0700 (PDT)
Precedence: bulk
X-Mailing-List: devicetree@vger.kernel.org
List-Id: <devicetree.vger.kernel.org>
List-Subscribe: <mailto:devicetree+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:devicetree+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
References: <20260624-dfustini-atl-sc-cbqri-dt-v2-0-2f8049fd902b@kernel.org> <20260624-dfustini-atl-sc-cbqri-dt-v2-3-2f8049fd902b@kernel.org>
In-Reply-To: <20260624-dfustini-atl-sc-cbqri-dt-v2-3-2f8049fd902b@kernel.org>
From: yunhui cui <cuiyunhui@bytedance.com>
Date: Sat, 27 Jun 2026 17:38:28 +0800
X-Gm-Features: AVVi8Ce-La-VrEpXdV-lbpn614DD5E90iVNbxh-JJDrD0KbknuHCDv3JXedCaeA
Message-ID: <CAEEQ3wkhiE=TdFTzEn39GVWSgGnaN0raBpmd=6sYaoh304LNBg@mail.gmail.com>
Subject: Re: [External] [PATCH v2 3/8] riscv: Add support for srmcfg CSR from
 Ssqosid extension
To: Drew Fustini <fustini@kernel.org>
Cc: Adrien Ricciardi <aricciardi@baylibre.com>, Alexandre Ghiti <alex@ghiti.fr>, 
	Atish Kumar Patra <atishp@rivosinc.com>, Atish Patra <atish.patra@linux.dev>, 
	Babu Moger <babu.moger@amd.com>, Ben Horgan <ben.horgan@arm.com>, Borislav Petkov <bp@alien8.de>, 
	Chen Pei <cp0613@linux.alibaba.com>, Conor Dooley <conor.dooley@microchip.com>, 
	Conor Dooley <conor+dt@kernel.org>, Dave Hansen <dave.hansen@linux.intel.com>, 
	Dave Martin <Dave.Martin@arm.com>, Fenghua Yu <fenghua.yu@intel.com>, 
	Gong Shuai <gong.shuai@sanechips.com.cn>, Gong Shuai <gsh517@gmail.com>, guo.wenjia23@zte.com.cn, 
	James Morse <james.morse@arm.com>, =?UTF-8?Q?Kornel_Dul=C4=99ba?= <mindal@semihalf.com>, 
	Krzysztof Kozlowski <krzk+dt@kernel.org>, liu.qingtao2@zte.com.cn, 
	Liu Zhiwei <zhiwei_liu@linux.alibaba.com>, Palmer Dabbelt <palmer@dabbelt.com>, 
	Paul Walmsley <pjw@kernel.org>, Peter Newman <peternewman@google.com>, 
	=?UTF-8?B?UmFkaW0gS3LEjW3DocWZ?= <rkrcmar@ventanamicro.com>, 
	Reinette Chatre <reinette.chatre@intel.com>, Rob Herring <robh@kernel.org>, 
	Samuel Holland <samuel.holland@sifive.com>, 
	Sebastian Andrzej Siewior <bigeasy@linutronix.de>, Tony Luck <tony.luck@intel.com>, 
	Vasudevan Srinivasan <vasu@rivosinc.com>, Ved Shanbhogue <ved@rivosinc.com>, Weiwei Li <liwei1518@gmail.com>, 
	linux-kernel@vger.kernel.org, linux-riscv@lists.infradead.org, x86@kernel.org, 
	devicetree@vger.kernel.org, linux-rt-devel@lists.linux.dev, 
	linux-doc@vger.kernel.org
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

Hi Drew,

On Thu, Jun 25, 2026 at 9:40=E2=80=AFAM Drew Fustini <fustini@kernel.org> w=
rote:
>
> Add support for the srmcfg CSR defined in the Ssqosid ISA extension.
> The CSR contains two fields:
>
>   - Resource Control ID (RCID) for resource allocation
>   - Monitoring Counter ID (MCID) for tracking resource usage
>
> Requests from a hart to shared resources are tagged with these IDs,
> allowing resource usage to be associated with the running task.
>
> Add a srmcfg field to thread_struct with the same format as the CSR so
> the scheduler can set the RCID and MCID for each task on context
> switch. A per-cpu cpu_srmcfg variable mirrors the CSR state to avoid
> redundant writes. L1D-hot memory access is faster than a CSR read and
> avoids traps under virtualization.
>
> A per-cpu cpu_srmcfg_default holds the default srmcfg for each CPU as
> set by resctrl CPU group assignment. On context switch, RCID and MCID
> inherit from the CPU default independently: a task whose thread RCID
> field is zero takes the CPU default's RCID, and likewise for MCID.
>
> Link: https://github.com/riscv/riscv-ssqosid/releases/tag/v1.0
> Assisted-by: Claude:claude-opus-4-7
> Co-developed-by: Kornel Dul=C4=99ba <mindal@semihalf.com>
> Signed-off-by: Kornel Dul=C4=99ba <mindal@semihalf.com>
> Signed-off-by: Drew Fustini <fustini@kernel.org>
> ---
>  MAINTAINERS                        |  8 ++++
>  arch/riscv/Kconfig                 | 18 +++++++
>  arch/riscv/include/asm/csr.h       |  5 ++
>  arch/riscv/include/asm/processor.h |  3 ++
>  arch/riscv/include/asm/qos.h       | 83 ++++++++++++++++++++++++++++++++
>  arch/riscv/include/asm/switch_to.h |  3 ++
>  arch/riscv/kernel/Makefile         |  2 +
>  arch/riscv/kernel/qos.c            | 98 ++++++++++++++++++++++++++++++++=
++++++
>  8 files changed, 220 insertions(+)
>
> diff --git a/MAINTAINERS b/MAINTAINERS
> index 0b9d7c8276acbafdb28a0ea5e81aa853ebee50b9..07109e1a8f8470377916c9807=
4ab68fec51dfdc6 100644
> --- a/MAINTAINERS
> +++ b/MAINTAINERS
> @@ -23293,6 +23293,14 @@ F:     drivers/perf/riscv_pmu.c
>  F:     drivers/perf/riscv_pmu_legacy.c
>  F:     drivers/perf/riscv_pmu_sbi.c
>
> +RISC-V QOS RESCTRL SUPPORT
> +M:     Drew Fustini <fustini@kernel.org>
> +R:     yunhui cui <cuiyunhui@bytedance.com>
> +L:     linux-riscv@lists.infradead.org
> +S:     Supported
> +F:     arch/riscv/include/asm/qos.h
> +F:     arch/riscv/kernel/qos.c
> +
>  RISC-V RPMI AND MPXY DRIVERS
>  M:     Rahul Pathak <rahul@summations.net>
>  M:     Anup Patel <anup@brainfault.org>
> diff --git a/arch/riscv/Kconfig b/arch/riscv/Kconfig
> index 3f0a647218e407f72890e83722ba8472858c1a59..ee586925f97227668c228b548=
1c05a2f914d928c 100644
> --- a/arch/riscv/Kconfig
> +++ b/arch/riscv/Kconfig
> @@ -590,6 +590,24 @@ config RISCV_ISA_SVNAPOT
>
>           If you don't know what to do here, say Y.
>
> +config RISCV_ISA_SSQOSID
> +       bool "Ssqosid extension support for supervisor mode Quality of Se=
rvice ID"
> +       depends on 64BIT

Why is 64BIT required here?

> +       default n
> +       help
> +         Adds support for the Ssqosid ISA extension (Supervisor-mode
> +         Quality of Service ID).
> +
> +         Ssqosid defines the srmcfg CSR which allows the system to tag t=
he
> +         running process with an RCID (Resource Control ID) and MCID
> +         (Monitoring Counter ID). The RCID is used to determine resource
> +         allocation. The MCID is used to track resource usage in event
> +         counters.
> +
> +         For example, a cache controller may use the RCID to apply a
> +         cache partitioning scheme and use the MCID to track how much
> +         cache a process, or a group of processes, is using.
> +
>  config RISCV_ISA_SVPBMT
>         bool "Svpbmt extension support for supervisor mode page-based mem=
ory types"
>         depends on 64BIT && MMU
> diff --git a/arch/riscv/include/asm/csr.h b/arch/riscv/include/asm/csr.h
> index 31b8988f4488daa89b854ccc97c4efe1c82bcc3e..7bce928e5daa09bd62f091727=
9b04cfad30f46f5 100644
> --- a/arch/riscv/include/asm/csr.h
> +++ b/arch/riscv/include/asm/csr.h
> @@ -84,6 +84,10 @@
>  #define SATP_ASID_MASK _AC(0xFFFF, UL)
>  #endif
>
> +/* SRMCFG fields */
> +#define SRMCFG_RCID_MASK       GENMASK(11, 0)
> +#define SRMCFG_MCID_MASK       GENMASK(27, 16)
> +
>  /* Exception cause high bit - is an interrupt if set */
>  #define CAUSE_IRQ_FLAG         (_AC(1, UL) << (__riscv_xlen - 1))
>
> @@ -328,6 +332,7 @@
>  #define CSR_STVAL              0x143
>  #define CSR_SIP                        0x144
>  #define CSR_SATP               0x180
> +#define CSR_SRMCFG             0x181
>
>  #define CSR_STIMECMP           0x14D
>  #define CSR_STIMECMPH          0x15D
> diff --git a/arch/riscv/include/asm/processor.h b/arch/riscv/include/asm/=
processor.h
> index 812517b2cec1350f741849c1c56a35027321ef50..49a386d74cd3f0603a3ff9190=
59d077a7e4d513c 100644
> --- a/arch/riscv/include/asm/processor.h
> +++ b/arch/riscv/include/asm/processor.h
> @@ -123,6 +123,9 @@ struct thread_struct {
>         /* A forced icache flush is not needed if migrating to the previo=
us cpu. */
>         unsigned int prev_cpu;
>  #endif
> +#ifdef CONFIG_RISCV_ISA_SSQOSID
> +       u32 srmcfg;
> +#endif
>  };
>
>  /* Whitelist the fstate from the task_struct for hardened usercopy */
> diff --git a/arch/riscv/include/asm/qos.h b/arch/riscv/include/asm/qos.h
> new file mode 100644
> index 0000000000000000000000000000000000000000..e9e1d69f3797be5f89785a9b3=
aa7d9d51c476a8a
> --- /dev/null
> +++ b/arch/riscv/include/asm/qos.h
> @@ -0,0 +1,83 @@
> +/* SPDX-License-Identifier: GPL-2.0 */
> +#ifndef _ASM_RISCV_QOS_H
> +#define _ASM_RISCV_QOS_H
> +
> +#include <linux/percpu-defs.h>
> +
> +#ifdef CONFIG_RISCV_ISA_SSQOSID
> +
> +#include <linux/bitfield.h>
> +#include <linux/cpufeature.h>
> +#include <linux/sched.h>
> +
> +#include <asm/csr.h>
> +#include <asm/fence.h>
> +#include <asm/hwcap.h>
> +
> +/* cached value of srmcfg csr for each cpu */
> +DECLARE_PER_CPU(u32, cpu_srmcfg);
> +
> +/* default srmcfg value for each cpu, set via resctrl cpu assignment */
> +DECLARE_PER_CPU(u32, cpu_srmcfg_default);
> +
> +static inline void __switch_to_srmcfg(struct task_struct *next)
> +{
> +       u32 thread_srmcfg, default_srmcfg;
> +
> +       thread_srmcfg =3D READ_ONCE(next->thread.srmcfg);
> +       default_srmcfg =3D __this_cpu_read(cpu_srmcfg_default);
> +
> +       /*
> +        * RCID and MCID inherit from cpu_srmcfg_default independently.
> +        * RESCTRL_RESERVED_CLOSID and RESCTRL_RESERVED_RMID are both 0, =
so a
> +        * zero field means "unassigned" and takes the CPU default.
> +        */
> +       if (thread_srmcfg =3D=3D 0) {
> +               thread_srmcfg =3D default_srmcfg;
> +       } else {
> +               u32 rcid =3D FIELD_GET(SRMCFG_RCID_MASK, thread_srmcfg);
> +               u32 mcid =3D FIELD_GET(SRMCFG_MCID_MASK, thread_srmcfg);
> +
> +               if (rcid =3D=3D 0 || mcid =3D=3D 0) {
> +                       if (rcid =3D=3D 0)
> +                               rcid =3D FIELD_GET(SRMCFG_RCID_MASK, defa=
ult_srmcfg);
> +                       if (mcid =3D=3D 0)
> +                               mcid =3D FIELD_GET(SRMCFG_MCID_MASK, defa=
ult_srmcfg);
> +                       thread_srmcfg =3D FIELD_PREP(SRMCFG_RCID_MASK, rc=
id) |
> +                                       FIELD_PREP(SRMCFG_MCID_MASK, mcid=
);
> +               }
> +       }
> +
> +       if (thread_srmcfg !=3D __this_cpu_read(cpu_srmcfg)) {
> +               /*
> +                * Drain stores from the outgoing task before the CSR wri=
te
> +                * so they retain the previous RCID/MCID tag at the cache
> +                * interconnect.
> +                */
> +               RISCV_FENCE(rw, o);
> +
> +               __this_cpu_write(cpu_srmcfg, thread_srmcfg);
> +               csr_write(CSR_SRMCFG, thread_srmcfg);
> +               /*
> +                * Order the csrw before the new task's loads/stores so t=
hey
> +                * pick up the new tag. Zicsr 6.1.1 makes CSR writes weak=
ly
> +                * ordered (device-output) vs memory ops. Ssqosid v1.0 is
> +                * silent so honor the general CSR rule.
> +                */
> +               RISCV_FENCE(o, rw);
> +       }
> +}
> +
> +static __always_inline bool has_srmcfg(void)
> +{
> +       return riscv_has_extension_unlikely(RISCV_ISA_EXT_SSQOSID);
> +}
> +
> +#else /* ! CONFIG_RISCV_ISA_SSQOSID  */
> +
> +struct task_struct;
> +static __always_inline bool has_srmcfg(void) { return false; }
> +static inline void __switch_to_srmcfg(struct task_struct *next) { }
> +
> +#endif /* CONFIG_RISCV_ISA_SSQOSID */
> +#endif /* _ASM_RISCV_QOS_H */
> diff --git a/arch/riscv/include/asm/switch_to.h b/arch/riscv/include/asm/=
switch_to.h
> index 0e71eb82f920cac2f14bb626879bb219a2f247cc..1c7ea53ec012adeaf03bf7c5d=
549ab21849768b5 100644
> --- a/arch/riscv/include/asm/switch_to.h
> +++ b/arch/riscv/include/asm/switch_to.h
> @@ -14,6 +14,7 @@
>  #include <asm/processor.h>
>  #include <asm/ptrace.h>
>  #include <asm/csr.h>
> +#include <asm/qos.h>
>
>  #ifdef CONFIG_FPU
>  extern void __fstate_save(struct task_struct *save_to);
> @@ -119,6 +120,8 @@ do {                                                 =
       \
>                 __switch_to_fpu(__prev, __next);        \
>         if (has_vector() || has_xtheadvector())         \
>                 __switch_to_vector(__prev, __next);     \
> +       if (has_srmcfg())                               \
> +               __switch_to_srmcfg(__next);             \
>         if (switch_to_should_flush_icache(__next))      \
>                 local_flush_icache_all();               \
>         __switch_to_envcfg(__next);                     \
> diff --git a/arch/riscv/kernel/Makefile b/arch/riscv/kernel/Makefile
> index cabb99cadfb6d1e1284d6b4e9ae76044d36949f5..ebe1c3588177b4b825a52af9c=
a17e17b5561427c 100644
> --- a/arch/riscv/kernel/Makefile
> +++ b/arch/riscv/kernel/Makefile
> @@ -128,3 +128,5 @@ obj-$(CONFIG_ACPI_NUMA)     +=3D acpi_numa.o
>
>  obj-$(CONFIG_GENERIC_CPU_VULNERABILITIES) +=3D bugs.o
>  obj-$(CONFIG_RISCV_USER_CFI) +=3D usercfi.o
> +
> +obj-$(CONFIG_RISCV_ISA_SSQOSID) +=3D qos.o
> diff --git a/arch/riscv/kernel/qos.c b/arch/riscv/kernel/qos.c
> new file mode 100644
> index 0000000000000000000000000000000000000000..ea33201a43f61534bf28b9c02=
b62801f30f62154
> --- /dev/null
> +++ b/arch/riscv/kernel/qos.c
> @@ -0,0 +1,98 @@
> +// SPDX-License-Identifier: GPL-2.0-only
> +#include <linux/cpu.h>
> +#include <linux/cpu_pm.h>
> +#include <linux/cpuhotplug.h>
> +#include <linux/notifier.h>
> +#include <linux/percpu-defs.h>
> +#include <linux/types.h>
> +
> +#include <asm/cpufeature-macros.h>
> +#include <asm/hwcap.h>
> +#include <asm/qos.h>
> +
> +/*
> + * Cached value of srmcfg csr for each cpu. Seeded to U32_MAX so the nex=
t
> + * __switch_to_srmcfg() unconditionally writes the CSR. The encoding
> + * MCID << 16 | RCID with both fields well under 16 bits can never
> + * produce this sentinel. This covers early-boot context switches that
> + * happen before riscv_srmcfg_init() runs as an arch_initcall.
> + */
> +DEFINE_PER_CPU(u32, cpu_srmcfg) =3D U32_MAX;
> +
> +/* default srmcfg value for each cpu, set via resctrl cpu assignment */
> +DEFINE_PER_CPU(u32, cpu_srmcfg_default);
> +
> +/*
> + * Invalidate the per-CPU srmcfg cache, used as both the cpuhp startup a=
nd
> + * teardown callback. The sentinel is a value no real srmcfg encoding ca=
n
> + * produce (MCID << 16 | RCID, both fields well under 16 bits) so the ne=
xt
> + * __switch_to_srmcfg() unconditionally writes the CSR.
> + *
> + * Ssqosid v1.0 leaves CSR state across hart stop/start implementation-
> + * defined, so the cached value cannot be trusted after online. Invalida=
ting
> + * on offline as well means the sentinel persists across the offline per=
iod:
> + * a CPU brought back online finds the cache already invalidated before =
it is
> + * schedulable, closing the window where a task scheduled before the sta=
rtup
> + * callback runs could match a stale cache and skip the CSR write while =
the
> + * hardware CSR was reset across hart stop/start.
> + */
> +static int riscv_srmcfg_reset_cache(unsigned int cpu)
> +{
> +       per_cpu(cpu_srmcfg, cpu) =3D U32_MAX;
> +       return 0;
> +}
> +
> +/*
> + * CPU PM notifier: invalidate the cached srmcfg on resume from a deep
> + * idle / suspend. Ssqosid v1.0 leaves CSR_SRMCFG state across low-power
> + * transitions implementation-defined, and the boot CPU never goes
> + * through the cpuhp online callback during system suspend, so without
> + * this hook __switch_to_srmcfg() would skip the CSR write when the
> + * outgoing task happens to share its srmcfg with the pre-suspend cache.
> + */
> +static int riscv_srmcfg_pm_notify(struct notifier_block *nb,
> +                                 unsigned long action, void *unused)
> +{
> +       switch (action) {
> +       case CPU_PM_EXIT:
> +       case CPU_PM_ENTER_FAILED:
> +               /*
> +                * The CSR is implementation-defined across the low-power
> +                * transition. Invalidate the cache and eagerly rewrite t=
he
> +                * CSR for the current task so it does not run mis-tagged
> +                * until the next context switch.
> +                */
> +               __this_cpu_write(cpu_srmcfg, U32_MAX);
> +               __switch_to_srmcfg(current);
> +               break;
> +       }
> +       return NOTIFY_OK;
> +}
> +
> +static struct notifier_block riscv_srmcfg_pm_nb =3D {
> +       .notifier_call =3D riscv_srmcfg_pm_notify,
> +};
> +
> +static int __init riscv_srmcfg_init(void)
> +{
> +       int err;
> +
> +       if (!riscv_has_extension_unlikely(RISCV_ISA_EXT_SSQOSID))
> +               return 0;
> +
> +       /*
> +        * cpuhp_setup_state() invokes the startup callback locally on ev=
ery
> +        * already-online CPU, so no separate seed loop is needed here.
> +        */
> +       err =3D cpuhp_setup_state(CPUHP_AP_ONLINE_DYN, "riscv/srmcfg:onli=
ne",
> +                               riscv_srmcfg_reset_cache, riscv_srmcfg_re=
set_cache);
> +       if (err < 0) {
> +               pr_warn("srmcfg cpuhp registration failed (%d), cpus brou=
ght online after boot will not invalidate the CSR_SRMCFG cache\n",
> +                       err);
> +               return err;
> +       }
> +
> +       cpu_pm_register_notifier(&riscv_srmcfg_pm_nb);
> +       return 0;
> +}
> +arch_initcall(riscv_srmcfg_init);
>
> --
> 2.34.1
>

Thanks,
Yunhui
