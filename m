Received: from mx0b-0031df01.pphosted.com (mx0b-0031df01.pphosted.com [205.220.180.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 2C7E1372EDB
	for <devicetree@vger.kernel.org>; Wed, 22 Apr 2026 10:26:12 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.180.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1776853573; cv=none; b=JWALT36v0yWGjat/limpvwpg1wa4D6EaSO7UcQz6R4/YYN1rKNpufoAmXeksV7ejos/2Iv5mBYlUaMGzaXlmpKNxFT1Etv4kQFwz+NtwCz3dnUcfHk06TWgkdKuvcy/WD/h9S6QrdH8wOyKLsIm+b4YED2FQiw5nqmxndW8fJJU=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1776853573; c=relaxed/simple;
	bh=9oMx8UUh3LEuh0OifJ5/c28imvIhOfoxOFygb2DvIuI=;
	h=Message-ID:Date:MIME-Version:Subject:To:Cc:References:From:
	 In-Reply-To:Content-Type; b=HhZiqn2XrNslKStRHA8MMty1gACE88IK4RcPmPLLAnKrQylaeIkTGKexywjNMr2r2BrYh8EXrBitujL7J0qTRs0zFAy2icXlsQl5R3RC/7XkIIh9QM9HTfgeWoMpl7dAhI+0cdAMIdCt/JiyTEqPctLxnf6sRDBjhQsaQ4XReUY=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=jUGMoVgc; dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b=eTT20DOD; arc=none smtp.client-ip=205.220.180.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b="jUGMoVgc";
	dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b="eTT20DOD"
Received: from pps.filterd (m0279869.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 63M98wh92639316
	for <devicetree@vger.kernel.org>; Wed, 22 Apr 2026 10:26:11 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	/CMRzFsDXCD5ac6G9NNtEZ+SCThRSqqF+fw6lWJ++kU=; b=jUGMoVgcqC9j8ip9
	vKJ2HwgNchP5gQDkjYbzDTL6Wy04Qp9iB7QTLZYwJUfz9VUgf5LfKXWVjTP+5LvO
	SnnxyppI91gtSBIT+/Fy+VzFm4wchHumrIyQdK1yIF9Me/x57MTGr/tXP/4u9ZQq
	zw4vN4ogT/iHImYSxhS26O2US3+Pdq+R1tqn3ccNd/+5B/2f8WWwTSUsUxZdkGeZ
	jv2be5YAcwoPbeVXAK1EII6KpdFEPPSBnReMJM3vXXBzyDwpaN0p5tfJE2WEKvXJ
	vADYn6dXG0urj4l4bcq8vSAquXyxXck+BWyw3yl+x3m04JIeFE1pFDyK4tOSN18v
	jumeKA==
Received: from mail-qv1-f70.google.com (mail-qv1-f70.google.com [209.85.219.70])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4dpenhaw74-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <devicetree@vger.kernel.org>; Wed, 22 Apr 2026 10:26:10 +0000 (GMT)
Received: by mail-qv1-f70.google.com with SMTP id 6a1803df08f44-8aca4966fe6so16441356d6.2
        for <devicetree@vger.kernel.org>; Wed, 22 Apr 2026 03:26:10 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1776853570; x=1777458370; darn=vger.kernel.org;
        h=content-transfer-encoding:in-reply-to:from:content-language
         :references:cc:to:subject:user-agent:mime-version:date:message-id
         :from:to:cc:subject:date:message-id:reply-to;
        bh=/CMRzFsDXCD5ac6G9NNtEZ+SCThRSqqF+fw6lWJ++kU=;
        b=eTT20DODyOlK3hGwSb7ru33i/jHyp72NQHmjBeyX6Mgklxt/TUS1Wd7xzFfiTkLQWC
         VVlzN23C/QvZbEhU+hLUPLaX8tI6W2qyZ4V9j+sV3bkLidHdm6GmBbV16Dws2awte4zJ
         NLQBuk8jv0oRykeHcv3nNJOMMrlCDHAE7nsgUc3uC7+wW1HZfPSFgTDim++Sdp1jHm+O
         IpqeBYIZERdxH/r7UBdf167hnQotPC2eT7jo7kOFmJOdv4HOuZnBpZMPrf7/1tJm31F7
         g9rd2vP502nDcje1p9a1eHIsXKz4d4dvb5D+cUQWP17yQAfuPav3IyKZmeyPRRlrBLVT
         KILA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1776853570; x=1777458370;
        h=content-transfer-encoding:in-reply-to:from:content-language
         :references:cc:to:subject:user-agent:mime-version:date:message-id
         :x-gm-gg:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=/CMRzFsDXCD5ac6G9NNtEZ+SCThRSqqF+fw6lWJ++kU=;
        b=OjvbMJmmt3yAX84+g/lq+5px989k4e/WyiTGwWa2QPYBWmxikyr8+rfH5lFQmFm8WD
         H0PM2PmraDr+EwzKU7F4whB7oX2v5nnvy89DgZWpWGcIpeMSP9zUPeKBPww3hEWRKSCx
         QPjI38fcBHlTc1n25UhHUYnxdRlhwjnNjU+6GB5LRHxC/aT3Jym6W0DCo+cBUJDq4oda
         1oNnVh+y7j8UrpJOdOyc6T8HMUKQj8drLbgixG2BYMQ/rlE0/FBfEWQ1gkMq8v7by27A
         Lk4qnv1pS0HF1qv1C8jKEvJoaRm0PnEyUF9jjnFOQFgFpcqj48Gl29ywFgOXK3ypAWSl
         Tsbg==
X-Forwarded-Encrypted: i=1; AFNElJ/nOUjmWKp6foUaxjXzgOu7JMLhkGBb+7DbVg17At+RREA6abAA17AMkjPn2kzeOY56nCH7RDiK6bxX@vger.kernel.org
X-Gm-Message-State: AOJu0YxFMKvjtP48Y5EGQbKLaKG2wP5r21bZ8dz5d4U7xvjyTOC/Wqz5
	ZzmwFoOUpJn0Ov6MAXEvhMCIaZFo4l0Ht1hiwhyoDIHB3OwGq9Lgmy4yPIm6tzV/29A2Pp5Bzwl
	VcCzairjavAXDDPHGRzXiv076xhi8pYybk2ZvFg6mJXBv31QPIz7ldZEkDf6fvaLB
X-Gm-Gg: AeBDietdleE+xFSyO44Q2xRE7+QBS9o79tKLpSIlnn3poP7dTKOc829keC62OiRIxUv
	BzWCiYYmYWMgiB6iGemYDXcp2jsZAZdP5/OPl9ew3ASv/Oqa5b8u0iVfic7NTA7uCskUMNQiS7G
	fd6Wbps9wmoEm8u+17kuxAYLlE/nnDDfwCsV1HcGrLjWjXMbOmah62lx1yYV3h6LpGFymGfEhmw
	WpdeHdNwfAhrWZI0zwaAf3H/sP9u+R7c85zBhpMVsDbZeS75dnwsL6197ERuHTqVKdGnu1mZhRZ
	MoFrK6wNsxO6cPqywBxN2SkBfu2q1dHK/NxAtNrPkWphpdJtFQFMhEHw9nYceD2bca2xgoAUck/
	JYN96IRcGQcEYP//fei4qwjSd0hFhSAe55xzUueawqlXkL0eA3shjw4VtmkGXwDi17FuibtxDiW
	WlUFyot39BBkwgNw==
X-Received: by 2002:a05:6214:2521:b0:8ac:a205:f118 with SMTP id 6a1803df08f44-8b0281997b8mr228050706d6.8.1776853570147;
        Wed, 22 Apr 2026 03:26:10 -0700 (PDT)
X-Received: by 2002:a05:6214:2521:b0:8ac:a205:f118 with SMTP id 6a1803df08f44-8b0281997b8mr228050556d6.8.1776853569671;
        Wed, 22 Apr 2026 03:26:09 -0700 (PDT)
Received: from [192.168.119.254] (078088045245.garwolin.vectranet.pl. [78.88.45.245])
        by smtp.gmail.com with ESMTPSA id a640c23a62f3a-ba45572d01esm547277666b.62.2026.04.22.03.26.07
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Wed, 22 Apr 2026 03:26:08 -0700 (PDT)
Message-ID: <6c2c5fd6-c032-4658-9a15-039c77074c4b@oss.qualcomm.com>
Date: Wed, 22 Apr 2026 12:26:06 +0200
Precedence: bulk
X-Mailing-List: devicetree@vger.kernel.org
List-Id: <devicetree.vger.kernel.org>
List-Subscribe: <mailto:devicetree+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:devicetree+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH] arm64: dts: qcom: hamoa-iot-evk: Enable retimer on USB0
 port
To: Prashanth K <prashanth.k@oss.qualcomm.com>,
        Bjorn Andersson <andersson@kernel.org>,
        Konrad Dybcio <konradybcio@kernel.org>
Cc: linux-arm-msm@vger.kernel.org, devicetree@vger.kernel.org,
        linux-kernel@vger.kernel.org,
        Krishna Kurapati <krishna.kurapati@oss.qualcomm.com>,
        stable@vger.kernel.org
References: <20260422093924.2976069-1-prashanth.k@oss.qualcomm.com>
Content-Language: en-US
From: Konrad Dybcio <konrad.dybcio@oss.qualcomm.com>
In-Reply-To: <20260422093924.2976069-1-prashanth.k@oss.qualcomm.com>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit
X-Authority-Analysis: v=2.4 cv=HdUkiCE8 c=1 sm=1 tr=0 ts=69e8a242 cx=c_pps
 a=oc9J++0uMp73DTRD5QyR2A==:117 a=FpWmc02/iXfjRdCD7H54yg==:17
 a=IkcTkHD0fZMA:10 a=A5OVakUREuEA:10 a=s4-Qcg_JpJYA:10
 a=VkNPw1HP01LnGYTKEx00:22 a=u7WPNUs3qKkmUXheDGA7:22 a=_glEPmIy2e8OvE2BGh3C:22
 a=VwQbUJbxAAAA:8 a=wN9py1S4oeCFzi0qT3MA:9 a=QEXdDO2ut3YA:10
 a=iYH6xdkBrDN1Jqds4HTS:22
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYwNDIyMDA5OSBTYWx0ZWRfX1n77pejk+9Of
 C1tYOzo6OzEl3ZihWlScascqBi/JYE8FTvTHezi6SfIQS7BQACowm1rxMipLfpL2oiG8r/n15xI
 HFKQWzKIq1QPfHqZpelHxKnL0PPHuXaLHPCeQ7O6DiJIoTGSPWO2YmlwLDdPIrLF6T3sSg8/N6j
 hV5GNPh/nCm44uhQkVEWNxoaKSX0IA0xpZ1LK9/KcPoukucfksUN5QYPNm/OisKP/giEZrxaaj1
 DRwmnSxkErVe410T1YI90g3Lex4PITmpBZ6h/pcJFUl+byLITQ4jGOFSG87h+az4NDIUEIy5MAS
 GLKpHrSYJsLzNpV8paf4tZTnH+vj6YSFNw4zsI66KxNsRZuama5N+obykcOmTSJ9Cb2sv+USFVX
 Y6epJHlcb4ECFyGVv90mADJFHW9KUdoOJURH23QNAm+I00EMftaZQjx77LaCU7nGF6xSBGjofMF
 2Jv0769awCjw7FR9vcQ==
X-Proofpoint-ORIG-GUID: 6sJerqR_RzWKG94db_nKYQjAci8uhQ94
X-Proofpoint-GUID: 6sJerqR_RzWKG94db_nKYQjAci8uhQ94
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1143,Hydra:6.1.51,FMLib:17.12.100.49
 definitions=2026-04-22_01,2026-04-21_02,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 priorityscore=1501 impostorscore=0 malwarescore=0 bulkscore=0 spamscore=0
 clxscore=1015 suspectscore=0 lowpriorityscore=0 adultscore=0 phishscore=0
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.22.0-2604200000 definitions=main-2604220099

On 4/22/26 11:39 AM, Prashanth K wrote:
> Add the retimer for usb_1_ss0 port (USB0), in order to enable
> super-speed enumeration on that port.
> 
> Fixes: c11645afb0e2 ("arm64: dts: qcom: Add base HAMOA-IOT-EVK board")
> Cc: stable@vger.kernel.org

This is a feature addition, not a fix

[...]

> +		ports {
> +			#address-cells = <1>;
> +			#size-cells = <0>;
> +
> +			port@0 {
> +				reg = <0>;
> +
> +				retimer_ss0_ss_out: endpoint {
> +					remote-endpoint = <&pmic_glink_ss0_ss_in>;
> +				};
> +			};
> +
> +			port@1 {
> +				reg = <1>;
> +
> +				retimer_ss0_ss_in: endpoint {
> +					remote-endpoint = <&usb_1_ss0_qmpphy_out>;
> +				};
> +			};
> +

Stray \n, but you should really have a @2 port here as well.

Konrad
