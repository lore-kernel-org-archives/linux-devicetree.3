Received: from smtp.kernel.org (aws-us-west-2-korg-mail-alma10-1.taild15c8.ts.net [100.103.45.18])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id B09A936E494;
	Thu, 11 Jun 2026 07:51:05 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=100.103.45.18
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1781164266; cv=none; b=jxbmiA03MTn0FvzSl4SDI4MCk/G+DoSDiA+sfSxmxcx4pmE/k4cj4Kz2L4sKJawRYRMhnr9QkYRaALwcBJxF4GUb5/7JnY4gP/tuxejWbyrs69BF2dAOPG6G8QqGmUUWc2g74jEyz9ILsIPRlFGRckdk045MneXv3o5jtc/6Hew=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1781164266; c=relaxed/simple;
	bh=JX5xqztXPzF043zFhcFF9H+Qiv6KPeRxMDjy7nEKJY0=;
	h=Message-ID:Date:MIME-Version:Subject:To:Cc:References:From:
	 In-Reply-To:Content-Type; b=j53kU924f4+tNyMiQx3Yt5C0jMva74rVm3RNHRCOCxZKriIo6UNbR/tCS1/miOJb/Jyv6UjgrrB7SMpR8z1jLYiA45yXEnB7p8zZtmEGI4W0ANQUFgJ32ChpRUJsBylahqH1dTnw9LXy1TghfvHUb9E9wOITjvbySSU0dUopLcY=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=mgOel4/S; arc=none smtp.client-ip=100.103.45.18
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="mgOel4/S"
Received: by smtp.kernel.org (Postfix) with ESMTPSA id C58701F00893;
	Thu, 11 Jun 2026 07:51:00 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kernel.org;
	s=k20260515; t=1781164265;
	bh=QQdZIW2Jh4gHNkX695F/2i1N//qIAvLd0MxTyM6H8U8=;
	h=Date:Subject:To:Cc:References:From:In-Reply-To;
	b=mgOel4/SkyrZyy3o9yQquU+46D2EcbU+48Wc8ypaqFN/Jo0NLCJ+z6//FLIuGvE9v
	 gr0zC7rleMWDLn2o9Jl0mxIFILmJTRTQFTVn/OTCPHs00kquh4JAKvzxznz90+mdO5
	 L+0ZdRTRggA9fDq3w6e1dr2c9yoUf5f9vQ+KKYHsc0koI1/LJ67chyK8a6XqErR8zD
	 f1znOwmUCBJPrIssR8dMZh3IfpRM684VXnaOIj1fCmo+/rZ6zl2CemFYs79OhxhYOK
	 uwzpHuUhfLPMQN40xh+SEjAzXlFYaLNWq9P3ME9DZWKUINC5ICKCraNkQWA6hi55P8
	 L2+VOKu9xe51w==
Message-ID: <a2b5c9b4-5fc0-4507-a221-8695ed9574d8@kernel.org>
Date: Thu, 11 Jun 2026 09:50:58 +0200
Precedence: bulk
X-Mailing-List: devicetree@vger.kernel.org
List-Id: <devicetree.vger.kernel.org>
List-Subscribe: <mailto:devicetree+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:devicetree+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v8 1/3] dt-bindings: timer: mips,p8700-gcru
To: Aleksa Paunovic <aleksa.paunovic@htecgroup.com>
Cc: "alex@ghiti.fr" <alex@ghiti.fr>,
 "aou@eecs.berkeley.edu" <aou@eecs.berkeley.edu>, "cfu@mips.com"
 <cfu@mips.com>, "conor+dt@kernel.org" <conor+dt@kernel.org>,
 "conor.dooley@microchip.com" <conor.dooley@microchip.com>,
 "daniel.lezcano@linaro.org" <daniel.lezcano@linaro.org>,
 "devicetree@vger.kernel.org" <devicetree@vger.kernel.org>,
 Djordje Todorovic <Djordje.Todorovic@htecgroup.com>,
 "jstultz@google.com" <jstultz@google.com>,
 "krzk+dt@kernel.org" <krzk+dt@kernel.org>,
 "linux-kernel@vger.kernel.org" <linux-kernel@vger.kernel.org>,
 "linux-riscv@lists.infradead.org" <linux-riscv@lists.infradead.org>,
 "palmer@dabbelt.com" <palmer@dabbelt.com>,
 "paul.walmsley@sifive.com" <paul.walmsley@sifive.com>,
 "pjw@kernel.org" <pjw@kernel.org>, "robh@kernel.org" <robh@kernel.org>,
 "sboyd@kernel.org" <sboyd@kernel.org>,
 "tglx@linutronix.de" <tglx@linutronix.de>,
 "wangruikang@iscas.ac.cn" <wangruikang@iscas.ac.cn>
References: <eda67f3d-9395-4386-9311-d6f6b1c62304@kernel.org>
 <ed1e9743-1a8c-409f-9cf7-391719ea68fb@htecgroup.com>
From: Krzysztof Kozlowski <krzk@kernel.org>
Content-Language: en-US
Autocrypt: addr=krzk@kernel.org; keydata=
 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
In-Reply-To: <ed1e9743-1a8c-409f-9cf7-391719ea68fb@htecgroup.com>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit

On 11/06/2026 09:39, Aleksa Paunovic wrote:
> Hi Krzysztof,
> 
> 
> On 6/11/26 08:54, Krzysztof Kozlowski wrote:
>> On 11/06/2026 08:51, Krzysztof Kozlowski wrote:
>>> On 10/06/2026 10:22, Aleksa Paunovic via B4 Relay wrote:
>>>> From: Aleksa Paunovic <aleksa.paunovic@htecgroup.com>
>>>>
>>>> Add dt-bindings for the GCR.U memory mapped timer device for RISC-V
>>>> platforms. The GCR.U memory region contains shadow copies of the RISC-V
>>>> mtime register and the hrtime Global Configuration Register.
>>>>
>>>> Signed-off-by: Aleksa Paunovic <aleksa.paunovic@htecgroup.com>
>>> You keep ignoring reviews you received (14th May!) and sending same mistake.
>>>
>>> Can you address the emails?
> I wasn't really sure what the etiquette was for replying to Sashiko reviews, so I decided to
> address the comments for other patches and send a v8 without replying.
> 
> As for this patch, the GCR.U itself does start at 0x7F000, but the first 
> actual register (mtime) is at 0x7F050 [1]. 
> I'm not seeing any warnings when running dt_binding_check.

It's still a warning which you can easily reproduce on W=1 on dts. You
CANNOT have mismatch. If block starts at 0x7f000, first register CANNOT
start at different address or it completely does not matter where the
register is. It's contradictory. The block start address defines
where... does it start.

Best regards,
Krzysztof
