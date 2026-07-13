Received: from mx0a-0031df01.pphosted.com (mx0a-0031df01.pphosted.com [205.220.168.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 102F637A835
	for <devicetree@vger.kernel.org>; Mon, 13 Jul 2026 10:34:20 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.168.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1783938862; cv=none; b=s2ReeveTYWTc1xRxrzSdP6AbiV2QqwgJ9O18VErH5dP1V0LCbFEsJlUuXgMHd5Kj+TypwqjPB5FCUG6YC1A5GE1LtaNKPHKF5UTkZ7VQI/9gqipK+VazPQtpTKvkkAE35eoOfASyIEjQbZKiVxGMZM6jdNGlxMFeCZp+siowRd4=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1783938862; c=relaxed/simple;
	bh=80uvDt5MU1fMdxcH8e+Lh30RDkAELmAtxtlNNHoW8+E=;
	h=Message-ID:Date:MIME-Version:Subject:To:Cc:References:From:
	 In-Reply-To:Content-Type; b=JUsVz5y1Gwl147HGWoNSdFKOI02w/iLxORDyKRr/VrmSfnjE/cUeqtBwG8jFBy0q60yYiPn/NzpKFkEmNCJEU95e+/GCtZE8zK7ZFhD4SYX7tibeVamISv5M/FlIMTfr94CoovKDzkAVPwc0ouh95VjHe4Tnz3+bnCWij3sV69E=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=V+gCeISA; dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b=Ts0T2PH2; arc=none smtp.client-ip=205.220.168.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b="V+gCeISA";
	dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b="Ts0T2PH2"
Received: from pps.filterd (m0279867.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 66D9M4Sm1090535
	for <devicetree@vger.kernel.org>; Mon, 13 Jul 2026 10:34:20 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	hStT8qpaedXjiHKccL1ATtGNxSXRj2aYF7INvKg5ScQ=; b=V+gCeISAvfz1jB1z
	zjcsdfJMqSC8J9qKGLfLRi7G7QlXsrHxw0GteUuJDKtCcoyugYbWufARqcQ845y6
	D0Em2KCROztDRovkWvTsnKpwPLTTF8ZvVLJvmgfQ+EYgDGnGLybk1pMvheCosQZI
	H2OdfBSavI1FSZu7slnxEekGwINhbAIQfFspf6KoYloGchjEacDYJy+kSLcIVzwn
	lJUveFzMUGelHx9iAgSIdNOuedCGXG3rz8cec+PY//P4U7eGNb4veuvEMuorigIF
	rlP1rMdqSKQac748gSJa0x0toM188gKucmezY33huD8tHU8YRMKBqG4KPqg6xILX
	dWsoJQ==
Received: from mail-qt1-f199.google.com (mail-qt1-f199.google.com [209.85.160.199])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4fcwavr8te-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <devicetree@vger.kernel.org>; Mon, 13 Jul 2026 10:34:20 +0000 (GMT)
Received: by mail-qt1-f199.google.com with SMTP id d75a77b69052e-51c110a3b6aso45766861cf.1
        for <devicetree@vger.kernel.org>; Mon, 13 Jul 2026 03:34:19 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1783938859; x=1784543659; darn=vger.kernel.org;
        h=content-transfer-encoding:content-type:in-reply-to:from
         :content-language:references:cc:to:subject:user-agent:mime-version
         :date:message-id:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=hStT8qpaedXjiHKccL1ATtGNxSXRj2aYF7INvKg5ScQ=;
        b=Ts0T2PH2DpVlkkhqCAijdswi6oNnu8jgJHfnVHZrRCJwp7ZLFRUynpTMN7A9anyQ+i
         vuHLSdADr4Lcz1MiC+EgR92nH8ZwrNrl8ZC5WCqaRpbVTCUP1xSt9EYQIiNzDwKdqGRP
         JTBjFVgAJ11Kt2RL2o7jfOnXTfG17+gNSIPaYwraceSeDmByQhLPAhZm/0nIA1EbebjN
         MnsugcCJtTeh0EUCp1Aol1v4L1R09RgFivU+peQO/iMq3LpSNEeoPrt6kwsWyBTvruoK
         P3jbj2qNNsgr8o6SaYRf6+SX/MyWKJ4VypLWBLjhwALbcldi2nuZ0mTrJa5sPbDW9O62
         U1TA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1783938859; x=1784543659;
        h=content-transfer-encoding:content-type:in-reply-to:from
         :content-language:references:cc:to:subject:user-agent:mime-version
         :date:message-id:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=hStT8qpaedXjiHKccL1ATtGNxSXRj2aYF7INvKg5ScQ=;
        b=O2/OXOL51UXD7m1FsRXcZw8AlzlRznS6b2IKIQn4KVsKbRE0dkDEM7JG3n16PlIVEI
         EyM6S6DFhOripOSs1sO/8CNjB/uRrKZs0m5WG0BgIJ6YM7Uq50qflCw16nrqYeIujrll
         m4XpoMZF7tRarBBy35feBZXwFZ7U2dgcdQXMSVGn1I+Sw6b6y6v3/AgZ4/pGUH5sC9Ok
         VahOPuN5QKKfJNDlI6qX7T+aVneYOczpBiJwlruMzT15hvioiYUU2H51LfPyrmWEGhwf
         RDUfc6a0VDerUpeeXRcfH+Hg8D6u+e8YGT86kKYelt1eqtUic1IKzsgATaoWBKUO69I6
         QhAw==
X-Forwarded-Encrypted: i=1; AHgh+RrWA7/fuUkHOF4s7r5fmVZi19J6f4Xqd6KkkPUW8sn4rdS6qJ6gv/pYpRgG2P4Gam7C4xUv7GkbfxIF@vger.kernel.org
X-Gm-Message-State: AOJu0YzxwKy2el+SB/1g02etJI4pJ19syve0vUkflZqZrR/9V24VidSj
	JrDmeIMHscYtzjFPfbClsgZ5X4tdCLHVdNB7SsvEJiqKKiHt2TGcOtZp+1xA5jQ1S5+muHXWHON
	fAPUNKsqdNX0TBgpAGkj752nNoFaJYyaz5xDsim9rf85/xl2kbGMa3zDo/O7Gms/E
X-Gm-Gg: AfdE7ckHPW6JTfFn2XzJCjC94XUeVL6n1YLXPMICzV/DK6lrTE6LwGb/TgcSsvsbwMB
	CmOTHixPBz8L6IfcEKm/4/sfyubBN1xs0x34WxFzmyPFiERWUlFen3/anpVo6H0ldSNfFjdhTen
	DcKUP4dzg5P4CgNaNGztgalOAsD7V7nuoKKYAbfcwUs1dM0XJis1guW5z6cBI+EAi3Ah7qU0+uB
	5pp4XA7+De2+GGueoyBc/1Y3Ije7fgoavz/TIAIYXsnlD3nlDIhHRv07AfU+bP8T75Cubj4ksgm
	1d4mT63n0TywP1fPLuQzg95vvFYtflbeu0hPmkLrET4hyRv6X1HkwtdohWVbRUuOdz0da9WSP6B
	rmpI7qQaN+ltuOtkxOvxXh4t4dl+M1J5fNlKPdkmI0PQ=
X-Received: by 2002:a05:622a:95:b0:51a:8c97:fb9b with SMTP id d75a77b69052e-51cbf2feb65mr80671251cf.68.1783938859128;
        Mon, 13 Jul 2026 03:34:19 -0700 (PDT)
X-Received: by 2002:a05:622a:95:b0:51a:8c97:fb9b with SMTP id d75a77b69052e-51cbf2feb65mr80670781cf.68.1783938858362;
        Mon, 13 Jul 2026 03:34:18 -0700 (PDT)
Received: from [192.168.1.73] ([92.247.57.178])
        by smtp.gmail.com with ESMTPSA id a640c23a62f3a-c15de6c565fsm662932066b.2.2026.07.13.03.34.16
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Mon, 13 Jul 2026 03:34:17 -0700 (PDT)
Message-ID: <b2f62e42-b909-481a-8aab-07aa5e866665@oss.qualcomm.com>
Date: Mon, 13 Jul 2026 13:34:15 +0300
Precedence: bulk
X-Mailing-List: devicetree@vger.kernel.org
List-Id: <devicetree.vger.kernel.org>
List-Subscribe: <mailto:devicetree+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:devicetree+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v4 4/5] arm64: dts: qcom: sm8250: Add JPEG encoder node
To: Dmitry Baryshkov <dmitry.baryshkov@oss.qualcomm.com>
Cc: linux-media@vger.kernel.org, bryan.odonoghue@linaro.org,
        vladimir.zapolskiy@linaro.org, loic.poulain@oss.qualcomm.com,
        mchehab@kernel.org, robh@kernel.org, krzk+dt@kernel.org,
        conor+dt@kernel.org, andersson@kernel.org, konradybcio@kernel.org,
        linux-arm-msm@vger.kernel.org, linux-kernel@vger.kernel.org,
        devicetree@vger.kernel.org
References: <20260706071113.383215-1-atanas.filipov@oss.qualcomm.com>
 <20260706071113.383215-5-atanas.filipov@oss.qualcomm.com>
 <h2fskxtlb6wusoz7o5pw34ii5n2il4jltcrogmt36676ioq5nd@klwft4s3mzgk>
Content-Language: en-US
From: Atanas Filipov <atanas.filipov@oss.qualcomm.com>
In-Reply-To: <h2fskxtlb6wusoz7o5pw34ii5n2il4jltcrogmt36676ioq5nd@klwft4s3mzgk>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 8bit
X-Proofpoint-GUID: hbHjZW2uM0NbA-Ns4zS6FMaTVbb6RQY6
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYwNzEzMDEwOSBTYWx0ZWRfX3HeqxnKc65mf
 iG8o82a6GwTcvSSVUGNgjC4xOva9uKMUodUomiPyAIzx1kuc2n4847JbwMPWWYqoEpMwbrK3jph
 D9fjfq3omQH73G8Z9sYjyKBJYYLLofecdh0rSbypSoejOtyIaGrahX4T9C11UOT5OTMu64WzAHT
 1y84E9XObYrMo0GUMPqjFXgOSQwJEpKaOf4Yv+klTdkGIDj+YpzK/lF2sTzjYdxJfQMiI9wqGh5
 Sr0asMsn+HASQ3Aa9JCQR3vJqUJ0nnBdKZ0bUXV0B4SLRYl8vhQzNfPP+3Jny6otEP6KCNTFgxq
 BbyiQwElnTSKALX8RPptDwjZJEB3BPiUym0HQNe+lwYD5+bLa6L7FKOSeJEqusAVEvfxtCsmZKl
 7gP45KoqkWoFo2acyzlEtZTxknqB7qpehxuXdkOPCYY73cyrvznaJJbbjmXaZLqbi/1ZIxW7mJ/
 bBkiq6GzkIsfX59L2wQ==
X-Proofpoint-ORIG-GUID: hbHjZW2uM0NbA-Ns4zS6FMaTVbb6RQY6
X-Authority-Analysis: v=2.4 cv=dZSwG3Xe c=1 sm=1 tr=0 ts=6a54bf2c cx=c_pps
 a=WeENfcodrlLV9YRTxbY/uA==:117 a=ybD9qRDIDfZaXNPQ7Ca20A==:17
 a=IkcTkHD0fZMA:10 a=RAioF0-LDSMA:10 a=s4-Qcg_JpJYA:10
 a=VkNPw1HP01LnGYTKEx00:22 a=u7WPNUs3qKkmUXheDGA7:22 a=eoimf2acIAo5FJnRuUoq:22
 a=EUspDBNiAAAA:8 a=VDI__ZYCjcDFRWE0z6oA:9 a=3ZKOabzyN94A:10 a=QEXdDO2ut3YA:10
 a=kacYvNCVWA4VmyqE58fU:22
X-Proofpoint-Spam-Info: AW1haW4tMjYwNzEzMDEwOSBTYWx0ZWRfX84jWrUn1r6S6
 z6QBkN87DfGNjLdQ/hMsyMJD1H9QaaxfYP3nlt+21VKJiFDtuDu45dtRqsKJ/+OSbnNys9OrkzO
 w8sMoanDpkVSpNaNURmYl7kn2LEMRMA=
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1143,Hydra:6.1.134,FMLib:17.12.100.49
 definitions=2026-07-13_02,2026-07-10_01,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 bulkscore=0 priorityscore=1501 adultscore=0 malwarescore=0 spamscore=0
 phishscore=0 impostorscore=0 lowpriorityscore=0 clxscore=1015 suspectscore=0
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.22.0-2606150000 definitions=main-2607130109

On 7/6/2026 3:45 PM, Dmitry Baryshkov wrote:
> On Mon, Jul 06, 2026 at 10:11:12AM +0300, Atanas Filipov wrote:
>> Add the JPEG encoder hardware node to the SM8250 device tree so the
>> qcom-jpeg V4L2 encoder driver can bind and operate on this platform.
>>
>> Signed-off-by: Atanas Filipov <atanas.filipov@oss.qualcomm.com>
>> ---
>>   arch/arm64/boot/dts/qcom/sm8250.dtsi | 81 ++++++++++++++++++++++++++++
>>   1 file changed, 81 insertions(+)
>>
>> diff --git a/arch/arm64/boot/dts/qcom/sm8250.dtsi b/arch/arm64/boot/dts/qcom/sm8250.dtsi
>> index 7076720413ab..a089b706f60c 100644
>> --- a/arch/arm64/boot/dts/qcom/sm8250.dtsi
>> +++ b/arch/arm64/boot/dts/qcom/sm8250.dtsi
>> @@ -12,6 +12,7 @@
>>   #include <dt-bindings/dma/qcom-gpi.h>
>>   #include <dt-bindings/gpio/gpio.h>
>>   #include <dt-bindings/interconnect/qcom,osm-l3.h>
>> +#include <dt-bindings/interconnect/qcom,icc.h>
>>   #include <dt-bindings/interconnect/qcom,sm8250.h>
>>   #include <dt-bindings/mailbox/qcom-ipcc.h>
>>   #include <dt-bindings/phy/phy-qcom-qmp.h>
>> @@ -4471,6 +4472,10 @@ cci1_i2c1: i2c-bus@1 {
>>   
>>   		camss: camss@ac6a000 {
>>   			compatible = "qcom,sm8250-camss";
>> +			#address-cells = <2>;
>> +			#size-cells = <2>;
>> +			ranges;
>> +
>>   			status = "disabled";
>>   
>>   			reg = <0 0x0ac6a000 0 0x2000>,
>> @@ -4649,6 +4654,82 @@ port@5 {
>>   					reg = <5>;
>>   				};
>>   			};
>> +
>> +			jpeg-encoder@ac53000 {
>> +				compatible = "qcom,sm8250-jenc";
>> +
>> +				reg = <0 0x0ac53000 0 0x1000>;
> 
> 0x0 instead of just 0
> 
>> +
>> +				interrupts = <GIC_SPI 474 IRQ_TYPE_EDGE_RISING>;
>> +
>> +				clocks = <&gcc GCC_CAMERA_HF_AXI_CLK>,
>> +					 <&gcc GCC_CAMERA_SF_AXI_CLK>,
>> +					 <&camcc CAM_CC_CORE_AHB_CLK>,
>> +					 <&camcc CAM_CC_CPAS_AHB_CLK>,
>> +					 <&camcc CAM_CC_CAMNOC_AXI_CLK>,
>> +					 <&camcc CAM_CC_JPEG_CLK>;
>> +
>> +				clock-names = "hf_axi",
>> +					      "sf_axi",
>> +					      "core_ahb",
>> +					      "cpas_ahb",
>> +					      "cnoc_axi",
>> +					      "jpeg";
> 
> What are the clock _inputs_ on the JPEG core side?
>

CAM_CC_JPEG_CLK is the JPEG-specific core clock. CAM_CC_CAMNOC_AXI_CLK
gates the CAMNOC data path and directly affects encode throughput.

>> +
>> +				interconnects = <&gem_noc MASTER_AMPSS_M0
>> +						 QCOM_ICC_TAG_ACTIVE_ONLY
> 
> Put tags on the previous line (even if it is longer than 80 chars).
> 
>> +						 &config_noc SLAVE_CAMERA_CFG
>> +						 QCOM_ICC_TAG_ACTIVE_ONLY>,
>> +						<&mmss_noc MASTER_CAMNOC_HF
>> +						 QCOM_ICC_TAG_ALWAYS
>> +						 &mc_virt SLAVE_EBI_CH0
>> +						 QCOM_ICC_TAG_ALWAYS>,
>> +						<&mmss_noc MASTER_CAMNOC_SF
>> +						 QCOM_ICC_TAG_ALWAYS
>> +						 &mc_virt SLAVE_EBI_CH0
>> +						 QCOM_ICC_TAG_ALWAYS>;
>> +				interconnect-names = "cpu-cfg",
>> +						     "hf-mnoc",
>> +						     "sf-mnoc";
>> +
>> +				iommus = <&apps_smmu 0x2040 0x400>;
>> +
>> +				operating-points-v2 = <&jpeg_opp_table>;
>> +
>> +				jpeg_opp_table: opp-table {
>> +					compatible = "operating-points-v2";
>> +
>> +					opp-100000000 {
>> +						opp-hz = /bits/ 64 <400000000>,
>> +							 /bits/ 64 <100000000>;
>> +						required-opps = <&rpmhpd_opp_min_svs>;

In downstream there is a dedicated CPAS driver that aggregates AHB/AXI
clock votes and bandwidth requests from all camera IP clients. No
equivalent exists in upstream. So, IMO a few approaches are possible:
1. A dedicated ICC provider that derives clock rates from bandwidth
    requests — we have a successful experimental POC of this approach.
2. A dedicated driver similar to downstream CPAS.
3. The CAMSS-as-parent approach — trade-offs already discussed in this
    thread.

Having each client set camnoc_axi rate independently is not a good
solution due to last-write-wins semantics. For JPEG specifically this
is a performance issue only — the encoder functions even at the parked
19.2 MHz — but it is a correctness problem in principle.

Until a proper aggregation mechanism exists upstream, the OPP table is
the only way to ensure camnoc_axi is at the correct frequency when JPEG
runs standalone.

> 
> Inside the DT example i saw bandwidth votes. Why are they gone from the
> DT?
> 

Same root cause — without a shared resource aggregation mechanism,
opp-peak/avg-kBps bandwidth votes have no effect today. Will be
revisited when such infrastructure is available upstream.

Best regards,
Atanas

>> +					};
>> +
>> +					opp-200000000 {
>> +						opp-hz = /bits/ 64 <400000000>,
>> +							 /bits/ 64 <200000000>;
>> +						required-opps = <&rpmhpd_opp_low_svs>;
>> +					};
>> +
>> +					opp-400000000 {
>> +						opp-hz = /bits/ 64 <400000000>,
>> +							 /bits/ 64 <400000000>;
>> +						required-opps = <&rpmhpd_opp_svs>;
>> +					};
>> +
>> +					opp-480000000 {
>> +						opp-hz = /bits/ 64 <400000000>,
>> +							 /bits/ 64 <480000000>;
>> +						required-opps = <&rpmhpd_opp_svs_l1>;
>> +					};
>> +
>> +					opp-600000000 {
>> +						opp-hz = /bits/ 64 <400000000>,
>> +							 /bits/ 64 <600000000>;
>> +						required-opps = <&rpmhpd_opp_nom>;
>> +					};
>> +				};
>> +			};
>>   		};
>>   
>>   		camcc: clock-controller@ad00000 {
>> -- 
>> 2.34.1
>>
> 

