Received: from mx0b-0031df01.pphosted.com (mx0b-0031df01.pphosted.com [205.220.180.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 968733A1E67
	for <devicetree@vger.kernel.org>; Tue, 13 Oct 2026 08:39:26 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.180.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1791880767; cv=none; b=i5uPtihgUewQRd4bduOVPNWr80nZ9MQnJBIn8Z5KxX1MVL8vy37LG76BkHqlhAFhAe5Z8PyWwVpz1umdZ1gZ3tPHsQRsax699OA8ttCWUcWKLnQQas+kGiu3yPJEaSewEfYzHVHqdYJatrbmKplAKxeHoWZNI1tNCVwGwvQYSMA=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1791880767; c=relaxed/simple;
	bh=S8u+ZnaFpsDK+OrhjGJtztlHxeebOrcfzgdGhegteo4=;
	h=Message-ID:Date:MIME-Version:Subject:To:Cc:References:From:
	 In-Reply-To:Content-Type; b=i5eTxQEQXGKriO5UxG8ESog+TNvgXHClLc5trqkZVGIU4nw8fHTR+dCHOhcj6JOHEQNAldGTyyLQRfD/iFCODp7cxjD2lu+t/bGpMoUVgYwvpAlZ0gyqQnKIT0z/LEQINHLdjFzLLig2YZncCXTT/FnSbwKQYcaOqAQFrsd/woU=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=o5IG0UQh; dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b=g9LbLkHo; arc=none smtp.client-ip=205.220.180.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b="o5IG0UQh";
	dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b="g9LbLkHo"
Received: from pps.filterd (m0279869.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 69D20r8l302932
	for <devicetree@vger.kernel.org>; Tue, 13 Oct 2026 08:39:25 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	k+ncZHSuyduxlJ78FU1tzgAiXmr0kp8iJkZCM/xCfcw=; b=o5IG0UQhQ/fgtba4
	sMA8Cvk537oFr+AHkiMvzp51CJEqJdQMaTN/MiFnYysiBXLPV4Auu4zBFYFzqVGw
	5mC/wzeRHe3qi+Tkns/EIG4egoDFRgwwmGHV0KLcmTvTK71PCPprLcRko3P5ocML
	8+h/PKCLvRX7UtKZR3XWNurGYes9o5OJ9bhzIhmBPF4EL7QJ7WGG0mAfa/iqMKR/
	cC9AmDfgDHPd7MtzEHvtdAIK5z8AGQu0EMEZI8xj6ceY73D9u+wrugxiBz0pyMUf
	JxAVOKh/66/d5infTkL6NCDIzmofneK9jytwUgYY5/pTztiV69nBo6j6kMAx6RzM
	6fmD1Q==
Received: from mail-dy1-f200.google.com (mail-dy1-f200.google.com [74.125.82.200])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4h98sq9w8c-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <devicetree@vger.kernel.org>; Tue, 13 Oct 2026 08:39:25 +0000 (GMT)
Received: by mail-dy1-f200.google.com with SMTP id 5a478bee46e88-3515266f6eeso5161964eec.0
        for <devicetree@vger.kernel.org>; Tue, 13 Oct 2026 01:39:25 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1791880764; x=1792485564; darn=vger.kernel.org;
        h=content-transfer-encoding:content-type:in-reply-to:from
         :content-language:references:cc:to:subject:user-agent:mime-version
         :date:message-id:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=k+ncZHSuyduxlJ78FU1tzgAiXmr0kp8iJkZCM/xCfcw=;
        b=g9LbLkHo9nbeNTYyUkiV1vbUTh5CHifRJmCu+j2ysGLo2VgEKWU1SHrNc6eLOhjoQx
         ElEDXGPJpyOReJ55HHnSPzEGT/nAx2oVs2W+dYZC9+4BlPmsEXGMjabqufXFGppCIeRi
         PsvJStovHGSB2WtI/aoPyw3j3JCthaPvY1/HPR29lYvKw9tm5SpuKqElEyFIjfoKwulK
         WmwEpTWbPIreuuWMS/ozbASryGBe/GNUZbaNzfyM45R+t+jEyHRhm/G4Caj4guETTnWC
         +2b1V6vztSXhHVKIoIgeT3BHLvzCcQ1SVtQaoxHj6n/tmPeHIO+Sj0WIJv72fjZhqmQA
         k1+Q==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1791880764; x=1792485564;
        h=content-transfer-encoding:content-type:in-reply-to:from
         :content-language:references:cc:to:subject:user-agent:mime-version
         :date:message-id:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=k+ncZHSuyduxlJ78FU1tzgAiXmr0kp8iJkZCM/xCfcw=;
        b=y1TmG+TOKOszJb02v86BYZ8iSskk2kJBLcmO3mvVuOSs7ConC6dN+b3XAnXGs5dBe0
         nX8XOjr9BLR9Kql3+79jTBEJg6MJ6X2v4GuFDFFrfPsBySb/7n7cISDtU7CXd9DmvQJS
         l1MlgBCrVI8RMOUhB4tmJ+bKEycjogBL94c70OquYNbsqCf2DG84mf0sQSv8HTP93E89
         /wwIfDeqpyD+U/g38O29sgUQ+HD3fzT2O2tDNYVUWbUEj4ct08vXO9MZpkI4SspyUBSq
         wmhOxWtBDDlIjJk8QzOF5bYb3xcr5M7licMmlXZZHFeWn9N4L5W81mJARVsw1F38LJoA
         l4mg==
X-Forwarded-Encrypted: i=1; AKwUvByEDkY2EKdOdmBoFk/WNdWIz1aZf0acvkaBCtc+1/w6j28pckuF1LTwD0pMTFasbvN/vD4TvIvcTyJS@vger.kernel.org
X-Gm-Message-State: AFq9FYIHH8dTkVbINoUQDMimMtKwe3az1A8k2i4ORq9jLE8J4opj1d41
	p2a9piQQNmN/9I/qD31wMFv3LFecPcg/GefXTQsa2dAftmZVvt2gY6NUUWNRaZRn8xDLyb3AORi
	xDZBvGOodc4SYZfvLvS9u+fcYf0CTXoy0mTuf8e8YTx9n8fyP1MspmvLKed6/+jhH
X-Gm-Gg: AYBFou0HUsc6ZiadCJthK4j1l1mA93v7IpVjEBVBE0NXusqi6yFptEL+Uehaev7nE9i
	hRltcTror/ubNl2kuBJ8wMSjqn0YXJLddVPYJXbE8HcrFVfUXhajPEqaIrmwwppb4kwSLONi/JZ
	JAAYhsMhUh7AEImKGhNt85LLcYquGcTKRz8qEE88+ssvXXTYbK6QRMOBjfb5Ff3+YOyr9cduTx5
	X7hyvQqehCt23tRqI7muDYlCqK7irDjEC3nKrw3bC67jq/MaUBduK1HZVm8j1EMZtKT53+KrRqc
	syuGxv9FSpXX71anpUpHvoDArn4lQvoKjg043ldyIkurZPBKtGjk1nfe83p9LMs5Upzx9tW8qbc
	3QO677+2CZYFCSwjCIPxHTmYP1dE4IMrjIfERRSOZvXEyi99KLYxLKEonbMoZDNDN
X-Received: by 2002:a05:7022:b055:10b0:148:4d6c:201e with SMTP id a92af1059eb24-16a5faa6965mr17112674c88.23.1791880764380;
        Tue, 13 Oct 2026 01:39:24 -0700 (PDT)
X-Received: by 2002:a05:7022:b055:10b0:148:4d6c:201e with SMTP id a92af1059eb24-16a5faa6965mr17112648c88.23.1791880763693;
        Tue, 13 Oct 2026 01:39:23 -0700 (PDT)
Received: from [10.218.1.199] ([202.46.22.19])
        by smtp.gmail.com with ESMTPSA id a92af1059eb24-169a442ac67sm55939416c88.18.2026.10.13.01.39.17
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Tue, 13 Oct 2026 01:39:23 -0700 (PDT)
Message-ID: <6851ca2b-775e-44d7-b437-d04fd4ea4f21@oss.qualcomm.com>
Date: Tue, 13 Oct 2026 14:09:16 +0530
Precedence: bulk
X-Mailing-List: devicetree@vger.kernel.org
List-Id: <devicetree.vger.kernel.org>
List-Subscribe: <mailto:devicetree+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:devicetree+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v7 0/5] Modify interrupt handling for eUSB2 Phy targets
To: Manivannan Sadhasivam <mani@kernel.org>
Cc: Vinod Koul <vkoul@kernel.org>, Neil Armstrong
 <neil.armstrong@linaro.org>,
        Rob Herring <robh@kernel.org>,
        Krzysztof Kozlowski <krzk+dt@kernel.org>,
        Conor Dooley
 <conor+dt@kernel.org>,
        Thinh Nguyen <Thinh.Nguyen@synopsys.com>,
        Greg Kroah-Hartman <gregkh@linuxfoundation.org>,
        linux-phy@lists.infradead.org, devicetree@vger.kernel.org,
        linux-kernel@vger.kernel.org, linux-arm-msm@vger.kernel.org,
        linux-usb@vger.kernel.org,
        Krzysztof Kozlowski <krzysztof.kozlowski@oss.qualcomm.com>
References: <20260905-eusb2-interrupt-v7-v7-0-820cf5377a70@oss.qualcomm.com>
 <aszg7Us_ACMMiM9N@debian>
Content-Language: en-US
From: Krishna Kurapati <krishna.kurapati@oss.qualcomm.com>
In-Reply-To: <aszg7Us_ACMMiM9N@debian>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYxMDEzMDAzNCBTYWx0ZWRfX0Jss+638hSMb
 t88cUGwkJKnEHjmiH2UeQ3cizrdbiNm/dwlokDu1wOtyqkXe5Ge/oQaWQHBjDi41ief6BVx2ZdJ
 ORJcGbJKt7pHbKuUDrSK5TLpYUMUev+jLy2602iURwidHPI8bam0nNB6JouxJ/Jhgdq3XQMI5Pw
 5lhKq7WyZE6Fn5loSzPhpPpJZtgySMZQKE9AyoR/JhYDQmHkTC6598kDGemo0ayj0svSLo4uqI8
 1WDmWosF8kp3u6+XB+91nu9Pq4QfHocHeV44YOvlKH3kYnyGTlNDWTxxPxPIecNr+OE+JCr+248
 ZzBIO9ZlM8U1Hzzgxwll77lonTv2++OeNhmGRx/2r2lJ9seuJiIQ9h4NaY+dpxbX6vSIQ9lRXpa
 W9MwC2mmregbN2gQS7Gnkdyf5kEg6Goloc/eOCij8UbfVur1o7x4onc48dVuYf0ypt6e1gNUOU9
 14qgBWqrqkvxy+yqpeg==
X-Authority-Analysis: v=2.4 cv=JN+uIMKb c=1 sm=1 tr=0 ts=6acdee3d cx=c_pps
 a=PfFC4Oe2JQzmKTvty2cRDw==:117 a=fChuTYTh2wq5r3m49p7fHw==:17
 a=IkcTkHD0fZMA:10 a=660iZSQnnn4A:10 a=s4-Qcg_JpJYA:10
 a=VkNPw1HP01LnGYTKEx00:22 a=u7WPNUs3qKkmUXheDGA7:22 a=_glEPmIy2e8OvE2BGh3C:22
 a=VwQbUJbxAAAA:8 a=EUspDBNiAAAA:8 a=SsOP-9FfJHXtHJDkYNsA:9 a=QEXdDO2ut3YA:10
 a=6Ab_bkdmUrQuMsNx7PHu:22
X-Proofpoint-Spam-Info: AW1haW4tMjYxMDEzMDAzNCBTYWx0ZWRfX0yw1teFnNqzL
 5LpqCMASosQ51lYxEr4YJbETN36ieTBROJproto7t7p3+3dFUjbKZgV3dmQ4v0EKZlMhouxWKsw
 IMfeZ9COMUvNxND6oTTPy5SxF2aVaiA=
X-Proofpoint-ORIG-GUID: toDyG6YX8yWZbEFk6DsEucE8irSR5T6E
X-Proofpoint-GUID: toDyG6YX8yWZbEFk6DsEucE8irSR5T6E
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1176,Hydra:6.1.134,FMLib:17.12.100.49
 definitions=2026-10-13_01,2026-10-09_01,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 spamscore=0 bulkscore=0 priorityscore=1501 adultscore=0 suspectscore=0
 phishscore=0 impostorscore=0 lowpriorityscore=0 clxscore=1015 malwarescore=0
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.22.0-2610080000 definitions=main-2610130034



On 10/12/2026 7:01 PM, Manivannan Sadhasivam wrote:
> On Sat, Sep 05, 2026 at 08:59:04PM +0530, Krishna Kurapati wrote:
>> eUSB2 targets handle wakeup interrupts differently depending on device
>> speed when operating in host mode.
>>
>> According to the eUSB2 specification, remote wakeup signaling in host
>> mode is detected via different data-line assertions based on the
>> connected device speed.
>>
>> When a low-speed device is connected, the host repeater drives eD+ to
>> logic '1' upon detecting a K-state on the USB lines during remote wakeup
>> (eUSB2 specification, Section 5.5.14).
>>
>> When a full-speed or high-speed device is connected, the host repeater
>> drives eD- to logic '1' upon detecting a K-state on the USB line during
>> remote wakeup (eUSB2 specification, Sections 5.5.15 and 5.5.18).
>>
>> Since the eUSB2 PHY's "DP" and "DM" interrupt lines monitor the eD+ and
>> eD- line states, configure the wakeup interrupts accordingly
>>
>> Add support for a new phy "type" attribute to be set by eusb2 phy drivers
>> and be read by consumers (in this case usb controller) and act accordingly
>>
>> Changes pushed on top of usb-testing branch. And v7 is only compile tested.
>>
> 
> I believe the merge strategy is to merge all the patches through PHY tree. If
> anyone feel otherwise, please yell at me.
> 
There is one existing comment from Vinod on v8-2/5:
https://lore.kernel.org/all/3a3cf540-816f-41a3-b31d-2902e7f4cf01@oss.qualcomm.com/

Once it is addressed, will send v9 on top of phy next.

Regards,
Krishna,
