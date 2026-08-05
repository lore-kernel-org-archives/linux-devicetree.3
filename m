Received: from smtp.kernel.org (aws-us-west-2-korg-mail-alma10-1.taild15c8.ts.net [100.103.45.18])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 0FBAB40B0F1;
	Wed,  5 Aug 2026 09:47:13 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=100.103.45.18
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1785923237; cv=none; b=HUKjf1nnWUaqFgLQwWPlc0h0of+5rFtj59EZlleM926oar0Ar8m/y6V0FEUzGVqB1b4XCqWFlucn947DhgfTxAEPWpbyPEg8TNRUWLRNyBaB1av4f1bw3PyoXJmsj5Oi8xK0B2RFv7MIAkp4nVhX4DemcKqioLPzZh2atkHQnPo=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1785923237; c=relaxed/simple;
	bh=u2WANzU6YSAiEga849+fFViPRaXoR5pjR/3+bhbuGv8=;
	h=Message-ID:Date:MIME-Version:Subject:To:Cc:References:From:
	 In-Reply-To:Content-Type; b=BJW4kweU4dgNzI6rVrKLbdw6aVS1ZXve8Iuuhq2hm+XU9EdefpfeXnNVdfIMTvnNSFMxVGGZn6WSYy8ODA3rk2NCl6Fpb2Dt3ljd6M2T1+0Fyz58tr8TLrw5ljVpen9BHnXAXmA+egNReifpZL8tBQFW83QRuyvRkxudsPbv2JM=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=Tipz/+w7; arc=none smtp.client-ip=100.103.45.18
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="Tipz/+w7"
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 466AE1F00A3A;
	Wed,  5 Aug 2026 09:47:07 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kernel.org;
	s=k20260515; t=1785923232;
	bh=Q4UlXmYavMMPTdV3/EE/2oxTFGxMyvMaeT+akxakhEU=;
	h=Date:Subject:To:Cc:References:From:In-Reply-To;
	b=Tipz/+w7eMvEu1eOhzFRJU4tvsX/j2ZILWx2Rj36uVCjUWzklvaknDh8Cpkm4SYvh
	 c6fOPUtBGDQks38uY+jq+Am6Lw1FflobwbAc7oWFxYqzM7v6dT30C5alYzUaxtEbMJ
	 GvEZHQsA2tghVbhFt4uCGifOYPuM+7X9cvg50qr8WAJiQ/qNpz9316gWwJ+AThqEql
	 45BKTsqlPlONmA94M5knfcQKg5wJvdMexb7pUe03sZ3x+bMar308v9xWhKEGDh5vKU
	 Nwz7X6e+TivhL5OH/biARZxues1J61WfmSsfg9YVXDpM2Bm+5NfDIEQH+NUzG+ijKu
	 7lnyHQVhjSiYw==
Message-ID: <22ad4dab-dbf2-48f4-970f-ea9fc91f1e2b@kernel.org>
Date: Wed, 5 Aug 2026 11:47:04 +0200
Precedence: bulk
X-Mailing-List: devicetree@vger.kernel.org
List-Id: <devicetree.vger.kernel.org>
List-Subscribe: <mailto:devicetree+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:devicetree+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH 2/2] dt-bindings: phy: ti,phy-usb3: document aspcie
 reference clock setting
To: David Oberhollenzer <david.oberhollenzer@sigma-star.at>
Cc: linux-phy@lists.infradead.org, devicetree@vger.kernel.org,
 linux-kernel@vger.kernel.org, vkoul@kernel.org, neil.armstrong@linaro.org,
 robh@kernel.org, krzk+dt@kernel.org, conor+dt@kernel.org, johan@kernel.org,
 rogerq@ti.com, Julian.FRIEDRICH@frequentis.com, upstream+omap@sigma-star.at
References: <20260804111849.92046-1-david.oberhollenzer@sigma-star.at>
 <20260804111849.92046-3-david.oberhollenzer@sigma-star.at>
 <20260805-uptight-onyx-unicorn-cfd0ce@quoll>
 <5f10e213-2ab3-4309-a01e-5d0f098a5b35@sigma-star.at>
From: Krzysztof Kozlowski <krzk@kernel.org>
Content-Language: en-US
Autocrypt: addr=krzk@kernel.org; keydata=
 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
In-Reply-To: <5f10e213-2ab3-4309-a01e-5d0f098a5b35@sigma-star.at>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit

On 05/08/2026 10:42, David Oberhollenzer wrote:
> Hi,
> 
> On 8/5/26 9:39 AM, Krzysztof Kozlowski wrote:
>>
>> Not a valid naming, missing vendor prefix and syscon looks like
>> Linuxism, since you called it "system control module".
>>
> 
> I agree that this is a very vendor specific kluge and I suspected
> it might need a vendor prefix. However, I ultimately tried to stick
> to existing conventions.
> 
> There are 3 more syscon properties defined for this device:
>   - syscon-phy-power
>   - syscon-pllreset
>   - syscon-pcs

These, as the rest of the binding come, from 2015 or even earlier. A lot
changed during that time. It is a good idea to take recently reviewed
code as an example. It is a bad idea to take 10 yo code.

> 
> None of them have a vendor prefix, all of them use the
> description "system control module".
> 
> I take it, the existing properties already break best practices
> that were established later? Or is there another reason they
> lack a vendor prefix?

Just add vendor prefix to the new property.

> 
>>> +    $ref: /schemas/types.yaml#/definitions/phandle-array
>>> +    maxItems: 1
>>> +    items:
>>> +      items:
>>
>> Missing -
>>
> Likewise, I simply copied from the syscon blocks and made some
> minor changes. Hence also the identical description. So this is
> broken for the existing properties as well?

Hm, you are right, the syntax was actually correct. I missed maxItems.

Preferred syntax is for example in
Documentation/devicetree/bindings/crypto/intel,ixp4xx-crypto.yaml, but
your code was fine as well.



Best regards,
Krzysztof
