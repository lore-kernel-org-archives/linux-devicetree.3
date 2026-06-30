Received: from mail-ot1-f46.google.com (mail-ot1-f46.google.com [209.85.210.46])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id CA83427467F
	for <devicetree@vger.kernel.org>; Tue, 30 Jun 2026 15:00:30 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.210.46
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1782831632; cv=none; b=lhNl3Tcs9p5DfJ3rNJ7XhdnRmrYP7d+AvSAVwFczGmBfTi56GJ8hWGO1b90zesKq+nATcGBh+QGVP4VFcQqoH0BbiMoZAF9pmkahQhO+ZSfJa1tsKm7Pws8+0xeWTYUqCYsAmGKLi38+GQp0ORIqLEgVg8eocbnXUReB5Cw1WDw=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1782831632; c=relaxed/simple;
	bh=zsUvrd2m+fDvbvu0jCqns5QboOKew/3wncsy9gxRn5E=;
	h=Message-ID:Date:MIME-Version:Subject:To:Cc:References:From:
	 In-Reply-To:Content-Type; b=g0ViVbjEN/SS3wCFL4nhFKPG401fEt38Ob/ErTd0PRwbNTVPlFt8hDE50aP7xB87yLEHaWvW3u6oJv6DCv+5gatT4p3Z21/8LHAMAYdS6IgpEggcKYJ92M8lQP7LjebWDBIVi0oWas8e18tfrZwaLLuYm/NRx3uehG8kKfklQMg=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=roeck-us.net; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=oEuKQyws; arc=none smtp.client-ip=209.85.210.46
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=roeck-us.net
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="oEuKQyws"
Received: by mail-ot1-f46.google.com with SMTP id 46e09a7af769-7e9f5637634so468869a34.3
        for <devicetree@vger.kernel.org>; Tue, 30 Jun 2026 08:00:30 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1782831630; x=1783436430; darn=vger.kernel.org;
        h=content-transfer-encoding:in-reply-to:autocrypt:from
         :content-language:references:cc:to:subject:user-agent:mime-version
         :date:message-id:sender:from:to:cc:subject:date:message-id:reply-to;
        bh=8eys4MjS1LrvZQSXZngMUJ2qDI9a0JK11nUoQ/9sW8A=;
        b=oEuKQywsE5nK6tLgDvSGivD3ryfOGyf+I8kr/TkWmf/WieQs5UW8ORWe02uIiCdLS2
         Pk5T+g3/uBJwNFGJ+Sf3ym+WCE5AQ/i23NMmPpwA7/N4nAWDowzrWyU3yVCZFK2MIUqw
         f+ERBBSQa1cf56odfeHQW6SN54v8Udo9zbHDlc63YFUOB0d9jhXJDHNveB2k/QHtvkJ5
         Od5gmrC62FzXJLuHGq09OOymhnnIPRanPWfxnIU3NegKh8rdYxR2g+tnTW+OY9uVaGSI
         wZrhHUwvhs1/6GWNlPsYntxI7fcqgKtOyR3Faoyh1SAJ6t265XRPSv+wfCKA/NL5FSPK
         5hBg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1782831630; x=1783436430;
        h=content-transfer-encoding:in-reply-to:autocrypt:from
         :content-language:references:cc:to:subject:user-agent:mime-version
         :date:message-id:sender:x-gm-gg:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=8eys4MjS1LrvZQSXZngMUJ2qDI9a0JK11nUoQ/9sW8A=;
        b=Vy+IWNxXc79xLtYIENS7AANZo6/sVcYlS7KT0SRJgz8p9uX/bw4F5zmKx8BFYuTv8i
         ekWE6d609NZ1xPapwvjgo5jX1FNkz6FqM0cDhjEsk4rifX7YhigYyOdCfqcBV/PaZyaW
         EpvBV7bvtg7odGy6FlM75c4AiwSRz5kyEHVnar4TXBTJ/h5x5NyVW7KzaXuImuhQxRdC
         2CZ3833byKW2NnVDta9aeqnoWRmbTn0k/2MT98XLyLuqTO0Svqz9/IvlEsJqlNlj8qVg
         ExAXS0Mh4F5eQoZxOr2pia+erU38kszJK5Jx96HhGG37U7GJVDUzj18EBlCmSuRlzL//
         1XEA==
X-Forwarded-Encrypted: i=1; AFNElJ/qxj/J9jVuQDqaUL9Xy4ffKH3dhL6+jGYKksifNC+WEo048cGqHrkgmsypA3wTWwV98kUoxhcEv558@vger.kernel.org
X-Gm-Message-State: AOJu0Yw6V+pAYzcxeZm/k4t71M4almWs+6YaX4v25C/P/Rf4HdIFcUsY
	LOoSfeF+QWvRoJWL92nRUrDDGX5VHWhQEGFJsI3IEzF73L1MLa17ze1k
X-Gm-Gg: AfdE7cnh9zXhID1JAxhuRoVM1Dqqsg8SJ5LwGPI3bYHQm1TKzil5mBnatPsWaha/Np8
	aPQmhkamwAhYW39gmZM0gv2HGfhr1MoUDRSmUtJ9s0ByaOmd1Q8i6L03eZm+BSRYxrCa69EWxaz
	sx0ViWO5pWjtAMpPFO0VFSfH8DqXWaaS8kksRIsCIkwl/376qFMsWvuwuDIUzZvC+uRTxW8dHqu
	8Ms3u3KCax4opZj1wUqrP88j7vTP/WEays+jtOIq5zEA3Bt5dGO/7UyBFSFCpsRYQ0EHx2W58aM
	1tgcVJBHcgEfuhAu3KolPCPrzX6UFIO3PDmqExdTwVGsCdR/YCUlvd7SbaZUOKnIRbFIkMcOQBp
	dh1iBPaatFciy52Sk4ut72CASFOeLK4+TQJg27so5xoQ0naXAx/8kaIWernyEtaRXoQpFst5OsO
	vUVPW3ykuCH2eoPU7bX+QM/GBLQA6LqaX7TUfzKYXSVQCjXolr1P/CTes7l1cYBA==
X-Received: by 2002:a05:6830:3107:b0:7dc:db3c:1d82 with SMTP id 46e09a7af769-7e9ec628239mr3486725a34.10.1782831629625;
        Tue, 30 Jun 2026 08:00:29 -0700 (PDT)
Received: from ?IPV6:2600:1700:e321:62f0:da43:aeff:fecc:bfd5? ([2600:1700:e321:62f0:da43:aeff:fecc:bfd5])
        by smtp.gmail.com with ESMTPSA id 46e09a7af769-7e9ec34f898sm2536235a34.27.2026.06.30.08.00.27
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Tue, 30 Jun 2026 08:00:28 -0700 (PDT)
Sender: Guenter Roeck <groeck7@gmail.com>
Message-ID: <3c64cad4-6472-49ad-b2f9-1128330117f8@roeck-us.net>
Date: Tue, 30 Jun 2026 08:00:26 -0700
Precedence: bulk
X-Mailing-List: devicetree@vger.kernel.org
List-Id: <devicetree.vger.kernel.org>
List-Subscribe: <mailto:devicetree+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:devicetree+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v2 9/9] hwmon: adm1275: Support ROHM BD12790
To: Matti Vaittinen <matti.vaittinen@linux.dev>
Cc: Matti Vaittinen <matti.vaittinen@fi.rohmeurope.com>,
 Rob Herring <robh@kernel.org>, Krzysztof Kozlowski <krzk+dt@kernel.org>,
 Conor Dooley <conor+dt@kernel.org>, Jonathan Corbet <corbet@lwn.net>,
 Shuah Khan <skhan@linuxfoundation.org>, Wensheng Wang <wenswang@yeah.net>,
 Ashish Yadav <ashish.yadav@infineon.com>,
 Vasileios Amoiridis <vasileios.amoiridis@cern.ch>,
 Kim Seer Paller <kimseer.paller@analog.com>,
 ChiShih Tsai <tomtsai764@gmail.com>,
 Chris Packham <chris.packham@alliedtelesis.co.nz>,
 Robert Coulson <robert.coulson@ericsson.com>, linux-hwmon@vger.kernel.org,
 devicetree@vger.kernel.org, linux-kernel@vger.kernel.org,
 linux-doc@vger.kernel.org
References: <cover.1782458224.git.mazziesaccount@gmail.com>
 <b209c1b47712b69f17b52cfd7a7a38ed76024ca7.1782458224.git.mazziesaccount@gmail.com>
 <2cf72420-8513-4856-a3cb-fe2629588d1b@roeck-us.net>
 <de7f3cf69c1fcea85dbb1ab58dd75b2a90191aca@linux.dev>
Content-Language: en-US
From: Guenter Roeck <linux@roeck-us.net>
Autocrypt: addr=linux@roeck-us.net; keydata=
 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
 np3900V20aS7eD9K8GTU0TGC1pyz6IVJwIE=
In-Reply-To: <de7f3cf69c1fcea85dbb1ab58dd75b2a90191aca@linux.dev>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit

On 6/29/26 22:04, Matti Vaittinen wrote:
> June 30, 2026 at 12:08 AM, "Guenter Roeck" <linux@roeck-us.net mailto:linux@roeck-us.net?to=%22Guenter%20Roeck%22%20%3Clinux%40roeck-us.net%3E > wrote:
> 
> 
>>
>> On Fri, Jun 26, 2026 at 10:26:02AM +0300, Matti Vaittinen wrote:
>>
>>>
>>> From: Matti Vaittinen <mazziesaccount@gmail.com>
>>>   
>>>   Add support for ROHM BD12790 hot-swap controller which is largely
>>>   similar to Analog Devices adm1272.
>>>   
>>>   The BD12790 uses the same selectable 60V/100V voltage ranges and
>>>   15mV/30mV current-sense ranges as the ADM1272, and the same VRANGE
>>>   (bit 5) and IRANGE (bit 0) layout in PMON_CONFIG. It therefore uses
>>>   a dedicated coefficient table that mirrors adm1272_coefficients, with
>>>   the following differences derived from BD12790 datasheet Table 1 (p.18):
>>>   - power 60V/30mV: m=17560 (vs. 17561)
>>>   - power 100V/30mV: m=10536 (vs. 10535)
>>>   - temperature: b=31880 (vs. 31871, reflecting T[11:0] = 4.2*T + 3188)
>>>   
>>>   Signed-off-by: Matti Vaittinen <mazziesaccount@gmail.com>
>>>   Assisted-by: GitHub Copilot:claude-sonnet-4.6
>>>
>> Applied, after fixing the comment about BD12790 coefficients as suggested.
> 
> Thanks for going the extra mile and fixing while applying. I am glad I didn't need to re-spin for this! :)
> 
> And it seems gmail is getting more and more useless :( This (and couple of other replies) never emerged in my gmail inbox. So, just as a heads-up - gmail may silently drop some messages when reveiving. :(
> 

That is Google / gmail deciding that my e-mails are spam. Happens a lot lately.
They actually send me a note about it when they do it, but AFAICS there is nothing
I can do to prevent it.

Guenter

