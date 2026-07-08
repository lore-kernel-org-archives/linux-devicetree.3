Received: from mx0b-0031df01.pphosted.com (mx0b-0031df01.pphosted.com [205.220.180.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 09E253BA237
	for <devicetree@vger.kernel.org>; Wed,  8 Jul 2026 05:32:19 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.180.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1783488742; cv=none; b=EQDZm68kKFqBVgzUTvIthY1pgjuXFDkW2qQmPjnn155XjB+W2BIehCpvgxg7VJoS6/ir2vwBev7meAfTTaW+MkQmOJQGvJtyc6KFT4W23NSDwJReVsCmTPjS7yYN5xKdW2vvEQ9E2rMWGejZoUAdVJ3ZoiDAKGoZ3fEIMG7vlsQ=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1783488742; c=relaxed/simple;
	bh=CfGwp4sRltWJnhxId3QetivNUX7yJL8o70vbQVYKWVA=;
	h=Message-ID:Date:MIME-Version:Subject:To:Cc:References:From:
	 In-Reply-To:Content-Type; b=KGFYjsaWgfH3Zz2IqIg8FHN7mXqxpnsyKikDu6AN7QafU2ooAgdRXDb0aGTHAcaH1PGHClAwBFK0uGCwqy6Ml5TkUHU9BhZbreHpUiFFUFOf2zdTQugS1L6+/MLp/oK9pEk1EiN3KEUQXRdMoGgvzL7yNoP+WKniH44g/FQGSug=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=CpvlSJgy; dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b=NIT8t8Sc; arc=none smtp.client-ip=205.220.180.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b="CpvlSJgy";
	dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b="NIT8t8Sc"
Received: from pps.filterd (m0279870.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 66842mDh1625656
	for <devicetree@vger.kernel.org>; Wed, 8 Jul 2026 05:32:19 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	U1dcvQOjzdEFeDS9jSCqL2FDg3lGBLE0ADMTjQl3vc8=; b=CpvlSJgyUzLu+y5p
	YjUhl5ozRvtVrp+FN+A82xm6xR+QGQrKhGPJkNaWpnd9Ix9Bg6M/WwB1k3hMa2rZ
	HUnXBN8LdF92JS6IHSWgsyZMh7LH3e3hIUo9Gsu8LZR1PSI+TqghsAMu9lYMf7Zq
	WdnLwd6wSMZRuX974/hNC2s6N6hqaXEGA5LHSgrDN2S2JSjwXgVsvlqfB8YssZsG
	LWbR3vPzsFIreINdnVCk4LPTF3FYbMPv7woZ8FFyPUBdfunpyFnhHbWOq4bOI9pB
	tldyCECUONNVpAH3INkZF4IPOD5lyUpj47cTE6vMPyruPfJQQzXtQz7fsTfXlmBU
	gtysMg==
Received: from mail-qt1-f199.google.com (mail-qt1-f199.google.com [209.85.160.199])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4f95fd2t55-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <devicetree@vger.kernel.org>; Wed, 08 Jul 2026 05:32:19 +0000 (GMT)
Received: by mail-qt1-f199.google.com with SMTP id d75a77b69052e-51c0d6a2f4cso2922061cf.3
        for <devicetree@vger.kernel.org>; Tue, 07 Jul 2026 22:32:18 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1783488738; x=1784093538; darn=vger.kernel.org;
        h=content-transfer-encoding:in-reply-to:from:content-language
         :references:cc:to:subject:user-agent:mime-version:date:message-id
         :from:to:cc:subject:date:message-id:reply-to;
        bh=U1dcvQOjzdEFeDS9jSCqL2FDg3lGBLE0ADMTjQl3vc8=;
        b=NIT8t8ScRNATnzpHQUbCmFOmkiau5lcaQggnKZDTV5ZZ/WbOryYmB44/4jOtwniRjd
         19uRwm6kqx4ZS3SVEHrPygTgnaLlNzmxWdReSxaMfURMejJn6pHt7DvB4hqbBtncfuAq
         fYQW6dXkiApOTptMZLu7cDGqSz2V7nda4DRIjgpni6p06dtWdCBi3SuTNbOL0TJSFBZG
         xFQMD1hyhG6viGGtPm2uo3CbhexbeZWlKwUk/lC10Da6/INu758dsUUJj+O8StSiVkJh
         uzJjmiXkD9GMqmyDMrMj1ae7972ZJSSPwuWDEclcuqDxAQpFlkdCE+WnRd9mxwLcMfRc
         r/XQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1783488738; x=1784093538;
        h=content-transfer-encoding:in-reply-to:from:content-language
         :references:cc:to:subject:user-agent:mime-version:date:message-id
         :x-gm-gg:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=U1dcvQOjzdEFeDS9jSCqL2FDg3lGBLE0ADMTjQl3vc8=;
        b=UF20tVJlU3/lPKFD/TTlH7MlFiDmjrsL4i7u8jpvGC+f2gJ6mE8ykwLgFHWWGPmDVv
         B8dExgMRkaNvrhC1sjHBPZmyvz7JFZBMUhv/KLGLaNqRQRaIHoIBgM81MIHIA5lYsj7w
         D1qfzhgRAJGVys9KhT4wc0Bq28VlZuhL89joBLzG5o+R7tjaJSajgJMqje6K3KqPRVqS
         KJgAzXXlWIphT1/wHI/zqzgYulbgKTaLh4x23X5uCcK5MYIcE3JkL/EU8ekeLmPQPwVb
         Y1YAgYCxWVrZQKbAeyfQXetj6oHZWrD19mbrEU6NymvQDXoQ1jc9VM4EANQpLNRU1tGT
         c8Hg==
X-Forwarded-Encrypted: i=1; AHgh+RoEVNZ7J4g5aK4RZr7mTjxyW7drmVeCctUArYrV5TeMSvpcH8MqEvuFZk9NwFps1OVkKTqTL3KYGL8n@vger.kernel.org
X-Gm-Message-State: AOJu0YzT3YUe7Pgw5Dw4IS6kPpd4oH+M6FejRt37cwTcGCAd8jtj2gDM
	5y7egS3NZUXw/YdwroZ9m5ZD/y9UQgvQhqRYfdIkhrU9XlZqm/Ysli5arwoZWTbxhjya1BbzNuL
	MQtiyPxC5rz4lcTryPVPk17fRZi8JLuAZe1XnGT6S8Z2UMqQW7u6IMO0V+5fDJi9N
X-Gm-Gg: AfdE7cmY99mT+TXzpBWdZs6xZ5m16Ht2DtoALM0L7aaPfmOCrlPsyCRZbaz3bf0yIS5
	GUaOgtzu93D2wAYGabHCcsZOJ1WpEe17VYLVL0UyiC70dt0pyByE1H8C+5t4+9ZgVzg+6A0LLmD
	WbrFENuCTtQtJYHtmYoe2m6jtbEcmC5A7zJRgCJCs58c0XpunRxNSQ4q0MI8WsmyD6WS7mNxGZZ
	11G5gUmBJ1DWbIXWkTNZQPDNngVHJrRuMxr9B0f/k/WVkf3KEs0t7su+2QwoO4TRxzbdIxjr7gl
	iCWKvs4gO7/e4KyOFM6SreEtrbGTD4HO0nSwA9ibDHOHukunm8qsWRZRj5lx4EiZGbGSK/VFFrp
	W3UHmBUNGurVqWRhtlxEGykI36GyNjbYKSUNCbmDlm2oZqQ==
X-Received: by 2002:a05:622a:588:b0:51c:7b12:5ffe with SMTP id d75a77b69052e-51c8b5767ecmr10578421cf.74.1783488738426;
        Tue, 07 Jul 2026 22:32:18 -0700 (PDT)
X-Received: by 2002:a05:622a:588:b0:51c:7b12:5ffe with SMTP id d75a77b69052e-51c8b5767ecmr10578181cf.74.1783488738002;
        Tue, 07 Jul 2026 22:32:18 -0700 (PDT)
Received: from [192.168.0.172] ([49.205.252.114])
        by smtp.gmail.com with ESMTPSA id 4fb4d7f45d1cf-69a19cd88aesm6799785a12.3.2026.07.07.22.32.08
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Tue, 07 Jul 2026 22:32:15 -0700 (PDT)
Message-ID: <b9be4ed8-a012-42f8-9241-69d4e57ab0e0@oss.qualcomm.com>
Date: Wed, 8 Jul 2026 11:02:04 +0530
Precedence: bulk
X-Mailing-List: devicetree@vger.kernel.org
List-Id: <devicetree.vger.kernel.org>
List-Subscribe: <mailto:devicetree+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:devicetree+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v6 03/18] media: iris: drop IRIS_FMT_foo enumeration
To: Dmitry Baryshkov <dmitry.baryshkov@oss.qualcomm.com>,
        Abhinav Kumar <abhinav.kumar@linux.dev>,
        Bryan O'Donoghue <bod@kernel.org>,
        Mauro Carvalho Chehab <mchehab@kernel.org>,
        Bjorn Andersson <andersson@kernel.org>,
        Konrad Dybcio <konradybcio@kernel.org>, Rob Herring <robh@kernel.org>,
        Krzysztof Kozlowski <krzk+dt@kernel.org>,
        Conor Dooley
 <conor+dt@kernel.org>,
        Vishnu Reddy <busanna.reddy@oss.qualcomm.com>
Cc: linux-media@vger.kernel.org, linux-arm-msm@vger.kernel.org,
        linux-kernel@vger.kernel.org, devicetree@vger.kernel.org,
        Dikshita Agarwal <dikshita.agarwal@oss.qualcomm.com>
References: <20260708-iris-ar50lt-v6-0-374f0a46c23b@oss.qualcomm.com>
 <20260708-iris-ar50lt-v6-3-374f0a46c23b@oss.qualcomm.com>
Content-Language: en-US
From: Vikash Garodia <vikash.garodia@oss.qualcomm.com>
In-Reply-To: <20260708-iris-ar50lt-v6-3-374f0a46c23b@oss.qualcomm.com>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYwNzA4MDA1MCBTYWx0ZWRfX9p3X+T7XPJ5N
 VsjX9wiI9dgOW24I3bPaPa8UAUUHh25IdrCXdFyhUbyJ6p1VrMubtJoQTcFL9yIHLbJDS9BRQKA
 wENjfAV1CZwDVhsmouUYM9r6OoLNVIZFuh+NIzH7InVYY6xhZMn+gtLahMgiLSyWQS4QkKkGTI4
 Ogl7Vln2zyl8W4/5WierMkFqhcYZVdv29Ov/lVI8zNgnZ7V6tP8JOKsLU6cL8NcwDAHigqa29qI
 rf7oeuFUUFvgVVnT9seXo7u/4zPl/CuDvEKwvvcDWxRMBE9dSF3haUQypSY7STeDA1KuG91veHZ
 g5ClV+t1PfbOZxTi5RUpDOdlt0ZrVEoWZ4ICDk0hfQ7nj/ahWU9ttWf8e2JAlAqrvKlI+VYnnEa
 iZy2JE35QCRInj6cg8VfbwcxmjnA+uf8zornw6xfOgFP6own9nlkaXGeioEekUlF7S2xHnlzh5J
 XFVbfGivrKg8Jsn0ggQ==
X-Authority-Analysis: v=2.4 cv=VZLH+lp9 c=1 sm=1 tr=0 ts=6a4de0e3 cx=c_pps
 a=WeENfcodrlLV9YRTxbY/uA==:117 a=bHmrfCP7B8u675IrmFjzDQ==:17
 a=IkcTkHD0fZMA:10 a=RAioF0-LDSMA:10 a=s4-Qcg_JpJYA:10
 a=VkNPw1HP01LnGYTKEx00:22 a=u7WPNUs3qKkmUXheDGA7:22 a=gowsoOTTUOVcmtlkKump:22
 a=EUspDBNiAAAA:8 a=rxka54P1vYUHB5Al0hYA:9 a=QEXdDO2ut3YA:10
 a=kacYvNCVWA4VmyqE58fU:22
X-Proofpoint-ORIG-GUID: d27DRyN7wKCa4EtwQwm58XpaYwXl7Fht
X-Proofpoint-Spam-Info: AW1haW4tMjYwNzA4MDA1MCBTYWx0ZWRfX0SrFlOe7FM5e
 e3TFYlD6XeX21N3mRm4+5rfd2wDdJ4JTHTlnltzcpPuIXuTs/o5WqID6QM7ydJW2C3W42+bSVF4
 h2QQMC5bHKwgkaa+OAcAs6goAMfaShA=
X-Proofpoint-GUID: d27DRyN7wKCa4EtwQwm58XpaYwXl7Fht
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1143,Hydra:6.1.134,FMLib:17.12.100.49
 definitions=2026-07-07_06,2026-07-06_02,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 impostorscore=0 bulkscore=0 priorityscore=1501 suspectscore=0
 lowpriorityscore=0 spamscore=0 malwarescore=0 adultscore=0 clxscore=1015
 phishscore=0 classifier=typeunknown authscore=0 authtc= authcc=
 route=outbound adjust=0 reason=mlx scancount=1 engine=8.22.0-2606150000
 definitions=main-2607080050


On 7/8/2026 3:58 AM, Dmitry Baryshkov wrote:
> The IRIS_FMT_foo defines are only used for indexing values in the format
> enumeration arrays. However this kind of enumeration doesn't follow the
> V4L2 logic (which expects an array with consequitive indexing rather

Nit: s/consequitive/consequtive

> than a sparse array) and complicates adding support for platforms which
> support different sets of formats. Drop this enumeration and use flat
> lists of supported formats.
> 
> Signed-off-by: Dmitry Baryshkov<dmitry.baryshkov@oss.qualcomm.com>
> ---
>   drivers/media/platform/qcom/iris/iris_instance.h       | 14 --------------
>   drivers/media/platform/qcom/iris/iris_platform_vpu2.c  |  6 +++---
>   drivers/media/platform/qcom/iris/iris_platform_vpu3x.c |  8 ++++----
>   drivers/media/platform/qcom/iris/iris_vdec.c           |  8 ++++----
>   drivers/media/platform/qcom/iris/iris_venc.c           |  8 ++++----
>   5 files changed, 15 insertions(+), 29 deletions(-)

Otherwise,

Reviewed-by: Vikash Garodia <vikash.garodia@oss.qualcomm.com>
