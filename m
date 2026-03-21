Received: from mail-wm1-f44.google.com (mail-wm1-f44.google.com [209.85.128.44])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 463CD2D73BC
	for <devicetree@vger.kernel.org>; Sat, 21 Mar 2026 09:29:27 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.128.44
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1774085369; cv=none; b=I8i3AsUAt/mZYqySx68vgckNgLEMaAy1mRKXPdSXA0z/vgba4PXb5MO7Vrjoi3b0gmdVFprWEDrlO9PCTER2cKAxS7THYIBjBXFQPTo/KM83354wKz2ZxJ9Z/D1H/zgvT5n4DJ1fuat/le3losHn9up8/eBQKfbDTZXGaDJMxDw=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1774085369; c=relaxed/simple;
	bh=S76NDo7G9Fif+GinmDfkE9jIRA07xbZsaoS12azmLJM=;
	h=Message-ID:Date:MIME-Version:Subject:To:Cc:References:From:
	 In-Reply-To:Content-Type; b=Y/G/pZwBKZwNIElMDfuK8vP1qXge6YLx7J/yVvOHaCzLUXLJWyVdXdoM04nM960zYu5/oNdaZMkCYdYkEFhjWPhG8VUvwtImlEOEFzose50gkwDvWMBKItHjL4r8PQYBwB3rbECzNkW1XnOB6uUGazZDhmHVwLCvHNtF+YSeqro=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org; spf=pass smtp.mailfrom=linaro.org; dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b=Qa5jZhGo; arc=none smtp.client-ip=209.85.128.44
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=linaro.org
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b="Qa5jZhGo"
Received: by mail-wm1-f44.google.com with SMTP id 5b1f17b1804b1-486fe655187so18794025e9.2
        for <devicetree@vger.kernel.org>; Sat, 21 Mar 2026 02:29:27 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1774085366; x=1774690166; darn=vger.kernel.org;
        h=content-transfer-encoding:in-reply-to:content-language:from
         :references:cc:to:subject:user-agent:mime-version:date:message-id
         :from:to:cc:subject:date:message-id:reply-to;
        bh=Ae7LdzXoquAOXrOj2DhIoBLAnNhW7bM3mjCSYPOvKpw=;
        b=Qa5jZhGoBzv8mKNdXKLgDg3ssv8RCgmEqOFvoJwu4y1J8EWO4jP2bjkkhPAEdyH48i
         19Spxdia9k11zidlGV76vgL9cDIvNKalbI17gc6LjGztefJ9PpSBKA+EOWK/Ms9V5N6D
         ptGxoIQxuolPCiXKb+zl4Uc+QxDoCGcmKW7KyOy3sIpi1e2eN2yyfWR5uC3Wz+2o41vY
         65bCiwVjvhqLFK+GvTni/MIaJyd9GN4Ka8ysfIM2doWKGU8okJCK1iTmUSXp3AUFTsEq
         hYLtKVS0RTj5BoA3UIqydAUlMTpjYcFOnjvJE2E0hQB7SB9WPZ7h1GXB51HAvUca9KkA
         vMQQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1774085366; x=1774690166;
        h=content-transfer-encoding:in-reply-to:content-language:from
         :references:cc:to:subject:user-agent:mime-version:date:message-id
         :x-gm-gg:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=Ae7LdzXoquAOXrOj2DhIoBLAnNhW7bM3mjCSYPOvKpw=;
        b=XtkUOg+aUeG6oDr1GLxeXvD9ek76DWfXmdNaQeqogumqt07zUHnT37Fqje2jJs03oc
         wSBQWeuCZ4Xik42SKPM0NOIS9sRnJ4fkb27M/mOb9ZbHSkg2MAXyisl36JvVoi9W3I6+
         rwask6mLsKONQaK7/6kBBpki6aqoobYqHWT3aIktxLuhUuwimQeNPzkvnv3Cb7Ew9+7o
         oYwKKzPpFFGXYy6NuTh5UciHBAsPppr+M6UOVQcPHKsWH08pD94QfIQFuNQNKuGtKqyv
         iGuCb0rv2FiMkrIVzb/8e1x2CEn245eQVS4VaORus9SWdW8gWhw/wySpOWnabDDtuIZB
         rA3Q==
X-Forwarded-Encrypted: i=1; AJvYcCUXwyFs7Bwn7w391f6gJ0LMmpwJkPVi85RX3aBQ9PMFRaOopeH1zMVo3fHnXvwbdJ+qnE9s4Kv4wu5B@vger.kernel.org
X-Gm-Message-State: AOJu0Yziri8/GvmSXTn+xbECfB85qqR1E8siEMuNLgG15S3x3Uyl0rf6
	9Qf5KnTPI8EEjnNN66PFXw3UKxL+jNY6d/mrT7mlW1DMBNY+a2nmzKQvnpKlEo8IZNI=
X-Gm-Gg: ATEYQzwiyuiFhZAhpMPhn58Pva1knCLOWM39RXdVECuYjLHxDnb+MmTTdJAKZaVphHT
	BAq7eKsemadF7W9OUGwScgEqJGMLo9f/jyHh/O1NjEog7ev1EW/6ySAsQTn0F90if08dO9RcfHw
	mjiCPxYWD0IhdSvWf4Trlb9DmKHbzkU0jHr4wZ4/jV/yb2ASKT8aDPaU+/xstQf9Jxk0A/fzQ8d
	R6LY5+p83MIiGiUpifhUnRldpwrD3wiwr8c2WUNwbCsTD6xMb3pmjCDv/ewlO61ib3L/OGG6HnQ
	bX+VMdFTZxkSRzpHHf48tixvc7agaOAkyqlTI56gVtfAJdk9kqkaJGuqiYMtqvYgtyugBqx3HVU
	e2FIJ1+6rmAfNX/Z9OkI6S2gCir+RYn2n3au67d+tEf5kv5FGDCvFlC2OP9eF41SZXfQnXj0Avv
	Wwq6HHEcu5620EAFbq0X4W6eHlMvBe5ynsyIPjVHH9aJaz5Xh7TpcOAzflcb/r8O2RJuAl5WoFu
	CqaqeSs4fyDNaix8t13RXIcZkj0mxxpum8z+ZY=
X-Received: by 2002:a05:600c:3490:b0:487:300:d9ca with SMTP id 5b1f17b1804b1-4870300db54mr37516295e9.31.1774085365366;
        Sat, 21 Mar 2026 02:29:25 -0700 (PDT)
Received: from ?IPV6:2a01:e0a:106d:1080:81c2:60b3:ff00:9a5e? ([2a01:e0a:106d:1080:81c2:60b3:ff00:9a5e])
        by smtp.gmail.com with ESMTPSA id 5b1f17b1804b1-486fc61dd4asm160430305e9.14.2026.03.21.02.29.23
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Sat, 21 Mar 2026 02:29:24 -0700 (PDT)
Message-ID: <c1b4cd6d-2b08-4f0d-9b87-4dd163cad334@linaro.org>
Date: Sat, 21 Mar 2026 10:29:22 +0100
Precedence: bulk
X-Mailing-List: devicetree@vger.kernel.org
List-Id: <devicetree.vger.kernel.org>
List-Subscribe: <mailto:devicetree+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:devicetree+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH] dt-bindings: usb: document the Renesas
 UPD720201/UPD720202 USB 3.0 xHCI Host Controller
To: Michal Pecio <michal.pecio@gmail.com>
Cc: Greg Kroah-Hartman <gregkh@linuxfoundation.org>,
 Rob Herring <robh@kernel.org>, Krzysztof Kozlowski <krzk+dt@kernel.org>,
 Conor Dooley <conor+dt@kernel.org>,
 Geert Uytterhoeven <geert+renesas@glider.be>,
 Magnus Damm <magnus.damm@gmail.com>, linux-usb@vger.kernel.org,
 devicetree@vger.kernel.org, linux-kernel@vger.kernel.org,
 linux-renesas-soc@vger.kernel.org
References: <20260319-topic-sm8650-ayaneo-pocket-s2-upd-bindings-v1-1-84e4ef564022@linaro.org>
 <20260321070919.1687f991.michal.pecio@gmail.com>
From: Neil Armstrong <neil.armstrong@linaro.org>
Content-Language: en-GB
In-Reply-To: <20260321070919.1687f991.michal.pecio@gmail.com>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 8bit

Le 21/03/2026 à 07:09, Michal Pecio a écrit :
> On Thu, 19 Mar 2026 09:49:32 +0100, Neil Armstrong wrote:
>> Document the Renesas UPD720201/UPD720202 USB 3.0 xHCI Host Controller,
>> which connects over PCIe and requires specific power supplies to
>> start up.
>>
>> Reviewed-by: Rob Herring (Arm) <robh@kernel.org>
>> Signed-off-by: Neil Armstrong <neil.armstrong@linaro.org>
>> ---
>> - [1] https://lore.kernel.org/all/20260220-topic-sm8650-ayaneo-pocket-s2-base-v5-1-1ad79caa1efa@linaro.org/
>> ---
>>   .../bindings/usb/renesas,upd720201-pci.yaml        | 61 ++++++++++++++++++++++
>>   1 file changed, 61 insertions(+)
>>
>> diff --git a/Documentation/devicetree/bindings/usb/renesas,upd720201-pci.yaml b/Documentation/devicetree/bindings/usb/renesas,upd720201-pci.yaml
>> new file mode 100644
>> index 000000000000..8b8be572c930
>> --- /dev/null
>> +++ b/Documentation/devicetree/bindings/usb/renesas,upd720201-pci.yaml
>> @@ -0,0 +1,61 @@
>> +# SPDX-License-Identifier: (GPL-2.0-only OR BSD-2-Clause)
>> +%YAML 1.2
>> +---
>> +$id: http://devicetree.org/schemas/usb/renesas,upd720201-pci.yaml#
>> +$schema: http://devicetree.org/meta-schemas/core.yaml#
>> +
>> +title: UPD720201/UPD720202 USB 3.0 xHCI Host Controller (PCIe)
>> +
>> +maintainers:
>> +  - Neil Armstrong <neil.armstrong@linaro.org>
>> +
>> +description:
>> +  UPD720201 USB 3.0 xHCI Host Controller via PCIe x1 Gen2 interface.
>> +  The UPD720202 supports up to two downstream ports, while UPD720201
>> +  supports up to four downstream USB 3.0 rev1.0 ports.
>> +
>> +properties:
>> +  compatible:
>> +    const: pci1912,0014
> 
> Hi,
> 
> AFAIK that's the ID of uPD720201, while uPD720202 is 0015.
> At least that's the case with mine and what hwdata says.

Thanks for the feedback, I'll add 0015 aswell to cover both.

Neil

> 
> Regards,
> Michal

