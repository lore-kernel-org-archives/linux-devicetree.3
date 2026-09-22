Received: from mail-pj2-f1.google.com (mail-pj2-f1.google.com [74.125.227.129])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 7CDDE443E4D
	for <devicetree@vger.kernel.org>; Tue, 22 Sep 2026 09:24:44 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=74.125.227.129
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1790069085; cv=none; b=KM6Ci6/AQ/XYiGlN2h/Rn6ch/yaWz9oERZ+DhrFYxQGCkhVFAG9f83RT5dgNy6hpeHQzeKNvPp/Hf5t6T+QR0Xtkpw4BkkpJF6/K2xG5o/UaF73fE/jn8HlkIzRRxczsXHsiIODGm+pQkegaoCz7mhSCJIBif2iVIth6XeKhO6M=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1790069085; c=relaxed/simple;
	bh=GDxvF8dXYDG22RLP8EkHsfiu7VwDTSk8lU2Woa4WlXE=;
	h=Message-ID:Date:MIME-Version:Subject:To:Cc:References:From:
	 In-Reply-To:Content-Type; b=DMhgdx5HEUZpdQcQkxpEZQxZJOlLSvCbWpQWr/PyATB/YUCJ8k9U2rfZ1VyR0fkdR35ZPOUYsPKIbm82IS0J+zhD5Ilq62kNp9co5NmJE2anO6QVuos4GQSf0rF/9GHqfZZ9xf0hiwcfilhnSWiP7/1HIOgMFq6+PwX7mmAf+hM=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=JXu8umYp; arc=none smtp.client-ip=74.125.227.129
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="JXu8umYp"
Received: by mail-pj2-f1.google.com with SMTP id d9443c01a7336-2cb3f5bb19aso14893185ad.1
        for <devicetree@vger.kernel.org>; Tue, 22 Sep 2026 02:24:44 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1790069084; x=1790673884; darn=vger.kernel.org;
        h=content-transfer-encoding:content-type:in-reply-to:from
         :content-language:references:cc:to:subject:user-agent:mime-version
         :date:message-id:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=XClesR6PCgee5pL1QNRk08L/1yXOaC+odjip8AQtXVU=;
        b=JXu8umYpk/IABHw2T7IVSsn1IvQBC/nveMJIU8vA+U/2fakpB/XJOlgss7B6d9QPhh
         OPcO0lGoRS3fX5HmyYNl7YXeYyD5/ulIjGJA4KbltsaRPaw7vCJ/QdpPvVN268skFF//
         sGe1a6k3vdwjyGd4SfiEz/oeZrEPRHJJn/F3QeBJZRq4ZMUPmFT3+MNjZHjmUQd1qthd
         Oo5sVp5wmjtpG5vUAlrTF9YsAug2jNWDHM5w5JkYNlS1FadNi8zphPmtIUqqi9iIBj1V
         Y8/gvibhSdEm5171ecT0hF0otEs7AMsrBc6F2jO+Xto77xZHfkJM2VNA4IVvBDuiua7w
         xu0w==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1790069084; x=1790673884;
        h=content-transfer-encoding:content-type:in-reply-to:from
         :content-language:references:cc:to:subject:user-agent:mime-version
         :date:message-id:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=XClesR6PCgee5pL1QNRk08L/1yXOaC+odjip8AQtXVU=;
        b=ZQcxwetu8bQDCkXGVHJv5d17mP7271EFJBdXLSkHcoDgKPF5QL2fzd3ADn/XatVZpz
         +Xy+CQ8dBzHYfkQZ0y2ICXoG+e4fj8ueIDVQm8Y5/jpHHSuLfZjah65has7QG1X1JbkE
         55IDW0d+25VaPSyY2PecqoBGJKoazjwXYefekNskwtZEsetej7afRncSYicQmOdR68yf
         P8JuVL+b1k3em+Xy3QjzdA4xUI0gl5tJjAARmc+jqmHSUEOcBBYVEz6uVXDgehlMQYbM
         t1ECdXOObdz0DqzUMnznOW1F/sudxqH1k8w1pN+q28wGbT5JMFti1QcMVBuJE//whBDx
         I+6w==
X-Forwarded-Encrypted: i=1; AKwUvBxYIyUBJ+hrAxmcGqWV85MitXEoJQ4bVhSgv4/X7YhuF/i0D4M56dtvZk4txrKgqOYwZLB9V6e9HAwx@vger.kernel.org
X-Gm-Message-State: AFuF++mij0ItOLyeKVpX0IL2jfnE6g7858ntFVIaaPvxz/o+8F8cS4ZC
	J33ZmsReKn3XBwtOJ976ArMfOjw8T9qPCYI4byAs0fgsZMuY0Yfaj5/BXNBN/dLQoJc=
X-Gm-Gg: AYBFou2QFKEyWKCAZMQF2vkE2/Hw/r4qdA/A7NKIzKVhAMALcALbfTYudmabcPrDDan
	19zn0Quiz23vIAeoF2Ggdt7XBABkh1a941PJQikp95RBIAXlwjmbOes73c88mt0XqesEimwzJil
	/Qsycbqjdn21lLBuv1p3BAOmB1uyguQi/1r1yF7bCEbJu1pqtnAPsYsE5qraQtH3ynAOcK9K/9l
	hWDfRGGFzRbA1gIe2DxOoiAAkXwMfYrbvW7aKkRUaZj03QRVx77k1seqH69fEPz+IgyeGNdruCK
	q45iFycgBxmwtU+aoNvWjPn1L+Wmv8agUCaM5tMnmv7iqOgpT1ePL2POo0fofiEZRRdWONGutqs
	2VqP65zl3gtTKlPcMY204bt41rndALCiRW4BTr8awOI5Ladg4OyS9AFppd/BROOCvoZ6JZ/+Nqs
	amAMd7MPn/Ply2RleNPkyrSCkqq3zVaS0xd5H3HsNphlOfAzEPKiUlY9jD7mB3LnbUnypPp0LCj
	XJumQ==
X-Received: by 2002:a17:902:d592:b0:2dd:c100:80bb with SMTP id d9443c01a7336-2df60b7e838mr5983985ad.54.1790069083577;
        Tue, 22 Sep 2026 02:24:43 -0700 (PDT)
Received: from [10.125.112.20] ([122.11.210.25])
        by smtp.gmail.com with ESMTPSA id d9443c01a7336-2df5d02fb15sm6848565ad.40.2026.09.22.02.24.34
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Tue, 22 Sep 2026 02:24:37 -0700 (PDT)
Message-ID: <060fb694-ba1d-40e7-8a18-f32d5a4039ab@gmail.com>
Date: Tue, 22 Sep 2026 17:24:32 +0800
Precedence: bulk
X-Mailing-List: devicetree@vger.kernel.org
List-Id: <devicetree.vger.kernel.org>
List-Subscribe: <mailto:devicetree+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:devicetree+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v3 0/5] of: reserved_mem: several fixes about reserved
 memory
To: Mike Rapoport <rppt@kernel.org>
Cc: robh@kernel.org, saravanak@kernel.org, m.szyprowski@samsung.com,
 devicetree@vger.kernel.org, linux-kernel@vger.kernel.org,
 linux-mm@kvack.org, akpm@linux-foundation.org
References: <20260920092852.614973-1-chenwandun1@gmail.com>
 <arJA6fOMetzoBhDH@kernel.org>
Content-Language: en-US
From: Wandun <chenwandun1@gmail.com>
In-Reply-To: <arJA6fOMetzoBhDH@kernel.org>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit



On 9/22/26 16:48, Mike Rapoport wrote:
> On Sun, Sep 20, 2026 at 05:28:47PM +0800, Wandun Chen wrote:
>> From: Wandun Chen <chenwandun@lixiang.com>
>>
>> This series fixes several error-handling issues in the reserved-memory
>> initialization paths.
>>
>> The first two patches fix cleanup of no-map regions after driver
>> initialization failure.
>>
>> Static reserved-memory nodes are reserved during the early DT scan but
>> initialized later. The third patch tags regions whose early reservation
>> succeeded, so the late scan can skip the nodes whose early reservation
>> failed.
>>
>> The last two patches reject overlapping static regions. Without
>> these checks, overlapping nodes can be initialized over the same
>> physical memory, result in data corrupt.
>>
>> Sashiko reported these issues in [1] [2] [3].
>>
>> [1] https://sashiko.dev/#/message/20260814090305.4C8741F00A3D%40smtp.kernel.org
>> [2] https://sashiko.dev/#/message/20260814084718.29C341F000E9%40smtp.kernel.org
>> [3] https://sashiko.dev/#/message/20260806100605.2C2C01F000E9%40smtp.kernel.org
>>
>> v2 --> v3:
>> 1. Rework the mechanism that checks in the late scan whether the early
>>    reservation succeeded (patches 3-5, suggested by Marek, thanks).
>>
>>    Patch 3 adds a new memblock flag MEMBLOCK_RSRV_RMEM, which is set when
>>    the early reservation of a static region succeeds and checked in the
>>    late scan.
> 
> Can we keep this local to of_reserved_mem please?

Probably not. I do not see a way to keep this entirely local to
of_reserved_mem while handling the issue robustly.

I previously implemented an approach in of_reserved_mem that records
static reserved-memory nodes whose early reservation failed in a local
array [1]. However, the early scan runs before paging_init(), so the array
cannot be dynamically expanded. If the number of failed nodes exceeds
the array size, some failures cannot be recorded and the issue remains,
and that is why Marek said "partial solution", although in practice
having that many failed nodes is unlikely.

To handle this robustly, the late scan needs a way to determine whether
the corresponding early reservation actually succeeded. Current approach
uses memblock to retain that state.

[1] https://lore.kernel.org/lkml/20260818092420.2859026-1-chenwandun1@gmail.com/


Best regards,
Wandun

>  
>>    Patches 4 and 5 are reworked to reject regions that overlap or are
>>    contained by an existing reservation. The code makes a little different
>>    from what was acked in v2, so the Acked-by tags for these patches are not
>>    carried over.
>>
>> 2. Reorder the patches: the two cleanup fixes in v2 now come first.
>>    In v3, the first patch now introduces the 'dynamic' distinction in
>>    fdt_init_reserved_mem_node(), which the following patche 3 build on,
>>    so the series reads more fluently.
>>
>> v1 --> v2:
>> 1. Rework failed-node tracking in patch 1: do not track zero-sized nodes,
>>    and keep a reserved_mem slot when tracking overflows.
>> 2. Reject static reserved regions overlapping existing no-map regions.
>> 3. Keep MEMBLOCK_NOMAP flag for static no-map regions when init failure.
>>
>>
>> Wandun Chen (5):
>>   of: reserved_mem: release dynamically allocated no-map region on init
>>     failure
>>   of: reserved_mem: retain static no-map memory on init failure
>>   of: reserved_mem: skip init for regions whose early reservation failed
>>   of: reserved_mem: reject static regions overlapping no-map memory
>>   of: reserved_mem: reject static mapped regions overlapping existing
>>     reservations
>>
>>  drivers/of/of_reserved_mem.c | 86 +++++++++++++++++++++++++-------
>>  include/linux/memblock.h     |  7 +++
>>  mm/memblock.c                | 95 ++++++++++++++++++++++++++++++++++++
>>  3 files changed, 170 insertions(+), 18 deletions(-)
>>
>> -- 
>> 2.43.0
>>
> 

