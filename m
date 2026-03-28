Received: from out-179.mta0.migadu.com (out-179.mta0.migadu.com [91.218.175.179])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 4F90A36AB77
	for <devicetree@vger.kernel.org>; Sat, 28 Mar 2026 08:22:10 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=91.218.175.179
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1774686134; cv=none; b=Vuznc66Gm5f0Ryo7DoCwxHCILqmoGGwRBgoTZL0ebKmvNS7PD3nq3ol4D7VE9o8kypCcVzbGeO2I//lWv4r1bqf7WQOlOyGc/HYtQmzWiKrOGXME59pH/qJL9g5aMuOFV9dSgsyPqip68EYia3sVTbiwIGVgh39IWRgtNuLRFmE=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1774686134; c=relaxed/simple;
	bh=Be+hfXS0+oA4TyoSNFCSOnIxtlg9LmLDkoiIsipDyUk=;
	h=Message-ID:Date:MIME-Version:Subject:To:Cc:References:From:
	 In-Reply-To:Content-Type; b=MA4uR0aNzd5YVOCIZR51g1j4BFuZ8wbl/Gq/NUxIcdVuoJD7V8fLdkSL5EnFPJfFaJUd9SMx+9TrNgBnRILtATjBk6g2crMi//obQnvCnfaLQ+WVHfkzlwBcZWqUDp65f8DJ+qgQ/uVmToOqCkIH32KwF5cLXkCCj8JYiP8gRhI=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=packett.cool; spf=pass smtp.mailfrom=packett.cool; dkim=pass (2048-bit key) header.d=packett.cool header.i=@packett.cool header.b=JxhzCGeN; arc=none smtp.client-ip=91.218.175.179
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=packett.cool
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=packett.cool
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=packett.cool header.i=@packett.cool header.b="JxhzCGeN"
Message-ID: <3b968230-c64a-41dd-a145-81b4e68dd39b@packett.cool>
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=packett.cool;
	s=key1; t=1774686128;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references;
	bh=fX+9bAQHy7d724x0bps6NZLEAxnQxD4hcWumn7cv9vg=;
	b=JxhzCGeNN9XHn5nuxHyIVnEg9uUyaRhelE23HoTcYZQubWLwr9vM+6xSvOsErYc0dHq7nb
	x+2v2inVESgxbDhojZhZeDFHYWIQAczcKupmVwpf7car2PeygWD2xJQXwqrVtZ+FWnSp2j
	MbEx8QKrQg+lXMT3H0GOP8M7suakJM6KmPqWSNGoD4jJsFZ1RZJfM9bDffcYL0Nb18OPwu
	Zh7RAr8x9aH7WHDIYSA3r5HOgwk+DdYLwMIIfEB1XX0PvvHF5CxrHfHPltEU/wpZxMWzI7
	fijnPailCMVJudSj0850FV7fuyNdA8HZrySvHSLqyLDutE4Mo4IE3o75AGTfXw==
Date: Sat, 28 Mar 2026 05:22:00 -0300
Precedence: bulk
X-Mailing-List: devicetree@vger.kernel.org
List-Id: <devicetree.vger.kernel.org>
List-Subscribe: <mailto:devicetree+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:devicetree+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Subject: Re: [PATCH v2] arm64: dts: qcom: hamoa: Add remoteproc in EL2 device
 trees
To: Stephan Gerhold <stephan.gerhold@linaro.org>,
 Bjorn Andersson <andersson@kernel.org>
Cc: Xin Liu <xin.liu@oss.qualcomm.com>, konradybcio@kernel.org,
 robh@kernel.org, krzk+dt@kernel.org, conor+dt@kernel.org,
 linux-arm-msm@vger.kernel.org, devicetree@vger.kernel.org,
 linux-kernel@vger.kernel.org, tingwei.zhang@oss.qualcomm.com,
 jie.gan@oss.qualcomm.com
References: <20260202055436.818098-1-xin.liu@oss.qualcomm.com>
 <ao4jf5guszon6iuyyvzmkuaf2iaa56y3b33srx2w3whtyo2u3r@k74fxy3ktsyo>
 <aalhik53l4ioxiLx@linaro.org>
Content-Language: en-US
X-Report-Abuse: Please report any abuse attempt to abuse@migadu.com and include these headers.
From: Val Packett <val@packett.cool>
In-Reply-To: <aalhik53l4ioxiLx@linaro.org>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 8bit
X-Migadu-Flow: FLOW_OUT


On 3/5/26 7:57 AM, Stephan Gerhold wrote:
> On Wed, Mar 04, 2026 at 02:16:55PM -0600, Bjorn Andersson wrote:
>> On Sun, Feb 01, 2026 at 09:54:36PM -0800, Xin Liu wrote:
>>> All the existing variants Hamoa boards are using Gunyah hypervisor
>>> which means that, so far, Linux-based OS could only boot in EL1 on
>>> those devices. However, it is possible for us to boot Linux at EL2
>>> on these devices [1].
>>>
>> Lots of people are running Linux at EL2 on their Hamoa laptops, but
>> then there's no PAS. I presume adding iommu properties won't "hurt" in
>> that case, but can you confirm that with this change remoteproc is fully
>> working somewhere (i.e. [1] refers to a firmware for which the Glymur
>> PAS/PIL changes has been backported?)
>>
> On the contrary, I would expect that this will break the existing EL2
> setup people have on their Hamoa laptops. I have last tested this half a
> year ago (and I don't have a suitable device for testing this anymore),
> but I don't think much has changed in this area:

It did break and I just spent like 3 hours debugging before realizing I 
shouldn't've just merged x1-el2 like that…

It first showed up as a "weird" hang when booting into EL2, as soon as 
SMMU related lines started showing up on the framebuffer console it 
slowed down to a crawl for a couple of these lines and then totally froze.

Disabling qebspil (i.e. having only adsp-lite loaded) let the output 
proceed for a little bit more and I saw the faults (tens of thousands of 
faults, all fsr=0x402, iova=0x86b020c0, fsynr=0x600040, SID=0x1000) and 
a hard LOCKUP being detected.

> Since we can't start/stop remoteprocs without PAS,
(Can someone at Qualcomm ask how Windows does it?)
> everyone using EL2
> with the old (non-PAS) firmware currently relies on remoteprocs that are
> already started by the boot firmware before Linux is started. This can
> be just the "lite" ADSP that is started by UEFI for initial charging and
> USB-C detection, or even the full ADSP/CDSP via a custom UEFI driver
> (qebspil [1]). All of these will stay running even if we fail to
> stop/start them via PAS. Without extra kernel patches, we can't make use
> of the remoteprocs, but the lite ADSP firmware will probably continue
> doing its work in the background, i.e. it will start/stop charging as
> needed, you just won't be able to observe the status from Linux.
>
> We manage the full IOMMU even when there is no PAS. The reason why
> people are not running into issues is that the bootloader handover code
> inside arm-smmu-qcom.c qcom_smmu_cfg_probe() configures bypass for all
> SIDs used by the boot firmware, which includes the SIDs for all the
> remoteprocs. Adding these SIDs in the "iommus" property of an actual
> device will replace the bypass with a translated context, which
> currently won't be set up anywhere for the non-PAS use case.

hm, maybe the patches supporting the handover could be updated to set up 
the context in the non-PAS case?

> In addition, even on newer firmware with PAS support I would expect that
> special care is required to "atomically" handover the IOMMU
> configuration from the bootloader. If the lite ADSP remains running on
> these firmware versions as well, the bypass or suitable mappings must be
> maintained until the lite ADSP firmware is stopped.
> […]
Thanks,
~val
