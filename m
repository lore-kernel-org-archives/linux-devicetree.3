Received: from us-smtp-delivery-124.mimecast.com (us-smtp-delivery-124.mimecast.com [170.10.133.124])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id E43F336E476
	for <devicetree@vger.kernel.org>; Tue, 31 Mar 2026 07:13:06 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=170.10.133.124
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1774941188; cv=none; b=YB6teeZFEOUgiizRJav+v0MPeCpUQYBEYCPvPT0XvoVDIrMspY0ZalPgmX7LBnTO1F1v8Cnp4PM/WSFYaOggR7bxORHEQU1FdU0fVv58RLtfplWSfHJhCsqQR49Z67o1u4VB46VnbJNgpZTJ0kZG2P9N7SOZwgnQzhU6qtgEq2o=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1774941188; c=relaxed/simple;
	bh=V76KNOtyGcdHShsxbAviWTZ3K/XJOxPp4wmSojZasN8=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=SQuq1FfbmzeCfmFWusPw6M1t96+AHNqgvHE4/co/V4v+QVj58LEXpJ3j7QJCzREJ/03P3+1GyU7A2Uq/yTf+HYIEoNWWm7dFjFa02Q096F9BdKdmaGX3XS2w73M4nXTwr1YaEEw1XHvbTLy2u3AIQeG07P/eSZYx/E3PD7YwllI=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=redhat.com; spf=pass smtp.mailfrom=redhat.com; dkim=pass (1024-bit key) header.d=redhat.com header.i=@redhat.com header.b=HiLMb1uY; arc=none smtp.client-ip=170.10.133.124
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=redhat.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=redhat.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=redhat.com header.i=@redhat.com header.b="HiLMb1uY"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
	s=mimecast20190719; t=1774941186;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
	 in-reply-to:in-reply-to:references:references;
	bh=luFavRrVLyuYw5Pp7Hq4J37Yw0Jet8kP6askoheBw5k=;
	b=HiLMb1uYqMUQ5trgMTxFarHM61DnE7M5nCEKIzCqndsM8/TPS/pX2Y/5b+q/jtulPXD9VP
	LNJZtidQYTOwXP3uvWI6HDBceZRE6PLk7n6dbT5ENDEHv9bQriY4nMCeLDRpCa+sq1lBj1
	lRa89sA2Q/gzOmPYHfmf9pD0St+4mR4=
Received: from mx-prod-mc-06.mail-002.prod.us-west-2.aws.redhat.com
 (ec2-35-165-154-97.us-west-2.compute.amazonaws.com [35.165.154.97]) by
 relay.mimecast.com with ESMTP with STARTTLS (version=TLSv1.3,
 cipher=TLS_AES_256_GCM_SHA384) id us-mta-176-d6vwkgkuNLO4Lk1HCZw_4w-1; Tue,
 31 Mar 2026 03:13:02 -0400
X-MC-Unique: d6vwkgkuNLO4Lk1HCZw_4w-1
X-Mimecast-MFC-AGG-ID: d6vwkgkuNLO4Lk1HCZw_4w_1774941180
Received: from mx-prod-int-03.mail-002.prod.us-west-2.aws.redhat.com (mx-prod-int-03.mail-002.prod.us-west-2.aws.redhat.com [10.30.177.12])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
	(No client certificate requested)
	by mx-prod-mc-06.mail-002.prod.us-west-2.aws.redhat.com (Postfix) with ESMTPS id 256BC180061A;
	Tue, 31 Mar 2026 07:13:00 +0000 (UTC)
Received: from localhost (unknown [10.72.112.177])
	by mx-prod-int-03.mail-002.prod.us-west-2.aws.redhat.com (Postfix) with ESMTPS id 843321955F42;
	Tue, 31 Mar 2026 07:12:58 +0000 (UTC)
Date: Tue, 31 Mar 2026 15:12:54 +0800
From: Baoquan He <bhe@redhat.com>
To: Coiby Xu <coxu@redhat.com>
Cc: kexec@lists.infradead.org, linux-arm-kernel@lists.infradead.org,
	linuxppc-dev@lists.ozlabs.org, devicetree@vger.kernel.org,
	kernel test robot <lkp@intel.com>,
	Andrew Morton <akpm@linux-foundation.org>,
	Vivek Goyal <vgoyal@redhat.com>, Dave Young <dyoung@redhat.com>,
	open list <linux-kernel@vger.kernel.org>
Subject: Re: [PATCH v5 2/3] crash: Align the declaration of
 crash_load_dm_crypt_keys with CONFIG_CRASH_DM_CRYPT
Message-ID: <actz9u1rBnvtuBUm@fedora>
References: <20260225060347.718905-1-coxu@redhat.com>
 <20260225060347.718905-3-coxu@redhat.com>
Precedence: bulk
X-Mailing-List: devicetree@vger.kernel.org
List-Id: <devicetree.vger.kernel.org>
List-Subscribe: <mailto:devicetree+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:devicetree+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20260225060347.718905-3-coxu@redhat.com>
X-Scanned-By: MIMEDefang 3.0 on 10.30.177.12

On 02/25/26 at 02:03pm, Coiby Xu wrote:
> This will prevent a compiling failure when CONFIG_CRASH_DUMP is enabled
> but CONFIG_CRASH_DM_CRYPT is disabled,
> 
>        arch/powerpc/kexec/elf_64.c: In function 'elf64_load':
>     >> arch/powerpc/kexec/elf_64.c:82:23: error: implicit declaration of function 'crash_load_dm_crypt_keys' [-Werror=implicit-function-declaration]
>           82 |                 ret = crash_load_dm_crypt_keys(image);
>              |                       ^~~~~~~~~~~~~~~~~~~~~~~~
>        cc1: some warnings being treated as errors
> 
> Reported-by: kernel test robot <lkp@intel.com>
> Closes: https://lore.kernel.org/oe-kbuild-all/202602120648.RgQALnnI-lkp@intel.com/
> Signed-off-by: Coiby Xu <coxu@redhat.com>
> ---
>  include/linux/crash_core.h | 14 +++++++-------
>  1 file changed, 7 insertions(+), 7 deletions(-)

Acked-by: Baoquan He <bhe@redhat.com>

> 
> diff --git a/include/linux/crash_core.h b/include/linux/crash_core.h
> index d35726d6a415..c1dee3f971a9 100644
> --- a/include/linux/crash_core.h
> +++ b/include/linux/crash_core.h
> @@ -34,13 +34,6 @@ static inline void arch_kexec_protect_crashkres(void) { }
>  static inline void arch_kexec_unprotect_crashkres(void) { }
>  #endif
>  
> -#ifdef CONFIG_CRASH_DM_CRYPT
> -int crash_load_dm_crypt_keys(struct kimage *image);
> -ssize_t dm_crypt_keys_read(char *buf, size_t count, u64 *ppos);
> -#else
> -static inline int crash_load_dm_crypt_keys(struct kimage *image) {return 0; }
> -#endif
> -
>  #ifndef arch_crash_handle_hotplug_event
>  static inline void arch_crash_handle_hotplug_event(struct kimage *image, void *arg) { }
>  #endif
> @@ -96,4 +89,11 @@ static inline void crash_save_cpu(struct pt_regs *regs, int cpu) {};
>  static inline int kimage_crash_copy_vmcoreinfo(struct kimage *image) { return 0; };
>  #endif /* CONFIG_CRASH_DUMP*/
>  
> +#ifdef CONFIG_CRASH_DM_CRYPT
> +int crash_load_dm_crypt_keys(struct kimage *image);
> +ssize_t dm_crypt_keys_read(char *buf, size_t count, u64 *ppos);
> +#else
> +static inline int crash_load_dm_crypt_keys(struct kimage *image) {return 0; }
> +#endif
> +
>  #endif /* LINUX_CRASH_CORE_H */
> -- 
> 2.53.0
> 

