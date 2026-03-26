Received: from mx0a-0031df01.pphosted.com (mx0a-0031df01.pphosted.com [205.220.168.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 550C323EAA5
	for <devicetree@vger.kernel.org>; Thu, 26 Mar 2026 05:15:54 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.168.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1774502155; cv=none; b=kn+Fr3XHEaJ4bMtROwtV5iTSofueUN+1n5EzgwjdPixdEtMxlsslwCDvzkitl17NV1ZsbXB1cXoow9Czr9dxnGRouKTcgQ0uatqT7RQXXP1wFDwko8TZJ07ebFU4F6I1/aTTctfgUrl4QRrv9gb4dsZsZjC1USPqpfYTmmEriWI=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1774502155; c=relaxed/simple;
	bh=jIngtV7lw3vPEhiv+DRkYdMmvxbPvbNnD20qR2/tSR4=;
	h=Message-ID:Date:MIME-Version:Subject:To:Cc:References:From:
	 In-Reply-To:Content-Type; b=WcnsSmhVhrSvEk1vHN2bvrnS3MArDwuQ6pND8jnx0xH0vxqKRLsHr/5kmaXXFGr3hzJ4N04Np8zRO+vxRvye2SHfSM/XUHmt3IsMoYBMmNjuGIOfiRNSZzuErESZdOhVOcDDr2QUZaeBNS7fwl3Ys8e5+G9I9PNezr0N7IzC3j8=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=CQ3A9Tl/; dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b=UN0wCaDI; arc=none smtp.client-ip=205.220.168.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b="CQ3A9Tl/";
	dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b="UN0wCaDI"
Received: from pps.filterd (m0279864.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 62Q0jPSC1554493
	for <devicetree@vger.kernel.org>; Thu, 26 Mar 2026 05:15:53 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	9+aohIFgcTJgc8zRGatBOt8jhkb+aMJkB0K86/2Xfvo=; b=CQ3A9Tl/XxcWHKAN
	SlGMI6cntLsZjD2CbAhVtLqxUppsjfgLV47sVhwAiNLlRLpcmpi9zizvir8vW9pf
	BN7vmnp0lldpLHimpg7O0lOM/n4VIS+aDaKeaidqJiymBTI3WeU3jo1ZEYt0E5oX
	198Km3pVGrQ7LxkduOyi0/YNnSy3S71xcsBHOQLzTn7XZRWl61h3+Mt9vVY7hJH5
	I0aLBxfKs8OmD/aso9v+LyeVQYHd/X4cTLFwkDALtgMvCSkPaimrNgTNT7AGdYrn
	4URML9ZPxNCRfFnY45t98B0BS2Nf+Loo8vFs7OueFUIj1hL8uny11Y9It8T+GmEM
	Ub6hQg==
Received: from mail-pg1-f200.google.com (mail-pg1-f200.google.com [209.85.215.200])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4d4gj7axpy-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <devicetree@vger.kernel.org>; Thu, 26 Mar 2026 05:15:53 +0000 (GMT)
Received: by mail-pg1-f200.google.com with SMTP id 41be03b00d2f7-c7427e38669so85578a12.2
        for <devicetree@vger.kernel.org>; Wed, 25 Mar 2026 22:15:53 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1774502153; x=1775106953; darn=vger.kernel.org;
        h=content-transfer-encoding:in-reply-to:from:content-language
         :references:cc:to:subject:user-agent:mime-version:date:message-id
         :from:to:cc:subject:date:message-id:reply-to;
        bh=9+aohIFgcTJgc8zRGatBOt8jhkb+aMJkB0K86/2Xfvo=;
        b=UN0wCaDI92UyT41dWWR0AhpwXuiLcRjemg//2p1YXN2wbJIAXWD2wWvhCpWjz6Slsd
         /W1gRq/PX00ABuS8fGn6RZx+99ruP87YmbCXv2L7SeZa/PMPipyGGYRdII0Q5Dxu02Js
         YtDSt7L3S8h00Oe1BSnPre6sFZn/spNhBir694z53LdYm8W4Xoy2Z2vpZtQ69pwJie9a
         oS31nV/dflaGeHCGkMHP1RZ517OOW3HbLZV8d3G/XY3CuL3aveB1Rg1bzh4t6VlvL8uR
         wXGMOdHBY1g23CE9velvJYBC7LdkMVAgRAmE8vDCDaW70V4KUgkjOqZmhXBdnIiVwpbw
         gkOw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1774502153; x=1775106953;
        h=content-transfer-encoding:in-reply-to:from:content-language
         :references:cc:to:subject:user-agent:mime-version:date:message-id
         :x-gm-gg:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=9+aohIFgcTJgc8zRGatBOt8jhkb+aMJkB0K86/2Xfvo=;
        b=aLxiIUvUrZyWwNWRdVu0YOG7aX9qxT071Qr+DowZ+VO1E9iei8oUf7hbMC3aNcR2F9
         xKOe6vQ7udTdENPxHLyGycZWGM8qmVZb0OMuAWsP+Awn5SXojf+8vuUahFXnXyxmRLq0
         k15HA0A0UdwKJ5IRVVCHzsFz9R0LEDmKACIKtfXkoA+jk8uIHNsxu2QPJD1DmUS2pNen
         59lceDiO6YweQzyS3cC5Wi0et8UelA1FT0tJf963xWtjV6Py1W4SQ7bH9VP3lQa4XQmT
         Nitdt80VU7qZyUedVPMkg92gRssZAop/z9HBuTGFswRc6BF0vhCRSXB/fVne9U7F9bcT
         4geA==
X-Forwarded-Encrypted: i=1; AJvYcCWScodePkihj+GSOUnWnG7TRwUBBm6ZEuYQkQ/cyeQIyibXrcfgvj5d1EH6Y7YzVtTUMGzg9gvUa6wb@vger.kernel.org
X-Gm-Message-State: AOJu0YykKw04z72hT6em1JgKhuJ9ixtla832W6/icnj/8F1EzZd+LRZ3
	16Y64OHfuaOsEr5iXNFJU1+YmkRizz90wxvus1h0oVZfYgqkdvPTKSqjN7vRf/TNY7kmpNibwNv
	5ybEmQGndLGmCW285rvylSffobBP3Z3qVqFHBpG49Y42a9wbXuVrLrXFZ/WY+kfHP
X-Gm-Gg: ATEYQzxNPiQRmpyicAtQIjrvD2avh/wGIlxVT4FfG7p3+NkiyYRH353lxlPcQfL/h6h
	iM5d8BDyYroJjgp8QcK+V7Udu2aVnwOpMzKTvjr+ije4VaItaeuGAFAciG38JXYhkHlUdMDrIJh
	x1c9SSwTLJVwciMhGddQSFJ7yA2ZJx8gssGh/es3xpW8JnJxl15TqLsgPrZd9ANDRhgXz0GV0BO
	baYx4vDPA/Zl0L9V2aJeoj8AXLYYsYlXRS3/ucZ1ZBH1erWlzLZd4BJ++JA90X5utZLlxfd+Goe
	MdvQVGiWq7Ju5huH3bjk2JtGNc/RlqMrzfQ1+O97azqjhc5ik+BDipuIaAVxA+Hbon8yVOcmUWC
	BibMj/rMqC4yMrhTGQEOiWqj6q6JN7iP40b39EqeztSAn+w==
X-Received: by 2002:a05:6300:95:b0:39b:8b59:4ec9 with SMTP id adf61e73a8af0-39c4a794ecamr4511556637.0.1774502152911;
        Wed, 25 Mar 2026 22:15:52 -0700 (PDT)
X-Received: by 2002:a05:6300:95:b0:39b:8b59:4ec9 with SMTP id adf61e73a8af0-39c4a794ecamr4511539637.0.1774502152377;
        Wed, 25 Mar 2026 22:15:52 -0700 (PDT)
Received: from [10.231.195.100] ([114.94.8.21])
        by smtp.gmail.com with ESMTPSA id d2e1a72fcca58-82c7d388f92sm1630877b3a.38.2026.03.25.22.15.48
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Wed, 25 Mar 2026 22:15:51 -0700 (PDT)
Message-ID: <ed5a18f8-04f9-4c4f-b4a8-9fc2a277ac40@oss.qualcomm.com>
Date: Thu, 26 Mar 2026 13:15:44 +0800
Precedence: bulk
X-Mailing-List: devicetree@vger.kernel.org
List-Id: <devicetree.vger.kernel.org>
List-Subscribe: <mailto:devicetree+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:devicetree+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH 4/6] arm64: dts: qcom: kaanapali-mtp: Enable bluetooth and
 Wifi
To: Dmitry Baryshkov <dmitry.baryshkov@oss.qualcomm.com>
Cc: Jingyi Wang <jingyi.wang@oss.qualcomm.com>,
        Bjorn Andersson <andersson@kernel.org>,
        Konrad Dybcio <konradybcio@kernel.org>, Rob Herring <robh@kernel.org>,
        Krzysztof Kozlowski <krzk+dt@kernel.org>,
        Conor Dooley
 <conor+dt@kernel.org>, aiqun.yu@oss.qualcomm.com,
        tingwei.zhang@oss.qualcomm.com, trilok.soni@oss.qualcomm.com,
        yijie.yang@oss.qualcomm.com, linux-arm-msm@vger.kernel.org,
        devicetree@vger.kernel.org, linux-kernel@vger.kernel.org,
        20260224-knp-dts-misc-v6-0-79d20dab8a60@oss.qualcomm.com
References: <20260322-knp-pmic-dt-v1-0-70bc40ea4428@oss.qualcomm.com>
 <20260322-knp-pmic-dt-v1-4-70bc40ea4428@oss.qualcomm.com>
 <b5ogt5phzzifh45zyvzbressexgp4se5m7vvgmvaf3ed723hww@qovynwnps455>
 <13745334-c2dd-4a97-90de-a5ee18cff6a7@oss.qualcomm.com>
 <hyy65v74scdekci3kdowxdcujbmoeyx3vxv6dahvif6rzhloxi@rirggsitayqv>
 <ee38eaeb-d408-4228-b7a8-bc2d6e4ef056@oss.qualcomm.com>
 <c46islnlfzdawtw4o3holunf2a6rvfs7h5dznaggzptatdlqc6@7pjbwcqdtccl>
 <0279f334-95ed-4df8-9e42-749fd854c551@oss.qualcomm.com>
 <3xb6ya4zxhmaode3u3al5r4g3rfzlq2ifbyodvwtr3qgt34pwc@ia2xqfaeufd2>
Content-Language: en-US
From: Zijun Hu <zijun.hu@oss.qualcomm.com>
In-Reply-To: <3xb6ya4zxhmaode3u3al5r4g3rfzlq2ifbyodvwtr3qgt34pwc@ia2xqfaeufd2>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit
X-Authority-Analysis: v=2.4 cv=M9hA6iws c=1 sm=1 tr=0 ts=69c4c109 cx=c_pps
 a=oF/VQ+ItUULfLr/lQ2/icg==:117 a=Uz3yg00KUFJ2y2WijEJ4bw==:17
 a=IkcTkHD0fZMA:10 a=Yq5XynenixoA:10 a=s4-Qcg_JpJYA:10
 a=VkNPw1HP01LnGYTKEx00:22 a=u7WPNUs3qKkmUXheDGA7:22 a=DJpcGTmdVt4CTyJn9g5Z:22
 a=1mDv_yBIlbhTikghve4A:9 a=QEXdDO2ut3YA:10 a=3WC7DwWrALyhR5TkjVHa:22
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYwMzI2MDAzOCBTYWx0ZWRfXxChGqFhb7InB
 sK+Cn3UHhXO5diCWf5OsTpYWcreXx1gYIzgitHeDO6krqeBR8U/q8T8kdHT78mFDlAyHZK5/hoT
 RjOWBW0D9oVbpFE1w2Y2oJahVLiO1KTWSXiTbLrKkyhTm+67bcs2tjNz3w3D7+Yt0PrOKL+2nTo
 +gMTN8/2olUyumPui2htOzkpQfOfJis8oXZhbmq7FGqT64eLgprRrtHzRly7/q1fOiQgtuHZHRT
 GCwRiyfAiRHWeIK2kKge/lRP5w6UxZaZMaqNP6HydLgUClxEJlwgyvoIx0wOIlSHytnhPz9oBmO
 582OtUOT6ZJ8ewtTzoVU/o8kwX+C2Zw5UaeWtTD9m27L9Ou6V4HP4iN/OZ2C1EJPfAbIeGlaJ69
 NM6+bcA4i/yOqdEG9qCMjMRzCgG9RJUOACw7mWI87tQOW4btWjcR1hP/DUiusuoHoqf/IKrqrqB
 WJMhENu79OlOY1J2UHA==
X-Proofpoint-GUID: EKfd_859Fzwx76TBFTg1sF86yo0EDU-R
X-Proofpoint-ORIG-GUID: EKfd_859Fzwx76TBFTg1sF86yo0EDU-R
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1143,Hydra:6.1.51,FMLib:17.12.100.49
 definitions=2026-03-26_01,2026-03-24_01,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 clxscore=1015 priorityscore=1501 bulkscore=0 impostorscore=0 spamscore=0
 adultscore=0 malwarescore=0 phishscore=0 lowpriorityscore=0 suspectscore=0
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.22.0-2603050001 definitions=main-2603260038

On 3/26/2026 12:10 PM, Dmitry Baryshkov wrote:
>> 3/25/2026 7:40 PM, Dmitry Baryshkov wrote:
>>>> On 3/25/2026 3:08 PM, Dmitry Baryshkov wrote:
>>>>> On Wed, Mar 25, 2026 at 02:40:19PM +0800, Zijun Hu wrote:
>>>>>> On 3/24/2026 9:16 AM, Dmitry Baryshkov wrote:
>>>>>>>> +
>>>>>>>> +	wcn7850-pmu {
>>>>>>>> +		compatible = "qcom,wcn7850-pmu";
>>>>>>>> +
>>>>>>>> +		pinctrl-0 = <&bt_default>, <&sw_ctrl_default>, <&wlan_en>;
>>>>>>>> +		pinctrl-names = "default";
>>>>>>>> +
>>>>>>>> +		bt-enable-gpios = <&pmh0104_j_e1_gpios 5 GPIO_ACTIVE_HIGH>;
>>>>>>>> +		wlan-enable-gpios = <&tlmm 16 GPIO_ACTIVE_HIGH>;
>>>>>>> swctrl-gpios?
>>>>>> it is '<&sw_ctrl_default>' within 'pinctrl-0' above.
>>>>>> the input pin is not used by power sequencing driver.
>>>>>> just give it some default configurations here.
>>>>> Please don't mix hardware description and the driver. If the pin is
>>>>> wired, let's describe it in DT.
>>>>>
>>>> give comments about that pin in this dts file ?
>>>> or give a seperated patch to describe the pin in DT binding schema of "qcom,wcn7850-pmu"?
>>> It is there, as far as I remember.
>>>
>>> $ grep swctrl Documentation/devicetree/bindings/regulator/qcom,qca6390-pmu.yaml
>>>   swctrl-gpios:
>> swctrl-gpios may be not applicable for 'qcom,wcn7850-pmu' since there is no 'qcom,wcn7850-pmu' node
>> which configures 'swctrl-gpios' within upstream DT tree.
> It's a wrong way to check it.
> Instead follow these steps:
> - Is the pin defined in the datasheet?
datasheet define this pin SW_CTRL with description 
"Switch request to the external PMU between active and sleep mode"

> - Is the pin defined in the schema?

schema define property 'swctrl-gpios' with description
"GPIO line indicating the state of the clock supply to the BT module"

> - Is the pin wired in the hardware?
pin SW_CTRL is wired in hardware.

i have below confusions about 'swctrl-gpios' of 'qcom,wcn7850-pmu'
which WCN7850 pin is 'swctrl-gpios' mean for ?
Why to introduce 'swctrl-gpios' ?
what problem does it solve ?
how to solve the problem ?





