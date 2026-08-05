Received: from mx0a-0031df01.pphosted.com (mx0a-0031df01.pphosted.com [205.220.168.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 3FD2F3DB30C
	for <devicetree@vger.kernel.org>; Wed,  5 Aug 2026 06:36:19 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.168.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1785911782; cv=none; b=ZSxvsUo7LS5ZowQ5j5q3ZL7sDC4Vgn9trS2HHZR2tWNQUAR4fhgrUUfDdpu53BMQsvIfyhZjOG0q5ojBUeK9ubTWjSfjqNSclEbtNMZTasxMTjSh55ij76dpy79E/9OEeP35+PYSsqfLpSnFKckAkAWNHA3BN1ATgKQJpZCvS7I=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1785911782; c=relaxed/simple;
	bh=52egO2uR6QROqzSCN0wZSK0KPAnShyTrA4YdSfd3s60=;
	h=Message-ID:Date:MIME-Version:Subject:To:Cc:References:From:
	 In-Reply-To:Content-Type; b=JOJ8K+Fi+lIDtrd26IgCYyqsf4RUSxrTz2w3WowgCgAP3o7VCSm+M5rD2ba8Pd008Tno04Ao2ubqUG9RqvzJhHsFfOW2oRFz4LoiCcPsvON8lFO9gUUQ9o76QY6tUASLiwsExONHoNOr+JMEHoZ43iXaKCD4U9DfSYPaZpS1AUc=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=OIvhiEAI; dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b=GbE9P/vO; arc=none smtp.client-ip=205.220.168.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b="OIvhiEAI";
	dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b="GbE9P/vO"
Received: from pps.filterd (m0279863.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 6755lEIp2074275
	for <devicetree@vger.kernel.org>; Wed, 5 Aug 2026 06:36:18 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	4hDJxZk+v8/RtvW8Qv9o/0m9zTJWoPN2O+84UE2RIt8=; b=OIvhiEAIO/wMDvUk
	fQFQcffiErY5wNE0gC5Gx9MmhrH6ZLUtp6gZfYX9Yk9+dxItooFNNWX1Sj6dHYIH
	IOU2zfpx/2j2okoTK1xPoNNTlRu0QehJ3vCuP+satAGGh6UoJwWMv4bGqCUihMKy
	Bx9v5zTN4koowe7ZcUEQYAbIxCXBPlf/3wz//vRmym9mRCgxarmmL3FbdNEQFdpy
	QccblBuav88aNjWqAv+nzVAYhNygubPSfthw2JV9BwgxiORqF8IOUxH9+bkR5WOh
	Nk4X/RYEQg/sanJqu1wpK7tTJm/huHIjGP+uf/n+WyAhTeoQXtcKBCSotNJkdJ9U
	3ARV7A==
Received: from mail-qt1-f197.google.com (mail-qt1-f197.google.com [209.85.160.197])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4fum56k375-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <devicetree@vger.kernel.org>; Wed, 05 Aug 2026 06:36:17 +0000 (GMT)
Received: by mail-qt1-f197.google.com with SMTP id d75a77b69052e-51ebdfceddcso6471871cf.3
        for <devicetree@vger.kernel.org>; Tue, 04 Aug 2026 23:36:17 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1785911776; x=1786516576; darn=vger.kernel.org;
        h=content-transfer-encoding:content-type:in-reply-to:content-language
         :from:references:cc:to:subject:user-agent:mime-version:date
         :message-id:from:to:cc:subject:date:message-id:reply-to:content-type;
        bh=4hDJxZk+v8/RtvW8Qv9o/0m9zTJWoPN2O+84UE2RIt8=;
        b=GbE9P/vOP9E5GZAg4PjlpXR3JCXlF5EjkO6Q1f4QeJUA9DJ/O6Zn5S/kFuY3pzzbjQ
         KrpRvcMgWYojgVJDsJE+Njyo81AnE9l7+hTYLBcStVGQFRZp1+D4j/V4kqKrv4U6O/JI
         OMq3rNK+xjfrRKDWgjAB7/jxLdN9OHf/yavUVK4VAJa9dBDhsUvz+E5Mxw7dHM3AxbKh
         LOYz3ftNSZrk+kI0Z6LAtH2tZtRdjmucrZIk65YiDWz/qnoLwQSLRfSL0re1TfyPUSqg
         iB5k0XxyHM3dXjWwNPXs029xEGZ4iG9pU3Fra6T3x11hajdpTvmuHzfrFqa9BLHXkD5n
         Cpew==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1785911776; x=1786516576;
        h=content-transfer-encoding:content-type:in-reply-to:content-language
         :from:references:cc:to:subject:user-agent:mime-version:date
         :message-id:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=4hDJxZk+v8/RtvW8Qv9o/0m9zTJWoPN2O+84UE2RIt8=;
        b=jNYGStv4JgdTlVngZHF2B0M/TTJZQNRZ/GRuCPAMJw3Tcd4kdrje/j4yy1XEKPkMYA
         OpnLXrzfjy+9FJP5rxsA+DsDEKLun/Y1Iw822T6NmsvdOPMhqGSwafPuqRfG6kvg/MO7
         hGCuppniihxZ1Jfu/ldfflP4Ha873FipZ81HNzHvs7sWPbqTUZGKHsn7gsUJHgy2lwI7
         wcdWz0qh4sxnHxSgHCz2P2YtNab8iy3iMPx1yGqf7Ipl6DeuIB9+QaMtz5Q2DMaxg8Lg
         iCRlbIOH68YF4wu1UJs3an/kun+v9GXPibZDHptoFgzoqtX0dFlisdpUoCKa/sukH/Tu
         L0WA==
X-Forwarded-Encrypted: i=1; AHgh+RootACw/6LsP1rc5WdzHV9C/sr+agnaBRPBMm1oKxKl2luqIR7KUbBsQoCMVP2jGUOhFE3dYW2tssIS@vger.kernel.org
X-Gm-Message-State: AOJu0YySpvzMtPzWXp5X6ZIzaXtjy8PIJL5acm4xDnoTkgyXTMDWMBAT
	VZwpU/VmTidff2hKsROxUVkDc99vWPDNbR8QoClLk4Nu5/rhdthfKX/yIZ4oSwDTlvTxhTpfsvW
	kCZ1B2dxEguErJ+B9o69GNPhaVCgKBqlRyGsLxJn/GLkL6tnwGXJq0+sodnU92fh5
X-Gm-Gg: AR+sD12WFrO9oRMccgfVkQy/Aurt00ENw38SVgF8rC8gWDXVG+fq2Hq5vTmi/L4+Atn
	gtRlpYFVJDYGROZYf3EXqNaYYfnaHT1ztShsBsGORRXu7ZjeY2kZJeWkmI6b4eceFLDXs/4f6W7
	KKMk1MxCl//7VtOlbcLo10jadfyjguWKmeBnSti1GtnoOW3auDNnkPtDUmZkvpGWcwApmeaoTu4
	bwcb2WvkRPY6lMp1M1zajbK5363WuJ9+LYR+P1hZYutCfT6Hg8wSKn6y76yIhyEyOWpk8nJspBz
	fUedyEoKdaGDcpbpGvhQqaovXkwc9SOX5OgqnBB4lGNoHm2ONnYZO4kf/xjI0zI0tEU3NXrbC5D
	nLJ7YjL9UKRBSbFZv+NAvro2DKJ1nDg==
X-Received: by 2002:a05:622a:8c:b0:519:fca2:346a with SMTP id d75a77b69052e-52ce610775fmr40114381cf.23.1785911776438;
        Tue, 04 Aug 2026 23:36:16 -0700 (PDT)
X-Received: by 2002:a05:622a:8c:b0:519:fca2:346a with SMTP id d75a77b69052e-52ce610775fmr40113921cf.23.1785911775923;
        Tue, 04 Aug 2026 23:36:15 -0700 (PDT)
Received: from [192.168.1.110] ([178.197.219.214])
        by smtp.gmail.com with ESMTPSA id ffacd0b85a97d-47fec23ec2fsm6226035f8f.29.2026.08.04.23.36.13
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Tue, 04 Aug 2026 23:36:14 -0700 (PDT)
Message-ID: <14fd0c6e-4f35-4916-b6a3-b5ebc293c56c@oss.qualcomm.com>
Date: Wed, 5 Aug 2026 08:36:12 +0200
Precedence: bulk
X-Mailing-List: devicetree@vger.kernel.org
List-Id: <devicetree.vger.kernel.org>
List-Subscribe: <mailto:devicetree+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:devicetree+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v7 3/7] dt-bindings: sound: qcom,q6dsp-lpass-ports: add
 Audio IF clocks
To: Krzysztof Kozlowski <krzk@kernel.org>,
        Prasad Kumpatla <prasad.kumpatla@oss.qualcomm.com>,
        Rob Herring <robh@kernel.org>
Cc: Srinivas Kandagatla <srini@kernel.org>,
        Liam Girdwood <lgirdwood@gmail.com>, Mark Brown <broonie@kernel.org>,
        Krzysztof Kozlowski <krzk+dt@kernel.org>,
        Conor Dooley
 <conor+dt@kernel.org>, Jaroslav Kysela <perex@perex.cz>,
        Takashi Iwai <tiwai@suse.com>, linux-arm-msm@vger.kernel.org,
        linux-sound@vger.kernel.org, devicetree@vger.kernel.org,
        linux-kernel@vger.kernel.org,
        Srinivas Kandagatla <srinivas.kandagatla@oss.qualcomm.com>
References: <20260804070307.117119-1-prasad.kumpatla@oss.qualcomm.com>
 <20260804070307.117119-4-prasad.kumpatla@oss.qualcomm.com>
 <20260804201645.GA1781336-robh@kernel.org>
 <8e362b9f-c19e-477b-b01a-74597858edfd@oss.qualcomm.com>
 <b814a4be-7c20-45e4-8abd-5e67a6a3b5a1@kernel.org>
 <7089bf29-acdd-49c4-a32e-82e266019910@oss.qualcomm.com>
 <8f29cb9e-04c9-4048-bb11-854a2d90627e@kernel.org>
From: Krzysztof Kozlowski <krzysztof.kozlowski@oss.qualcomm.com>
Content-Language: en-US
In-Reply-To: <8f29cb9e-04c9-4048-bb11-854a2d90627e@kernel.org>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit
X-Proofpoint-ORIG-GUID: mFH_2rXW7_bfHErwgh8V7RvHmNowXH17
X-Authority-Analysis: v=2.4 cv=Co+PtH4D c=1 sm=1 tr=0 ts=6a72d9e1 cx=c_pps
 a=EVbN6Ke/fEF3bsl7X48z0g==:117 a=+bKQE0WJfmhK2875HamI0Q==:17
 a=IkcTkHD0fZMA:10 a=Sv0fKeRqtYgA:10 a=s4-Qcg_JpJYA:10
 a=VkNPw1HP01LnGYTKEx00:22 a=u7WPNUs3qKkmUXheDGA7:22 a=yOCtJkima9RkubShWh1s:22
 a=vQhtWTqkcnNfwhkucCQA:9 a=QEXdDO2ut3YA:10 a=a_PwQJl-kcHnX1M80qC6:22
X-Proofpoint-Spam-Info: AW1haW4tMjYwODA1MDA1MCBTYWx0ZWRfX+bDdFfiNorEv
 A5RDiZNynjqj6WCf9QdhcFIkCioJKI3SlSJLzWVOH7hBN/qyzq6nlLo99NBd0Lbj0Xo1lk+R2cN
 PWnHwMwy6D0tH6KInrgRi75ssL6BLJY=
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYwODA1MDA1MCBTYWx0ZWRfX8C+CwfbGUyJn
 iKGQ4R8gl0O+FnCuhh/CGlGU4wIVHFGrXZNXe/wsjzVRsGOCAb/k3huOLwzsFLFFrjpDfE7ln3l
 g+ywjyD9L7srtfwXif3vJCrD0l8GkZWiAsqy/+gPqOa6QGauoTNp7X5MKayLOzT9XkIBz2n6DHe
 JD3nedKfe94qA2IYLWVMDWiHW8rSkeU3hu66QoOUFa/Z7x6GH5l8OjenEIlPB5iFS0MG9xT9OhP
 +T8qMRcBXtz7afj8F6ywHn+4/ICTUPXLUfw7s2AR3nWpBbnJ0UTGkUUkd9eeS9jgpVvNFkuqh/9
 SBIgoL+J62tkOcb2NHVAwiszruq0wOSKglg6bR+LqGXCHlkMnniT9PmbQjsa8ZMlsUTm3qqMGRQ
 gJX5OJylYMgAgXk0uh0YCyDvdbWB9lNH2kq87teD9qmE5A6fLaalSKhZ9P1SJ+Hr2SbJk3VhlKS
 1q7yo2s+jrG2Ma5evyA==
X-Proofpoint-GUID: mFH_2rXW7_bfHErwgh8V7RvHmNowXH17
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1176,Hydra:6.1.134,FMLib:17.12.100.49
 definitions=2026-08-05_02,2026-08-04_02,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 priorityscore=1501 suspectscore=0 lowpriorityscore=0 clxscore=1015
 impostorscore=0 spamscore=0 phishscore=0 bulkscore=0 malwarescore=0
 adultscore=0 classifier=typeunknown authscore=0 authtc= authcc=
 route=outbound adjust=0 reason=mlx scancount=1 engine=8.22.0-2606150000
 definitions=main-2608050050

On 05/08/2026 08:33, Krzysztof Kozlowski wrote:
> On 05/08/2026 08:29, Prasad Kumpatla wrote:
>>
>> On 8/5/2026 11:40 AM, Krzysztof Kozlowski wrote:
>>> On 05/08/2026 06:40, Prasad Kumpatla wrote:
>>>> On 8/5/2026 1:46 AM, Rob Herring wrote:
>>>>>>    #define LPASS_CLK_ID_RX_CORE_MCLK2_2X_MCLK	70
>>>>>>    
>>>>>> +#define LAPSS_CLK_ID_QAIF_IF0_IBIT		71
>>>>> LPASS_ as saskiho points out.
>>>> Hi Rob,
>>>>
>>>> Thanks for catching this. The change has already picked, so I'll send a
>>>> follow-up patch to correct the typo.
>>> You received several sashiko (6!) replies immediately after sending yet
>>> you did not respond to them leading to Mark picking up this patchset.
>>
>> Hi Krzysztof,
>>
>> Thanks for pointing that out, and apologies for not following up on the
>> reported typo sooner. I had noted the issue, but unfortunately did not send
>> the fix before the series was applied. I'll send a follow-up patch to correct the typo.
>>
>> Thanks to you and Sasikho for catching it.
> 
> It is not about a fix. It is about replying that you have Sashiko
> reports with valid statements!
> 
> And what about give (!!!) other comments beside that typo? Are you going

Typo... what about "five" other comments?

> to ignore just all of them?
> 



Best regards,
Krzysztof
