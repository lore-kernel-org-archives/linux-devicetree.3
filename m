Received: from mail-lj1-f173.google.com (mail-lj1-f173.google.com [209.85.208.173])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 904243C8708
	for <devicetree@vger.kernel.org>; Fri, 12 Jun 2026 13:16:07 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.208.173
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1781270169; cv=none; b=ZEMJt+66j52JgVfT/vVaFit2hfZG+0bh4zRsjtjPonQ3PKURCkw9Y4PHnZi0+F8UeM2aT2vh7JMOHsFcnFIuv6uyvbPXaFvPPKUTUiUpVjWTGob03os7GFffmQ80dtjaWbd/0tlMdWdxrJLMRDnBJn3XWIFH458hkJ3WZbjF1JM=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1781270169; c=relaxed/simple;
	bh=2RbO04fUi3IJaYFtf7jGrbpwZ5R1BgTfIRB2dy5lXsw=;
	h=Message-ID:Date:MIME-Version:Subject:To:Cc:References:From:
	 In-Reply-To:Content-Type; b=cVSKb7gB2O0EAhXZh1XPKZJQ8l5259JjY3d7hj8BN+0ci7cdwmjOH0s+a38HOiI3zgC+7A2G6O2HH+4hIQwwQl67c8JckAlzl5UX+otq7THqISli26g8WRs1D0T5JH001LW59/zASS1sN6wU6vvQ2oL/VdxDDIWtNX6t0lRcRoA=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org; spf=pass smtp.mailfrom=linaro.org; dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b=A9mai+OX; arc=none smtp.client-ip=209.85.208.173
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=linaro.org
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b="A9mai+OX"
Received: by mail-lj1-f173.google.com with SMTP id 38308e7fff4ca-3967701fc3cso551191fa.0
        for <devicetree@vger.kernel.org>; Fri, 12 Jun 2026 06:16:07 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1781270166; x=1781874966; darn=vger.kernel.org;
        h=content-transfer-encoding:in-reply-to:from:references:cc:to:subject
         :user-agent:mime-version:date:message-id:from:to:cc:subject:date
         :message-id:reply-to;
        bh=yYJLgdM+gn9R331SmxgguPUu0Ms/YAMbM6ICKsm3dW0=;
        b=A9mai+OXv3+Wd2fGIt5P1xKq07BegcQr/L/ylU0SPdc5MA/ze/X4TpVjVP3L2khfr6
         wSmHGhGU9gp57t4HPdIt1FrzuT/wNEXl4fcvoJptzxUJ9qsBgSM3m5pDqZWfX2ou92Xj
         ymRB9iuuwWxahRHknDf61aCCbCFBHf72WlKmsU842dPy/0Htj2ikNUIXK9CvTsDKY22U
         IjKUYG2FDPtekcsx4Aq5ozLRAZeg8x5ncKR+UOU0H22CQy10Eo4rKmDQl8RYsriJ0tfa
         /GQauicj0Ahlh5rvpYcUul+3RehVLdePAeU8nfsGzjMS8XBxcpvSo75rXR9V5mnCvbNk
         2Swg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1781270166; x=1781874966;
        h=content-transfer-encoding:in-reply-to:from:references:cc:to:subject
         :user-agent:mime-version:date:message-id:x-gm-gg:x-gm-message-state
         :from:to:cc:subject:date:message-id:reply-to;
        bh=yYJLgdM+gn9R331SmxgguPUu0Ms/YAMbM6ICKsm3dW0=;
        b=fe3LjeUPbbCJLwLK5TLfjSgBntrT40xEQWcJRokB3IN6jt7pSFUf+QfnHAl0EyjDBb
         1LBP+qT9xDN121aLVTYrxJNarXffC20Sq/nTzPno1Hnb7brhUVgu6/aRD0au4H5MWgcn
         dTbUo5aSaeHutyAWPFqVJrOyAq3xghUk46ua0Rh/beRsttK1Rp6suOKvN6cdV1XWg7Vm
         QaVk9MCtgSOJeaNwN8LZYWM48jeGG7ihDSOoHvgGMwtB29BJfSQTsj7nEL11quKRN1lh
         MehnzZmhLeAJXCGhK3zYyYHRTE/kPoTreRr63CwOkxhhlGrni5aacTLoLUPqdxv41NZ4
         a64g==
X-Forwarded-Encrypted: i=1; AFNElJ9bAlsQLTA8ZubvoHPch5X3Drh+ntStdxKom8bEi5b7ZsdZpJC0IZ0FfLzaOnYY3MWtk99mfIlmbP8S@vger.kernel.org
X-Gm-Message-State: AOJu0YxOiB9yoIUD+stpBaqm/1Vi2NAH6LsVLFnXvVWy2vXPqaLD9gjf
	jBV6V48JyMVFnRu7FX9Px9OzimBU8mRJpZMhFcKZeRz3x9fpiw5cG3K3lNv9e47tGr8=
X-Gm-Gg: Acq92OFr0XaDwweLUxS6rvpIRS/vtdBP14AKKhLEOtzT2Y6gBeHn3q3lpJkOHGmaMzL
	QGCMXpdQhuXKKtlx+zADbpOX4Qpfpp31tw2TCKmqDBHvNbfiMmYwb20w+Hm3WAJrg6R3GgzCBLY
	7FHOY4fJXlt/JoacoZn4Oe2ZtRce08OEXrpMd5czBksGxOD4kKo7IjvTzCbf0pdBJhww4Jqxbwt
	/F0LSb3rEMSs8j2Zw2Vj7/LO64V9uk+r6TgqK8SC6utf0jI0KfmJzDMtuBQEyYkdQDgt8R5PLVP
	3uW28ucFoK38EkTOVWwbgsQ5vFhgUc1g3R2C+cW5GnOYrVqhwE3Ona6iM6KVpqcLDRvHDugcu08
	SV+jLZfrhxwdT84uToiB1/brsVtQ1yvHb7oDD8qQxxMPg5SOZh0/sIomPKtgEc/CrXyTQdQeddW
	cZBWHQfLQMejiSrcW5JR6AlqJPShQAFBWyyuyFGm4U5GhRfbvl71iOWhh5hESjb2DoJiUr1BNCe
	PTZUw==
X-Received: by 2002:a2e:b88b:0:b0:394:152d:f9c6 with SMTP id 38308e7fff4ca-3992b28f883mr3404631fa.8.1781270165550;
        Fri, 12 Jun 2026 06:16:05 -0700 (PDT)
Received: from [192.168.1.100] (91-159-24-186.elisa-laajakaista.fi. [91.159.24.186])
        by smtp.gmail.com with ESMTPSA id 38308e7fff4ca-39929c6c9f7sm5791011fa.18.2026.06.12.06.16.02
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Fri, 12 Jun 2026 06:16:03 -0700 (PDT)
Message-ID: <6f664514-34bf-44db-8df1-9b1a774e6367@linaro.org>
Date: Fri, 12 Jun 2026 16:16:02 +0300
Precedence: bulk
X-Mailing-List: devicetree@vger.kernel.org
List-Id: <devicetree.vger.kernel.org>
List-Subscribe: <mailto:devicetree+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:devicetree+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v3 3/3] media: i2c: os02g10: implement crop handling with
 set_selection
To: Tarang Raval <tarang.raval@siliconsignals.io>
Cc: Elgin Perumbilly <elgin.perumbilly@siliconsignals.io>,
 "laurent.pinchart@ideasonboard.com" <laurent.pinchart@ideasonboard.com>,
 "sakari.ailus@linux.intel.com" <sakari.ailus@linux.intel.com>,
 Mauro Carvalho Chehab <mchehab@kernel.org>, Rob Herring <robh@kernel.org>,
 Krzysztof Kozlowski <krzk+dt@kernel.org>, Conor Dooley
 <conor+dt@kernel.org>, Hans Verkuil <hverkuil+cisco@kernel.org>,
 Hans de Goede <johannes.goede@oss.qualcomm.com>,
 Mehdi Djait <mehdi.djait@linux.intel.com>,
 Sylvain Petinot <sylvain.petinot@foss.st.com>,
 Benjamin Mugnier <benjamin.mugnier@foss.st.com>,
 Bryan O'Donoghue <bryan.odonoghue@linaro.org>,
 Heimir Thor Sverrisson <heimir.sverrisson@gmail.com>,
 Hardevsinh Palaniya <hardevsinh.palaniya@siliconsignals.io>,
 "linux-media@vger.kernel.org" <linux-media@vger.kernel.org>,
 "devicetree@vger.kernel.org" <devicetree@vger.kernel.org>,
 "linux-kernel@vger.kernel.org" <linux-kernel@vger.kernel.org>
References: <20260424092554.26130-1-elgin.perumbilly@siliconsignals.io>
 <20260424092554.26130-4-elgin.perumbilly@siliconsignals.io>
 <0f4bfe08-0504-48ff-83ce-c84600e6f38d@linaro.org>
 <PN3P287MB1829A38F1D7D1098CBDEC8F88B182@PN3P287MB1829.INDP287.PROD.OUTLOOK.COM>
From: Vladimir Zapolskiy <vladimir.zapolskiy@linaro.org>
In-Reply-To: <PN3P287MB1829A38F1D7D1098CBDEC8F88B182@PN3P287MB1829.INDP287.PROD.OUTLOOK.COM>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit

On 6/12/26 14:41, Tarang Raval wrote:
> Hi Vladimir,
> 
> Thank you for the review.
> 
> Since I authored this patch, I will try to address the comments below.
> 
>> On 4/24/26 12:25, Elgin Perumbilly wrote:
>>> From: Tarang Raval <tarang.raval@siliconsignals.io>
>>>
>>> Add crop support to os02g10 by implementing .set_selection() and
>>> storing the crop rectangle in subdev state.
>>>
>>> Initialize the default crop to the active area, make set_fmt() use the
>>> current crop, and update the output format when the crop size changes.
>>> Also program the sensor window from the active crop/format state instead
>>> of using the fixed supported_modes entry.
>>>
>>> This allows userspace to configure the sensor crop window explicitly.
>>>
>>> Signed-off-by: Tarang Raval <tarang.raval@siliconsignals.io>
>>> Signed-off-by: Elgin Perumbilly <elgin.perumbilly@siliconsignals.io>
>>> ---
>>>    drivers/media/i2c/os02g10.c | 166 ++++++++++++++++++++++--------------
>>>    1 file changed, 103 insertions(+), 63 deletions(-)
>>>
>>> diff --git a/drivers/media/i2c/os02g10.c b/drivers/media/i2c/os02g10.c
>>> index fad2dd0ad7aa..9bf8f5d1caea 100644
>>> --- a/drivers/media/i2c/os02g10.c
>>> +++ b/drivers/media/i2c/os02g10.c
>>> @@ -112,6 +112,11 @@
>>>    #define OS02G10_ORIENTATION_BAYER_FIX               0x32
>>>
>>>    #define OS02G10_LINK_FREQ_720MHZ            (720 * HZ_PER_MHZ)
>>> +#define OS02G10_WINDOW_WIDTH_MIN             2
>>> +#define OS02G10_WINDOW_HEIGHT_MIN            2
>>
>> Add a blank line before the new group of macro.
>>
>>> +#define OS02G10_VBLANK_DEF                   166
>>
>> This one is computable, and it can be dropped.
> 
> 
> Can you explain how this value can be computed ?

It is (supported_modes[0].vts_def - supported_modes[0].height) on
the base of 2/3 change.

> 
>>> +#define OS02G10_VBLANK_MIN                   25
>>
>> This macro shall be added to the group of OS02G10_REG_FRAME_LENGTH
>> register, and it should be included into the previous change.
>>
>>> +#define OS02G10_EXPOSURE_DEF                 1100
>>
>> This macro shall be added to the group of OS02G10_REG_LONG_EXPOSURE
>> register, and it should be included into the previous change.
> 
> 
> I would prefer to introduce these macros here only, as they are related to
> this patch. There is no use of these macros in the previous patch, so moving
> them there would not provide any benefit.

Unavoidably there shall be a user of "default exposure" in the change 2/3, and
therefore the value is present, please reference to supported_modes[0].exp_def.

So, this macro goes to the 2/3 patch.

> 
> I will group them in the appropriate place within this patch as per your
> suggestion.
> 
> 
>>>
>>>    /* OS02G10 native and active pixel array size */
>>>    static const struct v4l2_rect os02g10_native_area = {
>>> @@ -152,15 +157,6 @@ struct os02g10 {
>>>        struct v4l2_ctrl *hflip;
>>>    };
>>>
>>> -struct os02g10_mode {
>>> -     u32 width;
>>> -     u32 height;
>>> -     u32 vts_def;
>>> -     u32 exp_def;
>>> -     u32 x_start;
>>> -     u32 y_start;
>>> -};
>>> -
>>>    static const struct cci_reg_sequence os02g10_common_regs[] = {
>>>        { OS02G10_REG_PLL_DIV_CTRL,             0x0a},
>>>        { OS02G10_REG_PLL_DCTL_BIAS_CTRL,       0x04},
> 
> ...
> 
>>>    static const struct v4l2_subdev_video_ops os02g10_video_ops = {
>>> @@ -645,6 +684,7 @@ static const struct v4l2_subdev_pad_ops os02g10_pad_ops = {
>>>        .get_fmt = v4l2_subdev_get_fmt,
>>>        .set_fmt = os02g10_set_pad_format,
>>>        .get_selection = os02g10_get_selection,
>>> +     .set_selection = os02g10_set_selection,
>>>        .enum_frame_size = os02g10_enum_frame_size,
>>>        .enable_streams = os02g10_enable_streams,
>>>        .disable_streams = os02g10_disable_streams,
>>
>> I understand that this change is written by another person, and likely
>> it is not squashed with the previous one to preserve authorship, however
>> it significantly rewrites the change already found in the series.
> 
> I don't think this patch significantly rewrites the previous changes. Its
> main purpose is to introduce a crop rectangle and implement set_selection(),
> allowing userspace to stream arbitrary resolutions within the sensor limits
> instead of being restricted to 1920x1080.

What are these "sensor limits" number? Are they defined in this 3/3 change?
For whatever reason I can't find it, but I may be blind.

> 
>> I don't see information about the maximum supported frame height/width
>> or default VTS setting etc. anymore, for me it's hard to say, if
>> this kind of information can be dropped with no consequences in runtime.
> 
> The maximum supported width and height are still defined and enforced in
> os02g10_set_selection(). The default VTS handling is implemented in
> os02g10_set_pad_format(), where VBLANK is adjusted to maintain 30 fps for
> the selected resolution. So I don't believe any information has been dropped.
> 
>> Probably this 3/3 change will break a quick inclusion of the sensor
>> driver, you may consider to exlcude it from the series now, and publish
>> it afterwards.
> 
> Regarding whether patch 3/3 should be included in the current series, I am
> happy to leave that decision to Sakari. If needed, this patch can be merged
> separately once the new raw sensor model is finalized.
> 
> This patch was created based on Laurent's suggestion.
> 
> Link: https://lore.kernel.org/linux-media/20260414084952.217215-1-elgin.perumbilly@siliconsignals.io/T/#t
> 

That's a helpful reference to the previous patch review, thank you.
Likely I don't have the whole picture of the new advances in linux-media.

-- 
Best wishes,
Vladimir
