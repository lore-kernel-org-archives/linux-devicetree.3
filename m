Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 2D6CD37CD48;
	Thu,  9 Apr 2026 14:22:19 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=10.30.226.201
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1775744539; cv=none; b=dsO5DlFKZ2hCimyw6oEECcwu1XMBitDLMmFCu8ZIMHArjscVPFTOT0X9RM7hEzWqY5YeqVKCxpGdxUKh9a48CrRy9qxP86Y4HkR9iSDwnfiNsRbAlL4ZbtgdjvnG7peDQu4nXuS52svGvC0VTQJfm8UIitIlthnk02IQ+QiFj8Y=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1775744539; c=relaxed/simple;
	bh=lnysXBuf6iY2y5qrIffxuRGOa+LUTqfJVPusvhuoPHg=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=s+CNx03QyRX5sgJ/C+ypVkjOYG5WKShBpLO4t3/NCsextWF3U7wDmDMLn6wRboOa+fUWl85eoeeEvL6iJnk+0BMPsy9/gkQpUj0OORnZUEFl05nqK8bQiadSoH0eNNFLRfpT2YFRS85osNbpWe/h4wY055SSPzVA1aVb3WtsK84=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=FodobkJb; arc=none smtp.client-ip=10.30.226.201
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="FodobkJb"
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 05D6FC19424;
	Thu,  9 Apr 2026 14:22:14 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1775744538;
	bh=lnysXBuf6iY2y5qrIffxuRGOa+LUTqfJVPusvhuoPHg=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
	b=FodobkJbB9g90d5/TF2f6/jAaVv57bmItq52Hjb6gmQ7TLdu3+mnAZNpW9jYx6WIZ
	 dU3V9jyhdO7t01pxuvcS6q5TFYrpYxxXhpH3bvR5tiqvrsAAguqtU10P0vj85/c4iI
	 wKGscJrdPpc0wmSb4c7OhCHczELf1P2ueTU3V0xoqa2qCFb83ZnONxOrToSbxIz6+5
	 ESDBta7lW6woU/78atSgN48+CjkqBASvpRiYEfCxSh//BUDpgn3hlGzLiJ3LBeOsoq
	 nbC+TlXWlaBB0NqUiWpkRCuVPlZe+C1G2gbz/edr4tFS8/BfXVDU1iDf60WYCSdRBW
	 3HeQRBjbhbOBg==
Date: Thu, 9 Apr 2026 17:22:11 +0300
From: Mike Rapoport <rppt@kernel.org>
To: Evangelos Petrongonas <epetron@amazon.de>
Cc: Rob Herring <robh@kernel.org>, Saravana Kannan <saravanak@kernel.org>,
	Changyuan Lyu <changyuanl@google.com>,
	Alexander Graf <graf@amazon.com>,
	Pasha Tatashin <pasha.tatashin@soleen.com>,
	Pratyush Yadav <pratyush@kernel.org>,
	Andrew Morton <akpm@linux-foundation.org>,
	devicetree@vger.kernel.org, kexec@lists.infradead.org,
	linux-kernel@vger.kernel.org, nh-open-source@amazon.com
Subject: Re: [PATCH] of: fdt: skip KHO when booting as crash kernel
Message-ID: <ade2ExpM8ROXV-vy@kernel.org>
References: <20260407150639.69923-1-epetron@amazon.de>
Precedence: bulk
X-Mailing-List: devicetree@vger.kernel.org
List-Id: <devicetree.vger.kernel.org>
List-Subscribe: <mailto:devicetree+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:devicetree+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20260407150639.69923-1-epetron@amazon.de>

Hi Evangelos,

On Tue, Apr 07, 2026 at 03:06:33PM +0000, Evangelos Petrongonas wrote:
> KHO preserves state across kexec by passing a KHO-specific FDT pointer
> and scratch memory region to the incoming kernel. These point to
> physical addresses in the outgoing kernel's memory that the incoming
> kernel is expected to access and restore from. This falls apart when
> the incoming kernel is a crash kernel as the crash kernel can run in a
> small reserved memory region. The scratch regions can sit outside this
> reservation, so the end result is quite unpleasant.
> 
> kho_add_chosen() unconditionally propagates KHO properties into
> the device tree for all kexec image types, including crash images. The
> crash kernel then discovers these properties during
> early_init_dt_check_kho(), records the stale physical addresses via
> kho_populate(), and later faults in kho_memory_init() when it tries
> phys_to_virt() on the KHO FDT address:
> 
> Unable to handle kernel paging request at virtual address xxxxxxxx
> ...
>   fdt_offset_ptr+...
>   fdt_check_node_offset_+...
>   fdt_first_property_offset+...
>   fdt_get_property_namelen_+...
>   fdt_getprop+...
>   kho_memory_init+...
>   mm_core_init+...
>   start_kernel+...
> 
> kho_locate_mem_hole() already skips KHO logic for KEXEC_TYPE_CRASH
> images, but the DT property propagation and the consumer side were both
> missing the same guard.
> 
> Fix this at both ends. Have kho_add_chosen() skip writing KHO properties
> for crash images so the stale pointers never reach the crash kernel's
> device tree. Also have early_init_dt_check_kho() bail out when
> is_kdump_kernel() is true. This way even if KHO properties end up in
> the DT through some other path, the crash kernel will not act on them.
> 
> Fixes: 274cdcb1c004 ("arm64: add KHO support")
> Signed-off-by: Evangelos Petrongonas <epetron@amazon.de>
> ---
> 
> I think we should backport the fix on KHO compatible versions (6.16+),
> hence the "Fixes:" tag. Tested on an arm64 system.
> 
>  drivers/of/fdt.c   | 3 +++
>  drivers/of/kexec.c | 3 ++-
>  2 files changed, 5 insertions(+), 1 deletion(-)

What about x86? ;-)
 
> diff --git a/drivers/of/fdt.c b/drivers/of/fdt.c
> index 43a0944ca462..77018ec99fc8 100644
> --- a/drivers/of/fdt.c
> +++ b/drivers/of/fdt.c
> @@ -926,6 +926,9 @@ static void __init early_init_dt_check_kho(void)
>  	if (!IS_ENABLED(CONFIG_KEXEC_HANDOVER) || (long)node < 0)
>  		return;
>  
> +	if (is_kdump_kernel())
> +		return;
> +

This seems redundant if don't add KHO nodes at the first place.

>  	if (!of_flat_dt_get_addr_size(node, "linux,kho-fdt",
>  				      &fdt_start, &fdt_size))
>  		return;
> diff --git a/drivers/of/kexec.c b/drivers/of/kexec.c
> index c4cf3552c018..b95f0b386684 100644
> --- a/drivers/of/kexec.c
> +++ b/drivers/of/kexec.c
> @@ -271,7 +271,8 @@ static int kho_add_chosen(const struct kimage *image, void *fdt, int chosen_node
>  	if (ret && ret != -FDT_ERR_NOTFOUND)
>  		return ret;
>  
> -	if (!image->kho.fdt || !image->kho.scratch)
> +	if (!image->kho.fdt || !image->kho.scratch ||
> +	    image->type == KEXEC_TYPE_CRASH)
>  		return 0;
>  
>  	fdt_mem = image->kho.fdt;

kho_add_chosen() bails out if there's no KHO buffer in kimage, so if
kho_fill_kimage won't add KHO buffer to kexec_crash_image it should be
enough.

> -- 
> 2.43.0
> 
> 
> 
> 
> Amazon Web Services Development Center Germany GmbH
> Tamara-Danz-Str. 13
> 10243 Berlin
> Geschaeftsfuehrung: Christof Hellmis, Andreas Stieger
> Eingetragen am Amtsgericht Charlottenburg unter HRB 257764 B
> Sitz: Berlin
> Ust-ID: DE 365 538 597
> 

-- 
Sincerely yours,
Mike.
