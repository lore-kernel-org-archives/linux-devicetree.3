Received: from mail-dl1-f52.google.com (mail-dl1-f52.google.com [74.125.82.52])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id A3760393DEE
	for <devicetree@vger.kernel.org>; Mon, 30 Mar 2026 18:39:21 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=74.125.82.52
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1774895962; cv=none; b=KWywKZpcYWleI2pdK+FJlnhlEM7G8+CjOL9CaW2bLqYDOoPXfb4wh0PC/PgLff1YOp3TINwLG9bGovqI5DNj6hFFH/UWsYLjMOpxB34mfB3gQoer5d2hxzYLa2TpNqdcNmZLCVvA9YlVXSqLpsVrGl2eF9Eg6RbIHQxzR5lLBXA=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1774895962; c=relaxed/simple;
	bh=KTf4KJL538eZhPAMBYKEg+s8bkdOcZt9FvNDrq+YQFw=;
	h=Message-ID:Date:MIME-Version:Subject:To:Cc:References:From:
	 In-Reply-To:Content-Type; b=L9BT9uXgM3GFCLNVc0aQUeYbvC8Qwh7wNoEpTBEqOI9g1gDzhLPTOE+lyU/NKYQsau+neQh3uTZrzVArXx/DG7utxGsztoQeqUkHfxp99qChgNBkzQ09IWqDaWFrFuV06nzW7a1rTID70d/YQ55s/ZGfbSvuNppZkrv1efsfO+4=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=roeck-us.net; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=OUjgvSfa; arc=none smtp.client-ip=74.125.82.52
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=roeck-us.net
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="OUjgvSfa"
Received: by mail-dl1-f52.google.com with SMTP id a92af1059eb24-127380532eeso289634c88.1
        for <devicetree@vger.kernel.org>; Mon, 30 Mar 2026 11:39:21 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1774895961; x=1775500761; darn=vger.kernel.org;
        h=content-transfer-encoding:in-reply-to:autocrypt:from
         :content-language:references:cc:to:subject:user-agent:mime-version
         :date:message-id:sender:from:to:cc:subject:date:message-id:reply-to;
        bh=uVHdutmIC3AH5O+mHbPt+0s/P6e7UCkLKd1dK/WHDKI=;
        b=OUjgvSfaNOizaDAJ9CeZIkhVpAdkBhqDQvN4RekVAZcjPyC5q8cCToNkJ7skCjVUAD
         L9vDqGQeBi921bHX0kj5lZpWKupeeXydvbnMhCBDvmIll8COPY4ulvHx6Q6X7Z3uNHk0
         gFJTDuwjqx07je4idvVBmLDew8iggJ2J6YzAMENffsV0VZGHBNlrkcHVJteaZRfPY1nV
         tSb+zt/Ov6eRTU5SUh1lD5I+nDd2S+IZstIo71SDO53fXqUsSd4uHvtK0phVJ+dUH4o2
         xK4qHgHftXT8/VSF5ZIyQf4f2Yhzzbj7XJF1FKgWaVNUE8itBefgOEFG8MccSbA2bRX7
         BYBw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1774895961; x=1775500761;
        h=content-transfer-encoding:in-reply-to:autocrypt:from
         :content-language:references:cc:to:subject:user-agent:mime-version
         :date:message-id:sender:x-gm-gg:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=uVHdutmIC3AH5O+mHbPt+0s/P6e7UCkLKd1dK/WHDKI=;
        b=JwPA62fe10G+e1YLeZAxeyJjHEOb7PU4Iw0zX1edQNPxQZOABE7b8ldn8+v+To1mWn
         TS9N02qyshC8tynD+nuPRBKtzhzqtL9ZUdEbsuY4TrOeM7Wf+LFD2yjV+V6hfHZ5Uq2o
         rbbVwxCx+LJ+ah0lIMwv8RDLUqAyaPp/818tbsWzY0PHNqIuGwsoObcx4B2aHbjPlIpV
         dyrOl+eazNy5+ygMv6/EBhjg0yfzOYkODbizqZtG0xzdjPF5/YxLz5q7k3fozoJXbOac
         EBdVIqWkKqoJ7TkfgJ6wcNcwWi2HsIFzXb9b5cVFrfIrq1TnL8QfhVtp4vCALtbF/cCT
         GAww==
X-Forwarded-Encrypted: i=1; AJvYcCWIbfpiec+oJQom+YlZ3ihjSXMfkhaqQ6pW1htGG+ZKcnhl4VlVGdwraOoj9mQ6qp1zAMMhn7mTaY3J@vger.kernel.org
X-Gm-Message-State: AOJu0YxpofKGKW0QYiV1up+V7j9TIpt2m68xIA4JQgQZCITC7c9ctTSk
	BulqncZWS2ieX9YJ2oWk4x7/Eih8/C/pmnxE1gN6NjuVR0MswCvb6VX4
X-Gm-Gg: ATEYQzyBI3ziLCR9NTwv7+IJgoLeYWh6psf9XKWvd566sdq/pakb1b21WGQlNlvj7kn
	Si12DNjtdGMjxtL/AnKLAJPRTd//EGPFDQHsxauBgSsqBq6DNiDBYKDxxdrrveQLpWBnhwCV1pl
	xFK2vE6kQMfdFBgwFlpFqEq5s+gWEnQS+GNSQCSIxfw/65DtI2LIifxdMBeIpCHpssU8CLhsZs+
	XE9Szvm64R4l48LZmSXdEfn6XoJyMTWk+Gn/qXAhtrgE3yHKBbP2GlGylTbQlff5JI0Tehyyjdi
	fn2jBTm1ZOUCmbPDcjs6x8ngYhsl8eeaFFqlQ9zmQoP4OyVPdn+ZBRWRH3h398wP5gtKAGokjdx
	Zdnp8owC+wNrBFyvEo+cKt2IsUgDZuXZxJ/hUZEajhiQHGQhMGFsBOlgC1o6q+AlPtC7T2U8c3P
	uui0ThKrWtn418TgSOkK6cEhAsJBFv2HdXR8ZZnB62DXLI92aBa4Q/tIyZe2pDPXK+a3VS6zwl
X-Received: by 2002:a05:7022:2207:b0:12a:6902:ddb8 with SMTP id a92af1059eb24-12ab2846679mr8913143c88.4.1774895960606;
        Mon, 30 Mar 2026 11:39:20 -0700 (PDT)
Received: from ?IPV6:2600:1700:e321:62f0:da43:aeff:fecc:bfd5? ([2600:1700:e321:62f0:da43:aeff:fecc:bfd5])
        by smtp.gmail.com with ESMTPSA id a92af1059eb24-12ab97e7a57sm10309602c88.6.2026.03.30.11.39.19
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Mon, 30 Mar 2026 11:39:20 -0700 (PDT)
Sender: Guenter Roeck <groeck7@gmail.com>
Message-ID: <3d3c7fdc-6e6b-4e39-a39b-76d1d9d9b828@roeck-us.net>
Date: Mon, 30 Mar 2026 11:39:18 -0700
Precedence: bulk
X-Mailing-List: devicetree@vger.kernel.org
List-Id: <devicetree.vger.kernel.org>
List-Subscribe: <mailto:devicetree+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:devicetree+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v5 2/2] hwmon: Add support for TI INA4230 power monitor
To: Alexey Charkov <alchark@flipper.net>, Rob Herring <robh@kernel.org>,
 Krzysztof Kozlowski <krzk+dt@kernel.org>, Conor Dooley <conor+dt@kernel.org>
Cc: linux-hwmon@vger.kernel.org, devicetree@vger.kernel.org,
 linux-kernel@vger.kernel.org
References: <20260330-ina4230-v5-0-eeb322d95b3a@flipper.net>
 <20260330-ina4230-v5-2-eeb322d95b3a@flipper.net>
Content-Language: en-US
From: Guenter Roeck <linux@roeck-us.net>
Autocrypt: addr=linux@roeck-us.net; keydata=
 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
 np3900V20aS7eD9K8GTU0TGC1pyz6IVJwIE=
In-Reply-To: <20260330-ina4230-v5-2-eeb322d95b3a@flipper.net>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit

On 3/30/26 08:14, Alexey Charkov wrote:
> Add a driver for the TI INA4230, a 4-channel power monitor with I2C
> interface.
> 
> The driver supports voltage, current, power and energy measurements, but
> skips the alert functionality in this initial implementation.
> 
> Signed-off-by: Alexey Charkov <alchark@flipper.net>

Sashiko report is at

https://sashiko.dev/#/patchset/20260330-ina4230-v5-0-eeb322d95b3a%40flipper.net

Valid concerns, as far as I can see, are:

- There are various overflow issues. Please address, either by making sure that
   the operations can not overflow, or that all parameters such as the shunt
   resistor value or the interval are bound such that an overflow can not occur.
   This includes implicit conversions. For example, the interval passed to
   ina4230_interval_ms_to_conv_time() is int, but the parameter is actually long.
   There is not even a signed check, meaning the resulting interval can be pretty
   much anything.

- power is reported by the chip as unsigned value. Yet, it is converted via type
   cast to int16_t.

- Please add a comment to the energy reading to confirm that regmap_noinc_read()
   performs as expected.

- The definition of ina4230_curr_reg[] is wasteful. There is only an entry for
   hwmon_curr_input. Why specify an unnecessary two-dimensional array ?

- The dummy channel 0 for voltage is not acceptable. Make it 0-based as expected
   by the ABI. Yes, I know, but that is how the ABI was defined.


I can not comment on Saskiko's pm related feedback. PM is and has always been
a mystery to me, so I just assume that it is WAI and that there are no problems.
I do assume that you have tested the code thoroughly across suspend/resume cycles
to make sure that it works as intended.

Thanks,
Guenter

