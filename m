Received: from mx0b-0031df01.pphosted.com (mx0b-0031df01.pphosted.com [205.220.180.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 7B90C313E2B
	for <devicetree@vger.kernel.org>; Fri,  8 May 2026 11:01:05 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.180.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1778238066; cv=none; b=tcJKS6ve0XNH9Prva107LSTuJbeU+MAKnVMYX6zugEfR+l59H+Tx1vgfhBSdlpCV2iHQB+M6fyDI6VJzmsBveiNhpE9viGYLj+BXa/5dboKroNZoyf5/8zM2ybTBxTdVP/Kf00tX1p81180aE+nbZLQIUHBUK8aomkfTXiXLibY=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1778238066; c=relaxed/simple;
	bh=QofzOtqf/V4gHmLyAulEuCeCZ9j7pShktv4meKIv4BM=;
	h=Message-ID:Date:MIME-Version:Subject:To:Cc:References:From:
	 In-Reply-To:Content-Type; b=YRpRhvn/Liv46+0YgNEiY7ibc6CLz4PP6dvjoTMvHEjiCYGvcFCzs3rcEwe2oDLYQbP6Z2GQF1TWugZNM3fd1Vej4Wp+6PXR/qd6sPprLCCJawJHCS7WvzSrXOSinruZNafDgpFLsdp55VfMrq5/soYlkwI8GVfwYRSB1ctLqpQ=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=Td5f4qlW; dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b=hqwGSfH4; arc=none smtp.client-ip=205.220.180.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b="Td5f4qlW";
	dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b="hqwGSfH4"
Received: from pps.filterd (m0279869.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 64867vga1173964
	for <devicetree@vger.kernel.org>; Fri, 8 May 2026 11:01:04 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	SQ9fQrn1XTfzGrersPl5j/cPkZhhCczzR3F8lrXNg+A=; b=Td5f4qlWDdrmJkuV
	x4DYs5ge5ttIZZPnydPnMmnYuRFqiDv/WL0JZaatMacWzS9aW7cu7KcZsNjYCdek
	nLpLd9jApasEqf75FIokuOETZZHneesctNNrrDLK7+rUsFklnsG8Hf2Z0chH0vIe
	dyQ/ARysQ+kZGS6QrPLA2ZtN4l+v5txkT5ew28ANBEwUtMd6/jW4VJLYWbpnviuW
	d2R+AaVKY/Ze4NdxdPrOjyJyGsj8y1BuXy8B03lCHDCvZ5r0IsIP+n5o27h+NFKL
	5cV8eT8OBT57k3EW867vBGH3546i3HkMZomCg9DXrZ1l7EHuTHcACRn+I3u98sjn
	HKhHjQ==
Received: from mail-vs1-f69.google.com (mail-vs1-f69.google.com [209.85.217.69])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4e132hajd9-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <devicetree@vger.kernel.org>; Fri, 08 May 2026 11:01:04 +0000 (GMT)
Received: by mail-vs1-f69.google.com with SMTP id ada2fe7eead31-62e3bf0eae2so169275137.0
        for <devicetree@vger.kernel.org>; Fri, 08 May 2026 04:01:04 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1778238064; x=1778842864; darn=vger.kernel.org;
        h=content-transfer-encoding:in-reply-to:from:content-language
         :references:cc:to:subject:user-agent:mime-version:date:message-id
         :from:to:cc:subject:date:message-id:reply-to;
        bh=SQ9fQrn1XTfzGrersPl5j/cPkZhhCczzR3F8lrXNg+A=;
        b=hqwGSfH4Ank2RjjMVVjsCrAOZc0MhGCEtDD9QnjjgFPwEkl1MF/THL4G3X8GbqCCAw
         h2/dFSw3nyV7iraaDVfgTIQze4eyQYH93fPyBT8I1Kn0lfpNvy2x5jl3sZNTguJ4XDQK
         79QcGGPYUfS+kwtK25kXw6Mdm9naCHXU9H5j2FqAQRnwPcI4dYe+xvFGCp/svy4G6MzI
         gO1J3FzdK0oaQVnThzMeWWpCvlMkOTVEQreZynrg3qugXIQrC9cQAMnG2nSixGVHHwH1
         tTJIKGYn/GOxlahp4sw/nxv+M5F5U45PtHqxQ6NRkmGJJwneH+O6wO6RAxbNA63+BKDU
         n7Zw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1778238064; x=1778842864;
        h=content-transfer-encoding:in-reply-to:from:content-language
         :references:cc:to:subject:user-agent:mime-version:date:message-id
         :x-gm-gg:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=SQ9fQrn1XTfzGrersPl5j/cPkZhhCczzR3F8lrXNg+A=;
        b=Te/o4r8KNPTcVcY2/wk+Dpm0PzJ2P0NvdhhKOU8BUNlFKFdzSavE22a0VfhoBR9dyG
         B6CxDHYTr1ZFEdpT5DEg+XC3vi5rnhYkQ9HOGwmXz/G65oIb3of5UNU1zcNX/XL2Q9Y+
         e8DN8yGAY0y2ZMXl+QuUsBIqbVLrgY9HCaTt4B8cPpopZn3Lr8M0dZBXCRQqDNJcTlKi
         2eCMAiB4kOeL4trjZIrB/hho94nNy44pT5EO6HcmoqI/KR5sw3lVJLpapswo9if24s9C
         Hh/oSz2czwUZ2bS/Hq7/VtJm/wFJJ7P5ET8cRQiaSZzuPQr4TWbSkddy8s4hsDXNZSFY
         pNsw==
X-Forwarded-Encrypted: i=1; AFNElJ85fB+f4ljFNHulpdXcRoiAnWY3KhoxCu2GjCo20bIAuO3dwBfaKCV1zuRQYkSeirTwylXFw8aXfTso@vger.kernel.org
X-Gm-Message-State: AOJu0YyIYaD2eO5yyTGE85IRvdLe6LMxe/LjqY0AyzFp53pZbngPt6OR
	gsawDKc0cVTNvTaGVocfvRP+4Y8LbLvZnt9K89G1rioXHoYr2bhWgn5sO8k5MYkRBRJIMmmlENc
	YTNrOq7P4EK0FwxRtQF3sX6MvVtDYfjWjHHXcAoUCICRwTSh+GwSXGODUuuzE0fFj
X-Gm-Gg: Acq92OHlc72H53ptUC5TS5VmvRuFSga0qbxFgNPJZS77oX82KsQlMtpTN1PunFO63gW
	Yjx3HOUrYLVkio11WzQveAm3jR54uPesIRCVgdZys9Os/DI6NjtmbYsSqisfgQQR0nCoefIsNn+
	a6eYZiJq9z57dTMGaZClsgCtlNa2uNoObpfNqD2/+tiMP00Dpxw5B/4dk2FGR5iFvvGYyVeVCcV
	ett9RpmMBwTL/K6Fp6hcm4PB2KlJ9ysbh41S5ybVajvV8vVZRs/cyhdFohOpWKS5bk0K/NDkdN0
	SAgpWZNEz0UJ0zkVgLM0N38drjX3kGuy3I4XcplrsLMwcbCikK3vfvkdUwvM+XbRHl+nRAjmGWL
	sBkiiXslt5hmuBdH4KR0//7GYgDexkUzbmWBl6lX9fjB+dfBCnb5G85Yvb19PuarQP0TjRdJp3n
	vwj2k722tybsb5Lg==
X-Received: by 2002:a05:6102:94b:b0:610:31dc:2302 with SMTP id ada2fe7eead31-630faab2acbmr2426738137.1.1778238063710;
        Fri, 08 May 2026 04:01:03 -0700 (PDT)
X-Received: by 2002:a05:6102:94b:b0:610:31dc:2302 with SMTP id ada2fe7eead31-630faab2acbmr2426711137.1.1778238063246;
        Fri, 08 May 2026 04:01:03 -0700 (PDT)
Received: from [192.168.119.254] (078088045245.garwolin.vectranet.pl. [78.88.45.245])
        by smtp.gmail.com with ESMTPSA id a640c23a62f3a-bcac48381dcsm69256666b.54.2026.05.08.04.01.01
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Fri, 08 May 2026 04:01:02 -0700 (PDT)
Message-ID: <790183c0-104e-462e-b107-748fefdb8a85@oss.qualcomm.com>
Date: Fri, 8 May 2026 13:00:58 +0200
Precedence: bulk
X-Mailing-List: devicetree@vger.kernel.org
List-Id: <devicetree.vger.kernel.org>
List-Subscribe: <mailto:devicetree+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:devicetree+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH 3/3] arm64: dts: qcom: Add initial support for MSM8920
To: Krzysztof Kozlowski <krzk@kernel.org>,
        "Catherine A. Frederick" <serenity@floorchan.org>
Cc: andersson@kernel.org, sboyd@kernel.org, krzk+dt@kernel.org,
        linux-arm-msm@vger.kernel.org, linux-clk@vger.kernel.org,
        devicetree@vger.kernel.org, linux-kernel@vger.kernel.org
References: <20260505203845.192140-1-serenity@floorchan.org>
 <20260505203845.192140-3-serenity@floorchan.org>
 <20260506-berserk-charming-tody-f9ecc6@quoll>
Content-Language: en-US
From: Konrad Dybcio <konrad.dybcio@oss.qualcomm.com>
In-Reply-To: <20260506-berserk-charming-tody-f9ecc6@quoll>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYwNTA4MDExNCBTYWx0ZWRfX6c491zJMYiEC
 eK1fzJYJchpVv5Y2DF16giRDEUQWz+3Ky14/Fgljzw/a2QBWyi7Hnp82kr3IW1Z7gO2Pxkq/iyv
 +dlRZMb6zjQeZnC191MebQTfGhzRkgzdG0zqOBSjCSvIrHaCYOTMYuFXgvgJM++iagWjJAbaxjo
 Q+Wwa/3OrAlPbhKN9H58Av7nQhuVj5EYgbipGg3H23ME8bWazdB7Gr+RNY2I7QPi0h4NPhSJd3v
 pf55Z+NO9NbejSMOG7mwvi2bKPUhlYm7f8ciMCyfwKXO4+o+BTleJFSLKY8OFjhffu1BQqLgyFK
 WUzvqbVlbamfEluniymeDx63Ry7yX3aSfjPDsTqHUTh7Z0DpSH6XN5GbMPlIRsi8BKi/zndZ3W/
 2hGttOwp2WVPKjp10bNR5Yd426TJJRIV6NPl0QUC2VRfoHIChZUUYU9sC6jZVR4e18TMejw5rIC
 aIcdf4dM6OkY7yYhKuw==
X-Proofpoint-ORIG-GUID: 1GjjH0vDfBjqL6D62LbM_oq6cuntPbFH
X-Proofpoint-GUID: 1GjjH0vDfBjqL6D62LbM_oq6cuntPbFH
X-Authority-Analysis: v=2.4 cv=McxcfZ/f c=1 sm=1 tr=0 ts=69fdc270 cx=c_pps
 a=5HAIKLe1ejAbszaTRHs9Ug==:117 a=FpWmc02/iXfjRdCD7H54yg==:17
 a=IkcTkHD0fZMA:10 a=NGcC8JguVDcA:10 a=s4-Qcg_JpJYA:10
 a=VkNPw1HP01LnGYTKEx00:22 a=u7WPNUs3qKkmUXheDGA7:22 a=_glEPmIy2e8OvE2BGh3C:22
 a=DhTvykhhAAAA:8 a=N4otaSFRtcR4xJ013aIA:9 a=QEXdDO2ut3YA:10
 a=gYDTvv6II1OnSo0itH1n:22 a=bLiRU7DCRrRo9wiowOr6:22
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1143,Hydra:6.1.51,FMLib:17.12.100.49
 definitions=2026-05-07_02,2026-05-06_01,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 clxscore=1015 malwarescore=0 suspectscore=0 spamscore=0 bulkscore=0
 adultscore=0 priorityscore=1501 lowpriorityscore=0 impostorscore=0
 phishscore=0 classifier=typeunknown authscore=0 authtc= authcc=
 route=outbound adjust=0 reason=mlx scancount=1 engine=8.22.0-2604200000
 definitions=main-2605080114

On 5/6/26 11:49 AM, Krzysztof Kozlowski wrote:
> On Tue, May 05, 2026 at 04:38:41PM -0400, Catherine A. Frederick wrote:
>> Add initial support for MSM8920, which is essentially MSM8917 with
>> an MSM8953 modem glued onto it.
>>
>> Signed-off-by: Catherine A. Frederick <serenity@floorchan.org>
>> ---
>>  arch/arm64/boot/dts/qcom/msm8920.dtsi | 55 +++++++++++++++++++++++++++
>>  1 file changed, 55 insertions(+)
>>  create mode 100644 arch/arm64/boot/dts/qcom/msm8920.dtsi
>>
>> diff --git a/arch/arm64/boot/dts/qcom/msm8920.dtsi b/arch/arm64/boot/dts/qcom/msm8920.dtsi
>> new file mode 100644
>> index 000000000000..943cae72227a
>> --- /dev/null
>> +++ b/arch/arm64/boot/dts/qcom/msm8920.dtsi
> 
> That's a dead code, unused. No need to add it.

If you have a device that will include this, please post it together

Konrad
