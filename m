Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=185.125.188.123
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1793982360;
	b=U0AuVBQcphXhN9wPjjBNB/jf3uUTNypjGPVBRgJ9Qxu2zFrHgIl25LWX3lmg3YWCD5Jy
	 DuBiUkdUTeAd7wOqivLyT+KX2KYc2g8Yk7mYLh0T9PhmEHiuDGFNVg+N7DpNLKNBlp116
	 0YMpgYWIyMbfbLnEbM0gBGZcWXb3kfYibTVt0aUE3D47uU15OJ1PkwjsaHV3VHa3P610s
	 x74VpGQrjkyTh2Z0Oj7iIuR7WMPidJn56shbVmfJhHJuxovErxwIAbGEA6OfVexsqk3tB
	 0ulkb+47h6F3jR7W1n9oleQ8J8UJV9YZHZGsnnOwHGd0NZbEWkcTRgvNevjLNmy8t0g==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1793982360;
	h=DMARC-Filter:Received:DKIM-Signature:Received:
	 X-Google-DKIM-Signature:X-Gm-Message-State:X-Gm-Gg:X-Received:
	 X-Received:Received:Message-ID:Date:MIME-Version:User-Agent:Subject:
	 To:Cc:References:Content-Language:From:In-Reply-To:Content-Type:
	 Content-Transfer-Encoding;
	bh=vbAdv7MCz2zJUTUDv7FqKwfaz+r2S2sDxgej+VGMxoc=;
	b=vdjfBONzWmc9FDGR1qoQovaNp6n7EGkHNS7847pYBRsTVqOMS6NpP/pPZMJ3HrSo85kQ
	 JAU3I+5Mp+7IVYq4rbUjAT3IbWqqFjHeXS0wQltXmNLhFisT/iTjGwl3YXEXBt6c0QblM
	 NUFAg1fr3olu6pBPAxLr82QbIVFIF2gKTOynXT+QeUGTBY7/77HMIOnm+AKG2DiP+AZ7g
	 MqqboVYo6kQT4kT41k85YBpSHTXGOLKGPbOgoC5aJvanTdGyku9aKrhhm1GL2+moHb9a3
	 2iiMkV1BLhtyUdMD17uBMfck8LsOlLuWqeFnZkXIf4MxrjI8MnjRJ+xW4hJgx/DEhgQ==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=canonical.com;
	spf=pass smtp.mailfrom=canonical.com;
	dkim=pass header.d=canonical.com header.i=@canonical.com header.a=rsa-sha256 header.s=20251003 header.b=kd5p9nZS;
	arc=none smtp.remote-ip=185.125.188.123
Received: from smtp-relay-internal-1.canonical.com (smtp-relay-internal-1.canonical.com [185.125.188.123])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id B4865606A32C
	for <devicetree@vger.kernel.org>; Fri,  6 Nov 2026 16:25:53 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org B4865606A32C
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=canonical.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=canonical.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (4096-bit key, unprotected) header.d=canonical.com header.i=@canonical.com header.a=rsa-sha256 header.s=20251003 header.b=kd5p9nZS
Received: from mail-wm1-f71.google.com (mail-wm1-f71.google.com [209.85.128.71])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
	(No client certificate requested)
	by smtp-relay-internal-1.canonical.com (Postfix) with ESMTPS id 045013FBFD
	for <devicetree@vger.kernel.org>; Fri,  6 Nov 2026 16:25:52 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=canonical.com;
	s=20251003; t=1793982352;
	bh=vbAdv7MCz2zJUTUDv7FqKwfaz+r2S2sDxgej+VGMxoc=;
	h=Message-ID:Date:MIME-Version:Subject:To:Cc:References:From:
	 In-Reply-To:Content-Type;
	b=kd5p9nZS6m9QXbQsCgnbeR3HTP9si0Xc3gxnPyaFx3ySWcliQs6Fjiy8C0achSLqa
	 /U6XYYnlIzrRXBkvKUWLMlTqJ4MYl9MK89jKcoJqhwW3SkW6y5DzSSng4RRK3DyCjS
	 +qyYRDy0O8jZC6lhhEObm3bnFBNOVHLCPIiZlvlShvNZdb0PljY60dfgRqWfAX8pN2
	 kOXbB5cSkZF3/CrT/emgPZHmPUH2V4z1nKHxNyvy3NVx+Dn9uZJVTjX2OhV+B/P02U
	 WSDHWtHhEN2jOt7XnI8sRzKW9ZonuzBZxeFr0PRqAr5b2W1BdJ2e6dSczSoU9QaraT
	 BtG6ZRI/o2o0QiFe8hA3QrhN/hFmt0rYJ0NV6yCg6O3UtD9icr1+dixDWaHrEP1i/H
	 Q61xtgm4biH4cpKJIG20ezn2N3Uj5OeTa4qL/yDuPbU+6A/NwGzoOuT4zw5FJmygEC
	 7+3juWsSn0IQ0yelMFLAhteGX7lkJqs3PaVi1VnYh6vsoY7nimnx/puuD8mAfejKPw
	 De5UW6ryHuZRVVyMDmNM8JVnu3AInjDQK76yhxp+eZGuB24BOhD9Vc1+bSguuJuu5J
	 lW9998owwbfmGrdbcnTcPyOUWyFhfuJuFkLhHPoV8Fuau9wdT2UCdE+HtTrfyhRJOX
	 UhevWA6OviFhwEOZkQW5cVkM=
Received: by mail-wm1-f71.google.com with SMTP id 5b1f17b1804b1-4a35db2d6b3so7470805e9.3
        for <devicetree@vger.kernel.org>; Fri, 06 Nov 2026 08:25:52 -0800 (PST)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1793982351; x=1794587151;
        h=content-transfer-encoding:content-type:in-reply-to:from
         :content-language:references:cc:to:subject:user-agent:mime-version
         :date:message-id:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=vbAdv7MCz2zJUTUDv7FqKwfaz+r2S2sDxgej+VGMxoc=;
        b=oChwBhhI7OTTahfmhmTf95As5ozR3kvInBnKmP2QBte4ON3TKIxC/rhMxwKwkFwM04
         5laa1hfpj5gVAxTxudBmDmDuavZuksteFVBfleuns+MLRjMVrACraoXe0DUGoT1VjAk+
         5lQQ8uk3DjounO6BWAc7yOZ3SJK8c+bCwsAFNra3XsXJI/fJfXN1PBlfA36XIKqLm/Xa
         b+XZhe/rQZVm1Cb/5wmbx+maQdGcPzZf7NGNoUrEdZIJvBsQJWzkxMDxIodfH8TJdpbt
         PPvlE43LUSem7gmKM/uXa5SB4qBgrqWnWljayD0Ct98zf05Q9/Az5UdsnF+GF46Y45UZ
         6aSA==
X-Gm-Message-State: APuU4Z8DJpzqeMNAdQy6m9+QAtfwtI4NSKbtQ/yDL2CPRPrFWNgB6L4p
	BI4xcMQn9Awo1uVRJYpeCbBZpvewV0/6EDmn8ysTZqOWNk90njsMyO+0JmKYKKpdW70MYrOFxhL
	kQ0Zp8QHPul6KeHb2gThOrKwGucM0Mjbx0/usOeWF3i1xCmjcF4rrXj4kCWkgNY6kT0LHsTD+gq
	ySlus=
X-Gm-Gg: AYBFou3Dv1VDJqfdsDdyTrYGphWPI4L8AsvJFUkma1rhWlji6t9g+HrHJ6MNnzoSV6h
	j0Jj2pk3YazjOI5PaNYUiR1+FiDXtWTCfNK7vYESOsAjvKucvaANxgXaIg3udaWZeIi1WKGy7cC
	hKxioyDPu8uaNWCB8hArW9O5XXPlaJo1enIjAcWy0WIYpbBRSPCDYm2aB6C2y6CRvg2YeZ3+BFg
	qgZ6+Lg8LPBUytd55Lz+hi9L/2jCuanEwokJ+u8RB//cxWAQKzdoQRlmNx2Sm7ipsZLTtGLAdlV
	HklE2vXGOkFOeT8hcQ+gDbA3lBio4xgCM6SwN9mYw3iGiBvdCjCYc2PEjNf3zQ2Q96x/z7XoOao
	AGyz1MXO6Ck4bpPemqrpk/YhOiH9bruZ/0vzNUeN+lTF9/IbfA0H1WByncYiQ3g9RJJlJjMmkxB
	uC
X-Received: by 2002:a05:600c:34d5:b0:4a3:59c2:b41e with SMTP id 5b1f17b1804b1-4b6dc6df61amr54605795e9.4.1793982351636;
        Fri, 06 Nov 2026 08:25:51 -0800 (PST)
X-Received: by 2002:a05:600c:34d5:b0:4a3:59c2:b41e with SMTP id 5b1f17b1804b1-4b6dc6df61amr54605455e9.4.1793982351340;
        Fri, 06 Nov 2026 08:25:51 -0800 (PST)
Received: from ?IPV6:2001:67c:1560:8007::aac:cab2? ([2001:67c:1560:8007::aac:cab2])
        by smtp.gmail.com with ESMTPSA id 5b1f17b1804b1-4b6e28cce1fsm82686435e9.15.2026.11.06.08.25.49
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Fri, 06 Nov 2026 08:25:50 -0800 (PST)
Message-ID: <79211469-cf77-414c-9a10-2b684833ad64@canonical.com>
Date: Fri, 6 Nov 2026 17:25:48 +0100
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
Subject: Re: [PATCH 3/5] riscv: dts: spacemit: k3-com260: Add SPI NOR flash
To: Troy Mitchell <troy.mitchell@linux.spacemit.com>,
 Rob Herring <robh@kernel.org>, Krzysztof Kozlowski <krzk+dt@kernel.org>,
 Conor Dooley <conor+dt@kernel.org>, Yixun Lan <dlan@kernel.org>,
 Paul Walmsley <pjw@kernel.org>, Palmer Dabbelt <palmer@dabbelt.com>,
 Albert Ou <aou@eecs.berkeley.edu>, Alexandre Ghiti <alex@ghiti.fr>
Cc: devicetree@vger.kernel.org, linux-riscv@lists.infradead.org,
 spacemit@lists.linux.dev, linux-kernel@vger.kernel.org
References: <20261105-k3-com260-module-sd-nor-mac-v1-0-138b39d74602@linux.spacemit.com>
 <20261105-k3-com260-module-sd-nor-mac-v1-3-138b39d74602@linux.spacemit.com>
Content-Language: en-US
From: Sarah Emery <sarah.emery@canonical.com>
In-Reply-To: <20261105-k3-com260-module-sd-nor-mac-v1-3-138b39d74602@linux.spacemit.com>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit

Hi Troy,

 > +			uboot@210000 {
 > +				reg = <0x210000 0x5f0000>;
 > +			};

This partition ends at 0x800000. On the CoM260 with EDK2, 0x700000 to
0x7c0000 holds the variable store (NVRAM and FTW), so reflashing this
partition from Linux would erase it.

I think we could split it like this:

    uboot@210000 {
       reg = <0x210000 0x4f0000>;
    };

    var@700000 {
       reg = <0x700000 0xc0000>;
       read-only;
    };

What do you think?

The Pico-ITX node also uses 0x5f0000, but I think it should be modified 
to split out the var part too if it makes sense here.

The Pico-ITX flash node also has vcc-supply = <&aldo2>.
Shouldn't this be present here as well?

The rest of the patch LGTM and matches what we have already tested in 
the Ubuntu kernel.

Thanks,
Sarah
