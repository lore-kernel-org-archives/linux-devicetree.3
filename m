Received: from mail-wr1-f43.google.com (mail-wr1-f43.google.com [209.85.221.43])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id E49973A7F54
	for <devicetree@vger.kernel.org>; Tue,  1 Sep 2026 13:50:09 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.221.43
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1788270612; cv=none; b=dJzxNKuB1n4jceJUw4lzvIaM1boWeZkXYkIFpfrWvuqRr2W0JltHFawEEmt9BS/HubZEGMju+ehtHKTvNlqyIfNJrHNLzomrY1GbI120j2McIIBNa9DV+aCrJTuejn3INd1wavGBYn+nue22DY2yIR5GSNeEU8q95z+lN/ZHNtM=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1788270612; c=relaxed/simple;
	bh=OsPt/cT8BwFgc2l35blwbFE8qUUU6lxYABA1mI2KYMI=;
	h=Message-ID:Date:MIME-Version:Subject:To:Cc:References:From:
	 In-Reply-To:Content-Type; b=MQ85e+05wEw247YWISZ/HSbO7osHgRC0wCvB9eX0UWJfxkTDyoj9zUGKLiGHA2vB5zEYw8nvxnGHanY7Sb2i5C4V2PByUNT7t83oEqCp5Lto8Dz80g4tGeaj+qvXf1lcMSkldnj2546aMdtk9B3e+jfx34kNwJxMA3scUDy6vjE=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=IbQAIwBu; arc=none smtp.client-ip=209.85.221.43
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="IbQAIwBu"
Received: by mail-wr1-f43.google.com with SMTP id ffacd0b85a97d-482fc3327fdso624165f8f.2
        for <devicetree@vger.kernel.org>; Tue, 01 Sep 2026 06:50:09 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1788270607; x=1788875407; darn=vger.kernel.org;
        h=content-transfer-encoding:content-type:in-reply-to:from
         :content-language:references:cc:to:subject:user-agent:mime-version
         :date:message-id:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=rRkUL/OFvGAZqvO4fpwddKnaKIcFlaNkl3QdtF7lN4w=;
        b=IbQAIwBu+tEfGMPQ1+svM+FGyovelvrq/0cEddxMBinDnctT3zegSABUeJY1wQLbwM
         TMzC8OQOBWA4ionx/8UBXq71wa1DP3zAV4cXBMJPTiIj2SGRBun4IUKVKgJYAc+Edf9Y
         KapAI2uETKir9xLLG6Spac4CgVu6eRZsakJ+nqTpCdhyU9U5E4aIipxLGfT1+9FHdUb3
         7Oibxt0S5KtWssiwZd2ffP8zbEG/CwF4GC6oHhekg0O6xI83Ri/oiC84tQKof05oBgcJ
         cwnvhLWpPAUVvl+QajZD/n+PssY32HpRzNteojNfwKjRKrNVljsrdbobnQDrXE4TL6SQ
         T6ew==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1788270607; x=1788875407;
        h=content-transfer-encoding:content-type:in-reply-to:from
         :content-language:references:cc:to:subject:user-agent:mime-version
         :date:message-id:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=rRkUL/OFvGAZqvO4fpwddKnaKIcFlaNkl3QdtF7lN4w=;
        b=NPNkyw1yQGeSc/F6UO2ug8YzzvdtdGM2+0OTJKxTm25kAZ/rgau+qYFMbXS7euIUT3
         p+KSnFW0O4xWLGscskKbNiOyCQskG/Fm+01PPfEYcuM8AI4+J//d35p/iqi9rTK+4zQj
         AWIxvELle5IUqoGv3O4vIAeSHgR91jZmSs6FHF2uoL/msbDs40Lp60z5pp1b1rSl4sYa
         FFGSzojJbnqOgKxXc1nAa/Yuvnm6er4zapi8GDmzfDNNB+jGW8Ze/GCMqTqy8h49P1YY
         WN29xxiYksUQuNZlq9gk1X/0Ds3j6GTbzIIJOq1FUMGIjsHqPNpkepss4WFrtQ/ebY4p
         YOLw==
X-Forwarded-Encrypted: i=1; AKwUvBwGvZkVyLhoMTm51ot7GoJXMq1SXYjT/+Hyx64qiQX+zz0/bey0btXGGlak1MCB3afYZ19Uwwq2ffQ9@vger.kernel.org
X-Gm-Message-State: AFuF++kZ9hS+klqqHXr5Fum7E00ZGdSOYxjGt+zgvzts2LerCcY+Bs0V
	bOWjTcuDYPvpZfYCusYG1f4ldFgI3JQqd15xZSWpU1Z7wn1mEdhWBYq0
X-Gm-Gg: AYBFou3Zvt4tSpD9LZC2fkUDlKxqpkU39lEPFTklcC2Uj8NdPvNB4HayCvnDt+tHR4K
	QHpCC5ZNNm94Yqlf5OPOaBfZuca6AS+bouz6MMIOL8+0+mQCgzlgLQtD+sF/Tgcd+EduNnIVtbA
	SUe9r+ARTm63zlhoViU9YwH4WWdQzNlcpg748bzDhG7c01tCAcs8c6PHk7pAXpusy6ODQG2XdvI
	2i4VFcpKlDPnT8rMmwC91hvvqivZrBzM4tb1Tz0HrYzpmy/juYcfrOrY2c9q0S1B1hNpxXVRg2n
	vobiQQuE3LxHB5VNYm2gzJzyqloE3gzJmG+fHA+PB99fiL6xUpYSysIPkqTz8pExoRoeLvKp+B8
	bBbu2mwFHSO34pqkloaiqitlzl9+oA46VnPa+Z1fSlQHhArsEw+/RHVuKktL5sBhM9r4fSiPlgf
	Sfsa8hvLmoZW9RHiKChT/OdRp7iiSCwxAw53fYUoV4IWP0MwfJShCJeY3ZBvrCUNv2VwzX2zrr6
	YBdCzKvUpZa96TyFSws0VEmMR3PdiM=
X-Received: by 2002:a05:6000:4548:b0:484:4789:9bb8 with SMTP id ffacd0b85a97d-48447899d60mr2616212f8f.2.1788270606921;
        Tue, 01 Sep 2026 06:50:06 -0700 (PDT)
Received: from [10.25.209.52] ([128.77.115.157])
        by smtp.gmail.com with ESMTPSA id ffacd0b85a97d-48442d6dc16sm3988721f8f.20.2026.09.01.06.50.05
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 01 Sep 2026 06:50:06 -0700 (PDT)
Message-ID: <9e6de8ae-aca6-41ac-bcef-f591d9fe8462@gmail.com>
Date: Tue, 1 Sep 2026 06:50:05 -0700
Precedence: bulk
X-Mailing-List: devicetree@vger.kernel.org
List-Id: <devicetree.vger.kernel.org>
List-Subscribe: <mailto:devicetree+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:devicetree+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v3 2/2] arm64: dts: freescale: add MR-NAVQ95 basic board
 support
To: sashiko-reviews@lists.linux.dev
Cc: Frank.Li@kernel.org, devicetree@vger.kernel.org, imx@lists.linux.dev,
 conor+dt@kernel.org, robh@kernel.org
References: <20260901131918.1189-1-laurentiumihalcea111@gmail.com>
 <20260901131918.1189-3-laurentiumihalcea111@gmail.com>
 <20260901132721.9559B1F000E9@smtp.kernel.org>
Content-Language: en-US
From: Laurentiu Mihalcea <laurentiumihalcea111@gmail.com>
In-Reply-To: <20260901132721.9559B1F000E9@smtp.kernel.org>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit



On 9/1/2026 6:27 AM, sashiko-bot@kernel.org wrote:
> Thank you for your contribution! Sashiko AI review found 2 potential issue(s) to consider:
> - [Medium] Missing memory node in device tree
> - [Medium] Missing USB controller and Type-C implementation
> --
> 
> commit 3130a84e68bcdc800ca07e4c01ec3d00e67a37c4
> Author: Laurentiu Mihalcea <laurentiu.mihalcea@nxp.com>
> 
> arm64: dts: freescale: add MR-NAVQ95 basic board support
> 
> This commit adds basic device tree support for the NXP MR-NAVQ95 board
> based on the i.MX95 SoC. It defines initial aliases, chosen nodes,
> regulators, and various pin configurations.
> 
>>    Add basic support for NXP's MR-NAVQ95 board. This board is designed for
>>    robotics applications (e.g. drones, rovers, humanoids, etc..) and has the
>>    following hardware feats (list is not exhaustive):
>>    
>>    * based on i.MX95 19x19 SoC
>>    * 64GB eMMC
>>    * up to 16GB of LPDDR5 memory
>>    * 1 x USB 2.0 TypeC
>>    * 1 x USB 3.0 TypeC
>>    * 1 x RJ45 port with RTL8211 PHY
> 
> [Severity: Medium]
> The commit message claims hardware features of 1 x USB 2.0 TypeC and 1 x USB 3.0
> TypeC, but looking at the device tree file, it completely omits any USB nodes
> or Type-C definitions. Will this leave the USB ports non-functional in Linux,
> and should they be added to match the hardware description?

This is intentional. USB nodes will be added later on.

> 
>> diff --git a/arch/arm64/boot/dts/freescale/imx95-navq.dts b/arch/arm64/boot/dts/freescale/imx95-navq.dts
>> new file mode 100644
>> index 0000000000000..1366dc2d2bfa4
>> --- /dev/null
>> +++ b/arch/arm64/boot/dts/freescale/imx95-navq.dts
>> @@ -0,0 +1,222 @@
>> +// SPDX-License-Identifier: (GPL-2.0+ OR MIT)
>> +/*
>> + * Copyright 2026 NXP
>> + */
>> +
>> +/dts-v1/;
>> +
>> +#include "imx95.dtsi"
>> +
>> +/ {
>> +	model = "NXP MR-NAVQ95";
>> +	compatible = "fsl,imx95-navq", "fsl,imx95";
>> +
>> +	aliases {
> 
> [Severity: Medium]
> Should there be a memory node defined here at the root level (e.g.,
> memory@80000000)? Omitting the memory node breaks standard DT conventions for
> root nodes and can cause boot failures if the bootloader expects an existing
> node to update and does not dynamically inject it from scratch.
> 

ACK. To be fixed in V4.

