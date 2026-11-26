Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=209.85.128.47
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1795710403;
	b=LhN+8oPbrLRcu26XJwtVBQvmNVzrua16aoToFH0F7XV3K1DmsPAKksaXb3iqu2kXbXSc
	 O+VlomGZ2pWyIIm4hXIwmUHM1qCm6V0twNLa5bk12QJ7vLM2lz7muPe9CifWwWOF2MwVj
	 zdsvXb5nPfPr2C3gsPYCoa1Jb8h2UPCiB8dpM1KFU1oFTcbknTbAP2W3W94cTp66bavVj
	 Hy4sEg8aIKdzcyJy6d5PSX6rNBl4+1ETzajxe2noe8754ZamqhECACs3iqfGZdcDbeBdQ
	 BvrdBLSdmqI4oMp7+d7rRHRReFq+NETCluEUAINhwvDFcXXScnSpY2BFqAXv2Ghev/g==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1795710403;
	h=DMARC-Filter:Received:DKIM-Signature:X-Google-DKIM-Signature:
	 X-Forwarded-Encrypted:X-Gm-Message-State:X-Gm-Gg:X-Received:Received:
	 Message-ID:Date:MIME-Version:User-Agent:Subject:To:Cc:References:
	 Content-Language:From:In-Reply-To:Content-Type:
	 Content-Transfer-Encoding;
	bh=b5z0ThmhKJxf+xijCxTwHDNcpYA1yXMLZrxPppTehao=;
	b=3bpT30qUuClkXqkiMPwYXI6u9Y4KtRuuJKLLCsKWlU6T4g32d9dH1PlfCVafNLGlRuzU
	 hulMLJ2NYTeTZOYUJ1nKkFDqyJBV2cGuda0LnLwEE/LwjD4QN/wPkIbry4bBbMQdxenXQ
	 pvtYbNoq8wb1D7swsIawYIyZqYi7aks8k7xw75/gdNfH2cYt677Q7tCj617l9z6biY1Dv
	 n1U+jL2L7oTs35tDO0sQSI/yhTRyHW8X8NY1BDMbLuPzDCrmjnTkhIwnGsPIiExmI8K+K
	 6mDhwP/Cvdqjk5vfNVhLX5O8HQj8MzVb1I/qr7CcmeoyYTetWYETyhC1eHn7JpUFiBg==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=gmail.com;
	spf=pass smtp.mailfrom=gmail.com;
	dkim=pass header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20260707 header.b=OWqOYqNw;
	arc=none smtp.remote-ip=209.85.128.47
Received: from mail-wm1-f47.google.com (mail-wm1-f47.google.com [209.85.128.47])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 15A82606A31C
	for <devicetree@vger.kernel.org>; Thu, 26 Nov 2026 16:26:42 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org 15A82606A31C
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20260707 header.b=OWqOYqNw
Received: by mail-wm1-f47.google.com with SMTP id 5b1f17b1804b1-4a5b2be99a8so60340055e9.2
        for <devicetree@vger.kernel.org>; Thu, 26 Nov 2026 08:26:42 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20260707; t=1795710401; x=1796315201; darn=vger.kernel.org;
        h=content-transfer-encoding:content-type:in-reply-to:from
         :content-language:references:cc:to:subject:user-agent:mime-version
         :date:message-id:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=b5z0ThmhKJxf+xijCxTwHDNcpYA1yXMLZrxPppTehao=;
        b=OWqOYqNwfRknSLG3Ui2p0CUMzmdffJ+xpc+fI/s2lv1UICyhWkc3eLDOBEJSzgZMed
         nKtBmDRBiVQC9MZJO84AP2i3xMlqHNlE3gbIFsr8q1yHaPFP7NaJfe0rn9Dev5F69Yj6
         p8T8x7I/4eD7VYDem3U1pZNyknc0W/H0VT3whFayHTw5d49Z0E1sx0l0D91/VC++UfiT
         EwNG3NVm6B7w4t4QzEMklUQ+1SfKrm39ZguERfr9VStotI47k60AnOsLpuMtfG36fRla
         mkyFIqiFYyRKFnicRBSrmEO7hAmYVsPtvVwOyuD4XQC+cWT6022skyvMewx2xRmdeh1O
         Z/nQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1795710401; x=1796315201;
        h=content-transfer-encoding:content-type:in-reply-to:from
         :content-language:references:cc:to:subject:user-agent:mime-version
         :date:message-id:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=b5z0ThmhKJxf+xijCxTwHDNcpYA1yXMLZrxPppTehao=;
        b=EMVgxs6sWp9JfaPS7tfGWY2prj2avnT3JTQkG6MA/uMy/s9PoYc1FQXm/hGO0I0DC3
         3MvXIvX8m1r30iu0n+AyPQf0p55oLwXg7q5NxHGs+hw/GyItA31S5QppJBNcfM9LGQeF
         J9EsZhGgP+/uTj6fQ9dfzw4dOiJ3ZtjCGX6drh4KCn+cNGhMSz1dQ0Imt4wB1566SGw5
         97mUMVtnm6KgL/+SJsuz82aHfQEA8UpKxLBtYtz+A1fHxFo7ER7ZB9od7uYly/zgGI8L
         k+916ik8HVl223ccdWy8Lockw8d1VTOW/aQY92GEpKY1UYN7mI3u1imv4LjvKg18ztq7
         ZfKQ==
X-Forwarded-Encrypted: i=1; AL+hErFC+aKtSatEfVfZthOpefy4mTYcQd8x/Ms0xwlhHHLesc4t2ETml6P4MOKCyQXx67ckY7Yhj7obp02F@vger.kernel.org
X-Gm-Message-State: APuU4Z+IM0QZ87v0v6HbJ6WKRmiV7RHpSYgg+RxucXM4mYUm9zvdH82Y
	JZPAx3Msnap7FWgRxPEkJLItc344tDqtWhBrcFVGuH4ihPIFwngmBb9t
X-Gm-Gg: AZFdTZcQoDSv6c2G+igMgROXFpZPKqwiI+IrMoHlmQOyCK3RdrBvvoSjfcO/HFgt1JU
	qhnllDYv/jI+MmenbpV7sFCtp4AN0qAvMXNnA/zi7nIA0AllvTzlYcXbAt6gR2olqBdTt+kygo1
	fy9ROosjSBJTSQAkSJpn7Zs/3z9Q4ySY8yI/H6OKKKVY8O731xVnOSq+ETsx6ei95s0I+ENomb0
	Mh+mEzCGY1Vd59NMR1HFbdKa9qji+nUdefX5JwUyomVnGkyB2YwPmEvc6R6H8/l1VqR5fQvJNQR
	nDAf0WVvB4k3qZpU31ryukaytep3QAGHfPYVxrcSSRe12nZsNG8MWcyTA86F3l337QKIhREnNz8
	Rpt0PwiMkTtQS94vZILPzMuBtL3zxh4XSe/X7jc8TSOHsgvyqqbg2kYltR2/OeaxG8GS4zNSvMc
	MyxtNfJyiKz5jCNtukEYLqJ6twVPteowQy/WtHO37DuQ3+BDgwBPi1VOdGo4nZctotDHakoy2C1
	UWe94XbuUEUC4tsOcwbl/spJnblnCvGrj3Ain2laTrQ0e3n4IxvTHNvkuRnPtYfFs2uNxjsGF7z
	O3OHw3n1KbVaLJGh4zEZ0wKuq98Rz2Zvextk0nOWemWVe1djio9VEcjgRG1bifxr+YPCCDoEEz/
	YIzvo3A==
X-Received: by 2002:a05:600c:3b8a:b0:4ba:761:c0c5 with SMTP id 5b1f17b1804b1-4bb8880f0e0mr442079825e9.5.1795710401231;
        Thu, 26 Nov 2026 08:26:41 -0800 (PST)
Received: from ?IPV6:2a02:e98:40:8091:3818:6731:d35e:a255? ([2a02:e98:40:8091:3818:6731:d35e:a255])
        by smtp.gmail.com with ESMTPSA id 5b1f17b1804b1-4bb90660cb4sm574510785e9.2.2026.11.26.08.26.40
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Thu, 26 Nov 2026 08:26:40 -0800 (PST)
Message-ID: <ef3ccabd-5093-4ee6-ac21-20e08b97b510@gmail.com>
Date: Thu, 26 Nov 2026 17:26:40 +0100
X-Mailing-List: devicetree@vger.kernel.org
List-Id: <devicetree.vger.kernel.org>
List-Post: <mailto:devicetree@vger.kernel.org>
List-Help: <mailto:devicetree+help@vger.kernel.org>
List-Subscribe: <mailto:devicetree+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:devicetree+unsubscribe@vger.kernel.org>
List-Owner: <mailto:devicetree+owner@vger.kernel.org>
Precedence: list
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH] dt-bindings: serial: pl011: Reference rs485.yaml
To: Rob Herring <robh@kernel.org>
Cc: Greg Kroah-Hartman <gregkh@linuxfoundation.org>,
 Jiri Slaby <jirislaby@kernel.org>, Krzysztof Kozlowski <krzk+dt@kernel.org>,
 Conor Dooley <conor+dt@kernel.org>, Lino Sanfilippo <LinoSanfilippo@gmx.de>,
 Matous Hybl <hyblmatous@gmail.com>, Miroslav Ondra <ondra@faster.cz>,
 linux-kernel@vger.kernel.org, linux-serial@vger.kernel.org,
 devicetree@vger.kernel.org
References: <20261121-pl011-rs485-v1-1-0d18008f4a12@gmail.com>
 <20261124195705.GA3075022-robh@kernel.org>
Content-Language: cs, en-US
From: =?UTF-8?B?S3J5xaF0b2YgxIxlcm7DvQ==?= <cleverline1mc@gmail.com>
In-Reply-To: <20261124195705.GA3075022-robh@kernel.org>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 8bit

Hello Rob,
thank you for the answer.
> On Sat, Nov 21, 2026 at 04:10:33PM +0100, Kryštof Černý wrote:
>> The amba-pl011 driver supports RS-485 and parses the generic RS-485
>> properties with uart_get_rs485_mode(), but the binding does not allow
>> them. Reference rs485.yaml.
> 
> Is supporting RS-485 really specific to the UART? Can't pretty much any
> UART support it? Whether a driver does or doesn't doesn't matter. If so,
> then serial.yaml should probably just reference rs485.yaml.

You are right. Some hardware might not be able to support it properly, 
as it could lack essential registers (you need to know when the 
transmission is done to switch the direction pin), but I do not know of 
any. As I understand it, these properties describe the attached 
transceiver and its wiring rather than the UART itself, so they belong 
in serial.yaml.

In the next version, should I then reference rs485.yaml in serial.yaml 
and remove it from all of the other bindings?

> 
>>
>> Fixes: 8d479237727c ("serial: amba-pl011: add RS485 support")
>>
> 
> Drop blank line.

Since the change would then move to serial.yaml, there is no single 
commit it fixes, so I would drop the Fixes tag as well. Is that OK?

> 
>> Signed-off-by: Kryštof Černý <cleverline1mc@gmail.com>

Best regards,
Kryštof
