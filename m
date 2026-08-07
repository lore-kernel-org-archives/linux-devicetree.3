Received: from mx0b-0031df01.pphosted.com (mx0b-0031df01.pphosted.com [205.220.180.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id CE3A13D1AA0
	for <devicetree@vger.kernel.org>; Fri,  7 Aug 2026 08:07:13 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.180.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1786090036; cv=none; b=XvtTT9pRWQ6OGmt1SpO5pcHhMdHWHs0eImAWNQNrvbvKyLlnR0yW3p81yZgVRW4Du3JjGNgbpbk/cJ2Psjm5s2m8w/90rgMKahDbg5VimbeK3b6DwRRFJ2u8TNJfztI3Y7E79CsV5VTjLkXZmFIP5bnWF3H89Y+NPRQ7NiuEcas=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1786090036; c=relaxed/simple;
	bh=R6W+KIBwAziL+0bmHN9d08M6zXwjtUWjKyDUQQpICbc=;
	h=Message-ID:Date:MIME-Version:Subject:To:Cc:References:From:
	 In-Reply-To:Content-Type; b=NCfs9Rh8Fqkj7RDaGER7kHrbWMdtnTU8ZQeu8QnI+AObN6wIaVgH+slbdOgPHQCkBGK+cCbinzr20vvuuNmaRJebrF5hYS6dRlsWL3NxsWTvmsWXdZW5F29WwT9mIJzVrjM1mK2qNnWtky0eY3OGUP32K3mvWMqBAA63diTTPPw=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=n6FxO46e; dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b=b6fVrc0g; arc=none smtp.client-ip=205.220.180.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b="n6FxO46e";
	dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b="b6fVrc0g"
Received: from pps.filterd (m0279870.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 6777mpFl3519247
	for <devicetree@vger.kernel.org>; Fri, 7 Aug 2026 08:07:12 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	Mg60GGen5JLXLiduqgYSWUUEhr6GUTU7AVg+S+hy3xA=; b=n6FxO46eZ50PCYEh
	IyAjClt8f4npcS7X6yb7qN8e96FHkEF+hJ+TD8F+7Ugn+Ew71zbmelcNHGNEhtkv
	Fo54n08iGT9etAwx/CpUBUMe+jItuQpA0MHl7tIXOtXxwztYx9+HpifjFS1lX8gv
	S13lOHw642T7XxE2/UYpe5fecPcBtQxwHXc9PH2jBJT83tTJ1uQu65L9gJ3sU1ux
	M5TPTbSATD0Xh4QS8aN+jA6aN2MgbJjBPr9Qy0Ylk6/ComGvveDB8u5AOXm1ItwR
	+WJgkE9qjI/0ck4D8/nEdj9uwLYCmXjeD7u5Ad/2oDGQHjxrPzvWHh4+cP8TP+mz
	iWS/pQ==
Received: from mail-pl1-f198.google.com (mail-pl1-f198.google.com [209.85.214.198])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4fvy6s2ymj-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <devicetree@vger.kernel.org>; Fri, 07 Aug 2026 08:07:12 +0000 (GMT)
Received: by mail-pl1-f198.google.com with SMTP id d9443c01a7336-2cfc52ddc55so40117065ad.3
        for <devicetree@vger.kernel.org>; Fri, 07 Aug 2026 01:07:12 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1786090031; x=1786694831; darn=vger.kernel.org;
        h=content-transfer-encoding:content-type:in-reply-to:from
         :content-language:references:cc:to:subject:user-agent:mime-version
         :date:message-id:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=Mg60GGen5JLXLiduqgYSWUUEhr6GUTU7AVg+S+hy3xA=;
        b=b6fVrc0godlr2WIBl3DJKYlXkY5tv6Me9H9YrAXmdWVPzV/7wSvLPsqzHnZb3wrQaO
         DCN3MLOkbqQ/EZ1hzLGpQahfrUys79zuL+p4+r0H+Z2qAPYLaMKpXGJsHziDOsFy/Hni
         9E/QbWRRxkkuQxNFaqmP7v+cOigIA65lxO+gnd6saUmdqmVKnFzU5vPF7NCOOa7IQ5tE
         vZSIqcDGQ2deroJSuIsudxJDVGua40VW0nfTfQDxjYzyu89cyJwr2z9JjHZIKaU/XglM
         HKtVXGBNMLdg9ZcK8gl8r/Gky4n9GjVN3xczC0KlUTp3mQzAZibnDkKghk31KD1e0Ssr
         P4Kg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1786090031; x=1786694831;
        h=content-transfer-encoding:content-type:in-reply-to:from
         :content-language:references:cc:to:subject:user-agent:mime-version
         :date:message-id:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=Mg60GGen5JLXLiduqgYSWUUEhr6GUTU7AVg+S+hy3xA=;
        b=C0PA5Ns1do5aoMfvIamk2NYTccTSgbkH9tLkYfS3gAoYL5YGttTAhcy0GGx1K3f3HZ
         jxjRPYhxrRpstUfOTR0TRseApiHqwpGKRvx7rFNc1kYLY4iJZ0mNdsb5fExVUYqaRi5R
         bU8ZWBLC8WpAFrrqu+9DRYUx7k1ZNRguhal7Axd0u8Uy3mlnBrkdf+KnebQxjggN6Ccy
         CuPPMxUT39VlqnHC0HJUSZ4NLm2se6X2eCyzSxTcGApxiVIxdUmeDSwFIsGEdjNURxKw
         zbuOe74H1vDBXWHlIPNP0riRYrSZwDkBnzxORbI1F+28jSkGXlU2C4kmIRONlmEWPBeu
         qZNA==
X-Forwarded-Encrypted: i=1; AHgh+RqjKj5b+REVJHi3EtVidzQy/Ltx2JoJ/yi45dAp/BqCLE8o8YOFFFLILGx9jTu7gxnuuniFNUfK5QWx@vger.kernel.org
X-Gm-Message-State: AOJu0YzdJBBbyIKd9IphrdFhrgjbrtupHK1aJpXAhAUhUBtn3DB5mBGe
	Mw8d0inBD9dXYwzgZyuRjTNG75+N9S+c6+kS27cOCHKP6lRhaoyGQwwZASxm+NJkt/XNcHgct4q
	BrsishKyPXxNULYsI9NggbQtcmiRzahs/au+agq9Rfra6NaV1us+1MEO5oQSSFO+o
X-Gm-Gg: AR+sD13QgWNLypje/Zk5Kvvm8F6fUcyhcA5i4a0kaAqw61BTEGNROQ3mKQo7TIY1U59
	KU66/HDjLxcOb956kSLpU0dBVp+mJvrQ40/RAKO2Gc4DS2anUnM8Eku+TRkFAT3NHtfuXQBanHc
	zvfQGPt+Bg345q9IicQ1h7amIesAknn8PO2zoWlEzrCM4CZFxTZRPvRSL2vdKi8Sk3LHFnbm+n2
	HUZpd6b0EfiidxTXa8LOsrmoNhWuWOpmZtGx3+/G5nF754nS0VgdtCR9Ct/TQncI0QxibC7QWSV
	+JY1VSZluFrmS0aIVrqa+qnDsn5Y6Q/NWs9usNueA+7cOCpzGPBx+ILHYZJf1kZdKEZBmL0d8NB
	k9NEyLYnBJ8/4dD0DdcxkZUHTHVcYP39/
X-Received: by 2002:a17:903:8c5:b0:2c9:e2c1:4fb5 with SMTP id d9443c01a7336-2d106e99159mr91519475ad.22.1786090031380;
        Fri, 07 Aug 2026 01:07:11 -0700 (PDT)
X-Received: by 2002:a17:903:8c5:b0:2c9:e2c1:4fb5 with SMTP id d9443c01a7336-2d106e99159mr91518835ad.22.1786090030918;
        Fri, 07 Aug 2026 01:07:10 -0700 (PDT)
Received: from [10.217.217.28] ([202.46.22.19])
        by smtp.gmail.com with ESMTPSA id d9443c01a7336-2d14ccd96afsm5147305ad.24.2026.08.07.01.07.04
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Fri, 07 Aug 2026 01:07:10 -0700 (PDT)
Message-ID: <f2b2f590-de3e-4f10-b883-92845f59412d@oss.qualcomm.com>
Date: Fri, 7 Aug 2026 13:37:02 +0530
Precedence: bulk
X-Mailing-List: devicetree@vger.kernel.org
List-Id: <devicetree.vger.kernel.org>
List-Subscribe: <mailto:devicetree+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:devicetree+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH 2/7] iio: adc: qcom-spmi-adc5-gen3: Add support for QCOM
 PMIC5 Gen4 ADC
To: Jonathan Cameron <jic23@kernel.org>
Cc: David Lechner <dlechner@baylibre.com>,
        =?UTF-8?Q?Nuno_S=C3=A1?=
 <nuno.sa@analog.com>,
        Andy Shevchenko <andy@kernel.org>, Rob Herring <robh@kernel.org>,
        Krzysztof Kozlowski <krzk+dt@kernel.org>,
        Conor Dooley <conor+dt@kernel.org>, Amit Kucheria <amitk@kernel.org>,
        Thara Gopinath <thara.gopinath@gmail.com>,
        "Rafael J. Wysocki" <rafael@kernel.org>,
        Daniel Lezcano <daniel.lezcano@kernel.org>,
        Zhang Rui <rui.zhang@intel.com>, Lukasz Luba <lukasz.luba@arm.com>,
        Bjorn Andersson <andersson@kernel.org>,
        Konrad Dybcio <konradybcio@kernel.org>, linux-iio@vger.kernel.org,
        devicetree@vger.kernel.org, linux-kernel@vger.kernel.org,
        linux-arm-msm@vger.kernel.org, linux-pm@vger.kernel.org,
        Kamal Wadhwa <kamal.wadhwa@oss.qualcomm.com>,
        Anjelique Melendez <anjelique.melendez@oss.qualcomm.com>,
        Manaf Meethalavalappu Pallikunhi <manaf.pallikunhi@oss.qualcomm.com>,
        Priyansh Jain <priyansh.jain@oss.qualcomm.com>
References: <20260731-pmic5_gen4_adc-v1-0-9c49b2eea6f9@oss.qualcomm.com>
 <20260731-pmic5_gen4_adc-v1-2-9c49b2eea6f9@oss.qualcomm.com>
 <20260803011400.1fb6c93a@jic23-huawei>
 <a98d90bd-aa9d-4af3-aa54-3a34300070d4@oss.qualcomm.com>
 <20260807001822.31f7c137@jic23-huawei>
Content-Language: en-US
From: Jishnu Prakash <jishnu.prakash@oss.qualcomm.com>
In-Reply-To: <20260807001822.31f7c137@jic23-huawei>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit
X-Proofpoint-Spam-Info: AW1haW4tMjYwODA3MDA1OSBTYWx0ZWRfXxgJ25YtCxKeG
 a/TbabKiCMGrMyGV+cKw+8waiiPFL10pRWplfwdpPYsSTHERVB8WxM93knFyWs4z9wQYK4BSQR8
 StNlIDu4t98mWeKJcQ/8XhX+z9Sy1QM=
X-Proofpoint-ORIG-GUID: kotJu_lo7WpKj52wv9IM7EHa93tYjmIT
X-Proofpoint-GUID: kotJu_lo7WpKj52wv9IM7EHa93tYjmIT
X-Authority-Analysis: v=2.4 cv=B+eJFutM c=1 sm=1 tr=0 ts=6a759230 cx=c_pps
 a=MTSHoo12Qbhz2p7MsH1ifg==:117 a=fChuTYTh2wq5r3m49p7fHw==:17
 a=IkcTkHD0fZMA:10 a=Sv0fKeRqtYgA:10 a=s4-Qcg_JpJYA:10
 a=VkNPw1HP01LnGYTKEx00:22 a=u7WPNUs3qKkmUXheDGA7:22 a=gowsoOTTUOVcmtlkKump:22
 a=EUspDBNiAAAA:8 a=m2Nr5YO-714gfbtmP0IA:9 a=QEXdDO2ut3YA:10
 a=GvdueXVYPmCkWapjIL-Q:22
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYwODA3MDA1OSBTYWx0ZWRfX1bki2N9aUJdp
 mWNWhOa/ArMfdsBt7PkcPdaeKHIEwDFnuYuqEMcmLqcwKM12Dr4n0KodsQaSi8nUQkEtI8USfC4
 DeinyP7C1IBF6neX8yJF33jPQRKD5BWaGs2meYQVrKTaxKmeV8192F6uKCp7JmN9aQUR7jLH/cw
 wRg+aYE2xhQAcyEIlXYl6wG8g/OPRVet25N+2bZLUslTyjfDF4KfNrfLv90qoPFXWf6WJ0X+jRG
 55dKIfbkbECVCNymkQaBscsUk6LaPDnAQrtgSYhOwA5A8+rjrsv4MkDMEhCpM+M8aNF2YbaB/hm
 1aVFYd0teePGREl/7fNgP1hsCVo+5xSQ1sfTMNrvHT9aVEmTwY+uN2yZ5em9A+cTu1LF5s0JCMN
 g9i7r5XiEZ8oX3F+XgctIvDThAkQPqQtN8MddS7m/jqmYRpzKjwP6HB/+KJ9pLlonUz/Vr4tVua
 wHoAC8dqxI0DpQ2/lvA==
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1176,Hydra:6.1.134,FMLib:17.12.100.49
 definitions=2026-08-07_01,2026-08-06_01,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 spamscore=0 suspectscore=0 impostorscore=0 clxscore=1015 lowpriorityscore=0
 priorityscore=1501 adultscore=0 bulkscore=0 phishscore=0 malwarescore=0
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.22.0-2606150000 definitions=main-2608070059

Hi Jonathan,

On 8/7/2026 4:48 AM, Jonathan Cameron wrote:
> On Thu, 6 Aug 2026 16:22:16 +0530
> Jishnu Prakash <jishnu.prakash@oss.qualcomm.com> wrote:
> 
>> Hi Jonathan,
>>
>> On 8/3/2026 5:44 AM, Jonathan Cameron wrote:
>>> On Fri, 31 Jul 2026 23:36:15 +0530
>>> Jishnu Prakash <jishnu.prakash@oss.qualcomm.com> wrote:
>>>   
>>>> PMIC5 Gen4 ADC is similar to PMIC5 Gen3 ADC, with several changes made
>>>> for improved performance, mostly at the hardware level.
>>>>
>>>> One significant software change is that ratiometric conversion resolution
>>>> has been increased from 14 bits to 16 bits, so the maximum value of
>>>> these measurements needs to be updated for Gen4. Add a new scaling
>>>> function for thermistor channels which use this type of conversion.
>>>>
>>>> In the latest PMIC arbiter version (v8), there can be up to 4 buses
>>>> under the PMIC arbiter and 32 PMICs under each bus. In order to
>>>> support communication between ADC on the master PMIC and ADCs on any
>>>> of the other PMICs, a field of width 2 bits is added for bus index
>>>> and the bits for SID are extended from 4 to 5 bits, in the SID
>>>> register. Add support for this.
>>>>
>>>> In addition, it is possible that the master PMIC has ADC of one generation
>>>> and it needs to communicate with another PMIC with ADC of a different
>>>> generation.  
>>>
>>> "Possible" sounds a bit hypothetical.  Can we state this actually happens
>>> on some devices?  
>>
>> Considering existing upstream platforms, this is applicable for SM8750. I'll
>> mention this in the next version of the series.
> 
> What happens on that platform today?  Wrong values?  Should this be treated
> as a fix rather than a feature? 

There is no issue on that platform right now as ADC channels needing this
support are not added yet. SM8750 board files only include pmk8550.dtsi, which
has the top-level Gen3 ADC peripheral and some ADC channels on the same PMIC.
Gen4 support would be needed only when PMIH0108 ADC channels are added.

> 
> 
>>>> -static int adc5_gen3_read_voltage_data(struct adc5_chip *adc, u16 *data)
>>>> +static int adc5_gen3_read_voltage_data(struct adc5_chip *adc,
>>>> +				       struct adc5_channel_common_prop *prop,
>>>> +				       u16 *data)
>>>>  {
>>>>  	u8 rslt[2];
>>>>  	int ret;
>>>> @@ -99,8 +101,10 @@ static int adc5_gen3_read_voltage_data(struct adc5_chip *adc, u16 *data)
>>>>  	*data = get_unaligned_le16(rslt);
>>>>  
>>>>  	if (*data == ADC5_USR_DATA_CHECK) {  
>>> This feels backwards.   We first check for the top bit being
>>> set then check whether we care if it is set or not.  I think
>>> checking if we should look at it first makes more sense.  Also
>>> shorter max line length:
>>>
>>> 	if (!(prop->generation == ADC5_GEN4 && prop->cal_method == ADC5_RATIOMETRIC_CAL)) {
>>> 		if (*data == ADC5_USR_DATA_CHECK) {
>>> 	...	  
>>
>> I thought it was more efficient to have the check like this because
>> there may be several channels satisfying the longer if() check for Gen4
>> ratiometric channels, but the chance of *data being exactly equal to
>> the error value ADC5_USR_DATA_CHECK is lower generally. So if I reverse
>> the checks as you suggested, the outer if() check would pass for every
>> read done on a channel which is not both Gen4 and ratiometric, which
>> seems inefficient for an error check.
>>
>> What do you think, should I make any changes here?
> 
> Efficiency here is going to be hard to judge without guessing how good
> the prefetchers are and to me this doesn't smell like a performance
> critical path.   I'd go for clarity of code and check only
> for the invalid value after you've established it might actually be
> invalid. So change it.

Sure, I'll make this change.

Thanks,
Jishnu

> 
> Thanks,
> 
> Jonathan

