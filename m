Received: from mail-pg1-f178.google.com (mail-pg1-f178.google.com [209.85.215.178])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 265182EEE94
	for <devicetree@vger.kernel.org>; Thu,  4 Jun 2026 23:33:21 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.215.178
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1780616003; cv=none; b=N8mJMRYdpgXW0+WCRZ1TrZ3FkUZMC9IFIc8gN912kOCDzYZzUtL75JKjiicX9dHRs2Ukmt5Pqkq0/tI8Jjiuo6hHOwR4/sFyIT9hE1Sz6iUK8QNJsBDJrkGyPxEoTzVhBqaxQUArXVLNhUh7XdN6Quj1+5wMUg+4FUKfapotOFw=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1780616003; c=relaxed/simple;
	bh=Lb+xLGteN8rGNFfXJPGYAlrX4zLjvvSOH8R+LOVRa9Q=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=sT2WDekeHji3yONIhOIG3HQrb7nIK7PmMU6fVW1TxtEtHM1DPB7JsTD4tp6dDInkWYD7M1KJxwIXxav16eiDh7LjJP0zNkV2gXn2RQewbIUPw23tKf2RhKsV1mqenZx9twGLXYskzcSgvS8PfWlZaAKaSI08ZyOGjQcTsmA5PVc=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=Wc7CO9e/; arc=none smtp.client-ip=209.85.215.178
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="Wc7CO9e/"
Received: by mail-pg1-f178.google.com with SMTP id 41be03b00d2f7-c858b392697so641122a12.3
        for <devicetree@vger.kernel.org>; Thu, 04 Jun 2026 16:33:21 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1780616001; x=1781220801; darn=vger.kernel.org;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:from:to:cc:subject:date:message-id:reply-to;
        bh=iGFlwyuNaR2/Raijzn5hJY/deT6FrQc+hecXmcS90Nw=;
        b=Wc7CO9e/1SVK/5UNc/UMJQQXwXKmIl1vdT8lkXps89RnnRKVLa8uUmXcU+CCljUSeZ
         iXj7nsWrdoiXLd4EbMObF4D0oEIXkv43lP1tHT8bEPlb61JdfqWW048iGhEAbwqCGGOy
         x26LUUlFQRwKUkwX8uVySXgRiC1r7nyfZpbdoFQpXtLGCyXfdG5eWxhRGgaJdkeXbKaP
         23u6OVCjSlzSTVFLtxWM0SIRN1RHcYopbDiH3rAfgk/6CQAtmBy/p/Ur21naCJxddy0G
         4nVnGBUjs/XJy1KjqmXYIYWGpQrLkB+l3vjuQ4gjIP1SvL/G6cQiBPzSha02F7yuZ5cD
         2ANQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1780616001; x=1781220801;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:x-gm-gg:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=iGFlwyuNaR2/Raijzn5hJY/deT6FrQc+hecXmcS90Nw=;
        b=ls05bC9uKmIOiNZ/sYWv2jZd87XmIbB5/GvdXbyjMgU+alKA3pRQUML49V2p8v8hoI
         Ere3TlfN9iGHUHy7nUaM70XtoT0twDTox1TqT7z8KfWAEWXsUB0renD1VoyRt7W791ch
         6PT22uJ963sECPB3h96Nm9N1VCnVbjVPTJCyehZYMXDqtT/75yLZwRuB/Cp4IhyjzNvo
         EtbUUXrYLxNZO7iGDfzhQXgBt7yWGfS4NhXfaeQGxHzfyoxCXCfbnCBbllrl5o+Gjtuc
         UR8DhmBmqncn4fsohddwa1bmUfGjFLZslO4HoDcQcdvkzv0+kOvlTW9uFjeNxrUmDaVV
         KRSg==
X-Forwarded-Encrypted: i=1; AFNElJ/uEKii55VzYEn5qYqYoJHiFo3Kq8SkRmg4+cM+3I8neAruvT9wZ5AzQVtBgzixswhTcNfIvoqW0CUK@vger.kernel.org
X-Gm-Message-State: AOJu0Yw7NvA0AgP+Cx8MjEf3731/b6SeB9Ev2sn1EJElnoFQCHYY68GO
	sce9L9xUW56QC75Vub9Yr7TlHMkOv151xFFYci1e8L3IZ30zxHKFqE35
X-Gm-Gg: Acq92OGmsr6qCWfATjVKet0OGZEro89LWA/0iuPmBWtz/bcSilv949KZ57rEVPxfTij
	hYWM2Mc8BTjn/7g/Gui1UTyvB6zRfs8pszUykAy2sIeKceLZb8X64YA7BdjutxAldnCCrAxO2EX
	qk8pSZEbk5ELK7O1nCmifPeSh4EY05y29lQSXcgjJcdHkl+b+vD9Zeqsxxij6n0atsmlUfBzJKE
	ZYYc4stW2aCFsbZpPxzoQrWDkSo2Dc60yP/8HbQjSuacs3KgpTR/doE2i18B67Pn9XmzQursZWu
	4rnaprYcqiZrUwKOhUs80NQ8YJpQVqguLc0l9HF7NLGmUF0xyeCcdIWrDQb40KnUCHJIa9+7pqD
	TP94POQ/fqdEMVy0Unr/9WGmT4qVdrmZna7vdk3bW1FM8rWNk/t2aBIKwmCdC2dt1WZ9MoN7gft
	PvKmAXkA==
X-Received: by 2002:a05:6a21:9d4c:b0:398:89b6:1b41 with SMTP id adf61e73a8af0-3b4cd066bc8mr1219019637.32.1780616001275;
        Thu, 04 Jun 2026 16:33:21 -0700 (PDT)
Received: from localhost ([2a12:a305:4::305d])
        by smtp.gmail.com with ESMTPSA id 41be03b00d2f7-c85df0a505fsm6146958a12.20.2026.06.04.16.33.20
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 04 Jun 2026 16:33:20 -0700 (PDT)
Date: Fri, 5 Jun 2026 07:32:42 -0400
From: Guodong Xu <docular.xu@gmail.com>
To: Qingwei Hu <qingwei.hu@bytedance.com>
Cc: Conor Dooley <conor@kernel.org>, sashiko-reviews@lists.linux.dev, 
	kvm@vger.kernel.org, devicetree@vger.kernel.org, robh@kernel.org, conor+dt@kernel.org
Subject: Re: [PATCH v3 08/15] riscv: Add Zic64b to cpufeature and hwprobe
Message-ID: <a2o7tkslomyf43dcs4tultdmrzcjgvkjh736l7lqemasljhs2j@tyixe5krxw6z>
References: <20260603-rva23u64-hwprobe-v2-v3-8-5529a7b28384@gmail.com>
 <20260602232800.768311F00893@smtp.kernel.org>
 <CA+Ck9FbKRM0wjJMg1fQpdwmow8cf_zTfir7V6+T=CRxU+vomdg@mail.gmail.com>
 <20260604-rice-protegee-3a0b8e4cb609@spud>
 <u52q565xhv5s7gz3wbh4heplhbm4pv732s5kqvf4deiw6ceb4t@n4bnpzu5kabs>
 <6940420B-C9C3-4D60-AB7F-7FBC4B93D855@bytedance.com>
Precedence: bulk
X-Mailing-List: devicetree@vger.kernel.org
List-Id: <devicetree.vger.kernel.org>
List-Subscribe: <mailto:devicetree+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:devicetree+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii; format=flowed
Content-Disposition: inline
In-Reply-To: <6940420B-C9C3-4D60-AB7F-7FBC4B93D855@bytedance.com>

Hi, Qingwei

On 2026-06-05 00:43, Qingwei Hu wrote:
>
>
>> Ok, I get your point. Agree, Zic64b/Zicbom/cbop/cboz can be implemented
>> on each hart independently (at least spec doesn't say no). With this in
>> mind, the validation of Zic64b should be like this:
>>
>>    if ((riscv_cbom_block_size && riscv_cbom_block_size != 64) ||
>>       (riscv_cbop_block_size && riscv_cbop_block_size != 64) ||
>>       (riscv_cboz_block_size && riscv_cboz_block_size != 64))
>>    return -EINVAL;
>>
>> This will allow :
>> 1. A Zic64b hart with 0, 1, 2, or 3 CBO extension and block_size 64
>>   passes the validation.
>> 2. A Zic64b hart with CBO extensions but block_size is not 64
>>   fails the validation
>>
>> Thanks for the catch.
>>
>> I will fix that in v4.
>>
>> BR,
>> Guodong
>
>Hi Guodong,
>
>Thanks for working on this.
>
>This overlaps with my earlier Zic64b cpufeature patch[1].

Thanks, and you're right that your patch predates mine. Your validation
was also correct (at least resonate with what I planned to do in v4)
from the start.

>
>and Greg confirmed that Zic64b does not imply support for any CMO
>extensions[2]. It only has meaning for whichever CMO extensions are

I'll add a link to quote this in v4. Great info. Thanks for checking
with them.

>implemented.
>
>Since the Zic64b cpufeature support in this patch overlaps with my
>earlier patch, if you keep this work in your series and base it on that

Yes, I'd like to, and I prefer, take the your patch into this series, and
credit you properly. In this series, I also added dt-binding, documentation
and howprobe, and make it consumed by rva23u64 detection.

>patch, could you please put my sign-off credit for the Zic64b cpufeature part?
>
>For example:
>
>Signed-off-by: Qingwei Hu <qingwei.hu@bytedance.com>

Yes, since your work came first, I'm happy for you to be the author of the
cpufeature patch, with me as Co-developed-by:

     From: Qingwei Hu <qingwei.hu@bytedance.com>
     ...
     ...
     Signed-off-by: Qingwei Hu <qingwei.hu@bytedance.com>
     Co-developed-by: Guodong Xu <docular.xu@gmail.com>
     Signed-off-by: Guodong Xu <docular.xu@gmail.com>

Let me know whether this works for you.

Thank you for pointing me to your existing patch.

BR,
Guodong

>
>[1] Link: https://lore.kernel.org/all/20260528141630.2741710-1-qingwei.hu@bytedance.com/
>[2] Link: https://lists.riscv.org/g/tech-unprivileged/topic/question_about_zic64b_and/119631059
>
>Best regards,
>Qingwei Hu
