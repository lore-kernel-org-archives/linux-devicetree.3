Received: from mx0a-0031df01.pphosted.com (mx0a-0031df01.pphosted.com [205.220.168.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 9C8223D5652
	for <devicetree@vger.kernel.org>; Fri, 24 Jul 2026 08:18:20 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.168.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1784881103; cv=none; b=elTsv0qjMugM/gXnxlBNonAUmOY3Me9wSNNG0pkDyXdmxO4I6wsIElttjv3LCmN0tZRq1A1zuodjbVd57IdYr4iYNoyAgEKnF2fTLxSdx6+itowfdbKXCDe9Uok86JhtE3r42B6rohcogWXBqzpyIjtP9bjZegszTcNVF91tJ1Y=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1784881103; c=relaxed/simple;
	bh=ZlgCIIKhv+E8b4gXgFAYNw2wxGCrNmTgOk774dEyXGY=;
	h=Message-ID:Date:MIME-Version:Subject:To:Cc:References:From:
	 In-Reply-To:Content-Type; b=CraGsQOCbTfNkfCwinpil21BwAeCB5n7pAPrd0D/uErHAbfmFEv8HiulAVIiKLDwNAPt4rToN8pgKkvz6kjdsvxaz0dy/W2rrO83wda/1Af7RDF46oszYSNsCBGjbzIC1FcsxrolDaQbZrL9KMvAkm3Dj4sBa8VkbcFww8OsANM=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=NqVOkXSV; dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b=IUzy5PLF; arc=none smtp.client-ip=205.220.168.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b="NqVOkXSV";
	dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b="IUzy5PLF"
Received: from pps.filterd (m0279865.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 66O4lD7w2275968
	for <devicetree@vger.kernel.org>; Fri, 24 Jul 2026 08:18:19 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	4lzhd00Ny/U6qtLdjxtqvfPN+RsSxzcK1jqP6oL1M14=; b=NqVOkXSVe4i9Sm1P
	1uVfvfGWNfKwgBApFLOtq4PJdY+ARYzf6BVB6oWsSaAD7SwfAri3oWsGb/2wrQAr
	L6rE/Ii+1HKZqMVZPA+DasgafsQi3D5C5UNxdINUzWP7uqDZIqawBprmdL26KRkw
	F1C2QNQ/S4Ua6DZkEFHKRnRImHugliRA6nN8gXmYxOPIcbTdD9UX+EA9OIlgeje9
	FfUnZwOJmXDlekCCh0vlYpluJ//2IwJmE4jQDco9vVXeVhIPGIyNLRv0oTVICP/F
	FND3iYFtBhCa/Y8FVc4E0Ac3A9bSg6aEbCE+ZnnbpJMV755vn6fMmPlVxyoaMwgA
	l9CMIQ==
Received: from mail-qt1-f199.google.com (mail-qt1-f199.google.com [209.85.160.199])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4fkqa0at0s-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <devicetree@vger.kernel.org>; Fri, 24 Jul 2026 08:18:19 +0000 (GMT)
Received: by mail-qt1-f199.google.com with SMTP id d75a77b69052e-51cab6f7517so317051cf.0
        for <devicetree@vger.kernel.org>; Fri, 24 Jul 2026 01:18:19 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1784881099; x=1785485899; darn=vger.kernel.org;
        h=content-transfer-encoding:content-type:in-reply-to:from
         :content-language:references:cc:to:subject:user-agent:mime-version
         :date:message-id:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=4lzhd00Ny/U6qtLdjxtqvfPN+RsSxzcK1jqP6oL1M14=;
        b=IUzy5PLFu8vAWoYxCNqsNrPcC3DGP2mwdfFOthQyUIShTsWtBvkB9eXVbPhQs0kyA2
         b5jwajfTS1hFjN43GyYn0gXCnHKZEWreYKkOIN4ctt28V0kEuJ+gHFvpFiyibFjhFVSY
         vrB8FxxWAsEDNxau3O48zx01ioOKGx1ykefY33HQ6rDZ7j63uT74g/ygf3XKM+JABDmv
         fb6+wGB9kBlJt8ARoMsXGGbs54qAP/hFjUmKeNLoo5mwkp627lLl4qIG0I7aZEuQG2c0
         7RyoTxK9Hrgq3a2So2iz+p4hOESXGb/6CGlJRkcvt60+ylFxr03/iaTczRGzZS3t8llM
         lK5w==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1784881099; x=1785485899;
        h=content-transfer-encoding:content-type:in-reply-to:from
         :content-language:references:cc:to:subject:user-agent:mime-version
         :date:message-id:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=4lzhd00Ny/U6qtLdjxtqvfPN+RsSxzcK1jqP6oL1M14=;
        b=rem0SqOQSxVnRuyIDChp5xY5DX24VRppWkKSVvyIS81Crn7MQoS2zYxWCNNSRwdUbq
         9kRp3Fox3/nQBB0FiMTt6/2gTX7Q8J+5yFiiBe4wUxTJetfFkXk0tRlc0S5Lr9CBnPAV
         s/4KTRt8b09Cx+w2IEYVS3W53jpmtnqijDAejZL88i0ygpXKnVvJ/cvFklEjPtkaVYvD
         kIJPN2nIcjITcPXAaQe1+9jKWWddrguayupPC8Kl57s4V923tTlP2K8Wp0g+WDwTEUnR
         nvtm2gGwjMPJIbhNrgMgsfVqy7d4L4VKUXRJ7eTSeQ9d4rp/Z0WmNARTbdxEvtjIomdv
         rQeA==
X-Forwarded-Encrypted: i=1; AHgh+RqHiQvXeA4+O0Oh8SAeCFmASP799Mke6SWCC4rIHSR/HSghry3xUx1Eus8qSVy0b4QXP3AwwWqKtVTE@vger.kernel.org
X-Gm-Message-State: AOJu0YzhnG8+2H6Pvzx1F1JQAZFwaA52XzzBHy17tl7SOTMTDE+t1A0P
	rMKx+CCsvDcptzrkfDVe5RzAS8HbZW/FVL2U/r4NC2aDeyX/tVAOgzC220aiaa7UmqaJZECz6Ld
	y0ox+7xComMUVuQWreIOZ0WkbH8qk4uk8X9/qLn1HKaLO8Yn2YaZ7XHzUWW5MDjFP
X-Gm-Gg: AR+sD13P0SYbdUlTYNtTwJDwfpjWthYgJtJv4Igsi3e8zv7AX6j4bicuU74bgjN5dCK
	8jSV9ukQU9pTYi08HaXlJbMcneeeO8j1Ek9QTgen5qn9Nx7MQ1U6+4HtIVK6JcEyQLro216KODy
	CLCInP69AwpVaAd/YpNE8hjuhBbPgDJKPIDtN7C/Ri1Zr71Ds8mEGt/c9Ml4Xre9y1zoUHVs9Od
	kBrs2NedLfv97sy5Pc1MNRnmZ+NPEV+Xv8oJs9lHey11Jmalap05VH57QLlWUEWNjPNqENfTzdW
	8gKNxsG/COETq5QtxCVUvgEDpf0hMkZ6YZ/UBQdDvCd4xys20Bi7hs3gyPFLaIjHgbanKDpUIGO
	1k2+pCE6Jh9a0HMI11Jlg2LDS
X-Received: by 2002:a05:622a:aa0b:10b0:51a:8c9c:7f58 with SMTP id d75a77b69052e-52849902994mr17837581cf.11.1784881097689;
        Fri, 24 Jul 2026 01:18:17 -0700 (PDT)
X-Received: by 2002:a05:622a:aa0b:10b0:51a:8c9c:7f58 with SMTP id d75a77b69052e-52849902994mr17837421cf.11.1784881097237;
        Fri, 24 Jul 2026 01:18:17 -0700 (PDT)
Received: from [192.168.120.193] ([178.235.128.140])
        by smtp.gmail.com with ESMTPSA id a640c23a62f3a-c1c32aca777sm314898066b.24.2026.07.24.01.18.14
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Fri, 24 Jul 2026 01:18:16 -0700 (PDT)
Message-ID: <52a09911-a846-45c8-a9d9-bdc9371acce0@oss.qualcomm.com>
Date: Fri, 24 Jul 2026 10:18:13 +0200
Precedence: bulk
X-Mailing-List: devicetree@vger.kernel.org
List-Id: <devicetree.vger.kernel.org>
List-Subscribe: <mailto:devicetree+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:devicetree+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v5 2/2] arm64: dts: qcom: shikra: Add coresight nodes
To: Jie Gan <jie.gan@oss.qualcomm.com>,
        Suzuki K Poulose <suzuki.poulose@arm.com>,
        Mike Leach <mike.leach@arm.com>, James Clark <james.clark@linaro.org>,
        Leo Yan <leo.yan@arm.com>, Rob Herring <robh@kernel.org>,
        Krzysztof Kozlowski <krzk+dt@kernel.org>,
        Conor Dooley <conor+dt@kernel.org>,
        Yuanfang Zhang <yuanfang.zhang@oss.qualcomm.com>,
        Mao Jinlong <jinlong.mao@oss.qualcomm.com>,
        Bjorn Andersson <andersson@kernel.org>,
        Konrad Dybcio <konradybcio@kernel.org>, Paul Walmsley <pjw@kernel.org>,
        Palmer Dabbelt <palmer@dabbelt.com>, Albert Ou <aou@eecs.berkeley.edu>,
        Alexandre Ghiti <alex@ghiti.fr>
Cc: linux-arm-msm@vger.kernel.org, coresight@lists.linaro.org,
        linux-arm-kernel@lists.infradead.org, devicetree@vger.kernel.org,
        linux-kernel@vger.kernel.org
References: <20260723-add-coresight-nodes-for-shikra-v5-0-fd5494471b36@oss.qualcomm.com>
 <20260723-add-coresight-nodes-for-shikra-v5-2-fd5494471b36@oss.qualcomm.com>
Content-Language: en-US
From: Konrad Dybcio <konrad.dybcio@oss.qualcomm.com>
In-Reply-To: <20260723-add-coresight-nodes-for-shikra-v5-2-fd5494471b36@oss.qualcomm.com>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit
X-Proofpoint-ORIG-GUID: tiTYlegAPY-Jj1bFUayCEG6Z2rcbEJHP
X-Proofpoint-GUID: tiTYlegAPY-Jj1bFUayCEG6Z2rcbEJHP
X-Authority-Analysis: v=2.4 cv=e/k2j6p/ c=1 sm=1 tr=0 ts=6a631fcb cx=c_pps
 a=WeENfcodrlLV9YRTxbY/uA==:117 a=PRfkaYvzSr8QmIIGAkY2Sg==:17
 a=IkcTkHD0fZMA:10 a=RAioF0-LDSMA:10 a=s4-Qcg_JpJYA:10
 a=VkNPw1HP01LnGYTKEx00:22 a=u7WPNUs3qKkmUXheDGA7:22 a=Um2Pa8k9VHT-vaBCBUpS:22
 a=EUspDBNiAAAA:8 a=wkgjK99CwNVckLCYi8oA:9 a=QEXdDO2ut3YA:10
 a=kacYvNCVWA4VmyqE58fU:22
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYwNzI0MDA3NCBTYWx0ZWRfX9DmiAHI1cMP4
 Pa8AITntKpeq/bsNogWtH+2/dni9VZRWdd48ysBse3bz6WIaO35XNBsEQ40mhhLAHt4RR4en+HL
 WmV++dvb9X5lktFWN0w4hpKm/0hSVAkYf85HYeIkpUJ7z6Z2BXL+YFl2ExS6kVRtf7n/Jn02OL9
 SlZ/hlGP5i4atQd0tKN8yRIUiFcEbeYw87TJYDiRkwPCVeTg8DwGOR9mPZaLAS6wLZTapLDjI2B
 RBp5/ZExF2YI9zO1Ga/s4Hlt4SwhmTI837tAaL8Ql6VwXSXo+qowwi9evM0+62JCEGwI/ivzzbv
 V1vrfeCNH02TzinCVmqGHW+E+3e0imGjgyL3iA7V9DeQLPrON9KhgntHjUuQihqO8/cMXKCKZUL
 V7aNlT+VnIxDf82KW/eGnPyLg1RwwHOhzGHPOb3skhb6lcB3cQR+EjVONivNikUhEl/ccrqwaiN
 ZV2pqqhbXr+TeUgWDqw==
X-Proofpoint-Spam-Info: AW1haW4tMjYwNzI0MDA3NCBTYWx0ZWRfX8FNfKLlhJlJk
 SLx1qOqQEFAq/GQhsqxCtLhKV7lo363Q/n4ljttbYz1m/X8gSG9OJD3qlqy/G3Ba/JFtm6hu9vl
 ChfxcNxkVhH3URKJTgs3fw7uXcxWExc=
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1143,Hydra:6.1.134,FMLib:17.12.100.49
 definitions=2026-07-24_01,2026-07-22_02,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 suspectscore=0 priorityscore=1501 lowpriorityscore=0 impostorscore=0
 malwarescore=0 clxscore=1015 spamscore=0 phishscore=0 bulkscore=0
 adultscore=0 classifier=typeunknown authscore=0 authtc= authcc=
 route=outbound adjust=0 reason=mlx scancount=1 engine=8.22.0-2606150000
 definitions=main-2607240074

On 7/23/26 10:26 AM, Jie Gan wrote:
> Add DT nodes for the CoreSight debug and trace subsystem on Qualcomm
> Shikra SoC.
> 
> Signed-off-by: Jie Gan <jie.gan@oss.qualcomm.com>
> ---

[...]

> +	modem-etm0 {

I think it'd be better to keep all ETMs 'etm'-prefixed to group
them together

Otherwise

Reviewed-by: Konrad Dybcio <konrad.dybcio@oss.qualcomm.com>

Konrad
