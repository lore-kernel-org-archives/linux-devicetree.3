Received: from smtp.kernel.org (aws-us-west-2-korg-mail-alma10-1.taild15c8.ts.net [100.103.45.18])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 3AF1F42EED5;
	Tue, 11 Aug 2026 09:29:43 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=100.103.45.18
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1786440587; cv=none; b=g72ildubvDxecvivfyaBxHLuIGGIMt/c1kUbQQePRTUPxx4N/F++KL/vUqVeUX97vF7U1umpjfKuyxM0uhUhg8lLBUzZknzu32FCrT5oRWT71iT4LyxiuoNrjGgCCQ6TEDixA2hm+WJBJK9sfSxVLbHwiiLNYCrLbRXjlTxdTgw=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1786440587; c=relaxed/simple;
	bh=65IBiJzd+4An8KNUKE8Y+kbGHD05SrsO3CYHndjLwlU=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=AAIBsL7+P5LbKMZzhC/yahcvpXNyjmHLrMUV3nbu4YHZpsG/y/wp/enQvLqcmLeBLPgRF/OwftkDxrzT2eZNKesU0FKU0HypkYqSQpvw2MZnW0nAGhql2qRHxpdgXs3uVvudx4i8mnr5Xtwk9CDGzEa5LQGuRmEwWoYQEBz8qks=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=mLHMCmgk; arc=none smtp.client-ip=100.103.45.18
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="mLHMCmgk"
Received: by smtp.kernel.org (Postfix) with ESMTPSA id DCA521F01566;
	Tue, 11 Aug 2026 09:29:38 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kernel.org;
	s=k20260515; t=1786440582;
	bh=Yw9famE/cdD1oKyq0RADQbeI52kOsmystMlqLu/eKYo=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To;
	b=mLHMCmgkIiSnRZJ6x6zmy5eJpjxP/wYnjduhbgS7UpQFXsqqtRdW+sAOWRlM/6SWo
	 rl0xVyvjATCKz7U0W8FtZQV1TCaxjiSzJIHwGa6DJ35TvnDbXmfJNkpjjDNexvx2gY
	 AmkW6DA8dAXbevgQDfpsxXJffqWB3iEx0v5mT3n22QNsZSP8wdDG397wipLf1csmuT
	 wr01WFy98Sqh0cj8pEUETHOmaVpLycUso1NrYKVl+6zGkuRsLxwqXcs6zuQWg/FVWS
	 qxm0LK/jQSi6EeGveT11xgo2P9h0+8Y5FFP86s57Vq6+zfrC/EnJAF2tcHKN/9E4l7
	 gcpXlSnrQi/bA==
Date: Tue, 11 Aug 2026 10:29:35 +0100
From: Will Deacon <will@kernel.org>
To: =?iso-8859-1?Q?Jo=E3o?= Peixoto <jpeixoto@osyx.tech>
Cc: gregkh@linuxfoundation.org, robh@kernel.org, krzk+dt@kernel.org,
	conor+dt@kernel.org, jose@osyx.tech, davidmcerdeira@osyx.tech,
	corbet@lwn.net, skhan@linuxfoundation.org, catalin.marinas@arm.com,
	linux@armlinux.org.uk, pjw@kernel.org, palmer@dabbelt.com,
	aou@eecs.berkeley.edu, alex@ghiti.fr, andrew.jones@oss.qualcomm.com,
	rdunlap@infradead.org, linux-kernel@vger.kernel.org,
	devicetree@vger.kernel.org, linux-doc@vger.kernel.org,
	linux-arm-kernel@lists.infradead.org,
	linux-riscv@lists.infradead.org
Subject: Re: [RFC PATCH v3 4/6] virt: bao: add I/O dispatcher driver
Message-ID: <anrrf0J9C9zSrAgF@willie-the-truck>
References: <cover.1786010512.git.jpeixoto@osyx.tech>
 <2190b6e083a2f2e0485b27e5e203647189bb1d1d.1786010512.git.jpeixoto@osyx.tech>
Precedence: bulk
X-Mailing-List: devicetree@vger.kernel.org
List-Id: <devicetree.vger.kernel.org>
List-Subscribe: <mailto:devicetree+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:devicetree+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=iso-8859-1
Content-Disposition: inline
Content-Transfer-Encoding: 8bit
In-Reply-To: <2190b6e083a2f2e0485b27e5e203647189bb1d1d.1786010512.git.jpeixoto@osyx.tech>

On Fri, Aug 07, 2026 at 08:39:31AM +0100, João Peixoto wrote:
> Add the Bao I/O dispatcher, used by backend VMs to service I/O on behalf
> of frontend guests. It bridges Bao's Remote I/O mechanism to userspace
> VirtIO backend device models.
> 
> Each backend device has a contiguous shared-memory region for exchanging
> I/O buffers with its frontend and an interrupt the hypervisor uses to
> signal pending requests. Userspace drives the dispatcher through a set of
> ioctls on a misc character device.
> 
> Co-developed-by: José Martins <jose@osyx.tech>
> Signed-off-by: José Martins <jose@osyx.tech>
> Co-developed-by: David Cerdeira <davidmcerdeira@osyx.tech>
> Signed-off-by: David Cerdeira <davidmcerdeira@osyx.tech>
> Signed-off-by: João Peixoto <jpeixoto@osyx.tech>
> ---
> diff --git a/arch/arm64/include/asm/bao.h b/arch/arm64/include/asm/bao.h
> index ab9b283168e3..1dc09a2c261b 100644
> --- a/arch/arm64/include/asm/bao.h
> +++ b/arch/arm64/include/asm/bao.h
> @@ -14,6 +14,7 @@
>  #define __ASM_ARM64_BAO_H
>  
>  #include <linux/arm-smccc.h>
> +#include <linux/bao.h>
>  
>  static inline unsigned long bao_ipcshmem_hypercall(unsigned long hypercall_id,
>  						   unsigned long ipcshmem_id)
> @@ -28,4 +29,33 @@ static inline unsigned long bao_ipcshmem_hypercall(unsigned long hypercall_id,
>  	return res.a0;
>  }
>  
> +static inline unsigned long
> +bao_remio_hypercall(struct bao_remio_hypercall_ctx *ctx)
> +{
> +	register int x0 asm("x0") =
> +		ARM_SMCCC_CALL_VAL(ARM_SMCCC_FAST_CALL, ARM_SMCCC_SMC_64,
> +				   ARM_SMCCC_OWNER_VENDOR_HYP, BAO_REMIO_HYPERCALL_ID);
> +	register u64 x1 asm("x1") = ctx->dm_id;
> +	register u64 x2 asm("x2") = ctx->addr;
> +	register u64 x3 asm("x3") = ctx->op;
> +	register u64 x4 asm("x4") = ctx->value;
> +	register u64 x5 asm("x5") = ctx->request_id;
> +	register u64 x6 asm("x6") = 0;
> +
> +	asm volatile("hvc 0\n\t"
> +		     : "=r"(x0), "=r"(x1), "=r"(x2), "=r"(x3), "=r"(x4),
> +		       "=r"(x5), "=r"(x6)
> +		     : "r"(x0), "r"(x1), "r"(x2), "r"(x3), "r"(x4), "r"(x5)
> +		     : "memory");
> +
> +	ctx->addr = x1;
> +	ctx->op = x2;
> +	ctx->value = x3;
> +	ctx->access_width = x4;
> +	ctx->request_id = x5;
> +	ctx->npend_req = x6;
> +
> +	return x0;
> +}

Why aren't you using SMCCC for this? You should be able to use that (like
you did for bao_ipcshmem_hypercall()) and then there would be no need to
add any code to arch/arm64/.

Will
