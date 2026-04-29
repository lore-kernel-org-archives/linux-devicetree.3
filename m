Received: from mx0a-0031df01.pphosted.com (mx0a-0031df01.pphosted.com [205.220.168.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id C5532219EB
	for <devicetree@vger.kernel.org>; Wed, 29 Apr 2026 03:58:38 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.168.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1777435120; cv=none; b=pfQvl3KLTkTPORjNmJUBV+QbOcP5zrYFmPsl2dq2/DGcup39fVmZbRczNYxwsCFizhyeROoDrPKlguSCWEMajbKMwv+kMwcAj+dWkMU9F9cPNhncGU29SaHOR0hWCd+rHO3oPby940Qoe3jWLuquPZHZJ87XrLolY9n6RQgTz+M=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1777435120; c=relaxed/simple;
	bh=ZCOByCBmJgU5tRotLIWofq3KXzb8k8G+0DVRt5ppUlk=;
	h=Message-ID:Date:MIME-Version:Subject:To:Cc:References:From:
	 In-Reply-To:Content-Type; b=PX1sWGs1W8tNWQw+wBLSXNGoXCkCZGvFbuXGjQkryJfLcPWeTA3VLB8DFUcTEb/fEizdGLZjfiM5RTJaZRC157f0ixLvF1/sUwoiyYDxJRu7b0ihi16G8mdh0/WfeGzTMTqbLzmmJGGP5RDPBzwDF+D8JiaCj+/eafyO5e16Ycw=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=eqvbxoc5; dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b=AdGdIrKI; arc=none smtp.client-ip=205.220.168.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b="eqvbxoc5";
	dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b="AdGdIrKI"
Received: from pps.filterd (m0279866.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 63T2gVwt3183971
	for <devicetree@vger.kernel.org>; Wed, 29 Apr 2026 03:58:37 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	E3kEYLGfACg2uadnFQdqQQ4tRsbnjuzhQmK8R76cMfA=; b=eqvbxoc5JxzEGYK3
	Z3LPORgme9LVEUOdCg6GUesvAfbnL11p6vaWo4T0AWiul/sH4A1pp7YTBWbkYN4F
	kz0f21vgUmH7KSy0BG+uhx+0fBv92POLKFyuZnRCWIwfrdNafuMuLOutu76Bk+uL
	DoC9WkR4nSHrYJZvzp8l7pwtrR4kSh6oti/CV/KNZmS6zUN4M+yhV/S210FIT7Rx
	Dh7FyxH6kBbYZs5nB72FiMMQi6ystl75Um7QJEpaxDDYIlwHJFO80EQbnrpu1Eua
	NpKn9/14FqIW1I0ASIA8quFAyBuMztuYcTxtIFCIuX7g0+Bi/bzerxOQuwMt5oVX
	wdF/6w==
Received: from mail-pg1-f198.google.com (mail-pg1-f198.google.com [209.85.215.198])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4du9em06vj-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <devicetree@vger.kernel.org>; Wed, 29 Apr 2026 03:58:37 +0000 (GMT)
Received: by mail-pg1-f198.google.com with SMTP id 41be03b00d2f7-c7985752be1so4887426a12.0
        for <devicetree@vger.kernel.org>; Tue, 28 Apr 2026 20:58:37 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1777435117; x=1778039917; darn=vger.kernel.org;
        h=content-transfer-encoding:in-reply-to:from:content-language
         :references:cc:to:subject:user-agent:mime-version:date:message-id
         :from:to:cc:subject:date:message-id:reply-to;
        bh=E3kEYLGfACg2uadnFQdqQQ4tRsbnjuzhQmK8R76cMfA=;
        b=AdGdIrKIa0MHJz+3HFVPxlVxBtINk9KbY19rWq2+H6KB4dNbhEmQ63WVgf7pbvYlvE
         S+czzQOCwEN90HbPorCyw9/huA6DGg6zGeJ8uGQO5avMDSqoCVF3KznjHVWHEEysFLQ7
         MKwqkjmWbyB/49e7D44N8l329vb8qSNYy7wgbyHJWpMOCisyt1dcPw0kVqIHvfDETGei
         G31Cb9kUgnhYutVZFOT9Yp3pgAtDLSegFqs4ReJYeT7JYHmZ6Uqs1jX+NvLUjkZB6WXg
         g8gE20frDp+IY6QwBT/RtKSeeOHwuboUcxmaCEq0SbV+nhihRuwukJ9HEi0d7T9mf+RJ
         yLQw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1777435117; x=1778039917;
        h=content-transfer-encoding:in-reply-to:from:content-language
         :references:cc:to:subject:user-agent:mime-version:date:message-id
         :x-gm-gg:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=E3kEYLGfACg2uadnFQdqQQ4tRsbnjuzhQmK8R76cMfA=;
        b=Lytdx0XOrjxwI1NTO2Y9eP3hAK+bWxarRXf1zOtlBGjylegAdHtL5IQwkSihd7MDQE
         OfzL0bhXUctnFNB5QC4OrQLKEb9Ayegn2bmWEUT+5gTCB4lxJNpCbCsJLeMaxgT4YO4X
         o0s9mvCK378qRmUaqX60zpMHBgmfsPYrZRQLmt6KZ7PQcbedfcCaMBocYRWh0laxY1eG
         4SyR6YXKiFWYjkz4vvdGDim4ZTnWBFBScORpKxgSk+A2sTryvuxCdK5oTvHMvRB1MrpO
         GJNrmh3wtjGiYOQpheZozbZ1FurgVSBarb1v74Y7IUqM979BBOXRyU7ojnFvuKGG8EzK
         oskQ==
X-Forwarded-Encrypted: i=1; AFNElJ/HihIKW3Y8YQbStdNvC9IXOLtMIKcAgAAgSONrEbKC7/DY8UiIcQJeFMLAcGR72LTt0c1DKJ2FPQm1@vger.kernel.org
X-Gm-Message-State: AOJu0YxI/x4vWf//fKHEh7UBt7MinVNQMorPLNfYMYjGHS4ixKvZCarW
	d8w7h2oU0TLbYM9PbLhNeFD7DwfVmkgMymml+mOFe7aaHqdHvQbpVHpwdjxZfnZ6QCxzrJi9++x
	kMUBpY4WPRv5ipc/UvcjFfj8hnBEOuFK3IAnx3x/rh3HEcPD6L9V7i6WUD/Hg+bWl
X-Gm-Gg: AeBDietGCfDI8SPOyGXwL0of91VPP0polv2xUy8UV18irABq3+yUI0RvAt76nOr8+Rm
	x0ZYNs8YoT0TTRxOiMvMnnp7EUgZILXJwHEa24jQMYPNX8EZwRJgq2ZLfLVW+v2RoKxEzSU4Xq4
	G2UJd0lGmPxIJAmarjZMRzt3G2lMafNox80ObwIQiyo2+cRjATZZ5wiXTeOHtpvodNiy0fBosSn
	xRxUIaa6w22ZLwtGmUk9OQJ5uOLCVwCf8aJ3M1wbcTMe4CAyKE8tpmEw8RoKLE3x9e9buiMt33/
	/6iV4Q8dMTbBFQXm8m+wUt3bYZWfnn1PZPVaz8UWgF9Gy6JWiZqeBV1dh/KFJzSa/PV6P5FfOw3
	h+61qiKKQl5t6Tzq2LAz3rGaZOWe6QOFx+rWGNmSgG5gkO9V0hk9uKa6EFDo1lkvguQoueEEiig
	==
X-Received: by 2002:a05:6a00:408d:b0:829:8942:2c93 with SMTP id d2e1a72fcca58-834ea5688acmr2079188b3a.9.1777435116652;
        Tue, 28 Apr 2026 20:58:36 -0700 (PDT)
X-Received: by 2002:a05:6a00:408d:b0:829:8942:2c93 with SMTP id d2e1a72fcca58-834ea5688acmr2079158b3a.9.1777435116101;
        Tue, 28 Apr 2026 20:58:36 -0700 (PDT)
Received: from [10.48.22.70] ([27.60.165.40])
        by smtp.gmail.com with ESMTPSA id d2e1a72fcca58-834ed85c411sm657051b3a.41.2026.04.28.20.58.30
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Tue, 28 Apr 2026 20:58:35 -0700 (PDT)
Message-ID: <6154cd65-1aaa-474c-8816-c48c1fb01b6b@oss.qualcomm.com>
Date: Wed, 29 Apr 2026 09:28:28 +0530
Precedence: bulk
X-Mailing-List: devicetree@vger.kernel.org
List-Id: <devicetree.vger.kernel.org>
List-Subscribe: <mailto:devicetree+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:devicetree+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH 4/5] arm64: dts: qcom: add IPQ9650 SoC and rdp488 board
 support
To: Konrad Dybcio <konrad.dybcio@oss.qualcomm.com>,
        Bjorn Andersson <andersson@kernel.org>,
        Michael Turquette <mturquette@baylibre.com>,
        Stephen Boyd
 <sboyd@kernel.org>, Rob Herring <robh@kernel.org>,
        Krzysztof Kozlowski <krzk+dt@kernel.org>,
        Conor Dooley
 <conor+dt@kernel.org>,
        Philipp Zabel <p.zabel@pengutronix.de>,
        Konrad Dybcio <konradybcio@kernel.org>
Cc: linux-arm-msm@vger.kernel.org, linux-clk@vger.kernel.org,
        devicetree@vger.kernel.org, linux-kernel@vger.kernel.org
References: <20260415-ipq9650_boot_to_shell-v1-0-b37eb4c3a1d1@oss.qualcomm.com>
 <20260415-ipq9650_boot_to_shell-v1-4-b37eb4c3a1d1@oss.qualcomm.com>
 <10af8a5a-45b5-4a87-be4e-2501464ee827@oss.qualcomm.com>
Content-Language: en-US
From: Kathiravan Thirumoorthy <kathiravan.thirumoorthy@oss.qualcomm.com>
In-Reply-To: <10af8a5a-45b5-4a87-be4e-2501464ee827@oss.qualcomm.com>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit
X-Authority-Analysis: v=2.4 cv=bvd8wkai c=1 sm=1 tr=0 ts=69f181ed cx=c_pps
 a=Qgeoaf8Lrialg5Z894R3/Q==:117 a=XvYZRKXU5Z7yJT35SDuk6Q==:17
 a=IkcTkHD0fZMA:10 a=A5OVakUREuEA:10 a=s4-Qcg_JpJYA:10
 a=VkNPw1HP01LnGYTKEx00:22 a=u7WPNUs3qKkmUXheDGA7:22 a=YMgV9FUhrdKAYTUUvYB2:22
 a=EUspDBNiAAAA:8 a=vUSe85TNU2mlbxuYXrwA:9 a=QEXdDO2ut3YA:10
 a=x9snwWr2DeNwDh03kgHS:22
X-Proofpoint-ORIG-GUID: mR1PuL04YCptaX0xA-vJcoZuKcCDr6xA
X-Proofpoint-GUID: mR1PuL04YCptaX0xA-vJcoZuKcCDr6xA
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYwNDI5MDAzMyBTYWx0ZWRfX39C7fbvDgHMM
 EO4Q75W7B+TzVSSl7sQ/ZvOei11wOcnL7LyTs2qKSB5uCgoOinEx5nEcKKvouRu/zEBw6hBpMeZ
 QDDaQCKeen5ZSQQOrOS6ZlKml7rnPv4rkl03Pe38rU3Eub+vQMF5l/kyN7H3t6qZUY0I4kH0qZC
 KOrtJJcSIqpExc1aJudu27X3hiDNfWhkcXzgp4WEl6et73mtkUTEsY63r9gz3gggcX4bstfWBf8
 KYzIU5kuJwLdXy1XNwUo2at7TvqQD5fNzi0HTWglNpJP/TN/MxWOLEG0jUqh0UcYgsqdNSYg3Zu
 6wKSnXqhg3cH3TNQx5P3lKOHiM2WZDYURp1nLlloSPIcCieTU6pbKbgu06zMgPvvO6TD6EFuaWr
 QfGWHKfbQq550DIN2QYYgNOmNpAJS6xlq4wb3WDQkZDE1tcEaq76Bpcyg5B0RphvoUJBCCmc6jC
 wjtnf7swrGmHM9JRE3g==
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1143,Hydra:6.1.51,FMLib:17.12.100.49
 definitions=2026-04-28_05,2026-04-28_01,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 priorityscore=1501 clxscore=1015 spamscore=0 bulkscore=0 suspectscore=0
 lowpriorityscore=0 malwarescore=0 phishscore=0 impostorscore=0 adultscore=0
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.22.0-2604200000 definitions=main-2604290033


On 4/24/2026 4:51 PM, Konrad Dybcio wrote:
> On 4/15/26 3:33 PM, Kathiravan Thirumoorthy wrote:
>> Add initial device tree support for the Qualcomm IPQ9650 SoC and
>> rdp488 board.
>>
>> Signed-off-by: Kathiravan Thirumoorthy <kathiravan.thirumoorthy@oss.qualcomm.com>
>> ---
> Overall looks good, just a couple comments
>
> [...]
>
>> +		CPU0: cpu@0 {
> Labels should be lowercase

Ack.

>
>> +			device_type = "cpu";
>> +			compatible = "arm,cortex-a55";
>> +			reg = <0x0>;
>> +			enable-method = "psci";
>> +			next-level-cache = <&l2_0>;
> You likely want to add #cooling-cells = <2>

I left it because to add it along with the TSENS support. Do you prefer 
to add it now? do let me know.

>   
>
> [...]
>
>> +	pmu-a55 {
>> +		compatible = "arm,cortex-a55-pmu";
>> +		interrupts = <GIC_PPI 7 IRQ_TYPE_LEVEL_LOW>;
> You'll need to do something like:
>
> 9ce52e908bd5 ("arm64: dts: qcom: sm8650: switch to interrupt-cells 4 to add PPI partitions")
> 2c06e0797c32 ("arm64: dts: qcom: sm8650: add PPI interrupt partitions for the ARM PMUs")

Thanks for the pointers. Let me check and update.

>
> [...]
>
>> +			uart1: serial@1a98000 {
>> +				compatible = "qcom,geni-debug-uart";
>> +				reg = <0x0 0x01a98000 0x0 0x4000>;
>> +				clocks = <&gcc GCC_QUPV3_WRAP_SE6_CLK>;
>> +				clock-names = "se";
>> +				interrupts = <GIC_SPI 380 IRQ_TYPE_LEVEL_HIGH>;
>> +				status = "disabled";
> nit: please keep a \n above status

Ack.

>
> Konrad
