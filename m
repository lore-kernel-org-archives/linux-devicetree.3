Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=74.125.82.51
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1794962819;
	b=VMfxKsWlS0Xcj6gB85rBTL1msYN89JDl2XDaNsnEMH2c2Ux3IwG6EaAvDDAn4IC0aFus
	 TrSgYlb9UxGcQAaX41pimXVfzZ7vv+LRGzwlnQQKt35t7vMxXVXN9MrDHpspHSN1/wQ0y
	 JW3DJZTfDv+/Q5bQmPfB95ooM/5ljcfbSXBSUTJVt9PYISn2bZ5gow+3lf3gf9mkIKNBd
	 uKH2KEXaAcy4Xquk7RJmH6LM142drzYPUlDV1nMgkvuFWU4hrVOM3X5R/t+p1PtImVMA1
	 Rc9LA71DP8GYS7kLLRolUUriP3Po1ZKV3h5lpdsbnVUNU6kCK5Ypu4J/QieYZIOeaLw==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1794962819;
	h=DMARC-Filter:Received:DKIM-Signature:X-Google-DKIM-Signature:
	 X-Forwarded-Encrypted:X-Gm-Message-State:X-Gm-Gg:X-Received:Received:
	 Message-ID:Date:MIME-Version:User-Agent:Subject:To:Cc:References:
	 Content-Language:From:In-Reply-To:Content-Type:
	 Content-Transfer-Encoding;
	bh=yRsbLllD1ga6dKK48ADUW32xm5TyK5xa4odFMr7mVjM=;
	b=tZBGo3hPvTiSTcIM/EDN85dCRZ9GKev89D/TytZ6UyelBWnZbElS0tcnRCzGbU5lrOIk
	 JwCLj1aLoGHtAmc6x/yYO2Okw54cAzMlMCPlq/I5QI4hDNIg6FejhOxdfkXrEaMEISLzi
	 8TVmb0HIjBLgde3O4jzUEL43Uf9rdG0FDkc/7lWrdnnHFCffESKUBl5I4U1MKNye7wB0N
	 Ay7PJUFVsVGYIAjQwzqhHU65qY8otH5XG900mOopR0hhdDbGrt/D/tnVFTI54lX+v18Ka
	 nL9neeKKDhzhpPOxYd4FmAZU7c+bzTznIgMT1Haex1rTuObtqHW5SZo59mYt76IEfIw==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=gmail.com;
	spf=pass smtp.mailfrom=gmail.com;
	dkim=pass header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20260707 header.b=JW67F3Tt;
	arc=none smtp.remote-ip=74.125.82.51
Received: from mail-dl1-f51.google.com (mail-dl1-f51.google.com [74.125.82.51])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id B56C9606A32A
	for <devicetree@vger.kernel.org>; Wed, 18 Nov 2026 00:46:58 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org B56C9606A32A
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20260707 header.b=JW67F3Tt
Received: by mail-dl1-f51.google.com with SMTP id a92af1059eb24-1b3ada81853so504271c88.0
        for <devicetree@vger.kernel.org>; Tue, 17 Nov 2026 16:46:58 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20260707; t=1794962818; x=1795567618; darn=vger.kernel.org;
        h=content-transfer-encoding:content-type:in-reply-to:from
         :content-language:references:cc:to:subject:user-agent:mime-version
         :date:message-id:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=yRsbLllD1ga6dKK48ADUW32xm5TyK5xa4odFMr7mVjM=;
        b=JW67F3TtYeElTtJVSj5teFMGo+XuLq9otC4iX7E8GBDpg0mGi9yucnrKia7Bi/14Tp
         eSIexKMeK8huhwnBFjk8SG6lsvizMqARIOUWtfYHO9NfflpHvSFk8hq/d9thsm6mWHXP
         7jN/v3sFWnpGGud6a1VP2Aa5S+Nn/kEpx49EYpnsXx/czo+T7rnrcPqfV3eVyCtHH4XG
         EYe3Exr5OcAEFS6iMXQKHSh5E1EMr71bWawtXC+rS91fjBzu0SUUVyzPMIWF7SZB/YvH
         gXwtxwuSy4H0oiXlSWCJHPE8Q1jF/SkvxLj6i4CVDVzh0mEA/fj9Dx1lD0tTZbUmDygY
         +KFg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1794962818; x=1795567618;
        h=content-transfer-encoding:content-type:in-reply-to:from
         :content-language:references:cc:to:subject:user-agent:mime-version
         :date:message-id:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=yRsbLllD1ga6dKK48ADUW32xm5TyK5xa4odFMr7mVjM=;
        b=fFPFXo5FD5YdMzY7LAqG0jkvOwaxOytQgy8VcERyPXkB4DGToeIih2gPopFW6YdcTX
         pehZ0rYnRPdv4faD7t0Ur7PMF+2jnFS0juNwflm/FocxYmD/9zOcBWHZiGne0OTQ7KeB
         8RnNCkfbvAPVipLLCjrVKf4cFfrch/pYrFsdyH8hmrCpX1zNnRgT3Og400HMdDpnMKwt
         RoVKIVidN/7zOyxfa40CSBb3WbccSgvbTELqsfi1ZpOMtxRWkgWknA4p7nuQEVgIHtFN
         dmKrdftZ+6rXd8P5HKoZVF3M4mev9uavDtjZdtOiwclbxWNxKBlc+tK94gpnlj09UjHw
         tYtg==
X-Forwarded-Encrypted: i=1; AL+hErEgOchIIoKKEs4OkAutF/D0+IXnyXQrE5xxdCFXaQC7uM8Sk+jeNpd6+h4yJ7u5sJ3AnShcP8HFE67J@vger.kernel.org
X-Gm-Message-State: APuU4Z9pe1gaqzTQHa7tmHj24rzclGmEPPIfF4MP4YHLJFgr667mDAcQ
	X1S6maCPrGgLqTom+tLu9NOUsBPZLDtdpXFzDIPB47CDYay2yBlez9vz
X-Gm-Gg: AYBFou1yHDleZ40TEulSU/7RIx32e8vVVHnZdBAj/K01obmPu0wONAKOLzOeCeG7I0K
	loWKwJOJNe61iYoY88wa0OyfpqMsnre6BfAIBIPWcuotfy4jhc28oOe8VjyL676J2fCh720UNBR
	l3TQMoF+/fwCQexhElyjOAo7ib1l0WhoFB+PQ/mM0/ozfe0jnf5KyEXffNng6WUZufBUPMzdYMX
	/jw2XmjoUtHYo8ozCcEqE4gvlybtCFwgdQ3SNDxxX4BwwwXtpsY0YiZ8yVCJ9AIzpTuZbJpk3tn
	CAis9YSpEgJ0+hBp7SHHSh0hylm6UJ4JIDDkj8HgPaN9w4qCxDcwI+qz/O2/xSVI2ua300WQSFs
	kOqQN2HCaDhjo1ZuurQrlbvK8pQMmEZkOMDBY0So75QFdzM9/CRvJRYlSklaRgraSmxxttU3hJ7
	AKrQUZQl3r2cvwNvZZXIt7xRFXHR/oFU+HbjxjskFMblfmpaAgiv/im1vcCwVj3RtiaXiBUnCDj
	mRdUYMQcxEkE9tNVsv0O0astASuK9L7yJpqfDCcwGlkKrzzTymlEoJIOpaEvamCSajR53aU/Jos
	SHjYON+bMBcMzufMBbjMnDENB74xzsgcmQgW++81G5HVF4ot2xTjo7s2iLI4JedUZTn3nCpH1dl
	p
X-Received: by 2002:a05:701a:cc93:10b0:1a8:ff0b:a4e1 with SMTP id a92af1059eb24-1b543cd7146mr1086049c88.18.1794962817804;
        Tue, 17 Nov 2026 16:46:57 -0800 (PST)
Received: from [172.19.1.48] (60-250-196-139.hinet-ip.hinet.net. [60.250.196.139])
        by smtp.gmail.com with ESMTPSA id a92af1059eb24-1b5447dc5e9sm2505940c88.11.2026.11.17.16.46.55
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Tue, 17 Nov 2026 16:46:57 -0800 (PST)
Message-ID: <aa081f74-a15d-4ef6-86f6-cd81455a57c0@gmail.com>
Date: Wed, 18 Nov 2026 08:46:52 +0800
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
Subject: Re: [PATCH 3/4] thermal/drivers/ma35d1: Add Nuvoton MA35D1 thermal
 sensor driver
To: =?UTF-8?Q?Uwe_Kleine-K=C3=B6nig?= <u.kleine-koenig@baylibre.com>
Cc: rafael@kernel.org, daniel.lezcano@kernel.org, ychuang3@nuvoton.com,
 schung@nuvoton.com, p.zabel@pengutronix.de, robh@kernel.org,
 krzk+dt@kernel.org, conor+dt@kernel.org, rui.zhang@intel.com,
 lukasz.luba@arm.com, linux-arm-kernel@lists.infradead.org,
 devicetree@vger.kernel.org, linux-pm@vger.kernel.org,
 linux-kernel@vger.kernel.org
References: <20261117060501.2611071-1-zychennvt@gmail.com>
 <20261117060501.2611071-4-zychennvt@gmail.com> <avxhlPnmjDhZlUmt@monoceros>
Content-Language: en-US
From: zychen <zychennvt@gmail.com>
In-Reply-To: <avxhlPnmjDhZlUmt@monoceros>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit


Uwe Kleine-König 於 2026/11/17 下午 10:16 寫道:
> On Tue, Nov 17, 2026 at 02:05:00PM +0800, Zi-Yu Chen wrote:
>> +#include <linux/auxiliary_bus.h>
>> [...]
>> +#include <linux/mod_devicetable.h>
> 
> <linux/auxiliary_bus.h> already provides auxiliary_device_id, so please
> drop <linux/mod_devicetable.h>.
> 
> Best regards
> Uwe

Thanks, I'll drop it.


Regards,
Zi-Yu Chen
