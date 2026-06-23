Received: from mail-pj1-f48.google.com (mail-pj1-f48.google.com [209.85.216.48])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id BC63435E93B
	for <devicetree@vger.kernel.org>; Tue, 23 Jun 2026 14:16:40 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.216.48
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1782224201; cv=none; b=Cp/hitScvIodwfYh3MI51RcfxnvVMrq0YEYTmKEUT2xC/TPCifurbIVWJPikHzFENmDGycAcGmLlfAv+kskMSyBoyzILNlIKwNcrz9OSCV+6h8D1+UXqIY4j3j/N3ohhrk6I+mlAxZOESkePmpx3xtHzhnO6t+hZ/MKJr3SDp3M=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1782224201; c=relaxed/simple;
	bh=tUrRzAy9axz+ACESZYkPXNYcDTB4b3V9V30KZ9JrMWs=;
	h=Message-ID:Date:MIME-Version:Subject:To:Cc:References:From:
	 In-Reply-To:Content-Type; b=dOeGQTxt3h99UJiC/HjGzU7D1YqpNXNFAPZDOs63i087FYXBnVXooJU2SI+16roI46T8a1BrZRLA8vYUhBI23ult9Esef+A5lSzJrkU3Ce2sOko1l590cYKnm0eMEkxXDFQprOn39lF/0cw4sf6/csLE9nin7j5+EX8fkHel0oA=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=B4XbcUyu; arc=none smtp.client-ip=209.85.216.48
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="B4XbcUyu"
Received: by mail-pj1-f48.google.com with SMTP id 98e67ed59e1d1-36d5fd50d20so3873967a91.1
        for <devicetree@vger.kernel.org>; Tue, 23 Jun 2026 07:16:40 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1782224200; x=1782829000; darn=vger.kernel.org;
        h=content-transfer-encoding:in-reply-to:from:content-language
         :references:cc:to:subject:user-agent:mime-version:date:message-id
         :from:to:cc:subject:date:message-id:reply-to;
        bh=F5jyDpTw+nbmVl4evKwREMIxAz2iLdO/axx6qTM+O1Q=;
        b=B4XbcUyutakW4uYHwA9baO3I44hX9qJcZniAhxFN+PVW+iglYNJpbtCeSTmSWstL6z
         cKYlEK7+k1M3LK2TQ7ZmtL7+R5fbCvhS2gSiBobhMIbYwYJYzZivVfz2dzSFIC8rgNpx
         sQWJmoo3s6+ZgLGsVX1KOyaUOmEfxivu0uu8yV2px3VuDCrJ8+UpVKGoZptQF46VtZ3z
         WKuPcGoWV/DkvcyA3y7j8GzOPwzC0HKMiKRgOlfN+dFkNeI2/798Ra9+J//FvTw10tFW
         V7auUN7GVh9rPARdyGYu6IfopQhcFcfe1kkWiWXq/AFGfggdbA12N02wxEZRL0Lg0FLA
         Xyew==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1782224200; x=1782829000;
        h=content-transfer-encoding:in-reply-to:from:content-language
         :references:cc:to:subject:user-agent:mime-version:date:message-id
         :x-gm-gg:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=F5jyDpTw+nbmVl4evKwREMIxAz2iLdO/axx6qTM+O1Q=;
        b=GoQUdy9kjebJ0tBjZqtw6g1NLHyy0DDhrpNOlVl0noMMuz7TupsuxPvbnn6bFwUzpz
         KcHuG3mq4cqB6Z7A3vd2xjVFTzWa2AZE8WsCvIAau8XCPdhwzGVWsa1o+3b554Dpjwbv
         rH3WYFbwBt5IzXIgoAvtlnNM6H63wIsTV3UneArKoD/gpnNY8HDDHNrElrDIvNSHhTGs
         3eXpssuxfSk83dCOlWx0WH0o4plBy9FBFhwgBam0jQAoVw9ao8CClGwTuhO9Ur12IURU
         QMlOPH8vB7rPCLxwppJJc1vqXnc+9e/RLBFilnW6AaTniedQokNqnXOJAZ5bpZKsz5pX
         aRlQ==
X-Forwarded-Encrypted: i=1; AHgh+RplXPzFCAta+4QKkds/zApHefid+m04K5piMKA6C5mHT0m+A3ZH5X8OTRYq7TGXNgyVsnsEpZXUdtU4@vger.kernel.org
X-Gm-Message-State: AOJu0Yyot4n1NOnMuuUpsQgq/pIsT/0BdncMWi6QKyaarq3DIle76+WI
	o2aBm4Bx3SeTHXxMWnvSm+R+UDnR7hWol43lbbDRpCdIdpic4cLbjikV
X-Gm-Gg: AfdE7cnikQEZf9/LOeYUZtay6uZZLuqU90D1VtR0y2UTf4e6WO5WJxoXS7BxiNA3JXI
	jPnmBKe+AlEYi0Y6VUxLtfrq3p7R/SdqTRia+756ZG/4YD/TDnQrUk8W4Vku7Cf3YRUoCrqOhkX
	z+rPZwOujEG2ZYiC550gAe/v6t7CoHsmuxxsH0sF9v3O+0VwKDLb4ygk4AN+Igav/8dd+kgMzKf
	w+Jsmzc7ps7nt6cVfGi0mNJIAoLrW5DbmAeC4R1DB+rqa6cwaW1aPIm+ffiwLuEjMXgcdpIlPw8
	Kb1DY03mxoFYADr1dvPrTx9AJUI8yQw2vOWWBAZEQMZ8DH77MG9+hIWPpXXdgd94N7LA5p9x8iY
	RS+Q+YPO1WsvGS5/60BMY5sjS/zY0vkEBKOTOaq/BxrwBuZM0KxW4crAIjSg9o4AzKSBkozLRXi
	3vTVSdDPGYSdaukudybLrkcGonO63UsUvlFek=
X-Received: by 2002:a17:902:e5d1:b0:2c0:cf44:3b3b with SMTP id d9443c01a7336-2c7c7684655mr32613395ad.24.1782224200074;
        Tue, 23 Jun 2026 07:16:40 -0700 (PDT)
Received: from [192.168.0.2] ([49.207.62.136])
        by smtp.gmail.com with ESMTPSA id d9443c01a7336-2c7436f6395sm112363965ad.28.2026.06.23.07.16.36
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Tue, 23 Jun 2026 07:16:39 -0700 (PDT)
Message-ID: <464e09d2-5a8f-42ea-998a-42cf1376a6e7@gmail.com>
Date: Tue, 23 Jun 2026 19:46:35 +0530
Precedence: bulk
X-Mailing-List: devicetree@vger.kernel.org
List-Id: <devicetree.vger.kernel.org>
List-Subscribe: <mailto:devicetree+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:devicetree+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v2] dt-bindings: pwm: st,pwm: convert to DT schema
To: Krzysztof Kozlowski <krzk@kernel.org>
Cc: =?UTF-8?Q?Uwe_Kleine-K=C3=B6nig?= <ukleinek@kernel.org>,
 Rob Herring <robh@kernel.org>, Krzysztof Kozlowski <krzk+dt@kernel.org>,
 Conor Dooley <conor+dt@kernel.org>, Pal Singh <ajitpal.singh@st.com>,
 linux-pwm@vger.kernel.org, devicetree@vger.kernel.org,
 linux-kernel@vger.kernel.org
References: <20260618-st-pwm-v2-1-c792d5795ce2@gmail.com>
 <20260623-electric-adder-of-upgrade-8bdeb4@quoll>
Content-Language: en-US
From: Charan Pedumuru <charan.pedumuru@gmail.com>
In-Reply-To: <20260623-electric-adder-of-upgrade-8bdeb4@quoll>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit



On 23-06-2026 12:47, Krzysztof Kozlowski wrote:
> On Thu, Jun 18, 2026 at 12:42:07PM +0000, Charan Pedumuru wrote:
>> +description:
>> +  The STiH41x PWM controller supports both PWM output and input capture
>> +  functionality. It provides multiple PWM output channels for generating
>> +  variable duty-cycle waveforms, and multiple input capture channels for
>> +  measuring external signal periods and pulse widths. PWM output channels
>> +  and input capture channels are configured independently via
>> +  st,pwm-num-chan and st,capture-num-chan respectively.
>> +
>> +allOf:
>> +  - $ref: pwm.yaml#
> 
> Where is this compatible used?

I will remove this allof and redefine the YAML again

> 
> Best regards,
> Krzysztof
> 

-- 
Best Regards,
Charan.

