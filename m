Received: from mail-qv1-f44.google.com (mail-qv1-f44.google.com [209.85.219.44])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 375F04D6C4E
	for <devicetree@vger.kernel.org>; Mon, 12 Oct 2026 19:22:26 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.219.44
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1791832947; cv=none; b=hMshhADM7TfhafPCt6e80VH+SURnlS5FTxeT2gyx9FAWrfuje1sRcy1infoqpQ/07mY89rJ9lxzQVTc4p2356IlmT9ms1gV8tLXwzrCzlqdRXIr3lAqnExczKLvZHdsv5flIDfvDs/izckH1+A81P3OVQv1Vt/5CUAVo8Nu6buY=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1791832947; c=relaxed/simple;
	bh=I2wtVNaS6o8OAlaYlTFNdpKbih1U/K2t30+mfEc/Lzs=;
	h=Message-ID:Date:MIME-Version:Subject:To:Cc:References:From:
	 In-Reply-To:Content-Type; b=gruhOmQnpnJ3wMdMTWWjZQ7EKUgcl+8bcKuN8x62+HHNiVnox+ExFd2s/Sn9YU6APLfrZzDTrTewyx811D3nOChD89bWZW7woLcIWhXG4YepgC9vMHz0MfCc2rjG93p/CwvUFiTn3xj93pWcGy/7Sjk9RYHHrH29OQCLzVJnZb8=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=riscstar.com; spf=pass smtp.mailfrom=riscstar.com; dkim=pass (2048-bit key) header.d=riscstar-com.20251104.gappssmtp.com header.i=@riscstar-com.20251104.gappssmtp.com header.b=oAW1ZAKZ; arc=none smtp.client-ip=209.85.219.44
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=riscstar.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=riscstar.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=riscstar-com.20251104.gappssmtp.com header.i=@riscstar-com.20251104.gappssmtp.com header.b="oAW1ZAKZ"
Received: by mail-qv1-f44.google.com with SMTP id 6a1803df08f44-917a64f28d0so57190226d6.0
        for <devicetree@vger.kernel.org>; Mon, 12 Oct 2026 12:22:26 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=riscstar-com.20251104.gappssmtp.com; s=20251104; t=1791832945; x=1792437745; darn=vger.kernel.org;
        h=content-transfer-encoding:content-type:in-reply-to:from
         :content-language:references:cc:to:subject:user-agent:mime-version
         :date:message-id:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=dJkDBXWfZLgUvuIwsHhYgMkJTX4QEfwRoh/VVYHOAu4=;
        b=oAW1ZAKZRBNreUqG5+cd2te649WzsPiL5GYoYQJJBKMWHbdB9+WGAX9RzTnVdW+33V
         VZCU9wNOFSMCWB9dmgOyPZKptodQ0QiQrc+EWfNt7zl9/gthW+MbtQeNYDWopFOBAl2l
         b4FR4gfTeUMdKiBVma6jI6b6TzqQTm7r3uzXn2kUX8BgS1CSiaLMb80Mcga1npvUdk/y
         Ofhypv/vcv/91TyotBTZDg5kuvuNXv2f2uA8pUlMrq/8ODukuWYfrkN1ESylkdoG6rlz
         TEgkkORLmSiBW7068riKs8xQpADbM1QCGIvVsqLEPwm46YXPscpPiV85F1cGvNqAOIpD
         jBOg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1791832945; x=1792437745;
        h=content-transfer-encoding:content-type:in-reply-to:from
         :content-language:references:cc:to:subject:user-agent:mime-version
         :date:message-id:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=dJkDBXWfZLgUvuIwsHhYgMkJTX4QEfwRoh/VVYHOAu4=;
        b=VTiB75zxTyi5XDAEtUptBggMbtIItd2PmK+gvnE2t/51oAGqWPI60130pMn30pYL2p
         RfMP/Taxqm+UBMXQnV4Px71/r1Ot5NMeyaItxtItnQY9pHtSSDAXQqp0N/k+3cAu8cgz
         bteByXUZ1SX80YKV1Soo6ZZzS2wlkodJJVf6nAKeq8h0NisjKmL9RS46QMgZglbw8Ei/
         Go3oMu7bW2hbg3XB9Rfmgoq8s/2eLH63khlgBZNpojkmcREnCvYySA2hT5HX8obZpNkc
         p0vQGVGpWQNajMx5eJ57wPyC2bQ/Z+W9WeniR3UgTw4yr9krWr8/RHRofXH41VjyBFwq
         3jcg==
X-Forwarded-Encrypted: i=1; AKwUvBwVPwkW+hNHBO7jC2vRVj/TAhvsge1oH6qTFeFhDNzCcMq6Yt/zOHNzPeb2pDgjp7MMISq8pUguJaN1@vger.kernel.org
X-Gm-Message-State: AFq9FYLsZiMt4B8kc/6UKMQsPdfM2MmUM8nEwUO9rJLRATw99aT4sxyw
	EJV2HfAXvTVphDsp92G7PURne3dZ08wsD64Wq/S3nr9KvkfWWMR4jNbJh79gP1bqrg6VNmiYctC
	A/iXlnHw=
X-Gm-Gg: AYBFou2NBWfAwEUGzbz1ksZ4W7wDKChKi0gGBdzqlB3C56VPsDY6UhH0XyUK2DOq9Hy
	b6vlxF5jFxb7o4mcttg5mEuPr+N3AQKDRmiAatfQ+IO9E7GgV/N02BvD8EigCb81XQgxht626sz
	Rclb2xHOOw/janSJRMRr7CFEHT30jwfU7hl4RzvwEIjuJhPV/X0TOHOJyhdfauqkDiSirC94GcI
	FCaFQ/kgrReBeXR/iuW/mc7HhH4gA/2kQbTeZFT1AOW9SE6JjxF7qrUtRgy6Fww7QfgZs3FzFmX
	aJbLYPhEfSPMhgB/2Xy97/arSo96CufegB78WVEH/8Pv/qS/5ggYk7p0o5M4TW8U7y4QPj4/yoY
	Av+cImqBTLfJWnkFZztqUs/IgK3NdB8wzZHWvJm1c2Z4Iya9LHUyddvo2xRwssYeIv7rrkTVmZS
	X8YhWX9X+VA7PTGjj9cpd4YByd1WnDeVhsSxQKFdBePOzT6aN12hPrLjRiiSLgD3N/7hBqfhI=
X-Received: by 2002:a05:620a:46a4:b0:939:b0c8:b068 with SMTP id af79cd13be357-93ec1465512mr1488249785a.16.1791832944960;
        Mon, 12 Oct 2026 12:22:24 -0700 (PDT)
Received: from [172.22.22.28] ([73.62.185.64])
        by smtp.gmail.com with ESMTPSA id af79cd13be357-93ef5042696sm59469685a.26.2026.10.12.12.22.24
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Mon, 12 Oct 2026 12:22:24 -0700 (PDT)
Message-ID: <fd8e30a6-107a-44ae-a268-f077a6f498ef@riscstar.com>
Date: Mon, 12 Oct 2026 14:22:23 -0500
Precedence: bulk
X-Mailing-List: devicetree@vger.kernel.org
List-Id: <devicetree.vger.kernel.org>
List-Subscribe: <mailto:devicetree+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:devicetree+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH 1/2] dt-bindings: interrupt-controller: introduce
 toshiba,tc9564-msigen.yaml
To: sashiko-reviews@lists.linux.dev
Cc: conor+dt@kernel.org, devicetree@vger.kernel.org, robh@kernel.org
References: <20261012190245.3988619-1-elder@riscstar.com>
 <20261012190245.3988619-2-elder@riscstar.com>
 <sashiko-outbox-168565@kernel.org>
Content-Language: en-US
From: Alex Elder <elder@riscstar.com>
In-Reply-To: <sashiko-outbox-168565@kernel.org>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit

On 10/12/26 2:07 PM, sashiko-bot@kernel.org wrote:
> Thank you for your contribution! Sashiko AI review found 3 potential issue(s) to consider:
> - [Medium] dt-bindings: missing mandatory clock and reset properties in required list
> - [Low] dt-bindings: non-existent header includes cause dt_binding_check failure
> - [Low] dt-bindings: maintainer email addresses mismatch between MAINTAINERS and schema
> --
> 
> commit 8cfa6ac36f149ea1d1b37b717117b76943010968
> Author: Alex Elder <elder@riscstar.com>
> 
> dt-bindings: interrupt-controller: introduce toshiba,tc9564-msigen.yaml
> 
> Define the binding for the MSIGEN interrupt controller present in the
> Toshiba TC9564 SoC.
> 
>> diff --git a/Documentation/devicetree/bindings/interrupt-controller/toshiba,tc9564-msigen.yaml b/Documentation/devicetree/bindings/interrupt-controller/toshiba,tc9564-msigen.yaml
>> new file mode 100644
>> --- /dev/null
>> +++ b/Documentation/devicetree/bindings/interrupt-controller/toshiba,tc9564-msigen.yaml
> [ ... ]
>> +title: Toshiba TC9564 MSIGEN Interrupt Controller
>> +
>> +maintainers:
>> +  - Daniel Thompson <daniel@riscstar.com>
>> +  - Alex Elder <elder@riscstar.com>
> 
> [Severity: Low]
> This isn't a bug, but is this email domain mismatch intentional? The
> email addresses listed here in the schema use @riscstar.com, but the
> MAINTAINERS file entry added in this same patch uses @kernel.org.
> 
> This might cause automated tooling to route patch series to incorrect or
> duplicate addresses.

Daniel and I are doing this work on behalf of RISCstar, but we
use our @kernel.org addresses in the MAINTAINERS file.

danielt@kernel.org is the same person as daniel@riscstar.com
elder@kernel.org is the same person as elder@riscstar.com

(We should both send updates to the .mailmap file...)
> 
> [ ... ]
>> +required:
>> +  - compatible
>> +  - reg
>> +  - interrupt-controller
>> +  - '#interrupt-cells'
> 
> [Severity: Medium]
> Should clocks and resets be included in this required list? The binding
> documentation specifies that each MSIGEN uses a gated clock and reset line.

In the code, the calls to the clock and reset are not optional, so
yes, these should be required.  I will update this in version 2.

> If they are omitted here, device trees with incomplete hardware configurations
> will silently pass schema validation, potentially leading to driver failures
> when attempting to ungate clocks or deassert resets on uninitialized hardware.
> 
>> +
>> +additionalProperties: false
>> +
>> +examples:
>> +  - |
>> +    #include <dt-bindings/clock/toshiba,tc9564.h>
>> +    #include <dt-bindings/reset/toshiba,tc9564.h>
> 
> [Severity: Low]
> Does this cause make dt_binding_check to fail? It looks like these header
> files are not included in this patch series.

I just checked, and yes, in fact this does cause a failure.

I did check this, but it was in my test environment that includes
a bunch of other drivers, etc.  These two headers come from two other
series that are currently out for review, and I neglected to mention
this.

I'll try find a better way to handle this for the next version.

					-Alex

> luding headers in the YAML example that do not exist in the source tree
> will usually cause the C preprocessor to fail during schema validation
> compilation.
> 
> [ ... ]
>> diff --git a/MAINTAINERS b/MAINTAINERS
>> --- a/MAINTAINERS
>> +++ b/MAINTAINERS
> [ ... ]
>>   F:	drivers/media/i2c/tc358743*
>>   F:	include/media/i2c/tc358743.h
>>   
>> +TOSHIBA TC9564 MSIGEN DRIVER
>> +M:	Alex Elder <elder@kernel.org>
>> +M:	Daniel Thompson <danielt@kernel.org>
>> +S:	Maintained
>> +F:	Documentation/devicetree/bindings/interrupt-controller/toshiba,tc9564-msigen.yaml
>> +
> 

