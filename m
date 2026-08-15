Received: from mail-ed1-f48.google.com (mail-ed1-f48.google.com [209.85.208.48])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 0843A3AA1A9
	for <devicetree@vger.kernel.org>; Sat, 15 Aug 2026 18:40:30 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.208.48
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1786819232; cv=none; b=Ts4NmcDkgzPvr5QcHQbK4pWJYhsF86ARsL6OntyFNmA3mDKtnMXiylMeLTVtOXd3rJlG4jUIJpexcJEhaGCwXc1f4hKUySDK1nHYoGQz9W3BLyNrcepFt9SwdzvxoKV2dsYSHpJ0hQvuQMZE2JYZvscPh7StuJNvYoVU9mGjID0=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1786819232; c=relaxed/simple;
	bh=/ZA1Q8Gwy+uG1UkvNRPO7Wo07xyRJMuxf+VXQgnmgcM=;
	h=Message-ID:Date:MIME-Version:Subject:To:References:From:
	 In-Reply-To:Content-Type; b=Ym9AzFUG0QaRNLpRStLQkX1j6QzJDnWpwQDoa/Z2n5pBdDaAEdC4TA3Eo0RjbWPZXSrOnVEqs5M07Yb9kyp0RQQTIrbPj3lLkG0qII58LtyGHFuU3QhwlYiJ1GitAfYsXKyST/JnMibOso0gvWFTIUBfn4qQY7Lvnwt2VTyLkAM=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=l5PRZVQn; arc=none smtp.client-ip=209.85.208.48
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="l5PRZVQn"
Received: by mail-ed1-f48.google.com with SMTP id 4fb4d7f45d1cf-6a15d54ac95so2976414a12.0
        for <devicetree@vger.kernel.org>; Sat, 15 Aug 2026 11:40:30 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1786819229; x=1787424029; darn=vger.kernel.org;
        h=content-transfer-encoding:content-type:in-reply-to:from
         :content-language:references:to:subject:user-agent:mime-version:date
         :message-id:from:to:cc:subject:date:message-id:reply-to:content-type;
        bh=e4u+82k9vbpFdPR/3zT94ZUUXyCAtcrN9YltYPZ+Ra4=;
        b=l5PRZVQnFCK7yIbLWYne+Ar4vHWyYDwUeYpUVmopEpS68GdqmGnchUeX0R8zwWT+67
         /kcMW8mGnGTWMz58Q7Weq24iZRGytMPJRUHwrIHipi7WLw/+aYdEiIO+pDHVXCuh2NUA
         6ruSrkdsSY++lh3f33QnSQBzhxtlkYHLJubBezW3/zpw/hY5izu4tInlm2sZdLzjQOiQ
         YsMsdeH3fWGbLJZsbB1t8dnsBCIOqjoNcBVRhgrEn1Nmu6SasW9LlB7ntzxd18N5r3EK
         xJRfXyWL72cCpaaUHE9VWWnk7cv3W5If+M2CkLOdPpY/LclVbbv/P5iVotLyceBY8nK5
         dzcA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1786819229; x=1787424029;
        h=content-transfer-encoding:content-type:in-reply-to:from
         :content-language:references:to:subject:user-agent:mime-version:date
         :message-id:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=e4u+82k9vbpFdPR/3zT94ZUUXyCAtcrN9YltYPZ+Ra4=;
        b=dffKrzwELOAAku9Lt1AvOqv31MBb5bUDMCrALf5/2m5cdWd8XOXH0Hz57e1fHP/M+N
         bLMdX/gpkQMneQ42RMZykK9IIw9RQhgLPVaKyWZy2EtyLDDQAG7RStFc5iAt3BZp3ZHp
         CwVk5XMJJx0i0MrB/LpGc5j/cdWxSjO/P0VEYbwDz2OAvPWY2FoXtdSeIHMJFvotxmwn
         Xot83TjBOaXDkopGgPU50/yXjy1/gbCG5iuqPzpL4M9CFXWzDRbudGT8sWfyrx+i8yfi
         zmgy2tOO/yJxE/WdKwA4P/gMvxHROT3Guy9z21ZauX2nxqJ/V0s4A44YsL1ru6r2wF7F
         GjKg==
X-Forwarded-Encrypted: i=1; AHgh+RpwZRkv3UHQfHM6IKKpx68HlngSwSoH7Hheof/iLL7xoTP95Ewsu547BLImJiVl3OROqprLQTQWZyJS@vger.kernel.org
X-Gm-Message-State: AOJu0YwdSuHS9s5RdIQbVmgDyCKuf+hbJ+UAJQc7oB8EgotvbddjctGK
	1uyjb3jwu626bQXhZBGZCWIEbDXQF5cbag1t9OHt7RUC4S88ueRW/FMt
X-Gm-Gg: AR+sD10Uic1Wa8XPTstI2xMO+ifH6L9BijOdp6WgO2DVtu4TWIJ17Enoh9DkdWkw/Hq
	6YRJYGFmeLjto18NUnlwMvThrbpvmYxaf75w/17v5LvMKI0txX/rWVZR/amMFAcF7gHHacFnXBO
	rX+YCmdGDVqlaSrUGjFkJXmLwNnUZPYyfshel1iJbROS47diOSZBneCrd2NQUags/osSZZIfIJQ
	1B1yNUtrb1bp6iIIW9N4M4SlFCZx+XWJXhAQs9aW90dlg/shTN3sWlWEdYyMSobxYHQBF0be56+
	YmPEKUn/0Iq1AxLHWyR820Oc3F2fHs58Ots3mOY/0nObDvAd2+5VUAp4lZcHr7csA/uZTaf0IU8
	pLMZJBnxYB7T0bkNFTL2WPrOi/uwj5sBAZIpEls81JYNjML/MNDVhXbvjc7NLVxVzm5y33DQpQg
	SZYXGL8sp8cf9Qg0352SvBC35zN2BwHmFZ/7eZ2X7SXxzj06iz9puCm/0NCMxWjbca853hijWma
	ICoWzUSZDvcczAd5Bfz8WJ+D5fEY9wkp2cmta3Kjg==
X-Received: by 2002:a17:907:a64b:b0:c16:9043:7973 with SMTP id a640c23a62f3a-c2129c1be2emr652620666b.4.1786819229276;
        Sat, 15 Aug 2026 11:40:29 -0700 (PDT)
Received: from ?IPV6:2a00:1fa0:28f:426f:2aa1:8f7:f8a6:4f89? ([2a00:1fa0:28f:426f:2aa1:8f7:f8a6:4f89])
        by smtp.gmail.com with ESMTPSA id a640c23a62f3a-c21234b3feesm268117266b.14.2026.08.15.11.40.26
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Sat, 15 Aug 2026 11:40:27 -0700 (PDT)
Message-ID: <f5bb5c11-c525-4eee-bd9c-8566d4c04ce7@gmail.com>
Date: Sat, 15 Aug 2026 21:40:25 +0300
Precedence: bulk
X-Mailing-List: devicetree@vger.kernel.org
List-Id: <devicetree.vger.kernel.org>
List-Subscribe: <mailto:devicetree+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:devicetree+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH net-next v2 05/10] net: ethernet: ravb: Propagate error
 from ptp_clock_register()
To: =?UTF-8?Q?Niklas_S=C3=B6derlund?=
 <niklas.soderlund+renesas@ragnatech.se>, Rob Herring <robh@kernel.org>,
 Krzysztof Kozlowski <krzk+dt@kernel.org>, Conor Dooley
 <conor+dt@kernel.org>, Geert Uytterhoeven <geert+renesas@glider.be>,
 Magnus Damm <magnus.damm@gmail.com>,
 Richard Cochran <richardcochran@gmail.com>,
 Andrew Lunn <andrew+netdev@lunn.ch>, "DavidS. Miller" <davem@davemloft.net>,
 Eric Dumazet <edumazet@google.com>, Jakub Kicinski <kuba@kernel.org>,
 Paolo Abeni <pabeni@redhat.com>, Vadim Fedorenko
 <vadim.fedorenko@linux.dev>, linux-renesas-soc@vger.kernel.org,
 devicetree@vger.kernel.org, linux-kernel@vger.kernel.org,
 netdev@vger.kernel.org
References: <20260811160200.2049987-1-niklas.soderlund+renesas@ragnatech.se>
 <20260811160200.2049987-6-niklas.soderlund+renesas@ragnatech.se>
Content-Language: en-US
From: Sergey Shtylyov <sergei.shtylyov@gmail.com>
In-Reply-To: <20260811160200.2049987-6-niklas.soderlund+renesas@ragnatech.se>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit

On 8/11/26 7:01 PM, Niklas Söderlund wrote:

> If the PTP clock registration failed the error is silently ignored.
> Before reworking all callers of ravb_ptp_init() handle and propagate the
> error so it can be used.
> 
> Link: https://sashiko.dev/#/patchset/20260610102432.3538432-2-niklas.soderlund+renesas@ragnatech.se?part=1
> Signed-off-by: Niklas Söderlund <niklas.soderlund+renesas@ragnatech.se>

Reviewed-by: Sergey Shtylyov <sergei.shtylyov@gmail.com>

[...]

MBR, Sergey

