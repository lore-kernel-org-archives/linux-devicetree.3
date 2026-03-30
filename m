Received: from mx0b-0031df01.pphosted.com (mx0b-0031df01.pphosted.com [205.220.180.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id BC14B3C3C1E
	for <devicetree@vger.kernel.org>; Mon, 30 Mar 2026 11:21:26 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.180.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1774869689; cv=none; b=cqBzgPR6MrfxJNqJBgnofbmvCBL0Zeg+MB2cVzQrdJf83e2hiMDsb2RIWUm5pXPbjJ7WpzSRTafkbUPFBtLDDpa8u2pBl3LMTs7hkHSHGI5X5EnTHi2VqXjNBWtJAnCtXFCxnMlWycKdmGQrBnOU2rnXPXwxQljuh6OK6cjJlbk=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1774869689; c=relaxed/simple;
	bh=Bg9krAw7ueDQsORyfQo9j1l4u0mDgQNLOjwkDMzxrnY=;
	h=Message-ID:Date:MIME-Version:Subject:To:Cc:References:From:
	 In-Reply-To:Content-Type; b=EIMOoPcCkmP24XF+5QHiYpWR0upX2Q47zaoxxPGCcn06lnIpQP9dg+ufHPEdll1HJa1pfkeHoT3a4ItcFuuOPM9+Tf/4msMac30uF4MrZFs+BwF8qOFqKWk3NFSXUzxbomAy+fXbAn350m9Qg5fA6KemmsC1SkN79hasiOmQy8s=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=YmCBxfD7; dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b=jfrHrMkD; arc=none smtp.client-ip=205.220.180.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b="YmCBxfD7";
	dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b="jfrHrMkD"
Received: from pps.filterd (m0279870.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 62U78Ur14162006
	for <devicetree@vger.kernel.org>; Mon, 30 Mar 2026 11:21:25 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	6Ic1nLhA2BVLZfE93GgGLyyBeF9wvtvwcAK8zVyhSjI=; b=YmCBxfD7q9t9r63g
	ibklCkOWxq+X99CAEkisCUvvmaMndfimumjsGGt56ykUo3Idd+NNX4CoZrCn3msV
	Ermoq1ZyYt6DLxBHSqD5EW+9Mo7kdYyFdW1KKhoVGqnwD2LquUGdgrks9twJQQWz
	sFuUmO/tkXoUZpHKlxV9lJKQAf4Zx3nfIKKlTb/mYknDImbRj0PnSoykkvYlAFxT
	3Wt1Xzgwf9GBQi36HV0pMnBeNU8gQQsQo3g0YpZIWbtMm2fzOOPWAqUr79Yh/jnR
	ryGt9jd/98dd/irm2L2YC/pgE6M/1JzwE0L9oTlgSEoHMab/XVezQAODw9ftX2zX
	ql1KFA==
Received: from mail-qv1-f72.google.com (mail-qv1-f72.google.com [209.85.219.72])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4d7mharyff-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <devicetree@vger.kernel.org>; Mon, 30 Mar 2026 11:21:25 +0000 (GMT)
Received: by mail-qv1-f72.google.com with SMTP id 6a1803df08f44-89f59c9bd28so4920846d6.1
        for <devicetree@vger.kernel.org>; Mon, 30 Mar 2026 04:21:25 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1774869685; x=1775474485; darn=vger.kernel.org;
        h=content-transfer-encoding:in-reply-to:from:content-language
         :references:cc:to:subject:user-agent:mime-version:date:message-id
         :from:to:cc:subject:date:message-id:reply-to;
        bh=6Ic1nLhA2BVLZfE93GgGLyyBeF9wvtvwcAK8zVyhSjI=;
        b=jfrHrMkDwwECD0sqms1v+SxPwy9v8WiB4aIypHfhTG6/+goQmSRikK9Plrd1nkpJZ3
         LloYGYCuGvtunXjvhwHgdnii0/YrXQI20B1B0sDsUM3r6PnPokGArDcAUwWLuvdajgLi
         2z+n6+Rhgr6Mim0jT3QJD8QeC2Zbhjd4HLp5FUbJY0dV3zIoJUzijA78Xa6nkgUTutVD
         mjH9TV4XcggvS1KnBmDO4JFdLwdVO8N0EP2w+bspPbblcMluIXy4LBRjSE4VYoWBlJmx
         QGZlQ0yPErGEk73y9jL5f0l0Vj586VJXVi3XMHVxA/EiTM1WrF4sFAZhsfTFA6xhQ1xM
         mbyA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1774869685; x=1775474485;
        h=content-transfer-encoding:in-reply-to:from:content-language
         :references:cc:to:subject:user-agent:mime-version:date:message-id
         :x-gm-gg:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=6Ic1nLhA2BVLZfE93GgGLyyBeF9wvtvwcAK8zVyhSjI=;
        b=lch/3/RrB1KNQnEV1RtuVW7VGKbKnS9WH2DkcSCL6+ebMZLTvs8X4vtMCutScC3VTL
         Pql++ncuuKmHm5viG1sqQnBTkHabbYSYmH4+8ifQYQBAQto1wow7WUJHkmrtTLDIC1QV
         XzcUjjgeZyvDQqH4N7/xJ/iXM3DP29kK6iqQMpOASjzv7e9uOW8/hv4Ycne3ezynMhce
         LPDXi11FDCSvQUEEg7GPBGEWBI6GT7oWD+7rJ1Arq7LQHV1jfHh3Zxz92XGtLAR/m9HJ
         byXpxCfNmVa0Mw76v1Ltbl1vXWdKezwBKt81Z56nKcmrIBbAb6+gGMdY1YB/aA7nRw8j
         Cogg==
X-Forwarded-Encrypted: i=1; AJvYcCXxwCo7jJRTrsvw9q3I80Qgy1nlV701t3wxK+NxrLfoNb2ltQJDweM1ZvDFUTdmaRefsUozqa0iaIi/@vger.kernel.org
X-Gm-Message-State: AOJu0YxmOeedBmthhHwxJ66kiaoqDJ1d8eCdpbU6Q5mEzaVJDIiQ0p3m
	zx7PiIxTQQsZRmEExW6v1ee/+0vb1oII6lFQ8TdedqMhr6vcWfjst+o90kkaYJ9thUDytsCsd9U
	9FuuBEu1YoLI5Wd4OSyBtTCjuRejX2DeOUn0+BkS/32cW7sQnSfeypiPn7JFZnen7
X-Gm-Gg: ATEYQzzKJSCQrWSIISXfT7xeseaRDqAyvuZtQlDNwrmbQh8zxGcZ+7HSZvO2LqI8/uR
	WRgjvLPP2zAbsR+YHnqTvKbkbyOZj7jYqt7zTpBsOVk9QPbQtl22uhT6q+5qOQ9aR9OQCR2x8ji
	0rHjfrcdet4dMtX1lUKWgZexRKyJLrTTrz/hg2qHQdKg+dmBSLUnOnv42YhTnZfIZ+nYHo/B3/b
	e6D583Pv5s26LlSpWxJ0i/8jI6Y4wHrhEehRXgmS6Z1H5HoWThVjr447WyQa6hHUChK8ExPMGgc
	IC/ZU3iXnw9DPRIqunSZU+B5ROFOzKMVEV3JAj4HerGQGVhmATyo1c0/+xRaodiy78qkPh07pyP
	Byf1/S/gOvjMxrkcX/kASmZ1Exwm8X5ZxRHcxw1RjUn0Lnfc3q+4hFIm1yj4JAqkiyspx81z6lc
	KAtcs=
X-Received: by 2002:a05:6214:1bcd:b0:89a:575e:ec01 with SMTP id 6a1803df08f44-89ce8ceca2amr129623496d6.1.1774869684865;
        Mon, 30 Mar 2026 04:21:24 -0700 (PDT)
X-Received: by 2002:a05:6214:1bcd:b0:89a:575e:ec01 with SMTP id 6a1803df08f44-89ce8ceca2amr129623056d6.1.1774869684399;
        Mon, 30 Mar 2026 04:21:24 -0700 (PDT)
Received: from [192.168.119.254] (078088045245.garwolin.vectranet.pl. [78.88.45.245])
        by smtp.gmail.com with ESMTPSA id a640c23a62f3a-b9b7b1a5fb3sm282004366b.31.2026.03.30.04.21.21
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Mon, 30 Mar 2026 04:21:23 -0700 (PDT)
Message-ID: <df073955-476c-4abf-a0cc-b5842089371a@oss.qualcomm.com>
Date: Mon, 30 Mar 2026 13:21:20 +0200
Precedence: bulk
X-Mailing-List: devicetree@vger.kernel.org
List-Id: <devicetree.vger.kernel.org>
List-Subscribe: <mailto:devicetree+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:devicetree+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v2 1/1] arm64: dts: qcom: hamoa: Fix incomplete Root Port
 property migration
To: Ziyue Zhang <ziyue.zhang@oss.qualcomm.com>, andersson@kernel.org,
        konradybcio@kernel.org, robh@kernel.org, krzk+dt@kernel.org,
        conor+dt@kernel.org, jingoohan1@gmail.com, mani@kernel.org,
        lpieralisi@kernel.org, kwilczynski@kernel.org, bhelgaas@google.com,
        johan+linaro@kernel.org, vkoul@kernel.org, kishon@kernel.org,
        neil.armstrong@linaro.org, abel.vesa@linaro.org, kw@linux.com
Cc: linux-arm-msm@vger.kernel.org, devicetree@vger.kernel.org,
        linux-kernel@vger.kernel.org, linux-pci@vger.kernel.org,
        linux-phy@lists.infradead.org, qiang.yu@oss.qualcomm.com,
        quic_krichai@quicinc.com, quic_vbadigan@quicinc.com
References: <20260330020934.3501247-1-ziyue.zhang@oss.qualcomm.com>
Content-Language: en-US
From: Konrad Dybcio <konrad.dybcio@oss.qualcomm.com>
In-Reply-To: <20260330020934.3501247-1-ziyue.zhang@oss.qualcomm.com>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYwMzMwMDA4OSBTYWx0ZWRfX1Dk4453qt4eJ
 Frpxp86IHnNdDY8RA7BvgF8mczfpl7d4ETDMHNWuLx05l+3pvygRgruCfZQcYtluWVqRVak8HEW
 TvApVLhhZ2qJrvoyxlRsF8R0B/NrZS6b33HL3MtCpSHp3MXEwkpTgXlfOSyWLeD0Hkik4nJ3mDg
 dGWdLHBjGK87it4xTx5wy8/VsKIrrdoefLkRHV5MZ5MtHuSPeHDmMASBssO3jpIoYviGlwA779V
 hdbUe4x3hsyQLeB4KnMOIL1POgLPa9k6aYm6qZ8QvRW1k8O2A0NzAbgnahZ6mrwB1hrpIZOgE4T
 Oj55fSrnh+AmRq57eqQMviFTgAWz65EGlRLX567bP2/j60NcrxVrUipPMfSPzaeWiiuf4jkvy3B
 AXFRnUKYhkZnoev9bCJfsX5Z3OWPsWCTWI7KaYYw04j6fjhENkVKTB7QlXeikf0vFLriInqw0w0
 msHGtAMAyr7Dkz7vcyg==
X-Authority-Analysis: v=2.4 cv=Fbw6BZ+6 c=1 sm=1 tr=0 ts=69ca5cb5 cx=c_pps
 a=7E5Bxpl4vBhpaufnMqZlrw==:117 a=FpWmc02/iXfjRdCD7H54yg==:17
 a=IkcTkHD0fZMA:10 a=Yq5XynenixoA:10 a=s4-Qcg_JpJYA:10
 a=VkNPw1HP01LnGYTKEx00:22 a=u7WPNUs3qKkmUXheDGA7:22 a=gowsoOTTUOVcmtlkKump:22
 a=EUspDBNiAAAA:8 a=tO3S9EIgoizo5XbbBjkA:9 a=QEXdDO2ut3YA:10
 a=pJ04lnu7RYOZP9TFuWaZ:22
X-Proofpoint-ORIG-GUID: rqBMyr-EOKSxPg5BA_alZUjejoR_4Zgi
X-Proofpoint-GUID: rqBMyr-EOKSxPg5BA_alZUjejoR_4Zgi
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1143,Hydra:6.1.51,FMLib:17.12.100.49
 definitions=2026-03-29_05,2026-03-28_01,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 malwarescore=0 priorityscore=1501 adultscore=0 impostorscore=0 clxscore=1015
 phishscore=0 suspectscore=0 bulkscore=0 lowpriorityscore=0 spamscore=0
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.22.0-2603050001 definitions=main-2603300089

On 3/30/26 4:09 AM, Ziyue Zhang wrote:
> Historically, the Qualcomm PCIe controller node (Host bridge) described
> all Root Port properties, such as PHY, PERST#, and WAKE#. But to provide
> a more accurate hardware description and to support future multi-Root Port
> controllers, these properties were moved to the Root Port node in the
> devicetree bindings.

[...]


> --- a/arch/arm64/boot/dts/qcom/x1e80100-medion-sprchrgd-14-s1.dts
> +++ b/arch/arm64/boot/dts/qcom/x1e80100-medion-sprchrgd-14-s1.dts
> @@ -1033,9 +1033,6 @@ &mdss_dp3_phy {
>  };
>  
>  &pcie4 {
> -	perst-gpios = <&tlmm 146 GPIO_ACTIVE_LOW>;
> -	wake-gpios = <&tlmm 148 GPIO_ACTIVE_LOW>;
> -
>  	pinctrl-0 = <&pcie4_default>;
>  	pinctrl-names = "default";
>  
> @@ -1050,6 +1047,8 @@ &pcie4_phy {
>  };
>  
>  &pcie4_port0 {
> +	reset-gpios = <&tlmm 146 GPIO_ACTIVE_LOW>;
> +	wake-gpios = <&tlmm 148 GPIO_ACTIVE_LOW>;
>  	wifi@0 {
>  		compatible = "pci17cb,1107";

nit: This single hunk misses a \n before the subnode, but maybe Bjorn
could fix that up while applying?

Reviewed-by: Konrad Dybcio <konrad.dybcio@oss.qualcomm.com>

Konrad
