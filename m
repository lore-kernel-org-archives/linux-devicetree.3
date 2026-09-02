Received: from mail-qk1-f172.google.com (mail-qk1-f172.google.com [209.85.222.172])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 79006495051
	for <devicetree@vger.kernel.org>; Wed,  2 Sep 2026 12:54:15 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.222.172
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1788353656; cv=none; b=kvnncwFCzxUJ18HK+9W38EAQy/x9RiBz0Hljm1knDbapVX45oi/nzvANdzK5NBo9eJNdnTKLXuQ1iy09FMaya7VnjZB7X3DgbD7kgk9/jHjeHB5iVp7gYz42rCQJO3IDTqmnRd0exCChptKOvJrImkdLtuuHr/h1WM9lmsFoE50=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1788353656; c=relaxed/simple;
	bh=cfHF43Ine7qBJQ4yGW2dx3QI/BoEj5Uk/rG08tzXK7Y=;
	h=Message-ID:Date:MIME-Version:Subject:To:Cc:References:From:
	 In-Reply-To:Content-Type; b=aVBWmsunXvTRmMr2dwGe+lovvsn/mkQr4XIIyBftnjOQDgPtu91bWShZdvtOjNFp1OO8a7YDLIAM3jIFeG4S5nnZZY31ICPU9yjkYlYsdXP6v5jVext6YFNzOA0ns4Wd/Ovn+Kyf6pO1yzKWijEq2dtImH1e2ZtZK9wgTVEk5nA=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=riscstar.com; spf=pass smtp.mailfrom=riscstar.com; dkim=pass (2048-bit key) header.d=riscstar-com.20251104.gappssmtp.com header.i=@riscstar-com.20251104.gappssmtp.com header.b=ENVbtIVB; arc=none smtp.client-ip=209.85.222.172
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=riscstar.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=riscstar.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=riscstar-com.20251104.gappssmtp.com header.i=@riscstar-com.20251104.gappssmtp.com header.b="ENVbtIVB"
Received: by mail-qk1-f172.google.com with SMTP id af79cd13be357-92edb12cdf2so91223285a.3
        for <devicetree@vger.kernel.org>; Wed, 02 Sep 2026 05:54:15 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=riscstar-com.20251104.gappssmtp.com; s=20251104; t=1788353654; x=1788958454; darn=vger.kernel.org;
        h=content-transfer-encoding:content-type:in-reply-to:from
         :content-language:references:cc:to:subject:user-agent:mime-version
         :date:message-id:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=1b2V5MXPsa5bsC9pz5bMRlVxqIlX3QBRBOS64r/eMF4=;
        b=ENVbtIVBUmesY4QhKmqdgGGSJhUQia90DxTc6Akc+eWGcqlbK6nas+whMXWwzWTqWG
         UH3VQ3ivQHebkiD0DOsJAYuGKzWVd770s3vlwJxypepbZfTUgFyjgbVyoi8Zl7qwy9zN
         M3ui+HcyAFTBcuAaYrPny7Y8VVt6DM/cWq/YQ4DnxcMiU/4KyTLsG7d/QFJY1stO+M0Z
         PKWdFMY95CYH6AM8a04XcPZY6kX17vs3SZak8rwBGGJKRXtsgdjNt0jcH9gjYN/3orI/
         UAjjwx8JRnGOb4f+3i0GnJtigD0idJvW61KkX7Qrc/2uFy7kR/eDl6nOetXTN+ma792T
         xgnQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1788353654; x=1788958454;
        h=content-transfer-encoding:content-type:in-reply-to:from
         :content-language:references:cc:to:subject:user-agent:mime-version
         :date:message-id:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=1b2V5MXPsa5bsC9pz5bMRlVxqIlX3QBRBOS64r/eMF4=;
        b=gj6OnSREV1XMEOdc/yyBJK00KjwrwsH2ZJiYFpfb1p6EVjqaLtgVE4I3Smqg5zs7gR
         VJC+zfSDDXrLxe4kUNjziaTPAbvONUnCL1+/wnYz+tjAU5QlyRBVQ/a5owhl6iR2ze+9
         ElybLgEecSBn1EDyjWyFHBlaR47xQLzts3Y/VMugKcM02jaNV78UN0olAZLxkidMYGil
         nVnAbbeUvxfFiOQ8cKYI91FtgMjOcS+4b3eRfs+BpUYxRa3NoPxoOJ4M+QP+hpXpHisu
         aIofjDHNK202WNlQZNDxowzJ57CURHyPCXLucUbfthPdCxlXbfce639RgfzHlOBItlXf
         etLg==
X-Forwarded-Encrypted: i=1; AHgh+RrLSjatT6lye4A3WGwLps7fqqmK6wYMI46FMgq6UoLaTkjclH9N18d0XXfH/YYuZnR0sxHdzGPtXLOL@vger.kernel.org
X-Gm-Message-State: AFuF++lmlmGRSJcn+wXGzw4z0sylhoBlaEoVeX0MUc0w/tr1SpApKiAn
	KHlJGyOZv/k8ozFnN3ppIhVNEnBsOm6hYKT8YWUAjkQ8DwwBALIcu5kLB8wQcc4XsnY=
X-Gm-Gg: AR+sD13Iqo8+VPLHAtHrLLARnBoCqDnP1HMK48XtObdk1ouh6TBc9hrScWEyfKon+D5
	jpIMwEznD1c+Cdd2oG02WRnJpFTrVFNXQ+02ioYNd+MDnK5tZbm6ToTU6ejGlfcJkSuNjpNT4Nm
	QqWYaKECAVMMRwLQo9Of2zQHixpqfnoJ7skpZJuXtL+azhlPgqUka7d9J/7/9B+DUue4L4fOQII
	PGDN5Tdk3OSqPZIh2SE2NH8zY4LGGwYPOl+f17H1KoUt5kgc8oNi2qfMot4fKNvyoqxcHkvkNc0
	jamViDgQ716E3TTRiZTQ+00Sw3ztVfRIjROvtOq/uu8+x/nYBfrzuPzQ+vf1g4PfqIymKZCWnpI
	m1nY03AI4Q91bqfNx44B4NRSrpQk/5schf6x1SnyIbVCter/hipFqWpKnQzWwsLO+K4Gp9L7O58
	WqCt7q5tGZBfWqdU42mlP7jVR0cG9O8AAlmU/o594SoEVUBV5HuqLA3aj4GmQe
X-Received: by 2002:a05:620a:371c:b0:937:6772:d8d with SMTP id af79cd13be357-93960f1811emr528224985a.20.1788353653772;
        Wed, 02 Sep 2026 05:54:13 -0700 (PDT)
Received: from [172.22.22.28] ([73.62.185.64])
        by smtp.gmail.com with ESMTPSA id af79cd13be357-9395f359ffbsm196501485a.28.2026.09.02.05.54.12
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Wed, 02 Sep 2026 05:54:13 -0700 (PDT)
Message-ID: <58452803-d22b-4e9a-8716-db46798d6403@riscstar.com>
Date: Wed, 2 Sep 2026 07:54:12 -0500
Precedence: bulk
X-Mailing-List: devicetree@vger.kernel.org
List-Id: <devicetree.vger.kernel.org>
List-Subscribe: <mailto:devicetree+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:devicetree+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v3 3/4] PCI: of: introduce of_pci_verify_node()
To: Rob Herring <robh@kernel.org>
Cc: sashiko-reviews@lists.linux.dev, linux-pci@vger.kernel.org,
 conor+dt@kernel.org, devicetree@vger.kernel.org
References: <20260901011338.1323243-1-elder@riscstar.com>
 <20260901011338.1323243-4-elder@riscstar.com>
 <20260901012128.2AC6E1F000E9@smtp.kernel.org>
 <cde3da8f-933a-41ef-b7b8-f78317ca2d67@riscstar.com>
 <20260901173239.GD1244140-robh@kernel.org>
Content-Language: en-US
From: Alex Elder <elder@riscstar.com>
In-Reply-To: <20260901173239.GD1244140-robh@kernel.org>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit

On 9/1/26 12:32 PM, Rob Herring wrote:
> On Mon, Aug 31, 2026 at 09:42:46PM -0500, Alex Elder wrote:
>> On 8/31/26 8:21 PM, sashiko-bot@kernel.org wrote:
>>> Thank you for your contribution! Sashiko AI review found 1 potential issue(s) to consider:
>>> - [Medium] The check in of_pci_verify_node() falsely flags compliant CardBus and PowerPC PCIe bridges as having an invalid device_type.
>>
>> I was unfortunately not considering those types of bridges,
>> and don't have experience with (or access to) either.
>>
>> In the devicetree code, of_bus_pci_match() does check for
>> device_type "pciex" but does not handle "cardbus" (at least,
>> not explicitly--the "default-flags" bus type might do the
>> right thing).
>>
>> I would love to get some pointers from others on how to
>> do this correctly, but in any case I'll do a little more
>> research on this before I post version 4.
> 
> I'm willing to wait and see if anyone cares about cardbus. I doubt it.
> Maybe there's some old PowerBooks with cardbus?

I'll give it another few days before posting v4.

> "pciex" should probably be handled.

I'll add that.  I'll also try to find what the range
of "compliant" device types is; I presume it's in the
devicetree spec.

Thanks a lot.

					-Alex>
> Rob

