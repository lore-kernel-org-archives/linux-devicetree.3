Received: from foss.arm.com (foss.arm.com [217.140.110.172])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 234E028CF5F;
	Sat,  1 Aug 2026 23:06:13 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=217.140.110.172
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1785625577; cv=none; b=GBGhtpv3VnYlwnskHemAO2plzu4iAhDOEOsLTGRzUqSHyv2psDab3XWQStPsHXP/s7JeFMTmjK96L2V9XWNosfYHbj6C+GUPKcSkl/DITCNrZSH2uaS1wUE1rQUDXtDGnDctVDdu7/g2vKX8ICcXyjrJrkYxskAub6q1gB4f/LY=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1785625577; c=relaxed/simple;
	bh=VCsMPvENB/EG0ir/PH84HdgJjSI3j72YuLIrMhnfdkA=;
	h=Message-ID:Date:MIME-Version:Subject:To:References:Cc:From:
	 In-Reply-To:Content-Type; b=qms4j/90+Ua5bNwiT7+V9I/LCBVa/yJ/koOqnh95YWkwD/omkbHOLLk4r3VyL3ZVc5ZW1lqrSm5hFuionY6NxsZK8GhTIlZuTenMm4jw/r76btBq+8JDXokZnI6NSQQbTb+nvpBKRXYNGcAYqQQEttKWIh13IzX5gbVoGZYqSnc=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=arm.com; spf=pass smtp.mailfrom=arm.com; dkim=pass (1024-bit key) header.d=arm.com header.i=@arm.com header.b=Yp/uRh90; arc=none smtp.client-ip=217.140.110.172
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=arm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=arm.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=arm.com header.i=@arm.com header.b="Yp/uRh90"
Received: from usa-sjc-imap-foss1.foss.arm.com (unknown [10.121.207.14])
	by usa-sjc-mx-foss1.foss.arm.com (Postfix) with ESMTP id D7BE414BF;
	Sat,  1 Aug 2026 16:06:02 -0700 (PDT)
Received: from [10.57.44.153] (unknown [10.57.44.153])
	by usa-sjc-imap-foss1.foss.arm.com (Postfix) with ESMTPSA id C6AE63F86F;
	Sat,  1 Aug 2026 16:06:05 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=simple/simple; d=arm.com; s=foss;
	t=1785625566; bh=VCsMPvENB/EG0ir/PH84HdgJjSI3j72YuLIrMhnfdkA=;
	h=Date:Subject:To:References:Cc:From:In-Reply-To:From;
	b=Yp/uRh90VqPz42sF9aRie/eqh6p9OoYcgrGqrqgn64ZWpljGswNWAOki31o5x/PIt
	 ChYrKh+pF8eZB7HAWA8klSCQ8WjRXOZkFZwsxwCAKzPaSdoTInlaNhzq5cP9suPX2G
	 IdtzvzRUI4W24ddET3VprlsptbQv7U7hk2o0nxKY=
Message-ID: <eeacefd9-e8da-41e4-858e-5b28ab0c3571@arm.com>
Date: Sun, 2 Aug 2026 00:06:04 +0100
Precedence: bulk
X-Mailing-List: devicetree@vger.kernel.org
List-Id: <devicetree.vger.kernel.org>
List-Subscribe: <mailto:devicetree+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:devicetree+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH] dt-bindings: Correct white-space style
To: Krzysztof Kozlowski <krzysztof.kozlowski@oss.qualcomm.com>,
 Rob Herring <robh@kernel.org>, Krzysztof Kozlowski <krzk+dt@kernel.org>,
 Mike Leach <mike.leach@arm.com>, James Clark <james.clark@linaro.org>,
 Leo Yan <leo.yan@arm.com>
References: <20260801195613.235430-2-krzysztof.kozlowski@oss.qualcomm.com>
Content-Language: en-GB
Cc: "linux-arm-kernel@lists.infradead.org"
 <linux-arm-kernel@lists.infradead.org>,
 "linux-kernel@vger.kernel.org" <linux-kernel@vger.kernel.org>,
 "devicetree@vger.kernel.org" <devicetree@vger.kernel.org>
From: Suzuki K Poulose <suzuki.poulose@arm.com>
In-Reply-To: <20260801195613.235430-2-krzysztof.kozlowski@oss.qualcomm.com>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit

On 01/08/2026 20:56, Krzysztof Kozlowski wrote:
> Correct a few white-space issues, like double space after '=' or before
> bracket '{' characters, which will be flagged by dt-check-style.  No
> functional changes.
> 
> Signed-off-by: Krzysztof Kozlowski <krzysztof.kozlowski@oss.qualcomm.com>
> 
> ---
> 
> Patch applies on Rob's for-next branch.
> ---

For:

>   .../bindings/arm/qcom,coresight-tnoc.yaml     |  2 +-

Acked-by: Suzuki K Poulose <suzuki.poulose@arm.com>

Suzuki
