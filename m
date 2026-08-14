Received: from mail-wm1-f50.google.com (mail-wm1-f50.google.com [209.85.128.50])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id ED32B399342
	for <devicetree@vger.kernel.org>; Fri, 14 Aug 2026 16:08:33 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.128.50
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1786723725; cv=none; b=eYzONNjifnc5a55hLfRnKClrzIyeBIh/u6hY0j+tMSS+yX5zW4eF3ekZYvqmc8QgzP9ME6ZuZg7gfpTQTvXeE4U4buxLBq1zPp9e91FZ2TN7FvB482Nzn0fEVx2a5MmMFqIgqiwZcslC/g/AolAyOGia77TmTjoC672QJ9rkovk=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1786723725; c=relaxed/simple;
	bh=OvC+uCX22OxiCm/ADZIrl4k/Q2qjrp6B/VU/TsLraGE=;
	h=Message-ID:Date:MIME-Version:Subject:To:Cc:References:From:
	 In-Reply-To:Content-Type; b=p7i8om+EEjZFRQczRagHp7uptqNgfOBG+8klllRQRRNGRnc3ihGDpn2IB1N6d+GHubcZb9XC41zJP0vQGvd2Pz6ZnNahJ3hVd5dj0GhzB281A1T1B6xiUxQxsyF9w+wNDKWprrHymGUER307G6IedefkRfJmRViUoUK33/I/muc=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=dbuXRXot; arc=none smtp.client-ip=209.85.128.50
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="dbuXRXot"
Received: by mail-wm1-f50.google.com with SMTP id 5b1f17b1804b1-49554ebb87dso11605295e9.3
        for <devicetree@vger.kernel.org>; Fri, 14 Aug 2026 09:08:31 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1786723708; x=1787328508; darn=vger.kernel.org;
        h=content-transfer-encoding:content-type:in-reply-to:from
         :content-language:references:cc:to:subject:user-agent:mime-version
         :date:message-id:sender:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=6ZnefS8leD5EpLhfx/2yL2ejpM4dklOoHUq4vSAQtGU=;
        b=dbuXRXot/HKJArG0F0QwksTxblB1A8YetbG+JPqAjp7I8X3WkNNm/Zz9hIbqrF7aw3
         5k+YfjsUtRVCrij8euk+f+9D+59K09JS0El0OmQ47uHZBVtKMuttJezWdNcVig0qstn7
         QECB+TptQBVlTqxkq3/9vA+GHeEZk5EGmCCawDpR5u8/a1YIRvWFNC2wcg2SHk3Ity78
         AisVUaeWcb2CLGcNAwGqEpyFR42QvpyEFwhGorZZfSpKrvmNei0t+3j/ZRKx+ODRuMxc
         5Y+luwdrwyl0h+AF5tX+r1EMN36+6p6AI5VvQdDXGHIpwgE206DpdlInaVoP9sJcub2R
         iKdw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1786723708; x=1787328508;
        h=content-transfer-encoding:content-type:in-reply-to:from
         :content-language:references:cc:to:subject:user-agent:mime-version
         :date:message-id:sender:x-gm-gg:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to:content-type;
        bh=6ZnefS8leD5EpLhfx/2yL2ejpM4dklOoHUq4vSAQtGU=;
        b=ml6LpPxinvozK7JRz0sWucHGt7lUvfoFV+5xoYy/mKhQIu6OvG2YiILslwcXr6Wql3
         rpL8SPnfqoXwIeTYzMA1lW2m5/E0VPUCu3fyTIdueg5jgZcrnEQwOs25HtfaPvVBeB7o
         pgWDL0sgsIfQmE6wyhclzm7NijyTIwT7sGyA9ywE2nnxFXJfAyisFSgyoEdyflsVNu/G
         fdOY4WQwpAgrRF2g4c2/hema+dNPCbeCeCDjNATrzL6+aGZxQY3l037DMrgn6zu2xaZ3
         GRHPfb+/rIilPZPSq6L5xaeCTgD1yMngyxHPN+o4X59pjJ7xptYvF73evDl1QIxbFi6P
         x07A==
X-Forwarded-Encrypted: i=1; AHgh+RrrCDo6bdERJCQd/Zh06xK0a5nCB0+zm8nSsj6cn/rUD9IUKlDldxyWFMdVXIF3QKgHE93A//JTgKzZ@vger.kernel.org
X-Gm-Message-State: AOJu0YzWXQH9LpFm1WS4hR6i0ps4DgyDBSHQo+wJmOg1Hh5dEGhky/1k
	Kkxa8DHoaGaXW5XBRgo9MDY4E+FkmOoISV3Hzd1BEtTYN6/vvnqIkycT
X-Gm-Gg: AR+sD12+hq/Sd6OhexdU8zNYC2fM+/naLfc3l9yGbzXcbEB8FgVL5tM2AfDzVe3Gqyl
	u8yVxkt4WXuSmUs+NGsH9FPSJY39x5ZoydJVzajx2hbhECqlXq2ho5KI7XXbsXZ2RilggbjBo5y
	WjyrN+3zmizlJ444fXJSYfRSKyp/EUNSG3jzwe+ZZwuxNITzHOtsp/VPbqueUi6G3zvPVaUkNjN
	MQWghhdDp3xYZi67Pv/AVBR9OvI+dhChRll3vqCuwy3ec6uWs4uoOD84lbE0DnISTcsrg94qEie
	bSEo4bLPvHvQPMHwYFB3GkuBL0XllsO8rkaO72jYV5LWhs5MQZJMdhVSgMFWp7jvsAApn3tLKi/
	R1gp7zAxF5QnnSzZIwfBRq4u5/H0D1nsWKGRMB553PN66pQ9+rrQr2ti9JJvlypJT4BhMdvDdWG
	yKbga+CvRk8PD8QkqFRNzDEPOZLe74zWbjBcEXOtpCulIM5g4HsOSkIEvighr5fmYMyearuaCQY
	Ma3FKwmt1VC2y4tvk+rAxiNNGIkNTsnjrb9ybXmZdCSmYq3S+WOLObg
X-Received: by 2002:a05:600c:138a:b0:499:51cc:4e57 with SMTP id 5b1f17b1804b1-499878cf3b0mr74633095e9.0.1786723707410;
        Fri, 14 Aug 2026 09:08:27 -0700 (PDT)
Received: from [10.128.10.232] (195-23-151-163.net.novis.pt. [195.23.151.163])
        by smtp.gmail.com with ESMTPSA id ffacd0b85a97d-4815f2c18cbsm8127896f8f.29.2026.08.14.09.08.26
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Fri, 14 Aug 2026 09:08:26 -0700 (PDT)
Sender: Julian Braha <julian.braha@gmail.com>
Message-ID: <e0775be9-9773-424e-9109-5b4b6b620e61@gmail.com>
Date: Fri, 14 Aug 2026 17:08:25 +0100
Precedence: bulk
X-Mailing-List: devicetree@vger.kernel.org
List-Id: <devicetree.vger.kernel.org>
List-Subscribe: <mailto:devicetree+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:devicetree+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH 3/4] rtc: pcf8525: Add watchdog support
To: Shiv Prakash Gupta <shivprakash.gupta@nxp.com>,
 linux-kernel@vger.kernel.org, linux-rtc@vger.kernel.org,
 linux-hwmon@vger.kernel.org, linux-watchdog@vger.kernel.org,
 devicetree@vger.kernel.org
Cc: alexandre.belloni@bootlin.com, krzk+dt@kernel.org, robh@kernel.org,
 conor+dt@kernel.org, linux@roeck-us.net, wim@linux-watchdog.org,
 vikash.bansal@nxp.com, priyanka.jain@nxp.com, lakshay.piplani@nxp.com
References: <20260807082855.3762394-1-shivprakash.gupta@nxp.com>
 <20260807082855.3762394-4-shivprakash.gupta@nxp.com>
Content-Language: en-US
From: Julian Braha <julianbraha@gmail.com>
In-Reply-To: <20260807082855.3762394-4-shivprakash.gupta@nxp.com>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit

Hi Shiv,

On 8/7/26 09:28, Shiv Prakash Gupta wrote:
> Add watchdog support for NXP PCF8525 real time clock(RTC) device
> 
> Signed-off-by: Lakshay Piplani <lakshay.piplani@nxp.com>
> Signed-off-by: Shiv Prakash Gupta <shivprakash.gupta@nxp.com>
> ---
>  drivers/rtc/Kconfig       |   1 +
>  drivers/rtc/rtc-pcf8525.c | 245 +++++++++++++++++++++++++++++++++++++-
>  2 files changed, 244 insertions(+), 2 deletions(-)
> 
> diff --git a/drivers/rtc/Kconfig b/drivers/rtc/Kconfig
> index 3c22c7253aae..6c1c7b3d27b6 100644
> --- a/drivers/rtc/Kconfig
> +++ b/drivers/rtc/Kconfig
> @@ -516,6 +516,7 @@ config RTC_DRV_PCF8523
>  config RTC_DRV_PCF8525
>          tristate "NXP PCF8525"
>          select REGMAP_I2C
> +	select WATCHDOG_CORE if WATCHDOG
>          help
Nitpick, sorry: this Kconfig file uses spaces for indentation, but your
addition uses a tab.

- Julian Braha
