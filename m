Received: from mx0b-0031df01.pphosted.com (mx0b-0031df01.pphosted.com [205.220.180.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 9772B41C2F3
	for <devicetree@vger.kernel.org>; Thu, 26 Mar 2026 16:55:42 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.180.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1774544143; cv=none; b=q0VMsmGqNXDM9/BLLHzrt5E5W8UYOr5e/pm2/iW4qOgFkh65IfXevUBcCilioUzdkm04FU9Vjft+kFTYIftmSAIxQo5SVH8jia8gLkVnfpxo/2oRB425Y42pJgqoF0UQqT0wkYK+5PA6H8OBDP8MJp0nB9BUr+95XYn1Nkpg030=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1774544143; c=relaxed/simple;
	bh=34I1cZD5tJvv2Sx8VHq0An05xW89MQuOzPSQsGgEZUs=;
	h=Message-ID:Date:MIME-Version:Subject:To:Cc:References:From:
	 In-Reply-To:Content-Type; b=Gh1viMJqQucCOdxQiQFc6O9tIymMe+uPwg5hDnCYArYDVClgaGZyOD1N9tPWmpatClIANoNIklOO0sZXZ95+lfQplRGG5oTl6C3GL8z4OgCvuHmuDWnMXobQmlWFzjCwwJFIn+eF8JWdv+uOtrwJvt/PwlzPPcnl/msWx1f863E=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=UBnRnPhd; dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b=aS03rsLr; arc=none smtp.client-ip=205.220.180.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b="UBnRnPhd";
	dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b="aS03rsLr"
Received: from pps.filterd (m0279870.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 62QF9h4A1088118
	for <devicetree@vger.kernel.org>; Thu, 26 Mar 2026 16:55:41 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	34I1cZD5tJvv2Sx8VHq0An05xW89MQuOzPSQsGgEZUs=; b=UBnRnPhdVNKnwlkE
	VpyP0kxOkTHkg3wusTG8DGi/sL9lXdpBpmavyw9JDtNzDDiOO7X70L3rdC/CzxLx
	o/YPIm/LmnWo5AvqP84wjymMsEsswDuFgT9/B/dypd5+AmiNNowKfyBSMWruHfnr
	5q8NhvSDhB9AoQjFacd3OFXz1wVbYKlA5qXc3Iamqob7vBq81IB6L66CPXaGAejq
	CEwFAL3ehdXBcybywQDQkWGs4xjGOmlANCyTLeKwbDSrC4BdcoH5tGCLklv1nLrV
	ivxnFjqB5qbEyCuDaqSQGF7pi4U7M+leQpsQyDiBe9/NfB074SP4Xr/pOnLtU06E
	Xbz39Q==
Received: from mail-pj1-f69.google.com (mail-pj1-f69.google.com [209.85.216.69])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4d4rcn3grx-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <devicetree@vger.kernel.org>; Thu, 26 Mar 2026 16:55:41 +0000 (GMT)
Received: by mail-pj1-f69.google.com with SMTP id 98e67ed59e1d1-358e425c261so1547455a91.3
        for <devicetree@vger.kernel.org>; Thu, 26 Mar 2026 09:55:41 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1774544141; x=1775148941; darn=vger.kernel.org;
        h=content-transfer-encoding:in-reply-to:from:content-language
         :references:cc:to:subject:user-agent:mime-version:date:message-id
         :from:to:cc:subject:date:message-id:reply-to;
        bh=34I1cZD5tJvv2Sx8VHq0An05xW89MQuOzPSQsGgEZUs=;
        b=aS03rsLr/sjo3M3OgtYOBrIDLh25w4+3L1eapNbPr9Dy5VArx207l0nAo+IBm4L2mi
         zguHCcl81wgSDBLF3HRC9XuGqXB8aN4SdENDZS9um3GKoNCQGcg8JdkR+YJ9S2n+j8i4
         aMuu58E65JYhZSnTggsP9z9hi7Q5J8WXRSSaVvxkoUZCVzpA5DZoX6yh13K+yGU8mHSH
         HZYp30rB2Ammztie772O2OWX4bKi52uD1Xj/EsZRzLqDGJnUzVbPGk2sg/iDOzjm2/2M
         qbz3XI0NLu3/yVrZz8Z96P0zBiG7z246Dovxw8LFs5IMnh/TVwDa1LvMfTz1smKnarm0
         8ExQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1774544141; x=1775148941;
        h=content-transfer-encoding:in-reply-to:from:content-language
         :references:cc:to:subject:user-agent:mime-version:date:message-id
         :x-gm-gg:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=34I1cZD5tJvv2Sx8VHq0An05xW89MQuOzPSQsGgEZUs=;
        b=SeDSfVqg/r89raEruzRUUF1jbHV6r9vAHoL0TMU1B2LKeDXWM1bWGliigG/WL6lyVs
         J8ej2W+6rLh+SQ3a6MNVPa23ofSEshRjH8GhMAHY6pEes6aeQgUa8ISOqmejfkc1IMtR
         hgL+1UTcB7lZFLl74tLhrxz3zuGeezCzBefmLWqLB3sXTwIiKYacKjtt9i7YMYmtM5wr
         HuBjRf5ZigSD7xKylNx3JNJRmfr/eS1cVpR8kJJrZfWNCk1wTn3fLJdCqVQCL1As3JXJ
         EIS7XFiXY4DYBWsJ2ja/3rasRy7oZXHbeo83qMLb7y2EFIDpGWcplWyBUolG6/MCZazD
         olzw==
X-Forwarded-Encrypted: i=1; AJvYcCXTEuybjuUi7Li0f7IDFtOYNlu8qc+T/P5SpC9fxNz7hb/c2fIU/y760O9U28gtOolFqfOwKyZwJsfM@vger.kernel.org
X-Gm-Message-State: AOJu0Yxo6JB53OjRrqELkHMWun2dTyz83q8FuaaKawl2aHo9Y0c+dcfG
	QMt37397us61+rcbZchZSZtpz7hqnfZhgeRTC7laC8HPsknuh1ftCQ3hEcIK2WHhfdyafOxAae0
	Htorx96w2rzDSnjWtIR00/UJhvAAemIuWRZxYttm0o+oaPtvsGIMv1toKlXTU7e/z
X-Gm-Gg: ATEYQzxYJ506kXgzVLS/4jEOX9qBfp5gXLWsuEZ/zVNkNrO3/8T3XsdFULrOQYbQyE7
	UiGX0ZcEsgRlLCU8rNFwekCrZtFRVSOfrKCNua53lkoazOXccn8AMhUSEX21LSSfu83pdd26fXn
	bARMBI5T49nkm4NjkQKNDJkflEyPvaSjRB7r4ZXdHUNjgAtezPKFJtnhRI+0jd6UdQi/kzAtXmJ
	fSQU8M0SVy/maJ+XP3dQvwKj/cygSXphMwCWm3HkMOS8aHAhaOwllIE+m0SkTLojdYUe+CPn8de
	qjh7/zNSz+NGBFud4MWR1YEDU7+IMmXLN9VfFMimCcAlyPcCTWMELniIW7EQICL/ANHh4fNg1xy
	prUguQQJxqafFulYB6xIknKMG2h2En5BhShpxzFRYz9dj4SP1fcsg
X-Received: by 2002:a17:90b:3a83:b0:35a:cf:64a6 with SMTP id 98e67ed59e1d1-35c0ddc50aamr7186686a91.23.1774544140648;
        Thu, 26 Mar 2026 09:55:40 -0700 (PDT)
X-Received: by 2002:a17:90b:3a83:b0:35a:cf:64a6 with SMTP id 98e67ed59e1d1-35c0ddc50aamr7186664a91.23.1774544140124;
        Thu, 26 Mar 2026 09:55:40 -0700 (PDT)
Received: from [192.168.0.104] ([49.207.195.178])
        by smtp.gmail.com with ESMTPSA id 98e67ed59e1d1-35c22d09573sm2243987a91.16.2026.03.26.09.55.36
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Thu, 26 Mar 2026 09:55:39 -0700 (PDT)
Message-ID: <328a120e-e9e0-4b3d-a2c0-04eb471c0937@oss.qualcomm.com>
Date: Thu, 26 Mar 2026 22:25:34 +0530
Precedence: bulk
X-Mailing-List: devicetree@vger.kernel.org
List-Id: <devicetree.vger.kernel.org>
List-Subscribe: <mailto:devicetree+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:devicetree+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH] arm64: dts: qcom: Move board nodes to common DTSI
To: Krzysztof Kozlowski <krzk@kernel.org>,
        Gopikrishna Garmidi <gopikrishna.garmidi@oss.qualcomm.com>,
        Bjorn Andersson <andersson@kernel.org>,
        Konrad Dybcio <konradybcio@kernel.org>, Rob Herring <robh@kernel.org>,
        Krzysztof Kozlowski <krzk+dt@kernel.org>,
        Conor Dooley <conor+dt@kernel.org>
Cc: linux-arm-msm@vger.kernel.org, devicetree@vger.kernel.org,
        linux-kernel@vger.kernel.org, rajendra.nayak@oss.qualcomm.com
References: <20260326-glymur-mahua-common-nodes-v1-1-12bb26920ea4@oss.qualcomm.com>
 <03996c07-f9f3-4586-96ae-075927da2577@kernel.org>
Content-Language: en-US
From: Sibi Sankar <sibi.sankar@oss.qualcomm.com>
In-Reply-To: <03996c07-f9f3-4586-96ae-075927da2577@kernel.org>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit
X-Authority-Analysis: v=2.4 cv=Vdr6/Vp9 c=1 sm=1 tr=0 ts=69c5650d cx=c_pps
 a=vVfyC5vLCtgYJKYeQD43oA==:117 a=FDuvZuZHjihTmU/CkdNO9w==:17
 a=IkcTkHD0fZMA:10 a=Yq5XynenixoA:10 a=s4-Qcg_JpJYA:10
 a=VkNPw1HP01LnGYTKEx00:22 a=u7WPNUs3qKkmUXheDGA7:22 a=gowsoOTTUOVcmtlkKump:22
 a=VwQbUJbxAAAA:8 a=EUspDBNiAAAA:8 a=vK87R4Ct5GjYayJDMpYA:9 a=QEXdDO2ut3YA:10
 a=rl5im9kqc5Lf4LNbBjHf:22
X-Proofpoint-ORIG-GUID: YdTFhnzwG0Y-ZRvaAkpAYlD5KicKKcl2
X-Proofpoint-GUID: YdTFhnzwG0Y-ZRvaAkpAYlD5KicKKcl2
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYwMzI2MDEyMCBTYWx0ZWRfX20hM5EhuO0aO
 bNEnqh65AL/FWUpym2rPVdJV9EwDeX+XZ2bST6zIt70TYqFcFMJS8+HF7+HCyL3ZM9Ihg6W3LN9
 Mmr75pkytqtDn5jIXuqEv6GBatKVxea1zxIFTgcsVqrclaVbK1KSdZHhXEmfwcVDY1VRzuBcG6G
 +tobpJ9pk7gAiaGffMlCN1ibvG16ey649VXuzPE8EUemGB3ChxtAvAxcAwpp826Fe4cpeyrmdwo
 8iewW7ulIG0BB4rws60bPwPXsJdgl1RMDqqsIrMEsn6MqPQLtptSeL3ZC2AG12/TBLiGN+aoXiI
 cOzbW4bZooJbupyxKcW9OqLWvPMuJviCVDmh4vBdU6/aAXqNfJE0RHdLuY0BvA1zkoEmcS9NyE4
 Bgq3ZPKHJqZ3lGMIBdtmRtnobghQPd7d1PkJY0w1o0xOKOWSOx+gLwN65amqZQR9Zhp6/bvbe2a
 c3eRqkEny6MTpvBC4LQ==
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1143,Hydra:6.1.51,FMLib:17.12.100.49
 definitions=2026-03-26_03,2026-03-26_01,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 phishscore=0 bulkscore=0 malwarescore=0 spamscore=0 lowpriorityscore=0
 suspectscore=0 clxscore=1015 adultscore=0 impostorscore=0 priorityscore=1501
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.22.0-2603050001 definitions=main-2603260120


On 3/26/2026 7:55 PM, Krzysztof Kozlowski wrote:
> On 26/03/2026 15:21, Gopikrishna Garmidi wrote:
>> The display, peripherals (touchpad/touchscreen/keypad), usb and their
>> dependent device nodes are common to both Glymur and Mahua CRDs,
>> so move them from glymur-crd.dts to glymur-crd.dtsi to enable code
>> reuse.
>>
> Same questions as for earlier tries (why this has to be repeated?), e.g.
> x1-crd: Please describe here what is the actual common hardware. In
> terms of physical hardware, not what you want to share.


There seems to be some kind of confusion here. This patch doesn't
introduce the common board file rather it just moves the nodes
mentioned in the commit message to the common board file.

https://lore.kernel.org/lkml/20260318124100.212992-3-gopikrishna.garmidi@oss.qualcomm.com/

The actual creation of the common board file was done ^^.

>
> Best regards,
> Krzysztof
