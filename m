Received: from mx0a-0031df01.pphosted.com (mx0a-0031df01.pphosted.com [205.220.168.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id C0465331ECC
	for <devicetree@vger.kernel.org>; Tue,  4 Aug 2026 05:48:19 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.168.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1785822501; cv=none; b=qolOwUIf0y0WlR3LSEIK3cMBBYn1oVHyGjqCUzq8Z3myYgdHF32yVyLgcX3QsPPdAz/mQXm4tEHRGbN2kTxPi1+g1mYMgOoHU1Ab3qEo8mk/9atTKpdqSQZhTDtFbgbuFH7ud1sH+pWtp1QSy6zr8v6zwYjAWlHGuod5y8uWDF8=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1785822501; c=relaxed/simple;
	bh=/d3PPoOccTppAqw+HSu9MyodtXQXfayImUx8U+PS3lA=;
	h=Message-ID:Date:MIME-Version:Subject:To:Cc:References:From:
	 In-Reply-To:Content-Type; b=mBGJ1IxnFyleb02EtyCv/MVAiHezQF21UkGurspDKClTgB97X6H6SkET22pPMcT3l07ts5nUqpiKjCQO7+7f+aIS+RJWRQxa25c/j+HtlI0iG39+6pLf+8tlTI6mStrtRiPVh9xkOKtu8evhlzTfupg257WOnfPG2kJgBWMNqPU=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=RWUzQRXF; dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b=kuhGcO01; arc=none smtp.client-ip=205.220.168.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b="RWUzQRXF";
	dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b="kuhGcO01"
Received: from pps.filterd (m0279864.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 67417pXN1670518
	for <devicetree@vger.kernel.org>; Tue, 4 Aug 2026 05:48:19 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	2K0MaHfg/IVnEisBPjeiZtL1pySD+SoRMnJYDCyHZCE=; b=RWUzQRXFbG9AG5ES
	lvqI/Nrzb+UIKiQfsAvfyM1gYM9o2fpH8s21+7GeLvmF6rFHVnAMBZMJlw26aMOZ
	zGskM8+UmVKRsVQywdfv3Bc9qLvxWLLPukypDgd6mMtz0AQsFGPJwZKqyl45BVx4
	3WY3aSK2Twjo2ehn7Spvxvqa0nvAUS6WRsvXHLWCiotvnCNN+igQ69aCBVtaQY+X
	+2OjwUUHOXDfHNee+G5Xoyef68rajnnoPoewbQ6AMOWCSeuHKx0CZ5R+MFC6fpPF
	iBFq0yUg+kx4VVdumdDVb7s2ChyVxwpbZPUvelo4wLeIRlq5waEQ+R7rcanOoXZ4
	NOWU4A==
Received: from mail-qt1-f200.google.com (mail-qt1-f200.google.com [209.85.160.200])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4ftx7m30x5-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <devicetree@vger.kernel.org>; Tue, 04 Aug 2026 05:48:18 +0000 (GMT)
Received: by mail-qt1-f200.google.com with SMTP id d75a77b69052e-51c1d7886cdso83352731cf.1
        for <devicetree@vger.kernel.org>; Mon, 03 Aug 2026 22:48:18 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1785822498; x=1786427298; darn=vger.kernel.org;
        h=content-transfer-encoding:content-type:in-reply-to:from
         :content-language:references:cc:to:subject:user-agent:mime-version
         :date:message-id:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=2K0MaHfg/IVnEisBPjeiZtL1pySD+SoRMnJYDCyHZCE=;
        b=kuhGcO01r+MftGETZ/Zpw1ktVdvpSTzy7B8ycqvL49fpkG5m8UxTra+ZXbUjI6ZoWm
         U07xZa0VKBXygYA9f+heUpSivS+p92OSBOUx1j04gMI6M1OYk7vy2+/pfH+qSR5kh7ez
         9RwNCgPGKVWR53eqj5dJgQtZ2CORQmgicx4SkPPbyIiFjBRrzzIT6R6Xygqd70Q37YZC
         0hZEGLBNqvTSuHS/8HNh8doBWA0v9iLFIcYmuDKrWS4ib0KQGmSGZtiI1FEBu+cIwy+i
         gyZSdR8Ec35xVXnkm31/eBk8gNg0KPiDO6tf0LRrmsTjqQGas27V2cH4UTsTm18mXWXp
         HlWQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1785822498; x=1786427298;
        h=content-transfer-encoding:content-type:in-reply-to:from
         :content-language:references:cc:to:subject:user-agent:mime-version
         :date:message-id:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=2K0MaHfg/IVnEisBPjeiZtL1pySD+SoRMnJYDCyHZCE=;
        b=pIBK5hDmCIimLCE6FCBZA19fhaPB+aAPpsPZB7Y8e+HqL60rA0xpSmfTzTDcBHl3Yv
         sYbzQeBCPBVYu3no98c83JMZhp8irKoYRoLhZgupFKjd/k0t01PU/njAnjJ97yZB2E8R
         pwOZHKNQUcRbhEHj1KfYWGMTDsED3ezSd6RTbFVDto14R5pA1eP0rYrp5f8INdL/ZSxU
         Ak6wDMciYwp2qcsUgZNXyuvSjvzgGR7ih85SVZdLMkvXxB4sdgw2jCS8oxIbW7ssgd40
         r7XUKC/EWtXJjyjqc5mdd0ZZT/yjxdC79XCf5mUDc/uWLEd0/1w/TNhyjVNYRFAWosnA
         iATg==
X-Forwarded-Encrypted: i=1; AHgh+RqJ8GbfGsAQPvjJX97hWLxJYAH/vEOnoM9KwOH4Blao6X99aWCsl9Q0KZmnN79zkzJ8n+gnuMHm5RaM@vger.kernel.org
X-Gm-Message-State: AOJu0YxUZtKHGQu7kwaB9EItIFiRRncUDv9q+8HnlmO1KXOUDu2SL4Eh
	FKf1a34PUzX7tWzhZR5PnEMxgXRUK76EC07rW0oNjYMeTDeQZny9bHF5aFdJVXGSTVQ+Edmu6hZ
	Ewp01YUNXAzcr+hw1G7cGsOhsVxtNb57lBmZneyQL/OrUMKj0HEWKIpHLskXD4xPY
X-Gm-Gg: AR+sD11Jopn5oKBvDcxE2bsXb+HWRArozYcmqreBSlmZl+nROGe/klgnEIAtgG5Brwo
	fOh/14wB7eVCyZftt55rVjV2Zr6m1tWMhAVHmNp8byXUS2gGJVTiMBx0D3kaKz+AI+bm00F9oSX
	hlBnQWN3KGQUWT1gGQoEVjSJKFlt635TI+sBr/8AzMSNPmLdWpsyr070EdUASLxhj9YjsaivyIB
	RsImbbyn2tt8PcSj9c884rDngPbnVbD3+uk06H1i0H0llE8PC3FGxb9m5V/eYU/y3T3B2ZxeNAh
	rmc38SRrURQBiTJbXx3UqGLdoLjnvkjkr8/WU1uySEvn61VO/Gohn9Cy1YZXB7OAsZjfNfJih99
	FX6ffbIotwM1XZuu8gV82f3NMZbyiMDpQ0EgStr7quBXdhD/RmawELa/bwLqFizSUqRCOqCnO
X-Received: by 2002:a05:622a:1350:b0:517:96f0:5658 with SMTP id d75a77b69052e-52b566aa84bmr221542161cf.14.1785822497948;
        Mon, 03 Aug 2026 22:48:17 -0700 (PDT)
X-Received: by 2002:a05:622a:1350:b0:517:96f0:5658 with SMTP id d75a77b69052e-52b566aa84bmr221541871cf.14.1785822497517;
        Mon, 03 Aug 2026 22:48:17 -0700 (PDT)
Received: from [192.168.1.31] ([85.196.172.179])
        by smtp.gmail.com with ESMTPSA id a640c23a62f3a-c1fd3c5ae9fsm647095166b.7.2026.08.03.22.48.15
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Mon, 03 Aug 2026 22:48:16 -0700 (PDT)
Message-ID: <31db3de6-34a2-4ccb-af61-043f56d8f86b@oss.qualcomm.com>
Date: Tue, 4 Aug 2026 08:48:13 +0300
Precedence: bulk
X-Mailing-List: devicetree@vger.kernel.org
List-Id: <devicetree.vger.kernel.org>
List-Subscribe: <mailto:devicetree+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:devicetree+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v6 3/3] arm64: dts: qcom: sm8250: Add JPEG encoder node
To: Dmitry Baryshkov <dmitry.baryshkov@oss.qualcomm.com>,
        Atanas Filipov <atanas.filipov@oss.qualcomm.com>
Cc: linux-media@vger.kernel.org, bod@kernel.org, mchehab@kernel.org,
        robh@kernel.org, krzk+dt@kernel.org, conor+dt@kernel.org,
        andersson@kernel.org, konradybcio@kernel.org, loic.poulain@linaro.org,
        linux-arm-msm@vger.kernel.org, devicetree@vger.kernel.org,
        linux-kernel@vger.kernel.org
References: <20260730150524.2659577-1-atanas.filipov@oss.qualcomm.com>
 <20260730150524.2659577-4-atanas.filipov@oss.qualcomm.com>
 <ln6tr2vwv6zmoo3kcivjjf3rqjxqm2fltwcpn4kk3iphc4rzlb@qdpop32fjm5l>
 <ce631db2-8e8b-4b97-8164-c701a1b0dc1c@oss.qualcomm.com>
 <2rtrk7tsquxekqhk7tsiomjnfzc3xfqg574cbw2m5b4ui4ovt6@2oxme5w4wsqy>
Content-Language: en-US
From: "Gjorgji Rosikopulos (Consultant)"
 <gjorgji.rosikopulos@oss.qualcomm.com>
In-Reply-To: <2rtrk7tsquxekqhk7tsiomjnfzc3xfqg574cbw2m5b4ui4ovt6@2oxme5w4wsqy>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYwODA0MDA0MyBTYWx0ZWRfX7s42FFqy2qWI
 WyDbvG628smFK/JpA44dpUxuJ3a/8ymQHwVoCOxjtZGJoETdHoPr8lffLki6yBIZGTK12m3urF7
 dxAYpLYMad8NPBOmxmtTeSLpwIxIFuY+6YekPSirmGhsop3l8DeODBgeuznJRVz6vi7sLW2czbU
 iJlWMKo6ii1Mo9LF6ckSMpe9lOUrxud0aJb0SJxJvs62AHrNlR864dV4Xv9sXE1KVKKb+VF3NpM
 22c+RJrRErXAZos/2QNEvTl/AlvZIE+Jk+6We+Vh/HI/rhob+x+5CrTJhnkCZaPS9clfE441Enh
 bYU8QCZ7NT0z6jHlecu0wiH2ydcLvYIRCtYyjqdaqo5N3KsrtoWwCvWK4yQYYKtKVmqMA0dtB7a
 6d+obhxADflEj0BT14QaQZkNdjF0jtHB7cxSe/EgahHoBCABoZT1kgNzcOXIc98WyOXLL88ppE5
 6cOPfdyye21K+jrITDQ==
X-Authority-Analysis: v=2.4 cv=TIt1jVla c=1 sm=1 tr=0 ts=6a717d22 cx=c_pps
 a=JbAStetqSzwMeJznSMzCyw==:117 a=Q/e3f29T3Hw2hnAEzBPF7w==:17
 a=IkcTkHD0fZMA:10 a=Sv0fKeRqtYgA:10 a=s4-Qcg_JpJYA:10
 a=VkNPw1HP01LnGYTKEx00:22 a=u7WPNUs3qKkmUXheDGA7:22 a=DJpcGTmdVt4CTyJn9g5Z:22
 a=EUspDBNiAAAA:8 a=G2glL8InyLvFS_YR_T0A:9 a=QEXdDO2ut3YA:10
 a=uxP6HrT_eTzRwkO_Te1X:22
X-Proofpoint-ORIG-GUID: _rkvBtRgfQGcn7AHEZ_EprxTkN2Cj1eM
X-Proofpoint-Spam-Info: AW1haW4tMjYwODA0MDA0MyBTYWx0ZWRfXyDs/wrOIP4wJ
 tNxGnybJHpmpphA/tK2nr6/cSU/cbRfPstE1sdAvizd9JFWnV52kcHb+tW+tcG+T3RldVnBv2eI
 cc6+AagU6bLX5lU8yeaUrNYguXfSrkw=
X-Proofpoint-GUID: _rkvBtRgfQGcn7AHEZ_EprxTkN2Cj1eM
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1176,Hydra:6.1.134,FMLib:17.12.100.49
 definitions=2026-08-04_01,2026-08-03_02,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 lowpriorityscore=0 adultscore=0 phishscore=0 bulkscore=0 malwarescore=0
 priorityscore=1501 spamscore=0 suspectscore=0 impostorscore=0 clxscore=1015
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.22.0-2606150000 definitions=main-2608040043

Hi Dmitry,

On 8/3/2026 9:44 PM, Dmitry Baryshkov wrote:
> On Thu, Jul 30, 2026 at 09:02:26PM +0300, Atanas Filipov wrote:
>> On 7/30/2026 7:01 PM, Dmitry Baryshkov wrote:
>>> On Thu, Jul 30, 2026 at 06:05:24PM +0300, Atanas Filipov wrote:
>>>> Add the JPEG encoder hardware node to the SM8250 device tree so the
>>>> qcom-jpeg V4L2 encoder driver can bind and operate on this platform.
>>>>
>>>> Signed-off-by: Atanas Filipov <atanas.filipov@oss.qualcomm.com>
>>>> ---
>>>>   arch/arm64/boot/dts/qcom/sm8250.dtsi | 72 ++++++++++++++++++++++++++++
>>>>   1 file changed, 72 insertions(+)
>>>>
>>>> diff --git a/arch/arm64/boot/dts/qcom/sm8250.dtsi b/arch/arm64/boot/dts/qcom/sm8250.dtsi
>>>> index f11da2ca4181..d42b29419320 100644
>>>> --- a/arch/arm64/boot/dts/qcom/sm8250.dtsi
>>>> +++ b/arch/arm64/boot/dts/qcom/sm8250.dtsi
>>>> @@ -13,6 +13,7 @@
>>>>   #include <dt-bindings/firmware/qcom,scm.h>
>>>>   #include <dt-bindings/gpio/gpio.h>
>>>>   #include <dt-bindings/interconnect/qcom,osm-l3.h>
>>>> +#include <dt-bindings/interconnect/qcom,icc.h>
>>>>   #include <dt-bindings/interconnect/qcom,sm8250.h>
>>>>   #include <dt-bindings/mailbox/qcom-ipcc.h>
>>>>   #include <dt-bindings/phy/phy-qcom-qmp.h>
>>>> @@ -4486,6 +4487,77 @@ cci1_i2c1: i2c-bus@1 {
>>>>   			};
>>>>   		};
>>>> +		jpeg-encoder@ac53000 {
>>>> +			compatible = "qcom,sm8250-jpeg-enc";
>>>> +			status = "disabled";
>>>> +
>>>> +			reg = <0x0 0x0ac53000 0x0 0x1000>;
>>>> +
>>>> +			interrupts = <GIC_SPI 474 IRQ_TYPE_EDGE_RISING>;
>>>> +
>>>> +			power-domains = <&camcc TITAN_TOP_GDSC>,
>>>> +					<&rpmhpd RPMHPD_MMCX>,
>>>
>>> Is TITAN_TOP a part of the MMCX or CX domain? In the former case,
>>> please drop separate mmcx vote here and let it come through the
>>> titan_top (it might require camcc driver and node modifications).
>>>
>>
>> The change was requested by Brian, most likely in connection with upcoming
>> migrations. I think he would be able to explain the exact reasons. As far as
>> the facts are concerned, this is not currently necessary for the driver to
>> be functional.
> 
> There is no word _driver_ in the _dt bindings_. What is the actual
> hardware wrapping? What is being powered by which domain? Is MMCX
> directly powering something? Or is it gated by TITAN_TOP_GDSC? I assume
> that MX is powering on PLLs, correct?

Yes i agree there is no word driver in the dt_bindings but you get my point,
with only TITAN_TOP_GDSC hw is fully functional there is no need of additional MMCX 
power domain. 

> 
>>>> +
>>>> +				opp-100000000 {
>>>> +					opp-hz = /bits/ 64 <400000000>,
>>>> +						 /bits/ 64 <100000000>;
>>>> +					required-opps = <&rpmhpd_opp_min_svs>;
>>>
>>> This looks a bit strange. Are you sure that PLL levels match the MMCX /
>>> internal clock levels? I think you need to vote on both domains.
> 
> This is not addressed / responded.

Yes this need to be checked. I will get back when we get info for this...

Regards,
~Gjorgji
