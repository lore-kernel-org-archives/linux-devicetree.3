Received: from smtp.kernel.org (aws-us-west-2-korg-mail-alma10-1.taild15c8.ts.net [100.103.45.18])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id ACA563B47D6;
	Tue, 28 Jul 2026 12:29:16 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=100.103.45.18
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1785241757; cv=none; b=fc6xogJBvhRvYGfa4hNJkh+Iw6yCm6QXxQGcM9/D4ilokSdvh2P/5F2wmdPfzXiuLE1FnwqwhgAySHi3dE6VCK5qXL3Xex+dEtL85fJZNO49TDTft1jpPmm2VLXaa3yMw/gsOoEzSFUuBfkEgUyQ/f1AfP7SZLcWMMokJnwbS9k=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1785241757; c=relaxed/simple;
	bh=wyG4GECzfSIB9jn/cnBZRJGNhr3BkoIzJAgycItNeL8=;
	h=Message-ID:Date:MIME-Version:Subject:To:Cc:References:From:
	 In-Reply-To:Content-Type; b=HOS2CSPnxlJfq24MWyRCFRkLBk7mO19FPivFWny1YAwmghCIa8v2GTXCBYuUZjSuld7aXg1f/xnc0AI5SSy3NbpPVbyu4/Cab0beGFSOUn4/ibnBNabGLn6BvEOOl6n2Os1zju9RYV6RduKemMhc6DyCfais0At0mAg2U2sqJQ0=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=AU7C3ZTB; arc=none smtp.client-ip=100.103.45.18
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="AU7C3ZTB"
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 4A8601F000E9;
	Tue, 28 Jul 2026 12:29:09 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kernel.org;
	s=k20260515; t=1785241756;
	bh=BlUioloYSGbVufswcJ7MSaU+6w+Mef3HekvOtjpEtHA=;
	h=Date:Subject:To:Cc:References:From:In-Reply-To;
	b=AU7C3ZTBM6yTkTimQbZm5n08WZyQfG98HcfFJdW5Ul6jklfTBePDEFmibnzpejLYF
	 j9wBoJsmZWG6epj+rz6o7hM00zeCnK16Zh5k6P6+OVUmTmKbapLwFV4hH43obRdEfj
	 B2UXtsXA24kK1I1KCC5O+1aCQQ+iskuu2T/elIU6SzNOv1Xjpyj3Jup3pk6YnzsUjr
	 DZJXQDijrMxK6iy7xJFoq6QPz9Ixf9m9f4tM7ap893gNqY4FnaK+znleCD49a5WvYv
	 bKGqMUvEb28FebUzctXWHWsKrkmxcNbosHMQDklD0qzmcI3jLmnprX6idE9A2hJ/KJ
	 ofAL2mWmxz58Q==
Message-ID: <1d648ff6-1936-4002-bd2a-f521e99bc71c@kernel.org>
Date: Tue, 28 Jul 2026 14:29:08 +0200
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
 <c714e746-8b58-42d8-8c37-160f8c5b5a59@kernel.org>
 <147593cd-fc4e-41b9-83cf-2e42988c5e74@oss.qualcomm.com>
From: Krzysztof Kozlowski <krzk@kernel.org>
Content-Language: en-US
Autocrypt: addr=krzk@kernel.org; keydata=
 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
In-Reply-To: <147593cd-fc4e-41b9-83cf-2e42988c5e74@oss.qualcomm.com>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit

On 28/07/2026 14:25, Monish Chunara wrote:
> 
> 
> On 7/28/2026 5:52 PM, Krzysztof Kozlowski wrote:
>> On 21/07/2026 16:30, Monish Chunara wrote:
>>>
>>>
>>> On 7/8/2026 12:18 PM, Krzysztof Kozlowski wrote:
>>>> On Mon, Jul 06, 2026 at 07:43:44PM +0530, Monish Chunara wrote:
>>>>> From: Monish Chunara <monish.chunara@oss.qualcomm.com>
>>>>>
>>>>> Glymur integrates the MSM SDHCI v5 controller. Document the SoC-specific
>>>>> 'qcom,glymur-sdhci' compatible as required by binding convention to
>>>>> identify the hardware and reserve the namespace for future SoC-specific
>>>>> quirks, with 'qcom,sdhci-msm-v5' as the fallback.
>>>>
>>>> Drop half of above sentence.
>>>>
>>>> "Document the SDHCI controller on Qualcomm Glymur soC, fully compatible
>>>> with existing MSM SDHCI v5."
>>>>
>>>> You do not need to say anything about some conventions or reserving
>>>> namespaces. We do not reserve namespaces...
>>>>
>>>> Acked-by: Krzysztof Kozlowski <krzysztof.kozlowski@oss.qualcomm.com>
>>>>
>>>> Best regards,
>>>> Krzysztof
>>>>
>>>
>>> Sure, thanks. will update in v4. 
>>>
>>> Just for my understanding, though: how does the suggested wording capture the 
>>> why behind the change? Per previous comments and understanding, the rationale 
>>> for introducing the SoC-specific compatible is the reason we are making this 
>>> change. For future submissions, this would help to avoid similar back-and-forth.
>>>
>>
>> Why do you think you need to document the "why" if it is 100% obvious
>> (and I did state it many times)?
>>
>> Best regards,
>> Krzysztof
> 
> This was asked because it was suggested on first-post to add a why. 
> 
> "Same questions as always... why? Don't explain what you did. Explain why
> ou did that way."
> 
> https://lore.kernel.org/all/9bb28a60-2c01-449d-9456-bcf2d780b68c@kernel.org/
> 
> Pardon, if this was a misunderstanding.

Yes, so you need to explain why you did that way. Not why you are
sending this patch. We all know why you are sending this patch.

Best regards,
Krzysztof
