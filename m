Received: from mx0a-0031df01.pphosted.com (mx0a-0031df01.pphosted.com [205.220.168.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id BDB823ACEFE
	for <devicetree@vger.kernel.org>; Mon, 23 Mar 2026 14:09:20 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.168.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1774274962; cv=none; b=UyLUX/oEX338Dc36qMt1kWyeWD3zvP4BOmUVmHuuxTQLGs+Bo6AYI3Vxby7u4mY8oD07MwWa1fHuoRq/ymhbkpXjPd99eeVUZ3sDT00UWn6k1IsEwfVNtTfugJ0V3TY1N55kXYu7q/MST6mXNBm8q4vNLmM45m3F6EVS+0zUeSE=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1774274962; c=relaxed/simple;
	bh=/m+5W3oksIBY5ci5bS0bARrewEORtmGEJBmpfMyskuE=;
	h=Message-ID:Date:MIME-Version:Subject:To:Cc:References:From:
	 In-Reply-To:Content-Type; b=WWZSLQKeYdiKnrboSDlgpUxRGsRIvkYrjZS4a3vCfX9qAryfQqYmQA6mQ/FlXsjQ6MhCnPbSYjdw9dNAWhDvaTJUDboXLUsHslo1c/Jf9fJ5fbKTe0UAHuIAuTWRZJcAS11ihIt7pBB/P6yAlyDXpfVaU/nkLkg1HIeN1Vpe6ws=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=gotw1UUJ; dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b=NLnQOjl/; arc=none smtp.client-ip=205.220.168.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b="gotw1UUJ";
	dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b="NLnQOjl/"
Received: from pps.filterd (m0279864.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 62NCenfB949420
	for <devicetree@vger.kernel.org>; Mon, 23 Mar 2026 14:09:20 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	7y0lYDMFJUqZrtd6RIbE64n8l8HgKjJixyalYogdDLo=; b=gotw1UUJJgLh+d3U
	eYNt3NZsDLfiqM2rbbUnbafpgWytI/HbgdcRA0hK9/Pinv7AsVcnhwnxkmrdXtIF
	pvHWEkHprAoxfeKcH2Y3ogkQsMu+VZbYS5dqhPe6Sv4SmRoO/MmQ9g0zqFBnOScJ
	QbiVMSPP+Tyhaepp4QdlpCEfL9afTpWoQLRTL87m18A9EqGpeDqg18I1wwS2Hkmt
	zNjrW371nPCP2nPtILcF0E0v5Vj3H8+tWOua9fbpMUZA1csSfnadu1YmDCQDUXBm
	rp2avxjQdQypgKz4NOIEWnid5FcJPQtQYYD/aWmNROt4NdZGwb2cWM+M0enAALvx
	P6ixaQ==
Received: from mail-pl1-f199.google.com (mail-pl1-f199.google.com [209.85.214.199])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4d1mghdksq-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <devicetree@vger.kernel.org>; Mon, 23 Mar 2026 14:09:19 +0000 (GMT)
Received: by mail-pl1-f199.google.com with SMTP id d9443c01a7336-2aecbb78e44so205955875ad.2
        for <devicetree@vger.kernel.org>; Mon, 23 Mar 2026 07:09:19 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1774274959; x=1774879759; darn=vger.kernel.org;
        h=content-transfer-encoding:in-reply-to:from:content-language
         :references:cc:to:subject:user-agent:mime-version:date:message-id
         :from:to:cc:subject:date:message-id:reply-to;
        bh=7y0lYDMFJUqZrtd6RIbE64n8l8HgKjJixyalYogdDLo=;
        b=NLnQOjl/he2vh+i2/flYuNIw04Hlrrryb4jlHbuQ+9Dih5h9AKoR+1Ro1AJSx29cYb
         Pn3G8o3Vm+X1vJGObrZaCqMnTEHjL+dScLp4mxmngqsRK6COMHMbPJTElysKfQLP1Zc4
         i5Hf9hfD4oJ5sg1BX+UVfxLnBwUPIP3/Jugh/ZQurxLArAStPRFb45YJEUw/SpefWeYF
         lIsHnK/v3e+KCPz9XBxIAe8SVzHOtWJfHBGO+3a4NcMmj6179rfeuPklstNGSywlQDbb
         1Kwf/hMtSEufgimODJCqTD1bWjIXZJUG9aNXs+FMndvYBGL/K+omQX+WCkGwrMtkdN5V
         vN3g==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1774274959; x=1774879759;
        h=content-transfer-encoding:in-reply-to:from:content-language
         :references:cc:to:subject:user-agent:mime-version:date:message-id
         :x-gm-gg:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=7y0lYDMFJUqZrtd6RIbE64n8l8HgKjJixyalYogdDLo=;
        b=mqv7ysZLwruOLskStSxy53mvNIm5H3h9c5BT78IaBIb1Ony7HSlG94qRhCbW1cwUmg
         tfIJjLwny3qWjGPhBcwKWqJuJ0vmek7A5emqviD9GfNfFGw40g8SYFQajAR8Ptf66HIb
         kHjqQDNFyZhDKSn/13DtH7tVMgy78m6fsnbeV0jZi631IW4gAYSOUETSpkXB4n1C+WMC
         4Vze+KEPI928SXDyYuwUKxuTyBD5917sq+v7pw8AedxIslWmKvfZerz46FjY4HT/UEr4
         3EZB9AHUC9n38Rw0I1idI4fNEjW+GGDgdwu/M7hyuyG5brfhLfhxa4tZVPAINo1JYe8M
         JboA==
X-Forwarded-Encrypted: i=1; AJvYcCU3fWx2zHOKSSoXIGl+zqZgwPFbsoFOogQP+4rN5d6eKF+G/KQLv51rMF7zBmrza+++os+fGduNV73D@vger.kernel.org
X-Gm-Message-State: AOJu0Yy5fJnrHHAAAnx6SGfkdXCvl50gwkbjmfUzbIdQAixuf+F7aK0f
	QU8Fi8EmP9JTkIDaKO7TDr8UPyAdiZyKUpj/YS3cXFXA2/h4h8yfqnHqFM1tSVyHYqlNcsfFcqN
	UgSucX0svCA9m7CPfyDfuguEfpAFnJFKnb1ikBY/1EZdnKuKlcSADFTmFbM/wtAH5
X-Gm-Gg: ATEYQzygXA12YFuaCXsh/AXGbCiBZuDRxkVC/9844yD69QEz5HRa8IkiSDzp6wOX4E9
	7itE1qbEueY9joMErBIYOUdqzD/bnFKYOHEMyooqiu24lxxuePdyoywii0oY3LesjIzm8wn6tct
	+CG+ygr9HlSvc8Jpi89U0FNSnK5xXIuljoKENxvJohANwaDGIEpEG1EClGnfnYByUYuHdeCs4Py
	C/oT8VXQDD9FjuNENmv30wVfH7fnteFsDo8RYImSVh2aC2CXSU8tbJb9TkcLpTPLNA7rk6ILy1B
	FzuWaHK0P1D6bzFpq6/9+gM5avZ1kEuL+GFI4SX0B9t5z789Xoa3VtUR9QrORsj+d8q4aiId+Ii
	1KeLDGU2GwW48Dtp1IKTmw8wP5PNPFzUOLqQ92dYdWk2WKHYaI0DWxELfiaaoVdAVDYa0OZRopC
	tL3tIHM4Fh
X-Received: by 2002:a17:903:22d1:b0:2b0:6e8f:8e85 with SMTP id d9443c01a7336-2b0826d73e8mr125777085ad.5.1774274958794;
        Mon, 23 Mar 2026 07:09:18 -0700 (PDT)
X-Received: by 2002:a17:903:22d1:b0:2b0:6e8f:8e85 with SMTP id d9443c01a7336-2b0826d73e8mr125776695ad.5.1774274958149;
        Mon, 23 Mar 2026 07:09:18 -0700 (PDT)
Received: from [10.133.33.6] (tpe-colo-wan-fw-bordernet.qualcomm.com. [103.229.16.4])
        by smtp.gmail.com with ESMTPSA id d9443c01a7336-2b08366c443sm145231065ad.56.2026.03.23.07.09.13
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Mon, 23 Mar 2026 07:09:17 -0700 (PDT)
Message-ID: <d8ab2410-8d67-41c2-9a11-384f4a6a8f07@oss.qualcomm.com>
Date: Mon, 23 Mar 2026 22:09:08 +0800
Precedence: bulk
X-Mailing-List: devicetree@vger.kernel.org
List-Id: <devicetree.vger.kernel.org>
List-Subscribe: <mailto:devicetree+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:devicetree+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v2] arm64: dts: qcom: glymur: add coresight nodes
To: Bjorn Andersson <andersson@kernel.org>
Cc: Konrad Dybcio <konrad.dybcio@oss.qualcomm.com>,
        Konrad Dybcio <konradybcio@kernel.org>, Rob Herring <robh@kernel.org>,
        Krzysztof Kozlowski <krzk+dt@kernel.org>,
        Conor Dooley
 <conor+dt@kernel.org>,
        Tingwei Zhang <tingwei.zhang@oss.qualcomm.com>,
        linux-arm-msm@vger.kernel.org, devicetree@vger.kernel.org,
        linux-kernel@vger.kernel.org
References: <20260318-add-coresight-dt-nodes-for-glymur-v2-1-d76e08f21fa5@oss.qualcomm.com>
 <ef89e328-fda6-43f4-b40c-8834d16e2cfd@oss.qualcomm.com>
 <7972211e-d735-4401-ada9-b83c7b96b612@oss.qualcomm.com>
 <a73af369-b122-43d2-b28f-e97ab33352c9@oss.qualcomm.com>
 <f28fe058-d1b7-4d4f-8751-54117aba95f8@oss.qualcomm.com>
 <acFGhpVWaHZtiyTq@baldur>
Content-Language: en-US
From: Jie Gan <jie.gan@oss.qualcomm.com>
In-Reply-To: <acFGhpVWaHZtiyTq@baldur>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 8bit
X-Authority-Analysis: v=2.4 cv=HI7O14tv c=1 sm=1 tr=0 ts=69c1498f cx=c_pps
 a=JL+w9abYAAE89/QcEU+0QA==:117 a=nuhDOHQX5FNHPW3J6Bj6AA==:17
 a=IkcTkHD0fZMA:10 a=Yq5XynenixoA:10 a=s4-Qcg_JpJYA:10
 a=VkNPw1HP01LnGYTKEx00:22 a=u7WPNUs3qKkmUXheDGA7:22 a=DJpcGTmdVt4CTyJn9g5Z:22
 a=EUspDBNiAAAA:8 a=vii5j4Xdnaj1KWSRWHEA:9 a=3ZKOabzyN94A:10 a=QEXdDO2ut3YA:10
 a=324X-CrmTo6CU4MGRt3R:22
X-Proofpoint-ORIG-GUID: 8cxbAM1vOG6Le4B1LPznj0PFc6d1BJgS
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYwMzIzMDEwOSBTYWx0ZWRfX0QHnK8zj5Hyh
 PWwd8MCFET15iO1wcKH3y8BQkJbf9JThX8n+jgJ2cDTzI6u6yu/J4g/baeRb0lMP0Dfls9pE8SO
 Dnqi2PeTB6NTt4DPUlAAI8RsEMA3HHnjHkKGhxqNEnZC95O45zd6d4uEaM/DEWkedHKBaN4gBlG
 zzr3vaC+qiyH0A3qsX2FNXj72rtnZzn5F3A55nGkdK/jvPzPbxioYYdIvd6eLbJzXrNlQFTT7P4
 pNcAb6kplCVu9KJdt5KsduSBsz2d1gSJnhtWU/9ki3tZ37D6OmDPQnG7T9szXSOt63rwXThtBtM
 HGzexQSWOsogjCDbecyO3MIBUJxy9i7Y2yRflaNDaqpdpXPOx7ntHj0k+UebDtx4/ycxTK+YxJ9
 bCAPAHZcSCO/f9nPKo6nLkLcZVmmAhKGas5GrteDRuJWi3LclAXmwsawW2DKS1CMpqpNinAOfUg
 xVCn+mOLHciA7zBxiRA==
X-Proofpoint-GUID: 8cxbAM1vOG6Le4B1LPznj0PFc6d1BJgS
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1143,Hydra:6.1.51,FMLib:17.12.100.49
 definitions=2026-03-23_04,2026-03-23_01,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 priorityscore=1501 clxscore=1015 phishscore=0 malwarescore=0 bulkscore=0
 impostorscore=0 suspectscore=0 spamscore=0 adultscore=0 lowpriorityscore=0
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.22.0-2603050001 definitions=main-2603230109



On 3/23/2026 10:03 PM, Bjorn Andersson wrote:
> On Mon, Mar 23, 2026 at 09:27:41PM +0800, Jie Gan wrote:
>>
>>
>> On 3/23/2026 9:02 PM, Konrad Dybcio wrote:
>>> On 3/23/26 1:30 PM, Jie Gan wrote:
>>>>
>>>>
>>>> On 3/23/2026 7:05 PM, Konrad Dybcio wrote:
>>>>> On 3/18/26 12:42 PM, Jie Gan wrote:
>>>>>> Add CoreSight nodes to enable trace paths like TPDM->ETF/STM->ETF.
>>>>>> These devices are part of the AOSS, CDSP, QDSS, PCIe5, TraceNoc and
>>>>>> some small subsystems, such as GCC, IPCC, PMU and so on.
>>>>>>
>>>>>> Signed-off-by: Jie Gan <jie.gan@oss.qualcomm.com>
>>>>>> ---
>>>>>> Changes in V2:
>>>>>> 1. removed two cti devices due to GFX block is down
>>>>>
>>>>> i.e. "because GPU is not yet enabled"?
>>>>
>>>> Yeah, these CTI devices have clock issue for enabling due to the GPU block is not yet enabled.
>>>
>>> Do they need the GPU to be online, or a clock from GPU_CC, or
>>> maybe something else?
>>
>> We need a specific debug clock inside the GPU block. The debug clock only
>> can be enabled while GPU is online.
> 
> What happens once GPU has been delivered, but for some reason is
> inactive and we try to use this CTI device?

We will check these devices again once GPU is available. We also will 
cross check with AOP team if there is a clock enable/disable requirement 
with the specific debug clock.

> 
>> Also needs AOP to support enable/disable
>> the debug clock.
>>
> 
> When you hit such dependencies, please write and contribute the patch
> (in this case, you can do it in a separate patch/series).
> 

noted. The capability to enable/disable debug clocks is supported by 
mproc dt nodes(aoss_qmp). It will send message to AOP core to enable 
debug clocks by configuring a specific register in AOP via mailbox.

Thanks,
Jie

> Regards,
> Bjorn
> 
>>>
>>>>>>       - cti@11c42000
>>>>>>       - cti@11c4b000
>>>>>> 2. changes two TPDM devices to static:
>>>>>>       - tpdm-cdsp-cmsr
>>>>>>       - tpdm-cdsp-cmsr2
>>>>>
>>>>> They were TPDM instances in v1. What's the reason for the change?
>>>>
>>>> These TPDMs havent clock source for accessing registers. We only need enable its ports to output trace data. So I have changed them to static-TPDM compatible.
>>>
>>> The registers are clearly physically there. Are you saying that we
>>> (currently?) can't enable the clock required to access them? Or is
>>> there a design defect that's preventing us from doing so?
>>
>> It's about hardware design. Some of the TPDM devices are designed as static,
>> means we dont need access the register of the device for configuring. The
>> trace data of the static TPDM is enabled by default, we only need enable the
>> port of the connected TPDA device for receiving the data.
>>
>> I have tested these devices with Jtag attached, so I didnt observe issue
>> about these new devices in the CDSP block. (Jtag will provide debug
>> capability for all debug devices) Also cross-checked with hardware team for
>> confirming these devices are working as static.
>>
>> Thanks,
>> Jie
>>
>>>
>>> Konrad
>>>
>>

