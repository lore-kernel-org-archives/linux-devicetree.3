Received: from mail-pl1-f180.google.com (mail-pl1-f180.google.com [209.85.214.180])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 9CB2537F001
	for <devicetree@vger.kernel.org>; Tue, 23 Jun 2026 14:31:32 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.214.180
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1782225093; cv=none; b=fHIYykuy3a+s3gY23CHiGr+kkj0oTYYdo3tCZS/sln1zKjd8LMG4N/4VMz/sXl6fxCPzETiv++FjBkakwvrtDFtuoVnXf+3ZsUwml5GZ19A7Je3Ybj4p55xRlSdT7Uy6O0+eLrlSOjVVqW2XbcPYyW3+vh+UAdeI1e3QovyiuAQ=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1782225093; c=relaxed/simple;
	bh=jL8ez0Mg8YXopchCfhkbqbjK8n46SxQBwnGjRXDAm3g=;
	h=Message-ID:Date:MIME-Version:Subject:To:Cc:References:From:
	 In-Reply-To:Content-Type; b=JkZ8HK7mJ6FGutQqu/uFOVC9gfl7KFcppKmUwvBd1SRA2hoiAwpNFJS9RA63dUZPi2yoep9AFTSf8/y8ENq8ovW0E+PBmI/bmKIBRqb267DQ5EUeFR+J2HU2/KotZ79xUXrxxAD7u9KUdmtSmVeLNrgLN5wZHJkb+uwpiXTMoaY=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=kQhwOfFK; arc=none smtp.client-ip=209.85.214.180
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="kQhwOfFK"
Received: by mail-pl1-f180.google.com with SMTP id d9443c01a7336-2bf1cda2b17so8167615ad.1
        for <devicetree@vger.kernel.org>; Tue, 23 Jun 2026 07:31:32 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1782225092; x=1782829892; darn=vger.kernel.org;
        h=content-transfer-encoding:in-reply-to:from:content-language
         :references:cc:to:subject:user-agent:mime-version:date:message-id
         :from:to:cc:subject:date:message-id:reply-to;
        bh=X+YRmIk4UyV8Qff92WrjW7hCQWfT5q+1RioQVlsR+EQ=;
        b=kQhwOfFKDdB9Ww9lULXXL4sQ4yLJ1bAOYoIO3C6VWycAVFH0AWwoo8usz6+0RH+NJ0
         MrfwAGXQbuhSSMMOLrOijFVwTx5FwXbimRSpmWI8RcQTb/EhLrL21NNWumb6t3rxIRxJ
         X273skj/o4QjEcjOJlsPd+Zb3GYP0VHlCllRe2HTTVadgcnzwJ1PuoAgxT4ZiV9IZze3
         eqEwUE+k+BWLTCcOEhKMcI89qNqMBDmgqSXN3onVR72YfG2nZH60Gy4gl8aHTjhNZGnU
         wNSV0Gss6YjZmLyJxyDV13SdZDLDqSaBqQFyhPMs04esIIRIr5nJRRPNXiVZmTmOFRH/
         L3SA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1782225092; x=1782829892;
        h=content-transfer-encoding:in-reply-to:from:content-language
         :references:cc:to:subject:user-agent:mime-version:date:message-id
         :x-gm-gg:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=X+YRmIk4UyV8Qff92WrjW7hCQWfT5q+1RioQVlsR+EQ=;
        b=rQLew92Qxh9dyEoj+hWitn5LnIkCAIjDldBOPd17ryTtogeLzaTCzLf8d/UT0yEQGZ
         XvkJTbyoygjsMftWeR5OhQQJCYYt41mdX0hAjP3QiNQ3v2kKBS7teJlkH6Fblu+YbiI4
         UmYg20IX0RAYEkcAHDlMh4SKehZoKrnUsLIEi5NZ1saD0svkDfEw6gZg5E+Y1cl2geUj
         iMlg4vz+0K+9TjiPxY03GWyIqJr6u/mlhIh8XmfCxkJYmiA43PhkxKyL6qHQLWuNvwOQ
         RvuEKlqyHd/mIA3H9vYFiSN60EiF4VUZ65MiQdnxKEZdgpnmjyYj/yt/M/6mKRY+v9dy
         u+AA==
X-Forwarded-Encrypted: i=1; AHgh+RraJgD2Yy1/NLhBm3wzyldPWYIK9jtMUQha7Osg5eFwPTDq+NB1v2Fh58gwuhTcL85zRz6gFy4C48Pq@vger.kernel.org
X-Gm-Message-State: AOJu0YzH5EgeSpsHfuMRk6+2w8rJ629sfDNyUbej3fbOlju5TxuX5EUe
	uKnPonR7bIBPwUR7Y0YJ1wCbEoof/GQRRKEXfkHfU1WUVKt+HnSAdBXZ
X-Gm-Gg: AfdE7cnGHsRc/O3KL0jYz90KL0IuSFfikYO2LCpY7fKdhceMDuh2QU5nBvTAOS0Z/oe
	2mJI/u+ZblnguePwCD17qimoCzua7el3TenIHfZ1BQFEh5ogFanEfvE32ZYP2YwQ6uJJ3Pnc0Q/
	WCRtCtvq3IJvl616LLaOqvrnpF3caWZlushnfMjJB7QAsCr5AlQjL/6yZHm7F6fTb5srXUDCX57
	0KASNCamPuiSy47thFVqBSLjXmEYRZWXh4GZAIW6/rQbWZ3BJo1PHxS+alBVVXj45RQaHkxt7GE
	QsP22kPjey2/F2S4tkL6a0P8MVwpdkeg3HBOCt60ar+t6qvGcaZLzOnm4WI3Ug10pLLIijyNZx2
	2/cW/DD0kUAodjAgnTYdkJfbDtSne3HaVZST54qIk4iqDJZR+oud2vpvBgZaSLKGHyYoJnzfWCU
	jt5ZXadCVPMSXY/27XBnpxlNB5IS8mgB0IylQ=
X-Received: by 2002:a17:903:90d:b0:2c1:41f8:7ef5 with SMTP id d9443c01a7336-2c7c3ff85b9mr33653875ad.22.1782225091819;
        Tue, 23 Jun 2026 07:31:31 -0700 (PDT)
Received: from [192.168.0.2] ([49.207.62.136])
        by smtp.gmail.com with ESMTPSA id d9443c01a7336-2c7444aa5f1sm131772715ad.78.2026.06.23.07.31.27
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Tue, 23 Jun 2026 07:31:31 -0700 (PDT)
Message-ID: <9379bfdb-9a9c-4fea-924c-6c1dc8e997c1@gmail.com>
Date: Tue, 23 Jun 2026 20:01:27 +0530
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
 <464e09d2-5a8f-42ea-998a-42cf1376a6e7@gmail.com>
 <761cb58f-17cd-4a0b-98eb-a38b3b619941@kernel.org>
Content-Language: en-US
From: Charan Pedumuru <charan.pedumuru@gmail.com>
In-Reply-To: <761cb58f-17cd-4a0b-98eb-a38b3b619941@kernel.org>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit



On 23-06-2026 19:55, Krzysztof Kozlowski wrote:
> On 23/06/2026 16:16, Charan Pedumuru wrote:
>>
>>
>> On 23-06-2026 12:47, Krzysztof Kozlowski wrote:
>>> On Thu, Jun 18, 2026 at 12:42:07PM +0000, Charan Pedumuru wrote:
>>>> +description:
>>>> +  The STiH41x PWM controller supports both PWM output and input capture
>>>> +  functionality. It provides multiple PWM output channels for generating
>>>> +  variable duty-cycle waveforms, and multiple input capture channels for
>>>> +  measuring external signal periods and pulse widths. PWM output channels
>>>> +  and input capture channels are configured independently via
>>>> +  st,pwm-num-chan and st,capture-num-chan respectively.
>>>> +
>>>> +allOf:
>>>> +  - $ref: pwm.yaml#
>>>
>>> Where is this compatible used?
>>
>> I will remove this allof and redefine the YAML again
>>
> 
> 
> Sorry, I think I messed something so comment was incorrectly placed.
> 
> The comment should be under:
> 
> "+    const: st,pwm"

Okay, this compatible is not used and there is a similar compatible "st,sti-pwm", AI bot detected it and I will rename it and modify the commit message with necessary explanation. Also the maintainer email doesn't exist now. I will change that too with other maintainer. Thank you.

> 
> Best regards,
> Krzysztof

-- 
Best Regards,
Charan.

