Received: from mx0b-0031df01.pphosted.com (mx0b-0031df01.pphosted.com [205.220.180.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 222633B6C02
	for <devicetree@vger.kernel.org>; Thu, 14 May 2026 09:11:13 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.180.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1778749875; cv=none; b=il3RZWHoKyWZaIu1IFwJoefHqoiKVb1gR4vbMDvjKeBy3J0wxoO6Q7c3zgF7lSA2jYsoKpjXKJlv8N6XQ3AExgfznM6KdN18KHhl3GEJcAHDs+Yb541r+0Si5QO3dsAQ4w6ydrH2umE9hZBkfPrvJUu0qoA0OT/h3FpbFWjaa60=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1778749875; c=relaxed/simple;
	bh=daa+1XvYSzE8eOwfhbectImkCDlzbI1HYNTaBEaId50=;
	h=Message-ID:Date:MIME-Version:Subject:To:Cc:References:From:
	 In-Reply-To:Content-Type; b=N4p0IO3tm7bCo7FPcUiE11we9yB2s7JyeSQ4FHXPRhT0ud9NX1JlZn0KiUh5dg8+QNOU2x/qXoA3iDk6LdYsD8l4O1Zzk/P9lp4DEGKoMDM6HaPzH49A/UCcjJElCQ1mgTMUcmZEPMEmfwizC4cYCx9c7ZpiYfXWgHRCmOqSwZw=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=cS/TiBom; dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b=DibwPNbn; arc=none smtp.client-ip=205.220.180.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b="cS/TiBom";
	dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b="DibwPNbn"
Received: from pps.filterd (m0279869.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 64E25ne12524310
	for <devicetree@vger.kernel.org>; Thu, 14 May 2026 09:11:13 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	0sOG4Pf5i797Nk7IZxKARPdtVNQssiq4kiFqW2LPT+A=; b=cS/TiBomZ8UTWeIv
	WqqhxZuIzZOCw4IjcpYdPZJnjv1rTZ9EaUkZuqOLl0o23iNNEYWw4HpI0A7NKpn5
	c2F7zHvOunZ6yST7ZgjNSOMBkwqx6Sa4KZ64g30+zbcugo3YrhuS6D3cKETBmD6t
	MV7yE+UJ+fkPMli6Woi8n93IWA14kvXSKKAIfJu3DQer3XxlCjChTsYdvmdSEhd+
	aOIuBhhhqUa2ZJeoM+eZMdDMuPdMOZdeHOLoOaEdMKcmmwquHocJ58RSDQTzO0Eg
	KOyO39X+zsAabXf2G4TbekvWGm30Z3Pqd/NdK8RYUUnmZ3W+swzgYFs9rk0zRaKZ
	9JdlTw==
Received: from mail-qt1-f200.google.com (mail-qt1-f200.google.com [209.85.160.200])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4e4vkjk76v-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <devicetree@vger.kernel.org>; Thu, 14 May 2026 09:11:12 +0000 (GMT)
Received: by mail-qt1-f200.google.com with SMTP id d75a77b69052e-50e5c781193so14574201cf.0
        for <devicetree@vger.kernel.org>; Thu, 14 May 2026 02:11:12 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1778749872; x=1779354672; darn=vger.kernel.org;
        h=content-transfer-encoding:in-reply-to:from:content-language
         :references:cc:to:subject:user-agent:mime-version:date:message-id
         :from:to:cc:subject:date:message-id:reply-to;
        bh=0sOG4Pf5i797Nk7IZxKARPdtVNQssiq4kiFqW2LPT+A=;
        b=DibwPNbnupuUJqkyGyVND5RfQ91rLmU5joU+MP2hbwcts9i15lEhvmKOJPgkWELRTU
         Hnv9+nHCFrjXsY2VHCcfrS3Q2VYPu3wYdGeo0CVYruUg9zmjWYlbk2mHOx79Dh6gYTsI
         2lh+a3RuWsxeBkC8hf04rxgQ0zN+GyuKuABfzjTd5KFziooVNFoJAWR0blZmsFDJn/bb
         5JLXBerOe32RJHFhwdP7mESsekfTIvJgK59rUht+UUtW2pFG3D/8aDpHMScI1qzVb8Ct
         vmj9KBeFsFACimem5ev4dJG8J+wbbpVV/x+9jG8ClLr3S8SXCr76io88mW90C+fjJqjL
         yKpw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1778749872; x=1779354672;
        h=content-transfer-encoding:in-reply-to:from:content-language
         :references:cc:to:subject:user-agent:mime-version:date:message-id
         :x-gm-gg:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=0sOG4Pf5i797Nk7IZxKARPdtVNQssiq4kiFqW2LPT+A=;
        b=FQMd3CWiuEY/2VpDPyb/27K1zjawUDa8z1Rf6CKW/IuvjVNz5xv7UPVTT4VsD+Um1J
         z4kQwb8yrgNcRVYdCmoqddGc7RvkL0hK9t9SlFzKA+1dlH8DuIP342nchmKNqoKYHa+C
         8/46THuYjC5UmsK+e3lHbEogCBDvSZyG6QzMT64XsJvmy/G563s+vzAnB0JOfQGqJXLD
         tYbeHOKsJf6ySA+bzLmBpN0f47eKtaAQJiCMsMUJMkZIObHIhpccN6VjLJoXKAX6ynar
         5DM8yzB1AWjXlXx7OK9QGk/GaVgGqdBA0IhI1fHeuJ9jNFFI80RuMkaH6/h6byBGvqf7
         GwjA==
X-Forwarded-Encrypted: i=1; AFNElJ8D9et/uPmKaRJlx+9n6z+TnvnbVtbSaECtx3QjSRjxAFvBmPdvdRADhRfxDgqcIqRC3RPbd5k/ZT+V@vger.kernel.org
X-Gm-Message-State: AOJu0Yymfh0u5M5xwlcpkzHb+H9bQ7um68KR77fUV3IWcWTXDo1i4iHR
	bYwNmD0YKUAlF9kCeC8RSYnE7uY2dUQJOmYlhUYn5NLH8Ye6BRNPZJWGx46iHc9O8wLyepTbSNJ
	O8/r4kdNobtq8P/K4PMUN6GgQMA3cr0sm4eW6sIL9ueGlZotlED9XhT9jYp8QfvaK
X-Gm-Gg: Acq92OH5cThJFP/8coPuut/MccvfU05NzbzotnpGGkCF7fVb1YqAGvPaUBNezv3Z09D
	TaGx2tGRFz8aNjjj9D46LFFIrbjPBp/zbmRVVRShonuAcoqZT9TLrCMZ1gQ5vJBcs46ylAphotG
	1GeiJ97sOVlFvK3y8GQxGeMRoejsFeRxddwbp1WtU63BpQS5oUzI85WiMsRqiVb4sdMrdpHuh+N
	hrbcXnIY/316q+e5VI8zahOCAf08dO58YfXREMx7wLJCTuuYvXomiQqqlBgrtW6DmMdkNVz22HX
	GSJYKV14IfXVf5joUPsZkXlOOo1KOHOgyaeld8z/RGWXyis5cMtL0xBZApwrccDjz8f+dz1onAM
	R1uXXAT9pji8V9f9naMIED4sghDyLj/Q5E6VC984mIFY0COSHxFsmYJzMynpUeg5A22ev+StFLT
	h/CsRx+zLqXsjQwA==
X-Received: by 2002:a05:622a:5818:b0:50e:5e6a:c7d5 with SMTP id d75a77b69052e-5162f447e81mr62623741cf.1.1778749872301;
        Thu, 14 May 2026 02:11:12 -0700 (PDT)
X-Received: by 2002:a05:622a:5818:b0:50e:5e6a:c7d5 with SMTP id d75a77b69052e-5162f447e81mr62623481cf.1.1778749871750;
        Thu, 14 May 2026 02:11:11 -0700 (PDT)
Received: from [192.168.119.254] (078088045245.garwolin.vectranet.pl. [78.88.45.245])
        by smtp.gmail.com with ESMTPSA id 4fb4d7f45d1cf-6831187ecf7sm494479a12.30.2026.05.14.02.11.08
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Thu, 14 May 2026 02:11:10 -0700 (PDT)
Message-ID: <048b1110-2de6-485e-995d-e328df69dcb2@oss.qualcomm.com>
Date: Thu, 14 May 2026 11:11:07 +0200
Precedence: bulk
X-Mailing-List: devicetree@vger.kernel.org
List-Id: <devicetree.vger.kernel.org>
List-Subscribe: <mailto:devicetree+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:devicetree+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH 2/2] soc: qcom: rpmpd: Add Shikra RPM Power Domains
To: Rakesh Kota <rakesh.kota@oss.qualcomm.com>
Cc: Rob Herring <robh@kernel.org>, Krzysztof Kozlowski <krzk+dt@kernel.org>,
        Conor Dooley <conor+dt@kernel.org>,
        Bjorn Andersson <andersson@kernel.org>, Ulf Hansson <ulfh@kernel.org>,
        linux-arm-msm@vger.kernel.org, devicetree@vger.kernel.org,
        linux-kernel@vger.kernel.org, linux-pm@vger.kernel.org,
        kamal.wadhwa@oss.qualcomm.com, jishnu.prakash@oss.qualcomm.com
References: <20260429-add_rpmpd_shikra-v1-0-fdba28564380@oss.qualcomm.com>
 <20260429-add_rpmpd_shikra-v1-2-fdba28564380@oss.qualcomm.com>
 <e032c072-57b3-44b4-84a7-5aff062b9c00@oss.qualcomm.com>
 <20260514084512.q5pzh226zdkuw53f@hu-kotarake-hyd.qualcomm.com>
Content-Language: en-US
From: Konrad Dybcio <konrad.dybcio@oss.qualcomm.com>
In-Reply-To: <20260514084512.q5pzh226zdkuw53f@hu-kotarake-hyd.qualcomm.com>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
X-Proofpoint-GUID: RfE5Accw1Dyh62eld1EV5Z7RpbVv68RC
X-Proofpoint-ORIG-GUID: RfE5Accw1Dyh62eld1EV5Z7RpbVv68RC
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYwNTE0MDA5MSBTYWx0ZWRfX6Ga1NbHAoi8V
 x7/QHZOzn0gGMFc22CWrLugZJwpj63tU70XqS74WERS3cTZa5+HytJUMNfYsw8zj0pr0hFM7VIw
 K88Or5VhDjPAEGrZeM6uT4XLExNwrGsekdYb23SQgIhc9HYMxpwDARBlR/enLfpCjUqqZsdgaFP
 9KIZpVSbvyHEVcSPi223HrbJ8fl7pvf4fHO1krDFGICuJ1LuGrkEJ/AoLDMpyOdceUCa3dtuA4O
 hwT7gvL5K1ja1Cng4geRRgbXzZJZxTFqJVEqnmtpFexf1zo0pG2IQ9X6HcHhorZ3nQ7/eKIEz2e
 PsH4Aulj6U3gJyiH1+skm+Bt0a5wNWN+L5jquZBIsum0RE1d9419e/hek2HuDloLdB7h1MSDFU6
 l14DRafZqyH5tk6SkvZ9Rld9z7d63BAVAh62CzO6xJoln3zRqrU8qwQB7lLA7lYTo9e7r8puQzA
 BfJB4t1BAVkbcJchaXA==
X-Authority-Analysis: v=2.4 cv=PbDPQChd c=1 sm=1 tr=0 ts=6a0591b1 cx=c_pps
 a=JbAStetqSzwMeJznSMzCyw==:117 a=FpWmc02/iXfjRdCD7H54yg==:17
 a=IkcTkHD0fZMA:10 a=NGcC8JguVDcA:10 a=s4-Qcg_JpJYA:10
 a=VkNPw1HP01LnGYTKEx00:22 a=u7WPNUs3qKkmUXheDGA7:22 a=_glEPmIy2e8OvE2BGh3C:22
 a=EUspDBNiAAAA:8 a=psDV2xRu-4Ixecqm65UA:9 a=3ZKOabzyN94A:10 a=QEXdDO2ut3YA:10
 a=uxP6HrT_eTzRwkO_Te1X:22
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1143,Hydra:6.1.51,FMLib:17.12.100.49
 definitions=2026-05-14_02,2026-05-13_01,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 impostorscore=0 adultscore=0 suspectscore=0 lowpriorityscore=0
 priorityscore=1501 bulkscore=0 phishscore=0 malwarescore=0 spamscore=0
 clxscore=1015 classifier=typeunknown authscore=0 authtc= authcc=
 route=outbound adjust=0 reason=mlx scancount=1 engine=8.22.0-2605050000
 definitions=main-2605140091

On 5/14/26 10:45 AM, Rakesh Kota wrote:
> On Tue, May 12, 2026 at 02:16:07PM +0200, Konrad Dybcio wrote:
>> On 4/29/26 4:09 PM, Rakesh Kota wrote:
>>> Add RPM Power Domains support for the Shikra platform.
>>>
>>> Signed-off-by: Rakesh Kota <rakesh.kota@oss.qualcomm.com>
>>> ---
>>>  drivers/pmdomain/qcom/rpmpd.c | 16 ++++++++++++++++
>>>  1 file changed, 16 insertions(+)
>>>
>>> diff --git a/drivers/pmdomain/qcom/rpmpd.c b/drivers/pmdomain/qcom/rpmpd.c
>>> index 15a11ff282c3f86b1e86c6604d165e297620f6cf..6f751ee5a7833912d54d2bcfd5d85837ab7a97d3 100644
>>> --- a/drivers/pmdomain/qcom/rpmpd.c
>>> +++ b/drivers/pmdomain/qcom/rpmpd.c
>>> @@ -863,6 +863,21 @@ static const struct rpmpd_desc sdm660_desc = {
>>>  	.max_state = RPM_SMD_LEVEL_TURBO,
>>>  };
>>>  
>>> +static struct rpmpd *shikra_rpmpds[] = {
>>> +	[RPMPD_VDDCX] =		&cx_rwcx0_lvl,
>>> +	[RPMPD_VDDCX_AO] =	&cx_rwcx0_lvl_ao,
>>> +	[RPMPD_VDDCX_VFL] =	&cx_rwcx0_vfl,
>>> +	[RPMPD_VDDMX] =		&mx_rwmx0_lvl,
>>> +	[RPMPD_VDDMX_AO] =	&mx_rwmx0_lvl_ao,
>>> +	[RPMPD_VDDMX_VFL] =	&mx_rwmx0_vfl,
>>> +};
>>
>> This is identical to sm6125_rpmpds. If you're sure the list is correct
>> and complete (no LPI domains etc.), you can drop this patch, and proceed
>> with just this change:
>>
> There is one difference — the max_state for Shikra is
> RPM_SMD_LEVEL_TURBO_NO_CPR, whereas sm6125 uses RPM_SMD_LEVEL_BINNING. 

You're right

Reviewed-by: Konrad Dybcio <konrad.dybcio@oss.qualcomm.com>

Konrad
