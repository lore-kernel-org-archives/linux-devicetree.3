Received: from mail-dy1-f181.google.com (mail-dy1-f181.google.com [74.125.82.181])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 04B4139656E
	for <devicetree@vger.kernel.org>; Wed,  1 Apr 2026 08:38:00 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=74.125.82.181
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1775032682; cv=none; b=dlyUQro0Q2urvS4pQIbOsTV0hJ/Y7bClVow6de/IaDo02yCaKBbE7OXdE1vHvztMG4L/X8glAXfljc6g0wlgxwcAjaVL90vzWJImmoEnEZxowwESj66mXKMafBFMnB4zTVtwuuhL5vE4bwlwggbfm3ODbXB4qZupa/T8fUZGRL0=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1775032682; c=relaxed/simple;
	bh=B8I4yikU+NXuSEW/XgDJSCcfrf0nd87qDy9j71SJckc=;
	h=Message-ID:Date:MIME-Version:Subject:From:To:Cc:References:
	 In-Reply-To:Content-Type; b=RapznoXIMU7okNwRfCyLQrm2sJJ0d1aQLYM9oo1+v59QcVXsCTyy0b0ZYfpH7nLol5uNpNvPtdQh+OMd0Gvj6bCNJEsIzw0WQL8CfIO1/UzdJgCyVQUxrwS7ht7JBKb/wMIf3lKiB2xVVUTKwK4rzIjAFs6mZnPsq6dLql5pxWA=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=T9tFyAQL; arc=none smtp.client-ip=74.125.82.181
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="T9tFyAQL"
Received: by mail-dy1-f181.google.com with SMTP id 5a478bee46e88-2c54c68db4dso5868733eec.0
        for <devicetree@vger.kernel.org>; Wed, 01 Apr 2026 01:38:00 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1775032680; x=1775637480; darn=vger.kernel.org;
        h=content-transfer-encoding:in-reply-to:content-language:references
         :cc:to:from:subject:user-agent:mime-version:date:message-id:from:to
         :cc:subject:date:message-id:reply-to;
        bh=nfYASLH7ozZo7u+Nlu8ufwQ22D1dNhEzAgYthYuO2cU=;
        b=T9tFyAQLceqhj1pVO3dKpfWrIue4qYzoojdy9sCWCsvcU6DYwDrqIdxsE7i84psWT0
         ar7mYx8LAaaD2/xcq7S6Hoi/9xCj3R61f2AdOR9R+b7VorIwFVVUnHnmFRhBQ05Anj50
         8MV0BhedbPLcHpXHBsI9fEWUlk6coTfvKR8lrtLsmvhU3zVeaiKsEvu1GwCdYofraLsZ
         2WlEi5wKJ0f0vZ+319B4d8zWXuHKbnz4VfZP2nTTKtDYVqLSxP7LRF5pfaTNUUm9qwt7
         DWWNM1BgZxsGodg4M8zbR+kI1TCgBdAnsCNUDE5mJiGOss8QudiYcHo6agu+5d7+mS04
         A6Vw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1775032680; x=1775637480;
        h=content-transfer-encoding:in-reply-to:content-language:references
         :cc:to:from:subject:user-agent:mime-version:date:message-id:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=nfYASLH7ozZo7u+Nlu8ufwQ22D1dNhEzAgYthYuO2cU=;
        b=QXzy5oAfibBGhcY6Elm1CTxPI9ZF0lF7Lzde0LEHWoc83WJEMSODjcBhtq/U+29LAl
         GNj89E869LcCKzYAB6HwhZVKWxrpAyvWxmI4zLathnTG6WCHrWpbKS5kSeD8INBh/yxh
         RZNgvmdTMuJtso3pxPlV4j7bQ8lK5KQr2nPP7wzjXsUq02UkDTwkWxPWdwVJkBalrQPT
         0AGjCzg/K/2bn4xNkx1Rpg6lgBNbKdYcyMJq9RH4efMyvcUVhGC3Y5uHogma8+MJ47HJ
         tHGJLO5ym7TTEwwh4WDoBWsbccyDXUcckPjpjt1uJnq5OWml0l81IRFHa1kJru2TIqsc
         kKYQ==
X-Forwarded-Encrypted: i=1; AJvYcCWcgs/ydPg+5GQC8MSKZstHevqakoSMniXuFfUzuTvP7AHmjKJMH9NIX3cPJOyyoXx+Vrp8dS6cwvx1@vger.kernel.org
X-Gm-Message-State: AOJu0YziEOgdEYJKvgEOMmImG7cvbjIMuj0h1z4dD7/NOQM2+i2ML5Yu
	PZiGwQxEC1F5l4ZixjFX9Pxr8ChtWEO49cKrMJmNqzwoAXiv2TTXp53u
X-Gm-Gg: ATEYQzzAwo1ef4C+vH84YLicnX2BzKI3YXIYGv6uYpV70PLys4vJp3b+jfTxbl080c5
	4g+Ic+ZnX66il0te37hFx81fQXR40fb70jux8eep5JI/vNTCJXPT0n92HNHGVzAV4BfIs5FkKKM
	BCV8RrLa6HL+6UP9nmEMtLer2xHZVt54G7naLycDAofRefzNLc0XgXer/+E8UUMJg3Ecu175MzA
	EQm+SeCE0jBSD3ICG7IQ5LKhki/sKxfXYNkieCq6OsaB8dgV6fzQl/2hswsXcXESqxI9eqtGl7l
	RIBQlF8LiSQH5Ui7L8q4GjGyREXBK0oftRRGE1firMmppI6h3rJ/sWKky5Rlu/X17pjEJAmyhUF
	7UK7fHmK3wXb/U53wBMfaPgvJh0s6p4VyHQjXdq8HA30dUJdjG5AyCNHFUjvI+PIev+rvD61NdW
	ZyOod07vk8l+IDBaNFsAKszZVc9vnF90rej9GPgd31/EIDS7RfYJbzpqTOh1UN1VXlUTNkER2wL
	xP3ng==
X-Received: by 2002:a05:7301:fa0d:b0:2c4:4276:709f with SMTP id 5a478bee46e88-2c930c7652cmr1518985eec.1.1775032680036;
        Wed, 01 Apr 2026 01:38:00 -0700 (PDT)
Received: from [192.168.68.65] (104-12-136-65.lightspeed.irvnca.sbcglobal.net. [104.12.136.65])
        by smtp.gmail.com with ESMTPSA id 5a478bee46e88-2c3c3bda147sm12175823eec.5.2026.04.01.01.37.56
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Wed, 01 Apr 2026 01:37:58 -0700 (PDT)
Message-ID: <d4fb2b66-85ae-4de4-b3dd-54260c73fd06@gmail.com>
Date: Wed, 1 Apr 2026 01:37:54 -0700
Precedence: bulk
X-Mailing-List: devicetree@vger.kernel.org
List-Id: <devicetree.vger.kernel.org>
List-Subscribe: <mailto:devicetree+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:devicetree+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v4 3/3] ARM: dts: qcom: msm8960: expressatt: Add camera
 flash
From: Rudraksha Gupta <guptarud@gmail.com>
To: Dmitry Baryshkov <dmitry.baryshkov@oss.qualcomm.com>
Cc: Lee Jones <lee@kernel.org>, Pavel Machek <pavel@kernel.org>,
 Rob Herring <robh@kernel.org>, Krzysztof Kozlowski <krzk+dt@kernel.org>,
 Conor Dooley <conor+dt@kernel.org>, Linus Walleij <linusw@kernel.org>,
 Bjorn Andersson <andersson@kernel.org>,
 Konrad Dybcio <konradybcio@kernel.org>, Liam Girdwood <lgirdwood@gmail.com>,
 Mark Brown <broonie@kernel.org>, linux-leds@vger.kernel.org,
 devicetree@vger.kernel.org, linux-kernel@vger.kernel.org,
 linux-arm-msm@vger.kernel.org, phone-devel@vger.kernel.org,
 David Heidelberg <david@ixit.cz>,
 Konrad Dybcio <konrad.dybcio@oss.qualcomm.com>
References: <20260331-expressatt_camera_flash-v4-0-f1e99f474513@gmail.com>
 <20260331-expressatt_camera_flash-v4-3-f1e99f474513@gmail.com>
 <xh2un63wi3noruqm6gf2dhayad77kpubalxc4xarmsm6eznvla@g4w2yuxja3c2>
 <3435895a-ffd9-4dd3-b21a-4466791183ca@gmail.com>
Content-Language: en-US
In-Reply-To: <3435895a-ffd9-4dd3-b21a-4466791183ca@gmail.com>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 8bit

Hello Dmitry,

>>> +    vreg_flash: regulator-flash {
>>> +        compatible = "regulator-fixed";
>>> +        regulator-name = "VREG_FLASH_3P3";
>>> +        regulator-min-microvolt = <3300000>;
>>> +        regulator-max-microvolt = <3300000>;
>>> +        gpio = <&pm8921_mpps 4 GPIO_ACTIVE_HIGH>;
>>> +        enable-active-high;
>>> +        pinctrl-0 = <&flash_led_unlock>;
>>> +        pinctrl-names = "default";
>>> +    };
>>> +
>>> +    led-controller {
>> It looks like the nodes are not sorted. Could you please make sure that
>> they are sorted alphanumerically (if there is no node address)?
>
> Thanks for your feedback! Could I request this comment/change be noted 
> in 
> https://lore.kernel.org/all/20260331-expressatt_fuel_guage-v1-1-23d1d8526b69@gmail.com/ 
> instead? As this seems to be the only comment remaining, it will be 
> easier for me to reorganize the DTS in the fuel gauge patch series 
> rather than this one, as the fuel gauge patch series depends on this 
> one. It also won't spam others in the mailing list who don't care 
> about the reorganization of the DTS.
>
I have made the changes here: 
https://lore.kernel.org/all/20260401-expressatt_fuel_guage-v2-1-947922834df1@gmail.com/


> Thanks,
>
> Rudraksha
>
