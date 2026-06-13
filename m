Received: from mail-pf1-f181.google.com (mail-pf1-f181.google.com [209.85.210.181])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 772D53537FB
	for <devicetree@vger.kernel.org>; Sat, 13 Jun 2026 07:20:59 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.210.181
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1781335261; cv=none; b=j47VOn9ywphBzPI4QYbcQ7tj9cd5GJ7s3vbP665XT8to+KFoXFOK2c9yDBTCvO+8AQLM8FfN2aJPCq0EQijjC9qeWSqHx1HgCngr3QMMw6V0mUpaDFykQNSQtHs6rARSqGl9u3mvOi0kSdMEEwIcC598oijIcF/YUuHnnam+c3k=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1781335261; c=relaxed/simple;
	bh=qcp8Hgwj7d1i1tkEvvTQR8k2iNss2g1VzQekPD+R4+w=;
	h=Message-ID:Date:MIME-Version:Subject:To:Cc:References:From:
	 In-Reply-To:Content-Type; b=ab0HJgCWOI9BkaFReCkkVxNf+YyL7RQJU3wFSsObYvpx5PymflKHNiOyDrAaazPCbyz98iEtZkEMZ4gvnaeDT7nZxXqLfF2TYVLSvPjlFcpWS2IUZWw1tP8nOZkL/LRxJLoEK7UTFZflNAtYPxO0IzfqdwGbSPVmiwnIXRCWoiA=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=BuOE8j10; arc=none smtp.client-ip=209.85.210.181
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="BuOE8j10"
Received: by mail-pf1-f181.google.com with SMTP id d2e1a72fcca58-8422a92b6d6so914640b3a.1
        for <devicetree@vger.kernel.org>; Sat, 13 Jun 2026 00:20:59 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1781335258; x=1781940058; darn=vger.kernel.org;
        h=content-transfer-encoding:in-reply-to:from:content-language
         :references:cc:to:subject:user-agent:mime-version:date:message-id
         :from:to:cc:subject:date:message-id:reply-to;
        bh=yFlPsHECvjKKFoSYlqGhFvJ+I6A2Zwo1fKqJVG+6sUs=;
        b=BuOE8j10qO4tKw2wybfFsSU5sS2/vOmqVh/fZ8fAoxnpQqoD4YDt7rLByKCM0INBan
         UQvVDkUr398Y5TsL8DuKDJiyASn9Z6isrylt8U7/gvjxDPMAn+3vb5g/UVIGbMkqHxH1
         CBCYSAP6B7vElz81RtvStfWFBP5YsFO/Rlk0vyQEAWxLzTz0/i7ygqCJN0aneNDn7WRM
         WoakmtDRqJcbi4orwJ1ISuR+TkwgpcT21O1wwWzkjj9LBF0oyiJVZIh9jlNW3i3SQ1co
         tSXsNkakkMPu/AotwGxvsQt3jZ+yj7jJqff67jnEHowXDtuc7s3mvgre7vzOcihiNYwy
         7Hkw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1781335258; x=1781940058;
        h=content-transfer-encoding:in-reply-to:from:content-language
         :references:cc:to:subject:user-agent:mime-version:date:message-id
         :x-gm-gg:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=yFlPsHECvjKKFoSYlqGhFvJ+I6A2Zwo1fKqJVG+6sUs=;
        b=jZaWDO6fH1Zw1bExq+E8Jt3sapsSzyflqN91LQ9X40ENx3wqyezxMArHgx5EeRtwK+
         eU4IN5s2T4Ls4UKEWeSeHricjk3vLQZIcxgI3z7foKPx+xuMpI0wxn2CEIYPM8ZIHmrI
         IwlTh80zeqkkzyQhyUFsvEFhMzRCGIMpenKvVHjyIAkz7SUutT+EBEZJstf08YpeMqDe
         bVX9S4of96X8U59J2SGAPbLE9B31tM99dSMweP3YNOsFd2CGcQrZ787g0nW69RzriXSo
         9uYpNV1/rt8eX0j2fcyygfPjFM4uDkFh4slqEASPBn4UP11i3x6S88GAAY7hTpxlmgnb
         rD1Q==
X-Forwarded-Encrypted: i=1; AFNElJ8kCWiNwDAc5bFKGbSWfiUfJDDqfLuEefzqt8JR59/TJWkOYPpoAgyQTrdErv97fQbFTn5cOlk5PTtL@vger.kernel.org
X-Gm-Message-State: AOJu0YyBYkqaRzjyvzGLL5DjBha+x3XDW7oEo7s4yfN4ZRhG0wIE8WLq
	xU1L+BGHgi1vaavSGZlkkzUP0jPTRLFEoHZ7905H9z/Tl2Nuvmsu0Rcyo3gp9g==
X-Gm-Gg: Acq92OE0EqA4vJ+Itnov+gpFix2E3Sopzqgr+nJTPwjTvxMvr3VwLvK7NkJ9DaxARef
	PpUUuSAH02jGUtCEhXeOENwH2JsERNByRE6pIslmK6feiMnJki/J9R/D5FL5Xpp/aangmpNj0JR
	sr5y9O8DhYYTzLmgj3gCRMTpxj0eCw+TFlw4TBLVZFwc6xJyHTulAgvypnmn/7VD7ZKXNQ1z47M
	dlTToklBbLqAxfUykQcLCdtXgEffPk1WWEgeaRaoXJQwMJji5gyr/aNYVp7OS24DhIxrrOiL5/2
	DtNCEUps0QeYNa8lo6jQc5BPBTtBmqrjYqCw/EFBZM+G9v5nLvRhVZ+1fzZyDZ583ZxzYMD7StO
	1rhVrV49MhwS+FgOvA1QX88CDtPPaC6dUmRiNq5+d/EzKFUn/GOpTw0Onai7p1zPzLE2X4v0Q0P
	GTWXqLsr3KBnGonWKJX+E/LQuuWVPDwShwtGqr+lZ45JNo
X-Received: by 2002:a05:6a00:2995:b0:82f:4725:f6d0 with SMTP id d2e1a72fcca58-843497b8ab4mr5387757b3a.29.1781335258570;
        Sat, 13 Jun 2026 00:20:58 -0700 (PDT)
Received: from [192.168.0.8] ([49.207.61.84])
        by smtp.gmail.com with ESMTPSA id d2e1a72fcca58-8434ac9df57sm4216413b3a.7.2026.06.13.00.20.56
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Sat, 13 Jun 2026 00:20:58 -0700 (PDT)
Message-ID: <84be047f-350f-470c-9680-179805152e1a@gmail.com>
Date: Sat, 13 Jun 2026 12:50:54 +0530
Precedence: bulk
X-Mailing-List: devicetree@vger.kernel.org
List-Id: <devicetree.vger.kernel.org>
List-Subscribe: <mailto:devicetree+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:devicetree+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH] dt-bindings: pwm: st,pwm: convert to DT schema
To: sashiko-reviews@lists.linux.dev
Cc: conor+dt@kernel.org, devicetree@vger.kernel.org, robh@kernel.org
References: <20260613-st-pwm-v1-1-458c2c89709a@gmail.com>
 <20260613071327.BE3101F000E9@smtp.kernel.org>
Content-Language: en-US
From: Charan Pedumuru <charan.pedumuru@gmail.com>
In-Reply-To: <20260613071327.BE3101F000E9@smtp.kernel.org>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit



On 13-06-2026 12:43, sashiko-bot@kernel.org wrote:
> Thank you for your contribution! Sashiko AI review found 1 potential issue(s) to consider:
> - [Medium] The `interrupts` property is unconditionally required by the driver but omitted from the YAML schema's required list.
> --
> 
> commit b16a62dff3236ec8b123a99775f6c90dbfd9912f
> Author: Charan Pedumuru <charan.pedumuru@gmail.com>
> 
> dt-bindings: pwm: st,pwm: convert to DT schema
> 
> Convert STMicroelectronics STiH41x PWM/Capture controller binding
> to DT schema.
> 
>> diff --git a/Documentation/devicetree/bindings/pwm/pwm-st.txt b/Documentation/devicetree/bindings/pwm/pwm-st.txt
>> deleted file mode 100644
>> index 19fce774cafad..0000000000000
>> --- a/Documentation/devicetree/bindings/pwm/pwm-st.txt
>> +++ /dev/null
> 
> [ ... ]
> 
>> -Required parameters:
> 
> [ ... ]
> 
>> -- interrupts:		IRQ for the Capture device

Okay, I will define and add interrupts to the required.

> 
> [ ... ]
> 
>> diff --git a/Documentation/devicetree/bindings/pwm/st,pwm.yaml b/Documentation/devicetree/bindings/pwm/st,pwm.yaml
>> new file mode 100644
>> index 0000000000000..2c10f54b5caf3
>> --- /dev/null
>> +++ b/Documentation/devicetree/bindings/pwm/st,pwm.yaml
> 
> [ ... ]
> 
>> +required:
>> +  - reg
>> +  - compatible
>> +  - "#pwm-cells"
>> +  - pinctrl-names
>> +  - clock-names
>> +  - clocks
> 
> [Severity: Medium]
> Should interrupts be included in this required list?
> 
> The original text binding listed interrupts under the required parameters,
> and the driver unconditionally requests it during probe:
> 
> drivers/pwm/pwm-sti.c:sti_pwm_probe() {
>     ...
>     irq = platform_get_irq(pdev, 0);
>     if (irq < 0)
>         return irq;
> 
>     ret = devm_request_irq(&pdev->dev, irq, sti_pwm_interrupt, 0,
>                            pdev->name, pc);
>     ...
> }
> 
> Without interrupts in the required list, incomplete device trees will pass
> schema validation but fail deterministically at runtime.

Okay. I will add interrupts to my next revision.

> 

-- 
Best Regards,
Charan.

