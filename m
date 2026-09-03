Received: from mx0a-0031df01.pphosted.com (mx0a-0031df01.pphosted.com [205.220.168.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id A2203213E9C
	for <devicetree@vger.kernel.org>; Thu,  3 Sep 2026 07:56:22 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.168.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1788422184; cv=none; b=dowHiGlH6fstrqhYFvPW2eayVK/M4GIr5oQPhq6kXQxYzWHl8oG6NL01gsqjD6IRupR42UkQTKpHXVGsjHrz4FcXG0gbnAcdCFBksh0+s1cxcS44oh+YVLhGeJDkovPyCINelOJ8DzcGjDVF22/7dFSUMUYORXjt7gMiEF+sNug=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1788422184; c=relaxed/simple;
	bh=4Qc5+bea2kI2xGzw0WkDPMlUpgCylUKO+0faw6tO2IE=;
	h=Message-ID:Date:MIME-Version:Subject:To:Cc:References:From:
	 In-Reply-To:Content-Type; b=k86DbzWxFuIgHKeXQzkcC+KQBwpkIoAcdVBY4JewqbnGsL0LmRf0ByBmnwmmvRew4WSvxtBdS2cfoiD8M1aN4Vz1sOFV+iZW1UIQT/qJPJRJDvF0QQFnaXIAqWWYQm9wNyy/5X+Z8J5p23Lhd6TNiLW60WMriQMLo1C+x+gxYKw=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=FyTelCTD; dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b=faevgEqK; arc=none smtp.client-ip=205.220.168.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b="FyTelCTD";
	dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b="faevgEqK"
Received: from pps.filterd (m0279863.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 6835lG7b3798811
	for <devicetree@vger.kernel.org>; Thu, 3 Sep 2026 07:56:22 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	XHPJP41TgIHU79zBOphfgD7yOzfEA7cgSBaXkcRYWcI=; b=FyTelCTD1dOsKdch
	7HScrYaM12SfvKsgHDCiNPhLyPavKw7PUGL+EJO4VfCuWWT5YC05smHrZOW1Eyr9
	dwyJUDj0bZzA5Ih99ZjUhfQlqNEe+DW+iffjmLbxlfWxQQq5G5/8hPD3kvKszLWy
	OqTfdDRmOAgBPqbJPfyBlUq58UcfKIjXn0aaQEem9xtNFs2KVPHlgWAn0iacyqSQ
	ggE1kP48m3XfHzlgJc3sMPaSkSo2h9mV51Wy5hd9y2uSGhKnGsW1mK5YgFUa8bR/
	OSCVv4LIulO5XBWZBCM/QHtUMXykrFB8jz2Xv+ee6ghPevK6sny8eSmLOan/R/kH
	9g3XKw==
Received: from mail-qk1-f199.google.com (mail-qk1-f199.google.com [209.85.222.199])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4gf1pygt56-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <devicetree@vger.kernel.org>; Thu, 03 Sep 2026 07:56:21 +0000 (GMT)
Received: by mail-qk1-f199.google.com with SMTP id af79cd13be357-92e661ce1dcso47262185a.0
        for <devicetree@vger.kernel.org>; Thu, 03 Sep 2026 00:56:21 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1788422181; x=1789026981; darn=vger.kernel.org;
        h=content-transfer-encoding:content-type:in-reply-to:from
         :content-language:references:cc:to:subject:user-agent:mime-version
         :date:message-id:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=XHPJP41TgIHU79zBOphfgD7yOzfEA7cgSBaXkcRYWcI=;
        b=faevgEqKJJQD6NR5HDYlW6z4Q1K/VRCrTgX52FsZnxeMzmewQzZvSjh0ajBkcsZwXL
         YoogVbZzaFu6tgna0AGncZF6kCKQzZAIK1HhTErJI/AyjYPwQr5YtlAv7hIiagKHyzxb
         XOjeZwfDjGE1jJo/sgRDp+5Fx8j1O0qtMnVTorwtsYZJf4krrNhgA8mLHOFVfw7mC8p4
         1L/4n4tikTroASjfgLocwcXUtGLFu37Fr7vq7G95S6UthcwuJUUS81QjNXx2GsWloXy/
         wkiKXD2iyeWzctMeL+QtiFkfTit3NGWMxXq/EZ0hYY0wMCcb9266Ccee2jwUntFillDp
         MbkQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1788422181; x=1789026981;
        h=content-transfer-encoding:content-type:in-reply-to:from
         :content-language:references:cc:to:subject:user-agent:mime-version
         :date:message-id:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=XHPJP41TgIHU79zBOphfgD7yOzfEA7cgSBaXkcRYWcI=;
        b=Fk2FxHg3RWK74hKx8C80/aednZT77SZIUTEKJAmSrfMrQrT3WlDSr4jh5zVje3Srw8
         Kav4qxFQrkqCrbL5RsGdJ7oD9BgeBc5bRhjM20X0OWF9bg+btNziNqSZkNRh9/4yO2Ck
         +u7eizmLpa2T8WfWw4/JPRjzlwyVV/VGUiO79Jasx/50AnAzBoh9LtUKxDHkGylLuFZI
         xg981IAbq4K+GeDtbaY8Z4L/1s1Oi3m8HjVSL/AMfvcbzQpG8KsmjrycyL0HD9Q16PZk
         7/+ORmp72GpoKSwVlDnyK2ngJz9wBZ4jLbdpq0FQBv6HrvQuARI41Li2PwBWVjVqk/ox
         /WjA==
X-Forwarded-Encrypted: i=1; AKwUvBzp71qcYQ0om97yVHfka2PVVyiuYtwGF6Myx0u13+KQM2yluj3nsxs99ruEFSJewqjXR5WhdGzVYSdj@vger.kernel.org
X-Gm-Message-State: AFuF++lhQrgEp0WKLpF2hTBaw50wUPCeqCC+QB+9ySatvTxxbnGvmGpE
	23bONVUW14T9rnUg4ohMi4g1l9OPtKnyopFhi8Stsf+oqWz1wwJOeg09FDJXPHYbw3OoKgUK/RD
	UeC8z/tfjuRPyXVoKUE8yV/NETUbm26w9hmUpFkgOhSh3zC+ITDKqfyfmD721iNUPZf2Amdxd
X-Gm-Gg: AYBFou3zedPKIM0q3uU7a34RsVZA9AN5VsS3af2CfzDCZ5inFuKMoIv3F9hw5ZEGZLF
	wKy2nXtOkuzEWZ5XDp78H96/c6ljM/0MRspIFXW8DD5kStofp3bNR7UiWCs6O8DCfetzb4V91J0
	MKrRufAa9O1WirIG5HgH8SDhFjCnYnkdm5KpYnF0NUOMTzhiTD5z//xOpKZc7BRW68/zdPPbCqR
	loJYRpKdJhFDxRn5C0gF1r2kV2vGecHwUVQljIuZ5QsppDuCvftHDZgZNkPSarv6/O2dNNw7yLh
	kSiiI8z+CnMgRmJq0OOTmD8CnpiZd3UEDGrhUrng5ubIUbXVptd3Kr1B/vwFWRsSg84RUhRsLXo
	WhEptbC7iM+Y/KKBsGbyKPQ==
X-Received: by 2002:a05:620a:2622:b0:936:6e2f:a34d with SMTP id af79cd13be357-93960faf11fmr771673985a.3.1788422180781;
        Thu, 03 Sep 2026 00:56:20 -0700 (PDT)
X-Received: by 2002:a05:620a:2622:b0:936:6e2f:a34d with SMTP id af79cd13be357-93960faf11fmr771670985a.3.1788422180245;
        Thu, 03 Sep 2026 00:56:20 -0700 (PDT)
Received: from [192.168.202.12] ([178.235.128.140])
        by smtp.gmail.com with ESMTPSA id a640c23a62f3a-c25f3eed0bfsm60697366b.7.2026.09.03.00.56.16
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Thu, 03 Sep 2026 00:56:19 -0700 (PDT)
Message-ID: <287f35a3-9979-48ba-9c49-e8afa5ad3946@oss.qualcomm.com>
Date: Thu, 3 Sep 2026 09:56:16 +0200
Precedence: bulk
X-Mailing-List: devicetree@vger.kernel.org
List-Id: <devicetree.vger.kernel.org>
List-Subscribe: <mailto:devicetree+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:devicetree+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH 6/6] arm64: dts: qcom: Add initial support for Nord Ride
 Embedded board
To: Shawn Guo <shengchao.guo@oss.qualcomm.com>
Cc: Bjorn Andersson <andersson@kernel.org>,
        Konrad Dybcio <konradybcio@kernel.org>, Rob Herring <robh@kernel.org>,
        Krzysztof Kozlowski <krzk+dt@kernel.org>,
        Conor Dooley
 <conor+dt@kernel.org>,
        Bartosz Golaszewski <brgl@kernel.org>,
        Dhruvin Rajpura <drajpura@qti.qualcomm.com>,
        Anandu Krishnan E <anandu.e@oss.qualcomm.com>,
        linux-arm-msm@vger.kernel.org, devicetree@vger.kernel.org,
        linux-kernel@vger.kernel.org,
        Bartosz Golaszewski <bartosz.golaszewski@oss.qualcomm.com>
References: <20260831032103.341633-1-shengchao.guo@oss.qualcomm.com>
 <20260831032103.341633-7-shengchao.guo@oss.qualcomm.com>
 <a8396c00-0704-4e7f-a4ae-44acebf0a470@oss.qualcomm.com>
 <apkkdXShqnYiGx8q@QCOM-aGQu4IUr3Y>
Content-Language: en-US
From: Konrad Dybcio <konrad.dybcio@oss.qualcomm.com>
In-Reply-To: <apkkdXShqnYiGx8q@QCOM-aGQu4IUr3Y>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYwOTAzMDA2OSBTYWx0ZWRfXxPkVz+wnliuz
 7biga6GQUwNWtoagiXpD9VmoPt0gDst7h/00t1a3ixHi/URZZ6U/auFyfhgzo0wGcBf9Ejygw6d
 lQJvERBdFCJZEnFK/+olfHn94K+aooAC/ja9VBOL42GO1dJ8RBoKcMXJnvmF2DcNHgHu2Ej+SUG
 soQVdFki+0oj3Rr/MIoyyyoXnwnByUV1vaW7ezOF+fvuX9uH/rvIh0xb/SxO9G9gz++auUrE++v
 u3AQuIfhQEazLh5rP/L9HE4mdY4R6DZGHDdwlWUFTXavI8JjTzET6GfMcZiguMH28DhHtGFqGGO
 iymjtyGVtzP9CUKZKfYzPOkqkMzquoM1m0g2vQXMyHW9gdc/7DomfwBtxbKbJJMPuXFUkZ7/LP9
 AYQRtpn+G++nZ2ULiUNlTOFCU/6m3VH06a2GttP42Gfpsq6dGPIn5jzQXk3VuwBg5eoJZNtcPWC
 e5t7vKX5KIis8kSOYqQ==
X-Proofpoint-ORIG-GUID: cgZNaH5qjTKQ3IXOSfCL-XfI5ypgzdlB
X-Proofpoint-Spam-Info: AW1haW4tMjYwOTAzMDA2OSBTYWx0ZWRfXx1wLRKMBII6o
 MrmLE9FuSCbWRIlmsFTMhk5o0dKknpJa8Lfcuwj7Bbksd8HCleQJscOzdWCWmdrf2kFGCrzB19t
 3VAcuNxLtnoD4slxekFMT/Rub8BSENg=
X-Proofpoint-GUID: cgZNaH5qjTKQ3IXOSfCL-XfI5ypgzdlB
X-Authority-Analysis: v=2.4 cv=DMO/JSNb c=1 sm=1 tr=0 ts=6a992825 cx=c_pps
 a=HLyN3IcIa5EE8TELMZ618Q==:117 a=PRfkaYvzSr8QmIIGAkY2Sg==:17
 a=IkcTkHD0fZMA:10 a=VdqzKS8jKosA:10 a=s4-Qcg_JpJYA:10
 a=VkNPw1HP01LnGYTKEx00:22 a=u7WPNUs3qKkmUXheDGA7:22 a=yOCtJkima9RkubShWh1s:22
 a=EUspDBNiAAAA:8 a=PnXPAKEUq80feH0KgGIA:9 a=QEXdDO2ut3YA:10
 a=bTQJ7kPSJx9SKPbeHEYW:22
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1176,Hydra:6.1.134,FMLib:17.12.100.49
 definitions=2026-09-03_02,2026-09-02_04,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 malwarescore=0 spamscore=0 bulkscore=0 priorityscore=1501 clxscore=1015
 lowpriorityscore=0 suspectscore=0 adultscore=0 impostorscore=0 phishscore=0
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.22.0-2606150000 definitions=main-2609030069

On 9/3/26 9:40 AM, Shawn Guo wrote:
> On Wed, Sep 02, 2026 at 04:00:52PM +0200, Konrad Dybcio wrote:
>> On 8/31/26 5:21 AM, Shawn Guo wrote:
>>> From: Bartosz Golaszewski <bartosz.golaszewski@oss.qualcomm.com>
>>>
>>> Add the initial device tree for the Nord Ride Embedded board, the
>>> non-SCMI variant of the SA8797P automotive Ride board.

[...]

> Since we agreed that a bit comment is useful [1], I guess you are saying
> the "satellite (CD90-73961-1)" part shouldn't be there. I will get the
> comment aligned with nord-rrd.dts.

Ah I forgot I said that :)

[...]

>>> +		vreg_s7i_mm: smps7 {
>>> +			regulator-name = "vreg_s7i_mm";
>>> +			regulator-min-microvolt = <300000>;
>>> +			regulator-max-microvolt = <1200000>;
>>> +			regulator-initial-mode = <RPMH_REGULATOR_MODE_HPM>;
>>> +			regulator-allow-set-load;
>>> +			regulator-allowed-modes = <RPMH_REGULATOR_MODE_LPM
>>> +						   RPMH_REGULATOR_MODE_HPM>;
>>
>> Are these actually exposed as regulators and not RPMHPDs?
> 
> Great catch, Konrad! These are rpmhpd-managed resources and shouldn't be
> here. I will drop them.

Don't you get a huge log of errors with these in place?

Konrad
