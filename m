Received: from smtpbgsg2.qq.com (smtpbgsg2.qq.com [54.254.200.128])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 4F6123859C7
	for <devicetree@vger.kernel.org>; Wed, 15 Apr 2026 07:06:05 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=54.254.200.128
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1776236771; cv=none; b=SmGIX5YiioYrd31HAvIjNCtFcppB//7uga4jNQvY41totnewNJPnWClM2ZxFzWSAQjyW1DGdkf0jJtLCt6+90lTP+Hrfr7ZDXS+JCqJ2CRFxSs2XCiu/h7LNQf9czLGy/PVUITuO6P8StvL7PxRpWyfGdgPkXCw/K3fP83SEXVc=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1776236771; c=relaxed/simple;
	bh=JK2E4kgMHrhq2uA3ajZeV2r/+wkis57ZcnBayorVtIs=;
	h=Message-ID:Date:MIME-Version:Subject:To:Cc:References:From:
	 In-Reply-To:Content-Type; b=pB/dZk0ofl26SZnOLvFEUZJhXYml5gG3dZgyyPSEkaRx3cpddfK9mTmcklOVb2h/yLG1y3nzlepfNuPldZIorPswpUYrslU3jVo9iNDcwXmxFMKwSIlTAHOswfFTvRxHZOxGyzS8SJ+4JK0CsRMKpyxE3PSsjIL3s/PIaUxpbHw=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=linux.spacemit.com; spf=none smtp.mailfrom=linux.spacemit.com; dkim=pass (1024-bit key) header.d=linux.spacemit.com header.i=@linux.spacemit.com header.b=Piu/S8D4; arc=none smtp.client-ip=54.254.200.128
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=linux.spacemit.com
Authentication-Results: smtp.subspace.kernel.org; spf=none smtp.mailfrom=linux.spacemit.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=linux.spacemit.com header.i=@linux.spacemit.com header.b="Piu/S8D4"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linux.spacemit.com;
	s=mxsw2412; t=1776236758;
	bh=6I3bBZmLh72H2avsIFwM++E65eh7BrZ80xu8h1RyaDQ=;
	h=Message-ID:Date:MIME-Version:Subject:To:From;
	b=Piu/S8D4sZkK6hfaniAuJuhRpc7VOJ3jYg1N87I1mO+u+z3swAkZ3oOna4JAO1aWn
	 pn90hKxF0l8b5IYWlDvN5/vbUo5rb+vgKZHEeTzQJVcOG3aXv5WfN842dPqTQ5DBJs
	 GzF8QKXh1QLOgKtXgePiB9A0/KSBvY5VTXF3jttg=
X-QQ-mid: esmtpgz12t1776236755t9a02ae7c
X-QQ-Originating-IP: 48JPQq2xqbbxOrNHcGYJAji1baJVzYwWPu0JffE55WE=
Received: from [127.0.0.1] ( [120.237.158.181])
	by bizesmtp.qq.com (ESMTP) with 
	id ; Wed, 15 Apr 2026 15:05:53 +0800 (CST)
X-QQ-SSF: 0000000000000000000000000000000
X-QQ-GoodBg: 0
X-BIZMAIL-ID: 14424645630730695149
Message-ID: <96AFE36BFF9E072C+72a6bd92-35de-48ee-bf52-c0ae86cbe846@linux.spacemit.com>
Date: Wed, 15 Apr 2026 15:05:53 +0800
Precedence: bulk
X-Mailing-List: devicetree@vger.kernel.org
List-Id: <devicetree.vger.kernel.org>
List-Subscribe: <mailto:devicetree+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:devicetree+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH RFC 05/11] riscv: cpufeature: Add Sdtrig optional CSRs
 checks
To: Max Hsu <max.hsu@sifive.com>, Conor Dooley <conor@kernel.org>,
 Rob Herring <robh@kernel.org>,
 Krzysztof Kozlowski <krzysztof.kozlowski+dt@linaro.org>,
 Paul Walmsley <paul.walmsley@sifive.com>, Palmer Dabbelt
 <palmer@dabbelt.com>, Albert Ou <aou@eecs.berkeley.edu>,
 "Rafael J. Wysocki" <rafael@kernel.org>, Pavel Machek <pavel@ucw.cz>,
 Anup Patel <anup@brainfault.org>, Atish Patra <atishp@atishpatra.org>,
 Paolo Bonzini <pbonzini@redhat.com>, Shuah Khan <shuah@kernel.org>
Cc: Palmer Dabbelt <palmer@sifive.com>, linux-riscv@lists.infradead.org,
 devicetree@vger.kernel.org, linux-kernel@vger.kernel.org,
 linux-pm@vger.kernel.org, kvm@vger.kernel.org,
 kvm-riscv@lists.infradead.org, linux-kselftest@vger.kernel.org
References: <20240329-dev-maxh-lin-452-6-9-v1-0-1534f93b94a7@sifive.com>
 <20240329-dev-maxh-lin-452-6-9-v1-5-1534f93b94a7@sifive.com>
From: Zane Leung <liangzhen@linux.spacemit.com>
In-Reply-To: <20240329-dev-maxh-lin-452-6-9-v1-5-1534f93b94a7@sifive.com>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit
X-QQ-SENDSIZE: 520
Feedback-ID: esmtpgz:linux.spacemit.com:qybglogicsvrgz:qybglogicsvrgz6b-0
X-QQ-XMAILINFO: N8xPzCFmlMi7e53HLgrPbboYKillB8gEhA3pvMGFfnHHEPWm/Ov6kIC6
	0jKqRpd3/v3W2ANN5w6GSFqVxBo13AKwD6aGPu3XXvUqYfvUCakA4T0aou991UmavGjxeK6
	+CR8xe8qazgzjQydT4KbjDxGT8xdaTXwOhTMwlSMSmYNxt2jW3sT3gBmuWvhz82Uo0CVfSC
	2STDmHm6+Igf6TXpWR2OyvXQg53TDK4sgRM/QUGHdtiut6o779F4KQamnQDTTfoSSfFjxFi
	zuWX2PXyAeu9m6uQER/XRvBICDScW4P/07T6KSpqqHu0OGV8YGnBV3ZNRWxRfPQLeORqaj3
	hcvDFn56IIC9NFNOfPm4AYY6oyOXiMmMFfoRadYQYFkW4GhN1MWRdIaWiv3J7YiFf1zQvoM
	02fF0/DiE3hp0M5GUUqtnkNDEqZpgpH2H286x/o1DpcWQ9E0JqzzGxgqDHIF5Zk/3FCDByY
	zA70ojjVqfZpK8vjOEtk80xo0+palIF/NGXssgvo7ao5YSJo2uzfjWa1kQ6Bd5/Lmq3bnk4
	Ly57mX+3ldhE4t+9yDoHiQbF25dXM8LseYdP2DvJ09T+0yIO2sHFB3xSqwJqK7Djp2E2egA
	9rbQyh15dzldvCqItDAqRFoukt4I8YhaUv6V0d71iQ48ZkDvAcYidw8zMYWBoj2bVDhcewj
	BNoP6iQU8VlP3KUK1yyBpKk+kHJFTMD4qART9Ns0sgKEO2vL9mifo0lgkX9HibFlG7R46Wk
	Vi6ftTGU5vQLs5A2D0Meo1zpMPWFSH4ebDVTCKxW1bJ1EDpsDAuvWYPv1dmXnPLVILSOsSz
	KPjj6iNxkhttHUW7W+Em2dwl8BRAYIoQc9orHT2ixX0iwVzzOMMjvjSKL7EMVAnR2qu9av4
	gG/EwXmOAbXnJDmO2xTvKFXEu7wpYIJ0XwsnxrdLsEMPVDfgCYEPGA2L9Llje1SSJJQxM7Z
	S8YzS/K/UCT04BsUfawzBLi9JPpO5EeM9yVpXfplIid0bZUQTjted/RUqrWO6cx3NO87CqX
	LZUbc9oPOgt3sPPn7QNhUcCekUtcVcrY8WaX5Zw/AMsx6kyZjxcJhebSOy4LZN8I/UALQQ4
	g==
X-QQ-XMRINFO: MSVp+SPm3vtSI1QTLgDHQqIV1w2oNKDqfg==
X-QQ-RECHKSPAM: 0


On 3/29/2024 5:26 PM, Max Hsu wrote:
> Sdtrig extension introduce two optional CSRs [hcontext/scontext],
> that will be storing PID/Guest OS ID for the debug feature.
>
> The availability of these two CSRs will be determined by
> DTS and Smstateen extension [h/s]stateen0 CSR bit 57.
>
> If all CPUs hcontext/scontext checks are satisfied, it will enable the
> use_hcontext/use_scontext static branch.
>
> Signed-off-by: Max Hsu <max.hsu@sifive.com>
> ---
>  arch/riscv/include/asm/switch_to.h |   6 ++
>  arch/riscv/kernel/cpufeature.c     | 161 +++++++++++++++++++++++++++++++++++++
>  2 files changed, 167 insertions(+)
>
> diff --git a/arch/riscv/include/asm/switch_to.h b/arch/riscv/include/asm/switch_to.h
> index 7efdb0584d47..07432550ed54 100644
> --- a/arch/riscv/include/asm/switch_to.h
> +++ b/arch/riscv/include/asm/switch_to.h
> @@ -69,6 +69,12 @@ static __always_inline bool has_fpu(void) { return false; }
>  #define __switch_to_fpu(__prev, __next) do { } while (0)
>  #endif
>  
> +DECLARE_STATIC_KEY_FALSE(use_scontext);
> +static __always_inline bool has_scontext(void)
> +{
> +	return static_branch_likely(&use_scontext);
> +}
> +
>  extern struct task_struct *__switch_to(struct task_struct *,
>  				       struct task_struct *);
>  
> diff --git a/arch/riscv/kernel/cpufeature.c b/arch/riscv/kernel/cpufeature.c
> index 080c06b76f53..44ff84b920af 100644
> --- a/arch/riscv/kernel/cpufeature.c
> +++ b/arch/riscv/kernel/cpufeature.c
> @@ -35,6 +35,19 @@ static DECLARE_BITMAP(riscv_isa, RISCV_ISA_EXT_MAX) __read_mostly;
>  /* Per-cpu ISA extensions. */
>  struct riscv_isainfo hart_isa[NR_CPUS];
>  
> +atomic_t hcontext_disable;
> +atomic_t scontext_disable;
> +
> +DEFINE_STATIC_KEY_FALSE_RO(use_hcontext);
> +EXPORT_SYMBOL(use_hcontext);
> +
> +DEFINE_STATIC_KEY_FALSE_RO(use_scontext);
> +EXPORT_SYMBOL(use_scontext);
> +
> +/* Record the maximum number that the hcontext CSR allowed to hold */
> +atomic_long_t hcontext_id_share;
> +EXPORT_SYMBOL(hcontext_id_share);
> +
>  /**
>   * riscv_isa_extension_base() - Get base extension word
>   *
> @@ -719,6 +732,154 @@ unsigned long riscv_get_elf_hwcap(void)
>  	return hwcap;
>  }
>  
> +static void __init sdtrig_percpu_csrs_check(void *data)
> +{
> +	struct device_node *node;
> +	struct device_node *debug_node;
> +	struct device_node *trigger_module;
> +
> +	unsigned int cpu = smp_processor_id();
> +
> +	/*
> +	 * Expect every cpu node has the [h/s]context-present property
> +	 * otherwise, jump to sdtrig_csrs_disable_all to disable all access to
> +	 * [h/s]context CSRs
> +	 */
> +	node = of_cpu_device_node_get(cpu);
> +	if (!node)
> +		goto sdtrig_csrs_disable_all;
> +
> +	debug_node = of_get_compatible_child(node, "riscv,debug-v1.0.0");
> +	of_node_put(node);
> +
> +	if (!debug_node)
> +		goto sdtrig_csrs_disable_all;
> +
> +	trigger_module = of_get_child_by_name(debug_node, "trigger-module");
> +	of_node_put(debug_node);
> +
> +	if (!trigger_module)
> +		goto sdtrig_csrs_disable_all;
> +
> +	if (!(IS_ENABLED(CONFIG_KVM) &&
> +	      of_property_read_bool(trigger_module, "hcontext-present")))
> +		atomic_inc(&hcontext_disable);
> +
> +	if (!of_property_read_bool(trigger_module, "scontext-present"))
> +		atomic_inc(&scontext_disable);
> +
> +	of_node_put(trigger_module);
> +
> +	/*
> +	 * Before access to hcontext/scontext CSRs, if the smstateen
> +	 * extension is present, the accessibility will be controlled
> +	 * by the hstateen0[H]/sstateen0 CSRs.
> +	 */
> +	if (__riscv_isa_extension_available(NULL, RISCV_ISA_EXT_SMSTATEEN)) {
> +		u64 hstateen_bit, sstateen_bit;
> +
> +		if (__riscv_isa_extension_available(NULL, RISCV_ISA_EXT_h)) {
> +#if __riscv_xlen > 32
> +			csr_set(CSR_HSTATEEN0, SMSTATEEN0_HSCONTEXT);
> +			hstateen_bit = csr_read(CSR_HSTATEEN0);
> +#else
> +			csr_set(CSR_HSTATEEN0H, SMSTATEEN0_HSCONTEXT >> 32);
> +			hstateen_bit = csr_read(CSR_HSTATEEN0H) << 32;
> +#endif
> +			if (!(hstateen_bit & SMSTATEEN0_HSCONTEXT))
> +				goto sdtrig_csrs_disable_all;
> +
> +		} else {
> +			if (IS_ENABLED(CONFIG_KVM))
> +				atomic_inc(&hcontext_disable);
> +
> +			/*
> +			 * In RV32, the smstateen extension doesn't provide
> +			 * high 32 bits of sstateen0 CSR which represent
> +			 * accessibility for scontext CSR;
> +			 * The decision is left on whether the dts has the
> +			 * property to access the scontext CSR.
> +			 */
> +#if __riscv_xlen > 32
> +			csr_set(CSR_SSTATEEN0, SMSTATEEN0_HSCONTEXT);
> +			sstateen_bit = csr_read(CSR_SSTATEEN0);
> +
> +			if (!(sstateen_bit & SMSTATEEN0_HSCONTEXT))
> +				atomic_inc(&scontext_disable);
> +#endif
For the supervisor-level sstateen registers, high-half CSRs are not added at this time because
it is expected the upper 32 bits of these registers will always be zeros. see:
https://github.com/riscv/riscv-isa-manual/blob/dca12d638b140d86441ad0b067997c70d2017017/src/priv/smstateen.adoc#L71-L7


> +		}
> +	}
> +
> +	/*
> +	 * The code can only access hcontext/scontext CSRs if:
> +	 * The cpu dts node have [h/s]context-present;
> +	 * If Smstateen extension is presented, then the accessibility bit
> +	 * toward hcontext/scontext CSRs is enabled; Or the Smstateen extension
> +	 * isn't available, thus the access won't be blocked by it.
> +	 *
> +	 * With writing 1 to the every bit of these CSRs, we retrieve the
> +	 * maximum bits that is available on the CSRs. and decide
> +	 * whether it's suit for its context recording operation.
> +	 */
> +	if (IS_ENABLED(CONFIG_KVM) &&
> +	    !atomic_read(&hcontext_disable)) {
> +		unsigned long hcontext_available_bits = 0;
> +
> +		csr_write(CSR_HCONTEXT, -1UL);
> +		hcontext_available_bits = csr_swap(CSR_HCONTEXT, hcontext_available_bits);
> +
> +		/* hcontext CSR is required by at least 1 bit */
> +		if (hcontext_available_bits)
> +			atomic_long_and(hcontext_available_bits, &hcontext_id_share);
> +		else
> +			atomic_inc(&hcontext_disable);
> +	}
> +
> +	if (!atomic_read(&scontext_disable)) {
> +		unsigned long scontext_available_bits = 0;
> +
> +		csr_write(CSR_SCONTEXT, -1UL);
> +		scontext_available_bits = csr_swap(CSR_SCONTEXT, scontext_available_bits);
> +
> +		/* scontext CSR is required by at least the sizeof pid_t */
> +		if (scontext_available_bits < ((1UL << (sizeof(pid_t) << 3)) - 1))
> +			atomic_inc(&scontext_disable);
> +	}
> +
> +	return;
> +
> +sdtrig_csrs_disable_all:
> +	if (IS_ENABLED(CONFIG_KVM))
> +		atomic_inc(&hcontext_disable);
> +
> +	atomic_inc(&scontext_disable);
> +}
> +
> +static int __init sdtrig_enable_csrs_fill(void)
> +{
> +	if (__riscv_isa_extension_available(NULL, RISCV_ISA_EXT_SDTRIG)) {
> +		atomic_long_set(&hcontext_id_share, -1UL);
> +
> +		/* check every CPUs sdtrig extension optional CSRs */
> +		sdtrig_percpu_csrs_check(NULL);
> +		smp_call_function(sdtrig_percpu_csrs_check, NULL, 1);
> +
> +		if (IS_ENABLED(CONFIG_KVM) &&
> +		    !atomic_read(&hcontext_disable)) {
> +			pr_info("riscv-sdtrig: Writing 'GuestOS ID' to hcontext CSR is enabled\n");
> +			static_branch_enable(&use_hcontext);
> +		}
> +
> +		if (!atomic_read(&scontext_disable)) {
> +			pr_info("riscv-sdtrig: Writing 'PID' to scontext CSR is enabled\n");
> +			static_branch_enable(&use_scontext);
> +		}
> +	}
> +	return 0;
> +}
> +
> +arch_initcall(sdtrig_enable_csrs_fill);
> +
>  void riscv_user_isa_enable(void)
>  {
>  	if (riscv_cpu_has_extension_unlikely(smp_processor_id(), RISCV_ISA_EXT_ZICBOZ))
>
