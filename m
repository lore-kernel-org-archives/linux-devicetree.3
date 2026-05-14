Received: from mout-p-202.mailbox.org (mout-p-202.mailbox.org [80.241.56.172])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id DE81F371CEA
	for <devicetree@vger.kernel.org>; Thu, 14 May 2026 12:39:22 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=80.241.56.172
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1778762365; cv=none; b=NGYQAx5vs8VPlNcuuVCztQgG3ir5Yikog49cWJNVoEuB6TxBah50VVU2uCqsLRue+0wgqzOs6V5LdNs5G3mRRTFWmmRTWJcfAB6SQUmUrzUBbomMOeLXFJEojv1pGhXv/ctJ/9C9jtpBhG0jMykn1C7reKODchZBTxQ1//btI5g=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1778762365; c=relaxed/simple;
	bh=UySqk39eLeBGFovBsVX8rglvRObVY1qw44G+jUTi6Kk=;
	h=Message-ID:Date:MIME-Version:Subject:To:Cc:References:From:
	 In-Reply-To:Content-Type; b=dije/lFLLuZIIjDOb8KBHd6Y7u401XqxMjgr8iZWbbWlZwslMO2ToLpsgqLEvXgk0SuihIfmCZHzD6MoB7bFSurdDbrxIwFBwcXgs9VG1aOSKw2DvtbtteAbu/uUWZMRgyV7pyk4Dg6VWTk8H60gzCixDbaHwoTqRLmrJspRPMg=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=mailbox.org; spf=pass smtp.mailfrom=mailbox.org; dkim=pass (2048-bit key) header.d=mailbox.org header.i=@mailbox.org header.b=O/DYH6at; arc=none smtp.client-ip=80.241.56.172
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=mailbox.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=mailbox.org
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=mailbox.org header.i=@mailbox.org header.b="O/DYH6at"
Received: from smtp1.mailbox.org (smtp1.mailbox.org [10.196.197.1])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (4096 bits) server-digest SHA256)
	(No client certificate requested)
	by mout-p-202.mailbox.org (Postfix) with ESMTPS id 4gGVJK73L5z9vJG;
	Thu, 14 May 2026 14:39:13 +0200 (CEST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=mailbox.org; s=mail20150812;
	t=1778762354;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references;
	bh=+Al+E25T9nH6Toq2pPBuCg+7e3th62bMfctEjg5m7XY=;
	b=O/DYH6atxg7+xzFp9yKovYNtwfwgDzf0TvhIjE9rN0jW4UCdSOEIhYylD+P6xl2BvxwnNK
	ATzS7p3JWK3z/cJQW7lzhuSehglDKnF46yT28sYMJnUo3HbdTkgfHNddkx4Wl1jdO2KS83
	5+NyCPZmH3WXj7y7Hc4G81snsfZMVwsND1REnPOga0pNN+OSN9T/1GGgmQDJOiqeg9lQKf
	Z24yfzAUtF7SN2v2YXDqdCSxRBV166wvczxbBWRmvyOxcsvSQ4n/kk3jDDb5aOHsD/85ey
	GEhAGhQQsLAQEdAQHnKnvEK3mkXVhgJiTfISIhxlMPDGXs33pq8rd2Q1Z/U94g==
Message-ID: <5bf3c863-0959-4625-b9b6-f5ea36c0bcea@mailbox.org>
Date: Thu, 14 May 2026 14:39:12 +0200
Precedence: bulk
X-Mailing-List: devicetree@vger.kernel.org
List-Id: <devicetree.vger.kernel.org>
List-Subscribe: <mailto:devicetree+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:devicetree+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Subject: Re: [PATCH] arm64: dts: renesas: r8a78000: Add PSCI node
To: devicetree@vger.kernel.org
Cc: wsa+renesas@sang-engineering.com, conor+dt@kernel.org,
 krzk+dt@kernel.org, robh@kernel.org
References: <20260513225037.49803-1-marek.vasut+renesas@mailbox.org>
 <20260514113120.0B5EDC2BCC7@smtp.kernel.org>
Content-Language: en-US
From: Marek Vasut <marek.vasut@mailbox.org>
In-Reply-To: <20260514113120.0B5EDC2BCC7@smtp.kernel.org>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit
X-MBO-RS-META: h6jmefa7o7iugmasdtsa44kq35bs1gnq
X-MBO-RS-ID: 492c82e004175c6d62e

On 5/14/26 1:31 PM, sashiko-bot@kernel.org wrote:
> Thank you for your contribution! Sashiko AI review found 1 potential issue(s) to consider:
> - [High] Missing 'enable-method' in CPU nodes prevents SMP bring-up.
> --
> 
> commit 0e20af8dd1fbf54360d3f87985cba2a59a5ee08f
> Author: Marek Vasut <marek.vasut+renesas@mailbox.org>
> arm64: dts: renesas: r8a78000: Add PSCI node
> 
> This commit adds the PSCI node to the r8a78000 device tree to describe SMC
> based access. This enables interaction with the TFA BL31 PSCI provider for
> tasks such as CPU power management.
> 
>> diff --git a/arch/arm64/boot/dts/renesas/r8a78000.dtsi b/arch/arm64/boot/dts/renesas/r8a78000.dtsi
>> index 4c97298fa7634..9e759ea46ee20 100644
>> --- a/arch/arm64/boot/dts/renesas/r8a78000.dtsi
>> +++ b/arch/arm64/boot/dts/renesas/r8a78000.dtsi
> 
> [ ... ]
> 
>> @@ -665,6 +665,11 @@ extalr_clk: extalr-clk {
>>   		/* clock-frequency must be set on board */
>>   	};
>>   
>> +	psci {
>> +		compatible = "arm,psci-1.0";
>> +		method = "smc";
>> +	};
>> +
> 
> Does this also require updating the CPU nodes to actually use PSCI?
> 
> Looking at the ARM64 SMP bring-up in arch/arm64/kernel/cpu_ops.c, the kernel
> relies on cpu_read_enable_method() to determine how to wake up secondary
> CPUs. It expects an enable-method property in the device tree for each CPU
> node:
> 
> arch/arm64/kernel/cpu_ops.c:cpu_read_enable_method() {
>          ...
>          dn = of_get_cpu_node(cpu, NULL);
>          ...
>          enable_method = of_get_property(dn, "enable-method", NULL);
>          if (!enable_method) {
>                  ...
>          }
>          ...
> }
> 
> Without adding enable-method = "psci" to the cpu nodes in r8a78000.dtsi,
> does this cause an SMP regression where the system fails to initialize
> secondary cores and boots as a single-core system?
PSCI is used here to power off / reboot the system, SMP enablement is a 
separate topic and a separate patch.
