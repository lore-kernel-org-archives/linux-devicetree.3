Received: from mail-wr1-f49.google.com (mail-wr1-f49.google.com [209.85.221.49])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 6B5D83F7875
	for <devicetree@vger.kernel.org>; Mon, 15 Jun 2026 14:27:07 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.221.49
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1781533628; cv=none; b=uQmncb52wEL4nNawOqBnNm5xZQJKvMD6gThSesND3AkBoG8yAlq1X5SV9N/ZNXZFDDAh/oKSQV67Zj6OmxrlpHPhGfVKTEsQbNA+DYKxk8S5C8Edr7O7WUJj2crMCAaVWWm9JafaRIEE8zlQqVC+rHRhPTwCu5x1Sc1yJMqAgWM=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1781533628; c=relaxed/simple;
	bh=j7+uubWqjHwfd1F7rjwIRnsarTP5b9XzajE97ofcr2w=;
	h=Message-ID:Date:MIME-Version:Subject:To:Cc:References:From:
	 In-Reply-To:Content-Type; b=i7UjPrF93OZP68WSU1lc+U/kaxpI+q9EJjRhecinyor74z9vH2jB0HELxYeMa88WmjxpOYgYdTlTSoh551XvcdFW5gvOIzx+X0hO7qEmv82Z9k6BWRebqr2W0I8llCUF/QpMmM3HRZOvM6KWI6NOtoC4wOrf0432qJKZGjNdG2I=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=ivOvFk7v; arc=none smtp.client-ip=209.85.221.49
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="ivOvFk7v"
Received: by mail-wr1-f49.google.com with SMTP id ffacd0b85a97d-460662fcb4eso2291018f8f.0
        for <devicetree@vger.kernel.org>; Mon, 15 Jun 2026 07:27:07 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1781533626; x=1782138426; darn=vger.kernel.org;
        h=content-transfer-encoding:in-reply-to:from:content-language
         :references:cc:to:subject:user-agent:mime-version:date:message-id
         :sender:from:to:cc:subject:date:message-id:reply-to;
        bh=m4TXTtdFs/UmLl+HYnmyNiKISILvfZx2SzEmdXfYHcQ=;
        b=ivOvFk7vOkZBbOFiKdbZF59WTRWUON7NhJvMeWXVYQYGBAojB8h32ET3YxgwrORAIE
         jMcOp2cBOqsWe+R7alJErluOjvefaane1lGSLQb1t+J7hdRXJgKi297mhQs/nT75OlZx
         7Dg3cjzYHgoGWBeGrHwtfcXVFzWVzE2bhVeHQ0NUWcLNPAgjYN69OKMDwmMvIcWqy8MD
         wpoXZho3dWV9jSAYxi7TbujpSj3l8Qr4/ObmkKcf2fubdiwhBK4eMJawiEqRhBv8YeHA
         mdIMfhLZXMvSR9z/Nfqr0ILomuuIzmnIfWnHPqpB/oh3yf+3yL8b7h7R8hK86a1u9YX9
         HkZA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1781533626; x=1782138426;
        h=content-transfer-encoding:in-reply-to:from:content-language
         :references:cc:to:subject:user-agent:mime-version:date:message-id
         :sender:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=m4TXTtdFs/UmLl+HYnmyNiKISILvfZx2SzEmdXfYHcQ=;
        b=CZJcFXJi+2L/aHloRz9oKiJTfpVWZFQS8IeJWh0CR2V3EtQRcysJmtOGmRHiTL4zHU
         nABf9Er3Bh2SFZrPTDNdqEsAu28Kaj/Jyml6lHde3QGDb+X6gPfYFgP3Y1kuzq4mvOF/
         rcW3Smwy0buqDhzCw1nkT05BUQLsUXOe4MPZW4LrmAGgiuu3oFROQFWfNLSLRTphzJ4C
         q5+ttdyDQ3MnjusfFKJxFgQ2U+z6L5Z169AdLkJ1zr7Ns4ifUsD42QOXKjl2FN7zJe3n
         GWP4BEes+q7lWu3wDdzCQU9LwJIFhp4OIL6sU9LG68HEG4EtsDKoXNn/YF1HRK2RuSVm
         1Oyw==
X-Forwarded-Encrypted: i=1; AFNElJ/girZ43wHe/vtJsZfFl9CEM3w0yVBk4CNblCJRzwyxyIWNOXjY2N8egcFb3FZ5mDghTEdjucg7aEsj@vger.kernel.org
X-Gm-Message-State: AOJu0Yw11edECBtYfhymrywSDpBNRLrJGTVuoGcaV6Yhcc2f9zrFMySk
	gqxQZ02jzXsewxzD5DG296mG94TnANSOptbDdh2b+C+0ZGAAHhv6pZdJ
X-Gm-Gg: Acq92OEaR8YjJ+kbb8v48/zQ8Eilpl0lfYcmU6Q/khaBsdgei/sm6a9STkF2nWfXXXd
	8EGwwtp8NGzg1D63RZ29Cltt55Am/CpqGvqhenGtpdjGV7vno4YAgN0P+KGQrX9nIItbuM4w/wC
	p4UyDu0hK8wo6l88bjxfTWUAuPkoOH/PDEZZsEi+RffH7CZutZmR3lbhI3cCElOWl5kvtwIQE9G
	kZj0WVWh8UgRetiw15b6y+XaaJNjY+YOGRG15mwOzF924zDySrx7aMTQFvxS1LZqTDoMCPlRNde
	o1rSF6FF97d9zjBdCZkvz9Q2YgnJDtxrxc5z0Vz8uS9bdywQx2gVmxAOWYB4yKo9siJXKx12Pat
	r2uVZ57D420CetEFORG4U5CatxXG0yIz+WnkoP600RNJkPk8cr5iRFp34cbgGvkbE+8uN1vUqv/
	sMidhvEbDstJZI0dfiglAkGHNycEbLvmtylyH+QPhv4xP9E7j3vRJitU3fRVk4xFdYa8Do10j0b
	E8JMr2Ti3gLL7oX39Y=
X-Received: by 2002:a05:6000:2dc2:b0:460:3234:4473 with SMTP id ffacd0b85a97d-4606dbe5c27mr19933766f8f.41.1781533625617;
        Mon, 15 Jun 2026 07:27:05 -0700 (PDT)
Received: from [10.128.10.215] (195-23-151-163.net.novis.pt. [195.23.151.163])
        by smtp.gmail.com with ESMTPSA id ffacd0b85a97d-4606f264333sm35600275f8f.4.2026.06.15.07.27.04
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Mon, 15 Jun 2026 07:27:05 -0700 (PDT)
Sender: Julian Braha <julian.braha@gmail.com>
Message-ID: <90f84945-e83f-40a8-8d9e-a477c45579e9@gmail.com>
Date: Mon, 15 Jun 2026 15:27:03 +0100
Precedence: bulk
X-Mailing-List: devicetree@vger.kernel.org
List-Id: <devicetree.vger.kernel.org>
List-Subscribe: <mailto:devicetree+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:devicetree+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH net-next v5 12/15] onsemi: s2500: Add driver support for
 TS2500 MAC-PHY
To: Selvamani.Rajagopal@onsemi.com, Andrew Lunn <andrew@lunn.ch>,
 Piergiorgio Beruto <pier.beruto@onsemi.com>,
 Heiner Kallweit <hkallweit1@gmail.com>, Russell King
 <linux@armlinux.org.uk>, "David S. Miller" <davem@davemloft.net>,
 Eric Dumazet <edumazet@google.com>, Jakub Kicinski <kuba@kernel.org>,
 Paolo Abeni <pabeni@redhat.com>, Andrew Lunn <andrew+netdev@lunn.ch>,
 Parthiban Veerasooran <parthiban.veerasooran@microchip.com>,
 Richard Cochran <richardcochran@gmail.com>, Rob Herring <robh@kernel.org>,
 Krzysztof Kozlowski <krzk+dt@kernel.org>, Conor Dooley
 <conor+dt@kernel.org>, Simon Horman <horms@kernel.org>,
 Jonathan Corbet <corbet@lwn.net>, Shuah Khan <skhan@linuxfoundation.org>
Cc: netdev@vger.kernel.org, linux-kernel@vger.kernel.org,
 devicetree@vger.kernel.org, linux-doc@vger.kernel.org,
 Jerry Ray <jerry.ray@microchip.com>
References: <20260614-s2500-mac-phy-support-v5-0-89874b72f725@onsemi.com>
 <20260614-s2500-mac-phy-support-v5-12-89874b72f725@onsemi.com>
Content-Language: en-US
From: Julian Braha <julianbraha@gmail.com>
In-Reply-To: <20260614-s2500-mac-phy-support-v5-12-89874b72f725@onsemi.com>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit

Hi Selvamani,

On 6/14/26 18:00, Selvamani Rajagopal via B4 Relay wrote:

> diff --git a/drivers/net/ethernet/onsemi/Kconfig b/drivers/net/ethernet/onsemi/Kconfig
> new file mode 100644
> index 000000000000..8d72194151ea
> --- /dev/null
> +++ b/drivers/net/ethernet/onsemi/Kconfig
> @@ -0,0 +1,21 @@
> +# SPDX-License-Identifier: GPL-2.0-only
> +#
> +# onsemi network device configuration
> +#
> +
> +config NET_VENDOR_ONSEMI
> +	bool "onsemi network devices"
> +	help
> +	  If you have a network card belonging to this class, say Y.
> +
> +	  Note that the answer to this question doesn't directly affect the
> +	  kernel: saying N will just cause the configurator to skip all
> +	  the questions about onsemi ethernet devices. If you say Y, you
> +	  will be asked for your specific card in the following questions.
> +
> +if NET_VENDOR_ONSEMI
> +
> +source "drivers/net/ethernet/onsemi/s2500/Kconfig"
> +
> +endif # NET_VENDOR_ONSEMI

When you put the 'if NET_VENDOR_ONSEMI' around the 'source', you're
making it a dependency on every config option in that sourced Kconfig.

> diff --git a/drivers/net/ethernet/onsemi/s2500/Kconfig b/drivers/net/ethernet/onsemi/s2500/Kconfig
> new file mode 100644
> index 000000000000..f2e8d5d1429d
> --- /dev/null
> +++ b/drivers/net/ethernet/onsemi/s2500/Kconfig
> @@ -0,0 +1,21 @@
> +# SPDX-License-Identifier: GPL-2.0-only
> +#
> +# onsemi S2500 Driver Support
> +#
> +
> +if NET_VENDOR_ONSEMI
> +
> +config S2500_MACPHY
> +	tristate "S2500 support"
> +	depends on SPI
> +	select NCN26000_PHY
> +	select OA_TC6
> +	help
> +	  Support for the onsemi TS2500 MACPHY Ethernet chip.
> +	  It works under the framework that conform to OPEN Alliance
> +	  10BASE-T1x Serial Interface specification.
> +
> +	  To compile this driver as a module, choose M here. The module will be
> +	  called s2500.
> +
> +endif # NET_VENDOR_ONSEMI
Which means that when you add 'if NET_VENDOR_ONSEMI' again inside the
sourced Kconfig, it's a duplicate dependency.

I think putting the if-endif in either place is fine, but it's redundant
to do it twice. You could maybe consider using a comment for the second
instance instead.

- Julian Braha
