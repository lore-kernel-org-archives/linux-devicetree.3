Received: from mx0b-0031df01.pphosted.com (mx0b-0031df01.pphosted.com [205.220.180.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id D49DB43E48E
	for <devicetree@vger.kernel.org>; Tue, 28 Apr 2026 16:14:15 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.180.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1777392859; cv=none; b=YRgQHEwoQECnUtK4cWue1cXEyXniTSs9a524b5gyRHGgLZcPQvkyGlaPa2phm/owfACYRegN3f6cpCdRsDU5U6MRvvIcRrm1zwJXxUfRboqWI7BL8RrpF/xLu+/8qYabxLkJOk942qXVLGQmEB6CyA45zZD650Veiml+TcnCYNs=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1777392859; c=relaxed/simple;
	bh=OGGx6Juc3+wfrS3W7vKIGdl7XlXSnp2EAZG1ceHvcEk=;
	h=Message-ID:Date:MIME-Version:Subject:To:Cc:References:From:
	 In-Reply-To:Content-Type; b=Fd/Rsy15xAENGL3DUsXnbGtV9SesV+H4vUsCsdCL9l7c180ktR3uABNtR0YrXP8aJ6vdFiisfNtnasE+VF2x/Jxba0+nndIa0X9IaUpoQncjg9SdUOz4ZLuNlE2DMP9e7pVqOEUax6vAGRFaalixSQs/drDRLZWoML5f4u5NKJY=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=nTc8psaP; dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b=F0Y+5eRb; arc=none smtp.client-ip=205.220.180.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b="nTc8psaP";
	dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b="F0Y+5eRb"
Received: from pps.filterd (m0279871.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 63SFsRnv3705163
	for <devicetree@vger.kernel.org>; Tue, 28 Apr 2026 16:14:13 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	T6oBcVBcyteYW09E2HTiBvm+oEW8wd4V4D6A2fwJL7g=; b=nTc8psaP9spOnEss
	BctGpWDa4uTwTFgwV8U9Ue07Evsqz3mnp0VWoyj7GO+XljHrfVTFmQSfpEuyW7A4
	FCGerCp+k8eboHHdPbxDTFwHxPEHBHhaC2xwZKR9rRoPrTlWaaNJU3PXLBFLxaan
	lptvdek22/FiC9Fp0X5rQ6xqsgMcxqOEvtfbD3is+mCuBTQBhDDiVp4QhODZ+60t
	CfDvAD9CllFbXszsTufAR060TKWVVSXM3DurLdW1zE88X1hzG+OfhKt/Dg0ZSq/Q
	v8165B/sEjszvuQxvZoZMyxc9HMMZV9NdkJrur05PIeuhRJgXuUnOA00t8ParNDK
	Cwu2HQ==
Received: from mail-pj1-f70.google.com (mail-pj1-f70.google.com [209.85.216.70])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4dttxh9d95-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <devicetree@vger.kernel.org>; Tue, 28 Apr 2026 16:14:13 +0000 (GMT)
Received: by mail-pj1-f70.google.com with SMTP id 98e67ed59e1d1-35fbb5779e8so12286894a91.3
        for <devicetree@vger.kernel.org>; Tue, 28 Apr 2026 09:14:13 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1777392852; x=1777997652; darn=vger.kernel.org;
        h=content-transfer-encoding:in-reply-to:from:content-language
         :references:cc:to:subject:user-agent:mime-version:date:message-id
         :from:to:cc:subject:date:message-id:reply-to;
        bh=T6oBcVBcyteYW09E2HTiBvm+oEW8wd4V4D6A2fwJL7g=;
        b=F0Y+5eRbvZbHDAWykbZOEVgYqr1qlZLF9ICiwpqdJ6ND8VpAONIh/05IZb+JmvOQP7
         2u7drFeAWH2p8ccbkY4CJCxdYDoh+ma5DDgW++/gsRiz899C0zuTac5r7FoOkUFgrrYg
         K1sRtW79uMhgzgq9bm0GUTywucn5ibPsG2bEd54FjI7LIQNrzQ1y5OzShMEBewgBc/Tf
         M0E80Dp+XtUYVlxUoQ9xrORws6gpvjS/MQUCQIQab8MFnAEb4iv+IxdILWHLNGW1/iiM
         N002hiNU9uF27HaYaSevPeW3rqZCvVH/+Jh7FwPFPlOJCt16oe3lxVbNId7Np/jMbvag
         c0Ww==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1777392852; x=1777997652;
        h=content-transfer-encoding:in-reply-to:from:content-language
         :references:cc:to:subject:user-agent:mime-version:date:message-id
         :x-gm-gg:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=T6oBcVBcyteYW09E2HTiBvm+oEW8wd4V4D6A2fwJL7g=;
        b=sGFC5JlkPnWM19xPsoM4ZHRaCwN2hgRKxOpYFABYm+CG3+Gyl37eSe/CPrYfT8IgVy
         cusdrsFWBuDUg3lt8IkORuisYrGwJR4C36s4pj2PujUyfKn8B5jZlDq0TrGyhou1Exqy
         p1oJO8mDW0f/6sJwriUH3ZZKJ48bvoZEtK6BhNFwGWXYUdQv63cmg7HBGCchNHE+oibz
         mPtZ7Ujn4Jo+rXfDK18IUUz7IPQRwWft9f0whQJUzEaki1lgJLqJo3CK3QNWd7cNQgWR
         nu3uw2dnRKBHtav5ZKNI9+XHwrj3/JXtOkXt6JN/wBgNBM+PUnZs7hGJhnKuqDDZhyeJ
         Hoow==
X-Forwarded-Encrypted: i=1; AFNElJ/U6GPNQJU5Oy8trsYbTlN8D6KMjUlf0gHzIkaScc6ApmldEaelY78556V9M4RC3Qjaw8vY3R1eik8x@vger.kernel.org
X-Gm-Message-State: AOJu0YzkhgnGP2yGTtIF26zcU1MO2kKmFLj5ekTdVJBGAgjks+MqM6Oc
	tlgtVPyJDyhnOytQxqAtE0nr2xkYSLqQbgQlItlp2GiYoQoMUT/iSvUCoogXeWop2kxWDPLsa/T
	ToPGqv1Ib/uRXfgjTgjX+vRoW/LhxEgkjGzZmrk+ualDIMQzbubXr3U2kUAxfE2Ij
X-Gm-Gg: AeBDiev1FQfCK32EKY8OfGNuynunBo0guq44yq1OJuobIYFjjhOCtFzGsKGaSTayod3
	+z1xSUUi8bVNTSJgclAQsk8NuYwA2Q5zdCfTz7LkkmJdSzYNtbYOwO4gBIsaGiOOwj3OFwLjSgq
	hTIiUE2riEeRabwWRvqLyOv7s1dMJTp9/hEUmRvCWet8HYbeVjZV2ybhuNy9FLOHBJN6WIN7eD3
	GgjIzE2axRLhR14nltqPtipNT8C2VWxWZER/upUNxK1BFVjTdnqgsWEmrgYoRDtnaaHilDVKOcz
	URhqobMv+Voop4NvXkpyB1z2ScI8bbniv+RfaKkJfWT7NfWxOqpEgnsQJ0FlxkUo60qtNs82nnD
	EedZJl5nfjm1r+kdBzJkWwFylsyuD2pKON5uK4uIvz3BQWjlS9VLd9tPpzOSUJGE8rIXT/unXsv
	cL
X-Received: by 2002:a17:90b:3504:b0:35d:a3b4:2ef6 with SMTP id 98e67ed59e1d1-364a0f23de5mr8504a91.21.1777392852115;
        Tue, 28 Apr 2026 09:14:12 -0700 (PDT)
X-Received: by 2002:a17:90b:3504:b0:35d:a3b4:2ef6 with SMTP id 98e67ed59e1d1-364a0f23de5mr8470a91.21.1777392851489;
        Tue, 28 Apr 2026 09:14:11 -0700 (PDT)
Received: from [10.48.22.70] ([110.224.93.172])
        by smtp.gmail.com with ESMTPSA id 98e67ed59e1d1-364a0213862sm90551a91.15.2026.04.28.09.14.07
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Tue, 28 Apr 2026 09:14:11 -0700 (PDT)
Message-ID: <3f5103b8-ebc5-4855-b032-f20f93c89dc8@oss.qualcomm.com>
Date: Tue, 28 Apr 2026 21:44:06 +0530
Precedence: bulk
X-Mailing-List: devicetree@vger.kernel.org
List-Id: <devicetree.vger.kernel.org>
List-Subscribe: <mailto:devicetree+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:devicetree+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH 0/2] Introduce TLMM driver for Qualcomm IPQ9650 SoC
To: Linus Walleij <linusw@kernel.org>
Cc: Bjorn Andersson <andersson@kernel.org>, Rob Herring <robh@kernel.org>,
        Krzysztof Kozlowski <krzk+dt@kernel.org>,
        Conor Dooley
 <conor+dt@kernel.org>, linux-arm-msm@vger.kernel.org,
        linux-gpio@vger.kernel.org, devicetree@vger.kernel.org,
        linux-kernel@vger.kernel.org
References: <20260415-ipq9650_tlmm-v1-0-bd16ccb06332@oss.qualcomm.com>
 <CAD++jLmxJUPNjXkFi490GSPwB-bHs4tdJmMFwxyCX07N=kxGHA@mail.gmail.com>
Content-Language: en-US
From: Kathiravan Thirumoorthy <kathiravan.thirumoorthy@oss.qualcomm.com>
In-Reply-To: <CAD++jLmxJUPNjXkFi490GSPwB-bHs4tdJmMFwxyCX07N=kxGHA@mail.gmail.com>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 8bit
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYwNDI4MDE1NSBTYWx0ZWRfX7j6FHhXBejYL
 M8iNGNAimkzkq2eE1usoHvTZPnCosgW0Dw/oOEm3sPQRKrIC8m7t4Opz0lE3OSMaRoktreNkJ/R
 nGhATDxczeDRpklkHOhUDBacpFyVL0+/PTEIsoA4sn6sFcp1xdF9wjDXu6ALKFkJKRi+uHMX4s/
 m/AN+gApKeJixwb93CpkGxa3BjD57ZMJI02JelByUkgPwsM9iezEt6d2tPRKuxHysAQWH1X43dB
 S8Xl2BoTkTUy1+jgNOAVpNW3p65Mk+YRUOzBBbfBus75SHXsVUqmVRtI3uLwnxsUEa5kROsyVQs
 dvaXN6d3X3LRg8d7UtKpNtihqyeggyTnyqSAMy7Drn8Uyq84Zgn5iHY6GvaLL+T/g8B2YrtCK26
 J49FUOiGz5X9TkOxIKdppp+na/jro9bBfWTW9xbiY0KeG4q1Ca+luX9IljYdYnMhq+8VA/nBQC1
 6+KGgDy0S8TPgTWxpSg==
X-Authority-Analysis: v=2.4 cv=Uu5T8ewB c=1 sm=1 tr=0 ts=69f0dcd5 cx=c_pps
 a=0uOsjrqzRL749jD1oC5vDA==:117 a=m8rBHnErhwdSF42aeuMaWQ==:17
 a=IkcTkHD0fZMA:10 a=A5OVakUREuEA:10 a=s4-Qcg_JpJYA:10
 a=VkNPw1HP01LnGYTKEx00:22 a=u7WPNUs3qKkmUXheDGA7:22 a=3WHJM1ZQz_JShphwDgj5:22
 a=VwQbUJbxAAAA:8 a=EUspDBNiAAAA:8 a=rkh08bgVQrwZcmFFEZkA:9 a=3ZKOabzyN94A:10
 a=QEXdDO2ut3YA:10 a=zZCYzV9kfG8A:10 a=mQ_c8vxmzFEMiUWkPHU9:22
X-Proofpoint-ORIG-GUID: QjREGCpfZso0HJS0QYW1q9KICi8S5B59
X-Proofpoint-GUID: QjREGCpfZso0HJS0QYW1q9KICi8S5B59
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1143,Hydra:6.1.51,FMLib:17.12.100.49
 definitions=2026-04-28_05,2026-04-28_01,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 malwarescore=0 spamscore=0 phishscore=0 adultscore=0 clxscore=1015
 suspectscore=0 impostorscore=0 bulkscore=0 priorityscore=1501
 lowpriorityscore=0 classifier=typeunknown authscore=0 authtc= authcc=
 route=outbound adjust=0 reason=mlx scancount=1 engine=8.22.0-2604200000
 definitions=main-2604280155


On 4/28/2026 2:57 PM, Linus Walleij wrote:
> On Wed, Apr 15, 2026 at 1:29 PM Kathiravan Thirumoorthy
> <kathiravan.thirumoorthy@oss.qualcomm.com> wrote:
>
>> The IPQ9650 is Qualcomm's SoC for Routers, Gateways and Access Points.
>> Add the pinctrl support for the same.
>>
>> Signed-off-by: Kathiravan Thirumoorthy <kathiravan.thirumoorthy@oss.qualcomm.com>
> Patches applied for v7.2!

Thanks Linus.

To align with Krzysztof's change[1], do you prefer me to send the patch 
for IPQ9650 on top of his change or do you plan to take care of it when 
apply his change? Kindly do let me know.

[1] 
https://lore.kernel.org/linux-arm-msm/3e7b941c-b297-48ea-89b7-e21a51f56acf@oss.qualcomm.com/T/#mb046f22f0c90ed7073e17073dc04daa931e40ee4

>
> Yours,
> Linus Walleij
