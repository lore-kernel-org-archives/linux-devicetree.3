Received: from mx0b-0031df01.pphosted.com (mx0b-0031df01.pphosted.com [205.220.180.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 2D3AB3D171E
	for <devicetree@vger.kernel.org>; Wed, 20 May 2026 10:09:50 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.180.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1779271792; cv=none; b=m4+Ky44ZnNp0jLB2cDvmH17bUHSgiEQ2miXos+PJTw2eW89gZyFpuDkIkqGOpLUUTWXBuirPYSZf28/wpWPLAJqXAJNVPqlLD2W3WwZyENqe/HaCit+lg4oS4Gn9R3+jpLZHizmHI47jwjZMIlJEOKM5cUfHPIQG5/Q0u/Az1vc=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1779271792; c=relaxed/simple;
	bh=Hb8Ru3Ec5tQFrqQePI5nyGJln9JvgH9I3bGx/nz8IAQ=;
	h=Message-ID:Date:MIME-Version:Subject:To:Cc:References:From:
	 In-Reply-To:Content-Type; b=XJHwb2JIaGv/Oyz9pEV8gnQEZYKe9T+DPgsxECnb0kl1IBUJw4kEh4uXCn5tbCH6Z0xnDrz9B9bn79YmCedFcHXLk81fxk4f0ZStr/4zeyFZjfSC01/yPZ9QivcwVwcVuPn4Pjt8lPiv2gvnKOQqgzvCok9VBHwOE/UHB3ftewo=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=K3ErrWh6; dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b=iX/paOfQ; arc=none smtp.client-ip=205.220.180.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b="K3ErrWh6";
	dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b="iX/paOfQ"
Received: from pps.filterd (m0279869.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 64K7OlFo341433
	for <devicetree@vger.kernel.org>; Wed, 20 May 2026 10:09:49 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	ChH+YiH1DkMdV42pQD6rWpCy1qsIy2yrGYnw2f4wJEo=; b=K3ErrWh67GfXqK2y
	WDXI8uJ/fuPbhjpQ88ROzzd8yFVc2kOayZykeyS2X/pn6gWlqsqfAzLr/37jCpIT
	TuNAKN+b35qttz+vyCv4WFo8EnAT2fvkkSwwuvlMr0EEGsePABulr6bn3lg5XLbV
	TGVLkxYYoZ5iO4Z4RRyVasZ80bCsTfyasnajjZ1AT8NGosazHvAIzlFIdG6hGgXV
	cTCSPbrx8mDdyiZhAun6Ft9elLAcrOfwSq2B1Au36IaEVY5Xvyaqa+XWHFArhjuY
	pzSmZm5S1eO/44lGq8yk2JkrQ7hdZEmNEpUM9/5644BayFGkkubDaKD+V3NMK0g0
	l02OSA==
Received: from mail-qk1-f197.google.com (mail-qk1-f197.google.com [209.85.222.197])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4e8t3vc6fk-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <devicetree@vger.kernel.org>; Wed, 20 May 2026 10:09:49 +0000 (GMT)
Received: by mail-qk1-f197.google.com with SMTP id af79cd13be357-90f5edb7516so102106585a.3
        for <devicetree@vger.kernel.org>; Wed, 20 May 2026 03:09:49 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1779271789; x=1779876589; darn=vger.kernel.org;
        h=content-transfer-encoding:in-reply-to:from:content-language
         :references:cc:to:subject:user-agent:mime-version:date:message-id
         :from:to:cc:subject:date:message-id:reply-to;
        bh=ChH+YiH1DkMdV42pQD6rWpCy1qsIy2yrGYnw2f4wJEo=;
        b=iX/paOfQiJAKehSTkTklyxmjqhMMmvJWV5ew83QEQxk++d5lyfc7deo1OladvRi4Qo
         C9R4RXLcdxdG6PDWENn+J0eiWlF1H6ryHJuVRmOgOOar4aJWYDdLPud/YfdP7LO9XeC8
         jtR9Hh1KCq8eEc4lzAw2+LY0xfNSOQ/EODlwsJqNKGkA6++biYOpr5jaQATtVtODNsUj
         8nAh+HepqLgv9W+vFEyWQS+yM2I6I4nJz+AM4A1ydfWvQDaYbtwPlQNSPT/K5diswWAE
         wSDRPWboVVILe+uO8SkUcCU8DuGcj09YlG6oe6DjBHY0I7v+UkIF3oLchwHtOibc6fjp
         /xHA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1779271789; x=1779876589;
        h=content-transfer-encoding:in-reply-to:from:content-language
         :references:cc:to:subject:user-agent:mime-version:date:message-id
         :x-gm-gg:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=ChH+YiH1DkMdV42pQD6rWpCy1qsIy2yrGYnw2f4wJEo=;
        b=M5bdE21o8b8z3SNXwJYXrFyl9ZkadURlSEZgeAV8CyLnl0M6QH1UN1qOC4ERizuq46
         rLUwZkQEar8wtJa0NTQmSTVzHos5jrLY8OXUgyNY3gx03wSTXYcQ37ZZ8AUg+GpQEuD/
         OlwWnMIIGCMnLfcwtkfGw0CpSE/V7PJyAOSPuSt6+1AqSXIKT+UrpCCbtpfngKU5cyDK
         b//1DA1fskSl1E1l+LJ6m3kP1aPS/J2fQWHUxkY390t/zDOhYqxQdGH/4EZl9opMtbRd
         gzyikx89w28of6NuPs1HL2/3GW1YFvFgiyKGYWD0PmdfEbCaQdzLjW5XkmqZ6+WD1/6d
         wyKQ==
X-Forwarded-Encrypted: i=1; AFNElJ9bbI9F61k95Kiub6LCl2d48pPpzZVuuOPUtMoDSVaq0QjkszzjQmXom3cNBJpl4SuVlK2PjF0f4bFf@vger.kernel.org
X-Gm-Message-State: AOJu0Ywu0mJvScynrLibHNFRr7YIf3sCWVr6gQZ+Cuo/uRAKP1DQyma9
	bww2hLlAWGizxHY+KGrLKKjLEfo9OtrA8j07eM46utKRq7Vqwf9RrjrEEQB7sukmqe8zps7e9tH
	6KfUucM8uuELv44NTgiGb0ff8ZlHQ5yqi5Cgszqe1GWasyPSf7oaORxPxGqoBr5TA
X-Gm-Gg: Acq92OEY97N1dO10xQFXbi4FDOUSfrODK74u3zmR91ssubKa0Ye2eeY5j0n/Q7K52tu
	Q/T5zZNgTFQYWTncP00EaV5+grT53P9GxTzjj9MlNOtrxKgP9Zj4cO1hAky9uR+4Y3TKGWLGCAc
	Ixb1ItrmRvEvjZ2PNI/jUzrRcEzlhdYi5UFCA10CGXSoko5aWrujLFO3ZgLTVTNpKSz+z1oDYsG
	qrD4gKKRrueHDb7o7mSsArMuOMtjHXSA9/zy0t3rAMAjIdHySBqIvoO46p1P738RIW5sZ77BeDT
	2UMonjvT6/CML6Uo9oRcpXxSwhe6v6Kksc6PH0kfhgsGcYZg2hnSk9Z5rB1jbzTKINELqOyiq3R
	lpKnd+o4XmeAbPZFdLEs4tHi+QT8koaaMu9YoAfOsAeXv6wWtgGAUpsSR862xpzPhDvah3f+u0y
	1GK94=
X-Received: by 2002:a05:620a:1a22:b0:8cf:c757:f1d1 with SMTP id af79cd13be357-911d180c177mr2220752685a.8.1779271788786;
        Wed, 20 May 2026 03:09:48 -0700 (PDT)
X-Received: by 2002:a05:620a:1a22:b0:8cf:c757:f1d1 with SMTP id af79cd13be357-911d180c177mr2220749485a.8.1779271788355;
        Wed, 20 May 2026 03:09:48 -0700 (PDT)
Received: from [192.168.119.254] (078088045245.garwolin.vectranet.pl. [78.88.45.245])
        by smtp.gmail.com with ESMTPSA id a640c23a62f3a-bd4f4e4d54dsm830421966b.47.2026.05.20.03.09.46
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Wed, 20 May 2026 03:09:47 -0700 (PDT)
Message-ID: <967d8640-765a-4d23-8806-fb2f664ff3cb@oss.qualcomm.com>
Date: Wed, 20 May 2026 12:09:45 +0200
Precedence: bulk
X-Mailing-List: devicetree@vger.kernel.org
List-Id: <devicetree.vger.kernel.org>
List-Subscribe: <mailto:devicetree+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:devicetree+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH] arm64: dts: qcom: qcs6490-rb3gen2: add rmtfs node
To: Dmitry Baryshkov <dmitry.baryshkov@oss.qualcomm.com>,
        Bjorn Andersson <andersson@kernel.org>,
        Konrad Dybcio <konradybcio@kernel.org>, Rob Herring <robh@kernel.org>,
        Krzysztof Kozlowski <krzk+dt@kernel.org>,
        Conor Dooley <conor+dt@kernel.org>
Cc: linux-arm-msm@vger.kernel.org, devicetree@vger.kernel.org,
        linux-kernel@vger.kernel.org
References: <20260520-rb3g2-rmtfs-ipa-v1-1-8b3942ded279@oss.qualcomm.com>
Content-Language: en-US
From: Konrad Dybcio <konrad.dybcio@oss.qualcomm.com>
In-Reply-To: <20260520-rb3g2-rmtfs-ipa-v1-1-8b3942ded279@oss.qualcomm.com>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit
X-Proofpoint-GUID: 7A12Mx8coISqxOkJp9gQkcrKOl5ua6j3
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYwNTIwMDA5NyBTYWx0ZWRfXwK/QRtRJtGiL
 Ehz0g9UbuKkVPW+eFh6gW67VEGlhPat2CPWjmnpuTT53XbQCRC32g5eh/+r+V1cPF8dHSkwfx+W
 bmS2kHrLKfiSqvR287TezDMm6er1VT0yAWjwhTaTxvKV26JOl8EVBkUK2YxEUUt0iFO+3e+L3DB
 njAon76lRJdBiwowTSKqbTraDUU8HRUZ9MYxqCugyJOjd1Wmy1HwPeAXqVKDytWqKV/X4pHkW6q
 QRM0YVzeOdcIBYfeWFd+I6TQOaQem2E9HN4Pl4nwESV3Y8DzFUGu8EMfAsPylzsBI7NsKZHBL/b
 B1HrGTOTi4drO2eDriDOdTU1BFS5OzSyTn/nIyknUfZNsOouLizvtIxenARMQkjxBCjBoG6/NYv
 okur/fa7FvMfysLQ5+f9GImU0yKBr9GL0hXOTSMUtYLnet1JqRac2iOnAxNYihuVENpzWggcVTR
 5Nu7fGcfuA1FklMIeig==
X-Authority-Analysis: v=2.4 cv=JuPBas4C c=1 sm=1 tr=0 ts=6a0d886d cx=c_pps
 a=50t2pK5VMbmlHzFWWp8p/g==:117 a=FpWmc02/iXfjRdCD7H54yg==:17
 a=IkcTkHD0fZMA:10 a=NGcC8JguVDcA:10 a=s4-Qcg_JpJYA:10
 a=VkNPw1HP01LnGYTKEx00:22 a=u7WPNUs3qKkmUXheDGA7:22 a=_glEPmIy2e8OvE2BGh3C:22
 a=EUspDBNiAAAA:8 a=ol475T_WYazQVyRVlUEA:9 a=QEXdDO2ut3YA:10
 a=IoWCM6iH3mJn3m4BftBB:22
X-Proofpoint-ORIG-GUID: 7A12Mx8coISqxOkJp9gQkcrKOl5ua6j3
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1143,Hydra:6.1.51,FMLib:17.12.100.49
 definitions=2026-05-20_02,2026-05-18_01,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 bulkscore=0 suspectscore=0 lowpriorityscore=0 adultscore=0 clxscore=1015
 phishscore=0 impostorscore=0 malwarescore=0 spamscore=0 priorityscore=1501
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.22.0-2605130000 definitions=main-2605200097

On 5/20/26 11:54 AM, Dmitry Baryshkov wrote:
> Downstream kernels for RB3 Gen2 don't specify the RMTFS address, instead
> the kernel is supposed to allocate rmtfs buffers dynamically. The
> upstream kernel doesn't support dynamic allocation of RMTFS buffers, so
> use the fixed allocation. The RMTFS node (and corresponding interface)
> is required for the modem DSP to work (which otherwise would crash).
> 
> Signed-off-by: Dmitry Baryshkov <dmitry.baryshkov@oss.qualcomm.com>
> ---
>  arch/arm64/boot/dts/qcom/qcs6490-rb3gen2.dts | 9 +++++++++
>  1 file changed, 9 insertions(+)
> 
> diff --git a/arch/arm64/boot/dts/qcom/qcs6490-rb3gen2.dts b/arch/arm64/boot/dts/qcom/qcs6490-rb3gen2.dts
> index ceb68a890bf4..37a3b51323ce 100644
> --- a/arch/arm64/boot/dts/qcom/qcs6490-rb3gen2.dts
> +++ b/arch/arm64/boot/dts/qcom/qcs6490-rb3gen2.dts
> @@ -165,6 +165,15 @@ debug_vm_mem: debug-vm@d0600000 {
>  			reg = <0x0 0xd0600000 0x0 0x100000>;
>  			no-map;
>  		};
> +
> +		rmtfs_mem: memory@f8500000 {
> +			compatible = "qcom,rmtfs-mem";
> +			reg = <0x0 0xf8500000 0x0 0x600000>;
> +			no-map;
> +
> +			qcom,client-id = <1>;
> +			qcom,vmid = <QCOM_SCM_VMID_MSS_MSA>, <QCOM_SCM_VMID_NAV>;


Reviewed-by: Konrad Dybcio <konrad.dybcio@oss.qualcomm.com>

Konrad
