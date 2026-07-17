Received: from mx0b-0031df01.pphosted.com (mx0b-0031df01.pphosted.com [205.220.180.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id B62593CEBAA
	for <devicetree@vger.kernel.org>; Fri, 17 Jul 2026 12:04:40 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.180.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1784289882; cv=none; b=QAcGualOXk/NrwtJPC23seS4LROBK1qhgC85PPLOtg25hBuVa3sLQplwG2hckvhdWSLWLzfHu5POzmWd68w64GwZsIQ7DvybzvqJNR9RmPNItoXLYxtikXFwxfiuI07j/2TceQVU58MTq7RJimtaJyCzQiunxlr014W3F+SwpIg=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1784289882; c=relaxed/simple;
	bh=AC9J8k7RFEQR7/Y0sar6DSCCZVXxWwtedMzJLAQhQwg=;
	h=Message-ID:Date:MIME-Version:Subject:To:Cc:References:From:
	 In-Reply-To:Content-Type; b=pKtmqG2qq/r7rmhT5a+pC+V6VemGdbiwvtBXF6dTPKFClzGA3eV4tjuBHE27QPaR7q4UQGGGJfr2XAd0vr3P845EcMXtF4RS1Z2oodBry4wSs8l02qn3rWfEN+/v2IwZ7/DzpLnOhs5AAWn/TWzdx02kZjMdfrDcdk97RHjvePw=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=N71O+fgN; dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b=gm3OLnuR; arc=none smtp.client-ip=205.220.180.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b="N71O+fgN";
	dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b="gm3OLnuR"
Received: from pps.filterd (m0279869.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 66HASuvK1632061
	for <devicetree@vger.kernel.org>; Fri, 17 Jul 2026 12:04:39 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	3o/UiwxME/vOKXx8jQNbJylnqTdyox4/O8cYGpWJcHs=; b=N71O+fgNKbXY7d5N
	++MBaNd6YNy5GwaP4YpsEU32hbFinE4GZOVGOrMXc77JWoP3IQs4qQLtMw1Y+M4H
	Ggj1IKd+A+to8V9PXrbQ1Ce8NcZ7Ggq85PUPfj1wmYjDZp1F3v++Xnywd03BjTvx
	0ePT/ElabdloIQJyh/nyPHNPaUR4bsSYO8B+24Ab2R0LT/ONU/qnETfQHnKLwsYF
	DJ54hccna5U7k3fPid9x9YI1YGcluVAoqh/nWhNNNMlMjboqCMwzADlD0xx507/W
	Cm89ULxPZ81UFhEuVsNt97OJiNflxxGFnTCtQ6R2Qw+qFFa/grRdC1WZRCZwewZi
	9zTEzA==
Received: from mail-pj1-f70.google.com (mail-pj1-f70.google.com [209.85.216.70])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4ffe0usheg-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <devicetree@vger.kernel.org>; Fri, 17 Jul 2026 12:04:39 +0000 (GMT)
Received: by mail-pj1-f70.google.com with SMTP id 98e67ed59e1d1-38e2da7191fso2582471a91.2
        for <devicetree@vger.kernel.org>; Fri, 17 Jul 2026 05:04:39 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1784289878; x=1784894678; darn=vger.kernel.org;
        h=content-transfer-encoding:content-type:in-reply-to:from
         :content-language:references:cc:to:subject:user-agent:mime-version
         :date:message-id:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=3o/UiwxME/vOKXx8jQNbJylnqTdyox4/O8cYGpWJcHs=;
        b=gm3OLnuRUqIn2Y5vhWgouJ/e3yxWn5tO7usE4W4o5GRUG/wudHKOVhZO+1b6z7ne8L
         3qija/FCKDZFfLnBa31o1eqvEWRPJrxC05SdgRQp7VDUwknVlFILE3l3degytJjkUQ4L
         GrWQ0OMLRlRlDqqXmRJHidajsllCRn2TWAyGoluXOytqWQQfUPCTpSgzA2yXhJwV05+J
         kT2vf6QZH+ffRz9jB8aLxrTLMNOGJiI4iTRZqs/Ld8zYcbg9Y7zT0p9XAl2JTbzJhikE
         iiPP1ewXu7jlRFgs4GYVgAgsXmtGadOIPTRyR+3GMjEiETT/7DhoTxIRQjQqYJuHHFew
         09Yw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1784289878; x=1784894678;
        h=content-transfer-encoding:content-type:in-reply-to:from
         :content-language:references:cc:to:subject:user-agent:mime-version
         :date:message-id:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=3o/UiwxME/vOKXx8jQNbJylnqTdyox4/O8cYGpWJcHs=;
        b=Vq3KsOm64QOV0BhA5wgRGPfIqZjo6Qrccvh1uAgZHF2ymvT4rzkxiHU40aLAr62/oh
         Vpxp9rVRxtIiXi8b1j6HmsRX+mAFhmknvkZDZQwiuPS2hFH1dC68EgOlP19GkS/Lz270
         4XQHD8Jp9XCymc1lU+qyHDndP7YSaDcYX2bj71h8vkw7mRpsv0352Omv5A8DStBDtH3K
         qkaG6xJdmzt0jbkORa1VpAK1tlCYIH7N7pCL971ud2gB47XbjjSAoikVswnXcjNohfeE
         GaZkxDbM1gD2IHWZogtPSrm2BU6tYngHJPo1BkFXsz9V0Lbuyd7yxik1IVmBETQUI5OJ
         mFcA==
X-Forwarded-Encrypted: i=1; AHgh+RrDRPGoqjBQ1ZkEjsCay25rcf5HMiWELwSv9XVzswgriwlR3mHOpdx5G1LCzxiaqROQ24eXC+f+8seW@vger.kernel.org
X-Gm-Message-State: AOJu0YyeVZw6Au+lw6muZ0/IjtglaB4Jai22UjnsI8nv5M+u6e0p4Mn0
	lmMdgWnwttD96gAii6d9EiIfwEfRXj7bT38O61Rhoo70YYRl0gxujlduerGrWkwAbRjNKiUFLJ3
	JlF/fsBnUhlmEh21Kxem69bRFy/6uEoGG+3p/l0tHZcD9B6n/2WSt2R+izlAOQzIZ
X-Gm-Gg: AfdE7cmCFCya49MYzwAHX27xo02KzkerL8fx/0ussJxQjTURLYCVfpkwA8V7Vzk1mqK
	G4ItGcUDZ9OfNj26AnnByzv1yL+Ag5q2mILSi16RzQbIaJj6W0b2JgRDO+cF+kbGhT+wTpUOjF0
	qrDdo7B5veqIUDrkR3pHr4/j8SZ25k/8lfAL5aeSD3kWJj96SlfFFYbnIEuaahe3R+ZnTKX8NeH
	acea0TBvPcIanHtNHQhHyPZSscCdKU3y3DidoJCmoQgp30VphaUwcTrBnWHasWgERfuXAuOjao0
	qeMSW11ELCAZd3rZaXTwHM/y5xdBd0CVVK2yvW6EJ90f60A3XCe9RPTkcKFl6JuuQte/XIxKHUu
	zVB8L+KcI1qsROD+1w9yF1XsQBt4aiYPk
X-Received: by 2002:a17:90b:17cc:b0:381:1f51:1ff0 with SMTP id 98e67ed59e1d1-38e4b3db1bfmr2537945a91.2.1784289878332;
        Fri, 17 Jul 2026 05:04:38 -0700 (PDT)
X-Received: by 2002:a17:90b:17cc:b0:381:1f51:1ff0 with SMTP id 98e67ed59e1d1-38e4b3db1bfmr2537871a91.2.1784289877823;
        Fri, 17 Jul 2026 05:04:37 -0700 (PDT)
Received: from [192.168.31.121] ([152.57.118.219])
        by smtp.gmail.com with ESMTPSA id 98e67ed59e1d1-38e4b0e9bb5sm960514a91.11.2026.07.17.05.04.32
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Fri, 17 Jul 2026 05:04:36 -0700 (PDT)
Message-ID: <52106bcb-9d86-4a55-b845-e5fc88040e58@oss.qualcomm.com>
Date: Fri, 17 Jul 2026 17:34:30 +0530
Precedence: bulk
X-Mailing-List: devicetree@vger.kernel.org
List-Id: <devicetree.vger.kernel.org>
List-Subscribe: <mailto:devicetree+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:devicetree+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH 2/4] dt-bindings: embedded-controller: Add Glymur QCB EC
To: Gopikrishna Garmidi <gopikrishna.garmidi@oss.qualcomm.com>,
        Bjorn Andersson <andersson@kernel.org>,
        Konrad Dybcio <konradybcio@kernel.org>, Rob Herring <robh@kernel.org>,
        Krzysztof Kozlowski <krzk+dt@kernel.org>,
        Conor Dooley
 <conor+dt@kernel.org>,
        Sibi Sankar <sibi.sankar@oss.qualcomm.com>,
        Pankaj Patil <pankaj.patil@oss.qualcomm.com>
Cc: Rajendra Nayak <rajendra.nayak@oss.qualcomm.com>,
        linux-arm-msm@vger.kernel.org, devicetree@vger.kernel.org,
        linux-kernel@vger.kernel.org
References: <20260717-glymur-qcb-v1-0-aaf1cff84aab@oss.qualcomm.com>
 <20260717-glymur-qcb-v1-2-aaf1cff84aab@oss.qualcomm.com>
Content-Language: en-US
From: Anvesh Jain P <anvesh.p@oss.qualcomm.com>
In-Reply-To: <20260717-glymur-qcb-v1-2-aaf1cff84aab@oss.qualcomm.com>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit
X-Authority-Analysis: v=2.4 cv=deWwG3Xe c=1 sm=1 tr=0 ts=6a5a1a57 cx=c_pps
 a=0uOsjrqzRL749jD1oC5vDA==:117 a=ejL5Ki+uV+h8hZHbT9l+dQ==:17
 a=IkcTkHD0fZMA:10 a=RAioF0-LDSMA:10 a=s4-Qcg_JpJYA:10
 a=VkNPw1HP01LnGYTKEx00:22 a=u7WPNUs3qKkmUXheDGA7:22 a=_glEPmIy2e8OvE2BGh3C:22
 a=EUspDBNiAAAA:8 a=j_5_zYGKYL8p0uFUWm0A:9 a=QEXdDO2ut3YA:10
 a=mQ_c8vxmzFEMiUWkPHU9:22
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYwNzE3MDEyMiBTYWx0ZWRfX4mArkTKH7v/5
 jQ3orPF3Tetrt6v7RF8+BKVLApEbFZ/mQQGbXR1OOwBQFSjuuUqQ1/6FneWQ7d+oervChYLRg4G
 D3mB3JNwRrfjMlPqHGfgzmgfj4ehgOU8leupyTJmnKypUV0eIOPxcu+G4Yd1E0s1ljCkKtEwYiP
 FDllfVMQcf1yH5JuemxwRtJ8igWBUC2M0GnsZiMMZeTAusu6x+eaD4qnuILaHYgUIt3mHAiJQ+w
 mlZM3ZGsI1pIl+Hd6S5gW5s/KDOfRLsemwfTH53fBlP0nPu76++pT3TcvJQMmyi48Ty5Hz0bS+M
 nJLNqzUsWVtNm86mU4o9SQ0AFXgLiChZYdndSC/aLNr6++VuSzCTAzBpUwaowg4rXZY5JCwSFeg
 3rdFoPaBbD+/k0Afmlx19hdp6ZtIhBrEMQMVXcRp/PSQWNASkOlDy6lwvvBkFkZYksd6Isc+R2y
 V1SSZ0GK+uMGXo/mcIw==
X-Proofpoint-ORIG-GUID: LZRc33YghnoDzH4QV6n5KZLkvxrxGa2j
X-Proofpoint-Spam-Info: AW1haW4tMjYwNzE3MDEyMiBTYWx0ZWRfX5A+QFuZ+rBlb
 Zam5SoJQs2f4WN8gnpnmH9FD+M1SnN3AeJ4n9uM6fk+6jDpvmu2y3zkPSX0WU26vqeSTfeZUfds
 /vYVXxNdy/tFMlUpQTThu5Sb5tCHNGQ=
X-Proofpoint-GUID: LZRc33YghnoDzH4QV6n5KZLkvxrxGa2j
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1143,Hydra:6.1.134,FMLib:17.12.100.49
 definitions=2026-07-17_03,2026-07-15_02,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 clxscore=1015 spamscore=0 bulkscore=0 priorityscore=1501 malwarescore=0
 lowpriorityscore=0 adultscore=0 phishscore=0 impostorscore=0 suspectscore=0
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.22.0-2606150000 definitions=main-2607170122



On 7/17/2026 5:24 PM, Gopikrishna Garmidi wrote:
> Add the qcom,glymur-qcb-ec compatible for the embedded controller on the
> Glymur QCB. It is the same EC used on the CRD.
> 
> Signed-off-by: Gopikrishna Garmidi <gopikrishna.garmidi@oss.qualcomm.com>
> ---
>  .../devicetree/bindings/embedded-controller/qcom,hamoa-crd-ec.yaml       | 1 +
>  1 file changed, 1 insertion(+)
> 
> diff --git a/Documentation/devicetree/bindings/embedded-controller/qcom,hamoa-crd-ec.yaml b/Documentation/devicetree/bindings/embedded-controller/qcom,hamoa-crd-ec.yaml
> index ac5a08f8f76d..de416057063c 100644
> --- a/Documentation/devicetree/bindings/embedded-controller/qcom,hamoa-crd-ec.yaml
> +++ b/Documentation/devicetree/bindings/embedded-controller/qcom,hamoa-crd-ec.yaml
> @@ -21,6 +21,7 @@ properties:
>        - items:
>            - enum:
>                - qcom,glymur-crd-ec
> +              - qcom,glymur-qcb-ec
>                - qcom,hamoa-iot-evk-ec
>            - const: qcom,hamoa-crd-ec
>        - enum:
> 

Reviewed-by: Anvesh Jain P <anvesh.p@oss.qualcomm.com>
-- 
Best Regards,
Anvesh

