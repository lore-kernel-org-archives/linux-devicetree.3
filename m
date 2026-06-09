Received: from mail-pg1-f178.google.com (mail-pg1-f178.google.com [209.85.215.178])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 491E336215D
	for <devicetree@vger.kernel.org>; Tue,  9 Jun 2026 15:16:50 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.215.178
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1781018211; cv=none; b=i/c9i4tT3PmPslL6WQgWAC5IgZyMPhKQNiSVhZM4szMXEtEusKhAAmF/X7J20p1spx4n/3gCr8EzsTJYibhuLzHvO1EbNwgSxWyD8kYTtOQPT50FYxaxZa1llB1n54enzem9fE5obv+dOSmhcJzQ37rwRknDCsn+BSnCYb8T/yY=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1781018211; c=relaxed/simple;
	bh=A9tfClX8Q5B176EdrnPRG4VsIQcWv2vxdIc/A1y7sjE=;
	h=Message-ID:Date:MIME-Version:Subject:To:Cc:References:From:
	 In-Reply-To:Content-Type; b=ej4Dj0PHGoQheQPgcvtSZG8HoVdqjZZeBhcEtk0Lj9jh3vka38VVi6wmcAajvxhZHszWzIJsr0tL9RApz2fDCsY1RWpfJA6Rx9FQ8UMP0nhPQEp76b11UWJ+t1UHa16lQWUT+uYKX+6gbPnIHoWrsdcd1sTZVarxNEp4M7QqRoA=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=QnZRTG8b; arc=none smtp.client-ip=209.85.215.178
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="QnZRTG8b"
Received: by mail-pg1-f178.google.com with SMTP id 41be03b00d2f7-c858b5de728so3653951a12.0
        for <devicetree@vger.kernel.org>; Tue, 09 Jun 2026 08:16:50 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1781018210; x=1781623010; darn=vger.kernel.org;
        h=content-transfer-encoding:in-reply-to:from:content-language
         :references:cc:to:subject:user-agent:mime-version:date:message-id
         :from:to:cc:subject:date:message-id:reply-to;
        bh=X2OVhVGvDZE7tZDpbh1B90htiaNt432NF1Wdfrujw3Q=;
        b=QnZRTG8bMg93PbDjsDGh0hEcKzU3gIXU3t/gnIz/+qwJ8Nd7M+juyObEXgvVqeV67i
         R4UB82WgGcRnjzF2mb3uRCOZ+u4rv9SJRhyxa8kK1jeRKBiGeRf2TSHiXSJWzHZdbsYQ
         Tlv6efzuzmoCtUMFjXCQUwd+H3lK4wMO33J2sp0tFqCbKhSREH+COKrHJE9KBXnqFfLw
         AkSuP5x/oItJ4vB0EqRttYYB6yWNr2Ab47hYjbhj2C4794QDQqEntNwqZSdAAbJjeC1Q
         3Tmlh/Ao73JZtH+Q7gj6adweMHtqHThw+U+ZQ5djq1kaxs7ur/V7657Efk7V0cc2O0+L
         +ACQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1781018210; x=1781623010;
        h=content-transfer-encoding:in-reply-to:from:content-language
         :references:cc:to:subject:user-agent:mime-version:date:message-id
         :x-gm-gg:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=X2OVhVGvDZE7tZDpbh1B90htiaNt432NF1Wdfrujw3Q=;
        b=PU1CaCr7W8o5HIrYrshw9z//huulz1bi2mlpN6ah59xhyokxd9PP9rLNHNddr+ZPqS
         emwKBjVErVPbulFHxK5BGynhpKJWydFqR+Kqk+GO9lLu5dggNJtvZKxyo1ZAf5x2uYTe
         UfSXmgvaXtfRo7k7EcsC/qFNEZ75MTNGxAq5mXtt0Q7mJbDokT8r0ITPwA5wQS8IuXJo
         tmTyaN/WU73S2rNYH+BnT9XR1odqeW8KkkHc3AqKrPdHrevgjbC8XvyfeTo+vPDJYlNA
         plcyArhGzYOKiJ5B12VNgmLrvTNEbn6O3TyeQvApuYVKw/gAuQS4t4bcdEQKNulc8Xy6
         vXKw==
X-Forwarded-Encrypted: i=1; AFNElJ9iCMaaQisvAV3iOiXAXy8XFDWUzMd+JrRQkffLkZWIGqnkscQCL2Ji3XEOagw2JxcaIKqjZrc9AY3x@vger.kernel.org
X-Gm-Message-State: AOJu0Yw8IMO3vOMpzEHIfyBxUmdxKcxHgJoYXe3Y/DguibvuRVE1Tjyf
	5u5HCQZFFj3E/P/DDdNZjc6pBRyN8/VervFdq+qAwuacFId6d+zfez9G
X-Gm-Gg: Acq92OH29MK5YVZzyxfNdr0GRtZuNR397Xzr/rmk7/e1A/zkVwOsQOdqSwrCzdi0xrA
	qT7ffRmfVLpbp4cPdCZFfmCnezP84M/MPdPYPQHxsQ8E20p1gLvvjIANpIPJZwEUsIQU4U7jv7W
	1iTfzyzYevcPQWStYPnEYhnFhMIT05Cd9F6yM1OaoUR2WGG0ROAce+MO5Rp4pXlm31zsq43tNcR
	tIPOI77ISMf3zykKiHdrrEa4mS6S6sAIXFwtpETliwMzh1p0Cq+TMGZFl/xSUTwK4/8YDFztlAO
	bPxP2GFznc+7gefhIHzf3wQ+RdiUxg8f8wOt83TvBp5A40zmzSgqT7Ms5xdtECAbkNpw2+v6JB+
	3oBpjiAyvtzRMc5g9lbSJAUcxnd0nndNHV7i7gkdyqYyL1oT4jDW1uDeEsVxjR5VhaYTkwe3yeC
	qhdKKBlAAFHPGqnv/Wdl7xhnYkmsoMQUBMQ5A6LiO9pvN+TJPsCXmCTsoiZ9RN0/sVDC5uqN+4k
	jpqY6bxNPxXqXD8cFxhYpPWdsB9K9TJR1HhnwSbciuqKQ==
X-Received: by 2002:a05:6300:67c7:b0:3b4:b30e:1b4d with SMTP id adf61e73a8af0-3b4cd04c26cmr28149436637.40.1781018209653;
        Tue, 09 Jun 2026 08:16:49 -0700 (PDT)
Received: from [192.168.0.100] ([103.181.54.100])
        by smtp.gmail.com with ESMTPSA id 41be03b00d2f7-c85df03387asm20355865a12.4.2026.06.09.08.16.45
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Tue, 09 Jun 2026 08:16:48 -0700 (PDT)
Message-ID: <c6cc71bc-7256-46a3-ad4a-a1ec4b38400b@gmail.com>
Date: Tue, 9 Jun 2026 20:46:44 +0530
Precedence: bulk
X-Mailing-List: devicetree@vger.kernel.org
List-Id: <devicetree.vger.kernel.org>
List-Subscribe: <mailto:devicetree+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:devicetree+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH] spi: dt-bindings: octeon: Convert to DT schema
To: Rob Herring <robh@kernel.org>
Cc: broonie@kernel.org, krzk+dt@kernel.org, conor+dt@kernel.org,
 linux-spi@vger.kernel.org, devicetree@vger.kernel.org,
 linux-kernel@vger.kernel.org, me@brighamcampbell.com,
 linux-kernel-mentees@lists.linux.dev, skhan@linuxfoundation.org
References: <20260607142356.2844008-1-ninadnaik07@gmail.com>
 <20260608143259.GA2569066-robh@kernel.org>
 <20260608150040.GA2675433-robh@kernel.org>
Content-Language: en-US
From: Ninad Naik <ninadnaik07@gmail.com>
In-Reply-To: <20260608150040.GA2675433-robh@kernel.org>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit


On 08/06/26 8:30 pm, Rob Herring wrote:
> On Mon, Jun 08, 2026 at 09:32:59AM -0500, Rob Herring wrote:
>> On Sun, Jun 07, 2026 at 07:53:56PM +0530, Ninad Naik wrote:
>>> Convert octeon-3010 to DT schema
>>>
>>> Signed-off-by: Ninad Naik <ninadnaik07@gmail.com>
>>> ---
>>>   .../bindings/spi/cavium,octeon-3010-spi.yaml  | 67 +++++++++++++++++++
>>>   .../devicetree/bindings/spi/spi-octeon.txt    | 33 ---------
>>>   2 files changed, 67 insertions(+), 33 deletions(-)
>>>   create mode 100644 Documentation/devicetree/bindings/spi/cavium,octeon-3010-spi.yaml
>>>   delete mode 100644 Documentation/devicetree/bindings/spi/spi-octeon.txt
>>>
>>> diff --git a/Documentation/devicetree/bindings/spi/cavium,octeon-3010-spi.yaml b/Documentation/devicetree/bindings/spi/cavium,octeon-3010-spi.yaml
>>> new file mode 100644
>>> index 000000000000..3dbbb4f3c104
>>> --- /dev/null
>>> +++ b/Documentation/devicetree/bindings/spi/cavium,octeon-3010-spi.yaml
>>> @@ -0,0 +1,67 @@
>>> +# SPDX-License-Identifier: (GPL-2.0-only OR BSD-2-Clause)
>>> +%YAML 1.2
>>> +---
>>> +$id: http://devicetree.org/schemas/spi/cavium,octeon-3010-spi.yaml#
>>> +$schema: http://devicetree.org/meta-schemas/core.yaml#
>>> +
>>> +title: Cavium, Inc. OCTEON SoC SPI master controller
>>> +
>>> +description:
>>> +  The Cavium OCTEON SPI controller is an SPI master controller found in
>>> +  OCTEON SoCs.
>>> +
>>> +maintainers:
>>> +  - Mark Brown <broonie@kernel.org>
>> This should be someone with this h/w. But there doesn't appear to be any
>> OCTEON maintainer. There isn't any .dts using the compatible either.
>> Perhaps this driver and binding can just be removed?
> Maybe not. Seems this is used on newer Octeon platforms like cn7130
> which aren't that old. Some Ubiquiti devices use it and run 5.4 kernel
> with OpenWRT:
>
> https://openwrt.org/toh/ubiquiti/edgerouter_4
>
> Rob
Hi Rob,

In this case, should I keep Mark as the maintainer?

Thanks,
Ninad Naik

