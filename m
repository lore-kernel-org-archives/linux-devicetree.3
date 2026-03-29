Received: from mail-dl1-f51.google.com (mail-dl1-f51.google.com [74.125.82.51])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 9ED31224B04
	for <devicetree@vger.kernel.org>; Sun, 29 Mar 2026 15:31:48 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=74.125.82.51
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1774798309; cv=none; b=oXOFFvgJtvE2Dl6WeBU9ciUB6TgNJ74+N7Ha1FEKBLmAZ0r/fpOygrfTq4TgWoiTW/JpznxqEQapLR1xBI4nx+WS1wAAnF3vlep17OsaVF8IeZywRnKfArhf1oqjWL0G2WluRv/InJl6XanEvAsssuToCRAo6XxuPGpTYufiL5U=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1774798309; c=relaxed/simple;
	bh=au2eKM8u7aYrDUz5dztDboQXIdUsEbqGrxHSvOHJykw=;
	h=Message-ID:Date:MIME-Version:Subject:To:Cc:References:From:
	 In-Reply-To:Content-Type; b=sU5JaBpA+M7JbzQYY3JEKgOtkQBgcPLuAy6HJCFWPsmhNLXNMHU920UTrfqE50aADgMMnoXP9EX0UVANTIPQ918Jqa3EEvHkNMcuCSKRkAbqvevPRU+2ha6QWayRAogRySGMaiT6eFsqzTLTJZRorQSR6ZylXmiy9FjvijGPzq0=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=roeck-us.net; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=GsdCsXHx; arc=none smtp.client-ip=74.125.82.51
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=roeck-us.net
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="GsdCsXHx"
Received: by mail-dl1-f51.google.com with SMTP id a92af1059eb24-12732165d1eso5151908c88.1
        for <devicetree@vger.kernel.org>; Sun, 29 Mar 2026 08:31:48 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1774798308; x=1775403108; darn=vger.kernel.org;
        h=content-transfer-encoding:in-reply-to:autocrypt:from
         :content-language:references:cc:to:subject:user-agent:mime-version
         :date:message-id:sender:from:to:cc:subject:date:message-id:reply-to;
        bh=lbC14XtI3H5l+g6ZcwMwWY/fzzcIo7U44X14GI38NY0=;
        b=GsdCsXHx4pwdN5Idmy/anGLDS5S12R4ZATfmUOvWtYKW0DL3tXfJ81tQm4OB8RQTvi
         lveg4ibvK2zNWmWgkzYT/bC7Oz1d47L6xvR/khMQtYemp41uyBOUUynWqILvPDmO2ekp
         STSf+lHLEjgmv60ffQlELBa3ljhcIhFkpFKUB4FNLUwZSOEfbBOtk+MbkwEU9HonjKCQ
         eCl3tJNSBzztmZftGnvjbPantFqjwIouMOD7ogUZ6JERL4I3U0yX+Xanx9I9LqrQ0yd1
         GDm0r5yOs184fB1Q68O4GPK3b0Q9l1N9HFedaWVBsKlao8TkD6ZPRBuf+MmuN/1QtVLM
         Azhg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1774798308; x=1775403108;
        h=content-transfer-encoding:in-reply-to:autocrypt:from
         :content-language:references:cc:to:subject:user-agent:mime-version
         :date:message-id:sender:x-gm-gg:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=lbC14XtI3H5l+g6ZcwMwWY/fzzcIo7U44X14GI38NY0=;
        b=UxyWT0jmMYgwWhEZi2aZuJGD++HIxhLlYUPbeG4lVo90CHPcYiJUeH5I6bL+nkFkS2
         JB9YrfeEm1LZcfEfpkA0awTm9MIUGkiHHT1tjI04Hh/PfYMdSQp56Po8zvZhyr9szeU9
         uqMMleamHco3ExqphUZ70y459VtF/YWStAcIz5mMajt1aW2FMmN5ZAa08cPOA1URtHrf
         PbTGRiZwVoKT4Wx8behwIb6EKmHdfwN9yc1rxuAczVzLx6ph9za8lJmEISCCvpPRJiFB
         bVn8VzlYek1SfhMaQ9pjEmXh8GTdKUiGZu4LUeNQGaLTM81jJ64fLq/59G3SOcdqC+np
         cZjg==
X-Forwarded-Encrypted: i=1; AJvYcCXCHMggRbzQ3dYku8fp2NmZzzeGQnInUEXO7Gc78IqVhF/zg6szRbWr/nUf3jkQQv865+rI/8IKM7ib@vger.kernel.org
X-Gm-Message-State: AOJu0Yx4mYnITnkNITE0i1fSYFWSY/cVIUQvYS+lTHs+pcnus08bE/t+
	r12vf/xFnrO+OKWnaJKrm29QuQaGifjhIaGg/yIgRRxssUIyFPSusaVR
X-Gm-Gg: ATEYQzxlo/P3mkPDh9GvwBsELrRV68L1Bd35qVU3LU3uRSb9ZUDAw1m20SsBSw9Pmk+
	CvvBuaNXjMezwjFw+HCbhZNU3NFd9+kqklH6HaryueW6trlLlvti4FuPcPTdrJeHDwn+KGmdyPV
	kh187IGufFvEqEZkg1icXuORWrvV6eN2PqE/vExnhJm7oTMnW4Dln6A452BzOewUfZ8sShaF4Id
	eaM6i53cQFy7cC7KSX/8FgyvhKIWgvF02gOUicILDXwAVZxp4/kjlQCvScpwsXlNLYTiFS2t/Mf
	8g/eSdGLknZ5X8SBBQQs30c4YDsVND5wGmrerjXRyohXYIpn63mToWs94r+4M8wvqN+EF3Dj/Bz
	T6HePlkB3wZiWlm58WUClasoce4QSNEhPpOTeqBtjh2Y7n0qObnmmfl+0SVOce5VzrW45i03a/4
	WVB3YUkblnEvnKefdaiWnTGTyf4TMs1SjzfW2MacuDJYUe1fpwptHdgnX6bPzUjYNCsuSE4Lcg
X-Received: by 2002:a05:7022:20c:b0:119:e56b:98be with SMTP id a92af1059eb24-12ab28ff327mr4858192c88.37.1774798307626;
        Sun, 29 Mar 2026 08:31:47 -0700 (PDT)
Received: from ?IPV6:2600:1700:e321:62f0:da43:aeff:fecc:bfd5? ([2600:1700:e321:62f0:da43:aeff:fecc:bfd5])
        by smtp.gmail.com with ESMTPSA id a92af1059eb24-12ab97ca83bsm4812631c88.2.2026.03.29.08.31.45
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Sun, 29 Mar 2026 08:31:46 -0700 (PDT)
Sender: Guenter Roeck <groeck7@gmail.com>
Message-ID: <72b9d96c-59c7-429e-b422-ffec702342e7@roeck-us.net>
Date: Sun, 29 Mar 2026 08:31:45 -0700
Precedence: bulk
X-Mailing-List: devicetree@vger.kernel.org
List-Id: <devicetree.vger.kernel.org>
List-Subscribe: <mailto:devicetree+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:devicetree+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v8 5/6] hwmon: add NXP MC33978/MC34978 driver
To: Oleksij Rempel <o.rempel@pengutronix.de>, Rob Herring <robh@kernel.org>,
 Krzysztof Kozlowski <krzk+dt@kernel.org>, Conor Dooley
 <conor+dt@kernel.org>, Lee Jones <lee@kernel.org>,
 Peter Rosin <peda@axentia.se>, Linus Walleij <linusw@kernel.org>
Cc: kernel@pengutronix.de, linux-kernel@vger.kernel.org,
 devicetree@vger.kernel.org, linux-hwmon@vger.kernel.org,
 linux-gpio@vger.kernel.org, David Jander <david@protonic.nl>
References: <20260329090601.532477-1-o.rempel@pengutronix.de>
 <20260329090601.532477-6-o.rempel@pengutronix.de>
Content-Language: en-US
From: Guenter Roeck <linux@roeck-us.net>
Autocrypt: addr=linux@roeck-us.net; keydata=
 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
 np3900V20aS7eD9K8GTU0TGC1pyz6IVJwIE=
In-Reply-To: <20260329090601.532477-6-o.rempel@pengutronix.de>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit

On 3/29/26 02:06, Oleksij Rempel wrote:
> Add hardware monitoring support for the NXP MC33978/MC34978 Multiple
> Switch Detection Interface (MSDI).
> 
> The hardware utilizes a clear-on-read FAULT register, but physical
> faults remain asserted as long as the underlying condition exists. This
> asserts a global FAULT_STAT bit on the SPI bus. To handle this without
> trapping the CPU in an interrupt storm, this driver implements the
> following architecture:
> - Requests a rising-edge nested IRQ (IRQF_TRIGGER_RISING) from the MFD
>    core to catch the initial 0 -> 1 transition of the global fault state.
> - Caches hwmon-specific alarm bits and calculates state edges (XOR) to
>    isolate alarm transitions from system integrity faults.
> - Implements a 1Hz delayed workqueue that polls the hardware as long as
>    any alarm is active. This compensates for the edge-triggered IRQ by
>    discovering secondary faults that occur without a rising edge, and
>    detecting when the hardware clears.
> 
> Signed-off-by: Oleksij Rempel <o.rempel@pengutronix.de>

Acked-by: Guenter Roeck <linux@roeck-us.net>

