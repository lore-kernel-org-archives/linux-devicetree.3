Received: from mx0a-0031df01.pphosted.com (mx0a-0031df01.pphosted.com [205.220.168.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id D57A73EFFAC
	for <devicetree@vger.kernel.org>; Mon, 15 Jun 2026 13:09:07 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.168.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1781528949; cv=none; b=pQjrWNhwhfK981mJoudS7BbeiQp2EeNSF1gjqv9OLwxUHN1X6hy6R3vYsXJPjAzZ4GjczrK8CWZ/f1wP+tU61bcPGmWBZEi6DzjJs+pihNlMJZEczyg4C2Ef7LDF7O5RcRou7iqaIyWwy17pgldRthtspFVUP4Aw3X+t35lBfcc=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1781528949; c=relaxed/simple;
	bh=RjFTDqXFgpvidYyapFhOxz9wI1lGXJd3oSnFiMwKBqE=;
	h=Message-ID:Date:MIME-Version:Subject:To:Cc:References:From:
	 In-Reply-To:Content-Type; b=sFWeeUd+L3HAnjVe19JB87rxpVLQGoZkufLhAUa3D6N0CAZNp6Wk9ak0btcM7baTnPNRhH382PFYOgoFqDKnCfWPZVliXgjvArA3fUSlfR9YMxVy3u3d/B9hXcx7QfVqbDtkTg/xiOJ5g8NoXkBBstKEvWBXlFQ4KkGXceqoYp0=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=QeT6aTgJ; dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b=ef8FkRYh; arc=none smtp.client-ip=205.220.168.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b="QeT6aTgJ";
	dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b="ef8FkRYh"
Received: from pps.filterd (m0279862.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 65FCZE714116367
	for <devicetree@vger.kernel.org>; Mon, 15 Jun 2026 13:09:07 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	VpXgSiHGC0bXiIpwfPNZDaXl/xnRlc9o8aSjGbu/Wc4=; b=QeT6aTgJvcITgCFY
	BpQbftyyrzvP3tBkqB2qco47qHoPS9cpIM89vPnL/BuGtcjSrYa70nEzqKkOHbp5
	cQj0fA/fHVdUz6l6qnE06O+JT5MF/xLoTJrUodZbQtQzhJcq3oYh1M1jIqVFHwgt
	N9UeT7IWrfc/aL2OVLxoEsM4nbkax0va1khfv91kaP5qK1r2rS9Dx5Bvik2EIv6l
	/pKkRRINKf6rYKQRZWbW+uXe5NlK56zOZDsDnyyqjM/USPrf649eQ+4GG/YFuAsW
	7Ng4TOX5RyCmFNgbtCPg0/k8M6Tuwa4Q4TpuCTZLR6DAT8drbsN8h4/FCWN4Wdd5
	Si6XRw==
Received: from mail-pg1-f197.google.com (mail-pg1-f197.google.com [209.85.215.197])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4etetjrtc6-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <devicetree@vger.kernel.org>; Mon, 15 Jun 2026 13:09:06 +0000 (GMT)
Received: by mail-pg1-f197.google.com with SMTP id 41be03b00d2f7-c8584e80bfcso1600479a12.3
        for <devicetree@vger.kernel.org>; Mon, 15 Jun 2026 06:09:06 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1781528946; x=1782133746; darn=vger.kernel.org;
        h=content-transfer-encoding:in-reply-to:from:content-language
         :references:cc:to:subject:user-agent:mime-version:date:message-id
         :from:to:cc:subject:date:message-id:reply-to;
        bh=VpXgSiHGC0bXiIpwfPNZDaXl/xnRlc9o8aSjGbu/Wc4=;
        b=ef8FkRYhOuPuYlYefDnOLJA0hv1yW1TWn3TRi8mdtINAxpMLGcCSN1lehEIOW9Th/G
         z2OmYsXpSPYIhAhGdXXwKZTrzYstsYmOZhtpwHXNilgQ3edvCOygAQx3n4O9nMv4KVO2
         qKEziqgTwtJhue/bUqBniA9Rw+EGt+dqR0K00ecg50P9Ph0AvIucp9yIXHnakrYk8Ne8
         hJyln40OCg2TqT4D2N8jGubz/+16LhnhD/yjmDYKOo0Q5ayzlLVljdP7Q63YwFPZEsLi
         HXXE6BsY7NDpkpRRBz8mkfMT/lhxS8XHD3yosOBXSZJ0E7pfE13Wdl/x/u8ZS6wVaNwr
         RYOg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1781528946; x=1782133746;
        h=content-transfer-encoding:in-reply-to:from:content-language
         :references:cc:to:subject:user-agent:mime-version:date:message-id
         :x-gm-gg:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=VpXgSiHGC0bXiIpwfPNZDaXl/xnRlc9o8aSjGbu/Wc4=;
        b=E+PSfUVEkSUP7IeFqyigZyMRakbel3Rxa93ZPOqDRjLM5Gc2MsdAWUZkCCGqSyrm3E
         KGpihInnsQGkAYzbBvjMTnkoxpR7aZrqf2Zy/eqI8tuzBEV/JZPJEG0y3kAnpeXKqo+O
         y9J9PDAAxfQXhw08NMExSQk+LFeaHRlqfBkrI3udLxf1Nkj2nwXuOQ2Kr2Okh8eIC11E
         DdmQgboXKEuiT+O4fpZRBMsQ6tnIckd+vRwE0g8R+/fHzqeTm4hGn/g1BZqW6ePM/jJJ
         rA+mYgEFUj9ooSDpHxtHIBgxisnWStNj+Bbg6vc08fhKui8Mwt2/INr+vq+rO7Z9rjDr
         Cz1w==
X-Forwarded-Encrypted: i=1; AFNElJ8cRpgov9PBjHcrY7WwfZBpPTgudTBT+5DvgLpI6WPQNuuo7zMCGLCg4q0ppfb1izU8c+JJngVunSPa@vger.kernel.org
X-Gm-Message-State: AOJu0YzCeahI09heU9gyp5P5zOuVFriWg8R5TLTDNvUg8AinhQbI2fzZ
	YpJypv7Dcy2I+ZvFT31fQdO9NDQYtADtf6Z+57BMAupxMl/7ahKGKRxt+DvrzEcshQEGeUPPZk2
	hvUKgNHg8sc8d90pVYVhm/OUYadu8oUIwySLxCLQFbB4oWxUo1+tANd01GVIAop12
X-Gm-Gg: Acq92OGAA375oKo1HziU0bTOTEBHlj6q8o5iEZMSfCVqD+5C1yMsYtjWZF6zcs4QO6v
	rqROEbhl7D4CiuZ0MneOiC8LFkWV4s5nDDHueMkXUsw3Wj0Kgyvh5DiurA2xSqiVqhAzeKY0vpD
	KVW5GQeoqE/cJGxmRaKHMqbqW4rWCiqktyaGNrcFdatN+4fep9smZ2grzYWxd6aPWdf7cRr3U+I
	tEYIz8Uw7HpYpq+3WD45WPJdw3Msa+iu1hbx9XWXLK9HEnxu/lIQ4qbg0In2G+PMvmQhoQOAgo4
	WWrsLvMbeiCzbOR9OhXVSaM7n/VZ8UCLIrBStzAxBkK3p4lL6kOa3tKFfeQ+0UEw9ZwNrUTmRYp
	oiuebs7OqRLBmB7XnNQPkWN9EjmQ1shswkLSarwHuJRRKJwQFxa/hfYk=
X-Received: by 2002:a05:6a21:3208:b0:3a3:171f:6aff with SMTP id adf61e73a8af0-3b783b13836mr15703721637.2.1781528946198;
        Mon, 15 Jun 2026 06:09:06 -0700 (PDT)
X-Received: by 2002:a05:6a21:3208:b0:3a3:171f:6aff with SMTP id adf61e73a8af0-3b783b13836mr15703681637.2.1781528945607;
        Mon, 15 Jun 2026 06:09:05 -0700 (PDT)
Received: from [10.218.44.82] ([202.46.22.19])
        by smtp.gmail.com with ESMTPSA id 41be03b00d2f7-c866519f88bsm8829083a12.27.2026.06.15.06.09.01
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Mon, 15 Jun 2026 06:09:05 -0700 (PDT)
Message-ID: <9a2f95e1-f01e-4956-9e84-23f0a5f26298@oss.qualcomm.com>
Date: Mon, 15 Jun 2026 18:38:59 +0530
Precedence: bulk
X-Mailing-List: devicetree@vger.kernel.org
List-Id: <devicetree.vger.kernel.org>
List-Subscribe: <mailto:devicetree+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:devicetree+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v2 0/2] Add psci_sys_reset2 reboot modes for Qualcomm
 boards
To: Lorenzo Pieralisi <lpieralisi@kernel.org>,
        Loic Poulain <loic.poulain@oss.qualcomm.com>
Cc: Anurag Pateriya <anurag.pateriya@oss.qualcomm.com>,
        Bjorn Andersson <andersson@kernel.org>,
        Konrad Dybcio <konradybcio@kernel.org>, Rob Herring <robh@kernel.org>,
        Krzysztof Kozlowski <krzk+dt@kernel.org>,
        Conor Dooley
 <conor+dt@kernel.org>, linux-arm-msm@vger.kernel.org,
        devicetree@vger.kernel.org, linux-kernel@vger.kernel.org,
        Xin Liu <xin.liu@oss.qualcomm.com>
References: <20260529-psci_sys_reset-dt-changes-for-pakala-v2-0-1964ebf1924c@oss.qualcomm.com>
 <CAFEp6-2-n1L8rLv9zV142D_Q7io1G1ZuFgLHowsf8sObQt6iLw@mail.gmail.com>
 <aivBcGQgeKGW45Is@lpieralisi>
Content-Language: en-US
From: Shivendra Pratap <shivendra.pratap@oss.qualcomm.com>
In-Reply-To: <aivBcGQgeKGW45Is@lpieralisi>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 8bit
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYwNjE1MDEzOSBTYWx0ZWRfX80UclcOEPwIY
 k2cleKJlvjUmR6lpmBJSoISzN9W9wBLPvgEkc1iXAbmt9U287FxJh5Togh6TSu8gZm+X+V6oLUn
 iNzpe1vnHsr/xsRTITyql07qlCjYv6oV4nki7eaJpOzoIP1RjMPGbaU0tAD9h+6bUCEkUfGK4/M
 CApQQDDKdIsHxbBtFKMacT3sbvN7FSibD1AvSDs9xiWvweJmerdB3cXko4QhlvlPlKp8FFWJ+SE
 gc+ZtPxq0KNxn8zKldH7UiH6VU09B6RFDe1rWD1ADwfYASZYYfEDFb6K/qywqNuUjLgc1lt50gJ
 30x7XRxgGsSC+AoBnW+HrQEaGYvciswfgr4EHObzTsEn26CmuoErCm8GXFkS+EiLlQ0pDdsp5eA
 sAGbD+a3m+x0F/gmaqhUoA3/KdipwBAdOPR4ri3B/oZlx+UNOYEXPk/lRyvz8IwWI9Oys5qEZ6B
 treuxFZ6oOdO+no47bw==
X-Proofpoint-ORIG-GUID: 40AtuZ4awv_wYGT3OMbCZGV65Lm8rix0
X-Proofpoint-Spam-Info: AW1haW4tMjYwNjE1MDEzOSBTYWx0ZWRfXy0ohQmshUvwK
 KMmoCUKn56gutit2UlrGQbcQb22/An0WmyvsdJwJGUHxjsM1ukP5qACXnsC28zfiR2NmeaNqlhf
 4CCc9t1Oudt0By/ho6uP5XipPo57yfk=
X-Authority-Analysis: v=2.4 cv=HttG3UTS c=1 sm=1 tr=0 ts=6a2ff973 cx=c_pps
 a=rz3CxIlbcmazkYymdCej/Q==:117 a=fChuTYTh2wq5r3m49p7fHw==:17
 a=IkcTkHD0fZMA:10 a=FelO9ux0wxsA:10 a=s4-Qcg_JpJYA:10
 a=VkNPw1HP01LnGYTKEx00:22 a=u7WPNUs3qKkmUXheDGA7:22 a=_K5XuSEh1TEqbUxoQ0s3:22
 a=VwQbUJbxAAAA:8 a=EUspDBNiAAAA:8 a=N88bLgbrC_UBjzhzuoEA:9 a=3ZKOabzyN94A:10
 a=QEXdDO2ut3YA:10 a=bFCP_H2QrGi7Okbo017w:22
X-Proofpoint-GUID: 40AtuZ4awv_wYGT3OMbCZGV65Lm8rix0
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1143,Hydra:6.1.125,FMLib:17.12.100.49
 definitions=2026-06-15_03,2026-06-15_02,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 adultscore=0 spamscore=0 suspectscore=0 clxscore=1015 impostorscore=0
 malwarescore=0 bulkscore=0 priorityscore=1501 lowpriorityscore=0 phishscore=0
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.22.0-2606040000 definitions=main-2606150139



On 12-06-2026 13:51, Lorenzo Pieralisi wrote:
> On Wed, Jun 10, 2026 at 02:57:19PM +0200, Loic Poulain wrote:
>> Hi Anurag,
>>
>> On Fri, May 29, 2026 at 4:29 PM Anurag Pateriya
>> <anurag.pateriya@oss.qualcomm.com> wrote:
>>>
>>> Adding PSCI SYSTEM_RESET2 reboot-modes for sm8750 and
>>> kaanapali based boards.
>>
>> I would like to highlight that when Linux/EFI is enabled, which is a
>> common config, efi_reboot is used as the primary reboot path (see
>> machine_restart). 

Yes but, only if EFI RESET RUNTIME service is enabled by UEFI.

efi_reboot(...) {
..
          if (!efi_rt_services_supported(EFI_RT_SUPPORTED_RESET_SYSTEM))
                   return;
..

>> As a result, the PSCI reboot hook is not invoked in
>> this scenario, assuming Qualcomm firmware provides EFI runtime
>> services. 

Currently EFI RUNTIME RESET service is not enabled on these firmware.

>> As a follow-up, it would therefore be beneficial to also
>> improve the EFI path to support such custom mode(s)...

Yes, and potentially linux should also have some control, if it wants to
go via efi reset path or the PSCI reset path.

thanks,
Shivendra

> 
> I have not checked but we should probably put in a place a way for user
> space to check that PSCI is _not_ the reboot method that will be
> used, lest it would be allowed to send commands to the kernel that
> would be duly ignored.
> 
> Need to go through the whole thing again before commenting any further.
> 
> Thanks,
> Lorenzo
> 
>> Regards,
>> Loic
>>
>>
>>
>>>
>>> These DT patches depend on PSCI SYSTEM_RESET2 support introduced in:
>>> https://lore.kernel.org/all/20260514-arm-psci-system_reset2-vendor-reboots-v22-0-28a5bde07483@oss.qualcomm.com/
>>>
>>> To: Bjorn Andersson <andersson@kernel.org>
>>> To: Konrad Dybcio <konradybcio@kernel.org>
>>> To: Rob Herring <robh@kernel.org>
>>> To: Krzysztof Kozlowski <krzk+dt@kernel.org>
>>> To: Conor Dooley <conor+dt@kernel.org>
>>> Cc: Shivendra Pratap <shivendra.pratap@oss.qualcomm.com>
>>> Cc: Lorenzo Pieralisi <lpieralisi@kernel.org>
>>> Cc: linux-arm-msm@vger.kernel.org
>>> Cc: devicetree@vger.kernel.org
>>> Cc: linux-kernel@vger.kernel.org
>>>
>>> Signed-off-by: Anurag Pateriya <anurag.pateriya@oss.qualcomm.com>
>>> ---
>>> Changes in v2:
>>> - Fixed subject lines.
>>> - Link to v1: https://lore.kernel.org/r/20260529-psci_sys_reset-dt-changes-for-pakala-v1-0-7c32161cf50b@oss.qualcomm.com
>>>
>>> ---
>>> Anurag Pateriya (1):
>>>        arm64: dts: qcom: sm8750: add reboot-mode support
>>>
>>> Xin Liu (1):
>>>        arm64: dts: qcom: kaanapali: add reboot-mode support
>>>
>>>   arch/arm64/boot/dts/qcom/kaanapali-mtp.dts | 7 +++++++
>>>   arch/arm64/boot/dts/qcom/kaanapali-qrd.dts | 7 +++++++
>>>   arch/arm64/boot/dts/qcom/kaanapali.dtsi    | 2 +-
>>>   arch/arm64/boot/dts/qcom/sm8750-mtp.dts    | 7 +++++++
>>>   arch/arm64/boot/dts/qcom/sm8750-qrd.dts    | 7 +++++++
>>>   arch/arm64/boot/dts/qcom/sm8750.dtsi       | 2 +-
>>>   6 files changed, 30 insertions(+), 2 deletions(-)
>>> ---
>>> base-commit: 6ee02bbf328be8a8586487e3af73b65a906cce58
>>> change-id: 20260529-psci_sys_reset-dt-changes-for-pakala-a09fc0e2a8a8
>>>
>>> Best regards,
>>> --
>>> Anurag Pateriya <anurag.pateriya@oss.qualcomm.com>
>>>
>>>

