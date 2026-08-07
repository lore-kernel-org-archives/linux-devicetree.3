Received: from mail-wr1-f47.google.com (mail-wr1-f47.google.com [209.85.221.47])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 176FE3793B8
	for <devicetree@vger.kernel.org>; Fri,  7 Aug 2026 07:42:47 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.221.47
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1786088569; cv=none; b=HmHJ4rNGtbnmFEOfMor636zGf6+l5l2B4hlgeRNxPCEWD9YnR9EjQMrtf8GIqvJ5/PGMtZRhTxg22c5in/xQQGBLq9fAoP1Iz0Is/IGjsir1pR413o/3ldOK6KQSFeX0A8w+Nvq8C1MHZG6+iojP2dz6VADVIVc+q6IRRonW46g=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1786088569; c=relaxed/simple;
	bh=5JeEmtsguDHXKCG6/FSGhr0jj5zQcfMVjdea7DqcvmE=;
	h=Message-ID:Date:MIME-Version:From:Subject:To:Cc:References:
	 In-Reply-To:Content-Type; b=ax2ouMq7YYHHJIRulU87+ENG0I2CFo0X/qsEkD60rB23YVEvPJDK4vSf5z37hc6USKl8D6ushTjaznLwDDcIP9Iz51ASDIPnCI8uRS/p9QBl/uwRtHEy9DCGbuEZt6uI5ak5mGfznRsRBI6gyCV1KtjH+y9rHjkvfl23bFU7mX4=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=osyx.tech; spf=none smtp.mailfrom=osyx.tech; dkim=pass (2048-bit key) header.d=osyx-tech.20251104.gappssmtp.com header.i=@osyx-tech.20251104.gappssmtp.com header.b=FdOLxL3v; arc=none smtp.client-ip=209.85.221.47
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=osyx.tech
Authentication-Results: smtp.subspace.kernel.org; spf=none smtp.mailfrom=osyx.tech
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=osyx-tech.20251104.gappssmtp.com header.i=@osyx-tech.20251104.gappssmtp.com header.b="FdOLxL3v"
Received: by mail-wr1-f47.google.com with SMTP id ffacd0b85a97d-47ffaa8ebbdso1085597f8f.0
        for <devicetree@vger.kernel.org>; Fri, 07 Aug 2026 00:42:47 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=osyx-tech.20251104.gappssmtp.com; s=20251104; t=1786088566; x=1786693366; darn=vger.kernel.org;
        h=content-transfer-encoding:content-type:in-reply-to:content-language
         :references:cc:to:subject:from:user-agent:mime-version:date
         :message-id:from:to:cc:subject:date:message-id:reply-to:content-type;
        bh=sryGv+S1OFsRnB1y6bXfWiD/UiD8x5RMl0nBJ4p29PM=;
        b=FdOLxL3vCGIlvl/g1dcMiMn+Sgka7d6AGoLSX5hqtfh3HAsDTa7lcOFMKjDVXQlOO6
         2LHd7k+agH4usFmyGmHGIVSME2SWe7qbh/znbWafE2XEBX2n6pCDubvB4hqpFwiBDACo
         MI9Ix1ybs1kh4hoTJ0Jp09nJw1+GFmRxRxn3DYMfGVs6o3ET++3s3lsgVgTprKt18vZ7
         Mo2GR1bCT0AVKF+O1XhBB8/0gQh69DFbivC60YtUPmi5dBW/hdDedaI4X9Qz7KM/icDg
         tfjYqfy2zO/oKe76cRVgyPHbGOY9a5V4q7tL4JrhUgs47qC3301Nh8oC6tUbeJs0WuX0
         x6+w==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1786088566; x=1786693366;
        h=content-transfer-encoding:content-type:in-reply-to:content-language
         :references:cc:to:subject:from:user-agent:mime-version:date
         :message-id:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=sryGv+S1OFsRnB1y6bXfWiD/UiD8x5RMl0nBJ4p29PM=;
        b=oNRDqOZzpi7mp8o7Kdbys1ucA7dVp1OFHA2k8vp0U3qpEgrS4zt7sBWnWZaZtpYnkB
         2XMthCoEk93t2k/qkzq+a6Alhar5fCqJJR0K5+TccQmNszYzuoTqdOHDL6nkNQOcB8og
         O8xsVEHBuUl50uAqPlj1jilaBbrIL/xlI2EJ04IshVzadg07RSp0qsImtqLGaYHl9mKg
         ZZCX3Gt4bgpfpW1DWmOTRcFbtzI+XO38A9Si1G5Kl8nLrJdEzSplvwQ/6s3Nwa5P/1lK
         2/NZWoG7NkU7vqaIchpXuXY5k6n3IofHoRryhtc7CMeqJbBUd6Iwju2luZ6VadURacMC
         rzew==
X-Forwarded-Encrypted: i=1; AHgh+Rq6NbcyLjQlDaM3nt/+OA8jibkvANB8A+MV19IfWPIHEhIEDDMd5xde6SG24yFQVQEm7h5urCIpWkcl@vger.kernel.org
X-Gm-Message-State: AOJu0Yy/nE18S2Nrf7Z9SUNkGeLSYR/FfPfYEm6W7p0YVw54tA0zOSSH
	1zC1zeW6NX8kz9kkyT/WQIaUhacQiGhB4praINrNQ9WnyNJOUGfS0vjTb7bYQ0sC7k2v
X-Gm-Gg: AR+sD12apTT4FMTS1o2oUYJfY9weg7RxbOU04SlWF/UMbmona5DtzLYtuBC12y8p39Q
	aTFBN1kAvh/WqyHpf+jcgUtBMUuBGjsqyBs3n8OIchs8wfYjp7mQ0VKmnBfb1vDSLRSyDLbEnRY
	42ezyXp60955IVwgWEE3H9HHA0o/YEFjof1OGTUdoZGwoOpIg49eXNnDRJuLUJO0IY2bjUYcpUD
	e82b5Bjd5+hcV8iSx7Dy7De5QiVVQpUe+uEG1fVD6vuyx8LvOqNl1KNIMwlZadm00NPNPAtlFRz
	bojKKXJDO92xx/qH565AiB4kBfBwAPWKazByZRu69c0xjIeolyyylbemUCyMjZAaxV/SlE19tRE
	nmoQ5+yHWtBzjBpWMrjf3bYPg/TRuny3ggaFi0pNlpqc/FBVhXodn39pQmJnFvksY1wZxYlh/kp
	Kli/Sk1TR6TKulwPl0lLGll9eqKPx72UDGsUaA57S3xiTAd0M7xpdtS3ynyjmpqUhA43YR+OE7F
	YJL/Gljwp1phcM411RjktzdtUUYSfwi8g==
X-Received: by 2002:a05:6000:4704:b0:47f:6b9a:9d48 with SMTP id ffacd0b85a97d-47fec507a4cmr33818000f8f.13.1786088566064;
        Fri, 07 Aug 2026 00:42:46 -0700 (PDT)
Received: from ?IPV6:2001:8a0:f59c:a900:2600:fba1:8d1e:1692? ([2001:8a0:f59c:a900:2600:fba1:8d1e:1692])
        by smtp.gmail.com with ESMTPSA id ffacd0b85a97d-480021506desm3339493f8f.10.2026.08.07.00.42.27
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Fri, 07 Aug 2026 00:42:28 -0700 (PDT)
Message-ID: <402b7510-d695-45e6-b39b-e0cd2d61657f@osyx.tech>
Date: Fri, 7 Aug 2026 08:42:26 +0100
Precedence: bulk
X-Mailing-List: devicetree@vger.kernel.org
List-Id: <devicetree.vger.kernel.org>
List-Subscribe: <mailto:devicetree+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:devicetree+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
From: =?UTF-8?Q?Jo=C3=A3o_Peixoto?= <jpeixoto@osyx.tech>
Subject: Re: [PATCH 2/6] virt: bao: Add Bao IPC shared memory driver
To: Randy Dunlap <rdunlap@infradead.org>, joaopeixoto@osyx.tech,
 linux-kernel@vger.kernel.org
Cc: ajd@linux.ibm.com, alex@ghiti.fr, aou@eecs.berkeley.edu,
 bagasdotme@gmail.com, catalin.marinas@arm.com, conor+dt@kernel.org,
 corbet@lwn.net, dan.j.williams@intel.com, davidmcerdeira@osyx.tech,
 devicetree@vger.kernel.org, dev@kael-k.io, gregkh@linuxfoundation.org,
 haren@linux.ibm.com, heiko@sntech.de, jose@osyx.tech,
 kever.yang@rock-chips.com, krzk+dt@kernel.org,
 linux-arm-kernel@lists.infradead.org, linux-doc@vger.kernel.org,
 linux-riscv@lists.infradead.org, maddy@linux.ibm.com, mani@kernel.org,
 nathan@kernel.org, neil.armstrong@linaro.org, palmer@dabbelt.com,
 pjw@kernel.org, prabhakar.mahadev-lad.rj@bp.renesas.com, robh@kernel.org,
 will@kernel.org
References: <20251224135217.25350-1-joaopeixoto@osyx.tech>
 <20260107162829.416885-1-joaopeixoto@osyx.tech>
 <20260107162829.416885-3-joaopeixoto@osyx.tech>
 <df12062e-27ef-454d-b35b-526a88b5c7fa@infradead.org>
Content-Language: en-US
In-Reply-To: <df12062e-27ef-454d-b35b-526a88b5c7fa@infradead.org>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 8bit


On 1/7/26 18:54, Randy Dunlap wrote:
> On 1/7/26 8:28 AM,joaopeixoto@osyx.tech wrote:
>> diff --git a/drivers/virt/bao/ipcshmem/Kconfig b/drivers/virt/bao/ipcshmem/Kconfig
>> new file mode 100644
>> index 000000000000..966bb75aa495
>> --- /dev/null
>> +++ b/drivers/virt/bao/ipcshmem/Kconfig
>> @@ -0,0 +1,8 @@
>> +# SPDX-License-Identifier: GPL-2.0
>> +config BAO_SHMEM
>> +	tristate "Bao hypervisor shared memory support"
>> +	help
>> +	This enables support for Bao shared memory communication.
>> +	It allows the kernel to interface with guests running under
>> +	the Bao hypervisor, providing a character device interface
>> +	for exchanging data through dedicated shared-memory regions.
> Please follow Documentation/process/coding-style.rst:
>
> 10) Kconfig configuration files
> -------------------------------
>
> For all of the Kconfig* configuration files throughout the source tree,
> the indentation is somewhat different.  Lines under a ``config`` definition
> are indented with one tab, while help text is indented an additional two
> spaces.  Example::
>
>    config AUDIT
> 	bool "Auditing support"
> 	depends on NET
> 	help
> 	  Enable auditing infrastructure that can be used with another
> 	  kernel subsystem, such as SELinux (which requires this for
> 	  logging of avc messages output).  Does not do system-call
> 	  auditing without CONFIG_AUDITSYSCALL.
>
Fixed in v3, the help text is now indented one tab plus two spaces:

   config BAO_SHMEM
       tristate "Bao hypervisor shared memory support"
       help
         This enables support for Bao shared memory communication.
         [...]
         If unsure, say N.

Thanks for catching it.
