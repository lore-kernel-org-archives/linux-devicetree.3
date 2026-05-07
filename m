Received: from mx0b-0031df01.pphosted.com (mx0b-0031df01.pphosted.com [205.220.180.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 159673FA5C9
	for <devicetree@vger.kernel.org>; Thu,  7 May 2026 13:40:00 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.180.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1778161203; cv=none; b=GMwFT6naeW97coA0xH9/Qx9oNWvV3/m7d8erLffkVT4VQ1zJoCdmISjpdfeb5dcJDw7YR41gD2p3kyY4hR0yn9UK+BVsHnuZhOWFOyHA7CynTpevnkJMOC8VOOSW0V6DvQVs2Ar22d1uuZyxSP5LQdP417MoJ/yb0h4EA6taMZg=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1778161203; c=relaxed/simple;
	bh=CPV5umvGU4gVipwcB9GO2qUnVfCFQxcnQokc3/cJiCU=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=gtkc3nMZG/E6JFu1bAZzlSru9GsW8/igGLKByFR1TZeLk/758y8xoBpYHHcdqq6oyLMRCiguCBNo/f1yQ7SRAkbn1Dwezv3e0KxEZWv7oo+2WwNXWc4wkmIvtO0GpcG6FN1USvwZfnEbGWrPqzVfJhKaEYSpnFZPZM/6EGBjH/Q=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=Hc3iP69D; dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b=B9j85HDY; arc=none smtp.client-ip=205.220.180.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b="Hc3iP69D";
	dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b="B9j85HDY"
Received: from pps.filterd (m0279870.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 6479xmTO026493
	for <devicetree@vger.kernel.org>; Thu, 7 May 2026 13:40:00 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-type:date:from:in-reply-to:message-id:mime-version
	:references:subject:to; s=qcppdkim1; bh=k7zi0BI+dxwYHFk9GidFN8y/
	SPVtm/1LAmw8uTSSU+A=; b=Hc3iP69D26tiMxATAi9HPUMFDD6Z7HqOiYf2zEHW
	2tr7Yiq7MYD4voD9spB7aB0vVX08NQVwzJ/idjYp/Lg/9WN5i95D1fpzDXLTdhUZ
	BLwNM/iyG5mbel1K2V1z6spMhoOXlFfjClK3HYZEcCK5WheX6kMfyfXt5OUadNnB
	c2WIr5qi9UeviQwbBPRPH23uIbLNyxFNO3uQjOz7QMwTf4WOW7El+LNYbBpLP74d
	fjR3zqiuozqqLgKImrNyGSluCuMyh50xWPe99EBxyYI6ih69eqL0rn9ONtOqIzAP
	4TEt79feozB6Pgjxv4Zl+yrlRku5TS0DDknaVUpYWcVoeQ==
Received: from mail-ua1-f69.google.com (mail-ua1-f69.google.com [209.85.222.69])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4e0k1t24v1-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <devicetree@vger.kernel.org>; Thu, 07 May 2026 13:39:59 +0000 (GMT)
Received: by mail-ua1-f69.google.com with SMTP id a1e0cc1a2514c-948b41f95deso1113025241.0
        for <devicetree@vger.kernel.org>; Thu, 07 May 2026 06:39:59 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1778161199; x=1778765999; darn=vger.kernel.org;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:from:to:cc:subject:date:message-id:reply-to;
        bh=k7zi0BI+dxwYHFk9GidFN8y/SPVtm/1LAmw8uTSSU+A=;
        b=B9j85HDYPxTXiHsR2PybIhtrdJijLTvtVC9F8N3v0A4SVvwL3uTK1ie0LHjmKS8HVm
         2e2EidPYD18XL6L2zJeAxG1CG2AhzlkHDdJQ0tBXshaphk6IrMsiCtQ009EzKcpqVCEt
         V22evvvMSl7mCaiKuzZQvdwCwx7eljFhb0wvhd00ajstyarP7YJxNdXp8Nkl7/aJuLdJ
         QPawko1b8gCQDCT7K7IaV6XmfFQujVW7pBoeWm8n+H1+CV2vaYdod4zUs1uggqKyZ3qu
         GeotkdHk2OD+lpvXj8f8LcPKl07xo/5UkU2tminIkpb1qvWT3T0ZxZ/sxpphKHXmazwv
         DDRA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1778161199; x=1778765999;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:x-gm-gg:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=k7zi0BI+dxwYHFk9GidFN8y/SPVtm/1LAmw8uTSSU+A=;
        b=D6Mwl320BkDvnjsJwWnAYfSG/UuHYXCmyaEwW8Doh1ajSV6SBpl4leBDPzySvrHEu2
         EE9UhVhexkqob3+B2YyiwzuWYX4I7hFrwBA2NVmyFE7yLhCPiqK3mrM00hWIt2l3bhtF
         vhlQ3wdQwQD2SxwOCkW+4Hf/XjfgUi5eDV5EkKomvoC8ThrtDcxj/wzjvI/36nnq4fq0
         /DneNVUA0ZRlrPm7chm7UJ95nnVD/n9kOjIBCdScnsE2aeF4+zJI+DdtEGtvmmboSc1E
         3kz7mo4xR7QZjKSx3LXWSst/3C7Sr4kapOVKgKuBx/7kFWTSBzJqh9I267D2dVihJw0H
         b8MQ==
X-Forwarded-Encrypted: i=1; AFNElJ+DeNWvwLI/wnx2BM34uEDFwHWSreppDxWr/fz8Le7oimnSrtCqk7z2zegPTXkSRmnUtocM4HiS4mC8@vger.kernel.org
X-Gm-Message-State: AOJu0Ywv98Gm5sp+LZdo6v8ljGKw37aM3j5ohqCU8/GIHj/OeAVfrFzc
	DYrG3hygeHBVipiHhrESc7Z12c1cPMdnVDQ39BY+YZEZthFXlIzrcRZbyj0yifhE0yjZWKitRY8
	rvwnrt4omhrlBgAebujtYCLYX92t8vRCRjtVqoMhF3QvRf+/7koRY8Ffw2xZGfFaq
X-Gm-Gg: AeBDievVUVEzA4n6DHRI4x1F6ryaa4Rp60NGax8/Ag+Qd1xlo5PqqtrTZWUDOck9sOw
	9eIbkcP64h1TWlh0U5lOql682KtrL3G1hQCZiqn83evwSM3B+Ol8KCCDPUooHtjU27OCwP/uKMn
	rXBOumL1Kglt+8rCC9dB/K8m4fEk8zqeLWMFKK91nU4xfgqXcZsZLUk3px1lAPqn7gjSRtwVhl7
	ES9zfyA9TVy1gjFOOAsKvJitxPDj3sigHRxbWue636u5wsK58IsxsNdLxauV9dk0V5fig5pisw3
	V0CaJ9O4qSfF1mW8Ma5olzYMIyA3wA2FkiwaA6jxzgRhuSYO1bm6sEi2tu+CG93bhpa5RdLKa3N
	aluyoMaHuFTSbdkluZEFo/9rU5Zd9L10Opj4hJWLHNK83MeW6wfJnTaA9M7gOO5N6kvuFWkxWZP
	Ujpvo8a6/naZpuOe6zkDUNZYw8lTVFK+uaPmqGw/WSRJGl3A==
X-Received: by 2002:a05:6102:cce:b0:62f:3abe:907b with SMTP id ada2fe7eead31-630f8e78839mr4106424137.4.1778161199267;
        Thu, 07 May 2026 06:39:59 -0700 (PDT)
X-Received: by 2002:a05:6102:cce:b0:62f:3abe:907b with SMTP id ada2fe7eead31-630f8e78839mr4106396137.4.1778161198771;
        Thu, 07 May 2026 06:39:58 -0700 (PDT)
Received: from umbar.lan (2001-14ba-a073-af00-264b-feff-fe8b-be8a.rev.dnainternet.fi. [2001:14ba:a073:af00:264b:feff:fe8b:be8a])
        by smtp.gmail.com with ESMTPSA id 2adb3069b0e04-5a85c341848sm5626034e87.65.2026.05.07.06.39.56
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 07 May 2026 06:39:57 -0700 (PDT)
Date: Thu, 7 May 2026 16:39:55 +0300
From: Dmitry Baryshkov <dmitry.baryshkov@oss.qualcomm.com>
To: Sneh Mankad <sneh.mankad@oss.qualcomm.com>
Cc: Bjorn Andersson <andersson@kernel.org>,
        Konrad Dybcio <konradybcio@kernel.org>, Rob Herring <robh@kernel.org>,
        Krzysztof Kozlowski <krzk+dt@kernel.org>,
        Conor Dooley <conor+dt@kernel.org>, Andy Gross <agross@kernel.org>,
        Mathieu Poirier <mathieu.poirier@linaro.org>,
        Stephan Gerhold <stephan@gerhold.net>,
        Jassi Brar <jassisinghbrar@gmail.com>, linux-arm-msm@vger.kernel.org,
        devicetree@vger.kernel.org, linux-kernel@vger.kernel.org,
        linux-remoteproc@vger.kernel.org,
        Vishnu Santhosh <vishnu.santhosh@oss.qualcomm.com>
Subject: Re: [PATCH 4/4] mailbox: qcom-apcs-ipc: Add Shikra APCS IPC support
Message-ID: <ybuup437mpu346fqhnmyuqkj6satxte47sxg25mipy6mn2yvdr@xcjlcbwf5gum>
References: <20260430-shikra_mailbox_and_rpm_changes-v1-0-61ad7c57ef27@oss.qualcomm.com>
 <20260430-shikra_mailbox_and_rpm_changes-v1-4-61ad7c57ef27@oss.qualcomm.com>
Precedence: bulk
X-Mailing-List: devicetree@vger.kernel.org
List-Id: <devicetree.vger.kernel.org>
List-Subscribe: <mailto:devicetree+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:devicetree+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20260430-shikra_mailbox_and_rpm_changes-v1-4-61ad7c57ef27@oss.qualcomm.com>
X-Authority-Analysis: v=2.4 cv=EoPiaycA c=1 sm=1 tr=0 ts=69fc962f cx=c_pps
 a=UbhLPJ621ZpgOD2l3yZY1w==:117 a=xqWC_Br6kY4A:10 a=kj9zAlcOel0A:10
 a=NGcC8JguVDcA:10 a=s4-Qcg_JpJYA:10 a=VkNPw1HP01LnGYTKEx00:22
 a=u7WPNUs3qKkmUXheDGA7:22 a=gowsoOTTUOVcmtlkKump:22 a=EUspDBNiAAAA:8
 a=GA4JE4aC73f7OREyLVIA:9 a=CjuIK1q_8ugA:10 a=TOPH6uDL9cOC6tEoww4z:22
X-Proofpoint-ORIG-GUID: V58iOkG2n7G8deDB7HtBb5RrusPML_PJ
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYwNTA3MDEzNiBTYWx0ZWRfX0OAPbydBO6Ll
 GTIYAQ8SMdRaTDb7+KNbcElZMVGS+a04zQub7hwvKjMkX3eCUxSN0oA400yMnP0wC8XGifGiTeM
 Oa+drcvXwTH+BZZpqzYLeOau+LmQbR8uzhV3PQwALLdXS6y5Mu55ftmeb4SCAMEbR2ggVrto2fX
 7nTXOdAnNntac2DPnBTWzYFsS5GAEs9XXPHPXfoMmOhOSlTl7G7jBcOeJEykpRGCAu1XO1fVIe1
 ImV3tKKKm5PGderYYCHtXwgxnjWa5QD2+oDiyzFBjPug5EtYDlzszPHFymOb3NAvT0GHAgQCgaD
 azEFFtlRp0n69o18dtUSnhPw/W32jjmppR0dAoLWg85MSm5clVqtve6Paj62QKb96rBFR5Zhwzw
 bgApbaiiC50gAwIY1/1Q7WPKg79ftGQ8JQvpBZq2KcsaKPc/uDOQKGGup8d5DTFDgs2SkiAp24K
 Q0itS4Wk+ZpqXZY2FIA==
X-Proofpoint-GUID: V58iOkG2n7G8deDB7HtBb5RrusPML_PJ
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1143,Hydra:6.1.51,FMLib:17.12.100.49
 definitions=2026-05-07_01,2026-05-06_01,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 suspectscore=0 spamscore=0 bulkscore=0 impostorscore=0 lowpriorityscore=0
 phishscore=0 malwarescore=0 priorityscore=1501 clxscore=1015 adultscore=0
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.22.0-2604200000 definitions=main-2605070136

On Thu, Apr 30, 2026 at 03:14:59PM +0530, Sneh Mankad wrote:
> From: Vishnu Santhosh <vishnu.santhosh@oss.qualcomm.com>
> 
> Enable Shikra APCS IPC support by adding the compatible.
> It reuses apps_shared_apcs_data.

This is obvious from the patch itself. Tell us something, which is not
written in the patch. For example, why it uses the same data structure.
Or why we need separate compat string and entry in the driver.

> 
> Signed-off-by: Vishnu Santhosh <vishnu.santhosh@oss.qualcomm.com>
> Signed-off-by: Sneh Mankad <sneh.mankad@oss.qualcomm.com>
> ---
>  drivers/mailbox/qcom-apcs-ipc-mailbox.c | 1 +
>  1 file changed, 1 insertion(+)
> 
> diff --git a/drivers/mailbox/qcom-apcs-ipc-mailbox.c b/drivers/mailbox/qcom-apcs-ipc-mailbox.c
> index d3a8f6b4a03b368821ef9a5b24fee78037104610..25f76965921ba695e3a1bf4df47ce643916a28cb 100644
> --- a/drivers/mailbox/qcom-apcs-ipc-mailbox.c
> +++ b/drivers/mailbox/qcom-apcs-ipc-mailbox.c
> @@ -168,6 +168,7 @@ static const struct of_device_id qcom_apcs_ipc_of_match[] = {
>  	{ .compatible = "qcom,ipq8074-apcs-apps-global", .data = &ipq6018_apcs_data },
>  	{ .compatible = "qcom,sc7180-apss-shared", .data = &apps_shared_apcs_data },
>  	{ .compatible = "qcom,sc8180x-apss-shared", .data = &apps_shared_apcs_data },
> +	{ .compatible = "qcom,shikra-apss-shared", .data = &apps_shared_apcs_data },
>  	{ .compatible = "qcom,sm8150-apss-shared", .data = &apps_shared_apcs_data },
>  	{}
>  };
> 
> -- 
> 2.34.1
> 

-- 
With best wishes
Dmitry
