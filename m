Received: from mx0a-0031df01.pphosted.com (mx0a-0031df01.pphosted.com [205.220.168.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 53BA930569B
	for <devicetree@vger.kernel.org>; Sun, 24 May 2026 18:44:52 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.168.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1779648293; cv=none; b=PmsqnJwspLxeuJW9esKOvJpNGOgFkvRxyt9Au5YgIRTmgoVKJ2SqiSYQYO7rBRzuXDAh6u65sTo6mmhmN6G/bJJ/RBmz4iWBgI8V3jIh9MLG16rWpD4Mumc6zkOpKsiiTY+yeUaBd0zVTX7CKkkWLWKxfI6WZJSefkS1Vdzhg7I=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1779648293; c=relaxed/simple;
	bh=HfPJ6WVT2txT3snCLHytxgQt6a74/qAqmSTcEbxxwpw=;
	h=Message-ID:Date:MIME-Version:Subject:To:Cc:References:From:
	 In-Reply-To:Content-Type; b=shStwGX8FuHp6ERmSDLN1/rsKSQnqkZsGgruIskCrQBDAdgrBPrNUgy7/8G2PfcqyogkyXr0SsOIj1xW0AQQeOp/yQKSIZciSxziU2E1pAq1gXWAmwOS2c/ul6h2a12VeikJbIQhPDbIiLLK56k7CsFtO10uGls5p1xwD30nJZQ=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=HKReN7M5; dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b=NXwtot7O; arc=none smtp.client-ip=205.220.168.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b="HKReN7M5";
	dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b="NXwtot7O"
Received: from pps.filterd (m0279865.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 64OITkc32501783
	for <devicetree@vger.kernel.org>; Sun, 24 May 2026 18:44:51 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	h4DTHtE1JKwREv05zt0FTUjVFjlnvXiHherii1MzyhU=; b=HKReN7M5un+B4Gm1
	POzvedoR5K4EqGYImuq6A0IJDwFGDeBm0DZw5YeL3OZvk3+9D7EDtZH35BPEjj7G
	rVIzylQC9FYDys1Zpbg5wPWeXu1NctbYMz7CKDXgpBqj1Kn+aJ2XCoXqTPgRfiUy
	vvddPgkzG86GitwOaA726bUangkLmnuyquoWvZaIkM+RCGVXQMPJ2w2q8sEdd+rc
	8IsfsoWl/xsx5XLpFsmYgX55YkOrxEqkcwIGfS3Lkt2Kq4xBtPL0ndMVdzXLDizo
	Hyn5uGFKnRwtLGgVjpe5Bd6c8uzB/nIhKEU4fsl5hr6e8+OH4akyP4LLE1LNJW//
	AHAbsw==
Received: from mail-pl1-f199.google.com (mail-pl1-f199.google.com [209.85.214.199])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4eb36t3xqa-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <devicetree@vger.kernel.org>; Sun, 24 May 2026 18:44:51 +0000 (GMT)
Received: by mail-pl1-f199.google.com with SMTP id d9443c01a7336-2baedd2fd43so60841725ad.1
        for <devicetree@vger.kernel.org>; Sun, 24 May 2026 11:44:51 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1779648291; x=1780253091; darn=vger.kernel.org;
        h=content-transfer-encoding:in-reply-to:from:content-language
         :references:cc:to:subject:user-agent:mime-version:date:message-id
         :from:to:cc:subject:date:message-id:reply-to;
        bh=h4DTHtE1JKwREv05zt0FTUjVFjlnvXiHherii1MzyhU=;
        b=NXwtot7O7xp7BrVa9pm/4sFNw8CERuc1kLUdrPR7/BiPVMfZ4Hp9jcWF/MtcKA/NII
         Y7X5AoqOPpd4ffiDL4nwr9X1ZiOAUxTTIwSRo1Rn3/891VZSvz1mauiYjeSY/elgkHVi
         tNnW0YpmZ+H2iLKLiVRu5fqvG8bWhI+G9Udd9xItdHlUz32ucwQ5bMOkNTpnIeuRq+H6
         VdFMxT2yNozOZuR/kTUoG5EO95xaF9WwgSJ77+oiyyGpsE//JmGl7BqBae+mSd0dE/Vk
         RQIaQOiIrt+JsfrjjZIigfD9asrKeYOSYbJYwNI7ZE4Se7KUsZflB6I2n5KZ094YDiGu
         ljmw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1779648291; x=1780253091;
        h=content-transfer-encoding:in-reply-to:from:content-language
         :references:cc:to:subject:user-agent:mime-version:date:message-id
         :x-gm-gg:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=h4DTHtE1JKwREv05zt0FTUjVFjlnvXiHherii1MzyhU=;
        b=snJj+u/oT22b7mndzvOW/w6lP++FUj1pSgKgfpIVJZNGaDMbppILiWkgBvJbYrz3Io
         vCH2T5OcKpXAOZ1YGEEJYgA0q0pk5Jf4Q+8RRuSoZ2b0mnOMHeA+YSs0ufnytg9v/LHw
         c7/bJt+R+ILu3bFrboE0+ja1/n0XtGZFoT8ht7wSlRhb3vLcOycaapb3puD7NZynKNbl
         jOTLeedB+Ah9XR8QveAzQiiEa+Nrokkt9VFVTtoqMT8GklffNa0VKUMM5xq4kR7aZ+db
         qRSHYM6aMaD6xMsRXAQQGlTSpdA6OuEzQbHnbVt31/WzFAVzLiUSO5qcBSmYrpbC45OU
         UTvg==
X-Forwarded-Encrypted: i=1; AFNElJ8wX3U60jeK4nijPmD+1RDp+u2/tT3r7MoCj9b71de9Zq0ysK4HPI2LJQmLvJYB+SIkHdb1IYRvUFu0@vger.kernel.org
X-Gm-Message-State: AOJu0YyBw07rPmZEY0k8cVt2TYcvVA5EIvs3h1PzoEPXKRqk1pzoXvZE
	47ENzqocxa1r143TzPsVf09m+3YqMvQe8SUdCaZA1QOcY7GD18lTW8Zgj9az90Kp94dkhZ9TsIU
	l07IXBQ7xO2rJ5abmjTLow7n8U+ZeuG9URVK7IE4aE0915AjOjC+P/uG+wAAu0koy
X-Gm-Gg: Acq92OF5A0rmohk1hb5DOU5JCDgomXyYVk9VH8+uJlh0uiGnVAYUm8SgdAI4H8/fejW
	z7lqaG2z1RNuXQGxXMYSC5J3ZPcXBL92FXWkqH4C+GKFBNIhoE+t9P6mjMR9zo2iTX+n4Eav2UG
	nXDIcf/MLr5OcMQ1JRfDXerFIYhb6ZF/OAq0nL7OFafTOtEs7qkcdzxSVjeiZCYm68UmsUf17Uc
	n/rmYh1f5TVsAO4hLnDKT57cXVwkjwp0XBStZCAzJQgtfo+rYMBwwjg0oUcXBeZEl5b916IjbKX
	cr2uRWdwfCRtntnzvOi8TuJXjuxxwq/ei8w5tXLI0GYnyW1Mro+RLDtD763UQpDcXWwrGNtl4BP
	dhc0BtqvIvOeqAjhQI30MNaLSco0tbgjfNveOPgSmUKT3x1ROBq6LVfM/Hm+mGkcNtWj+MVBlPA
	==
X-Received: by 2002:a17:903:3c0c:b0:2bd:612b:912d with SMTP id d9443c01a7336-2beb05e2d23mr121490585ad.14.1779648290699;
        Sun, 24 May 2026 11:44:50 -0700 (PDT)
X-Received: by 2002:a17:903:3c0c:b0:2bd:612b:912d with SMTP id d9443c01a7336-2beb05e2d23mr121490445ad.14.1779648290191;
        Sun, 24 May 2026 11:44:50 -0700 (PDT)
Received: from [192.168.29.125] ([49.43.232.17])
        by smtp.gmail.com with ESMTPSA id d9443c01a7336-2beb56e090fsm80802325ad.34.2026.05.24.11.44.44
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Sun, 24 May 2026 11:44:49 -0700 (PDT)
Message-ID: <07a55b72-eeac-4a38-b226-df8836faa145@oss.qualcomm.com>
Date: Mon, 25 May 2026 00:14:08 +0530
Precedence: bulk
X-Mailing-List: devicetree@vger.kernel.org
List-Id: <devicetree.vger.kernel.org>
List-Subscribe: <mailto:devicetree+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:devicetree+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH 1/3] dt-bindings: interconnect: qcom,x1e80100-rpmh: add
 clocks property to enable QoS
To: Dmitry Baryshkov <dmitry.baryshkov@oss.qualcomm.com>,
        Krzysztof Kozlowski <krzk@kernel.org>
Cc: Georgi Djakov <djakov@kernel.org>, Rob Herring <robh@kernel.org>,
        Krzysztof Kozlowski <krzk+dt@kernel.org>,
        Conor Dooley
 <conor+dt@kernel.org>,
        Rajendra Nayak <quic_rjendra@quicinc.com>,
        Abel Vesa <abelvesa@kernel.org>,
        Bjorn Andersson <andersson@kernel.org>,
        Konrad Dybcio <konradybcio@kernel.org>,
        Odelu Kukatla <odelu.kukatla@oss.qualcomm.com>,
        linux-arm-msm@vger.kernel.org, linux-pm@vger.kernel.org,
        devicetree@vger.kernel.org, linux-kernel@vger.kernel.org
References: <20260422-x1e80100_qos-v1-0-bcc2afe4cc78@oss.qualcomm.com>
 <20260422-x1e80100_qos-v1-1-bcc2afe4cc78@oss.qualcomm.com>
 <20260423-thick-beneficial-capuchin-e4aaad@quoll>
 <99830e85-5837-4ed5-8f89-fea5d3e632f8@kernel.org>
 <c583a03f-381d-4af9-acb0-ac47a1e35b47@kernel.org>
 <7oador7jxw443astffc6hjuf3gots64fqmvsjdsshfhhonc2l7@2unu723p2orx>
 <12e149c4-60f9-4ffb-b066-7611bdd15786@kernel.org>
 <nr62mvz6qrpb6moqyasniqcqtfltsx4qtr3lteeixwutindqri@5joujdvn4r3q>
Content-Language: en-US
From: Raviteja Laggyshetty <raviteja.laggyshetty@oss.qualcomm.com>
In-Reply-To: <nr62mvz6qrpb6moqyasniqcqtfltsx4qtr3lteeixwutindqri@5joujdvn4r3q>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit
X-Proofpoint-GUID: pLZ6W0SayG275xRZQ9GgwYKzjszgsubY
X-Authority-Analysis: v=2.4 cv=Fto1OWrq c=1 sm=1 tr=0 ts=6a134723 cx=c_pps
 a=JL+w9abYAAE89/QcEU+0QA==:117 a=Np7tGMHckr7TqWT9mUvMjQ==:17
 a=IkcTkHD0fZMA:10 a=NGcC8JguVDcA:10 a=s4-Qcg_JpJYA:10
 a=VkNPw1HP01LnGYTKEx00:22 a=u7WPNUs3qKkmUXheDGA7:22 a=Um2Pa8k9VHT-vaBCBUpS:22
 a=Qe6B47XUAAAA:8 a=EUspDBNiAAAA:8 a=9WfpK7l04UvUAjPDmO8A:9 a=QEXdDO2ut3YA:10
 a=324X-CrmTo6CU4MGRt3R:22 a=QWPKR-PWjQKaio0naagv:22
X-Proofpoint-ORIG-GUID: pLZ6W0SayG275xRZQ9GgwYKzjszgsubY
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYwNTI0MDE4OCBTYWx0ZWRfXxFTAkwB9eb+m
 SNasNMosYymr3xA5Rioadr0B2b2hhcyDGeIYKb+4qEQdDngr2pIMV9JqaI/CiHei5HnXDn5+XS2
 Pny9dsuL1orSpWOPCdhmCK4TFay2wXamJVlvEwNJdpjENz0n39ChB5RTiZAZubEv9yw7ym7Ech9
 yktDSETWMQzJQQjDwGKL8jMWGySka6wcn8xa+R6Hraaxj9x/61jkyd1mi9nVt99aqsdjHwM4uQJ
 k/rYRArg8QDZIY0qx6wkPTHqy/51hvrKDK7fHn+PEeyjRooyrb43LLTIqSr6UErHwxhgm0w0yXK
 M1st8T0ThjbvpGYjGdqKS6HNfDG6fNUSbpmQk/2p8wuWJKRXAh3eDxxhXdC2129iK+M/yiwbiQc
 8O4tuUAwTH2OJng0IEd2xjOfVKM5CFYhLD6JoxG6bjThkXcvwlTwcNKuRdelZuvH6a+w0DfJAX7
 V2w1+2qjCJdALpzntzw==
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1143,Hydra:6.1.51,FMLib:17.12.100.49
 definitions=2026-05-24_06,2026-05-18_01,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 phishscore=0 bulkscore=0 malwarescore=0 priorityscore=1501 impostorscore=0
 lowpriorityscore=0 spamscore=0 clxscore=1015 adultscore=0 suspectscore=0
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.22.0-2605130000 definitions=main-2605240188



On 5/21/2026 5:26 AM, Dmitry Baryshkov wrote:
> On Wed, May 20, 2026 at 09:33:52PM +0200, Krzysztof Kozlowski wrote:
>> On 20/05/2026 21:27, Dmitry Baryshkov wrote:
>>> On Wed, May 20, 2026 at 10:11:47PM +0300, Georgi Djakov wrote:
>>>> On 5/20/26 9:51 PM, Krzysztof Kozlowski wrote:
>>>>> On 23/04/2026 10:38, Krzysztof Kozlowski wrote:
>>>>>> On Wed, Apr 22, 2026 at 02:05:11AM +0000, Raviteja Laggyshetty wrote:
>>>>>>> Some interconnect nodes on X1E80100 have QoS registers located inside
>>>>>>> a block whose interface is clock-gated. For those nodes, driver
>>>>>>> must enable the corresponding clock(s) before accessing the
>>>>>>> registers. Add the 'clocks' property so the driver can obtain
>>>>>>> and enable the required clock(s).
>>>>>>>
>>>>>>> Only interconnects that have clock-gated QoS register interface
>>>>>>> use this property; it is not applicable to all interconnect nodes.
>>>>>>>
>>>>>>> Signed-off-by: Raviteja Laggyshetty <raviteja.laggyshetty@oss.qualcomm.com>
>>>>>>> ---
>>>>>>>   .../bindings/interconnect/qcom,x1e80100-rpmh.yaml  | 62 ++++++++++++++++++++++
>>>>>>>   1 file changed, 62 insertions(+)
>>>>>>
>>>>>> Reviewed-by: Krzysztof Kozlowski <krzysztof.kozlowski@oss.qualcomm.com>
>>>>>
>>>>> And unreviewed as it breaks users:
>>>>> https://krzk.eu/#/builders/102/builds/70/steps/23/logs/warnings__3_
>>>>>
>>>>
>>>> I will just drop these patches for now, i have put them in a separate branch anyway.
>>>
>>> I think, dropping 'required' clause would be the easiest fix. Or just
>>> wait for Bjorn to pick up the DT changes.
>>
>> Could be, initially I thought this is actual impact on users, but indeed
>> now I recall that driver prints "info" message and continues. So the
>> binding is not correct.
> 
> I'd say, the binding was not correct: the hardware has the clocks and
> the requires them to function completely correctly. I think, the problem
> is that we allowed incomplete drivers and incomplete bindings (Without
> QoS support).
> 

Thanks for pointing this out, and sorry for the breakage caused.

This is one of the earlier targets where interconnect support was
upstreamed without QoS support. Making the `clocks` property required broke
existing DTs for that target, if the corresponding DT changes are not 
picked.

For newer targets, this should not be an issue as QoS support is introduced
along with interconnect.

I will respin the patch following commit  
e07f3b8c9e1c ("dt-bindings: interconnect: qcom,qcs615-rpmh: add clocks 
property to enable QoS"),  
keeping the QoS-related clocks optional to maintain backward compatibility.

Thanks,
Raviteja.
