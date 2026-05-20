Received: from mail-pg1-f194.google.com (mail-pg1-f194.google.com [209.85.215.194])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 3973A175A72
	for <devicetree@vger.kernel.org>; Wed, 20 May 2026 08:16:30 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.215.194
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1779264991; cv=none; b=pmXJVLLxCtnCUTaj+iA7XMvsGQ7ufBfyS/28xH6ZWGU03Z/LJNdP3XMSeGlUbfyjW7ZtiHgnjUnPg5XOqR1305mnyZyCilVZvBu7J6ihT+xlGAuoAxDEL6yWhJyl7tYLkXMG2JJSilIRLZ6GpC34n1lTmzryPm7TdLmeFnn+fl8=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1779264991; c=relaxed/simple;
	bh=/Va6M10O1YBsHMzb4f3pxz9lYcam9u2JInx0dKHx+ws=;
	h=Message-ID:Date:MIME-Version:Subject:To:Cc:References:From:
	 In-Reply-To:Content-Type; b=UZ/Zy0GiYw9efBlOUvmRAYjpimUAk+6Yj6lZGtUIKQRgufGssmwcsapuYzNAwbSuvNwsbdni0KhiuRrM/BucAkbNAgpgnsejjnZpZv1+MQdlUlGavm/UUZPp4KqUOxnDUDAZT4satSfy9pCyzcQmL7VyIjqRHL6tg4q/9lmCr1A=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=NB/ypIcE; arc=none smtp.client-ip=209.85.215.194
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="NB/ypIcE"
Received: by mail-pg1-f194.google.com with SMTP id 41be03b00d2f7-c8173b2af32so3538459a12.0
        for <devicetree@vger.kernel.org>; Wed, 20 May 2026 01:16:30 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1779264989; x=1779869789; darn=vger.kernel.org;
        h=content-transfer-encoding:in-reply-to:from:content-language
         :references:cc:to:subject:user-agent:mime-version:date:message-id
         :from:to:cc:subject:date:message-id:reply-to;
        bh=/Va6M10O1YBsHMzb4f3pxz9lYcam9u2JInx0dKHx+ws=;
        b=NB/ypIcEnXrvrr0cl4CEhsEhKy0UU6zvSzy14vuzLtYvif0IMFUamISrDW8rSx/n8J
         mhCbFGec2V5EprIiZdJ/J8eEpDLENDmYeGVtRBOeve8MQsLwah7COfdX8YyoaK2YO+1I
         uz2CMe1rymLrkyR/hnJm+knR7EYpRChUIEjury1qqPZv88uOfrf+BjwYHcNaVZCR3j0a
         i3KENjP2FhE4i3HmbakHBizaAFlPP/Xd4YDOvTvUO9U2cGQcpSd/F39sVMhhv6HqkM0U
         Kin9l9iP13GGeYiJMk+tOaLchvH+qKC6l1j3eTb0o3jVVegVWoYgjzVcdlkg72JhI2fm
         qQvg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1779264989; x=1779869789;
        h=content-transfer-encoding:in-reply-to:from:content-language
         :references:cc:to:subject:user-agent:mime-version:date:message-id
         :x-gm-gg:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=/Va6M10O1YBsHMzb4f3pxz9lYcam9u2JInx0dKHx+ws=;
        b=ArUkJndHNLLJNucCYVW2w/hNTC9P37BYMR0GSyd8IY2suMcAUy/ZNMtfe8M6AK20WH
         VSCYjZc32tuJ6lFmtj+AM9Gj1Lh6yXLrjWK+aUUD/YqcHvbHtFDKwaExRWOe/vaxXxHK
         IoJ0p8P3sL1GLjuJE53L3GnIpdQVUZRA08cf95Iofom16YlV+IWEHLHNRz8ydyZHVqVj
         tdy3yXXrtBBvJjQVI39txmtuT0Cn5VPB38FzG7OWGl7NgXAYkZUIA/Xj017hLs+iwRCS
         AZqbjbaVGuxIL9iMcih8McRWaYWD17qd1+cvtmY1kx8XnqIkFymC0iLW75xZT1sUBC7F
         Qzyw==
X-Gm-Message-State: AOJu0Yz2zbxxFZmiXKJKGfBgk1gthXBKxLp4x7nCIzagXBJ91eidDApI
	IIvrGAL9T8nTCz6uzxLYWQ1cddPV2bIUHMFiehtkAdypzJV+GRq+mbZ8pTQ8Onk+AXZi3jFJ
X-Gm-Gg: Acq92OEs3vbxT3foFhPMrIPheyy2AU1ESHjfc6u+EeiDJHs+dejYkM3/7sUVJL24EC0
	gOwCOkx2NRT7FgvwyHWxCjv5AeDkgpBDhjTVINfrGaKow0+vKyLPyznXMq8fKQhWYpWWoRmfhqT
	BFdhLwtAClpWD4bedL9E/U1xfOrB6FZnYBZOQerfuPSNP6m3LuGrWWsi7SyFMk9tvmMI5/n6et8
	Qe6RmcNUkxTlUFY9mYqVNCD5kh/0+j3DYWXpXXcB6nry1UVv9ZfY5Bfg2z/Tat5hx3CYLyuOnPn
	qA83G5LLU1z2ZZxUUG/Tv0GQXGdWD0OT1cvzHJ5akUvCRi6YhT67YBNGH+rpY8ysJIm+ZzZHwz6
	GHMhmuOOcitR7brjcQKYtp/o6HnILkRdBpwG9hHaxrx9ilrBpI1TAjlx8HQRFS1A+WiiQAQ/kpH
	FdOZYfH3v/XNBJ8FkJZKtgHUzREHqcLFY=
X-Received: by 2002:a05:6a20:2451:b0:3aa:3fbf:d0a3 with SMTP id adf61e73a8af0-3b22ed77e3cmr26829035637.47.1779264989529;
        Wed, 20 May 2026 01:16:29 -0700 (PDT)
Received: from [10.125.112.20] ([210.184.73.204])
        by smtp.gmail.com with ESMTPSA id 41be03b00d2f7-c82bb1156absm19095176a12.27.2026.05.20.01.16.26
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Wed, 20 May 2026 01:16:29 -0700 (PDT)
Message-ID: <0dd4546a-6133-4493-a911-41c35ec42c15@gmail.com>
Date: Wed, 20 May 2026 16:16:23 +0800
Precedence: bulk
X-Mailing-List: devicetree@vger.kernel.org
List-Id: <devicetree.vger.kernel.org>
List-Subscribe: <mailto:devicetree+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:devicetree+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v2 1/3] of: reserved_mem: avoid unnecessary memory
 allocation when __reserved_mem_check_root() fails
To: Krzysztof Kozlowski <krzk@kernel.org>
Cc: devicetree@vger.kernel.org, linux-kernel@vger.kernel.org,
 zhaomeijing@lixiang.com, robh@kernel.org, saravanak@kernel.org
References: <20260519082427.4181476-1-chenwandun@lixiang.com>
 <20260519082427.4181476-2-chenwandun@lixiang.com>
 <20260520-cuddly-imperial-bison-ec3c4e@quoll>
Content-Language: en-US
From: Wandun <chenwandun1@gmail.com>
In-Reply-To: <20260520-cuddly-imperial-bison-ec3c4e@quoll>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit



On 5/20/26 15:44, Krzysztof Kozlowski wrote:
> On Tue, May 19, 2026 at 04:24:25PM +0800, Wandun Chen wrote:
>> total_reserved_mem_cnt will keep the init value (MAX_RESERVED_REGIONS)
>> in fdt_scan_reserved_mem() if __reserved_mem_check_root() fails.
>>
>> fdt_scan_reserved_mem_late() calls alloc_reserved_mem_array() to
>> allocate memory according to total_reserved_mem_cnt before
>> __reserved_mem_check_root(), so if __reserved_mem_check_root() fails,
>> the allocated array has nowhere to be used, so no need to allocate
>> memory.
>>
>> Move alloc_reserved_mem_array() after __reserved_mem_check_root() to
>> avoid potential memory waste.
>>
>> Signed-off-by: Wandun Chen <chenwandun@lixiang.com>
> Authorship/DCO mismatch.
Hi Krzysztof,

Thanks for your review.
Sorry for the mismatch. Dueto my company email server's issues with
community mailing lists, I sent the patch via my personal email.
I will add the correct 'From:' header and send a v3 patch shortly.

Best regards,
Wandun
>> Tested-by: Meijing Zhao <zhaomeijing@lixiang.com>
> Best regards,
> Krzysztof
>

