Received: from mx0a-0031df01.pphosted.com (mx0a-0031df01.pphosted.com [205.220.168.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 312BB1DF25C
	for <devicetree@vger.kernel.org>; Sun, 28 Jun 2026 13:02:42 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.168.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1782651763; cv=none; b=aBkQz44Vjp8l0tywFAiCSop/qDmi0N/4FaMfxpcf9rzoB7p2rmYBmKaC4OXF0M1lLI5tFCSbzJvnHVW8WPzFzs06dmdarAEvH2tnuqafTX/pyvxnahNIxMfVY88sGIEUV37G7w9uzrK2bM520HHhmbYUJn2PihfOpMQsCepTC7E=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1782651763; c=relaxed/simple;
	bh=3a0VbnXkZ8vz4fvZwDTr4U6d8HJd1IYRhkPgY28OmDw=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=uVHub90yUcAfzSraapNxDUQ2uyb+VGnOwEIxT8RC+76eIG1zDyS1TX2Ji0ygTDKx3EvnRNZJ2MlYhhL7r5JCFSmHimeFnIAIrwyjQEF67ChlPASWMBXDJilslNwJ41nFs+EWIzR04Sq9g9KEMOmm+45cgm4uiJF7Mb6ILPNquh4=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=UR6TL9eo; dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b=dyaXKK8n; arc=none smtp.client-ip=205.220.168.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b="UR6TL9eo";
	dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b="dyaXKK8n"
Received: from pps.filterd (m0279866.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 65S9QL5U3602094
	for <devicetree@vger.kernel.org>; Sun, 28 Jun 2026 13:02:41 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-type:date:from:in-reply-to:message-id:mime-version
	:references:subject:to; s=qcppdkim1; bh=RdveEr8qZ0MWpllypjGf5SGU
	2/zVm5rbjh5987dmoZg=; b=UR6TL9eo7FBJxNsD48lxY5TzHBqr7uMgs9tVJ/51
	B4wOu2/qrlpKfcZDEkkEPrTL0rdOSq2x7ITK2yG87moS52B2c8LdDBVj6XJs8J5P
	QMRFHcxYc4YqYJza98GiMray736G5YmgC+TRTQxtI0KVzn5W78iOfrP+v17kFOaE
	UE+rqiXkt+myKaJqO9bbmPUdSrdF3jN7536JxzIerjSgvcZL8edpyRp0vltevqTU
	U4Xn5BFCRi9coq3c83svEztaE1CA6TqusXN0aG6JiC/vp8jaaAuAfnMF+cYunosw
	sQge/T71d08JZTrqUjboV5aLufsF6f7vOntzk29N//TgMA==
Received: from mail-oi1-f200.google.com (mail-oi1-f200.google.com [209.85.167.200])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4f27t7tt1j-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <devicetree@vger.kernel.org>; Sun, 28 Jun 2026 13:02:41 +0000 (GMT)
Received: by mail-oi1-f200.google.com with SMTP id 5614622812f47-48952d1c293so4221335b6e.3
        for <devicetree@vger.kernel.org>; Sun, 28 Jun 2026 06:02:41 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1782651761; x=1783256561; darn=vger.kernel.org;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:from:to:cc:subject:date:message-id:reply-to;
        bh=RdveEr8qZ0MWpllypjGf5SGU2/zVm5rbjh5987dmoZg=;
        b=dyaXKK8nulS6NoQqBnnjAXTrh4q/4KJGBf2l/2pqsEGSGtc6VBKYlIowmUtLMFB+k6
         7m5+3EQutWRqX7VgUylJl61KZyyr70Q2gVHN0Gm8EprWWZCCpLlVP6it3Fc4lYQwi9Wh
         /qCtuUDpY7oVcHD2jEXM6LfbxnLEzLwKAhDRamLCOeqPCy8vla25woJqzb0MGk/NXmjs
         ce2YzaYOUktAwJ90NpEC1a4Nn/6DiJuUkgGETl+3oqB5jwJHNV4w34OwAK47ILyimQGM
         BMYURMu3FRWBOicnJU437xCdfXXvJfDIEtSo3i07Py2hFqfB9mNCGsi0ZFSxf/aOf06h
         5dmw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1782651761; x=1783256561;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:x-gm-gg:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=RdveEr8qZ0MWpllypjGf5SGU2/zVm5rbjh5987dmoZg=;
        b=BobTXWaVex6pgPt7xn+lhYx6bnrh4l3Yi6wNhyzdQR9HmJDiieeaIOXuNTTHjYxwaI
         F2f/kt5GjaKUHh5jKM4r6A3UfXjFdvQbBqj37kmC2gDewb6UXULd4iun27M3zdVdJlfh
         dVAQxyURnRG7TSDg01MlfIAOhF6DiMcw0mK57iwN7Zf49GHo/b61W+Iv6VvgLb3Rn4Ta
         XzjNSm0ZxsH0zCoe5qI0zRxMiv8bPSWvz4QtNit10bxOhqbEIceW7+zsnrFIVcShpqS3
         LLfBwXiEt/Fa83Qbq8ojdBeKLFYOEXmkgfLuVtzvCa2l1xnPxLuclY62OWq1znhnia9k
         Y0mg==
X-Forwarded-Encrypted: i=1; AFNElJ+bPr7e45Ik9+gi7ADig4MyCKDSDdtuwFloxYDr1vPtD8nNWVb4Jp33AyJidie4//Wpq3JEDp+XTpnu@vger.kernel.org
X-Gm-Message-State: AOJu0YxlINOWkf79+Os45HwCQUCeqmc3hCpuO6fc+NLwSl8iccFVq8aI
	SEDUvVHPMYClpbksx0fY7ufzmxghZiAgOZmZyGAzUWwttLRPCGfKsxUPBqgHPGmvBBSh86FgLt0
	Zh6vpmVq8wQUU5ZMxtpi5yIcwSMAtv8NU60LNVa62gGM4VnNlAlEajsfrm/5HmvJvkkrvUq75
X-Gm-Gg: AfdE7cn2CfYtWOtkOKZ0mNNWXN0IMikdo0C0iJ/Um29KK+5lLmRLrK1Axy6OV9UPC+F
	tpbVF+fTn3mWR/OUIWGUZMRvHLn2UFqVEuHQ5dlJJMS8xnt3tXFYzJRgP5QU8rEF2HTlkTap0lR
	0cTJHlgdb87S3Rx+YutpUaXSzg+CGu+ump5aHiAI5UklHNe56YmdsA7eBJfp0RtazoMt5p5TLss
	i0jmeDSqOSJ1tsoFQQ7OAe+VFAkwXCd5hXcG+DDySHGFpvm/XuZh+Lwi8xBhflnhdNvLm+v4FGq
	ffdTVrHe8nABeDq0d9fahsgeRuxd4WKlAmcjIhq1sSxSySCXf9Nxu9isWpM5yVuMjmxUb3jSPgQ
	IEq7TVhBzPhgiRiMoVO10cT9hDl/OPZ5fok++LD1iKOsk74+AyzsW6EOI4oYTiVXRyQGKuQ5CVq
	bQvCFjN8S85VO8DTbb72eFD5VO
X-Received: by 2002:a05:6808:ec9:b0:48a:a688:4155 with SMTP id 5614622812f47-4943dab6f41mr4832897b6e.20.1782651760478;
        Sun, 28 Jun 2026 06:02:40 -0700 (PDT)
X-Received: by 2002:a05:6808:ec9:b0:48a:a688:4155 with SMTP id 5614622812f47-4943dab6f41mr4832857b6e.20.1782651759869;
        Sun, 28 Jun 2026 06:02:39 -0700 (PDT)
Received: from umbar.lan (2001-14ba-a073-af00-264b-feff-fe8b-be8a.rev.dnainternet.fi. [2001:14ba:a073:af00:264b:feff:fe8b:be8a])
        by smtp.gmail.com with ESMTPSA id 38308e7fff4ca-39aee2d6600sm11014001fa.38.2026.06.28.06.02.38
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Sun, 28 Jun 2026 06:02:38 -0700 (PDT)
Date: Sun, 28 Jun 2026 16:02:36 +0300
From: Dmitry Baryshkov <dmitry.baryshkov@oss.qualcomm.com>
To: Jason Pettit <jason.pettit@oss.qualcomm.com>
Cc: Bjorn Andersson <andersson@kernel.org>,
        Konrad Dybcio <konradybcio@kernel.org>, Rob Herring <robh@kernel.org>,
        Krzysztof Kozlowski <krzk+dt@kernel.org>,
        Conor Dooley <conor+dt@kernel.org>, linux-arm-msm@vger.kernel.org,
        devicetree@vger.kernel.org, linux-kernel@vger.kernel.org,
        Akhil P Oommen <akhilpo@oss.qualcomm.com>,
        Mahadevan P <mahadevan.p@oss.qualcomm.com>,
        Sibi Sankar <sibi.sankar@oss.qualcomm.com>,
        Jingyi Wang <jingyi.wang@oss.qualcomm.com>,
        Ananthu C V <ananthu.cv@oss.qualcomm.com>
Subject: Re: [PATCH v2 3/3] firmware: qcom: scm: Allow QSEECOM on HP
 EliteBook X G2q 14 AI
Message-ID: <jrubgkmydcyjfuva56p5qz4rc7phjrf63vki3b6g3oyfo7aqhx@uhvwg7pcjrpa>
References: <20260625-glymur-send-v2-0-00905324ffbf@oss.qualcomm.com>
 <20260625-glymur-send-v2-3-00905324ffbf@oss.qualcomm.com>
Precedence: bulk
X-Mailing-List: devicetree@vger.kernel.org
List-Id: <devicetree.vger.kernel.org>
List-Subscribe: <mailto:devicetree+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:devicetree+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20260625-glymur-send-v2-3-00905324ffbf@oss.qualcomm.com>
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYwNjI4MDExNCBTYWx0ZWRfX7ArCMz7f4ESH
 LG9HI8gZwy4X1tNw+nj96ufiJRdvtP7lN1mh5ibxmDIiIPi0GrIkipp3ew6XpAH90qHiE1n/tJ+
 MhEkM/HCR2t8IfNyj1INzt7zcAQQRe1PEuoOLVMcT37JdvLCFnA1nFALhllj49P52EIg8iDUTLU
 5dYvpfDe/aDylQohqB8Sho9EsG68o3NYquM2tC6ZMHvnwHdKB6o5ZaAunFZ712NgjYuk6AeoZlA
 HSxxi8LbFU95H5w5ca2AMqOT+ury1HCXLXw4/GEQZAmylXJDVrHnvqCcRYfWehgLV5W5n6sh8ft
 zQvOvlskSX9/pcSxFrHrD78EsqfTUNL+FYXKc9lcmsYhVfXaZKYV8/cIgXj5jDN9AmFgmnOLgsa
 Zqw0OyLU4OFLTds1xJDEUh/xkBAre8mu1oeiFs1Qq0L98GBPR3R1YZIvwBA6OplJbpSJve4eopo
 +RYOgMFUpwJ8WBVWV/Q==
X-Proofpoint-GUID: _D4ZTuzkqiV_Iru6qDK-t9XtQLzGb_Co
X-Proofpoint-Spam-Info: AW1haW4tMjYwNjI4MDExNCBTYWx0ZWRfXzlBUqLHGlz8t
 aE1S2rPfg8oeFVpka+FPFgy2P2yfRg2ZqeX1u5fzg+xnSN324z8FvpQLP3jOVPYOvZBfUHIF+Qc
 wlKqvmrCvBnO8AxUnkJ6TYZVZKouuBU=
X-Proofpoint-ORIG-GUID: _D4ZTuzkqiV_Iru6qDK-t9XtQLzGb_Co
X-Authority-Analysis: v=2.4 cv=BdnoFLt2 c=1 sm=1 tr=0 ts=6a411b71 cx=c_pps
 a=AKZTfHrQPB8q3CcvmcIuDA==:117 a=xqWC_Br6kY4A:10 a=kj9zAlcOel0A:10
 a=FelO9ux0wxsA:10 a=s4-Qcg_JpJYA:10 a=VkNPw1HP01LnGYTKEx00:22
 a=u7WPNUs3qKkmUXheDGA7:22 a=YMgV9FUhrdKAYTUUvYB2:22 a=EUspDBNiAAAA:8
 a=u3KQrUZgNMQpLfssPf0A:9 a=CjuIK1q_8ugA:10 a=zZCYzV9kfG8A:10
 a=pF_qn-MSjDawc0seGVz6:22
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1143,Hydra:6.1.125,FMLib:17.12.100.49
 definitions=2026-06-28_03,2026-06-26_01,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 priorityscore=1501 phishscore=0 clxscore=1015 suspectscore=0 bulkscore=0
 impostorscore=0 spamscore=0 lowpriorityscore=0 adultscore=0 malwarescore=0
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.22.0-2606150000 definitions=main-2606280114

On Thu, Jun 25, 2026 at 10:47:22PM -0700, Jason Pettit wrote:
> The HP EliteBook X G2q 14" Next Gen AI PC is a Snapdragon X2 Elite
> (Glymur) laptop whose firmware exposes EFI variables through QSEECOM.
> Add its board compatible to the QSEECOM allowlist so that EFI variable
> access (efivarfs) works on this machine.
> 
> Without it the kernel reports "qseecom: untested machine, skipping" and
> efivarfs is empty.
> 
> Signed-off-by: Jason Pettit <jason.pettit@oss.qualcomm.com>
> ---
>  drivers/firmware/qcom/qcom_scm.c | 1 +
>  1 file changed, 1 insertion(+)

Reviewed-by: Dmitry Baryshkov <dmitry.baryshkov@oss.qualcomm.com>


-- 
With best wishes
Dmitry
