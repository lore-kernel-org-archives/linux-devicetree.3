Received: from smtp.kernel.org (aws-us-west-2-korg-mail-alma10-1.taild15c8.ts.net [100.103.45.18])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id EC79A33B6E8
	for <devicetree@vger.kernel.org>; Wed,  3 Jun 2026 14:36:33 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=100.103.45.18
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1780497394; cv=none; b=LVJafMpnsUQkIn61OEpKUa1G3Cvy0iuLfckp0Z55rwETsP8EVTg2x83zW2UBiSoO30jJPlubqdW7RZvqyFqanvxPJQvCgOQHYjvrUNDF/bTOMdIxWJVFZAYe6osXpmJ+RPupU6RYrtOnWrL6XZ+s3Q7Xi6VfwBD5V4+H4KAX98w=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1780497394; c=relaxed/simple;
	bh=tDIvRBi+Hz2F+jOYLhGPWHuA2xQF223gSLOaxmQh3ps=;
	h=Message-ID:Date:MIME-Version:Subject:To:Cc:References:From:
	 In-Reply-To:Content-Type; b=Rvi92l8xz1JpNDR0g/mrZAI1iC83N4XLb7t3oIHqiwk6SbY1ridTbmqEeGOOoMHr7iNa1OJSDOEiTIEh/otX75LWSGR1HX4oeoCpdnWRrxkUYpasAZaSWdwlXbtzoZh7GyzwqGCRxBvMzcrczVjkCAX5Rg5JTXD8GpsDXtMP6Ns=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=UcfYuFsw; arc=none smtp.client-ip=100.103.45.18
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="UcfYuFsw"
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 5472A1F00893;
	Wed,  3 Jun 2026 14:36:28 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kernel.org;
	s=k20260515; t=1780497393;
	bh=AI46kP8UK6l9WEk1AQ1AFIFgvTSBlPzimOI+GhKMfYM=;
	h=Date:Subject:To:Cc:References:From:In-Reply-To;
	b=UcfYuFswHKAWIOrbLOYdqwoYhRqsTDq4fDSvF2kb+f4bb+pJAfs16hBtXloG0cAP2
	 abbksORJdIvj3OPEL8XILi37eQ7zOO720EQYz20zT9y9iL44ZKX8DpQYiFx74z4YY7
	 bzbheKxr7R5wATCyqH0I8NUy4mp+d1+c9SPAcaMPnETFHZt0BhBk4ad2AX/PPgVaWA
	 otwY14ogToUWG25fQQmtQ2UOQJNJNuI+Zu3gD28CN4aVU5vNDejdjx8e5eEtCmOoMu
	 /nOTJRYtO5bQOAfQLUvX5yqaaTYHXZID/LNeUt/broeVJOujFTMZ+veR/Ho4FNrwJe
	 Avfxi6Zz9OLcg==
Message-ID: <035ffb31-e4c8-49b0-8323-f9cfe54eae30@kernel.org>
Date: Wed, 3 Jun 2026 16:36:26 +0200
Precedence: bulk
X-Mailing-List: devicetree@vger.kernel.org
List-Id: <devicetree.vger.kernel.org>
List-Subscribe: <mailto:devicetree+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:devicetree+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v4 2/3] dt-bindings: i3c: dw: Add apb reset
To: Jisheng Zhang <jszhang@kernel.org>
Cc: Alexandre Belloni <alexandre.belloni@bootlin.com>,
 Frank Li <Frank.Li@nxp.com>, Rob Herring <robh@kernel.org>,
 Krzysztof Kozlowski <krzk+dt@kernel.org>, Conor Dooley
 <conor+dt@kernel.org>, Philipp Zabel <p.zabel@pengutronix.de>,
 linux-i3c@lists.infradead.org, devicetree@vger.kernel.org
References: <20260525140018.19598-1-jszhang@kernel.org>
 <20260525140018.19598-3-jszhang@kernel.org>
 <f8efa4ae-76e8-4082-a445-ca5f6d230bf3@kernel.org> <ahZwl3uXjyOZRvGW@xhacker>
 <4a8539d3-704b-4433-b4d6-e5acfe22d512@kernel.org> <ahre-7YdlcOZkwS1@xhacker>
From: Krzysztof Kozlowski <krzk@kernel.org>
Content-Language: en-US
Autocrypt: addr=krzk@kernel.org; keydata=
 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 a/A=
In-Reply-To: <ahre-7YdlcOZkwS1@xhacker>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit

On 30/05/2026 14:58, Jisheng Zhang wrote:
> On Wed, May 27, 2026 at 09:53:16AM +0200, Krzysztof Kozlowski wrote:
>> On 27/05/2026 06:18, Jisheng Zhang wrote:
>>> On Mon, May 25, 2026 at 05:25:45PM +0200, Krzysztof Kozlowski wrote:
>>>> On 25/05/2026 16:00, Jisheng Zhang wrote:
>>>>> Add dt-binding for support of apb reset which is to reset the APB
>>>>> interface.
>>>>
>>>> And this is ABI break, so you must explain WHY breaking ABI is worth
>>>
>>> This just adds an optional apb reset, it doesn't break any exisiting
>>> ABI. Kindly let me know whether adding new optional binding is also
>>> an ABI break.
>>
>> It does. One reset was before. Now all devices must have two resets.
>> Clear ABI impact.
> 
> I checked the dts with only one reset by manual dt_binding_check
> and dtbs_check, it still work, so I'm not sure why those dts "must have
> two resets". Kindly let me know what's wrong.
> 
>>
>>>
>>>> doing that or what is the impact. Additionally you should explain which
>>>> devices have it. Does Altera have it? You really lack explanation WHY
>>>> you are doing it and which hardware you exactly describe.
>>>
>>> I'm preparing one of synaptics SoCs support to uptream, it needs this
>>> apb reset signal for i3c. So you mean I delay this series until the SoC
>>> upstream series come, right?
>>
>> No. You just sent patch which basically says that Altera has two resets,
>> without any explanation of that.
> 
> I guess you mixed other series/patches with mine here, no? I didn't
> mention Altera at all ;) What my series mentioned is adding apb reset
> which is to reset the APB interface.
> 


Read the binding. Altera is already there. I do not talk about other
patches.

Your are changing an already accepted binding.

Best regards,
Krzysztof
