Received: from mail-lf1-f53.google.com (mail-lf1-f53.google.com [209.85.167.53])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 715393CB552
	for <devicetree@vger.kernel.org>; Mon, 27 Jul 2026 19:05:56 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.167.53
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1785179158; cv=none; b=LJO/eEuNsCRdqbQAD/6PdLyjddBme+Lkwwt5nqoC0RK4aCNwLXqw2G5nAhFpIYXDgB1lP9dHUkDc3aUAaQHC4pWQSbu9l4ee2j0SoRJySbkiy7geSKtwFTM4ckugHkdFhM1v8XzIbqkkZNRCLTdsICjvuuH73cnr9uGjRN/5YDE=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1785179158; c=relaxed/simple;
	bh=u8VR/B5OGeU8nep2inH5bSls2jI2dTsy5UiQx+vbs9U=;
	h=Message-ID:Date:MIME-Version:Subject:To:Cc:References:From:
	 In-Reply-To:Content-Type; b=UFr5C5MQaWgyeB/7hCN+H7Yeul3UD7EYgFTY6k3U/456sMLXCG2MWis/wLYDV6iVOB4qmfJma8eXGTG1Yg1TfhinSc1+sw2zYwxCCv52m2eOVP62n45d3nR1B5v3sdF8thgebIITV+k+gOoUjl9sp/xOh1jbbkOQd0ky/rTB3ws=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org; spf=pass smtp.mailfrom=linaro.org; dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b=v2bnAGiO; arc=none smtp.client-ip=209.85.167.53
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=linaro.org
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b="v2bnAGiO"
Received: by mail-lf1-f53.google.com with SMTP id 2adb3069b0e04-5b2a1fd0ab0so220796e87.0
        for <devicetree@vger.kernel.org>; Mon, 27 Jul 2026 12:05:56 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1785179154; x=1785783954; darn=vger.kernel.org;
        h=content-transfer-encoding:content-type:in-reply-to:from:references
         :cc:to:subject:user-agent:mime-version:date:message-id:from:to:cc
         :subject:date:message-id:reply-to:content-type;
        bh=taJnkRDpkdBsrHjQfPQCC/m+0KrBzxVTxFR+bD6NBPA=;
        b=v2bnAGiO91OURB9dnJw/GnELwz1/ZiDHQZKumMdWLi5HYpFhVui/g+yqqM8//EQpRk
         UbV7QIiclkMj821EGp0QXP8Mo3Yao/Z0QZRC6tJt5TYPg6R+9lYYlkL/+nQASl/eEqmy
         E85wS7vZ1b6VMYwmHdWSpsczQgNft1yVSNcr5WD4WvCEeAg231udpLL7+7m0RnbSeNxM
         XpZccQtHwKTZl0IFSVzR2VPW1dCTRtke43b7KzWznPMLPalFGFe6pMRNmEUQ3oemQ1/p
         P9wdR3FS5eh6VN8+HUY+7H/I51CNqHqjkVAqHWbO2cDQ6cqPf2hY11/qoAQTcgwCTi8Y
         epxw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1785179154; x=1785783954;
        h=content-transfer-encoding:content-type:in-reply-to:from:references
         :cc:to:subject:user-agent:mime-version:date:message-id:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=taJnkRDpkdBsrHjQfPQCC/m+0KrBzxVTxFR+bD6NBPA=;
        b=eShlsJd77LHSKz+ZAiQ14oMTOjMyj0zNXg1BnfNb+Nbmoq3ubETLSLFe7t1lD3XvNf
         TB4N5u9mgbkuyTJ27vln6rLgB2Zd1ej/Tzr5yvADxRrBufnhUTd0nivb0D36k5pW9fB7
         wORJpwT2yJF6XsaV3b1ws+VfCJRgXVRSUMiM4v0uPppeTvv4B/KTXi3xejuasyULwUZA
         z8K8i8n0V+z0DB3XKDzEaeD4t3B05kzFWoYX9EI8dkD9i53R+WK0N1wM6gnXuVFyKFGG
         zVt/6i/vMqkWdUAVDJfzG+kreDYomMYa+uWQiCWU5UwkYD0WOXluLHdRSKqBlz4+VBot
         dpSA==
X-Forwarded-Encrypted: i=1; AHgh+RpyT7tzccsmRPXRXrPDyTanxrjkiVmDATGrJTnU1UqAL0Dw0VoUMC4azzIu5PFPK3bEfv7ctJFvWdg5@vger.kernel.org
X-Gm-Message-State: AOJu0YxpVoSdOzWmLL8LIiWWGryLVG6CEwoeb2Y249uEuz7m6SZfafMW
	pmQ26YTaADvNNOEsS35UIhKZjQfWAyp8s1kphfwd5+0cw4+E+PwCrIhTGT9G2ZENVvjWr2OLo+t
	GrB945L0mgg==
X-Gm-Gg: AR+sD10OaV7zlnkatx+YNNerEAETJgSgkK1HYC6Dw4H5OVR4vv3A+tVwxBxegjTKq9H
	3TrI1Ls/SawyJnBug/aKyk0gWbzKPGqsVh+HIK06FUV35TLBDHUh74BhdmvHV+ya+OSajW5aGYI
	nWRKr+kBOLylCoVhnymKSvW+RrL6IUgTYZjWVseUORx+73V/YIuJ2aDAmm0K7pods1oIK7VMTA1
	x4J6xPWpvJgAEshnEasNlyGxJbhEo82SdnWVVIJ50onqUmoJEAYUBnxkXCgs5DMp6a13uorkyss
	9LMPshaq80p2v5KYFxoBA5j+QLXNK1hsKFT/TCJxK0J3gBtBOJLfUD1WGP5Zo1KUy/HCDzrvCY/
	77nd25MGEoSH+eVu1elQJsxvb6v132I4Z5OoPyaHGRuxdkdUBgERb26TCluDLkQgmiTwI4j+lZz
	FSi8n8ucEvyHr/X8Ut/zW1mX8xYABaFbY7spY6UwFJltqpQhNkn8jLf7wGN2LjEmONL6w=
X-Received: by 2002:a05:6512:b10:b0:5ae:c063:638c with SMTP id 2adb3069b0e04-5b2cd87480cmr130153e87.7.1785179154404;
        Mon, 27 Jul 2026 12:05:54 -0700 (PDT)
Received: from [192.168.1.100] (91-159-24-186.elisa-laajakaista.fi. [91.159.24.186])
        by smtp.gmail.com with ESMTPSA id 2adb3069b0e04-5b2be1d8646sm1634053e87.49.2026.07.27.12.05.53
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Mon, 27 Jul 2026 12:05:53 -0700 (PDT)
Message-ID: <28ebf939-2307-40ea-a8d2-e2105990e21c@linaro.org>
Date: Mon, 27 Jul 2026 22:05:52 +0300
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
 <dca44ea4-60af-4a9b-a6cb-7ba5f2014016@linaro.org>
 <c8a74324-3a1e-43bc-8124-2e5886038b6a@oss.qualcomm.com>
From: Vladimir Zapolskiy <vladimir.zapolskiy@linaro.org>
In-Reply-To: <c8a74324-3a1e-43bc-8124-2e5886038b6a@oss.qualcomm.com>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 8bit

Hi Wenmeng,

On 7/27/26 12:38, Wenmeng Liu wrote:
> Hi Vladimir,
> 
> On 7/24/2026 9:35 PM, Vladimir Zapolskiy wrote:
>> Hi Wenmeng.
>>
>> On 7/8/26 17:33, Wenmeng Liu wrote:
>>> The OmniVision OG0VA1B is a monochrome image sensor closely related to
>>> the OG0VE1B. It shares the SCCB control interface, power supplies and
>>> the single-lane MIPI D-PHY description, and differs in its chip id, the
>>> test pattern register, the register programming and the output format
>>> (10-bit RAW instead of 8-bit).
>>>
>>> Add an og0ve1b_sensor_data entry describing the OG0VA1B together with
>>> its 640x480 60fps register sequence.
>>>
>>> Signed-off-by: Wenmeng Liu <wenmeng.liu@oss.qualcomm.com>
>>> ---
>>>    drivers/media/i2c/og0ve1b.c | 278 ++++++++++++++++++++++++++++++++++
>>> ++++++++--
>>>    1 file changed, 266 insertions(+), 12 deletions(-)
>>>
>>> diff --git a/drivers/media/i2c/og0ve1b.c b/drivers/media/i2c/og0ve1b.c
>>> index
>>> 041342fbe3c822400388f58a03e6057e186f060f..c558cdd43314931db35e463641dd28e10b94ec8a 100644
>>> --- a/drivers/media/i2c/og0ve1b.c
>>> +++ b/drivers/media/i2c/og0ve1b.c
>>> @@ -14,10 +14,14 @@
>>>    #include <media/v4l2-device.h>
>>>    #include <media/v4l2-fwnode.h>
>>> +#define OG0VA1B_LINK_FREQ_480MHZ    (480 * HZ_PER_MHZ)
>>> +#define OG0VA1B_MCLK_FREQ_19_2MHZ    (19200 * HZ_PER_KHZ)
>>> +
>>>    #define OG0VE1B_LINK_FREQ_500MHZ    (500 * HZ_PER_MHZ)
>>>    #define OG0VE1B_MCLK_FREQ_24MHZ        (24 * HZ_PER_MHZ)
>>> -#define OG0VE1B_REG_CHIP_ID        CCI_REG24(0x300a)
>>> +#define OG0V_REG_CHIP_ID        CCI_REG24(0x300a)
>>> +#define OG0VA1B_CHIP_ID            0xc75641
>>>    #define OG0VE1B_CHIP_ID            0xc75645
>>>    #define OG0VE1B_REG_MODE_SELECT        CCI_REG8(0x0100)
>>> @@ -45,12 +49,18 @@
>>>    #define OG0VE1B_REG_VTS            CCI_REG16(0x380e)
>>>    #define OG0VE1B_VTS_MAX            0xffff
>>> -/* Test pattern */
>>> +/* Test pattern - OG0VA1B uses 0x5100, OG0VE1B uses 0x5e00 */
>>> +#define OG0VA1B_REG_TEST_PATTERN    CCI_REG8(0x5100)
>>> +#define OG0VA1B_TEST_PATTERN_BAR_SHIFT    2
>>>    #define OG0VE1B_REG_PRE_ISP        CCI_REG8(0x5e00)
>>>    #define OG0VE1B_TEST_PATTERN_ENABLE    BIT(7)
>>>    #define to_og0ve1b(_sd)            container_of(_sd, struct og0ve1b,
>>> sd)
>>> +static const s64 og0va1b_link_freq_menu[] = {
>>> +    OG0VA1B_LINK_FREQ_480MHZ,
>>> +};
>>> +
>>>    static const s64 og0ve1b_link_freq_menu[] = {
>>>        OG0VE1B_LINK_FREQ_500MHZ,
>>>    };
>>> @@ -73,15 +83,31 @@ struct og0ve1b_mode {
>>>    struct og0ve1b;
>>>    struct og0ve1b_sensor_data {
>>> +    const char *name;
>>>        u64 chip_id;
>>>        unsigned long mclk_freq;
>>>        int (*enable_test_pattern)(struct og0ve1b *og0ve1b, u32 pattern);
>>> +    const char * const *test_pattern_menu;
>>> +    int num_test_patterns;
>>> +    bool cache_test_pattern_reg;
>>> +    /* Exposure register unit: OG0VE1B 1/16 line (4), OG0VA1B whole
>>> lines (0). */
>>> +    unsigned int exposure_shift;
>>> +    /* Pixel rate multiplier: OG0VA1B uses CSI-2 DDR (2), OG0VE1B
>>> keeps 1. */
>>> +    unsigned int pixel_rate_mul;
>>>        const s64 *link_freq_menu;
>>>        int num_link_freqs;
>>>        const struct og0ve1b_mode *modes;
>>>        int num_modes;
>>>    };
>>> +static const char * const og0va1b_test_pattern_menu[] = {
>>> +    "Disabled",
>>> +    "Standard Color Bar",
>>> +    "Top-Bottom Darker Color Bar",
>>> +    "Right-Left Darker Color Bar",
>>> +    "Bottom-Top Darker Color Bar",
>>> +};
>>> +
>>
>> In the original og0ve1b_test_pattern_menu[] I copied a pretty regular
>> test pattern name "Vertical Colour Bars" inapproptiately, and here
>> the references to "Colour Bars" are also present... Due to quite
>> an obvious reason of sensor specifics would you consider to change
>> the test pattern names to something else?.. Sorry for late comment.
>>
> 
> Thanks for the review, and no worries about the timing.
> 
> You're right that "Color Bar" is misleading for a monochrome sensor.
> The OG0VA1B datasheet names these as "Test Bar", so I've aligned with it:
> 
> "Disabled",
> "Standard Test Bar",
> "Top-Bottom Darker Test Bar",
> "Right-Left Darker Test Bar",
> "Bottom-Top Darker Test Bar",
> 
> For OG0VE1B, "Vertical Colour Bars" has the same issue, Would you like
> me to update it with "Vertical Darker Test Bars"?

Sure, and it will be very much appreciated to get it fixed! Likely
the same "Standard Test Bar" name will be good for its description.

 From my POV the driver is mature, feel free to send v4 with the gained
tags, but someone else may provide more review comments.

-- 
Best wishes,
Vladimir
