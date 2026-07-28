Received: from smtp.kernel.org (aws-us-west-2-korg-mail-alma10-1.taild15c8.ts.net [100.103.45.18])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 407A642BC35;
	Tue, 28 Jul 2026 12:22:22 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=100.103.45.18
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1785241343; cv=none; b=fb6x6ZHPHoYf68/AiNMtAABhDN2Udps0S7WsIo5t4/4/dslPkG0pNEp5x/gjdtgb3hxxsKITMcmUOxE6GZfM8BYpkzhPkw8c6SqzL3zfWYQtqrPOh9WcOh7rBVtb2//LII2kAGYoguioWkrd+i9ojWFV2vRTbcRXgAokN+AXypo=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1785241343; c=relaxed/simple;
	bh=B1PKlz59XZ5PS/KbSFuub8qaNxWpUel59+yPqHEeOko=;
	h=Message-ID:Date:MIME-Version:Subject:To:Cc:References:From:
	 In-Reply-To:Content-Type; b=PRK7gFk0NXuYIZiwvrmNwQ9GxU4yhkdgYvPJWS2IDZYlzB2il3/wiz4Wu16O0OSKvYSXD/0doYl0koVT+FwHmzv3lkK0W18OX/kclq5ud3JcX+/u00D3nDSdG3ovqJ+ZRR9BzIRT19Xcn15aY7088uTKpqXrnbCRN1jmOLl06z4=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=deiLwknW; arc=none smtp.client-ip=100.103.45.18
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="deiLwknW"
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 2683F1F000E9;
	Tue, 28 Jul 2026 12:22:14 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kernel.org;
	s=k20260515; t=1785241341;
	bh=rBy5g8NYcnJbw7Xgeeb96XTeGXA83PiVJTflhJ4BZfo=;
	h=Date:Subject:To:Cc:References:From:In-Reply-To;
	b=deiLwknWBRyU1HtBPVUmhOvNSLR21oGECMpdrqfLi7KwcqzFNR1ptipP+AgBy29nr
	 kARdcOEI4UNMvH9jTtGFax3qGXN4UUoKBXUWb9ZVQ1XJh2dMmwAOq/tPjQFVQlrUPz
	 U/4Djn0jqK99rTgIQOUUrJfwNpK2HGELv0/7W/F8YpfaOZjuARCUp3/eWSABMdg204
	 PYRvw1642VY5nHUucltDtFx/MhOT9ywwmmNN2H8QHrT6XaAFiD/ynNVludDR6LLcTb
	 +vqOhhcqASIRJWlbgwEtbnReCDXb6APNozkMO04u/tZPzAj1qNdyoOj9N1bDXWJHRt
	 YrCM4pzkg+aqQ==
Message-ID: <c714e746-8b58-42d8-8c37-160f8c5b5a59@kernel.org>
Date: Tue, 28 Jul 2026 14:22:12 +0200
Precedence: bulk
X-Mailing-List: devicetree@vger.kernel.org
List-Id: <devicetree.vger.kernel.org>
List-Subscribe: <mailto:devicetree+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:devicetree+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH V3 2/4] dt-bindings: mmc: sdhci-msm: Document the Glymur
 compatible
To: Monish Chunara <monish.chunara@oss.qualcomm.com>
Cc: Bjorn Andersson <andersson@kernel.org>,
 Konrad Dybcio <konradybcio@kernel.org>, Rob Herring <robh@kernel.org>,
 Krzysztof Kozlowski <krzk+dt@kernel.org>, Conor Dooley
 <conor+dt@kernel.org>, Nitin Rawat <nitin.rawat@oss.qualcomm.com>,
 Pradeep Pragallapati <pradeep.pragallapati@oss.qualcomm.com>,
 Komal Bajaj <komal.bajaj@oss.qualcomm.com>,
 Sachin Rathore <sachin.rathore@oss.qualcomm.com>,
 linux-arm-msm@vger.kernel.org, devicetree@vger.kernel.org,
 linux-kernel@vger.kernel.org, Sachin <ssachin@qti.qualcomm.com>
References: <20260706141346.4180348-1-mchunara@oss.qualcomm.com>
 <20260706141346.4180348-3-mchunara@oss.qualcomm.com>
 <20260708-purring-infallible-bullmastiff-8f6dea@quoll>
 <afb0862a-04d0-4171-887b-7f32ee64163f@oss.qualcomm.com>
From: Krzysztof Kozlowski <krzk@kernel.org>
Content-Language: en-US
Autocrypt: addr=krzk@kernel.org; keydata=
 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
In-Reply-To: <afb0862a-04d0-4171-887b-7f32ee64163f@oss.qualcomm.com>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit

On 21/07/2026 16:30, Monish Chunara wrote:
> 
> 
> On 7/8/2026 12:18 PM, Krzysztof Kozlowski wrote:
>> On Mon, Jul 06, 2026 at 07:43:44PM +0530, Monish Chunara wrote:
>>> From: Monish Chunara <monish.chunara@oss.qualcomm.com>
>>>
>>> Glymur integrates the MSM SDHCI v5 controller. Document the SoC-specific
>>> 'qcom,glymur-sdhci' compatible as required by binding convention to
>>> identify the hardware and reserve the namespace for future SoC-specific
>>> quirks, with 'qcom,sdhci-msm-v5' as the fallback.
>>
>> Drop half of above sentence.
>>
>> "Document the SDHCI controller on Qualcomm Glymur soC, fully compatible
>> with existing MSM SDHCI v5."
>>
>> You do not need to say anything about some conventions or reserving
>> namespaces. We do not reserve namespaces...
>>
>> Acked-by: Krzysztof Kozlowski <krzysztof.kozlowski@oss.qualcomm.com>
>>
>> Best regards,
>> Krzysztof
>>
> 
> Sure, thanks. will update in v4. 
> 
> Just for my understanding, though: how does the suggested wording capture the 
> why behind the change? Per previous comments and understanding, the rationale 
> for introducing the SoC-specific compatible is the reason we are making this 
> change. For future submissions, this would help to avoid similar back-and-forth.
> 

Why do you think you need to document the "why" if it is 100% obvious
(and I did state it many times)?

Best regards,
Krzysztof
