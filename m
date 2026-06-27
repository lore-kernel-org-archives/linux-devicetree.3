Received: from mail-oi1-f170.google.com (mail-oi1-f170.google.com [209.85.167.170])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 5564735DA40
	for <devicetree@vger.kernel.org>; Sat, 27 Jun 2026 21:39:35 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.167.170
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1782596377; cv=none; b=T6tnu69f/2GT5gMM94/lMtfT3zolzq2dPTtkz9CsMONyF76qrig8aQWFD1TyhdQiuLJF85lyu3J5hkpjAc7gSH/bhMIZDTTEav2AwjGDKo6nnKiewi2BTS7GA9gySRcKIDWK40FqN/fqQMPPPdDC9NGjUMGdmh8RipeLd4BpNmA=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1782596377; c=relaxed/simple;
	bh=Jrw43e9my7yjDySFOHdkZacbQ+d1cBOiqQNFbZ/fcC4=;
	h=Message-ID:Date:MIME-Version:Subject:To:Cc:References:From:
	 In-Reply-To:Content-Type; b=vCH75ll3+B4LsSXpHfX1ElGESrNxkwDHLrHVdnNgMB/yMuF2Wjc3pKd/g8wVWFz3RTIiBMVO81ktnzeV7+xRFg0zR8Ym4XtcPl0BVjofwHpaWTSxySUznHPDW41ft7pfWbZtVV3MVE9MdFZqfj2saGtp/YQ63/uKvNrZIHBfX4s=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=baylibre.com; spf=pass smtp.mailfrom=baylibre.com; dkim=pass (2048-bit key) header.d=baylibre.com header.i=@baylibre.com header.b=lwaDr6K7; arc=none smtp.client-ip=209.85.167.170
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=baylibre.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=baylibre.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=baylibre.com header.i=@baylibre.com header.b="lwaDr6K7"
Received: by mail-oi1-f170.google.com with SMTP id 5614622812f47-491bc1d4e6bso1621397b6e.0
        for <devicetree@vger.kernel.org>; Sat, 27 Jun 2026 14:39:35 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=baylibre.com; s=google; t=1782596374; x=1783201174; darn=vger.kernel.org;
        h=content-transfer-encoding:in-reply-to:from:content-language
         :references:cc:to:subject:user-agent:mime-version:date:message-id
         :from:to:cc:subject:date:message-id:reply-to;
        bh=Mi58OHINH72wJR2vpcoc/xSWHNR4hKCJuepbJpQnH/0=;
        b=lwaDr6K7ErXT/qBQqketc+6HyPzQo76+PWB2I5vtxG/oEYY+KiCG3YgrWgSi4QA31d
         o1p8T52d2btzdSk642f6zYAlqgXJuFl7NGU5YUI6DONsIVrVbDxISOawk8o9EJ3Myp37
         W3jywzlHPQWTxm1KwHpXDq7H/U6OIbv2oL6Gxn8cHg5C6b2dG9h+dVBM+fZ7kU9281OZ
         ZwL36uSeqCcbQWVVggWr0HTlQkmLpEms4SU1Yo1phV9JQI+rMRY7Yhukk/1RcxtXMLD3
         zZe/WrGF825v69KlAnIlHE5UjZf+FOgqgKsCUFJCuMwf8UkZQlrqBXbba/njOQ2UoXUp
         lfmQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1782596374; x=1783201174;
        h=content-transfer-encoding:in-reply-to:from:content-language
         :references:cc:to:subject:user-agent:mime-version:date:message-id
         :x-gm-gg:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=Mi58OHINH72wJR2vpcoc/xSWHNR4hKCJuepbJpQnH/0=;
        b=XPufzN4jISsmXzQtH3bwhK7vTNv2eXWfH7BYG+bzVAZTaQh1WNX2JZZz5vvz+Hjo/v
         gHNUgUhJ1/eKUjrNXEyEfskh1rrMXKsDlZsf8Sao4iixttKiORt4NCDisourDqB6T1Ze
         KEeIJnXt5a/AnH7n1NyxmiyHGWEhkNPRx3OaLac/BJQePcU3qDZd8D5WF/D8f23HNmWx
         t3eXbwHdvnqRJ+EvsTaCDLdYQj2+vIOm/k86LCs3n5ZCTdgZL/1jZrKac388LQPx606y
         MRogeSoU6s3RB0pV4vYQpoyRBVBxSPVetYUQuy4pwsGr/1bYcT/7xgkW62J8WnZbyV9O
         d2cg==
X-Forwarded-Encrypted: i=1; AFNElJ8V0OHBtPHI4kRa2dkLcONTW8HhkTs/PMtQxwfeK5JdyRHsCbQnPEM8LiIQi6Y+mTT5zfLzEBbWncSS@vger.kernel.org
X-Gm-Message-State: AOJu0YyZHRIJWAmHRt2ING8zyC5gYiOTT8/pBgVbcmGNpRiPXmr9ugLT
	iPN9a9jaQiA1ui89WOm/q6I810EGzGpMHm8bw3PRexTXD561AeVeZek2+VkuaF62Cg8=
X-Gm-Gg: AfdE7clRCDQXjTHGXD9TWpCcAe9qJbR58tBDZPf39srFgXsULPAUoA4m2+FhYzfG6rM
	or3vup6IqW+GGMOOnUjEb2FPq+DYGfG/bYI868OSW0QG4Jwq4eidILMVUN86SA8u1r66mS2S5bG
	4Pm+/Nhe+dL8qyjDysEWL8h9cd0vuq86bddKMzD57cXfZ+D60lyv8TUJtytrRZhVfEey6X5DaIK
	OXsr7pppuA70nGUSl2MDuN/sc4YNnoBbw+S0KUAxU6TFoLb84APh10JMitAd0xv3CAmZvkrGblc
	HszG99nk/nmxyRi7dJj6i3usBjursAhPdNfPb9kumEp/EaTf9Hu8MCfwkNBO7eLlvWecouBQVih
	sw4XhpabKLTvieNmTQMt9rCQn0XDv+kDHS+x86St3rITUcWf0/DaJ62JntMNpjmKP2x2F7nGZ2y
	PFgy3W9ARHm5pzu+kpainE3w+kirgOoJjmJGrrDmPJMZmlPHP/ODVdltYvkVDTPFuicKMicDj8X
	g==
X-Received: by 2002:a05:6808:3442:b0:495:af31:c66a with SMTP id 5614622812f47-495af31ddc8mr752314b6e.15.1782596374257;
        Sat, 27 Jun 2026 14:39:34 -0700 (PDT)
Received: from ?IPV6:2600:8803:e7e4:500:f242:ecd6:f61e:d764? ([2600:8803:e7e4:500:f242:ecd6:f61e:d764])
        by smtp.gmail.com with ESMTPSA id 5614622812f47-49352b057dasm3927523b6e.6.2026.06.27.14.39.32
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Sat, 27 Jun 2026 14:39:33 -0700 (PDT)
Message-ID: <a2fa4d9b-1f09-4226-8f06-371bd11ef919@baylibre.com>
Date: Sat, 27 Jun 2026 16:39:32 -0500
Precedence: bulk
X-Mailing-List: devicetree@vger.kernel.org
List-Id: <devicetree.vger.kernel.org>
List-Subscribe: <mailto:devicetree+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:devicetree+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v4 0/4] iio: adc: Add support for LTC2378 and similar ADCs
To: Marcelo Schmitt <marcelo.schmitt@analog.com>, linux-iio@vger.kernel.org,
 devicetree@vger.kernel.org, linux-kernel@vger.kernel.org
Cc: jic23@kernel.org, nuno.sa@analog.com, Michael.Hennerich@analog.com,
 andy@kernel.org, robh@kernel.org, krzk+dt@kernel.org, conor+dt@kernel.org,
 julianbraha@gmail.com, marcelo.schmitt1@gmail.com
References: <cover.1782397418.git.marcelo.schmitt@analog.com>
Content-Language: en-US
From: David Lechner <dlechner@baylibre.com>
In-Reply-To: <cover.1782397418.git.marcelo.schmitt@analog.com>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit

On 6/25/26 9:34 AM, Marcelo Schmitt wrote:
> This patch series adds support for LTC2378 and similar low noise, low power,
> high speed, successive approximation register (SAR) ADCs. These ADCs are similar
> among each other, varying mainly on the amount of precision bits, maximum sample
> rate, and input configuration (either fully differential or pseudo-differential).
> 
I had a few minor comments and I suspect Sashiko found a few legitimate
things. But this is looking really nice now.

Reviewed-by: David Lechner <dlechner@baylibre.com>


