Received: from mx0b-0031df01.pphosted.com (mx0b-0031df01.pphosted.com [205.220.180.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id DEDD3390992
	for <devicetree@vger.kernel.org>; Thu,  2 Apr 2026 09:45:56 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.180.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1775123165; cv=none; b=Gaun1nQcRIytCmwjc7qBcEFKlLn16gN33G4Fr+GUA3Mb7ffqgEOFp1c7r3yKQGqIlWKAswWDDQK3/2i8cGoXBH/IrMzBukeAziiNPSZagtj7qd0Xs7OHTIfJ6zMhQ7OO5WlJWWJ9c93NfGHGlYXnW4Qt96AdqXyy4A1P6q8HXz0=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1775123165; c=relaxed/simple;
	bh=Mfd+Qq9kOh/v1GVdwWuBvllZlQjBdLtcEia0O51e/kw=;
	h=Message-ID:Date:MIME-Version:Subject:To:Cc:References:From:
	 In-Reply-To:Content-Type; b=pkF5NsXGM12nXrLn3nRAVvq9puMeVmiLbkjSqL6BmkglJUIIrQ52sO9lENLVh7b6d+X2JKePZCVzukVKFkqebk5Dzk7PsqQoqaF2skbFB90RmFnpeYpuVH0I7vmDUoq1zu6iLBWnQRH6wn0gsIGsQuwMHofoEksMB/d0Aqa8SCM=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=n6e3DlTm; dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b=MmmM2Bsw; arc=none smtp.client-ip=205.220.180.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b="n6e3DlTm";
	dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b="MmmM2Bsw"
Received: from pps.filterd (m0279870.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 6326vi5L547094
	for <devicetree@vger.kernel.org>; Thu, 2 Apr 2026 09:45:54 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	PW394LL7WiyVppb3yqX6xaB+fIkBISkkCqkC763mnp4=; b=n6e3DlTmJD8K2YSn
	F4bRWatSdrlpbofRzL0aXwBLHoFsrVaElC0yRpUy9T9ZOoySfb/y5bf7l6syNePc
	xq057NatrOTa1d9fcSyshrWVfphwY+iEIF19j1Xtx8TpKB1cUdnvuzRklCZV7+pO
	N+gCCQPXkHx8qQZJnvtBipGGIqUZxI8JHyMBgdmx9ns3M1lfVnyKDpptsRcrzmIq
	MmryVSJQyxSfCp98oAnnsm80vjJhm7WiNUiDhJnQjP6J0yZzHqQoyOWaKSwPCEyH
	PeN6W/1WL24t7xxx8OcEY4tvglaw4Lq2MP00c5owTn2pygLUI0IPv+WoGPyrTBEI
	b9KnLg==
Received: from mail-qt1-f199.google.com (mail-qt1-f199.google.com [209.85.160.199])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4d94vvm3xa-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <devicetree@vger.kernel.org>; Thu, 02 Apr 2026 09:45:54 +0000 (GMT)
Received: by mail-qt1-f199.google.com with SMTP id d75a77b69052e-50b4bd8e77dso1540021cf.3
        for <devicetree@vger.kernel.org>; Thu, 02 Apr 2026 02:45:54 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1775123154; x=1775727954; darn=vger.kernel.org;
        h=content-transfer-encoding:in-reply-to:from:content-language
         :references:cc:to:subject:user-agent:mime-version:date:message-id
         :from:to:cc:subject:date:message-id:reply-to;
        bh=PW394LL7WiyVppb3yqX6xaB+fIkBISkkCqkC763mnp4=;
        b=MmmM2BswDhEmIlnx2LCKgVyeZiZxnLYrqcbVkxo8cRPTo39CIyT2V4ZRityejC3JSr
         wKDDKW9xVkc+WvRSEfrng/Pey6mz/HrMPhE/nAQm4kqXpWaUEX0x8VMeTCsT8YJ9rwV3
         qlAR0ajiIc9O02l3QMzbUep+4g9BYrmJyUT/MDoyzhkD/yT/dorrRPKqvIWmYEjAInu2
         EltkvcIidFUHlD8R84HkI093cJD5MQq7M82LAuKptLqAS2PjBiaYa4WbOWXHbreu8UuY
         TLRF5wZkclQGRP/0H6JxnxvMaA2E2CALRGvGvdFcUy0FJJw/twrslJxCbe+BQPLrXlcT
         lc+A==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1775123154; x=1775727954;
        h=content-transfer-encoding:in-reply-to:from:content-language
         :references:cc:to:subject:user-agent:mime-version:date:message-id
         :x-gm-gg:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=PW394LL7WiyVppb3yqX6xaB+fIkBISkkCqkC763mnp4=;
        b=Q7GCMycAYQf3gEkIpiUbospMEXbxG62NHvk7t6RDERjNVndeM+zd/p68HBlVnST4gT
         UHOYSqgBdtEt84iBCLqBR339XDBg2kV9+Xoq1Uu1DCHbwv7s1aGy3/2WrNW9/qO5Z+Ah
         H1GHPXU20BwETvE7YbiFwk7/wAjLMPN4j2Ei2uB3jeDLiQAYO8WT+vCOD1L9cUfLmgnz
         fmLlIvWMABB1ZOxqw0dfVSbAtXk2facCTgMLOePqcoJdPppmjax/7b9jxq2Sa/83tBuv
         IVCo/KmOHMU8jaOgLLbiSS1NVMWMyg7HUsagPH0PaytGe/OV6Rs/XNjKEdReOElkDnTg
         w4AQ==
X-Forwarded-Encrypted: i=1; AJvYcCXmdGVRgjebwb4b4wXkV4uSC9uqWvNv6GyUo5q1YRhkm1M6jCy12aJ7LTKUryk4phprTPjCfQqp/uB6@vger.kernel.org
X-Gm-Message-State: AOJu0YwItl41sFccIU/Pkh6N6KzLLhd5mTKkhdXJNZthdz6hVXuS5xjk
	SKzalqM/4MbSvYF+e55T147JQRpxfDvBWE+Ej7DqC2sWVvOml+Z/UI2biNeuiNwEHoJMZ8mThWU
	j3fvsAB/x4JNShGeHz8u4IK54bWxIhQWk0ETfcpua8W5F3DCsoX1n+U8UWaR/WBnK
X-Gm-Gg: ATEYQzzobSC151w8O3QbX7hf8hxcgVqj+QTFZO5zNqoF03S8PIkfM/2DwZM/vyJXLmO
	fxle/ueQW5M48IfbQIxEvX/ohKFDCQy7xLceKrHuK6VyhihqsAN3RRRVG5pAuW5IvzmhhCBzirB
	819bG6dcTzhG1mQcbx36p1UzhJLgdj6Vqfo2EmDs5kj1GLMlvCsavInzgyUM5/ZBm/rUYxMebBg
	A4cqysHmnWt2+sTI/ntdlnZtktVhDpZ8njwAnEY4h+QYGlnHi1uXH9APKi9Cy3Si5GLg4pRn/S8
	K3cz0NPf23zuOHIEDwmSVgts9fsxfslvsjeLovk8YMwzU0XREky819t+q+/upC3xywhOotX2v4H
	0Fex3Agg8E1d8oRhvBGQTzDXOm74oIy32XO5XM3X2q++SIsFquYtVjvrEjtoQ9icJQi3w0h6WxM
	Y4B8s=
X-Received: by 2002:a05:622a:1985:b0:50b:2275:8c1f with SMTP id d75a77b69052e-50d3ba26cbdmr67168381cf.0.1775123153601;
        Thu, 02 Apr 2026 02:45:53 -0700 (PDT)
X-Received: by 2002:a05:622a:1985:b0:50b:2275:8c1f with SMTP id d75a77b69052e-50d3ba26cbdmr67168231cf.0.1775123153118;
        Thu, 02 Apr 2026 02:45:53 -0700 (PDT)
Received: from [192.168.119.254] (078088045245.garwolin.vectranet.pl. [78.88.45.245])
        by smtp.gmail.com with ESMTPSA id a640c23a62f3a-b9c3c9721b6sm73265366b.10.2026.04.02.02.45.50
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Thu, 02 Apr 2026 02:45:52 -0700 (PDT)
Message-ID: <d7d99d3d-bbf2-4822-ae5b-b18976953543@oss.qualcomm.com>
Date: Thu, 2 Apr 2026 11:45:49 +0200
Precedence: bulk
X-Mailing-List: devicetree@vger.kernel.org
List-Id: <devicetree.vger.kernel.org>
List-Subscribe: <mailto:devicetree+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:devicetree+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v3 1/4] arm64: dts: qcom: sdm845-xiaomi-beryllium:
 Introduce framebuffer
To: david@ixit.cz, Bjorn Andersson <andersson@kernel.org>,
        Konrad Dybcio <konradybcio@kernel.org>, Rob Herring <robh@kernel.org>,
        Krzysztof Kozlowski <krzk+dt@kernel.org>,
        Conor Dooley
 <conor+dt@kernel.org>, Sam Day <me@samcday.com>,
        Dzmitry Sankouski <dsankouski@gmail.com>,
        Dmitry Baryshkov <dmitry.baryshkov@oss.qualcomm.com>
Cc: linux-arm-msm@vger.kernel.org, devicetree@vger.kernel.org,
        linux-kernel@vger.kernel.org, phone-devel@vger.kernel.org,
        Petr Hodina <petr.hodina@protonmail.com>
References: <20260401-beryllium-fb-v3-0-ec7d443402ab@ixit.cz>
 <20260401-beryllium-fb-v3-1-ec7d443402ab@ixit.cz>
Content-Language: en-US
From: Konrad Dybcio <konrad.dybcio@oss.qualcomm.com>
In-Reply-To: <20260401-beryllium-fb-v3-1-ec7d443402ab@ixit.cz>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYwNDAyMDA4NyBTYWx0ZWRfX7LEbFLt/+E7b
 C8be06C4RgmdGhZlunUKsW9+AImfEkfAauFd3TiIaYDBtnQwwLKOwdqJT8OViNfoVkrgcAoOpKi
 aWJU23b+gLQkt8/RXHLCX9P9sqmu4Es9u8dbtZJEsNZYBAuYbubyJl9YbdeqDPrBw3mbrgrtJlR
 o0HnbNg3wImjM954wpN0DTvXT+5d3Wnkk43TlZBmDplr7Y+kOfCzkw6tgdGtySPMUYYl65Wx8LW
 ioRkQJegGACMhqL8tjJaHrNdlNoLINwRyTzJJ+vw+01pm0mz+fqaXmt8xG+FIqyR3kcFzWniVQo
 8gKPAHIo+8eScQROw0rrOH/VmjF6JL3VjsPjmLEKEKsu+1rclmrR0yN4V+YJ6BaNlq0vkFReZdN
 8Q0fTfF8nYBoE2z50jLzoO9hUCIjBbEJ+x1VA/kNw8MCftsQjcvJyA4sC8nSWEjjYt8HNB7ntiP
 Zw0bu7sNb+jHDXX8c7Q==
X-Authority-Analysis: v=2.4 cv=DJSCIiNb c=1 sm=1 tr=0 ts=69ce3ad2 cx=c_pps
 a=WeENfcodrlLV9YRTxbY/uA==:117 a=FpWmc02/iXfjRdCD7H54yg==:17
 a=IkcTkHD0fZMA:10 a=A5OVakUREuEA:10 a=s4-Qcg_JpJYA:10
 a=VkNPw1HP01LnGYTKEx00:22 a=u7WPNUs3qKkmUXheDGA7:22 a=gowsoOTTUOVcmtlkKump:22
 a=sfOm8-O8AAAA:8 a=EUspDBNiAAAA:8 a=6HfXokFIjMK-uoYlQTEA:9 a=QEXdDO2ut3YA:10
 a=kacYvNCVWA4VmyqE58fU:22 a=TvTJqdcANYtsRzA46cdi:22
X-Proofpoint-ORIG-GUID: powwj83h1oUYU68e_mnzkV_Pp1fcnWpH
X-Proofpoint-GUID: powwj83h1oUYU68e_mnzkV_Pp1fcnWpH
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1143,Hydra:6.1.51,FMLib:17.12.100.49
 definitions=2026-04-02_01,2026-04-02_01,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 priorityscore=1501 suspectscore=0 bulkscore=0 clxscore=1015 malwarescore=0
 adultscore=0 impostorscore=0 spamscore=0 lowpriorityscore=0 phishscore=0
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.22.0-2603050001 definitions=main-2604020087

On 4/1/26 10:40 PM, David Heidelberg via B4 Relay wrote:
> From: Petr Hodina <petr.hodina@protonmail.com>
> 
> Add framebuffer for early console and u-boot support.
> 
> Signed-off-by: Petr Hodina <petr.hodina@protonmail.com>
> Signed-off-by: David Heidelberg <david@ixit.cz>
> ---

Reviewed-by: Konrad Dybcio <konrad.dybcio@oss.qualcomm.com>

Konrad
