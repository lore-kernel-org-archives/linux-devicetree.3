Received: from mx0b-0031df01.pphosted.com (mx0b-0031df01.pphosted.com [205.220.180.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 5B98B4A2E38
	for <devicetree@vger.kernel.org>; Wed,  2 Sep 2026 14:17:32 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.180.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1788358654; cv=none; b=oc/iB0ZOk5vZ2jUNbBYpLHZj9828omY2n0DSrGYXe84AjHFDtLGHwhITgBHMhln/iRlo6Ao8b2XsVOQyx9ovAb1+kk9u/z5QH7add/1IQmyLuOcYGWpvIQG23w/9IasQeqkTX6/WapMX14eZphI189t2FB27PYMGjIKkNQfWHZg=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1788358654; c=relaxed/simple;
	bh=qDIjvUZeaNOGJVEGhqF7TeH9Vwxeiz6PGUKzfZHX6f0=;
	h=Message-ID:Date:MIME-Version:Subject:To:Cc:References:From:
	 In-Reply-To:Content-Type; b=TqkXQzFagHgujY8vI5/eZCusNzScR4WEEU/+WxxF86jsYfDOiadX1mhLRXRKCk7+hbeZvCF3EDLBzeEmjmOKvCcVI0neHiDyCKYbfjobbyDcCfTEPM02dmZuIMhNeTiHo9NzCJ65s7e+Jcr3+JRzNtFAM50VILHwZp3I9dONwC4=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=F7a7x7+F; dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b=gSHZ5lhd; arc=none smtp.client-ip=205.220.180.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b="F7a7x7+F";
	dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b="gSHZ5lhd"
Received: from pps.filterd (m0279869.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 682DI8FH1874386
	for <devicetree@vger.kernel.org>; Wed, 2 Sep 2026 14:17:31 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	01Ck/LyZkwYxRZnn7Z2eneUK3lmWtf/e8bUAkxAFaJ8=; b=F7a7x7+FEX/jsHVX
	k0arpOgMKYoaXaFfDZdsp6WwDseDhi9A+UUcnhJ23l8/vsTKH96ZjF6p4EraVXoB
	mSW9GhIcN64BUNy6tkk2CDAeuxoYXLGilYmV2oSoiIsWu35akI4B6qtJqZFh/EPR
	13Tl5VOGKGyFaQ58jAL6rzj5l8Df5LpS7ovPzBdcRm5IzYc8eYEyVaY1DjhC19xv
	pwirey6vzjqY15YfR5kcSngn+5QZ/tXvoLhLtpSYFVREDE1dsgEWYI6qOxhhKPKi
	4MdZ1tp1Jwc5ygVEAp9CshiwEWkzyeHjK7wh9V2WvuA9i14uZetg8VB3rWAHGvqf
	6M2QCw==
Received: from mail-vs1-f69.google.com (mail-vs1-f69.google.com [209.85.217.69])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4gemjh87k4-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <devicetree@vger.kernel.org>; Wed, 02 Sep 2026 14:17:30 +0000 (GMT)
Received: by mail-vs1-f69.google.com with SMTP id ada2fe7eead31-738be9df36fso27800137.1
        for <devicetree@vger.kernel.org>; Wed, 02 Sep 2026 07:17:30 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1788358650; x=1788963450; darn=vger.kernel.org;
        h=content-transfer-encoding:content-type:in-reply-to:from
         :content-language:references:cc:to:subject:user-agent:mime-version
         :date:message-id:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=01Ck/LyZkwYxRZnn7Z2eneUK3lmWtf/e8bUAkxAFaJ8=;
        b=gSHZ5lhd59lSe3gKgtJvvzSBTnV3ohZaG/sgjekEilNjLDAql2BxljQBpKHcTlemJA
         C++jMCc88t9BCpKTPWdUD98rT3RdUCC/KN0ZYC2gcNn8Gi6E2H/MYJfuttGwcKiNnuzM
         Uc6fBLKnCZuWoV/+dnQIA8IsJA0guKTatcqyVfwvQyjmzsGc7Yb4bAkgtArJiDUj9emP
         D/mF0+LJKMGb3/7DO7f0PSQORG6fNtzwvWiDV0zBWJmA8Z8yEQl6w8R41Sex9TAfax1l
         zo+Avym7zYUA6i8SCwbp0aOV1Ophalrhn+EDi9OQupmjOZ3eysNYiT7qRbXw7C065zxt
         USFg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1788358650; x=1788963450;
        h=content-transfer-encoding:content-type:in-reply-to:from
         :content-language:references:cc:to:subject:user-agent:mime-version
         :date:message-id:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=01Ck/LyZkwYxRZnn7Z2eneUK3lmWtf/e8bUAkxAFaJ8=;
        b=qpB8xr6RuvlJtFGItF7qD9sa2Gb/F480bcjjEuPcrqXac6wG2j+7keuwm/JyvqPH5A
         Cn47TspnUNeOEX9K0QPs5TSH+PGRt6STLGUoHhTbhDtYUpOwPaQau3LKtBFoTM0ljn/l
         QpIkx7CLX8P8rO/iy1dcFMbrb3RqzRPSE2etusnRw+opaiJN5JpInQu5YyORc81h+s9J
         XNKunqhFMAN63vwW6AGKnPwuLfshoip9PORtG1wIcAox+TRlE5H6fMY7DHn0HGcfOoaS
         lg9YsNsUqoPYIaNHu1SY6Leh3n6vZQoO+ZxHiBYErz20Lq0s3FnJXA2KNf3jIO6z1zlj
         VyYw==
X-Forwarded-Encrypted: i=1; AKwUvBzn59s6YVRKsUMAee6o3pt4jFyKQtOaZFPj64E3F4HkZ94yep7hWyQ07+5/myUsSRU/a+t48OsB6ASo@vger.kernel.org
X-Gm-Message-State: AFuF++lt7NQpf3i6O9OqBtKyB5cZt5xbZZMBQGds/KgdgUwa1T54bNuh
	8DvyFfngvS54Bvohb/0r+SB7OtYSWt25esnRtLWRW3WJQlVv9Kngv6OtqfiCHT3+SPrNRhnZWEb
	SoCdGwG9MCXbRs/imDL74YrEJQzv0K8MThSDV4FtTNGMH40hWx7yiTOX442+CZkVp
X-Gm-Gg: AYBFou02ZR0RS0PIbY/oyiHTHLi3NxPx0dKfGkwRPUszcd3SNfMMUKc1aK9EOfvbm0L
	2frtd2U0ms+Z5RRSvFOrdf5v+Lvgd3gNEG77KwY27pWHAC8jgZpJx8uaOEMxKS4qROvXCkOoxi6
	E+IQ+0LUqMZPYmIyT275Li4mse16cC4eudb8A/09kA6K6UJ7Dz6OXN1henYewYAuJgomypIZvIL
	WSz9X6M3lNgrUzWehPuCwh8507dCo7ffAYZoCTt68Z6sOttTzv6nDfS+ZoOSNjrIB3HIf2MRSwo
	T/hsvcDK3MCg2gKF41ZKkHvnHcdmH0DqhKmyd1LIqClYIgn5FZZUL9UKeKETYYQHhM4/3bA/aWP
	HaOBgVsW4wYSkllS2jT50Ng==
X-Received: by 2002:a05:6102:534e:b0:789:3f43:6458 with SMTP id ada2fe7eead31-78a1f255064mr658493137.0.1788358650380;
        Wed, 02 Sep 2026 07:17:30 -0700 (PDT)
X-Received: by 2002:a05:6102:534e:b0:789:3f43:6458 with SMTP id ada2fe7eead31-78a1f255064mr658472137.0.1788358649339;
        Wed, 02 Sep 2026 07:17:29 -0700 (PDT)
Received: from [192.168.202.12] ([178.235.128.140])
        by smtp.gmail.com with ESMTPSA id 2adb3069b0e04-5b606b26273sm612580e87.33.2026.09.02.07.17.26
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Wed, 02 Sep 2026 07:17:28 -0700 (PDT)
Message-ID: <b3ca88cc-ff00-4a6e-9335-e39bebedd548@oss.qualcomm.com>
Date: Wed, 2 Sep 2026 16:17:26 +0200
Precedence: bulk
X-Mailing-List: devicetree@vger.kernel.org
List-Id: <devicetree.vger.kernel.org>
List-Subscribe: <mailto:devicetree+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:devicetree+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH 4/6] arm64: dts: qcom: nord: Add PMAU0102 and PMM8650AU
 PMIC support
To: Shawn Guo <shengchao.guo@oss.qualcomm.com>,
        Bjorn Andersson <andersson@kernel.org>
Cc: Konrad Dybcio <konradybcio@kernel.org>, Rob Herring <robh@kernel.org>,
        Krzysztof Kozlowski <krzk+dt@kernel.org>,
        Conor Dooley
 <conor+dt@kernel.org>,
        Bartosz Golaszewski <brgl@kernel.org>,
        Dhruvin Rajpura <drajpura@qti.qualcomm.com>,
        Anandu Krishnan E <anandu.e@oss.qualcomm.com>,
        linux-arm-msm@vger.kernel.org, devicetree@vger.kernel.org,
        linux-kernel@vger.kernel.org
References: <20260831032103.341633-1-shengchao.guo@oss.qualcomm.com>
 <20260831032103.341633-5-shengchao.guo@oss.qualcomm.com>
Content-Language: en-US
From: Konrad Dybcio <konrad.dybcio@oss.qualcomm.com>
In-Reply-To: <20260831032103.341633-5-shengchao.guo@oss.qualcomm.com>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit
X-Proofpoint-GUID: Ico7UTJTCycGj43hXOXnh7_qkQVID1ht
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYwOTAyMDEyNiBTYWx0ZWRfX8oB1rS31mwcK
 N2MAySiOOcq121UMfACTKAOQEHWzFNv21Liwn3jesFVIvq+gGVAsOtxiS9XoLA7LBBUxOvnFw4n
 pg/HTLe+sKZWYkRZeiwg/aEt6GJAJBEN/vyUBEIUrENUXXySXGXvi0jGMpXfg2n5WhDtfcuJogw
 54lfWpZfeXrx7eBjVxlHcxBBgPsR3uy+4WEbAP5tWRpe6PO6vN2nWJCBNfpfaDx/KY1nk1atmkR
 1qnxqmaDCO8kOPzDU3121YcCgBreIZDV1nVtIxBaUjYOmP+3saYctxozUoPxBSVqC+FmTU07jdM
 JAIhdRTgVDmDUomMGNk/LZonmWKD/dRqtzKDIte28orWpiBnhZCa8HG+hGWtiOFveO0tkjOQrHH
 9LICfoxnqbqLpVYwDAJ1HNJNbmMyBBhjzmacFOMGdCRm1XoqnYnRBkbMvrnRlC+8eqT0ViV/i8Z
 1Rzeod6twz3XQKBR4UA==
X-Proofpoint-Spam-Info: AW1haW4tMjYwOTAyMDEyNiBTYWx0ZWRfXw8daNRZ6D0sL
 SIZQzgG8FKbea1mXDtA8Bv+g4D2jdcWyg4i07ES/SeFaUj5qRTbDO3y07oo7/Q3fY2/5z74FVaB
 YxsFc65GA3qqTT0M5uUK1Z7wZPHkBnw=
X-Authority-Analysis: v=2.4 cv=ErHiaycA c=1 sm=1 tr=0 ts=6a982ffb cx=c_pps
 a=5HAIKLe1ejAbszaTRHs9Ug==:117 a=PRfkaYvzSr8QmIIGAkY2Sg==:17
 a=IkcTkHD0fZMA:10 a=VdqzKS8jKosA:10 a=s4-Qcg_JpJYA:10
 a=VkNPw1HP01LnGYTKEx00:22 a=u7WPNUs3qKkmUXheDGA7:22 a=_glEPmIy2e8OvE2BGh3C:22
 a=VwQbUJbxAAAA:8 a=EUspDBNiAAAA:8 a=DK9C53eAeggdQivjd-wA:9 a=QEXdDO2ut3YA:10
 a=gYDTvv6II1OnSo0itH1n:22
X-Proofpoint-ORIG-GUID: Ico7UTJTCycGj43hXOXnh7_qkQVID1ht
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1176,Hydra:6.1.134,FMLib:17.12.100.49
 definitions=2026-09-02_03,2026-09-01_03,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 phishscore=0 bulkscore=0 adultscore=0 malwarescore=0 spamscore=0
 impostorscore=0 priorityscore=1501 lowpriorityscore=0 suspectscore=0
 clxscore=1015 classifier=typeunknown authscore=0 authtc= authcc=
 route=outbound adjust=0 reason=mlx scancount=1 engine=8.22.0-2606150000
 definitions=main-2609020126

On 8/31/26 5:21 AM, Shawn Guo wrote:
> From: Dhruvin Rajpura <drajpura@qti.qualcomm.com>
> 
> The Nord platform is supplied by two families of PMICs on the SPMI bus:
> eight PMAU0102 devices on USIDs 4 to 11, and one PMM8650AU on USID 0.
> Add one dtsi per PMIC type, following the established one-file-per-PMIC
> convention, and include both of them from nord-rrd.dts.
> 
> The eight PMAU0102 instances are labelled pmau0102_e through pmau0102_l
> after their board designators. Each one provides a GPIO controller, an
> ADC, and an MBG (Master Bandgap) temperature monitor that reads its die
> temperature through a DIE_TEMP ADC channel. The monitors use the
> qcom,pmau0102-mbg-tm compatible with qcom,pm8775-mbg-tm as fallback, and
> each is hooked up to a thermal zone.
> 
> PMM8650AU is the same die as PMM8654AU, so pmm8650au_a reuses the
> existing qcom,pmm8654au and qcom,pmm8654au-gpio compatibles while the
> file is named after the part actually populated on the board. It provides
> PON with a power key, an RTC, and a GPIO controller. The resin
> is described but left disabled, for boards that wire it up to enable.
> 
> Signed-off-by: Dhruvin Rajpura <drajpura@qti.qualcomm.com>
> Signed-off-by: Shawn Guo <shengchao.guo@oss.qualcomm.com>
> ---

[...]

> +		pmm8650au_a_pon: pon@1200 {
> +			compatible = "qcom,pmk8350-pon";

I think this may fall into the same bucket

https://lore.kernel.org/all/20260724-b4-add_pwrkey_and_resin-v6-1-41acc214d93a@oss.qualcomm.com/

Konrad
