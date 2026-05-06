Received: from mx0a-0031df01.pphosted.com (mx0a-0031df01.pphosted.com [205.220.168.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 098DA3DD53A
	for <devicetree@vger.kernel.org>; Wed,  6 May 2026 09:16:46 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.168.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1778059007; cv=none; b=RidpMyo40yEDPHLVSIx+KuVKP72ysBShXVI8TRIj+wYl3pWMDIQ/C0c0UNKeDS7aPLmi7pTTvM36xMIfPNYmO9KYXak4J+Z7EwC4BF6WWNQafJEc3+BWL6L8azIDgboiFsxN2VYPV7QCqe7SZphYwuoD611cy0Hv+7YUCxvnQEY=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1778059007; c=relaxed/simple;
	bh=TxvTfFjdfnWw22HuuKIr2gOK1ckKyCbWP3NkBT75F6Q=;
	h=Message-ID:Date:MIME-Version:Subject:To:Cc:References:From:
	 In-Reply-To:Content-Type; b=PE3TBXXQy/ix+wQdSEB3V3Y36E0+zg70Dwj1fr7M1JIol9aeZDHyYN+uSxhjF0h2L8f9DauEDl6yK+g3qO63fElBVc0iDMv8gNuW8S82/OU7Dv/cfmVrPiwFO2vy8gG9NCt6PITD8dc82MUnGgRqKTFe6ktObAQblMdHlEBvQ+M=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=JLLzx4Pn; dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b=YhjGxZg7; arc=none smtp.client-ip=205.220.168.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b="JLLzx4Pn";
	dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b="YhjGxZg7"
Received: from pps.filterd (m0279867.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 6465kLgY3475717
	for <devicetree@vger.kernel.org>; Wed, 6 May 2026 09:16:45 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	CzRiVjL31AN/PgDXAgb4WIG82Qr4tgLanNDX7Fm883w=; b=JLLzx4PnW6pOrvFR
	nhE3BxVN/vnR5FjtQzI5gQmMFt2zWL1FxaIapcex5nnLc0hPIgXwDlB4R4B4HZCZ
	/Bf+JBWCVpxsdZFmvenMz+DeFFFg2rdwX8/BLVbbHnLQF4FEpr67DRLPqz2DThJc
	+Y183fBUwQ3m8kLh7q5a6yRBICo1O2ZNjLzF7Wp3uS0y4rT9RsjKP4LfrAhvXouj
	jn5B1xkGwiYpRiTxizuCr1B3Mka6mtnQPVHitWAfgtaOJABgy3hcpI9ULp/jMCR4
	4KN7w1yw3vMKbCA60RarKwolQvtRKcvmigM1u6Es8sQadAIGVgYdDtnVVTd5CGzP
	V2FEpw==
Received: from mail-qt1-f197.google.com (mail-qt1-f197.google.com [209.85.160.197])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4dyhsgv6wf-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <devicetree@vger.kernel.org>; Wed, 06 May 2026 09:16:45 +0000 (GMT)
Received: by mail-qt1-f197.google.com with SMTP id d75a77b69052e-50e5c781193so13399431cf.0
        for <devicetree@vger.kernel.org>; Wed, 06 May 2026 02:16:45 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1778059004; x=1778663804; darn=vger.kernel.org;
        h=content-transfer-encoding:in-reply-to:from:content-language
         :references:cc:to:subject:user-agent:mime-version:date:message-id
         :from:to:cc:subject:date:message-id:reply-to;
        bh=CzRiVjL31AN/PgDXAgb4WIG82Qr4tgLanNDX7Fm883w=;
        b=YhjGxZg7sugr+u34uu0nMShBNbdyc6hcp+z/TLip6hMjuC1j9zWLGyHoI9M3I9L/z+
         G+qpNEw7bRvXFiEw/9AlyNVu9/5LlAP8qRd78sh9D8zHU3KBEkCO8BNp/0ekC7cYBJzs
         0e5/MTly2IdseNXZUGIbPmGZ0xolmMO00HqR7h+Mewl0Oc/8NsThDE7GSqIzz05xoybJ
         /lA2vWgwSrFQPJEuHf1NMQeDQC1X8q1LuoUfsdtiCCvrAG1HgJ6GLM6Kj6Kx+l4wEX+B
         A6x84sRA6IexQENkCqwN/lx0b8QsIuJLIYXTB/hjgUJIWyP8lhzlD37RpY6RGT8W2Hmo
         zhcQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1778059004; x=1778663804;
        h=content-transfer-encoding:in-reply-to:from:content-language
         :references:cc:to:subject:user-agent:mime-version:date:message-id
         :x-gm-gg:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=CzRiVjL31AN/PgDXAgb4WIG82Qr4tgLanNDX7Fm883w=;
        b=JQSsHMsRiJrsa/zoVO8R+EYY9Th3fM0kpsGp7qqEXLtNWUK33g7y96B5CBA2qMJRYB
         PY1F+SLuyxzyDxe7zF0LKNLGrnnkbrqUthvsGmM7lpp7LWtqjPFP/HSyrcQtFa+brRl0
         1OfhLRAj9GB2GGI4nxBSdIIKGwoliSpq/4wAjBqcZaUFWdgi+4X42F6ESW+v7iB7Na22
         xrIDP9kb+YlsJxVr+m3UnP7P0A1A1xZYh2vnwjew8uiULO8U5x1l1qrVzq/1EvZaKjM7
         Exw9q0w9oT7GERUjEvNN7KMQG1lr2xaQ9V9IrUe+ObRm/3R5YRK1HA7DxDeVV7feJtQ2
         AjkA==
X-Forwarded-Encrypted: i=1; AFNElJ9SNewL7BesWGBX3CjZEHErpE8sV+98zyinhkXJezlTl8xIJw4kzASvfetIPJXmmG+q20fJBVFn19E2@vger.kernel.org
X-Gm-Message-State: AOJu0Yw97oiwqNSXByYZFd9haBCZimp1LmeLpYUORd8ar1/AN2MbgbGp
	yRsafU5HD+jgJllWZBMBb304KkwXdddiO6AbbLLkl7z+UnI0WBviZc2YKJWXt6dAaknSEzjix6/
	J4MBlGkwMvMPUV6uJmN/F8UGeT8C4d1qLLIgT37WONkVseLRp/k1pZ0UXp+6ci2Bq
X-Gm-Gg: AeBDietGqsE8R2hPltCn5WCUe+dFCMfE/wLDrU4qyNQOFdZon/+XJ3pcHrFD5u6NDuQ
	GrCTqAd+d0Y88hpFumYP6ybZnzGROzt8saS9/kMJ5p2jtgzNE7wM/iu2SiJA6YFsnH1nQ3yIR8S
	P8u9gTb9aYyvvmQOVWB6d+fkIJFWHeGDUmPD8Felkv0KJFmA6zSQq5m6DTajHkoqPMRjhitgF5L
	JjW4xJlqYpoEO8f+UdHem/JAqnrcVgf3Jdzv9KGSy8p8Nv0Qs1u69bGFcgFrBDesSAuomlwStEC
	nuNy2K2eQ6eHMSCw5BqtsiPqAD4OK5kvWQ4wVyFVgdxTrI8Ep5IhqkQnsOgi4MmMJriTRqgYl4V
	DV+HEc19Csx4FQ/8efTcT/GIxcg9ALuRpKKaKvT4pqSmYlz1Q4KvmFrjZyOU3kabnAeAtq2jS6d
	FxQrzDGWxw581LqQ==
X-Received: by 2002:ac8:7d47:0:b0:509:e68:22cb with SMTP id d75a77b69052e-514628b1019mr25148421cf.5.1778059004357;
        Wed, 06 May 2026 02:16:44 -0700 (PDT)
X-Received: by 2002:ac8:7d47:0:b0:509:e68:22cb with SMTP id d75a77b69052e-514628b1019mr25148091cf.5.1778059003960;
        Wed, 06 May 2026 02:16:43 -0700 (PDT)
Received: from [192.168.119.254] (078088045245.garwolin.vectranet.pl. [78.88.45.245])
        by smtp.gmail.com with ESMTPSA id 4fb4d7f45d1cf-67cd90e1aa3sm1048006a12.2.2026.05.06.02.16.42
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Wed, 06 May 2026 02:16:43 -0700 (PDT)
Message-ID: <feda9202-cded-4025-a5fa-36dda8f23dce@oss.qualcomm.com>
Date: Wed, 6 May 2026 11:16:41 +0200
Precedence: bulk
X-Mailing-List: devicetree@vger.kernel.org
List-Id: <devicetree.vger.kernel.org>
List-Subscribe: <mailto:devicetree+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:devicetree+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH 2/3] arm64: dts: qcom: sm6350: Add PIL info region
To: Luca Weiss <luca.weiss@fairphone.com>,
        Bjorn Andersson <andersson@kernel.org>,
        Konrad Dybcio <konradybcio@kernel.org>, Rob Herring <robh@kernel.org>,
        Krzysztof Kozlowski <krzk+dt@kernel.org>,
        Conor Dooley
 <conor+dt@kernel.org>, Luca Weiss <luca@lucaweiss.eu>
Cc: ~postmarketos/upstreaming@lists.sr.ht, phone-devel@vger.kernel.org,
        linux-arm-msm@vger.kernel.org, devicetree@vger.kernel.org,
        linux-kernel@vger.kernel.org
References: <20260505-sm6350-misc-v1-0-0b9efc22690c@fairphone.com>
 <20260505-sm6350-misc-v1-2-0b9efc22690c@fairphone.com>
Content-Language: en-US
From: Konrad Dybcio <konrad.dybcio@oss.qualcomm.com>
In-Reply-To: <20260505-sm6350-misc-v1-2-0b9efc22690c@fairphone.com>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit
X-Proofpoint-ORIG-GUID: RUrDftwD8Sj6bLH_iaxanorlj9z4GiuB
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYwNTA2MDA5MCBTYWx0ZWRfX6KmrVMwvxSAv
 qaIY+SXn2rZaGZLXyvZh/8GyjgsvyKWaTSaK2mlDsaFMt9z40I5EFW9CtIkYyUQgO0b6O4DuMMK
 6YEmcDTt8JU0mMOYUvrcBFJsWnpjgtHeqb4C92SBi96o8Rg62OvEbFxsqyesFxGezvYCF6u9Z63
 mdCDovEXLMelnOSEPm+Tb/lQB/KM11DjO4+6SjvSC5Ds1hF9LYgVzJhLwKHSukxAp8qXcg3AnZw
 Id+QcDs6gDtI8NdcW6rXPnoEQRSFtenlYiqdammGXzOt39xzRgebQiiDsAgCtTSjjOyWMBBW5nt
 IaEWyt+ReUWy+eJ/wtdWD+nK5Yi+D9p8YWSib9XKsHmaWcJQ4FxT/NlhG2X5AUjtY8a08LA/pXT
 6VLZXhpAIW/9LWsuk8qlCgLdHfa61tEqC4bBV7IXcK54+pN4HjwhR31wfeGQmp5r8Xqq/uOB/v7
 6kuC8F65CBmxHPKMj5A==
X-Authority-Analysis: v=2.4 cv=EPU2FVZC c=1 sm=1 tr=0 ts=69fb06fd cx=c_pps
 a=EVbN6Ke/fEF3bsl7X48z0g==:117 a=FpWmc02/iXfjRdCD7H54yg==:17
 a=IkcTkHD0fZMA:10 a=NGcC8JguVDcA:10 a=s4-Qcg_JpJYA:10
 a=VkNPw1HP01LnGYTKEx00:22 a=u7WPNUs3qKkmUXheDGA7:22 a=eoimf2acIAo5FJnRuUoq:22
 a=6H0WHjuAAAAA:8 a=EUspDBNiAAAA:8 a=cK09vydtsKC2F0QeqMEA:9 a=QEXdDO2ut3YA:10
 a=AYr37p2UDEkA:10 a=a_PwQJl-kcHnX1M80qC6:22 a=Soq9LBFxuPC4vsCAQt-j:22
X-Proofpoint-GUID: RUrDftwD8Sj6bLH_iaxanorlj9z4GiuB
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1143,Hydra:6.1.51,FMLib:17.12.100.49
 definitions=2026-05-05_03,2026-04-30_02,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 adultscore=0 malwarescore=0 impostorscore=0 clxscore=1015 bulkscore=0
 phishscore=0 suspectscore=0 priorityscore=1501 spamscore=0 lowpriorityscore=0
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.22.0-2604200000 definitions=main-2605060090

On 5/5/26 5:08 PM, Luca Weiss wrote:
> Define the PIL relocation info region, so that post mortem tools will be
> able to locate the loaded remoteprocs.
> 
> Signed-off-by: Luca Weiss <luca.weiss@fairphone.com>
> ---

Reviewed-by: Konrad Dybcio <konrad.dybcio@oss.qualcomm.com>

Konrad

