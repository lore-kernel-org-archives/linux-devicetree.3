Received: from mx0a-0031df01.pphosted.com (mx0a-0031df01.pphosted.com [205.220.168.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id ECAB53CFF6A
	for <devicetree@vger.kernel.org>; Tue, 23 Jun 2026 10:41:46 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.168.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1782211308; cv=none; b=KJ0vsBpDyYvmcnmoMj64+h/XIdb8ABMzYxAEKY0lYKy/kRzSLlX577WeWBrQov1142QyDF+0HdvY355xr7ougzTxlDjArPomji0NQM+WyZMF85RK/qh3OT+Hs7Nqh8dfYxx+2qAjxR/czb3C0iA7/YnG5DDP3t3EqUkoOJMAA1A=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1782211308; c=relaxed/simple;
	bh=2VgH5KfDdlzlPIz+sChiqqNUH5YO3RGqBq0ILzjT9gs=;
	h=Message-ID:Date:MIME-Version:Subject:To:Cc:References:From:
	 In-Reply-To:Content-Type; b=Y02mf19Cq/sfVcLDtMJswqfJRnFCENxEhzboG/7TfW6UAepdfct6Lpof5YrodhAQ0iIngFMCT4Umom3cc2+3WhtXWjt/iAKpe8YkH6LT1kI7wmqu51xKoPbTZ5PGNnV2Ng6cD6kCQZ3JyittItRJYZLl1EqZ6m60Sv8nVYUp/iI=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=YUGZ9eSL; dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b=HXKGHZbZ; arc=none smtp.client-ip=205.220.168.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b="YUGZ9eSL";
	dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b="HXKGHZbZ"
Received: from pps.filterd (m0279863.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 65NA3IxG952949
	for <devicetree@vger.kernel.org>; Tue, 23 Jun 2026 10:41:46 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	qW0iDkDs1LGQ0Qr0sk+Hgc/v7XkJCMVmkF2ubdjfZPA=; b=YUGZ9eSL3yRCoXVS
	pbTafCobY+0E5kfukaWwl/XL85wJaPhO+G4h2wYAG91TY3FAFOzbAh/imY6FzCKq
	tybb+CyrFX4Ygpo4ZT18u1UwuBvdTJWLe/8tw1sEx4Yc7ysbOvRbD+OY6tjLSSq6
	2HrA64UtmDlGDJb+cNoUAtxKTQ2DpxC/8xlU4/Bn2d86xN34N5Su2bIhHwCHKYLU
	gynrCyvk9V9a+CN0AfBYTwakPKUDZ3ymEUkaUJM4TQwUK3FJldiAV17hyC6d/3GX
	FYrpUzTnW/kcxWY+DqnW5ZR7JH9ZXINGp0TVTb7dSRtCSsxDXXb9Cj4ga2YrL5ox
	vO+89Q==
Received: from mail-qk1-f200.google.com (mail-qk1-f200.google.com [209.85.222.200])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4eyr28r53g-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <devicetree@vger.kernel.org>; Tue, 23 Jun 2026 10:41:46 +0000 (GMT)
Received: by mail-qk1-f200.google.com with SMTP id af79cd13be357-92585d4237dso12518485a.3
        for <devicetree@vger.kernel.org>; Tue, 23 Jun 2026 03:41:46 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1782211305; x=1782816105; darn=vger.kernel.org;
        h=content-transfer-encoding:in-reply-to:from:content-language
         :references:cc:to:subject:user-agent:mime-version:date:message-id
         :from:to:cc:subject:date:message-id:reply-to;
        bh=qW0iDkDs1LGQ0Qr0sk+Hgc/v7XkJCMVmkF2ubdjfZPA=;
        b=HXKGHZbZ3ddZMslINCf1uj9qGqfVLuTnBWhDpdFuwlzI4LE4ogzj+QJRswQUwDehEr
         Hx0df9RssKgSa3IBaeJXcockBc/sAdDae6v7f7L7UgYBSYwc4x0TIZwsgA9CoxETvfvf
         33qWXh338UX95zqEtQVtdglibv/jE4tq5EdhlMyKXotX/I/wNvauCIORwhOVed5EKyPF
         kPgjOTKTIRQOfX3lSC0/VKvdrGSoaoN+UFkGAPwhpGdhcNCILwPa9/OPQT3M0Ndt5BZ4
         pB1EJK4TZti5sRxBVjd+3u2O+4MkGZfU3PVZn654KPxr16yuKFL2eSXGTl0ISQ7BTsA6
         y/gA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1782211305; x=1782816105;
        h=content-transfer-encoding:in-reply-to:from:content-language
         :references:cc:to:subject:user-agent:mime-version:date:message-id
         :x-gm-gg:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=qW0iDkDs1LGQ0Qr0sk+Hgc/v7XkJCMVmkF2ubdjfZPA=;
        b=T3xsIX+sa14xr/ryFfliV1uGbRmkM4eW4JHhGc01yFcrfxDicucwc4bc16c/ZXgLgw
         gSGD0+A8rn5s30IZSos82TZET93gZ/ATFKxmwrwLZ5TQK4Q3nJrLFkPwJ5mqAOR83hOV
         PZCycBNmXVchtqWFRxWRiw/mBRv7KJ5ZV5oc3jUbayEUREVrwEl8JNKHw8rHxHLkLi9Z
         FZTS4pcA63CK2+jsJrs+YFM4KriJlYdpJmjU0044zIwQuCnHytNP8ZXcfaLGjtX9JRgX
         a8RwjeO9J+sk2c/cinl7Dl8GcDl8dJuf4Mf4ionkLZ9Zr6fjKvkgOXoDZ6nk0H2KUGrH
         7DvQ==
X-Forwarded-Encrypted: i=1; AFNElJ85tSsFl5rb+3G3FvT5vpIw6uc/SLBYfDTSebc4G6+u2zYa0wPhrw9+yji1grmOzH/arjx+EQoH4bQS@vger.kernel.org
X-Gm-Message-State: AOJu0YzuJU2OK2afm/EmoF+zhN97Zw+gv5Hf//aNc+lUKWKxCJFKyl71
	uJf9LoO2gJXTIv7nH6doziw9yb8qT1P+8J61K5mrobSvi5F8YzHGI4Ps4CSpt28MwglwWaf6Uky
	4BKScp3nnPmN7ncGlO9kpjZkDtvrrOti3M43y/s4OUNBnk3QIQcHBwm+nwgmRQihB
X-Gm-Gg: AfdE7cmSU8M0AfCQJ4aDYXnHY66lRFXMsemgt6/sjZVU94McIX1sQC+XhkyUu8auD+t
	40QIlkXpp1x+BQW+BsCxl+3QixMvRVTfTbt4viq83BSjz3BTk3fBGu1aQmgHKfcs3jEr0Q15F9p
	CuJ/prv1YGdZ+tpJjvqi2uYvIO+BZuuzco/VitN4dSQzbRZrJhj4cW+aZu7cRePwcGaJnJsv46F
	mscqGxYbjlv+iEGbOTAvMk+4uwL/9K8ZZjYUfcElufbKXt/S69JW/1tugS+UunR8bVvlO4KgwXx
	nwxDxgFt+/K2Rwd7SLkVMK+lvqd/bFx4QEA2aevi4rVmYMwZ18bYCTlYBaRXU13qFfZxdgGqG98
	PYTl6rwuqvWBkOPd7scH5vBJRzui7BJkz5Y0=
X-Received: by 2002:a05:620a:4107:b0:90d:11b2:80f3 with SMTP id af79cd13be357-925c8ecdc9bmr475961685a.7.1782211305212;
        Tue, 23 Jun 2026 03:41:45 -0700 (PDT)
X-Received: by 2002:a05:620a:4107:b0:90d:11b2:80f3 with SMTP id af79cd13be357-925c8ecdc9bmr475959585a.7.1782211304705;
        Tue, 23 Jun 2026 03:41:44 -0700 (PDT)
Received: from [192.168.120.170] ([178.235.128.140])
        by smtp.gmail.com with ESMTPSA id a640c23a62f3a-c0c6161595csm496121466b.62.2026.06.23.03.41.41
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Tue, 23 Jun 2026 03:41:43 -0700 (PDT)
Message-ID: <8386c50c-42ad-47f5-979d-54cbaa5109d3@oss.qualcomm.com>
Date: Tue, 23 Jun 2026 12:41:40 +0200
Precedence: bulk
X-Mailing-List: devicetree@vger.kernel.org
List-Id: <devicetree.vger.kernel.org>
List-Subscribe: <mailto:devicetree+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:devicetree+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH 2/2] thermal: qcom: Add support for Qualcomm MBG thermal
 monitoring
To: Sachin Gupta <sachin.gupta@oss.qualcomm.com>, Lee Jones <lee@kernel.org>,
        Rob Herring <robh@kernel.org>,
        Krzysztof Kozlowski <krzk+dt@kernel.org>,
        Conor Dooley <conor+dt@kernel.org>,
        "Rafael J. Wysocki" <rafael@kernel.org>,
        Daniel Lezcano <daniel.lezcano@kernel.org>,
        Zhang Rui <rui.zhang@intel.com>, Lukasz Luba <lukasz.luba@arm.com>,
        Stephen Boyd <sboyd@kernel.org>,
        Jishnu Prakash <jishnu.prakash@oss.qualcomm.com>,
        Kamal Wadhwa <kamal.wadhwa@oss.qualcomm.com>,
        Amit Kucheria <amitk@kernel.org>,
        Thara Gopinath <thara.gopinath@gmail.com>
Cc: linux-arm-msm@vger.kernel.org, devicetree@vger.kernel.org,
        linux-kernel@vger.kernel.org, linux-pm@vger.kernel.org,
        Satya Priya Kakitapalli <quic_skakitap@quicinc.com>,
        Ajit Pandey <ajit.pandey@oss.qualcomm.com>,
        Imran Shaik <imran.shaik@oss.qualcomm.com>,
        Taniya Das <taniya.das@oss.qualcomm.com>,
        Jagadeesh Kona <jagadeesh.kona@oss.qualcomm.com>
References: <20260601-spmi-mbg-driver-v1-0-b4892b55a17f@oss.qualcomm.com>
 <20260601-spmi-mbg-driver-v1-2-b4892b55a17f@oss.qualcomm.com>
 <7478c540-a5fc-4238-bba0-5b04547f57c7@oss.qualcomm.com>
 <487f0ed1-dfc2-4f7b-94ce-60045017a663@oss.qualcomm.com>
 <5ad33cf2-3168-44f2-89fe-a7fe1420f8f4@oss.qualcomm.com>
 <4d0f96d7-3848-4442-a8e9-243a6c4a3495@oss.qualcomm.com>
Content-Language: en-US
From: Konrad Dybcio <konrad.dybcio@oss.qualcomm.com>
In-Reply-To: <4d0f96d7-3848-4442-a8e9-243a6c4a3495@oss.qualcomm.com>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
X-Proofpoint-Spam-Info: AW1haW4tMjYwNjIzMDA4NiBTYWx0ZWRfX5WvvR7+YBuQg
 Hk3pm+0KuYu6c6eIogv4hFhY5ZIr1zujfgZ0qwj1XhIIVFQum8ifypvRzvYh4letGCii18We02N
 xdv1XwrU1C07vRyKM8eO3G+9F+WgYTU=
X-Authority-Analysis: v=2.4 cv=b4KCJNGx c=1 sm=1 tr=0 ts=6a3a62ea cx=c_pps
 a=hnmNkyzTK/kJ09Xio7VxxA==:117 a=PRfkaYvzSr8QmIIGAkY2Sg==:17
 a=IkcTkHD0fZMA:10 a=FelO9ux0wxsA:10 a=s4-Qcg_JpJYA:10
 a=VkNPw1HP01LnGYTKEx00:22 a=u7WPNUs3qKkmUXheDGA7:22 a=yOCtJkima9RkubShWh1s:22
 a=COk6AnOGAAAA:8 a=EUspDBNiAAAA:8 a=oS_SqjwSy1YzO6rVN58A:9 a=3ZKOabzyN94A:10
 a=QEXdDO2ut3YA:10 a=PEH46H7Ffwr30OY-TuGO:22 a=TjNXssC_j7lpFel5tvFf:22
X-Proofpoint-GUID: 9QwZepPgjopEW-xXvCnYJoSSV4zsabzv
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYwNjIzMDA4NiBTYWx0ZWRfX1C01WdydP4TK
 2FtJiuNDV+ynXuKa85JGmXcQ4lPlWGaHv6+avjqZI1+91aL4a5i4G2FT2c+MywtKVE4By9NvMuv
 NCvVXpsE4M1gIiMVnnKXDY3JUrIghLEgif+eAPJunrzX0GJ9WbRRYlG9XSwAh8W4FwOQEjS/OFT
 tJqcYEk6fOUa36GTLZbhCCmvk9Ap0kI5OryTnWqATbT9WM82ODJp5QqsqtMecSv544KgDSs2V3Y
 S/Z9SF/+VpKVLQo7eqy4zJ77HGUIKK8ZhoN2UTW+MzoRclI1J5fCHDBbIE+96JU/4YinM5eTvNt
 L7U4FZoEPjNe8N3zTbnxspbSMTWOjit21dwchd1axTZNgIM+nTmdNdkvSt+So/TwBsO5mO/W4QD
 mk9lv8I26X7T4TbZiwCl2mfNfDbU7Jfg11WGPNxsA0YvAU8MHkRzhYnCE4JJ976MRv9PZndOAnF
 FD7mxww7ILKcf7jzjYw==
X-Proofpoint-ORIG-GUID: 9QwZepPgjopEW-xXvCnYJoSSV4zsabzv
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1143,Hydra:6.1.125,FMLib:17.12.100.49
 definitions=2026-06-23_02,2026-06-22_01,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 lowpriorityscore=0 bulkscore=0 adultscore=0 impostorscore=0 spamscore=0
 suspectscore=0 phishscore=0 priorityscore=1501 clxscore=1015 malwarescore=0
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.22.0-2606150000 definitions=main-2606230086

On 6/23/26 12:14 PM, Sachin Gupta wrote:
> 
> 
> On 6/19/2026 5:44 PM, Konrad Dybcio wrote:
>> On 6/19/26 8:45 AM, Sachin Gupta wrote:
>>>
>>>
>>> On 6/16/2026 3:40 PM, Konrad Dybcio wrote:
>>>> On 6/1/26 1:01 PM, Sachin Gupta wrote:
>>>>> From: Satya Priya Kakitapalli <quic_skakitap@quicinc.com>
>>>>>
>>>>> Add driver for the Qualcomm MBG thermal monitoring device. It monitors
>>>>> the die temperature, and when there is a level 1 upper threshold
>>>>> violation, it receives an interrupt over spmi. The driver reads
>>>>> the fault status register and notifies thermal accordingly.
>>>>>
>>>>> Signed-off-by: Satya Priya Kakitapalli <quic_skakitap@quicinc.com>
>>>>> Co-developed-by: Sachin Gupta <sachin.gupta@oss.qualcomm.com>
>>>>> Signed-off-by: Sachin Gupta <sachin.gupta@oss.qualcomm.com>
>>>>> ---
>>
>> [...]
>>
>>>>> +    /*
>>>>> +     * Configure the last_temp one degree higher, to ensure the
>>>>> +     * violated temp is returned to thermal framework when it reads
>>>>> +     * temperature for the first time after the violation happens.
>>>>> +     * This is needed to account for the inaccuracy in the conversion
>>>>> +     * formula used which leads to the thermal framework setting back
>>>>> +     * the same thresholds in case the temperature it reads does not
>>>>> +     * show violation.
>>>>> +     */
>>>>> +    chip->last_temp = temp + MBG_TEMP_CONSTANT;
>>>>
>>>> Will this work fine if the user tries to set the max temp supported
>>>> by the hardware (i.e. is there headroom for max+1)?
>>>>
>>>
>>> In the current implementation, temp == MBG_MAX_SUPPORTED_TEMP is not accepted (temp < MBG_MAX_SUPPORTED_TEMP), so the last_temp = temp + MBG_TEMP_CONSTANT path is never taken at absolute max. For accepted trips (strictly below max), there is headroom for the +1C adjustment.
>>
>> You check for `temp < MBG_MAX_SUPPORTED_TEMP` and there's:
>>
>> #define MBG_MAX_SUPPORTED_TEMP 160000,
>>
>> so passing temp=159999 is "valid" and after the addition it becomes 160999,
>> which in my understanding is outside the range
>>
>> Konrad
> 
> chip->last_temp is only a software cache used in one place, mbg_tm_get_temp(), to return a synthetic “trip violated” reading once after the IRQ. It is not programmed into any hardware register. So temp + MBG_TEMP_CONSTANT exceeding MBG_MAX_SUPPORTED_TEMP does not cause a hardware out-of-range condition.
> 
> Do you see this as an issue?

Right, I zoomed in too much

Konrad
