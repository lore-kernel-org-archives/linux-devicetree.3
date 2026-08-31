Received: from mx0b-0031df01.pphosted.com (mx0b-0031df01.pphosted.com [205.220.180.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 7D7023AE1A6
	for <devicetree@vger.kernel.org>; Mon, 31 Aug 2026 07:13:38 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.180.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1788160420; cv=none; b=Us4tXOlFqd+CmSjBqjh4cjLh5FntaD6XZU9H6sl4p/wjkznTc0lYm0Qlq6+2wqzQKSxI0DpwZHiN9SPwTTH/0HiZ5T1hYqjyGDc+AC3mU02x6R4w1zErOHa8CeUBmdM/AMtvHKdzT2GJeCCp5x5uInK2jaMcCMYJUQqL2Xelt+g=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1788160420; c=relaxed/simple;
	bh=q6I4wCeLjqNrqvwZRLZGmC63ff7DII28bBJfKKCRnYs=;
	h=Message-ID:Date:MIME-Version:Subject:To:Cc:References:From:
	 In-Reply-To:Content-Type; b=PPcZf4XM+RDygyZtjqVqx9SFmof9xnli0/hGeWkDDDgWQWCHIBAg04tYL9nEsK0CPgRv5cM+63ud33bMv81gruIjaaQh9bnM89/JiyCHHgn3x9xcsyFvhzO0YR6pqkMj35bBHdvgbSRZ1mgwQwYXtJ5cSGxFoEM2h7d3M+747+o=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=QRW2H7zd; dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b=ZecpI5B7; arc=none smtp.client-ip=205.220.180.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b="QRW2H7zd";
	dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b="ZecpI5B7"
Received: from pps.filterd (m0279872.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 67V52Zg12017641
	for <devicetree@vger.kernel.org>; Mon, 31 Aug 2026 07:13:37 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	PocnQeQ6O7VcIvt0+JawoO6B6p/AFAhDCRmYQgt+CKY=; b=QRW2H7zdyW5a40ix
	znEwMpOjKQtWUuDkBP8YaXRyDcyURS3goBBsiQOk8W9FqV65FQ2xGMRG47rKaF4a
	HULczAVCtKpsZxQvglMjAU+LoIRN4UWSlnWyGqBofA6ooudcrUXz9SUFCK+jO6M9
	kivpOQqJyI2QXmxqNNexKzNeLUve6fPoShCEpOqy4uyxabNfFrAY1l523D2Nwx80
	j7CGmbehc7PQY7kRReRbApZDgwkR8krOlL1DjG9IxhQX1atciIOr0kIarBCzle7U
	aNpoQeW4wjQKMpk22FlZIoh5ItETNXjEyB65czVk50qxN4nlBw/bDq1sHCxeb9bn
	YWA7ow==
Received: from mail-qt1-f198.google.com (mail-qt1-f198.google.com [209.85.160.198])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4gbqt6n2m6-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <devicetree@vger.kernel.org>; Mon, 31 Aug 2026 07:13:37 +0000 (GMT)
Received: by mail-qt1-f198.google.com with SMTP id d75a77b69052e-52b4e315000so13648671cf.1
        for <devicetree@vger.kernel.org>; Mon, 31 Aug 2026 00:13:37 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1788160417; x=1788765217; darn=vger.kernel.org;
        h=content-transfer-encoding:content-type:in-reply-to:from
         :content-language:references:cc:to:subject:user-agent:mime-version
         :date:message-id:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=PocnQeQ6O7VcIvt0+JawoO6B6p/AFAhDCRmYQgt+CKY=;
        b=ZecpI5B7gIRCZCaSLwGm6nqYNhuAl6780E+A3xUDwgnwTFvxENMtwWC55pBDZFl8WA
         s3cmkyNuVdxDR2TgJsL3dMMh9w7pILptzdfPehfdEfATsLI8Zk0qJzdSVr7WFV+dcUBe
         NHqaO5HRFGpl6cI9rYHjlR3Vnjm7q9PnOYVjxT+7pOKgRvY/T+fI3FVALnV36um6RTJa
         GbD3nIepRfYI9b9HPf4yvG/eIKOTtFD1e4pP8dYZhLR7oqJN0KWIRLbi7Rrz404F2x+j
         1HmPKIYrRp4hdsyVaF8+gnTs1rpFnweCZOjm+75qGfkxeo3Qp6eRShTnPRmsWDvxE9Qe
         LpJA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1788160417; x=1788765217;
        h=content-transfer-encoding:content-type:in-reply-to:from
         :content-language:references:cc:to:subject:user-agent:mime-version
         :date:message-id:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=PocnQeQ6O7VcIvt0+JawoO6B6p/AFAhDCRmYQgt+CKY=;
        b=M6sPtl6k1A/8nQPj6reZfbTwmD0xbPC+S3CkWGr+X+8sq8IEyYFy8JifQZ7H5hzvNv
         jb/zKT+cc5cNw8FbDFJhAvkX8i7w8TSDBAktq+Va0vt6KPBxxCpW7gTNEXfM7C9NBjh7
         IyC5780Ptp9T+vj3XuqaQiPAHFfD2PLpalrjkrEfDWPyomkWFytmuHDTIq5JpmlGCE3R
         5GxK8cOaCvNhcAaTOOzhe/KrVLCdws/KgGzpYqMinDBu/fDKqN7AfzfCXbHqjG6mSAqc
         ybNN4vtehtMK/Jkk5GfGsCQbSK1YT+d/2cWsam9U+9P0K4XuZ8Dw5QykGKAAhwjHGRoq
         O+Lg==
X-Forwarded-Encrypted: i=1; AHgh+Rq/eLQMs9JeKJ/GRSLrk89b/oKCy6RckbkOaeyqlTSpEDBxOOU+6FFyfLWIUPAscs/1D6mKKg/IYCWQ@vger.kernel.org
X-Gm-Message-State: AFuF++lVF/5iHgSUo2y1DG2aqaGIXrioS+w0kHcFwgzQnZVuireyOVlZ
	Aggy2pTJimSWSoS899QNc8nBESpEzEgXM3V6+1w3fCSpvOloNLel9UJTT43h53LqLt7VALdQOc2
	eWMRAsT38+VhIDh6M7BzTH6qpdBG5T4j/OyX1MO+2CWT6kXN5qo/g3MhNJSxAbvYK
X-Gm-Gg: AR+sD13rJyc3RijRKW9dDYUmsNFWOBZOh+SC5TYvqa1gN+8qJM8Zu4nfRta+H2f2t+I
	zyvQk9/0PHRqylSsS8bo8Y+fz81phiejol4wTU1BK3oa+D8fYJBcVzLEH8B1EVQP67o//vRhzSi
	ivwy5gGF/zPzJwRqoFE5k25uMYbpXuqlSTbknuMOZS2N7KytoUCXyuUXhaY736wgojODZNsIjF7
	RWJXXzdpTjKLwbH6iHgLnpiWetWUs15dDrcVIR/bm4P97F5VVfrssUl0wzSu81YxQ6o9Mu7oXfG
	lcBcQsIveTJ0w9FQQJC9wtQqVKWjye/j3YVLZYC9isMzstZzKK1R2F0cVuXo/MT175D9ICCvUJc
	SLWtO/Jy31mooRLtN8Rp5yg==
X-Received: by 2002:ac8:7f15:0:b0:51c:83f1:bcd4 with SMTP id d75a77b69052e-52fb91e676emr189054261cf.0.1788160416685;
        Mon, 31 Aug 2026 00:13:36 -0700 (PDT)
X-Received: by 2002:ac8:7f15:0:b0:51c:83f1:bcd4 with SMTP id d75a77b69052e-52fb91e676emr189054021cf.0.1788160416343;
        Mon, 31 Aug 2026 00:13:36 -0700 (PDT)
Received: from [192.168.202.12] ([178.235.128.140])
        by smtp.gmail.com with ESMTPSA id 4fb4d7f45d1cf-6a64fba5c16sm607868a12.22.2026.08.31.00.13.34
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Mon, 31 Aug 2026 00:13:35 -0700 (PDT)
Message-ID: <6f33aa1f-563a-4ad8-8c81-6f64fb64f6be@oss.qualcomm.com>
Date: Mon, 31 Aug 2026 09:13:33 +0200
Precedence: bulk
X-Mailing-List: devicetree@vger.kernel.org
List-Id: <devicetree.vger.kernel.org>
List-Subscribe: <mailto:devicetree+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:devicetree+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH] arm64: dts: qcom: x1-denali: Add volume up/down GPIO keys
To: Dale Whinham <daleyo@gmail.com>, Bjorn Andersson <andersson@kernel.org>,
        Konrad Dybcio <konradybcio@kernel.org>, Rob Herring <robh@kernel.org>,
        Krzysztof Kozlowski <krzk+dt@kernel.org>,
        Conor Dooley <conor+dt@kernel.org>
Cc: linux-arm-msm@vger.kernel.org, devicetree@vger.kernel.org,
        linux-kernel@vger.kernel.org,
        =?UTF-8?Q?J=C3=A9r=C3=B4me_de_Bretagne?= <jerome.debretagne@gmail.com>
References: <20260829-surface-pro-11-volume-buttons-v1-1-ace589343a68@gmail.com>
Content-Language: en-US
From: Konrad Dybcio <konrad.dybcio@oss.qualcomm.com>
In-Reply-To: <20260829-surface-pro-11-volume-buttons-v1-1-ace589343a68@gmail.com>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit
X-Proofpoint-ORIG-GUID: KW5sER9yObTCY1LqVogUfc3zSF9ngQHa
X-Proofpoint-GUID: KW5sER9yObTCY1LqVogUfc3zSF9ngQHa
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYwODMxMDA2MCBTYWx0ZWRfXxy1j+lmGq4Tj
 Gv84yK+JWTSoYqTSoqp2audKAEJRtOZqt0odEl+Xw0gUvlGm6jGr9xuUepDOPoxouA/eoYbP66r
 +5Ps3H1HCRnxg/IO2FoGBDfV2gJ1cr2cM2Na8rIv1r7jWUC6ktj54ynVF9FMw156fc698fbJamE
 K4Sse/Lj3vS1NCdj3fy0ZX1lukO2R9014WgWmopQB9zWUK0qoH9aB08iGvl05bL4W4afT+1JT4a
 qCU41blIpbwUInJWIYePV0fSQKpQKyNyKmGtBdcPyMmdnG9iVsRugkRTLtE2B89bIbh14bvbk4p
 CFWPw0cBclbmAKaIinm13ok4SdXXYzI/N9m1GALyRPiSvuKwWH2qodYaMp7iVEvXRIwgZ9LvUq9
 qHFenrXVLLbGv5dkT4HDjGwDcAMhes/nKrmW9HcHNF41gdV+t4tTg/8QFpXCNQ9j+tyehkZcQrd
 XHGFJ0edM90hpRKH07w==
X-Authority-Analysis: v=2.4 cv=S8/pBosP c=1 sm=1 tr=0 ts=6a9529a1 cx=c_pps
 a=mPf7EqFMSY9/WdsSgAYMbA==:117 a=PRfkaYvzSr8QmIIGAkY2Sg==:17
 a=IkcTkHD0fZMA:10 a=Sv0fKeRqtYgA:10 a=s4-Qcg_JpJYA:10
 a=VkNPw1HP01LnGYTKEx00:22 a=u7WPNUs3qKkmUXheDGA7:22 a=yx91gb_oNiZeI1HMLzn7:22
 a=pGLkceISAAAA:8 a=EUspDBNiAAAA:8 a=JO05NdOSlY_Y-sYczyEA:9 a=QEXdDO2ut3YA:10
 a=dawVfQjAaf238kedN5IG:22
X-Proofpoint-Spam-Info: AW1haW4tMjYwODMxMDA2MCBTYWx0ZWRfX3yY6K3yRy64L
 p430ftL6wuHSnKK1kJQvrJEz2B9gyGYkom07mTxpDHHnwTA228rloBkVd7dFGCX7tdOOtWTRRFz
 DNMr7WxxZpfzJoQPrCRdE6eQmqSjOEQ=
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1176,Hydra:6.1.134,FMLib:17.12.100.49
 definitions=2026-08-31_02,2026-08-27_02,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 adultscore=0 impostorscore=0 clxscore=1015 priorityscore=1501 suspectscore=0
 bulkscore=0 malwarescore=0 spamscore=0 lowpriorityscore=0 phishscore=0
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.22.0-2606150000 definitions=main-2608310060

On 8/29/26 8:41 PM, Dale Whinham wrote:
> Configure gpio6 and gpio8 as volume up and volume down respectively, to
> enable the volume rocker located at the top of the screen.
> 
> Signed-off-by: Dale Whinham <daleyo@gmail.com>
> ---

[...]

>  	pmic-glink {
> @@ -995,6 +1013,22 @@ rtmr0_3p3_reg_en: rtmr0-3p3-reg-en-state {
>  		function = "normal";
>  		power-source = <1>; /* 1.8V */
>  	};
> +
> +	vol_down_n: vol-down-n-state {
> +		bias-pull-up;
> +		input-enable;
> +		pins = "gpio8";
> +		function = "normal";
> +		power-source = <1>; /* 1.8V */
> +	};
> +
> +	vol_up_n: vol-up-n-state {
> +		bias-pull-up;
> +		input-enable;
> +		pins = "gpio6";
> +		function = "normal";
> +		power-source = <1>; /* 1.8V */
> +	};

Let's order the pin nodes by their gpio number

otherwise:

Reviewed-by: Konrad Dybcio <konrad.dybcio@oss.qualcomm.com>

Konrad
