Received: from mx0a-0031df01.pphosted.com (mx0a-0031df01.pphosted.com [205.220.168.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 95A8035B631
	for <devicetree@vger.kernel.org>; Wed, 25 Mar 2026 11:14:35 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.168.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1774437276; cv=none; b=ESlP2/TkRIgkaMr8KmeOGCNAQfhS1d/nQ9KW9BuS6NxmAlnzSaH89PHRJ1lUJXqK2L2s7TRBV0op05azidunO932MKKan9cvC4H7zdUoIWVgP16ePq55vrIqZhBwI0+B3RNI4vlxAWRwNrlBB3qNMaFoM63WAL1iTpKB0+HXcM8=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1774437276; c=relaxed/simple;
	bh=5fpy1Ey5w0++MQPErjSRCsxLxGmJjUi5xFpOnU0kLDQ=;
	h=Message-ID:Date:MIME-Version:Subject:To:Cc:References:From:
	 In-Reply-To:Content-Type; b=Gzb50U/MMrJCgO2Y6yK4St5cMIZXdZGBQtt/5a8oat+ih5HYCNCLLJFu3FkzAL9puE7B+qkbpG5rm/Jxv2ZjkJJssiDi3b0Y32HloN+k/lZro0/Ffn58q4jvBTOqn/vhqVBbSz6Nd+ERTIyxD0IUQhy2lGM+gqP+Tp9JxeXHqLs=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=i6OftzwA; dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b=g1wH80k6; arc=none smtp.client-ip=205.220.168.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b="i6OftzwA";
	dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b="g1wH80k6"
Received: from pps.filterd (m0279863.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 62P9GpsU3057310
	for <devicetree@vger.kernel.org>; Wed, 25 Mar 2026 11:14:35 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	aXwFeeKmEQ97rmFXl0R9IJuuJY2hAq2hKznQ/v1nx0M=; b=i6OftzwA2z6mJYoy
	glsDmkHtEFa5qM23Rt5FwswAxw6Srd4Vkp3SlzIG+tJzwXIDlD/3peDH66L0lqSj
	1yRjPmuJMrcXcz9pMYuLRU2GlWGoR1ufvMpbqJPxGETRkM6M11lsXZzYfUOaEots
	NvjrGUu5EdTWxRx1rl0OXVb4NCSHMX+tUv/6WxfxqmPTbGY1qNV7N1xuJxhaA5oo
	dIdE5JCj3RC86ikehHZLBULQzOOnpi8ous2TDc9Yugg46jUX34sfcAFcpZXfGAEB
	x56erHdJMmm2VzP/MEMF6AGydbyuN4nRc8TecHsH74awycgmtCrpIRatJLKk9ZW1
	KsoJlg==
Received: from mail-qt1-f200.google.com (mail-qt1-f200.google.com [209.85.160.200])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4d46tp1s9d-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <devicetree@vger.kernel.org>; Wed, 25 Mar 2026 11:14:34 +0000 (GMT)
Received: by mail-qt1-f200.google.com with SMTP id d75a77b69052e-5073ed1ec6fso56386871cf.1
        for <devicetree@vger.kernel.org>; Wed, 25 Mar 2026 04:14:34 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1774437274; x=1775042074; darn=vger.kernel.org;
        h=content-transfer-encoding:in-reply-to:from:content-language
         :references:cc:to:subject:user-agent:mime-version:date:message-id
         :from:to:cc:subject:date:message-id:reply-to;
        bh=aXwFeeKmEQ97rmFXl0R9IJuuJY2hAq2hKznQ/v1nx0M=;
        b=g1wH80k6ReRw0Hyspvh8WC4iCDa27AognIszYN5c/E2LnPXmEvRDWfGkn5/EQG7YKx
         clBXJP+g8WGR5KgfOLseiT1Pgmi3cYnkTQ4SuqGJGTGOb9/yD1mTNjK1E7pmZ3183uiG
         9t9OH6pYDDA+r7Iafi25LuW5StZ3j0CHCK7gbt1uTwZtKtGjirtSLfGsAyAxzmfuVtzW
         M9yKjkYfLcZKmfZzJfsxK7jsSFsUbEPYuSP1tlkpA01/cjsByprm514yPUD9w0LHawAY
         N4oZ6s/mlw7P0yQOH98Z9WFvJjG84RZTzkDad7i9klPRT0hpi9rQdxq1ddLnEoWik1hN
         yMMw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1774437274; x=1775042074;
        h=content-transfer-encoding:in-reply-to:from:content-language
         :references:cc:to:subject:user-agent:mime-version:date:message-id
         :x-gm-gg:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=aXwFeeKmEQ97rmFXl0R9IJuuJY2hAq2hKznQ/v1nx0M=;
        b=BrTFEJnlXuaTR73YBd89obe1k9NCR7kwmj/4/b0tEaaB4dTliaz80S9e4mBGdBv5TD
         K6w1+oNV5H0R8gZ8hsg0dhljr5HEj+BegtXnL4kxgUZ7uzIlF4b4SIQ7bb3MW5oY39cR
         doctb92Ue0OSKLjM2KFZbwP38dYwQfqwdSb/2HdybQACpFEVmX/ksv4IAtfG2+uocbJV
         HrAy4aUrzexd4rx3nBSX9XdzoSgVFmBv+Zp7gwdhZ67i/esWFerO6N8AZeebhO1PP5jk
         njG3J6P1mnh8ATOGNfTVQJA2O0+nwjJ5Mdui/ldDWqsRJYueP2U0N060mGbHh8V2Z9oU
         pk9A==
X-Forwarded-Encrypted: i=1; AJvYcCUAVc+CabJhi5gTdpm6yqUiYraWAlcfO9riyLfXnKHidGPRVTh2ateIcWQJQR+jN6H2cdB/hZ3S5bMr@vger.kernel.org
X-Gm-Message-State: AOJu0Yz7/vJH0xIyQn/U2spW2VPNUcNBSDpNw6/XxM1hmcKGs+DeEDV5
	OpRln0d4L9ndoJlYLGLi+FJh9BuwZwY4WEEK4LHeJzmFnqf3qytYnWlrPKO/z3r/LRiJEHtGb/C
	iZo8nqB+mPvCwb8a84ePq8XPQCDvcrs3KgX2CZ4VakaMB+NEb9b1tTFgIU2qGb+Rk
X-Gm-Gg: ATEYQzwCk2qrLV2Qxahewppn6KG7CjCjlVWZ3NH4dlILtYG2PFCjGacCVlrm3RaUSZd
	dHLUWagpB0ZHa00Ikp6IRrIIJ2Lqtht5bdnNihIReNgdtL86rUWsCrjl/iX0TkMiNK/KthpY+Ii
	EyydN4Cn9+BIFANwXOcJCpXo6+LM7/MMnHPcrK1JlhWn0K2FBQFkZNDF/X8sCwAxwy2lvXqm/Ab
	xExiDWOYFDGhgDpULF7sBOmjuv6QJUFV1RNpxEDDgx4n4VNM2epdnWQHt48POCKC+O62k246yzd
	Cw4anu9YrnSq0+LpIqfB3ZZkik70mJ63UPbkMjYU2shPgBKOv6qJE8ReddnhA0XIlPhsYOMck5a
	xj0CYnmIwd8VcBtOIqX0/2IF8s71sB5gloE+nO8kaxHHJE7eoI2Fv9zTeDpiEZGHiF2OtTBeB0Y
	UXvOY=
X-Received: by 2002:a05:622a:1e99:b0:50b:6890:fca0 with SMTP id d75a77b69052e-50b80f90acemr32048861cf.9.1774437274032;
        Wed, 25 Mar 2026 04:14:34 -0700 (PDT)
X-Received: by 2002:a05:622a:1e99:b0:50b:6890:fca0 with SMTP id d75a77b69052e-50b80f90acemr32048521cf.9.1774437273543;
        Wed, 25 Mar 2026 04:14:33 -0700 (PDT)
Received: from [192.168.119.254] (078088045245.garwolin.vectranet.pl. [78.88.45.245])
        by smtp.gmail.com with ESMTPSA id a640c23a62f3a-b9832fd7147sm779648766b.27.2026.03.25.04.14.31
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Wed, 25 Mar 2026 04:14:32 -0700 (PDT)
Message-ID: <06ae4215-ba07-4a13-90fe-8696a1683aaf@oss.qualcomm.com>
Date: Wed, 25 Mar 2026 12:14:30 +0100
Precedence: bulk
X-Mailing-List: devicetree@vger.kernel.org
List-Id: <devicetree.vger.kernel.org>
List-Subscribe: <mailto:devicetree+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:devicetree+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v2] arm64: dts: qcom: hamoa/purwa: Flatten usb controller
 nodes
To: Bjorn Andersson <andersson@kernel.org>,
        Konrad Dybcio <konradybcio@kernel.org>, Rob Herring <robh@kernel.org>,
        Krzysztof Kozlowski <krzk+dt@kernel.org>,
        Conor Dooley
 <conor+dt@kernel.org>,
        Krishna Kurapati <krishna.kurapati@oss.qualcomm.com>
Cc: linux-arm-msm@vger.kernel.org, devicetree@vger.kernel.org,
        linux-kernel@vger.kernel.org
References: <20260323103119.1801139-1-krishna.kurapati@oss.qualcomm.com>
 <177432155630.28714.18053233967413890890.b4-ty@kernel.org>
Content-Language: en-US
From: Konrad Dybcio <konrad.dybcio@oss.qualcomm.com>
In-Reply-To: <177432155630.28714.18053233967413890890.b4-ty@kernel.org>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit
X-Proofpoint-ORIG-GUID: d5rDdl1BsitqB1LioSxt55bQyj6nzOJO
X-Authority-Analysis: v=2.4 cv=F4lat6hN c=1 sm=1 tr=0 ts=69c3c39b cx=c_pps
 a=JbAStetqSzwMeJznSMzCyw==:117 a=FpWmc02/iXfjRdCD7H54yg==:17
 a=IkcTkHD0fZMA:10 a=Yq5XynenixoA:10 a=s4-Qcg_JpJYA:10
 a=VkNPw1HP01LnGYTKEx00:22 a=u7WPNUs3qKkmUXheDGA7:22 a=yOCtJkima9RkubShWh1s:22
 a=VwQbUJbxAAAA:8 a=EUspDBNiAAAA:8 a=1ePFyvKYNLqa6FVGIdIA:9 a=QEXdDO2ut3YA:10
 a=uxP6HrT_eTzRwkO_Te1X:22
X-Proofpoint-GUID: d5rDdl1BsitqB1LioSxt55bQyj6nzOJO
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYwMzI1MDA3OSBTYWx0ZWRfX2oePyYpAWT1Y
 tkrLMoZ7e9tqpUw32SL8/GxXioMd7taUubc1RleXv0drgszAek4fZc1gB618CeFSnBIErD3+F4L
 Mu7YaECw2pQ25CuduveABoSbQNomf/ansPZtLuaY1fVP28V8P095flEy0e8zum2NPe0Vnngogpj
 Kf5rX/BGPgcKdSZqbZIiPTl4lGQhef9wzot5eeJ/+8VColvDM9Je8Itbv13NU8HEwTJCtr3Bsdp
 tWBi4qm4diFEIZxgb4HZjPFMmeSlagGjNFmYgpVCsdzPVGD9fxaZnsFIdqShsdVoJR3c82cUUWI
 KaFgphgrJfpdBGTNzUYLQp+ndvL11257LqpvyMqHGssoFtz0k6ySyLr+zFNoyODKFcYFTIGnke3
 Wqwlej9N63g1AslM8ysDnnJNeAmHYjpu0PaxhPeITZXQOPM18a/yEyMNbjuzxG+bgBi9rAGx+MG
 DW0iiBRWSaZvzzINiDQ==
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1143,Hydra:6.1.51,FMLib:17.12.100.49
 definitions=2026-03-25_03,2026-03-24_01,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 phishscore=0 lowpriorityscore=0 priorityscore=1501 bulkscore=0 adultscore=0
 malwarescore=0 clxscore=1015 suspectscore=0 impostorscore=0 spamscore=0
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.22.0-2603050001 definitions=main-2603250079

On 3/24/26 4:05 AM, Bjorn Andersson wrote:
> 
> On Mon, 23 Mar 2026 16:01:19 +0530, Krishna Kurapati wrote:
>> Flatten usb controller nodes and update to using latest bindings and
>> flattened driver approach.
>>
>> Tested this patch on CRD platform. For testing purpose, modified dr_mode
>> property and added usb-role-switch property to the 3 super speed capable
>> DRD controllers and valdiated both host and device mode. Also validated
>> host mode on the multiport controller.
>>
>> [...]
> 
> Applied, thanks!
> 
> [1/1] arm64: dts: qcom: hamoa/purwa: Flatten usb controller nodes
>       commit: ab826cc75a90c5524522f5c015b9a18ae8df86a6

This wasn't mentioned as a dependency of this patch, but you really need
the GCC change to pair..

https://lore.kernel.org/all/36bbe3c6-e83d-48be-8a9c-9cbc5b26e064@oss.qualcomm.com/

Konrad
