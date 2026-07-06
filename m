Received: from mx0a-0031df01.pphosted.com (mx0a-0031df01.pphosted.com [205.220.168.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 40CB4303CAE
	for <devicetree@vger.kernel.org>; Mon,  6 Jul 2026 13:59:53 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.168.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1783346394; cv=none; b=hoCZ5O+2Y8DOPTyB4l9Gf0aY78nOAlfW2ce3f006Fq7siY4xOyXnx0b+wRBn0hYHI2fgw8Ib6a+4Ruvy/cTbvk+FDjVj6TnkcZOfun7/rEwnY4yMuBZClu/C0HaP9pOM1cpjOaPpdV9igEBs/3UjOw+XWPWXj25Qsh6qzdK+PRk=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1783346394; c=relaxed/simple;
	bh=jXPeWbqboVixEnetwSWC5UEDFMEKnoWn4zr+JcaIatc=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=H10wWAUAGz/AOGyQkPjN08NAIeCuOERltYVtPS8Aion1f7sBmCTOqxiCdHbkIkbmE6JzglAIMjVj7kSkwOOaPzcPY9CD+p+VHGVO7CLeEUsDppKt4/XId4T95ygCVv4W24sG1+6mksnw5ME2UzOnNOHXKBrEegDFgWjv6iItlsk=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=pQMPUNIq; dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b=TRsa+aST; arc=none smtp.client-ip=205.220.168.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b="pQMPUNIq";
	dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b="TRsa+aST"
Received: from pps.filterd (m0279866.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 666AxDnf238262
	for <devicetree@vger.kernel.org>; Mon, 6 Jul 2026 13:59:52 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-type:date:from:in-reply-to:message-id:mime-version
	:references:subject:to; s=qcppdkim1; bh=0ah2qZwWFY3bPwxLCdOZ4hBH
	jz9IEGBG34zE+2NIOkk=; b=pQMPUNIqwKhFdLcfNpb1d4jqObDcW3cnNaN6kVW0
	hRVo3irpUR5AkinBBBpyQ3WzrLRws6NOf0r7Ga3MTME2KiobV9OzuRHDESRsscoc
	a93BG2rJl5XHZB21i8D8vW6Y/7/qg4OZ/eXyTO1JVi4M8IhX/iJCAjybGg2co/RG
	hfuatSbBh8LIGpJfmdLxarnJSEl1vfyY/w4SXtug0cJI5MWqxrdr95hp0/VHIBzc
	llhzpsag42wiO/OcD6dmRm2JRSJNql0HF1E/6VRuNRFWxTQJ9UnFxCqRPEjM40CQ
	he6uqnIo9Ln3N6enp7ILkMNmLZzljIHM5CW2s1G55OoypA==
Received: from mail-vk1-f198.google.com (mail-vk1-f198.google.com [209.85.221.198])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4f88t89ae0-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <devicetree@vger.kernel.org>; Mon, 06 Jul 2026 13:59:52 +0000 (GMT)
Received: by mail-vk1-f198.google.com with SMTP id 71dfb90a1353d-5a1912d5c85so3932900e0c.0
        for <devicetree@vger.kernel.org>; Mon, 06 Jul 2026 06:59:52 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1783346391; x=1783951191; darn=vger.kernel.org;
        h=in-reply-to:content-disposition:content-type:mime-version
         :references:message-id:subject:cc:to:from:date:from:to:cc:subject
         :date:message-id:reply-to:content-type;
        bh=0ah2qZwWFY3bPwxLCdOZ4hBHjz9IEGBG34zE+2NIOkk=;
        b=TRsa+aST7OTTytN33mCC8DQdtoGkHgsIcpFs7Q/JSaCdcaEV+R/EB4OdBWSGz63zWh
         DhSa95mqgoaV6KexQ57SHpsdAUhv9Hea6G2HIPFKQF27nTj70Hym7wTyTgY3LojJxq7Y
         YVFLjF6+K6+fsUQRTZFjHm2qnt6HPAjQUk/9x/dhH8C3J5mngk99MWJ6/i2zC6a8Goek
         UtyqqivoA79xw5PKk9oC2L2FKVfsAnu0XjcFOEmmn+QZDO5Dq03HYHRWNtJ2zInNfac6
         wslyp4T4yvmiGHUNpb66f/pHHPaHZx6/tzQ8AGkJJaalXucVNim9HQAb9JLznVxb2UVQ
         xpcQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1783346391; x=1783951191;
        h=in-reply-to:content-disposition:content-type:mime-version
         :references:message-id:subject:cc:to:from:date:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=0ah2qZwWFY3bPwxLCdOZ4hBHjz9IEGBG34zE+2NIOkk=;
        b=TX1bgbZKy99dJ2HnxUjugwmSaLRurAMWM61fmoAJwADZpKgf66NcQ4WptyDeLtpYlz
         ZEMibw/7EAYwB+XtiyczcZ9pUtO8eSvuIHM963xpUT3cERQ0Z42lGyXp4QiNH6+HsH53
         HnUZ19CVjiEdSUb8/+SOhcy+3bSJ/6HAjz7pzI2eHBTP2FJiEwM7+0Tq0nVzXnbdkn96
         dVQC1t+Hxwf3juwrsUUrfVY6JX9lKy3Y+X0pXYGbLd02iDYl4Jwfsi6sKlDn5IjnghVb
         sajbSlkuuekwqw3jfrmoevELJzoSizOaWJ1aymjlXbPpHl+NO7/pMZrMyUU9D95fNxSX
         1Myg==
X-Forwarded-Encrypted: i=1; AHgh+Rq9mp48xBIMa1hG7HnctiXzHhrJeypEVHtw7BoEBzg9xgR3iunPDJCzK26IF6YCpbrGWQXUqrtz75Jl@vger.kernel.org
X-Gm-Message-State: AOJu0YzMsI44yHHzHzaUNsyPzHqGS5fNpYFzYeFkkHPqymZxfUbBdFOx
	EadALO/dth7rJSLnqtPS/SnOD8TiSkjuwsyD4bfzTWEDoynG1qFc0xDKdvT6kR7R/ybZtuUKQff
	1PD4zzK+pC6qABVAVRjDbSuWYC+9O+6LBKDo/ghXTGZrllV8j4vqu/H1EpNAYQ4Qu
X-Gm-Gg: AfdE7cniwuL7VkN6tOvRvIC0vOdelCPhmWic0K2LQjTz7lW6Zw3zFDOq5CM9R5Cjj+q
	lVb1PjYgPKFfok6b+l29lj1Bw61P2vvQcqxXx0lIVHlJN24RGtqUsL8x19kjQXniXd+RcT1L1kK
	2nVriF5bZQonOKxLfrKErzYXlAz3VMoFg8m3tOgL84abKWO/kNuyc1Mi9YjULm+aFnbIoZp9pL5
	UwFC/yGPWwqnUP1RhwGKFBCbz7ukBAVsXBfbpb9bEePkZpKZzb0cUKbLyfqpmBf8WJfLJ8iRbmj
	ZHkjr7bpxQvNQPaBeFLkXIfdCw897YBVXLrZUKzYquHX7LP/0+Q8JnCHXwqD7fxJe3gMT+Y93cV
	XZt9SW98s1ITtUOcU/GeCorAoK5XRpENQ5Eh14sGoXr2DjSD1wwWAnbh4ITVbf6cd9Kds0kSB8C
	jDoXXq7pRA0l41E9DXf6neEcpS
X-Received: by 2002:a05:6122:6591:b0:5bd:c32e:b6de with SMTP id 71dfb90a1353d-5be908d732bmr354811e0c.14.1783346391308;
        Mon, 06 Jul 2026 06:59:51 -0700 (PDT)
X-Received: by 2002:a05:6122:6591:b0:5bd:c32e:b6de with SMTP id 71dfb90a1353d-5be908d732bmr354790e0c.14.1783346390851;
        Mon, 06 Jul 2026 06:59:50 -0700 (PDT)
Received: from umbar.lan (2001-14ba-a073-af00-264b-feff-fe8b-be8a.rev.dnainternet.fi. [2001:14ba:a073:af00:264b:feff:fe8b:be8a])
        by smtp.gmail.com with ESMTPSA id 2adb3069b0e04-5aed1377052sm2893474e87.21.2026.07.06.06.59.49
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 06 Jul 2026 06:59:49 -0700 (PDT)
Date: Mon, 6 Jul 2026 16:59:47 +0300
From: Dmitry Baryshkov <dmitry.baryshkov@oss.qualcomm.com>
To: Alexander Koskovich <akoskovich@pm.me>
Cc: Vikash Garodia <vikash.garodia@oss.qualcomm.com>,
        Dikshita Agarwal <dikshita.agarwal@oss.qualcomm.com>,
        Abhinav Kumar <abhinav.kumar@linux.dev>,
        Bryan O'Donoghue <bod@kernel.org>,
        Mauro Carvalho Chehab <mchehab@kernel.org>,
        Rob Herring <robh@kernel.org>,
        Krzysztof Kozlowski <krzk+dt@kernel.org>,
        Conor Dooley <conor+dt@kernel.org>,
        Bjorn Andersson <andersson@kernel.org>,
        Konrad Dybcio <konradybcio@kernel.org>, linux-media@vger.kernel.org,
        linux-arm-msm@vger.kernel.org, devicetree@vger.kernel.org,
        linux-kernel@vger.kernel.org
Subject: Re: [PATCH v3 2/3] media: iris: Add support for Milos (VPU v2.0)
Message-ID: <cq6g5btaybsaloxcnlpruqg7tivve6jew4f2dak3dmpqj4h3xg@gpaogxd7xwfm>
References: <20260705-milos-iris-v3-0-8c1353530f24@pm.me>
 <20260705-milos-iris-v3-2-8c1353530f24@pm.me>
Precedence: bulk
X-Mailing-List: devicetree@vger.kernel.org
List-Id: <devicetree.vger.kernel.org>
List-Subscribe: <mailto:devicetree+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:devicetree+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20260705-milos-iris-v3-2-8c1353530f24@pm.me>
X-Proofpoint-Spam-Info: AW1haW4tMjYwNzA2MDE0MiBTYWx0ZWRfX3YpaGn465oNH
 mRVMrxNGjGgNvsdlR7EPRcIBZUem9fBCG/DLAoKPX+nmJKozGai8HiQraQvbrmPrwc7UVmhu8kZ
 hISv6ZPL/zXO6cycFtY3vN3Mig0kGuE=
X-Proofpoint-GUID: fyiYwO5PLAMKlRRxySXPJu-RomFMRfMO
X-Authority-Analysis: v=2.4 cv=C6zZDwP+ c=1 sm=1 tr=0 ts=6a4bb4d8 cx=c_pps
 a=1Os3MKEOqt8YzSjcPV0cFA==:117 a=xqWC_Br6kY4A:10 a=kj9zAlcOel0A:10
 a=RAioF0-LDSMA:10 a=s4-Qcg_JpJYA:10 a=VkNPw1HP01LnGYTKEx00:22
 a=u7WPNUs3qKkmUXheDGA7:22 a=YMgV9FUhrdKAYTUUvYB2:22 a=vkwYq-XpzzMP6zU4_eYA:9
 a=CjuIK1q_8ugA:10 a=hhpmQAJR8DioWGSBphRh:22
X-Proofpoint-ORIG-GUID: fyiYwO5PLAMKlRRxySXPJu-RomFMRfMO
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYwNzA2MDE0MiBTYWx0ZWRfX/NU3m1S0OIHU
 L9uZIyYDKbjfXzAwaSQiY8RWzplLB+IWafj33gKek/lKSEax/VS5yLa1sSdregacspvPABLwjre
 PHTU0JVpb/bQrdmsd5phY76x9W/lmvrI5YiGBAMj0cjhudMeN4SaWxoOM3ihteeQz7a0V4AfD3q
 fVF2qNyjYhK9OHQRddvl/JEj+YbzShiSgj3kkZ+r5fuI2nNXZDS8Q9xG1QAQeuadYWHXGlKCe6y
 u//xWGVLj2Np1mFDNULWdrevemDwtth81Etwub6zwvxUrOPPVzWuOVJohqwQPf0gWnxp2wFRAs8
 UvbquIlTi3QEk3sEvVWHSt/azFGyQzMaGGb7ZtBwrbk7ZhUPMJ4wYfxIY3IW/X8xTQRV/pNE94w
 93Us/Aesuywhx8rVyHDuXgYSgwa/aQ8Vi/rzdQ5ZszSivWCPlm/zSJLO6Cmo2hltAkOk5kHF4T+
 EVwk/P8ijc4i2onSchg==
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1143,Hydra:6.1.134,FMLib:17.12.100.49
 definitions=2026-07-06_01,2026-07-06_01,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 impostorscore=0 phishscore=0 clxscore=1015 spamscore=0 adultscore=0
 bulkscore=0 priorityscore=1501 lowpriorityscore=0 suspectscore=0
 malwarescore=0 classifier=typeunknown authscore=0 authtc= authcc=
 route=outbound adjust=0 reason=mlx scancount=1 engine=8.22.0-2606150000
 definitions=main-2607060142

On Sun, Jul 05, 2026 at 10:10:35AM +0000, Alexander Koskovich wrote:
> Add support for the Milos Iris codec. This only supports the variant
> found on the SM7635-AB that has half of it's pipes disabled via efuse.
> 
> Signed-off-by: Alexander Koskovich <akoskovich@pm.me>
> ---
>  drivers/media/platform/qcom/iris/iris_hfi_gen2.c   | 883 +++++++++++++++++++++
>  .../platform/qcom/iris/iris_platform_common.h      |   2 +
>  .../media/platform/qcom/iris/iris_platform_milos.h |  28 +
>  .../media/platform/qcom/iris/iris_platform_vpu2.c  |  35 +
>  drivers/media/platform/qcom/iris/iris_probe.c      |   4 +
>  5 files changed, 952 insertions(+)
> 
>  
> +static const struct iris_firmware_desc iris_milos_desc = {
> +	.firmware_data = &iris_hfi_milos_data,
> +	.get_vpu_buffer_size = iris_vpu_buf_size,
> +	.fwname = "qcom/vpu/vpu20_p2.mbn",

Nit, please use vpu20_p2_gen2.mbn at least (or, better,
qcom/vpu/vpu20_p2_gen2_s6.mbn or _s7, depending on the MBN signature).
It won't work with gen1 vpu20_p2.mbn.

Otherwise, looks good to me.

> +};
> +
>  static const struct iris_firmware_desc iris_vpu20_p1_gen1_desc = {
>  	.firmware_data = &iris_hfi_gen1_data,
>  	.get_vpu_buffer_size = iris_vpu_buf_size,

-- 
With best wishes
Dmitry
