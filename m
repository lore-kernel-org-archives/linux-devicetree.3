Received: from mx0b-0031df01.pphosted.com (mx0b-0031df01.pphosted.com [205.220.180.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 881A947A0D1
	for <devicetree@vger.kernel.org>; Wed,  1 Jul 2026 11:38:19 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.180.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1782905900; cv=none; b=XhTxg6hdDLnW2SdGrPsBhH51clO0sZbmImqrG0X3hXRysgKH5+b6zBfhjRlUdlPcunBKciSH7CEkrlUTJSIlbxODeqaZsnWy5/diYUgSuONyDf+HBZDaeI75Km3VNnNw8tcOYpbcDigoxrAyYInRrnv4mVeeY0bdou0IrE2Usbk=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1782905900; c=relaxed/simple;
	bh=is6ARwVtdt2qH6o7wrGQSf++Qa8KCC79NEFAFUTZbbU=;
	h=Message-ID:Date:MIME-Version:Subject:To:Cc:References:From:
	 In-Reply-To:Content-Type; b=lGaHGVnybSkVyg5uYgYZlO634I5nuv5kwRGF4+rw9XmXKpUVpKUHjATRFQKcbYaVecfdpwRhy6aVVF2RRpR6t7VC/qZISnDrpbSwxG6XPus3BD6rLr3u0YF5F6FUXuKpuGknnI1eKGhgeOJ+bMTVZCznbaf/H3UP+QMHN1HbQh4=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=RBssWh6d; dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b=Uk/XGZE0; arc=none smtp.client-ip=205.220.180.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b="RBssWh6d";
	dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b="Uk/XGZE0"
Received: from pps.filterd (m0279872.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 661A8X9Q673219
	for <devicetree@vger.kernel.org>; Wed, 1 Jul 2026 11:38:18 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	o2tQu9z54t7ghzjghFzoCQXBSaxkCwXxy1yiopSDUo8=; b=RBssWh6dz0rhDH9q
	NuVQSARMkh9mgAXUpPHQlP5M6Nm0cH9iPfdfJI6U5BX1tVQKRdMTGB/mdRwRsbS8
	6+Ve2ifGjFsRbMO2ZP1QaD7uwQ0x7eE9IaZEmmkjMCydiq/TzLSUkt9tVkC8MCOy
	6PWendMh6zk4XLxEMaEw96RicWBB2fqwSagvcwI/oaAKCf/y8iRNfWInZI6cKkc/
	c0omdeHY2sXF6aBnFiGbWDCU6ljmVlx9lr7Qt0mPvu/OgXdnLMh4M1D6Jx+AMlxt
	U/oLH/DMShTjkIYFEeFTROapeTuo+tZcEc1DAMbWCVY0mIpMtQuRVgV6puf6Ygkd
	gf9hxA==
Received: from mail-qt1-f198.google.com (mail-qt1-f198.google.com [209.85.160.198])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4f502urkn3-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <devicetree@vger.kernel.org>; Wed, 01 Jul 2026 11:38:18 +0000 (GMT)
Received: by mail-qt1-f198.google.com with SMTP id d75a77b69052e-51c07313be5so1080991cf.2
        for <devicetree@vger.kernel.org>; Wed, 01 Jul 2026 04:38:18 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1782905898; x=1783510698; darn=vger.kernel.org;
        h=content-transfer-encoding:content-type:in-reply-to:from
         :content-language:references:cc:to:subject:user-agent:mime-version
         :date:message-id:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=o2tQu9z54t7ghzjghFzoCQXBSaxkCwXxy1yiopSDUo8=;
        b=Uk/XGZE0H70pTFyjRHC3iSnmOyzOiIbAL87/V5wtRQ1krg9VLdZwZXPksUfiFFqh7w
         Ak6K3uF7E8Jl/f5REJraBe9ZhM0mCl72JX1V59hVLhN1M4ZNAi5mMhNqMT+i0agZV4oC
         t/tHnTWx4lwpeVkNYqjz1+x7+yild/DnIB0cmLXxebdT46NWBl+Wdc1/PeSvQreskAyG
         wJKVv/XXgRk4ifbgiG6kp6liK8Rr2jIPF7G8ta1CO8fA+q8JN/k6FnmtlZ0PDwCqmKcp
         zmyUD7bdyd4jyo8rplg0ClFqg3H5CA3HPwTvG5zT2Ig59YMCTjnMz8PqTaOipTVFSU1N
         85Kg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1782905898; x=1783510698;
        h=content-transfer-encoding:content-type:in-reply-to:from
         :content-language:references:cc:to:subject:user-agent:mime-version
         :date:message-id:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=o2tQu9z54t7ghzjghFzoCQXBSaxkCwXxy1yiopSDUo8=;
        b=ZZjQT81ynhRuXn0Oju7ai0al4WyhBPvK2qfGTB4mABTRinwgU6gGfCfSKtypCwfcp/
         3akbkEuXpnKr+ts2dEnY4FTyDQo/78RN15Jztl4WOk1NthzyoLT4EXN3MbEZNMHZxtIf
         AxrvUITkkxZZmUiZ/uGCOsW51Cy+qL2xJdJMuawPgooEjUhFQD6i+CVCFCS20g8WSLFa
         WLdaSlpzukOQjro4RVj4Y5wC1jCPPHctYWQ4ZMSPPmYLNL6Ym1xouwHCg7JdLdKxUamW
         fSyLnByeEVO7EI7UqfOKIILeQWS4tsBE0qFhZTM5yCP+YmTp5YJ9QB3MpPbki0PRfkjl
         +rew==
X-Forwarded-Encrypted: i=1; AFNElJ+NUK+Ih2frUKDNELr3Cg6bawAbVM8figMbVUxuE/uFCI3TKM1z9BTdS6vWcNJbvEgfSI+hMQDFsgeu@vger.kernel.org
X-Gm-Message-State: AOJu0YzxFWkLh7FN64KU3JC2+nsGiQAy4cnNXLQj8Oz1SNDcy0wWJ83c
	5+g/Cbd+GC0qIe58xqrmQZD6vkK7Chb0+XWjIc5o8OhGZa82r7iTwaiGJSE42JYq+JCTQhLp2V9
	h4zISXQFoF9dw6TX52ctBb8Hr3WNimZaP+75O/Oeh3JX3MnvzvYaDKSgebMyC52Yy
X-Gm-Gg: AfdE7cnNl4hfQ7ALFOF/Nj7v7Dki68cbrVMb5bpytuhJ1gjSdRP1lAK1v6d7ghagETL
	pI8Y88DsUjUgPZ21Oj7Sqvp98EYnTtGeMEIwL/Ry8htaIRd1ppZBfSAhjvdljU0/YG9h9cFsVGw
	T7uKRoyucgv3wwPTrLiOWH1Ty9nqLWMa+rW8ZhHx5H7e/yTitv867HlgN4odtSbk7d+FtNGJDgR
	cz84MKiSaD+hzwq+AcrjnNxbQgerGwaapSulNanj5EFri2ycRY37ebgYyJMAT66QWTkBBLIg4Ki
	MLPeoSU89T1VmhCpV8U9FgWB5Q2v7+hyKiJAL0zq+hbrRwoaLaF/YHMTyzx4fdR3taWmpVaqOaU
	Wstwhz7eO1o5ESXTEQin9TwNPTSGzVWgfDtE=
X-Received: by 2002:ac8:5f13:0:b0:517:5e32:f3ac with SMTP id d75a77b69052e-51c2693f551mr10261841cf.0.1782905897825;
        Wed, 01 Jul 2026 04:38:17 -0700 (PDT)
X-Received: by 2002:ac8:5f13:0:b0:517:5e32:f3ac with SMTP id d75a77b69052e-51c2693f551mr10261531cf.0.1782905897416;
        Wed, 01 Jul 2026 04:38:17 -0700 (PDT)
Received: from [192.168.120.170] ([178.235.128.140])
        by smtp.gmail.com with ESMTPSA id 4fb4d7f45d1cf-6987c3b6526sm2656719a12.8.2026.07.01.04.38.13
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Wed, 01 Jul 2026 04:38:15 -0700 (PDT)
Message-ID: <f5b75410-cf75-4bfb-872b-81b6180e386e@oss.qualcomm.com>
Date: Wed, 1 Jul 2026 13:38:12 +0200
Precedence: bulk
X-Mailing-List: devicetree@vger.kernel.org
List-Id: <devicetree.vger.kernel.org>
List-Subscribe: <mailto:devicetree+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:devicetree+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH V2 2/2] arm64: dts: qcom: Enable SD card for Shikra EVK
To: Monish Chunara <monish.chunara@oss.qualcomm.com>,
        Bjorn Andersson <andersson@kernel.org>,
        Konrad Dybcio <konradybcio@kernel.org>, Rob Herring <robh@kernel.org>,
        Krzysztof Kozlowski <krzk+dt@kernel.org>,
        Conor Dooley
 <conor+dt@kernel.org>, Vinod Koul <vkoul@kernel.org>,
        Neil Armstrong <neil.armstrong@linaro.org>,
        Wesley Cheng <quic_wcheng@quicinc.com>, Ulf Hansson <ulfh@kernel.org>,
        Kernel Team <kernel@oss.qualcomm.com>
Cc: linux-arm-msm@vger.kernel.org, devicetree@vger.kernel.org,
        linux-kernel@vger.kernel.org, linux-phy@lists.infradead.org,
        linux-mmc@vger.kernel.org, Nitin Rawat <nitin.rawat@oss.qualcomm.com>,
        Pradeep Pragallapati <pradeep.pragallapati@oss.qualcomm.com>,
        Komal Bajaj <komal.bajaj@oss.qualcomm.com>
References: <20260630165700.1886608-1-monish.chunara@oss.qualcomm.com>
 <20260630165700.1886608-3-monish.chunara@oss.qualcomm.com>
Content-Language: en-US
From: Konrad Dybcio <konrad.dybcio@oss.qualcomm.com>
In-Reply-To: <20260630165700.1886608-3-monish.chunara@oss.qualcomm.com>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit
X-Proofpoint-Spam-Info: AW1haW4tMjYwNzAxMDEyMyBTYWx0ZWRfX4uQWqvgylxTn
 CVVbj6bbtmYFt4c9W7LLBSxqdhwO1j+/SC3m0kAeIOQotA86HDiwZNf/TO67x8MsUlKthAMTbRb
 DFvfuzvzwWU5+pjFfyZafqrx8YU9xt4=
X-Proofpoint-GUID: gAq_9B1Q2rWxJ7lAzMADlVIiRPh0yFKs
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYwNzAxMDEyMyBTYWx0ZWRfX428jOCGO18e9
 356R4K0KogIM4gbMINcDe8L7gJEaxXIdGZaEg3ohEWFKLtSkRRmTuUPPeNwjE3nUOHn5t3WKoDV
 VAzwGY4QCpMfrVzcnT8ZXBrx736RMgln1PMcsOSNdYrGkt64jvYqyGM9kjr4y9nk4+ZscavwF1r
 A2xUBpFoYpDZdG85uLQq0UeAHz7xUsZ3pxh/5EH7hLH0cTMPUi4nMhcS3mfJXKX88KN3NzypUIG
 vLSdPrE5Wfs/7RaQPPJGno9RnCJZEpZBH8r5Q6AMLMjpNCYiHk36c/9tCwM5/vRFQLPvvgQxGCR
 XFgstl5f4Yfr+TURIxRNi6EoZ9uoxQU00e3/hs27D0l+oFv6UrP3bJfFpayiZa9ZrCrvw9ssrqQ
 029xZ3tMSh+Ijl0zwi0DhmOJfnQJ/7NcYDsiaDB9Yi3uvAClE/EoJ/f4ocpuWK2er2NxWfHfCH/
 9Af/NxguNYgmVPd5guw==
X-Proofpoint-ORIG-GUID: gAq_9B1Q2rWxJ7lAzMADlVIiRPh0yFKs
X-Authority-Analysis: v=2.4 cv=PbLPQChd c=1 sm=1 tr=0 ts=6a44fc2a cx=c_pps
 a=mPf7EqFMSY9/WdsSgAYMbA==:117 a=PRfkaYvzSr8QmIIGAkY2Sg==:17
 a=IkcTkHD0fZMA:10 a=RAioF0-LDSMA:10 a=s4-Qcg_JpJYA:10
 a=VkNPw1HP01LnGYTKEx00:22 a=u7WPNUs3qKkmUXheDGA7:22 a=yx91gb_oNiZeI1HMLzn7:22
 a=EUspDBNiAAAA:8 a=pnqc_4j3uO5S_kuVk7YA:9 a=QEXdDO2ut3YA:10 a=zgiPjhLxNE0A:10
 a=dawVfQjAaf238kedN5IG:22
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1143,Hydra:6.1.125,FMLib:17.12.100.49
 definitions=2026-07-01_03,2026-06-26_01,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 bulkscore=0 clxscore=1015 impostorscore=0 spamscore=0 lowpriorityscore=0
 suspectscore=0 phishscore=0 malwarescore=0 adultscore=0 priorityscore=1501
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.22.0-2606150000 definitions=main-2607010123

On 6/30/26 6:57 PM, Monish Chunara wrote:
> Enable SD card for Shikra CQS, CQM and IQS EVK variants. Configure the
> vmmc/vqmmc regulators and gpio-based card detection for each board
> variant.
> 
> Signed-off-by: Monish Chunara <monish.chunara@oss.qualcomm.com>
> ---
>  arch/arm64/boot/dts/qcom/shikra-cqm-evk.dts | 18 ++++++++++++++++++
>  arch/arm64/boot/dts/qcom/shikra-cqs-evk.dts | 18 ++++++++++++++++++
>  arch/arm64/boot/dts/qcom/shikra-iqs-evk.dts | 18 ++++++++++++++++++

Move the commonalities to evk.dtsi and only override regulator
in the board files, please

Konrad
