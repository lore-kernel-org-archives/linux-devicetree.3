Received: from mx0a-0031df01.pphosted.com (mx0a-0031df01.pphosted.com [205.220.168.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id A724830C63A
	for <devicetree@vger.kernel.org>; Sat,  6 Jun 2026 11:57:23 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.168.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1780747044; cv=none; b=d9Y7vnfu1UpIpHqaFxC5gPWO+D6L0i+ugRMB25BSeNeWT8iVwNdxerv7ZMHg/JyI1qGvtQNe7VbNYg7weaxA6kZNcs4UmcqfoIV/1cq10YUBlwQHAa/JQUaIipUB6KyLlQiePnXPg2zSEDMFKQT7LZPVJ/hVSUwjNP03HN0UngQ=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1780747044; c=relaxed/simple;
	bh=waentt4KdOym2AZ3UJsiVMq3XU727IXciRZfMq1s/E4=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=UM0FenOwWgWA5yG1MsJieVBG5aWUswcied9Ce9qNa4wiN2IQwg05RpszlywIKGKabE3Zobsa61jmdVMvZECPUo8kfNBaj1oBMSJKa3HVrXUGgUivUkfQbq7bi06EgdpRASwbWWYopYYAnQFDDupJ6rambta/3/wEzfRkbEa5vl4=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=GCfvyYzI; dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b=f++tpMUM; arc=none smtp.client-ip=205.220.168.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b="GCfvyYzI";
	dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b="f++tpMUM"
Received: from pps.filterd (m0279867.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 656BtWDA1417188
	for <devicetree@vger.kernel.org>; Sat, 6 Jun 2026 11:57:23 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-type:date:from:in-reply-to:message-id:mime-version
	:references:subject:to; s=qcppdkim1; bh=Wey/tSMTRv7+4E+9tdIhwUzz
	H5WVe3KCUdKb6rs33XA=; b=GCfvyYzI9LedX8KY+DsjhJmlSx9hqQ/4EuycW68N
	Eki2VCs42WH24iqhUIJkDHrWxbzzw7UQFAzz5rNcxesGFCVLAIDk5lqUw8MIeX45
	3cBc6qqs/lQRIutv2dpn5m43QARfk0JwCwWqyDevHjijZIgd8+KSEN2GlAxDenXs
	WVfXxs2B47HS6JISUFC2JyTTAE1k4Kz/pKpYft6grMsRsuoqtRSoRG7crM9OWW+3
	gW1R9RXXvJvewmMjcbDO2KkBscrGUUCOveCKMlq0sZoQyz1quTmrMj3b4IJZhdkw
	mQW5JjZ+lQBpik3gIoFQm1Ss8Kdzz7dTKwf3ZP02DD2kQQ==
Received: from mail-vs1-f69.google.com (mail-vs1-f69.google.com [209.85.217.69])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4em98csgea-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <devicetree@vger.kernel.org>; Sat, 06 Jun 2026 11:57:23 +0000 (GMT)
Received: by mail-vs1-f69.google.com with SMTP id ada2fe7eead31-6c4335eef08so2969651137.0
        for <devicetree@vger.kernel.org>; Sat, 06 Jun 2026 04:57:22 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1780747042; x=1781351842; darn=vger.kernel.org;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:from:to:cc:subject:date:message-id:reply-to;
        bh=Wey/tSMTRv7+4E+9tdIhwUzzH5WVe3KCUdKb6rs33XA=;
        b=f++tpMUMPoTPi5E/QFdQ5yDZfbprjmigPPKkwo+KWgz1SejX0rgZmjfvm8H1arKirG
         JfL8C8j/sPCL5ef0sLgxU9OGi94uF9aUF+zpnlOi/KxY6pRX2JT2bO5iAP23b3dP/U3x
         uV12USXE765UwDdCeYeXCmYfx2FUUCbAHqB+G5lv5KANfNvRPzb5fNQIhAguLoF/WA+U
         1yC5oPK42B4rvBSCEL1bc2WqiKgekBSkZV0VGZMo63T5zh/FGftxEptNvVf4cc8rU+aI
         6yo5kPmZ9wQeLCrYgrOpUamv2foajIujCOMyxllFqj8BkE0nY1OgQHJLYmBZ2zpWTRaw
         9cGQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1780747042; x=1781351842;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:x-gm-gg:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=Wey/tSMTRv7+4E+9tdIhwUzzH5WVe3KCUdKb6rs33XA=;
        b=RbQegiP3gAKdCw8ZVWr1HyD0ZadnKvIOl7v2c9v37V68+zmoeQcoULS3di8RcUSLYO
         LXsmCR/rjc6rs6AH7n4RgBE9pkppU5bd8D9ym/F0fF+yXUd0FADIH/4x5xpz7Hbq6NE/
         WFJqgsO0sQpMLG8kilOSjNY+wxIhRhNQXKFQjr288Y9OA8lJ5U4hzWv/N8L0GEanaEQP
         sQ41/RorLrS5I60+jzI1kv+BY7Yh9Tc3HnxR3nNHjoCNAavbMBLrcRvRQLgWH3UAnhYZ
         +EeeFrjp18G2v4MEadUv83BAdS4ZQS2imnSDBOod2RuBiLUvSj5wa5ygzGdYv3VchwkL
         68Wg==
X-Forwarded-Encrypted: i=1; AFNElJ9gUhzL8in16oZVqA5Loamq9X4evqP2t74CTL7Y/JdFoKWZFRJ9DDEUVT9yayEJWF4RZ8D1yEUWO8Zm@vger.kernel.org
X-Gm-Message-State: AOJu0YyBIMtCJ15Cvq6zj1UDxyCwKjvFYAmm1Kk8jovg/f00DzN17BpR
	13MtRBQ4Ms7yAgTzTNZJ6BVoC7JqOGhllXc1oasS9CHPYbpFTG3tZBIeghTLk6ozycE8VL+Q/S4
	VYhaoNGuybtNY7VvV5gj8kbnPnJHQyrW35Vj3H7OaoWljvC0Yaw6hFOiLe9YEuACx4AMSvH1U
X-Gm-Gg: Acq92OEZJBwgWp6LGhj1GL/uPICBeVo/iPYFtejsQqQK018dhUaeB3SXDGTdl+dZDZr
	tTJdAL6qIeYtxWLZ9yFs84J3s5r8S2R4sXW7gFGnOAGfszFdbDrukRkSk1sbPkVSyuGy9V5ZnUZ
	R39qlJSzP6zh7VLXdjgcMMuTE82jmbVLoer344X2GVU8RGltN55sBeYQuYv7XT+NPJj+QaOdW2v
	75CDQITDIf6EKGg1+DYQ0d2gdjHTWyoA6nFXuajS6Tsw90wKSKTHxePN42N2fpHtpGBz0cHgMSk
	uSx0vuahnUuJa7NahrwWl8Ocee5cqiUtxPnoCd9qlTmOa9jP/WHrkXQ1EjOEKCNBvO8nzLqDKXW
	w0uGCkRhLBq5l6vfkOcu1alfmR3NHkshKP8a1nFIlsgxLIpuyJDpCcH9STXYJNgpuxolGiC8fCp
	JAc6A4bPEi5hz3NKOTk+Fw9N6D8Pp5fF/cHiVgSHXPUT7lTg==
X-Received: by 2002:a05:6102:6447:b0:6c8:eb6e:a078 with SMTP id ada2fe7eead31-6feea045839mr3844008137.0.1780747042068;
        Sat, 06 Jun 2026 04:57:22 -0700 (PDT)
X-Received: by 2002:a05:6102:6447:b0:6c8:eb6e:a078 with SMTP id ada2fe7eead31-6feea045839mr3843996137.0.1780747041664;
        Sat, 06 Jun 2026 04:57:21 -0700 (PDT)
Received: from umbar.lan (2001-14ba-a073-af00-264b-feff-fe8b-be8a.rev.dnainternet.fi. [2001:14ba:a073:af00:264b:feff:fe8b:be8a])
        by smtp.gmail.com with ESMTPSA id 2adb3069b0e04-5aa7b99ca90sm2474531e87.84.2026.06.06.04.57.20
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Sat, 06 Jun 2026 04:57:20 -0700 (PDT)
Date: Sat, 6 Jun 2026 14:57:18 +0300
From: Dmitry Baryshkov <dmitry.baryshkov@oss.qualcomm.com>
To: webgeek1234@gmail.com
Cc: Bjorn Andersson <andersson@kernel.org>,
        Konrad Dybcio <konradybcio@kernel.org>, Rob Herring <robh@kernel.org>,
        Krzysztof Kozlowski <krzk+dt@kernel.org>,
        Conor Dooley <conor+dt@kernel.org>, linux-arm-msm@vger.kernel.org,
        devicetree@vger.kernel.org, linux-kernel@vger.kernel.org,
        Teguh Sobirin <teguh@sobir.in>
Subject: Re: [PATCH 2/2] soc: qcom: socinfo: Add CQ8725S SoC ID
Message-ID: <aqjyspitfk3xqb3xorae4upqrdx3whg7ficlb6p4uw3xowoobc@ccdwxeetaokn>
References: <20260605-cq8725s-soc-id-v1-0-bb1ef93de649@gmail.com>
 <20260605-cq8725s-soc-id-v1-2-bb1ef93de649@gmail.com>
Precedence: bulk
X-Mailing-List: devicetree@vger.kernel.org
List-Id: <devicetree.vger.kernel.org>
List-Subscribe: <mailto:devicetree+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:devicetree+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20260605-cq8725s-soc-id-v1-2-bb1ef93de649@gmail.com>
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYwNjA2MDExOCBTYWx0ZWRfX39jwaghPaDkT
 dg+8HvOluYB9jNzPaLDtbc72Jt6llrDWF/bDFXGpRmlX160AICvFeB0gMCmYxuWPb3Ete9Ls3gD
 mOf+HwP7RqNwYaYOua+iifAdL4HgSpgVll59FXBysLHpaUqFbDiSZq2KLNed7fnTccs8bsMkUrn
 azme51nnGvRaq0V/ewuc3qtEJYhTSWhCbo7Lj1FBZ6Jc3VWhJycZwV/K93I2d/V27JdXBjiDH0H
 2yoopExx7ftaTXc1/vhIkkPe51eDZ2SrqAttDEu1apDzV7ohsmkDlg8T5IAc6Q39I4Seti99I6w
 j4uDGMHas9ZPHUpOP+HC/WbHsPHZ0eZSrpWWWCV/Pt6ZlUzbm1aOEQt6q/mpkMHrJfpE25Ffw+y
 N3CmMZ8lbgzJTKf9gx88r9+73UFR7VkWHckf0lXgz+htiVntjna+FegfDJwjVTMUJOzo9S/jpjO
 /0xmr5uYuSVq4ikAaCw==
X-Proofpoint-ORIG-GUID: z734yq-dv03cXmek6CWra4vJ5BeWNVt-
X-Proofpoint-GUID: z734yq-dv03cXmek6CWra4vJ5BeWNVt-
X-Authority-Analysis: v=2.4 cv=A/pc+aWG c=1 sm=1 tr=0 ts=6a240b23 cx=c_pps
 a=5HAIKLe1ejAbszaTRHs9Ug==:117 a=xqWC_Br6kY4A:10 a=kj9zAlcOel0A:10
 a=FelO9ux0wxsA:10 a=s4-Qcg_JpJYA:10 a=VkNPw1HP01LnGYTKEx00:22
 a=u7WPNUs3qKkmUXheDGA7:22 a=eoimf2acIAo5FJnRuUoq:22 a=pGLkceISAAAA:8
 a=l1xjegFVcgAHJcQvvZEA:9 a=CjuIK1q_8ugA:10 a=gYDTvv6II1OnSo0itH1n:22
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1143,Hydra:6.1.125,FMLib:17.12.100.49
 definitions=2026-06-06_03,2026-06-05_02,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 clxscore=1015 suspectscore=0 bulkscore=0 spamscore=0 malwarescore=0
 adultscore=0 priorityscore=1501 phishscore=0 impostorscore=0
 lowpriorityscore=0 classifier=typeunknown authscore=0 authtc= authcc=
 route=outbound adjust=0 reason=mlx scancount=1 engine=8.22.0-2605210000
 definitions=main-2606060118

On Fri, Jun 05, 2026 at 04:49:08PM -0500, Aaron Kling via B4 Relay wrote:
> From: Teguh Sobirin <teguh@sobir.in>
> 
> Add the ID for the Qualcomm CQ8725S SoC which represents the Pakala
> platform.

What is Pakala? It wasn't described beforehand, so please add a note.

> 
> Signed-off-by: Teguh Sobirin <teguh@sobir.in>
> Signed-off-by: Aaron Kling <webgeek1234@gmail.com>
> ---
>  drivers/soc/qcom/socinfo.c | 1 +
>  1 file changed, 1 insertion(+)
> 
> 

-- 
With best wishes
Dmitry
