Received: from us-smtp-delivery-124.mimecast.com (us-smtp-delivery-124.mimecast.com [170.10.129.124])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id A3B2829BDAB
	for <devicetree@vger.kernel.org>; Thu,  2 Apr 2026 01:50:25 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=170.10.129.124
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1775094626; cv=none; b=sxhhBATaD+ijpLviBk2rFzEzTugJU4LhZi6zOzyUBwd8DE+xbWjBbeChjAl/V/qVWxNCIZuJomhPpsu5gVLYHeRAAu3A8YW7jb5/IGujZ9pznWYtp/+omtb4q8237FBnsvGYTMLkHVU+6wLlCcysSncJ9fGlBtXaDG6C/UQYVC8=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1775094626; c=relaxed/simple;
	bh=i+qa8LFElGO/iEfmlJd0dsiKNQB6N02kRGf3foWMBmU=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=tUspiAeaOe/Pk9Ytqilw7hkBrKSJ6+ZqmOeA5Uo7ZclswB4sMEfVCI5qOvlp39ol5wXFSXN7Esv1jMxa+K2KadFLrsSl8DATk2UF4NTgjG1sFRtKeBni1JPA4bZ7yWcR+BvI1umFPxm7Lq+59pKBHIp7iHvmBnX6FZQmjoI+Umc=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=redhat.com; spf=pass smtp.mailfrom=redhat.com; dkim=pass (1024-bit key) header.d=redhat.com header.i=@redhat.com header.b=L/2ICOPD; dkim=pass (2048-bit key) header.d=redhat.com header.i=@redhat.com header.b=Tlo90BzJ; arc=none smtp.client-ip=170.10.129.124
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=redhat.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=redhat.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=redhat.com header.i=@redhat.com header.b="L/2ICOPD";
	dkim=pass (2048-bit key) header.d=redhat.com header.i=@redhat.com header.b="Tlo90BzJ"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
	s=mimecast20190719; t=1775094624;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
	 in-reply-to:in-reply-to:references:references;
	bh=uUiSeqS9PkkLaNVQ/zvAdXBaf2XPU2fS5cvEfFpiuvg=;
	b=L/2ICOPDuIfncIgeVukEMLbWA7jZGE8/ek4gI8Ytl7MUgsEHDbsXC0T5MGd37hoySF1AdL
	8CKmyzFxXDvAecF0Xqw/pAPamXA3zbhNXEy1Ut+pRqhcJNvL4g1L7zvU20brFVbj7EZQvq
	WksWOkrgtp10x6l30LjfFqpecwUWMfQ=
Received: from mail-pl1-f199.google.com (mail-pl1-f199.google.com
 [209.85.214.199]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.3, cipher=TLS_AES_256_GCM_SHA384) id
 us-mta-393-u0pvTh7lO5u-rgy6OQvb2A-1; Wed, 01 Apr 2026 21:50:21 -0400
X-MC-Unique: u0pvTh7lO5u-rgy6OQvb2A-1
X-Mimecast-MFC-AGG-ID: u0pvTh7lO5u-rgy6OQvb2A_1775094620
Received: by mail-pl1-f199.google.com with SMTP id d9443c01a7336-2b24305cb3cso3105155ad.2
        for <devicetree@vger.kernel.org>; Wed, 01 Apr 2026 18:50:21 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=redhat.com; s=google; t=1775094620; x=1775699420; darn=vger.kernel.org;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:from:to:cc:subject:date:message-id:reply-to;
        bh=uUiSeqS9PkkLaNVQ/zvAdXBaf2XPU2fS5cvEfFpiuvg=;
        b=Tlo90BzJMjYLhTlZAd26UUmCe25FeUoIJxCiaBwoCzZ6W0V3tygen9hNzz5jF9/vns
         LAOsWC2H0xBu7s9a+7JY3T/8RqQqa5/fX8zhaDSnIvvZDV+U/Gqw5XHPwuUXyc53TiJ2
         wYuIuCPN1MUECulBFqS+wR/P9+oOPkTAz9d5wsjoIyr+SgIu0K3RG4Eej41MQK2yU2Yv
         gprLZzYato66BdbHdlK9kUJpZBOnLPSBWmMUFn2XqzKj2xVaxX6fg2tneeF/PlPoiSXB
         atqz5J24wJwVUgAaVUmj1uBf4nOX1qzveDZdsaG3o54rlQbuC35s4v7DzVNkBEJXXf//
         NtHQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1775094620; x=1775699420;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:x-gm-gg:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=uUiSeqS9PkkLaNVQ/zvAdXBaf2XPU2fS5cvEfFpiuvg=;
        b=H+Lf44mhvT4Awk/ErX4HiCOx5Ir9Uzi9qwOpFi7PggcI916WxjY9A33HtSiGoay30P
         RziMQRQvD7yDkwkoRcC787vMJnP9wlflXt44/7OEsKHbpUxDqLaC2zjLf64905RXHbfb
         TZBvR9dmT1m+wdz3Kww5ibLRK2Szg/01rQ2KvGdS4dAY25nWwY2JUBdW2KcU+oLvGgVT
         ECADeoatrp+Rwe7qnj6WzksZ9jq4yZgmfSXKxxfB9NUoIn57/vQirYyH23pCM2iD7sYt
         Ugicnb6e55yABuSkqKTzZY5pV0vYeXi+BMjYhCQfs2L3c/u915TR5CiFYD0TRZ6HgV5n
         Re/A==
X-Forwarded-Encrypted: i=1; AJvYcCUl01QJ4hny8SLicENEsLfar/hfPEghZ3O/wXUtEg0Q4kQo5U+ldSeJIngt+DyZDvgT8x3qsotr5YJl@vger.kernel.org
X-Gm-Message-State: AOJu0Yz9XmRPApVwkYjgnr47uZQMS4/qGBazzs6tf8w645tml7w9nZVH
	Zl/aWzNfsQCO2JpuhLR39Z9u5E7tuV0p8gwawJ1bKao9I1v3hYkTrt6HkPy2tJE/IN3IKS0pAe6
	niCSZavGHXBz3At7OsXlZaNEAUwSEQcEhNviOWzlzjwN5rPtwShpFa/FbaNGToEI=
X-Gm-Gg: ATEYQzx1xlTbwETeWoPeQAXTsYTNvKJDPkB1z1V9gJ89UqzQH3zHQ48YWtbrX1MuZo5
	uHi4nlKqSKXlKAGHoAmtJeHNeLfpsEXkeSJc6uFjasyqHEJnTt6L+LtR/hyBTAnlrwiaDE5IitY
	rqrbajxfBpfZlEjpZHlKH5kFmlsJGgs2IlGD6kMlA4tVD+JNT1GnUmTv37y15ns8yQTMkOb02B3
	p2TVrxQMrbDReqFevmKx5HIE01mWGfvkpQLHJ4kKm9NKODb1QRgYQaPi+B3xktCj0H07/Xg+CxL
	+8Lp8mUy5EbNg8eHKWCo+E+Ez44cXBLjvt2YC7+BHafZm7l1h2DzF3JwtpMf38FmD6BOp5zs/3j
	20Hio+CES0w==
X-Received: by 2002:a17:903:2282:b0:2b2:49a7:a5bc with SMTP id d9443c01a7336-2b269caa786mr54155335ad.39.1775094620316;
        Wed, 01 Apr 2026 18:50:20 -0700 (PDT)
X-Received: by 2002:a17:903:2282:b0:2b2:49a7:a5bc with SMTP id d9443c01a7336-2b269caa786mr54155025ad.39.1775094619683;
        Wed, 01 Apr 2026 18:50:19 -0700 (PDT)
Received: from localhost ([49.65.225.51])
        by smtp.gmail.com with ESMTPSA id d9443c01a7336-2b2749cbd9fsm9680585ad.75.2026.04.01.18.50.18
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 01 Apr 2026 18:50:19 -0700 (PDT)
Date: Thu, 2 Apr 2026 09:46:37 +0800
From: Coiby Xu <coxu@redhat.com>
To: Baoquan He <bhe@redhat.com>
Cc: kexec@lists.infradead.org, linux-arm-kernel@lists.infradead.org, 
	linuxppc-dev@lists.ozlabs.org, devicetree@vger.kernel.org, Will Deacon <will@kernel.org>, 
	Thomas Gleixner <tglx@kernel.org>, Ingo Molnar <mingo@redhat.com>, Borislav Petkov <bp@alien8.de>, 
	Dave Hansen <dave.hansen@linux.intel.com>, 
	"maintainer:X86 ARCHITECTURE (32-BIT AND 64-BIT)" <x86@kernel.org>, "H. Peter Anvin" <hpa@zytor.com>, 
	Andrew Morton <akpm@linux-foundation.org>, Vivek Goyal <vgoyal@redhat.com>, Dave Young <dyoung@redhat.com>, 
	"open list:X86 ARCHITECTURE (32-BIT AND 64-BIT)" <linux-kernel@vger.kernel.org>
Subject: Re: [PATCH v5 1/3] crash_dump/dm-crypt: Don't print in arch-specific
 code
Message-ID: <ac3J_pWwyUNOy034@Rk>
References: <20260225060347.718905-1-coxu@redhat.com>
 <20260225060347.718905-2-coxu@redhat.com>
 <actzxO1p6OlmK2gp@fedora>
Precedence: bulk
X-Mailing-List: devicetree@vger.kernel.org
List-Id: <devicetree.vger.kernel.org>
List-Subscribe: <mailto:devicetree+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:devicetree+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii; format=flowed
Content-Disposition: inline
In-Reply-To: <actzxO1p6OlmK2gp@fedora>

On Tue, Mar 31, 2026 at 03:12:04PM +0800, Baoquan He wrote:
>On 02/25/26 at 02:03pm, Coiby Xu wrote:
>> When the vmcore dumping target is not a LUKS-encrypted target, it's
>> expected that there is no dm-crypt key thus no need to return -ENOENT.
>> Also print more logs in crash_load_dm_crypt_keys. The benefit is
>> arch-specific code can be more succinct.
>>
>> Suggested-by: Will Deacon <will@kernel.org>
>> Signed-off-by: Coiby Xu <coxu@redhat.com>
>> ---
>>  arch/x86/kernel/kexec-bzimage64.c | 6 +-----
>>  kernel/crash_dump_dm_crypt.c      | 7 +++++--
>>  2 files changed, 6 insertions(+), 7 deletions(-)
>
>Acked-by: Baoquan He <bhe@redhat.com>

Thank Baoquan for ack'ing the kexec/kdump part of this patch set!

-- 
Best regards,
Coiby

