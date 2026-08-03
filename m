Received: from mail-pf1-f177.google.com (mail-pf1-f177.google.com [209.85.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id E9F652F531B
	for <devicetree@vger.kernel.org>; Mon,  3 Aug 2026 06:01:55 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.210.177
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1785736917; cv=none; b=cWpotbAFEcuKsHVjEjMDoHBi1p3pbmO5cz/WzKfsiYkXKZVcUQxvbkKlHT/K0iLp/Cjn9RBrDmtz/m9WPRM08WKVAIlbVFcRXwL3/eKzyzPnh0nq5JFRmA/u8SSlNKecYIWq3fArXVtJwAEfTJNF5oHzV4g328TlQAFlQ9DgWwY=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1785736917; c=relaxed/simple;
	bh=nhqzigJHu2rqL2Px63MJ43z3HN14aip2diXgZ+RPOUg=;
	h=Message-ID:Date:MIME-Version:Subject:To:Cc:References:From:
	 In-Reply-To:Content-Type; b=QiwN47TtgUZ3uWQ5JrUTK47x7SP8k5WpZo9Hyk/afXDkoMPLGedkkFDkFkziB3TWhIxUWrpJ3cSeW5HvOIpBRXfXXRzooc/9pgREA3X8lNlemMsH9JCh+0bD6XB2X3EAfFmgpMDCk1HoyXYx/L3rD41mDvusFmmvJ/6HNhoWbbo=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=jxAnv+Nx; arc=none smtp.client-ip=209.85.210.177
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="jxAnv+Nx"
Received: by mail-pf1-f177.google.com with SMTP id d2e1a72fcca58-84862b0d5aeso3650467b3a.2
        for <devicetree@vger.kernel.org>; Sun, 02 Aug 2026 23:01:55 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1785736915; x=1786341715; darn=vger.kernel.org;
        h=content-transfer-encoding:content-type:in-reply-to:from
         :content-language:references:cc:to:subject:user-agent:mime-version
         :date:message-id:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=jR6DHa6uHR7CPMwwaGVZjRKeuYi64yZ/mtj7JzFEqlo=;
        b=jxAnv+Nx/kVHYT5XzyGgxCIkd18PJlj4SVWyGzI/WhsphZbvlWxC51ZjU80VU2Ofv1
         D39ZzvyFZcODKu3DbOO8U/65GIGI2kBddzcnungEqI+3SAvOKIWzECRvfUOSihH/EOVm
         UxbvJ3t36zqHXB2OjqoVFm+lNDCfwDpSNYQ4nlaNRZf9BaFY6x63TAcVqXP194G5XWIt
         EnUIWm9bJQskOBjGgMAOQPOu7LPTaHoDCn2ONFzFKREnRoUEMn67i9i4wc3LpTRjEmk+
         GVgwt+b9Sy6HRNth29KS39mVp5QX0grJ/1TfO7pF6WF1zavR4smkxDJZx9+M2chnM6kl
         2yfw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1785736915; x=1786341715;
        h=content-transfer-encoding:content-type:in-reply-to:from
         :content-language:references:cc:to:subject:user-agent:mime-version
         :date:message-id:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=jR6DHa6uHR7CPMwwaGVZjRKeuYi64yZ/mtj7JzFEqlo=;
        b=ZMIyMvPsC0sD5UQOVueETxAqJ3SY/u2TBwGldcb1jYiiOQq2mUD/A2NPFHCJ9m6o0p
         80QAzUYzBgFQZW1NxlFxr06GCdLWU73G0bgj+h5Xn45rJBSPVErHCCV43hHTI7RHGOPN
         FT/IcipL+X16hwEhuhUSExIfYW8wkMHef9YpnGa8UMPZFgkbJc54YtfaNE9b2kFATtBO
         SWiTWZ5NDAzU54UcTRJB9JhFjN6zmlbi5aUsyH27R/XJwqZiojj7qawjkGeRMa7m3m8C
         KufxtkD1+viR1bjmqYJPPZU2tcN+Fapwx4BlI2QyH5jkXjuRkwYjPljfHeoBi7bnsY7Y
         Mhxg==
X-Forwarded-Encrypted: i=1; AHgh+Rqhhq4MXxIUfO4biWpiqRP5XLP9xRCVp9aNKN189v+o28a6o/Ibvz9UwVqxdMvrumMTiO9XwW9FmPq2@vger.kernel.org
X-Gm-Message-State: AOJu0YzIcffJPi/b+U2S4PulwUN57BhpgNxq627VQsYVciz0TQXWJcAG
	bJCW+cRTexB4GvmqwS7X7uTQ69TGcqMX7LGJM6HQFZa/jCN2uEQmXB8x
X-Gm-Gg: AR+sD11ehIPgsIvqKTFRg+cp/lsgmuHQP3k5iY7apJer7Hy/iXlAr2K5PicwHq8QiyL
	T8JQGkYTdkOC9tVtnUuHHM8Vsgh8F6WTtOgYJ6e1+faX++0ps3yx+H+wm+6xKzK+RJW/WJfGhcC
	Bbqn+R2XExOtzR/lL9gdBFVFsSTY/0PfiBr8/H6GUJrTApTb2QNDl4JutBYfc+j21prvd6Zzp3a
	/x6mHqG9I4j3cZxE9xv+fzj+/+2Mq/pquVZ23KrqoxPFukT+2XnU2Dny6bkPeV9O0R2wAmRz+Vr
	Bz2i9qiEKs3r54WNY4x780e22QhEzu+zH57Ugf3sIgRVI0MJYeQQBcMzImvrcZNFq+xbbW85+od
	RxuOmpGGCfvvIqYQDg2cPul+FHz5RBQjSJYiDY7akuvVzhfYKxdlK5FlyZXYNgtaZ1ZqNeEEUSw
	lJ73VaBCsQeWINPh+sx2H8DOHOKR64QJIRLHlam/x7I1MVekjJnLyygVWdAw6Qzac8qW2L021NS
	LetHTsRehVrHgk3njHqJVEL81fwi8YNMjPBTz0F
X-Received: by 2002:a05:6a00:cc4:b0:848:2f6e:e52b with SMTP id d2e1a72fcca58-84ee48ea8d3mr8120475b3a.63.1785736915112;
        Sun, 02 Aug 2026 23:01:55 -0700 (PDT)
Received: from [172.19.1.42] (60-250-196-139.hinet-ip.hinet.net. [60.250.196.139])
        by smtp.gmail.com with ESMTPSA id d2e1a72fcca58-84edc2d901csm3106716b3a.48.2026.08.02.23.01.53
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Sun, 02 Aug 2026 23:01:54 -0700 (PDT)
Message-ID: <a7c2335a-6c63-475e-b11d-12c56c90c212@gmail.com>
Date: Mon, 3 Aug 2026 14:01:53 +0800
Precedence: bulk
X-Mailing-List: devicetree@vger.kernel.org
List-Id: <devicetree.vger.kernel.org>
List-Subscribe: <mailto:devicetree+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:devicetree+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH] dt-bindings: spi: nuvoton,ma35d1-qspi: Disallow GPIO chip
 selects
To: sashiko-reviews@lists.linux.dev
Cc: conor+dt@kernel.org, devicetree@vger.kernel.org, robh@kernel.org
References: <20260803024048.1641756-1-cwweng.linux@gmail.com>
 <20260803024812.9FBDD1F000E9@smtp.kernel.org>
Content-Language: en-US
From: Chi-Wen Weng <cwweng.linux@gmail.com>
In-Reply-To: <20260803024812.9FBDD1F000E9@smtp.kernel.org>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 8bit


sashiko-bot@kernel.org 於 2026/8/3 上午 10:48 寫道:
> Thank you for your contribution! Sashiko AI review found 1 potential issue(s) to consider:
> - [Medium] The commit disallows the `cs-gpios` property in the DT binding based solely on a current Linux driver limitation, violating the core Device Tree principle that bindings describe hardware, not software capabilities.
> --
>
> --- Patch [1]: [PATCH] dt-bindings: spi: nuvoton,ma35d1-qspi: Disallow GPIO chip selects ---
> commit 3aecb6991adf3696410ad69c99107c7d732fd078
> Author: Chi-Wen Weng <cwweng@nuvoton.com>
>
> dt-bindings: spi: nuvoton,ma35d1-qspi: Disallow GPIO chip selects
>
> This commit updates the nuvoton,ma35d1-qspi binding to explicitly disallow
> the cs-gpios property. The change is made because the current driver only
> supports native chip selects, preventing the use of GPIO-based chip selects.
>
>> diff --git a/Documentation/devicetree/bindings/spi/nuvoton,ma35d1-qspi.yaml b/Documentation/devicetree/bindings/spi/nuvoton,ma35d1-qspi.yaml
>> --- a/Documentation/devicetree/bindings/spi/nuvoton,ma35d1-qspi.yaml
>> +++ b/Documentation/devicetree/bindings/spi/nuvoton,ma35d1-qspi.yaml
>> @@ -33,6 +33,8 @@ properties:
>>       maximum: 2
>>       default: 2
>>   
>> +  cs-gpios: false
>> +
> [Severity: Medium]
> Does this restriction violate the device tree principle that bindings should
> describe hardware rather than software capabilities?
>
> By explicitly disallowing cs-gpios in the properties block based on a current
> Linux driver limitation, board designers who route a standard GPIO to a SPI
> peripheral's chip select pin will be incorrectly prevented from describing
> their actual physical board wiring. When running make dtbs_check on a board
> device tree that uses cs-gpios for this controller, the schema will reject it.
>
> Should the hardware schema allow standard hardware properties like cs-gpios
> even if the current software driver lacks support for them?
>
>>   required:
>>     - compatible
>>     - reg

Hi,

Thanks for pointing this out.

I agree that the binding should describe valid hardware and board wiring 
rather than the current driver limitation.

I will send a v2 that keeps cs-gpios supported by the binding and 
instead enables GPIO descriptor-based chip-select handling in the MA35D1 
QSPI driver. I will also keep active-high chip selects restricted to 
GPIO-based chip selects, since the controller's native chip selects 
currently support active-low operation only.

Best regards,
Chi-Wen

