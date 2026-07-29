Received: from mx0b-0031df01.pphosted.com (mx0b-0031df01.pphosted.com [205.220.180.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id E6DAC472F80
	for <devicetree@vger.kernel.org>; Wed, 29 Jul 2026 12:15:35 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.180.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1785327338; cv=none; b=ExdLdMyn7V7UssXW098FogvLRodqGpy1BDsXg7g6ZJxjoP2gYkJT9iamGHp1wv8zDCbyng7sH807V+64hSV0jlfzRYBKWKKpuTOjgALbXFy+/Khuru2UWGe7/zqH5JtFoLCXzMrqWkyBXMdZAEacevPY2eHGvMMBnCrydgpZwJk=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1785327338; c=relaxed/simple;
	bh=s1gO6f09FjP880JK9PFOp1s4Jhd3meLkvmePYpvEaME=;
	h=Message-ID:Date:MIME-Version:Subject:To:Cc:References:From:
	 In-Reply-To:Content-Type; b=EOA2/u1bIGwsnsxIsbMcM8PzODQCIKpGG6piVRuANA5uYs2ox/4ziP4TcysCo3XXUfvlgKtxXae7HPJy2X7q+bmOJROlk5+pSy2ZYYgS9dyA1pMk9nLZcgS2DLxSwm11778h/jRxlgs706EBjEmYzpCLL80xm7Il9gbxQHOVlsE=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=Ntcstcyb; dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b=Hm6iTHu/; arc=none smtp.client-ip=205.220.180.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b="Ntcstcyb";
	dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b="Hm6iTHu/"
Received: from pps.filterd (m0279870.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 66TBXLeU1847303
	for <devicetree@vger.kernel.org>; Wed, 29 Jul 2026 12:15:34 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	ZElkTGKf83zLq2SbG+PkttDl3n41jxZHeLynZGXTAho=; b=NtcstcyblUs8obhs
	ysvKMRRidoHCETaaiqeNG1BgfTAhsrZ7tn6uONKNJ2R5iOTNYTgKyATa4JiuzdvS
	25JBLvKw21O3BtL//eNybZzx4/q50Bw5zvanJ6/qxe8ojF04mTT/V8R4iQ0IfGY/
	sw7K7ob3WaSYIZEInzq5qhpIgYcJzl0GQAn21rXnGEO0GlQ1Bijcnqu9065Z9qxW
	EZr8Hy9HHJtDjamdro3PTTyG/ZorrLNnSv45UU1gj85PXfuzEmACEv67nsYMun76
	2k6+xJmzM38uktQDtjGCqlHRPgssO3LCQliLQClRB50coXs4bMD7zMfnqYWVT8Ln
	5MSOKQ==
Received: from mail-qt1-f200.google.com (mail-qt1-f200.google.com [209.85.160.200])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4fqgrcg5j1-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <devicetree@vger.kernel.org>; Wed, 29 Jul 2026 12:15:34 +0000 (GMT)
Received: by mail-qt1-f200.google.com with SMTP id d75a77b69052e-51e9d892f0dso2712391cf.2
        for <devicetree@vger.kernel.org>; Wed, 29 Jul 2026 05:15:34 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1785327334; x=1785932134; darn=vger.kernel.org;
        h=content-transfer-encoding:content-type:in-reply-to:from
         :content-language:references:cc:to:subject:user-agent:mime-version
         :date:message-id:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=ZElkTGKf83zLq2SbG+PkttDl3n41jxZHeLynZGXTAho=;
        b=Hm6iTHu/bd5plTnRZkjQKRYeVQIoCUMn1YDxOf3k6BHFP4VZu8slWD9oCBQVeeG6Nv
         bLaDHaHeuoHoMEkGA2o+ISqsJwuuhJqf6vc7bx6kL8PhgM7wNzOJqSzf35ifa3hHHfi8
         +n/vAVGFCNHFX97OEJY2b9XqdEJYWRdSUoNtrcvnyjfG1IIj/sEzVkqpzJc1MDIbdqSg
         VkL9HeYtaWGQyvjgPHnwvcTUrbZvAiRSVO0xnMZNXDC1SJtnavSfer3pAaDUF9wOfZnL
         qId7stbJ92NZATa/bToJkCcOrOmlHMqxDypQS+uobsp17MC2iLCjR8Zpz/Id5iDfhKGT
         GM0g==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1785327334; x=1785932134;
        h=content-transfer-encoding:content-type:in-reply-to:from
         :content-language:references:cc:to:subject:user-agent:mime-version
         :date:message-id:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=ZElkTGKf83zLq2SbG+PkttDl3n41jxZHeLynZGXTAho=;
        b=LRerIIC1d30nVl9fZ+huNe8yMMCWXgTtF6pliBjemIMSN3Q5JY1ueJRlmfdmutdVoZ
         nVOMMM/FAYEHp3qh2B8uRTBCXauFUdN70thlRZ6g1Keg9Y/ZIQRxciDVwlykRZTMGQ+N
         Gt+kXzjQj5eghDV9KFl5VWWudK1I7ASERYK1XT+/u080XK3XKA54/6Z3KEn3qfsjF7+f
         bb1KzMCfgyEntIQ/RZNZhpW0SQWY41/hqrOcPSjyQHLS9VF535OD7h4JWOFuB7avpVw3
         cOKUlfoqhkUUEoZq+p240Djbm4U3wwL2ze0eNlt20fJ9s4akCQ2F7EDBradLCKN+BgYe
         fvVg==
X-Forwarded-Encrypted: i=1; AHgh+RozmPu8kP412Qc2jqgwVz3f9aJkGYfpQ4vmLurrheVEZ93jhPb7vBb2LLDwaWQDDmzGTDhwm4BeDq+s@vger.kernel.org
X-Gm-Message-State: AOJu0YxezW7Nj44xDips15ESyC/3TklRj9YPqbv6Zs8CVNsxmY0eDf2j
	QF/9P0r89cIziQetzPQ1THeZLL3e3mgV+VXzGgtmGsmwFsJXdMgaLSVtjUBvIM7gFkRFUTvaM5w
	cv2mPGdDuTRVnKM2RLD6MBvYM8mAVZdBcFSRfjtdi4ofjjtUxRaX9psM6rpGRVPDK
X-Gm-Gg: AR+sD10kO5Bg8WKiyodMsDUdzSGoTV70KvhafmMdpkI90fEf461JL6opq2bOixXrliH
	Cs0UOUk/18wlLblJs+bmx4bSgo/YltBpJ0OIPDkabPEAs7YxSjHl8RwjCsZRJKkJa13NEzPsCOX
	GlXuil8fcCekWK4kj0v0VjFX2wWvx6AsKFe9TKsY33R+R4TJ1HvGYMKEqW/O3g8bMqYUNSpubi6
	khWxuPO6yPrruDSZtUbOcUsx0S+AsZY58mg+vgIjtjQ5THtDPHUtV96AdM6IfX5BuqHpiyRLiU1
	d//+E7ezR0LXhjukZy5Bs0piiSmK0thmbahmFDtAuoMlf6EW+jFedgpYFpxmzf67t0rC8T71TKP
	vuIWwJGiaBSNV5gvRKT5w3wSo
X-Received: by 2002:a05:622a:82:b0:51a:8079:795e with SMTP id d75a77b69052e-529d70f64dbmr56395201cf.4.1785327331878;
        Wed, 29 Jul 2026 05:15:31 -0700 (PDT)
X-Received: by 2002:a05:622a:82:b0:51a:8079:795e with SMTP id d75a77b69052e-529d70f64dbmr56389371cf.4.1785327328171;
        Wed, 29 Jul 2026 05:15:28 -0700 (PDT)
Received: from [192.168.120.193] ([178.235.128.140])
        by smtp.gmail.com with ESMTPSA id a640c23a62f3a-c1f83f4e079sm104234966b.30.2026.07.29.05.15.24
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Wed, 29 Jul 2026 05:15:27 -0700 (PDT)
Message-ID: <207866a8-bb1d-412f-9cef-3a597762a949@oss.qualcomm.com>
Date: Wed, 29 Jul 2026 14:15:23 +0200
Precedence: bulk
X-Mailing-List: devicetree@vger.kernel.org
List-Id: <devicetree.vger.kernel.org>
List-Subscribe: <mailto:devicetree+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:devicetree+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v2 6/9] arm64: dts: qcom: eliza: Add GPU SMMU node
To: Akhil P Oommen <akhilpo@oss.qualcomm.com>,
        Rob Clark <robin.clark@oss.qualcomm.com>, Sean Paul <sean@poorly.run>,
        Konrad Dybcio <konradybcio@kernel.org>,
        Dmitry Baryshkov <lumag@kernel.org>,
        Abhinav Kumar <abhinav.kumar@linux.dev>,
        Jessica Zhang <jesszhan0024@gmail.com>,
        Marijn Suijten <marijn.suijten@somainline.org>,
        David Airlie <airlied@gmail.com>, Simona Vetter <simona@ffwll.ch>,
        Maarten Lankhorst <maarten.lankhorst@linux.intel.com>,
        Maxime Ripard <mripard@kernel.org>,
        Thomas Zimmermann <tzimmermann@suse.de>, Rob Herring <robh@kernel.org>,
        Krzysztof Kozlowski <krzk+dt@kernel.org>,
        Conor Dooley <conor+dt@kernel.org>,
        Bjorn Andersson <andersson@kernel.org>, Will Deacon <will@kernel.org>,
        Robin Murphy <robin.murphy@arm.com>,
        "Joerg Roedel (AMD)" <joro@8bytes.org>
Cc: Puranam V G Tejaswi <puranam.tejaswi@oss.qualcomm.com>,
        Abel Vesa <abel.vesa@oss.qualcomm.com>, linux-arm-msm@vger.kernel.org,
        dri-devel@lists.freedesktop.org, freedreno@lists.freedesktop.org,
        linux-kernel@vger.kernel.org, devicetree@vger.kernel.org,
        linux-arm-kernel@lists.infradead.org, iommu@lists.linux.dev
References: <20260718-eliza-gpu-v2-0-64379dbebd7a@oss.qualcomm.com>
 <20260718-eliza-gpu-v2-6-64379dbebd7a@oss.qualcomm.com>
Content-Language: en-US
From: Konrad Dybcio <konrad.dybcio@oss.qualcomm.com>
In-Reply-To: <20260718-eliza-gpu-v2-6-64379dbebd7a@oss.qualcomm.com>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit
X-Proofpoint-GUID: YPxA3DAkDpR0cODdP-AzdtvyT-rRdaiJ
X-Authority-Analysis: v=2.4 cv=Id+3n2qa c=1 sm=1 tr=0 ts=6a69eee6 cx=c_pps
 a=JbAStetqSzwMeJznSMzCyw==:117 a=PRfkaYvzSr8QmIIGAkY2Sg==:17
 a=IkcTkHD0fZMA:10 a=RAioF0-LDSMA:10 a=s4-Qcg_JpJYA:10
 a=VkNPw1HP01LnGYTKEx00:22 a=u7WPNUs3qKkmUXheDGA7:22 a=gowsoOTTUOVcmtlkKump:22
 a=EUspDBNiAAAA:8 a=QDjCMyA0A8yHJihhU1wA:9 a=QEXdDO2ut3YA:10
 a=uxP6HrT_eTzRwkO_Te1X:22
X-Proofpoint-ORIG-GUID: YPxA3DAkDpR0cODdP-AzdtvyT-rRdaiJ
X-Proofpoint-Spam-Info: AW1haW4tMjYwNzI5MDEwMSBTYWx0ZWRfXwH586/aEDYm6
 EkYbV0qPz5SuVvorqNhcdCyOKznTNX5+AaOy0r23vBfV0oIBs90eF9CaRVBcyzd9TWx8uWMtxND
 Wt3kCVR/12IZObtAnGSrTNoZPy0dBxY=
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYwNzI5MDEwMSBTYWx0ZWRfX74+Xx16lwdkU
 4q+kilCQ7PhUlHifgRo8Yix5D8bN+b/Ewllp2kLYW8LTWIIRcY8fBNXLIljrdUFFxu9m3e1E2BW
 GMtd4yyc7Wh1ZF6Jphxc35S8zZfKyk1ewxm3XcmI6Gh27iNw16aKymf/Vrvt009BlgGjnDDXX0H
 gCmI+quRiUzpy1o5zLC2KJZL8OMhOk2Qjg69ah067UaJw28NGCLgLtlmHdao4XhV3LYAKMg3kOx
 X/R2ijqjqbfLYcPXvfWihauES0/bt1davnl966pqhjzbY6fypdS7BG0nu921fWiDqc+r4FdGLMw
 I/tnBSW6lhVFQjc6fo8ivCNN+zDuCMgerO0CkzPhHWcbby7rkdfgPfTome+kRB23zzlaIkhwowH
 3jrBWt7RQ+VVZt08m7nbBRa8Dfr7eTl8WMv9bSdEmztMoKn7KcyiBpStAvVzOviWD/68Tk24AeP
 AcJfKTonxSDLl4/38yQ==
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1143,Hydra:6.1.134,FMLib:17.12.100.49
 definitions=2026-07-29_04,2026-07-28_02,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 phishscore=0 priorityscore=1501 impostorscore=0 suspectscore=0 clxscore=1015
 adultscore=0 malwarescore=0 spamscore=0 bulkscore=0 lowpriorityscore=0
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.22.0-2606150000 definitions=main-2607290101

On 7/17/26 10:41 PM, Akhil P Oommen wrote:
> From: Abel Vesa <abel.vesa@oss.qualcomm.com>
> 
> Add the nodes to describe the GPU SMMU.
> 
> Signed-off-by: Abel Vesa <abel.vesa@oss.qualcomm.com>
> Signed-off-by: Akhil P Oommen <akhilpo@oss.qualcomm.com>
> ---

Reviewed-by: Konrad Dybcio <konrad.dybcio@oss.qualcomm.com>

Konrad
