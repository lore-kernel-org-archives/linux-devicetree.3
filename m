Received: from mx0a-0031df01.pphosted.com (mx0a-0031df01.pphosted.com [205.220.168.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 744BF31159C
	for <devicetree@vger.kernel.org>; Tue, 14 Apr 2026 14:15:53 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.168.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1776176154; cv=none; b=bsRMEyDy4BVm+944GJLDn9E08hk6O9cCxxjZjlfGjYO88YAwyzU2sCdnVpdFihkbsMdiyspETcEsvQKw7VE5jUIeQhy876ILzOuomAvmBU0pCQVn1pjLDnaFyTGVbGhj7166bJf9AqDMOy9GAGvX/KwRsSHQTXmsq19yH0ygU3Q=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1776176154; c=relaxed/simple;
	bh=Q8K2JZDt+sO0CClm4/rVIlM7ktFn4GpWofwVDkYPZn8=;
	h=Message-ID:Date:MIME-Version:Subject:To:Cc:References:From:
	 In-Reply-To:Content-Type; b=IkN4oaN0EtcNwwsbGqCTHggVuI9Zh0VPetc0slXavjic6y0NI5tDrQZsCDiJRAJ7iDn8Fo/7SirCWUEicUPqQ6rkZQl6yWHhsgPwGFF8oW8NxcYzK3A7hXiAHur6Tgod4soEXFMgN8w02UKXnt4ypGlHDmuQ1NGgpGjWz+nP6IM=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=TikPlKnk; dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b=GvcmasCw; arc=none smtp.client-ip=205.220.168.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b="TikPlKnk";
	dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b="GvcmasCw"
Received: from pps.filterd (m0279864.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 63EBjGxc3505410
	for <devicetree@vger.kernel.org>; Tue, 14 Apr 2026 14:15:53 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	1uRMEoih+r45aOBffP43wZDGR9c/DoTnGgL0tCnr/A8=; b=TikPlKnk8m50HHkv
	B7lmviyhIoAPAAfYTHWrgnQHj01HPgEw/yRW3tauzxDuO14R80J5QdUi3P8mkSaf
	mmYZr66H0eSBPsb5AvuKu6SWvsDIPB8qhFg3IVWPH2dos4jkAQ2WHBx3Nh9kShXu
	GGCemk8oiZpfHdZVu8jPQSlR4YEgLWKpnOpM9jZogMEZckAhPKdwuCnya+wwGn3Q
	7Ab7gNtZyeGacw+iSuiMPMFwQ6ktoFT5vrzNcrF97PWM7/VvU9pmZQYJsuqC3xOO
	UAiGG8Y7/40kcSBOPSMG1bEEP2x3Tnc3mmH+PJMcHULfo/8dIqdzsUIp5njy1k1D
	RHgbow==
Received: from mail-qv1-f70.google.com (mail-qv1-f70.google.com [209.85.219.70])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4dh870k2h9-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <devicetree@vger.kernel.org>; Tue, 14 Apr 2026 14:15:52 +0000 (GMT)
Received: by mail-qv1-f70.google.com with SMTP id 6a1803df08f44-8a18178713cso12950746d6.3
        for <devicetree@vger.kernel.org>; Tue, 14 Apr 2026 07:15:52 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1776176151; x=1776780951; darn=vger.kernel.org;
        h=content-transfer-encoding:in-reply-to:from:content-language
         :references:cc:to:subject:user-agent:mime-version:date:message-id
         :from:to:cc:subject:date:message-id:reply-to;
        bh=1uRMEoih+r45aOBffP43wZDGR9c/DoTnGgL0tCnr/A8=;
        b=GvcmasCwODEIALsYpgP7JOUAwbK0SrEv2oE2WpkjNj5X2jKgopJQAnYB05w87Gr4Ds
         s6Eg2vjCYJKxu5TaTG2bzNq5KCuGWuagkRMP3sC39doN1Anp/YSBzlvu6cqsIPyFKBdA
         18Dqbt+bfIZpv1Yk+7D2cEtWn6tyuzaF9/YxCiHID8tEBv+0W31sxjs+7iqqAXVN2IMR
         xWbDoUHZ/yX1lvnApIXPsgS5NNneMYO6mIe+okBRQwX0rmK1Yhr1iU1vebJXs5nSGD9H
         37nQlA4U/7pZJ8HOCWYCxPhfEoC4Qzz6EaxoxJPs1Dwyd7aUMy7s2NyKC22i+VgyJRXz
         nsHw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1776176151; x=1776780951;
        h=content-transfer-encoding:in-reply-to:from:content-language
         :references:cc:to:subject:user-agent:mime-version:date:message-id
         :x-gm-gg:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=1uRMEoih+r45aOBffP43wZDGR9c/DoTnGgL0tCnr/A8=;
        b=HP++SQeiALeYqApFZLZldG9++6qraNVi9srSuhATTucDLSkRP5ng+kKlaTsvx6TVxf
         K5C/wjH9Wk4cufpIsrcPEEiO09Ood8DTWtwG7C+00/5h0Kco9RN3YAP0bDRXi4RNXKS2
         Z2ktrfdTkF8nE8T1VjTteMA03XUIHZn7U/eCxzF5NOaOQloDTVqmvOJrLkGGAutPbL40
         FUwO3ncWaoEORC5Ukh6g9gAxx0W5P18YFDgFRggVZ8hZDcpCulUMIe/Od+a5Yb/1PSwv
         6isalBQm7GGLbzOGJnGzdnn+WIh6seyLO7UwZN3awsav20rN3XLGS8ZfElfgjjsTdOq3
         GISQ==
X-Forwarded-Encrypted: i=1; AFNElJ+bB4vA1962SjhaDS8U32q5S6JDigd7DW7r1YBST7K5BGOf9D7rHuzN2yMbq5gH90I5kzaWCZngRHgw@vger.kernel.org
X-Gm-Message-State: AOJu0Yw0AVhX4hfoRJc7oZuiHuXvkMg85aVoq9idr9QOLKBYxTcAF5sF
	lP/m77MvuTNrqhUtBXj7D0dTwztyIPP+NHpETNQ3FZ7P28ibAhOewhaxkiV1fsDgr3VvzEjwSWT
	nlU5wLfcgWodlj+ri/hRVBiurBHLNE5j80KHbKccNHEiOC81N26kp1ow53xY7revC
X-Gm-Gg: AeBDieuACeLvKi81lNGblmluyd/v1+o0LIcCo6a7pEe9I3bVp7S8mL3YAX1rBX8DPH8
	Nwfj2ChmOcvJSB8LMj3GUHy7zTREEaCI1ksJ9o7ee/y37vZxnOSE3jiDET9qiFKrDahSd00lGLa
	m8DjQAgILq4eUGq1PaCNG+zHOTkwAj0ei017kQtgHauVzl9ilpidpreFzPNkbsqzrCp/FEeg5QT
	6kD+qczG1LOJZjAoyhNRdPAcG6oQdDcHQrdmKeLtcaQV8bcef4AnyHQvJUGUEivJgup8PCFJlUN
	kiVt4ESVqqqISKEkkY/aVzpozfvh2PfHeNyfFbF9YxUB9z10UFmIk+OjvHJg20SIAVs0Q4arNic
	nBs2nTNWealXhY/0nRwcAt/H6F64ja8NFi7rwA79vuUaMJUN3HEHI/1PvsM50nom2nERLXJWM9X
	FrAq5ub5yI3Q6IjA==
X-Received: by 2002:ad4:5767:0:b0:8ae:6380:8fae with SMTP id 6a1803df08f44-8ae63809759mr12532306d6.3.1776176151198;
        Tue, 14 Apr 2026 07:15:51 -0700 (PDT)
X-Received: by 2002:ad4:5767:0:b0:8ae:6380:8fae with SMTP id 6a1803df08f44-8ae63809759mr12531916d6.3.1776176150584;
        Tue, 14 Apr 2026 07:15:50 -0700 (PDT)
Received: from [192.168.119.254] (078088045245.garwolin.vectranet.pl. [78.88.45.245])
        by smtp.gmail.com with ESMTPSA id a640c23a62f3a-b9d6dedef0dsm404627066b.14.2026.04.14.07.15.48
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Tue, 14 Apr 2026 07:15:49 -0700 (PDT)
Message-ID: <fb7ce90c-a7bc-48d7-b87a-640c7ee0b6eb@oss.qualcomm.com>
Date: Tue, 14 Apr 2026 16:15:47 +0200
Precedence: bulk
X-Mailing-List: devicetree@vger.kernel.org
List-Id: <devicetree.vger.kernel.org>
List-Subscribe: <mailto:devicetree+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:devicetree+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v2] arm64: dts: qcom: x1e80100-dell-xps13-9345: enable
 onboard accelerometers
To: Aleksandrs Vinarskis <alex@vinarskis.com>,
        Bjorn Andersson <andersson@kernel.org>,
        Konrad Dybcio <konradybcio@kernel.org>, Rob Herring <robh@kernel.org>,
        Krzysztof Kozlowski <krzk+dt@kernel.org>,
        Conor Dooley <conor+dt@kernel.org>
Cc: laurentiu.tudor1@dell.com, linux-arm-msm@vger.kernel.org,
        devicetree@vger.kernel.org, linux-kernel@vger.kernel.org,
        Dmitry Baryshkov <dmitry.baryshkov@oss.qualcomm.com>
References: <20260331-dell-xps-9345-accel-v2-1-7dacbd24b43d@vinarskis.com>
Content-Language: en-US
From: Konrad Dybcio <konrad.dybcio@oss.qualcomm.com>
In-Reply-To: <20260331-dell-xps-9345-accel-v2-1-7dacbd24b43d@vinarskis.com>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYwNDE0MDEzNCBTYWx0ZWRfX/1gWyS9Zzb26
 7Gwq2RI2fTq3FZ0P3d1Pk7Vb7x6RgL1YfmDNs6Xy97vywORUGtLyA4kW0PbD21PyICZJDR0BNQG
 REnby/a069dgWJe8JkcKRreKb9nqG29GplUbymnxzjdo+6T/LzOtcPNPyRjynp8mMHHWEJQoudY
 B06A0Tc0S6gM8hXmXICwskOJerwlTbUT8Cdf/w9UFVeLW252b6AfMIEEMJoaRmYfwzd3J596ncU
 CAsQjbtL9jJZxsCM6sN7e525YUvARuZarrAt2LuXg2VOk3Q+9PFk9rRKItU2DkQXNikRkjqOsIz
 QSlff6OI48nqcwGI68YG79rvOpwcECgek/Jt4o2MaCxtRxRuYdmLpSrxk6Ko1o6NvXASCO+TEaf
 JWnB3e6x0h58qPoKC7HbKPUknbITz4xqZ0790kXOIFo1CZ0iN2Gkev20N/liQUqNz6ioZBK0hIw
 bx5ZkxxoF8mL91fypoQ==
X-Proofpoint-ORIG-GUID: YijyVdUwgFCwRRLlJYduuBlQIkl0kXFV
X-Proofpoint-GUID: YijyVdUwgFCwRRLlJYduuBlQIkl0kXFV
X-Authority-Analysis: v=2.4 cv=btZ8wkai c=1 sm=1 tr=0 ts=69de4c18 cx=c_pps
 a=oc9J++0uMp73DTRD5QyR2A==:117 a=FpWmc02/iXfjRdCD7H54yg==:17
 a=IkcTkHD0fZMA:10 a=A5OVakUREuEA:10 a=s4-Qcg_JpJYA:10
 a=VkNPw1HP01LnGYTKEx00:22 a=u7WPNUs3qKkmUXheDGA7:22 a=DJpcGTmdVt4CTyJn9g5Z:22
 a=I76Qk8w-AAAA:8 a=EUspDBNiAAAA:8 a=brg3RTsmiy1XP5ZoLEsA:9 a=QEXdDO2ut3YA:10
 a=iYH6xdkBrDN1Jqds4HTS:22 a=vUPM0Wvl0xcrLs4nqPIT:22
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1143,Hydra:6.1.51,FMLib:17.12.100.49
 definitions=2026-04-14_03,2026-04-13_04,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 malwarescore=0 lowpriorityscore=0 spamscore=0 impostorscore=0 phishscore=0
 priorityscore=1501 bulkscore=0 suspectscore=0 clxscore=1015 adultscore=0
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.22.0-2604070000 definitions=main-2604140134

On 3/31/26 3:36 PM, Aleksandrs Vinarskis wrote:
> Particular laptop comes with two sets of sensors:
> 1. Motherboard: accelerometer
> 2. Display/Camera module: accelerometer, ambient ligth (and more)
>    sensor
> 
> Both i2c busses are bound to Snapdragon Sensor Core (SSC) and are
> typically controlled by (A)DSP thus allowing for great power
> efficiency. This however requires DSP libraries matching ADSP firmware,
> sensors descriptions (must be extracted from Windows) and other
> potentially closed-source libraries. Opensource tooling includes
> `libssc` and `hexagonrpcd`, but they were not verified to be working.
> 
> Until SSC support for X1E lands, bitbang both i2c busses to enable
> accelerometer functionality. In the future if/when sensors on this
> platform can be used from DSP directly, this commit can be reverted.
> 
> Both accelerometers were tested individually via `monitor-sensor`.
> Display accelerometer is defined first, as it appears automatic
> screen rotation tools simply pick the 1st iio device.
> 
> Signed-off-by: Aleksandrs Vinarskis <alex@vinarskis.com>
> ---

Acked-by: Konrad Dybcio <konrad.dybcio@oss.qualcomm.com>

Konrad
