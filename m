Received: from mx0a-0031df01.pphosted.com (mx0a-0031df01.pphosted.com [205.220.168.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id AA70A3B893B
	for <devicetree@vger.kernel.org>; Wed, 29 Apr 2026 09:45:45 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.168.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1777455946; cv=none; b=AjgVcP+FJCc643Aiipr13hDNvwAhUcHyk8N/nFUqPWKHy7KWfQ2IstBt77GXLvAwPD7uTO28QYX559V3qjoZacuQddSlyzQboUQJWKB6gd5c/AKZpOJbX7PWLbdHaDPXYtH6Izu4AcXo1sAoKDxA3WMX7XVuUYUUk1DHe8jBjk8=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1777455946; c=relaxed/simple;
	bh=3KvaD+9EPrVoBDVzqdktRPTMs5fF/i68th33bzEO2T8=;
	h=Message-ID:Date:MIME-Version:Subject:To:Cc:References:From:
	 In-Reply-To:Content-Type; b=YStnVHdcUFNuSGYue11sQs0ny+qL2uuqe46yO4XIPlfEApupjAl/Th9qLJ2QOsYrzzRkE3TtkY48qDFxRu3kaQdA2opVUOqAlh7xXpEnDBKlNhERMOM2JduMtrPwuD4uYkIuFFnevABOK+SxzpKHtAb4QS6PC4rRRCu1W/dD2YU=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=AHrrDU6y; dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b=H61FncHg; arc=none smtp.client-ip=205.220.168.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b="AHrrDU6y";
	dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b="H61FncHg"
Received: from pps.filterd (m0279864.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 63T8q7SR1721259
	for <devicetree@vger.kernel.org>; Wed, 29 Apr 2026 09:45:45 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	eKc6pbOFliJRXgCPxY0VgZCdhuSHeoxZqhn97SNu0es=; b=AHrrDU6y/k5MFfnd
	lap7HOXbgN+geW8lBrt4GH7BdsWXtUdfR7hczsv5fUgFNV9IjahZZvXm5kXCxi7J
	Z4AOP+I8PgvWqPNKra0ITjF8TQo25mEnSA1XKmiNGo8lB9FMAIl1xKnUi1nDLz2u
	gyvy35+5XFVIdkVTGVNR1R35jFZq1F6kSnvhgZU3xcWggbY5rA+qTE9W6GNkrkou
	aRCoRCkEs1zpdD2mIimkUbeeOIfGkDFw+958kPXP+PxKoNERQIEMhcdNeJ38jROY
	pJVB8YPjpolcJZ2quqq6esB9ByUNDzeH5fFXfFvD5W7+ZKPMVUo8nnC5Z2zi/izH
	phO28w==
Received: from mail-qk1-f200.google.com (mail-qk1-f200.google.com [209.85.222.200])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4dua731ead-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <devicetree@vger.kernel.org>; Wed, 29 Apr 2026 09:45:44 +0000 (GMT)
Received: by mail-qk1-f200.google.com with SMTP id af79cd13be357-8eb530174f0so268646085a.1
        for <devicetree@vger.kernel.org>; Wed, 29 Apr 2026 02:45:44 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1777455944; x=1778060744; darn=vger.kernel.org;
        h=content-transfer-encoding:in-reply-to:from:content-language
         :references:cc:to:subject:user-agent:mime-version:date:message-id
         :from:to:cc:subject:date:message-id:reply-to;
        bh=eKc6pbOFliJRXgCPxY0VgZCdhuSHeoxZqhn97SNu0es=;
        b=H61FncHgn4IdIGHQZm70TeiKYi5lnoFAMfNceNk07suQSu9MC4sYCN8buwG+oS5qvD
         hzKvRgjGkltNq2lB7voK1W7nwezk95fQ+Wb3rZ66b8Grbqsehgp1dCvOyHbavHw+WeUX
         reqeKcxgBs3WWqHSidVmYKWKroyK1eHWcG+bEObQNIStK3rwDL79dt7OPiuiHZl3e7aI
         RAGw2Zdt6kr54nhqnELPNrM/FN6hI+cbRMkw9FzEoqucjb7WxFpNeyHo25zNW9yN7Bhg
         ab+SViDOZrMeTpeZwZ2Cqx0Q0V73ntO0weuXsIKSwwSEssunzr1NyXJPgk1XOaHiGa7F
         ViJw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1777455944; x=1778060744;
        h=content-transfer-encoding:in-reply-to:from:content-language
         :references:cc:to:subject:user-agent:mime-version:date:message-id
         :x-gm-gg:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=eKc6pbOFliJRXgCPxY0VgZCdhuSHeoxZqhn97SNu0es=;
        b=LOpgtlqC7O8eHCnraMK4FUZD+HQDJcBS5QhydpFZ+frIMAT4WxV4gLWj9lDrTrTMbv
         P7OF3RkwP5E4bYxC4LAv/Rxe1jECLiNAQAI313IoPBdbUymGqZLBYpnGwhPZQLfsMJxs
         iD/RZvAAzHAtrspISitCgidoYSBw5RrGmJR2IZwqxWhRGtAMHzk+SHVLSnkfZbN+6t0O
         XC/s1MGrhmgXS+3GauQpvTfQt1mHYCvcj1O87T9Tjp2QPBO528k5uO85n3lDA1qy417Y
         Otb9uLqube+dGIEoyg0ShyATdpUe8OTk+kGz1OczASjn19vLDQms9vUxtNmMthKoy8jy
         HCUw==
X-Forwarded-Encrypted: i=1; AFNElJ+eP8Cv2rQpdJ919q+f31wIPN1GO9YoAuuu9q0cRnxFhprc0ZnREaEcxRaR9uFuv9N9WnbYG92qXnyj@vger.kernel.org
X-Gm-Message-State: AOJu0Ywnu/ty8KcMINi9LPQF7s7JV6KXoSdBremBwPf0l2c7ytdU6VM9
	QZcgoT1PAKdYnZK1U2ADJynoF8MAWj/XA3ZBZ56qZEQO4/H0KeX/HjKv5XVwZIZLTz8CY8K4eYo
	jNYqQ2ApRRgg9Ag3eFxiuAmFwvM0/bMygiegve5d6ClXwrA81sICyUWQUylps7rBX
X-Gm-Gg: AeBDieuWpE8c1bWEA5O/sjsnR7EgfiqKT+lh5LmM5h1Tgc8udnIcaXnfcNuO3zU3oqg
	xYqZjSwqfdcsuY8Xgj3G0R3UUdJn/4tlDqX0YLGloHbATtkL2CiRoXNx0pmeprHgJ+vcPJBgD7c
	TfDTJV3q4IBNb7F2NYLnhV1tNk99muTrPdTc49mqk5DpYx50LkRThXCHn53Fiydv8LuVVXpqa4u
	KjkYSeDZ+YSp0sO6R6aH3rQyZ6T016oRjf1yYGf5sAhRgFcioOfeRDTkznBM3vPaFHUlzMOIXb6
	2LUSBMkqEpc7cQywDHRG9eVAYgy7hL3UBAOv7iEfbzeKrCQeCPA6FQUm4RgaoE43u3ZCC2crG2D
	Twj6gCfGZO/MsX7fjW71+SDQ6RsWSnp5xhN69Nt3fg8IspMbeGCy5PsjEGgbDxnKTBdYfNAaVLD
	bJFmthOMnXLVSDoA==
X-Received: by 2002:a05:620a:318c:b0:8d7:ed38:8189 with SMTP id af79cd13be357-8f7afbb363emr679343485a.0.1777455943841;
        Wed, 29 Apr 2026 02:45:43 -0700 (PDT)
X-Received: by 2002:a05:620a:318c:b0:8d7:ed38:8189 with SMTP id af79cd13be357-8f7afbb363emr679341385a.0.1777455943418;
        Wed, 29 Apr 2026 02:45:43 -0700 (PDT)
Received: from [192.168.119.254] (078088045245.garwolin.vectranet.pl. [78.88.45.245])
        by smtp.gmail.com with ESMTPSA id 4fb4d7f45d1cf-67b22165ce0sm497042a12.20.2026.04.29.02.45.40
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Wed, 29 Apr 2026 02:45:42 -0700 (PDT)
Message-ID: <73491a9c-5aea-478a-a81b-af84ab6352f0@oss.qualcomm.com>
Date: Wed, 29 Apr 2026 11:45:40 +0200
Precedence: bulk
X-Mailing-List: devicetree@vger.kernel.org
List-Id: <devicetree.vger.kernel.org>
List-Subscribe: <mailto:devicetree+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:devicetree+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH] arm64: dts: qcom: sm8750: wire UFS to ice instance
To: Kuldeep Singh <kuldeep.singh@oss.qualcomm.com>,
        Bjorn Andersson <andersson@kernel.org>,
        Konrad Dybcio <konradybcio@kernel.org>, Rob Herring <robh@kernel.org>,
        Krzysztof Kozlowski <krzk+dt@kernel.org>,
        Conor Dooley
 <conor+dt@kernel.org>,
        Manish Pandey <quic_mapa@quicinc.com>,
        Melody Olvera <melody.olvera@oss.qualcomm.com>,
        Nitin Rawat <quic_nitirawa@quicinc.com>
Cc: Wenjia Zhang <wenjia.zhang@oss.qualcomm.com>,
        linux-arm-msm@vger.kernel.org, devicetree@vger.kernel.org,
        linux-kernel@vger.kernel.org
References: <20260429-sm8750_ice_dt_fix-v1-1-2540dc337082@oss.qualcomm.com>
Content-Language: en-US
From: Konrad Dybcio <konrad.dybcio@oss.qualcomm.com>
In-Reply-To: <20260429-sm8750_ice_dt_fix-v1-1-2540dc337082@oss.qualcomm.com>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit
X-Authority-Analysis: v=2.4 cv=XtvK/1F9 c=1 sm=1 tr=0 ts=69f1d348 cx=c_pps
 a=hnmNkyzTK/kJ09Xio7VxxA==:117 a=FpWmc02/iXfjRdCD7H54yg==:17
 a=IkcTkHD0fZMA:10 a=A5OVakUREuEA:10 a=s4-Qcg_JpJYA:10
 a=VkNPw1HP01LnGYTKEx00:22 a=u7WPNUs3qKkmUXheDGA7:22 a=DJpcGTmdVt4CTyJn9g5Z:22
 a=EUspDBNiAAAA:8 a=vap4R24UawxQ0CsOHRsA:9 a=QEXdDO2ut3YA:10
 a=PEH46H7Ffwr30OY-TuGO:22
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYwNDI5MDA5OCBTYWx0ZWRfX3BX4j3G2A+sL
 loROAwz6GgzPFhlfK7oxn927flvhYla5qiqn2wrhUVLLUNbDgWe1Ly1OH48vRsSA2Gr6Nw340t4
 1Xoj7gLeBkWZombmKssKWbIwLMQ2o9PFdN9AFR4uttL0ndIUSd1+f/psX+vdp4CN+d8uxNKygkZ
 th6r4ydymFp2BUkrhX41kmWKIcifiCXRpMz1G4H+2n5oF9psyspRRhdjlBpkeVWUMp6hqUobXjZ
 NB3+jioxQ4INz33VgRSwqfhugYYfXIIwyvpmfsUiEIIgHZ+E6ITzpCJZ/LcOgIKUclTNirE5RM+
 8+cmPXge9qU/6mjTfbF0wmetWMbXER0K9nXlgXh3lI8RhuSJBa+lLyrTkCgkf0suGTMdyGR/Byx
 243AQf6hP1W6DEJQZDdZzAp7yQKP+Xt3FwgL2+QrCX7JXZZ1Izg/iehJv19YtYpQYkV/QsQnSDt
 Fune8C4si1Uc5WVpYGQ==
X-Proofpoint-GUID: dlGmcI2N4ETBU6VqbPfqNEw1QaFlN_Ka
X-Proofpoint-ORIG-GUID: dlGmcI2N4ETBU6VqbPfqNEw1QaFlN_Ka
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1143,Hydra:6.1.51,FMLib:17.12.100.49
 definitions=2026-04-28_05,2026-04-28_01,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 malwarescore=0 lowpriorityscore=0 clxscore=1015 spamscore=0 bulkscore=0
 adultscore=0 impostorscore=0 phishscore=0 priorityscore=1501 suspectscore=0
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.22.0-2604200000 definitions=main-2604290098

On 4/29/26 11:35 AM, Kuldeep Singh wrote:
> The Inline Crypto Engine (ICE) exists as a standalone DT node, but the
> UFS node lacks the required qcom,ice phandle reference.
> 
> Add the qcom,ice property to explicitly associate the UFS controller
> with its ICE instance.
> 
> Fixes: d288abc3a70e ("arm64: dts: qcom: sm8750: Add UFS nodes for SM8750 SoC")
> Signed-off-by: Kuldeep Singh <kuldeep.singh@oss.qualcomm.com>
> ---

Reviewed-by: Konrad Dybcio <konrad.dybcio@oss.qualcomm.com>

Konrad
