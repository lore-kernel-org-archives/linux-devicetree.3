Received: from mx0b-0031df01.pphosted.com (mx0b-0031df01.pphosted.com [205.220.180.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 7203A389119
	for <devicetree@vger.kernel.org>; Mon, 20 Apr 2026 08:39:30 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.180.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1776674371; cv=none; b=VfHkub8QaCgVCayY7jID4PVHQD/V6XnNxB69wyqk8enbI9E10hjf+4LMpDmm8SdnCKui3/0RACzcDuI96cMYUEmQz5IogwI8VevMkgmSnjoao4aJAngf1tS7s6HqOTo1Z75YYU+3kOVwNGzgRnUzqrdDl7/4hI9986XNCl/QeoA=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1776674371; c=relaxed/simple;
	bh=wKDYz3kQXAIVeF5ikhXg38czhZj+XGuLSJRadJLZpN8=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=EJ15ms9A+kkl6GkSZkEOCntq1P8iYwBWv0I9igGZpl5UKA39+zQmTFxpxE1qA3Fu6LkMou9QRGbAwmZwePEk0R75GVPHxuBcjltDxldYNghJ8jlFkI5M+fn3hsjZXlwi8uFiWxjGP4jfa5JaXngpAZHILTjZkKPor9RbPNR90/E=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=C170iHTf; dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b=e5SUO+fw; arc=none smtp.client-ip=205.220.180.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b="C170iHTf";
	dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b="e5SUO+fw"
Received: from pps.filterd (m0279872.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 63K6Xohp990223
	for <devicetree@vger.kernel.org>; Mon, 20 Apr 2026 08:39:29 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-type:date:from:in-reply-to:message-id:mime-version
	:references:subject:to; s=qcppdkim1; bh=r9G7P6Pct0H7sksU5StTxGp5
	NwLeVWquxkXwd2gnEGg=; b=C170iHTff6u+ouhLvq+FNHn0aea6czS8+YaFdbNW
	/2gdDJ8Xz1yxwjH5aaRsacCSjZqSYXxKly2h+pX/FiiqkjhpSz3kGE67EgN66OHQ
	AZ+GkobI7KdM0m9EmRXB5nb+NXigvB4Y4TWoL05ZbtsD+dV4LwHg01BkzNi/Xhu9
	AsCEI1ZKrbvuxv9w0ztIT69GPqKrwhFCi7l22POi9h9B5R/l8/uozCgkqYD690RX
	QSRgzZpY7VpZOxGtCwWC9x8phdRihU+u9F94CYTzrXCZXwnI0glUK1kQ+GRHGDJI
	4Ouvf68F+5cDiEF3XEmZRFbypunvvURgaIWcvJ5R6hMoLA==
Received: from mail-dy1-f200.google.com (mail-dy1-f200.google.com [74.125.82.200])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4dm2b752e2-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <devicetree@vger.kernel.org>; Mon, 20 Apr 2026 08:39:29 +0000 (GMT)
Received: by mail-dy1-f200.google.com with SMTP id 5a478bee46e88-2dd1c74508cso5253299eec.0
        for <devicetree@vger.kernel.org>; Mon, 20 Apr 2026 01:39:29 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1776674368; x=1777279168; darn=vger.kernel.org;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:from:to:cc:subject:date:message-id:reply-to;
        bh=r9G7P6Pct0H7sksU5StTxGp5NwLeVWquxkXwd2gnEGg=;
        b=e5SUO+fwgWqrUldA1iwF8hkxmJVOl9zImsjIqDozxAd4tRcGJ9e01MStgkj0pEzlls
         oendXbaWyPNTPJdGYxm5TIDNXkhfO0gVE25FTEC8HFh+CpL1c63G6vVg0gldoP77u2S9
         /+Sr8g0aL4UHTbh6j0MnzbnBLEpu22Pj2UgL6Cxi1Hgv2C+oSWDp2XoAIuEY77Gdh5S7
         WaQkKTUz89VcGI+ej0bQ3BAiE4uEmWCxcfyI/mw3r7bd9tGHziyEZB5LwWnA+7rc6ed3
         l5HWUY9EXebIIA1hixlMm3yn9H6if5cjni4RMF0sOarJnOvmj/o7pDlgwD3CmsQPmOS5
         WxxA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1776674368; x=1777279168;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:x-gm-gg:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=r9G7P6Pct0H7sksU5StTxGp5NwLeVWquxkXwd2gnEGg=;
        b=NajGs/T8Rodtfp0c9o5Fpf7FPAgLeWVIDaUyIx9uppzPlf9vCFmpRVP+0favP2eRDD
         zPDfkBe4jUwE1oZIHE45dRWoiPsvzAkr8PTyG7S0xGxEvAIXfD6SdSdY65TDX/6fLw8w
         q/7PWVcgKNLpCr08L5NtXxFU6MRDlGV+U7BfEyWH50C4Q1LZuexUqt48nmbYg4VqcnTJ
         UkMpEsOL90CwbDJ0VZF31qTz5MVhFrP7711CfPF2UvKL7hSbpymaAsxrpzI/eN8k01FX
         feIpqcC3Omw74kmuwheN7yL6vM6SesQtvvy2RompCT5f2gpgwmavt4f7KKLj1ny3CFjF
         Qd5A==
X-Forwarded-Encrypted: i=1; AFNElJ+i+6JSRwTb3Vw7M0wZB8aWHAinxhWBaTJYhzIn72JX5OuTqjO6h2x1w6jBhKtVbu45Fsm8EgYNxD5D@vger.kernel.org
X-Gm-Message-State: AOJu0Yxw+aif1cIgTJ74cd7DYZkmVP/Xy5cO5mM7o1ikoXbaCVN0KUyc
	AnGVBg2fEwYGwXLMSjIdZQBkgnuZQT/dAkWgQvMMNTJAGo4Vb9x1gKlUuGiCKkjUcJoA0Yqc9Mi
	F8QW08v+DK4DFK3KCsrHZLMA7uo5tJY5eOmZbazLItDmUoOoHa6I5lwPkHp4HZD4y
X-Gm-Gg: AeBDievf9p0LwntSCL6YEUNc7MNnZ1Ey/fFk5QROGIt4wm+CFFQRvUAGjgHGh2xKJY0
	mCvs/2N/muP+P8PHHCbTO/EYdRmTXVhjOY7YTsvCufb1huDG4xqshH+/0rU6FHcAEpiYb3/831t
	u5cjoWOLfuQssemAt/HV3X2vVAkuusNyzNNUySC5J1h9siRtcNT4LPOCKP9AXeTb15ARG/F44g5
	q4JFJ1uwKLnaawowPd4kJlpoPsKlTy2Ld8EmfuKrb9v3lRyqVMsw+koF6vJxd7lHYr3kP9gjA/T
	oDZQtJIU3TEKQY6Sb5QyPFp+IDTI4uQUFkFWjDXHa8lVmuXH8KYWYrmK7bm7pwRJn1wkcjKpZZC
	6X0GkBmWQDeDAcG+kLPzApC8f/xc1YpIXnlMourj88c7qh6P9P3e+sEYvpkU2zBBLJzMOVxMD5t
	o=
X-Received: by 2002:a05:7300:e78d:b0:2de:3022:a459 with SMTP id 5a478bee46e88-2e478935dd3mr6617539eec.21.1776674368412;
        Mon, 20 Apr 2026 01:39:28 -0700 (PDT)
X-Received: by 2002:a05:7300:e78d:b0:2de:3022:a459 with SMTP id 5a478bee46e88-2e478935dd3mr6617514eec.21.1776674367871;
        Mon, 20 Apr 2026 01:39:27 -0700 (PDT)
Received: from QCOM-aGQu4IUr3Y (i-global052.qualcomm.com. [199.106.103.52])
        by smtp.gmail.com with ESMTPSA id 5a478bee46e88-2e53a4a80c7sm16452316eec.10.2026.04.20.01.39.23
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 20 Apr 2026 01:39:27 -0700 (PDT)
Date: Mon, 20 Apr 2026 16:39:21 +0800
From: Shawn Guo <shengchao.guo@oss.qualcomm.com>
To: Krzysztof Kozlowski <krzk@kernel.org>
Cc: Herbert Xu <herbert@gondor.apana.org.au>, Rob Herring <robh@kernel.org>,
        Krzysztof Kozlowski <krzk+dt@kernel.org>,
        Conor Dooley <conor+dt@kernel.org>,
        Bjorn Andersson <andersson@kernel.org>,
        Konrad Dybcio <konradybcio@kernel.org>,
        Dmitry Baryshkov <lumag@kernel.org>,
        Bartosz Golaszewski <bartosz.golaszewski@oss.qualcomm.com>,
        Deepti Jaggi <deepti.jaggi@oss.qualcomm.com>,
        linux-crypto@vger.kernel.org, devicetree@vger.kernel.org,
        linux-arm-msm@vger.kernel.org, linux-kernel@vger.kernel.org
Subject: Re: [PATCH] dt-bindings: crypto: qcom,inline-crypto-engine: Document
 Nord ICE
Message-ID: <aeXmOSfAFoxhIAcD@QCOM-aGQu4IUr3Y>
References: <20260420073301.1250197-1-shengchao.guo@oss.qualcomm.com>
 <dd5ee12e-1aac-494f-a8f8-74e236ecb47c@kernel.org>
Precedence: bulk
X-Mailing-List: devicetree@vger.kernel.org
List-Id: <devicetree.vger.kernel.org>
List-Subscribe: <mailto:devicetree+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:devicetree+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <dd5ee12e-1aac-494f-a8f8-74e236ecb47c@kernel.org>
X-Authority-Analysis: v=2.4 cv=KZridwYD c=1 sm=1 tr=0 ts=69e5e641 cx=c_pps
 a=PfFC4Oe2JQzmKTvty2cRDw==:117 a=b9+bayejhc3NMeqCNyeLQQ==:17
 a=kj9zAlcOel0A:10 a=A5OVakUREuEA:10 a=s4-Qcg_JpJYA:10
 a=VkNPw1HP01LnGYTKEx00:22 a=u7WPNUs3qKkmUXheDGA7:22 a=yx91gb_oNiZeI1HMLzn7:22
 a=lhIjiZdZG9_ld_Bbx38A:9 a=CjuIK1q_8ugA:10 a=zgiPjhLxNE0A:10
 a=6Ab_bkdmUrQuMsNx7PHu:22
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYwNDIwMDA4MiBTYWx0ZWRfX7AynB0muy45T
 S3grnSOR5hjC/Spvq41TnEBooooEQKV1R//xRIR0h3V21T5Gl8it75IaTkwv4EZq3epvX86x9aT
 zJuFyKS950H5+23NFuOYbiCvNmDiB/yXHAYFteTzsCve+zbEEh7zhzXRuyjIw9p6wEaj0rPFUpZ
 1jQppxwGluVkgfE+98GUa7SinrlxBYyr7d0wFXwNKo9CMo9j6RzzheI7Awya9q1MTRb4yx7RSkK
 zWf7XXjNNL1wXfIqx8ny4vTevMhJzU5xjqB/VMXiSeCtxBl1BsbQpSLpUWISgpd8rLTHDZyubcV
 nh1R4KazWE9IqIVwuJgocGor32prdDrjhJgtcyrdoxtiJ5hKqSOdhPPidYxU+XQTD763RZX7tsQ
 /+32ztN7SddGkkESjjzFZxHzFAWDPviK1LqJPWsSfex+8GDnNHYx1WgbyJ/G4sENMhdRO+zsgam
 CsLQtRyPB8T/UrkAxVQ==
X-Proofpoint-GUID: MBq9wcgnOeVrLpQamUKusBexAbVdw5Pa
X-Proofpoint-ORIG-GUID: MBq9wcgnOeVrLpQamUKusBexAbVdw5Pa
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1143,Hydra:6.1.51,FMLib:17.12.100.49
 definitions=2026-04-20_01,2026-04-17_04,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 suspectscore=0 impostorscore=0 spamscore=0 bulkscore=0 malwarescore=0
 priorityscore=1501 clxscore=1015 phishscore=0 adultscore=0 lowpriorityscore=0
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.22.0-2604070000 definitions=main-2604200082

On Mon, Apr 20, 2026 at 10:27:56AM +0200, Krzysztof Kozlowski wrote:
> On 20/04/2026 09:33, Shawn Guo wrote:
> > Add compatible for Inline Crypto Engine (ICE) on Qualcomm Nord SoC
> > witha fallback on qcom,inline-crypto-engine.
> 
> Don't explain what the diff is doing. Explain why. Why do you use fallback?
> 
> What is Nord? It's nowhere explained. First posting was 1.5 months ago
> and it did not provide any explanation. I don't see any information
> being posted in the series sent now.

I'm still checking internally to see how we can get the best socinfo
patch describing Nord which is a SoC family covering both SA8997P and
IQ10 variant.  Hopefully I will get it soon.

Shawn
