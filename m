Received: from mail-pj1-f53.google.com (mail-pj1-f53.google.com [209.85.216.53])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id C803633938A
	for <devicetree@vger.kernel.org>; Sun, 16 Aug 2026 17:22:46 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.216.53
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1786900968; cv=none; b=cNRlOXG4uzdB4TDH3hzvVRQcK5dipzHyCB7AYIX/uwcRwIx2k1mNbPczWJ+Cqgn2Gc0eQKigldb/KYsMj7doIxdDH2wVSuFPyECig8cW1m5lXYc9QENrstLWq6duXTkkTyPAQYPJzHjwNyWOvWztZyaT/KXchQ0GE0iL9/veSak=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1786900968; c=relaxed/simple;
	bh=lgumcRrJ8rwjWqiPstt94JVjeTNFgWTtkydtyZ8eNvk=;
	h=Message-ID:Date:MIME-Version:Subject:To:Cc:References:From:
	 In-Reply-To:Content-Type; b=AHdf8jdO6+Sb9TomX3dHJL6GOju9cvj99n2fx9IbUUCcsHem0coHJ1XjelVhSGbViThs8OSPw89ADvzcxQTt0Sk/TWi0Xd59kT3WwLG2WSueOsWntgL3kKZTBwPJxJ8zwuSC6RJUHfVGYRe0gv/f6bt0zVA+DdhsPz9hmcQGokA=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=nx1/1vUw; arc=none smtp.client-ip=209.85.216.53
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="nx1/1vUw"
Received: by mail-pj1-f53.google.com with SMTP id 98e67ed59e1d1-38dfe7eb825so1941208a91.0
        for <devicetree@vger.kernel.org>; Sun, 16 Aug 2026 10:22:46 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1786900966; x=1787505766; darn=vger.kernel.org;
        h=content-transfer-encoding:content-type:in-reply-to:from
         :content-language:references:cc:to:subject:user-agent:mime-version
         :date:message-id:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=TBm1Wzj4BfERzM11I76dZxF/81NgZjZU3GpBir27U1A=;
        b=nx1/1vUwlIcScEmKmb4y7SGw55tE3haYAVqX/6W5ughnqew2MtaXvhimYLby6Fqq2U
         mFGw4r44Ps595ktaaqCFwBCaRqkxRT7NAt0812Y3ToybHw+gQ9TIlLtzoRqTUhH6cv9D
         uksxIIAtJA2JQw9lXC3C1t0BlY4E9cBXOQUhlc4LaU8Cpx30etmHc9s0Mk4yql5pzDpC
         WCPisfpwfN4mPUpDrWXNTFD9VQDtnKAKcDH5sIpOu+beTFzv6nkUnhRMRpmPtzzOc3Zh
         dR5ZrE2UGy5DDQUc9EofdnNvZnyjLn6MNO42844Jr/5jhzv2SOCosjWYjgJS5OVNCbXj
         +91A==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1786900966; x=1787505766;
        h=content-transfer-encoding:content-type:in-reply-to:from
         :content-language:references:cc:to:subject:user-agent:mime-version
         :date:message-id:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=TBm1Wzj4BfERzM11I76dZxF/81NgZjZU3GpBir27U1A=;
        b=CvJDUURZVqhwsfWuBbEavrLwOBboVzmtGpHiGYnF0SPhU9UhFcKLos/IyxZwxvih+N
         yen0csYhYe8pt2yGaZQbFk3UDkthSz0rKeiULehm2IuwFOrsQtqkolBjLX42+EuBgOaO
         SsDN0KUvz5+2Q8slcNFxTu2q2lir5KmR07aroY3m8NIRz6p1uMRXEimD4XIHA5gJHd10
         vRQ7csDOYn9Ci2dYD00CeF0ImiVuBv5xjn3ckdjfMzib9K/45GPH3n9zOLAcrd4T+srU
         stPTvyXDFptiVL6yM2ARM7hfWYgJTf8YSzCsPRrwIK6Xf6Py55ycp87w6te3dDwyfGIP
         qX9Q==
X-Forwarded-Encrypted: i=1; AHgh+RoIrP7FGKfAca84DgUcVBE+Mc82l00nVH2zO+TF6cjJHgdOOd06LLKCZEePykjF/APoAV6+osd6oEfp@vger.kernel.org
X-Gm-Message-State: AOJu0Yz1L4NQzV9xyEDfJE8a6hzZibdppcBQovV5T1WL9tHda/1cT1Dm
	QpVqPwrw/QLVyXDmHbhpO+ifmyyhCJUSR2YzQum9GWaUH+7NHv/8Vbad
X-Gm-Gg: AR+sD13xmQBDcO5l+HPY/V3d7N0l1NMCQ2JkBRsHttvTRFP1+M33A68aMkD8LXiJSMV
	Lx0/pAutAjGnMHK8CC06WgrC5GUKl3SglyWEA5BwdtlzD64NLkJeO/ALozPfhkQghewI9wBA4/g
	VFIwxoFV1OUmSy+fAytkflwPYwv5seHfAqCAQM8IMZydzrMJs4oWblhLcreQYGzC0aiMWkP2l5C
	EMxCZ/EqMxQtJz2VW5z5GUurQq6P7vy5MVoKQHIhEFF6/309SNVdmhG4JvAeOyYyOlABoAP6ZcA
	i55e27icxfEDJ/DLrwmWsYm3vCiQpFM/tEraTkExYtz/HEt/Iso456//UArA8HbUrXNVpJ6tZ6L
	Z36Zde8dXc2kdzYJa2LCjlPF+5x2cX6ZpfXGPPx3DK1EOYobn9LDWd+Kqcj+anop/cXxwma15ho
	GgwTS5i83D3PAUsUa1NLBxbyBgpATYrIl4cVLR2xoJtHqQB2NwOkgeLjiYIITixBDX13D1v8CE5
	0bZ6HvPbTSqF1dpz93uAXZoses+OUnncAwaThY=
X-Received: by 2002:a17:90b:3c91:b0:380:f85c:94b4 with SMTP id 98e67ed59e1d1-3933b78e3c2mr21847371a91.7.1786900966082;
        Sun, 16 Aug 2026 10:22:46 -0700 (PDT)
Received: from ?IPV6:2406:7400:56:e503:403c:f88f:3e17:55ae? ([2406:7400:56:e503:403c:f88f:3e17:55ae])
        by smtp.gmail.com with ESMTPSA id 5a478bee46e88-320e9df03f9sm28351382eec.19.2026.08.16.10.22.40
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Sun, 16 Aug 2026 10:22:45 -0700 (PDT)
Message-ID: <fd81d0ce-46d4-4655-aebf-1387e5b030b6@gmail.com>
Date: Sun, 16 Aug 2026 22:52:35 +0530
Precedence: bulk
X-Mailing-List: devicetree@vger.kernel.org
List-Id: <devicetree.vger.kernel.org>
List-Subscribe: <mailto:devicetree+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:devicetree+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v2 1/2] ARM: dts: ti: keystone-k2l: Rename
 ti,davinci-spi-num-cs to num-cs
To: Bhargav Joshi <j.bhargav.u@gmail.com>, Mark Brown <broonie@kernel.org>,
 Rob Herring <robh@kernel.org>, Krzysztof Kozlowski <krzk+dt@kernel.org>,
 Conor Dooley <conor+dt@kernel.org>, Bartosz Golaszewski <brgl@kernel.org>,
 Nishanth Menon <nm@ti.com>, Santosh Shilimkar <ssantosh@kernel.org>
Cc: linux-spi@vger.kernel.org, devicetree@vger.kernel.org,
 linux-kernel@vger.kernel.org, linux-arm-kernel@lists.infradead.org,
 m-chawdhry@ti.com, daniel.baluta@gmail.com, simona.toaca@nxp.com
References: <20260816-ti-davinci-spi-v2-0-6c6f5171422b@gmail.com>
 <20260816-ti-davinci-spi-v2-1-6c6f5171422b@gmail.com>
Content-Language: en-US
From: Dhruva G <goledhruva@gmail.com>
In-Reply-To: <20260816-ti-davinci-spi-v2-1-6c6f5171422b@gmail.com>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit

On 16-08-2026 03:53, Bhargav Joshi wrote:
> Property ti,davinci-spi-num-cs is present in the SPI
> nodes of keystone-k2l.dtsi, but it has never been documented in the
> bindings or matched by driver. Driver relies on standard num-cs
> property instead. Use standard property num-cs instad of
> davinci-spi-num-cs.
> 
> Signed-off-by: Bhargav Joshi <j.bhargav.u@gmail.com>
> ---

Reviewed-by: Dhruva Gole <goledhruva@gmail.com>

>  arch/arm/boot/dts/ti/keystone/keystone-k2l.dtsi | 6 +++---
>  1 file changed, 3 insertions(+), 3 deletions(-)
> 
> diff --git a/arch/arm/boot/dts/ti/keystone/keystone-k2l.dtsi b/arch/arm/boot/dts/ti/keystone/keystone-k2l.dtsi
> index 330b437b667f..39a846d7f8a4 100644
> --- a/arch/arm/boot/dts/ti/keystone/keystone-k2l.dtsi
> +++ b/arch/arm/boot/dts/ti/keystone/keystone-k2l.dtsi
> @@ -401,15 +401,15 @@ mdio: mdio@26200f00 {
>  };
>  
>  &spi0 {
> -       ti,davinci-spi-num-cs = <5>;
> +	num-cs = <5>;
>  };
>  
>  &spi1 {
> -       ti,davinci-spi-num-cs = <3>;
> +	num-cs = <3>;
>  };
>  
>  &spi2 {
> -       ti,davinci-spi-num-cs = <5>;
> +	num-cs = <5>;
>         /* Pin muxed. Enabled and configured by Bootloader */
>         status = "disabled";
>  };
> 

