Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=209.85.221.50
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1795455308;
	b=DKrd1860IcUxNytiyiu4jc2pgHnSgwQQMh2txCWQrXJ+ErEGeWsIv1D9LxjuUMvBpqxC
	 3bN8tPBar4i0qmnKEvk81AV10Wxbz4EChPQFnBC+Pr/1IdmNmchs+CjPeNzHTFTFeIXOo
	 XDlNG/90bTsRfq7C/xV64YozqY8TFjIHjNXVMewumuCMPw7J2a3e/ivvOMSMcgshaFR3g
	 2P2PA9mbDhR8WRfhneNu3Qns2aqojDLvjrJIci/zcybRWDu/PLYy4/p+WCKx6bDJ7xB/y
	 NccSH5YbPrvA3DYjB1VUWUyXWOXQFimOo4hmziNR4ukALAr3/keNe7nx+uBLyrqLhkA==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1795455308;
	h=DMARC-Filter:Received:DKIM-Signature:X-Google-DKIM-Signature:
	 X-Forwarded-Encrypted:X-Gm-Message-State:X-Gm-Gg:X-Received:Received:
	 Mime-Version:Content-Transfer-Encoding:Content-Type:Date:Message-Id:
	 To:Cc:Subject:From:X-Mailer:References:In-Reply-To;
	bh=bipnXXOP6GEac7VhzrWgQysb5XbdawIYcGpzXVL1ASg=;
	b=ty1g7iu6u3p2CcaIPRGPZgEvFcETh2wFEOfyITbLQSYMmjyjZxLKRnHvEQDLsOziyRA5
	 bg+t3dYPYHlJ3UEV0JyblkO+CfxftXd1ye/ubpRKcxUF2/LoIRzkkiDkeC8Aaf2pZk97F
	 GyoG8dnONklA6+wstFsAQ7p6L4R5T9N/pkd7lTZGncSJWN+LzA+sOUMv+HcPbbQUH2ahV
	 Aitp9h77sSs+YImNvh0SVS3+TMbMIRdAj4HeRgO0LMG8hcnjT8L2hNvbFPYf9YNQZ2/kX
	 Y0DJQFYmv8/aM83nuHZoReJv+0Ov5XikhSJYIW90+Aq0nHK2swjj+4Bq04yrCLSGBxA==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=linaro.org;
	spf=pass smtp.mailfrom=linaro.org;
	dkim=pass header.d=linaro.org header.i=@linaro.org header.a=rsa-sha256 header.s=google header.b=fH6SuyH+;
	arc=none smtp.remote-ip=209.85.221.50
Received: from mail-wr1-f50.google.com (mail-wr1-f50.google.com [209.85.221.50])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 219DA606A31A
	for <devicetree@vger.kernel.org>; Mon, 23 Nov 2026 17:35:07 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org 219DA606A31A
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=linaro.org
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.a=rsa-sha256 header.s=google header.b=fH6SuyH+
Received: by mail-wr1-f50.google.com with SMTP id ffacd0b85a97d-48e46e449e8so2309879f8f.3
        for <devicetree@vger.kernel.org>; Mon, 23 Nov 2026 09:35:07 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1795455306; x=1796060106; darn=vger.kernel.org;
        h=in-reply-to:references:from:subject:cc:to:message-id:date
         :content-type:content-transfer-encoding:mime-version:from:to:cc
         :subject:date:message-id:reply-to:content-type;
        bh=bipnXXOP6GEac7VhzrWgQysb5XbdawIYcGpzXVL1ASg=;
        b=fH6SuyH+GAwKxjbaDzVOjRZqrGQU9AGITxGNf7rkedt03na7jbquWkibUTZecf8WT4
         iFKaebptewviIItuq+30wSBqYaSc3NDBD2/nBrJ5bYIWO1KTBgtyYFZBK833MFEI6vER
         pchYm3ZY11joBAOjjZNLD0+KFUYKgvN4MkRgnDA5iN/usm4fcFLLissoQpPs9Vy0PQD/
         yh9Jo1rHlbH0iLAzc/aaIk7GP02n7g8+izEw0TwI35iMm/wNLOweqqhgUHt0xD/LvMlo
         Nz2l2a/telv3TzE+NOO/6DmZMgH9qKJL5gLsslQIFFrVpdobd/KYe0LyZWGGgGw5CXry
         Qk1g==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1795455306; x=1796060106;
        h=in-reply-to:references:from:subject:cc:to:message-id:date
         :content-type:content-transfer-encoding:mime-version:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=bipnXXOP6GEac7VhzrWgQysb5XbdawIYcGpzXVL1ASg=;
        b=Z5KkOknCdHY/X6/gbVol+TrhpQbmAP8/VKDd8vdjzWkBACCL7AgR1413UwzSFsVqkh
         dUiq+0dSM0GRbFUyXb2x7lGQc2eWzA9K4JE/uXqgEXqOnHZ9/dlkWPDsTksZvDN1IxXd
         HYEsGyAX/rH3/dNyNy05JWE++rtgkiI9wGyDLuQvl/yNrghJK7yzEGS2hKAG00Gokcol
         knUGHKqvXkysUa2R+K5g6NIS8uvhbHRtw8008wcb81D3TAcQa9AIFjpfbgmCTFVQ8eKN
         8+nJlcP1GvLDcZeWBqRAKg/BqfJq9mTwurDAfXf/TMBWG2QfknR74D8fTRgjf27G10+T
         /0Aw==
X-Forwarded-Encrypted: i=1; AL+hErEUWNwXIewcZNu9b+De+50Ql58Uux7izDblPhs2vQPc4P9nmCjcEGztg+tNDj9tqNM2K2rfkPh18fhc@vger.kernel.org
X-Gm-Message-State: APuU4Z/TfQkyv8VMRh5bc+gH44Ry6iDri9tILt1P3J6nfVO9YnqCGNTF
	u98FGZug8olPndmgprx+4fn9wdJRxJ4mkOmhcP3PTPnHcduJBG5jCti6MB+0+x5zZIQ=
X-Gm-Gg: AZFdTZcknXhZVgkUH0cQ+SyeOiMtxBWDVdRziEEU7hLpWBJaTKm88+MR3xLCb0rEhMl
	d6pewRTjrWGT0ANbTEBogunYNHsxo7oNLnMBezlZG9DaFdpJisxdU9TB1n/RXVaDYr+sAxmUlsE
	6hXtCXOscUIjk2CIUaSZ32oXM1ZY6vvdyP8I7ubDDdycuS/QuMFR/W+gR0/mW4+e++1oKkB7JtC
	uhBZOD06OHwSQd9UewBF99mAJ1bfi9K3vv9jlgHqAZDAOPDt1lXlSO8bADSrpb460WSPam8qIS9
	NfWptu88gFTamtOLT3g5G71UChvsfDnFbQXCK+geOLcwj3EeB5Tu6XT+Hw5jAtj4Pkyqn//Nljo
	P+U3ISlwiyRw6gm1yVSSo9VXZWhwllm6z71jPMScCydXoiru51IP3KZMEezY8yikkyRbip1PZ1n
	VSoRfxDM1InIxOmr4W+JDxZB03ivqDKoLAYOwNEOBJS0h6m8fuUILMJWbgIwDfNg1fsgXtUkqj9
	A63Cj+9lWtAbrw4JiWvO9APcSTRYwumMIHX9hu7FNhRAeD1mPyYTPsF8/GbsfYTStzc/SEWXVsE
	viSzoJuz1q1kboKWS9zIp/uHmVw+ueIcw1F59H6UZVylDcSsv/KKdiH1iAQcC9o44gY45Qk3RmY
	j0P1qjpHoNjuXKumQBy0=
X-Received: by 2002:a05:600c:820c:b0:49c:d019:70c5 with SMTP id 5b1f17b1804b1-4bb887876c0mr279140365e9.0.1795455306378;
        Mon, 23 Nov 2026 09:35:06 -0800 (PST)
Received: from localhost ([2a00:2381:fd67:101:aee4:8c07:a9a3:c706])
        by smtp.gmail.com with ESMTPSA id 5b1f17b1804b1-4bb88402ce9sm291142275e9.0.2026.11.23.09.35.04
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Mon, 23 Nov 2026 09:35:05 -0800 (PST)
X-Mailing-List: devicetree@vger.kernel.org
List-Id: <devicetree.vger.kernel.org>
List-Post: <mailto:devicetree@vger.kernel.org>
List-Help: <mailto:devicetree+help@vger.kernel.org>
List-Subscribe: <mailto:devicetree+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:devicetree+unsubscribe@vger.kernel.org>
List-Owner: <mailto:devicetree+owner@vger.kernel.org>
Precedence: list
Mime-Version: 1.0
Content-Transfer-Encoding: quoted-printable
Content-Type: text/plain; charset=UTF-8
Date: Mon, 23 Nov 2026 17:35:04 +0000
Message-Id: <DN2RSBZYE9CU.1T1IA1OH8S0UC@linaro.org>
To: "Andy Shevchenko" <andriy.shevchenko@intel.com>
Cc: "Sam Protsenko" <semen.protsenko@linaro.org>, "Jonathan Cameron"
 <jic23@kernel.org>, "David Lechner" <dlechner@baylibre.com>,
 =?utf-8?q?Nuno_S=C3=A1?= <nuno.sa@analog.com>, "Andy Shevchenko"
 <andy@kernel.org>, "Rob Herring" <robh@kernel.org>, "Krzysztof Kozlowski"
 <krzk+dt@kernel.org>, "Conor Dooley" <conor+dt@kernel.org>, "Peter Griffin"
 <peter.griffin@linaro.org>, "Alim Akhtar" <alim.akhtar@samsung.com>,
 "Krzysztof Kozlowski" <krzk@kernel.org>, <linux-iio@vger.kernel.org>,
 <devicetree@vger.kernel.org>, <linux-arm-kernel@lists.infradead.org>,
 <linux-samsung-soc@vger.kernel.org>, <linux-kernel@vger.kernel.org>
Subject: Re: [PATCH 2/4] iio: adc: exynos_adc: add Exynos850 support
From: "Alexey Klimov" <alexey.klimov@linaro.org>
X-Mailer: aerc 0.20.0
References: <20261001-exynos850_adc-v1-0-791b3516bb9d@linaro.org>
 <20261001-exynos850_adc-v1-2-791b3516bb9d@linaro.org>
 <ar9elr1_tuFhJi1r@ashevche-desk.local>
In-Reply-To: <ar9elr1_tuFhJi1r@ashevche-desk.local>

On Fri Oct 2, 2026 at 8:34 AM BST, Andy Shevchenko wrote:
> On Thu, Oct 01, 2026 at 04:09:13AM +0100, Alexey Klimov wrote:
>> Abstract the read_value() operation in driver data exynos_adc_data to
>> support SoC-dependent data register read callbacks.
>> Add the exynos850_adc_data struct that describes Exynos850 ADC ops.
>> It also requires its own hardware initialization and exit routines.
>> Add them as well.
>
> Split this to at least two patches:
> - add .read_value() callback and switch existing users
> - add new user

Thanks! Sure, will do.

Best regards,
Alexey

