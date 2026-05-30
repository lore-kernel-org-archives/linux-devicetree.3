Received: from mail-wm1-f47.google.com (mail-wm1-f47.google.com [209.85.128.47])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id B48E13955E1
	for <devicetree@vger.kernel.org>; Sat, 30 May 2026 08:27:40 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.128.47
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1780129661; cv=none; b=CiupYYGa9CA1TGSDfPE1c/ASrTomiHUOa7nCu9RiJNvu1WwIkefxJrL6w/gCwtQDZMQ5LjNrO1yinpVBwuDQUq7XOi/uUbAOAQagruJY91wWRjcFSPSn1DN0EUvoxEbNxtFZJaDHb8bzHuZCaj2yw4d/qyEOIPFqoUbmRshcXVI=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1780129661; c=relaxed/simple;
	bh=8X9UjEfTum+4mzdRr+694A8pmGM798NUYMH/9J/4quY=;
	h=Message-ID:Date:MIME-Version:Subject:To:Cc:References:From:
	 In-Reply-To:Content-Type; b=BoNMd2ogIPU2Y4DMWNkc6rTkv86GBP3UpX+hpI8t4qIYsjsfjxmd1mcGNmWj0DOPAk5gOIKlpHs4RzeE513R9DyAnbq8nztgPlNwWOhPsJ2aE+qxL9ue4R/8kwjbtOHm1db2Al8gG9UIXrWPkHiqrEK4MQ8Mqh5K37Ts2npONHg=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=gNxwvIKF; arc=none smtp.client-ip=209.85.128.47
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="gNxwvIKF"
Received: by mail-wm1-f47.google.com with SMTP id 5b1f17b1804b1-4904c1ce4c1so90481625e9.3
        for <devicetree@vger.kernel.org>; Sat, 30 May 2026 01:27:40 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1780129659; x=1780734459; darn=vger.kernel.org;
        h=content-transfer-encoding:in-reply-to:content-language:from
         :references:cc:to:subject:user-agent:mime-version:date:message-id
         :from:to:cc:subject:date:message-id:reply-to;
        bh=Qddz/zxZpUl2T8fFl77Vhtb+HfEDnwtpIpBzWfm1IYU=;
        b=gNxwvIKF9bfDO5krh6mZgRfuCl2DHpWorEvGLWsxfhAaYzO2XXDgj/JrkAlcyYX9t0
         Ol5Yh4d4Ylf0kdgIOZdEcys1Q0Im/xeHDN32KVfgKeSUB8tlTjzE9SbZFlCPMISRQmXZ
         SLM46TrAh1xtzJHgwYetzueXzd7aoChCZlP5YcBpfEIk4WCrvOE8ujYrHIKIuaG7rX2Z
         RjDVRO/N1BWgOrsHxb8QutksEtDWbWe7edkNQMND8tD5sw4KhlZrS9csjRHISTV03UGF
         bA9CEBoJt+yD90M8KZDqclWjvQ3VrWyN2IWyK1W1zlRKksa62NwUtafT0ZSU7uUW4TPt
         0d2Q==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1780129659; x=1780734459;
        h=content-transfer-encoding:in-reply-to:content-language:from
         :references:cc:to:subject:user-agent:mime-version:date:message-id
         :x-gm-gg:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=Qddz/zxZpUl2T8fFl77Vhtb+HfEDnwtpIpBzWfm1IYU=;
        b=BIONirmqE6n//cAnTuPt5KV9ciBk3omZ48O5hX6+w6TFaDxyfAQ7EJfU3lfEcucQ5E
         lMob6ku6Vy9O4v4QKf4lEy2oOQmaEWGmQohBLKB2C6RP9CHRXrcHGevA0sKJPGgVGfRV
         0scBWZ05rIWOcjhDfcXgIvA7DJNMcYosgC8UXpq9wFQMTkvc5Wv8ZPEMGBVPuCalbdaa
         iTRvlqTRy2uet1ipduVGELlqsu2mUodeK70tdBjYyBkv0Y9MJhs/SrjGt/78AXmoYLj+
         wAqMxywu4NNFe9od7EmGnbW1+rY8KTegSV9rxHhyLKbNkfZ1aXm/Qu+rwxT8ivA1Efov
         ni3Q==
X-Forwarded-Encrypted: i=1; AFNElJ9A4hWFLDqa4amiVNe3eYtIcdKg4UiVP2y5v1F9RC+JJT33oelqBYPvpO4COOtecy9/igXSs7RyBrMO@vger.kernel.org
X-Gm-Message-State: AOJu0YxqxNnRlBLDWIXlAJbSp5X3scQlLWaWyYkUhlDbakpbq3Jj97EX
	92Gda2j72pGQX5v/RaOSTsV2XBc1OU/aGpbczw/J7zrwEnYXebUPXbZh
X-Gm-Gg: Acq92OHLEEKeyQwwQdzlzv6U5vzwTj5wDG+aB5xXUYQ5sPjPivZIibj0ycmuMvNd8AW
	+9iLCKuiH9CwT7OjzP5MdHRe9dn91W2+i9jmosDMlBErO6f/IZmCHRYSFcc7u0a1FIPH0W4pxlK
	2TdKtWVmTXieNDhto5jNGcDyLxaBQTmhb2H30nNikmZl0qaL3GB1ixcwhXa4uX9YOcbW0KLiSdy
	QZzQlfmd344yXDs2fngFwhFPmxLFBQAXqfCzVFpUa5QaweK4/ozCWhnFVX6pIXcknApRWLy1OWD
	JGUsJaiJBA1F1SiuEYfh1pqbXMGcoRcqgGvJNPUxnvMHoAFH4yobHQA2KMvlcZnL9UwCfV9vvN6
	OuFPNwO8FUvvr12sFFwFfE3YOFFa9BE+jjmsgCRpDTpVcDmfgRzwf8SRx9xJs/IRYxrfohKzpo2
	Ok+DMTkP+RAbmZFr6RJCPszG4hT4MrmpePX7yH7o9qUdxxrpxlg9sjLq0YKtNs0z6HLWEUT13lw
	w==
X-Received: by 2002:a05:600c:c3c1:20b0:490:9d1b:2022 with SMTP id 5b1f17b1804b1-490a2938ad2mr37014665e9.13.1780129658899;
        Sat, 30 May 2026 01:27:38 -0700 (PDT)
Received: from [192.168.0.40] (a89-182-131-96.net-htp.de. [89.182.131.96])
        by smtp.gmail.com with ESMTPSA id 5b1f17b1804b1-4909c0498e0sm42526475e9.0.2026.05.30.01.27.37
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Sat, 30 May 2026 01:27:38 -0700 (PDT)
Message-ID: <1dc5141e-b43e-43ab-a2d5-a04069352941@gmail.com>
Date: Sat, 30 May 2026 10:27:37 +0200
Precedence: bulk
X-Mailing-List: devicetree@vger.kernel.org
List-Id: <devicetree.vger.kernel.org>
List-Subscribe: <mailto:devicetree+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:devicetree+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH 1/1] riscv: dts: spacemit: enable PMIC on OrangePi R2S
To: Chukun Pan <amadeus@jmu.edu.cn>
Cc: alex@ghiti.fr, aou@eecs.berkeley.edu, conor+dt@kernel.org,
 devicetree@vger.kernel.org, dlan@kernel.org, krzk+dt@kernel.org,
 linux-kernel@vger.kernel.org, linux-riscv@lists.infradead.org,
 palmer@dabbelt.com, pjw@kernel.org, robh@kernel.org, spacemit@lists.linux.dev
References: <20260520100000.575719-1-amadeus@jmu.edu.cn>
 <20260530021021.1167953-1-amadeus@jmu.edu.cn>
From: Andre Heider <a.heider@gmail.com>
Content-Language: de-DE
In-Reply-To: <20260530021021.1167953-1-amadeus@jmu.edu.cn>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit

Hi Chukun,

On 30.05.26 4:10 AM, Chukun Pan wrote:
> Hi,
> 
>> Enable the i2c8 interface and add the connected SpacemiT P1 PMIC and
>> its associated regulators to support voltage regulation on the board.
> 
> friendly ping

nice to see how all the k1 dts files are progressing ;)

Looking at the two opi ones some bits are still missing:

rv2:
- i2c8 alias
- i2c2 + eeprom + onie,tlv-layout + alias

r2s:
- sys-led
- i2c2 + eeprom + onie,tlv-layout + alias
- pcie
- qspi + spi-nor + vendor partition layout

You seems to own both, do you plan to work on that?

Best regards,
Andre
