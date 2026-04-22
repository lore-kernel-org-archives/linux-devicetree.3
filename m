Received: from mx0a-0031df01.pphosted.com (mx0a-0031df01.pphosted.com [205.220.168.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 3092863CB
	for <devicetree@vger.kernel.org>; Wed, 22 Apr 2026 12:09:06 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.168.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1776859748; cv=none; b=rZBlUs8LdbrvV7IsX/n3wHuFQbBA9+GhhoLRZcxrwcCWKt1lShWTamrqWBquzK52PoFfZwnlbDR+TK5EPRjHPybf0GO3qykZcuRp6jqihqaOMhyH99Z8buWO02ANMecn2nAc8VvQOpZmkU3whvd37kvQvUFnbSzWGeCZEB/2kJc=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1776859748; c=relaxed/simple;
	bh=rkpzELTHSMQVWEDTS/DB8PCFWa4LcrJoQ1walneRFuk=;
	h=Message-ID:Date:MIME-Version:Subject:To:Cc:References:From:
	 In-Reply-To:Content-Type; b=a6nooA5YTydpU1ippDy4iPK9i945Lde0RmISOX1SS33JU+gd3E/nWh0tiRNO3KLIZ10G6kQ197Nb5bwGAaWO5psTvIFPm3uOPRusgkvbkZlizDsqrj7mEOQ3+e9js95bq4FwX+nYh1z+xgN+aLy/tY5TTNEnRz0DuvEEYSGa9cE=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=C7ZzoD4i; dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b=LUHU377+; arc=none smtp.client-ip=205.220.168.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b="C7ZzoD4i";
	dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b="LUHU377+"
Received: from pps.filterd (m0279866.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 63MAUi8A976177
	for <devicetree@vger.kernel.org>; Wed, 22 Apr 2026 12:09:06 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	XNk4QN3YW6vbU0Ii//q4orZgJmHzUebQDz2tV23pLlM=; b=C7ZzoD4i+iCJeGr3
	EyxoR5zOMV1FGS757/lXb4BGExSEINUIRCqojtJhS/8AUAwZVjUXdt8PTBCLWQEC
	bRUmojTFWldy0DJtgQNWXEy4qz9l/zGIMPHIAhJFj7FWiVUaaFShg01yWHTsT3vq
	O7jQg3twxfpH6N2AUuR4doDTt6BfFybH6s6kQGx2YYkhjCo9qpiyeg+elR3LlLD5
	a9w1DJWMbKn9ZCven2YxisPBlx2mRdycqxeZXC4e+uzDw6DiVIOa9OmHT5SR/M5b
	G2RDh14QTIn3nA3onOLH6aVSOizzlSo5sKWRY+US4ztt5bd1hdImU1yOhz1erHCa
	Kana0g==
Received: from mail-vs1-f69.google.com (mail-vs1-f69.google.com [209.85.217.69])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4dpenebbqg-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <devicetree@vger.kernel.org>; Wed, 22 Apr 2026 12:09:06 +0000 (GMT)
Received: by mail-vs1-f69.google.com with SMTP id ada2fe7eead31-61060ad8deeso270686137.1
        for <devicetree@vger.kernel.org>; Wed, 22 Apr 2026 05:09:06 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1776859745; x=1777464545; darn=vger.kernel.org;
        h=content-transfer-encoding:in-reply-to:from:content-language
         :references:cc:to:subject:user-agent:mime-version:date:message-id
         :from:to:cc:subject:date:message-id:reply-to;
        bh=XNk4QN3YW6vbU0Ii//q4orZgJmHzUebQDz2tV23pLlM=;
        b=LUHU377+btEXE8jcD9/+Mzfc8rJ48E9BGXdoyjTHAoinl2krvP8fnJ+YNBhub/MwOM
         stK8rJharA9G0B/7rA4i4FLd6u1kIgUp7JJXx+X/PHq7LvFcvaQfa8LXYPVBhy2wrjp+
         WVH1VmfXTh6bGg6ltdn+6210cS8xyOXLhSOMCSgU3W38tQXkLie7e0E1eNzm5+tZ2As3
         bxI2qO7Cn7NWks2Toee9dIY3zS03G05JEPZny/1u4yR7/sIqct2nf49BQwdqJL3B1i9A
         hbX6RLT0050KzJsx80Cirfvzttl3YPDNqCofdkj58JKlT/9Dlm+S+KakWqLFzG14RMgy
         +NhA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1776859745; x=1777464545;
        h=content-transfer-encoding:in-reply-to:from:content-language
         :references:cc:to:subject:user-agent:mime-version:date:message-id
         :x-gm-gg:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=XNk4QN3YW6vbU0Ii//q4orZgJmHzUebQDz2tV23pLlM=;
        b=aBEWvX06FrXqi4a2YtB9dDUYL7+qlD70zmO7VhmCMftnDo06lJWslyWlat1A2gs/1J
         5e8zPLjSU9FwyI00K+l/QMW4jN5aeLXtTviu5JlvC25jYe7led+cp3BOiyuSwmSvx6ZO
         aWRy7Mxx3g5zefBwzEdGRQDMxQ4IGocXPyPHlZGSjdMXPH1j17mYBi6hiKF1WMzVjHos
         YmPIHfnZmX4FCz7NOfg82+n71L6OdSy4irj06eQ6ARQrkHzQ1txUrFXxKtQQH2pLSs+J
         T5JDtMDL52aOSZbYPgihwO2c6jrxJsWsPzTK72vEKIdSyu5fad+scNVIjXbyrDfkcDFS
         JlAA==
X-Forwarded-Encrypted: i=1; AFNElJ8DnpuFSQ53U5gvBH9EMiDXBXF9WkZWpnfiYgifaAyMtj0kExaxiJkj9tlxJ23MRzTmcFM0H1skstzH@vger.kernel.org
X-Gm-Message-State: AOJu0Yy1jH3aQm3uwVzibcWL09BmNj440pXNybK5JrjttKI+BUttrbJp
	fUvCU29Ab8t2A7kZ0bo0UjziN3MMcn8PiJFyWtV6PpMJLIoJDHxtgmk+Nf8bQu5tavVsJ0SkXDK
	YA5hXgTfc2+pn8QWnuIT1P2LjuLSYqn4d1JtGcvrgXmO/asSqWJU6j04c9GJD9xo9
X-Gm-Gg: AeBDietCnmpvu307jO8sZGJx1eMvUxgecZfQqN0rTV/gdZzNMOVFpOWQZsCyXuoz4P3
	Yw/UAo4Ucv3IiBo5rbaRLlt4548HT3gGRd1GNZIWFY/EBPrJ3D2AbC68CnrbO9SYq00fbBT7wVe
	6kPOpvkwPdr/arI/xUHzz5Nx6MBi597kVAEhfJmpqesM+G3dy8mh/45R/Fky8IJlSW9gGuJgHet
	IeaXJQ7GBNwaQ8EO4olGRoigm56DzVPKtmznwADPzD4/HkA9J8hxK2cKqR+w2V3yOSnA3Vx79fI
	YJ/N9Zdoj5G4Snt5t/r5dlZOpDwnDu6px9vlZ1uugmCMeDBA54mADK/OxVDlg3jSuNStZcj5p2c
	COwBxt0jsgqf0Nzh2e8Jvx9LtMn2DmdKFvtGbFRAOOvjwtehLzgNKil71zjnert93UXUxYIxOy+
	bjsytXD77DMaz57A==
X-Received: by 2002:a05:6102:2274:b0:611:5761:a3dc with SMTP id ada2fe7eead31-616f70f119emr3302739137.5.1776859745403;
        Wed, 22 Apr 2026 05:09:05 -0700 (PDT)
X-Received: by 2002:a05:6102:2274:b0:611:5761:a3dc with SMTP id ada2fe7eead31-616f70f119emr3302720137.5.1776859744984;
        Wed, 22 Apr 2026 05:09:04 -0700 (PDT)
Received: from [192.168.119.254] (078088045245.garwolin.vectranet.pl. [78.88.45.245])
        by smtp.gmail.com with ESMTPSA id a640c23a62f3a-ba455046429sm538380666b.50.2026.04.22.05.09.02
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Wed, 22 Apr 2026 05:09:04 -0700 (PDT)
Message-ID: <a50ad3be-a4d4-42d7-8680-0e7fdf01443f@oss.qualcomm.com>
Date: Wed, 22 Apr 2026 14:09:01 +0200
Precedence: bulk
X-Mailing-List: devicetree@vger.kernel.org
List-Id: <devicetree.vger.kernel.org>
List-Subscribe: <mailto:devicetree+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:devicetree+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v2] arm64: dts: qcom: talos: Add memory-region for audio
 PD
To: ekansh.gupta@oss.qualcomm.com, Bjorn Andersson <andersson@kernel.org>,
        Konrad Dybcio <konradybcio@kernel.org>, Rob Herring <robh@kernel.org>,
        Krzysztof Kozlowski <krzk+dt@kernel.org>,
        Conor Dooley
 <conor+dt@kernel.org>, quic_bkumar@quicinc.com,
        quic_chennak@quicinc.com, dmitry.baryshkov@oss.qualcomm.com
Cc: linux-arm-msm@vger.kernel.org, devicetree@vger.kernel.org,
        linux-kernel@vger.kernel.org
References: <20260419-talosaudio-v2-1-3a3b5dd67dd4@oss.qualcomm.com>
Content-Language: en-US
From: Konrad Dybcio <konrad.dybcio@oss.qualcomm.com>
In-Reply-To: <20260419-talosaudio-v2-1-3a3b5dd67dd4@oss.qualcomm.com>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYwNDIyMDExNiBTYWx0ZWRfXxFwR5HM0ARwx
 686yb20pS1mnL8f3Eg183N2GnjxRicoN1ydjYDZbkPGu8Jqj73RN8Qk8kjysWP0sqOvut5ekFPY
 o8+F0m/KmyJWbIrEJMGpQTGJOAgsM7nWh5SP2FyhLvt7ewcbiFvKLTzi0xpu0pTnhPhj0WfwG1C
 GkfJKatJMKFIc3uALzg8ckmPvj6MAkyLKyGanBWTnul8usaqMI/P3WpJYMql7oTehP6Cl91ZRVB
 a86Gp65PRon1dK/9qd3OYqMQWSricDqn7Gi9g+mu/8RcypM0XpOqOExEnNzVeZyfm7nkoG+Sqjv
 L5eJmwSxHDAKuzi3PjkMeOdoA4207v9j+hutU/DZVEBEJZEU2CoqjUIT3f4cAYarmuNIydQ1KjP
 d4+g61hISuuz2iwV9hR0uZn3eDUG7f6oIf5LArGTfBUGbGS0G2pJdWK8bG/Z3/Zl5ribKIoTwL5
 r2Z08s5cfQXWWZaqT7g==
X-Proofpoint-GUID: ZBMIbYpZzNlSpmLouA_1ArYakjD0YtAr
X-Proofpoint-ORIG-GUID: ZBMIbYpZzNlSpmLouA_1ArYakjD0YtAr
X-Authority-Analysis: v=2.4 cv=RoT16imK c=1 sm=1 tr=0 ts=69e8ba62 cx=c_pps
 a=5HAIKLe1ejAbszaTRHs9Ug==:117 a=FpWmc02/iXfjRdCD7H54yg==:17
 a=IkcTkHD0fZMA:10 a=A5OVakUREuEA:10 a=s4-Qcg_JpJYA:10
 a=VkNPw1HP01LnGYTKEx00:22 a=u7WPNUs3qKkmUXheDGA7:22 a=YMgV9FUhrdKAYTUUvYB2:22
 a=VwQbUJbxAAAA:8 a=EUspDBNiAAAA:8 a=3lRBOYp6YGeNuEZCnNoA:9 a=QEXdDO2ut3YA:10
 a=gYDTvv6II1OnSo0itH1n:22
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1143,Hydra:6.1.51,FMLib:17.12.100.49
 definitions=2026-04-22_01,2026-04-21_02,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 clxscore=1015 spamscore=0 impostorscore=0 lowpriorityscore=0
 priorityscore=1501 phishscore=0 adultscore=0 bulkscore=0 suspectscore=0
 malwarescore=0 classifier=typeunknown authscore=0 authtc= authcc=
 route=outbound adjust=0 reason=mlx scancount=1 engine=8.22.0-2604200000
 definitions=main-2604220116

On 4/19/26 9:41 AM, Ekansh Gupta via B4 Relay wrote:
> From: Ekansh Gupta <ekansh.gupta@oss.qualcomm.com>
> 
> Reserve memory region for audio PD dynamic loading and remote heap
> requirements. Add the required VMID list for memory ownership
> transfers.
> 
> Signed-off-by: Ekansh Gupta <ekansh.gupta@oss.qualcomm.com>
> ---
> Changes in v2:
> - Fixed VMID list alignment.
> - Link to v1: https://lore.kernel.org/r/20260418-talosaudio-v1-1-585ab22faaf4@oss.qualcomm.com
> ---
>  arch/arm64/boot/dts/qcom/talos.dtsi | 9 +++++++++
>  1 file changed, 9 insertions(+)
> 
> diff --git a/arch/arm64/boot/dts/qcom/talos.dtsi b/arch/arm64/boot/dts/qcom/talos.dtsi
> index ff5afbfce2a4..f71b327c7ddf 100644
> --- a/arch/arm64/boot/dts/qcom/talos.dtsi
> +++ b/arch/arm64/boot/dts/qcom/talos.dtsi
> @@ -11,6 +11,7 @@
>  #include <dt-bindings/clock/qcom,qcs615-videocc.h>
>  #include <dt-bindings/clock/qcom,rpmh.h>
>  #include <dt-bindings/dma/qcom-gpi.h>
> +#include <dt-bindings/firmware/qcom,scm.h>
>  #include <dt-bindings/interconnect/qcom,icc.h>
>  #include <dt-bindings/interconnect/qcom,osm-l3.h>
>  #include <dt-bindings/interconnect/qcom,qcs615-rpmh.h>
> @@ -657,6 +658,11 @@ pil_gpu_mem: pil-gpu@97715000 {
>  			reg = <0x0 0x97715000 0x0 0x2000>;
>  			no-map;
>  		};
> +
> +		adsp_rpc_remote_heap_mem: adsp-rpc-remote-heap@97717000 {
> +			reg = <0x0 0x97717000 0x0 0x800000>;
> +			no-map;
> +		};

Is this for the QLI-QCS615 memory map, or LA-SM6150? I think it's
right for the latter, but I'm not super sure.

Plus, like we talked in another thread, I'm not sure this matters (dep
on whether UEFI reserves it?)

Konrad
