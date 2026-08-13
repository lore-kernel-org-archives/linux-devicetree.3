Received: from us-smtp-delivery-124.mimecast.com (us-smtp-delivery-124.mimecast.com [170.10.129.124])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id DDA4C351C2E
	for <devicetree@vger.kernel.org>; Thu, 13 Aug 2026 07:40:42 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=170.10.129.124
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1786606846; cv=none; b=ZgGEXZguydZvkBVNevaViB5jcYmrQcIGqc4+8ZxVo79UitJhEI6VmE5rT9rscuNvY5ejDTHTsVjMUACGatkTuDudrXYvCNPnTRFnunaDuraKVu+MRTZmMlkYTmY/UMeDsu0/Ncp3e7q5oYcx2QUAmFpbVFz/BONsu/mzo8Spo6g=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1786606846; c=relaxed/simple;
	bh=kTNyIcRkyH9o9SkdiifJx+G2LOf1zfeSeqJBPj80FTU=;
	h=Message-ID:Date:MIME-Version:Subject:From:To:References:Cc:
	 In-Reply-To:Content-Type; b=NuPfCUPNt3MwQukn8j0GOVOq0cAMMxZRsQSpxjKXd4sig0FS3w9lOP7hgUxrCt9KmsKBhej4m3gtPyfODRNmj8Htx/gn1DVNksZBSbdPev2mb3e2ogBoa8oP+LMwaATfHE7jw6BZ8JLWkIFpGgyIFWvNfQXKDbuIv88vXqNKUSM=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=redhat.com; spf=pass smtp.mailfrom=redhat.com; dkim=pass (1024-bit key) header.d=redhat.com header.i=@redhat.com header.b=Acnjce3l; dkim=pass (2048-bit key) header.d=redhat.com header.i=@redhat.com header.b=efMbroCi; arc=none smtp.client-ip=170.10.129.124
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=redhat.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=redhat.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=redhat.com header.i=@redhat.com header.b="Acnjce3l";
	dkim=pass (2048-bit key) header.d=redhat.com header.i=@redhat.com header.b="efMbroCi"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
	s=mimecast20190719; t=1786606841;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references:autocrypt:autocrypt;
	bh=Goz2F8/8o2DgFJ8fkVN7363CytXX+24q6LWsC6i1Oyw=;
	b=Acnjce3ltx+L8O60QE0nrUh2r4JDD48HAiueQxbs1M2ppHyBPSoteoR9vx6e5RnJz4wIcO
	QNXozmAAFRdRThTVS0TYd6F7wjpvk60olyGnw/wGRjuNII6bGLQ0GMGENjp3AeqYno8VTV
	XgubwHzEeEPo36sosuwAes4GRzXiqNI=
Received: from mail-wm1-f69.google.com (mail-wm1-f69.google.com
 [209.85.128.69]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.3, cipher=TLS_AES_256_GCM_SHA384) id
 us-mta-37-0EVEyFt_MP6ydaLioHbiuw-1; Thu, 13 Aug 2026 03:40:39 -0400
X-MC-Unique: 0EVEyFt_MP6ydaLioHbiuw-1
X-Mimecast-MFC-AGG-ID: 0EVEyFt_MP6ydaLioHbiuw_1786606839
Received: by mail-wm1-f69.google.com with SMTP id 5b1f17b1804b1-490a767b782so14692595e9.2
        for <devicetree@vger.kernel.org>; Thu, 13 Aug 2026 00:40:39 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=redhat.com; s=google; t=1786606839; x=1787211639; darn=vger.kernel.org;
        h=content-transfer-encoding:content-type:in-reply-to:autocrypt:cc
         :content-language:references:to:from:subject:user-agent:mime-version
         :date:message-id:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=Goz2F8/8o2DgFJ8fkVN7363CytXX+24q6LWsC6i1Oyw=;
        b=efMbroCiQv9xEm70ioKx6UWwFou1e97CU2LrcvGrfmXmycNlS8RiLNC8T2c0ctxnOL
         RLh7AKYgLwiLTpBQsk6E/QNbkvNtGAUTKBIm7pgwaZ826NIgV3/M7CLUQ2iDUacvqLzi
         SIJu5JrL8G3a2aec4p0EWHrWDiBleqgn9scwjduLCUsif2atR5GLnHSyVXg3FRXhOoaD
         tHen8DpnxH/SGP0zV+vs57ZEWBtyTU01Sz8Hsyk34oe5l6XbQ+DJxFzE4FWkjW3dhcPi
         zwRyVd048ZjI3xRRH7UeoE0nvC+NJv75jFO7bhffMm1QYOHED+Otd/wVc6/ciixnFqLo
         1jgA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1786606839; x=1787211639;
        h=content-transfer-encoding:content-type:in-reply-to:autocrypt:cc
         :content-language:references:to:from:subject:user-agent:mime-version
         :date:message-id:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=Goz2F8/8o2DgFJ8fkVN7363CytXX+24q6LWsC6i1Oyw=;
        b=NH11S1MdvHTavcgY5qvLxmW23VrJtqvoIvG5tq4+H3cfkJQcmZLDH1Akx3nU+7EDTp
         nFdVmJXr0oFW1gDoj7WbeMGe7fzEuVPj/gzdQu0EWnxV9+AVY3SAW1Asz5JX+Ykw1S88
         KQvcFGrTCvvP/53nN+2NejXd99jHJXn+HpDYL0sNPkDOAw5rTYiQL1dS/j5typ1uZAs2
         tJMpxl2lzCspOZz54FDOQsHQul3qJOfnQhJkHVv8XfyCC1X4dd78Iux2P230ISQrpU3/
         7OVN5jrICsxxwQ8Pdi8+KRnaSC6yfWtw78+9R6HT321WkLHpTwXrGk1FqzF5iP1ucwc9
         MMig==
X-Forwarded-Encrypted: i=1; AHgh+RrSbPq56OMiw1vnmpWo+8D8ca7JWbVjwLNkF4n4wARDtI24v+gh4cKw96PRjr/7wkB6VND+DNXFfoqR@vger.kernel.org
X-Gm-Message-State: AOJu0YxgBs4z0lyymYL9uriDK9TlVJVsXqGIBZaxNz2JwFhmyVpMdbvu
	w73pmzj+jRb0JJFt85ooEvTBnBRWUL8t9QZG/XKXzFSrqdrSIz96nOvd8AubIQl9dDrVVG6we1W
	dR/NYDKdj/c5ib7sSY+xwvdqODcjXpJd0c6vPVGGpeNugejZD20rxT+aOjv3VgYU=
X-Gm-Gg: AR+sD105vZOOwpTLCuieoLWMHQ1veug2FkrYiWPkKTFmrUGl9yrtdTx58OMEbgT9ziv
	KAlp4/L0c+qmpX0caLUngECaRR8fg2mMcQ0LcVPw+2xrOZp/1M0dGEVWERUgbFRTWE3mSKpftsr
	c0s4y4CktM4MBiU4xP0uXVaM/7jABU5sIrIUowe4AWCJ4QN25aZbqC1p8809hqGatSW45J7M+tm
	JOaOuuDJ/ZAwPZTyh0pRKrAGxstsKyo2IUwpQQLKWQC03gJnXzrCN3zlNP/ktbf4W+mMfojKqSA
	fTk0xD3bCAvCeVLLlNR8YX4v7SRcmljR4MqRhexpQegGLEdivF9pWcVBMw8QLG95FLDY9rCl
X-Received: by 2002:a05:600c:b99:b0:499:7a5e:4c3f with SMTP id 5b1f17b1804b1-4998215a94fmr34005905e9.1.1786606838705;
        Thu, 13 Aug 2026 00:40:38 -0700 (PDT)
X-Received: by 2002:a05:600c:b99:b0:499:7a5e:4c3f with SMTP id 5b1f17b1804b1-4998215a94fmr34005475e9.1.1786606838390;
        Thu, 13 Aug 2026 00:40:38 -0700 (PDT)
Received: from [192.168.0.9] ([47.64.115.27])
        by smtp.gmail.com with ESMTPSA id ffacd0b85a97d-4815a5613e2sm5150703f8f.6.2026.08.13.00.40.36
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Thu, 13 Aug 2026 00:40:37 -0700 (PDT)
Message-ID: <a37baafd-56dc-4733-bd7c-c92a8b8c1474@redhat.com>
Date: Thu, 13 Aug 2026 09:40:36 +0200
Precedence: bulk
X-Mailing-List: devicetree@vger.kernel.org
List-Id: <devicetree.vger.kernel.org>
List-Subscribe: <mailto:devicetree+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:devicetree+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH] of: fdt: Replace __ASSEMBLY__ with __ASSEMBLER__ in
 of_fdt.h header file
From: Thomas Huth <thuth@redhat.com>
To: Rob Herring <robh@kernel.org>, Saravana Kannan <saravanak@kernel.org>,
 linux-kernel@vger.kernel.org
References: <20260619160234.69568-1-thuth@redhat.com>
Content-Language: en-US
Cc: Krzysztof Kozlowski <krzk+dt@kernel.org>,
 Conor Dooley <conor+dt@kernel.org>, devicetree@vger.kernel.org
Autocrypt: addr=thuth@redhat.com; keydata=
 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
In-Reply-To: <20260619160234.69568-1-thuth@redhat.com>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit

On 19/06/2026 18.02, Thomas Huth wrote:
> From: Thomas Huth <thuth@redhat.com>
> 
> While the GCC and Clang compilers already define __ASSEMBLER__
> automatically when compiling assembly code, __ASSEMBLY__ is a
> macro that only gets defined by the Makefiles in the kernel.
> This can be very confusing when switching between userspace
> and kernelspace coding, or when dealing with uapi headers that
> rather should use __ASSEMBLER__ instead. So let's standardize now
> on the __ASSEMBLER__ macro that is provided by the compilers.
> 
> This is a completely mechanical patch (done with a simple "sed -i"
> statement).
> 
> Signed-off-by: Thomas Huth <thuth@redhat.com>
> ---
>   Note: This patch has been split from an earlier bigger patch of
>   mine to ease reviewing.
> 
>   include/linux/of_fdt.h | 4 ++--
>   1 file changed, 2 insertions(+), 2 deletions(-)
> 
> diff --git a/include/linux/of_fdt.h b/include/linux/of_fdt.h
> index 51dadbaa3d63a..72b452e388eeb 100644
> --- a/include/linux/of_fdt.h
> +++ b/include/linux/of_fdt.h
> @@ -16,7 +16,7 @@
>  /* Definitions used by the flattened device tree */
>  #define OF_DT_HEADER		0xd00dfeed	/* marker */
>   
> -#ifndef __ASSEMBLY__
> +#ifndef __ASSEMBLER__
>  
>  #if defined(CONFIG_OF_FLATTREE)
>  
> @@ -103,5 +103,5 @@ static inline void unflatten_device_tree(void) {}
>  static inline void unflatten_and_copy_device_tree(void) {}
>  #endif /* CONFIG_OF_EARLY_FLATTREE */
>  
> -#endif /* __ASSEMBLY__ */
> +#endif /* __ASSEMBLER__ */
>  #endif /* _LINUX_OF_FDT_H */

Friendly ping!

Could anybody please pick this up? Thanks!

  Thomas

