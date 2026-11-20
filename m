Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=209.85.208.53
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1795219039;
	b=xSZhQzmhnm8paud/apHJ0pS9bKmaLAv3iUtIEa2hdvC0W9/0NMK7mw1BdIBg9XPMnsag
	 UKoePMNN9GzNn7J63hCPw0K/1wPo3QYK2VSQZEeMI+wUGMzIQjjVFhATsXQJJqoH9Rb7T
	 h73J47RY3Z4X7wNqBZLdapcvlTo8YKqrArjoA/nHpiJ7lqDMIQH1fwtjy1e/pQS1WCIYt
	 fpIIBvYODEcLSle6S4nY0olLv7soU/gA7mTeKUfoWDnB6b5T9dlTuFQQOcaZPvkvu+Rs6
	 gio6nDOMRiE1n8C1WDKKCoZX3FLBbWgX+hLcdfoeuqW2cNLq7vqYSMLFZKm3S762lHQ==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1795219039;
	h=DMARC-Filter:Received:DKIM-Signature:X-Google-DKIM-Signature:
	 X-Forwarded-Encrypted:X-Gm-Message-State:X-Gm-Gg:X-Received:Received:
	 From:To:Cc:Subject:Date:Message-ID:X-Mailer:In-Reply-To:References:
	 MIME-Version:Content-Transfer-Encoding;
	bh=X3mXOkI3k7kIPSGugcamISGGNj/Giv2jwZLbdDbAlpU=;
	b=Z48qapfw4k6LsOJ2IxfCbxfXHHdg0/nytHJUmfWrryEqD0ut4rg41E9GPAOgDGkfGkNw
	 lsZ5eQ2MjftPcdf6zSbgP/ZrRe+hMbnmId874g59yLjVHnZXofbmHRknfBATx7I6LFW0D
	 i6Lu4vPA7xh+ZT0HlzUlNnge7X8XjR/fDrAuFrkg0zoDbHPsxCtI8qZuItIDSdt+p+vhi
	 TbpTTzX41YKqpbAcoRGsqNx5Mc/DOXP3zFk5rEJDdfEgJ4YMYGm4z+aso3yFVS7rzRzJ0
	 rvS1vEuLjsirqNSjoRHuzc8a9Uq39wN8Hxax7q9DomAaWZ9SKk1HecuiNe/m9jA9aiQ==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=gmail.com;
	spf=pass smtp.mailfrom=gmail.com;
	dkim=pass header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20260707 header.b=nPXSKvd3;
	arc=none smtp.remote-ip=209.85.208.53
Received: from mail-ed1-f53.google.com (mail-ed1-f53.google.com [209.85.208.53])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id CA73B606A690
	for <devicetree@vger.kernel.org>; Fri, 20 Nov 2026 23:57:16 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org CA73B606A690
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20260707 header.b=nPXSKvd3
Received: by mail-ed1-f53.google.com with SMTP id 4fb4d7f45d1cf-6b87a240de3so1764607a12.1
        for <devicetree@vger.kernel.org>; Fri, 20 Nov 2026 15:57:16 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20260707; t=1795219035; x=1795823835; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=X3mXOkI3k7kIPSGugcamISGGNj/Giv2jwZLbdDbAlpU=;
        b=nPXSKvd32puPmNXHYT8aQQ7Blbg0fhFbgg5i8Ksv0Oa6bBoAjlzOB3ZlwmRyOrmLyV
         XW0x/JKX68ubIULq35M2dLL0N+hsz51DO2XBd/4SL6HEDULkDJBGQKfawDS+dZ64CDgY
         +yd36+SytCOcajVrEae35Dqrlyt2MU8RVP6YppEYrL5W81v9MxMiD79xfoSITT+J2qWJ
         LqxZlumwUp2bJEXI+OD5judK39yrQ4lChkuwY6P0R/mOwpCrhS1gLPzK91dkoWuOB4gE
         YRd/DCcU1UU33db6BVW6S4/VktrDj/cyxMa6opdUOf3POojidtgCF8JBbFRTXgjS7aB5
         h6QQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1795219035; x=1795823835;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to:content-type;
        bh=X3mXOkI3k7kIPSGugcamISGGNj/Giv2jwZLbdDbAlpU=;
        b=kOieZdyF2/du9QM1drifvWTEdnK2omC51O0uPQwcMCLea8mte/1A9m2U9IGMHEPID6
         bzNmEnNNeYN3PPNlBv4BcMW0utcbbYUS0HfxaO7OfU5ZeIAm/hk3m8MU+uDgiRzQF7Wf
         FBLuk5m1r0mCBDJld+i1TbB4bHpAMg6hJZUOilO1zYsANmEb+k9bKwpNhnVaKpbFnUqI
         o8wW+EcPp1GVjz71shxJibM0RzZjQywaFFzxFiRVYOwVQ7IJWNLI8C7fUeqHmSBTTURO
         biFQTXUv9+V8R4t2Nn5haMO1PvBN7cAdMpXSJ3BRx3iKD9aXi9mXS9Lc43a180Jr7vmr
         J5PQ==
X-Forwarded-Encrypted: i=1; AL+hErG6201SKEMpKZCvPfdMQ3YH9Q/f5an20c4RHqBU7mKrE3EEXcn5Iw/klw0rztb2HdtHSLe5VBs6Ycth@vger.kernel.org
X-Gm-Message-State: APuU4Z9hx29gKJynYCCCN6Ym7iARerNwFdzv3BmEKcmFHccVB9GmIN/W
	SjXti8JrJXpm+rD/647p3l0I0BytLMwBDbXPSQ4hEECHYbvwJcIuzsM=
X-Gm-Gg: AZFdTZelGAIJG5DJFa5KSb17zzxo48xmQeY8p12mb/licBmNYDa4RzInuFIMze9OALW
	soiyf7Kv6vGxTQAdRvhvkTjycmmNoXyPSZFFmE0UmFNpYEWnvpCUTt8hqoN6jNbvM2BlN4RWbEv
	edV7Mlh91Pn8QiOilgKfOlJPX6bW0yY7aDtOsmtwgd5EWFAFt9gLPg4hMVArbIhOB7Wh5BoGgln
	ZH9wWO1tr+Wvw7wvUjdep/cA2qVYndOa2N1u5Rbfbl49wpQkxcVqFED69KJo9M3edjua96W0XjP
	SDZxsQi+8dm+WND/bK/FHViSKxT2ZC5jOYFsp5tF3Lhqrj+YOmgqSo9E55GRAz4MzcqArRcCfBz
	qCsdIbRVu/u6ZXz4Jk13eDOmRnU4ZNHTgllRAEgLLuj17YOZqUoLG6k+ewtfube2aE2Soowdfv/
	7uraLuOoPvC06WkKvxKwuQRx41h3e6KfOfGo5LRIAgcoU4o7OlaJwNMdPCDE2xmrltFKAmhc90P
	6fivdAzdZQeZyWS4/Gx28a2CpGQBl2Du15fVvIvXREFgENdF2j62OPuRbMFZHxycbxw+um+uvvI
	7lOw23+ijLHTg3R8PqNdZe5oq363cThBQ5VxqVt6hzeswFixxlHv0FeZX5JMwLVnL02ckJtEbAh
	T35O4zccXkpe7TGdWGMrn7dIM
X-Received: by 2002:a05:6402:1d4b:b0:6b5:646b:2c39 with SMTP id 4fb4d7f45d1cf-6ba37e8e238mr3343517a12.30.1795219035131;
        Fri, 20 Nov 2026 15:57:15 -0800 (PST)
Received: from sohrab-omarchy.fritz.box (2a02-a44e-4ae7-1-c0e-6d5a-8ae2-915.fixed6.kpn.net. [2a02:a44e:4ae7:1:c0e:6d5a:8ae2:915])
        by smtp.gmail.com with ESMTPSA id 4fb4d7f45d1cf-6ba370e78a7sm1665428a12.16.2026.11.20.15.57.13
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 20 Nov 2026 15:57:14 -0800 (PST)
From: Majid Hajiheidari <majidhhdri@gmail.com>
To: Dmitry Torokhov <dmitry.torokhov@gmail.com>,
	Vsevolod Nevorotov <sevanevorotov29@gmail.com>
Cc: Rob Herring <robh@kernel.org>,
	Krzysztof Kozlowski <krzk+dt@kernel.org>,
	Conor Dooley <conor+dt@kernel.org>,
	Henrik Rydberg <rydberg@bitmath.org>,
	Frieder Hannenheim <git@fhannenheim.net>,
	linux-input@vger.kernel.org,
	devicetree@vger.kernel.org,
	linux-kernel@vger.kernel.org
Subject: Re: [PATCH v2 2/2] Input: synaptics_tcm_i2c - add Synaptics TouchComm I2C touchscreen driver
Date: Sat, 21 Nov 2026 00:57:12 +0100
Message-ID: <20261120235713.4038162-1-majidhhdri@gmail.com>
X-Mailer: git-send-email 2.56.0
In-Reply-To: <20260910091405.354058-3-sevanevorotov29@gmail.com>
References: <20260910091405.354058-3-sevanevorotov29@gmail.com>
X-Mailing-List: devicetree@vger.kernel.org
List-Id: <devicetree.vger.kernel.org>
List-Post: <mailto:devicetree@vger.kernel.org>
List-Help: <mailto:devicetree+help@vger.kernel.org>
List-Subscribe: <mailto:devicetree+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:devicetree+unsubscribe@vger.kernel.org>
List-Owner: <mailto:devicetree+owner@vger.kernel.org>
Precedence: list
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

Hi Vsevolod,

On Thu, 10 Sep 2026 16:14:05 +0700, Vsevolod Nevorotov wrote:
> Add input touchscreen driver for Synaptics TouchComm (TCM) generation-1
> controllers connected over I2C that boot into application mode out of
> their own flash (such as the Synaptics S3908 fitted to the OnePlus 9RT).

I tested v2 on a OnePlus 11 (SM8550), which has the same S3908, on top of
next-20261120 with an out-of-tree device tree.

  synaptics-tcm-i2c 1-004b: TouchComm v1, mode 0x01, part s3908-15.0.0
  synaptics-tcm-i2c 1-004b: 5760x12864, 10 touch objects

Touch works under Phosh, including multi-touch. With wakeup-source set,
the double-tap gesture is reported (KEY_WAKEUP) while the device is
suspended, and touch works again after resume. I could only exercise this
with /sys/power/pm_test = devices, because a full system suspend does not
work on this platform yet.

One question on patch 1/2: the binding describes vdd as the core/digital
supply and avdd as the analog one, but its example connects vdd to a 3.0 V
and avdd to a 1.8 V regulator. Which is intended?

Tested-by: Majid Hajiheidari <majidhhdri@gmail.com> # OnePlus 11

Thanks,
Majid
