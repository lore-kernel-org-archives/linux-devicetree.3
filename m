Received: from mail-dl1-f51.google.com (mail-dl1-f51.google.com [74.125.82.51])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id EB4E630F540
	for <devicetree@vger.kernel.org>; Tue, 24 Mar 2026 20:30:01 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=74.125.82.51
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1774384203; cv=none; b=qaokR1aQtZOokb/TcOb+8Gc1HDpnOLZvKA8g7VcAR0dn52G05QqzDDcGhSn84l20e1+1/Zc9GRdsqkyMCkePFyWL3LSRsy9IbqV+b1Q0eakewqTk6rtblWVpvWcmFDhd+6SLUErfjP2dKdSe9dUS4LRzv3Zmk33PAeUL0FGSmos=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1774384203; c=relaxed/simple;
	bh=+7u65vkEBtv9mhBR3k3Qn//dK+jN0f9NdbLN4Sd1N7c=;
	h=Message-ID:Date:MIME-Version:Subject:To:Cc:References:From:
	 In-Reply-To:Content-Type; b=M9bEURkQNGNkrN39RBiRzGICYm1O+s6y/8OhIt5UrE7+Ybctgst+4DBm3o9xcszATZh6sEzByz21m2m2CsmuIyxJ6EGmFZpFqQk4apTj5BGpdyFZscJ52uuA4wK2qkc1CetL6Lbxsf1/Bp42Z3LvpKGgdmoG8NzwEKJembgfupE=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=roeck-us.net; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=QhxAxv3u; arc=none smtp.client-ip=74.125.82.51
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=roeck-us.net
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="QhxAxv3u"
Received: by mail-dl1-f51.google.com with SMTP id a92af1059eb24-12732e6a123so9722507c88.1
        for <devicetree@vger.kernel.org>; Tue, 24 Mar 2026 13:30:01 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1774384201; x=1774989001; darn=vger.kernel.org;
        h=content-transfer-encoding:in-reply-to:autocrypt:from
         :content-language:references:cc:to:subject:user-agent:mime-version
         :date:message-id:sender:from:to:cc:subject:date:message-id:reply-to;
        bh=d08ISjwoZCoE4OXtjuAT9Xn3obHp2QwMiiYr2wNzsL0=;
        b=QhxAxv3u2gEe+2NplL4+0TOxx0c2U5vc6ebP64yBGdkMiyUCGHKlE5HgXB9OSFXK2Q
         +tHo4hLvHfGP64h1h+81cuT2RHxK4OaAmYloaLK+G1bX0bgbH8OdlnhDFySCMP4oWHiP
         c35yFXkSqFertK6vjmlpX3VwMWbsC325A/Flml/Gcooh1f54uPNld64Zeg5i/fcz+V0X
         5APsiwhgjQ2kYmnG02EXC7HDDQ1/Pq6PBOH0vaTANldyrMhj/gcG6Gquw1fCz4qC3Amg
         fVUhLfm5+n42plgekKpvWm6nr3vs/Yiy7Fvty7xjUPl2fksZR/6qw/jpL+2p4sQZ8/Al
         nlxA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1774384201; x=1774989001;
        h=content-transfer-encoding:in-reply-to:autocrypt:from
         :content-language:references:cc:to:subject:user-agent:mime-version
         :date:message-id:sender:x-gm-gg:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=d08ISjwoZCoE4OXtjuAT9Xn3obHp2QwMiiYr2wNzsL0=;
        b=svMRvI4gyEwI5NJSBRBhjPT2UIVw4LejUX7Kg5uvO5WXaWH4tbLde8M4MZYpjFwX16
         ui0n6jP7vRSF9uxx2boQrUuDhfjU/r6g5FDkgU/oovMwL5LphMfQY5oGo1gHIU3IET85
         NF1+H4RbkYE4hQb+qIxN0Tw3/Al68MNj9B+zW0XN4OrnWLFELTFtnY2fOHpumbA6ZsEG
         HUrzqTtj4AsjI+oi+Fm73CPh9qP1KXmq0ZmHbW48jRaieE4SY2Qt4VcUWy/pG6diSb0E
         DFgk0VMe7klUM/qeL7eFrdva7kh9Z6UVWijUIwDF8LG1u17UYP28z1YCMCqS1Crz4hfq
         gakA==
X-Forwarded-Encrypted: i=1; AJvYcCVkk0WOrod6mpoYwK6e022VjxhXNSNENAS+HhLatvEEDVjfsrlwQzGSgrqQC//cFxZqbE27dDgLJmxd@vger.kernel.org
X-Gm-Message-State: AOJu0YxAKZUt0uf86MvFG3pUCKkcUQaEn0hpu+IUyHX2u7DiWUy3janE
	Z1U9UM3k6TCi/Hfz7+TsyBYAf4wGSqgpsbzJPl3Jt1n6Dk3F9TpKvcua
X-Gm-Gg: ATEYQzx/TRv+L6WwPWUPeLQuYFFBR3/KNQKlqA30B8uJxt0AxbdeZkpVQAjnJVrBoQ0
	T6LpuJILQiXpdyv/puIqg5nTgESCP4VLJg5lpigeoBDVDf3IG8rpB127gXco/Vhk+WBjR3xHaYv
	WOR4ND+JVGlHM1S2DtNctuYEdrOaX/8NH9IDNVsnYheytxLkwctGePE+O+2TWFCYtLuUgjN+oaQ
	I1puKUaYYVMI8mkcHiS9hVR3FA8FFbuv3aSQ0YkiAGOcMqA/xvh0dfMWEBooHrhTckk09sQegtg
	1l7ax2mdEGLPXKqPbw31xpi/pKnzFnF2CVLp91ldiABboizfa2a89u8/NyEGWctEiF+uveANcfw
	1jqngpf45dw1Mmyql5LRgrrOXoqK9VDstZ1K2yAObctsrsg6hHuodZm9LiBKy62/JL1cpLTeJwg
	tN2i9Xlz3Fu2XJdkBPqUg2QyuXhwjpkFeFmlCPOXZTXdNhfBWbUzgeoTsrsWvAjD5AtrdJ0Iz8
X-Received: by 2002:a05:7022:526:b0:125:be41:db5b with SMTP id a92af1059eb24-12a96f200f8mr437728c88.42.1774384200987;
        Tue, 24 Mar 2026 13:30:00 -0700 (PDT)
Received: from ?IPV6:2600:1700:e321:62f0:da43:aeff:fecc:bfd5? ([2600:1700:e321:62f0:da43:aeff:fecc:bfd5])
        by smtp.gmail.com with ESMTPSA id a92af1059eb24-12a733b4a39sm11652609c88.3.2026.03.24.13.29.59
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Tue, 24 Mar 2026 13:30:00 -0700 (PDT)
Sender: Guenter Roeck <groeck7@gmail.com>
Message-ID: <e1eafbdf-8d59-41f8-8f27-949250dcb2e4@roeck-us.net>
Date: Tue, 24 Mar 2026 13:29:59 -0700
Precedence: bulk
X-Mailing-List: devicetree@vger.kernel.org
List-Id: <devicetree.vger.kernel.org>
List-Subscribe: <mailto:devicetree+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:devicetree+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v3 0/4] hwmon: (sht3x) Add support for GXCAS GXHT30
To: Zaixiang Xu <zaixiang.xu.dev@gmail.com>
Cc: robh@kernel.org, krzk+dt@kernel.org, conor+dt@kernel.org,
 linux-hwmon@vger.kernel.org, devicetree@vger.kernel.org,
 linux-kernel@vger.kernel.org
References: <1774354869-119736-1-git-send-email-zaixiang.xu.dev@gmail.com>
Content-Language: en-US
From: Guenter Roeck <linux@roeck-us.net>
Autocrypt: addr=linux@roeck-us.net; keydata=
 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
 np3900V20aS7eD9K8GTU0TGC1pyz6IVJwIE=
In-Reply-To: <1774354869-119736-1-git-send-email-zaixiang.xu.dev@gmail.com>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit

On 3/24/26 05:21, Zaixiang Xu wrote:
> This series adds support for the GXCAS GXHT30 humidity and temperature
> sensor. The GXHT30 is software compatible with the Sensirion SHT30 series.
> 
> This series also introduces the missing YAML binding schema for the
> Sensirion SHT30 family, replacing wildcards with specific model names.
> 

AI feedback:

https://sashiko.dev/#/patchset/1774354869-119736-1-git-send-email-zaixiang.xu.dev%40gmail.com

I wonder if all those chips should be modeled with fallback for the chips
with the same functionality. sht3x_of_match in patch 3 looks wrong, though,
since the sht and the sts chips are _not_ the same and need to be configured
differently.

Thanks,
Guenter

> Changes in v3:
> - Split driver changes into two patches: one for DT framework and one
>    for adding GXHT30 (suggested by Guenter Roeck).
> - Fixed commit message line lengths (suggested by Guenter Roeck).
> - Removed wildcards 'x' from compatibles, used specific model names,
>    and renamed the binding file to sensirion,sht30.yaml
>    (suggested by Conor Dooley).
> - Added manufacturer website to vendor-prefix patch and included
>    Acked-by from Conor Dooley.
> - Fixed missing newline at end of YAML file (reported by kernel test robot).
> 
> Changes in v2:
> - Fix placeholder "Your Name" in MODULE_AUTHOR.
> 
> Zaixiang Xu (4):
>    dt-bindings: vendor-prefixes: Add GXCAS Technology
>    dt-bindings: hwmon: Add Sensirion SHT30 series
>    hwmon: (sht3x) Add devicetree support
>    hwmon: (sht3x) Add support for GXCAS GXHT30
> 
>   Documentation/devicetree/bindings/hwmon/sensirion,sht30.yaml | 44 ++++++++++++++++++++
>   Documentation/devicetree/bindings/vendor-prefixes.yaml       |  2 +
>   drivers/hwmon/sht3x.c                                        | 16 +++++++-
>   3 files changed, 61 insertions(+), 1 deletion(-)
>   create mode 100644 Documentation/devicetree/bindings/hwmon/sensirion,sht30.yaml
> 
> 

