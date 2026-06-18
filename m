Received: from mx0a-0031df01.pphosted.com (mx0a-0031df01.pphosted.com [205.220.168.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id D9E4A33F8BC
	for <devicetree@vger.kernel.org>; Thu, 18 Jun 2026 05:07:45 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.168.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1781759268; cv=none; b=qeiKyJcfl0OnTp23EVe+MY6hAxZFTCyCtJ9uf7PpK63o/2xcxFOcp2KU3QsT4s8PBi/RnaL/46DYwNTs8YSrbEndOBY9z5esUECpWyZGfYNWlyTvqp+bU9eElDKykGt4QuunGsyLWOHWofn9t+uMl4AyS6ZUFsx88P1UdxACFFs=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1781759268; c=relaxed/simple;
	bh=B3ziYdbDhd8pejGixMLf8xvt1EMsUg6EN4/WBF/GqmE=;
	h=Message-ID:Date:MIME-Version:Subject:To:Cc:References:From:
	 In-Reply-To:Content-Type; b=K6MewBv8r7VSuzRyRpkap5zymXx2W0Gfdy0TtC4OdIvsn0Mgm2iU2qDsyblWFOXagXQM3N2mRLhzY3w+RDuJo+xeFK2SxRKb1d1J+Mchbot6vQ8ih4+4juD34eGqvaSsl27LgT/4RTN1/nl1+1AsjFhjqtJTJsf4S2DH7qkv+s8=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=ZW/4EAL5; dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b=IG18Y1n1; arc=none smtp.client-ip=205.220.168.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b="ZW/4EAL5";
	dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b="IG18Y1n1"
Received: from pps.filterd (m0279866.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 65HIRXQc3061812
	for <devicetree@vger.kernel.org>; Thu, 18 Jun 2026 05:07:45 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	i9/tMblIXT/+IsiJVmvct5WjsscMVhiD/oY7oGSARsU=; b=ZW/4EAL5LCW6/DDf
	CQihhQ5N0xu18TgzoeCwD9+Szv+fMWrbnCq5Fg3EY+U0Rv90LxIBIjs/pYYWOlRT
	9Z0WNigW1l8FKMBZfDjwdsuMUXy+I4qkijdct/9b8G6agaGvHOCjtGeeOGLDg5iJ
	9VDCfgU/g1mUDXCqKubplMx9rZDBTnF43UUYUwMyzpQ7Xf/tSOVJmwWyWYRUepFh
	AUMfyOVSL2ohi8W9rA2jhRgFIUPTGlYJbUAFAS5AxAYUWqz4a/olTtrHz4JkUNQR
	Zn0TwyvsZOEWtgBGaAlIbwcjHxa3Rjz+NVTcrVw11ETKrDGaGMViTKEN6ApPPTV1
	nqKg+A==
Received: from mail-dy1-f198.google.com (mail-dy1-f198.google.com [74.125.82.198])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4ev0vm1w0j-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <devicetree@vger.kernel.org>; Thu, 18 Jun 2026 05:07:45 +0000 (GMT)
Received: by mail-dy1-f198.google.com with SMTP id 5a478bee46e88-304f23c55b2so526457eec.0
        for <devicetree@vger.kernel.org>; Wed, 17 Jun 2026 22:07:45 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1781759264; x=1782364064; darn=vger.kernel.org;
        h=content-transfer-encoding:in-reply-to:from:content-language
         :references:cc:to:subject:user-agent:mime-version:date:message-id
         :from:to:cc:subject:date:message-id:reply-to;
        bh=i9/tMblIXT/+IsiJVmvct5WjsscMVhiD/oY7oGSARsU=;
        b=IG18Y1n1IfhxO2ySjrKXv6xcLjg3uSmu1LP3lGpd+SIS1EJuudOtBZALb1JoM/1NtL
         RcfWoiiFimqZL4cs/HoYRWy4we/db8uVGVs8SlvLBA/wArDNXWY4ydQlWrRebEcAGkGp
         ZSC0GZo46UZNKS+OVHTMHrFdMi5ITUop8uSKoJR1JzDMvJOqp/iskofaNdu3tPprc7bX
         Ut5/0DtmxTjmRpWGWscwZ1K5it+2aSGG91av9CnLKMJ9podSIXgnXp2uWGGzX0s11ev2
         Mf7U4hjpfE5wmbbppSSTfJhk8EwRnO4pvto2fVGFhFSIhrm1KwyrS87wZ0fcnUjji1sI
         UnGg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1781759264; x=1782364064;
        h=content-transfer-encoding:in-reply-to:from:content-language
         :references:cc:to:subject:user-agent:mime-version:date:message-id
         :x-gm-gg:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=i9/tMblIXT/+IsiJVmvct5WjsscMVhiD/oY7oGSARsU=;
        b=bXem8Tz3dIVo2ve36bT8vSjHIiOvyMrmau5oX2717rb3wxdygvxJACD51FYv6pc3Zg
         j/XTV3k/mH1nsSpwhzTYCMFLum38+jREaGJ6KBpplgNHV1E2eVrrl7QhiTDqYhcCcJ7A
         4K90awQQkmYAP3NDyxvCp33dfRNgI16+aGZSuk1QBcEJ97KGKC/xQlWl/TAmp68iuqoW
         IyDM2oVaThPObDmFBevUIHaL+VvCChK5GwLC9pSSNJoWt/KntyN2mkGDLWGe1sKBTjbi
         kTkTmcjHcVNJnySwhRBwIJLgvvEC4JDWis/C432xskbI/2e0i641Tau1Lpl5H5V1l5Mj
         VOZg==
X-Forwarded-Encrypted: i=1; AFNElJ+d7oZvybZdF7RJkIGfsLlspn9mtBT74Ws91AWmrQJARQI4hd4Vqbx8iVm0XysdW049dhMVREKn40Q9@vger.kernel.org
X-Gm-Message-State: AOJu0Yy0XbLRMf90A9PxVc4RYF/kZfAAxJJqBVs9Io4NF6eUkJ0iZhAO
	OvC1yM5I76a++g5HB1OQwJS0l+G1F32p9C0mtc8hXWhceDguZWSet/CVIbeGVZtBhZEOco4MNNX
	2ZLbse+kFOYzP2uEQoJagm1ZlS2M8+pDTLnGm1uxly28+RCePlEDKfhZxd5pBpU5F
X-Gm-Gg: Acq92OFxcP9XCGFFJqI1k45JHIsK5HFgRehYP4H+TSl8E0ht34tKQ2E8UjKctmBnanq
	oj8BXzYc0Pm0xWze9c7cVG08gB0ZwFaHcJHdbcF00XLotL7NT/5UlMhDB2iuQI5ncHyxF85MQd1
	MusTXGGYOlRCt0nf51RfjZRXNGelfOstViLwIj9erdmgzYoL8goNvFjTAexwS17pEBt4fEE4iz+
	eSkPG9s2zVslA+wbJnSuRvdXu4q/ggOEA+1qD0ZH4Y93W6wNeFlrYzwvTc+H6w2q0SjS9kOQTwv
	BOeum+mDk1rBxaIiOMvA0wNzgoUGCyX6PnFwUoja95lnRHIWiGIW+xgY93VRm/Izs25ytBuE8xn
	ipNkGthIL3RUVjU8TpogJVvyTg9laqUCMLGKWPqewDpQ=
X-Received: by 2002:a05:7022:3d8c:b0:135:578a:cde2 with SMTP id a92af1059eb24-1398f6f4707mr2821600c88.34.1781759264414;
        Wed, 17 Jun 2026 22:07:44 -0700 (PDT)
X-Received: by 2002:a05:7022:3d8c:b0:135:578a:cde2 with SMTP id a92af1059eb24-1398f6f4707mr2821569c88.34.1781759263833;
        Wed, 17 Jun 2026 22:07:43 -0700 (PDT)
Received: from [192.168.0.5] ([49.204.107.202])
        by smtp.gmail.com with ESMTPSA id a92af1059eb24-1384b910c51sm17780940c88.4.2026.06.17.22.07.39
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Wed, 17 Jun 2026 22:07:43 -0700 (PDT)
Message-ID: <d2dd36cc-c5ee-49c4-ba5e-7ea0e76602a1@oss.qualcomm.com>
Date: Thu, 18 Jun 2026 10:37:37 +0530
Precedence: bulk
X-Mailing-List: devicetree@vger.kernel.org
List-Id: <devicetree.vger.kernel.org>
List-Subscribe: <mailto:devicetree+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:devicetree+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v3 4/4] spi: qcom-geni: Enable SPI on SA8255p Qualcomm
 platforms
To: Konrad Dybcio <konrad.dybcio@oss.qualcomm.com>,
        Mark Brown <broonie@kernel.org>, Rob Herring <robh@kernel.org>,
        Krzysztof Kozlowski <krzk+dt@kernel.org>,
        Conor Dooley
 <conor+dt@kernel.org>, bjorn.andersson@oss.qualcomm.com
Cc: linux-arm-msm@vger.kernel.org, linux-spi@vger.kernel.org,
        devicetree@vger.kernel.org, linux-kernel@vger.kernel.org,
        mukesh.savaliya@oss.qualcomm.com, aniket.randive@oss.qualcomm.com,
        chandana.chiluveru@oss.qualcomm.com, jyothi.seerapu@oss.qualcomm.com,
        chiluka.harish@oss.qualcomm.com
References: <20260604-enable-spi-on-sa8255p-v3-0-43984eac4c67@oss.qualcomm.com>
 <20260604-enable-spi-on-sa8255p-v3-4-43984eac4c67@oss.qualcomm.com>
 <d4d01a6d-4c9e-4822-b0f6-b98e8ecf34f5@oss.qualcomm.com>
Content-Language: en-US
From: Praveen Talari <praveen.talari@oss.qualcomm.com>
In-Reply-To: <d4d01a6d-4c9e-4822-b0f6-b98e8ecf34f5@oss.qualcomm.com>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYwNjE4MDA0MyBTYWx0ZWRfX3pJDcjsn7RNP
 6gNuAisZ1ijiGe8IOaduAcMMnDSbDOFJa/x2fVYMzLwV3xkqikv9BKeOGecplxjKDQwAGdTSLzC
 jrK0tuj0sgjfu84uFxTkT/xR+ohNeX11UJCNyU8alRM75pvpZ22ENH7cj2g5qxJyI5TpNIo6pPa
 YeXkCq4phWJ44DMEjzW4Ft1AAY9CpPzuFoiNt8+g6ne/SDa9chZD8VMNs6X39CbRpTH8xGmBOLE
 x3ePr6bG0/DUfTaLyO0R8F8qKM5RK9PNabi9uFQTWmkaPhEi+Ycvr9oCBP6jHd/SmR+oBpOzDBv
 ZJE4EZ6Lx4kKfQC6CN/rt+/GGP6NFPz6MWdXIsMFek4QIMpg/qRTNGGlTnp9k429YLqF0EycoFg
 mcm2VdQwJtkhol8FvYl/HNR/+2LzEy4Xrycau26TNkrmPkQ5+Ms8aArpzGVf4eTxo8sjwywI7/K
 gR4BARObL6quIjIQEFA==
X-Proofpoint-ORIG-GUID: VMjb8HiFIO8YG1sdoC-DCNzblv2T90x8
X-Authority-Analysis: v=2.4 cv=UrRT8ewB c=1 sm=1 tr=0 ts=6a337d21 cx=c_pps
 a=wEP8DlPgTf/vqF+yE6f9lg==:117 a=6s0eN8wnNFkjVaM4b1XlIg==:17
 a=IkcTkHD0fZMA:10 a=FelO9ux0wxsA:10 a=s4-Qcg_JpJYA:10
 a=VkNPw1HP01LnGYTKEx00:22 a=u7WPNUs3qKkmUXheDGA7:22 a=YMgV9FUhrdKAYTUUvYB2:22
 a=EUspDBNiAAAA:8 a=vRCb6_dfN601Ubi85e8A:9 a=QEXdDO2ut3YA:10
 a=bBxd6f-gb0O0v-kibOvt:22
X-Proofpoint-GUID: VMjb8HiFIO8YG1sdoC-DCNzblv2T90x8
X-Proofpoint-Spam-Info: AW1haW4tMjYwNjE4MDA0MyBTYWx0ZWRfX8KNNo+2ngwOS
 8TVvhMJ1k0iNHYgVmBQ0XnhG/xEDiZr/EPc/10Akn6cSmIXjFG89xBq6ark07NV/p73ScvRp1st
 EuqTxcbiHv7FdHmbkTwWVphwv6cZNcw=
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1143,Hydra:6.1.125,FMLib:17.12.100.49
 definitions=2026-06-17_02,2026-06-17_03,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 impostorscore=0 lowpriorityscore=0 priorityscore=1501 phishscore=0
 bulkscore=0 spamscore=0 suspectscore=0 adultscore=0 malwarescore=0
 clxscore=1015 classifier=typeunknown authscore=0 authtc= authcc=
 route=outbound adjust=0 reason=mlx scancount=1 engine=8.22.0-2606150000
 definitions=main-2606180043

Hi Konrad

On 17-06-2026 16:35, Konrad Dybcio wrote:
> On 6/4/26 8:50 AM, Praveen Talari wrote:
>> The Qualcomm automotive SA8255p SoC relies on firmware to configure
>> platform resources, including clocks, interconnects and TLMM.
>> The driver requests resources operations over SCMI using power
>> and performance protocols.
>>
>> The SCMI power protocol enables or disables resources like clocks,
>> interconnect paths, and TLMM (GPIOs) using runtime PM framework APIs,
>> such as resume/suspend, to control power states(on/off).
>>
>> The SCMI performance protocol manages SPI frequency, with each
>> frequency rate represented by a performance level. The driver uses
>> geni_se_set_perf_opp() API to request the desired frequency rate.
>>
>> As part of geni_se_set_perf_opp(), the OPP for the requested frequency
>> is obtained using dev_pm_opp_find_freq_floor() and the performance
>> level is set using dev_pm_opp_set_opp().
>>
>> Signed-off-by: Praveen Talari <praveen.talari@oss.qualcomm.com>
>> ---
> [...]
>
>> -	ret = geni_se_resources_init(&mas->se);
>> +	mas->dev_data = device_get_match_data(&pdev->dev);
> This really needs to be null-checked

Sure, will add in next patch set.


Thanks,

Praveen talari

>
> Perhaps also the functions within that are called unconditionally
>
> Konrad
