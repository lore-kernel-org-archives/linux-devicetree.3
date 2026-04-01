Received: from mx0a-0031df01.pphosted.com (mx0a-0031df01.pphosted.com [205.220.168.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 3C72C40DFCA
	for <devicetree@vger.kernel.org>; Wed,  1 Apr 2026 15:21:27 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.168.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1775056889; cv=none; b=fmetmguT2NmwbzEn51DV0MksfmPfPQOtGIdcH/zA16gi75qPRvI6d+qUgu9jjEtKpA0JriS+laYaaJkeRDbIiF6NWaJW26vvxxHzTrvu4igi+GOwhjuu/HMemRD36XWGkuF5W+cgn6BdTlwTM80iaJuUx031mhaoPMlkrh6bh2w=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1775056889; c=relaxed/simple;
	bh=6laieGMKvo4gOFbBEOBAqhiW6yg+Q9NNRoJJu4Owx+U=;
	h=Message-ID:Date:MIME-Version:Subject:To:Cc:References:From:
	 In-Reply-To:Content-Type; b=Hier73T+FQ0iq7Zsjx57SC5YVruq1+Xcy4sA24X2ta9DiIyv5SiZJHR8JMjXn/2DFKRTy2GGoNLevIUw//Y0LcbK1h3p6z2b283NBoo8v8WU8E58tM0FgnNSad631YAYqYy8GgYYzRv0kvgbmD/cdEf/j8ZZjfH66rl4VxnqZsM=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=RX4ZZFYN; dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b=e9HtK71Z; arc=none smtp.client-ip=205.220.168.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b="RX4ZZFYN";
	dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b="e9HtK71Z"
Received: from pps.filterd (m0279862.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 631ESUGM3174257
	for <devicetree@vger.kernel.org>; Wed, 1 Apr 2026 15:21:26 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	AG9FdGiFyQFH+H+XHLnITj+9mA3P4Sk3/IrlWSvObjY=; b=RX4ZZFYN/EgAFOtv
	HGIYG4QnwpnCLl8+wzvShrgMQG+rXiUuI9NsZ7hxbIJz2RZPmUTLrjENI2VRZ6Ab
	0pBrOXtEd1x24ZhAFd8s8ljqYWTns8UPyUS7NC3dkiLjm6rm7K4lEbRRB/Sb97F3
	xb9IPW6M16oCSVMIifglUZAzz0M8Xw+Ouk6/OA3/XaPv7tQgu0Tu825YNjzHQG1Q
	lj5Wmczq964L2YayT/gm5cqziiCepQlGgNTejEzRGFBoBRw8kNzEUgzY+x8BBfAi
	Gn8jIJjE77NSqLeJowXeEEQ6ZElSa2o6ajOqVbDnks/yoQhmXWy3XagajAjhvG/M
	BKNtfw==
Received: from mail-pf1-f197.google.com (mail-pf1-f197.google.com [209.85.210.197])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4d90gbhkc0-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <devicetree@vger.kernel.org>; Wed, 01 Apr 2026 15:21:26 +0000 (GMT)
Received: by mail-pf1-f197.google.com with SMTP id d2e1a72fcca58-82a80fb4566so2217711b3a.3
        for <devicetree@vger.kernel.org>; Wed, 01 Apr 2026 08:21:26 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1775056885; x=1775661685; darn=vger.kernel.org;
        h=content-transfer-encoding:in-reply-to:from:content-language
         :references:cc:to:subject:user-agent:mime-version:date:message-id
         :from:to:cc:subject:date:message-id:reply-to;
        bh=AG9FdGiFyQFH+H+XHLnITj+9mA3P4Sk3/IrlWSvObjY=;
        b=e9HtK71ZGbC4efqUOLekFVor/98Pp7YUHJNSTqPfLhCU740KV0Tl8OTB+4z3HhGfwO
         G/xG/anBpX2rtNQgXO+rYhHqNN+hvMBtaN/xHnpf5YmYr5yKrZH6eP+GrTk3429WD0Da
         XH1Egh138IkSgPYDaG7w7m3YwI5l0LaVKw7+uDCiYgLF17ZNfXeZHrXy2cdJKrTTnaBl
         j+47SrMnfqsWdUZYXHCoI8MXoO+mKtfo/W4U4c586LUaQ6+R86gEyZpp6X0E4EmioG+a
         Xi8RPtntxlTKfV8nGUReieE/Xva2yLJS1HbsqOGsw6CELkCY6X9X/776Exs2zorQn+g+
         5vMw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1775056885; x=1775661685;
        h=content-transfer-encoding:in-reply-to:from:content-language
         :references:cc:to:subject:user-agent:mime-version:date:message-id
         :x-gm-gg:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=AG9FdGiFyQFH+H+XHLnITj+9mA3P4Sk3/IrlWSvObjY=;
        b=dfwnClpnmk2/ukr0Y4vl2LUuoytig6M0j4qEqETJJU5rGFWXld34ikqfLQpLj5n9l1
         pe6HbqqkcFZdEfCkjIGLi+zBLsyPFsDmCXrZ37M7OE8VooyiSKtd2o3CEZXN4emEYduq
         qGeL09MShp1HSeb+kdJAtP0rLauKJcpbXq64/II9bEu7c90m98w+H+gH1yLc3mVjprRS
         Bhv7IVHWggAuWO/f+vq453ZbsxMmQ3v+zo1XOYbj4uZ3ifHqLnU00PGIVHG21BiqHsGI
         GydCDY8N7E88gFw20grbmaEqTfnu/VYv2YBAVlCp5Lyev8zBt4nLbT7rEqcaiaIqOuw+
         4u2g==
X-Forwarded-Encrypted: i=1; AJvYcCXLnbgf+t3DyHJF5v9iy080w92l9mCjSTSpmiR5bLHjzOXjMcsXo6mq9uZP6QIw//Q6tLwjFxO6oRAF@vger.kernel.org
X-Gm-Message-State: AOJu0YyZJavtBT/y82BG9Lwc4RVkHnC8AT0QGe9+oz4hXUvR2yTITqj8
	yTeGPjMI3T2jq+uD6JJcDj/5Gg4XvW+9Ki98l8MNBKHsjZNTtHcmN4MfcgqbP+mj2tc1w4h/4p0
	kbbO+pK3bzvI3qSiOV3Citp5BZo2lwtq04knyccMSST419nEXnOOlJdPJxD1CrB+c
X-Gm-Gg: ATEYQzwCxlcrBsNeVJCNJIGPql1s5ZTMHks/ppbhjDZluRTpZubHhkIUjrlYP8HkXyE
	4tRiuqrtdoEQn3RC8Z89fYp65EJyh+pG4h66ruynGk7rnKHB9K7/Ywt9EU/MeeVHuqn+CUwOABV
	WxrX+ebZq/6OA6LWNIo9ZTeyNVHI/BKZ5/8v44UBA8lYFmhWfiYX9cni1lN5i1os2bhDiOfLVLD
	mJbax0wq6D3lAe7krQOj7N8koibD9lRUwnZcM9AJDQ5qHrDfLoWzriThPBFm1HTPA4dqsbFMB4X
	urEklZ4igJZ1Nm7vVoekwFU9ReNGwISXH+k3+X0ZWalqC4fHWVlkCAe3+UrkiPTagJsc9u8apHB
	Ge4VREGxHoIbYh3twt3BgUg9BzpusmLH2dLT0+lDoIRlK7WDu49NPxIJRFX7BexfMq0FUn5cyW2
	gTb84GvXEe
X-Received: by 2002:a05:6a00:2e1e:b0:824:cb8f:2a06 with SMTP id d2e1a72fcca58-82ce8ae212cmr3006842b3a.3.1775056885458;
        Wed, 01 Apr 2026 08:21:25 -0700 (PDT)
X-Received: by 2002:a05:6a00:2e1e:b0:824:cb8f:2a06 with SMTP id d2e1a72fcca58-82ce8ae212cmr3006814b3a.3.1775056884957;
        Wed, 01 Apr 2026 08:21:24 -0700 (PDT)
Received: from ?IPV6:2406:b400:b5:dc96:4944:a8fe:d32d:b4b0? ([2406:b400:b5:dc96:4944:a8fe:d32d:b4b0])
        by smtp.gmail.com with ESMTPSA id d2e1a72fcca58-82cf9ca1869sm233014b3a.56.2026.04.01.08.21.20
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Wed, 01 Apr 2026 08:21:24 -0700 (PDT)
Message-ID: <9f1d7aae-42b3-4e0a-8cac-39db2ea84521@oss.qualcomm.com>
Date: Wed, 1 Apr 2026 20:51:17 +0530
Precedence: bulk
X-Mailing-List: devicetree@vger.kernel.org
List-Id: <devicetree.vger.kernel.org>
List-Subscribe: <mailto:devicetree+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:devicetree+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH 1/2] arm64: dts: qcom:
 qcs6490-rb3gen2-industrial-mezzanine: Add model string
To: Bjorn Andersson <andersson@kernel.org>,
        Dmitry Baryshkov <dmitry.baryshkov@oss.qualcomm.com>
Cc: konradybcio@kernel.org, robh@kernel.org, krzk+dt@kernel.org,
        conor+dt@kernel.org, richardcochran@gmail.com,
        linux-arm-msm@vger.kernel.org, devicetree@vger.kernel.org,
        linux-kernel@vger.kernel.org
References: <20260309121936.1289615-1-umang.chheda@oss.qualcomm.com>
 <rdglzhmncexfcvec5hyenj7jx3m5hsphjlxsaeq2zhi4z4arml@bjeqghbbaoa2>
 <64f43d77-7c09-453e-8d7b-b4e0e5f05598@oss.qualcomm.com>
 <gmeo7kiryfh3qxspzidpwknxgmxqeqr6on2glrjj4tioh6apv5@p6rxe3jw2rkm>
 <0a44b9ea-9f2d-496e-8915-45186433dc1e@oss.qualcomm.com>
 <srndqldc5c3hr3vozvndl4zt66jb47b3iwyjghiqcjg2uoespg@yxg2hvugjrwe>
 <acSfUEVueSR5Ikq7@baldur>
Content-Language: en-US
From: Umang Chheda <umang.chheda@oss.qualcomm.com>
In-Reply-To: <acSfUEVueSR5Ikq7@baldur>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYwNDAxMDE0NCBTYWx0ZWRfX47e378sP7u8n
 No8qq0AlhIp8d0amJ49D7QJsVKohdRxdp96ykSAo5UkY3wg9ddJKMpMdwojq1/3545kt00QDETl
 59th4njJiLuvHU67YEBCZPlDh/b/kBDz8a5Nscm/d7kQoQeqDC+EhdqpNATA0IrXRLeaV1JCcr/
 jGquOa1ScYeLnxR6urIoD7d0r01Q//3pjTh2f59e9gZgTIcTVgodDkZh722h70MRmUaPaEa9puB
 N1UIVqhAS8nJGlAAfSP2B6IOFcq9KCQQqWC9N6ysDMAWPLi+jvw61ewby8mRss1gdzLRHsnrww4
 pDuyn/joK9Rf4h6bKXWot/QeCq4YgK+H43Ver4YBj97AeFJNDB+1zjF6n/OeY5fdKNDG9+XaJiQ
 hALnD2IL7txiZDZ82KxrecaOB18jmE9zIKBrfub0YyUbOXQ8PnkZ0n41ivaPFAcLRltmwxn6+iA
 dUnyioxGce6hkZ/BKEQ==
X-Authority-Analysis: v=2.4 cv=QJJlhwLL c=1 sm=1 tr=0 ts=69cd37f6 cx=c_pps
 a=rEQLjTOiSrHUhVqRoksmgQ==:117 a=xqWC_Br6kY4A:10 a=IkcTkHD0fZMA:10
 a=A5OVakUREuEA:10 a=s4-Qcg_JpJYA:10 a=VkNPw1HP01LnGYTKEx00:22
 a=u7WPNUs3qKkmUXheDGA7:22 a=_K5XuSEh1TEqbUxoQ0s3:22 a=EUspDBNiAAAA:8
 a=MelL_d3sNiTB4l5edtYA:9 a=QEXdDO2ut3YA:10 a=2VI0MkxyNR6bbpdq8BZq:22
X-Proofpoint-GUID: jctBpv8QnrG8h8myjOUF9zqOT0pPll74
X-Proofpoint-ORIG-GUID: jctBpv8QnrG8h8myjOUF9zqOT0pPll74
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1143,Hydra:6.1.51,FMLib:17.12.100.49
 definitions=2026-04-01_04,2026-04-01_02,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 malwarescore=0 impostorscore=0 clxscore=1015 bulkscore=0 priorityscore=1501
 phishscore=0 suspectscore=0 lowpriorityscore=0 adultscore=0 spamscore=0
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.22.0-2603050001 definitions=main-2604010144

Hello Bjorn, Dmitry,

On 3/26/2026 8:29 AM, Bjorn Andersson wrote:
> On Mon, Mar 23, 2026 at 09:06:54PM +0200, Dmitry Baryshkov wrote:
>> On Mon, Mar 23, 2026 at 10:33:45PM +0530, Umang Chheda wrote:
>>> Hello Dmitry,
>>>
>>> On 3/13/2026 11:23 PM, Dmitry Baryshkov wrote:
>>>> On Tue, Mar 10, 2026 at 02:09:58PM +0530, Umang Chheda wrote:
>>>>> Hello Dmitry,
>>>>>
>>>>> On 3/10/2026 2:07 AM, Dmitry Baryshkov wrote:
>>>>>> On Mon, Mar 09, 2026 at 05:49:35PM +0530, Umang Chheda wrote:
>>>>>>> The RB3 Gen2 Industrial mezzanine DT file lacks a "model" property,
>>>>>>> resulting in the hardware always being reported as the "Robotics RB3gen2".
>>>>>>> This prevents applications and user-space tooling from distinguishing
>>>>>>> the Industrial mezzanine Kit from other RB3Gen2 variants.
>>>>>>>
>>>>>>> To ensure consistent identification across all RB3 Gen2 mezzanines,
>>>>>>> add the appropriate model string.
>>>>>>>
>>>>>>> Signed-off-by: Umang Chheda <umang.chheda@oss.qualcomm.com>
>>>>>>> ---
>>>>>>>  .../boot/dts/qcom/qcs6490-rb3gen2-industrial-mezzanine.dtso   | 4 ++++
>>>>>>>  1 file changed, 4 insertions(+)
>>>>>>>
>>>>>>> diff --git a/arch/arm64/boot/dts/qcom/qcs6490-rb3gen2-industrial-mezzanine.dtso b/arch/arm64/boot/dts/qcom/qcs6490-rb3gen2-industrial-mezzanine.dtso
>>>>>>> index 619a42b5ef48..7d6e425dae89 100644
>>>>>>> --- a/arch/arm64/boot/dts/qcom/qcs6490-rb3gen2-industrial-mezzanine.dtso
>>>>>>> +++ b/arch/arm64/boot/dts/qcom/qcs6490-rb3gen2-industrial-mezzanine.dtso
>>>>>>> @@ -8,6 +8,10 @@
>>>>>>>  #include <dt-bindings/clock/qcom,gcc-sc7280.h>
>>>>>>>  #include <dt-bindings/pinctrl/qcom,pmic-gpio.h>
>>>>>>>
>>>>>>> +&{/} {
>>>>>>> +	model = "Qualcomm Technologies, Inc. QCS6490 RB3gen2 Industrial Mezzanine";
>>>>>> So, what happens if I combine Industrial and Vision mezzanines?
>>>>> H/W does not support to connect both Industrial and vision mezzanine at same time - only single mezzanine can be
>>>>>
>>>>> connected at a given point in time - hence probably the above scenario would never occur.
>>>> Industrial mezzanine has all LS and HS connectors, so it is possible to
>>>> stack Vision mezz on top of the industrial one.
>>>
>>> I re-checked - from f/w side as well multiple DTSO selection is not supported - and at a single point in time only single mezz can be selected
>>
>> What does this have to do with the firmware? From the Linux build system
>> point of view we are combining the overlay into a single
>> qcs6490-rb3gen2-industrial-mezzanine.dtb file.
>>
>> Nothing prevents me from writing:
>>
>> qcs6490-rb3gen2-multi-mezzanine-dtbs := qcs6490-rb3gen2.dtb \
>> 		qcs6490-rb3gen2-industrial-mezzanine.dtbo \
>> 		qcs6490-rb3gen2-vision-mezzanine.dtbo
>> dtb-$(CONFIG_ARCH_QCOM)        += qcs6490-rb3gen2-multi-mezzanine.dtb
>>
>>> considering above point - is it okay to have this patch ? I believe it would be good to have model string in the DTSO file added.
>>
>> No. A _mezzanine_ can not be a device model. It is by definition
>> something that you plug into the main device. Maybe creating something
>> new, a new kit.
>>
>> Moreover, the model name is not an ABI, we should not be using it for
>> device identification.
>>
> 
> I do agree.
> 
> That said, as we (others) discussed during LPC, it would be very useful
> for bug reporting purposes to know what overlays has been applied - or
> in general what "version" of the dtb we're running the system from.
> 
> I don't think "model" is what we're looking for there though.

Does adding something like below in the chosen node from the DTSO file
works good instead of a model string to identify the list of overlays
applied ?

&{/chosen} {
	applied-overlays {
		industrial-mezzanine {
			status = "okay";
		};
	};
};

> 
> Regards,
> Bjorn
> 
>>> Kindly share your views
>>
>> -- 
>> With best wishes
>> Dmitry

Thanks,
Umang

