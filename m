Received: from mx0a-0031df01.pphosted.com (mx0a-0031df01.pphosted.com [205.220.168.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 52A6148EBE0
	for <devicetree@vger.kernel.org>; Fri, 25 Sep 2026 10:19:47 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.168.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1790331589; cv=none; b=H+2gPyIlaw7hQVVGYjzRPVmdyxXYs92OerIVVlDydCqz8/144afDcVpZCfUttDuAk/rBEa+Ox4lgsD+ojGq/9MDnJxLuH339NJNEadS9kyPz9B6hbtpbHoZKlrLzaJkNdeIDuCIxCFXdwy7S0xfu85YRASR1SrzssuWheqHiro8=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1790331589; c=relaxed/simple;
	bh=JRFfmUzA+SnkmvIL77q5lOVN8GiVOkN2e8RTdRhku24=;
	h=Message-ID:Date:MIME-Version:Subject:To:Cc:References:From:
	 In-Reply-To:Content-Type; b=URy337dX68a0ptB71/hgrs9y4G4uwFzFujmtczKM8vnUTkdOHHbk+6XX40xStsVYnKPjbVLEHsGlxKJfkuc9xs24qCSMdPvtZuvcKAB1slxdPw/Acnpb7CCLSbD5g0mZ2z5n9tZHn+MB1JSWKudasaXm09TLto7ghpK4W+eYKPI=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=c82dJQwg; dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b=Nk7rqHIw; arc=none smtp.client-ip=205.220.168.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b="c82dJQwg";
	dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b="Nk7rqHIw"
Received: from pps.filterd (m0279865.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 68P4YOaF1055608
	for <devicetree@vger.kernel.org>; Fri, 25 Sep 2026 10:19:47 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	ClUZQgHA+YXoNCn8HMzXL9kMN9fbDxeAKcAHr9vfWms=; b=c82dJQwgJaxCKTLQ
	CGw5sM33mKWVibfXzRzB6bWaocYOcqSmaYcVUlPBOU0Pm94fs7khL3sxTkhvXJTV
	BLp3ZpXhyaBDqLwoBcrfHwsONrcOpzlP1kq7itJ9eSx/8ijg7DcXP/kg4s1h/SHe
	pZXE0uocI6UGEPncqyxIWEXqnBiT0QQDx08cO3DZ5JDttsikTgrY5z02mhWkz0Z4
	LcpFQwElqmek6P7cJGMDYcJv9YkyuA+5wCzof2FMhJp/3EtWavc5uu7McB3T04K4
	Komc0yVLl2UbC/QcPOjUa2hFt7pXOY+e2K0IugK/yfrJkgmc/rnKsZmuDFZH0kLM
	iZGhLA==
Received: from mail-qk1-f200.google.com (mail-qk1-f200.google.com [209.85.222.200])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4gwce79yuf-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <devicetree@vger.kernel.org>; Fri, 25 Sep 2026 10:19:47 +0000 (GMT)
Received: by mail-qk1-f200.google.com with SMTP id af79cd13be357-93bfab40895so15791485a.3
        for <devicetree@vger.kernel.org>; Fri, 25 Sep 2026 03:19:47 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1790331586; x=1790936386; darn=vger.kernel.org;
        h=content-transfer-encoding:content-type:in-reply-to:from
         :content-language:references:cc:to:subject:user-agent:mime-version
         :date:message-id:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=ClUZQgHA+YXoNCn8HMzXL9kMN9fbDxeAKcAHr9vfWms=;
        b=Nk7rqHIwDlvcucwdMpV2Qlc8msXSyqmelk6hrWrg0KT1f6Iml4n4V36/pQERY5W7P0
         jBs1x0NoMj2dNv6DiHTBvJZD1CcE1Q61OdrdqYyA4HmYw5QjmgVi6PzuwE14VVrHranb
         n/DLp17+uu4w9E3R0T8Qg6h96xJX0uQXDc+3xaJx8IPcXNYfPf0M9uLbxld6tyszQ5O6
         arHTNwWxjfn7KQ39UkvCNaxbXJTucxiIh3MG6g+0OmY8rgzbZPn6oRvns8KOb4Ttjmgk
         ZS9YXvGmxlivTuANXBfLtXuVMW1PwiqyMhVf38qr4JXO/HKtNxzuuY3aaCieShtOnRa4
         j1FQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1790331586; x=1790936386;
        h=content-transfer-encoding:content-type:in-reply-to:from
         :content-language:references:cc:to:subject:user-agent:mime-version
         :date:message-id:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=ClUZQgHA+YXoNCn8HMzXL9kMN9fbDxeAKcAHr9vfWms=;
        b=PwSpXLabN17P8MHMCn3Z1vzud0ame6XvDIz987+pIBXoGul4tvpMFSvosgebplZ3kV
         DU7J7/Lg2lMUcmwdpDUvcvrwP+qemRSUy0OFuW3iYd8PgiX7HSrjK6GJlel3LNEmxQ3l
         fBPg9+Ae2Yzv4gHVWVeUij2fxHdQN//Ud+pzKsbIkJoCm0Uq9OGZb8qgmuCfooabGzzj
         N5SiX7A61xeycBYXyBYV8LCLQfWvW3Fmkex41Us5l34RSZ47PiKsmGEOHrviHQEySS+w
         mjzgkifJ8+g0RpmSYEZoBc4YXbDCKxLTKtVrjbrIwq19bzxJ/s4UDlOwSpzB1Iicg+n6
         zlrA==
X-Forwarded-Encrypted: i=1; AKwUvBziurN6LQkfcQAE9M0eviojnkUkaCIPLiVV1YT+DPBnejEsuJtvspH2sWi5z5lSXi/iSGQwZHFtUjHq@vger.kernel.org
X-Gm-Message-State: AFuF++nfCQUg/37MxF74rXT8MPCoEKJzrEzqfE/Ctvxu4v5iqgN/sBhv
	yJjXP+mexpv5TUSZFbKK8Q8hEIP1mvlhz9i3PkTxqWjPviqLKcw81ZvpvDzdyMR2IfZF+Dimd90
	JCBMX4z8yuEl/zoeXPlH6roNAYoRWar8y7AOQun4Tc6g3RCnu5+X6hhDPC7ukyHPo
X-Gm-Gg: AYBFou0KKaXR4jQDjJdYjbKCmG3gSkBHwIvKi3BWFSqlVUPgtD1xjHyvJj6F5uvBjyv
	xFzTuGeIarOHI1pxYWWZGABRxvLrC+/NHPnahtn/oueDALg1PIOuao0GbPGaZEUmcP9cVNOhFCj
	J/Vy5IwvjKRP44v9Z0NF8VoQgqZofQqtE6vuk7ZJt8EtobOsGeQeYSaSTdlrh/ZYWXpHgxS/tfv
	vTGLFkJfC/bph5rbUoq7uAVkFidwzOu0TlOrZAcfp9o46kvc4zJbcOzWmuoAnUOLHJpsg+yXNCS
	VAYCfsO3wwHwiWw495U4p/v/gCo8pzN65+esmLJvgE/HeL7x1sD3oPUOAhtqm21twSFdTkRvD9a
	vLw4Sarh7ayISBcobB5dK0w==
X-Received: by 2002:a05:620a:6f06:b0:93a:19cc:107a with SMTP id af79cd13be357-93c43b941d0mr350440485a.1.1790331586218;
        Fri, 25 Sep 2026 03:19:46 -0700 (PDT)
X-Received: by 2002:a05:620a:6f06:b0:93a:19cc:107a with SMTP id af79cd13be357-93c43b941d0mr350436385a.1.1790331585697;
        Fri, 25 Sep 2026 03:19:45 -0700 (PDT)
Received: from [192.168.202.12] ([178.235.128.140])
        by smtp.gmail.com with ESMTPSA id a640c23a62f3a-c2ae74815easm93578766b.23.2026.09.25.03.19.40
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Fri, 25 Sep 2026 03:19:44 -0700 (PDT)
Message-ID: <6c8c9823-4d22-49b2-9c50-476f61110def@oss.qualcomm.com>
Date: Fri, 25 Sep 2026 12:19:38 +0200
Precedence: bulk
X-Mailing-List: devicetree@vger.kernel.org
List-Id: <devicetree.vger.kernel.org>
List-Subscribe: <mailto:devicetree+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:devicetree+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH 2/5] arm64: dts: qcom: glymur: fix Adreno X2-90 GMU
 compatible
To: Akhil P Oommen <akhilpo@oss.qualcomm.com>,
        Rob Clark <robin.clark@oss.qualcomm.com>,
        Dmitry Baryshkov
 <lumag@kernel.org>,
        Abhinav Kumar <abhinav.kumar@linux.dev>,
        Jessica Zhang <jesszhan0024@gmail.com>, Sean Paul <sean@poorly.run>,
        Marijn Suijten <marijn.suijten@somainline.org>,
        David Airlie <airlied@gmail.com>, Simona Vetter <simona@ffwll.ch>,
        Maarten Lankhorst <maarten.lankhorst@linux.intel.com>,
        Maxime Ripard <mripard@kernel.org>,
        Thomas Zimmermann <tzimmermann@suse.de>, Rob Herring <robh@kernel.org>,
        Krzysztof Kozlowski <krzk+dt@kernel.org>,
        Conor Dooley <conor+dt@kernel.org>,
        Bjorn Andersson <andersson@kernel.org>,
        Konrad Dybcio <konradybcio@kernel.org>,
        Abel Vesa <abelvesa@kernel.org>
Cc: Krzysztof Kozlowski <krzk@kernel.org>, linux-arm-msm@vger.kernel.org,
        dri-devel@lists.freedesktop.org, freedreno@lists.freedesktop.org,
        devicetree@vger.kernel.org, linux-kernel@vger.kernel.org,
        Jie Zhang <jie.zhang@oss.qualcomm.com>
References: <20260925-mahua-gpu-v1-0-0fa0bfd8d315@oss.qualcomm.com>
 <20260925-mahua-gpu-v1-2-0fa0bfd8d315@oss.qualcomm.com>
Content-Language: en-US
From: Konrad Dybcio <konrad.dybcio@oss.qualcomm.com>
In-Reply-To: <20260925-mahua-gpu-v1-2-0fa0bfd8d315@oss.qualcomm.com>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit
X-Proofpoint-GUID: _8nfIz3Xqnr6ElIh1CCn1Xyqtxa21BY-
X-Proofpoint-ORIG-GUID: _8nfIz3Xqnr6ElIh1CCn1Xyqtxa21BY-
X-Authority-Analysis: v=2.4 cv=NJFAaE6g c=1 sm=1 tr=0 ts=6ab64ac3 cx=c_pps
 a=hnmNkyzTK/kJ09Xio7VxxA==:117 a=PRfkaYvzSr8QmIIGAkY2Sg==:17
 a=IkcTkHD0fZMA:10 a=VdqzKS8jKosA:10 a=s4-Qcg_JpJYA:10
 a=VkNPw1HP01LnGYTKEx00:22 a=u7WPNUs3qKkmUXheDGA7:22 a=Um2Pa8k9VHT-vaBCBUpS:22
 a=EUspDBNiAAAA:8 a=QDjCMyA0A8yHJihhU1wA:9 a=QEXdDO2ut3YA:10
 a=PEH46H7Ffwr30OY-TuGO:22
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYwOTI1MDA0MSBTYWx0ZWRfXwGNZkbOm/0tj
 RfaUE6aou/+dkXX6zhBix+GQQb+mXl7Xw1JsvumHyDzCMC5dwFWCLlqdtac4ELRJRI2K0PLRLTo
 fDEhDffxn+ZlRE37Q1s+U+Yh8RNE0WWu7LkjMJ7y+t12rJxQQQWRqMX0HjguruLoqEEidZdLNRr
 0ipx8EeFYwdUKpbABAzzFJFOTvdSNhNVp+EjD66vwIRX0lxfn2dO+XCsa6Tx5xkVd3sC2p8N2Mr
 IyEnoJTEiopfChav+ZavG+W8HRgU1fQEy+gccYclYNRTzdQ8TIWZiwxlF+yX5r6WnJoaJLXGg7l
 AUageHtp8RqJoh66IP19xxQ/nXQdZlDKgz8KFZzc4andwGjufrF4FOpgZKsE2baF60ZR183jTBG
 NL/Fsu9lm3ReYRGIucbaGKxIbR/FBfhfcQWGPsBWCDdH6GaZelmhwolEpzuDD3Bwut900M8IEIH
 TL1IV4XuIpCGv9zJvyw==
X-Proofpoint-Spam-Info: AW1haW4tMjYwOTI1MDA0MSBTYWx0ZWRfX2T2dULFbxyg7
 dvUG2fBQNXHjWqXD8AR+nL8fi1Tssa/2nnRjvNURL+fEqQ+OfPuvuZ7kq88ZkY3tzKnptXESvMi
 pAYnqvIaJ24x/0B8xFv3zyVnxWcc33E=
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1176,Hydra:6.1.134,FMLib:17.12.100.49
 definitions=2026-09-25_02,2026-09-21_02,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 adultscore=0 malwarescore=0 priorityscore=1501 bulkscore=0 spamscore=0
 phishscore=0 suspectscore=0 clxscore=1015 impostorscore=0 lowpriorityscore=0
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.22.0-2609040000 definitions=main-2609250041

On 9/24/26 11:14 PM, Akhil P Oommen wrote:
> From: Jie Zhang <jie.zhang@oss.qualcomm.com>
> 
> The Glymur's GMU compatible was set to the wrong string
> qcom,adreno-gmu-x285.1. Correct it to qcom,adreno-gmu-x290.1.
> 
> Fixes: b6ff8cec8aaa ("arm64: dts: qcom: Add GPU support for Glymur")
> Signed-off-by: Jie Zhang <jie.zhang@oss.qualcomm.com>
> Signed-off-by: Akhil P Oommen <akhilpo@oss.qualcomm.com>
> ---

Reviewed-by: Konrad Dybcio <konrad.dybcio@oss.qualcomm.com>

Konrad
