Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=209.85.221.52
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1792484001;
	b=USKmAtK9Xm0BSzWZT59iHFNBkuxuC1c1NsjVweD5rvmiwitHR3a8te5SGQ3MlM+C3tVB
	 LiHI4x3Ni1UU2aHG2bBwu/qSoY4yZZCJnoVanBjb0KjXgCNfUeq4/6zeZQ1afmF+Bs+HW
	 MB9bH9RY0KuI8p6FbwhevSCLsoeTADkH3ey9WIu/s/HVKIs7Uy0ERaVrZMTpYjJaHOMSd
	 6vDf5XmptjyUlUmTpuYLvwDrExyT++dhb2+5Nlm/lHtAbhkc8wzyTHLcHgieBUIbLZ09S
	 5mM7Eeku/Yli9z/fH1b3rSjO+3E4rdcWlLRWjaKmFJKrZ/5Gcf7NYMCgLOcz6HpMvug==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1792484001;
	h=DMARC-Filter:Received:DKIM-Signature:X-Google-DKIM-Signature:
	 X-Forwarded-Encrypted:X-Gm-Message-State:X-Gm-Gg:X-Received:Received:
	 Message-ID:Date:MIME-Version:User-Agent:Subject:Content-Language:To:
	 Cc:References:From:In-Reply-To:Content-Type:
	 Content-Transfer-Encoding;
	bh=sifT94IuJdm+evFSGgUtUBWt/nlaaaYHDsDEfF5nTj0=;
	b=yO1OE5e3k6f20ShxeblhiUvChSUPP8NJtJ5iO1d7B3BFLlGdlYdKysItMng2ddDGzOiG
	 D0eEIVQ3QP1E/olYJa3m0F7EJghaD4aL8cmImpXiAEa4U4N3zvuljEdrY+Ithlw3q94AS
	 2ynjE3I0KT4liCrJSx8bptaFL1yj688KBG30BiBHXQL5SuuLZO0Ug7NEgBFjNBwpA2BmP
	 YqGoPsos/XpuKrs+EDmGHJN/RCkDeYlYBv28eJ/w20LMs0i9iofYwl0EtV2pJHvvDrnef
	 3cSrH6KDaL174ZKWXNslqrECkDBLlcM2Uh0UAFzaZzAvupWD9Hmk3UW7sV6cC3SlKJQ==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=gmail.com;
	spf=pass smtp.mailfrom=gmail.com;
	dkim=pass header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20251104 header.b="hep+mB5/";
	arc=none smtp.remote-ip=209.85.221.52
Received: from mail-wr1-f52.google.com (mail-wr1-f52.google.com [209.85.221.52])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 77CD0606A333
	for <devicetree@vger.kernel.org>; Tue, 20 Oct 2026 08:13:20 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org 77CD0606A333
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key, unprotected) header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20251104 header.b=hep+mB5/
Received: by mail-wr1-f52.google.com with SMTP id ffacd0b85a97d-48c4d99c32bso2409722f8f.1
        for <devicetree@vger.kernel.org>; Tue, 20 Oct 2026 01:13:20 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1792483999; x=1793088799; darn=vger.kernel.org;
        h=content-transfer-encoding:content-type:in-reply-to:from:references
         :cc:to:content-language:subject:user-agent:mime-version:date
         :message-id:from:to:cc:subject:date:message-id:reply-to:content-type;
        bh=sifT94IuJdm+evFSGgUtUBWt/nlaaaYHDsDEfF5nTj0=;
        b=hep+mB5/rzIkpFTWECjY//gRKF5/dPu43U4EeiM7sptRr+nzRHVuGra7s+DAmavJvO
         43XfOCWTBTAMVRmX1gunxl0uMCN2VFq0EMqyimdkr1AQacZhgKLWoNsHBx4o9ex/Bih1
         hw7PbRz0e76GmeIFMyk70RWN4+tGEgHvEzdbxbnPisPwbDho/Hja22ces/QWrrDlPvaK
         pkWTvquTI3EFsYebuaGPBXtka9PtOIMqjJlMuSGwwezSgfrbnp3Y9J9H1sVbj/biwJw/
         y3ZcRM25GpoLwmAkPgH/E0Qh9u8n10GY0hWvQGrXzY5ND7XABJh8+ARDnlL7Gkn4vs71
         /ONQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1792483999; x=1793088799;
        h=content-transfer-encoding:content-type:in-reply-to:from:references
         :cc:to:content-language:subject:user-agent:mime-version:date
         :message-id:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=sifT94IuJdm+evFSGgUtUBWt/nlaaaYHDsDEfF5nTj0=;
        b=mru0ULVRBoMRZ5Qzq/Jz13ZrWziHn3BeqAA4JKNogivxrH8IyjwoLsjvFErhRfV4Nb
         F8sMk/M6LQ9Xe9lwiHq9XuWHUXM64AC7ljRQ9/s4jb2NhtbRIET3euEV/XPq0S2kkN7+
         wxd4B5lz7w4LpJvPch/EWsBLNksq7ibuyBGP9tHBR+zR9l1R4lLouVBoKMrbWQYY27+C
         TeSPLkR2aHrA5jDrX20jh34XmmCUUpwbs8pvopjrYcLjAJqcUe8pznriy5seorJIiS6T
         WFfr0jdO+zXKhH+G8hWMJbpzxK3Y/UicRYrowW/PnCZLGC0GvT/c/JvLsTHbYbK1JegU
         hBfw==
X-Forwarded-Encrypted: i=1; AKwUvByY7vA4FX8H0alm2rlUIu1SkuNs1DD1PsqyQU4Ptq6MvHquYUL50tU4FR+u6YP7VRoAcM0wR1CUkavA@vger.kernel.org
X-Gm-Message-State: AFq9FYJHip3ly7IqNOgEuEGLEBlhqyoiE6nyFRUlCSetD71RZYUyNpuj
	bjh2O3Kr5DEiOOOMVFXaroySZlUCxGbaXml/48HNegDf9+SAKbT8pz3L
X-Gm-Gg: AYBFou1sJmaMsdSlm6A+kn6APPl4KxF/hOS18Pgftwg5yqwOWT2EbR1VzJhh8Gwkw7w
	OYDak/TpOTzkaTevPx4Rks0StNfQsz721KMNxrEhal27hnir+eLKjW80CaLfWMZ0yCS+UB4dajs
	jH0rgfgNWscsmk4FF4uc8vDjXn4mRks6KmdyEvvTYfjy49BRjeBQX1W4mck19yTN1bNwhR7gOPf
	F2EWeNN2JG6ic9vWKxWrZbTOWMI4gEHPax9WjneC2YSC/LVT/alGTq/XyVj5POTUEu+vl5lFX/E
	K8gZvREjX3pJdGH6iMQo1RDcqdPBDfmk5HHnGOOFjUtjpVrxHHsYhgKyqeAK11liYmUwVjvNxLi
	RpN63z7WCa47R1oBTRip9oeLG646k2bqPy4waAwGRb/KVctDp8Bb8GFMjR7g0exZzBrjNN+pqfc
	fmD8v0W9zJvSG1zrrXktCNLd5yY17xoO6HVxKDi4eeqOYmlFFaYmNmeOh8akikVPV+9+XpfpHiE
	E4+XbQyEAgRuwqVJbymoByZZW+Rw8AxyaGfF4w8xP7cXvEoPr2K4xv0IOWkEm28NHAA4q82
X-Received: by 2002:a05:600c:1f83:b0:4a0:27eb:49b with SMTP id 5b1f17b1804b1-4a1d761b900mr213796785e9.30.1792483998516;
        Tue, 20 Oct 2026 01:13:18 -0700 (PDT)
Received: from ?IPV6:2001:9e8:f117:a001:5c30:2c3c:9609:3456? ([2001:9e8:f117:a001:5c30:2c3c:9609:3456])
        by smtp.gmail.com with ESMTPSA id 5b1f17b1804b1-4a1f2cc809csm55072355e9.8.2026.10.20.01.13.17
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Tue, 20 Oct 2026 01:13:18 -0700 (PDT)
Message-ID: <2f64d2b7-f23d-4c99-ae1d-7404079dcde5@gmail.com>
Date: Tue, 20 Oct 2026 10:13:17 +0200
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
Subject: Re: [PATCH net-next 1/2] dt-bindings: net: pse-pd: realtek,pse: add
 gen1 I2C transport
Content-Language: en-US
To: Krzysztof Kozlowski <krzk@kernel.org>,
 Sander Vanheule <sander@svanheule.net>
Cc: Oleksij Rempel <o.rempel@pengutronix.de>,
 Kory Maincent <kory.maincent@bootlin.com>,
 Andrew Lunn <andrew+netdev@lunn.ch>, "David S. Miller"
 <davem@davemloft.net>, Eric Dumazet <edumazet@kernel.org>,
 Jakub Kicinski <kuba@kernel.org>, Paolo Abeni <pabeni@redhat.com>,
 Rob Herring <robh@kernel.org>, Krzysztof Kozlowski <krzk+dt@kernel.org>,
 Conor Dooley <conor+dt@kernel.org>, netdev@vger.kernel.org,
 devicetree@vger.kernel.org, linux-kernel@vger.kernel.org
References: <20261018161248.376205-1-sander@svanheule.net>
 <20261018161248.376205-2-sander@svanheule.net>
 <20261020-noisy-amorphous-jackal-1df08a@quoll>
From: Jonas Jelonek <jelonek.jonas@gmail.com>
In-Reply-To: <20261020-noisy-amorphous-jackal-1df08a@quoll>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit

Hi,

On 20.10.26 09:27, Krzysztof Kozlowski wrote:
> On Sun, Oct 18, 2026 at 06:12:47PM +0200, Sander Vanheule wrote:
>> Like the gen2 protocol, the gen1 protocol can also be used over both a
>> raw I2C transport and an SMBUs transport. Add a compatible for the
>> former and the compatible for the Ubiquiti Unifi Switch Lite 16 PoE
>> device that uses it.
>>
>> Signed-off-by: Sander Vanheule <sander@svanheule.net>
>> ---
>>  .../bindings/net/pse-pd/realtek,pse-mcu-gen1.yaml          | 7 +++++++
>>  1 file changed, 7 insertions(+)
>>
>> diff --git a/Documentation/devicetree/bindings/net/pse-pd/realtek,pse-mcu-gen1.yaml b/Documentation/devicetree/bindings/net/pse-pd/realtek,pse-mcu-gen1.yaml
>> index 3bb32349c28c..526f8525bb4d 100644
>> --- a/Documentation/devicetree/bindings/net/pse-pd/realtek,pse-mcu-gen1.yaml
>> +++ b/Documentation/devicetree/bindings/net/pse-pd/realtek,pse-mcu-gen1.yaml
>> @@ -54,6 +54,12 @@ properties:
>>                - zyxel,gs1920-24hp-v2-pse
>>            - const: realtek,pse-mcu-gen1-smbus
>>  
>> +      # I2C, raw framing
>> +      - items:
>> +          - enum:
>> +              - ubnt,usw-lite-16-poe-pse
>> +          - const: realtek,pse-mcu-gen1-i2c
>> +
>>        # UART
>>        - items:
>>            - enum:
>> @@ -100,6 +106,7 @@ allOf:
>>            contains:
>>              enum:
>>                - realtek,pse-mcu-gen1-smbus
>> +              - realtek,pse-mcu-gen1-i2c
> That's the same device as smbus, no? Same device, same compatible.

Physically it's the same device/MCU but the baked-in firmware and configuration
differs. Same for the UART vs. SMBus.

> You can have property deciding about protocol, if this cannot be deduced
> from the clients.

This was the approach in the early versions of the driver when I sent it
to the list. Rob favored the current way [1] and I think Conor was ok
with it later on.

[1] https://lore.kernel.org/netdev/20260615212959.GA1679454-robh@kernel.org/

> Best regards,
> Krzysztof

Best,
Jonas
