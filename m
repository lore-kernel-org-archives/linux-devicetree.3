Received: from mx0b-0031df01.pphosted.com (mx0b-0031df01.pphosted.com [205.220.180.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 59C8C3164D8
	for <devicetree@vger.kernel.org>; Thu,  1 Oct 2026 08:38:28 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.180.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1790843909; cv=none; b=uCE3QJlzVAYv1Gb8Tufn3HT0g3ERAvqY1rukuc0MxWnGFCS434wii0KQO1oZKzqIfyamsTq+cmUZqw3DubkRckwnk1KCbci28HTbmEqlvlzyEcOjSWbYm3dztDCljqaou/x6v/HJrGVz6sbwueiB8hQgAWizh22GamE1I6wdAck=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1790843909; c=relaxed/simple;
	bh=WUyUAJBFfHzzdVEpTJgHPcbRAXJp+ZSWpmKqyoZNWE4=;
	h=Message-ID:Date:MIME-Version:Subject:To:References:From:
	 In-Reply-To:Content-Type; b=RFA4fuH4yMXK0+kuNi5p0e9KlTq7zI1ZjdIAFRGC+qTEx4f9iJj2YLhHak6lO/o7BZ1gWUSJWqK7j4ZvWStDZAZN9CH6fmn0l85r5MFweatzGrpswKI6IL7Xkm8T++TW7eTZB/yXna472hXpyMDagYt9IWiYrFgPt2Lanzirl20=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=oHfIsqxM; dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b=O2kG7ykl; arc=none smtp.client-ip=205.220.180.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b="oHfIsqxM";
	dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b="O2kG7ykl"
Received: from pps.filterd (m0279871.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 6916xc9w2337241
	for <devicetree@vger.kernel.org>; Thu, 1 Oct 2026 08:38:27 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	T3cJXMjP/XsqzQusIsx52/0qeSWTh7VDvbG6/9h1C08=; b=oHfIsqxMFDv1XqOa
	+r//Ln64jYBlWuQI7dku7Zka5NDjISxvle2r+LM3L83yU7Cr/NUZOYDRSiJM93Uq
	vuiGJrLVhd5b8EsSyeTY5LJgeJ7USvcNYrpkL+Wjcii4h1gnxscZr3nqrt0yr/Wz
	G/JsRw8vMUo8CNAZ0qbrieFxMxmlgojpZTzSqSQXsvOr5DVODl2FM6tN9cieTXZe
	GA99wV2Otc96r7YxKvRIJYPV8vx9PT1/R6DezWRsS1epTUwK/nyElfEVRoHJjgT0
	LiaBlagLJk3bLmaxP2AUpdOM8F9EwuhBJc9ncdHTFYNkz77+XX2g+Vg9AbMO9Bs8
	eR9MJw==
Received: from mail-qv1-f71.google.com (mail-qv1-f71.google.com [209.85.219.71])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4h14n23tcx-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <devicetree@vger.kernel.org>; Thu, 01 Oct 2026 08:38:27 +0000 (GMT)
Received: by mail-qv1-f71.google.com with SMTP id 6a1803df08f44-91795e52969so4288596d6.3
        for <devicetree@vger.kernel.org>; Thu, 01 Oct 2026 01:38:27 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1790843907; x=1791448707; darn=vger.kernel.org;
        h=content-transfer-encoding:content-type:in-reply-to:from
         :content-language:references:to:subject:user-agent:mime-version:date
         :message-id:from:to:cc:subject:date:message-id:reply-to:content-type;
        bh=T3cJXMjP/XsqzQusIsx52/0qeSWTh7VDvbG6/9h1C08=;
        b=O2kG7ykl5pGAfCI7KJLeGUsNkDBdQe8dcutFflrixYP9z+rB45mVFm+rkWfsql6K70
         6bEcvlNX1puKuomC91f/aTvYe93mBkeKygy+7t88q/auUrWKXsTnAeqJNV79qh8eHnSc
         5TCTCNu9UfJ1dWXDpV0iYUTpd1zBk48E67P7IBUUH7ZLwNrFAvuWlhhyQESypdSnRSFv
         dNooYnOU9np6KTf+0vj7Gg1IEneclxC2ptjYF4aq6SVoZJe0evnkPKsKdSjQ7UrOM2+5
         TRoZODrLR6Cvlh3KOBIro241T3OUHkfslCNxkrDEeDyEFPqrupEM32/IuIoJmbDyJqT9
         JxdQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1790843907; x=1791448707;
        h=content-transfer-encoding:content-type:in-reply-to:from
         :content-language:references:to:subject:user-agent:mime-version:date
         :message-id:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=T3cJXMjP/XsqzQusIsx52/0qeSWTh7VDvbG6/9h1C08=;
        b=DRLiF6ioO01BLjeTlBamUI7rdyKTL3O/qD3+VrXEqd216mVNdWu2nxGNeq705OxWI6
         bh6F3T+OAIKI1j/VEO1kS7ANKUnl79rihb/k9SHrRMSvg5WR2zPhaYUtL4dR0RVB5T3J
         XcLS8nQs8QH0a/e4uggKwEs+DMgZhhRTAt1TH8pKNsfGIKJAo6YS4Lp3FQ9JiY6rpg9E
         1kRVlx5gHRQlGoEJk+8J20SJ0p0isir54AQb8eSooga8CIt/tI3n9iInV/8Vo3ZeM4I4
         j3Yzh1C0BxI4+bbqSfWbU5DTOj645/gjmyeWw/kbrW8WFjB0TSswgkgPKfVpP7SD3RmG
         Oggw==
X-Forwarded-Encrypted: i=1; AKwUvBylYGE/1mcxQQ5kkG9DnqzfQ7YSAsLbO3nTnvozSN7mB8yHZZAsRU67IIUnlh0nl/XAuBgwGvT5Qj/x@vger.kernel.org
X-Gm-Message-State: AFuF++nFDW1/u+UZlBIlchP82ah8i9vygMHqYdfRgUWgG/koz7Rherop
	di0ib5G+aSpCz5fKcOvuSxUAo7ggQkZ+CKhxzREqkKr/RqyHDXfrXcwpMvTX8lCJQ/Uul+h9eMl
	INiu1c0ktKlj7z7f4KCtvcmlZWV/MXVGGmYZQyWdkfTOrx7FrzIEEssRZCWgz81/y
X-Gm-Gg: AYBFou18mP3GwztnAkQtdHCsQf+Nid31CBBa99tOspi9nfcvoiH7HteVw4X02HOkmpm
	l5FSFOIUTWpw1P+0BWWz4/x82w8mOdFM1eHILzALqucnbWiEHGPcv94BDA9kK17H11W9aUFnyR4
	/kGt7vBZZxWK7YI0nR04fgw4axVne7nARV8qdy4XvdhnFH6HN6K8JSuiC8xGAIGVfmPkcltva+X
	p2Iy9s5eTIha4tpTwzxg/fo1kzq/bypEgy2ky5lDggMUsYr4isPlMynMlvZ5vFmsXcPOAKVWts3
	uEfeZ7DkT9ZCHCpAcIofK8Rq3js+jzskF1P58a0kus+ed54kuvmPrOLr2jR2mQ81QqHxQtdVBqY
	u9V6jAbDOJ3zFcsLPXed88A==
X-Received: by 2002:a05:620a:3948:b0:939:8148:1e3d with SMTP id af79cd13be357-93ca95726dcmr698828885a.2.1790843906627;
        Thu, 01 Oct 2026 01:38:26 -0700 (PDT)
X-Received: by 2002:a05:620a:3948:b0:939:8148:1e3d with SMTP id af79cd13be357-93ca95726dcmr698826185a.2.1790843906036;
        Thu, 01 Oct 2026 01:38:26 -0700 (PDT)
Received: from [192.168.202.12] ([178.235.128.140])
        by smtp.gmail.com with ESMTPSA id a640c23a62f3a-c2e31d7a4e3sm110149566b.53.2026.10.01.01.38.23
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Thu, 01 Oct 2026 01:38:25 -0700 (PDT)
Message-ID: <9d5d45aa-2678-4453-b18f-16efd4316732@oss.qualcomm.com>
Date: Thu, 1 Oct 2026 10:38:22 +0200
Precedence: bulk
X-Mailing-List: devicetree@vger.kernel.org
List-Id: <devicetree.vger.kernel.org>
List-Subscribe: <mailto:devicetree+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:devicetree+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH 06/11] arm64: dts: qcom: sdm670: add adsp
To: Richard Acayan <mailingradian@gmail.com>,
        Jassi Brar <jassisinghbrar@gmail.com>, Rob Herring <robh@kernel.org>,
        Krzysztof Kozlowski <krzk+dt@kernel.org>,
        Conor Dooley
 <conor+dt@kernel.org>,
        Bjorn Andersson <andersson@kernel.org>,
        Mathieu Poirier <mathieu.poirier@linaro.org>,
        Konrad Dybcio <konradybcio@kernel.org>,
        Abel Vesa <abelvesa@kernel.org>,
        Manivannan Sadhasivam <mani@kernel.org>,
        Andy Gross <agross@kernel.org>, linux-arm-msm@vger.kernel.org,
        devicetree@vger.kernel.org, linux-remoteproc@vger.kernel.org
References: <20260922015801.32373-1-mailingradian@gmail.com>
 <20260922015801.32373-7-mailingradian@gmail.com>
Content-Language: en-US
From: Konrad Dybcio <konrad.dybcio@oss.qualcomm.com>
In-Reply-To: <20260922015801.32373-7-mailingradian@gmail.com>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit
X-Authority-Analysis: v=2.4 cv=Gr3XaU1C c=1 sm=1 tr=0 ts=6abe1c03 cx=c_pps
 a=UgVkIMxJMSkC9lv97toC5g==:117 a=PRfkaYvzSr8QmIIGAkY2Sg==:17
 a=IkcTkHD0fZMA:10 a=660iZSQnnn4A:10 a=s4-Qcg_JpJYA:10
 a=VkNPw1HP01LnGYTKEx00:22 a=u7WPNUs3qKkmUXheDGA7:22 a=3WHJM1ZQz_JShphwDgj5:22
 a=pGLkceISAAAA:8 a=Auy6gPqRZWqvY-t5LT4A:9 a=QEXdDO2ut3YA:10
 a=1HOtulTD9v-eNWfpl4qZ:22
X-Proofpoint-Spam-Info: AW1haW4tMjYxMDAxMDAzNCBTYWx0ZWRfXxTA+Ti4r7yXR
 ytzR0mX1sjKxVYrlkasdgW2/1Zk9W8dekqUW/uyufSAnKe6Zt5y/JjGBZhl9Th04VJfv6yfUz8F
 v4nsrlkM4Ogcp/zxicX0NvtwFqkN1XM=
X-Proofpoint-GUID: -_YS9NQGn0zF_sXEdwDQTd40YNArlkR8
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYxMDAxMDAzNCBTYWx0ZWRfX3amQdx59JsZf
 0H9cHKv5feMHGlys7e6z1oUZsk7713FyVOrclTBe5Di/AO4y0C5qArar0Kuq56hN6vxAuunQcpp
 c4PgFEeBuccjnxVWBIMiYjKG8TSoOCPi8j5B83s1+/0Kf7mTuKzW19thc5WzETR+iyndrErjxzH
 pMM4ZKHwmz9v0Df1yj7CrDRclOejf6Dfq0iw8+KuMwUiC6bLIGaRZ2AZBPlmgUPz8Vlp856Dsex
 NWi6uk8LsdU/mVuYyqt9+esCUTGJKD16ZF4QNhxADx04P6DpuxtiDp8Jk+4QXAhSTMkvG4GD6Mw
 s+mAjCOR6cnvrvS+EDefG4e+0vNA6UrLCw7oGoFCjCB8s1oIsTnTcIgcmCpbG+gsTlxCmltNNfN
 MFoR6cYNuG3qBRTPE1pAFgP9vUPndszimhHmZia4B8hCXLKM1bpVT541kh1Bt4+yELFvr5UNsA0
 tF/WCVX/eswC1I+jzew==
X-Proofpoint-ORIG-GUID: -_YS9NQGn0zF_sXEdwDQTd40YNArlkR8
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1176,Hydra:6.1.134,FMLib:17.12.100.49
 definitions=2026-10-01_03,2026-09-21_02,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 clxscore=1015 bulkscore=0 malwarescore=0 adultscore=0 lowpriorityscore=0
 spamscore=0 suspectscore=0 impostorscore=0 priorityscore=1501 phishscore=0
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.22.0-2609040000 definitions=main-2610010034

On 9/22/26 3:57 AM, Richard Acayan wrote:
> The Audio DSP (Digital Signal Processor) is responsible for audio and
> sensors on SDM670. Add this, along with the SMP2P nodes used to
> communicate with it.
> 
> The sleep state is included to prevent the following crash:
> 
>     qcom_q6v5_pas remoteproc-adsp: fatal error received: err_qdi.c:450:EF:sensor_process:1:sar.cc:27:chre_utils fatal
> 
> Otherwise, it is unused.
> 
> Signed-off-by: Richard Acayan <mailingradian@gmail.com>
> ---

[...]

> +		/*
> +		 * The ADSP crashes if this is not present. Simply probing this
> +		 * magically prevents the crash. It does not need any driver to
> +		 * interact with it. It is labelled in case proper support is
> +		 * added for it.
> +		 */
> +		adsp_smp2p_sleepstate: sleepstate {
> +			qcom,entry-name = "sleepstate";
> +			#qcom,smem-state-cells = <1>;
> +		};

It's not magic, the driver registers it in the SMEM item, and the
ADSP likely looks it up and complains if it's missing. You can
drop this comment, since you already explained it in the commit
message.

[...]

> +		adsp_pas: remoteproc@62400000 {
> +			compatible = "qcom,sdm670-adsp-pas";
> +			reg = <0 0x62400000 0 0x100>;

len=0x4040

[...]					compute-cb@6 {
> +						compatible = "qcom,fastrpc-compute-cb";
> +						reg = <6>;
> +						iommus = <&apps_smmu 0x1806 0x0>;
> +						qcom,nsessions = <2>;

This property is going away, please remove it

Konrad
