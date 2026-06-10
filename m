Received: from mx0a-0031df01.pphosted.com (mx0a-0031df01.pphosted.com [205.220.168.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id CECF63DEFE3
	for <devicetree@vger.kernel.org>; Wed, 10 Jun 2026 13:36:27 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.168.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1781098593; cv=none; b=ZUmBjyAduB7uPwA8+ZzCmoa0vvxUeWp0nfI/ODI/036g//iH1vQuCuSUpymc3iDh07ykO7aLXzdDuILCjecw1psHLlH3U6esqUqb6fwOC3jtfWFvCmt3jviOzAu6r9ZNguQYzvXwnmJgvD1q09CeYjOj0iDx7Lvm+UoZWjsZb8M=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1781098593; c=relaxed/simple;
	bh=AGdgc/LNIiNu/Pqb58ZW43s1W2veDo5Rgo02Lj4z3iA=;
	h=Message-ID:Date:MIME-Version:Subject:To:Cc:References:From:
	 In-Reply-To:Content-Type; b=W5KRhXI7AwsL1O8vajhlCmDoX9bCT17rhNNvqKWtrdNwByy3aM1X1X1dHIOPfnEEuXF/rcxvlnDX8wZ/8LSJKlIXA4SsFxe2YFSQP8YaiIjcu85zWqGE4lJ2R/peQM3VBnFZcvH4jfGWcvB4q6Q9BKZepdlo0jZaQr70jm4F9/A=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=OWTgv2oa; dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b=IOzlYEZR; arc=none smtp.client-ip=205.220.168.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b="OWTgv2oa";
	dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b="IOzlYEZR"
Received: from pps.filterd (m0279867.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 65ACBd7G1137374
	for <devicetree@vger.kernel.org>; Wed, 10 Jun 2026 13:36:27 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	niaQqv0TO5ktLYqg+JO/ci5vasrTsTgygjoHApXMLdA=; b=OWTgv2oaKoYu+Oxi
	VNZ76vqVmqiS/eGjNkXMa2iUd0Tl4HisiGBqKPqVFt94l8QR17+d5j8gFNk8Qt2f
	U4ntb1tbPqN3YksGILZG8O/TWQlSdpm1BECXv5okFUjBKo2j8s8a/Ug2QMTnmFGr
	asxkwXaPH/LE+4XDsdvyLfd2jdHcqIb5rJgd4giZCnsZ6/IeZmyjkbALdGyKM198
	ltTLB33uASNfRwhjLXG0kpnLsiGzw4w4pSf2jVlx0hv9tw6O/bOmueZUkoQn1bAC
	P20aoUCkr7MtPvQnhyWXZsoAPOm7iWWz3lLq1vhWqRBn6iF1jCex4ECoapCqWvcL
	ivZvCg==
Received: from mail-qk1-f197.google.com (mail-qk1-f197.google.com [209.85.222.197])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4epwnh2qay-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <devicetree@vger.kernel.org>; Wed, 10 Jun 2026 13:36:26 +0000 (GMT)
Received: by mail-qk1-f197.google.com with SMTP id af79cd13be357-915a547f4b3so160666785a.3
        for <devicetree@vger.kernel.org>; Wed, 10 Jun 2026 06:36:26 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1781098586; x=1781703386; darn=vger.kernel.org;
        h=content-transfer-encoding:in-reply-to:from:content-language
         :references:cc:to:subject:user-agent:mime-version:date:message-id
         :from:to:cc:subject:date:message-id:reply-to;
        bh=niaQqv0TO5ktLYqg+JO/ci5vasrTsTgygjoHApXMLdA=;
        b=IOzlYEZRlG8nj50T25Iv33du+LSCd/ZqbSRljisgkGedVg3slCqLi+hZL8HTqsjvAB
         tTmOzEXa67SpYLzwqgK93uq9jJX5PeCn/a4zi94zE4p2anGhsL6GuGFIHvylrSXS28nd
         7Yxqjt/n1CGksRfROVLsc2XHxHOttP4ziME6bGjTLry+0Ziht05qaqff0+wAz9XTOQcb
         sCAHKA13ICDT0D3saIbZhhQ91a9dW9mpME2cv0Cru3C/7KrodWHrJcYR8YWMdct9pG55
         Lj44FqSg1GgvtOpIcmUXKIY2wFOuIYJJOP8ugf/DLSVLjO1zB4TS1vfEB06+4dD8o5J9
         Hd2Q==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1781098586; x=1781703386;
        h=content-transfer-encoding:in-reply-to:from:content-language
         :references:cc:to:subject:user-agent:mime-version:date:message-id
         :x-gm-gg:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=niaQqv0TO5ktLYqg+JO/ci5vasrTsTgygjoHApXMLdA=;
        b=phR4Ycc1uxs4Rjjyc7xjKJWp8sPlM4lrpj+S1/n7w145pMXGdOclA9OtfOkW6ohf1B
         rk1nB05WqfIfQVotpaGfQ8Or/82ZBsQZ0dlFhtP4aON/IuSxeoag9ynYFbG55Q7x+PJa
         Ik4JztH+6k+W29LmC6/HAW+Hogspswa3iFwp6LtLFxERZxWcipInwdZs7rPxEn4fEqPu
         5tm7oxoHEYqkxgrck5LHbUZ/8WGt7KyRMYBRCvhikllp5b3g1pwBGjNGogwdX/IX+eTu
         xtyFcfSW/EhFKttOXf9NMbZYb4+KcSv7ir5RN+XzBfeiCl1p3D5T4nV+txJCpFcUU2bn
         fuhw==
X-Forwarded-Encrypted: i=1; AFNElJ8/52a4ACsA5NUp7MiKIAaynzz5rOy/gRgNdIMTMO1inFHZxkrQUKOCVjhgwhrGMvNHum0KiHbRiipg@vger.kernel.org
X-Gm-Message-State: AOJu0YxQEj/kVFSQedM1FepFtFHMW034nV5B059lNIS0qpD3K4Xzm+sc
	0Yo2CIrLJf9qTGiwYfqE2HEGof/7zCRLFHtLCgjmqslpXJs30u7ngCxkmUcKTReEGHNNHfS1phj
	Wn1gqBVc+46C1mPFb8/i94YpC9uga5gc5Q9hxswj917VGZhHej9Ck+wgG/nbIj/k9
X-Gm-Gg: Acq92OGVoIZc0oYqNDrD7PfoFxvCrKa57X3BmuKxvMP9EaTv/U00F/vZHOq1aLFv8Wd
	jVtWcoPIXgos634p/Swl/XNdGLgzwOwuYTiBGGKpKvEtsCViYO8FWdYjy2o173fACKjwKMkvOOE
	Mc1LaEw2u/SNzdejtmjoy2r7Nl8pa19cvKkqr24ZnmMghkfFqnRZDa8jcTk+P3FRHTZo2zv2yz+
	Z+0eF2odZ92+PBOmjWlR17c20q+rtMkCL1qZRtX8EVgDgo9HcFflxIwgoELy9rpxzOjhTsKNLoV
	wxAWMnoIzuP5x5ldyU0h4p1jaTS77wTLxcB8rznnfLj+jfEryTMOeUUhYgZj4jP7ncAEwacZf+J
	h/THW68xrAibL0zLsF/9Vbf6d0aMT6ZxMUEqbUlcepi2/OD4vVBazNw43
X-Received: by 2002:a05:620a:7113:b0:914:ea37:6f14 with SMTP id af79cd13be357-915a9c7736dmr2175327485a.1.1781098585655;
        Wed, 10 Jun 2026 06:36:25 -0700 (PDT)
X-Received: by 2002:a05:620a:7113:b0:914:ea37:6f14 with SMTP id af79cd13be357-915a9c7736dmr2175321485a.1.1781098584986;
        Wed, 10 Jun 2026 06:36:24 -0700 (PDT)
Received: from [192.168.120.170] ([178.235.128.140])
        by smtp.gmail.com with ESMTPSA id 2adb3069b0e04-5aa7b8ed718sm5324751e87.14.2026.06.10.06.36.21
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Wed, 10 Jun 2026 06:36:23 -0700 (PDT)
Message-ID: <0947e485-4619-43a3-a127-5b887780190b@oss.qualcomm.com>
Date: Wed, 10 Jun 2026 15:36:20 +0200
Precedence: bulk
X-Mailing-List: devicetree@vger.kernel.org
List-Id: <devicetree.vger.kernel.org>
List-Subscribe: <mailto:devicetree+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:devicetree+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v2 2/4] dt-bindings: phy: qcom,msm8998-qmp-usb3-phy: Add
 support for Shikra
To: Dmitry Baryshkov <dmitry.baryshkov@oss.qualcomm.com>,
        Krishna Kurapati <krishna.kurapati@oss.qualcomm.com>
Cc: Krzysztof Kozlowski <krzk@kernel.org>,
        Neil Armstrong <neil.armstrong@linaro.org>,
        Vinod Koul <vkoul@kernel.org>, Rob Herring <robh@kernel.org>,
        Krzysztof Kozlowski <krzk+dt@kernel.org>,
        Conor Dooley <conor+dt@kernel.org>,
        Bjorn Andersson <andersson@kernel.org>,
        Xiangxu Yin <xiangxu.yin@oss.qualcomm.com>,
        Johan Hovold <johan+linaro@kernel.org>,
        Loic Poulain <loic.poulain@oss.qualcomm.com>,
        Kathiravan Thirumoorthy <kathiravan.thirumoorthy@oss.qualcomm.com>,
        linux-arm-msm@vger.kernel.org, linux-phy@lists.infradead.org,
        devicetree@vger.kernel.org, linux-kernel@vger.kernel.org
References: <8cd564af-9646-40c5-a8ef-c7197fb3cfe9@kernel.org>
 <95b567cc-b83c-4154-9520-e624555f1882@oss.qualcomm.com>
 <29571bdd-23bf-42a7-a9e3-918a28c79700@kernel.org>
 <62161822-2365-4ec7-80f7-8660bdadb177@oss.qualcomm.com>
 <40b5e0f6-bc61-4750-9560-bdcc268f0fe3@kernel.org>
 <d52c5039-9431-44ed-9f3b-bb00d03ae176@oss.qualcomm.com>
 <5baeeeed-7c18-46f7-82a3-5bb299ba05ef@kernel.org>
 <42ba6ac7-306a-419f-96b6-3427c51ef567@oss.qualcomm.com>
 <9ed7c714-07c1-48de-8d27-cbe24356c606@kernel.org>
 <34586ed6-4f78-490f-a916-baf7657cca7a@oss.qualcomm.com>
 <xw7f24rvxhkfntui4jjswyyabb5be4cbkfgh7fico6vlhfvf5b@d4axfyz6gds5>
Content-Language: en-US
From: Konrad Dybcio <konrad.dybcio@oss.qualcomm.com>
In-Reply-To: <xw7f24rvxhkfntui4jjswyyabb5be4cbkfgh7fico6vlhfvf5b@d4axfyz6gds5>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYwNjEwMDEzMCBTYWx0ZWRfX033kxL8sNG5w
 0lCL+3tsTW7lvE27rNwCOyApW8yrRsPf3iB4rhvKkkjDbUK6GuPzhL4FiBFsTfHH0xh6Zg6+gt5
 C3LElfe2tfOYYbn8nd2ltoQxlBxUaxXisiOT0otdWOMBCvWlh6gD7fuTWQdgCeMkE5xoPHSbw3G
 ges8oQ1LkkoFZlJCAa0xFheVzKbmby+HMgNdh1C6M3dGD+QfjOgYG3s4qdJWmr73zYDG6OoCRr6
 UU932QRbd0qtPWa20jYHrvHPxrnN4xLA4YNiEPNLvgkzZuPBMrlItkUcML39NT3o6EpAsLdIjgj
 oJRp0iILZ15u89BVididBRLTmZ1wjvT2YN005MlcBJ12Pu6OZku320XhECHHlr0CiTabnkh4MwH
 vKAki2gKcXo0sGKOh2DnC6SyYLEE/Glgt6Kwh2WW9ZHegiw9X7WoF33Mwr1jzD5dAJhNIJwxdRf
 5QZVfarEp1SzTSvAFLw==
X-Authority-Analysis: v=2.4 cv=Xce5Co55 c=1 sm=1 tr=0 ts=6a29685a cx=c_pps
 a=50t2pK5VMbmlHzFWWp8p/g==:117 a=PRfkaYvzSr8QmIIGAkY2Sg==:17
 a=IkcTkHD0fZMA:10 a=FelO9ux0wxsA:10 a=s4-Qcg_JpJYA:10
 a=VkNPw1HP01LnGYTKEx00:22 a=u7WPNUs3qKkmUXheDGA7:22 a=eoimf2acIAo5FJnRuUoq:22
 a=EUspDBNiAAAA:8 a=eIvkFyfHag2gwDMtOzUA:9 a=QEXdDO2ut3YA:10
 a=IoWCM6iH3mJn3m4BftBB:22
X-Proofpoint-ORIG-GUID: -20xY1ksxGdHhyJJE_Owbi6uQisFpGoQ
X-Proofpoint-GUID: -20xY1ksxGdHhyJJE_Owbi6uQisFpGoQ
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1143,Hydra:6.1.125,FMLib:17.12.100.49
 definitions=2026-06-10_03,2026-06-09_02,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 clxscore=1015 phishscore=0 malwarescore=0 impostorscore=0 adultscore=0
 priorityscore=1501 lowpriorityscore=0 suspectscore=0 bulkscore=0 spamscore=0
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.22.0-2605210000 definitions=main-2606100130

On 5/17/26 9:16 PM, Dmitry Baryshkov wrote:
> On Fri, May 15, 2026 at 09:06:21PM +0530, Krishna Kurapati wrote:
>>
>>
>> On 5/14/2026 8:07 PM, Krzysztof Kozlowski wrote:
>>> On 14/05/2026 08:22, Krishna Kurapati wrote:
>>>>
>>>>
>>>> On 5/14/2026 12:26 AM, Krzysztof Kozlowski wrote:
>>>>> On 07/05/2026 13:37, Krishna Kurapati wrote:
>>>>>>
>>>>>>
>>>>>> On 5/5/2026 7:30 PM, Krzysztof Kozlowski wrote:
>>>>>>> On 05/05/2026 15:57, Krishna Kurapati wrote:
>>>>>>>>
>>>>>>>>
>>>>>>>> On 5/5/2026 6:59 PM, Krzysztof Kozlowski wrote:
>>>>>>>>> On 05/05/2026 15:27, Krishna Kurapati wrote:
>>>>>>>>>>
>>>>>>>>>>
>>>>>>>>>> On 5/5/2026 4:22 PM, Krzysztof Kozlowski wrote:
>>>>>>>>>>> On 05/05/2026 12:49, Krzysztof Kozlowski wrote:
>>>>>>>>>>>> On Mon, May 04, 2026 at 10:36:57PM +0530, Krishna Kurapati wrote:
>>>>>>>>>>>>> Declare the USB-C QMP PHY present on the Qualcomm Shikra platform.
>>>>>>>>>>>>>
>>>>>>>>>>>>> Signed-off-by: Krishna Kurapati <krishna.kurapati@oss.qualcomm.com>
>>>>>>>>>>>>> ---
>>>>>>>>>>>>>       .../devicetree/bindings/phy/qcom,msm8998-qmp-usb3-phy.yaml      | 2 ++
>>>>>>>>>>>>>       1 file changed, 2 insertions(+)
>>>>>>>>>>>>
>>>>>>>>>>>> Reviewed-by: Krzysztof Kozlowski <krzysztof.kozlowski@oss.qualcomm.com>
>>>>>>>>>>>
>>>>>>>>>>> ... and then I looked at the driver. So un-reviewed. Devices are clearly
>>>>>>>>>>> compatible. If not, explain what is not compatible.
>>>>>>>>>>>
>>>>>>>>>> Talos uses GCC_USB3_PRIM_PHY_AUX_CLK.
>>>>>>>>>>
>>>>>>>>>> In Shikra, we are using GCC_USB3_PRIM_PHY_COM_AUX_CLK. We don't have
>>>>>>>>>> GCC_USB3_PRIM_PHY_AUX_CLK.
>>>>>>>>>>
>>>>>>>>>> Hence, I didn't use a fallback compatible.
>>>>>>>>>
>>>>>>>>> This still explains nothing. How different clock makes interface for SW
>>>>>>>>> incompatible exactly?
>>>>>>>>>
>>>>>>>> So I went by the naming. AUX vs COM_AUX.
>>>>>>>
>>>>>>> The naming does not matter. If the clock is called
>>>>>>> "no_one_expects_spanish_inquisition", does that make software
>>>>>>> incompatible? Why would the name itself matter?
>>>>>>>
>>>>>>>>
>>>>>>>> Can I use a fallback compatible and in DT vote for "COM_AUX" clock with
>>>>>>>> clock-names mentioning "aux" ?
>>>>>>>
>>>>>>> I don't know, I asked what is different in software interface.
>>>>>>>
>>>>>>
>>>>>> Hi Krzysztof,
>>>>>>
>>>>>>     I checked with the hw team here and found out two things.
>>>>>>
>>>>>>     1. Shikra is a spinoff of Agatti and its sw interface (clocks used and
>>>>>> regulators used) is the same as agatti.
>>>>>>
>>>>>>     2. I thought we could use qcm2290 as a fallback since the phy register
>>>>>> init sequence is the same for Talos/Shikra/Agatti. The difference
>>>>>> between Talos and agatti when checked in the driver was the init load
>>>>>> settings. I checked with the hw team and they suggested using the init
>>>>>> load settings which talos was using.
>>>>>>
>>>>>>     Hence both these compatibles (qcm2290 and qcs615) cannot be used as
>>>>>> fallback for Shikra.
>>>>>
>>>>> Then I do not understand why you are using qcs615_usb3phy_cfg for
>>>>> Shikra. You say that the initialization is different, but you use
>>>>> exactly the same initialization. So in a meaning of compatibility
>>>>> between hardware for Devicetree they are compatible.
>>>>>
>>>> Hi Krzysztof,
>>>>
>>>>    There are 3 things:
>>>>
>>>> 1. Clocks used:
>>>> -> Talos supports AUX Clock since it supports DP over USB.
>>>> -> Agatti and Shikra use COM_AUX clock since they dont support DP over USB.
>>>>
>>>> 2. Phy register Init sequence - same for all 3 targets
>>>>
>>>> 3. Regulator init load:
>>>> -> Different for both Talos and Agatti
>>>> -> Recommendation is to use Talos regulator load values.
>>>>
>>>> SW interface wise, shikra is comaptible with agatti. If we use agatti as
>>>> fallback, we would end up using the platform data of Agatti where the
>>>> regulator init load is not suitable for Shikra. Hence not using Agatti
>>>> as fallback.
>>>>
>>>> Coming to driver changes, I used qcs615_cfg because it has required phy
>>>> register sequence and regulator init load as needed by shikra.
>>>
>>> So is it compatible with QCS615? If not, then something is incomplete or
>>> confusing. The driver uses the same software interface.
>>>
>> Sorry for the confusion. The Talos compatible represents the USB/DP PHY with
>> aux clock input, while Shikra is a USB-only PHY with com_aux input clock, so
>> the two PHYs are not compatible with each other.
> 
> According to the memory map, there is an (unused) DP registers part
> right after the QMP USB3 PHY. So, sofware-wise it is compatible to
> Talos. Having the different clock input means different integration of
> the block rather than the differences in the hardware block.
> 
> So, the block should be compatible to qcom,qcs615-qmp-usb3-dp-phy

It should still carry its own compatible though, to let the driver
disallow powering up the DP part

Konrad
