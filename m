Received: from us-smtp-delivery-124.mimecast.com (us-smtp-delivery-124.mimecast.com [170.10.133.124])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 4E5211DF74F
	for <devicetree@vger.kernel.org>; Thu,  2 Apr 2026 01:50:20 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=170.10.133.124
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1775094621; cv=none; b=W/2bRIwz8E9YBXWOFimwTbeTtWNVcK0QLuDvIqeUHCa26TFnJ5/j3esYUA2/Dko+b2gae9QGVYh6hUPnRz0TNURYTLnSOLoRGodzdSXXg9cPdsoYsrZ2hN/phWD0N44ZjlIklfql09Ho28892HzGUEc3k5fdgGwApXnzF1eUkTQ=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1775094621; c=relaxed/simple;
	bh=g4wQSCgTn4wGzfzbGq60rzFuQw414X+HmY78CfyMDok=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=b9tODBKlX94Pt07TY9MD+RkeojC5vT9W/8iQtM3ca2e2WCLzB0dC0dTN6pZopL5IQsHtUv1q7Rw38/M2mARty8cIrdZbsMhzE8p23uIuqrg9oMOXOpYZ80E8Fq0Ijk2EijT1pT6OwqOQqTJO8gzcu3ph0eQYMgSfbqvGP5N0uNY=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=redhat.com; spf=pass smtp.mailfrom=redhat.com; dkim=pass (1024-bit key) header.d=redhat.com header.i=@redhat.com header.b=QRYuD1Pj; dkim=pass (2048-bit key) header.d=redhat.com header.i=@redhat.com header.b=hwMZh9CD; arc=none smtp.client-ip=170.10.133.124
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=redhat.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=redhat.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=redhat.com header.i=@redhat.com header.b="QRYuD1Pj";
	dkim=pass (2048-bit key) header.d=redhat.com header.i=@redhat.com header.b="hwMZh9CD"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
	s=mimecast20190719; t=1775094619;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references;
	bh=4rWHn8ZLLaNhlcOKvyDiXP9A00oZt/Dbtw9Zn8GCrdY=;
	b=QRYuD1PjaTGfm1RgxgNF3yncJKd7G9fjQMcHzZ3mhWWsRKqCGnOet8KvmN1ugfiUIVcDwn
	mV1IfflBrnGeQTVVMASWKIt5fyTqXqqcjNi0y8gBEKXA5GZngh4TYiGGRp/0HKvewn9Yix
	HfyMc5UbfcIrO/lAVx2mp7SAVz/CLug=
Received: from mail-pj1-f72.google.com (mail-pj1-f72.google.com
 [209.85.216.72]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.3, cipher=TLS_AES_256_GCM_SHA384) id
 us-mta-522-p7BMasMSPo-pfTRKX15sRg-1; Wed, 01 Apr 2026 21:50:18 -0400
X-MC-Unique: p7BMasMSPo-pfTRKX15sRg-1
X-Mimecast-MFC-AGG-ID: p7BMasMSPo-pfTRKX15sRg_1775094617
Received: by mail-pj1-f72.google.com with SMTP id 98e67ed59e1d1-3595485abbbso299091a91.2
        for <devicetree@vger.kernel.org>; Wed, 01 Apr 2026 18:50:18 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=redhat.com; s=google; t=1775094617; x=1775699417; darn=vger.kernel.org;
        h=in-reply-to:content-transfer-encoding:content-disposition
         :mime-version:references:message-id:subject:cc:to:from:date:from:to
         :cc:subject:date:message-id:reply-to;
        bh=4rWHn8ZLLaNhlcOKvyDiXP9A00oZt/Dbtw9Zn8GCrdY=;
        b=hwMZh9CDMPYrDEdLFqqpuz8D3AO9XWwOESkO2uRFlETBAswGgDlkKkRNj7AnZlDhP/
         MWXKNx6uNLWbrol3QwBf49kdmURSAS90WiL+kaSuBVO/FzQP/QmQZy/DdVHDmOuMUzgV
         QuXLovsbiAp5hnpwGjVloxBfr3T46zSOFVxbWyLHdgNzQNbzNdYsJjQgFFGHeZqbo8qK
         /wiviy8Mv6Bjy27xZWks+422AzApy/bLntGP9Ui6YJMWlqkgzQZR+qyTWTmSfw9f7vtU
         cswhC1Q6/oI9ddNT1fMB+ImiCoYo4ma7B94sNyQ0DC2Z74ZUmOVZ9pDonmklqhZMPzxj
         NAJQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1775094617; x=1775699417;
        h=in-reply-to:content-transfer-encoding:content-disposition
         :mime-version:references:message-id:subject:cc:to:from:date:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=4rWHn8ZLLaNhlcOKvyDiXP9A00oZt/Dbtw9Zn8GCrdY=;
        b=A8zdakWMfyHCTXpmMcqUJFsaQsEnYucON1HaoUF01TYkCbhvjkfodvdBN5FVkAjpyB
         kRleafQi62XxjZieFfH1DpzUne3VbEM5WM8wL71QLUTKTtdS6//EGbM1D2ht8e7FPKaL
         XZdtDW5g4AreFbsjyZekuhL5aHqqG3drTrLIhR1MJdx1/CD4PGGEXYTd9rYlX38E4cS4
         8AUrJ6nAek8LW1/vUlY+NjJT8cCs6xSN2fLlmKvF2BudpXqC8f5JCNuuHaGX0tlHT7ou
         RRrSmHmxo2KwYLgbubsGzYjH154iJIrOwi48sM5KEmQYnEa4lL3J7ni5n9W7Fk7U+J2F
         27ug==
X-Forwarded-Encrypted: i=1; AJvYcCVcdR3vJyqTpKVarKu5t4gA7NkjG/LMx5jA/mwad+ZZnCFRl4Ak3etw39HmBHvubPN890M0puXjXgXW@vger.kernel.org
X-Gm-Message-State: AOJu0YyUtkE/zjMBYsbDxG0tUgaHC58NTXOyJkKwcUG/ur2LrcGst86q
	gENuZzMCfEgVJSV9eYKLIvdkz0x+9KVsyfbYGsyWW3SxVdnnmoes9CvWWiEDCNhgnC3i7GFY1e9
	SiBq2/I8DDw5S6XhieW9QcjxOI61qJfqC6+9gm3yb3XNdk+2Zt881oObEPIXkEHc=
X-Gm-Gg: ATEYQzyDcs/+XDoPfAMw3VPKFOyBi/xVPguHFT1zikOrSJSkbfinaBqOjcJ8zJIAhC1
	p/tJamVHIwpkG5P6W90skysYxaqADwrGtX2LD2hT+hVvVZBEQVTbXduFA/87voNkW2fnBY64VJH
	yltxZdconOUIskrkKs5+xaricKwUwz4p2tCi+CuSKh5ITmxzfiHWQLyy8IDerh/jf+89fFegvKb
	bSlDjCvlN0Lzja0w0p+wc9sLp8Pj0ZiXN6EhSeApNJx0U3iusNlRftDM4IEzAB8ehZpHHsE5HV2
	lobusZioNQYmErljFrBZEx1hhqi9WbuACi/e8jhUKWhKoKUKFzPobCEfSnCm57BAgWd0biu628H
	O5mZahMBV5Q==
X-Received: by 2002:a17:90a:d406:b0:35d:a843:6b1f with SMTP id 98e67ed59e1d1-35dc6e5f016mr5377536a91.11.1775094616927;
        Wed, 01 Apr 2026 18:50:16 -0700 (PDT)
X-Received: by 2002:a17:90a:d406:b0:35d:a843:6b1f with SMTP id 98e67ed59e1d1-35dc6e5f016mr5377491a91.11.1775094616366;
        Wed, 01 Apr 2026 18:50:16 -0700 (PDT)
Received: from localhost ([49.65.225.51])
        by smtp.gmail.com with ESMTPSA id 98e67ed59e1d1-35dbe95abc3sm6806610a91.15.2026.04.01.18.50.14
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 01 Apr 2026 18:50:15 -0700 (PDT)
Date: Thu, 2 Apr 2026 09:44:21 +0800
From: Coiby Xu <coxu@redhat.com>
To: Rob Herring <robh@kernel.org>
Cc: kexec@lists.infradead.org, linux-arm-kernel@lists.infradead.org, 
	linuxppc-dev@lists.ozlabs.org, devicetree@vger.kernel.org, 
	Arnaud Lefebvre <arnaud.lefebvre@clever-cloud.com>, Baoquan he <bhe@redhat.com>, Dave Young <dyoung@redhat.com>, 
	Kairui Song <ryncsn@gmail.com>, Pingfan Liu <kernelfans@gmail.com>, 
	Andrew Morton <akpm@linux-foundation.org>, Krzysztof Kozlowski <krzk@kernel.org>, 
	Thomas Staudt <tstaudt@de.ibm.com>, Sourabh Jain <sourabhjain@linux.ibm.com>, 
	Will Deacon <will@kernel.org>, "Christophe Leroy (CS GROUP)" <chleroy@kernel.org>, 
	Catalin Marinas <catalin.marinas@arm.com>, Madhavan Srinivasan <maddy@linux.ibm.com>, 
	Michael Ellerman <mpe@ellerman.id.au>, Nicholas Piggin <npiggin@gmail.com>, 
	Saravana Kannan <saravanak@kernel.org>, open list <linux-kernel@vger.kernel.org>
Subject: Re: [PATCH v5 3/3] arm64,ppc64le/kdump: pass dm-crypt keys to kdump
 kernel
Message-ID: <ac3Hac2RmY2Jahxt@Rk>
References: <20260225060347.718905-1-coxu@redhat.com>
 <20260225060347.718905-4-coxu@redhat.com>
 <CAL_Jsq+0w2hGN=Loy=ucHbZcdnn+ty3x9qS4WVX0Vj+g19tfpg@mail.gmail.com>
Precedence: bulk
X-Mailing-List: devicetree@vger.kernel.org
List-Id: <devicetree.vger.kernel.org>
List-Subscribe: <mailto:devicetree+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:devicetree+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8; format=flowed
Content-Disposition: inline
Content-Transfer-Encoding: 8bit
In-Reply-To: <CAL_Jsq+0w2hGN=Loy=ucHbZcdnn+ty3x9qS4WVX0Vj+g19tfpg@mail.gmail.com>

On Mon, Mar 30, 2026 at 06:44:15AM -0500, Rob Herring wrote:
>On Wed, Feb 25, 2026 at 12:04 AM Coiby Xu <coxu@redhat.com> wrote:
>>
>> CONFIG_CRASH_DM_CRYPT has been introduced to support LUKS-encrypted
>> device dump target by addressing two challenges [1],
>>  - Kdump kernel may not be able to decrypt the LUKS partition. For some
>>    machines, a system administrator may not have a chance to enter the
>>    password to decrypt the device in kdump initramfs after the 1st kernel
>>    crashes
>>
>>  - LUKS2 by default use the memory-hard Argon2 key derivation function
>>    which is quite memory-consuming compared to the limited memory reserved
>>    for kdump.
>>
>> To also enable this feature for ARM64 and PowerPC, the missing piece is
>> to let the kdump kernel know where to find the dm-crypt keys which are
>> randomly stored in memory reserved for kdump. Introduce a new device
>> tree property dmcryptkeys [2] as similar to elfcorehdr to pass the
>> memory address of the stored info of dm-crypt keys to the kdump kernel.
>> Since this property is only needed by the kdump kernel, it won't be
>> exposed to user space.
>>
>> [1] https://lore.kernel.org/all/20250502011246.99238-1-coxu@redhat.com/
>> [2] https://github.com/devicetree-org/dt-schema/pull/181
>>
>> Cc: Arnaud Lefebvre <arnaud.lefebvre@clever-cloud.com>
>> Cc: Baoquan he <bhe@redhat.com>
>> Cc: Dave Young <dyoung@redhat.com>
>> Cc: Kairui Song <ryncsn@gmail.com>
>> Cc: Pingfan Liu <kernelfans@gmail.com>
>> Cc: Andrew Morton <akpm@linux-foundation.org>
>> Cc: Krzysztof Kozlowski <krzk@kernel.org>
>> Cc: Rob Herring <robh@kernel.org>
>> Cc: Thomas Staudt <tstaudt@de.ibm.com>
>> Cc: Sourabh Jain <sourabhjain@linux.ibm.com>
>> Cc: Will Deacon <will@kernel.org>
>> Cc: Christophe Leroy (CS GROUP) <chleroy@kernel.org>
>> Signed-off-by: Coiby Xu <coxu@redhat.com>
>> ---
>>  arch/arm64/kernel/machine_kexec_file.c |  4 ++++
>>  arch/powerpc/kexec/elf_64.c            |  4 ++++
>>  drivers/of/fdt.c                       | 21 +++++++++++++++++++++
>>  drivers/of/kexec.c                     | 19 +++++++++++++++++++
>>  4 files changed, 48 insertions(+)
>
>Acked-by: Rob Herring (Arm) <robh@kernel.org>

Hi Rob,

Thanks for acknowledging this device tree patch and also merging the
dt-schema PR!

-- 
Best regards,
Coiby

