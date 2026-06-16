Received: from mx0a-0031df01.pphosted.com (mx0a-0031df01.pphosted.com [205.220.168.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id EEF3C438FEA
	for <devicetree@vger.kernel.org>; Tue, 16 Jun 2026 10:58:43 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.168.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1781607525; cv=none; b=b3CusnLL8JSOoERhu0MP+8h9lz0V2lgLMpko5dWnHrSNlbXhkDSt1e/ngWpB61sdr0jepolNVFmcxGT6tQqYn02yOmjIIU6DBm4lcxM4SQTuHMXjLf4LN/yfdH+D+G/MoNEYa3KH7F/MIKMtaNishFnMclUsLITQ1qhtpYC0VNM=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1781607525; c=relaxed/simple;
	bh=nugoOaKRMf3oQekIT0sln2ma5j1p4Jqh1igav76elVs=;
	h=Message-ID:Date:MIME-Version:Subject:To:Cc:References:From:
	 In-Reply-To:Content-Type; b=nv+geOaXz1nw108+/geWjTHL+CaeXNeNYvyVJFrVMktrAzQR0/Hfw7p//ZIxcjMWC9uDXA6JyuDE1ta+YIWNKNSak7bzoTCZIEqeZc5sG5W+GTdVmM9AiSYEfWt9+GxR0a+jFpuR2j+3CJLgbVc176J7FeE7NjZQ5to9giwRxC4=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=meewnPli; dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b=SWijp4di; arc=none smtp.client-ip=205.220.168.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b="meewnPli";
	dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b="SWijp4di"
Received: from pps.filterd (m0279863.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 65GA9Q83249149
	for <devicetree@vger.kernel.org>; Tue, 16 Jun 2026 10:58:43 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	jfRLqZaclhFZbXOO8KCGC2IAxQG+WoSSMc2gbRu+h0c=; b=meewnPlixwAao2d2
	y0l1ye7Dgu8I1Bmw5BPsGn4F3vjyXNcc0c5gTaakROO+GTlBvDIVHZgfUMkrV5H3
	d8Sk5hAtIqP3UKqMZVlfBoXhsDHOahtAl9UILfozXYgBpGkMYhOzX5/BfKSmoSjY
	KWQmXlwMR5nim934dIoNnUnuiF7ZTcB+269/p1ybg+1VqWIx3rslh1i64EzdC9uP
	btShQlsxCImJqmkVfrpiszZmjuh8wS7P+icv9q15a4sk5xz/9tcDrjAnIbpOQQdU
	LFLUAJkk9LvY+turIbiDR/XdqtgdPBeywNhIMdT52YnxU+EPAqSrpEnz6Tra0exC
	zt4n7w==
Received: from mail-qk1-f200.google.com (mail-qk1-f200.google.com [209.85.222.200])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4eu2xs8jwy-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <devicetree@vger.kernel.org>; Tue, 16 Jun 2026 10:58:43 +0000 (GMT)
Received: by mail-qk1-f200.google.com with SMTP id af79cd13be357-9156dc90fdaso103746985a.0
        for <devicetree@vger.kernel.org>; Tue, 16 Jun 2026 03:58:43 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1781607522; x=1782212322; darn=vger.kernel.org;
        h=content-transfer-encoding:in-reply-to:from:content-language
         :references:cc:to:subject:user-agent:mime-version:date:message-id
         :from:to:cc:subject:date:message-id:reply-to;
        bh=jfRLqZaclhFZbXOO8KCGC2IAxQG+WoSSMc2gbRu+h0c=;
        b=SWijp4dieRS6xUqF03kl/OfNENNqQGFBgPxIe/MV5Mptx2f/ojFdJr+lC9H4+VbmwD
         9j/3C8WWfrWSSPrQEV4SFwlWRfJId+GNtIuNiU0hEA9DDQyGjmyqKK0iyPFuVimA0x7B
         0ChQoO+uAmk2MOcuLmRhdrE/4JHsqwd98dhASumy7JSV1Ofrcbv0MN3hqat5FitqmgwJ
         WIs3n94WubADAfVd/s+J/bVwlRJCPLUY5k9to5cCV4hB7Ir6NkB4WZHxIywoVrCUXadH
         dPyfnFJa31pGaRLxF4jisDCGkF/i9Ptw0dN26aT3hCTDpKcsME2kDWY39CE9vhGhTmjz
         We7Q==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1781607522; x=1782212322;
        h=content-transfer-encoding:in-reply-to:from:content-language
         :references:cc:to:subject:user-agent:mime-version:date:message-id
         :x-gm-gg:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=jfRLqZaclhFZbXOO8KCGC2IAxQG+WoSSMc2gbRu+h0c=;
        b=n0W2W/aw4eE5uP5ow5Wqi4r1pS6Xr6wBVmDDCMSbgeiEV7LK0qJeVaNolV5XIVgBwl
         fKGLUkqtblinds1nuTun4pjcDE7pACGFN5Su/Ab2Z0O3KDTnzO89J6dBFMYi2Jh08MIz
         CqNUiyK+FfTVNy63ZU/HMxmvkTp5WCl0bi6staQ/wz8YcVSFJWUWlnYNUajcb8Tmiue7
         P5mTTjnDjNo0VH7AmdA+ygzsRYWpsSkEQ5AlwzYoWEWVnAjZQPkD6v5LzRf92TkSSqAH
         HornNnFtWKhDezKjglvJFgnq/tAwq9WGTQzwWDhEPyQ34B6SHENg1/rRrvMM9OM4PiJ4
         UVXg==
X-Forwarded-Encrypted: i=1; AFNElJ+7cGR9fdfWR30TsqV5ZrmMd4p7RPKa2Fu6vdKCEz/dbCamphMxMgRysxY3mYJcHEwTk/VnFqao1pgk@vger.kernel.org
X-Gm-Message-State: AOJu0YxdI2ZVWWBge6O2btlEFIalvh2kb9Ab48UyUMrgVoUXAqtf2fjl
	as+vy5dlFg9/DC3LUYPXPTxB2P+KNOl0EjmVkyW1Yxw+pgqwppqPlNI5iL9csSUXe50VdmEfcs8
	dTX8tvxeyQ/huspS7zEUDYGUs6f8CNYgNikx5sQIBll3VUKDx0XYo0JeYU3flSEKaYn7keG7M
X-Gm-Gg: Acq92OGlf0diG+BxGMEtU8DmRD8YhTHIVsvBSXvTJfjJziC55sVj+3wTGDfVX4xOcnj
	XHLgX/hM2gY891RYEgrbGqC9dyIitLxWrY9p+MlOQtaijDAPsbN0el/OLD+rlpTWHqazs8e10t8
	CDo0ejfzlSzk6cAVzIQdjylBu5dCJdlq/DsYd4mPcAIcsrWZUsGqo1oYMeMiN57K+pG99KtxT6w
	q84I7gs++fVoiVA9BLFSXyAJoq+BTmcuH1SUYEYEoiVjjm1UuBj4jjDTP5jlD8fN1ct3roqV9/L
	LJ5YLSN68homUZfd1ZQeBE9bTIGGQFVkQjdk2vpPQ1Io82/f/+jh/xpKXZg41UML2eHWa9yZNJl
	gBvbLB6yKYTXjFTaQsuccWbZTyWVMvt/Zy9+Q8z0em6S/cQ==
X-Received: by 2002:a05:620a:7085:b0:8cf:d953:b4ec with SMTP id af79cd13be357-9161bc91d3emr1562468485a.3.1781607522239;
        Tue, 16 Jun 2026 03:58:42 -0700 (PDT)
X-Received: by 2002:a05:620a:7085:b0:8cf:d953:b4ec with SMTP id af79cd13be357-9161bc91d3emr1562465885a.3.1781607521732;
        Tue, 16 Jun 2026 03:58:41 -0700 (PDT)
Received: from [192.168.120.170] ([178.235.128.140])
        by smtp.gmail.com with ESMTPSA id a640c23a62f3a-bfdb44208c9sm640321866b.13.2026.06.16.03.58.39
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Tue, 16 Jun 2026 03:58:40 -0700 (PDT)
Message-ID: <1ca9b0e9-3eaf-4d1b-bc63-410f4ec7b14e@oss.qualcomm.com>
Date: Tue, 16 Jun 2026 12:58:38 +0200
Precedence: bulk
X-Mailing-List: devicetree@vger.kernel.org
List-Id: <devicetree.vger.kernel.org>
List-Subscribe: <mailto:devicetree+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:devicetree+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v3 RESEND 2/5] arm64: dts: qcom: Add device tree for Nord
 SoC series
To: Shawn Guo <shengchao.guo@oss.qualcomm.com>,
        Bjorn Andersson <andersson@kernel.org>
Cc: Rob Herring <robh@kernel.org>, Krzysztof Kozlowski <krzk+dt@kernel.org>,
        Conor Dooley <conor+dt@kernel.org>,
        Konrad Dybcio <konradybcio@kernel.org>,
        Dmitry Baryshkov <lumag@kernel.org>,
        Bartosz Golaszewski <bartosz.golaszewski@oss.qualcomm.com>,
        Deepti Jaggi <deepti.jaggi@oss.qualcomm.com>,
        Harshal Dev <harshal.dev@oss.qualcomm.com>,
        Herbert Xu <herbert@gondor.apana.org.au>, devicetree@vger.kernel.org,
        linux-arm-msm@vger.kernel.org, linux-kernel@vger.kernel.org
References: <20260526051300.1669201-1-shengchao.guo@oss.qualcomm.com>
 <20260526051300.1669201-3-shengchao.guo@oss.qualcomm.com>
Content-Language: en-US
From: Konrad Dybcio <konrad.dybcio@oss.qualcomm.com>
In-Reply-To: <20260526051300.1669201-3-shengchao.guo@oss.qualcomm.com>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit
X-Proofpoint-ORIG-GUID: 5yE9wremFlIJvoorfkzX6uRJ1LpTLFV4
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYwNjE2MDExMSBTYWx0ZWRfX8y1/XrV68BQR
 Z1j9vsxOHmaGQqkbIdXlcyB79MRTPt4dX4cYsR4vvJj+Vpd1qw4lK5trtIlE9pOTP60DaDEEYKf
 Tva84ivBnlUcTye638ThHc9S1ahaa6q4I6ZvkmX+zyNbauzt6m7j8zHKYiixcCAwkQDtDqTWPRc
 +1tSBwLAOPF7lvKEw+rgVGYQWxUnUg5wjqU2fCCWUab4/2gbZbT0P3UwgyZ8ju2hBV5w+cIW+sL
 hnxKparKwrk/rwbpfJsAwXju9A3GlarMwfX0GWbAXItONEMyCJ53dzylsghpy3lOurxcS1HppCj
 ciOj5RO9l45wd7frTr3lwXh8WRUTLzvaHfJbw+5qw0NtHnx/jNz7/0xMEISJEJmUSfka1q02vXf
 I6wJpLxNWqgxN/aanw1yE1X6CSxhvW2nkZX4sjq+yBufTXH1gqQ2NhUmuXPNXoeoVgB5LxmZYiz
 Rb0aR1qLRL2AWJK0XUQ==
X-Proofpoint-Spam-Info: AW1haW4tMjYwNjE2MDExMSBTYWx0ZWRfX3pOQnzpVXNiA
 4uTab7QVF+HscHKvUgfvAEuny12AELKPrZXHlZTSn6mvzdlqRiRzWeoMiFuVGaKkDMpcI3ZglXp
 DdB4+wk1QpLWEOL8sDfCvOkLwAeH63g=
X-Authority-Analysis: v=2.4 cv=MdJcfZ/f c=1 sm=1 tr=0 ts=6a312c63 cx=c_pps
 a=hnmNkyzTK/kJ09Xio7VxxA==:117 a=PRfkaYvzSr8QmIIGAkY2Sg==:17
 a=IkcTkHD0fZMA:10 a=FelO9ux0wxsA:10 a=s4-Qcg_JpJYA:10
 a=VkNPw1HP01LnGYTKEx00:22 a=u7WPNUs3qKkmUXheDGA7:22 a=yOCtJkima9RkubShWh1s:22
 a=EUspDBNiAAAA:8 a=tDYwhEyV-ROJ_5m0-t4A:9 a=QEXdDO2ut3YA:10
 a=PEH46H7Ffwr30OY-TuGO:22
X-Proofpoint-GUID: 5yE9wremFlIJvoorfkzX6uRJ1LpTLFV4
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1143,Hydra:6.1.125,FMLib:17.12.100.49
 definitions=2026-06-16_03,2026-06-15_04,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 bulkscore=0 impostorscore=0 adultscore=0 lowpriorityscore=0 clxscore=1015
 malwarescore=0 spamscore=0 priorityscore=1501 phishscore=0 suspectscore=0
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.22.0-2606040000 definitions=main-2606160111

On 5/26/26 7:12 AM, Shawn Guo wrote:
> Add base device tree include (nord.dtsi) for the Nord SoC series
> describing the core hardware components:
> 
>  - 18 Oryon (qcom,oryon-1-5) cores in three clusters, with PSCI-based
>    power management and CPU/cluster idle states
>  - ARM GICv3 interrupt controller with ITS
>  - TLMM GPIO/pinctrl controller
>  - 8 TSENS thermal sensors with thermal zones
>  - 3 APPS SMMU-500 instances
>  - 3 QUPv3 GENI SE QUP blocks
>  - PDP SCMI channel and mailbox
>  - Watchdog, TRNG and TCSR
>  - Reserved memory, CMD-DB and firmware SCM
>  - PSCI and architected timers
> 
> Co-developed-by: Deepti Jaggi <deepti.jaggi@oss.qualcomm.com>
> Signed-off-by: Deepti Jaggi <deepti.jaggi@oss.qualcomm.com>
> Co-developed-by: Bartosz Golaszewski <bartosz.golaszewski@oss.qualcomm.com>
> Signed-off-by: Bartosz Golaszewski <bartosz.golaszewski@oss.qualcomm.com>
> Signed-off-by: Shawn Guo <shengchao.guo@oss.qualcomm.com>
> ---

[...]

> +		pdc: interrupt-controller@b220000 {
> +			compatible = "qcom,nord-pdc",
> +				     "qcom,pdc";
> +			reg = <0x0 0x0b220000 0x0 0x10000>;
> +			qcom,pdc-ranges = <0 745 43>, <67 543 31>,
> +					 <98 609 32>, <130 717 12>,
> +					 <142 251 5>, <147 796 16>;

One triple per line would be neat

Konrad
