Received: from mx0a-0031df01.pphosted.com (mx0a-0031df01.pphosted.com [205.220.168.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 15DF5433E9B
	for <devicetree@vger.kernel.org>; Wed, 15 Jul 2026 09:37:07 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.168.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1784108233; cv=none; b=pOvKYOx4ogbf7PwHyhqpoJq8Ss95ORjbv1ITHnRWzvA/Ie5nrPmwUtVV+MI5D3+xCL7Q9QsG67PIUtINUV7ViLGY3Fki2HQuRVsbiuTPf/N+fqYW6YQjY1HbjHOTV0/GKJIeBcv8ERYBkRZd4ZslqVct6OLsUy0eoYKT9XG0Id8=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1784108233; c=relaxed/simple;
	bh=RCc7eH1e+vA7qBLhGtoXE2Z2ncOk0G/gIdLyZhjRCUE=;
	h=Message-ID:Date:MIME-Version:Subject:To:Cc:References:From:
	 In-Reply-To:Content-Type; b=arPiTNZCmSXlXowUUUtAKuxs3atc0PkUXoY2mqML2+H8j3WzveXywqwqZRrHAgnZIVY34EvQHoiWzLMGhGJ4xAo2jWD0mZr2ThpFCsKtS6V6EvrbsHfIpK1EqHtrKSPt+FnNIWyBmNt8BG90pvH4YWfbI7SASXQ14uSCQfHOXLk=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=jW7cHwIl; dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b=hQr/PaA9; arc=none smtp.client-ip=205.220.168.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b="jW7cHwIl";
	dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b="hQr/PaA9"
Received: from pps.filterd (m0279867.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 66F92qPY160921
	for <devicetree@vger.kernel.org>; Wed, 15 Jul 2026 09:37:05 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	JhSrnw5iGjLpyats5KjnP5EgHkI2NLvR9gRKhUAsuY4=; b=jW7cHwIlpiA12igw
	2B/ViEn2oF0wRGmQ2QiDAmDgO9VhkpiyFLQavzLaV6dJ0KLRay5i5k0nhmOOSDox
	EvxUKVvtkPTbm/F3+trdXL6NSQwBmtVbkpGIEOTYW41ZjpSFAoUqog3lN0IfrOH/
	3N1JykAXjpoNejoza1WnYcxyMJ7ryHJznQS7wA8cj8hCCv4rY54FARyyUshiQCZt
	J7kWdWPFWdv1DgNLe6WjwuzcHPfE0eIJDk+rsc4qMQNT0gT7mSI5BMKGw9fNKkOa
	NFGrktpbOWlz981vnDOzrf6j1SBmqoXPE7NH6ke7GdZhAfK2xA7Z4qc+m62WR5w6
	BhqRBQ==
Received: from mail-pl1-f198.google.com (mail-pl1-f198.google.com [209.85.214.198])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4fe68wrcd6-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <devicetree@vger.kernel.org>; Wed, 15 Jul 2026 09:37:04 +0000 (GMT)
Received: by mail-pl1-f198.google.com with SMTP id d9443c01a7336-2cc7e86e7c5so98121985ad.3
        for <devicetree@vger.kernel.org>; Wed, 15 Jul 2026 02:37:04 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1784108222; x=1784713022; darn=vger.kernel.org;
        h=content-transfer-encoding:content-type:in-reply-to:from
         :content-language:references:cc:to:subject:user-agent:mime-version
         :date:message-id:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=JhSrnw5iGjLpyats5KjnP5EgHkI2NLvR9gRKhUAsuY4=;
        b=hQr/PaA9uoqX3hoJ/MTI8Su9IaviLyU6U3WqoHV0gCzPAPrTNGWUjHBn2qGgozhOCK
         bEU1mS+yvVaW8SS7of+OJrxyWmPIxkGAqAzPjOXT8E24b4GN32wrnEiXW3ovgwof4GQi
         G0TrWoqd2NIdTBornDJpDYy4oD0KlzkraRm2RAMgjuVSlciIjSvFKbWJVInFstE+jrYh
         HI40Z0/PZlO5UiZYWdO3UyBfhndRLyJE7gtAQ7EC1+TFYg33TxrEwQs0aBgbWzPi5my0
         FRoUFpqzfZI0l2yRVvgQe0hAVNCdyGdlPObfjJOLY+AFquAhgh+YxOM+SId2+eV0O6+a
         WPkA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1784108222; x=1784713022;
        h=content-transfer-encoding:content-type:in-reply-to:from
         :content-language:references:cc:to:subject:user-agent:mime-version
         :date:message-id:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=JhSrnw5iGjLpyats5KjnP5EgHkI2NLvR9gRKhUAsuY4=;
        b=ae00E+Gr7KE3+kSCSkWQrUTVWcblrx9pez/Aav7h+BlttmICJ9AzD2J9RW1UeeemWv
         69d1KoPv1LEfPh/Wt6BeviTTSTCc6C78UDYW6qgDlAr9ULE30QQu96iYLmkXdG9J/uns
         KjP56Z8M0WwPHH6ytfA2zJIkfvFKktsx/xKCU0U8LxaFavucV4gNwJx3n9iU3BbSrlJL
         4qq2nb1kdP0GuXuN41QtLD0neElNYzoZwiG1pFvlzCDFfEPRrfjFtUTPugrTZ2W0QwBf
         Q+2GBGja9s1CaldXQmcHaBNzHPAtH4Y34LqLB4whV2sEgbOBtUfU948mMjbTAoQg5zd1
         pH0A==
X-Forwarded-Encrypted: i=1; AHgh+RpR+gjZNOMt559paoBi6cLASb1vSsP27jC8caQEgds/kbyPyeWPycKZl+3sumWHTnd9EOikO7hRLHHr@vger.kernel.org
X-Gm-Message-State: AOJu0YzgiKB70IlDOwbmG3JOc6KL63EYxDoWwZ1bbTTJ90GoZzvo8w2l
	c8ZJiBejKlt1uVTR69U6ZEdUOdpjx7biC8d7I1+mX7Jlk7xRMvnB2mDICZokN3RytW8QB9oiPgu
	lhdFq3Pf3EbUCK60Tb5G31mxqHATQUNdCiS1CgbgEko/uIgEDuZnLK42HbmJ0iYXG
X-Gm-Gg: AfdE7cl08KKtFdK+Nl45wy2c0vFB4JbrhnNrmpnL31D91/hqDVISJB4kdqF5eXeZ0vZ
	IRQMRet1e4jIXsRZZCaqVYOUx7T4RyA/rd+FuzxNgKZDLfEVbWGA5V+3UrGBtYNh/VoD1ZRUL/n
	qXLk+/hv+Yy/QTMepMFOwc/Vw568BFUt0ijdAUfOfHiiznkOi2MgMvV14sSXA1xeQtKKScZcSi0
	+tpmDTbE3RrsVdmAvAdiFYLo4BKJqiGjcw9NPxAGjXEwizEKRNgz/eGuphS4i9jAFwDtLK8Z52r
	J54dBC7B0ayDgZ620S9nRN6c7Ui4znBaeXNtUg2dZo05G/swROJw2gnHKQHoHh6CphvN8ecmSUl
	tX9By7It+cBZQYJ7oborC3MAgU3ibUFc6/lydSxOXk0Hr
X-Received: by 2002:a17:902:d4c7:b0:2ce:faa6:7cbb with SMTP id d9443c01a7336-2cf03bd52fcmr18047975ad.4.1784108221995;
        Wed, 15 Jul 2026 02:37:01 -0700 (PDT)
X-Received: by 2002:a17:902:d4c7:b0:2ce:faa6:7cbb with SMTP id d9443c01a7336-2cf03bd52fcmr18047725ad.4.1784108221438;
        Wed, 15 Jul 2026 02:37:01 -0700 (PDT)
Received: from [10.219.49.235] ([202.46.23.19])
        by smtp.gmail.com with ESMTPSA id d9443c01a7336-2ccc9d3d952sm129652775ad.61.2026.07.15.02.36.56
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Wed, 15 Jul 2026 02:37:00 -0700 (PDT)
Message-ID: <a60b0e40-9fcd-4d48-8673-7eb3b4455964@oss.qualcomm.com>
Date: Wed, 15 Jul 2026 15:06:55 +0530
Precedence: bulk
X-Mailing-List: devicetree@vger.kernel.org
List-Id: <devicetree.vger.kernel.org>
List-Subscribe: <mailto:devicetree+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:devicetree+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v4 1/7] ASoC: qcom: qdsp6: add topology-driven Audio IF
 support
To: Srinivas Kandagatla <srinivas.kandagatla@oss.qualcomm.com>,
        Srinivas Kandagatla <srini@kernel.org>,
        Liam Girdwood <lgirdwood@gmail.com>, Mark Brown <broonie@kernel.org>,
        Rob Herring <robh@kernel.org>,
        Krzysztof Kozlowski <krzk+dt@kernel.org>,
        Conor Dooley
 <conor+dt@kernel.org>, Jaroslav Kysela <perex@perex.cz>,
        Takashi Iwai <tiwai@suse.com>
Cc: linux-sound@vger.kernel.org, linux-arm-msm@vger.kernel.org,
        devicetree@vger.kernel.org, linux-kernel@vger.kernel.org
References: <20260712134110.3306763-1-prasad.kumpatla@oss.qualcomm.com>
 <20260712134110.3306763-2-prasad.kumpatla@oss.qualcomm.com>
 <f4857189-60b3-45d5-b59a-d11768e558f2@oss.qualcomm.com>
Content-Language: en-US
From: Prasad Kumpatla <prasad.kumpatla@oss.qualcomm.com>
In-Reply-To: <f4857189-60b3-45d5-b59a-d11768e558f2@oss.qualcomm.com>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit
X-Proofpoint-ORIG-GUID: 4XLMqhTG7ybXlkqpOfZKX763VGfNwG0W
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYwNzE1MDA5MiBTYWx0ZWRfX1FxjUk6D42ig
 Rm8H6oth7z+PK70qLN4N0oD1M0LXB1/qXIlL+IVO/Cxt3E9JQFbtO6XpRVtC05D2b68lMU35yoK
 d6N8U/shszx1LU5ldvkaeM4QfG8iDeGYASLEdy/tJ/vYIr78EWMZHbB5v/EEHNcM9KLKUuPr9Qu
 i04Et8h0g8MDb+Vu0H8pz/WcazWteXXkMdD/ZlBcIzt6v2Z+SA7U4b6A8X+O13umhu+xOgCn5Ap
 BeeUnnmv+bqkFSIE5YyY9cgVR82/AMNH7dpQpgGynfIbJuZOQeCwp4utxbRkFwN1XQ4ki561hof
 cs8Rjxkk/ua36A68AJU33d2kG2pp7HHzFNc9qL1m9XOjKFAIW18tmc/7tkyWjVW09cCTJ7tszEn
 ld45oRPWSri2ldzMXmjSnNO8nyJYenhVsLJNe5Y9B1Z3ciZyy/S9nTw//DkSmAxsTJ3RXpSk9Mp
 KHbP6BYQFUW6+ZBbH4w==
X-Proofpoint-Spam-Info: AW1haW4tMjYwNzE1MDA5MiBTYWx0ZWRfX7egVLYpKJJ2r
 Dwxwu8y6UqFRPkXXxRj7dqo4Qu2CZXOTifR2GPBNZdkEdrdGnOCrLNFgN4Ts4VJQnCtWg2qmEJV
 WeOLVWYouVZCbonaQ/ca7FnmfNixUQM=
X-Authority-Analysis: v=2.4 cv=LbgMLDfi c=1 sm=1 tr=0 ts=6a5754c0 cx=c_pps
 a=MTSHoo12Qbhz2p7MsH1ifg==:117 a=j4ogTh8yFefVWWEFDRgCtg==:17
 a=IkcTkHD0fZMA:10 a=RAioF0-LDSMA:10 a=s4-Qcg_JpJYA:10
 a=VkNPw1HP01LnGYTKEx00:22 a=u7WPNUs3qKkmUXheDGA7:22 a=eoimf2acIAo5FJnRuUoq:22
 a=EUspDBNiAAAA:8 a=p9lcrf-znARGlkMSZSEA:9 a=QEXdDO2ut3YA:10
 a=GvdueXVYPmCkWapjIL-Q:22
X-Proofpoint-GUID: 4XLMqhTG7ybXlkqpOfZKX763VGfNwG0W
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1143,Hydra:6.1.134,FMLib:17.12.100.49
 definitions=2026-07-15_02,2026-07-14_01,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 spamscore=0 impostorscore=0 suspectscore=0 adultscore=0 clxscore=1015
 phishscore=0 priorityscore=1501 malwarescore=0 lowpriorityscore=0 bulkscore=0
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.22.0-2606150000 definitions=main-2607150092


On 7/14/2026 1:54 PM, Srinivas Kandagatla wrote:
>
> On 7/12/26 2:41 PM, Prasad Kumpatla wrote:
>> Add topology parsing and media-format programming for Audio IF source and
>> sink modules.
>>
>> Add the Audio IF module IDs, the required topology tokens, and a dedicated
>> topology loader that stores the parsed interface configuration in the
>> AudioReach module state. Also add the Audio IF media-format path that
>> sends the interface configuration, hardware endpoint media format, and
>> frame-duration parameters for Audio IF modules.
>>
>> This keeps the serial-interface configuration topology-driven while still
>> allowing the machine driver to provide runtime slot and media format
>> settings. The same Audio IF path can then be reused for TDM, PCM, and I2S
>> style backends.
>>
>> The new UAPI tokens (AR_TKN_U16_MODULE_SYNC_SRC=262 through
>> AR_TKN_U8_MODULE_INV_EXT_BIT_CLK=276) are added, together with the value
>> defines used by the sync source, sync mode, data delay, interface mode,
>> bit clock type, and polarity tokens.
>>
>> MODULE_ID_AUDIO_IF_SINK (0x0700117C) and MODULE_ID_AUDIO_IF_SOURCE
>> (0x0700117D) are introduced in this patch.
>>
>> This Module is validated on Hawi and Shikra platforms.
>>
>> Signed-off-by: Prasad Kumpatla <prasad.kumpatla@oss.qualcomm.com>
>> ---
>>   include/uapi/sound/snd_ar_tokens.h |  89 ++++++++++++++++++++++++
>>   sound/soc/qcom/qdsp6/audioreach.c  |  97 ++++++++++++++++++++++++++
>>   sound/soc/qcom/qdsp6/audioreach.h  |  81 ++++++++++++++++++++++
>>   sound/soc/qcom/qdsp6/topology.c    | 105 +++++++++++++++++++++++++++++
>>   4 files changed, 372 insertions(+)
>>
>> diff --git a/include/uapi/sound/snd_ar_tokens.h b/include/uapi/sound/snd_ar_tokens.h
>> index 6b8102eaa..bda65311c 100644
>> --- a/include/uapi/sound/snd_ar_tokens.h
>> +++ b/include/uapi/sound/snd_ar_tokens.h
>> @@ -168,6 +168,58 @@ enum ar_event_types {
>>    *						LOG_WAIT = 0,
>>    *						LOG_IMMEDIATELY = 1
>>    *
>> + * %AR_TKN_U16_MODULE_SYNC_SRC:			Frame sync source
>> + *						AR_AUDIO_IF_SYNC_SRC_EXTERNAL = 0,
>> + *						AR_AUDIO_IF_SYNC_SRC_INTERNAL = 1
>> + *
>> + * %AR_TKN_U16_MODULE_CTRL_DATA_OUT_ENABLE:	Enable data-out tri-state control
>> + *						AR_AUDIO_IF_CTRL_DATA_OE_DISABLE = 0,
>> + *						AR_AUDIO_IF_CTRL_DATA_OE_ENABLE = 1
>> + *
>> + * %AR_TKN_U32_MODULE_SLOT_MASK:			Active TDM slot bitmask
>> + *
>> + * %AR_TKN_U16_MODULE_NSLOTS_PER_FRAME:		Number of slots per TDM frame
>> + *
>> + * %AR_TKN_U16_MODULE_SLOT_WIDTH:		Slot width in bits (16 or 32)
>> + *
>> + * %AR_TKN_U16_MODULE_SYNC_MODE:			Frame sync mode
>> + *						AR_AUDIO_IF_FRAME_SYNC_MODE_SHORT = 0,
>> + *						AR_AUDIO_IF_FRAME_SYNC_MODE_ONE_SLOT = 1,
>> + *						AR_AUDIO_IF_FRAME_SYNC_MODE_LONG = 2
>> + *
>> + * %AR_TKN_U16_MODULE_CTRL_INVERT_SYNC_PULSE:	Invert frame sync pulse polarity
>> + *						AR_AUDIO_IF_SYNC_NORMAL = 0,
>> + *						AR_AUDIO_IF_SYNC_INVERTED = 1
>> + *
>> + * %AR_TKN_U16_MODULE_CTRL_SYNC_DATA_DELAY:	Data delay relative to frame sync
>> + *						AR_AUDIO_IF_DATA_DELAY_NONE = 0,
>> + *						AR_AUDIO_IF_DATA_DELAY_1_CYCLE = 1,
>> + *						AR_AUDIO_IF_DATA_DELAY_2_CYCLE = 2
>> + *
>> + * %AR_TKN_U16_MODULE_INTF_MODE:			Audio IF interface mode
>> + *						AR_AUDIO_IF_INTF_MODE_TDM = 0,
>> + *						AR_AUDIO_IF_INTF_MODE_PCM = 1,
>> + *						AR_AUDIO_IF_INTF_MODE_I2S = 2
>> + *
>> + * %AR_TKN_U16_MODULE_QAIF_TYPE:			QAIF hardware port type index
>> + *
>> + * %AR_TKN_U32_MODULE_ACTIVE_LANE_MASK:		Active lane bitmask for multi-lane
>> + *
>> + * %AR_TKN_U32_MODULE_FRAME_SYNC_RATE:		Frame sync rate in Hz
>> + *
>> + * %AR_TKN_U16_MODULE_BIT_CLK_TYPE:		Bit clock type
>> + *						AR_AUDIO_IF_BIT_CLK_INTERNAL = 0,
>> + *						AR_AUDIO_IF_BIT_CLK_EXTERNAL = 1,
>> + *						AR_AUDIO_IF_BIT_CLK_SKIP = 2
>> + *
>> + * %AR_TKN_U8_MODULE_INV_INT_BIT_CLK:		Invert internal bit clock
>> + *						AR_AUDIO_IF_CLK_NORMAL = 0,
>> + *						AR_AUDIO_IF_CLK_INVERTED = 1
>> + *
>> + * %AR_TKN_U8_MODULE_INV_EXT_BIT_CLK:		Invert external bit clock
>> + *						AR_AUDIO_IF_CLK_NORMAL = 0,
>> + *						AR_AUDIO_IF_CLK_INVERTED = 1
>> + *
>>    * %AR_TKN_DAI_INDEX:				dai index
>>    *
>>    */
>> @@ -240,6 +292,43 @@ enum ar_event_types {
>>   #define AR_TKN_U32_MODULE_LOG_TAP_POINT_ID	260
>>   #define AR_TKN_U32_MODULE_LOG_MODE		261
>>   
>> +#define AR_TKN_U16_MODULE_SYNC_SRC		262
>> +#define AR_TKN_U16_MODULE_CTRL_DATA_OUT_ENABLE	263
>> +#define AR_TKN_U32_MODULE_SLOT_MASK		264
>> +#define AR_TKN_U16_MODULE_NSLOTS_PER_FRAME	265
>> +#define AR_TKN_U16_MODULE_SLOT_WIDTH		266
>> +#define AR_TKN_U16_MODULE_SYNC_MODE		267
>> +#define AR_TKN_U16_MODULE_CTRL_INVERT_SYNC_PULSE	268
>> +#define AR_TKN_U16_MODULE_CTRL_SYNC_DATA_DELAY	269
>> +#define AR_TKN_U16_MODULE_INTF_MODE		270
>> +#define AR_TKN_U16_MODULE_QAIF_TYPE		271
>> +#define AR_TKN_U32_MODULE_ACTIVE_LANE_MASK	272
>> +#define AR_TKN_U32_MODULE_FRAME_SYNC_RATE	273
>> +#define AR_TKN_U16_MODULE_BIT_CLK_TYPE		274
>> +#define AR_TKN_U8_MODULE_INV_INT_BIT_CLK	275
>> +#define AR_TKN_U8_MODULE_INV_EXT_BIT_CLK	276
>> +
>> +#define AR_AUDIO_IF_SYNC_SRC_EXTERNAL		0
>> +#define AR_AUDIO_IF_SYNC_SRC_INTERNAL		1
>> +#define AR_AUDIO_IF_CTRL_DATA_OE_DISABLE	0
>> +#define AR_AUDIO_IF_CTRL_DATA_OE_ENABLE		1
>> +#define AR_AUDIO_IF_INTF_MODE_TDM		0
>> +#define AR_AUDIO_IF_INTF_MODE_PCM		1
>> +#define AR_AUDIO_IF_INTF_MODE_I2S		2
>> +#define AR_AUDIO_IF_FRAME_SYNC_MODE_SHORT	0
>> +#define AR_AUDIO_IF_FRAME_SYNC_MODE_ONE_SLOT	1
>> +#define AR_AUDIO_IF_FRAME_SYNC_MODE_LONG	2
>> +#define AR_AUDIO_IF_SYNC_NORMAL			0
>> +#define AR_AUDIO_IF_SYNC_INVERTED		1
>> +#define AR_AUDIO_IF_DATA_DELAY_NONE		0
>> +#define AR_AUDIO_IF_DATA_DELAY_1_CYCLE		1
>> +#define AR_AUDIO_IF_DATA_DELAY_2_CYCLE		2
>> +#define AR_AUDIO_IF_BIT_CLK_INTERNAL		0
>> +#define AR_AUDIO_IF_BIT_CLK_EXTERNAL		1
>> +#define AR_AUDIO_IF_BIT_CLK_SKIP		2
>> +#define AR_AUDIO_IF_CLK_NORMAL			0
>> +#define AR_AUDIO_IF_CLK_INVERTED		1
>> +
>>   #define SND_SOC_AR_TPLG_MODULE_CFG_TYPE 0x01001006
>>   struct audioreach_module_priv_data {
>>   	__le32 size;	/* size in bytes of the array, including all elements */
>> diff --git a/sound/soc/qcom/qdsp6/audioreach.c b/sound/soc/qcom/qdsp6/audioreach.c
>> index e6e9eb2e8..62140ce8e 100644
>> --- a/sound/soc/qcom/qdsp6/audioreach.c
>> +++ b/sound/soc/qcom/qdsp6/audioreach.c
>> @@ -152,6 +152,13 @@ struct apm_i2s_module_intf_cfg {
>>   
>>   #define APM_I2S_INTF_CFG_PSIZE ALIGN(sizeof(struct apm_i2s_module_intf_cfg), 8)
>>   
>> +struct apm_audio_if_module_intf_cfg {
>> +	struct apm_module_param_data param_data;
>> +	struct param_id_audio_if_intf_cfg cfg;
>> +} __packed;
>> +
>> +#define APM_AUDIO_IF_INTF_CFG_PSIZE ALIGN(sizeof(struct apm_audio_if_module_intf_cfg), 8)
>> +
>>   struct apm_module_hw_ep_mf_cfg {
>>   	struct apm_module_param_data param_data;
>>   	struct param_id_hw_ep_mf mf;
>> @@ -168,6 +175,13 @@ struct apm_module_frame_size_factor_cfg {
>>   
>>   #define APM_FS_CFG_PSIZE ALIGN(sizeof(struct apm_module_frame_size_factor_cfg), 8)
>>   
>> +struct apm_module_hw_ep_frame_duration_cfg {
>> +	struct apm_module_param_data param_data;
>> +	struct param_id_hw_ep_frame_duration frame_duration;
>> +} __packed;
>> +
>> +#define APM_HW_EP_FRAME_DURATION_PSIZE ALIGN(sizeof(struct apm_module_hw_ep_frame_duration_cfg), 8)
>> +
>>   struct apm_module_hw_ep_power_mode_cfg {
>>   	struct apm_module_param_data param_data;
>>   	struct param_id_hw_ep_power_mode_cfg power_mode;
>> @@ -1042,6 +1056,85 @@ static int audioreach_i2s_set_media_format(struct q6apm_graph *graph,
>>   	return q6apm_send_cmd_sync(graph->apm, pkt, 0);
>>   }
>>   
>> +static int audioreach_audio_if_set_media_format(struct q6apm_graph *graph,
>> +						const struct audioreach_module *module,
>> +						const struct audioreach_module_config *cfg)
>> +{
>> +	struct apm_module_hw_ep_frame_duration_cfg *fd_cfg;
>> +	struct apm_module_param_data *param_data;
>> +	struct apm_audio_if_module_intf_cfg *intf_cfg;
>> +	struct apm_module_hw_ep_mf_cfg *hw_cfg;
>> +	int ic_sz = APM_AUDIO_IF_INTF_CFG_PSIZE;
>> +	int ep_sz = APM_HW_EP_CFG_PSIZE;
>> +	int fd_sz = APM_HW_EP_FRAME_DURATION_PSIZE;
>> +	int size = ic_sz + ep_sz + fd_sz;
>> +	/*
>> +	 * A zero machine override means use the topology default; zero is not
>> +	 * a valid override for these TDM slot fields.
>> +	 */
> What is this comment about, it does not make any sense w.r.t to where
> its placed, either remove it or put it correct place.
Ack, Will remove in next patch.
>
>> +	u32 slot_mask = cfg->slot_mask ? cfg->slot_mask : module->slot_mask;
>> +	u16 nslots_per_frame = cfg->nslots_per_frame ?
>> +				 (u16)cfg->nslots_per_frame : module->nslots_per_frame;
>> +	u16 slot_width = cfg->slot_width ? (u16)cfg->slot_width : module->slot_width;
>> +	void *p;
>> +
>> +	struct gpr_pkt *pkt __free(kfree) = audioreach_alloc_apm_cmd_pkt(size, APM_CMD_SET_CFG, 0);
>> +	if (IS_ERR(pkt))
>> +		return PTR_ERR(pkt);
>> +
>> +	p = (void *)pkt + GPR_HDR_SIZE + APM_CMD_HDR_SIZE;
>> +	intf_cfg = p;
>> +
>> +	param_data = &intf_cfg->param_data;
>> +	param_data->module_instance_id = module->instance_id;
>> +	param_data->error_code = 0;
>> +	param_data->param_id = PARAM_ID_AUDIO_IF_INTF_CFG;
>> +	param_data->param_size = ic_sz - APM_MODULE_PARAM_DATA_SIZE;
>> +	intf_cfg->cfg.qaif_type = module->qaif_type;
>> +	intf_cfg->cfg.intf_idx = (u16)module->hw_interface_idx;
>> +	intf_cfg->cfg.intf_mode = module->intf_mode;
>> +	intf_cfg->cfg.ctrl_data_out_enable = module->ctrl_data_out_enable;
>> +	intf_cfg->cfg.active_slot_mask = slot_mask;
>> +	intf_cfg->cfg.nslots_per_frame = nslots_per_frame;
>> +	intf_cfg->cfg.slot_width = slot_width;
>> +	intf_cfg->cfg.active_lane_mask = module->active_lane_mask;
>> +	intf_cfg->cfg.frame_sync_rate = module->frame_sync_rate;
>> +	intf_cfg->cfg.frame_sync_src = module->sync_src;
>> +	intf_cfg->cfg.frame_sync_mode = module->sync_mode;
>> +	intf_cfg->cfg.invert_frame_sync_pulse = module->ctrl_invert_sync_pulse;
>> +	intf_cfg->cfg.frame_sync_data_delay = module->ctrl_sync_data_delay;
>> +	intf_cfg->cfg.bit_clk_type = module->bit_clk_type;
>> +	intf_cfg->cfg.inv_int_bit_clk = module->inv_int_bit_clk;
>> +	intf_cfg->cfg.inv_ext_bit_clk = module->inv_ext_bit_clk;
>> +
>> +	p += ic_sz;
>> +	hw_cfg = p;
>> +	param_data = &hw_cfg->param_data;
>> +	param_data->module_instance_id = module->instance_id;
>> +	param_data->error_code = 0;
>> +	param_data->param_id = PARAM_ID_HW_EP_MF_CFG;
>> +	param_data->param_size = ep_sz - APM_MODULE_PARAM_DATA_SIZE;
>> +
>> +	hw_cfg->mf.sample_rate = cfg->sample_rate;
>> +	hw_cfg->mf.bit_width = cfg->bit_width;
>> +	hw_cfg->mf.num_channels = cfg->num_channels;
>> +	hw_cfg->mf.data_format = module->data_format;
>> +
>> +	p += ep_sz;
>> +	fd_cfg = p;
>> +	param_data = &fd_cfg->param_data;
>> +	param_data->module_instance_id = module->instance_id;
>> +	param_data->error_code = 0;
>> +	param_data->param_id = PARAM_ID_HW_EP_FRAME_DURATION;
>> +	param_data->param_size = fd_sz - APM_MODULE_PARAM_DATA_SIZE;
>> +	fd_cfg->frame_duration.frame_duration_in_us = AUDIO_IF_FRAME_DURATION_US;
>> +	fd_cfg->frame_duration.allow_frame_duration_normalization = 1;
>> +	fd_cfg->frame_duration.min_normalized_frame_dur_us = 1;
>> +	fd_cfg->frame_duration.max_normalized_frame_dur_us = 100000;
> Can we define these magic values somewhere as default values.
Sure, Will do it.
>
>> +
>> +	return q6apm_send_cmd_sync(graph->apm, pkt, 0);
>> +}
>> +
>>   static int audioreach_logging_set_media_format(struct q6apm_graph *graph,
>>   					       const struct audioreach_module *module)
>>   {
>> @@ -1411,6 +1504,10 @@ int audioreach_set_media_format(struct q6apm_graph *graph,
>>   		if (!rc)
>>   			rc = audioreach_module_enable(graph, module, true);
>>   		break;
>> +	case MODULE_ID_AUDIO_IF_SOURCE:
>> +	case MODULE_ID_AUDIO_IF_SINK:
>> +		rc = audioreach_audio_if_set_media_format(graph, module, cfg);
>> +		break;
>>   
>>   	default:
>>   		rc = 0;
>> diff --git a/sound/soc/qcom/qdsp6/audioreach.h b/sound/soc/qcom/qdsp6/audioreach.h
>> index 62a2fd79b..d57ba4e6a 100644
>> --- a/sound/soc/qcom/qdsp6/audioreach.h
>> +++ b/sound/soc/qcom/qdsp6/audioreach.h
>> @@ -36,6 +36,8 @@ struct q6apm_graph;
>>   #define MODULE_ID_SPEAKER_PROTECTION	0x070010E2
>>   #define MODULE_ID_SPEAKER_PROTECTION_VI	0x070010E3
>>   #define MODULE_ID_OPUS_DEC		0x07001174
>> +#define MODULE_ID_AUDIO_IF_SINK		0x0700117C
>> +#define MODULE_ID_AUDIO_IF_SOURCE	0x0700117D
>>   
>>   #define APM_CMD_GET_SPF_STATE		0x01001021
>>   #define APM_CMD_RSP_GET_SPF_STATE	0x02001007
>> @@ -544,6 +546,65 @@ struct param_id_i2s_intf_cfg {
>>   #define PORT_ID_I2S_OUPUT		1
>>   #define I2S_STACK_SIZE			2048
>>   
>> +#define PARAM_ID_AUDIO_IF_INTF_CFG	0x08001B11
>> +
>> +#define AUDIO_IF_INTF_MODE_TDM		AR_AUDIO_IF_INTF_MODE_TDM
>> +#define AUDIO_IF_INTF_MODE_PCM		AR_AUDIO_IF_INTF_MODE_PCM
>> +#define AUDIO_IF_INTF_MODE_I2S		AR_AUDIO_IF_INTF_MODE_I2S
>> +
>> +/*
>> + * struct param_id_audio_if_intf_cfg - Audio interface configuration
>> + * @qaif_type: Audio interface type (e.g. QAIF, QAIF_VA)
>> + * @intf_idx: Interface instance index
>> + * @intf_mode: Interface operating mode (TDM/PCM/I2S)
>> + * @ctrl_data_out_enable: Enable sharing of data-out signal with other masters
>> + * @active_slot_mask: Bitmask indicating active slots
>> + * @nslots_per_frame: Number of slots per audio frame
>> + * @slot_width: Width of each slot in bits
>> + * @active_lane_mask: Bitmask of active data lanes
>> + * @frame_sync_rate: Frame sync rate in Hz
>> + * @frame_sync_src: Frame sync source selection
>> + * @frame_sync_mode: Frame sync mode configuration
>> + * @invert_frame_sync_pulse: Invert frame sync polarity when set
>> + * @frame_sync_data_delay: Data delay from frame sync in bit clocks
>> + * @bit_clk_type: Bit clock type (internal / external)
>> + * @inv_int_bit_clk: Invert internal bit clock when set
>> + * @inv_ext_bit_clk: Invert external bit clock when set
>> + *
>> + * This structure defines configuration parameters for the Qualcomm
>> + * Audio Interface (QAIF) block. It is used to program interface
>> + * characteristics such as slot configuration, clocking and frame
>> + * synchronization behaviour.
>> + */
>> +struct param_id_audio_if_intf_cfg {
>> +	u16 qaif_type;
>> +	u16 intf_idx;
>> +	u16 intf_mode;
>> +	u16 ctrl_data_out_enable;
>> +	u32 active_slot_mask;
> this header uses uint32_t types, please stick to such style for consistency.

Ack, will update in next patch.

Thanks,
Prasad

>> +	u16 nslots_per_frame;
>> +	u16 slot_width;
>> +	u32 active_lane_mask;
>> +	u32 frame_sync_rate;
>> +	u16 frame_sync_src;
>> +	u16 frame_sync_mode;
>> +	u16 invert_frame_sync_pulse;
>> +	u16 frame_sync_data_delay;
>> +	u16 bit_clk_type;
>> +	u8 inv_int_bit_clk;
>> +	u8 inv_ext_bit_clk;
>> +} __packed;
>> +
>> +#define PARAM_ID_HW_EP_FRAME_DURATION	0x08001B2F
>> +#define AUDIO_IF_FRAME_DURATION_US		1000
>> +
>> +struct param_id_hw_ep_frame_duration {
>> +	u32 frame_duration_in_us;
>> +	u32 allow_frame_duration_normalization;
>> +	u32 min_normalized_frame_dur_us;
>> +	u32 max_normalized_frame_dur_us;
>> +} __packed;
>> +
>>   #define PARAM_ID_DISPLAY_PORT_INTF_CFG		0x08001154
>>   
>>   struct param_id_display_port_intf_cfg {
>> @@ -877,6 +938,23 @@ struct audioreach_module {
>>   	uint32_t data_format;
>>   	uint32_t hw_interface_type;
>>   
>> +	/* Audio IF module (TDM/PCM/I2S) */
>> +	u32 slot_mask;
>> +	u32 active_lane_mask;
>> +	u32 frame_sync_rate;
>> +	u16 qaif_type;
>> +	u16 sync_src;
>> +	u16 ctrl_data_out_enable;
>> +	u16 nslots_per_frame;
>> +	u16 slot_width;
>> +	u16 intf_mode;
>> +	u16 sync_mode;
>> +	u16 ctrl_invert_sync_pulse;
>> +	u16 ctrl_sync_data_delay;
>> +	u16 bit_clk_type;
>> +	u8 inv_int_bit_clk;
>> +	u8 inv_ext_bit_clk;
>> +
>>   	/* PCM module specific */
>>   	uint32_t interleave_type;
>>   
>> @@ -907,6 +985,9 @@ struct audioreach_module_config {
>>   	u32	channel_allocation;
>>   	u32	sd_line_mask;
>>   	int	fmt;
>> +	u32	slot_mask;
>> +	u16	nslots_per_frame;
>> +	u16	slot_width;
>>   	struct snd_codec codec;
>>   	u8 channel_map[AR_PCM_MAX_NUM_CHANNEL];
>>   };
>> diff --git a/sound/soc/qcom/qdsp6/topology.c b/sound/soc/qcom/qdsp6/topology.c
>> index 1f69fba6d..3dd0a5c29 100644
>> --- a/sound/soc/qcom/qdsp6/topology.c
>> +++ b/sound/soc/qcom/qdsp6/topology.c
>> @@ -753,6 +753,105 @@ static int audioreach_widget_i2s_module_load(struct audioreach_module *mod,
>>   	return 0;
>>   }
>>   
>> +static int audioreach_widget_audio_if_module_load(struct audioreach_module *mod,
>> +						  const struct snd_soc_tplg_vendor_array *mod_array)
>> +{
>> +	const struct snd_soc_tplg_vendor_value_elem *mod_elem;
>> +	int tkn_count = 0;
>> +	u32 val;
>> +
>> +	mod_elem = mod_array->value;
>> +
>> +	while (tkn_count < le32_to_cpu(mod_array->num_elems)) {
>> +		val = le32_to_cpu(mod_elem->value);
>> +		switch (le32_to_cpu(mod_elem->token)) {
>> +		case AR_TKN_U32_MODULE_HW_IF_IDX:
>> +			if (val > U16_MAX)
>> +				return -EINVAL;
>> +			mod->hw_interface_idx = val;
>> +			break;
>> +		case AR_TKN_U32_MODULE_FMT_DATA:
>> +			mod->data_format = val;
>> +			break;
>> +		case AR_TKN_U16_MODULE_SYNC_SRC:
>> +			if (val > U16_MAX)
>> +				return -EINVAL;
>> +			mod->sync_src = (u16)val;
>> +			break;
>> +		case AR_TKN_U16_MODULE_CTRL_DATA_OUT_ENABLE:
>> +			if (val > U16_MAX)
>> +				return -EINVAL;
>> +			mod->ctrl_data_out_enable = (u16)val;
>> +			break;
>> +		case AR_TKN_U32_MODULE_SLOT_MASK:
>> +			mod->slot_mask = val;
>> +			break;
>> +		case AR_TKN_U16_MODULE_NSLOTS_PER_FRAME:
>> +			if (val > U16_MAX)
>> +				return -EINVAL;
>> +			mod->nslots_per_frame = (u16)val;
>> +			break;
>> +		case AR_TKN_U16_MODULE_SLOT_WIDTH:
>> +			if (val > U16_MAX)
>> +				return -EINVAL;
>> +			mod->slot_width = (u16)val;
>> +			break;
>> +		case AR_TKN_U16_MODULE_INTF_MODE:
>> +			if (val > U16_MAX)
>> +				return -EINVAL;
>> +			mod->intf_mode = (u16)val;
>> +			break;
>> +		case AR_TKN_U16_MODULE_SYNC_MODE:
>> +			if (val > U16_MAX)
>> +				return -EINVAL;
>> +			mod->sync_mode = (u16)val;
>> +			break;
>> +		case AR_TKN_U16_MODULE_CTRL_INVERT_SYNC_PULSE:
>> +			if (val > U16_MAX)
>> +				return -EINVAL;
>> +			mod->ctrl_invert_sync_pulse = (u16)val;
>> +			break;
>> +		case AR_TKN_U16_MODULE_CTRL_SYNC_DATA_DELAY:
>> +			if (val > U16_MAX)
>> +				return -EINVAL;
>> +			mod->ctrl_sync_data_delay = (u16)val;
>> +			break;
>> +		case AR_TKN_U16_MODULE_QAIF_TYPE:
>> +			if (val > U16_MAX)
>> +				return -EINVAL;
>> +			mod->qaif_type = (u16)val;
>> +			break;
>> +		case AR_TKN_U32_MODULE_ACTIVE_LANE_MASK:
>> +			mod->active_lane_mask = val;
>> +			break;
>> +		case AR_TKN_U32_MODULE_FRAME_SYNC_RATE:
>> +			mod->frame_sync_rate = val;
>> +			break;
>> +		case AR_TKN_U16_MODULE_BIT_CLK_TYPE:
>> +			if (val > U16_MAX)
>> +				return -EINVAL;
>> +			mod->bit_clk_type = (u16)val;
>> +			break;
>> +		case AR_TKN_U8_MODULE_INV_INT_BIT_CLK:
>> +			if (val > U8_MAX)
>> +				return -EINVAL;
>> +			mod->inv_int_bit_clk = (u8)val;
>> +			break;
>> +		case AR_TKN_U8_MODULE_INV_EXT_BIT_CLK:
>> +			if (val > U8_MAX)
>> +				return -EINVAL;
>> +			mod->inv_ext_bit_clk = (u8)val;
>> +			break;
>> +		default:
>> +			break;
>> +		}
>> +		tkn_count++;
>> +		mod_elem++;
>> +	}
>> +
>> +	return 0;
>> +}
>> +
>>   static int audioreach_widget_dp_module_load(struct audioreach_module *mod,
>>   					    const struct snd_soc_tplg_vendor_array *mod_array)
>>   {
>> @@ -806,6 +905,12 @@ static int audioreach_widget_load_buffer(struct snd_soc_component *component,
>>   	case MODULE_ID_I2S_SOURCE:
>>   		audioreach_widget_i2s_module_load(mod, mod_array);
>>   		break;
>> +	case MODULE_ID_AUDIO_IF_SINK:
>> +	case MODULE_ID_AUDIO_IF_SOURCE:
>> +		ret = audioreach_widget_audio_if_module_load(mod, mod_array);
>> +		if (ret)
>> +			return ret;
>> +		break;
>>   	case MODULE_ID_DISPLAY_PORT_SINK:
>>   		audioreach_widget_dp_module_load(mod, mod_array);
>>   		break;
