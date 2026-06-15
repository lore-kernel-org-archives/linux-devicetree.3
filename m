Received: from mail-pg1-f195.google.com (mail-pg1-f195.google.com [209.85.215.195])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 743041991CB
	for <devicetree@vger.kernel.org>; Mon, 15 Jun 2026 03:33:57 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.215.195
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1781494438; cv=none; b=XAW3Tm5m7VBfBkm65Ua204E9DQD2k4VPv5bkhjMsbt1mH+cBzGAllDh0Hb9DzzDmRHmFKBXxgAytnyDx3r3Q5iPqXBU5GYW98oJJt/e+TyajBnMdV4dlrXnRAGKRtB5qRte66a/5voHwHEIOp6tbYW+VcY424rKrmkRd2FmNASk=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1781494438; c=relaxed/simple;
	bh=7CYnTAuVR8rZg2/zzNHVJX1whHtFmlFtEUUksdZQ1Ds=;
	h=Message-ID:Date:MIME-Version:Subject:To:Cc:References:From:
	 In-Reply-To:Content-Type; b=H2RWGMXaKsi+cRlDS8o2M/vzQ/m8NS0HCY6Ltxau9t/uxVA8QdW0ltGXBdqUEd6kc5i2H4jqVjKz/Ogbn0R1QDZq4T/46dhDRtM05Fx93MrS/VUg+jTfIH/miHolrIMvykDbodeCNPUTOXqeKF4oPdHkx0bc3qyb7UzeV/fSawo=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=O50y6H8J; arc=none smtp.client-ip=209.85.215.195
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="O50y6H8J"
Received: by mail-pg1-f195.google.com with SMTP id 41be03b00d2f7-c859a374903so682927a12.3
        for <devicetree@vger.kernel.org>; Sun, 14 Jun 2026 20:33:57 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1781494437; x=1782099237; darn=vger.kernel.org;
        h=content-transfer-encoding:in-reply-to:from:content-language
         :references:cc:to:subject:user-agent:mime-version:date:message-id
         :from:to:cc:subject:date:message-id:reply-to;
        bh=4N4VN4U8dWKYBPdGLpmGB0dN8xMC6v/gON67oih3Zak=;
        b=O50y6H8J6c4qWl6eVw1XNtHsT9ahZ0OIDDwECLSdjSt/CU1FH7WR9IH9YkyYhHHM0q
         S/0W2JckPF9EROW8XBBpnsZzxQZ7Wevoe8Ot95rszy0pkCdA4PylTJ8EASTafppy4lSO
         2ZwAmAgZsoGqk3HGdvEY8eJeTIlbrw7RH5vO7OR8FSUyrOUqMoRim0zgfLm6EWpeyfY+
         p8QrKNU98vTvMmJtN+NLYYULd8fhymD7YGqnvbmZyouPdWBOZ98MSVcUTl0rAXVtwmMs
         kynPQRD/ZSaQphYp6pya83KEjhY3VAAIFz+QLA3CYg/nMLws30qKGcOkIw8sYznVLtgd
         j/1A==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1781494437; x=1782099237;
        h=content-transfer-encoding:in-reply-to:from:content-language
         :references:cc:to:subject:user-agent:mime-version:date:message-id
         :x-gm-gg:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=4N4VN4U8dWKYBPdGLpmGB0dN8xMC6v/gON67oih3Zak=;
        b=fdQZe1JQzSeYgo0YWQo4Ag7GIgYm5KaPjZ7iZzeqKm68ykdrupwywgYS9UdRKpGZ5N
         cvZWGZyzqo8wFQn45uEAnQFkBbXojykhH0KfmxBbC+ehY+A8YdK/Cxs6I/0IblUuSBtV
         8ydPi9+gBFuzBzx0PlTsYe7JU+wRR9CqmI3NMEzeg6Pc84IQiiR0p9jYldp/C9eUfHn2
         9yKMKaBesyq6NWvvPw1Rfz1fJQZpxgDDojw8AVnhZIwK7xg6+tWTUtIFLuMVlEqgC7lL
         z6gleD0S2GoX8h6zM7kq9JsESdmnSP5GRH9DG38lqW5GOFGW/sJnHvdKMqEoGJstRz+6
         00Fg==
X-Forwarded-Encrypted: i=1; AFNElJ9j07Xez3cqrBW8LeCe4Bi7Z8212tQhRhdAz22HIufl5uffMJEhD/Dm7SC5uLFekDpczbXj+r3Ki1ku@vger.kernel.org
X-Gm-Message-State: AOJu0Yy3UVYpO/8wExyNzBgSFzBD+X6ZthFHpbNhdCrzhYE9z1lqzYIv
	YdYAWoTDes2KjVuaBZh18DADf9UZz+OaC/vIJi0WUar2SwL03rtJJqkb
X-Gm-Gg: Acq92OHeWtWFagM0Z1qnwaGY7I818l5YaaNpKQXzUPsxfeFtHX5M+sEb24DkSA2Sd1r
	RaPZHHsoqmQS1+c/srK3zvR+KKfwcns1xNXSJTsVETSAKPOFIH3OBOWF8xnJbvju1CeMMOcNDbP
	WC/fIfiEIxqPJa8QlBE7wfqU74Jypwgq2vbIbmgXRdTPDl1JFOkH1t0fE7Ohas10Yq3DHWtQWt6
	TAalPJiLyxOmJn32GVXOimx3BRACVKkCr+t23TK0nlT8k6Zg714luoHTHIK63U7Tn1jiuxx6XsC
	Yl1bqQwfLGVqp+NL15C7IWve/q+wyFd2biLHCKDVLGSUpY4egfrLjzto8/5p3GF3a8ekdKtw7GN
	crYzuosWudrTZ9K9Y2QKQibEhP/PTjoQLudlR/vcNA29ObLzm/psNu9BZ1riAiAcfEUdavh9yUe
	F7NyUv/RM3Quvvsd4B1KZ8YfPEF7kaGz2GRrb1xg2RnA==
X-Received: by 2002:a05:6a21:6813:b0:3a2:d629:16a2 with SMTP id adf61e73a8af0-3b783b757e9mr14493609637.10.1781494436758;
        Sun, 14 Jun 2026 20:33:56 -0700 (PDT)
Received: from [10.125.112.20] ([210.184.73.204])
        by smtp.gmail.com with ESMTPSA id d2e1a72fcca58-8434b035ce6sm8650381b3a.49.2026.06.14.20.33.38
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Sun, 14 Jun 2026 20:33:56 -0700 (PDT)
Message-ID: <894d7c33-8e14-4ba5-b774-14062ece39f2@gmail.com>
Date: Mon, 15 Jun 2026 11:33:34 +0800
Precedence: bulk
X-Mailing-List: devicetree@vger.kernel.org
List-Id: <devicetree.vger.kernel.org>
List-Subscribe: <mailto:devicetree+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:devicetree+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v3 05/11] of: reserved_mem: split
 alloc_reserved_mem_array() from fdt_scan_reserved_mem_late()
To: Rob Herring <robh@kernel.org>
Cc: linux-arm-kernel@lists.infradead.org, linux-kernel@vger.kernel.org,
 loongarch@lists.linux.dev, linux-riscv@lists.infradead.org,
 devicetree@vger.kernel.org, kexec@lists.infradead.org,
 iommu@lists.linux.dev, zhaomeijing@lixiang.com, catalin.marinas@arm.com,
 will@kernel.org, chenhuacai@kernel.org, kernel@xen0n.name, pjw@kernel.org,
 palmer@dabbelt.com, aou@eecs.berkeley.edu, alex@ghiti.fr,
 saravanak@kernel.org, akpm@linux-foundation.org, bhe@redhat.com,
 rppt@kernel.org, pasha.tatashin@soleen.com, pratyush@kernel.org,
 ruirui.yang@linux.dev, m.szyprowski@samsung.com, robin.murphy@arm.com,
 quic_obabatun@quicinc.com
References: <20260527032917.3385849-1-chenwandun1@gmail.com>
 <20260527032917.3385849-6-chenwandun1@gmail.com>
 <20260612144122.GA974326-robh@kernel.org>
Content-Language: en-US
From: Wandun <chenwandun1@gmail.com>
In-Reply-To: <20260612144122.GA974326-robh@kernel.org>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit



On 6/12/26 22:41, Rob Herring wrote:
> On Wed, May 27, 2026 at 11:29:11AM +0800, Wandun Chen wrote:
>> From: Wandun Chen <chenwandun@lixiang.com>
>>
>> Prepare for storing /memreserve/ entries in the reserved_mem array.
>> alloc_reserved_mem_array is skipped if the device tree lacks a
>> /reserved-memory node, pointer 'reserved_mem' continues to reference
>> the reserved_mem_array which lives in __initdata, storing
>> /memreserve/ entries into reserved_mem_array would result in metadata
>> loss, and an out-of-bounds memory access will occur if the device
>> tree contains more than MAX_RESERVED_REGIONS /memreserve/ entries.
>>
>> So split alloc_reserved_mem_array() from fdt_scan_reserved_mem_late(),
>> and call alloc_reserved_mem_array() whether or not there is a
>> /reserved-memory node.
>>
>> No functional change.
>> The actual /memreserve/ population is added in a follow-up patch.
>>
>> Signed-off-by: Wandun Chen <chenwandun@lixiang.com>
>> ---
>>  drivers/of/fdt.c             | 7 +++++--
>>  drivers/of/of_private.h      | 1 +
>>  drivers/of/of_reserved_mem.c | 6 +-----
>>  3 files changed, 7 insertions(+), 7 deletions(-)
>>
>> diff --git a/drivers/of/fdt.c b/drivers/of/fdt.c
>> index 82f7327c59ea..83a2a474831e 100644
>> --- a/drivers/of/fdt.c
>> +++ b/drivers/of/fdt.c
>> @@ -1284,8 +1284,11 @@ void __init unflatten_device_tree(void)
>>  {
>>  	void *fdt = initial_boot_params;
>>  
>> -	/* Save the statically-placed regions in the reserved_mem array */
>> -	fdt_scan_reserved_mem_late();
>> +	/* Attempt dynamic allocation of a new reserved_mem array */
>> +	if (fdt && alloc_reserved_mem_array()) {
>> +		/* Save the statically-placed regions in the reserved_mem array */
>> +		fdt_scan_reserved_mem_late();
> 
> Can we make this just:
> 
> alloc_reserved_mem_array();
> fdt_scan_reserved_mem_late();
> 
> We already check !fdt in fdt_scan_reserved_mem_late().

Thanks for you review, Rob.

The reason I kept the fdt check is that total_reserved_mem_cnt is wrong
when fdt is NULL, early_init_fdt_scan_reserved_mem() returns early in
that case, so fdt_scan_reserved_mem() never runs, and
total_reserved_mem_cnt stays at MAX_RESERVED_REGIONS. Calling
alloc_reserved_mem_array() unconditionally would allocate unnecessarily
memory.

A better fix might be to make total_reserved_mem_cnt always correct, add
a !fdt check at the top of fdt_scan_reserved_mem() that sets
total_reserved_mem_cnt to 0, and let early_init_fdt_scan_reserved_mem()
call it even when initial_boot_params is NULL. Then
alloc_reserved_mem_array() could naturally skip allcation when that
count is 0, and we can drop the outer fdt guard.


There is still separate UAF issue (fixed in patch3) if we don't check
the return value of alloc_reserved_mem_array().


With the fdt_scan_reserved_mem() fix for total_reserved_mem_cnt, the
call site in unflatten_device_tree() becomes:

if (alloc_reserved_mem_array()) {
        fdt_scan_reserved_mem_late();
}

How does that sound?


Best regards,
Wandun

> 
> Rob

