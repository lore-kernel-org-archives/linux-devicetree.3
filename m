Received: from mx0b-0031df01.pphosted.com (mx0b-0031df01.pphosted.com [205.220.180.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id DFDD6363C75
	for <devicetree@vger.kernel.org>; Fri, 24 Apr 2026 12:12:48 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.180.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1777032770; cv=none; b=LMpE6nGhKugDCRPEf6KLxiXo46DuT+W5KhaajnYFvYvS43/CF892LUBklPXbzgjUcqCutXa+/ee2z+yo9FhvlHFXq24kQ19cXMU/IESNsz5BK6vRyQ9aZVp3EE7vgzajfhZEFEOXeA5ocJP2qQtrhtY/T9RivajGsuCFEaaocZI=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1777032770; c=relaxed/simple;
	bh=6bVEhxDPL/ZWx1/XX7ho824LJzK+ojKXWO7M3Xs0DvI=;
	h=Message-ID:Date:MIME-Version:Subject:To:Cc:References:From:
	 In-Reply-To:Content-Type; b=bqUaCvFBUgakO2/AcjcBQEGX1vK3jt2AAMCOqUnnKPNyivl5bIyn9dvi5pUFFfe0RL2NXAsGv5PqqqgY108cQ+CQJKWXnvq7XfDeT350se9sqaJGMv+S3582N/obtnPARf/+JksX2gHaY05Yzzt1f4X3g1MWe9Ezwqlf9Eq6kPc=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=YJKIkNls; dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b=Lbj95eLp; arc=none smtp.client-ip=205.220.180.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b="YJKIkNls";
	dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b="Lbj95eLp"
Received: from pps.filterd (m0279873.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 63O8T8U44012360
	for <devicetree@vger.kernel.org>; Fri, 24 Apr 2026 12:12:48 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	kvrxBPxJ4spIKzdmAJY9KIZTEEqPiHPJFMwufdx8aqk=; b=YJKIkNlsV+6BbCK0
	njsoYlhr57NAcstghLD43m3zyCi+cS+uHT34wT3/dWlOmXGrgXy26Om28Xgi1VhQ
	MoJSMl6kawvgEOWAgJiAV78eBoB9ocivF8HTweOTCmir83k+ysEA9BrOBM1mURLv
	4B986ze67MLC6T1XyBWSJiOeCNY9K4ncvLXBjDdLcAup7h8JZvAY6zkAPkQXRLP+
	1mxLodqlGahJ+KicTaD379w9+2Nv6Z71RMxrV4q1e+uITO21QOFANXtm3l8f57Gz
	Uq7je0fHhwy6aMyvFTE7eEPYSqqvHH0XaanFtYQPxH41+ko0HZF7hr7nMyUHGLeG
	x54QWQ==
Received: from mail-vs1-f70.google.com (mail-vs1-f70.google.com [209.85.217.70])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4dqpq9vd7h-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <devicetree@vger.kernel.org>; Fri, 24 Apr 2026 12:12:47 +0000 (GMT)
Received: by mail-vs1-f70.google.com with SMTP id ada2fe7eead31-610503b689eso9581645137.0
        for <devicetree@vger.kernel.org>; Fri, 24 Apr 2026 05:12:47 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1777032767; x=1777637567; darn=vger.kernel.org;
        h=content-transfer-encoding:in-reply-to:from:content-language
         :references:cc:to:subject:user-agent:mime-version:date:message-id
         :from:to:cc:subject:date:message-id:reply-to;
        bh=kvrxBPxJ4spIKzdmAJY9KIZTEEqPiHPJFMwufdx8aqk=;
        b=Lbj95eLpQpfjnFqghApC9pfLQN7XlPRZ/KZLFPT9wDSwNNRXVNBpmvFL884d+gF2Rx
         ZKOnoXFMMj4VvETYwfzuSIIkOWJ8ODIJcKlZkhIwUW0Fmzhr5KJcp0UAtXnqXPiyIK7+
         PKP0hr6VpocxssdZ3U7Lbpz5KRjHQYUdZv5N1Ce/JFusGigEb/y7VAPRZRhq3nSXQoBu
         IOXP3iZzqB40RcOrdBcJTIXLRArmlhPi15lnUUtbFxgfCSQzGEOjJh01M3yNj8gwILqd
         GcjCgke1R9KfkGLtfz4QzQmRFUWxWqkqBQWsq2CJ9BbqWnoAcKaoqSID8NQ28XRgQ+vD
         Tf+g==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1777032767; x=1777637567;
        h=content-transfer-encoding:in-reply-to:from:content-language
         :references:cc:to:subject:user-agent:mime-version:date:message-id
         :x-gm-gg:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=kvrxBPxJ4spIKzdmAJY9KIZTEEqPiHPJFMwufdx8aqk=;
        b=daGFUPCD32YBbhXcUxftSxOsFnUIF8CVxtyMwgwPB/a6r3uzYjHIS9lqp+olYGnY42
         ZaKjdZMdoYBb/6KTt2Iq21cEcjn9Q9KjV4LzlDELGe1LKh+BoLNajM6qTv2SGEnDliiv
         8LdTs7idISb85ayIDk0oWNfq8TjB+6W96J6a1+eIC45nnSBF70q5B0CiGJNk9tYXtRFI
         6rd/xMqXHHzHuPMUp0UQ/nE21xn7jfcpVxho34/fs++7+OmbY+wOaLKi3RzfnPnzozpk
         nwrFC8q6HxX7mML4ClIY/mT7YXvKL8dTU4bEQHIWtJF5a3XBCZJTH9nKo9n5xXOG/Bx4
         1VCw==
X-Forwarded-Encrypted: i=1; AFNElJ/7VoEe1TpAYebqZGZi/6w9fI6Pg8X55tZz/Wj84dBxI4cpAynT4R1z+MfxfuEZapJMLXNb5Le2dPb2@vger.kernel.org
X-Gm-Message-State: AOJu0YyVQ6IK6RWBn8LInubIfixdCt1NPB8jhdg9/nEu4hzZlGXTu7U/
	jpBIxJaPX0ZcKaKGbjgjRKq/HDwRyDkTFtK594qWWNoieW8OFZEOmcwVvB9hNXk8WHEUn6nJQQs
	oFPgoLSQlYcQplAeh2+/Ll52eckDr5KlwR8fJdBSSvZPOGe58STkgP3JXlIz/jGK/BWqvf1/LTv
	4=
X-Gm-Gg: AeBDiesnLpxa9QtAZ0RmxIzaA/irCdCmvKRQ9ZauFeSmZ4mt5TKk45+wcxjJATEsO5V
	TvGEydhlp/7MaU2S53i6AzaP5A4x4v55kpcTAk+yJPb/cnJRgrQCbjqGHTx441PAiFkihKC28s0
	iakdMQRy4WFFlHWpcxc1ickXGiCXQl6cEWuIw0XMWchQfXAJfshehJ8VzYTfAA/4LLtlOyWFQRx
	EDuA8jNx8LGe/2Mqbyj5Ye1YB+K5x2TtjNgFcREB/opXsxipV6zv72A2Rw3J69Br9VEDjI3DovJ
	vFpTTA4kWV49XABiz6SFmvfLlojFg17rblk2qpDeCUGzAwQKYBPqk5qD/Nhkqv4NerZXqkLtimM
	Dn/5CdyqFZVPfTPAzor4FdXEaidW5xg+fK/d0uxWEnz/Km4pr/14mWfQix56XwIkzJAer/Kw02e
	vur9UD1klR2B05HLTfKsY=
X-Received: by 2002:a67:e718:0:b0:5ff:cd6e:85fe with SMTP id ada2fe7eead31-616f58ac93dmr16827049137.12.1777032767291;
        Fri, 24 Apr 2026 05:12:47 -0700 (PDT)
X-Received: by 2002:a67:e718:0:b0:5ff:cd6e:85fe with SMTP id ada2fe7eead31-616f58ac93dmr16827035137.12.1777032766920;
        Fri, 24 Apr 2026 05:12:46 -0700 (PDT)
Received: from ?IPV6:2a05:6e02:1041:c10:1ab3:98b0:9e96:47bd? ([2a05:6e02:1041:c10:1ab3:98b0:9e96:47bd])
        by smtp.gmail.com with ESMTPSA id 5b1f17b1804b1-4891bba6276sm183047835e9.0.2026.04.24.05.12.45
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Fri, 24 Apr 2026 05:12:46 -0700 (PDT)
Message-ID: <68723e33-53ca-4a66-8777-945cdcfce6fa@oss.qualcomm.com>
Date: Fri, 24 Apr 2026 14:12:44 +0200
Precedence: bulk
X-Mailing-List: devicetree@vger.kernel.org
List-Id: <devicetree.vger.kernel.org>
List-Subscribe: <mailto:devicetree+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:devicetree+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH] dt-bindings: thermal: qcom-tsens: Document Nord
 Temperature Sensor
To: Pankaj Patil <pankaj.patil@oss.qualcomm.com>,
        Shawn Guo <shengchao.guo@oss.qualcomm.com>,
        Daniel Lezcano <daniel.lezcano@kernel.org>,
        Krzysztof Kozlowski <krzk+dt@kernel.org>
Cc: Rob Herring <robh@kernel.org>, Conor Dooley <conor+dt@kernel.org>,
        Konrad Dybcio <konradybcio@kernel.org>,
        Dmitry Baryshkov <lumag@kernel.org>,
        Bartosz Golaszewski <bartosz.golaszewski@oss.qualcomm.com>,
        Deepti Jaggi <deepti.jaggi@oss.qualcomm.com>, linux-pm@vger.kernel.org,
        devicetree@vger.kernel.org, linux-arm-msm@vger.kernel.org,
        linux-kernel@vger.kernel.org
References: <20260420065409.1249030-1-shengchao.guo@oss.qualcomm.com>
 <a4f6b7f5-6566-4c73-9c4f-e43c3cafa75a@oss.qualcomm.com>
Content-Language: en-US
From: Daniel Lezcano <daniel.lezcano@oss.qualcomm.com>
In-Reply-To: <a4f6b7f5-6566-4c73-9c4f-e43c3cafa75a@oss.qualcomm.com>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYwNDI0MDExNiBTYWx0ZWRfX63J2IBkAr3l7
 CjPqILvGVOLF9tvhIk1TCVB+bxF7AnOegkAp+DbtRT1vY8TjTmgSoeMltmQ+1Q47oy/coKtGg5U
 w9F+MgC3K85coF9ZXSWJ1hJ7ZgTLeVdqnd3DpLjtXMNYsdYc58gkc4YW560wDHqYPzs+3/+vkgu
 YwX0Q5xSZCmrw8tqNxGFqqOrFM+bWrwaq0IB/qGR1B6gjSSKwIykK+C6bQwJOr6aIdyv4xtObEc
 M7KHip6DjL/v22ODzI3fClqU0qWV0vLiO9nVH6UWhQG8eZgdpGS40J7LOAZ6zI50CPKI/vxkRIU
 dWI5eEv/2cscMnlRjp4U4ea4Xcd9alhqh4gpxYiUIgq7tCAycxZYjIyQAtDc1je6i3hpjF82eS3
 cL9bFTL4vU/O7muw/YhboGrCjohOTCfLcIikasHftuvmza2aCqNIiPEkUTEDM+FmV1Hlx7oEjNM
 iK3I+unZ8PX+zwkJOPA==
X-Authority-Analysis: v=2.4 cv=FPMrAeos c=1 sm=1 tr=0 ts=69eb5e3f cx=c_pps
 a=N1BjEkVkxJi3uNfLdpvX3g==:117 a=xqWC_Br6kY4A:10 a=IkcTkHD0fZMA:10
 a=A5OVakUREuEA:10 a=s4-Qcg_JpJYA:10 a=VkNPw1HP01LnGYTKEx00:22
 a=u7WPNUs3qKkmUXheDGA7:22 a=rJkE3RaqiGZ5pbrm-msn:22 a=EUspDBNiAAAA:8
 a=mK3fh9KgnU1kiJb0dKkA:9 a=QEXdDO2ut3YA:10 a=crWF4MFLhNY0qMRaF8an:22
X-Proofpoint-GUID: MA4_BSlspDS6XI_uhU16ixOyXfoXbvIl
X-Proofpoint-ORIG-GUID: MA4_BSlspDS6XI_uhU16ixOyXfoXbvIl
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1143,Hydra:6.1.51,FMLib:17.12.100.49
 definitions=2026-04-23_03,2026-04-21_02,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 clxscore=1015 phishscore=0 bulkscore=0 suspectscore=0 lowpriorityscore=0
 adultscore=0 impostorscore=0 priorityscore=1501 spamscore=0 malwarescore=0
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.22.0-2604200000 definitions=main-2604240116

On 4/20/26 11:19, Pankaj Patil wrote:
> On 4/20/2026 12:24 PM, Shawn Guo wrote:
>> From: Deepti Jaggi <deepti.jaggi@oss.qualcomm.com>
>>
>> Add compatible for Temperature Sensor (TSENS) of Nord SoC with
>> a fallback on qcom,tsens-v2.
>>
>> Signed-off-by: Deepti Jaggi <deepti.jaggi@oss.qualcomm.com>
>> Signed-off-by: Shawn Guo <shengchao.guo@oss.qualcomm.com>
> 
> Reviewed-by: Pankaj Patil <pankaj.patil@oss.qualcomm.com>
> 
>> ---

Krzystof,

are you ok with this change ?
