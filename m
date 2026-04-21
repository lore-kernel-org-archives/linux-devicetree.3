Received: from mx0a-0031df01.pphosted.com (mx0a-0031df01.pphosted.com [205.220.168.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id AE85F3B7767
	for <devicetree@vger.kernel.org>; Tue, 21 Apr 2026 10:30:23 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.168.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1776767425; cv=none; b=pzqK8xT/4QVcPG/qLDR1LUyIJKc6BajmbkGnvVl1MF//NKWSz3zca4M+IWhodzcbIHuoeXQ0nke0eKNgoubl/9UDvlLF6OKKaBU9ClnU9/MSN/ZeK3YJJyYPLDgW6403JcwPoSWjef6rmchXuy2OsZsLLoItThdvQ1B/AG9hOI4=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1776767425; c=relaxed/simple;
	bh=mKvt+355AELGxSVEoeEvJasrsUpGv3nK72jz1jq0yQA=;
	h=Message-ID:Date:MIME-Version:Subject:To:Cc:References:From:
	 In-Reply-To:Content-Type; b=lYsg816HxSYWfc7z4LpPqqAxR9QR+x3x1f46jBYqJAxEbC+FCWvda5+VlVCb4r1oFj+IKxKx3Bf/9ujdev+rLi5N9qPYPvCxhvAi+eV9aBaNAgzjT8lqbwW2LAtA0yQ7QMwUqWBnCnDSPNQHEqp2hBxMvH+XTYdXNhYKM3HbiME=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=WC4q1OYb; dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b=dhHzChpe; arc=none smtp.client-ip=205.220.168.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b="WC4q1OYb";
	dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b="dhHzChpe"
Received: from pps.filterd (m0279862.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 63L5689W1013380
	for <devicetree@vger.kernel.org>; Tue, 21 Apr 2026 10:30:22 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	JNmo0MvXitGjzDF9gX1mzHnoa+gPnmQSwMzVOjYY3uY=; b=WC4q1OYbxbM8/6mR
	dU3hWujdoeUHn7dTS0FAPJ1yBpVfSf7zu/LEMRs2No3aoNRpqefXpz8SUOPe7IUP
	dKdXoxn3+gdlSeBFAQsbLBcZwATdlAQj49JMSD8AEHo5r90cKL6oIZT2Dhw7H6P2
	8Rjqnwvuz6Ub123lQO1Yh74b6Ih6VPduu7IVaXcAxu06qsymVqNw4lzRgWw4CmWj
	lIfhTUhVi8iMBLFa3CyjKnH2ZEe+S/TA72TIlQMbS6UOFCOpM8a8T5vZlXdIfzqh
	aeH1sc0zejssAElZu/PtsapvAQtot6PQrVwIAdks7g3jE/jAn/Y16MjbBXDBxJZe
	WpSoow==
Received: from mail-qt1-f199.google.com (mail-qt1-f199.google.com [209.85.160.199])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4dnt902r8u-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <devicetree@vger.kernel.org>; Tue, 21 Apr 2026 10:30:22 +0000 (GMT)
Received: by mail-qt1-f199.google.com with SMTP id d75a77b69052e-50fb98b09d3so605791cf.2
        for <devicetree@vger.kernel.org>; Tue, 21 Apr 2026 03:30:22 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1776767421; x=1777372221; darn=vger.kernel.org;
        h=content-transfer-encoding:in-reply-to:from:content-language
         :references:cc:to:subject:user-agent:mime-version:date:message-id
         :from:to:cc:subject:date:message-id:reply-to;
        bh=JNmo0MvXitGjzDF9gX1mzHnoa+gPnmQSwMzVOjYY3uY=;
        b=dhHzChpesM8oddTJMDbOCsZyQZn17p6OLr4ZVVUV6IzNd7Xcv4FhK7ecWB93YZjUUf
         J44LK9rBM8HofdRWWWz9TP8aKRXpfle4I+Vl78+IhgOExzcS6FhPLtOeG69EEDPS/70v
         n2x89y0hnP0SUHlgnRDtBdd7lRQfp2D5VY+R+4LglbOz//9XJd5mdGbKXheUktmFxMJh
         4RSkxWLCGs4PGyWLAXu7uUaABH90N5/gmuB5JT75bPrkgTTl71Yi400/9HYa+1cVbMhE
         MgVdxVN0xg49z5SztdwiEd8+Vc6E2zix5E9+2YpKIVIZbRm1CKL8x3qfUzf85BND9cL0
         /W/w==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1776767421; x=1777372221;
        h=content-transfer-encoding:in-reply-to:from:content-language
         :references:cc:to:subject:user-agent:mime-version:date:message-id
         :x-gm-gg:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=JNmo0MvXitGjzDF9gX1mzHnoa+gPnmQSwMzVOjYY3uY=;
        b=D2upSxgaoTcTZBOJ22t4SYlrwqQfl5pWCuso3D6AFzuTl6ogMi7bstVEHJ1EOubgB9
         ll+3reJJLPYDQQy7tiQ9XjBe1bKgGbmyE/dFY1bdOok6ed+uXIDmaEjHzFAz2NTvLxx3
         RWRCJBTWJ0a74xzzl/6mgjcnkldGwY91mQ+P2i1vrWDfcxmxoI3G8TQpRmvTTcfUpXXA
         27TcqAYz7FL4ZvPckLnDWB5zr4oD0R8EqyeHHCIzVcT2HgSGRAwu5kSKUpgW76dehTAq
         k/Wu2myu++5hIpMxHzYj7PpRPY969t9v/9OGMfmIGxv7Bj9TUFfpIgbwRhDSXFvK5NWM
         2Z/g==
X-Forwarded-Encrypted: i=1; AFNElJ+4FE69Gh+hY7o0cp9CM0gnBFnF7a3lQRCTHCs8Zssk8vbFWMqUC/yYRn5Q+1jHMvWExcUbhDbvLBG6@vger.kernel.org
X-Gm-Message-State: AOJu0YwfILFD6KrNUdPcQgfAgJsgQhTCvf5qZ4Tp4p11+pyMXJz9Y+Pa
	wJiocTpMR+7J9i7GglPQCaqtszeEBOE8RyaKZRoshWcy4AE4J/slSkOn0qtrYuP/4t32kXpBZ3M
	JGkHSZ8UgQaRnhbPIQDzMEqCrizw42UvMhALVkOpsBLK8puDXVnNEy3XD+HSIbN/Z
X-Gm-Gg: AeBDietH5CgQ5/POuE3jNjgfRnf5QsBXnbBN+TNyy2Czyugf61vznRW+7pOYs9puWUJ
	vcaLwZmO/s4BKmOARQSCr618f83N8APWPXHdeK2SzukmmI/ro9oqrTJmWKM/UmQhE2SEf72XHXR
	Hiro7aTt/+MV2kud2OnWON0BnZ90iVGpuC9shXOJpbfjOVbDjcqGRzrMybEdQvVOUle0nUEaBiK
	XLrekgUrkOqIPHYsae56tQJ1yXgrxJLFWcLKmBDOb8M1pqSaajrT27VBj3sXGf8x5Dc2CsgchyS
	S2oCOMI3HcyTypabmkIDdACFB4ZKafRcrFyend0kZYDtbPTM8cnmwx+rJE+lZX2bZTSnQvSSYNK
	E/EkcS0kBIojNmasq6FVVHrHolDpWfcj9fEifU1j3sLpZHeiV1i0jytA0N+4bLBeGTvL8H46fR8
	bqOo6m7dIYbD6EUQ==
X-Received: by 2002:a05:622a:44c:b0:50f:a53b:9d5 with SMTP id d75a77b69052e-50fa53b0cbcmr45350591cf.2.1776767419295;
        Tue, 21 Apr 2026 03:30:19 -0700 (PDT)
X-Received: by 2002:a05:622a:44c:b0:50f:a53b:9d5 with SMTP id d75a77b69052e-50fa53b0cbcmr45349611cf.2.1776767418421;
        Tue, 21 Apr 2026 03:30:18 -0700 (PDT)
Received: from [192.168.119.254] (078088045245.garwolin.vectranet.pl. [78.88.45.245])
        by smtp.gmail.com with ESMTPSA id a640c23a62f3a-ba455045898sm428886866b.48.2026.04.21.03.30.16
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Tue, 21 Apr 2026 03:30:17 -0700 (PDT)
Message-ID: <69515144-2046-47dc-a43d-bd4d0cfd57cf@oss.qualcomm.com>
Date: Tue, 21 Apr 2026 12:30:14 +0200
Precedence: bulk
X-Mailing-List: devicetree@vger.kernel.org
List-Id: <devicetree.vger.kernel.org>
List-Subscribe: <mailto:devicetree+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:devicetree+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH] arm64: dts: qcom: monaco-arduino-monza: add USB-C
 controller and connector
To: Loic Poulain <loic.poulain@oss.qualcomm.com>, andersson@kernel.org,
        konradybcio@kernel.org
Cc: krzk+dt@kernel.org, conor+dt@kernel.org, linux-arm-msm@vger.kernel.org,
        devicetree@vger.kernel.org, robh@kernel.org
References: <20260421101606.411335-1-loic.poulain@oss.qualcomm.com>
Content-Language: en-US
From: Konrad Dybcio <konrad.dybcio@oss.qualcomm.com>
In-Reply-To: <20260421101606.411335-1-loic.poulain@oss.qualcomm.com>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit
X-Authority-Analysis: v=2.4 cv=KfbidwYD c=1 sm=1 tr=0 ts=69e751be cx=c_pps
 a=WeENfcodrlLV9YRTxbY/uA==:117 a=FpWmc02/iXfjRdCD7H54yg==:17
 a=IkcTkHD0fZMA:10 a=A5OVakUREuEA:10 a=s4-Qcg_JpJYA:10
 a=VkNPw1HP01LnGYTKEx00:22 a=u7WPNUs3qKkmUXheDGA7:22 a=_K5XuSEh1TEqbUxoQ0s3:22
 a=EUspDBNiAAAA:8 a=JCuPP5i-eADJVAQJ9zEA:9 a=QEXdDO2ut3YA:10
 a=kacYvNCVWA4VmyqE58fU:22
X-Proofpoint-ORIG-GUID: bb66K6XyWnbJgE52GFyuQAWJ7PJqEW6R
X-Proofpoint-GUID: bb66K6XyWnbJgE52GFyuQAWJ7PJqEW6R
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYwNDIxMDEwMiBTYWx0ZWRfX53sR5xWaveeD
 afJToDm95LtM0ijxB1cuTmQn1v84DichJRSCUudYwGl3zOBHTyDa1V2Xs2xf3fgCVl73ZDkOIiz
 vZxoY1cqpZxlL4WGQU2SffA+0IHdqpNmOncqATzhPLiO5N2/AOMju2mWeGbChG6TZuZ5Whi8ZVQ
 KEY29ayXsc5qzSqrM9hWMmVVotthxHmsFiHYaDiUBg6H5byWbfE7kKnCrZD/J9oPVecoSOww4qq
 wPRQ3nt+n224uhOrHmtpby8/tcFhqZtrLGy+NinGsN5VHZ74oObzaMcCQASF4SjAMBNcgZwh1U8
 caw89MhlidYWScqU8/oWqC1yCkWVyJ4zdnUMyMg/CZkdkvy//vpLuRqLe2yuE7x/bhdkVzWWw81
 ascsXPCR/l6nMvYabLbrWduAvEx9so2ksv66SmKS7UaLrDMP4UM8LUWbFkj4NBccHE/xIDRp3A/
 cn45XNJJCEEphDfZSMQ==
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1143,Hydra:6.1.51,FMLib:17.12.100.49
 definitions=2026-04-21_02,2026-04-20_02,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 phishscore=0 priorityscore=1501 spamscore=0 suspectscore=0 bulkscore=0
 lowpriorityscore=0 malwarescore=0 adultscore=0 impostorscore=0 clxscore=1015
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.22.0-2604070000 definitions=main-2604210102

On 4/21/26 12:16 PM, Loic Poulain wrote:
> Add the Cypress USB Type-C controller and associated connector.
> The controller is connected over I2C12 and wired to the USB1 DWC3.
> The USB-C connector routes both high-speed and super-speed signals.
> 
> Enable dual-role data and power over the USB-C connector.
> 
> Signed-off-by: Loic Poulain <loic.poulain@oss.qualcomm.com>
> ---

Reviewed-by: Konrad Dybcio <konrad.dybcio@oss.qualcomm.com>

Konrad
