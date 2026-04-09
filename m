Received: from mail-dy1-f174.google.com (mail-dy1-f174.google.com [74.125.82.174])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 0D8D33BBA1F
	for <devicetree@vger.kernel.org>; Thu,  9 Apr 2026 14:19:28 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=74.125.82.174
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1775744370; cv=none; b=KR0K5xvE8YuxO5qhUWr6vKUziVeEMTGdA3rQjnr7GSI2zzIAyOH5KnzNEKcRgOIiKKxoM773+OeP7nijpHgJnr04KNXTrMaxb5yHOOvRp9lJ5iy0+N0rjBuxG3hVylBaU5Jl4Ii/CWbtBFYoI6KFWty4LRcQCDn5kNxIHNn/2UQ=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1775744370; c=relaxed/simple;
	bh=O7UJeRKQqwO7ovJL0LORCh9ygfxZEOGTY5qDbFiaz3E=;
	h=Message-ID:Date:MIME-Version:Subject:To:References:From:
	 In-Reply-To:Content-Type; b=kRVZ1h06993AWrH6GMSSzsJq3eLKEo2I0OFRI+3qS3nAfPkziOBER+5bT9W8IW6xdyM+Fjl5nxQXriTV4qi56vQtBrZvJxP5B8VJ5oi3dksdNZeWK9i4Rk1wqMw9UGCKHt4mI3vAJmbcQZLQnJ8phR+J5ElBjNrqbzzhTHAglI8=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=roeck-us.net; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=Vc3ioQ82; arc=none smtp.client-ip=74.125.82.174
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=roeck-us.net
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="Vc3ioQ82"
Received: by mail-dy1-f174.google.com with SMTP id 5a478bee46e88-2ce22328930so1203864eec.0
        for <devicetree@vger.kernel.org>; Thu, 09 Apr 2026 07:19:28 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1775744368; x=1776349168; darn=vger.kernel.org;
        h=content-transfer-encoding:in-reply-to:autocrypt:from
         :content-language:references:to:subject:user-agent:mime-version:date
         :message-id:sender:from:to:cc:subject:date:message-id:reply-to;
        bh=SKek5Gonk8rDpR4MKoT7kvTwHF1kjksPZBZknu5sKxk=;
        b=Vc3ioQ82A12skx+RE1R86wlgNRoP2M6pAyUriaYpv+9vRz0S7BAFq3oFVm/Cg5kZZE
         4imTD4bXJdGa6YjJqaQ891cUpCvnW13zeuEcD0pt0ot/cTUZgD/S+ycjqMlama2E3SgS
         8azhtCAf2ZqydLMXxwvBiPtWJlYBmGQT4AMff67JWzN5Ti8A0jngh2rw9kRAxvYKHgF9
         n+JMnHCcSHkbuDYd14myWhi3VbOU2d3mQsSMnucjyYj1gUKUPod8i7agmtVPzuuEPL+s
         csygVyxkY/J1WdqJ/2P0MNm5chmKhtoRNcbXciNhcSo0CYkFYsUrBBGOaOuiOCVwrmEZ
         IbFg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1775744368; x=1776349168;
        h=content-transfer-encoding:in-reply-to:autocrypt:from
         :content-language:references:to:subject:user-agent:mime-version:date
         :message-id:sender:x-gm-gg:x-gm-message-state:from:to:cc:subject
         :date:message-id:reply-to;
        bh=SKek5Gonk8rDpR4MKoT7kvTwHF1kjksPZBZknu5sKxk=;
        b=MwWA7/OoXfO3ZcN3g7KavHw45GaLgt7VxmPmvcLeWBtCe2QdY9x60Hq4CP3x4hN1xL
         Np68Od+FwcVmqWZ0+ooqYm8a4O6zU8zOV562gNdhG65BWpnm9yAZNZP+rnbIocWPtcHi
         2mjSeHh3NhL1w4qFI97JmeEw0RZG9dZlpQ9JxwgRoMxJrJKA/CrsCIUNY2u5qUIezNQ8
         x9fEhQUDfOKxSymiXxLOXu80imzKVM3lXQV3Y6dx2rgcSwx7mr/0udUH48uX0zUDUHs/
         pYAO9xxniYv6g6ONSHyR3KkD4UsiByXKzYCxI1xbQg8jSIXthBpFHiQiJHdfiNtYmo38
         9qiQ==
X-Forwarded-Encrypted: i=1; AJvYcCV0VcxHV4tyOoaRdvEwwqcl2QGo8zHo7aUYUdcSV46PWdqj61PavoIp7Xgs3Z5JX4x2RHQ2s59qYWBm@vger.kernel.org
X-Gm-Message-State: AOJu0YwzSJiYMbUdL2WdzxD9fMRp0rwH/o/tAunFyeWT9zkVWhMN8OOl
	IMbcX9YMxmruFzbSV35FTS5DOxaBhbUUTA0wY33MgLOMPFbJbHrcvZTn
X-Gm-Gg: AeBDietmc3mmx+RsuXid3ODsVGcb1pc7RwP+55Y3VmSaAxfnPvqJ7fn3za4LfP8PDqj
	I1CLlX0rVSdMp/QzENskrN305yUX3ft78RqyfKveltrgRC/tBkn7EsX2WnkhTeToxwtollqMpOb
	dXT1JzqupnZ7Rd/vRR9ubStprgLN51wIUDLHG9hqocbYgZvjldjp+BR6bB8ZwlQez931CftSnDh
	7ItSza4xPnCnmuXVNLR0a3Oavf0ptUFLrt17HPZ70DTzRJpi9oCI4TciM2n8d4XlkNbxGB7smzg
	jyYX5Qvlj5vt9v0Wwgeh1Kybcw7PRvcr0hMYy/mlfbQ1Ekav1llAqDNSM//J8StlyYQVLWNQNUk
	TxUTRGi138wEbSG2o7KhFYeQ/cScIbEdL9WPnCkg/lIBJjv1p9aFV3SY5srM+J54WogDu1OdWZJ
	gyT7HQj9wJtVXbRRXmyYpLuJI8OUHsjhWpiNJzqw98uq55mEaq4eFgcyRhryLDV5x/mP2h6yNU
X-Received: by 2002:a05:7301:4090:b0:2c8:717:7eb8 with SMTP id 5a478bee46e88-2cbfa4c7f6fmr13681278eec.15.1775744368050;
        Thu, 09 Apr 2026 07:19:28 -0700 (PDT)
Received: from ?IPV6:2600:1700:e321:62f0:da43:aeff:fecc:bfd5? ([2600:1700:e321:62f0:da43:aeff:fecc:bfd5])
        by smtp.gmail.com with ESMTPSA id 5a478bee46e88-2ca7cae9e9esm24912143eec.23.2026.04.09.07.19.26
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Thu, 09 Apr 2026 07:19:27 -0700 (PDT)
Sender: Guenter Roeck <groeck7@gmail.com>
Message-ID: <19218853-499c-46a2-8843-0bafa17c81d5@roeck-us.net>
Date: Thu, 9 Apr 2026 07:19:25 -0700
Precedence: bulk
X-Mailing-List: devicetree@vger.kernel.org
List-Id: <devicetree.vger.kernel.org>
List-Subscribe: <mailto:devicetree+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:devicetree+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v2 12/13] hwmon: spd5118: Add I3C support
To: Akhil R <akhilrajeev@nvidia.com>,
 Alexandre Belloni <alexandre.belloni@bootlin.com>,
 Frank Li <Frank.Li@nxp.com>, Rob Herring <robh@kernel.org>,
 Krzysztof Kozlowski <krzk+dt@kernel.org>, Conor Dooley
 <conor+dt@kernel.org>, "Rafael J . Wysocki" <rafael@kernel.org>,
 Robert Moore <robert.moore@intel.com>, Len Brown <lenb@kernel.org>,
 Philipp Zabel <p.zabel@pengutronix.de>, Eric Biggers <ebiggers@kernel.org>,
 Sakari Ailus <sakari.ailus@linux.intel.com>,
 Wolfram Sang <wsa+renesas@sang-engineering.com>,
 Miquel Raynal <miquel.raynal@bootlin.com>, linux-i3c@lists.infradead.org,
 devicetree@vger.kernel.org, linux-kernel@vger.kernel.org,
 linux-acpi@vger.kernel.org, acpica-devel@lists.linux.dev,
 linux-hwmon@vger.kernel.org
References: <20260409105747.48158-1-akhilrajeev@nvidia.com>
 <20260409105747.48158-13-akhilrajeev@nvidia.com>
Content-Language: en-US
From: Guenter Roeck <linux@roeck-us.net>
Autocrypt: addr=linux@roeck-us.net; keydata=
 xsFNBE6H1WcBEACu6jIcw5kZ5dGeJ7E7B2uweQR/4FGxH10/H1O1+ApmcQ9i87XdZQiB9cpN
 RYHA7RCEK2dh6dDccykQk3bC90xXMPg+O3R+C/SkwcnUak1UZaeK/SwQbq/t0tkMzYDRxfJ7
 nyFiKxUehbNF3r9qlJgPqONwX5vJy4/GvDHdddSCxV41P/ejsZ8PykxyJs98UWhF54tGRWFl
 7i1xvaDB9lN5WTLRKSO7wICuLiSz5WZHXMkyF4d+/O5ll7yz/o/JxK5vO/sduYDIlFTvBZDh
 gzaEtNf5tQjsjG4io8E0Yq0ViobLkS2RTNZT8ICq/Jmvl0SpbHRvYwa2DhNsK0YjHFQBB0FX
 IdhdUEzNefcNcYvqigJpdICoP2e4yJSyflHFO4dr0OrdnGLe1Zi/8Xo/2+M1dSSEt196rXaC
 kwu2KgIgmkRBb3cp2vIBBIIowU8W3qC1+w+RdMUrZxKGWJ3juwcgveJlzMpMZNyM1jobSXZ0
 VHGMNJ3MwXlrEFPXaYJgibcg6brM6wGfX/LBvc/haWw4yO24lT5eitm4UBdIy9pKkKmHHh7s
 jfZJkB5fWKVdoCv/omy6UyH6ykLOPFugl+hVL2Prf8xrXuZe1CMS7ID9Lc8FaL1ROIN/W8Vk
 BIsJMaWOhks//7d92Uf3EArDlDShwR2+D+AMon8NULuLBHiEUQARAQABzTJHdWVudGVyIFJv
 ZWNrIChMaW51eCBhY2NvdW50KSA8bGludXhAcm9lY2stdXMubmV0PsLBgQQTAQIAKwIbAwYL
 CQgHAwIGFQgCCQoLBBYCAwECHgECF4ACGQEFAmgrMyQFCSbODQkACgkQyx8mb86fmYGcWRAA
 oRwrk7V8fULqnGGpBIjp7pvR187Yzx+lhMGUHuM5H56TFEqeVwCMLWB2x1YRolYbY4MEFlQg
 VUFcfeW0OknSr1s6wtrtQm0gdkolM8OcCL9ptTHOg1mmXa4YpW8QJiL0AVtbpE9BroeWGl9v
 2TGILPm9mVp+GmMQgkNeCS7Jonq5f5pDUGumAMguWzMFEg+Imt9wr2YA7aGen7KPSqJeQPpj
 onPKhu7O/KJKkuC50ylxizHzmGx+IUSmOZxN950pZUFvVZH9CwhAAl+NYUtcF5ry/uSYG2U7
 DCvpzqOryJRemKN63qt1bjF6cltsXwxjKOw6CvdjJYA3n6xCWLuJ6yk6CAy1Ukh545NhgBAs
 rGGVkl6TUBi0ixL3EF3RWLa9IMDcHN32r7OBhw6vbul8HqyTFZWY2ksTvlTl+qG3zV6AJuzT
 WdXmbcKN+TdhO5XlxVlbZoCm7ViBj1+PvIFQZCnLAhqSd/DJlhaq8fFXx1dCUPgQDcD+wo65
 qulV/NijfU8bzFfEPgYP/3LP+BSAyFs33y/mdP8kbMxSCjnLEhimQMrSSo/To1Gxp5C97fw5
 3m1CaMILGKCmfI1B8iA8zd8ib7t1Rg0qCwcAnvsM36SkrID32GfFbv873bNskJCHAISK3Xkz
 qo7IYZmjk/IJGbsiGzxUhvicwkgKE9r7a1rOwU0ETofVZwEQALlLbQeBDTDbwQYrj0gbx3bq
 7kpKABxN2MqeuqGr02DpS9883d/t7ontxasXoEz2GTioevvRmllJlPQERVxM8gQoNg22twF7
 pB/zsrIjxkE9heE4wYfN1AyzT+AxgYN6f8hVQ7Nrc9XgZZe+8IkuW/Nf64KzNJXnSH4u6nJM
 J2+Dt274YoFcXR1nG76Q259mKwzbCukKbd6piL+VsT/qBrLhZe9Ivbjq5WMdkQKnP7gYKCAi
 pNVJC4enWfivZsYupMd9qn7Uv/oCZDYoBTdMSBUblaLMwlcjnPpOYK5rfHvC4opxl+P/Vzyz
 6WC2TLkPtKvYvXmdsI6rnEI4Uucg0Au/Ulg7aqqKhzGPIbVaL+U0Wk82nz6hz+WP2ggTrY1w
 ZlPlRt8WM9w6WfLf2j+PuGklj37m+KvaOEfLsF1v464dSpy1tQVHhhp8LFTxh/6RWkRIR2uF
 I4v3Xu/k5D0LhaZHpQ4C+xKsQxpTGuYh2tnRaRL14YMW1dlI3HfeB2gj7Yc8XdHh9vkpPyuT
 nY/ZsFbnvBtiw7GchKKri2gDhRb2QNNDyBnQn5mRFw7CyuFclAksOdV/sdpQnYlYcRQWOUGY
 HhQ5eqTRZjm9z+qQe/T0HQpmiPTqQcIaG/edgKVTUjITfA7AJMKLQHgp04Vylb+G6jocnQQX
 JqvvP09whbqrABEBAAHCwWUEGAECAA8CGwwFAmgrMyQFCSbODQkACgkQyx8mb86fmYHlgg/9
 H5JeDmB4jsreE9Bn621wZk7NMzxy9STxiVKSh8Mq4pb+IDu1RU2iLyetCY1TiJlcxnE362kj
 njrfAdqyPteHM+LU59NtEbGwrfcXdQoh4XdMuPA5ADetPLma3YiRa3VsVkLwpnR7ilgwQw6u
 dycEaOxQ7LUXCs0JaGVVP25Z2hMkHBwx6BlW6EZLNgzGI2rswSZ7SKcsBd1IRHVf0miwIFYy
 j/UEfAFNW+tbtKPNn3xZTLs3quQN7GdYLh+J0XxITpBZaFOpwEKV+VS36pSLnNl0T5wm0E/y
 scPJ0OVY7ly5Vm1nnoH4licaU5Y1nSkFR/j2douI5P7Cj687WuNMC6CcFd6j72kRfxklOqXw
 zvy+2NEcXyziiLXp84130yxAKXfluax9sZhhrhKT6VrD45S6N3HxJpXQ/RY/EX35neH2/F7B
 RgSloce2+zWfpELyS1qRkCUTt1tlGV2p+y2BPfXzrHn2vxvbhEn1QpQ6t+85FKN8YEhJEygJ
 F0WaMvQMNrk9UAUziVcUkLU52NS9SXqpVg8vgrO0JKx97IXFPcNh0DWsSj/0Y8HO/RDkGXYn
 FDMj7fZSPKyPQPmEHg+W/KzxSSfdgWIHF2QaQ0b2q1wOSec4Rti52ohmNSY+KNIW/zODhugJ
 np3900V20aS7eD9K8GTU0TGC1pyz6IVJwIE=
In-Reply-To: <20260409105747.48158-13-akhilrajeev@nvidia.com>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit

On 4/9/26 03:57, Akhil R wrote:
> Add a regmap config and a probe function to support for I3C based
> communication to SPD5118 devices.
> 
> On an I3C bus, SPD5118 are enumerated via SETAASA and always require an
> ACPI or device tree entry. The device matching is hence through the OF
> match tables only and do not need an I3C class match table. The device
> identity is verified in the type registers before proceeding to the
> common probe function.
> 
> Signed-off-by: Akhil R <akhilrajeev@nvidia.com>

Acked-by: Guenter Roeck <linux@roeck-us.net>

