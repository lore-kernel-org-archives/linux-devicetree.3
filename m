Received: from mail-lj1-f173.google.com (mail-lj1-f173.google.com [209.85.208.173])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 188002D97AA
	for <devicetree@vger.kernel.org>; Fri, 24 Jul 2026 13:35:06 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.208.173
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1784900111; cv=none; b=gV67I7es0mmxCCYWCGbJXfRjRz5ekle3eHY+Iq2pQp5C59NXWuZDmXlm5DNf+OgtCGnyWpNmnEx8tlLtQvw+1iUcCVHcCOp1EX3SIXgBHrJqD9QBR3eMF7T5lBAJiUBP2aUdgdXqYZ52BEV6nQmqNlcTnjB6IKbe+nfx1QJ8n6E=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1784900111; c=relaxed/simple;
	bh=qmz8Olh968JBH6ptndhpYYMI2Ghc3K34GM2MQQsPr38=;
	h=Message-ID:Date:MIME-Version:Subject:To:Cc:References:From:
	 In-Reply-To:Content-Type; b=NxJ4AAQOx+qZ8wWiadJpSmiCSCCyoHnmtcClYz1HkrOpLUlfSCoxnB9U6mFsTIdORmqY0NcsO/7f+ft00X3SdVmpR2zJnmmmx+dr0ApuIxTZmi1WhIerQDu0KdYd1SJCGYrlLUd9kPZStLX8WARXGH967hSv99CQUdub5mE6mbs=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org; spf=pass smtp.mailfrom=linaro.org; dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b=Hj1Yp48M; arc=none smtp.client-ip=209.85.208.173
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=linaro.org
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b="Hj1Yp48M"
Received: by mail-lj1-f173.google.com with SMTP id 38308e7fff4ca-39db55d6e0bso288751fa.0
        for <devicetree@vger.kernel.org>; Fri, 24 Jul 2026 06:35:06 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1784900104; x=1785504904; darn=vger.kernel.org;
        h=content-transfer-encoding:content-type:in-reply-to:from:references
         :cc:to:subject:user-agent:mime-version:date:message-id:from:to:cc
         :subject:date:message-id:reply-to:content-type;
        bh=mgKIS+5xBtHEKSRegBUC2zumkBX3DCdGRkB1nHczz3Y=;
        b=Hj1Yp48MrPzySyohKsMU//J7cNz/KNf47rjAolUf+izp0LFy9WkTYMHAiZC+rLtrmh
         iGIVKGvRRgEPjp9076K3i9OQyBGGJU4Egj856KevvQ8Jc4iZUZr/PjcfzlyJmeInNHGv
         TYnHcHpbN6mzyOvH3+jciMPH9j0fvrpd7cxJJtJkaf3MzYs6KD0dCHG4DFlftcfX6cSn
         JVhT19Gfi7vKNF+i6+NHxRCKSjj8dNlqvrO1gKFBTkHLY1vWZ9twIjwzmAIemSCAFLg+
         XKBP9QVT4k/Qv1bzgscSqRKx65vMu/Q1zaito9WZ7kE636TMlJSgAoqerWjSj6uiPPx3
         kl3w==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1784900104; x=1785504904;
        h=content-transfer-encoding:content-type:in-reply-to:from:references
         :cc:to:subject:user-agent:mime-version:date:message-id:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=mgKIS+5xBtHEKSRegBUC2zumkBX3DCdGRkB1nHczz3Y=;
        b=cXjDDR79bJ7+GezwDtLD01dzaV+UvrvtJMD6pZk1Aqiiw6CKTEqyUHru3VXBv+NRxN
         kozNsht5jF9Igs9WTqU56MxQv6qyh5EP2ifAGJW23W5rj6yXbIHUYV4AOSsx1a14PiX2
         iPP4uZF+AiatAGeVc7Lfp2aAsMfqIctDGdrIWmAEN+TVaMpLM04SljdKWZJDufxBSqkn
         viaoqPTUDcGsavLV97KTZqHaqOHnSXJRb+5A+MQrFTNPtFVyLwtWaQwwJHbC/zZ+9DsD
         zVu8zn2jdUzL/mHz+4YnKZG2JLA1LsJivSFOasnohSUw5Jqyr5DoZiqS2OJ2gT6DcxoS
         uwwQ==
X-Forwarded-Encrypted: i=1; AHgh+Ro6lG0tiznpeyGcTpiMqKqASJ6UDQ5OUNxuvaFQObbNWKn7xdvYWzdEuV32Vcjrmw0S2SFU9nnK66je@vger.kernel.org
X-Gm-Message-State: AOJu0YwyBWUgBg4TZZXxBzUy2i4qaqs7mnLVJKhFVjwZNtlQ+5f/GI0f
	xS9Vogvbme24frxn/r/Fu8oe8/dTx0EAYIxbKkfYEtXcjuqXtED0Dkc0wuiStMt8t+8=
X-Gm-Gg: AR+sD11GQWx/0yO2cVTEWw2XWqZRbqByRpgGSFQ+xxJutZ8lSX/ONM4gXPW7jxmiJOx
	iokj2FbDJRXj1F8yHdok6XG5g9AimqqgFxFdXwLhXd7Hhwiv29cwYITXUFnE7Tq6dWG+a9jxVum
	XcEocHIfeOIuq52TU94hkErY4B89hvb9dLcWZXuamfOocvnGQIPlAHQviFXgleWMA9+f+5rG6Jk
	q70igx/JDC+DTA3mCIBw4WcOuCdSziMsQuO3/XJsOLntCYifDEZeW6nom1HHi4jc/W8fyxCupgF
	wXmZoPJDlfvRx66wL47z764ICpBm30fGgTMH+wNwQdaTLEjf58x+vQBqSvo2xPBCfb440uOobj9
	5qbmAuqszAcK0EgHgDZs923l8veJMVgqiZWfvx8vd4YLn15NqsSk4OzpNS8jgi7RW90fd1DJ3aZ
	LvBj9hK+k/8CfEZvIwF9yidHPKRJL5LQ9jcffLcDtlciL+WuV176HckiMO
X-Received: by 2002:a05:6512:3b09:b0:5b1:5c72:2f0d with SMTP id 2adb3069b0e04-5b2b7b1bc4emr512493e87.4.1784900103990;
        Fri, 24 Jul 2026 06:35:03 -0700 (PDT)
Received: from [192.168.1.100] (91-159-24-186.elisa-laajakaista.fi. [91.159.24.186])
        by smtp.gmail.com with ESMTPSA id 2adb3069b0e04-5b2a9e4e965sm1533392e87.71.2026.07.24.06.35.03
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Fri, 24 Jul 2026 06:35:03 -0700 (PDT)
Message-ID: <dca44ea4-60af-4a9b-a6cb-7ba5f2014016@linaro.org>
Date: Fri, 24 Jul 2026 16:35:02 +0300
Precedence: bulk
X-Mailing-List: devicetree@vger.kernel.org
List-Id: <devicetree.vger.kernel.org>
List-Subscribe: <mailto:devicetree+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:devicetree+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v3 3/3] media: i2c: og0ve1b: Add support for OmniVision
 OG0VA1B
To: Wenmeng Liu <wenmeng.liu@oss.qualcomm.com>,
 Mauro Carvalho Chehab <mchehab@kernel.org>, Rob Herring <robh@kernel.org>,
 Krzysztof Kozlowski <krzk+dt@kernel.org>, Conor Dooley
 <conor+dt@kernel.org>, Sakari Ailus <sakari.ailus@linux.intel.com>
Cc: linux-media@vger.kernel.org, devicetree@vger.kernel.org,
 linux-kernel@vger.kernel.org
References: <20260708-og0va1b-v3-0-de8e44455a42@oss.qualcomm.com>
 <20260708-og0va1b-v3-3-de8e44455a42@oss.qualcomm.com>
From: Vladimir Zapolskiy <vladimir.zapolskiy@linaro.org>
In-Reply-To: <20260708-og0va1b-v3-3-de8e44455a42@oss.qualcomm.com>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit

Hi Wenmeng.

On 7/8/26 17:33, Wenmeng Liu wrote:
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
>   drivers/media/i2c/og0ve1b.c | 278 ++++++++++++++++++++++++++++++++++++++++++--
>   1 file changed, 266 insertions(+), 12 deletions(-)
> 
> diff --git a/drivers/media/i2c/og0ve1b.c b/drivers/media/i2c/og0ve1b.c
> index 041342fbe3c822400388f58a03e6057e186f060f..c558cdd43314931db35e463641dd28e10b94ec8a 100644
> --- a/drivers/media/i2c/og0ve1b.c
> +++ b/drivers/media/i2c/og0ve1b.c
> @@ -14,10 +14,14 @@
>   #include <media/v4l2-device.h>
>   #include <media/v4l2-fwnode.h>
>   
> +#define OG0VA1B_LINK_FREQ_480MHZ	(480 * HZ_PER_MHZ)
> +#define OG0VA1B_MCLK_FREQ_19_2MHZ	(19200 * HZ_PER_KHZ)
> +
>   #define OG0VE1B_LINK_FREQ_500MHZ	(500 * HZ_PER_MHZ)
>   #define OG0VE1B_MCLK_FREQ_24MHZ		(24 * HZ_PER_MHZ)
>   
> -#define OG0VE1B_REG_CHIP_ID		CCI_REG24(0x300a)
> +#define OG0V_REG_CHIP_ID		CCI_REG24(0x300a)
> +#define OG0VA1B_CHIP_ID			0xc75641
>   #define OG0VE1B_CHIP_ID			0xc75645
>   
>   #define OG0VE1B_REG_MODE_SELECT		CCI_REG8(0x0100)
> @@ -45,12 +49,18 @@
>   #define OG0VE1B_REG_VTS			CCI_REG16(0x380e)
>   #define OG0VE1B_VTS_MAX			0xffff
>   
> -/* Test pattern */
> +/* Test pattern - OG0VA1B uses 0x5100, OG0VE1B uses 0x5e00 */
> +#define OG0VA1B_REG_TEST_PATTERN	CCI_REG8(0x5100)
> +#define OG0VA1B_TEST_PATTERN_BAR_SHIFT	2
>   #define OG0VE1B_REG_PRE_ISP		CCI_REG8(0x5e00)
>   #define OG0VE1B_TEST_PATTERN_ENABLE	BIT(7)
>   
>   #define to_og0ve1b(_sd)			container_of(_sd, struct og0ve1b, sd)
>   
> +static const s64 og0va1b_link_freq_menu[] = {
> +	OG0VA1B_LINK_FREQ_480MHZ,
> +};
> +
>   static const s64 og0ve1b_link_freq_menu[] = {
>   	OG0VE1B_LINK_FREQ_500MHZ,
>   };
> @@ -73,15 +83,31 @@ struct og0ve1b_mode {
>   struct og0ve1b;
>   
>   struct og0ve1b_sensor_data {
> +	const char *name;
>   	u64 chip_id;
>   	unsigned long mclk_freq;
>   	int (*enable_test_pattern)(struct og0ve1b *og0ve1b, u32 pattern);
> +	const char * const *test_pattern_menu;
> +	int num_test_patterns;
> +	bool cache_test_pattern_reg;
> +	/* Exposure register unit: OG0VE1B 1/16 line (4), OG0VA1B whole lines (0). */
> +	unsigned int exposure_shift;
> +	/* Pixel rate multiplier: OG0VA1B uses CSI-2 DDR (2), OG0VE1B keeps 1. */
> +	unsigned int pixel_rate_mul;
>   	const s64 *link_freq_menu;
>   	int num_link_freqs;
>   	const struct og0ve1b_mode *modes;
>   	int num_modes;
>   };
>   
> +static const char * const og0va1b_test_pattern_menu[] = {
> +	"Disabled",
> +	"Standard Color Bar",
> +	"Top-Bottom Darker Color Bar",
> +	"Right-Left Darker Color Bar",
> +	"Bottom-Top Darker Color Bar",
> +};
> +

In the original og0ve1b_test_pattern_menu[] I copied a pretty regular
test pattern name "Vertical Colour Bars" inapproptiately, and here
the references to "Colour Bars" are also present... Due to quite
an obvious reason of sensor specifics would you consider to change
the test pattern names to something else?.. Sorry for late comment.

-- 
Best wishes,
Vladimir
