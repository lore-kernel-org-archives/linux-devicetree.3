Received: from mx0b-0031df01.pphosted.com (mx0b-0031df01.pphosted.com [205.220.180.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id AC6813AB5AC
	for <devicetree@vger.kernel.org>; Wed,  9 Sep 2026 06:33:46 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=pass smtp.client-ip=205.220.180.131
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1788935628; cv=pass; b=P3f30Gtck0BdvrRjWQWYnWLM5+pppQUJb1+W5gGGzBH5nEeALI7BOB7o88S+UtKe7Tb9xl1dzrtNdxmTPN6SzzogfmgMZsRy05aZDlaw12b4+RfrG082hpG4wOHalZGMROQLho+S69DOP1ddwyvMhDCyQXgKM0FbjG3Jxekx0hw=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1788935628; c=relaxed/simple;
	bh=18Zr3UdkPL5YGneMwhBfVyFM5vzCFjokkjS/4aofckw=;
	h=MIME-Version:References:In-Reply-To:From:Date:Message-ID:Subject:
	 To:Cc:Content-Type; b=FOdEV2y1KtYVj9KZeqejTQgHtUsUDqAQY0YqaGl5be8cUzjYk15+unRLxRzYolHW23FcahKji07ez4ps7NBcUUeWsLolpyZ6txzcuiQynX9qn/vO90r8nyNNyUGGWRImQq/smbhC2VgVq1g7gklMz+Smd7u7igSzdp3rlCNVC8k=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=Zb3O9jTD; dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b=E+UmiBp5; arc=pass smtp.client-ip=205.220.180.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b="Zb3O9jTD";
	dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b="E+UmiBp5"
Received: from pps.filterd (m0279869.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 6896DbGA481952
	for <devicetree@vger.kernel.org>; Wed, 9 Sep 2026 06:33:45 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-type:date:from:in-reply-to:message-id:mime-version
	:references:subject:to; s=qcppdkim1; bh=F6ybEqTWr7PTGYwKjzBDvKVQ
	3R5C9k69c4zwqDv/bw8=; b=Zb3O9jTDa7TD3YF5CyohMezRJnRYfRROVFjO9ENt
	a6+cMTTOzkJ1jdnqKiEf4Snc/tZb1VvPHpMi4wYl866F0UHYbF4YCyXeytCHz+OE
	5aRd8+iqX+8qoq9kQ+6FrjSWtZab/I0T9Eg6Ddvg+zt3xZHqjzLWqaSUqaLs+YB6
	rC7hSZxYkdmMFAnWj2FYW4hTuXobdP3fxpCvrNvos35xcqov05tUdrMVI7bxSW7q
	91G/1/N600LxVgYa8hf78A/77fHItvLIcIyv4EECHJhkeF4+ATf46nvVstzGOiYU
	cYanulIdjdx2rvpJDarP9ttc2t2DLJlgN9dwPk0EsBlJqA==
Received: from mail-yw1-f197.google.com (mail-yw1-f197.google.com [209.85.128.197])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4gjqf1jhqj-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <devicetree@vger.kernel.org>; Wed, 09 Sep 2026 06:33:45 +0000 (GMT)
Received: by mail-yw1-f197.google.com with SMTP id 00721157ae682-857f88e7b3fso65775377b3.3
        for <devicetree@vger.kernel.org>; Tue, 08 Sep 2026 23:33:45 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1788935625; cv=none;
        d=google.com; s=arc-20260327;
        b=UlAAaM+qAYaAr6W/Td5nl8grukcd0R5P7XjrI93ZtyyGMH9Rro/SRuSwyFFSOEqxXf
         nXf6ONnWp8BXwGhma+m0sE69Jj63V0huwP47Y8Mi0yPARIqneThfbwjiVkQ/YpYVtFga
         Xp7ypXYIuDG3XXHe8eZmXKGGyzujc85miODlKxUuwTfLb5lQbyEjA07v68lxR38DwpSI
         Kxa1NJFZ0UbLNVfSf7Qns7/C822S/0+QXwD+TWIBI1yZ6Pf2gkz1a4TqKrqWoBqNtHEE
         2aVDcKGWiqgkclwAuY7TWfQLHOJg7JBrAJuoQmjTRXloj5k5US10e4qpKn0KN1UR82AG
         uU1g==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20260327;
        h=cc:to:subject:message-id:date:from:in-reply-to:references
         :mime-version:dkim-signature;
        bh=F6ybEqTWr7PTGYwKjzBDvKVQ3R5C9k69c4zwqDv/bw8=;
        fh=BIaOV0In2ZzYPVzjY8I12Hdj1CNWhI3NiHNUMO/EKyk=;
        b=YDYc1KP1TlRPcNTCVAsvIQt5GifhrcwVcIBIVfVJa2QaPTz5GPfpTfAc/pPaupkzKj
         RjZMKM1vrLEN4bWWwH2bagxQMdwpezwXN+iU9/cXNGe6XATgrisgSRT2BxKA0hFAZ7KF
         /yTFB44Y5999o8jEtqbHrbfP+MxA9GguFbv5i5S/g+aAVQ5VX0Jk3V+sAQpsG5o7oeUK
         PcUCXLjKDMpaxuoC7tAquFzaAucSoqeqTudTFHKYXloDtKkqj7u/BYKjpb2CKQcSz2Wr
         eu6NKUIi1xF09jSFV2lVSrGB9DZbP0MIi4YDaplfR4uLZnKbJ4fsRiixIrQp1Hhh8OEr
         aO6g==;
        darn=vger.kernel.org
ARC-Authentication-Results: i=1; mx.google.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1788935625; x=1789540425; darn=vger.kernel.org;
        h=content-type:cc:to:subject:message-id:date:from:in-reply-to
         :references:mime-version:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=F6ybEqTWr7PTGYwKjzBDvKVQ3R5C9k69c4zwqDv/bw8=;
        b=E+UmiBp5BRAVIODiR25zkv7V9V5Fkeb8NFapeLUY5tC73bEleyocPmiNJZMIXuFxei
         OZlJXBScH63McmhsAsSZNbNbG3ImsgyoL2bfsJyp9tbvMX92K0trrOfT29krlsEmEuk8
         jG2OCcL0+yfWdBeYwIJBq16a//EeJmeOATum8ikS6zfJkID+yOzFXaZh2XiPs6rd68u5
         dG/BMtVAt5QJ4n3Eg/Sle2Xm78hq8JnfRghQ2Hojno5S02pcgDB2WIxu/pzPhBhOWOje
         CNL0Q8KOZ2GeWzfz9FhHdUis9+U1CIgRUc7a/F3iwrvUchtNvdmp2/jD2OLynU7DI0tK
         DveA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1788935625; x=1789540425;
        h=content-type:cc:to:subject:message-id:date:from:in-reply-to
         :references:mime-version:x-gm-gg:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to:content-type;
        bh=F6ybEqTWr7PTGYwKjzBDvKVQ3R5C9k69c4zwqDv/bw8=;
        b=DgZvMaFmZzj+3uqyvwW3syXeCr/gefg0tq/43qhjymx5ZOygKDtHuqrpVi4W/hN7Mg
         0e4Ng77luEl/0qI26B2q1cTxoQeMMA9R0lPl6fhFngQ+usUgGYthu7zQMSoJ9hvnwcef
         2IyRZAe04K00xuoOgcoy2uiZsOE9ODxOes5fec3732Tu+dtMTtGBQc/nJfT17GIXeILk
         KCIUCFKFam2lHmMcSDhALbSyPxo+uqpHQbO8uRulkKgM5D8/E/gh5V7xUK7a38XzGUTc
         5Vo2lpDzkK7Jx3yZbwtWZcmaE5rSfUl+FO2Jmy3YUq7oEEOYBIgmGjG1xxrEmVLD6Vfk
         DMvA==
X-Forwarded-Encrypted: i=1; AKwUvBxNj8egt+c2e4dgRHB0SGGxjxsCbRJhDcDpuZMQv5lH0CFlN7Lu+Nx+9ByiJhG5831BURfuJlyGOKU+@vger.kernel.org
X-Gm-Message-State: AFuF++l5P1ULdmIxbsf946XIKESQrKYcLAVli3kO7oKeqLYezNs7b7J1
	hwCtjNetFLZqdMlEFuiGq4kIacDV0x5o/wvYxUndNTnVnqAIWcXhSoo16yX4NVTjSo+rrCxlLpc
	j/Dt1zyUAUHvhdzBe4ZprtXPGSeumBBjmL2IAIxxOcclMIcEDAnIJ3acdVq8tY863pOm6oX0tmZ
	jKk//DvL2zMi7f9FXPdW7q0bVK/gDwvLk7LfgUKPo=
X-Gm-Gg: AYBFou2TxdYZxNXGDygCxbTd8vVyL6gtvMeAtN+E23r+a2No7KCX2f/l7vhsQexhbzq
	kLYr7HtrQoQc0+cnrgyOQpfLEyMSBGcEmFOMgJe0pSo+O+5W6cLmkL9dkvw5IVCoxbtl/aKgzev
	zYH9o7h92ld7M8pJ/pfxpkUpdhG1Mr64yomc/meNcbk+HFOL41b1lUSa5jsg==
X-Received: by 2002:a53:b604:0:b0:66f:c1be:84c8 with SMTP id 956f58d0204a3-66fc1be8c6emr6652759d50.54.1788935624938;
        Tue, 08 Sep 2026 23:33:44 -0700 (PDT)
X-Received: by 2002:a53:b604:0:b0:66f:c1be:84c8 with SMTP id
 956f58d0204a3-66fc1be8c6emr6652744d50.54.1788935624539; Tue, 08 Sep 2026
 23:33:44 -0700 (PDT)
Precedence: bulk
X-Mailing-List: devicetree@vger.kernel.org
List-Id: <devicetree.vger.kernel.org>
List-Subscribe: <mailto:devicetree+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:devicetree+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
References: <20260907-b4-qaif-shikra-audio-v5-0-6d8ad9ba5c9f@oss.qualcomm.com> <5e6d52cb-53f6-4af2-b1f6-d894d8dcca9e@sirena.org.uk>
In-Reply-To: <5e6d52cb-53f6-4af2-b1f6-d894d8dcca9e@sirena.org.uk>
From: Harendra Gautam <harendra.gautam@oss.qualcomm.com>
Date: Wed, 9 Sep 2026 12:03:33 +0530
X-Gm-Features: AcwNN1WQUsj5OMuHNikswDVbQA10l--Mx-WHy294kAjPi8kkiskKKrtmL0NvCDU
Message-ID: <CAC-tS8BnLzKrtz_rJ-ScQwbfcvFuj5ptOBzXgCSCgUaC_gUCVw@mail.gmail.com>
Subject: Re: [PATCH v5 00/10] ASoC: qcom: Add QAIF driver for Shikra audio platform
To: Mark Brown <broonie@kernel.org>
Cc: Srinivas Kandagatla <srini@kernel.org>,
        Liam Girdwood <lgirdwood@gmail.com>, Rob Herring <robh@kernel.org>,
        Krzysztof Kozlowski <krzk@kernel.org>,
        Krzysztof Kozlowski <krzk+dt@kernel.org>,
        Conor Dooley <conor+dt@kernel.org>, Jaroslav Kysela <perex@perex.cz>,
        Takashi Iwai <tiwai@suse.com>,
        Kuninori Morimoto <kuninori.morimoto.gx@renesas.com>,
        linux-sound@vger.kernel.org, linux-arm-msm@vger.kernel.org,
        devicetree@vger.kernel.org, linux-kernel@vger.kernel.org,
        Prasad Kumpatla <prasad.kumpatla@oss.qualcomm.com>,
        Krzysztof Kozlowski <krzysztof.kozlowski@oss.qualcomm.com>,
        Sarath Ganapathiraju <sarath.ganapathiraju@oss.qualcomm.com>,
        Kumar Anurag Singh <kumar.singh@oss.qualcomm.com>,
        Mohammad Rafi Shaik <mohammad.rafi.shaik@oss.qualcomm.com>
Content-Type: text/plain; charset="UTF-8"
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYwOTA5MDA3MiBTYWx0ZWRfX2iHw8Xl1sm0b
 Z4sFee1hu6dyoa39dSbYfeeFzWwwsfHOiIRhfbYTJBchnVO+t36v+MoM/1bC+JxrW598tjQ90zZ
 0M6akcHAp99vAo7168DSmxelq0kneU0MzbRHjNbkHP9jXu4yik7G1KSqFgi1H87+U5+vl6a2BPE
 y3izkq+xbo7PTM8K0TBQFWDrCzmJVAvGhFu/JEnM/y74b0wNmdhiQzM+mnTqO6bNAM6lA9/3nge
 3qJPAe+OA0Rk1ts22abES0cF8cfIooeYZwiZK7U0WYfmIeCervI+SbzWlf6X4dqFZSM+uRP9u2w
 yN5POgJLR8qnsqiIs1uxh/3fUbv94v8e8nZfGcYpZJTgbthfI3YdhGgDf/Wm6w2DT9RCYZFs9Mz
 wxKvFqz4Y0IVgDs8NMXrvfVQcc6jGxLg8i8AKxBJtE2q1bMhtf/I0fqWG1WveZe9LiAa8c4zB60
 O9fKSZpiDKta3vne71g==
X-Proofpoint-Spam-Info: AW1haW4tMjYwOTA5MDA3MiBTYWx0ZWRfX8TdrlLWyRQoN
 StVNRutC22gFXd3rFnL05TYrXNyoL4YBXy11O0W6+mVsr2aORgoxL9OhM8eQcRL0INJHw67XSh3
 0Uzfedntrb7Cz04gngd+7mMSlvZVYFU=
X-Proofpoint-GUID: qFom2wctARDVzqC0j8meK-P2-PM5-32o
X-Authority-Analysis: v=2.4 cv=JY2Ma0KV c=1 sm=1 tr=0 ts=6aa0fdc9 cx=c_pps
 a=0mLRTIufkjop4KoA/9S1MA==:117 a=IkcTkHD0fZMA:10 a=VdqzKS8jKosA:10
 a=s4-Qcg_JpJYA:10 a=VkNPw1HP01LnGYTKEx00:22 a=u7WPNUs3qKkmUXheDGA7:22
 a=_glEPmIy2e8OvE2BGh3C:22 a=-dXBdVp_9Me3CGyqtu0A:9 a=QEXdDO2ut3YA:10
 a=WgItmB6HBUc_1uVUp3mg:22
X-Proofpoint-ORIG-GUID: qFom2wctARDVzqC0j8meK-P2-PM5-32o
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1176,Hydra:6.1.134,FMLib:17.12.100.49
 definitions=2026-09-08_03,2026-09-08_03,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 impostorscore=0 clxscore=1015 malwarescore=0 lowpriorityscore=0 phishscore=0
 suspectscore=0 adultscore=0 priorityscore=1501 spamscore=0 bulkscore=0
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.22.0-2606150000 definitions=main-2609090072

> >   qaif-platform.c: PCM platform component. Handles DMA buffer allocation
> >   (dma_alloc_pages()), PCM ops (open/close/hw_params/prepare/trigger/
> >   pointer/mmap/copy), table-driven two-level IRQ dispatch with
> >   period-elapsed notification, and component suspend/resume across power
> >   collapse.
>
> I didn't notice the suspend/resume support in the series?
You are right, the cover letter is misleading. The driver uses runtime
PM suspend/resume (pm_runtime_force_suspend/resume) for power
collapse, not PCM-level suspend/resume. Will correct the cover letter
description or any other misleading text in the next version.
-Harendra
