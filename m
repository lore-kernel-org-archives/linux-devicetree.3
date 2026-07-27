Received: from mx0a-0031df01.pphosted.com (mx0a-0031df01.pphosted.com [205.220.168.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id C231E3EA97E
	for <devicetree@vger.kernel.org>; Mon, 27 Jul 2026 09:38:29 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.168.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1785145111; cv=none; b=E635hw7J2Fx7pTKZ71n9RlsKxae9gTLjdnCzvttaozGlaw51da64dexQEV0NBOinbz8J1+ONo1BADbTbHrSE+kEUxl39XiqL8Zfofx7N7A9KLF2K37R/uww6CTXJWWT2bks+nTLwN6Kqei/sqO4eYmtad0R8zwdM0crC5UpvE48=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1785145111; c=relaxed/simple;
	bh=ZjzwfYD7v3Zv+ORt60PImRwuUBdtjnqym3PkgPpfNyU=;
	h=Message-ID:Date:MIME-Version:Subject:To:Cc:References:From:
	 In-Reply-To:Content-Type; b=PHwUh+feIUBhcuYEAeVtFcUd5GcN86cq99Siid1b04C12WXnIeYjeOo+cBGdYMdhsuAwp+Tk47pe2x7s/J6VoROZSlW9hlSU+wGPNbM26ZBGwTCfgS8J7vKRwjJzYyM/cLqNteY1+M1Jw/79W7gYrZudKoHw7KrNjgAEfjknAL0=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=bNCxm7Q/; dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b=ZIHLlSga; arc=none smtp.client-ip=205.220.168.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b="bNCxm7Q/";
	dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b="ZIHLlSga"
Received: from pps.filterd (m0279862.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 66R9X0453243241
	for <devicetree@vger.kernel.org>; Mon, 27 Jul 2026 09:38:29 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	66Lv+JMSZRhU0BEu1c+uBx7OI1+xccVsyO/jhr7+41E=; b=bNCxm7Q/ID0paMIl
	WaAC0ZBn2mHvrTCFZXzJrrF7yAF0kGjzdLu+O8XBrJ406NSkRQ/YNx3Ikocf2e/H
	YVdUILAeCuJrHRV+4VNTaeoKerkoIUo6xwLlyPh4lMFnFPPwZ2bCN4ExTvnoW5YX
	ba8ndCS+2oeaBuRrGZic9O70hYu9DE0/8BXFmNCiICo3QXvxDyaPpxIVmTornrUt
	lNMyaMBigc+Gzvs9cs+UbjCyNMTTOKvZXMrkAUDbRmCJp+l239hV/PZrjY+Fzcml
	OeQDTOXWucyxMv4qe4bKhXa/309EFQaPHRf5BjZ0M/njDp3Dr7Id16njvavfb3Pb
	6AmKFA==
Received: from mail-qv1-f69.google.com (mail-qv1-f69.google.com [209.85.219.69])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4fp4nbr24p-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <devicetree@vger.kernel.org>; Mon, 27 Jul 2026 09:38:28 +0000 (GMT)
Received: by mail-qv1-f69.google.com with SMTP id 6a1803df08f44-907a1e04111so34474116d6.2
        for <devicetree@vger.kernel.org>; Mon, 27 Jul 2026 02:38:28 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1785145108; x=1785749908; darn=vger.kernel.org;
        h=content-transfer-encoding:content-type:in-reply-to:from:references
         :cc:to:subject:user-agent:mime-version:date:message-id:from:to:cc
         :subject:date:message-id:reply-to:content-type;
        bh=66Lv+JMSZRhU0BEu1c+uBx7OI1+xccVsyO/jhr7+41E=;
        b=ZIHLlSgaDRZmYmI/Ja0L0hl1uCjyDx5Izcqapd1lJTr7rOW9NJgaDvNqTEiFG2UR+D
         nGF832FF0jMA3pU/+0dCU6Iu47QgCVxczjDuArWGZmC0euYRBeNCNmNRnBU7sUI/Rerw
         omgA3DRglWBV5fVDyHO1xCsA7Arsjtd78wyIOnwQG9lD9brdhl1Cd6C7MXQtvQtV4BFs
         tu880mNQZk6HTVsprVlxEMKXdZWBfmep2+mqLEzVeF5YYUVkWBFL9ADaAWvocp/8tkGC
         H0CxLvAjk3uB1UTX0NKenqrzESnozMjel1yaoXtrHHf4Uu6nfeWlpV/ePeBvJeTBCx8w
         /lyg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1785145108; x=1785749908;
        h=content-transfer-encoding:content-type:in-reply-to:from:references
         :cc:to:subject:user-agent:mime-version:date:message-id:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=66Lv+JMSZRhU0BEu1c+uBx7OI1+xccVsyO/jhr7+41E=;
        b=NEOlSxurtuDhqxm/9TNytELqQXUYH2849WZHs1RfagZ8Y7ozYqW/9Bv7mE2FKggqrA
         uaaBxuMWUF2lDExDY3HKYJacEwUJJaNtOZHv2aHc0UO0dQDs6kMyZwUMHk5k0SXFvmVR
         5ddilNYD9JkGEn25bGVy2/vd84L7CTwJVS1wyTLQ/TQx/qBSDa8hMDogtjOF5eP1Y5y2
         HGITKKcCyAeCDg7qinjNVOsE7muxNkpKDfrqUQeYYJ12LxIqwuXigykXYmmMRGt9t+zW
         pJ3eZckiiyfKPhjK9puVSXtg0hdd5cTM+45dMhKkjpi1I+eCkPNKfnXlpZNoxJBsaFrq
         rJLw==
X-Forwarded-Encrypted: i=1; AHgh+RoZq4IbBmeUMD/CCPW2fB64jrNrcPAJ/994hUw2tL9+E6laOnglwa3yPmNteZ+8kklE/Oso1uN3uD3s@vger.kernel.org
X-Gm-Message-State: AOJu0YzpJrN7hbxG1WDY6u70pfTQwWVMZuApshyCn9gQEls8IeSV0Ssl
	6lQp/o8fBcFQqmlHtB1wfiQpb62hhLHtWrEI8Ix1k2rV7s+56peBdl+UXbnCllmgcsBiWuenU41
	mWSi2vICICpzInDmtIpX42UQoIFfl9WoPxTX765bVqVg9Yt2ybzK6cC7z1uJ5Irpu
X-Gm-Gg: AR+sD12mzAziW/i4VToy1kOYVHEZ5K8DilKSEbuPEINWY1bh0nDkSQ3Sdf+gsb2nOUE
	11Q4RomwZPOqGh+buYbgRz+YvtT7DVJnKcAlZCx1nGHB63QStzo2Z1/pv9u56eXAaQxnqKhxrpu
	BHHZp6U8v44fEQLWMKduRF+dxZucJ5kpe1YC3CaHdpizpS0lToOcPcmzYFadQUM6Atj3FId9Zm3
	JrKDj03YEBvfWwlUyphnvpNsYN/XB9W+7CZ/f6tvw4ydj2dhGxd98e3qPEgY3KV3Ls4n56BVH9D
	we4BRWDBrBYuIW6ikjkzFDHrFqXnkltl098pMD2agofpi4mQ2X0Q5e+8ATFwXY+j9sXg99oHHD3
	s5Pp8NQvXYepE4RzfyxXBKHuGyPRra9qqn0VUPzAqerGDs9No9zMj/KbA09J89Qi2
X-Received: by 2002:a05:6214:2a83:b0:8e9:a3be:5ef9 with SMTP id 6a1803df08f44-907ec75887bmr95745496d6.23.1785145108024;
        Mon, 27 Jul 2026 02:38:28 -0700 (PDT)
X-Received: by 2002:a05:6214:2a83:b0:8e9:a3be:5ef9 with SMTP id 6a1803df08f44-907ec75887bmr95745256d6.23.1785145107618;
        Mon, 27 Jul 2026 02:38:27 -0700 (PDT)
Received: from [10.111.161.209] (Global_NAT1_IAD_FW.qualcomm.com. [129.46.232.65])
        by smtp.gmail.com with ESMTPSA id 6a1803df08f44-907e871c5a7sm60742796d6.44.2026.07.27.02.38.24
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Mon, 27 Jul 2026 02:38:26 -0700 (PDT)
Message-ID: <c8a74324-3a1e-43bc-8124-2e5886038b6a@oss.qualcomm.com>
Date: Mon, 27 Jul 2026 17:38:22 +0800
Precedence: bulk
X-Mailing-List: devicetree@vger.kernel.org
List-Id: <devicetree.vger.kernel.org>
List-Subscribe: <mailto:devicetree+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:devicetree+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v3 3/3] media: i2c: og0ve1b: Add support for OmniVision
 OG0VA1B
To: Vladimir Zapolskiy <vladimir.zapolskiy@linaro.org>,
        Mauro Carvalho Chehab <mchehab@kernel.org>,
        Rob Herring <robh@kernel.org>,
        Krzysztof Kozlowski <krzk+dt@kernel.org>,
        Conor Dooley
 <conor+dt@kernel.org>,
        Sakari Ailus <sakari.ailus@linux.intel.com>
Cc: linux-media@vger.kernel.org, devicetree@vger.kernel.org,
        linux-kernel@vger.kernel.org
References: <20260708-og0va1b-v3-0-de8e44455a42@oss.qualcomm.com>
 <20260708-og0va1b-v3-3-de8e44455a42@oss.qualcomm.com>
 <dca44ea4-60af-4a9b-a6cb-7ba5f2014016@linaro.org>
From: Wenmeng Liu <wenmeng.liu@oss.qualcomm.com>
In-Reply-To: <dca44ea4-60af-4a9b-a6cb-7ba5f2014016@linaro.org>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 8bit
X-Proofpoint-ORIG-GUID: Ttko4XpnlyeBD5wDjDWNaJvh7UFo9Igi
X-Authority-Analysis: v=2.4 cv=cJjQdFeN c=1 sm=1 tr=0 ts=6a672715 cx=c_pps
 a=wEM5vcRIz55oU/E2lInRtA==:117 a=C3Dk8TwHQYyIj7nOf9RCJw==:17
 a=IkcTkHD0fZMA:10 a=RAioF0-LDSMA:10 a=s4-Qcg_JpJYA:10
 a=VkNPw1HP01LnGYTKEx00:22 a=u7WPNUs3qKkmUXheDGA7:22 a=_K5XuSEh1TEqbUxoQ0s3:22
 a=EUspDBNiAAAA:8 a=SsLdSGCFkERFs0EcKqkA:9 a=3ZKOabzyN94A:10 a=QEXdDO2ut3YA:10
 a=OIgjcC2v60KrkQgK7BGD:22
X-Proofpoint-Spam-Info: AW1haW4tMjYwNzI3MDA5MyBTYWx0ZWRfX4wz+1f3kv1H4
 Jl3gJhXq6I5HQMm8IYsfE52BCnmkN/IP0RVCBW9N0gGgAooXYlHnvL3rx5nqya1Q44dDkX5e+13
 3PGqUd4ie3IRfrjj6pjAhqoL+QLFuXs=
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYwNzI3MDA5MyBTYWx0ZWRfX/BR8Ag6V0gcJ
 H1aYRvVKzKrv6jEJg8Ki0rzILLH+iik/wjkZSKiwZSmom6JACTJ9JTRCjBAZ2kEhyX9Bp0wVqhF
 sVJeyhEg0Xt3P+Yan48oM9iFA3VI/qKP7/ejNgCw5NcNC9JxHuvH2/8h9FNazPYpLcHG9a/cMb1
 Rif6ItSzcroEOUy8APLtZSO/I8wXToKu1D+EW/xKMjKTkA5goijdxrBaq/26CzELUNzKvT4f2oo
 9cdyq0cTOV+W8nHOTt40DnVeNJnK4Nslclds3N4ODeE0EFKnFr4GqJJKo87+tHi0VwO5nOx/kQf
 1pImwcZU0oxG/KTisxw4xG9/0aYEHnnwnV5I9m2vOEN3xJxcT2A3TELKKX12N9Zx3Bn94Az8a8Q
 QXvW+wDTXoENqVfbfF+xMnDVKw+OA9Is3xsKvVLXtmZUQineg9vuf0OJva5PWFcZgmrJJnYUbCZ
 uPhSa5k74DUl0l/RoaQ==
X-Proofpoint-GUID: Ttko4XpnlyeBD5wDjDWNaJvh7UFo9Igi
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1143,Hydra:6.1.134,FMLib:17.12.100.49
 definitions=2026-07-27_02,2026-07-24_02,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 impostorscore=0 phishscore=0 spamscore=0 adultscore=0 suspectscore=0
 clxscore=1015 priorityscore=1501 lowpriorityscore=0 bulkscore=0
 malwarescore=0 classifier=typeunknown authscore=0 authtc= authcc=
 route=outbound adjust=0 reason=mlx scancount=1 engine=8.22.0-2606150000
 definitions=main-2607270093

Hi Vladimir,

On 7/24/2026 9:35 PM, Vladimir Zapolskiy wrote:
> Hi Wenmeng.
> 
> On 7/8/26 17:33, Wenmeng Liu wrote:
>> The OmniVision OG0VA1B is a monochrome image sensor closely related to
>> the OG0VE1B. It shares the SCCB control interface, power supplies and
>> the single-lane MIPI D-PHY description, and differs in its chip id, the
>> test pattern register, the register programming and the output format
>> (10-bit RAW instead of 8-bit).
>>
>> Add an og0ve1b_sensor_data entry describing the OG0VA1B together with
>> its 640x480 60fps register sequence.
>>
>> Signed-off-by: Wenmeng Liu <wenmeng.liu@oss.qualcomm.com>
>> ---
>>   drivers/media/i2c/og0ve1b.c | 278 ++++++++++++++++++++++++++++++++++ 
>> ++++++++--
>>   1 file changed, 266 insertions(+), 12 deletions(-)
>>
>> diff --git a/drivers/media/i2c/og0ve1b.c b/drivers/media/i2c/og0ve1b.c
>> index 
>> 041342fbe3c822400388f58a03e6057e186f060f..c558cdd43314931db35e463641dd28e10b94ec8a 100644
>> --- a/drivers/media/i2c/og0ve1b.c
>> +++ b/drivers/media/i2c/og0ve1b.c
>> @@ -14,10 +14,14 @@
>>   #include <media/v4l2-device.h>
>>   #include <media/v4l2-fwnode.h>
>> +#define OG0VA1B_LINK_FREQ_480MHZ    (480 * HZ_PER_MHZ)
>> +#define OG0VA1B_MCLK_FREQ_19_2MHZ    (19200 * HZ_PER_KHZ)
>> +
>>   #define OG0VE1B_LINK_FREQ_500MHZ    (500 * HZ_PER_MHZ)
>>   #define OG0VE1B_MCLK_FREQ_24MHZ        (24 * HZ_PER_MHZ)
>> -#define OG0VE1B_REG_CHIP_ID        CCI_REG24(0x300a)
>> +#define OG0V_REG_CHIP_ID        CCI_REG24(0x300a)
>> +#define OG0VA1B_CHIP_ID            0xc75641
>>   #define OG0VE1B_CHIP_ID            0xc75645
>>   #define OG0VE1B_REG_MODE_SELECT        CCI_REG8(0x0100)
>> @@ -45,12 +49,18 @@
>>   #define OG0VE1B_REG_VTS            CCI_REG16(0x380e)
>>   #define OG0VE1B_VTS_MAX            0xffff
>> -/* Test pattern */
>> +/* Test pattern - OG0VA1B uses 0x5100, OG0VE1B uses 0x5e00 */
>> +#define OG0VA1B_REG_TEST_PATTERN    CCI_REG8(0x5100)
>> +#define OG0VA1B_TEST_PATTERN_BAR_SHIFT    2
>>   #define OG0VE1B_REG_PRE_ISP        CCI_REG8(0x5e00)
>>   #define OG0VE1B_TEST_PATTERN_ENABLE    BIT(7)
>>   #define to_og0ve1b(_sd)            container_of(_sd, struct og0ve1b, 
>> sd)
>> +static const s64 og0va1b_link_freq_menu[] = {
>> +    OG0VA1B_LINK_FREQ_480MHZ,
>> +};
>> +
>>   static const s64 og0ve1b_link_freq_menu[] = {
>>       OG0VE1B_LINK_FREQ_500MHZ,
>>   };
>> @@ -73,15 +83,31 @@ struct og0ve1b_mode {
>>   struct og0ve1b;
>>   struct og0ve1b_sensor_data {
>> +    const char *name;
>>       u64 chip_id;
>>       unsigned long mclk_freq;
>>       int (*enable_test_pattern)(struct og0ve1b *og0ve1b, u32 pattern);
>> +    const char * const *test_pattern_menu;
>> +    int num_test_patterns;
>> +    bool cache_test_pattern_reg;
>> +    /* Exposure register unit: OG0VE1B 1/16 line (4), OG0VA1B whole 
>> lines (0). */
>> +    unsigned int exposure_shift;
>> +    /* Pixel rate multiplier: OG0VA1B uses CSI-2 DDR (2), OG0VE1B 
>> keeps 1. */
>> +    unsigned int pixel_rate_mul;
>>       const s64 *link_freq_menu;
>>       int num_link_freqs;
>>       const struct og0ve1b_mode *modes;
>>       int num_modes;
>>   };
>> +static const char * const og0va1b_test_pattern_menu[] = {
>> +    "Disabled",
>> +    "Standard Color Bar",
>> +    "Top-Bottom Darker Color Bar",
>> +    "Right-Left Darker Color Bar",
>> +    "Bottom-Top Darker Color Bar",
>> +};
>> +
> 
> In the original og0ve1b_test_pattern_menu[] I copied a pretty regular
> test pattern name "Vertical Colour Bars" inapproptiately, and here
> the references to "Colour Bars" are also present... Due to quite
> an obvious reason of sensor specifics would you consider to change
> the test pattern names to something else?.. Sorry for late comment.
> 

Thanks for the review, and no worries about the timing.

You're right that "Color Bar" is misleading for a monochrome sensor.
The OG0VA1B datasheet names these as "Test Bar", so I've aligned with it:

"Disabled",
"Standard Test Bar",
"Top-Bottom Darker Test Bar",
"Right-Left Darker Test Bar",
"Bottom-Top Darker Test Bar",

For OG0VE1B, "Vertical Colour Bars" has the same issue, Would you like 
me to update it with "Vertical Darker Test Bars"?


Best regards,
Wenmeng



