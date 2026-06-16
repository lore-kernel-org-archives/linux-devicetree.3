Received: from mx0b-0031df01.pphosted.com (mx0b-0031df01.pphosted.com [205.220.180.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 8135542B738
	for <devicetree@vger.kernel.org>; Tue, 16 Jun 2026 10:27:23 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.180.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1781605644; cv=none; b=Nn92X+3MfztcYJipEzKLl6bDiQjIGBBFCv/kmHTFoTB8eUWv5VXFFqXBB/vshPzNwI+FJ68ATkQOv5gLo+d2Quwif0+0Gd19bxbtpX68j9Tm/lBhaZNfKcrqtp4dR59irlvehWtsIUtNrGA3S4gPTlL0wfjZ08658VAKVjVBrtg=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1781605644; c=relaxed/simple;
	bh=QMo3iSUBVZbXVK3uwB583SZFQY/wSl9nL8ZZ5XuBugo=;
	h=Message-ID:Date:MIME-Version:Subject:To:Cc:References:From:
	 In-Reply-To:Content-Type; b=uNYIVMkNIO+c2Kz1TV0T0/OrQ3eb3O95a51zsAn6/b3PgoUXAyeD6vemix1/4X7fI7LjUHFcbjJcyhkh+BiyfuAlqxJIxwJRgAtb+oUB9WAeXGvX45vAmGOqetTXYjhRaNjS0N3L1wSZFjRZiQNIB+AZW1es7dkzkzMA/nGYHMU=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=jzmPgDiT; dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b=a4/65cZY; arc=none smtp.client-ip=205.220.180.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b="jzmPgDiT";
	dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b="a4/65cZY"
Received: from pps.filterd (m0279873.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 65GACI3c3411101
	for <devicetree@vger.kernel.org>; Tue, 16 Jun 2026 10:27:22 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	Xfl7YUDOtyUDhv9IockQhbr+f+EP3g53NkHVlg+iaEw=; b=jzmPgDiTIV/kyDSn
	QxQ55kQeJcp/0gJjC/9zdSfF/zsfyIb0SdZEmXQ3PwVfAuSTU20+DoQAG6+8kTgo
	Q0EGd43ttYS7DnSHV/AnXfqdmD/nREPmUCTc7uvQS4I37GMbIUa8l+boO4xpagbH
	KdAcFpJ1xcl1BHgx46CJA84uR6UtPrutsV1I3YF0LF+Y5mJ26DMHfpxtpS5dpfcY
	42GgnFRVR82fXV/67mZNvquo2uaK7zqFrISQX+37VcSeu6KjUnpXYTZS9g5CxGWy
	ReMrJdnvb/nXotHJeRV0fBTomLY81r/NVtUhxkwlvyPrfutsP6cI+vYwCv7qiCDU
	W+l1NA==
Received: from mail-qk1-f197.google.com (mail-qk1-f197.google.com [209.85.222.197])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4eu09g9866-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <devicetree@vger.kernel.org>; Tue, 16 Jun 2026 10:27:22 +0000 (GMT)
Received: by mail-qk1-f197.google.com with SMTP id af79cd13be357-915a4ca0a4aso45188085a.1
        for <devicetree@vger.kernel.org>; Tue, 16 Jun 2026 03:27:22 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1781605642; x=1782210442; darn=vger.kernel.org;
        h=content-transfer-encoding:in-reply-to:from:content-language
         :references:cc:to:subject:user-agent:mime-version:date:message-id
         :from:to:cc:subject:date:message-id:reply-to;
        bh=Xfl7YUDOtyUDhv9IockQhbr+f+EP3g53NkHVlg+iaEw=;
        b=a4/65cZYCSi2kAekvL/zUyWeedulEH1ANCyb3eqRUtVH8VfCTcm9HsMlFfeeSpEqgA
         fKh8hSzF2+L7StLIpGV1lDszEKcv6ErlNPQs/zM+rQ5+bBlePzhvzcZbOzRpzTgcyz3b
         juPVNarrA4Q0uY1N1eo+lP/WDFZMPzAKfzPvPA/OBw31TDJMv2jS6q1mF/ge8JNlv0DB
         njpGx9KhBFTGW5OaKT5mLprIL1jBHRw1e0TTLFBwano0iKDtU8AEX0xjCNsW9EQVL4Nv
         mOBh00dSw0kFK9PDjv7k0cgrvHwMt1qNUSxSgShXogWIWdjg4mWvDG+GXPqXu1r7PTbA
         J28g==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1781605642; x=1782210442;
        h=content-transfer-encoding:in-reply-to:from:content-language
         :references:cc:to:subject:user-agent:mime-version:date:message-id
         :x-gm-gg:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=Xfl7YUDOtyUDhv9IockQhbr+f+EP3g53NkHVlg+iaEw=;
        b=ex+asU+SajZGvdo72pHOL9oR/DXF/iBa5AvjScPz82ngBl3ew7KajT+QDhcbEhVABy
         XFJj/oL22rTqHL+LV1h8szUe/0zK/tppVI/e0jvobD8JBAd3/spRikyvEx8ghZON/X46
         aDJxaZ0ElrT4f+oTVnIAK1PmF6knRqvmBXcP5Yfnxt913O5bvAcLX6dMfEyqxNh1xJ1Z
         iFRljCbCSqWDlprqMdus8CXHI2pmi3FbjGtfqLNUeM+C0X+Z9prF5h/Hh53NH/gjCYDL
         hrn4I5ezWA/l3ys2kIuMj7vuuQJNbENIny1GLbPhYtObF+Z3YSmA+4r8oLNePRsrRayk
         Z/ow==
X-Forwarded-Encrypted: i=1; AFNElJ+MtHzEHjj8GmgFx5ajDXNC51Y1HXJ1V563pubUw6cuNAQRVu0A0O+vJ0i4Y+z1//OGhMpVVJ2aAnip@vger.kernel.org
X-Gm-Message-State: AOJu0YxazS3jz0mfPzwh52IRgcxcl6TWKvwzH342oN2I9DKaLY1RoPaK
	IcvqcXEOxzeSkLZbRJHZZHms5oWf2IFU8RBwsuo1cwCCh0l/8o0Yx2Os7f8fZQ+8j2cpSw4kuGW
	0vzO9ozWrr7SvvVUXejlgc/L7b943uV7SgyAuYMQwg9yuQuwwS85x3TUQ1IBwJwa1
X-Gm-Gg: Acq92OGF2wVO7PB8sUjXfUxBMS9ZCk/BkIWrlVgdrBQNZigbXGUctuf+QbRucqXhXNn
	AqXzHwgGSzRKnLHD/qyaKcwwti4eZgJtCwnU9MYKX3zmgvjuUus0x+NUQAV1vh2OXwN8rFRHMlt
	sC3dLYBTPBzBU0evU6oF70RMsaKgnupxmvz7fVzWb3pA7jSq32AKBka750kS/NzjAXEkvRo1X+d
	3/07nUNWVkn+MBpOpG2+kKJuIguevFrhN8LlF/JUO8/5jbHrbhC2NlXR4SyNPXhGCUqdsGQsCtf
	bE6CtC3mdL4mR1FueGc8FASVZqlPZvPCKhmXjgy4N8r7/GdAZxc8uMH6ycvKYIoV+ZN3HMwfeMB
	jywbDSXA55AZISCmDle4jXmrACEl2hvmoAvV55ruXmDtrHg==
X-Received: by 2002:a05:620a:c4d:b0:915:4ca0:1210 with SMTP id af79cd13be357-9161bc725a3mr1758231485a.3.1781605641738;
        Tue, 16 Jun 2026 03:27:21 -0700 (PDT)
X-Received: by 2002:a05:620a:c4d:b0:915:4ca0:1210 with SMTP id af79cd13be357-9161bc725a3mr1758229785a.3.1781605641290;
        Tue, 16 Jun 2026 03:27:21 -0700 (PDT)
Received: from [192.168.120.170] ([178.235.128.140])
        by smtp.gmail.com with ESMTPSA id a640c23a62f3a-bfdb8e209f0sm610213066b.57.2026.06.16.03.27.18
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Tue, 16 Jun 2026 03:27:20 -0700 (PDT)
Message-ID: <6b3155ea-b583-4f82-8313-7a057fd78066@oss.qualcomm.com>
Date: Tue, 16 Jun 2026 12:27:17 +0200
Precedence: bulk
X-Mailing-List: devicetree@vger.kernel.org
List-Id: <devicetree.vger.kernel.org>
List-Subscribe: <mailto:devicetree+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:devicetree+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH 4/4] arm64: dts: qcom: Add PMIH0108 haptics device node
To: Fenglin Wu <fenglin.wu@oss.qualcomm.com>, linux-arm-msm@vger.kernel.org,
        Dmitry Torokhov <dmitry.torokhov@gmail.com>,
        Rob Herring <robh@kernel.org>,
        Krzysztof Kozlowski <krzk+dt@kernel.org>,
        Conor Dooley
 <conor+dt@kernel.org>, Lee Jones <lee@kernel.org>,
        Stephen Boyd <sboyd@kernel.org>,
        Bjorn Andersson <andersson@kernel.org>,
        Konrad Dybcio <konradybcio@kernel.org>
Cc: David Collins <david.collins@oss.qualcomm.com>,
        Subbaraman Narayanamurthy <subbaraman.narayanamurthy@oss.qualcomm.com>,
        Kamal Wadhwa <kamal.wadhwa@oss.qualcomm.com>, kernel@oss.qualcomm.com,
        linux-input@vger.kernel.org, devicetree@vger.kernel.org,
        linux-kernel@vger.kernel.org
References: <20260616-qcom-spmi-haptics-v1-0-d24e422de6b4@oss.qualcomm.com>
 <20260616-qcom-spmi-haptics-v1-4-d24e422de6b4@oss.qualcomm.com>
Content-Language: en-US
From: Konrad Dybcio <konrad.dybcio@oss.qualcomm.com>
In-Reply-To: <20260616-qcom-spmi-haptics-v1-4-d24e422de6b4@oss.qualcomm.com>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYwNjE2MDEwNSBTYWx0ZWRfX3ReY2MXXPYyQ
 iGNHTh2h/YZ7yIp8TPT80By+bLWYYZ24TiQKisWR2g7UZVHkjFJhS8HKxwzXxI0//QvfJGJO4Or
 2k//oWjuFQOAaoRi9BMcsuKLAuTz3UMWKC/5KY765upjVZH4bye8k2IEL3z+h3J8kUa20/PhMMQ
 wrQ1PuYuvZcssrvLgTrCeKuGvNcCBjJ6NxtVIO0HW+KpYrCkecJA0W/BgjEgAr5/kV0jrF3UZRQ
 SHn/HFZoAW66CBazzJn5yJ/FtW1HgWdoTJAxg1NqrPY22VX911N9CzJMDAUawWFTOF0n9lG4GKl
 xEGC1JBnrccZVWkbKqIP5WpcA7i5O4MaEeidEqeWeOHjSqm/7G+zMaxEnnRSuqlk8/5RaJzzSeQ
 1cb+pZWnIjj7L4rYGskeHjgtWf0V1KVWIWTTef25jY1aPrmQoVLb8iJ815rQBRwDAOV87mOrJMx
 9aUi/3FhDPmpjpnba2Q==
X-Proofpoint-ORIG-GUID: hYFzm6KNiqXFOD_pTGsLY9rrJsFXE2vu
X-Proofpoint-Spam-Info: AW1haW4tMjYwNjE2MDEwNSBTYWx0ZWRfX0CR6kxE5BHU4
 wbVNPAwSCKvhyYTfv0huBxmYFW+ZejqYKBLJwA3GTCa6t4uxpRIal49n2DMpVcrSEdPC6RXyCNS
 y7Pu5RvvuZ6XcqkihIYKbWjz2eKmR2Q=
X-Authority-Analysis: v=2.4 cv=DLa/JSNb c=1 sm=1 tr=0 ts=6a31250a cx=c_pps
 a=50t2pK5VMbmlHzFWWp8p/g==:117 a=PRfkaYvzSr8QmIIGAkY2Sg==:17
 a=IkcTkHD0fZMA:10 a=FelO9ux0wxsA:10 a=s4-Qcg_JpJYA:10
 a=VkNPw1HP01LnGYTKEx00:22 a=u7WPNUs3qKkmUXheDGA7:22 a=rJkE3RaqiGZ5pbrm-msn:22
 a=EUspDBNiAAAA:8 a=WGoPKrXAnCDrgKufU7AA:9 a=QEXdDO2ut3YA:10
 a=IoWCM6iH3mJn3m4BftBB:22
X-Proofpoint-GUID: hYFzm6KNiqXFOD_pTGsLY9rrJsFXE2vu
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1143,Hydra:6.1.125,FMLib:17.12.100.49
 definitions=2026-06-16_03,2026-06-15_04,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 impostorscore=0 lowpriorityscore=0 clxscore=1015 spamscore=0 malwarescore=0
 priorityscore=1501 phishscore=0 suspectscore=0 bulkscore=0 adultscore=0
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.22.0-2606040000 definitions=main-2606160105

On 6/16/26 12:08 PM, Fenglin Wu wrote:
> Add haptics device node in the PMIH0108 PMIC base dtsi files, and enable
> it on several boards according to the LRA (Linear Resonant Actuator)
> component mounted on each of them.
> 
> Signed-off-by: Fenglin Wu <fenglin.wu@oss.qualcomm.com>
> ---
>  arch/arm64/boot/dts/qcom/kaanapali-mtp.dts       | 7 +++++++
>  arch/arm64/boot/dts/qcom/kaanapali-qrd.dts       | 7 +++++++
>  arch/arm64/boot/dts/qcom/pmih0108-kaanapali.dtsi | 9 +++++++++
>  arch/arm64/boot/dts/qcom/pmih0108.dtsi           | 9 +++++++++
>  arch/arm64/boot/dts/qcom/sm8750-mtp.dts          | 7 +++++++
>  arch/arm64/boot/dts/qcom/sm8750-qrd.dts          | 7 +++++++

One commit per board, please

>  6 files changed, 46 insertions(+)
> 
> diff --git a/arch/arm64/boot/dts/qcom/kaanapali-mtp.dts b/arch/arm64/boot/dts/qcom/kaanapali-mtp.dts
> index 07247dc98b70..7e3f59fc008e 100644
> --- a/arch/arm64/boot/dts/qcom/kaanapali-mtp.dts
> +++ b/arch/arm64/boot/dts/qcom/kaanapali-mtp.dts
> @@ -952,6 +952,13 @@ wifi@0 {
>  	};
>  };
>  
> +&pmih0108_e1_haptics {
> +	status = "okay";

'status' should go last

> +
> +	qcom,lra-period-us = <6667>;
> +	qcom,vmax-mv = <3600>;

Do these properties depend on the physical characteristics on what's
connected to the other end of the haptics driver?

Konrad
