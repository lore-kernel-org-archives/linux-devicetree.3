Received: from mx0b-0031df01.pphosted.com (mx0b-0031df01.pphosted.com [205.220.180.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 9FA333D3319
	for <devicetree@vger.kernel.org>; Fri, 15 May 2026 10:29:00 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.180.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1778840941; cv=none; b=a1tbQ2uu83xhu11BqHr5RVVq/dJP0zcOKc2e05oNXt2OWJQ3rHr2QWhxI/CCBZ8sR7vTv+DgQAyprQcHNTI7K9HxsiyrTykOy/Udz0XKz3wybzeslhlLYqX5vCh/5kc63I/HqLGaJRXfr9allPJhvgkWFqcMpU0dv+Jp9ZwYHSw=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1778840941; c=relaxed/simple;
	bh=1Yz/EcUmW9zfWne8Xzd09ymy+W7uXt8JQ3e5p3N3gFg=;
	h=Message-ID:Date:MIME-Version:Subject:To:Cc:References:From:
	 In-Reply-To:Content-Type; b=t8Ushw94JcPYKXlT4+Eu2ofnQA71Qm0pBv7Gk0fEM5WzXispcu8dq4YQ19nlZQnddP+GtPe30jzm1BFXRHqN5/hz1DnFuhBNWv5DCDe1Zxg6xi1uoaaz5XjQtjQdG9G0YHod/lNMqN9PvHh4kZ7UX/e23hlUAmnvrwPHlTEYWs8=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=f4O24kUA; dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b=BUQBS6St; arc=none smtp.client-ip=205.220.180.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b="f4O24kUA";
	dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b="BUQBS6St"
Received: from pps.filterd (m0279871.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 64F4o7OI4008602
	for <devicetree@vger.kernel.org>; Fri, 15 May 2026 10:28:59 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	79VlzIrGeomGTJq0ibBMeq77VXZ65QnBt/A7OAjU0As=; b=f4O24kUA34Vv7HOK
	RcRvTPqIziAR3TczZDBVZvIoVjJfDfjMQwX+3oc/9Q7mlNXg9frsIBZmcY/N+aZ9
	pzLmEhbWjAo49/b4dODJtzDGdt5gcOmsWFC7HZ//1I2LIcg2EVJwN/d6t7oCVr08
	0dIHF5m1Bb747di1bvKknY91SHo1gU4aFvYfHpDGMTqww8LGVqDhzYYmzzaOOTDH
	L5HXB/839pOiZlLgRTCiDg5KvYRbNV4h1JvGzq16YFxc/GRhvRcMlF7n3sWH3Ofe
	CIJcRmB9yMou5F4YzRv4dgmOuIkLv3mrD+UOSmDYPC5L2Q0+fy0i0Bt1BF7Ue7FE
	s/gxZg==
Received: from mail-pl1-f197.google.com (mail-pl1-f197.google.com [209.85.214.197])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4e5m1stuv5-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <devicetree@vger.kernel.org>; Fri, 15 May 2026 10:28:59 +0000 (GMT)
Received: by mail-pl1-f197.google.com with SMTP id d9443c01a7336-2bc860066a6so49552225ad.0
        for <devicetree@vger.kernel.org>; Fri, 15 May 2026 03:28:59 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1778840937; x=1779445737; darn=vger.kernel.org;
        h=content-transfer-encoding:in-reply-to:from:content-language
         :references:cc:to:subject:user-agent:mime-version:date:message-id
         :from:to:cc:subject:date:message-id:reply-to;
        bh=79VlzIrGeomGTJq0ibBMeq77VXZ65QnBt/A7OAjU0As=;
        b=BUQBS6St+38pOFAxSOGIPtd5V3d5lJzMiM7KIyVb4FzG2rBtt69Yl9yQegAo5UlV7r
         b4jvPw+EFxt32gT9C23kXaVYo4zB8wx8RRcQxxrVcPvEKJaA4QFrosHHr6tYPZ7CfmcW
         GM/8hFTnsUdAWG2MdPd4HidsNUyOafjNNvRpnKY7QT/9fXbq1k9u/L/ml534Dakt+8Jb
         XPViAFBfoFB55vB9ghTtXtLZOvtlbNfc52o7rg+mSogNtoGs7cr40wdgJKZLM4QPc3RZ
         MUfa1yEjmXqdpa0y4R0iaYck2ZmMUJyKeLwsiJ8Gnq5Z+nWvGTd2QAgxceuFNdMl9wpM
         NOFg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1778840937; x=1779445737;
        h=content-transfer-encoding:in-reply-to:from:content-language
         :references:cc:to:subject:user-agent:mime-version:date:message-id
         :x-gm-gg:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=79VlzIrGeomGTJq0ibBMeq77VXZ65QnBt/A7OAjU0As=;
        b=Ges+owctS4L+Mv3KUZBOIw2VToVVTfkOpqVdY1atoWb93g161Y0i0CSfGrOmTBQZSz
         AXlaHZh3up63sY2YlMoYxeXy1OD5L2oX/mjE4YYHazF9L8VxRLUBdEA14PSF7lgIdNvd
         V9srtxfP9RqjxeEL89MjeAvdqERmLAx39R8sUOJWzFGTtsS/kbIJjMh146o66gZCmu0K
         H/lQ9WVOyVKJdfeClaeDM93eE0/Fd2v9B3CwjuXs3ItOaIE6/UbXxyV42iEdix0EuKG4
         O7tiY3ZAhQ0cB9wci+1pt3kdxjIXchnzy76XDSeRg1qXJqfnFbAL3vJnCjt3lctwdXmm
         CDuw==
X-Forwarded-Encrypted: i=1; AFNElJ+kdRcut4a6EwI8oLN2yiJZHLUN1REbCk1kCsI7ec2laDClg7OexFsYJICSLhgprBxQCNUHGRDjoGul@vger.kernel.org
X-Gm-Message-State: AOJu0YwhnUUHidnsCe6CiWyG8oix69SQGXPTaCs8HiR20PoEzSlTqRjZ
	FSnHC1aExb9yOqBGmQmpsPl56UexlwXR0y/8ETwuxl9Uvggwoq1hZ93Bj71/nulBy3p9N7VaDtM
	wL5Ft1ffhI4MaTIEKw+sltqim+35JsR2poEKbssLaDHxbwsfVeHbosaBDLsFNsKJHW3jFb0M+
X-Gm-Gg: Acq92OGrrBOcI7tc1kWnziAv7pFAWrMEyReLj5unCjVjEPXxRiAWgov5nqda/EFUr9c
	Y3PmSsPWouKlJNXXYDfIaA8ysmxghY3nHAc5nfVlj4S1RNfL+LrqfNWcXecE67fO2cASyC77Fkc
	qCjeREvWRPFwsyQGL0/eegvzKgAdKkXt9LySNteLJmHF6Vt5Qt6593mkfPpijKCfXzJ1lHdHJew
	EoivZQ4FO2ZjH16DvqxBK1cwRx38Harclo7/LDhVO/TcbqJAAAlNUFLCBu6OsS+WXpZ5sjEh/EF
	HsLK5xqxXO66vC88/WG6oi+5wd/2m3ECCeFnanTceUw4NZXSZ4gigiKUtdkJoOur7+PYaSv+paV
	z4oYFvRIKJpVlMXX85vFFTYEoDizQuPjq6RThsjaNF3i7KvADOFuBIfJFIr837Wc=
X-Received: by 2002:a05:6a20:918a:b0:39b:e321:67ea with SMTP id adf61e73a8af0-3b22ecac1eemr3942674637.45.1778840937351;
        Fri, 15 May 2026 03:28:57 -0700 (PDT)
X-Received: by 2002:a05:6a20:918a:b0:39b:e321:67ea with SMTP id adf61e73a8af0-3b22ecac1eemr3942638637.45.1778840936857;
        Fri, 15 May 2026 03:28:56 -0700 (PDT)
Received: from [10.217.222.91] ([202.46.22.19])
        by smtp.gmail.com with ESMTPSA id 41be03b00d2f7-c82bb062941sm6648770a12.2.2026.05.15.03.28.52
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Fri, 15 May 2026 03:28:56 -0700 (PDT)
Message-ID: <54fbc2bd-811b-4b35-987a-1dd5e6ea447c@oss.qualcomm.com>
Date: Fri, 15 May 2026 15:58:50 +0530
Precedence: bulk
X-Mailing-List: devicetree@vger.kernel.org
List-Id: <devicetree.vger.kernel.org>
List-Subscribe: <mailto:devicetree+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:devicetree+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH 2/2] arm64: dts: qcom: shikra: Enable ice support
To: Konrad Dybcio <konrad.dybcio@oss.qualcomm.com>,
        Herbert Xu <herbert@gondor.apana.org.au>,
        "David S. Miller" <davem@davemloft.net>, Rob Herring <robh@kernel.org>,
        Krzysztof Kozlowski <krzk+dt@kernel.org>,
        Conor Dooley
 <conor+dt@kernel.org>,
        Bjorn Andersson <andersson@kernel.org>,
        Konrad Dybcio <konradybcio@kernel.org>
Cc: linux-arm-msm@vger.kernel.org, linux-crypto@vger.kernel.org,
        devicetree@vger.kernel.org, linux-kernel@vger.kernel.org
References: <20260515-shikra_ice_ufs-v1-0-b1b6ced70559@oss.qualcomm.com>
 <20260515-shikra_ice_ufs-v1-2-b1b6ced70559@oss.qualcomm.com>
 <8ed6604f-f959-4b20-8b23-ded130426f36@oss.qualcomm.com>
Content-Language: en-US
From: Kuldeep Singh <kuldeep.singh@oss.qualcomm.com>
In-Reply-To: <8ed6604f-f959-4b20-8b23-ded130426f36@oss.qualcomm.com>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit
X-Proofpoint-ORIG-GUID: FsrkhtwMCM8yaDaAKijnIoWcVzZtkU-Y
X-Proofpoint-GUID: FsrkhtwMCM8yaDaAKijnIoWcVzZtkU-Y
X-Authority-Analysis: v=2.4 cv=cZPiaHDM c=1 sm=1 tr=0 ts=6a06f56b cx=c_pps
 a=cmESyDAEBpBGqyK7t0alAg==:117 a=fChuTYTh2wq5r3m49p7fHw==:17
 a=IkcTkHD0fZMA:10 a=NGcC8JguVDcA:10 a=s4-Qcg_JpJYA:10
 a=VkNPw1HP01LnGYTKEx00:22 a=u7WPNUs3qKkmUXheDGA7:22 a=3WHJM1ZQz_JShphwDgj5:22
 a=iVyd5dlQVcev7GM2eQkA:9 a=QEXdDO2ut3YA:10 a=1OuFwYUASf3TG4hYMiVC:22
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYwNTE1MDEwNSBTYWx0ZWRfXwOOuu4WHogRW
 gjW8ka12u9Y3s37flSKMObHfa8S12IlJaB2A6NllFc7PjicWzR6jCgiukJCuaxHNGRBxZprIrX+
 MdzsKFeLnZowWKAjZz/dA6EJMqcW1QEIgMbM/JytilI2h4i/lhZpoCrx0I5iW2ELYirMsbopX76
 rDzkyRlg7ZJfsc0/mb3p9bV6kZw4gfm0WLlsNXefyinNkq56MvrXqCSwvdsU6lCPabzEZqWXVE2
 bJHc4lK+1HOt5Y3EheBBY9jbc+nRpv30jKJFLDZe0sd7NJ0Fg5uil5Ex0WGsYBNx6OCvPEtsDRE
 BwUlhnVAt41lZzxPpH8/9xMVF0+YWS0gbQI/sIABlOCg6ZpLSsScUxwGmy+eSM+C3L4Coajilhh
 sMH3vFsrgNgrr/fCyILtcM1XWMthD3ZFMZPfIYD6coc+0Wt4G43Mzgw1/CVrayUwvpeCkA9XfXQ
 uzfb5tm0hqQ75dy3DYA==
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1143,Hydra:6.1.51,FMLib:17.12.100.49
 definitions=2026-05-15_02,2026-05-13_01,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 phishscore=0 lowpriorityscore=0 clxscore=1015 spamscore=0 priorityscore=1501
 adultscore=0 suspectscore=0 malwarescore=0 impostorscore=0 bulkscore=0
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.22.0-2605130000 definitions=main-2605150105

On 15-05-2026 15:54, Konrad Dybcio wrote:
> On 5/14/26 10:30 PM, Kuldeep Singh wrote:
>> Add UFS inline crypto engine(ICE) support for shikra.
> 
> s/ufs/SDCC

My bad! Thanks for pointing.
I leveraged commit message and made this mistake.

Will send v2 with updated commit message.

-- 
Regards
Kuldeep

