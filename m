Received: from mx0a-0031df01.pphosted.com (mx0a-0031df01.pphosted.com [205.220.168.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 84B6A4E535A
	for <devicetree@vger.kernel.org>; Mon, 19 Oct 2026 11:24:27 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.168.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1792409070; cv=none; b=rpmKVNc2k6YeFxOYlGwT5V53bQ4u9QZ2GoXg64VUCVruV8bZ3XmdGJqjL3tFYJ1ffVbYtgfufOxs1iXnmUPvaEcXue9ain28yoUiAxsz5RRDA6d43sdJp65XR/y/KwEQuUsvFM4reQwghKeKg63lBWsiX8kEHfIddIsWpDjbgS0=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1792409070; c=relaxed/simple;
	bh=HN1npB6aajDJhKOJqSMG/Xm0XC7KMW/sEoIQg0DS0wE=;
	h=Message-ID:Date:MIME-Version:Subject:To:Cc:References:From:
	 In-Reply-To:Content-Type; b=spbdrsJZr0762BKqdCzxpcSsbjKmkDI3o6lnw8Zvihsa94mwDh8WFrEO4brRCTTpkYLNoNhuKR7kP2BjUUerbVblTJYaunVdTsdlBfr9Mv1Pew5o2/e4TSkZ4MFoI7vknmQ+ERkumMvczFs2H08RaAeiQFDm9TgAq3Gc3iXX7rM=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=ARLEYZjT; dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b=kPVOOPpk; arc=none smtp.client-ip=205.220.168.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b="ARLEYZjT";
	dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b="kPVOOPpk"
Received: from pps.filterd (m0279866.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 69J8OkDA1348030
	for <devicetree@vger.kernel.org>; Mon, 19 Oct 2026 11:24:26 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	cPbYmOFTxQ3oigY+n6Y8ylBgN3Z5CJMDE67sAzsv19g=; b=ARLEYZjT8erF5qXs
	saU47ZpIVBTPaXlIliggk5y6VKbsiP3CRIKRK6OcBcmpF4Xo/4xEvJmBgp62Sa2j
	JnxqcsQt6I+kg5DhY2Cg3ztSSq68P2bBd//7ladzsxtmnZ8b//woAzdvqCLcu8ep
	c+2kJk1/P0LZl2lPv+cgGsJ2OD9YjfeTvrUU3yvfKMzb0sVysT+fYHkB7VuBEgGk
	IZwt/mNz75T8IJuSHdiu3etBQlRHXEMvBZrvToXcTS57Bj51G83nT1C00YRe5wUJ
	xYoeh8VftuyVGp1Yz3wOWRPvY9reLHQFsTqv48jmcHbz4jghOPEQd9fXgD81gjF5
	A595Og==
Received: from mail-qt1-f197.google.com (mail-qt1-f197.google.com [209.85.160.197])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4hdf4rgt71-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <devicetree@vger.kernel.org>; Mon, 19 Oct 2026 11:24:26 +0000 (GMT)
Received: by mail-qt1-f197.google.com with SMTP id d75a77b69052e-5356c6d98cbso7669271cf.0
        for <devicetree@vger.kernel.org>; Mon, 19 Oct 2026 04:24:26 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1792409065; x=1793013865; darn=vger.kernel.org;
        h=content-transfer-encoding:content-type:in-reply-to:from
         :content-language:references:cc:to:subject:user-agent:mime-version
         :date:message-id:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=cPbYmOFTxQ3oigY+n6Y8ylBgN3Z5CJMDE67sAzsv19g=;
        b=kPVOOPpkOZktyl0VBfLq3VqlXIPieiR0aAAqI/8cWj8BRbu9lp9DRsQJ5kchA2Bj05
         rIDHSQKYBiSA2qjXhXoYDIP8k0S4UdiEcVdbbKt+ehNQ0zsKBcb9X0hdGHJscmoUGUWt
         AdZovulINSfg+tBgJlHeAswDqgQuE2ha8iNtowisqcsTMDeqSIp+4AfwXUcNnETjdf/X
         CFbKhPEciALvZnx65JWx7P80p164v78Xql66WffmQhEwFbPRBsQqKgWwh8MlkXnids5y
         Hr5SVkN67bJSWLXC3F7K359bd5DJDmnp9vxgCBSAJTYpAGOcxFoetYMHcxtUQMH0DWYo
         Vr6Q==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1792409065; x=1793013865;
        h=content-transfer-encoding:content-type:in-reply-to:from
         :content-language:references:cc:to:subject:user-agent:mime-version
         :date:message-id:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=cPbYmOFTxQ3oigY+n6Y8ylBgN3Z5CJMDE67sAzsv19g=;
        b=rCMr3piKP7jZFkPtu4OBikv7jZ+oN6YrPtktmqqu6X4Eg9nddrYrVS7hXKhYpm6fVf
         g9ExX8Zk4ywIb/xfI17DClbBixjhXJy+uR55GHpeGJmvxT4gwMrw1ZlUjLxIP7z6aDTQ
         qOj424OBxGCuRKuZmKR06NlYS1XDMmiMjpjcOhHhWeOeaVSNkYgc31Dq7S4IoGWnT/cj
         IK7g+eBvw00oZSYEeO7tDFPShGVZ3oAYZaZDrG5t5u6/cVJmcv6CMBBQieffLDKBPTNy
         r0NLPn1tzMxdG+fHidH+gA5QyUccpFppFuYpcNTKKZBCaAXePbLv7snQB5egDkxMgDeW
         uHKA==
X-Forwarded-Encrypted: i=1; AKwUvByLhkHe7Koj5AWRYGoefJs2LE+8R25R5RdPttzF55mwpgqqjTe1kQSSnFNiqEksY1BG5w7CRIVDJiev@vger.kernel.org
X-Gm-Message-State: AFq9FYIxwesWTJf9vVfrI2Gda6Iv2Gkf+HQ7UJ7xPzDvz5OiOP5ZBO2a
	Y227JDOQG5HJSKYv28VTeOLt4pvGX1pEhXxjnhFQcMjkCoTOov8T2BVN/GrQcafQ83AdqJFhjaM
	2JrcPk/0X5IWCtcAgF5Em139mxsi9Pvkvv12fVbN3EZolrA3HrMLk6y8tD+5xHUy7
X-Gm-Gg: AYBFou04HYufcj/qkgEQfkgJalCuXuqWJvQgGtjNbXdNiXehkuAqfy223IzEoEalbsF
	FQEB1oxIcBgYZ/VOs1ygq+VQRTnJ05DnTgRa2LWVXM2R+Ha46+KFcNQusUCJfFzZ2pSuB4On4Ov
	SaDw3cGNNt4R6XFQZxAoU+lcVWcys6YzT5huSo4by8fQlt0nnhU3j3gxTBgT/f9K5/yBgYl6tTj
	KtTJqxQXsMVZo4q3FqJxHR2SkBa6kBc5qYPP0Odl8BtS3ZMVtHvl/LLUhOBPCuPFX2mhprCOY1N
	JtcNCUb8G2JT/dyKR3B0f14rX9C0p2C5r1WG9IbPiO9PyvxPCygZGfe+GqTvShgYNEQ7LZ09yJ7
	zdiHzxzWWkaGGU2QnRyteOw==
X-Received: by 2002:ac8:5701:0:b0:535:fd16:4393 with SMTP id d75a77b69052e-536461cc281mr129062831cf.5.1792409065436;
        Mon, 19 Oct 2026 04:24:25 -0700 (PDT)
X-Received: by 2002:ac8:5701:0:b0:535:fd16:4393 with SMTP id d75a77b69052e-536461cc281mr129062381cf.5.1792409065011;
        Mon, 19 Oct 2026 04:24:25 -0700 (PDT)
Received: from [192.168.226.26] ([178.235.128.140])
        by smtp.gmail.com with ESMTPSA id a640c23a62f3a-c4090dcf100sm338414066b.15.2026.10.19.04.24.21
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Mon, 19 Oct 2026 04:24:24 -0700 (PDT)
Message-ID: <c75046e2-5d33-41c1-b032-3c16e630030d@oss.qualcomm.com>
Date: Mon, 19 Oct 2026 13:24:20 +0200
Precedence: bulk
X-Mailing-List: devicetree@vger.kernel.org
List-Id: <devicetree.vger.kernel.org>
List-Subscribe: <mailto:devicetree+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:devicetree+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v2 2/9] irqchip: irq-qcom-mpm: Register MPM with cpu_pm
 for RPM notification
To: Sneh Mankad <sneh.mankad@oss.qualcomm.com>,
        Bjorn Andersson <andersson@kernel.org>,
        Konrad Dybcio <konradybcio@kernel.org>, Rob Herring <robh@kernel.org>,
        Krzysztof Kozlowski <krzk+dt@kernel.org>,
        Conor Dooley
 <conor+dt@kernel.org>, Thomas Gleixner <tglx@kernel.org>,
        Shawn Guo <shawn.guo@linaro.org>, Marc Zyngier <maz@kernel.org>,
        Catalin Marinas <catalin.marinas@arm.com>,
        Will Deacon <will@kernel.org>,
        Anna-Maria Behnsen <anna-maria@linutronix.de>,
        Frederic Weisbecker <frederic@kernel.org>
Cc: linux-arm-msm@vger.kernel.org, devicetree@vger.kernel.org,
        linux-kernel@vger.kernel.org, linux-arm-kernel@lists.infradead.org
References: <20261015-b4-shikra_lpm_addition-v2-0-ac7f1a0d5638@oss.qualcomm.com>
 <20261015-b4-shikra_lpm_addition-v2-2-ac7f1a0d5638@oss.qualcomm.com>
Content-Language: en-US
From: Konrad Dybcio <konrad.dybcio@oss.qualcomm.com>
In-Reply-To: <20261015-b4-shikra_lpm_addition-v2-2-ac7f1a0d5638@oss.qualcomm.com>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit
X-Proofpoint-ORIG-GUID: nBPqghRrgJSC6CLcEzgBfzyVhTTqDCiA
X-Proofpoint-GUID: nBPqghRrgJSC6CLcEzgBfzyVhTTqDCiA
X-Authority-Analysis: v=2.4 cv=H7NOUOYi c=1 sm=1 tr=0 ts=6ad5fdea cx=c_pps
 a=EVbN6Ke/fEF3bsl7X48z0g==:117 a=PRfkaYvzSr8QmIIGAkY2Sg==:17
 a=IkcTkHD0fZMA:10 a=660iZSQnnn4A:10 a=s4-Qcg_JpJYA:10
 a=VkNPw1HP01LnGYTKEx00:22 a=u7WPNUs3qKkmUXheDGA7:22 a=YMgV9FUhrdKAYTUUvYB2:22
 a=OE6UjuR3gYnAVEq_z8YA:9 a=QEXdDO2ut3YA:10 a=a_PwQJl-kcHnX1M80qC6:22
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYxMDE5MDA0NSBTYWx0ZWRfX/W+QSjnTPK99
 fERSE3z1kl0SQzV+pXTpbmNdX1tUDOEgHLJK/kX6N+vJUPLx11BY/nbZ1JUrqRiV26US4t/FC3e
 rSPTlh2GhBXqJJFRX0pVWFJo6Lr2uPwDv3UdrM6ZF3+o3TEbTUSPrv9AOP/GeIsd7W1wC1VJYM/
 E8qSnxXz0OyGb3kLydGPksvEMslZDgw8YKftdJlWaY+Hag1Ln0Tj7VvZcCl8sL/MlpZT38nASbq
 9HC71WiP+g44/iAno+7n0pfx+zXRpJ9mX0fC/UsJCAHo4ylPKnEZNZxLjYtbfMOmzLVLF/gJBZN
 guYKc5XJKRDDfZeP4q9onfzH96tvTRd2mqG+j1OVGV458Up8z90FezOQlgHWXse7Yu4FCwIm+iO
 b+HaC6OnaPYi/LOUGID8sEYBq2wEJ6Y/FYO0FslR8qy2tlVHOpoR0XZZv7xp9gd8sijb3t/iXWi
 QfE1g5yryqQc1eLFoCg==
X-Proofpoint-Spam-Info: AW1haW4tMjYxMDE5MDA0NSBTYWx0ZWRfX+tQJzxTYVllK
 jY5G00lzTfuKZBrpAaAG1SmkHfu+fa0bji0lM6BZJs1nhrPWfSN7c73iE/rPmGot9XRL+qt9fZK
 HNUL+/ZHq1sl4c8in+OnOVPxHCyuG80=
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1176,Hydra:6.1.134,FMLib:17.12.100.49
 definitions=2026-10-19_03,2026-10-14_01,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 phishscore=0 lowpriorityscore=0 priorityscore=1501 impostorscore=0
 suspectscore=0 spamscore=0 bulkscore=0 adultscore=0 malwarescore=0
 clxscore=1015 classifier=typeunknown authscore=0 authtc= authcc=
 route=outbound adjust=0 reason=mlx scancount=1 engine=8.22.0-2610080000
 definitions=main-2610190045

On 10/15/26 11:55 AM, Sneh Mankad wrote:
> MPM irqchip needs to notify RPM (Resource Power Manager) processor to read
> the latest wake up capable interrupts when the CPU cluster is entering the
> deepest idle state. This is done by sending IPC interrupt to RPM and is
> implemented as .power_off() callback by registering MPM as parent power
> domain to CPU cluster.
> 
> Such implementation earlier introduced a hard probe dependency between MPM
> irqchip and CPU cluster power domains. That is MPM irqchip needs to finish
> probe before PSCI power domains are probed.
> 
> The above problem has since been resolved after bd7f488a8e5d ("cpuidle:
> psci: Fix support for probe deferral by dropping the faux device") / [1].
> However, it makes sense to remodel the RPM notification in MPM irqchip due
> to general consistency.
> 
> MPM is not really a power domain provider, all it needs is a notification
> when CPU cluster is going to power collapse to carry out the RPM
> notification. We can register for CPU_PM notifications for that purpose.
> This way we can avoid such unrelated dependencies.
> 
> We cannot register MPM under CPU cluster power domain and rely on
> GENPD notifications here, since that way cluster low power modes will be
> blocked whenever some consumer of MPM, and in turn MPM itself, are
> runtime active. This will add another unnecessary dependency for CPU
> cluster low power modes.
> 
> For now as first step, register with cpu_pm as a fallback to manage RPM
> notification. Trigger the RPM notification when the last CPU in CPU cluster
> goes to power collapse.

IIUC since we no longer need a dt-bindings addition, after this series
lands, we'll be able to strip out the powerdomain provider path, right?

Konrad
