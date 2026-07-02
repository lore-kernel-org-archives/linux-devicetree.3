Received: from mail-lf1-f50.google.com (mail-lf1-f50.google.com [209.85.167.50])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 8AC774963DF
	for <devicetree@vger.kernel.org>; Thu,  2 Jul 2026 13:16:46 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.167.50
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1782998208; cv=none; b=jGZpjUtQrwV0xyDGHa743c1jX9XtEuiteV76IapWUTaOqbz7om9z4ef2forh/36Ga2mH1/b+fKQEB9xrKlPOaZznDVueV1LGn5yDCDUJfTW7P+Kahs1dfqmjE3cpWDnEzOWSMDAY8IXiGufffnFqAMpglrwBba2nyLqQYnG9NtE=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1782998208; c=relaxed/simple;
	bh=MyNgPgi4VTa/Eh7rf74k4K7gJeg5J1GOT+xkEcfOW70=;
	h=Message-ID:Date:MIME-Version:Subject:To:Cc:References:From:
	 In-Reply-To:Content-Type; b=OYeoSUNrya+LTQ/eqwadvU0sNrPeffXrj3ZC+6j45zHWJOPkpLkyJ4+UR+Uzhnm9FMew2glwA2kHp0nvYtrvQc5O940Emdb+tjJdRYKqlz5hvf2kkWUts846uucoAM8FPRmqfiE9AjEdoOGjUT2RO4jlSM61w/ISuYmI4r3HRAg=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org; spf=pass smtp.mailfrom=linaro.org; dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b=CgvhbN3R; arc=none smtp.client-ip=209.85.167.50
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=linaro.org
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b="CgvhbN3R"
Received: by mail-lf1-f50.google.com with SMTP id 2adb3069b0e04-5aebd7da975so229147e87.2
        for <devicetree@vger.kernel.org>; Thu, 02 Jul 2026 06:16:46 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1782998205; x=1783603005; darn=vger.kernel.org;
        h=content-transfer-encoding:content-type:in-reply-to:from:references
         :cc:to:subject:user-agent:mime-version:date:message-id:from:to:cc
         :subject:date:message-id:reply-to:content-type;
        bh=ZtKHWG50Be6Ag56YyRc9bmaoYqyMW9eXnUtOgDLozMk=;
        b=CgvhbN3R+KBCZphNmqJZixHJEB5CW676HiuDGdPtE66h3oKOqN+kLRk9WBrXIfPzGv
         PaHV0WwJ1eYD8R3gRKGnXe9JqOrbG4mVMwd1MJs0lWcXn6BhbUVHwJgJmNIaTrRZtx/q
         fT6tfCvYo+E5jWdaZgIJ852sKkK/XWCZGTpdd4vIszGc3ITZyV3lsaErxpNkuww/FOWq
         2bnXFiLM7vdN18hHboK0xl2LiVl4GBGxLcVe52CdpfPSScLoCIWBYzcU91WyTlpPogGK
         8CPO1xU4raeLmold9TXGe0lWPFX85SoqkZsM3RLy4vA3UZWiuwUs3gr7nEox1zyYVrFV
         E63Q==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1782998205; x=1783603005;
        h=content-transfer-encoding:content-type:in-reply-to:from:references
         :cc:to:subject:user-agent:mime-version:date:message-id:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=ZtKHWG50Be6Ag56YyRc9bmaoYqyMW9eXnUtOgDLozMk=;
        b=repJpCQLM9f0kfydRaAZCOqoOPiMilbIYnnUGEgiw7C6N/VQuMD1baK6XWo2/azPOz
         cakdr67scP3zYEVzBYOZmPNpROwAJFmOQtRpaGDAlTzai+IS+IpTIWBpcJf4x5cuEink
         W1JjOwkfMtcdhSEJKrM137lIf2F8G0n3aTJZNPxUEoKk76ZtDD81ma46NaVe9AgUk+rR
         SG6Twvad+DPOkTuGagVyTbhqi7hwRpRxNBcnq+EkWGgo0R/evUQ5G37W8k1qf6pOjvPr
         rB05I81X+0oX1hTg9EK+SQoj2Gb6RbJ7blMeCgxbEPWPDTEXr7fntWvpSPHGdevMEcoV
         J6kQ==
X-Forwarded-Encrypted: i=1; AHgh+RqwYbfxxUEeSmps4czndKHJruyQptdX1Qs+mvopXdG6MSLQzgz0OXqqQCtNCS30b50N2H/phAluXZUt@vger.kernel.org
X-Gm-Message-State: AOJu0YzHz0FA4JFeiIEBeaFHwwu/khyqBvWQ9gdjsHLWTIo6l1YeOpZ4
	XmWZzPOPawcRsQRrxIqpLt/pQj8m/bisORckL1UOjmp60MV7CpVhVUPoqBMyQlJe+/0=
X-Gm-Gg: AfdE7cm34Xuubh8LEgp7Q8WzclB8t1eqNaB2jaj0VXVrwLtGzjWPa9fvtCyR+eSs9Ks
	jy+40ElWZVeJx+V9m0PvT18UhINTF8c46VXjNDbbnlnF92sA2oD7mIZjUF9CALV6SRLdv2SPhey
	/r3DohWQI37os9znsHxE/F7IBSEqxSJN6bn6gVvdy1zZFgBJ7ge9FM5f4uM3JmEub1cJ9ixHhO9
	6hQL1oH99XD11V6ehLFWmins/dIa/PX5FLE4EBq7xgXM12wFa5lIrk/K0V+DygLwqsPT+MRRWXb
	X5EaIcfc/SFOFQFlFfT9UL+9TqRaGJsupjI663Z6zt+k9p7fnQbo8hzmgJR3SaH7R607g05/1B3
	WOdEzIJPw1Od7cNZec0AAFvwZdQDyOdyBPestOkfDSMFulIwoO2BELwb8fJWN7Ju/Ssd0dNJaeT
	hnVY3KTNHyPOz8YUU0h/joz97epJO0cziFQHXLET3J+aOULp2ao28B42tSjMjUYs7ViK0=
X-Received: by 2002:a05:6512:3190:b0:5ae:a6fc:171c with SMTP id 2adb3069b0e04-5aec6d7ee11mr836503e87.3.1782998204639;
        Thu, 02 Jul 2026 06:16:44 -0700 (PDT)
Received: from [192.168.1.100] (91-159-24-186.elisa-laajakaista.fi. [91.159.24.186])
        by smtp.gmail.com with ESMTPSA id 2adb3069b0e04-5aec899a311sm684822e87.20.2026.07.02.06.16.43
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Thu, 02 Jul 2026 06:16:43 -0700 (PDT)
Message-ID: <1cb443d2-e4a7-4756-a6aa-af5c34ca7d51@linaro.org>
Date: Thu, 2 Jul 2026 16:16:43 +0300
Precedence: bulk
X-Mailing-List: devicetree@vger.kernel.org
List-Id: <devicetree.vger.kernel.org>
List-Subscribe: <mailto:devicetree+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:devicetree+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v2 3/3] media: i2c: og0ve1b: Add support for OmniVision
 OG0VA1B
To: Wenmeng Liu <wenmeng.liu@oss.qualcomm.com>,
 Mauro Carvalho Chehab <mchehab@kernel.org>, Rob Herring <robh@kernel.org>,
 Krzysztof Kozlowski <krzk+dt@kernel.org>, Conor Dooley
 <conor+dt@kernel.org>, Sakari Ailus <sakari.ailus@linux.intel.com>
Cc: linux-media@vger.kernel.org, devicetree@vger.kernel.org,
 linux-kernel@vger.kernel.org
References: <20260702-og0va1b-v2-0-0071442caa2a@oss.qualcomm.com>
 <20260702-og0va1b-v2-3-0071442caa2a@oss.qualcomm.com>
From: Vladimir Zapolskiy <vladimir.zapolskiy@linaro.org>
In-Reply-To: <20260702-og0va1b-v2-3-0071442caa2a@oss.qualcomm.com>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit

On 7/2/26 13:52, Wenmeng Liu wrote:
> The OmniVision OG0VA1B is a monochrome image sensor closely related to
> the OG0VE1B. It shares the SCCB control interface, power supplies and
> the single-lane MIPI D-PHY description, and differs in its chip id, the
> test pattern register, the register programming and the output format
> (10-bit RAW instead of 8-bit).
> 
> Add an og0ve1b_sensor_data entry describing the OG0VA1B together with
> its 640x480 60fps register sequence.
> 
> Signed-off-by: Wenmeng Liu <wenmeng.liu@oss.qualcomm.com>
> ---
>   drivers/media/i2c/og0ve1b.c | 234 +++++++++++++++++++++++++++++++++++++++++++-
>   1 file changed, 230 insertions(+), 4 deletions(-)
> 
> diff --git a/drivers/media/i2c/og0ve1b.c b/drivers/media/i2c/og0ve1b.c
> index acc06b10bf896f734926289099a70fbc2bb628d5..f1f4fcd195c4e2dd69f78ba3f01f768a052e6c5d 100644
> --- a/drivers/media/i2c/og0ve1b.c
> +++ b/drivers/media/i2c/og0ve1b.c
> @@ -17,8 +17,12 @@
>   #define OG0VE1B_LINK_FREQ_500MHZ	(500 * HZ_PER_MHZ)
>   #define OG0VE1B_MCLK_FREQ_24MHZ		(24 * HZ_PER_MHZ)
>   
> +#define OG0VA1B_LINK_FREQ_480MHZ	(480 * HZ_PER_MHZ)
> +#define OG0VA1B_MCLK_FREQ_19_2MHZ	(19200 * HZ_PER_KHZ)
> +
>   #define OG0VE1B_REG_CHIP_ID		CCI_REG24(0x300a)
>   #define OG0VE1B_CHIP_ID			0xc75645
> +#define OG0VA1B_CHIP_ID			0xc75641

Please keep the list alphabetically sorted, also it's fine if
"OG0VE1B_REG_CHIP_ID" is reduced to "OG0V_REG_CHIP_ID".

>   
>   #define OG0VE1B_REG_MODE_SELECT		CCI_REG8(0x0100)
>   #define OG0VE1B_MODE_STANDBY		0x00
> @@ -45,8 +49,9 @@
>   #define OG0VE1B_REG_VTS			CCI_REG16(0x380e)
>   #define OG0VE1B_VTS_MAX			0xffff
>   
> -/* Test pattern */
> +/* Test pattern - OG0VE1B uses 0x5e00, OG0VA1B uses 0x5100 */
>   #define OG0VE1B_REG_PRE_ISP		CCI_REG8(0x5e00)
> +#define OG0VA1B_REG_TEST_PATTERN	CCI_REG8(0x5100)
>   #define OG0VE1B_TEST_PATTERN_ENABLE	BIT(7)
>   
>   #define to_og0ve1b(_sd)			container_of(_sd, struct og0ve1b, sd)
> @@ -55,6 +60,10 @@ static const s64 og0ve1b_link_freq_menu[] = {
>   	OG0VE1B_LINK_FREQ_500MHZ,
>   };
>   
> +static const s64 og0va1b_link_freq_menu[] = {
> +	OG0VA1B_LINK_FREQ_480MHZ,
> +};
> +
>   struct og0ve1b_reg_list {
>   	const struct cci_reg_sequence *regs;
>   	unsigned int num_regs;
> @@ -72,9 +81,14 @@ struct og0ve1b_mode {
>   };
>   
>   struct og0ve1b_sensor_data {
> +	const char *name;
>   	u64 chip_id;
>   	unsigned long mclk_freq;
>   	u32 test_pattern_reg;
> +	/* Exposure register unit: OG0VE1B 1/16 line (4), OG0VA1B whole lines (0). */
> +	unsigned int exposure_shift;
> +	/* Pixel rate multiplier: OG0VA1B uses CSI-2 DDR (2), OG0VE1B keeps 1. */
> +	unsigned int pixel_rate_mul;
>   	const s64 *link_freq_menu;
>   	int num_link_freqs;
>   	const struct og0ve1b_mode *modes;
> @@ -272,16 +286,223 @@ static const struct og0ve1b_mode supported_modes[] = {
>   	},
>   };
>   
> +static const struct cci_reg_sequence og0va1b_640x480_60fps_mode[] = {
> +	{ CCI_REG8(0x0302), 0x31 },
> +	{ CCI_REG8(0x0303), 0x02 },
> +	{ CCI_REG8(0x0304), 0x01 },
> +	{ CCI_REG8(0x0305), 0x90 },
> +	{ CCI_REG8(0x0306), 0x00 },
> +	{ CCI_REG8(0x0323), 0x02 },
> +	{ CCI_REG8(0x0325), 0x68 },
> +	{ CCI_REG8(0x0326), 0xd8 },
> +	{ CCI_REG8(0x3006), 0x0e },
> +	{ CCI_REG8(0x300d), 0x08 },
> +	{ CCI_REG8(0x3018), 0xf0 },
> +	{ CCI_REG8(0x301c), 0xf0 },
> +	{ CCI_REG8(0x3020), 0x20 },
> +	{ CCI_REG8(0x3040), 0x0f },
> +	{ CCI_REG8(0x3022), 0x01 },
> +	{ CCI_REG8(0x3107), 0x40 },
> +	{ CCI_REG8(0x3216), 0x01 },
> +	{ CCI_REG8(0x3217), 0x00 },
> +	{ CCI_REG8(0x3218), 0xc0 },
> +	{ CCI_REG8(0x3219), 0x55 },
> +	{ CCI_REG8(0x3506), 0x01 },
> +	{ CCI_REG8(0x3507), 0x50 },
> +	{ CCI_REG8(0x3508), 0x01 },
> +	{ CCI_REG8(0x3509), 0x00 },
> +	{ CCI_REG8(0x350a), 0x01 },
> +	{ CCI_REG8(0x350b), 0x00 },
> +	{ CCI_REG8(0x350c), 0x00 },
> +	{ CCI_REG8(0x3541), 0x00 },
> +	{ CCI_REG8(0x3542), 0x40 },
> +	{ CCI_REG8(0x3605), 0x90 },
> +	{ CCI_REG8(0x3606), 0x41 },
> +	{ CCI_REG8(0x3612), 0x00 },
> +	{ CCI_REG8(0x3620), 0x08 },
> +	{ CCI_REG8(0x3630), 0x17 },
> +	{ CCI_REG8(0x3631), 0x99 },
> +	{ CCI_REG8(0x3639), 0x88 },
> +	{ CCI_REG8(0x3668), 0x00 },
> +	{ CCI_REG8(0x3674), 0x00 },
> +	{ CCI_REG8(0x3677), 0x3f },
> +	{ CCI_REG8(0x368f), 0x06 },
> +	{ CCI_REG8(0x36a2), 0x19 },
> +	{ CCI_REG8(0x36a4), 0xf1 },
> +	{ CCI_REG8(0x36a5), 0x2d },
> +	{ CCI_REG8(0x3706), 0x30 },
> +	{ CCI_REG8(0x370d), 0x72 },
> +	{ CCI_REG8(0x3713), 0x86 },
> +	{ CCI_REG8(0x3715), 0x03 },
> +	{ CCI_REG8(0x3716), 0x00 },
> +	{ CCI_REG8(0x376d), 0x24 },
> +	{ CCI_REG8(0x3770), 0x3a },
> +	{ CCI_REG8(0x3778), 0x00 },
> +	{ CCI_REG8(0x37a8), 0x03 },
> +	{ CCI_REG8(0x37a9), 0x00 },
> +	{ CCI_REG8(0x37df), 0x7d },
> +	{ CCI_REG8(0x3800), 0x00 },
> +	{ CCI_REG8(0x3801), 0x00 },
> +	{ CCI_REG8(0x3802), 0x00 },
> +	{ CCI_REG8(0x3803), 0x00 },
> +	{ CCI_REG8(0x3804), 0x02 },
> +	{ CCI_REG8(0x3805), 0x8f },
> +	{ CCI_REG8(0x3806), 0x01 },
> +	{ CCI_REG8(0x3807), 0xef },
> +	{ CCI_REG8(0x3808), 0x02 },
> +	{ CCI_REG8(0x3809), 0x80 },
> +	{ CCI_REG8(0x380a), 0x01 },
> +	{ CCI_REG8(0x380b), 0xe0 },
> +	{ CCI_REG8(0x380c), 0x01 },
> +	{ CCI_REG8(0x380d), 0x78 },
> +	{ CCI_REG8(0x380e), 0x08 },
> +	{ CCI_REG8(0x380f), 0x30 },
> +	{ CCI_REG8(0x3810), 0x00 },
> +	{ CCI_REG8(0x3811), 0x08 },
> +	{ CCI_REG8(0x3812), 0x00 },
> +	{ CCI_REG8(0x3813), 0x08 },
> +	{ CCI_REG8(0x3814), 0x11 },
> +	{ CCI_REG8(0x3815), 0x11 },
> +	{ CCI_REG8(0x3816), 0x00 },
> +	{ CCI_REG8(0x3817), 0x01 },
> +	{ CCI_REG8(0x3818), 0x00 },
> +	{ CCI_REG8(0x3819), 0x05 },
> +	{ CCI_REG8(0x3820), 0x40 },
> +	{ CCI_REG8(0x3821), 0x04 },
> +	{ CCI_REG8(0x3823), 0x00 },
> +	{ CCI_REG8(0x3826), 0x00 },
> +	{ CCI_REG8(0x3827), 0x00 },
> +	{ CCI_REG8(0x382b), 0x52 },
> +	{ CCI_REG8(0x384a), 0xa2 },
> +	{ CCI_REG8(0x3858), 0x00 },
> +	{ CCI_REG8(0x3859), 0x00 },
> +	{ CCI_REG8(0x3860), 0x00 },
> +	{ CCI_REG8(0x3861), 0x00 },
> +	{ CCI_REG8(0x3866), 0x0c },
> +	{ CCI_REG8(0x3867), 0x07 },
> +	{ CCI_REG8(0x3884), 0x00 },
> +	{ CCI_REG8(0x3885), 0x08 },
> +	{ CCI_REG8(0x3888), 0x50 },
> +	{ CCI_REG8(0x3893), 0x6c },
> +	{ CCI_REG8(0x3898), 0x00 },
> +	{ CCI_REG8(0x389a), 0x04 },
> +	{ CCI_REG8(0x389b), 0x01 },
> +	{ CCI_REG8(0x389c), 0x0b },
> +	{ CCI_REG8(0x389d), 0xdc },
> +	{ CCI_REG8(0x38b1), 0x04 },
> +	{ CCI_REG8(0x38b2), 0x00 },
> +	{ CCI_REG8(0x38b3), 0x08 },
> +	{ CCI_REG8(0x38c1), 0x46 },
> +	{ CCI_REG8(0x38c9), 0x02 },
> +	{ CCI_REG8(0x38d4), 0x06 },
> +	{ CCI_REG8(0x38d5), 0x5a },
> +	{ CCI_REG8(0x38d6), 0x08 },
> +	{ CCI_REG8(0x38d7), 0x3a },
> +	{ CCI_REG8(0x391f), 0x00 },
> +	{ CCI_REG8(0x3920), 0xaa },
> +	{ CCI_REG8(0x3921), 0x00 },
> +	{ CCI_REG8(0x3922), 0x00 },
> +	{ CCI_REG8(0x3923), 0x00 },
> +	{ CCI_REG8(0x3924), 0x00 },
> +	{ CCI_REG8(0x3925), 0x00 },
> +	{ CCI_REG8(0x3926), 0x00 },
> +	{ CCI_REG8(0x3927), 0x00 },
> +	{ CCI_REG8(0x3928), 0x10 },
> +	{ CCI_REG8(0x3929), 0x01 },
> +	{ CCI_REG8(0x392a), 0xb4 },
> +	{ CCI_REG8(0x392b), 0x00 },
> +	{ CCI_REG8(0x392c), 0x10 },
> +	{ CCI_REG8(0x392d), 0x01 },
> +	{ CCI_REG8(0x392e), 0x78 },
> +	{ CCI_REG8(0x392f), 0x4a },
> +	{ CCI_REG8(0x391e), 0x01 },
> +	{ CCI_REG8(0x389f), 0x08 },
> +	{ CCI_REG8(0x38a0), 0x00 },
> +	{ CCI_REG8(0x38a1), 0x00 },
> +	{ CCI_REG8(0x3a06), 0x06 },
> +	{ CCI_REG8(0x3a07), 0x78 },
> +	{ CCI_REG8(0x3a08), 0x08 },
> +	{ CCI_REG8(0x3a09), 0x80 },
> +	{ CCI_REG8(0x3a52), 0x00 },
> +	{ CCI_REG8(0x3a53), 0x01 },
> +	{ CCI_REG8(0x3a54), 0x0c },
> +	{ CCI_REG8(0x3a55), 0x04 },
> +	{ CCI_REG8(0x3a58), 0x0c },
> +	{ CCI_REG8(0x3a59), 0x04 },
> +	{ CCI_REG8(0x4000), 0xcf },
> +	{ CCI_REG8(0x4003), 0x40 },
> +	{ CCI_REG8(0x4008), 0x04 },
> +	{ CCI_REG8(0x4009), 0x13 },
> +	{ CCI_REG8(0x400a), 0x02 },
> +	{ CCI_REG8(0x400b), 0x34 },
> +	{ CCI_REG8(0x4010), 0x71 },
> +	{ CCI_REG8(0x4042), 0xc3 },
> +	{ CCI_REG8(0x4306), 0x04 },
> +	{ CCI_REG8(0x4307), 0x12 },
> +	{ CCI_REG8(0x4500), 0x70 },
> +	{ CCI_REG8(0x4509), 0x00 },
> +	{ CCI_REG8(0x450b), 0x83 },
> +	{ CCI_REG8(0x4604), 0x68 },
> +	{ CCI_REG8(0x481b), 0x44 },
> +	{ CCI_REG8(0x481f), 0x30 },
> +	{ CCI_REG8(0x4823), 0x44 },
> +	{ CCI_REG8(0x4825), 0x35 },
> +	{ CCI_REG8(0x4837), 0x11 },
> +	{ CCI_REG8(0x4f00), 0x04 },
> +	{ CCI_REG8(0x4f10), 0x04 },
> +	{ CCI_REG8(0x4f21), 0x01 },
> +	{ CCI_REG8(0x4f22), 0x00 },
> +	{ CCI_REG8(0x4f23), 0x54 },
> +	{ CCI_REG8(0x4f24), 0x51 },
> +	{ CCI_REG8(0x4f25), 0x41 },
> +	{ CCI_REG8(0x5000), 0x3f },
> +	{ CCI_REG8(0x5001), 0x80 },
> +	{ CCI_REG8(0x500a), 0x00 },
> +	{ CCI_REG8(0x5100), 0x00 },
> +	{ CCI_REG8(0x5111), 0x20 },
> +};
> +
> +static const struct og0ve1b_mode og0va1b_supported_modes[] = {
> +	{
> +		.width = 640,
> +		.height = 480,
> +		.hts = 752,
> +		.vts = 2096,
> +		.bpp = 10,
> +		.code = MEDIA_BUS_FMT_Y10_1X10,
> +		.reg_list = {
> +			.regs = og0va1b_640x480_60fps_mode,
> +			.num_regs = ARRAY_SIZE(og0va1b_640x480_60fps_mode),
> +		},
> +	},
> +};
> +
>   static const struct og0ve1b_sensor_data og0ve1b_data = {
> +	.name		= "og0ve1b",
>   	.chip_id	= OG0VE1B_CHIP_ID,
>   	.mclk_freq	= OG0VE1B_MCLK_FREQ_24MHZ,
>   	.test_pattern_reg = OG0VE1B_REG_PRE_ISP,
> +	.exposure_shift	= 4,
> +	.pixel_rate_mul	= 1,
>   	.link_freq_menu	= og0ve1b_link_freq_menu,
>   	.num_link_freqs	= ARRAY_SIZE(og0ve1b_link_freq_menu),
>   	.modes		= supported_modes,
>   	.num_modes	= ARRAY_SIZE(supported_modes),

Can you please rename "supported_modes" to "og0ve1b_supported_modes"?
Likely it should be done in 2/3 change, but it's up to you.

>   };
>   
> +static const struct og0ve1b_sensor_data og0va1b_data = {
> +	.name		= "og0va1b",
> +	.chip_id	= OG0VA1B_CHIP_ID,
> +	.mclk_freq	= OG0VA1B_MCLK_FREQ_19_2MHZ,
> +	.test_pattern_reg = OG0VA1B_REG_TEST_PATTERN,
> +	.exposure_shift	= 0,
> +	.pixel_rate_mul	= 2,
> +	.link_freq_menu	= og0va1b_link_freq_menu,
> +	.num_link_freqs	= ARRAY_SIZE(og0va1b_link_freq_menu),
> +	.modes		= og0va1b_supported_modes,
> +	.num_modes	= ARRAY_SIZE(og0va1b_supported_modes),
> +};

First og0va1b_data, then og0ve1b_data declaration to keep the natural order.

> +
>   static int og0ve1b_enable_test_pattern(struct og0ve1b *og0ve1b, u32 pattern)
>   {
>   	u32 reg = og0ve1b->sensor->test_pattern_reg;
> @@ -334,7 +555,8 @@ static int og0ve1b_set_ctrl(struct v4l2_ctrl *ctrl)
>   		break;
>   	case V4L2_CID_EXPOSURE:
>   		ret = cci_write(og0ve1b->regmap, OG0VE1B_REG_EXPOSURE,
> -				ctrl->val << 4, NULL);
> +				ctrl->val << og0ve1b->sensor->exposure_shift,
> +				NULL);
>   		break;
>   	case V4L2_CID_VBLANK:
>   		ret = cci_write(og0ve1b->regmap, OG0VE1B_REG_VTS,
> @@ -376,7 +598,8 @@ static int og0ve1b_init_controls(struct og0ve1b *og0ve1b)
>   	if (ctrl)
>   		ctrl->flags |= V4L2_CTRL_FLAG_READ_ONLY;
>   
> -	pixel_rate = sensor->link_freq_menu[0] / mode->bpp;
> +	pixel_rate = sensor->link_freq_menu[0] * sensor->pixel_rate_mul /
> +		     mode->bpp;
>   	v4l2_ctrl_new_std(ctrl_hdlr, &og0ve1b_ctrl_ops, V4L2_CID_PIXEL_RATE,
>   			  0, pixel_rate, 1, pixel_rate);
>   
> @@ -721,6 +944,8 @@ static int og0ve1b_probe(struct i2c_client *client)
>   		return -ENODEV;
>   
>   	v4l2_i2c_subdev_init(&og0ve1b->sd, client, &og0ve1b_subdev_ops);
> +	v4l2_i2c_subdev_set_name(&og0ve1b->sd, client,
> +				 og0ve1b->sensor->name, NULL);
>   
>   	og0ve1b->regmap = devm_cci_regmap_init_i2c(client, 16);
>   	if (IS_ERR(og0ve1b->regmap))
> @@ -853,6 +1078,7 @@ static const struct dev_pm_ops og0ve1b_pm_ops = {
>   
>   static const struct of_device_id og0ve1b_of_match[] = {
>   	{ .compatible = "ovti,og0ve1b", .data = &og0ve1b_data },
> +	{ .compatible = "ovti,og0va1b", .data = &og0va1b_data },
>   	{ /* sentinel */ }
>   };
>   MODULE_DEVICE_TABLE(of, og0ve1b_of_match);
> @@ -870,5 +1096,5 @@ static struct i2c_driver og0ve1b_i2c_driver = {
>   module_i2c_driver(og0ve1b_i2c_driver);
>   
>   MODULE_AUTHOR("Vladimir Zapolskiy <vladimir.zapolskiy@linaro.org>");
> -MODULE_DESCRIPTION("OmniVision OG0VE1B sensor driver");
> +MODULE_DESCRIPTION("OmniVision OG0VE1B/OG0VA1B sensor driver");
>   MODULE_LICENSE("GPL");
> 

Looks good, thank you!

-- 
Best wishes,
Vladimir
