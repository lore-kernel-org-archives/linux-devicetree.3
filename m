Received: from us-smtp-delivery-124.mimecast.com (us-smtp-delivery-124.mimecast.com [170.10.129.124])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 80C1B3016E3
	for <devicetree@vger.kernel.org>; Fri,  3 Apr 2026 09:40:20 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=170.10.129.124
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1775209223; cv=none; b=J4xEXpF5Ml/NH5CdONg4qvARwMvBGIdbnobHN5aFYbct/s4ONXZKfCYnKxrvC2zHVUkZR31a0NvVUUR33iqTpJojhIGP8dcuvKdiH2cT8+rhED4h6qH3Gtgy1kczHLG3h6TT+u+8Q/wmlSgy07QmIZemL4pBTU89DW2wPO9RywU=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1775209223; c=relaxed/simple;
	bh=OSgZ4dviDAaAdwa70bTRY6AtSOYZUZyiYcYEMG2DxhY=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=YAL4Iw7gP+pXV9ZsO8fZ/MmdwOifnXkIfqFmoGN+LVNDLOaVG8oYsxxhfKjuFARG9GknnW+OUDObiEMzUT0UAW0DhUNwclXssYZG4syvzNzEamd3fO8kFlk1Ie2z/LmpyHsGWmLBWXhAOUtcDC1462JFxuu4G13tQd55X3FSgeY=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=redhat.com; spf=pass smtp.mailfrom=redhat.com; dkim=pass (1024-bit key) header.d=redhat.com header.i=@redhat.com header.b=A0dIu9OR; dkim=pass (2048-bit key) header.d=redhat.com header.i=@redhat.com header.b=K3QC+sB7; arc=none smtp.client-ip=170.10.129.124
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=redhat.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=redhat.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=redhat.com header.i=@redhat.com header.b="A0dIu9OR";
	dkim=pass (2048-bit key) header.d=redhat.com header.i=@redhat.com header.b="K3QC+sB7"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
	s=mimecast20190719; t=1775209219;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references;
	bh=LlIqRCpSkn+vkqIUF9eytfuVueKTfFVCaHifeJ7gRrQ=;
	b=A0dIu9ORhbggiYvPd1998w+q9RQACT2bSqZLVKkp0imw3McPSbMqfwrDseZtx5BqIsPdgR
	v5o7VQSerWFelVD0PlB/4W1WmlckUX310ZWZwQT4szzSpQjfDejkHgRuv+JajcD/LFhi8e
	7LB0cgVGyWKlGaQvQO+Wg35ebqrq+7Q=
Received: from mail-pj1-f72.google.com (mail-pj1-f72.google.com
 [209.85.216.72]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.3, cipher=TLS_AES_256_GCM_SHA384) id
 us-mta-563-HxiLaEwxPfC8MsmRO8AX7w-1; Fri, 03 Apr 2026 05:40:17 -0400
X-MC-Unique: HxiLaEwxPfC8MsmRO8AX7w-1
X-Mimecast-MFC-AGG-ID: HxiLaEwxPfC8MsmRO8AX7w_1775209217
Received: by mail-pj1-f72.google.com with SMTP id 98e67ed59e1d1-35da37203d2so3909475a91.3
        for <devicetree@vger.kernel.org>; Fri, 03 Apr 2026 02:40:17 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=redhat.com; s=google; t=1775209217; x=1775814017; darn=vger.kernel.org;
        h=in-reply-to:content-transfer-encoding:content-disposition
         :mime-version:references:message-id:subject:cc:to:from:date:from:to
         :cc:subject:date:message-id:reply-to;
        bh=LlIqRCpSkn+vkqIUF9eytfuVueKTfFVCaHifeJ7gRrQ=;
        b=K3QC+sB7o+MoQStB0WUCZhvvRXV5Aptv9gYPA4jkh6bF0kofEP2nAr8RU0kNKcam4q
         AF4pFoQjE43vMyVyJd2XQRsCiT2ZAvDzB1TpBIIXY33ecq+ZDo+1mt/oscB+/FWIE59z
         8JAXBQsFPkqJbiFIs1BrDMjwxpKzOqBGCZhmHVTsl3GScvRLiGKgC2ojH/2Gy2p4W9nT
         Ohi8UChsENhjtAoQ3IrgsighhLWONi2PuNLr7io/r0RJLJLJhvkHTiJpQrUOV9OToM6a
         00Hoh2dBdLD92SXo06GYwlVZiILMUey8qyRoAHXxYZIdDqPoiP/a8W7Al0xQZDnnCXpU
         j8hw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1775209217; x=1775814017;
        h=in-reply-to:content-transfer-encoding:content-disposition
         :mime-version:references:message-id:subject:cc:to:from:date:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=LlIqRCpSkn+vkqIUF9eytfuVueKTfFVCaHifeJ7gRrQ=;
        b=TFun2qIjP6h+OMEP3oX1gYEslNavGjH0RyEGWx5l8BWcP1v2gZDipzKHPdVjeydAwJ
         ytbHU0F/DNRrkPFd8ei87eZEeBFdLmxbcWeOTKw/GBWV8dHlFa2ndNH8RYxcta4TEWlb
         GeilVofeM9gWaz/J8mCP1IuPAh1SsIMkHu/44/TZN+bcVhAB8oysZqT23VwPvI9EfhSM
         QsW/Qpz5DKnjU4x3BscJ/tLLUhnBjGVO2G5j8bO1t2P0PCjZMorQi+dBn+Ja9xzgjI4l
         lqI/Yktar3C3lJXXweBe3sUD5zaMqG5JYewTJ0D1V/RLh2LPsok3MTB0lLvDTEP0ky0o
         v35g==
X-Forwarded-Encrypted: i=1; AJvYcCU61h983FhlqQa84gw61XL2ogfUnvmc0XhFgHWDhpOCtXsPLFHBgjNTYNs9aPECWYBqIF09TvAQ3Uel@vger.kernel.org
X-Gm-Message-State: AOJu0YzeAR13NhCWyqzwSWDMhIOb5YDppr4bqndlIdJos9spUYcPAQNT
	nzM02nJqpSMzFcF1Z9gky6BTcEjUVTt9JsUzfHfvD9lyarjxQt9yny2C1KGPcRW8J/qoqJtOGhJ
	g07Ws6sQJjIOYfpjyOHtbtdjphLzxkCDJaUWmoLsYIr/gLtPLVuC5GONdHB8y9AM=
X-Gm-Gg: ATEYQzyA6jCSY/DAqzpq0uoUgzJdA0ULdcrSF41tFmXLpiQHHunWDuzSutZO92CH6Eb
	rB598py9zbrJ8xTCcDJhR0VRK4ouRI0pY/PNXsWHCkbGwYIq4Iq+TS1keWxdgv2jD3OjyVW5njU
	tmI21NS5wnEul9wqxrUZSY1h47SPgMl8/htfONgt4wDCUrCUYAoso9zqFoWyp5Q2lbySg1yA6GJ
	1Vi7WCp2iYbhqD5WOXjlqWv3gB0/DOTybmVjo+TWiFQTRWkgYXTfIKg+JDEr/E1wPCEelYQDvK9
	eOQkjapAe56AC5XkmpxcItfgyWG/EkvR0kTBwis6ppVCAAzy2lAsjWssxhYBAlqXynwPEyjyeOs
	zgaVtF8JNgTCP
X-Received: by 2002:a05:6a20:734b:b0:39b:c4cd:d854 with SMTP id adf61e73a8af0-39f2f072479mr2129509637.30.1775209216640;
        Fri, 03 Apr 2026 02:40:16 -0700 (PDT)
X-Received: by 2002:a05:6a20:734b:b0:39b:c4cd:d854 with SMTP id adf61e73a8af0-39f2f072479mr2129461637.30.1775209215889;
        Fri, 03 Apr 2026 02:40:15 -0700 (PDT)
Received: from localhost ([209.132.188.88])
        by smtp.gmail.com with ESMTPSA id 41be03b00d2f7-c76c6491fe0sm4419498a12.11.2026.04.03.02.40.14
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 03 Apr 2026 02:40:15 -0700 (PDT)
Date: Fri, 3 Apr 2026 17:36:38 +0800
From: Coiby Xu <coxu@redhat.com>
To: Sourabh Jain <sourabhjain@linux.ibm.com>
Cc: kexec@lists.infradead.org, linux-arm-kernel@lists.infradead.org, 
	linuxppc-dev@lists.ozlabs.org, devicetree@vger.kernel.org, 
	Arnaud Lefebvre <arnaud.lefebvre@clever-cloud.com>, Baoquan he <bhe@redhat.com>, Dave Young <dyoung@redhat.com>, 
	Kairui Song <ryncsn@gmail.com>, Pingfan Liu <kernelfans@gmail.com>, 
	Andrew Morton <akpm@linux-foundation.org>, Krzysztof Kozlowski <krzk@kernel.org>, 
	Rob Herring <robh@kernel.org>, Thomas Staudt <tstaudt@de.ibm.com>, 
	Will Deacon <will@kernel.org>, "Christophe Leroy (CS GROUP)" <chleroy@kernel.org>, 
	Catalin Marinas <catalin.marinas@arm.com>, Madhavan Srinivasan <maddy@linux.ibm.com>, 
	Michael Ellerman <mpe@ellerman.id.au>, Nicholas Piggin <npiggin@gmail.com>, 
	Saravana Kannan <saravanak@kernel.org>, open list <linux-kernel@vger.kernel.org>
Subject: Re: [PATCH v5 3/3] arm64,ppc64le/kdump: pass dm-crypt keys to kdump
 kernel
Message-ID: <ac-HoiqxZma0M7Ko@Rk>
References: <20260225060347.718905-1-coxu@redhat.com>
 <20260225060347.718905-4-coxu@redhat.com>
 <51761fcf-955f-45e2-97a5-2b49d8e79d04@linux.ibm.com>
Precedence: bulk
X-Mailing-List: devicetree@vger.kernel.org
List-Id: <devicetree.vger.kernel.org>
List-Subscribe: <mailto:devicetree+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:devicetree+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=iso-8859-1; format=flowed
Content-Disposition: inline
Content-Transfer-Encoding: 8bit
In-Reply-To: <51761fcf-955f-45e2-97a5-2b49d8e79d04@linux.ibm.com>

On Thu, Apr 02, 2026 at 04:24:14PM +0530, Sourabh Jain wrote:
>
>
>On 25/02/26 11:33, Coiby Xu wrote:
>>CONFIG_CRASH_DM_CRYPT has been introduced to support LUKS-encrypted
>>device dump target by addressing two challenges [1],
>>  - Kdump kernel may not be able to decrypt the LUKS partition. For some
>>    machines, a system administrator may not have a chance to enter the
>>    password to decrypt the device in kdump initramfs after the 1st kernel
>>    crashes
>>
>>  - LUKS2 by default use the memory-hard Argon2 key derivation function
>>    which is quite memory-consuming compared to the limited memory reserved
>>    for kdump.
>>
>>To also enable this feature for ARM64 and PowerPC, the missing piece is
>>to let the kdump kernel know where to find the dm-crypt keys which are
>>randomly stored in memory reserved for kdump. Introduce a new device
>>tree property dmcryptkeys [2] as similar to elfcorehdr to pass the
>>memory address of the stored info of dm-crypt keys to the kdump kernel.
>>Since this property is only needed by the kdump kernel, it won't be
>>exposed to user space.
>>
>>[1] https://lore.kernel.org/all/20250502011246.99238-1-coxu@redhat.com/
>>[2] https://github.com/devicetree-org/dt-schema/pull/181
>>
>>Cc: Arnaud Lefebvre <arnaud.lefebvre@clever-cloud.com>
>>Cc: Baoquan he <bhe@redhat.com>
>>Cc: Dave Young <dyoung@redhat.com>
>>Cc: Kairui Song <ryncsn@gmail.com>
>>Cc: Pingfan Liu <kernelfans@gmail.com>
>>Cc: Andrew Morton <akpm@linux-foundation.org>
>>Cc: Krzysztof Kozlowski <krzk@kernel.org>
>>Cc: Rob Herring <robh@kernel.org>
>>Cc: Thomas Staudt <tstaudt@de.ibm.com>
>>Cc: Sourabh Jain <sourabhjain@linux.ibm.com>
>>Cc: Will Deacon <will@kernel.org>
>>Cc: Christophe Leroy (CS GROUP) <chleroy@kernel.org>
>>Signed-off-by: Coiby Xu <coxu@redhat.com>
>>---
>>  arch/arm64/kernel/machine_kexec_file.c |  4 ++++
>>  arch/powerpc/kexec/elf_64.c            |  4 ++++
>>  drivers/of/fdt.c                       | 21 +++++++++++++++++++++
>>  drivers/of/kexec.c                     | 19 +++++++++++++++++++
>>  4 files changed, 48 insertions(+)
>>
>>diff --git a/arch/arm64/kernel/machine_kexec_file.c b/arch/arm64/kernel/machine_kexec_file.c
>>index fba260ad87a9..e31fabed378a 100644
>>--- a/arch/arm64/kernel/machine_kexec_file.c
>>+++ b/arch/arm64/kernel/machine_kexec_file.c
>>@@ -134,6 +134,10 @@ int load_other_segments(struct kimage *image,
>>  		kexec_dprintk("Loaded elf core header at 0x%lx bufsz=0x%lx memsz=0x%lx\n",
>>  			      image->elf_load_addr, kbuf.bufsz, kbuf.memsz);
>>+
>>+		ret = crash_load_dm_crypt_keys(image);
>>+		if (ret)
>>+			goto out_err;
>>  	}
>>  #endif
>>diff --git a/arch/powerpc/kexec/elf_64.c b/arch/powerpc/kexec/elf_64.c
>>index 5d6d616404cf..ea50a072debf 100644
>>--- a/arch/powerpc/kexec/elf_64.c
>>+++ b/arch/powerpc/kexec/elf_64.c
>>@@ -79,6 +79,10 @@ static void *elf64_load(struct kimage *image, char *kernel_buf,
>>  			goto out;
>>  		}
>>+		ret = crash_load_dm_crypt_keys(image);
>>+		if (ret)
>>+			goto out;
>>+
>>  		/* Setup cmdline for kdump kernel case */
>>  		modified_cmdline = setup_kdump_cmdline(image, cmdline,
>>  						       cmdline_len);
>>diff --git a/drivers/of/fdt.c b/drivers/of/fdt.c
>>index 331646d667b9..2967e4aff807 100644
>>--- a/drivers/of/fdt.c
>>+++ b/drivers/of/fdt.c
>>@@ -866,6 +866,26 @@ static void __init early_init_dt_check_for_elfcorehdr(unsigned long node)
>>  		 elfcorehdr_addr, elfcorehdr_size);
>>  }
>>+static void __init early_init_dt_check_for_dmcryptkeys(unsigned long node)
>>+{
>>+	const char *prop_name = "linux,dmcryptkeys";
>>+	const __be32 *prop;
>>+
>>+	if (!IS_ENABLED(CONFIG_CRASH_DM_CRYPT))
>>+		return;
>>+
>>+	pr_debug("Looking for dmcryptkeys property... ");
>>+
>>+	prop = of_get_flat_dt_prop(node, prop_name, NULL);
>>+	if (!prop)
>>+		return;
>>+
>>+	dm_crypt_keys_addr = dt_mem_next_cell(dt_root_addr_cells, &prop);
>>+
>>+	/* Property only accessible to crash dump kernel */
>>+	fdt_delprop(initial_boot_params, node, prop_name);
>>+}
>>+
>>  static unsigned long chosen_node_offset = -FDT_ERR_NOTFOUND;
>>  /*
>>@@ -1097,6 +1117,7 @@ int __init early_init_dt_scan_chosen(char *cmdline)
>>  	early_init_dt_check_for_initrd(node);
>>  	early_init_dt_check_for_elfcorehdr(node);
>>+	early_init_dt_check_for_dmcryptkeys(node);
>>  	rng_seed = of_get_flat_dt_prop(node, "rng-seed", &l);
>>  	if (rng_seed && l > 0) {
>>diff --git a/drivers/of/kexec.c b/drivers/of/kexec.c
>>index c4cf3552c018..fbd253f0d3c5 100644
>>--- a/drivers/of/kexec.c
>>+++ b/drivers/of/kexec.c
>>@@ -423,6 +423,25 @@ void *of_kexec_alloc_and_setup_fdt(const struct kimage *image,
>>  		if (ret)
>>  			goto out;
>>+		if (image->dm_crypt_keys_addr != 0) {
>>+			ret = fdt_appendprop_addrrange(fdt, 0, chosen_node,
>>+						       "linux,dmcryptkeys",
>>+						       image->dm_crypt_keys_addr,
>>+						       image->dm_crypt_keys_sz);
>>+
>>+			if (ret)
>>+				goto out;
>>+
>>+			/*
>>+			 * Avoid dmcryptkeys from being stomped on in kdump kernel by
>>+			 * setting up memory reserve map.
>>+			 */
>>+			ret = fdt_add_mem_rsv(fdt, image->dm_crypt_keys_addr,
>>+					      image->dm_crypt_keys_sz);
>>+			if (ret)
>>+				goto out;
>>+		}
>>+
>>  #ifdef CONFIG_CRASH_DUMP
>>  		/* add linux,usable-memory-range */
>>  		ret = fdt_appendprop_addrrange(fdt, 0, chosen_node,
>
>The above changes look good to me.
>
>Feel free to add:
>Reviewed-by: Sourabh Jain <sourabhjain@linux.ibm.com>

Thanks for reviewing the patch!

>
>But while reading crash_load_dm_crypt_keys() I noticed a possibility of a
>double free at the address pointed by `keys_header`:
>
>In crash_load_dm_crypt_keys()/crash_dump_dm_crypt.c
>    snip...
>
>    kbuf.buffer = keys_header;
>
>    snip....
>
>    r = kexec_add_buffer(&kbuf);
>    if (r) {
>        pr_err("Failed to call kexec_add_buffer, ret=%d\n", r);
>        kvfree((void *)kbuf.buffer);                           <--- 
>First Free
>        return r;
>    }
>
>Since `keys_header` is not reset, the next call to build_keys_header()
>will cause a double free at `keys_header`.
>
>static int build_keys_header(void)
>{
>
>    snip...
>
>    if (keys_header != NULL)
>        kvfree(keys_header);
>
>    snip...
>}
>
>What do you think?
>
>- Sourabh Jain

Good catch! I'll send a patch to address this issue. Thanks!

-- 
Best regards,
Coiby

