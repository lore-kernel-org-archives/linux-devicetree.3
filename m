Received: from mx0a-0031df01.pphosted.com (mx0a-0031df01.pphosted.com [205.220.168.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id A927C2EDD58
	for <devicetree@vger.kernel.org>; Mon,  4 May 2026 07:50:52 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.168.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1777881055; cv=none; b=VKZnmJptQHRHUzodfc/610LG354IpKE4ZPYeZFdM74ou0tYZnWM35VzFT9FRzcrX48W6zCHGpHZhBsN31EBzk5VOPkW+FXr1DPTruGep+dbxbQKFk3SJGt1NCD5Y9smZ0OHC1h3G5TThx6OQ1ndLM7cyNmMHekCRMuhyIe1GL5g=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1777881055; c=relaxed/simple;
	bh=3H3etX6ScAXZ/9quxEfOPdhOvtsFMMWW6RKeM1++m9M=;
	h=Message-ID:Date:MIME-Version:Subject:To:Cc:References:From:
	 In-Reply-To:Content-Type; b=GGhk/V0jospifvrIAJsUulU9+B+lImeEkm9pLwuGrzz4v57ERxVWX+oMG3lCNCxxnxWt5p2owOgsqcbMN61ZCT+tjCINy9eOLz/BgazXZ+hEWQOneNnvfp5h3vBFszobfKN8gGxJQK3FxDBnLSv9gY+29HylEV161zSjTAvR5rU=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=Cbixuad5; dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b=Uihq98rp; arc=none smtp.client-ip=205.220.168.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b="Cbixuad5";
	dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b="Uihq98rp"
Received: from pps.filterd (m0279862.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 6446DwZV877381
	for <devicetree@vger.kernel.org>; Mon, 4 May 2026 07:50:51 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	PWhWZkkdYztsk7q2EQZkWe4rPMrdeAsMOgYo43K2FPU=; b=Cbixuad5adyEsKdv
	XrMUbiA22ZIGHLppkOSQM+DXlUjWJsu4yY00xZDAXC77fHRgonUt6kk3lqYk76on
	4LljjPqWIZBxdoEoNcP+xLZmzD5q5ONJiLElC7akD0bqRrwT6lGjeeLo85dGtqjz
	vtjfB4BMFz6TejoMq71ejj0w6jfkcVfKqn8kNVImsqBRBxjd38akUIzzdc/QOvF7
	YaQUquGW023EvbSJ+Ek7N+IZfYZ149/GiP0JDDiy/+YRuFvUE+vLCAIy1ar8EfHh
	WoKELgnZvKFD8ZV3hMNnMdY9uzLYs5+0gDAHN3zMbIydfFHtD1bQ0fIpLgIj3rbw
	GAGuWw==
Received: from mail-pl1-f197.google.com (mail-pl1-f197.google.com [209.85.214.197])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4dwa1emqu3-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <devicetree@vger.kernel.org>; Mon, 04 May 2026 07:50:51 +0000 (GMT)
Received: by mail-pl1-f197.google.com with SMTP id d9443c01a7336-2ba115ab6bbso8978785ad.3
        for <devicetree@vger.kernel.org>; Mon, 04 May 2026 00:50:51 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1777881050; x=1778485850; darn=vger.kernel.org;
        h=content-transfer-encoding:in-reply-to:from:content-language
         :references:cc:to:subject:user-agent:mime-version:date:message-id
         :from:to:cc:subject:date:message-id:reply-to;
        bh=PWhWZkkdYztsk7q2EQZkWe4rPMrdeAsMOgYo43K2FPU=;
        b=Uihq98rpcxwwCUq4YeRJK+Un4PdttrEsClq0DH9Iv0/yRK4CZ95Gd8CRLlxwVcc8vv
         0eMFDlv4jn/JGSq9ID3S5C27ZmKtQ9fBf/4HS01GwIhQhcShLUPamW5DJtrklxkWjzbi
         0yOrRgmneCr6Dfi41m0BtJMXrBYFdjhht+BksFakUC8kA/SEgSTKuJTTdzJYGJhNOn0Q
         4eDaQ6qZLkZJox64B2UZ3EyIxyTTh01f4I1/mz//7hZT1uLhf0CCDKotArvJ+tHlkSLd
         F448Q+fY2X77cyJoctwNkY6rDulYnLFVh5UXQEnxbZhULAolo1hNdks4Mb8pJGMXoc1B
         09xg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1777881050; x=1778485850;
        h=content-transfer-encoding:in-reply-to:from:content-language
         :references:cc:to:subject:user-agent:mime-version:date:message-id
         :x-gm-gg:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=PWhWZkkdYztsk7q2EQZkWe4rPMrdeAsMOgYo43K2FPU=;
        b=FhhAhLulhnhJtqPwiBQEQ+5bxVkDJGT9mxTIMD0k9Jxr+ORdWNhHAhAwd57wcRsYcc
         rItW3pN2Ew8KHpRrNrSVVj6zaYJi4bjvnm2lrizi9yRKftk7A5W2aErXBD3VTtFa6Zrk
         kjrFH9HZy25QfVgAkAbj6DVN8ZqbGB08B9MeWhWxpQb5RlFMND5eWWGbAeVDT2tR8qiX
         Ajionelq+BuurmrUODwVppkVVYok0Su0edWh3HZ0FxWTBGbWakQi3ER1aahavh2EIlLS
         4C8Lp03R022vDBiH40utlehfxWDExrywveE6OXvfHWZC3PTXOw8zluJzrAsw9ApQxFst
         NQSg==
X-Forwarded-Encrypted: i=1; AFNElJ/pQ4WkYHpQfAnBBwbjyQAg9gzhauJGBRiOAYdUL14rcX6SxpeVDYnFp/MZ5Lkt2+H6Nq5yVCfQIbfJ@vger.kernel.org
X-Gm-Message-State: AOJu0YzgvsmnTHe9RJCpLRLjG2FF262djPN50hZZnBA5US5o5HAaDdrA
	Pgwl5NymY7tcBXwWRIsKDN9qNw8hNBy0nyGhRRytfdU1iNh81cafkRU091V14cyrx9824H7ME1s
	1WA9XI2jsXsjfiskMwu1EVrAC+9OFO5s3teirBHExY/OoZHEIyGPN2ytMXLlv7+DH
X-Gm-Gg: AeBDieuUpka7utIddcZfGTUoDzPqvBVQWjIn3KY+TPZF1NWQBhV11r6sbacXHCOaPwr
	jnbwo5rdw7d2SEgmgF5ta+QjeCdQ0rnht39rmUHo8n7GPb1rPF3UQZKeRMlBoY1ZGQnqva/rKQF
	VSt4pLNO6ugvwtxII6zLiHeA1ksX1vTGGSDhfQ3Q1i/fYiV1AdIEq5DGEDFs3o929OmIz7vRL4s
	9B+fA8XclMa47KgkbLSfrbsDIOatJ3t4oJZC87GFdoag/4nyxkhqWS1zWm5+uR07F1O9/n8UJoX
	329Pn4lyKWG2vSnZB2qmh1YDLfx0gB9A1iM48+8fRB0lOjCecxv3Q3RJf7u6fF2O11JosJmw/ir
	orUbhQEmpxg+CMjualxmQQ6bn9EQUWdClAT8juaojQVTVM/jxAhNEgwF240k=
X-Received: by 2002:a17:903:3bac:b0:2b4:6562:642b with SMTP id d9443c01a7336-2b9f280a3bemr88539075ad.35.1777881050487;
        Mon, 04 May 2026 00:50:50 -0700 (PDT)
X-Received: by 2002:a17:903:3bac:b0:2b4:6562:642b with SMTP id d9443c01a7336-2b9f280a3bemr88538885ad.35.1777881049984;
        Mon, 04 May 2026 00:50:49 -0700 (PDT)
Received: from [192.168.1.143] ([59.96.95.34])
        by smtp.gmail.com with ESMTPSA id d9443c01a7336-2b9caa7ebe8sm110471485ad.2.2026.05.04.00.50.44
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Mon, 04 May 2026 00:50:49 -0700 (PDT)
Message-ID: <5973b8ad-819c-4d14-9e7d-415e2605fcc7@oss.qualcomm.com>
Date: Mon, 4 May 2026 13:20:42 +0530
Precedence: bulk
X-Mailing-List: devicetree@vger.kernel.org
List-Id: <devicetree.vger.kernel.org>
List-Subscribe: <mailto:devicetree+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:devicetree+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH 2/2] pinctrl: qcom: Add Shikra pinctrl driver
To: "Maulik Shah (mkshah)" <maulik.shah@oss.qualcomm.com>,
        Bjorn Andersson <andersson@kernel.org>,
        Linus Walleij <linusw@kernel.org>, Rob Herring <robh@kernel.org>,
        Krzysztof Kozlowski <krzk+dt@kernel.org>,
        Conor Dooley <conor+dt@kernel.org>,
        Richard Cochran <richardcochran@gmail.com>
Cc: linux-arm-msm@vger.kernel.org, linux-gpio@vger.kernel.org,
        devicetree@vger.kernel.org, linux-kernel@vger.kernel.org,
        netdev@vger.kernel.org
References: <20260429-shikra-pinctrl-v1-0-1b4bb2b3a8d6@oss.qualcomm.com>
 <20260429-shikra-pinctrl-v1-2-1b4bb2b3a8d6@oss.qualcomm.com>
 <38bb1b79-67da-4a23-a0e8-3c3da77933d7@oss.qualcomm.com>
Content-Language: en-US
From: Komal Bajaj <komal.bajaj@oss.qualcomm.com>
In-Reply-To: <38bb1b79-67da-4a23-a0e8-3c3da77933d7@oss.qualcomm.com>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit
X-Proofpoint-ORIG-GUID: dz7VcWhr_Lk6ue2d-O3Xcr_PPaX_uAvY
X-Proofpoint-GUID: dz7VcWhr_Lk6ue2d-O3Xcr_PPaX_uAvY
X-Authority-Analysis: v=2.4 cv=e7U2j6p/ c=1 sm=1 tr=0 ts=69f84fdb cx=c_pps
 a=cmESyDAEBpBGqyK7t0alAg==:117 a=d18XUvOkrfNYrh/LwM53Ig==:17
 a=IkcTkHD0fZMA:10 a=NGcC8JguVDcA:10 a=s4-Qcg_JpJYA:10
 a=VkNPw1HP01LnGYTKEx00:22 a=u7WPNUs3qKkmUXheDGA7:22 a=_K5XuSEh1TEqbUxoQ0s3:22
 a=VwQbUJbxAAAA:8 a=EUspDBNiAAAA:8 a=ZuckWHwAq6i6U7-C_84A:9 a=QEXdDO2ut3YA:10
 a=1OuFwYUASf3TG4hYMiVC:22
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYwNTA0MDA4NCBTYWx0ZWRfX0ukLXRKqEbu4
 V1A9Vdf4Yc9MJbFlRDvtNhcYgTDeI1CNkEGOTlihH9+N8jll5uNwN1YBvEQGYNK+Tb2sTjC2aQs
 Q2r9kcOSYvppalJVfOw8VYIYzzBNnAbq4xmtJDb4SBkBt1UIPn8agi+9mOAQL2qo3P35xheJst4
 Tlc9Tnp32VMnee0EpH96jO7TNOHICFSxsfEWKAwaU985qHO5/MrkDlb9I/lgZVzR18AmRaFjYMq
 u1uLFj/+7Ip8nO41oDUNDlkhyejSc23atbHCQSWs4M4zpA7OflaSUhjtZzpHEyTukdcYYQJsLS0
 jwNugrmZ/sOfOnryUeSP+oAoUuhs30FUaXEBsGguCdjoce489WC2WM3Q0zf8RNFad/oa4e5MX/H
 RJKmLmy2CHBExtkZdz3oKM6u2O+0egyA1UiCQhITz5YA/DUhYB0fk23iGJEph9F3+LGiDcmJzMH
 tO5NzlIjZpvQD82spJw==
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1143,Hydra:6.1.51,FMLib:17.12.100.49
 definitions=2026-05-04_03,2026-04-30_02,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 spamscore=0 suspectscore=0 adultscore=0 lowpriorityscore=0 priorityscore=1501
 bulkscore=0 clxscore=1015 impostorscore=0 malwarescore=0 phishscore=0
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.22.0-2604200000 definitions=main-2605040084

On 4/30/2026 9:36 AM, Maulik Shah (mkshah) wrote:
>
> On 4/29/2026 6:41 PM, Komal Bajaj wrote:
>> Add pinctrl driver for TLMM block found in Shikra SoC.
>
> [...]
>
>> +#define UFS_RESET(pg_name, ctl, io)			\
>> +	{						\
>> +		.grp = PINCTRL_PINGROUP(#pg_name,	\
>> +			pg_name##_pins,			\
>> +			ARRAY_SIZE(pg_name##_pins)),	\
>> +		.ctl_reg = ctl,				\
>> +		.io_reg = io,				\
>> +		.intr_cfg_reg = 0,			\
>> +		.intr_status_reg = 0,			\
>> +		.mux_bit = -1,				\
>> +		.pull_bit = 3,				\
>> +		.drv_bit = 0,				\
>> +		.oe_bit = -1,				\
>> +		.in_bit = -1,				\
>> +		.out_bit = 0,				\
>> +		.intr_enable_bit = -1,			\
>> +		.intr_status_bit = -1,			\
>> +		.intr_target_bit = -1,			\
>> +		.intr_raw_status_bit = -1,		\
>> +		.intr_polarity_bit = -1,		\
>> +		.intr_detection_bit = -1,		\
>> +		.intr_detection_width = -1,		\
>> +	}
> UFS_RESET macro is not used anywhere in the file, please remove it.
>
> I assume the macro keeps getting added since the file pinctrl-<target> is
> fully/partially auto generated. Would be good to fix auto generation to
> avoid getting this added as default in future.
>
> The unused ones were removed via [1].
>
> [1] https://lore.kernel.org/all/4429f44e-f7e5-449c-824c-83daa339b383@oss.qualcomm.com/
>
> [...]
>

Thanks Maulik for review, will update the driver to cleanup unused 
macros in next version.

>> +static const struct msm_gpio_wakeirq_map shikra_mpm_map[] = {
>> +	{1, 9},    {2, 31},   {5, 49},   {6, 53},   {9, 72},   {10, 10},
> It would be better to have spacing before/after brackets inline with other pinctrl drivers.
> {1, 9}, should be { 1, 9 }.

Noted.

Thanks
Komal

>
>> +	{12, 22},  {14, 26},  {17, 29},  {18, 24},  {20, 32},  {22, 33},
>> +	{25, 34},  {27, 35},  {28, 36},  {29, 37},  {30, 38},  {31, 39},
>> +	{32, 40},  {33, 41},  {38, 42},  {40, 43},  {43, 44},  {44, 45},
>> +	{45, 46},  {46, 47},  {47, 48},  {48, 60},  {50, 50},  {51, 51},
>> +	{52, 61},  {53, 62},  {57, 52},  {58, 63},  {60, 54},  {63, 64},
>> +	{73, 55},  {74, 56},  {75, 57},  {77, 3},   {80, 4},   {84, 5},
>> +	{85, 67},  {86, 69},  {88, 70},  {89, 71},  {90, 73},  {91, 74},
>> +	{92, 75},  {93, 76},  {94, 77},  {95, 78},  {97, 79},  {99, 80},
>> +	{100, 11}, {101, 13}, {102, 14}, {103, 15}, {106, 16}, {108, 17},
>> +	{112, 18}, {116, 19}, {117, 20}, {119, 21}, {120, 23}, {136, 25},
>> +	{159, 27}, {161, 28},
>> +};
>> +
> Thanks,
> Maulik
>

