Received: from courrier.aliel.fr (courrier.aliel.fr [65.21.61.41])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 60BDA385D9D
	for <devicetree@vger.kernel.org>; Thu, 15 Oct 2026 18:23:50 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=65.21.61.41
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1792088637; cv=none; b=uj5P1YQhQtGph2IWJIXWgb8rb5bPSxElN5KPHonkEjBW7dwM8M8GI6fuIv8pBJMzSAH4eoVOPxJLkKIlFsUx0De/Q9MDRWXbgGM3quKMsD6VJBn3BiZZbBDGiWdiNCvMD1IMZHCW2qeTOj/Q63KwmCtFvEnVk9zJO4jX/XnZCyc=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1792088637; c=relaxed/simple;
	bh=B3xf2pbuUdxK9OYP4Fw1N/bpiOzq0M4mNmoXGKy7lZI=;
	h=Message-ID:Date:MIME-Version:From:Subject:To:Cc:References:
	 In-Reply-To:Content-Type; b=QAtTWWV94sAO8D2j1+Dj4aIK+BTW5bTUu1NMoruHKWEg72QQbjqD3TdJ8hkEg+MEg9JPa4KKtulN6ofJAYVsKlHDpZSYSi/Rz/xxIMSPp983NJzhPZSJMM2a/nqcRP+RiWJgbPiqy+xxkBZQKSNNM1RTuGzZN+60eN3pABJ3giE=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=aliel.fr; spf=pass smtp.mailfrom=aliel.fr; dkim=pass (1024-bit key) header.d=aliel.fr header.i=@aliel.fr header.b=HC+TrUo7; arc=none smtp.client-ip=65.21.61.41
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=aliel.fr
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=aliel.fr
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=aliel.fr header.i=@aliel.fr header.b="HC+TrUo7"
Message-ID: <3fe84e1c-8670-4d1b-88ac-37574af4f4f6@aliel.fr>
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=aliel.fr;
	s=courrier-s1; t=1792088104;
	bh=B3xf2pbuUdxK9OYP4Fw1N/bpiOzq0M4mNmoXGKy7lZI=;
	h=Date:From:Subject:To:Cc:References:In-Reply-To;
	b=HC+TrUo7l9D0xogwvPslevQxUhA/R02+d5U9GBkjFjoBxoYcrGgZ+BApnRwBNxUtp
	 BDSYtZJ+r2nw4khkwz39hWVkmO+6r2ztA3T1C1HLZ8fudqfiwdDEOgW0KG/AcHG1f9
	 MxIaYUDxvjeT2qsIJTjzUFwL0lzNJkebVOJ1jo+0=
Date: Thu, 15 Oct 2026 20:12:28 +0200
Precedence: bulk
X-Mailing-List: devicetree@vger.kernel.org
List-Id: <devicetree.vger.kernel.org>
List-Subscribe: <mailto:devicetree+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:devicetree+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird Beta
From: Ronald Claveau <linux-kernel-dev@aliel.fr>
Subject: Re: [PATCH v6 3/4] arm64: dts: amlogic: t7: Add thermal zones
To: sashiko-reviews@lists.linux.dev
Cc: linux-amlogic@lists.infradead.org, devicetree@vger.kernel.org,
 robh@kernel.org, conor+dt@kernel.org, neil.armstrong@linaro.org
References: <20261015-add-thermal-t7-vim4-v6-0-37d1c954390c@aliel.fr>
 <20261015-add-thermal-t7-vim4-v6-3-37d1c954390c@aliel.fr>
 <sashiko-outbox-173272@kernel.org>
Content-Language: en-US
In-Reply-To: <sashiko-outbox-173272@kernel.org>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit

On 10/15/26 8:00 PM, sashiko-bot@kernel.org wrote:
> Thank you for your contribution! Sashiko AI review found 1 potential issue(s) to consider:
> - [Medium] dts: thermal trip points labeled as 'hot' are incorrectly typed as 'passive'
> --
> 
> commit f22129efed7c6439714c1c2501834a6c01be9e9e
> Author: Ronald Claveau <linux-kernel-dev@aliel.fr>
> 
> arm64: dts: amlogic: t7: Add thermal zones
> 
> This commit adds thermal zones for all six sensors (a53, a73, gpu, nna,
> vpu, and hevc) to the amlogic t7 device tree configuration.
> 
>> diff --git a/arch/arm64/boot/dts/amlogic/amlogic-t7.dtsi b/arch/arm64/boot/dts/amlogic/amlogic-t7.dtsi
>> index c81632d3984e8..454a042865a5a 100644
>> --- a/arch/arm64/boot/dts/amlogic/amlogic-t7.dtsi
>> +++ b/arch/arm64/boot/dts/amlogic/amlogic-t7.dtsi
> 
> [ ... ]
> 
>> +		gpu_thermal: gpu-thermal {
>> +			polling-delay = <1000>;
>> +			polling-delay-passive = <100>;
>> +			thermal-sensors = <&gpu_tsensor>;
>> +
>> +			trips {
>> +				gpu_passive: gpu-passive {
>> +					temperature = <95000>;
>> +					hysteresis = <5000>;
>> +					type = "passive";
>> +				};
>> +
>> +				gpu_hot: gpu-hot {
>> +					temperature = <105000>;
>> +					hysteresis = <5000>;
>> +					type = "passive";
> 
> [Severity: Medium]
> Does this incorrectly set the trip type for gpu-hot to "passive" instead
> of "hot"? The thermal subsystem will treat this as a passive trip point,
> meaning the standard hot thermal events won't trigger at the 105°C
> threshold.
> 
>> +				};
> 
> [ ... ]
> 
>> +		hevc_thermal: hevc-thermal {
>> +			polling-delay = <1000>;
>> +			polling-delay-passive = <100>;
>> +			thermal-sensors = <&hevc_tsensor>;
>> +
>> +			trips {
>> +				hevc_passive: hevc-passive {
>> +					temperature = <95000>;
>> +					hysteresis = <5000>;
>> +					type = "passive";
>> +				};
>> +
>> +				hevc_hot: hevc-hot {
>> +					temperature = <105000>;
>> +					hysteresis = <5000>;
>> +					type = "passive";
> 
> [Severity: Medium]
> Similarly, should the type for hevc-hot be "hot" rather than "passive"?
> 
>> +				};
> 
> [ ... ]
> 
>> +		nna_thermal: nna-thermal {
>> +			polling-delay = <1000>;
>> +			polling-delay-passive = <100>;
>> +			thermal-sensors = <&nna_tsensor>;
>> +
>> +			trips {
>> +				nna_passive: nna-passive {
>> +					temperature = <95000>;
>> +					hysteresis = <5000>;
>> +					type = "passive";
>> +				};
>> +
>> +				nna_hot: nna-hot {
>> +					temperature = <105000>;
>> +					hysteresis = <5000>;
>> +					type = "passive";
> 
> [Severity: Medium]
> Does this nna-hot trip point also need its type updated to "hot" so that
> it behaves distinctly from the passive trip point?
> 
>> +				};
> 
> [ ... ]
> 
>> +		vpu_thermal: vpu-thermal {
>> +			polling-delay = <1000>;
>> +			polling-delay-passive = <100>;
>> +			thermal-sensors = <&vpu_tsensor>;
>> +
>> +			trips {
>> +				vpu_passive: vpu-passive {
>> +					temperature = <95000>;
>> +					hysteresis = <5000>;
>> +					type = "passive";
>> +				};
>> +
>> +				vpu_hot: vpu-hot {
>> +					temperature = <105000>;
>> +					hysteresis = <5000>;
>> +					type = "passive";
> 
> [Severity: Medium]
> Is this another instance where the vpu-hot type was intended to be
> "hot" rather than "passive"?
> 
>> +				};
> 

You right, I will change them on next version.

-- 
Best regards,
Ronald
