Received: from mail-wm1-f46.google.com (mail-wm1-f46.google.com [209.85.128.46])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id DC4C6463B63
	for <devicetree@vger.kernel.org>; Fri,  7 Aug 2026 07:44:34 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.128.46
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1786088676; cv=none; b=Vmid9MlttJffnwT4OdGj5bqKb3WpVbWDLAKcpLeXRexAVj7gDjPGZ5kqengv2gzYuUXvZ59MEZtkppCGuEWTDcm1s3HTwbPA4W36V43x5tnqCjkcomEozroiWc/m31hn2o0ylCrYpfpPFR9Y9awti2U/c27gm9wTFDHaAPkbayU=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1786088676; c=relaxed/simple;
	bh=krEAkeXszBNqSc769Wiqlc+dXeSA0G6Y6ZRNOxuRxCM=;
	h=Message-ID:Date:MIME-Version:From:Subject:To:Cc:References:
	 In-Reply-To:Content-Type; b=PfDkNRY3VajYY9XyUXS4K3yqdGZTVJMr9pUgSPmHySpywViW5ljS/y0M3RU0faAuQ9F1TCONaPMZGAoOHqjf6EYL1ZdgKaSvfIG+PU24NB4cKFDFVA88tGcL5Pub/PDP+jbWO0Gbo6PFtXQopJdE8wKE15p48rbRbH25tCJ3KqI=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=osyx.tech; spf=none smtp.mailfrom=osyx.tech; dkim=pass (2048-bit key) header.d=osyx-tech.20251104.gappssmtp.com header.i=@osyx-tech.20251104.gappssmtp.com header.b=kJ/ZY3li; arc=none smtp.client-ip=209.85.128.46
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=osyx.tech
Authentication-Results: smtp.subspace.kernel.org; spf=none smtp.mailfrom=osyx.tech
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=osyx-tech.20251104.gappssmtp.com header.i=@osyx-tech.20251104.gappssmtp.com header.b="kJ/ZY3li"
Received: by mail-wm1-f46.google.com with SMTP id 5b1f17b1804b1-49802c418b5so28913745e9.1
        for <devicetree@vger.kernel.org>; Fri, 07 Aug 2026 00:44:34 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=osyx-tech.20251104.gappssmtp.com; s=20251104; t=1786088673; x=1786693473; darn=vger.kernel.org;
        h=content-transfer-encoding:content-type:in-reply-to:content-language
         :references:cc:to:subject:from:user-agent:mime-version:date
         :message-id:from:to:cc:subject:date:message-id:reply-to:content-type;
        bh=iTSNicc+okuCkFtzHEeSEUokN2gPYtw2OOgCgXZ1BUM=;
        b=kJ/ZY3ligSqeddSXBAhLFJFyTyY5k7dbF764xeCL7YDZASJm82/K/2SLxdckQ9n6H4
         JWnbFHYOLcuxQbr6bbuRlW+7+7OF2RjOgXzOsQgajvvxtMZfvaUSheSehG8C+8tn0NNI
         iEfxqAhzLheDzaz9UfrmhBu1Pa3idoSZIoshUggbG2Ed5rjjIM+OwjOvT48Q/Bsslsu+
         oj01/ER9aw6VfnAlstL9sGpa9RTtnchio/bNKQBxQc6catXnvpnFhFdqGqjcPFcnGzSn
         ie0qLSUi/w/3XwCwr66HGMjSwxNa3pD12Q9qmmSqGRJBzGWzwjPrjz3Plg1e6luv35Fn
         mQ8Q==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1786088673; x=1786693473;
        h=content-transfer-encoding:content-type:in-reply-to:content-language
         :references:cc:to:subject:from:user-agent:mime-version:date
         :message-id:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=iTSNicc+okuCkFtzHEeSEUokN2gPYtw2OOgCgXZ1BUM=;
        b=lRSyvegA+IZ5SsMv5DaYfWt04bIyFKZ8UvLQVh0xMwt6WKPQIOuQvSgZYfFEV5WU5O
         xReb8p+4tbgesqWos4eN1Bb7qBmiM6KRjqmHaD87WBx0N3zFgxh5TMeooT/uROnVnVIP
         VrYWXcvSDbiVVD3N3bbB1g8Cf+ucJ/8KQHajaY4AumGYFf9qIoBCxA6dg+nENbZQToKe
         P5r8LRIg8MI6gnPPebTM2V86IjhoJF67qAyNxDxEg1hxtzsTYdARjYV5lXmZ9YrCGPhS
         Z4/eTQuNX5nqIcVbSRyS4PR6U6DjSElmDzs9vmMgKzg7inp7Kp42LHf5Z/QhiGZ67/lj
         EQaA==
X-Forwarded-Encrypted: i=1; AHgh+RoIem0WE+8oP636uoZVLBJV0PdjKBeF+/pLTF0lHJMA6GYLVWkd0Sumc/ukdJvCSsjIsXngcsYEEqit@vger.kernel.org
X-Gm-Message-State: AOJu0Yw9aFF5l4U3GY6Scs6gO0j2Wy9Sp7C9tgNN6k940P25OWNeh3OS
	g0unvVPUVgfycFlF1Vuvi4Nk7khgM9qNrX46i6vq19N/1smdk4uzOiQSgiS5CzHv0Eam
X-Gm-Gg: AR+sD13GecsLxgG/NWhSGrWBSs+PawLrLDglsxm0nkF1vL30GO+qwXaoekmn98tMS4X
	NX44dDKafKOY0USMVmTbBB5beryDBiN1corZTnEh7aWOUSlavLgoU00YWhDjePMJPb1UZLQcc/9
	sEYO9m5qLH/fzulelj6BSZ5sSFWDBqvDEG02Zku2kmB8/B0IospovLxv5Ed/Sr2N/QQxxVwW5nr
	T3Fqbhxmw9Qt4BaraDg7XegGOEYc2CbliBTaZpyPZg4XPHER9XLyQRSD0apeUOap4pnAiWw/esw
	zFmLB/wxSotfTe6oFIoFezUlKxXnHCO/i6+20UmgyAwYMBBfQWQzSD4U7ryNSl4rQvVT3eS+IVC
	CwylQtXvRQrfWQGUDcZGq5xU6HNkQ2MKxO/rvig4E9puZnJbCwqj/rMAbytcSkWg7BfoK7ys4l0
	05sqQKVj2DW4GNWmDUACK3qUuYveByaDmiF62w9Qh3RobKGqIGCBFbbXo3UYDjPmcVEGB+6gbsY
	gnQns3mdvLtj10xK1XcyTKZlteYLHdGvg==
X-Received: by 2002:a05:600c:46ca:b0:499:5e50:5be9 with SMTP id 5b1f17b1804b1-4995e505da9mr18485315e9.16.1786088673162;
        Fri, 07 Aug 2026 00:44:33 -0700 (PDT)
Received: from ?IPV6:2001:8a0:f59c:a900:2600:fba1:8d1e:1692? ([2001:8a0:f59c:a900:2600:fba1:8d1e:1692])
        by smtp.gmail.com with ESMTPSA id 5b1f17b1804b1-4995c7a56c5sm40919585e9.3.2026.08.07.00.44.29
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Fri, 07 Aug 2026 00:44:31 -0700 (PDT)
Message-ID: <96442d4d-ec8c-4637-89a2-9dcbca7bb98b@osyx.tech>
Date: Fri, 7 Aug 2026 08:44:29 +0100
Precedence: bulk
X-Mailing-List: devicetree@vger.kernel.org
List-Id: <devicetree.vger.kernel.org>
List-Subscribe: <mailto:devicetree+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:devicetree+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
From: =?UTF-8?Q?Jo=C3=A3o_Peixoto?= <jpeixoto@osyx.tech>
Subject: Re: [PATCH 5/6] virt: bao: Move BAO_IPCSHMEM_HYPERCALL_ID to common
 header
To: Andrew Jones <andrew.jones@oss.qualcomm.com>, joaopeixoto@osyx.tech
Cc: linux-kernel@vger.kernel.org, ajd@linux.ibm.com, alex@ghiti.fr,
 aou@eecs.berkeley.edu, bagasdotme@gmail.com, catalin.marinas@arm.com,
 conor+dt@kernel.org, corbet@lwn.net, dan.j.williams@intel.com,
 davidmcerdeira@osyx.tech, devicetree@vger.kernel.org, dev@kael-k.io,
 gregkh@linuxfoundation.org, haren@linux.ibm.com, heiko@sntech.de,
 jose@osyx.tech, kever.yang@rock-chips.com, krzk+dt@kernel.org,
 linux-arm-kernel@lists.infradead.org, linux-doc@vger.kernel.org,
 linux-riscv@lists.infradead.org, maddy@linux.ibm.com, mani@kernel.org,
 nathan@kernel.org, neil.armstrong@linaro.org, palmer@dabbelt.com,
 pjw@kernel.org, prabhakar.mahadev-lad.rj@bp.renesas.com, robh@kernel.org,
 will@kernel.org
References: <20251224135217.25350-1-joaopeixoto@osyx.tech>
 <20260107162829.416885-1-joaopeixoto@osyx.tech>
 <20260107162829.416885-6-joaopeixoto@osyx.tech>
 <5kjiicdwq2ny3zg4mooojsntylukuadx4ajhf7mn7sue4aedpk@j2xfslwvkwur>
Content-Language: en-US
In-Reply-To: <5kjiicdwq2ny3zg4mooojsntylukuadx4ajhf7mn7sue4aedpk@j2xfslwvkwur>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 8bit


On 1/14/26 20:34, Andrew Jones wrote:
> On Wed, Jan 07, 2026 at 04:28:28PM +0000,joaopeixoto@osyx.tech wrote:
>> From: João Peixoto<joaopeixoto@osyx.tech>
>>
>> Move the IPC shared-memory hypercall ID from architecture-specific
>> headers into include/linux/bao.h.
> The series should be rebased to have this fixup integrated into the
> previous patches where the code is first introduced.
>
> Thanks,
> drew
Understood. The reason it is currently a separate patch is layering: the
shared header include/linux/bao.h is introduced by the I/O dispatcher patch
(4/6), while the IPC helper that would use the constant is introduced 
earlier
(2/6). To fold this away cleanly I will move creation of include/linux/bao.h
into 2/6 (with the IPC hypercall ID) and have 4/6 only add the Remote 
I/O ID,
so the arch helpers are parameter-free from the start and this patch
disappears. I will do that in v4 (I kept it separate in v3 only so the
changelog against v2 stays readable, and it now has a proper "why" message).
If you would prefer I fold it immediately, I am happy to respin.
