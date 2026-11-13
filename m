Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=209.85.208.173
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1794584200;
	b=B8731ms5ab47XV7oP8lmngZRs1I7435aMYH3hiF/GksvxUnZMmMvT8+8CK1EapcBYqyP
	 cD6mwKa5TKJbfjl43z5A10jTRwLmRmVJHKfXDD7NJtQIQFoaNTwmLhxQoUGJFHFA1PYLk
	 Cx8iHnnYKzWtKFdi1aVwOMyW4bnZeHPDgpdORZtnNONXbkM94wBjrCoxUZ0WgoUHTRmYg
	 HP3LZqc8TMfBrVKxjSSCS/YYx3Q79nu2si0sam+iYZCTxM2U73WZGiAaShYzgwIyNUJsB
	 0lKnz42QN2MlbArlyzICbQ6BMSKTAmAm4dT0rYtiMVZeiJS6HlmRqbMNT4W1gdVWECA==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1794584200;
	h=DMARC-Filter:Received:DKIM-Signature:X-Google-DKIM-Signature:
	 X-Forwarded-Encrypted:X-Gm-Message-State:X-Gm-Gg:X-Received:Received:
	 Message-ID:Date:MIME-Version:User-Agent:Subject:To:Cc:References:
	 Content-Language:From:In-Reply-To:Content-Type:
	 Content-Transfer-Encoding;
	bh=x62ZihgS7kh4nWdNrWclZKqO2BrkWNZR/gkUNOF/E3Q=;
	b=fYeeQTa/uPuCzVbTajkTIqcP4HzqEVFEuZpLbKhcymlOzNPY793DiSfGp0xLBBK9w40/
	 keiG0LEf+9+RmL9otDVCGXXi9bcp4dzAIJ1l0sofCXUKE2j8W6iQQsNNBwdTcGztUQ1/P
	 y4/wJlNw6qUXixNErKFx2P7WmXmQ+esM6MB2VrporJLrqJ0NYxuTvS6zy4VWmRvjuPPuO
	 2ZB7Tg6pjkDqu+6GlEV+NKP4PYtEz0zOAUnNZlGh2bDS0LcqILcqRfXdhrlTopy8sllWu
	 27NWF2Voryx1/FBB7rs+Wg3Bb0lO4edroMDVt3h6zqPwb6+HnGGGpH9MF2NkJ4WvrIw==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=gmail.com;
	spf=pass smtp.mailfrom=gmail.com;
	dkim=pass header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20260707 header.b=rOwFdNzH;
	arc=none smtp.remote-ip=209.85.208.173
Received: from mail-lj1-f173.google.com (mail-lj1-f173.google.com [209.85.208.173])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 3B93C606A32D
	for <devicetree@vger.kernel.org>; Fri, 13 Nov 2026 15:36:40 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org 3B93C606A32D
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20260707 header.b=rOwFdNzH
Received: by mail-lj1-f173.google.com with SMTP id 38308e7fff4ca-3acc7a0b558so14623171fa.3
        for <devicetree@vger.kernel.org>; Fri, 13 Nov 2026 07:36:40 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20260707; t=1794584198; x=1795188998; darn=vger.kernel.org;
        h=content-transfer-encoding:content-type:in-reply-to:from
         :content-language:references:cc:to:subject:user-agent:mime-version
         :date:message-id:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=x62ZihgS7kh4nWdNrWclZKqO2BrkWNZR/gkUNOF/E3Q=;
        b=rOwFdNzH/fyJv94XjX1UieKx8ePFP8iuZ7nP4Ih6XTpFMPP/l6PmZbpLrStQb/Ejbb
         SB2PTsN7A/l1Y4z5fNNxcv4gkf/VPebjCxm1aUE+9wAHG000TkHrndxkA0+z0d0dXCZg
         kaRKYraNW2gB6WcJp8h3+yoXHLyfR4UAlI5z1YEgK11EAg8u1LcnD8VqPrmODmZYMw90
         37xoGDhB7724r6OLL6En9NLUqfD+aOrgp05SWbCiyUua9YX+kieQcuMsKnEi9gQbJsyJ
         GjzEFTZrCtDeL1vkX/LZ1KOjgUjtPNMsUb3oZPy+++9COmIMLAYtDC9aB2lnGZpa4T7x
         mkAA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1794584198; x=1795188998;
        h=content-transfer-encoding:content-type:in-reply-to:from
         :content-language:references:cc:to:subject:user-agent:mime-version
         :date:message-id:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=x62ZihgS7kh4nWdNrWclZKqO2BrkWNZR/gkUNOF/E3Q=;
        b=dwmfJqMEcdbGHYruvbGLpeA5UBFO1Z9O4HSle+8Mnc8sfPrBQVBnxoEuuRbONVxp1F
         p5o/Rj5EEMCzuYCpxEAIFx2wc6Fsmr3MVAJLGUhyOPJfNv5HSMPGLanKEYfv2A/oKtwA
         Agq00SZEnmO/8PYhy3oMCNzst9Du0XyOgDX6D2Pn2a1Jpc3eB/QE+aKRjtEhmca1113p
         mj1U5eeNAMePRB7MUTf+FemC6zXTLgt/C6EEUZv890UYOSkW/5v7SHVNq5WH/yWVQmE6
         OV71tk+8rPgAp1li07sg2fMqH9oISvVqh6vmGM94IYX3NgQpLKNbvEc8Ld1xh2MId4Z7
         SWEQ==
X-Forwarded-Encrypted: i=1; AL+hErHlkg8j7w4a/HEzhfpVbqoFDOCoyXI9Dp5ajhs1y+fvFlj4IlB5W+cHhIvNuyi4Bp2FN5PWbwJE860s@vger.kernel.org
X-Gm-Message-State: APuU4Z++haMTsmwMxVLlU0wtoAqw0hn2r46ICyGvzFIn2pLbSi4TpApV
	yLF6BgJSmdaM+kF06g3xsjgfYpqjVEriIS2szZcqnou45ekAL5Q6CHCsSrRzOPcT
X-Gm-Gg: AYBFou0lePx1AcS8nxgRsLA0brf1pwMoYLrXA5D/vEpHi+YBkrA+PyJykd36OnOeku+
	PSLAEwMBsg6vmCZ66wXb916XlISlZmwnGPY1CzfRJEkfbymMwMAjlgvNIto3uf7mYn0VIH1FVtt
	2lA55laloAsEonHhNOOTYr5cMINI0uySgL6riv2xD5iDWsN94ux7Q+Ruvgqa5cLwAcqDBUEiWDz
	GaF4GbyInK6PDE2tUzMl2jvyVdYrGjZ9UDoDyRiv0saHq43Qoy7z6/trawI9GaK8Ie2wHc4hEA+
	7eFFAADUrpNSykT+5bmkC45sulfDPpe6x534vRhyumXIO0SuWf5I0muC3qCmOKIwSxZKvew+UaS
	tBDxdffuE385+WmLJDVa+I1NbYZGDiaa/arp1uFnlvRFrYnNznlCr2AGQlnExjIjlI0fPHNm/8W
	pFgbmwzbpWen/Wl840dtAcjOOJXPgMb4d4L6vwBGax/xUcZADoUQYhmQi/u91LcexPqovReKCcs
	MooPMQAxRsXQvZ2PnPYHNRV6FpqJHjAMx9iRUeKICJ+nIxsopi/1rcyxLkocVn3zDmBBpNX/lFE
	MAPHCKmLgeX1HMZDzkck9X4hWfrngV1HtnKOsepMFUwSW04dV97G5oW3dTuKsXvFUq8tup09JcK
	GICgUpdD9IpOt2jImBOrvLWiPiSVmRdQ=
X-Received: by 2002:a05:651c:1596:b0:3ac:97e4:4987 with SMTP id 38308e7fff4ca-3ae2b4c77cemr10278541fa.7.1794584198178;
        Fri, 13 Nov 2026 07:36:38 -0800 (PST)
Received: from ?IPV6:2a10:a5c0:800d:dd00:8fdf:935a:2c85:d703? ([2a10:a5c0:800d:dd00:8fdf:935a:2c85:d703])
        by smtp.gmail.com with ESMTPSA id 38308e7fff4ca-3ae2b7808cbsm9395051fa.14.2026.11.13.07.36.36
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Fri, 13 Nov 2026 07:36:37 -0800 (PST)
Message-ID: <ef47542e-308c-4211-9b42-ba2de13f5f82@gmail.com>
Date: Fri, 13 Nov 2026 17:36:36 +0200
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
Subject: Re: [PATCH v4 2/2] iio: adc: add driver for Texas Instruments TLA2528
 adc
To: Maxime Chevallier <maxime.chevallier@bootlin.com>,
 Jonathan Cameron <jic23@kernel.org>, David Lechner <dlechner@baylibre.com>,
 =?UTF-8?Q?Nuno_S=C3=A1?= <nuno.sa@analog.com>,
 Andy Shevchenko <andy@kernel.org>, Rob Herring <robh@kernel.org>,
 Krzysztof Kozlowski <krzk+dt@kernel.org>, Conor Dooley <conor+dt@kernel.org>
Cc: Rodolfo Giometti <giometti@enneenne.com>,
 Marcelo Schmitt <marcelo.schmitt@analog.com>,
 Antoniu Miclaus <antoniu.miclaus@analog.com>,
 Angelo Dureghello <adureghello@baylibre.com>,
 Tobias Sperling <tobias.sperling@softing.com>,
 Eason Yang <j2anfernee@gmail.com>,
 Marilene Andrade Garcia <marilene.agarcia@gmail.com>,
 Cosmin Tanislav <cosmin-gabriel.tanislav.xa@renesas.com>,
 duje@dujemihanovic.xyz, Joshua Crofts <crofts@kernel.org>,
 =?UTF-8?Q?Uwe_Kleine-K=C3=B6nig?= <u.kleine-koenig@baylibre.com>,
 Victor Chernyakin <chernyakin.victor.j@outlook.com>,
 herve.codina@bootlin.com, thomas.petazzoni@bootlin.com,
 linux-iio@vger.kernel.org, devicetree@vger.kernel.org,
 linux-kernel@vger.kernel.org
References: <20261113151543.2241604-1-maxime.chevallier@bootlin.com>
 <20261113151543.2241604-3-maxime.chevallier@bootlin.com>
Content-Language: en-US, en-AU, en-GB, en-BW
From: Matti Vaittinen <mazziesaccount@gmail.com>
In-Reply-To: <20261113151543.2241604-3-maxime.chevallier@bootlin.com>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit

On 13/11/2026 17:15, Maxime Chevallier wrote:
> Add a new driver for the TI TLA2528 ADC chip. It has 8 12-bit
> channels, that can also be configured as 16-bit averaging channels.
> 
> This is a very simple driver, allowing reading raw values for each
> channel. GPIO mode isn't supported for now, as well as buffered mode and
> the 16-bit averaging mode.
> 
> Co-developed-by: Rodolfo Giometti <giometti@enneenne.com>
> Signed-off-by: Rodolfo Giometti <giometti@enneenne.com>
> Signed-off-by: Maxime Chevallier <maxime.chevallier@bootlin.com>
This looks very familiar to me. I am pretty sure I've reviewed this. Is 
there a reason the RB-tag wasn't carried over? (Sorry if I've missed 
some change(s))!

Yours,
   -- Matti

-- 
Matti Vaittinen
Linux kernel developer at ROHM Semiconductors
Oulu Finland

~~ When things go utterly wrong vim users can always type :help! ~~
