Received: from mail-yw1-f175.google.com (mail-yw1-f175.google.com [209.85.128.175])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id CEA3736B936
	for <devicetree@vger.kernel.org>; Fri, 21 Aug 2026 16:03:46 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.128.175
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1787328228; cv=none; b=lkWFLiJiLjwA6frtEEp9mewGtyHcwRALBpppnwC5/6oC5ENMKIFmqIFVrtZBPl3TQANXszuaW3tqSW9AqHfYVlDUPc7lN5jMFkYld755jNKjpkCwFXMEYC/PE2eJ6QsWRay0mSrvluB784txGM1L23yCikKRNatIKcvh5cGvmpg=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1787328228; c=relaxed/simple;
	bh=Vy2ZJZNGMyLbLm8dFlgEUCw1Cwow/lz5sQ+qvQJvgcI=;
	h=Message-ID:Date:MIME-Version:Subject:To:Cc:References:From:
	 In-Reply-To:Content-Type; b=MMfUShT91mM0tVsTLXoEqTrr8V+n20XouTGpSvXH+AFxG/lhVbXE776qwcNcZIhQQW3HMY9I0tE5iSNBTJWSMCPD4zoxTYwRxd6Hxl7Mp8ViVmfPHYfNuEZgnxntQcwevNn3RVrY1/tDBQGAcqn5VF+MHBu8fGSiQHD8iC5NkIc=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=baylibre.com; spf=pass smtp.mailfrom=baylibre.com; dkim=pass (2048-bit key) header.d=baylibre.com header.i=@baylibre.com header.b=OJ7OmMj+; arc=none smtp.client-ip=209.85.128.175
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=baylibre.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=baylibre.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=baylibre.com header.i=@baylibre.com header.b="OJ7OmMj+"
Received: by mail-yw1-f175.google.com with SMTP id 00721157ae682-836c8bdac50so17605287b3.0
        for <devicetree@vger.kernel.org>; Fri, 21 Aug 2026 09:03:46 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=baylibre.com; s=google; t=1787328226; x=1787933026; darn=vger.kernel.org;
        h=content-transfer-encoding:content-type:in-reply-to:content-language
         :from:references:cc:to:subject:user-agent:mime-version:date
         :message-id:from:to:cc:subject:date:message-id:reply-to:content-type;
        bh=ckvBWrFSwcLwwa+ubcnnacuUkv4EVV++6zpuDA54lvA=;
        b=OJ7OmMj+EAbSu0oTl47nKYBVpapK9/AWe/U1/QD84QD2sWRiKCL+hm6dBPrdGSg7bX
         H+6W/i3bQuq9/om83syVlmGVDRiPTw1yX3SB4p65mPtayK1CILJ/KwRy0PTiItDoxgR1
         F7rr/IkXfr7sPYLC0kEgFcjWhpJL0W4eBL3Jq1fH1gsN4X/hy23BN9vBm+iBT034rEj9
         pR5iRY7ladre+ZWrvYxcv0c1QPSXVMC94A8rkmEU7tnsfKYGZiZBjHVVdsZCxXJ/mRpO
         +gPi2T4ILRU6RtFMvOV43uoESnBV/XHeGVNXcTN0rMvwdq4eiBt0x4Igj+ZZV7nMLrrl
         zwWQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1787328226; x=1787933026;
        h=content-transfer-encoding:content-type:in-reply-to:content-language
         :from:references:cc:to:subject:user-agent:mime-version:date
         :message-id:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=ckvBWrFSwcLwwa+ubcnnacuUkv4EVV++6zpuDA54lvA=;
        b=gqhq23Cw+AtzunLn8jgV1k/7LkvgPrstNctO2pZYS/S1sKvr6LXa4bjDUPy86G4TgP
         q33Qt0ftV7DR618DwtEYrQZQjPW7kehnaorldnCljaUAgbpxdz6xyh13DP+wQd+fFqXD
         /9EZMDeI9LgLNKS2amH5e/BPLcvTAriRu4gx+dEuwLTmzMe8Awmld4oRLWV4gHSVujyw
         9w85qoRe+MdKdBEmbP+KxecginMhpPiB9q/FRrYz7Tq3yYcWBoTWOILf08AxZUghV+3v
         ZtvWtaUNkLC+8Vyyqm9aQtrR/Ne3LYJG7s4YWJXv4HSsJExtrC1WWIKwGv6wYaPl1+fH
         nhrg==
X-Forwarded-Encrypted: i=1; AHgh+RptR1YFYbK5WjCjZQDGgboTvpGYUkxz3hdL0RAX7iJsnlXCt+klIuLmXZ+XfF5JL8zWCQbNoNC5rB+T@vger.kernel.org
X-Gm-Message-State: AFuF++nmAaaS1yq2eo/v4gQoZ2tO71ne8zHgZXn4eTkJtyjHSgFdTHC7
	ru+PoYtZ9MfEUU1g7cxkmxdcwMt+uu3sbr0f8zRl8QK2DP97QJwINxkP0zTt3b/QA9k=
X-Gm-Gg: AR+sD12H0cE6woGblY7Z6MGVRjcaM4t29BTyblfBPW6Kw7SBbRwpcsqijshrd9LGCCA
	GMRrBECj088s/JARLXXtyDb0rVCY5mpiUplZhnYQSXIqJVfdF1HGA95MBUoB5oXpT4O1WqJRRUT
	4LSVZuLk6viD7hcYQ1t/pDg3hoAiVO7cZ4RmMZvbvUcfiFjby9HU/HTADTWvghwKpFjRZ55E6/A
	hJ1n2xEQ0NGINTW5YkPykAXqZgwi7KsWKdoXlk+Fj+4HrcOGPyfKRw9ElKrpAWb2ipipdtOw16m
	2QKa2850dSZEAHwHDOu9pH3MXxWfDH7HUmZnCJw8AwbpN/+ETbuZ07LYizITCptLeeoI15N0h+2
	YJpbbm05RmkHyyn7XjK+BhdpTc9xA+aFsSYveqdTuFUD+frajfZNfWmJ2TieovltCq1DCUpuje0
	OgMU8FAN2dsWr10vLYPuVBB2PjtxgyJStHRqFcjvigHGrnhM8lwSpJo80B0lU6q0YkbDrtzjIeO
	FAqNXDHqHOK/8dBLH0jzSiqK+p1mfCe7dNNTg/Yyg==
X-Received: by 2002:a05:690c:b96:b0:806:b6ab:a410 with SMTP id 00721157ae682-849ea4fa374mr34419257b3.0.1787328225648;
        Fri, 21 Aug 2026 09:03:45 -0700 (PDT)
Received: from [192.168.1.169] (ip98-183-112-25.ok.ok.cox.net. [98.183.112.25])
        by smtp.gmail.com with ESMTPSA id 00721157ae682-845195560e1sm44559037b3.46.2026.08.21.09.03.44
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Fri, 21 Aug 2026 09:03:45 -0700 (PDT)
Message-ID: <699419a2-31ab-4379-b11f-c77e9e6a750c@baylibre.com>
Date: Fri, 21 Aug 2026 11:03:43 -0500
Precedence: bulk
X-Mailing-List: devicetree@vger.kernel.org
List-Id: <devicetree.vger.kernel.org>
List-Subscribe: <mailto:devicetree+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:devicetree+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v4 04/14] iio: adc: adi-axi-adc: Add support for CRC
To: Janani Sunil <janani.sunil@analog.com>, =?UTF-8?Q?Nuno_S=C3=A1?=
 <nuno.sa@analog.com>, Michael Hennerich <Michael.Hennerich@analog.com>,
 Jonathan Cameron <jic23@kernel.org>, Andy Shevchenko <andy@kernel.org>,
 Rob Herring <robh@kernel.org>, Krzysztof Kozlowski <krzk+dt@kernel.org>,
 Conor Dooley <conor+dt@kernel.org>,
 Olivier Moysan <olivier.moysan@foss.st.com>,
 Philipp Zabel <p.zabel@pengutronix.de>, Linus Walleij <linusw@kernel.org>,
 Bartosz Golaszewski <brgl@kernel.org>, Jonathan Corbet <corbet@lwn.net>,
 Shuah Khan <skhan@linuxfoundation.org>, Michael Walle <mwalle@kernel.org>
Cc: linux@analog.com, linux-iio@vger.kernel.org, devicetree@vger.kernel.org,
 linux-kernel@vger.kernel.org, linux-gpio@vger.kernel.org,
 linux-doc@vger.kernel.org, jananisunil.dev@gmail.com,
 =?UTF-8?Q?Uwe_Kleine-K=C3=B6nig?= <u.kleine-koenig@baylibre.com>
References: <20260821-ad7768-driver-v4-0-bb8fbd06d4eb@analog.com>
 <20260821-ad7768-driver-v4-4-bb8fbd06d4eb@analog.com>
From: David Lechner <dlechner@baylibre.com>
Content-Language: en-US
In-Reply-To: <20260821-ad7768-driver-v4-4-bb8fbd06d4eb@analog.com>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit



On 8/21/26 9:06 AM, Janani Sunil wrote:
> Add support for enabling and disabling Cyclic Redundancy Check (CRC)
> processing in the AXI ADC backend. CRC provides data integrity verification
> for high-speed ADC data streams, ensuring reliable data transfer between
> the ADC frontend and backend processing systems.
> 
> Signed-off-by: Janani Sunil <janani.sunil@analog.com>
> ---
Reviewed-by: David Lechner <dlechner@baylibre.com>

