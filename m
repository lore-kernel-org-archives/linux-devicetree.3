Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id EA1DD397E80;
	Thu, 14 May 2026 11:55:37 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=10.30.226.201
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1778759738; cv=none; b=uLoYdGvAPgPuP8Xb3aaOo3dPGSamr2ydN+lLmqnoKhqpIQaY+C9M3a8VNtm6u/3a3mp+Ka84mLCB3j4zTAHKQ9I5C1o8GGi/8wIVdnyLsLHwvOkdllz8Jtvs5h2xvVEWNQVPVFrmAjEDVNU0J+Za1Usw+CEFtfJrNoj6yg4ST90=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1778759738; c=relaxed/simple;
	bh=AeL1EN007pME/pu3LeC45jDz9y2JECsJFLne8EbWKJE=;
	h=Message-ID:Date:MIME-Version:Subject:To:References:From:
	 In-Reply-To:Content-Type; b=fjVbV7aaWmfEFhgfzcnZmpvBsQ9adki1pK3e70BeqUbkOWkOi4i/mxI7a29L14mLUwjhtpzze38ovR7HRSZmn2UR97MtcQdKVix7Sn1ArNb1cz2xwJMWtxEdV/JmmbFdOy9Im+wlLWACRlavjczNtnTk2uYQCraohFmtirylMsg=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=kuiiUCmB; arc=none smtp.client-ip=10.30.226.201
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="kuiiUCmB"
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 0EA66C2BCB3;
	Thu, 14 May 2026 11:55:36 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1778759737;
	bh=AeL1EN007pME/pu3LeC45jDz9y2JECsJFLne8EbWKJE=;
	h=Date:Subject:To:References:From:In-Reply-To:From;
	b=kuiiUCmBkgjo5eao2a0pQ5bkSXK68BaId4OHWYzSAZnBPrYOT1/mXKnAdA0Na1gMf
	 7LZcabHRdVfVGdVxRaW19Qno7U4Bby3aNMwaLNYe0SwcAlbWPcc5nhDS9I1GA7VWg9
	 EIQFEC4e8GSwvIqR6zmBA0lTFRWXL4NECpv4Sk/0k0WID6g6eM32MHCI43jtwPFLnr
	 JOz4ZBYf8NkRVHuVFSa4RLhK4FFWYPKPvo5q1rJZ6aUxVkCl4doUgfxiQ9kCXC9Wxh
	 n2MLktFckskXCezIPHwPVNmdMD/n5B3zb7db1WlfBCACNlflfKdsy5o07ywgyF5agu
	 kGRYNsqLKA4ZQ==
Message-ID: <0844bde0-4287-450d-9376-dae9cf62efc9@kernel.org>
Date: Thu, 14 May 2026 06:55:35 -0500
Precedence: bulk
X-Mailing-List: devicetree@vger.kernel.org
List-Id: <devicetree.vger.kernel.org>
List-Subscribe: <mailto:devicetree+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:devicetree+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH 0/2] arm64: dts: agilex5: add support for debug daughter
 card
Content-Language: en-US
To: Krzysztof Kozlowski <krzk@kernel.org>,
 Adrian Ng Ho Yin <adrian.ho.yin.ng@altera.com>, Rob Herring
 <robh@kernel.org>, Krzysztof Kozlowski <krzk+dt@kernel.org>,
 Conor Dooley <conor+dt@kernel.org>, devicetree@vger.kernel.org,
 linux-kernel@vger.kernel.org
References: <cover.1778237639.git.adrian.ho.yin.ng@altera.com>
 <ec0633a6-30f6-4db6-875d-69a4f0f140ca@kernel.org>
 <d9a1e0ec-fa4a-478a-957e-47a1559380db@kernel.org>
From: Dinh Nguyen <dinguyen@kernel.org>
In-Reply-To: <d9a1e0ec-fa4a-478a-957e-47a1559380db@kernel.org>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit



On 5/13/26 13:09, Krzysztof Kozlowski wrote:
> On 09/05/2026 14:05, Dinh Nguyen wrote:
>>
>>
>> On 5/8/26 05:57, Adrian Ng Ho Yin wrote:
>>> The Agilex5 SoCDK supports an optional debug daughter card that requires
>>> a dedicated device tree variant due to differences in peripheral
>>> connectivity compared to the standard SoCDK configuration.
>>>
>>> When the debug daughter card is fitted:
>>>     - gpio0 and gmac2 are disabled
>>>     - gmac0 is enabled with RGMII PHY connectivity
>>>     - spi0 is enabled with a <device> peripheral at chip select 0
>>>     - The HPS LED is rewired from gpio0/porta to gpio1/portb
>>>
>>> The new DTS inherits from socfpga_agilex5_socdk.dts and overrides only
>>> the nodes that differ, keeping the delta minimal.
>>>
>>> Adrian Ng Ho Yin (2):
>>>     dt-bindings: altera: add compatible for agilex5 socdk debug daughter
>>>       card
>>>     arm64: dts: agilex5: add support for debug daughter card
>>>
>>
>> Applied!
> 
> No, really. This is really unreviewed poor DTS containing fake nodes.
> Please drop the patch.
> 


[2/2] arm64: dts: agilex5: add support for debug daughter card  - Dropped

Please resubmit.

Dinh

