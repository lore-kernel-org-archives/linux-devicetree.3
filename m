Received: from mail-lf2-f12.google.com (mail-lf2-f12.google.com [74.125.229.204])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id DA1963EA97E
	for <devicetree@vger.kernel.org>; Fri, 11 Sep 2026 04:27:35 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=74.125.229.204
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1789100858; cv=none; b=tuVST0PRD7Br3ptWc/5Di7gtrXd2eFx+SPOk8d1hKDpoY1bpko3pR5P1OEwbCrVdewZEKty+gtTceljelO4DmfOJj4gILitTjAuP8K0G2NVGr7KcAJLlEic5RTJOGT+ZnCEy7tn8E4gwgQDQLRKvqbOF29EpHBGq1iCRW+iWcUs=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1789100858; c=relaxed/simple;
	bh=KjXa5CpY0t7/Sea2aeIy9K61ObkwGdgMdzuD+QojuEk=;
	h=Message-ID:Date:MIME-Version:Subject:To:Cc:References:From:
	 In-Reply-To:Content-Type; b=sZpwo/OT9PH+zTCrd/hBOZ+dcJgrlmoWK8i97dJ+V39qneWMgT/24efJKiAd953Vd5gp3TPjgk4KeZqXdrWJ0rDBLoju6EeA4V6V+ee+vRZ+rAIKNgJa6BX3OGyJjCMlLqRnFOhlI5ZnHS+yL4qj9Q631JxVn/qx9xidOdHShH4=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=KzXa+3wp; arc=none smtp.client-ip=74.125.229.204
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="KzXa+3wp"
Received: by mail-lf2-f12.google.com with SMTP id 2adb3069b0e04-5b5e4f16f16so528942e87.0
        for <devicetree@vger.kernel.org>; Thu, 10 Sep 2026 21:27:35 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1789100854; x=1789705654; darn=vger.kernel.org;
        h=content-transfer-encoding:content-type:in-reply-to:from
         :content-language:references:cc:to:subject:user-agent:mime-version
         :date:message-id:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=SeQKP5JwuVTGflKEgsNGx/HQonSB5aJLQdw22Qx3ZnY=;
        b=KzXa+3wpOAhFJfdBZDYNR3Dt4r/SAU9rer05WadCZKIY+bvwGqsQM8lAF7OdcS4duN
         zsRRwYb1qomO/+9w+SiV2rZ5PJ3GYUXHNYkRuGMHKiIYde4HYUzubGvYYCPAAg+Fb90l
         r+fLNEKR0sZeJ94awn7m2Gk96YkJNloduzFmy7C3hzn9lnfZBUHs7DJ/nk0jhnU0n50y
         RhepHT+IDsyCBo/iuJyHRxr9N1YipU3610CPH/k55eao//JYqfGz523y0K9whByZMF+v
         Ou204Jby6LqYpFAljxhERG3OF8QJzCBUf8QLnoz9lODLswTVxsDB9LGi0biTrXmkbbwG
         cx/w==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1789100854; x=1789705654;
        h=content-transfer-encoding:content-type:in-reply-to:from
         :content-language:references:cc:to:subject:user-agent:mime-version
         :date:message-id:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=SeQKP5JwuVTGflKEgsNGx/HQonSB5aJLQdw22Qx3ZnY=;
        b=rUhKzKPluwSYAPCTRuvBS4Wc0C1giKq8HddzWWCj/v+WMalocoM5WPWGkn8Pz/qJv7
         kA/3lHg1DSSqQKxWN9qsaZ7gZIURl0urA88Ry1mF8XiXHXbu2t8Ifehe4s41+qlwXo9F
         ZkOTa42CNiZMzZCamhPFdV+hqbh5wGQ5lDIaxetiystCA2p1Y88Tx3qLl4yldO2D1ikF
         ooTZK6HELeeKR21Xo7JVdzAivzBTgrIbCE69czLUdwt9nO8GonDKQHCcrbM7hZr99I6W
         VQof718hrlaADZpzbbI1RYa9bD05wAIW1dahBtIbqSwhnH3byvjHNvQjUH3HMlQIsaaE
         ubug==
X-Forwarded-Encrypted: i=1; AKwUvBzUcXMGQZEyh20mZyHE7F9h1yhxAU3ihO55T4NVj3Z+y5Lq7VDRbES5R0ub946v9M3l0s6H7GoTIoFQ@vger.kernel.org
X-Gm-Message-State: AFuF++nPDY6lp51gNaFw19pD2tEeQKj+j29bA2Fvos9/7UmddkDatgSn
	miTVGxXvh6B1vYNd22g5mCmwld/FBMG9M7V8nH0prLtTwcLK3SRnTnYenKRgRS2v
X-Gm-Gg: AYBFou1ejCpITQG7rCaz9p/NCjPi8h8DaVgOKDhBlC3rKmtds0ifBrCxIR8BVpbHlL9
	Btko4mtaaVu82HnHs0MtwsVWvSZq/PAqCchDPmmoWIyNw5w9V/HQkbIHsnofFUWyvRgXfkWIdYX
	ZCva8471ObQU4XyhE1NT7vrJVDsbZ2MI23i1zENSqzy/mPuU7tT4yBQDOBv5ERaMaizZxf2YRJG
	UA04uENYm0ZY4H8ycN57l1t5c7sLvXbmRX666xp7o5STHKvkpbHIHGwJRyLZMwSDq8Q9XaSKgk7
	tynd2Ic5hzzwZl4eAM9//VAN2I7Sx+8FtanbOPNsBwgImi1cXmlt3Fe2daG2/734qSxq3b4t+HK
	C1b/a7Ua0dc3crwq01gJvBJCCFP29cLyA54bJ9WAsCxLye68pDZlSmkhzEAy2XQq7G01tt88Oak
	SzP0/pqhzy0gY/frstFN+dn17b5DQtYwZK2u/0v4z7L79unvTgFERmcN14u+eFdBmuTWSXYDqLi
	jRuxJBm8XQptqoYt/WYXiHyeebetTFl4/iQcDb9cGNki813cotR5TQ=
X-Received: by 2002:a05:6512:3f23:b0:5b6:6af:4e0e with SMTP id 2adb3069b0e04-5b8a02dccabmr896014e87.3.1789100853635;
        Thu, 10 Sep 2026 21:27:33 -0700 (PDT)
Received: from ?IPV6:2a10:a5c0:800d:dd00:8fdf:935a:2c85:d703? ([2a10:a5c0:800d:dd00:8fdf:935a:2c85:d703])
        by smtp.gmail.com with ESMTPSA id 2adb3069b0e04-5b8a0466a5csm291547e87.46.2026.09.10.21.27.31
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Thu, 10 Sep 2026 21:27:31 -0700 (PDT)
Message-ID: <eb18485c-50db-4823-9e06-362b968699cc@gmail.com>
Date: Fri, 11 Sep 2026 07:27:30 +0300
Precedence: bulk
X-Mailing-List: devicetree@vger.kernel.org
List-Id: <devicetree.vger.kernel.org>
List-Subscribe: <mailto:devicetree+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:devicetree+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v3 00/10] Support ROHM BD73800
To: Lee Jones <lee@kernel.org>
Cc: Matti Vaittinen <matti.vaittinen@fi.rohmeurope.com>,
 Matti Vaittinen <matti.vaittinen@linux.dev>, Rob Herring <robh@kernel.org>,
 Krzysztof Kozlowski <krzk+dt@kernel.org>, Conor Dooley
 <conor+dt@kernel.org>, Liam Girdwood <lgirdwood@gmail.com>,
 Mark Brown <broonie@kernel.org>, Stephen Boyd <sboyd@kernel.org>,
 Brian Masney <bmasney+clk@redhat.com>,
 Jerome Brunet <jbrunet+clk@baylibre.com>, Linus Walleij <linusw@kernel.org>,
 Bartosz Golaszewski <brgl@kernel.org>,
 Alexandre Belloni <alexandre.belloni@bootlin.com>,
 Michael Walle <mwalle@kernel.org>, mfd@lists.linux.dev,
 devicetree@vger.kernel.org, linux-kernel@vger.kernel.org,
 linux-clk@vger.kernel.org, linux-gpio@vger.kernel.org,
 linux-rtc@vger.kernel.org
References: <cover.1788346553.git.mazziesaccount@gmail.com>
 <20260910160321.GJ1051768@google.com>
Content-Language: en-US, en-AU, en-GB, en-BW
From: Matti Vaittinen <mazziesaccount@gmail.com>
In-Reply-To: <20260910160321.GJ1051768@google.com>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit

On 10/09/2026 19:03, Lee Jones wrote:
> On Wed, 02 Sep 2026, Matti Vaittinen wrote:
> 
>> Add support for the ROHM BD73800 PMIC and compatibles.
>>
>> The ROHM BD73800 is a power management IC which integrates 8 BUCKs and 4
>> LDOs. There is also an ADC and operation amplifier intended for current
>> / temperature measurement and accumulation. RTC and 32.768 kHz clock
>> gate are also included. The PMIC can be customized via OTP and it has
>> options for operating as a main PMIC in multi-PMIC installation. Some
>> of the pins can also be used for GPO or GPI (including interrupt support).
>>
>> There are also ROHM BD71851 and BD71885 PMICs out there. These are, from
>> the SW-perspective, similar to the BD73800. There is only some different
>> default values and OTP settings. The driver should be able to handle them
>> just fine.
>>
>> Revision history:
>>
>> v2 => v3:
>>   - Rebased on v7.3-rc1.
>>   - gpio: Use gpio-regmap as was suggested by Linus W.
>>   More accurate change-log in individual patches.
>>
>> v1 => v2:
>>   - Rebased on regulator/for-7.3 as it carries dependency:
>>     f29a8bf6fde1 ("regulator: dt-bindings: ROHM PMIC state-machine voltages")
>>   - dt-bindings: Various fixes, split generic stuff to own files.
>>   - gpio: Styling, return -ENODEV if no GPIOs found
>>   - MFD: Styling
>>   - regulator: Simplify dt-reading
>>   More accurate change-log in individual patches.
> 
> I assume there will be one more revision?
> 

Hi Lee,

I thought everything was acked and good to go?

Yours,
	-- Matti

-- 
Matti Vaittinen
Linux kernel developer at ROHM Semiconductors
Oulu Finland

~~ When things go utterly wrong vim users can always type :help! ~~
