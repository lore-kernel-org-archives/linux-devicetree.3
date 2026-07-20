Received: from mx0a-0031df01.pphosted.com (mx0a-0031df01.pphosted.com [205.220.168.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 433353ACA7A
	for <devicetree@vger.kernel.org>; Mon, 20 Jul 2026 08:40:15 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.168.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1784536816; cv=none; b=bniGa8W5v/il7O2ok+jFAgxRS2fgtLnoux390cQXUdaQlOVscnHnvV21qqDh2Kn6+8MYgbwr+dVmRq6LagiiGjt27A4vB2cV4Cxnx3bVK/zI5OZRmNuALPDZkTwtgDG6WFNB5RaPLYtC37+1mTG+gUWH6PnG53vQn4UiXuPCxWs=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1784536816; c=relaxed/simple;
	bh=AkrjbAlxgoG01PZVi93YscZ8XMuxwjCJ8qoWXTRe5vE=;
	h=Message-ID:Date:MIME-Version:Subject:To:Cc:References:From:
	 In-Reply-To:Content-Type; b=SznBRsSuzcaVW+Pmsm/PV6Q6lGkziaJaIZWJpTPpBJlOGlPp0BwsBhC1fzEWW2Ngrs44pI58l4RsPJgN1FKjXRQ1ZVHKIf7yiqlRegbDfvtHFO3IUCseUcMkBeoFvNS4/CG2Tuw5HPYqujG8iXBKzD+v7sNfPlg/hpisrVQZziI=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=gQDRz458; dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b=Jvswc36t; arc=none smtp.client-ip=205.220.168.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b="gQDRz458";
	dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b="Jvswc36t"
Received: from pps.filterd (m0279866.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 66K6RXgv1420288
	for <devicetree@vger.kernel.org>; Mon, 20 Jul 2026 08:40:14 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	sEnq2lNuSTQ/oUDHQEHfdv/A/yV4tnF0jmbBnlNIAz0=; b=gQDRz458HyCLmklY
	8zz5GakMbsReC/vG6lmy/w9Kbe8JUWz/JM5yQkdap8Kx04vyJniE4Af6akdutqWG
	V7mR1QRncdllQMA1cyI6ho6vUX+Ro6EXQ1zHI1wcz7vxDwDSJZN2KKhc5aJyhAbC
	Ll+n0g9CKMr3fnWLCYXboBy9fJeBgS5mlu2rk4TaXZcOIIP4Fpv5F5SqNUMonZRL
	wMwK6jetAG7GlaOLqNmSFek/ZHvw14rVqjGn+BrPX83A2iQ/WgzxOJAkRuGfCo8S
	yH5Vv64AapTV/GDJo2OqHMFxWBHpfHNKqtwSDYVmHUFjKOKNX825Plnh6/aNSfuK
	J/YQGA==
Received: from mail-qt1-f200.google.com (mail-qt1-f200.google.com [209.85.160.200])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4fg2s7w5y7-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <devicetree@vger.kernel.org>; Mon, 20 Jul 2026 08:40:14 +0000 (GMT)
Received: by mail-qt1-f200.google.com with SMTP id d75a77b69052e-51bfd1772d8so16386521cf.1
        for <devicetree@vger.kernel.org>; Mon, 20 Jul 2026 01:40:14 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1784536813; x=1785141613; darn=vger.kernel.org;
        h=content-transfer-encoding:content-type:in-reply-to:from
         :content-language:references:cc:to:subject:user-agent:mime-version
         :date:message-id:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=sEnq2lNuSTQ/oUDHQEHfdv/A/yV4tnF0jmbBnlNIAz0=;
        b=Jvswc36tiDcHM/Pat7ThoqAroUyQ6YOvwACJqSCh4Lps7l5b+nLVfzMpsn5zCLjHJG
         4AQ4mdqqzkpr4+ydJ3Bzs7He2nT+X6LWpEmL++90COCOxSIGYfBT+KwsivV/znzQL9A5
         rb5fLKah7+oB2KrfbZdhc+g1jVohpYMYU8StrEB9yaXKXNilNZLcNMuV09ZRWGjWGjwA
         tOccBumf4/1NciCjbs1FkcXeMInmsF0VGtBkZOW8FNqCsWCOATmkCjvKHlycHfqCzp1R
         FGqnc0QhvB65kE90WoyP6gAT0qgMSv3yUtFWTq6Wou67GOJIJy19kkBVdxMe7O5FKnZx
         4aKA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1784536813; x=1785141613;
        h=content-transfer-encoding:content-type:in-reply-to:from
         :content-language:references:cc:to:subject:user-agent:mime-version
         :date:message-id:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=sEnq2lNuSTQ/oUDHQEHfdv/A/yV4tnF0jmbBnlNIAz0=;
        b=VUXnYlDTb/w/LM0+FvbR72AWRD9YskFMnyqleSFbZ4x6bXiurNnHTfd2XrGO5Uu/ah
         TfOIv8q66nmSn72VLupQ3m0VIPINtj6RBLRrEqyvaRnc05zPwRdwpxUQLwkMX13GEOt3
         QEVH/ETr128kN9mYYHrErw8T4dyaOln8G/ff6wRdK6yMWv3oizY4pZ0G4WnFW5wDbffQ
         DMmusS5oVjB5Rf/TwuNx69McKsDOBkgrPt1hsEuK8D+NOQqi6k/UR5ZndjtHuYCul1dx
         x6rz0626UzSVnriXmG6Kukdxb6Y2eE6pzSMikvROrO+3hDq4PmVZ2Et6CZZkgI4RsTwP
         1J/A==
X-Forwarded-Encrypted: i=1; AHgh+RpZ7NCBdSABz/z2s1abLC8aHhRngLqLMXbbbUp52yUHXIrXV5s1bmFvZsClVxcv3oxg5XPt99MFqdtc@vger.kernel.org
X-Gm-Message-State: AOJu0YwqqccIpijAShuhp6uvDQK3D3NRSp3BjFs7PJfW+28ECmIzSNLe
	71YgeszhJL2fKGS9PLZa4QBnpqCfNCn5F/zygGHPQXRloQw0rfDmbk0EMAeSWkqchAe6Stmq7CC
	MNnrJSohgSHNIHhepiwSgbE8YcsdNMRvby56/rxrN2oqO2hYcNh5ygBX3HenU+UF9
X-Gm-Gg: AfdE7cmaLrSsRJRuk3yLihIQUpxlDphvpJXoy5ub0CwHWNVsPF70UfCHlm5E2jg3Dt8
	ibQmlf7LrRLhhoie923PR7zTkpNc+tV1K1IKD6PhesaIuUCs0THjD+GPk7GOXsfa73pguvYJyQO
	JbHba5ZeHaAKY4Cd0NeSNlrYBHB2P4lCVTNQaax+DHyl4321wiv2V7LpjoHJC75HsQqh2s8P6vc
	beSby5I/vrwJgy7Jq6vavbjpzNmLTZNkrHt0nLprjtqcXTzXj5SoUhJDrpRLJk0qcvlcEye+i3K
	a3NubhC32L3iI6DzS+atBcfFPYtRbUqk/qEIJdyngy4ZviQz6sbcqIdTtSCYgU3LOag9QBl5xcg
	OfS6xA6rjtIXea9E9Cqna4j6K
X-Received: by 2002:a05:620a:a712:b0:92e:6199:9fc7 with SMTP id af79cd13be357-930b418d109mr837803485a.4.1784536813592;
        Mon, 20 Jul 2026 01:40:13 -0700 (PDT)
X-Received: by 2002:a05:620a:a712:b0:92e:6199:9fc7 with SMTP id af79cd13be357-930b418d109mr837801885a.4.1784536813204;
        Mon, 20 Jul 2026 01:40:13 -0700 (PDT)
Received: from [192.168.120.193] ([178.235.128.140])
        by smtp.gmail.com with ESMTPSA id 4fb4d7f45d1cf-69e6fef2640sm4331139a12.8.2026.07.20.01.40.10
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Mon, 20 Jul 2026 01:40:11 -0700 (PDT)
Message-ID: <d5240c7c-6450-489a-97a3-c774deb129b5@oss.qualcomm.com>
Date: Mon, 20 Jul 2026 10:40:09 +0200
Precedence: bulk
X-Mailing-List: devicetree@vger.kernel.org
List-Id: <devicetree.vger.kernel.org>
List-Subscribe: <mailto:devicetree+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:devicetree+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v6 5/6] arm64: dts: qcom: Add device tree for Nord Ride
 board
To: Shawn Guo <shengchao.guo@oss.qualcomm.com>
Cc: Bjorn Andersson <andersson@kernel.org>,
        Konrad Dybcio <konradybcio@kernel.org>, Rob Herring <robh@kernel.org>,
        Krzysztof Kozlowski <krzk+dt@kernel.org>,
        Conor Dooley
 <conor+dt@kernel.org>,
        Bartosz Golaszewski <brgl@kernel.org>,
        Deepti Jaggi <deepti.jaggi@oss.qualcomm.com>,
        devicetree@vger.kernel.org, linux-arm-msm@vger.kernel.org,
        linux-kernel@vger.kernel.org
References: <20260716142605.2398433-1-shengchao.guo@oss.qualcomm.com>
 <20260716142605.2398433-6-shengchao.guo@oss.qualcomm.com>
 <90769e77-c311-4a4f-be37-09065e217f55@oss.qualcomm.com>
 <al2iDH2b_YxdHfLO@QCOM-aGQu4IUr3Y>
Content-Language: en-US
From: Konrad Dybcio <konrad.dybcio@oss.qualcomm.com>
In-Reply-To: <al2iDH2b_YxdHfLO@QCOM-aGQu4IUr3Y>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYwNzIwMDA5NSBTYWx0ZWRfX7rYhxgUXQhfg
 8emXrwaqNMjs/rioFpAVM++zNJsLZCnPZ592gVwRGrfNa60U8bQCRjQ0kggS0xSJ0DsLL2j2bpt
 dSkByhjtOaTUVDFPX0N0kSDRTPJUXj833ql2FO4qr49ymZx4EPl9HWwBGYAf1pd20UzfeXBs0FS
 ZbV1IHwbwlxK6vGMtEZGgUQoNtFix0+TCpAPSFulQIoIdiJj2Zxs1oSvhsNQW+Lb5rf4a9ocg8h
 r4A6ddJUnH4Cuq612g8mHkKGJdMb8rbTFMHN/JkeLvhadsvIBHt8Jnl/kVMGsCk0u/P5ywTyACq
 NtbMvdJe4rM/mcJ6imNml+rkqLbnaSQCUnNWcml5E+Q49RHjatrEfrLqxQEeQq2mlGLvIJVUquQ
 p1JWDBCDWbLfndoDWSeS1YRsg7qwWcGejnMDE7sExvGvMGpkXhIzPbj1p00TR+kmSUSiVR5NpVs
 dKkd0112VwEZ544h6ag==
X-Authority-Analysis: v=2.4 cv=eKsjSnp1 c=1 sm=1 tr=0 ts=6a5ddeee cx=c_pps
 a=JbAStetqSzwMeJznSMzCyw==:117 a=PRfkaYvzSr8QmIIGAkY2Sg==:17
 a=IkcTkHD0fZMA:10 a=RAioF0-LDSMA:10 a=s4-Qcg_JpJYA:10
 a=VkNPw1HP01LnGYTKEx00:22 a=u7WPNUs3qKkmUXheDGA7:22 a=YMgV9FUhrdKAYTUUvYB2:22
 a=EUspDBNiAAAA:8 a=a3beZL-p_o_LvNV4SKUA:9 a=QEXdDO2ut3YA:10
 a=uxP6HrT_eTzRwkO_Te1X:22
X-Proofpoint-ORIG-GUID: ZCVFo-axHLZiKykA9JS38f83mFIauTdY
X-Proofpoint-Spam-Info: AW1haW4tMjYwNzIwMDA5NSBTYWx0ZWRfXwjAEjzst//cg
 MnM1YnyqeXhVN6ZTjVDj95rSiZrgQjipXOd5uEHH0WVAXdRg//wCNroldUPETpMNdHkMLG3t0qd
 uwvjnct/lOhBSm4l/+1ySJScuw+7mGc=
X-Proofpoint-GUID: ZCVFo-axHLZiKykA9JS38f83mFIauTdY
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1143,Hydra:6.1.134,FMLib:17.12.100.49
 definitions=2026-07-20_01,2026-07-17_01,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 priorityscore=1501 suspectscore=0 impostorscore=0 malwarescore=0
 clxscore=1015 phishscore=0 lowpriorityscore=0 bulkscore=0 spamscore=0
 adultscore=0 classifier=typeunknown authscore=0 authtc= authcc=
 route=outbound adjust=0 reason=mlx scancount=1 engine=8.22.0-2606150000
 definitions=main-2607200095

On 7/20/26 6:20 AM, Shawn Guo wrote:
> On Thu, Jul 16, 2026 at 07:14:56PM +0200, Konrad Dybcio wrote:
>> On 7/16/26 4:26 PM, Shawn Guo wrote:
>>> From: Deepti Jaggi <deepti.jaggi@oss.qualcomm.com>
>>>
>>> Add initial device tree for the Qualcomm SA8797P Ride reference board,
>>> which is built on Nord GearVM variant.

[...]

>>> +&scmi15 {
>>> +	status = "okay";
>>> +};
>>> +
>>> +&scmi23 {
>>> +	status = "okay";
>>> +};
>>
>> Why only these ones? Can all of the SCMI servers be enabled?
> 
> These are the ones that have actual/enabled client/consumer devices,
> e.g. scmi3 for ufs, scmi11 for uart, scmi23 for thermal sensors.

We normally refrain from enabling resources in the DT only because the
OS (really just Linux) doesn't have the necessary support to cope with
the ""complete"" system description. In this case, there's a firmware
layer drives everything and handles on/off requests gracefully
(hopefully).

> We can enable all the SCMI servers, but I'm afraid that cause kernel
> to map shared memory and issue SMC calls to discover protocols (like
> power domains, DVFS, resets) that have no consumers, which might waste
> a small amount of memory and boot time.

Please give it a shot and see if there's any immediate
problems.

Big SoC requires big init times. Thankfully it also happens to be
fast so it evens out. Maybe we can look into doing async probe for
the related drivers.

My understanding is that most of these SCMI servers are actually
already bound to managing some hardware (or will be in a fw update),
but not all of them have the drivers to utilize that yet. Is that
the case?

Konrad
