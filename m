Received: from mx0b-0031df01.pphosted.com (mx0b-0031df01.pphosted.com [205.220.180.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 9922733F5B4
	for <devicetree@vger.kernel.org>; Mon, 23 Mar 2026 11:07:11 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.180.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1774264032; cv=none; b=MgsxbCcdxYUn+2RQpFXXDbNOb0SSkPAuVMAl17EFDRFmDFN7XsEblkr13uqyQNS/w8g2frlvAP3cPV/AIMvABVcpVAQJ5Z2N4t5U1hwNcieCPJ/cBxBAFyr8kMarUvtF5kuHLUZ66yWdif5pRWkn7uKHMRUnYg1DEb4bO6iFnpE=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1774264032; c=relaxed/simple;
	bh=gmEepcvq95Buspvo3DUzm8spQrp8Ymg2Nu1Vwb2fZ8c=;
	h=Message-ID:Date:MIME-Version:Subject:To:Cc:References:From:
	 In-Reply-To:Content-Type; b=M/18OZvZALxLblb+6vFo3fpwMUtRhXmE5pjfXsXdTuoLud4tWCCQIKvArmY0C3N6V4qtpQqxAvzX3TSaqLaXM7adqWX+3ZS7U/a/FjMzMufdOtUPg5+/ywg5zIKi87UKs6IHlC99W3ER/if4ahqY1z/Z3SGQA3YkTP5QHYeYZ2c=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=PcZXGE7L; dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b=SZLFG6G0; arc=none smtp.client-ip=205.220.180.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b="PcZXGE7L";
	dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b="SZLFG6G0"
Received: from pps.filterd (m0279869.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 62N9YlM6744272
	for <devicetree@vger.kernel.org>; Mon, 23 Mar 2026 11:07:10 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	9ctwOt+QZycgFFNZjrFy7Ot4jSnJOxLLpWj0SQLSQNA=; b=PcZXGE7LXX8KrrRP
	zouydU3arVDTPgrs6nlHWHznv1KX6T0OnD4YHRwVVW3CAbx7mHUAzT1Mb8x7Qx52
	8t9z/raBCAUpobpV9gw+r4QCGJlf6lKCZKZHdK7BiMoE7mLWv4WT5fimmmuDyT+s
	4mGv9ceRd2dUWJvIEVqMGy2R83XGCqjCmOMEfSzNNbAQ+paNBXAcNnx6dsZXzfN3
	yO71HvG6y7cj3nnuethuEZ3H6maSuMipVlxFITbgxpX89gfnIg62p7Vj9pgsA+P6
	B9SDRTxYOm2qdiB+WexAoLsfmj0SLhwHi9gk7ixy4LBx3Vvu44YAetXeflieiM+2
	EedE2w==
Received: from mail-qt1-f197.google.com (mail-qt1-f197.google.com [209.85.160.197])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4d1jb5n5nv-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <devicetree@vger.kernel.org>; Mon, 23 Mar 2026 11:07:10 +0000 (GMT)
Received: by mail-qt1-f197.google.com with SMTP id d75a77b69052e-5094ef8c28cso19000451cf.0
        for <devicetree@vger.kernel.org>; Mon, 23 Mar 2026 04:07:10 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1774264030; x=1774868830; darn=vger.kernel.org;
        h=content-transfer-encoding:in-reply-to:from:content-language
         :references:cc:to:subject:user-agent:mime-version:date:message-id
         :from:to:cc:subject:date:message-id:reply-to;
        bh=9ctwOt+QZycgFFNZjrFy7Ot4jSnJOxLLpWj0SQLSQNA=;
        b=SZLFG6G0fxORWMp/3UmOFPpLE9pCF3uZjSCxVFD6vxpdAHC2xkCEgWxv4zxdm4mjIN
         btLt17R9mwjxSNP6GVYi121gkX/dFvzlKxtHMnjRazBB4cxTlBXzkaPSQdp4W5yoWIrz
         nTWFp1eryEC2YcdR1eg35d2P9N7MzNdSbKN0iScVwPZKyMa7wKmuNrK8ADoSQzvDGkH/
         2UYcFi6U7H2RT77VuCcXSe39IDucpH0VD6QrWte7NCGfL0Pu/9GkvKbQf0Bcv+csZ+Kt
         iVKqQgyZVcADXWsgc4i+lkxLPOwOeLPiL1Y7zbY3xGB0Pn3OnnboVs1ipGSEhdXwSq9z
         4ygQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1774264030; x=1774868830;
        h=content-transfer-encoding:in-reply-to:from:content-language
         :references:cc:to:subject:user-agent:mime-version:date:message-id
         :x-gm-gg:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=9ctwOt+QZycgFFNZjrFy7Ot4jSnJOxLLpWj0SQLSQNA=;
        b=U5sHOxcMlMLPCdfFfix1yXTQXw0YwXK0OSv3gCNUSU+X06gEb6ZewGm6HmDshs/Rl6
         o67RZ2y3odVmajGtSi8yXVlrpnT2Ldph0U8NabnzUhPHr5zXVp67PV9vSarLQ2BX63Sh
         jhtrbhKmZYOlOBz/IX8qHtElALDMh3uBNBB7PEZ24c9JQ14TvF0eJwP/E+uvUsxcj2wb
         eqZRsMjxRnaj6D/022c2iI7zjdoobG4dlc4fUTyG/pwBu1M7uGevsaqwxJSpQbdLDbmg
         +KBLDxGyAxIFjPFiOMUlbXPKs0dauWBldjoCbk/oEQMT6rVBLzbpbkFCHMnX7IP2CGR5
         GFMw==
X-Forwarded-Encrypted: i=1; AJvYcCUHH5tFEgCiw5Dp538217M8xF8ZPaCgG73P+ihTAb0UP+b5tXULnc3ZJuN6lGTc78WLaU05AlLHlV+/@vger.kernel.org
X-Gm-Message-State: AOJu0YztGJYU3HdrbSbR8fnJboDvD8CsDZh+kkf8QKdA5bPVPLBIRm4/
	Q7orqlqOHa3+s29ugcXaCqMLWIvxaImEZUnGb9U55RZo84zqjra6TVfwoBJxzMQPanXJeJzim+h
	RMCQ4u0GuHrWgfdCaWlU0PoVG2qhe6ZlyMp7rSSWqJt5Qh4yXMVCVtO/KffZIFIbu
X-Gm-Gg: ATEYQzwEeQBg5bFxb17KpNQ9Q/5Gyx3waLz8cXLhU2XBdycYoukjgMUHuLiTlDWgzNJ
	iWE3d1fjSDDBkK/NM0VkEs8TkjPg9FWtDH++bILJ0IZI7zyvG2YhMgFcjRQs0yYaVDYOu4193zi
	U0+qKsaXGFwqSMmB0cld3FLN7ZBe1s//SUHlnoGL8aULK6B7BZR3BpkZGxe36O0ydVX5ck+yLRL
	E6X4xxPiyBIAPNBnn38jkjFwoc+y2eGYUWZUdeRE+g9EpNb8G5TpCU6msxZp9uUUapRvV8Rugwk
	J2q14cP4a47cgMIRfpROv52cQdQBXYe3DXzxCz8IlmBmNxAgznCqeQ1tLrrG0IZwK6puNX1mjcH
	hEdYhibnC5jEeDwhXP1eIuRM6vvU12SBSR/cGVZpZ5T0EgT5wY9oSjdb/ivm/l+hBeT0N1t5h+g
	/NtOA=
X-Received: by 2002:a05:622a:1350:b0:50b:1e21:1733 with SMTP id d75a77b69052e-50b373d2a84mr140335981cf.3.1774264029946;
        Mon, 23 Mar 2026 04:07:09 -0700 (PDT)
X-Received: by 2002:a05:622a:1350:b0:50b:1e21:1733 with SMTP id d75a77b69052e-50b373d2a84mr140335631cf.3.1774264029433;
        Mon, 23 Mar 2026 04:07:09 -0700 (PDT)
Received: from [192.168.119.254] (078088045245.garwolin.vectranet.pl. [78.88.45.245])
        by smtp.gmail.com with ESMTPSA id a640c23a62f3a-b98335ddfa1sm471236266b.32.2026.03.23.04.07.07
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Mon, 23 Mar 2026 04:07:08 -0700 (PDT)
Message-ID: <82b1c902-3695-4b19-8995-69a2b31b913b@oss.qualcomm.com>
Date: Mon, 23 Mar 2026 12:07:06 +0100
Precedence: bulk
X-Mailing-List: devicetree@vger.kernel.org
List-Id: <devicetree.vger.kernel.org>
List-Subscribe: <mailto:devicetree+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:devicetree+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v5 2/3] arm64: dts: qcom: Introduce sa8255p SoC
To: Deepti Jaggi <deepti.jaggi@oss.qualcomm.com>,
        Bjorn Andersson <andersson@kernel.org>,
        Konrad Dybcio <konradybcio@kernel.org>, Rob Herring <robh@kernel.org>,
        Krzysztof Kozlowski <krzk+dt@kernel.org>,
        Conor Dooley
 <conor+dt@kernel.org>,
        Dmitry Baryshkov <dmitry.baryshkov@oss.qualcomm.com>
Cc: linux-arm-msm@vger.kernel.org, devicetree@vger.kernel.org,
        linux-kernel@vger.kernel.org,
        Prasad Sodagudi <prasad.sodagudi@oss.qualcomm.com>,
        Nikunj Kela <quic_nkela@quicinc.com>,
        Shazad Hussain <shazad.hussain@oss.qualcomm.com>
References: <20260304-b4-scmi-upstream-v5-0-f8fc763d8da0@oss.qualcomm.com>
 <20260304-b4-scmi-upstream-v5-2-f8fc763d8da0@oss.qualcomm.com>
 <e80ad550-71a0-498e-9ab8-6c0859883f7b@oss.qualcomm.com>
 <a7866b7b-9cc3-49bb-80f2-37fdbce039d5@oss.qualcomm.com>
Content-Language: en-US
From: Konrad Dybcio <konrad.dybcio@oss.qualcomm.com>
In-Reply-To: <a7866b7b-9cc3-49bb-80f2-37fdbce039d5@oss.qualcomm.com>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit
X-Authority-Analysis: v=2.4 cv=aJv9aL9m c=1 sm=1 tr=0 ts=69c11ede cx=c_pps
 a=EVbN6Ke/fEF3bsl7X48z0g==:117 a=FpWmc02/iXfjRdCD7H54yg==:17
 a=IkcTkHD0fZMA:10 a=Yq5XynenixoA:10 a=s4-Qcg_JpJYA:10
 a=VkNPw1HP01LnGYTKEx00:22 a=u7WPNUs3qKkmUXheDGA7:22 a=_glEPmIy2e8OvE2BGh3C:22
 a=KKAkSRfTAAAA:8 a=VwQbUJbxAAAA:8 a=EUspDBNiAAAA:8 a=COk6AnOGAAAA:8
 a=-3HSSwHb9ON-QZMGylwA:9 a=QEXdDO2ut3YA:10 a=a_PwQJl-kcHnX1M80qC6:22
 a=cvBusfyB2V15izCimMoJ:22 a=TjNXssC_j7lpFel5tvFf:22
X-Proofpoint-GUID: 9Pabz0CFzV1CSgB-fv7KXQK6aAJKaWLv
X-Proofpoint-ORIG-GUID: 9Pabz0CFzV1CSgB-fv7KXQK6aAJKaWLv
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYwMzIzMDA4NiBTYWx0ZWRfX4E/RLM/39EYa
 +n3kVXX3OfEc9CM46QmB27tSvmtQNAkpNIdNGWrHooxRrcKvVNLTELV78fBOx3RegS3C40/jshh
 uMdFSqLGoboCix9yswBDxQMrWvVSBJ9nMylMxZR1+td+9UHFdxLA/XWXybvKpk+pbbFLT2g7Trt
 54Xf0bKfbgF+SQg4ev7hknI3jJDVm+e2LTT2PVrW8IiHTA2UR6KjoIN2VkvPM0ZRXBkos/iX3rh
 tJr+zMCs6kkobip/QZUoOiwsO4fjtgtXcnHQn+QVTJJFun++8mNHVRc/1y5gLczjwlQZrq7Cu6a
 SFAgtK3Wwk3pBroI0riD37GVWXartsHSp1XBLAPFcRbl/+lkOt76AtJaBfuH4djOeOWXLQPNbfF
 8x5jT0bZaBhVU+awEGzE1rbbmZ0OwRXXZa4S7JAMZdhtVK203vc/F0lf3OraIcninOjXXglTWDR
 eEunhTEe1SdLmccMSbQ==
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1143,Hydra:6.1.51,FMLib:17.12.100.49
 definitions=2026-03-23_03,2026-03-20_02,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 lowpriorityscore=0 malwarescore=0 adultscore=0 priorityscore=1501 spamscore=0
 impostorscore=0 clxscore=1015 bulkscore=0 phishscore=0 suspectscore=0
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.22.0-2603050001 definitions=main-2603230086

On 3/17/26 12:58 AM, Deepti Jaggi wrote:
> 
> On 3/11/2026 6:41 AM, Konrad Dybcio wrote:
>> On 3/5/26 5:28 AM, Deepti Jaggi wrote:
>>> From: Nikunj Kela <quic_nkela@quicinc.com>
>>>
>>> Introduce base device tree support for sa8255p Qualcomm's automotive
>>> infotainment SoC. The base dt file describes core SoC components- CPUs,
>>> CPU map, ipcc, QUP,  geni UART, interrupt controller, TLMM, reserved
>>> memory, SMMU, firmware scm, scmi, watchdog, SRAM, PSCI, ufs, pcie, pmu
>>> nodes and enable booting to shell with ramdisk.
>>>
>>> The Qualcomm automotive sa8255p SoC utilizes firmware to configure
>>> platform resources such as clocks, interconnects, and TLMM. Device drivers
>>> request these resources through the SCMI power,reset and performance
>>> protocols. Assign each device driver a dedicated SCMI channel and Tx/Rx
>>> doorbells to support parallel resource requests and aggregation in the
>>> SCMI platform server. Operate the SCMI server stack in an SMP-enabled VM,
>>> using the Qualcomm SMC/HVC transport driver for communication.
>>>
>>> Group resource operations to improve abstraction and reduce the number of
>>> SCMI requests. Follow the SCMI-based resource management approach
>>> demonstrated by Qualcomm at LinaroConnect 2024.[1]
>>>
>>> Limit initial support to basic platform resources, serial console, ufs
>>> and pcie.Defer enabling USB, and Ethernet to subsequent updates.
>>>
>>> [1]: https://resources.linaro.org/en/resource/wfnfEwBhRjLV1PEAJoDDte
>>>
>>> Co-developed-by: Shazad Hussain <shazad.hussain@oss.qualcomm.com>
>>> Signed-off-by: Shazad Hussain <shazad.hussain@oss.qualcomm.com>
>>> Signed-off-by: Nikunj Kela <quic_nkela@quicinc.com>
>>> Co-developed-by: Deepti Jaggi <deepti.jaggi@oss.qualcomm.com>
>>> Signed-off-by: Deepti Jaggi <deepti.jaggi@oss.qualcomm.com>
>>> ---
>> [...]
> 
> Thanks for reviewing the series .
> 
>>> +		tsens2: thermal-sensor@c251000 {
>>> +			compatible = "qcom,sa8255p-tsens", "qcom,tsens-v2";
>>> +			reg = <0x0 0x0c251000 0x0 0x1ff>,
>>> +			      <0x0 0x0c224000 0x0 0x8>;
>> All TSENS regions are 0x1000-long
>>
>> [...]
> 
> Ack
> 
>>
>>> +		tlmm: pinctrl@f000000 {
>>> +			compatible = "qcom,sa8255p-tlmm", "qcom,sa8775p-tlmm";
>>> +			reg = <0x0 0x0f000000 0x0 0x1000000>;
>>> +			interrupts = <GIC_SPI 208 IRQ_TYPE_LEVEL_HIGH>;
>>> +			gpio-controller;
>>> +			#gpio-cells = <2>;
>>> +			interrupt-controller;
>>> +			#interrupt-cells = <2>;
>>> +			gpio-ranges = <&tlmm 0 0 149>;
>>> +			wakeup-parent = <&pdc>;
>>> +		};
>> Praveen suggested GPIOs are not controlled by Linux:
>>
>> https://lore.kernel.org/linux-arm-msm/12063990-70fe-4faf-89fa-c74c7bd97f42@oss.qualcomm.com/
>>
>> Could you comment on this?
>>
>> [...]
> 
> For buses,FW is handling, but for PCIe and ethernet , pin configuration is controlled by Linux.

Okay, does the firmware synchronize/access-control access based on the
pin index, so that e.g. the gpioset utility won't be able to mess with
the desired state? Or do we need something like gpio-reserved-ranges for
the FW-managed ones?

Konrad
