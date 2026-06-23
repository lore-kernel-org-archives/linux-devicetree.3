Received: from mail-wm1-f54.google.com (mail-wm1-f54.google.com [209.85.128.54])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 8C6C930D3EB
	for <devicetree@vger.kernel.org>; Tue, 23 Jun 2026 16:10:18 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.128.54
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1782231019; cv=none; b=JBl7RKScD7yofEgYFkxnREN4hQo/D09Tf8RwDNnFOSGPnHbafMOO9wiMnBcgFU69uEZbd4vyQVj1kzvTb888/6pqIU3mfX5BMNsM6Q11IhS2Z/CvwD0Hs69QOpkXD+VTqWZGaau4mfYB442TZS1ii0Io8Gu464iksvKwQxzvx+A=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1782231019; c=relaxed/simple;
	bh=vmkeJhQtJt96i4XbpAtqOBYm0D3OoH3GxeWDRmVKlNk=;
	h=Message-ID:Date:MIME-Version:Subject:To:Cc:References:From:
	 In-Reply-To:Content-Type; b=gommBTvCzixCQQfcrwzBVANQxtfGgMjwItpXsFQT6WzF9SMFpMYMwG5jkSZ6OAbH12wn86Nl75UgyLBM5/hyj/IeXf5DoBMhIeXEigoL7tcN1HWkV9p7+ZbFk80Kwxh1WnKeKBpINVjWvOldTAzCFhAoZKuFhaKafGz+c4OfKOs=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=EXzlyHi1; arc=none smtp.client-ip=209.85.128.54
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="EXzlyHi1"
Received: by mail-wm1-f54.google.com with SMTP id 5b1f17b1804b1-49241dbf9c1so422135e9.2
        for <devicetree@vger.kernel.org>; Tue, 23 Jun 2026 09:10:18 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1782231017; x=1782835817; darn=vger.kernel.org;
        h=content-transfer-encoding:in-reply-to:from:content-language
         :references:cc:to:subject:user-agent:mime-version:date:message-id
         :sender:from:to:cc:subject:date:message-id:reply-to;
        bh=87UCq5kht4kVk554m6yLxJyrr/TZGMMBzoXy/EG2byU=;
        b=EXzlyHi1KP1boEdjxJ602Sghexe+GaY39PlGia3jTuoeuv7O0fuYvPkXyeB2Bw3TBu
         x9AmLL28KwNfMdKS71CJ/mu4M0hTDusVrBFwY1hiKSw5y+UObooLrbvspFPVLyaySWzv
         wYI9cqpnnm3BevC0s2BwxoPzvM9Q+LWSGyH5Q7Ji1QMOIlXACpLcPd916cCf5YsfTnnp
         cHFcaswa1h12LO9H63NtDbNz9P2TRWWwO93rY3uOavEoh9eo3h/ZxC2e37UMVi1926IP
         M0dYOT3suJRKUm6ydB71nZ4XMq/k7Hp2OuU8X3fzxP2fiqBGUPJGnzaBzggMJ8UhfYLz
         LZMg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1782231017; x=1782835817;
        h=content-transfer-encoding:in-reply-to:from:content-language
         :references:cc:to:subject:user-agent:mime-version:date:message-id
         :sender:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=87UCq5kht4kVk554m6yLxJyrr/TZGMMBzoXy/EG2byU=;
        b=m8J6MZzgCTMXuzWQ70yKhm3FNcCxgEYWZ9/ww1aImMarc8Ew6FGoKbs6JJo27d3mWN
         0CfM/OVVClNQ8EFnsF3F0b4zJ0gNz2OapQzUvhjUyCw8a/FLlOjhWZfUo6QBVCVG7snD
         5sL8T3aNXW/Hm0ZLJPLEboM5v4wEDFCHnwpjCiWTjdza9sbRBTdFUHgZIKFk6E+lMpzt
         LX7MfJdI8WEsz9xsJxW4Pk31yjLRmQGz2lXGzJWtFT/OigmZk5v6libYf6GGLaMAY9Fx
         dEoH4QKnyDlQVrSAL3QM4ws2lXBirL56pNgVfBSLiDFNbhn4uqv4qK/5c0QyLRvv7dqf
         WH0A==
X-Forwarded-Encrypted: i=1; AFNElJ/TmCTVyDsw3cY36CxzRxYIwHPd1t1H7yUESdI9X33x/U+b8widwiU+rNQPfZbu1rhAZbFwPmxK3WU8@vger.kernel.org
X-Gm-Message-State: AOJu0Ywc/YxL1M43r+P4zPHwHf3sThjI/QFSzZZhIegIXuefQL1biE3X
	k5bDzi9bRtXHbv7i7yWWAMhN0qwBrc/KKeB0MId1fNlFNeuhcQLsbDhQ
X-Gm-Gg: AfdE7clz+6BIwpb/UNkRIhNMix3AT6s9QwMjZlRWKkMSbbXKjwW20lYqQLxTgGATP7w
	ndjhUZf2331J3gIRvXB4qlgB0LkeMfk1/w5+ycMbe281ccYKBe9VYP891emcJhlisEK+nHbVsy8
	D8G5VLrXJW2PFAe3hZx5xQM0IiWcIQKkxYIMoSsqKdoTVcfXRcfql9sdodJ51+47UjmJpL/m/W3
	J9iZYa/ARKl8x2hgPkzJ1Kqm/VBjsnk0skkFOd9CPFSlTTexXomIFLAT29O9ZT2mBKKcIH0en+B
	EtoK4yz3qkFG2CiMiZ+t6CXLIVvEaEusiGJ11wUsnW1S2acLYelg2rer8qwCNlil9oNtRnl3HCs
	d7fKlqeDFYZWiFSh4vDMw941lkT0hW2p4BmLF7yBVhTDsG0w42lgBL+2bi6GtbXDcXrmIM5Rs2x
	pvWoS241Jxsfn4A8621QZBpnEfvR7S/KCg3fqFhSs0deb1bwNAmzdy11190q5ba8oNC5A/O/+FN
	djBYBt2
X-Received: by 2002:a05:600c:c3ce:20b0:490:b294:c652 with SMTP id 5b1f17b1804b1-49240e85c12mr251094265e9.20.1782231016586;
        Tue, 23 Jun 2026 09:10:16 -0700 (PDT)
Received: from [10.128.11.131] (195-23-151-163.net.novis.pt. [195.23.151.163])
        by smtp.gmail.com with ESMTPSA id 5b1f17b1804b1-4923ff8a712sm358628315e9.13.2026.06.23.09.10.15
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Tue, 23 Jun 2026 09:10:15 -0700 (PDT)
Sender: Julian Braha <julian.braha@gmail.com>
Message-ID: <a4af663b-b559-4ca7-a0da-84f9c57861db@gmail.com>
Date: Tue, 23 Jun 2026 17:10:14 +0100
Precedence: bulk
X-Mailing-List: devicetree@vger.kernel.org
List-Id: <devicetree.vger.kernel.org>
List-Subscribe: <mailto:devicetree+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:devicetree+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v14 4/4] crypto: spacc - Add SPAcc Kconfig and Makefile
To: Pavitrakumar Managutte <pavitrakumarm@vayavyalabs.com>,
 linux-crypto@vger.kernel.org, linux-kernel@vger.kernel.org,
 devicetree@vger.kernel.org, herbert@gondor.apana.org.au, robh@kernel.org
Cc: krzk@kernel.org, conor+dt@kernel.org, Ruud.Derwig@synopsys.com,
 rbannerm@synopsys.com, manjunath.hadli@vayavyalabs.com,
 adityak@vayavyalabs.com, navami.telsang@vayavyalabs.com,
 bhoomikak@vayavyalabs.com
References: <20260619144558.1868995-1-pavitrakumarm@vayavyalabs.com>
 <20260619144558.1868995-5-pavitrakumarm@vayavyalabs.com>
Content-Language: en-US
From: Julian Braha <julianbraha@gmail.com>
In-Reply-To: <20260619144558.1868995-5-pavitrakumarm@vayavyalabs.com>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit

Hi Pavitrakumar,

On 6/19/26 15:45, Pavitrakumar Managutte wrote:

> diff --git a/drivers/crypto/dwc-spacc/Kconfig b/drivers/crypto/dwc-spacc/Kconfig
> new file mode 100644
> index 0000000000000..b253f8dc539c1
> --- /dev/null
> +++ b/drivers/crypto/dwc-spacc/Kconfig
> @@ -0,0 +1,87 @@
> +# SPDX-License-Identifier: GPL-2.0-only
> +
> +config CRYPTO_DEV_SPACC
> +	tristate "Support for dwc_spacc Security Protocol Accelerator"
> +	depends on HAS_DMA
> +	select CRYPTO_ENGINE
> +	default n
> +
> +	help
> +	  This enables support for SPAcc Hardware Accelerator.
> +
> +config CRYPTO_DEV_SPACC_HASH
> +	bool "Enable HASH functionality"
> +	depends on CRYPTO_DEV_SPACC
> +	default y
> +	select CRYPTO_HASH
> +	select CRYPTO_SHA1
> +	select CRYPTO_MD5
> +	select CRYPTO_SHA256
> +	select CRYPTO_SHA512
> +	select CRYPTO_HMAC
> +	select CRYPTO_SM3
> +	select CRYPTO_CMAC
> +	select CRYPTO_XCBC
> +	select CRYPTO_AES
> +	select CRYPTO_SM4_GENERIC
> +
> +	help
> +	  Say y to enable Hash functionality of SPAcc.
> +
> +config CRYPTO_DEV_SPACC_AUTODETECT
> +	bool "Enable Autodetect functionality"
> +	depends on CRYPTO_DEV_SPACC
> +	default y
> +	help
> +	  Say y to enable Autodetect functionality of SPAcc.
> +
> +config CRYPTO_DEV_SPACC_DEBUG_TRACE_IO
> +	bool "Enable Trace MMIO reads/writes stats"
> +	depends on CRYPTO_DEV_SPACC
> +	default n
> +	help
> +	  Say y to enable Trace MMIO reads/writes stats.
> +	  To Debug and trace IO register read/write oprations.
> +
> +config CRYPTO_DEV_SPACC_DEBUG_TRACE_DDT
> +	bool "Enable Trace DDT entries stats"
> +	default n
> +	depends on CRYPTO_DEV_SPACC
> +	help
> +	  Say y to enable Enable DDT entry stats.
> +	  To Debug and trace DDT opration
> +
> +config CRYPTO_DEV_SPACC_SECURE_MODE
> +	bool "Enable Spacc secure mode stats"
> +	default n
> +	depends on CRYPTO_DEV_SPACC
> +	help
> +	  Say y to enable SPAcc secure modes stats.
> +
> +config CRYPTO_DEV_SPACC_PRIORITY
> +	int "VSPACC priority value"
> +	depends on CRYPTO_DEV_SPACC
> +	range 0 15
> +	default 1
> +	help
> +	  Default arbitration priority weight for this Virtual SPAcc instance.
> +	  Hardware resets this to 1. Higher values means higher priority.
> +
> +config CRYPTO_DEV_SPACC_INTERNAL_COUNTER
> +	int "SPAcc internal counter value"
> +	depends on CRYPTO_DEV_SPACC
> +	range 100000 1048575
> +	default 100000
> +	help
> +	  This value configures a hardware watchdog counter in the SPAcc engine.
> +	  The counter starts ticking when a completed cryptographic job is
> +	  sitting in the STATUS FIFO. If the job remains unprocessed for the
> +	  configured duration, an interrupt is triggered to ensure it is serviced.
> +
> +config CRYPTO_DEV_SPACC_CONFIG_DEBUG
> +	bool "Enable SPAcc debug logs"
> +	default n
> +	depends on CRYPTO_DEV_SPACC
Just a kconfig style thing, it would be a bit cleaner to factor out the
repeated 'depends on CRYPTO_DEV_SPACC' by wrapping the options
in:
`if CRYPTO_DEV_SPACC .. endif`

- Julian Braha
