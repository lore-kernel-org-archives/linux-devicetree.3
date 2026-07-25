Received: from mail-lf1-f52.google.com (mail-lf1-f52.google.com [209.85.167.52])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 34BA5175A95
	for <devicetree@vger.kernel.org>; Sat, 25 Jul 2026 10:14:06 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.167.52
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1784974447; cv=none; b=j371DzixDTCDWPSDp81I4ICCtshEhnH+xTzu19Qu9tqN+5g8IJOzJvwh2MznEF8n3vpRTT0rj0gc96gjONTvPlso81wzNqpBs7rLbYs2O8ivDpDOCB/YXvWgk7I1MSvQwDav8Nyz0cBUygBEQhwbzbiPzS31fVkS0J24l3TbDUc=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1784974447; c=relaxed/simple;
	bh=CdTDJUcqSLsVPWjQw81bCST4cL8xQYNSY97v4bQRwj0=;
	h=Message-ID:Date:MIME-Version:Subject:To:Cc:References:From:
	 In-Reply-To:Content-Type; b=F6qHHKvwrXP7DFDs/uMWwL4UtPSBduEp3l38yD8uS+8oMTdY8QfLoAD3IWPtWExnUbX9dHBq5p2R+WV832nx6xzcsMzHifHXmhKRsOj2tzUBKbAdOniMRMWkmKGIaK7lGzQRk7CB2YLoH79qAz65ATf77hpmtRW0weE0GfLsyKg=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org; spf=pass smtp.mailfrom=linaro.org; dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b=Q5pq4MhO; arc=none smtp.client-ip=209.85.167.52
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=linaro.org
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b="Q5pq4MhO"
Received: by mail-lf1-f52.google.com with SMTP id 2adb3069b0e04-5aeafa51b5cso153580e87.1
        for <devicetree@vger.kernel.org>; Sat, 25 Jul 2026 03:14:05 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1784974444; x=1785579244; darn=vger.kernel.org;
        h=content-transfer-encoding:content-type:in-reply-to:from:references
         :cc:to:subject:user-agent:mime-version:date:message-id:from:to:cc
         :subject:date:message-id:reply-to:content-type;
        bh=egMHTHxWFQyh6fekGfV4FZbVfp3OyPJ8sTvFYBVlJAE=;
        b=Q5pq4MhO8e1qstW4RVyOcVVr5LY0Eq4aPPA9O7I3SUM/JoIRqd5wxzSqcRmDZsjWTr
         oB5mU0BKdLmILNz/n2Cl/Km3dX2fhKpQh4Y7RaUhJL1t20E7p4PxBMjTzoEJAFcYhUuV
         1QEcERXJyegjSrgA1EmS54Lo9VzOcFGzzHX6H3He1hwoA3cMrXl+OPVMWMqaPZSFK+WE
         C6g8SR2JbMRL0vtEowuKuYr6yriHNKfMvctgC5e9meRafTnP0RojDLpPg5678puQvFDi
         xjc2COCCfGf7uZMIkXR38DgLRUlgC1ifxP5UQCeqfxKz7uueNUprB8QZNtSI33jIbfcR
         CiCg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1784974444; x=1785579244;
        h=content-transfer-encoding:content-type:in-reply-to:from:references
         :cc:to:subject:user-agent:mime-version:date:message-id:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=egMHTHxWFQyh6fekGfV4FZbVfp3OyPJ8sTvFYBVlJAE=;
        b=hA/y7or2y59G8UFJ193ARwiKYz++Qe+owvOerHYdAdgqSSqsfCZO8MaR5CpbLJOqtz
         IrE8hngfuSSJxldWAb5xjlcsITyCy/Ecn20cELbQJvd3yySlyoXOQoRS/Cd6Jr/l8aki
         VseoLPx8vbi1FohyX0vsXcSmOocd76BQfSnX03r1MuF2bBng3R8TVTUk3dFDhcJl4GoA
         YIMELDJvHQ8pKLZwdDAEb7Zl/D6TiKyyrgVcvgVe1CkyskiG9JHUrcj3J55GH4BI8bqI
         D+Q9rtHKrN3pNaH0eKF37HkS1GjlP5vUUzzBoFuobdJuNvXQLltO/BAQJClVbQNrh+0N
         oCng==
X-Forwarded-Encrypted: i=1; AHgh+RopzndQa2fPpJiHh8DVsaCxUt9QrV9zVbtW5KgI/3mX2ElAlhmZT+kU9tK6V/4cxhs3uPli46V3MjAT@vger.kernel.org
X-Gm-Message-State: AOJu0YyCWS98jQXoxEUNYYSqjqclRU/J0ztIRiX0tnlKgwWs9mEDpxwx
	9IhWfKlDRIV74VMjya3P9uEob9LvGkpWq5fUNVLUUG0oo4AUOoNk+XO53SC/uaRKtEQ=
X-Gm-Gg: AR+sD10yJKf1ncNY+85fH0m5ElB9zuxbP0Sj3sYbtPIaS6Fl4DplOO6XXnbargXXKZm
	5Phg00pdistplUw/JX4lEVTTVlxGS9newe3pWfKR0u/fBeYxxq5KIFWb86tCmuHke0JKqd7cdbV
	V+SRzPHGDs1VIUDvu0HyAt5J/pMppQHNHzPg6jT0JQ9lYr2j0JOIFsb2zE/rYB2KBaKk2OwH7CQ
	06polMXMZhajJ7HA7MYPlWVv8nBSypPdV/b816gPGEBKLE4eYZB3Am2vt9dJszuhlZFmgE6L7ar
	QryA4BSLQPr9F3lwP4Nnimi8zgxNEuDBeMSNqQHPo7gXpgPENpaSviTt+vvkUuUNyrPsb5C1gzr
	1jaahorJ3Xnh+f28p11Ot5tGow98atSVKOmHOxcF5DWD1PuT6lmY65gjhwnE+dJ1q7luhyQ3wie
	gUcBD2qqZBb7qreFiH6ua2tkwGDtGHeM3pRWTT2lKCBa1ek1RkABMzYSYWn22HoKIxQyY=
X-Received: by 2002:a05:6512:31d2:b0:5ae:b7c0:f231 with SMTP id 2adb3069b0e04-5b2c1b35f0amr212631e87.7.1784974444095;
        Sat, 25 Jul 2026 03:14:04 -0700 (PDT)
Received: from [192.168.1.100] (91-159-24-186.elisa-laajakaista.fi. [91.159.24.186])
        by smtp.gmail.com with ESMTPSA id 2adb3069b0e04-5b2be1d863bsm368823e87.53.2026.07.25.03.14.02
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Sat, 25 Jul 2026 03:14:03 -0700 (PDT)
Message-ID: <940d7267-cdfb-4dbd-9b4a-6fcd26c4fd58@linaro.org>
Date: Sat, 25 Jul 2026 13:14:02 +0300
Precedence: bulk
X-Mailing-List: devicetree@vger.kernel.org
List-Id: <devicetree.vger.kernel.org>
List-Subscribe: <mailto:devicetree+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:devicetree+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v2 2/2] media: i2c: Add Samsung S5KJN5 image sensor driver
To: Wenmeng Liu <wenmeng.liu@oss.qualcomm.com>,
 Mauro Carvalho Chehab <mchehab@kernel.org>, Rob Herring <robh@kernel.org>,
 Krzysztof Kozlowski <krzk+dt@kernel.org>, Conor Dooley
 <conor+dt@kernel.org>, Sakari Ailus <sakari.ailus@linux.intel.com>
Cc: linux-media@vger.kernel.org, devicetree@vger.kernel.org,
 linux-kernel@vger.kernel.org
References: <20260724-sk5jn5-v2-0-871d3b9a2e47@oss.qualcomm.com>
 <20260724-sk5jn5-v2-2-871d3b9a2e47@oss.qualcomm.com>
From: Vladimir Zapolskiy <vladimir.zapolskiy@linaro.org>
In-Reply-To: <20260724-sk5jn5-v2-2-871d3b9a2e47@oss.qualcomm.com>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit

On 7/24/26 12:50, Wenmeng Liu wrote:
> Add a V4L2 sub-device driver for the Samsung S5KJN5, a 50 MP GBRG 10-bit
> RAW MIPI CSI-2 image sensor. The driver supports the 4096x3072 mode and
> exposes the standard controls (exposure, gain, vblank/hblank, test
> pattern).
> 
> Signed-off-by: Wenmeng Liu <wenmeng.liu@oss.qualcomm.com>

<snip>

> +
> +static const struct s5kjn5_init_op s5kjn5_init_ops[] = {
> +	{ .reg = CCI_REG16(0xfcfc), .val = 0x4000 },
> +	{ .reg = CCI_REG16(0x0000), .val = 0x000e },
> +	{ .reg = CCI_REG16(0x0000), .val = 0x38e5 },

One more comment:

.val = S5KJN5_CHIP_ID

> +	{ .reg = CCI_REG16(0x6018), .val = 0x0001 },
> +	{ .reg = CCI_REG16(0x7002), .val = 0x0408 },
> +	{ .reg = CCI_REG16(0x6014), .val = 0x0001 },
> +	{ .reg = CCI_REG16(0xfcfc), .val = 0x2002 },
> +	{ .reg = CCI_REG16(0x1e92), .val = 0x8000 },
> +	{ .reg = CCI_REG8(0x1e84), .val = 0x28 },
> +	{ .reg = CCI_REG8(0x1e85), .val = 0x2b },
> +	{ .reg = CCI_REG8(0x1e86), .val = 0x03 },
> +	{ .reg = CCI_REG8(0x1e87), .val = 0x20 },
> +	{ .reg = CCI_REG16(0xfcfc), .val = 0x4000 },
> +	{ .reg = CCI_REG16(0x7002), .val = 0x0008 },
> +	{ .delay_us = 5000 },

-- 
Best wishes,
Vladimir
