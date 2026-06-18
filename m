Received: from szxga01-in.huawei.com (szxga01-in.huawei.com [45.249.212.187])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id BBF8640D56F
	for <devicetree@vger.kernel.org>; Thu, 18 Jun 2026 01:45:32 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=45.249.212.187
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1781747136; cv=none; b=mPuatzUqixk4hOjNdEjoMpmaRgtQhWD1fiDyUTd9wziFcsl+nF+HjqV1C+8hFN0zZUjXdRFTbqtb7ZHCKWq4mKYejJXzFhDyb9V7P2goHcF+DrNfiazkbGFGOxJuF6b+MpdQ3W6g6umPjZLltnXaJt9SuRA3jzChYFzx8Ue+DjU=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1781747136; c=relaxed/simple;
	bh=ddQ+SMN/+Lp7HFPmuIVAxMq7wm4oLOOuYVK6wbQbSU0=;
	h=Message-ID:Date:MIME-Version:Subject:To:CC:References:From:
	 In-Reply-To:Content-Type; b=IcziNSsutIABUt8X6tFXHMcdgc6xW0MtwnXV3vG6J0c8rZMNyTEC+Dms0k3VWUDD0zU2fN57bRvsV0n6TmYyXs4Tg7ftVR3td5bQBlus/j9BjPY9lxehX3NL7JO04ml/NmWHmTZJ8elalwTcM35Slms15uoUDLdYLrP/Yj82xDQ=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=huawei.com; spf=pass smtp.mailfrom=huawei.com; dkim=pass (1024-bit key) header.d=huawei.com header.i=@huawei.com header.b=mKZIAMgr; dkim=pass (1024-bit key) header.d=huawei.com header.i=@huawei.com header.b=mKZIAMgr; arc=none smtp.client-ip=45.249.212.187
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=huawei.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=huawei.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=huawei.com header.i=@huawei.com header.b="mKZIAMgr";
	dkim=pass (1024-bit key) header.d=huawei.com header.i=@huawei.com header.b="mKZIAMgr"
dkim-signature: v=1; a=rsa-sha256; d=huawei.com; s=dkim;
	c=relaxed/relaxed; q=dns/txt;
	h=From;
	bh=elgYJ9FctEuOCR5N0/Evesj9qTtWETUXJRRIi/jFI38=;
	b=mKZIAMgrv0yhhqfotPRGtcu6nLs4Chv0duVXxR76TfyQ3YmTy1nupn328cT3+Yi8uyhE+9n3j
	uc7hX8yW3e8zJNd2aoWbAUFQRgY3AFqjEchvsWtvpFlpDHyb9xAegYA4dU42PHQBl0b7E74Ye3c
	bNyffaauQdereWE6+Bi3IAM=
Received: from canpmsgout11.his.huawei.com (unknown [172.19.92.148])
	by szxga01-in.huawei.com (SkyGuard) with ESMTPS id 4ggk7D3kLRz1BG6g
	for <devicetree@vger.kernel.org>; Thu, 18 Jun 2026 09:44:56 +0800 (CST)
dkim-signature: v=1; a=rsa-sha256; d=huawei.com; s=dkim;
	c=relaxed/relaxed; q=dns/txt;
	h=From;
	bh=elgYJ9FctEuOCR5N0/Evesj9qTtWETUXJRRIi/jFI38=;
	b=mKZIAMgrv0yhhqfotPRGtcu6nLs4Chv0duVXxR76TfyQ3YmTy1nupn328cT3+Yi8uyhE+9n3j
	uc7hX8yW3e8zJNd2aoWbAUFQRgY3AFqjEchvsWtvpFlpDHyb9xAegYA4dU42PHQBl0b7E74Ye3c
	bNyffaauQdereWE6+Bi3IAM=
Received: from mail.maildlp.com (unknown [172.19.163.127])
	by canpmsgout11.his.huawei.com (SkyGuard) with ESMTPS id 4ggjyS3PN2zKm62;
	Thu, 18 Jun 2026 09:37:20 +0800 (CST)
Received: from dggpemf500011.china.huawei.com (unknown [7.185.36.131])
	by mail.maildlp.com (Postfix) with ESMTPS id DADF3402AB;
	Thu, 18 Jun 2026 09:45:21 +0800 (CST)
Received: from [10.67.109.254] (10.67.109.254) by
 dggpemf500011.china.huawei.com (7.185.36.131) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.1544.11; Thu, 18 Jun 2026 09:45:17 +0800
Message-ID: <6437c0e3-d5c5-44b1-9157-b30bae2a6335@huawei.com>
Date: Thu, 18 Jun 2026 09:45:17 +0800
Precedence: bulk
X-Mailing-List: devicetree@vger.kernel.org
List-Id: <devicetree.vger.kernel.org>
List-Subscribe: <mailto:devicetree+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:devicetree+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v16 00/10] arm64/riscv: Add support for crashkernel CMA
 reservation
To: Mike Rapoport <rppt@kernel.org>
CC: <corbet@lwn.net>, <skhan@linuxfoundation.org>, <catalin.marinas@arm.com>,
	<will@kernel.org>, <chenhuacai@kernel.org>, <kernel@xen0n.name>,
	<maddy@linux.ibm.com>, <mpe@ellerman.id.au>, <npiggin@gmail.com>,
	<chleroy@kernel.org>, <pjw@kernel.org>, <palmer@dabbelt.com>,
	<aou@eecs.berkeley.edu>, <alex@ghiti.fr>, <tglx@kernel.org>,
	<mingo@redhat.com>, <bp@alien8.de>, <dave.hansen@linux.intel.com>,
	<hpa@zytor.com>, <robh@kernel.org>, <saravanak@kernel.org>,
	<akpm@linux-foundation.org>, <bhe@redhat.com>, <pasha.tatashin@soleen.com>,
	<pratyush@kernel.org>, <ruirui.yang@linux.dev>, <rdunlap@infradead.org>,
	<peterz@infradead.org>, <feng.tang@linux.alibaba.com>,
	<dapeng1.mi@linux.intel.com>, <kees@kernel.org>, <elver@google.com>,
	<kuba@kernel.org>, <lirongqing@baidu.com>, <ebiggers@kernel.org>,
	<paulmck@kernel.org>, <leitao@debian.org>, <coxu@redhat.com>,
	<Liam.Howlett@oracle.com>, <ryan.roberts@arm.com>, <osandov@fb.com>,
	<jbohac@suse.cz>, <cfsworks@gmail.com>, <tangyouling@kylinos.cn>,
	<sourabhjain@linux.ibm.com>, <ritesh.list@gmail.com>,
	<adityag@linux.ibm.com>, <liaoyuanhong@vivo.com>, <seanjc@google.com>,
	<fuqiang.wang@easystack.cn>, <ardb@kernel.org>, <chenjiahao16@huawei.com>,
	<guoren@kernel.org>, <x86@kernel.org>, <linux-doc@vger.kernel.org>,
	<linux-kernel@vger.kernel.org>, <linux-arm-kernel@lists.infradead.org>,
	<loongarch@lists.linux.dev>, <linuxppc-dev@lists.ozlabs.org>,
	<linux-riscv@lists.infradead.org>, <devicetree@vger.kernel.org>,
	<kexec@lists.infradead.org>
References: <20260608073459.3119290-1-ruanjinjie@huawei.com>
 <ajLr53EK6mJbng-7@kernel.org>
From: Jinjie Ruan <ruanjinjie@huawei.com>
In-Reply-To: <ajLr53EK6mJbng-7@kernel.org>
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: 7bit
X-ClientProxiedBy: kwepems500002.china.huawei.com (7.221.188.17) To
 dggpemf500011.china.huawei.com (7.185.36.131)



On 6/18/2026 2:48 AM, Mike Rapoport wrote:
> Hi Jinjie,
> 
> On Mon, Jun 08, 2026 at 03:34:49PM +0800, Jinjie Ruan wrote:
>> The crash memory allocation, and the exclude of crashk_res, crashk_low_res
>> and crashk_cma memory are almost identical across different architectures,
>> This patch set handle them in crash core in a general way, which eliminate
>> a lot of duplication code.
>>
>> And add support for crashkernel CMA reservation for arm64 and riscv.
>>
>> This patch set is rebased on v7.1-rc1.
> 
> Please rebase this set on v7.2-rc1 once that's out.
> 
> I'm going to queue it in the liveupdate tree then to expose to the wider
> testing.
> 
> Meanwhile it would be great to chase riscv and x86 maintainers for acks :)

Thanks! That sounds great.

I will rebase this patch set on v7.2-rc1 as soon as it is out and send v17.

In the meantime, I will CC and reach out to the RISC-V and x86
maintainers to request their reviews and Acks.

Best regards,
Jinjie

> 

