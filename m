Received: from mail-lf1-f49.google.com (mail-lf1-f49.google.com [209.85.167.49])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 937D23AA1A8
	for <devicetree@vger.kernel.org>; Tue, 31 Mar 2026 13:20:39 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.167.49
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1774963240; cv=none; b=A02gCw2tageXjuF15hEDBvGA+VZNBBl6GgsxRAztsdScYrNzMFUQFatvewHTDpTh1dETKcadaPcIk04fV5iUxHqGTI7H03Ldg8oa7bUGIQr5vupzucIZy8/Ftmz6Rv8KM1jDOyjEmYiO1+S2PKX+Kf5GAS/ajoR/8sbY/OKqKD8=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1774963240; c=relaxed/simple;
	bh=FHCG1eyKPTFyYzgTJ8AuOuQbuY4G/koxwDmMSh7hUqE=;
	h=Message-ID:Date:MIME-Version:Subject:To:Cc:References:From:
	 In-Reply-To:Content-Type; b=EPDNmYyCATHOW5YuIK/YEyFbhpvw5S2AEl6c9uoCf9+XmpZocOH8W/mAbFU9Kl9bPT0F09Vf3RnwWZrYfMyAYr+AmJzo9sdH3DBgrJWdXTz83QQdxGz/Jmj+kVQYygSXaHwgKVRLxAPRktu7OlTgeevohwUZja3xKZNbA8HSVoA=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org; spf=pass smtp.mailfrom=linaro.org; dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b=YKDlbfPN; arc=none smtp.client-ip=209.85.167.49
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=linaro.org
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b="YKDlbfPN"
Received: by mail-lf1-f49.google.com with SMTP id 2adb3069b0e04-5a2c0615d6fso30291e87.2
        for <devicetree@vger.kernel.org>; Tue, 31 Mar 2026 06:20:39 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1774963238; x=1775568038; darn=vger.kernel.org;
        h=content-transfer-encoding:in-reply-to:from:references:cc:to:subject
         :user-agent:mime-version:date:message-id:from:to:cc:subject:date
         :message-id:reply-to;
        bh=8Fd2h35A9jrPAd01iGaIxV/0FHNMxJJdX6ssgg+Eiwc=;
        b=YKDlbfPNBYT/RzZYT0AEy6bhZdIHIaPWEUMKgdo8Qw1uLVnbYcmnuAON9e+9NWXl3I
         TVPzZwo4e539EPFMnU/Uuj98yNLXnYyDgisFZdhnDkqPTZOnEFcVmMjpsAhFp/+0ASi9
         o8RE7rGXKvak62nMUm1uWGjH1iXRdSk7qVMoIK2jDBf+OE4RPcuMoXTETfgkONUqmftO
         Tmh0k3LcKw1nb4dMHiy5uK/sRPBlBL6WjR0oIIKOLhDas5M9iRdJ2983ZszUmwCIc2kx
         Li8dilXnUx738GWXm8oyn6cjrWcrjMUBeBwy4Kttf1qg1b508IJ5I1L2PK29FsCDitpY
         8D/Q==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1774963238; x=1775568038;
        h=content-transfer-encoding:in-reply-to:from:references:cc:to:subject
         :user-agent:mime-version:date:message-id:x-gm-gg:x-gm-message-state
         :from:to:cc:subject:date:message-id:reply-to;
        bh=8Fd2h35A9jrPAd01iGaIxV/0FHNMxJJdX6ssgg+Eiwc=;
        b=tTKYNdysYtDb3NhD1Y9EASjyfUya5gRuzd4nNVwlHtI11vi1+YSAxQPPEGyGP8qwzQ
         eiw+VDnsU+8ihBkLV2Jb7MZeqzilAUP5/C48JjIwfh4tpZyw7iM4mzHKuSfsupXyF4PS
         8P+FxWzu9xQFC+nTAyTJ4gX7UFasR1Fy8PJw/BazAhbFLXu9lfBXNA/h7ClRatLRNFNT
         JROskK/X9RS2FJXU0/xGwYI8ICy8me4p8zD5ipIF0NZ2HjylsaDeQTTjKiLeYUmCJJUK
         Fw5etQBDkvcWykfxWoQ8/J2Qwo7IXzazqG5POJOKPCjb+HRyxRsbyoQCTkCohvZnljzB
         KiZw==
X-Forwarded-Encrypted: i=1; AJvYcCVCbSf6U2xpvsrDF3h0Yqt3zf0CPIQ6XZZ6PBx2TXloPMkRfqT6X1FQ7QOKX0nKGtrU3m3K0EaIQZ05@vger.kernel.org
X-Gm-Message-State: AOJu0YwWFGiOc3z/hqPvvoqPq/DdrT0LGZQgimUwiP0iU6exayx07f6X
	p02UQmbOmuUnLaxJzC8kaDVFgHNLycTYtSGZcBLuDP+7I+FqxuhSZzj4ixw/SKEkGzQ=
X-Gm-Gg: ATEYQzzmNQsPtbVe6Xps7aGutxCJVkuj01fnaP9NvZUZqER9m5k3WuUibpHqrahwj4v
	DJC8KBHO27PMFL5YhjxJpt2Eb8ZlHitnN30b+5zjdO2sEjHrDlAcak6QjIb6pjnXxzoKL8ZVzhv
	wDEkEa12Hby8mtuYgR+Us76Jc2KTzo20z8smzyxA112gC737VCenSqGGLfnLa36l/pcz12rgDsJ
	R8HvuM8vAyGZ//MInkJE8dPT5N5D547FEagGDWINROc6PT0YiDiSkULrs7g2Lhh1p6DyGBfmRE3
	0Fmnzh6zuVbMpG0p7MDvr9h8nb63iKIwvWJOY+HqFMmbhW+slEK+lXC2N4MCyzVmDgAfMqtPbzs
	6tgc4FXSRHKXDuqVo1vw4HV5qpvW+tx5ARPcxSzJZkSR2Ujmic1R0lpNvHh2i9zivMApsm16s9G
	5fnH1OqLY37VBVVVNzobJUixCkUZ8I/0/JyCg4wrfUFxv6LPK1aA2sfpS815IL6yKxbZkFE99I+
	34Ayg==
X-Received: by 2002:a05:6512:3b9f:b0:5a2:8516:a52a with SMTP id 2adb3069b0e04-5a2ab5fcfcamr2769606e87.2.1774963237655;
        Tue, 31 Mar 2026 06:20:37 -0700 (PDT)
Received: from [192.168.1.100] (91-159-24-186.elisa-laajakaista.fi. [91.159.24.186])
        by smtp.gmail.com with ESMTPSA id 2adb3069b0e04-5a2b140a4d3sm2395494e87.34.2026.03.31.06.20.36
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Tue, 31 Mar 2026 06:20:37 -0700 (PDT)
Message-ID: <bc4579ce-294b-4553-8166-55cf4888c6a7@linaro.org>
Date: Tue, 31 Mar 2026 16:20:36 +0300
Precedence: bulk
X-Mailing-List: devicetree@vger.kernel.org
List-Id: <devicetree.vger.kernel.org>
List-Subscribe: <mailto:devicetree+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:devicetree+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v4 2/3] media: qcom: camss: Add SM6350 support
To: Luca Weiss <luca.weiss@fairphone.com>, Bryan O'Donoghue <bod@kernel.org>,
 Robert Foss <rfoss@kernel.org>, Todor Tomov <todor.too@gmail.com>,
 Mauro Carvalho Chehab <mchehab@kernel.org>, Rob Herring <robh@kernel.org>,
 Krzysztof Kozlowski <krzk+dt@kernel.org>, Conor Dooley
 <conor+dt@kernel.org>, Bryan O'Donoghue <bryan.odonoghue@linaro.org>,
 Bjorn Andersson <andersson@kernel.org>,
 Konrad Dybcio <konradybcio@kernel.org>
Cc: ~postmarketos/upstreaming@lists.sr.ht, phone-devel@vger.kernel.org,
 linux-arm-msm@vger.kernel.org, linux-media@vger.kernel.org,
 devicetree@vger.kernel.org, linux-kernel@vger.kernel.org
References: <20260216-sm6350-camss-v4-0-b9df35f87edb@fairphone.com>
 <20260216-sm6350-camss-v4-2-b9df35f87edb@fairphone.com>
From: Vladimir Zapolskiy <vladimir.zapolskiy@linaro.org>
In-Reply-To: <20260216-sm6350-camss-v4-2-b9df35f87edb@fairphone.com>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit

On 2/16/26 10:54, Luca Weiss wrote:
> Add the necessary support for CAMSS on the SM6350 SoC.
> 
> Reviewed-by: Bryan O'Donoghue <bryan.odonoghue@linaro.org>
> Signed-off-by: Luca Weiss <luca.weiss@fairphone.com>

Reviewed-by: Vladimir Zapolskiy <vladimir.zapolskiy@linaro.org>

-- 
Best wishes,
Vladimir
