Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=100.103.45.18
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1793219261;
	b=e45j5019Fx5ewqcrvNz6iff55XCaSbqpDGAku4rnQ2NcabCq0Piv6y97UqJ73he+zaZJ
	 j5YMR+J7OnrchfJfM78mi/yfpjzYzXqEV+99QhR9arh6B7TzqpLnHodvhrQTUzh0uvh+0
	 cfjYDIa6lWyRSBQlHjlL5IqbmW68FJv8tRB4hLxu9A6odpQP/s6qOfomt4ZS9Qg//FtDs
	 7TKLHyMsMqme+0FDbTvGTAwoblpLJipLDedBwpNk/2S9euG7aFuyTL2JTSygJb99lbMzm
	 PkIsoOwVzlDtWvCkWzmjD1kdvJaQe09l+yKPc59uL71X3UVK+3Jr+vwVRkHVoLtX0IQ==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1793219261;
	h=Received:DKIM-Signature:Message-ID:Date:MIME-Version:User-Agent:
	 Subject:To:Cc:References:From:In-Reply-To:Content-Type:
	 Content-Transfer-Encoding;
	bh=rx9oUa//NkWEEfC3LpDAEDMmspM2Y7f77XuuxNJnUYY=;
	b=gwaN62Ai7rP4t6v+E+05Ttq/jhIOP/2Sc5XSZHn/uRj00X6axJKrZy9DW4tNiEj4ucXU
	 XtQBu6Dw1Exi1NQftd4RXg9G59lS/TuJL2fMP9K5fpB9jXmSlDiAufunoMywGP2UvOBsF
	 RpSOIbVl+5Rc6+9tHmXoG5G6zCmdrmwoRUy5jEPLhLu/VYKj3S7GrCX9NhxvFztKT8Udw
	 jiXqoJSq8QGKxNzvPw+09oijBNHKiucw2zKV/gdZrQDMMTnqleCV8l9m9VjIClsgt5y7Z
	 pFI+wuVbLUZaDLmeP0HfS6DheLGrW90iD2vUXxDlCeIfHyG09I+ZSPPTPVzmb8NagMA==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dkim=pass header.d=kernel.org header.i=@kernel.org header.a=rsa-sha256 header.s=k20260515 header.b=MrB8XHqr;
	arc=none smtp.remote-ip=100.103.45.18
Received: from smtp.kernel.org (quasi.space.kernel.org [100.103.45.18])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 98040606A322;
	Wed, 28 Oct 2026 20:27:41 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key, unprotected) header.d=kernel.org header.i=@kernel.org header.a=rsa-sha256 header.s=k20260515 header.b=MrB8XHqr
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 925FF1F01825;
	Wed, 28 Oct 2026 20:27:37 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kernel.org;
	s=k20260515; t=1793219261;
	bh=rx9oUa//NkWEEfC3LpDAEDMmspM2Y7f77XuuxNJnUYY=;
	h=Date:Subject:To:Cc:References:From:In-Reply-To;
	b=MrB8XHqr9e5crOcv43D6XAtsg0lB+GF5V1m5wADOIMtiXDhYIlcCS58gGXfy4c1kG
	 Ks0dz1f681UTDLHfEOQ5e2+HmS2AuS6pIHYMyLe/3/BrMKgckRAmFfr/pyK+kUlG0t
	 ZEUxzCJ7gLJ12LCEJoQ3e+K0EO7Ic4wefxhzJjqKEOso+J07Y2XqjU8nEOUX4DUjeC
	 W5eMyj6LjSJk4Zou2RVG2jC4lW8CqfgOwM+C4yC7kywctbo5MamLMYULuPiE6KdUO/
	 1WuzkBGUXdm5yti8SXd5s8ybZl5IowQp/YR7FlU0TVgNnZ2+dr+DMfH7udHojoXijj
	 vBz0cM39x856Q==
Message-ID: <cb1b7f4e-f03d-4422-b4ae-4228fe9f86ab@kernel.org>
Date: Wed, 28 Oct 2026 22:27:35 +0200
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
From: Vladimir Zapolskiy <vz@kernel.org>
In-Reply-To: <61e36fb1-6959-4c69-9afb-53264ff9331d@kernel.org>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit

On 10/28/26 16:59, Krzysztof Kozlowski wrote:
> On 28/10/2026 15:56, Vladimir Zapolskiy wrote:
>>> We might fix it at some point, so not sure if it is worth documenting in
>>> the binding. And what about usage of this binding in other projects
>>> which implement it correctly?
>>>
>>
>> In the upstream there is only one user qcm6490-idp.dts, and changing
>> the polarity will be an ABI breaking change, unfortunately.
> 
> And all other projects?
> 

It might be a challenging task to check usage of "novatek,nt36672e"
compatible display panels in all other projects. I've asked about it:

* https://chatgpt.com/uc/6ae25571-2ef0-83ea-81e5-2522e70c4a93

The check gives this info:

1. Linux kernel - invalid GPIO polarity in the driver and qcm6490-idp.dts,
2. Android - invalid GPIO polarity in the copied driver and qcm6490-idp.dts,
3. FreeBSD - invalid GPIO polarity in the copied qcm6490-idp.dts, no driver.

Please let me know, if there are other projects to check. To my
understanding the RESET_N polarity cannot be corrected anymore,
and the best option is to clearly document a difference between
the device and its dt-binding documentation.

-- 
Best wishes,
Vladimir
