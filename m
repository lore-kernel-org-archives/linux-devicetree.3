Received: from mail-out.m-online.net (mail-out.m-online.net [212.18.0.9])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 27C2A386553;
	Wed, 13 May 2026 17:38:36 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=212.18.0.9
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1778693923; cv=none; b=WkJTtaf1PWenPE4NUeR9PEnjyUQkdzhaWGe4WQxrsOAWGAHSmvt1Z+8ReFeYvEBqunRN2GlacO1ur8iKRioXaAz9/lVnvS6IcA6s08tmSpnfVCtauLH0qe6qGfkRLXaz3/iCuJqGCh3In1KhZfRqY/j3Cxp7oeyfl7DnK2JTk2I=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1778693923; c=relaxed/simple;
	bh=WuOdOOQlTGauXOwQtR0ly4244WY5RHh/Nyyo+Tvtdo0=;
	h=Message-ID:Date:MIME-Version:Subject:To:References:From:
	 In-Reply-To:Content-Type; b=COQADZYgzQt25BzK/Ggm1ANIpNHoynPDoNiwlcF2+6gK4uiSUy9o3EbjriMc2AQMZ7nOJ3CwmUM20Etj9HM/4vlv1t5N9bPFI6rDyVsgR4WU5s/RLNjBcw3I8ewnMr3ZC08PCXTGbPqjIyu1lSYA24g7T5pCnPuUNvoLpvtr77A=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=muenchen-mail.de; spf=pass smtp.mailfrom=muenchen-mail.de; dkim=pass (2048-bit key) header.d=muenchen-mail.de header.i=@muenchen-mail.de header.b=zzlnATFr; arc=none smtp.client-ip=212.18.0.9
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=muenchen-mail.de
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=muenchen-mail.de
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=muenchen-mail.de header.i=@muenchen-mail.de header.b="zzlnATFr"
Received: from mail-out.m-online.net (mail-out.m-online.net [212.18.0.9])
	by mail-out.m-online.net (Postfix) with ESMTP id 4gG1046Zhpz1r5sY;
	Wed, 13 May 2026 19:38:28 +0200 (CEST)
DKIM-Signature: a=rsa-sha256; bh=tUk3k7hjI1RoyKUta+l8P/czWtAWXdNols6WRikw6cU=;
        c=relaxed/relaxed; d=muenchen-mail.de;
        h=Date:From:To:Message-ID:Subject;
        s=r1; t=1778693908; v=1;
        b=zzlnATFrZ9vVWJ9awcoJi90Xg8hBbuNrcGiTYUumK4TFWYx0jSZclK2VpbEoEoDU
         F1M4nEsRhFJmSJhXbIPhrMWGBmih0WjjBs8ossq7/A/YF7/yWu0zRRo1ixMNGyx9
         Pg7hM5sbhoMO4xA+FHP2+kHvqC6unOwF3bJxx4Ywt+lmelscD3qW8R30igW0U/OJ
         DwYp7Ikdalkd+6jyMhL9+R5wugWYABIZoAQhj5VzUuDcz3d4CbJ++kZzfP9igsXs
         TZ4jv5OniuSDLh8sUCoaDkBAVRDgBDLKeZj2mR+JMJChSL7Qco2oht4N3wBu6cQV
         JEJakjHbvmu157fqJemgoQ==
Received: from frontend03.mail.m-online.net (unknown [192.168.6.182])
	by mail-out.m-online.net (Postfix) with ESMTP id 4gG1026Q0Cz1r5rg;
	Wed, 13 May 2026 19:38:26 +0200 (CEST)
Received: from localhost (dynscan3.mnet-online.de [192.168.6.87])
	by mail.m-online.net (Postfix) with ESMTP id 4gG1024v1jz1qqlR;
	Wed, 13 May 2026 19:38:26 +0200 (CEST)
X-Virus-Scanned: amavis at mnet-online.de
Received: from mail.mnet-online.de ([192.168.6.182])
 by localhost (dynscan3.mail.m-online.net [192.168.6.87]) (amavis, port 10024)
 with ESMTP id UOmRSNYn8eMF; Wed, 13 May 2026 19:38:25 +0200 (CEST)
X-Auth-Info: HJUNFNFShal6AM1JBGx5cCnjbFHoJRxaSbObzFSNNYB/FIx6axKkLvyZzTrsy9gX
Received: from wiesel.intern (aftr-62-216-206-65.dynamic.mnet-online.de [62.216.206.65])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
	(No client certificate requested)
	by mail.mnet-online.de (Postfix) with ESMTPSA;
	Wed, 13 May 2026 19:38:25 +0200 (CEST)
Received: from [IPV6:fdea:9b79:8984:1:b1b7:2c53:ea47:8e7a] (unknown [IPv6:fdea:9b79:8984:1:b1b7:2c53:ea47:8e7a])
	by wiesel.intern (Postfix) with ESMTP id 387D479A1C1D;
	Wed, 13 May 2026 19:38:25 +0200 (CEST)
Message-ID: <86f7cb4e-9511-47a2-a2cb-4fedf3ae1ab8@muenchen-mail.de>
Date: Wed, 13 May 2026 19:38:24 +0200
Precedence: bulk
X-Mailing-List: devicetree@vger.kernel.org
List-Id: <devicetree.vger.kernel.org>
List-Subscribe: <mailto:devicetree+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:devicetree+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH] Enable wifi on the BeagleV-Ahead
To: Shengyu Qu <wiagn233@outlook.com>, Drew Fustini <fustini@kernel.org>,
 Guo Ren <guoren@kernel.org>, Fu Wei <wefu@redhat.com>,
 Rob Herring <robh@kernel.org>, Krzysztof Kozlowski <krzk+dt@kernel.org>,
 Conor Dooley <conor+dt@kernel.org>, Paul Walmsley <pjw@kernel.org>,
 Palmer Dabbelt <palmer@dabbelt.com>, Albert Ou <aou@eecs.berkeley.edu>,
 Alexandre Ghiti <alex@ghiti.fr>, linux-riscv@lists.infradead.org,
 devicetree@vger.kernel.org, linux-kernel@vger.kernel.org
References: <20260511141119.155369-1-thomas.gerner@muenchen-mail.de>
 <20260512173440.163179-1-thomas.gerner@muenchen-mail.de>
 <TY4PR01MB14432F2BBDFF6E2C4AC79DD1E98392@TY4PR01MB14432.jpnprd01.prod.outlook.com>
Content-Language: de-DE
From: Thomas Gerner <thomas.gerner@muenchen-mail.de>
In-Reply-To: <TY4PR01MB14432F2BBDFF6E2C4AC79DD1E98392@TY4PR01MB14432.jpnprd01.prod.outlook.com>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 8bit


Am 12.05.26 um 20:39 schrieb Shengyu Qu:
>> +
>> +    brcmf_pwrseq: brcmf-pwrseq {
>> +        compatible = "mmc-pwrseq-simple";
>> +        reset-gpios = <&gpio2 31 GPIO_ACTIVE_LOW>; /* WL-REG-ON */
>> +    };
>>   };
>
> I think such pwrseq won't work? Need to set timing parameter, for 
> example:
> https://github.com/torvalds/linux/blob/1d5dcaa3bd65f2e8c9baa14a393d3a2dc5db7524/arch/arm64/boot/dts/rockchip/rk3568-rock-3a.dts#L71 
>

I think this is not necessary. The WiFi chip gets powerd up with the 
board power and the power cannot be disabled. The only job for this 
pwrseq is to release gpio2 pin 31 when the kernel initialize the chip. 
According to the data sheet the release of the pin should happen not 
earlier than 2 cycles of the 32.768kHz clock after powered up. As the 
kernel start takes much longer than this 2 cycles and I think there is 
no extra timing necessary.

The broadcom driver has a also a property "reset-gpios", but this does 
not work. It does not configure the pin as output, it configure it as 
input. Then the driver does not initialize the chip. May be this is a 
bug in the broadcom driver, don't know.

Best regards
Thomas

