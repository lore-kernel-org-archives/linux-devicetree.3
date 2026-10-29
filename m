Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=100.103.45.18
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1793269840;
	b=Nbax2+Gvl4aHfOxeBBDKmiWNCvuIYIwvbtQ8s3BhXntP/bXtLCCAcLq1fNTUdTJeaPe6
	 lkYFBxPs4D87ZNbW85Anw2gdH8eQFa28f5QEy8rcW+bv68MradiDVSwfZrq5xKmMW8iae
	 uEj385CsswbexWjpPr0ghfDAbYdYKNRbe7zolCdJQ3oTnRxuuGk26HhmbZLQBUNUKVt/t
	 AoOzXd1Ocv356IgNu9GiTijqh2AGoSBQ14q4v/lBfsTexAPtQ/YuPHM2fogK/7NTea4uH
	 B7EXDJXkZGjrgUUNresiT2QgC5R2PgrwFNVowD5yD8DfU4Ku820vfKPabvQvC2Ffg9w==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1793269840;
	h=Received:DKIM-Signature:Message-ID:Date:MIME-Version:User-Agent:
	 Subject:To:Cc:References:From:In-Reply-To:Content-Type:
	 Content-Transfer-Encoding;
	bh=VcgPlgE6agKdSoEX7o8ZEBSDHZPyD8maBq9HFQn14+s=;
	b=xYR57zcEmxSg03eSmpwIWYN9J+42e6pciUIuVeU1PESWbA4+57uWmaJxzvovtOQGlP/T
	 38pkBM1XtNyvxPcmwU3aVP+REFVQ/YXQrWIa162EOofXtoy4N6O8TAsMIIYbWvuENFIuL
	 LKpslFmhyGo2/1HT3weT9zIdBqIxgW1+4Q3FG55vbTN0ZCHdpdWNPzP7PJWqxHMxUzkiO
	 hvHPg9oJYcYxuWVa4MWF70lb8Yw4GuklPoLSQ/dZo+8KYJy5MxLnh54LZzpbw3FQK1Cxj
	 qCIp+JhKiYxZ+KrjWCIx6sQBMTS5Qah+5u5aQwdhOK628WuuGj2fIL0yI0sPg70H4qw==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dkim=pass header.d=kernel.org header.i=@kernel.org header.a=rsa-sha256 header.s=k20260515 header.b="oViIK/3a";
	arc=none smtp.remote-ip=100.103.45.18
Received: from smtp.kernel.org (quasi.space.kernel.org [100.103.45.18])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id B0012606A332;
	Thu, 29 Oct 2026 10:30:39 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key, unprotected) header.d=kernel.org header.i=@kernel.org header.a=rsa-sha256 header.s=k20260515 header.b=oViIK/3a
Received: by smtp.kernel.org (Postfix) with ESMTPSA id E5D991F031E0;
	Thu, 29 Oct 2026 10:30:35 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kernel.org;
	s=k20260515; t=1793269839;
	bh=VcgPlgE6agKdSoEX7o8ZEBSDHZPyD8maBq9HFQn14+s=;
	h=Date:Subject:To:Cc:References:From:In-Reply-To;
	b=oViIK/3a1Q8yGtFgD32YBrch+a9sgt+lm9T+pDppylWeJk6ti7iOD7hzbxRvDmpiA
	 2WQsPEODjwx3o+CioVsHCqIIGUTIjobutuhAcRLu8oRpUDfAiusIbFy/T9zt1pLwPn
	 2NAkbOauJfE8QGLljzQFdksD5Xmv18Sl3nHH1lLYwMwjz/hg797tEgKjuLcqlqaBej
	 Ix3on8LNBb/j6BCa+ZCdutULurMQeFrYGSz/ReysEd5Ov7LZpxoQL/SFa9AzqjkFuI
	 ymVb48dtr5rfZutqhQ/tn8DaXHeSh5FuQBvY1XOTAj6GqgKQGLcVGPwLpc8e19ClfO
	 hdpeRJJnzDoNQ==
Message-ID: <9e64390b-1c67-4a0d-b9f0-22c8de86bb6d@kernel.org>
Date: Thu, 29 Oct 2026 12:30:33 +0200
X-Mailing-List: devicetree@vger.kernel.org
List-Id: <devicetree.vger.kernel.org>
List-Post: <mailto:devicetree@vger.kernel.org>
List-Help: <mailto:devicetree+help@vger.kernel.org>
List-Subscribe: <mailto:devicetree+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:devicetree+unsubscribe@vger.kernel.org>
List-Owner: <mailto:devicetree+owner@vger.kernel.org>
Precedence: list
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH 1/8] dt-bindings: display: panel: novatek,nt36672e:
 Document the reset GPIO polarity
To: Krzysztof Kozlowski <krzk@kernel.org>
Cc: Neil Armstrong <neil.armstrong@linaro.org>,
 Jessica Zhang <jesszhan0024@gmail.com>,
 Ritesh Kumar <quic_riteshk@quicinc.com>, Rob Herring <robh@kernel.org>,
 Krzysztof Kozlowski <krzk+dt@kernel.org>,
 Bjorn Andersson <andersson@kernel.org>,
 Konrad Dybcio <konradybcio@kernel.org>,
 Maarten Lankhorst <maarten.lankhorst@linux.intel.com>,
 Maxime Ripard <mripard@kernel.org>, Thomas Zimmermann <tzimmermann@suse.de>,
 David Airlie <airlied@gmail.com>, Simona Vetter <simona@ffwll.ch>,
 dri-devel@lists.freedesktop.org, Conor Dooley <conor+dt@kernel.org>,
 devicetree@vger.kernel.org, Abel Vesa <abelvesa@kernel.org>,
 linux-arm-msm@vger.kernel.org
References: <20261028095151.1682096-1-vz@kernel.org>
 <20261028095151.1682096-2-vz@kernel.org>
 <20261028-seagull-of-illegal-prestige-6cbbfa@quoll>
 <07c2c10c-f442-480d-b545-666069c06e91@kernel.org>
 <61e36fb1-6959-4c69-9afb-53264ff9331d@kernel.org>
 <cb1b7f4e-f03d-4422-b4ae-4228fe9f86ab@kernel.org>
 <20261029-calculating-imaginary-wolf-ccb2a2@quoll>
From: Vladimir Zapolskiy <vz@kernel.org>
In-Reply-To: <20261029-calculating-imaginary-wolf-ccb2a2@quoll>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit

On 10/29/26 11:49, Krzysztof Kozlowski wrote:
> On Wed, Oct 28, 2026 at 10:27:35PM +0200, Vladimir Zapolskiy wrote:
>> On 10/28/26 16:59, Krzysztof Kozlowski wrote:
>>> On 28/10/2026 15:56, Vladimir Zapolskiy wrote:
>>>>> We might fix it at some point, so not sure if it is worth documenting in
>>>>> the binding. And what about usage of this binding in other projects
>>>>> which implement it correctly?
>>>>>
>>>>
>>>> In the upstream there is only one user qcm6490-idp.dts, and changing
>>>> the polarity will be an ABI breaking change, unfortunately.
>>>
>>> And all other projects?
>>>
>>
>> It might be a challenging task to check usage of "novatek,nt36672e"
>> compatible display panels in all other projects. I've asked about it:
>>
>> * https://chatgpt.com/uc/6ae25571-2ef0-83ea-81e5-2522e70c4a93
>>
>> The check gives this info:
>>
>> 1. Linux kernel - invalid GPIO polarity in the driver and qcm6490-idp.dts,
>> 2. Android - invalid GPIO polarity in the copied driver and qcm6490-idp.dts,
>> 3. FreeBSD - invalid GPIO polarity in the copied qcm6490-idp.dts, no driver.
>>
>> Please let me know, if there are other projects to check. To my
>> understanding the RESET_N polarity cannot be corrected anymore,
>> and the best option is to clearly document a difference between
>> the device and its dt-binding documentation.
> 
> It can be correct, just with impact so we choose not to, but
> nevertheless hardware wants different polarity, so you should not state
> in the binding the incorrect one.
> 
> This property corresponds to the hardware, not chosen SW implementation.
> 

Here by the hardware do you mean a "novatek,nt36672e" compatible panel
hardware, or a board hardware like sm8450-hdk?

Its the panel hardware property to get a reset signal with the proper
polarity (in the ideal world it's taken from the panel datasheet), then
1) this description is missing in the panel dt bindings documentation,
2) if added, this description would contradict to the panel datasheet.

It would make sense to document it, and that's the intention of this
particular proposed change.

-- 
Best wishes,
Vladimir
