Received: from mx0a-0031df01.pphosted.com (mx0a-0031df01.pphosted.com [205.220.168.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 543BE3DBD57
	for <devicetree@vger.kernel.org>; Tue, 16 Jun 2026 06:31:22 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.168.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1781591483; cv=none; b=m55Gubtz22Lhn4iLXnSCfNuRkdqmQrtwC4H+SLVRrsYBTbTEJ9TOp4lOHX+mRjj92fp6tLSykP8htogwpQygZG/ffK9dBbKGTJ/WHEqxIFq6TwFvjf4XMroxm9jELRzkl1QkBGQvb+apr8Kkgpb73uxak6V7P0akNd9RjV2dYoE=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1781591483; c=relaxed/simple;
	bh=Z3e0bPPQznJKnX39huZA4pkckZ33HDN4xXmZ1W1+BLM=;
	h=Message-ID:Date:MIME-Version:Subject:To:Cc:References:From:
	 In-Reply-To:Content-Type; b=EQfCsE7y0kRuZjy3oXkAgj25OQXeoUSjvbQfqVuygIr+CL0wEB1pOieqcB6lB0fTGM8RhchERGSJ6nJFgE+vsYftw5VqkQxcLYUkqkZ+0PQNK9vqrquXqJXK+WUXPI29LC8cp8O7ef7vp1qMWDy6vd5S2JgBVFh8igdbTncCRBw=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=Z4E1uGa9; dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b=AKGhLgXN; arc=none smtp.client-ip=205.220.168.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b="Z4E1uGa9";
	dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b="AKGhLgXN"
Received: from pps.filterd (m0279863.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 65G64Tcw2316388
	for <devicetree@vger.kernel.org>; Tue, 16 Jun 2026 06:31:21 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	+afTUBDbAZT38BV8Tfa0k61XdJA619HVug0gOl4LXSI=; b=Z4E1uGa9F5rkOQDC
	PQ3A8daXDvRcbnk8ALP/AnW7KuB9D0u9lo0WWSoDsPyPqJ/VLKlBWL/KtXbsXwrj
	Do/7IKI7mR5XtP7AUHUFn9yYNxvAg4fpFwWov3BzVzkxCUs4p7TffcB5oJPfgzYx
	VRhcdTXyQb0BKsx+lU3rh3rlNwVCFBgSFTCAvr0vTjKKZMoSJ1MfLHeqjyA0cx5y
	KjjNt29dEHF0oxNcMk/mVh/scMlBpNEY4O9nuzFFGfj5iqMYEeypID8gjrivYori
	HnOrmcJp3z+cxZtsMaKt1kAlibI25GC91boLFomCL1PhX/hOCGVNvMaFU20dYEaw
	5/+P1w==
Received: from mail-pl1-f197.google.com (mail-pl1-f197.google.com [209.85.214.197])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4eteydd7ju-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <devicetree@vger.kernel.org>; Tue, 16 Jun 2026 06:31:21 +0000 (GMT)
Received: by mail-pl1-f197.google.com with SMTP id d9443c01a7336-2c6a3ece0d8so790695ad.3
        for <devicetree@vger.kernel.org>; Mon, 15 Jun 2026 23:31:21 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1781591481; x=1782196281; darn=vger.kernel.org;
        h=content-transfer-encoding:in-reply-to:from:content-language
         :references:cc:to:subject:user-agent:mime-version:date:message-id
         :from:to:cc:subject:date:message-id:reply-to;
        bh=+afTUBDbAZT38BV8Tfa0k61XdJA619HVug0gOl4LXSI=;
        b=AKGhLgXN44OSPXOvwTWKvlJXTO0CZm3ryOkjeR5qUEAx+fRXso5rufINxzUJUtKQ3S
         xnd7BAralz0Z6TJ+cnnS5w6/I7ew+QaNRBZNVMaL+zyMLH1HMF1f+VXZpRHwv+1lt8Cm
         boRsjjE9j+7eC1Dpcz74UTq/8ONoKm1FPpEP8TYWZ/meCoxTv71gCnj6H+x9qt6FL6Oe
         vyWe37lZ+SsYQ7NxxUwfmPedU/d4CW/+IfMzCsYPVc8Ap/X8X2RFYyuWtnbFkJBMOHLE
         pV9N+7XaC65BkdCVRDR493Xa6uWW700rTqdI+b/68wBSJCtD2i3ny0pMSswVfJ0x2UGj
         yHfQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1781591481; x=1782196281;
        h=content-transfer-encoding:in-reply-to:from:content-language
         :references:cc:to:subject:user-agent:mime-version:date:message-id
         :x-gm-gg:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=+afTUBDbAZT38BV8Tfa0k61XdJA619HVug0gOl4LXSI=;
        b=eBmgcIVreH2DTQbTfDVeS3jWEincnSeXj71ojyU01eUDc2rdWMh62TEL4TwvDzFyz4
         8GPupfIUthdcLaIkH0vMpeEKhtCihTlKRuVZRK2h4dVfoXVsvcr16DLU3jxHc4nvinZX
         cEOY5xFoZsnYbzcX/y4oL2znVkgAHyJ7ClHLtXu63eY4+W92wGLSJXr3v/9hve7OvFHg
         QJJcrkAsfdFEqPdpx4dnCZnQeqidEICuH3etkRnJi0BDUkdsGllPSAWBImZnDl5q00+5
         VF+RR+hzNx7Vt6FxRMuH5uLrbg64hP/Fi5HZwBYMj1tr7NS3ADNBAShjioRnU+9Y9l+4
         1UPQ==
X-Forwarded-Encrypted: i=1; AFNElJ9kjHmSw4GhMuJY1qDz455sf8sdAuDqfleJJJ3QBEkXqmWrTCpBQ0T8+o1zTEaaUMjJWAzov0o9PD+e@vger.kernel.org
X-Gm-Message-State: AOJu0YztFN0dZyZu1FgRmtWlKLdl8sEo4ipGCsX+YPwYzBSQ7yhlkjRr
	oveIaKg0fckiz0LXts86BeUHeuzD2CE3tjX7y48ovtnq1H2GpXNuy9b9qlPJ852jGEAFYjmwEs2
	SHo/ALO3iuQ+ye8Vn4dfjalEAEZz+lqF2KlqIC8k5/iNPhQ2BSccsfJ5ZuTMWeFHNC5QvYssj
X-Gm-Gg: Acq92OE2vQsdpoF/nRjtBInw6tO4Slz6uEV6rbFvkwhAQVMilH7QV6G+qzCRWUWCBxX
	VVgTeIkx0kJep4wlm+GxMwqviEbUyB26qI7Qn8WPyfeK/vKrO0/aHSDPqxUDMYYSX5g4zeJWELU
	FrEuamXpnTxDXwuioQCzTajl2VNQwH21xncmAm0J7wVG0EzPxxHQOdacVVX4sLSSEbSQWLFumUj
	+rlR1Mwg8CcmD2hee3uTSR1totuHFfbdmOKyrZuCEERl8L/lB689kR8TjRFXUgnGww5AF4A/Cn3
	kBhbGE58biBIG7i+Cu7XHw7b1hxB4azNe0rmWyeWejlszCKnaUv6mO2zvK3/KYyon6i0v46D2ax
	aP3caD/cxSwF9tZ+BW7Ow8SIVZu3Jkm7qVqq1WsYRYguB5061fA==
X-Received: by 2002:a17:903:15c7:b0:2bd:606d:b339 with SMTP id d9443c01a7336-2c69a186b0dmr24362395ad.21.1781591481030;
        Mon, 15 Jun 2026 23:31:21 -0700 (PDT)
X-Received: by 2002:a17:903:15c7:b0:2bd:606d:b339 with SMTP id d9443c01a7336-2c69a186b0dmr24362035ad.21.1781591480606;
        Mon, 15 Jun 2026 23:31:20 -0700 (PDT)
Received: from [10.217.216.182] ([202.46.22.19])
        by smtp.gmail.com with ESMTPSA id 41be03b00d2f7-c866519f896sm10860067a12.23.2026.06.15.23.31.15
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Mon, 15 Jun 2026 23:31:20 -0700 (PDT)
Message-ID: <15d5bcf3-6b82-437a-beaf-7a392179c117@oss.qualcomm.com>
Date: Tue, 16 Jun 2026 12:01:14 +0530
Precedence: bulk
X-Mailing-List: devicetree@vger.kernel.org
List-Id: <devicetree.vger.kernel.org>
List-Subscribe: <mailto:devicetree+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:devicetree+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH 4/4] arm64: dts: qcom: glymur: Add EVA clock controller
 node
To: Konrad Dybcio <konrad.dybcio@oss.qualcomm.com>,
        Bjorn Andersson <andersson@kernel.org>,
        Michael Turquette <mturquette@baylibre.com>,
        Stephen Boyd
 <sboyd@kernel.org>, Brian Masney <bmasney@redhat.com>,
        Dmitry Baryshkov <dmitry.baryshkov@oss.qualcomm.com>,
        Rob Herring <robh@kernel.org>,
        Krzysztof Kozlowski <krzk+dt@kernel.org>,
        Conor Dooley <conor+dt@kernel.org>,
        Konrad Dybcio <konradybcio@kernel.org>
Cc: Ajit Pandey <ajit.pandey@oss.qualcomm.com>,
        Imran Shaik <imran.shaik@oss.qualcomm.com>,
        Jagadeesh Kona <jagadeesh.kona@oss.qualcomm.com>,
        linux-arm-msm@vger.kernel.org, linux-clk@vger.kernel.org,
        linux-kernel@vger.kernel.org, devicetree@vger.kernel.org
References: <20260526-evacc_glymur-v1-0-b61c7755c403@oss.qualcomm.com>
 <20260526-evacc_glymur-v1-4-b61c7755c403@oss.qualcomm.com>
 <b926f503-05f7-4d9b-98d7-0125b106c512@oss.qualcomm.com>
Content-Language: en-US
From: Taniya Das <taniya.das@oss.qualcomm.com>
In-Reply-To: <b926f503-05f7-4d9b-98d7-0125b106c512@oss.qualcomm.com>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit
X-Proofpoint-GUID: kEXtg1E2GxqDWv6NyLXMhzZDZ8y2fLu6
X-Proofpoint-Spam-Info: AW1haW4tMjYwNjE2MDA2MiBTYWx0ZWRfX6cnjK4Zl0EBJ
 LZ1US4sdXJUs7imtUH3Q52OajXeoVUXi+a23kVDay1xPcSlPS3HgsUlc3Si0o/3P4PwJL07aCH+
 +V/Scf1nxLGewfbKilbvki6MyyH/do0=
X-Authority-Analysis: v=2.4 cv=QrJuG1yd c=1 sm=1 tr=0 ts=6a30edb9 cx=c_pps
 a=cmESyDAEBpBGqyK7t0alAg==:117 a=fChuTYTh2wq5r3m49p7fHw==:17
 a=IkcTkHD0fZMA:10 a=FelO9ux0wxsA:10 a=s4-Qcg_JpJYA:10
 a=VkNPw1HP01LnGYTKEx00:22 a=u7WPNUs3qKkmUXheDGA7:22 a=yOCtJkima9RkubShWh1s:22
 a=WANKC8lrEroQgd0tMjcA:9 a=QEXdDO2ut3YA:10 a=1OuFwYUASf3TG4hYMiVC:22
X-Proofpoint-ORIG-GUID: kEXtg1E2GxqDWv6NyLXMhzZDZ8y2fLu6
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYwNjE2MDA2MiBTYWx0ZWRfX3Hw1JhveLRzi
 cM/T4mrQ6wTU8a5eSchSoII1dXUp7N7xkitmFs3kwg/sAgUbNWvyiOTc4zytziKGhtKIbcjn4zc
 XLtCW7KGpcWCVJOqmpTIucT61BNW2kWoHWR1LTpuxfAsP0QTk3pYrj8DIOW1Gm/LpGUFbF78OYv
 90ouizUbg1ZT1vu0gX8qCqHC+P4yc2HPgtZvHE6GQixNLl1gWMKRAZE3gElOAKdS8KreP0QLWvl
 8J4qmVp55RFBFFgqrYgDwgjEW3c42aGAsnuXK3KKW1UHslKbvUr0qoqb4eolHNMkO50lZZNBQ0Y
 tQvyR9IE2qJ599O3WfeEjmrdU0YhVbYzVrnKQgIC01UjXuq82VOBsbxZe20883vCIUreL5O1JHZ
 L1MPJvG0I5PHsx0oHudrkbGgIxAhfnGZDfxRiNiq3l66Y46FoHqF+6dPHbJky5xMgh1cIT/avaD
 s99vGvXycDCfbQm9z6g==
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1143,Hydra:6.1.125,FMLib:17.12.100.49
 definitions=2026-06-16_02,2026-06-15_04,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 clxscore=1015 priorityscore=1501 lowpriorityscore=0 suspectscore=0
 phishscore=0 spamscore=0 impostorscore=0 malwarescore=0 adultscore=0
 bulkscore=0 classifier=typeunknown authscore=0 authtc= authcc= route=outbound
 adjust=0 reason=mlx scancount=1 engine=8.22.0-2606040000
 definitions=main-2606160062



On 6/11/2026 5:30 PM, Konrad Dybcio wrote:
>>  #include <dt-bindings/clock/qcom,glymur-dispcc.h>
>> +#include <dt-bindings/clock/qcom,glymur-evacc.h>
>>  #include <dt-bindings/clock/qcom,glymur-gcc.h>
>>  #include <dt-bindings/clock/qcom,glymur-gpucc.h>
>>  #include <dt-bindings/clock/qcom,glymur-tcsr.h>
>> @@ -4804,6 +4805,24 @@ videocc: clock-controller@aaf0000 {
>>  			#power-domain-cells = <1>;
>>  		};
>>  
>> +		evacc: clock-controller@abf0000 {
>> +			compatible = "qcom,glymur-evacc";
>> +			reg = <0x0 0x0abf0000 0x0 0x10000>;
>> +			clocks = <&gcc GCC_EVA_AHB_CLK>,
>> +				 <&rpmhcc RPMH_CXO_CLK>,
>> +				 <&rpmhcc RPMH_CXO_CLK_A>,
> With the XO_A situation resolved:


Will remove in the next patch.

-- 
Thanks,
Taniya Das

