Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=209.85.208.172
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1793782243;
	b=E6Fm89UQI8n+Bjj3uxr1rh5LksKZos2SC2K5pmBKHX0ySQBz7jGfrW6qxQCXTQkx99Bu
	 jBHZvzl5/WrPmtsu2aITUNQjnxLr5Dklq73Qa5QaKMvsHcF6H+Ts7cFFfOQwpW2MvzwoT
	 bFrRux9MVBeWtAqbCRy08JSc1YFb9oaMpQRMjAK/zHKLPQw1nQ5fofvTnBiGVNaB8XlG9
	 553hdsa7UAy0TqSxdU8HNmo8vsHyzFcLjg5LUbYpQMVQganztKJYhij4SH6DcQN5U01qt
	 WmLV2627EWQnRnORHwz7I8RkSMjPtqbS/Pe0+iQKfngk0xoePo9XaXE+k7DAfnJYkyw==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1793782243;
	h=DMARC-Filter:Received:DKIM-Signature:X-Google-DKIM-Signature:
	 X-Forwarded-Encrypted:X-Gm-Message-State:X-Gm-Gg:X-Received:Received:
	 Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To;
	bh=c/7fexNl7s80SzWj4K2ndKBWVJpy6wm9DpcfZBzaNlU=;
	b=iEGofzc9gi0CHZHjJQDN/1xKL4baGJXcqqFZN+EMokX0Bg3JGfbVgJqtBqHMihjdUiV5
	 aJeITamBUfwbzhEP0TZm+ZLEf5aIIr6c6HDAyVaPrh00uqLlEZCVU1MCyl8llYiDVV53G
	 qjJgTWm1Ab/UY4SH4NfWR61FKxcplB0CRe50RCnDRutEJN4+UWTrO+HAgZ1H7IBnAcnWn
	 UQhOolodmwwON49qKhkOgBHEch/u3OtDTJQJCVbRMJqFAvP30SL38mfnbl88trQBxpE7q
	 EpUumj7hH9mnZAWoSfZGWFMfGaUGUKw6kIc2DCSZw8yP1umCWTyh7izG6fDz8aWMLww==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=linaro.org;
	spf=pass smtp.mailfrom=linaro.org;
	arc=none smtp.remote-ip=209.85.208.172
Received: from mail-lj1-f172.google.com (mail-lj1-f172.google.com [209.85.208.172])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id CCCA4606A328
	for <devicetree@vger.kernel.org>; Wed,  4 Nov 2026 08:50:32 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org CCCA4606A328
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=linaro.org
Received: by mail-lj1-f172.google.com with SMTP id 38308e7fff4ca-3a49a022221so3493731fa.3
        for <devicetree@vger.kernel.org>; Wed, 04 Nov 2026 00:50:32 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1793782231; x=1794387031; darn=vger.kernel.org;
        h=in-reply-to:content-disposition:content-type:mime-version
         :references:message-id:subject:cc:to:from:date:from:to:cc:subject
         :date:message-id:reply-to:content-type;
        bh=c/7fexNl7s80SzWj4K2ndKBWVJpy6wm9DpcfZBzaNlU=;
        b=BeGuGwgx4Rt87ZlwOx/3AgYM5Q+NiOd8+GRccRF0FlCMrtzc/x8taqLQSg4KpGaFcW
         HgXjPMzoEtBeUJrJfyGki5vj42BcCyW6KuzYGXmKgKsyQdhx/1YqynSk8SkoZjYTqGsG
         kmJnggFJovR02NygTlrcWhWf0lZ39nxvFPuZtvGmWPkrTlPi2XqgbFTdDGngKh2Z4KNT
         cTiQYEX7+c+hx99SZcocOoLEW5nVULFDjHc3EUR44oXYQPDqVQ/RcGn9u+NnhrlR4fnK
         9uXPpNhVdaseLgNSTovn1tSJPvHbL4tY144qOx9rJLcOu+xL+S9EBRK3GtOzgeJOl1/b
         6AUg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1793782231; x=1794387031;
        h=in-reply-to:content-disposition:content-type:mime-version
         :references:message-id:subject:cc:to:from:date:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=c/7fexNl7s80SzWj4K2ndKBWVJpy6wm9DpcfZBzaNlU=;
        b=DGMsEuIxQApUUD3BQvhWzv6C/1eRMWRv+NOfhrhSTFm38oisNrRswX3cGkmVw2MIJK
         wTvlpCkCKWQn5iMEJQ2rYCzkLjVGw9sCyWXivV/dmqOFx5EjBjbmaJ0buL3ercPnh3Ei
         EZ8FaVoG5B0y6sYF7+MjQxwyxGkOuJm5CfWIgUXZS5LUQ0pDWb2cq0y4MljFM0+qMIx8
         z4fyijcPUW3f+8Vs29uRHpu/IOe0Xxg9XfMtRW8B6PBqhuPu0Gi2XEPjMQHbPS0aVpfR
         oRQTKcGbVu0Er9ESDf35PSoADvnVUxMCJXarZeOGJoQKgUApFsktE4fu1MjF15he8A+m
         uqwg==
X-Forwarded-Encrypted: i=1; AKwUvBzKgNDNZgx6a5Crr/QVZo+7BItwdNFpEWatIdBR5hf5ENMxD4yeRAjouX9nNhpYWY0V8C3g5WynKx8V@vger.kernel.org
X-Gm-Message-State: APuU4Z9SymnZwXoUvHCk1HsOFv00/q8lt3M2Slqa+QsGUDTfUTciDUQj
	XvWlEIFBl3y5T1e8yW6GqxAZNdZiKXg6r9VneADB7uJilG+qTtIYxqRm51SmrLo/R5E=
X-Gm-Gg: AYBFou2+chQsT4bJbQZmbZDiBJcgT5opqHAtrOcrC9Y6tHbbkG8cu0MH0QvBuo3dPCq
	g6T6efzCWM3jg/d0eB9SlR/x1AhwVHpyW3Ov8Aiaj+NnbcsO2NZI1kGMAklkX8F8UluCx13n59T
	hOCv7QtFBjurTBPKakDoSWYnO+0iCUz4xdfVCSB0nV944iJMwqgrAcdV7h+9wiPuC7RMCdn0fDu
	/cgOWl7uKAsCphUfAdFhuju+qvzi47zIJxu25gceVqvivQKFkHvQQHvvohn2h1OfpbIJc8H18Nj
	ZyAuvOxCmpBTWnO2J/rPkF2NgQKTnOHGMutUZpZ8CEjybKkgmBC833dZesGVf1O4b6S4CUrhbWR
	vVkVVMuXRFrkED4IZik9609hJx4GO33+9bGAU3F1yZorKuZ8+xr1IFLacOgEES3g1+cVVI+DgbO
	7S5xhYU+VMgEbdjg5koqBYoH2QsgtS9faFa60z6QQzbJSSM/zlAAjuw2wuAnUXQufl5RyvkHo07
	IDoa+RcwLD3h7oBdQh5ccsZ24FQEP0yhUROnkcaKy0wvzk/jfK53aFB63i7NW03ABGUFCwKczzV
	KCzoAqClFGeiT4s17XFDXI4He3BNjixvLDaXJVFNQR+9m/H7AM4vwE4=
X-Received: by 2002:a05:6512:2250:b0:5bf:a12b:9ba8 with SMTP id 2adb3069b0e04-5bfd957cd8dmr5159537e87.65.1793782230950;
        Wed, 04 Nov 2026 00:50:30 -0800 (PST)
Received: from nuoska (78-27-71-225.bb.dnainternet.fi. [78.27.71.225])
        by smtp.gmail.com with ESMTPSA id 2adb3069b0e04-5bff384c97csm278483e87.5.2026.11.04.00.50.29
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 04 Nov 2026 00:50:30 -0800 (PST)
Date: Wed, 4 Nov 2026 10:50:28 +0200
From: Mikko Rapeli <mikko.rapeli@linaro.org>
To: Konrad Dybcio <konrad.dybcio@oss.qualcomm.com>
Cc: Konrad Dybcio <konradybcio@kernel.org>, Rob Herring <robh@kernel.org>,
	Krzysztof Kozlowski <krzk+dt@kernel.org>,
	Conor Dooley <conor+dt@kernel.org>,
	Hans de Goede <hansg@kernel.org>,
	Ilpo =?iso-8859-1?Q?J=E4rvinen?= <ilpo.jarvinen@linux.intel.com>,
	Bryan O'Donoghue <bryan.odonoghue@linaro.org>,
	Guenter Roeck <linux@roeck-us.net>,
	Bjorn Andersson <andersson@kernel.org>,
	Abel Vesa <abelvesa@kernel.org>, devicetree@vger.kernel.org,
	linux-kernel@vger.kernel.org, platform-driver-x86@vger.kernel.org,
	linux-hwmon@vger.kernel.org, linux-arm-msm@vger.kernel.org,
	linux-kbuild@vger.kernel.org, linux-yocto@lists.yoctoproject.org,
	Bruce Ashfield <bruce.ashfield@gmail.com>
Subject: Re: Kconfig dependency loop LEDS_CLASS -> EC_ASUS_GLYMUR -> THERMAL
 -> POWER_SUPPLY -> HID_NVIDIA_SHIELD -> LEDS_CLASS (was Re: [PATCH v4 2/4]
 platform: arm64: Add a driver for the EC found on ASUS Glymur machines )
Message-ID: <aurx1DKC9JQcO94B@nuoska>
References: <20261015-topic-asus_ec-v4-0-af6305ffcb10@oss.qualcomm.com>
 <20261015-topic-asus_ec-v4-2-af6305ffcb10@oss.qualcomm.com>
 <aursRfQRr0AOL1Oi@nuoska>
 <a759d346-3fea-4a01-a80f-de354746a288@oss.qualcomm.com>
X-Mailing-List: devicetree@vger.kernel.org
List-Id: <devicetree.vger.kernel.org>
List-Post: <mailto:devicetree@vger.kernel.org>
List-Help: <mailto:devicetree+help@vger.kernel.org>
List-Subscribe: <mailto:devicetree+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:devicetree+unsubscribe@vger.kernel.org>
List-Owner: <mailto:devicetree+owner@vger.kernel.org>
Precedence: list
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <a759d346-3fea-4a01-a80f-de354746a288@oss.qualcomm.com>

Hi,

On Wed, Nov 04, 2026 at 09:37:27AM +0100, Konrad Dybcio wrote:
> On 11/4/26 9:26 AM, Mikko Rapeli wrote:
> > (Adding linux-kbuild@vger.kernel.org, linux-yocto@lists.yoctoproject.org and
> > yocto kernel maintainer Bruce)
> 
> [...]
> 
> > With this new EC_ASUS_GLYMUR driver in 7.4-rc1 there now exists a kconfig dependency loop
> > in arm64 builds:
> > 
> > LEDS_CLASS -> EC_ASUS_GLYMUR -> THERMAL -> POWER_SUPPLY -> HID_NVIDIA_SHIELD -> LEDS_CLASS
> > 
> > In Yocto distro we use additional tools[1] to check that kconfig elements in fragments actually
> > get applied in the final .config etc and one of the checks is for dependency loops which now
> > fails with 7.4-rc1, full log below[2].
> > 
> > To me it looks like EC_ASUS_GLYMUR correctly depends on LEDS_CLASS and that enabling this
> > driver by default on arm64 with LEDS_CLASS is correct. And also HID_NVIDIA_SHIELD correctly
> > depends on LEDS_CLASS. Thus I don't think the drivers are doing anything wrong and thus
> > on the Yocto kernel QA check side the dependency loop check should be relaxed since they
> > now can exists in the kernel tree.
> > 
> > Do you agree to this or is there maybe some way to remove the kernel side kconfig dependency
> > loop to and from LEDS_CLASS?
> 
> https://lore.kernel.org/lkml/20261029021330.460192-1-haiyuewa@163.com/

Ah, excellent! Fix is coming soon then.

Cheers,

-Mikko
