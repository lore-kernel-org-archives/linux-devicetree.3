Received: from mail-pg1-f195.google.com (mail-pg1-f195.google.com [209.85.215.195])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id A2D5F318EE7
	for <devicetree@vger.kernel.org>; Tue,  2 Jun 2026 01:37:44 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.215.195
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1780364266; cv=none; b=Z35nJ/wEs/+h6NXY6+3sxDExTq74EhZBRFt61nsTzES4Qflo+6P2d0zwB3zMy8y2u5VWIEXcfrtyJXZjuTwmzFE/v+oAgyCveD/RKL0omTwpiNXPoTzcUy5M5FAVslegWz9vTjaeHiQyOM+PVCkIxdOeIqWEpTAjXBlKLCydLcs=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1780364266; c=relaxed/simple;
	bh=Dy7BvBhhUq9u15IyyukciyKL2tHV5vQLjsFCazrSQA8=;
	h=Message-ID:Date:MIME-Version:Subject:To:Cc:References:From:
	 In-Reply-To:Content-Type; b=G+YNrmtqQ9BH44sOjvdkWxHahG0GlcIIO9JtakcrBRRcPKw50tRgIwBaK+8of/BaqZYD6HVqOtxf7UMI6/J2r6otMXPUJVOrEueVaC4KPjoNItXklNiXjBj/S03zp+DoVNiwKH8h7TnQlid7YPdrXTxOg8GZh30RQ+xoPvnNuhg=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=bkfLBKk/; arc=none smtp.client-ip=209.85.215.195
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="bkfLBKk/"
Received: by mail-pg1-f195.google.com with SMTP id 41be03b00d2f7-c8588f8fef3so946974a12.0
        for <devicetree@vger.kernel.org>; Mon, 01 Jun 2026 18:37:44 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1780364264; x=1780969064; darn=vger.kernel.org;
        h=content-transfer-encoding:in-reply-to:from:content-language
         :references:cc:to:subject:user-agent:mime-version:date:message-id
         :from:to:cc:subject:date:message-id:reply-to;
        bh=Dy7BvBhhUq9u15IyyukciyKL2tHV5vQLjsFCazrSQA8=;
        b=bkfLBKk/3GeO7myJu+Hc5jK+lz1oebxMS3VfU6CkPMAVRsaKGDSSoGeUZIzuNRH1hW
         dg4PcEWapZxydoJecXeKXHKTAedhAyO3ujYFJvsC62L+jutoajQNk0gUMWYyVtS7vUpR
         0YupMZtjOwgO7Z1j1SlqZhIMAvAUBRhBd+83uKQuLNVyclVrO735McwfU2tnGrMq1/R0
         Pu+NVVgmeuPUXR0nt1fBBzzSPJbFFQKTPUsdsEKU1LNcGAU/skcplFp7Ko1YjKMMZGHz
         u2pzwoC4DgOYuc9PI7cj2WzstpVI/3Lpbe+1Ud9FrXKsxuCHpmowpyMgln2fS5ndyKq8
         vKDg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1780364264; x=1780969064;
        h=content-transfer-encoding:in-reply-to:from:content-language
         :references:cc:to:subject:user-agent:mime-version:date:message-id
         :x-gm-gg:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=Dy7BvBhhUq9u15IyyukciyKL2tHV5vQLjsFCazrSQA8=;
        b=TS62oUvFoMUCIOBxQ9YelCOTx4luX2AVI1+uF8+7SmTfJZVr8tMpkrAU38oeFhHX4U
         NiudCf3P1FG8PnDyOlXyfVRG1NTfTypzw5Ae5d+k7uGdCjG+IgSN0qoTgaOUKE2UmBhW
         GZkRnWcISWddKZgWz+e7/2su+PpDuKaWTSOVuVHmbglWB++k3TeQwQXntteUPi2v3TjV
         woNmUJfAIDUIAwgxKnf8ySoGaUVt922iF+kKeSe/6pr9HgKstquhxjDQHplGrzun2KRH
         DDvActKbnjAjK9YCWEwTvdgngr4jjEx3q8dQBzACLAPQBZAAoqdO2f8gXIz95prKS/vF
         EGEw==
X-Forwarded-Encrypted: i=1; AFNElJ/RpH9n0YSOvev3lV/GW+PkexegT71ZU+/xWKC+MoX/FA9dpVx4gvMw8963mNqhc4sFHWpAqzSdtIqu@vger.kernel.org
X-Gm-Message-State: AOJu0YzEMNDwySSoA188XxzVn3SGNScPMcmW7+4dXftK1DjheTDMP6R2
	cQJSMfgjajPKhwx/kyPWd/6ln6PWB+9Rk08i7YSINxJUjwKbjiAZ2zaJ
X-Gm-Gg: Acq92OFuh9tNAgCf16xaEnkdT5Ap87Zf63hXJ5R+qfTW+qhaUlsjVYVQlQfkAUJbPIT
	7Z7UDgrUvfpzfz//Nu6FC0KxNMZFNngBhWovPnckFHspwNOx0gQJQRFcTZnFYJAHWNUDhFSj0iK
	tZ9ez7DkNRn6ANY/4coomFIhDOWgzSY5LwNdqRiXyW5HIeIrvoZ+YGyGF81r9xCTIuFP8Iidd3h
	jTA1/F0CQE03a9zbcP5f85cFvPaYEl5Rnheb0q9vjAqPQcaX20RYUxVZmxK696WwJD1fA+liBKV
	NsdK8bKSiLD4elvXQogjr7CmRkAbME81RfrwqvvFIoi3BohTQMLyTDIPrHhBNGKrsd6imO5CTtr
	IiPHcRQ0wBU+Z0PUtrejZU5AL7fGgmQU8giSJHhRQWggIMTwRa79H3H9rGTvO5d08YNz3rVKGaU
	5DqDBic3STRfbuKGUsw5vq1y8P7gaqDl2Uv3bRJ905KA==
X-Received: by 2002:a05:6a20:1c8f:b0:39b:8dcb:f37d with SMTP id adf61e73a8af0-3b427eb0f6cmr14435155637.17.1780364263853;
        Mon, 01 Jun 2026 18:37:43 -0700 (PDT)
Received: from [10.125.112.20] ([210.184.73.204])
        by smtp.gmail.com with ESMTPSA id 41be03b00d2f7-c859391cbe9sm7626534a12.25.2026.06.01.18.37.38
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Mon, 01 Jun 2026 18:37:41 -0700 (PDT)
Message-ID: <d0bac535-99ad-42e7-8ae2-6bf4e93b2450@gmail.com>
Date: Tue, 2 Jun 2026 09:37:35 +0800
Precedence: bulk
X-Mailing-List: devicetree@vger.kernel.org
List-Id: <devicetree.vger.kernel.org>
List-Subscribe: <mailto:devicetree+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:devicetree+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v2 1/3] of: reserved_mem: avoid unnecessary memory
 allocation when __reserved_mem_check_root() fails
To: Rob Herring <robh@kernel.org>
Cc: Krzysztof Kozlowski <krzk@kernel.org>, devicetree@vger.kernel.org,
 linux-kernel@vger.kernel.org, zhaomeijing@lixiang.com, saravanak@kernel.org
References: <20260519082427.4181476-1-chenwandun@lixiang.com>
 <20260519082427.4181476-2-chenwandun@lixiang.com>
 <20260520-cuddly-imperial-bison-ec3c4e@quoll>
 <0dd4546a-6133-4493-a911-41c35ec42c15@gmail.com>
 <20260601230649.GA154030-robh@kernel.org>
Content-Language: en-US
From: Wandun <chenwandun1@gmail.com>
In-Reply-To: <20260601230649.GA154030-robh@kernel.org>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit



On 6/2/26 07:06, Rob Herring wrote:
> On Wed, May 20, 2026 at 04:16:23PM +0800, Wandun wrote:
>>
>> On 5/20/26 15:44, Krzysztof Kozlowski wrote:
>>> On Tue, May 19, 2026 at 04:24:25PM +0800, Wandun Chen wrote:
>>>> total_reserved_mem_cnt will keep the init value (MAX_RESERVED_REGIONS)
>>>> in fdt_scan_reserved_mem() if __reserved_mem_check_root() fails.
>>>>
>>>> fdt_scan_reserved_mem_late() calls alloc_reserved_mem_array() to
>>>> allocate memory according to total_reserved_mem_cnt before
>>>> __reserved_mem_check_root(), so if __reserved_mem_check_root() fails,
>>>> the allocated array has nowhere to be used, so no need to allocate
>>>> memory.
>>>>
>>>> Move alloc_reserved_mem_array() after __reserved_mem_check_root() to
>>>> avoid potential memory waste.
>>>>
>>>> Signed-off-by: Wandun Chen <chenwandun@lixiang.com>
>>> Authorship/DCO mismatch.
>> Hi Krzysztof,
>>
>> Thanks for your review.
>> Sorry for the mismatch. Dueto my company email server's issues with
>> community mailing lists, I sent the patch via my personal email.
>> I will add the correct 'From:' header and send a v3 patch shortly.
> There is also the 'b4 relay' that can be used for this kind of issue.
I wasn't aware of 'b4 relay' before, this is really helpful.
Thanks for the tip!

Best regards,
Wandun
>
> Rob

