Received: from mx0b-0031df01.pphosted.com (mx0b-0031df01.pphosted.com [205.220.180.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id B4CCA3D2FF0
	for <devicetree@vger.kernel.org>; Mon, 30 Mar 2026 13:06:37 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.180.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1774875999; cv=none; b=ng6kbWDmMnnhDAfIRoY6mDRdhzvVBIlNzDe4c/AZpeVjVaws4qlnZtVOQzdgOPO3hru1EfGo/Y2wtqcEvaUZrmmbMbpVMVW7LpvQrgLPT1zvElBZggdi4wCG3wbsqySRIvVChZkap8x93XIBhIqZxc07RwxIbQRPnF6yXUL0R3s=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1774875999; c=relaxed/simple;
	bh=hnJBIkRTxb/pEx74u11pPM/34htrB6sS8kh15oW/cOk=;
	h=Message-ID:Date:MIME-Version:Subject:To:Cc:References:From:
	 In-Reply-To:Content-Type; b=aisAwgql/+aTL58FrCMLDnuo+sZNTYiEr62+2gBWi976c8jHMDjyEyyC4cnub4LTVfhAHEEBJi6VJ+/WQApxB2ndzivtm9wU2/Lc7wB2e5Sr04wSffSKjFtDMfSnDwTKFoPVj1NTXUtqlH3SjvI68NBEydOf3AxLn0y37uDBduM=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=ZTQeaf/b; dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b=iEBJZwuJ; arc=none smtp.client-ip=205.220.180.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b="ZTQeaf/b";
	dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b="iEBJZwuJ"
Received: from pps.filterd (m0279871.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 62UAGu723176217
	for <devicetree@vger.kernel.org>; Mon, 30 Mar 2026 13:06:36 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	/IOBEa7GFyVDrfJ8sYt5+s+/t7ENB46SJEYFrDxrvCM=; b=ZTQeaf/bytoCSzFg
	EDH8gepEfMTHNA3ea5/l/Z00vj10jB0GWj/hak8WZ2+LJeykTE127InAgZiMx8GO
	XzS+nfcvuaPOcQSDV/SozA0cdn7P0iTCyazjW3u+in77R91Vp1YhT0ur9yrYylGA
	xTtTJH2szq98RqFxdWwzcUbh5AdSzfj6Oh2WLltinAPul7VqEGoEu9DTevdoSnzU
	G7Nu0ewwB0ISQNtX33XcF9XfT8fOiKcE3hVaBq5iYhS0xATgA6sbe5cZvXmLyTAL
	k10JtG8qp5qG3CD+Cbo58BxEgqrev9YdFl1OYWZEo+XALFovMpnZlEif36TQeUYG
	zyjM3A==
Received: from mail-pl1-f200.google.com (mail-pl1-f200.google.com [209.85.214.200])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4d7q9h0m8e-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <devicetree@vger.kernel.org>; Mon, 30 Mar 2026 13:06:36 +0000 (GMT)
Received: by mail-pl1-f200.google.com with SMTP id d9443c01a7336-2b24e45271cso16946215ad.2
        for <devicetree@vger.kernel.org>; Mon, 30 Mar 2026 06:06:36 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1774875996; x=1775480796; darn=vger.kernel.org;
        h=content-transfer-encoding:in-reply-to:from:references:cc:to
         :content-language:subject:user-agent:mime-version:date:message-id
         :from:to:cc:subject:date:message-id:reply-to;
        bh=/IOBEa7GFyVDrfJ8sYt5+s+/t7ENB46SJEYFrDxrvCM=;
        b=iEBJZwuJoLqzYX1ayOSt/bomnl1mo84JQYdcC+JOu6KmwGqzJYAOeNy16k5CH0zpUz
         N45VBk+8UzEbizpC+KanG8U276OK1C7myh/6gTl2CR2ckJEH2AfoMjQLtUWRcb4L2fbr
         gyoDpqebAVHjfYrbPM4lphPI+CPDJbDuSe2iwG9ktJ3vb//He+oyixcDkSioOuTwXIf4
         k6sSTgxlu5/4dH/n/aSHbGAtIWIhRK9xf7XGgRabjr3VsBGXLM+yuSVYukhaOF2H4+A9
         2HLG1Zvr4Vek7t20Bkj9fe8Mjj+2vdg7edNY0Qbt5vC3TRcN6if3vrE0tQXXR/jgkDjy
         CNig==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1774875996; x=1775480796;
        h=content-transfer-encoding:in-reply-to:from:references:cc:to
         :content-language:subject:user-agent:mime-version:date:message-id
         :x-gm-gg:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=/IOBEa7GFyVDrfJ8sYt5+s+/t7ENB46SJEYFrDxrvCM=;
        b=YWcfskBgytY45UJSrVaE3XhBHTif9XT9oDTWZvZuextghAB79mLGChSouN3jQBYiPD
         TDdRWxCyVkosriQF+kGBp/Kp/qHRVvZOQJB5ZD0wIDyr5LwqmxXu07V8cR6xk1AYDdGy
         UP3PRhkLrMfVPysnBKP5T87V9DJD+YH9vaEmTRxmXnBDg/uM/G3BaaixUegijP9LE9oT
         B2DJ0fnwTYa8tJ8a2kXUZVE0HT/2spAFNkJKITv5R1b7AZFWhw0ZmGdhW7XfhJWr66a5
         asEp97Uo7LJi+9FsZHeLeWHiL+hbFgV5V2cWPGg8qksuDR/Gvc4JqO73uEfeeRqAEOnd
         PtGA==
X-Forwarded-Encrypted: i=1; AJvYcCWAT3dN2wUEr6SzfPXG4a4pq24TSJJFeVr2j+po2hZ3BLeFhF2o94M/TNX2uU8qITHLKHRo2wpQe8Os@vger.kernel.org
X-Gm-Message-State: AOJu0YzTcs/VjwapnC3ykxoFbYkPwAiUPsmgZePUFB7msSup7Q/hqZAd
	Zk0xyCJXUCBPRG6FWFs+fQtFm3n09bmj1gdxQkgxxOHwHZc7YfwLkp+XKtaCY2sTBjxFqbokVZ8
	bvYav7hvAA8kYIxPt3w0yXWMeLkTPc6+qJ/cNVAA1O/vD82HP0w83d0ZU9sNF+JlB
X-Gm-Gg: ATEYQzw7JKMre8pl2QBgG2lVfkn95UApJfecaae7XcBz8p3z5+5bgycN3Ck1kZCxd8b
	DmRRCXi0EuXib8WGZDDVmU8JB4BzBm+dzNJVI5o4SRdiYbXAMj4xZOkJi27B3cqxyA1PLRbVAO/
	Gqq5zjxebBvTp4qZ1+BeB5z6OF4wBhpgupFsASVEwE/exYxv6T225u6SD7V/s6XOLCl47ptX3uz
	uEtgRWaP8FDh2XWNjnpwL1bh6tUD4gD4wOatM547o+AdidGocfiHsqydBRMD1KNhiUwi4MzFpk+
	k/Fr9aWWn7Bgn2eaqn9YfKEMbksogwmgB/165p9tE2wb03RyOKz9FxUWPVOcL+Pxmgg63uY+vJz
	ExhpQqv8cFXaWNe+Vgun/psisZwHKlJ9Wo95wiXq36tkmkQlcYsCLCQ==
X-Received: by 2002:a17:902:d2ca:b0:2b0:5968:a6d5 with SMTP id d9443c01a7336-2b0cdc2165fmr113600635ad.18.1774875995483;
        Mon, 30 Mar 2026 06:06:35 -0700 (PDT)
X-Received: by 2002:a17:902:d2ca:b0:2b0:5968:a6d5 with SMTP id d9443c01a7336-2b0cdc2165fmr113600345ad.18.1774875994884;
        Mon, 30 Mar 2026 06:06:34 -0700 (PDT)
Received: from [10.0.0.3] ([106.222.233.247])
        by smtp.gmail.com with ESMTPSA id d9443c01a7336-2b24267397bsm88213025ad.27.2026.03.30.06.06.26
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Mon, 30 Mar 2026 06:06:34 -0700 (PDT)
Message-ID: <0b41ee7c-83fe-d604-b750-8a5a0bd62bf8@oss.qualcomm.com>
Date: Mon, 30 Mar 2026 18:36:24 +0530
Precedence: bulk
X-Mailing-List: devicetree@vger.kernel.org
List-Id: <devicetree.vger.kernel.org>
List-Subscribe: <mailto:devicetree+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:devicetree+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (Windows NT 10.0; Win64; x64; rv:102.0) Gecko/20100101
 Thunderbird/102.15.1
Subject: Re: [PATCH v5 2/5] media: iris: scale MMCX power domain on SM8250
Content-Language: en-US
To: Dmitry Baryshkov <dmitry.baryshkov@oss.qualcomm.com>
Cc: Bjorn Andersson <andersson@kernel.org>,
        Michael Turquette <mturquette@baylibre.com>,
        Stephen Boyd
 <sboyd@kernel.org>, Rob Herring <robh@kernel.org>,
        Krzysztof Kozlowski <krzk+dt@kernel.org>,
        Conor Dooley
 <conor+dt@kernel.org>,
        Taniya Das <quic_tdas@quicinc.com>, Jonathan Marek <jonathan@marek.ca>,
        Ulf Hansson <ulf.hansson@linaro.org>,
        "Rafael J. Wysocki" <rafael@kernel.org>,
        Bryan O'Donoghue <bod@kernel.org>,
        Vikash Garodia <vikash.garodia@oss.qualcomm.com>,
        Mauro Carvalho Chehab <mchehab@kernel.org>,
        Stanimir Varbanov <stanimir.varbanov@linaro.org>,
        Abhinav Kumar <abhinav.kumar@linux.dev>,
        Hans Verkuil <hverkuil@kernel.org>,
        Stefan Schmidt <stefan.schmidt@linaro.org>,
        Konrad Dybcio <konradybcio@kernel.org>,
        Bryan O'Donoghue <bryan.odonoghue@linaro.org>,
        Dikshita Agarwal <dikshita@qti.qualcomm.com>,
        linux-arm-msm@vger.kernel.org, linux-clk@vger.kernel.org,
        devicetree@vger.kernel.org, linux-kernel@vger.kernel.org,
        linux-pm@vger.kernel.org, linux-media@vger.kernel.org,
        Mauro Carvalho Chehab <mchehab+huawei@kernel.org>
References: <20260209-iris-venus-fix-sm8250-v5-0-0a22365d3585@oss.qualcomm.com>
 <20260209-iris-venus-fix-sm8250-v5-2-0a22365d3585@oss.qualcomm.com>
 <5e2635ac-35de-645b-b5e7-235923f844ce@oss.qualcomm.com>
 <x5gv6dxdum5klzfjyo7xjqull6o43okkmkn7avssg26epbvrz6@z2brpssbk7iv>
From: Dikshita Agarwal <dikshita.agarwal@oss.qualcomm.com>
In-Reply-To: <x5gv6dxdum5klzfjyo7xjqull6o43okkmkn7avssg26epbvrz6@z2brpssbk7iv>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYwMzMwMDEwMiBTYWx0ZWRfXxOV6mxwRjy86
 OpWzIA1HtSKqafv/it8jJTehy2VodPi57Bpd5mtwtOJVQMoUPaUhg6XD5v0W23uTU+PIuUXrta2
 hsMBTcm3tb83RzJXnIBmrOQeMFaOs77/eCXRTB2TkxU3N1byRQAjVCAAw9OE7qP7AzmGDpE7F8Y
 hhQIlAQHQQgpNNb8xbtQ6B1zbiX+PqF3YwgtqEflrP6CbQoq/JoUNnp3PbuXASazj1A3WByTPSm
 u4OoObKCx42cFebuNTC3dX7BhShQam70dy2OskaLQ6RYbAnvrpn6IdUNw6zfUvxw/Usn8KMohBR
 OWAP3m0jLeHNhpd9QmYnkWWWQQcYi0c5nt5ICaVhTBcdknCJKpYBOx+FGKc82SdTWHqaKHG8s7q
 rLwE8JFJu07ZApia0erzCctnY17MDTHqMTCxbbqx/t0U2UnWcDwOhHZdLBjxl6pAQXwgh9F8kst
 Nh+nQ4FzILE1kONAObQ==
X-Authority-Analysis: v=2.4 cv=AZS83nXG c=1 sm=1 tr=0 ts=69ca755c cx=c_pps
 a=IZJwPbhc+fLeJZngyXXI0A==:117 a=5/Y9Gi2N1OwmQbPtUd2E/A==:17
 a=IkcTkHD0fZMA:10 a=Yq5XynenixoA:10 a=s4-Qcg_JpJYA:10
 a=VkNPw1HP01LnGYTKEx00:22 a=u7WPNUs3qKkmUXheDGA7:22 a=3WHJM1ZQz_JShphwDgj5:22
 a=EUspDBNiAAAA:8 a=PIOu0JlNxAVOzX5nUJ4A:9 a=3ZKOabzyN94A:10 a=QEXdDO2ut3YA:10
 a=uG9DUKGECoFWVXl0Dc02:22
X-Proofpoint-GUID: PW5g31y9nVv837ZWQgkQEZeMHBFhSuLB
X-Proofpoint-ORIG-GUID: PW5g31y9nVv837ZWQgkQEZeMHBFhSuLB
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1143,Hydra:6.1.51,FMLib:17.12.100.49
 definitions=2026-03-29_05,2026-03-28_01,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 lowpriorityscore=0 phishscore=0 priorityscore=1501 clxscore=1015
 impostorscore=0 suspectscore=0 bulkscore=0 adultscore=0 malwarescore=0
 spamscore=0 classifier=typeunknown authscore=0 authtc= authcc= route=outbound
 adjust=0 reason=mlx scancount=1 engine=8.22.0-2603050001
 definitions=main-2603300102



On 3/30/2026 4:45 PM, Dmitry Baryshkov wrote:
> On Mon, Mar 30, 2026 at 10:55:02AM +0530, Dikshita Agarwal wrote:
>>
>>
>> On 2/9/2026 7:02 AM, Dmitry Baryshkov wrote:
>>> On SM8250 most of the video clocks are powered by the MMCX domain, while
>>> the PLL is powered on by the MX domain. Extend the driver to support
>>> scaling both power domains, while keeping compatibility with the
>>> existing DTs, which define only the MX domain.
>>>
>>> Fixes: 79865252acb6 ("media: iris: enable video driver probe of SM8250 SoC")
>>> Reviewed-by: Dikshita Agarwal <dikshita.agarwal@oss.qualcomm.com>
>>> Signed-off-by: Dmitry Baryshkov <dmitry.baryshkov@oss.qualcomm.com>
>>> ---
>>>  drivers/media/platform/qcom/iris/iris_platform_gen1.c | 2 +-
>>>  drivers/media/platform/qcom/iris/iris_probe.c         | 7 +++++++
>>>  2 files changed, 8 insertions(+), 1 deletion(-)
>>>
>>> diff --git a/drivers/media/platform/qcom/iris/iris_platform_gen1.c b/drivers/media/platform/qcom/iris/iris_platform_gen1.c
>>> index df8e6bf9430e..aa71f7f53ee3 100644
>>> --- a/drivers/media/platform/qcom/iris/iris_platform_gen1.c
>>> +++ b/drivers/media/platform/qcom/iris/iris_platform_gen1.c
>>> @@ -281,7 +281,7 @@ static const struct bw_info sm8250_bw_table_dec[] = {
>>>  
>>>  static const char * const sm8250_pmdomain_table[] = { "venus", "vcodec0" };
>>>  
>>> -static const char * const sm8250_opp_pd_table[] = { "mx" };
>>> +static const char * const sm8250_opp_pd_table[] = { "mx", "mmcx" };
>>>  
>>>  static const struct platform_clk_data sm8250_clk_table[] = {
>>>  	{IRIS_AXI_CLK,  "iface"        },
>>> diff --git a/drivers/media/platform/qcom/iris/iris_probe.c b/drivers/media/platform/qcom/iris/iris_probe.c
>>> index 7b612ad37e4f..74ec81e3d622 100644
>>> --- a/drivers/media/platform/qcom/iris/iris_probe.c
>>> +++ b/drivers/media/platform/qcom/iris/iris_probe.c
>>> @@ -64,6 +64,13 @@ static int iris_init_power_domains(struct iris_core *core)
>>>  		return ret;
>>>  
>>>  	ret =  devm_pm_domain_attach_list(core->dev, &iris_opp_pd_data, &core->opp_pmdomain_tbl);
>>> +	/* backwards compatibility for incomplete ABI SM8250 */
>>> +	if (ret == -ENODEV &&
>>> +	    of_device_is_compatible(core->dev->of_node, "qcom,sm8250-venus")) {
>>> +		iris_opp_pd_data.num_pd_names--;
>>> +		ret = devm_pm_domain_attach_list(core->dev, &iris_opp_pd_data,
>>> +						 &core->opp_pmdomain_tbl);
>>> +	}
>>>  	if (ret < 0)
>>>  		return ret;
>>>  
>>>
>>
>> Hitting below compilation error on latest kernel
>>
>> drivers/media/platform/qcom/iris/iris_probe.c: In function
>> ‘iris_init_power_domains’:
>> drivers/media/platform/qcom/iris/iris_probe.c:71:46: error: decrement of
>> read-only member ‘num_pd_names’
>>    71 |                 iris_opp_pd_data.num_pd_names--;
> 
> See commit 7ad7f43e568b ("pmdomain: de-constify fields struct
> dev_pm_domain_attach_data")

Ack, Thanks!

Regards,
Dikshita
> 
>>
>> Could you please check and fix.
>>
>> Thanks,
>> Dikshita
> 
