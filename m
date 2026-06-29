Received: from mail-wr1-f47.google.com (mail-wr1-f47.google.com [209.85.221.47])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id D71493603D5
	for <devicetree@vger.kernel.org>; Mon, 29 Jun 2026 23:29:04 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.221.47
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1782775746; cv=none; b=SZMBVyEhJgYV4LHRKgKcnKWHvCiW8nUGzniBkb8eJU8K/wjt9Osc/Ilua3RPelm370XKnvqqF52foxEVqNKZzyH1SVEZ0JlRhmqIDXVB9xw4vkAcrRPBpBzUtzwrwGqbhlxMrqF05W67Vp+x/xRfKg7KsI6681mx4yUFAc5NRJY=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1782775746; c=relaxed/simple;
	bh=qUBM5k/m1LrmRgCeA5fXpdqaFQY5160FihcJbD/JmzI=;
	h=Message-ID:Date:MIME-Version:Subject:To:Cc:References:From:
	 In-Reply-To:Content-Type; b=pfndinKHzCZegt24q6bb2BWo2GlhQ3bwxgl6/hijph9ywP3BQApFdCNLE0nz15aehyzWfxJ8so5PwJ0PUmN1VofAGKjBDH7QSANE4mf1ihEVD105xKjdC68xCb0v88w9cXuNeRTZtWEfUyoHfwUh+6Z41BSeTCTLoQB6oDbCMDs=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=E9Ob+WDE; arc=none smtp.client-ip=209.85.221.47
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="E9Ob+WDE"
Received: by mail-wr1-f47.google.com with SMTP id ffacd0b85a97d-46e4764ca48so3604007f8f.0
        for <devicetree@vger.kernel.org>; Mon, 29 Jun 2026 16:29:04 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1782775743; x=1783380543; darn=vger.kernel.org;
        h=content-transfer-encoding:in-reply-to:from:references:cc:to
         :content-language:subject:user-agent:mime-version:date:message-id
         :from:to:cc:subject:date:message-id:reply-to;
        bh=qUBM5k/m1LrmRgCeA5fXpdqaFQY5160FihcJbD/JmzI=;
        b=E9Ob+WDE/z2TsUmR16F9405yKr0TJUzD1r/OTIRuh3lzjGV9qyJk8enlZXHMOeuCYO
         6BPJwqnVsqK5K6Zg6XxbAPqoDT6Mcj/1sEmJW8PJqclEp2uKTnp/zS2cz+P6wUDs03wD
         Jfpc4q5ch+0bidZdIgrrBjfTR9S3E+zscbxOAgeLGYhOk1NKExeb71KefyrbVJGbHhdc
         9jQjlc2Ughk0bKEAW40ydq/ns7s2LTbl+yJYYxfnMZ6OOyrFRsaW8PqMaQWzLXiE1o68
         7tO3Csm9+fH0FhGIp4wYXuOKe668zGGqQfMIpZDl/zEc96LIKlsy4ttHb7xSHuXNs7fK
         kIdA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1782775743; x=1783380543;
        h=content-transfer-encoding:in-reply-to:from:references:cc:to
         :content-language:subject:user-agent:mime-version:date:message-id
         :x-gm-gg:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=qUBM5k/m1LrmRgCeA5fXpdqaFQY5160FihcJbD/JmzI=;
        b=CcwE54k8ks4g7ySTDCsoKukEM/hj5FVg41iOd+jTpk3Tu5azf7j4M5LRLYHeiwL7h1
         NnBLUh8szOASg3B/RI+4h+DIaZl4/57ubxlDOsebsgH+fFnAuyRvH4687/a8yAYJCfP0
         8L1iyTO9yOW3V9FPwyDU0UStBzuoVZLyAK4wTxpoUADkYiNjO11KXgiaY2MfXFa3ePBb
         Oy3V/NGGHoya+A7Xno1/3s3TYHGNj/TGIoG1b3WA2PrwEs8g2q15yTcHtq7r1VGbzJyO
         cWeMsumtFDSMLU1XBtYHAHdnu2BUItoB0EXp1j8aub9DIL3E8laS6G69RjR46kyufHju
         IlAg==
X-Forwarded-Encrypted: i=1; AFNElJ9H5k+T9a8O9Vq1yEaDBnGk59TNZID1EyBmatT/HGgxJOxGCGObtFKgMONc0Q3CcTbyW9D2Hc2B/t0/@vger.kernel.org
X-Gm-Message-State: AOJu0YxiPOLF/wx57YKwChibRDPUP/EqSY4kLb94UAZE4cwCCSto3saT
	xw468LRIvaWxw/M7LJjiNWIxOzgk3HnRPeV/vHb52h/a43dQZafYM4d2
X-Gm-Gg: AfdE7cnRjLP1kZHaPyLcM3jxTfBMN9+FDON7QXLYKwckHBgxSLuXv66oDij3JMWi35G
	ygxn/SEC0yiUKiTmzGdhVZ1/c/z1byYBbj5YPld4x2n2Ks4EaE+cT9s1RzMuiRN9qoLkEdB4jW8
	u3V5Mb5xwCQWT0+1aBhHL/+AAGuV3iwgK+NTU1iwCgOktT9Sc73xGEF3O2rMKPeN+1nz8jlNaJp
	BHb0XV391/d9WrVu7eDoAmTocwqUsRWYvSycMX1Ig7MgldZuXt328hJ+55aSr2bhyk44eF9x82b
	pcLUC0lOzjWo1qi22ys1gA0Mo/925hZD5PguY/nUeOOXBGgD6r8hSar7Xw/bMPtENQZK+sVqDGP
	lsEO3pxO77iGqolEqc+wx2wclgNbMK+MjZRBpI7ht2c74tp08zA+me/wugLFo5DcpoAU/cpWBvW
	PjyTVCrgc+jJPOwvEV6YbbD4ODfUpmPqk7/ZpuYaRX38edfZOEW+HcCpaas/ZCyfs8V23MkizLL
	F0y0Uz2L866
X-Received: by 2002:a05:600c:a43:b0:493:b2c1:b2f9 with SMTP id 5b1f17b1804b1-493b827ed93mr22927465e9.8.1782775743119;
        Mon, 29 Jun 2026 16:29:03 -0700 (PDT)
Received: from ?IPV6:2001:9e8:f114:3501:e823:2f5a:823:f863? ([2001:9e8:f114:3501:e823:2f5a:823:f863])
        by smtp.gmail.com with ESMTPSA id 5b1f17b1804b1-493b8cd8bccsm25053065e9.8.2026.06.29.16.29.01
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Mon, 29 Jun 2026 16:29:02 -0700 (PDT)
Message-ID: <3c565f9d-0114-43c8-a7c6-3541b22176a5@gmail.com>
Date: Tue, 30 Jun 2026 01:29:01 +0200
Precedence: bulk
X-Mailing-List: devicetree@vger.kernel.org
List-Id: <devicetree.vger.kernel.org>
List-Subscribe: <mailto:devicetree+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:devicetree+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH net-next v3 0/2] net: pse-pd: add Realtek/Broadcom PSE MCU
 support
Content-Language: en-US
To: Jakub Kicinski <kuba@kernel.org>
Cc: Oleksij Rempel <o.rempel@pengutronix.de>,
 Kory Maincent <kory.maincent@bootlin.com>,
 Andrew Lunn <andrew+netdev@lunn.ch>, "David S . Miller"
 <davem@davemloft.net>, Eric Dumazet <edumazet@google.com>,
 Paolo Abeni <pabeni@redhat.com>, Rob Herring <robh@kernel.org>,
 Krzysztof Kozlowski <krzk+dt@kernel.org>, Conor Dooley
 <conor+dt@kernel.org>, netdev@vger.kernel.org, devicetree@vger.kernel.org,
 linux-kernel@vger.kernel.org, Daniel Golle <daniel@makrotopia.org>,
 =?UTF-8?Q?Bj=C3=B8rn_Mork?= <bjorn@mork.no>
References: <20260628222705.4052815-1-jelonek.jonas@gmail.com>
 <20260629160635.489e6779@kernel.org>
From: Jonas Jelonek <jelonek.jonas@gmail.com>
In-Reply-To: <20260629160635.489e6779@kernel.org>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit

On 30.06.26 01:06, Jakub Kicinski wrote:
> On Sun, 28 Jun 2026 22:27:02 +0000 Jonas Jelonek wrote:
>> This series adds a PSE-PD driver for the microcontroller (MCU) that
>> fronts the PSE silicon on a range of managed switches, together with its
>> DT binding.
> Sorry, but net-next was still closed when you posted.
> It'd be unfair towards those who follow the announcements to consider
> this posting, you'll have to resend.

I considered the rc1 release as opening, the announcement being
an optional indicator. Sorry for that, I'll keep in mind for the future
and resend.

Best,
Jonas
