Received: from mx0a-0031df01.pphosted.com (mx0a-0031df01.pphosted.com [205.220.168.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id ADC923F44E8
	for <devicetree@vger.kernel.org>; Tue,  7 Jul 2026 10:55:42 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.168.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1783421744; cv=none; b=OCEv1snt8phyby2dSnS05cWvgrBEWwo34BpoXgz0asC8TgxCI0GqfBHv5epWy0s2remY/9JBRqHLkafKTaQYV2MY6cCkCdcKEK8BFm0i4MPKyyYX1qy5gNcnuB1LGXbIrrLiBZLCuUz3S4peE/NG1RoePez0fXRZ9DfL65L+7jg=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1783421744; c=relaxed/simple;
	bh=/DSzcQElKq0mXa69/IQkZJAYGGmhD2CvPP4Qx3Y+EQA=;
	h=Message-ID:Date:MIME-Version:Subject:To:Cc:References:From:
	 In-Reply-To:Content-Type; b=QaQXZ/RabPcsu/D0tam3y3dzdhhVeinepP4td47FQo+mxHmFo3yZUPUujiDI5Av/sLcqXeWqTPNv+g/LafJ3W7EcbRn4npeW80isUCVre3N2/qbmXgRl/vWEKQ6PZbah7IMLbHHHpjCHpfUbV038EgYBhxk4I9sHj/XtH5lFnNw=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=UKdt/hnU; dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b=KtUbdByD; arc=none smtp.client-ip=205.220.168.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b="UKdt/hnU";
	dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b="KtUbdByD"
Received: from pps.filterd (m0279864.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 6678E42u3004583
	for <devicetree@vger.kernel.org>; Tue, 7 Jul 2026 10:55:41 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	PPBAMksDVcTI0m93auLHoJ+VLwr7IoZUpwRRiS+q4QQ=; b=UKdt/hnUw4wLiLyV
	rpR/b9LZuITz9EXW/XgjtIbztvV5+dx9hqmObpB+DeC8aAEBhnFbEF+Eso77odbS
	TQf7Hmo8xbqd0xpFLVMsA1KfhOCHWcF8vQjb+S5CSLI1VcS0MQB7yChWQ/3B2cte
	BmB461TsnbM/bkp28ofoKorctAwAn5/X8AxsegGflq4qzs4uJthSwiveLHm1tXOO
	h7V2pa3VOh8l3j9IffGr9vOVOcaAJuKK0MhHGZOWaXOpaRVcNBhGTWMeN5FIKjJr
	pAdGwiQhxPEaJlu23ownx43hoha4M3AaAQAu+LOykUuYydPkQOWPsgg0wd+5xB0e
	LOUQZA==
Received: from mail-qt1-f199.google.com (mail-qt1-f199.google.com [209.85.160.199])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4f8su71k2e-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <devicetree@vger.kernel.org>; Tue, 07 Jul 2026 10:55:41 +0000 (GMT)
Received: by mail-qt1-f199.google.com with SMTP id d75a77b69052e-51c20762d21so49060151cf.0
        for <devicetree@vger.kernel.org>; Tue, 07 Jul 2026 03:55:41 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1783421740; x=1784026540; darn=vger.kernel.org;
        h=content-transfer-encoding:content-type:in-reply-to:from
         :content-language:references:cc:to:subject:user-agent:mime-version
         :date:message-id:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=PPBAMksDVcTI0m93auLHoJ+VLwr7IoZUpwRRiS+q4QQ=;
        b=KtUbdByDai3yD183ek7z/6WqwIgQx8RsRyQhPEGd+2VNtKhmKhjMGmVqFBVZVzk7gd
         SiXo8pT4u+hOidKaGcMCTkmF3p5W+gk4ckPdnik+/m1PSKYChpOBillHwF0Alwu0jPUG
         EB058SaYkE7UV1A2PayavE4MzC4AjiZFNYVb3/G+xRf21drbSKBNmkTkez9gzBEkDGIO
         jzTvyh44YV1Vz8ZQYS9at+Wf3EFiU7RD0C0zpvDBx/KIX4uBWoq41oeN0MZr8Tq0Z1T/
         sSE5kS2wxaagF7zV4YoVdLHzVg6s2qLi6nm2GfkQadi6N6DCYkxbYnrCwpgZC0YVwU92
         4fsw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1783421740; x=1784026540;
        h=content-transfer-encoding:content-type:in-reply-to:from
         :content-language:references:cc:to:subject:user-agent:mime-version
         :date:message-id:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=PPBAMksDVcTI0m93auLHoJ+VLwr7IoZUpwRRiS+q4QQ=;
        b=ZfMiqKWAfkXvs1aq96fVwSBlZ0NiI+kZgZBmc91/m6yyVGGmqJFFOxThVQ+L5owyIB
         LzndD5+g5hJjbLRFsA4sxW0T5meopKv0uqWDz2gFcPl5i9AjJmWZSb45EuBFVNwEmchG
         YPnWHS6umFQ15aroQqckbxsTf/DObkhGXOE9gH/bi66ASrLHMIREWuSTV5ejUKr3mH04
         1iMvxC3YdBaFrsP6iCJ4EyEp68ieSRXJSBI5gbdmWbXEAAkJZY0wr8Jfaf17LcIr+Nbi
         SaOomiPeSDhB1GV/rlEQzcX4s6HBbxcNQbO4bX2n6UBH0ep1eNOu7IH2AGkBOeJ/iL23
         bxng==
X-Forwarded-Encrypted: i=1; AHgh+RqHeAf0f4bMboukP4yPza45XG40bDh6Iz/iYEmlrgu9AkzdPPJ7Bx6mxev5FgRtfmMkzeT/6RDlFZFc@vger.kernel.org
X-Gm-Message-State: AOJu0Yx8zvMBy6B4a9gg5Yd3ySrqGGFyuIYISkbyPsOmf24aF2+nz9dA
	OdJg0FBWcnDf/BzFDwzno3B7fxbalR0imwjSfKBp2Za49WFPkI7DMhq4K8ZtlJeiRIaE2bEQp0o
	RUXi4cY+EeE1+X76hohMIY2gsL1rcPX4hnuLVTJM3+Q/uQzDtL4BRnnm4zLiR4L8O
X-Gm-Gg: AfdE7cljivIqvDp49jh6I59V1WgXjAsIaGk1D9HS3/vus1B2IjxBECHrzUgMnDNJcX5
	pTOLvn7j4UZPAbTwhibLbqhJPSj8gbbd4tU21MgjN59G1FAHeOUU+9WXz6XiyS1AKJ8g/Ip5cNC
	/ejcML0wQbtiQ2cakL/yuVDPT040/T5gL2m9UXGk+jEkbPCrGlRLV5AaCMv4/+Kg8MMicocWmw2
	OIjBrDenlKs0lO8Mu2N11AnXF8NEPeH+rspKSf/uQGQPk+VZNLBSva9JiZLP4/EOyAW4tn/27i0
	ujFJ+1rjQ+lS6S2YlGs0ulic8iDUhTMXjl0BUwPwqhwf11SpZDG5w1rQeJOAVga210WqqiftvIG
	oB8teDTn/OHeCDQbZB3UQ515eoeGcTl2/I07ZHRA0Irbjra8OhOF1+Vc5uA2aSvEra0CPkYlHKO
	un7WRwWBg=
X-Received: by 2002:ac8:5d8e:0:b0:519:8998:661b with SMTP id d75a77b69052e-51c747bb756mr47970981cf.20.1783421740194;
        Tue, 07 Jul 2026 03:55:40 -0700 (PDT)
X-Received: by 2002:ac8:5d8e:0:b0:519:8998:661b with SMTP id d75a77b69052e-51c747bb756mr47969931cf.20.1783421738054;
        Tue, 07 Jul 2026 03:55:38 -0700 (PDT)
Received: from [192.168.1.31] ([85.196.172.179])
        by smtp.gmail.com with ESMTPSA id a640c23a62f3a-c15bc428775sm3346466b.6.2026.07.07.03.55.36
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Tue, 07 Jul 2026 03:55:37 -0700 (PDT)
Message-ID: <7e36238b-96ac-4269-a6e5-0a6763e437e7@oss.qualcomm.com>
Date: Tue, 7 Jul 2026 13:55:34 +0300
Precedence: bulk
X-Mailing-List: devicetree@vger.kernel.org
List-Id: <devicetree.vger.kernel.org>
List-Subscribe: <mailto:devicetree+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:devicetree+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v4 0/5] Add Qualcomm JPEG V4L2 encoder for SM8250
To: Vladimir Zapolskiy <vladimir.zapolskiy@linaro.org>,
        Bryan O'Donoghue <bryan.odonoghue@linaro.org>,
        Atanas Filipov <atanas.filipov@oss.qualcomm.com>,
        linux-media@vger.kernel.org
Cc: loic.poulain@oss.qualcomm.com, mchehab@kernel.org, robh@kernel.org,
        krzk+dt@kernel.org, conor+dt@kernel.org, andersson@kernel.org,
        konradybcio@kernel.org, linux-arm-msm@vger.kernel.org,
        linux-kernel@vger.kernel.org, devicetree@vger.kernel.org
References: <20260706071113.383215-1-atanas.filipov@oss.qualcomm.com>
 <68e59764-5a10-4abc-849c-14ea2d9ef76e@linaro.org>
 <d74d7839-d126-427a-b151-ca895a27a83e@linaro.org>
Content-Language: en-US
From: "Gjorgji Rosikopulos (Consultant)"
 <gjorgji.rosikopulos@oss.qualcomm.com>
In-Reply-To: <d74d7839-d126-427a-b151-ca895a27a83e@linaro.org>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 8bit
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYwNzA3MDEwNSBTYWx0ZWRfX/gnOHKibtg0o
 w7Dm6OlAfAOWwuV4lRn3s+kWYmlErfwqPEJtjz8s9JcKggfOYTtFZOiSwZN8Z9YwJ9/+wvTuIJz
 ke/MQmTnmY55pOL4rKKrcYsDPTOuf9JEseAtOT5hQinVzIAD7lBuHSGk4vcpl7evXcLaowFNSxb
 pKSImdcsvQvmuSsShcJr5Fv1uqyvswS/4W6i1DK4e/yHplUcfW5OAWoXbpJykKYQvRD+SJ64ffz
 9YTVqkZUCZ+RtmZg03Dt/zRnRF6ijxqw6dxinc/Eawor7Rp4vMSVU6MKnTh+MaQ5EhJioqH3Uh1
 e4nbORgyZPkyXgezMHh33z6eKdwB8VORgHJXcFcT7Rx9rdR56pzUk1yUoOJAqjsVnjQDh9uZhk2
 9chIyCgCEqDasWslPDVB2AoPvvH05E1szXAlsdvX3Fpg/uUt3zKb0Lv0q2kZTl69AyLf6yhhZUU
 VR8u+4Goc6QIwlEovJA==
X-Proofpoint-Spam-Info: AW1haW4tMjYwNzA3MDEwNSBTYWx0ZWRfX0MafXr3xRIov
 jc7dFW694IzWaTgXZIZUoZvlhyYRkJ6F+Fg9so2L/ttidBx8XH/4V2x+G/xcRqTxCxP3iTUlPmW
 xA0tfe42B2/v9TSZUHSSFQ1E4TOSaCI=
X-Proofpoint-GUID: ohLB0B76V50LurpUOKl857otCC4AKKv2
X-Proofpoint-ORIG-GUID: ohLB0B76V50LurpUOKl857otCC4AKKv2
X-Authority-Analysis: v=2.4 cv=HN7z0Itv c=1 sm=1 tr=0 ts=6a4cdb2d cx=c_pps
 a=WeENfcodrlLV9YRTxbY/uA==:117 a=Q/e3f29T3Hw2hnAEzBPF7w==:17
 a=IkcTkHD0fZMA:10 a=RAioF0-LDSMA:10 a=s4-Qcg_JpJYA:10
 a=VkNPw1HP01LnGYTKEx00:22 a=u7WPNUs3qKkmUXheDGA7:22 a=DJpcGTmdVt4CTyJn9g5Z:22
 a=g6G2TVJU6GBlO6KxhuQA:9 a=3ZKOabzyN94A:10 a=QEXdDO2ut3YA:10
 a=kacYvNCVWA4VmyqE58fU:22
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1143,Hydra:6.1.134,FMLib:17.12.100.49
 definitions=2026-07-07_02,2026-07-06_02,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 spamscore=0 priorityscore=1501 malwarescore=0 adultscore=0 clxscore=1011
 bulkscore=0 suspectscore=0 lowpriorityscore=0 impostorscore=0 phishscore=0
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.22.0-2606150000 definitions=main-2607070105

Hi Vladimir, Bryan,

On 7/6/2026 3:00 PM, Vladimir Zapolskiy wrote:
> On 7/6/26 13:12, Bryan O'Donoghue wrote:
>> On 06/07/2026 08:11, Atanas Filipov wrote:
>>> Note: The handling of shared camera subsystem resources (power domains,
>>> interconnects) for child IP blocks is still an open design question.
>>
>> Why ?
>>
>> A device needs to vote on its own interconnect and power-domains on any
>> bus. A sub-device of another device may wish to ramp a clock for
>> whatever reason.
>
> Certainly a CAMSS device will vote on all needed to it resources, some of
> which are shared and got their description under CAMSS device tree node.
>
>> There is no "master" device in this block of devices - save perhaps for
>> the CSID mux / wrappers on some of these parts.
>>
>> We have shared resources like camera noc, system noc and external 
>> clocks.
>>
>> Please include power-domains and interconnects.
>>
>
> Why? The common power domain and interconnects have already been
> described as resources of the parent CAMSS device, there is no need
> to duplicate descriptions in every child device tree node of CAMSS.
>
The initial patch and work for JPEG was as independent driver.  I agree 
from hw perspective it is

part of CAMSS subsystem and maybe from design perspective proper way is 
to be child node not of the CAMSS.

However the resources shared by both can be abstracted in other 
frameworks, example ICC voting allows to have shared

clocks which can have policy to keep the higher rate and satisfy both of 
the HW's.

So maybe it need to be decided:

Do we want really additional logic for handling CAMSS resource of the 
CAMMS sub-devices by the CAMSS driver and create separate CAMSS API,s

or we can use existing fw's for that. ICC, clock, OPP which all allow 
sharing of the resources. Also there are cases where CAMSS and

is not needed but JPEG encoder is: Example RTSP streaming or UVC 
streaming which require jpeg encoder.

Anyways my opinion:

1. CAMSS is not prepared and not ready to handle child devices, only the 
populate child nodes is not enough. I think it is little bit mess,

some of the HW;s CSID, IFE etc are instantiated directly from CAMSS and 
jpeg and Ope are described as child nodes.

2. Jpeg on its own currently does not have any dependency with CAMSS 
driver code. It can use shared resources without issue and leave

the ICC, clock and other frameworks to do the job.

Also i dont see the reason to mix the both works. Lets have it jpeg as 
separate independend driver and the create series and rework CAMSS

to child nodes and move all existing sub-devices as child nodes, and 
then move the jpeg and Ope.

Regards,

~Gjorgji



