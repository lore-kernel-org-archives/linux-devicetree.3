Received: from smtp.kernel.org (aws-us-west-2-korg-mail-alma10-1.taild15c8.ts.net [100.103.45.18])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 6908A156C6A
	for <devicetree@vger.kernel.org>; Sat, 13 Jun 2026 07:33:55 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=100.103.45.18
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1781336036; cv=none; b=AUac+gdNANT5yfnefx7VpQe3w+s5i3d23ffFpU+5PjLc7YxXwdzj1hzEijNDt6utJCGWjsP/rw8mxA7Z87HW+ojKvZbgjxr1I4/vmNqHs/H5emjQ1ltf6vo6Rcqm3AoGsbAepJfM8RC+BfCCng4F68C8CeaSdt30t7Wk0Xx/3+s=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1781336036; c=relaxed/simple;
	bh=PxX9K5ZDgh0h3OcsbaIRWuSqmui98K76LJSn1C9+4nA=;
	h=Message-ID:Date:MIME-Version:Subject:To:Cc:References:From:
	 In-Reply-To:Content-Type; b=qAr0KL2pvkEpYLcMi+Q5ZH5b0sXBYTqcDLQOgXVGBENlvbEtfibMm+87rKLdT1LsWEAm9Nc6qafCWIAmp+n8a78m5WaoW6xE20K+PAF5T4HJNZlQW1nNQo5PuZuWnQ7UNUACTNxMEeHmXcVR2udaAQzm9KSGGBy818mXoU6NNLU=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=as/ZULja; arc=none smtp.client-ip=100.103.45.18
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="as/ZULja"
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 3D4AD1F000E9;
	Sat, 13 Jun 2026 07:33:53 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kernel.org;
	s=k20260515; t=1781336035;
	bh=ewzja9ztBOPyrsczWsX9X0mxKc4EcOTeQhgKRFEwSmo=;
	h=Date:Subject:To:Cc:References:From:In-Reply-To;
	b=as/ZULjaN3KQJ1AWFBOyUUGfrxS3kL3K8RK/IZNd1Xg8aEre0XHqGgrl7rA0Ra8kY
	 R2ukAPQqDtzz4e3JmRD93b/WTUgwgr9NwRe2OXxGvhHEZcJ6t5u8LBxGEj9R2Y/Ns7
	 b8BNrgI/sCMZiSnRWs+PKthdzPhkRPn2jMT7VV1ZSi39GQayjIFTnOo6Y+ka7S030u
	 uNAAbjw4yKGvS9Ov/BTvjo5gWJQ39XIWtSYbZtA8DEOG52FRLC47/o/GCHkpBbILP3
	 ztashKoyRk7RF7+Xv+EBXro2JW5wc83FKCiqWnv6uHztQc80iV6W8rs0AAFyT5RWkz
	 vBwrQffbSx7pA==
Message-ID: <fbaf1829-723b-4a87-882b-b164bb544912@kernel.org>
Date: Sat, 13 Jun 2026 09:33:51 +0200
Precedence: bulk
X-Mailing-List: devicetree@vger.kernel.org
List-Id: <devicetree.vger.kernel.org>
List-Subscribe: <mailto:devicetree+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:devicetree+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH 2/7] ASoC: codecs: ES8389: Fix the issue about mclk_src
To: Zhang Yi <zhangyi@everest-semi.com>
Cc: alsa-devel@alsa-project.org, broonie@kernel.org, conor+dt@kernel.org,
 devicetree@vger.kernel.org, krzk+dt@kernel.org, robh@kernel.org,
 tiwai@suse.com
References: <20260609-visionary-truthful-viper-ceff75@quoll>
 <20260610100637.25568-1-zhangyi@everest-semi.com>
From: Krzysztof Kozlowski <krzk@kernel.org>
Content-Language: en-US
Autocrypt: addr=krzk@kernel.org; keydata=
 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
In-Reply-To: <20260610100637.25568-1-zhangyi@everest-semi.com>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit

On 10/06/2026 12:06, Zhang Yi wrote:
>>> Fix the issue with incorrect modifications to mclk_src
>>
>> What issue? Your commit msgs are really poor - explain nothing. You just
>> duplicated subject... and anything can be a fix.
> 
> I'm sorry I didn't explain that clearly.
> When the system needs to be configured to use the MCLK from the SCLK pin,
> the old code still sets the relevant registers to use the MCLK from the MCLK pin.
> I will include a more detailed description in future versions.
> 
>>>  	struct es8389_private *es8389 = snd_soc_component_get_drvdata(component);
>>>  
>>> -	ret = device_property_read_u8(component->dev, "everest,mclk-src", &es8389->mclk_src);
>>
>> Why are you changing implemented ABI?
> 
> In the old ABI, `mclk_src` was defined as `u8`, which meant that users could set `mclk_src` to any value in the DTS—such as `0x02`,
> but the code wouldn't recognize what that value represented.
> The actual purpose of `mclk_src` is to indicate whether `sclk` should be used as `mclk`.
> So I've changed it to bool.

You break ABI implemented by this driver, so you must clearly document
it with reasons, why breaking is necessary. Honestly, without proper
reason I would just answer that you must keep it backwards compatible.

Best regards,
Krzysztof
