Received: from mx0b-0031df01.pphosted.com (mx0b-0031df01.pphosted.com [205.220.180.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 3B879472060
	for <devicetree@vger.kernel.org>; Mon, 28 Sep 2026 10:15:15 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.180.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1790590516; cv=none; b=O5weDuepDP3BY8rNJs7OMDVeanzjdIXt8buNDEuxqe6wpr0EvFPGQ3Z0HuH+sFHiJg3zHMoR5iCe2q31kOqwFan8ry2vlCquBF8Upsnu02GOVwejKK4rptUUTc1p5OopQ/D5MuBQKxmNld+2XGkahMEwLzBj2bMugnpa//s8/eE=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1790590516; c=relaxed/simple;
	bh=P8rn0BUhNfKwZqKmW4/hpAJE5w9zl18XHq4N7okoxWs=;
	h=Message-ID:Date:MIME-Version:Subject:To:Cc:References:From:
	 In-Reply-To:Content-Type; b=foKZW8e2lK791FffZB2Cn5DifLBkNsF/AN4oPCSglkLa6ScMX59IKE7CvMD0OPPt3guxX22Z+UkU6qz995iGjazay30wytmd7VNAHbttBaz+7/GV8gaXUoKS0bHNQIP3+op3wgPw/PGkdS4ZjkAwpg0yLwdmoIlVPX7QHC1rIXc=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=DtcqSAYO; dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b=cbeFlQ3v; arc=none smtp.client-ip=205.220.180.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b="DtcqSAYO";
	dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b="cbeFlQ3v"
Received: from pps.filterd (m0279869.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 68S9M6CH1445750
	for <devicetree@vger.kernel.org>; Mon, 28 Sep 2026 10:15:14 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	K5uy429fJlY5ihYQtjqpiBMkvSzL/TMOUrN8aeSIFD4=; b=DtcqSAYO3CP5a7mW
	JkoGNLw4PhuNZizdfqMqC1gqecFuy/bc5A6HYPeXPEbf4N46AW+g3iK0Zhl3rOix
	FdhfzM+79iRDQBGRdk9vWxhzyU8mjsjAKy29ccudYSi280bZY33Ap646Fm+DgIB9
	90mVL6PMDR+5uaxg75+LF0aSh4VRxK0uu0vbcrUOg402mkZAKW5m/WTKLLEFIiSa
	12DEGjoQ/BS3YrELoJ+qQpNrxQC4OWFH5WULDeyhXvwD++x1AB4FqOK1nGmkIQBX
	RDrIV2iKEgck7ePCoG7Qq/eOHCJIEPktURkdqFKKcZ1Bpt0QtGjkrk36HEnxZG+d
	CUEpIg==
Received: from mail-qk1-f199.google.com (mail-qk1-f199.google.com [209.85.222.199])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4gynfkr79e-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <devicetree@vger.kernel.org>; Mon, 28 Sep 2026 10:15:14 +0000 (GMT)
Received: by mail-qk1-f199.google.com with SMTP id af79cd13be357-93c63d960aeso257468085a.1
        for <devicetree@vger.kernel.org>; Mon, 28 Sep 2026 03:15:14 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1790590513; x=1791195313; darn=vger.kernel.org;
        h=content-transfer-encoding:content-type:in-reply-to:content-language
         :from:references:cc:to:subject:user-agent:mime-version:date
         :message-id:from:to:cc:subject:date:message-id:reply-to:content-type;
        bh=K5uy429fJlY5ihYQtjqpiBMkvSzL/TMOUrN8aeSIFD4=;
        b=cbeFlQ3vKD+ytFCHmX6K9vXp36JopLHcZ94NOdKu0lcrE3Ndi2wt+yBNU+gXflFE74
         PtO+vrfOTLzDEoNe9y4NJnEhWaHcazjXkPsaLmK9zvSaUIAYWsMFrhZw3lZWf+Qth0Kt
         TzOEVPlz7sDCc+Pl1l43s9Xt7e4ZL1JfqzMW20ODicVaF8ZuDaB+dGlVoYwY6y38oh1o
         mospiLKjaywFLUZFQz9I9w6GcV32f03swgHz0dMzUFLfj/EvSHMAhXzTAOYR++9BDyZr
         q3q51RKUSI5h/g9xqOWaUoRc3Y3GQJBw2YacOJKt1BRFEAeFblbJUyokp+5UgQor2N1d
         gNew==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1790590513; x=1791195313;
        h=content-transfer-encoding:content-type:in-reply-to:content-language
         :from:references:cc:to:subject:user-agent:mime-version:date
         :message-id:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=K5uy429fJlY5ihYQtjqpiBMkvSzL/TMOUrN8aeSIFD4=;
        b=yQtwwt2ha0cCseclY3W/Sb6VkS+AQus+d1nspJmu9tWQKRe67UJwst7T/UuHBa87+E
         sXXTUVsuSqW0UZsZ2BCRq/hnXHbdaN+CpI8dVocVk1N6ZD+v21+QCjTnTdvH7deqZ9Wc
         mP3QUeUtcGSGxqFobG3gGVV1RrhfDZCNZG+HHr4T6HAg30d+SqCRAhgKP49X4t0HxZ4y
         9Ys9/AM9SHAcbYMqV1pCFGjMulSCsSL0rZkxkTkMAAJegiZIQJyS36IlMaMwMX+ZzHtB
         vBe4pd+Cy/V5a7MR+u+UfACoDJU3JuZSNa16ecG4/29LV99gfF5W2CQYcB9BEKHzx9uF
         YLxA==
X-Forwarded-Encrypted: i=1; AKwUvBy5pamPRo1l3Z+eOQhx3u0fu5eUslRUm6adVdye5yhlktnrGhjUEOJp7KehCZvrxSeNjxD52WdNhFWn@vger.kernel.org
X-Gm-Message-State: AFuF++mExO6Mdxe7gXsVjZRAD7vCMrbpoD6QaLQ1/BVLMCBS9S6UGFGt
	JCqizLRfuxzdCPgITg+9tNV7enOp70ITSgpXh7gRbAECm5MSPqN5fUyiFjr6vHINzYZZyBSb5Ct
	Rsw1SgeT9xE7P5Z07MhXYFmCwN7dF7PVKap9hWoJWKAbp8bAAIUpmR6fySsI5nbsW
X-Gm-Gg: AYBFou1BzICubU1FciHBQB3927w7fjzAgz1XOrQ7xZeKS4kZ2LefaFF8gsctuO4S2b2
	1CGoSunK5Z/s+l9GULRU7Gilo2QS4ELRvkFTmNw4NauiAdkPgi/nujN59EBbGeWGBsafPAAK6M/
	Y4cle+ZcIQD2Ovxo37IrG/BmDJcyAoVGAa/OGVzT3jvyWkItWP7Fvqz2xsaLxUQGuFPiBZ7GVQM
	oBaMn4sq+XcN9kEmVDzNWjyMu0OWaQddsdnFVl3IVmQtrj0tPgJlvt0oq8gk1Zg2E9Gta3cIHnZ
	apMiI3sRoJYajkJXFe4TxSTLgeZr0sqE9Ihsa0kS+86R9PxxuWIk7uVqBmb7TUqsSKj42XxCOcU
	YfSUOO21mc+3xdnUKiYK7c2rok30i
X-Received: by 2002:a05:620a:1b99:b0:93a:3d71:c9ec with SMTP id af79cd13be357-93c43b7ee3dmr1871857085a.7.1790590513390;
        Mon, 28 Sep 2026 03:15:13 -0700 (PDT)
X-Received: by 2002:a05:620a:1b99:b0:93a:3d71:c9ec with SMTP id af79cd13be357-93c43b7ee3dmr1871851485a.7.1790590512882;
        Mon, 28 Sep 2026 03:15:12 -0700 (PDT)
Received: from [192.168.1.110] ([178.197.219.214])
        by smtp.gmail.com with ESMTPSA id ffacd0b85a97d-4887a349731sm26840951f8f.12.2026.09.28.03.15.05
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Mon, 28 Sep 2026 03:15:07 -0700 (PDT)
Message-ID: <872fdd1b-8dc0-4227-a162-a8c281e3e774@oss.qualcomm.com>
Date: Mon, 28 Sep 2026 12:15:03 +0200
Precedence: bulk
X-Mailing-List: devicetree@vger.kernel.org
List-Id: <devicetree.vger.kernel.org>
List-Subscribe: <mailto:devicetree+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:devicetree+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v2] dt-bindings: spmi: glymur-spmi-pmic-arb: Add
 compatible for Qualcomm Maili SoC
To: "Aiqun(Maria) Yu" <aiqun.yu@oss.qualcomm.com>,
        Jingyi Wang <jingyi.wang@oss.qualcomm.com>,
        Fenglin Wu <fenglin.wu@oss.qualcomm.com>,
        linux-arm-msm@vger.kernel.org, Stephen Boyd <sboyd@kernel.org>,
        Rob Herring <robh@kernel.org>,
        Krzysztof Kozlowski <krzk+dt@kernel.org>,
        Conor Dooley <conor+dt@kernel.org>
Cc: David Collins <david.collins@oss.qualcomm.com>,
        Subbaraman Narayanamurthy <subbaraman.narayanamurthy@oss.qualcomm.com>,
        Kamal Wadhwa <kamal.wadhwa@oss.qualcomm.com>, kernel@oss.qualcomm.com,
        linux-kernel@vger.kernel.org, devicetree@vger.kernel.org,
        Yijie Yang <yijie.yang@oss.qualcomm.com>
References: <20260831-maili-spmi-binding-v2-1-37a25ef3921c@oss.qualcomm.com>
 <31a59040-bb20-4cb9-9dad-a62b90a16c6f@oss.qualcomm.com>
 <27997939-f39a-43aa-a287-44c9f70b8a51@oss.qualcomm.com>
 <28e20553-8c1b-4b2f-9839-1fbae1fda59e@oss.qualcomm.com>
From: Krzysztof Kozlowski <krzysztof.kozlowski@oss.qualcomm.com>
Content-Language: en-US
In-Reply-To: <28e20553-8c1b-4b2f-9839-1fbae1fda59e@oss.qualcomm.com>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYwOTI4MDA0MCBTYWx0ZWRfX5I4RWu5qoQ9t
 YFn2qFQsuCPD725RYx9w721+VvFZyGfS1wEApcsHj3sNA09CEl6LINpuum0XnNwy42VitQb8gh2
 j1fgxdiVtUbC454Ve7XFvAIsJtPQmPaE6jaKODBAap98Pwtuv/ydMlyjiVvXDy9aLEvzVeTSKJa
 xIk9/jkyNrZzAs/cM5r8nPG4D+qOJTQr92bd9JJk/roLXDhMiDNPyfCr//gPgfX5yDQ8QvQIjFd
 YwmU9R5D384gZG0tR+j3s/R8t8KZ0a3V1Cdp/5ooGbtLcEjMULWAT9xS9DKQMolbEBistio3JKo
 Hhj/5gUlJcWK/F4Z8t3fOjNrLHkrLO8DgzjMtr0lMy0OVW74RUuIiaUUld2lLdnmjAMMJPAqeaG
 Q/ud0nHjcWcOQJYzg6Ja9g45dQvZpSn02FoWZKWoW+blV+2QgDMHvFgO7axL7aPwR97hnj0OrHx
 boWCIisizvxL26v0NQw==
X-Authority-Analysis: v=2.4 cv=e6aT2qp/ c=1 sm=1 tr=0 ts=6aba3e32 cx=c_pps
 a=HLyN3IcIa5EE8TELMZ618Q==:117 a=+bKQE0WJfmhK2875HamI0Q==:17
 a=IkcTkHD0fZMA:10 a=VdqzKS8jKosA:10 a=s4-Qcg_JpJYA:10
 a=VkNPw1HP01LnGYTKEx00:22 a=u7WPNUs3qKkmUXheDGA7:22 a=_glEPmIy2e8OvE2BGh3C:22
 a=EUspDBNiAAAA:8 a=FNXtACJ1IdhLZLHqn6oA:9 a=QEXdDO2ut3YA:10 a=zgiPjhLxNE0A:10
 a=zZCYzV9kfG8A:10 a=bTQJ7kPSJx9SKPbeHEYW:22
X-Proofpoint-GUID: KzGBPP7xeqNi4V8mmx6FslSNF2-pa6Zb
X-Proofpoint-ORIG-GUID: KzGBPP7xeqNi4V8mmx6FslSNF2-pa6Zb
X-Proofpoint-Spam-Info: AW1haW4tMjYwOTI4MDA0MCBTYWx0ZWRfX0Qnhs72r4IP8
 XycsACqWg17yrJm40gcN3zCEO+YotfrF/Siki9RuhWRBlfcl9pwCwya3dDIAglMKPA564lDZWqv
 zCOVfIkmb4m5oJKMqVMnC14NGjXH+l4=
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1176,Hydra:6.1.134,FMLib:17.12.100.49
 definitions=2026-09-28_02,2026-09-21_02,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 lowpriorityscore=0 priorityscore=1501 adultscore=0 suspectscore=0 bulkscore=0
 clxscore=1015 impostorscore=0 malwarescore=0 phishscore=0 spamscore=0
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.22.0-2609040000 definitions=main-2609280040

On 28/09/2026 11:55, Aiqun(Maria) Yu wrote:
> On 9/28/2026 4:23 PM, Krzysztof Kozlowski wrote:
>> On 28/09/2026 09:19, Jingyi Wang wrote:
>>> Tested-by: Jingyi Wang <jingyi.wang@oss.qualcomm.com>
>>
>> NAK
>>
>> You cannot test it. Otherwise explain me how did you execute this code.
> 
> Jingyi is posting the Maili device tree from [1] and get dtb checking
> using this binding. And with a newer linux-next tag like 0916.

Again, let me quote:

"how did you execute this code"

And to clarify - execute on target. Build process is not testing. Where
do you see "Tested---by: Rob's bot" for every patch"

> 
> pls have more details of what kind of verification that you needed for
> the Tested-by and remove the NAK.

You CANNOT test a binding in the meaning of Linux kernel process. It's
impossible and I commented on this already multiple times.

It's a fake test, don't ever send it.

Best regards,
Krzysztof
