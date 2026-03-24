Received: from mx0b-0031df01.pphosted.com (mx0b-0031df01.pphosted.com [205.220.180.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id C4A0B35A38A
	for <devicetree@vger.kernel.org>; Tue, 24 Mar 2026 20:53:25 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.180.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1774385607; cv=none; b=Nid2wyudccx2VWI2CUjSG3nMZarUjXsh23r5321wjJ7Yd9bUg/v37I1Hd97Thhjz6ojEaKIhxMzYLBZ1naxQaNQVkHSV81c2BQwJh2gKxXWTN3uVCL3+Mkx3tl1jo/CHGpcZuA7XOoeKw+Q9/QwzbE0p//2e9HXtLI/8VCayrc4=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1774385607; c=relaxed/simple;
	bh=NSQDaIc6B+6AKH4NtV4sGz6xY8nqprSwpjDJbl38Ofk=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=u4biUDzfq50Gdn8NN3gbFyu5ErVf0tobMFeM6hkKtX4EhNINrx9hNV7VTeLzHcZmPwPmOJGXmjAg/0iBiJYu1ME375JeyD7e/yUvSrZrKHcEw0qgpj5zaF+jE0MdlKHnCNYsO3f7ZCmCdk6OCluC/c8zwyTDrxbFKmh0TqZ+Qxk=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=FAJTtUAR; dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b=LTQFIWMO; arc=none smtp.client-ip=205.220.180.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b="FAJTtUAR";
	dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b="LTQFIWMO"
Received: from pps.filterd (m0279868.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 62OJCiof907712
	for <devicetree@vger.kernel.org>; Tue, 24 Mar 2026 20:53:25 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-type:date:from:in-reply-to:message-id:mime-version
	:references:subject:to; s=qcppdkim1; bh=uUcSB1EO0xjAITGH0sHDE53x
	GeXK6K+ju8W0/0xClh8=; b=FAJTtUARZXImI/LjWYXkv0MjSrpJcge+EfNpV98q
	ecHUwOwKTKOJXfoJxj6Vq51JTsyK7wfEj03yZ3rpYWz3OQwFOzjdEN8xiBM5brrh
	bHIP4dH643W0AFpfbYfn8iaMVLhsHYMvaYLGMI4cTqUc6FieYhykF2g/d5/uoFHD
	IaRPYaNTQnxVAafeApodGq4bI+QZ1QM2Ya5LDn/B1ahH2qfg7wJuNQcsqc2ov8GD
	Ya0yu4/mBS2EwN32TryKQahLZ91Qqp9ULB5+xbAawN1/SgAFbYHxFgtBUleYwYQz
	BqKvjiU3YQ5oLVJhs9GJm30RjAe0v1n4ODjvSS95v1riTw==
Received: from mail-qt1-f200.google.com (mail-qt1-f200.google.com [209.85.160.200])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4d3ukm9nbx-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <devicetree@vger.kernel.org>; Tue, 24 Mar 2026 20:53:24 +0000 (GMT)
Received: by mail-qt1-f200.google.com with SMTP id d75a77b69052e-50b323c43fdso116789001cf.2
        for <devicetree@vger.kernel.org>; Tue, 24 Mar 2026 13:53:24 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1774385604; x=1774990404; darn=vger.kernel.org;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:from:to:cc:subject:date:message-id:reply-to;
        bh=uUcSB1EO0xjAITGH0sHDE53xGeXK6K+ju8W0/0xClh8=;
        b=LTQFIWMOw2kFGKuSEerya2ErjKd0B6VisgTq2vTE2U+UKoz8XegQ+FOeFPNzee4Q+A
         KCfVQuSfJYJIzsEUvGxGkbWUES84KyBcfXuTVjyH8xKUm2ANXS+3yKsZEgJahyR6tixF
         s1UAzgq4VNFkgKMcLGuJ6C1g7oDgxi+vn2ybV5cjhGf6NnGj3Ij0LEV9RdfYB/vmCIql
         SjK3+40NUR5qgpP+KHAhYAmWYQ7DGQzlL6cTzXHE3W+xQdy3vrWrQqQrXUlQeRU82P2E
         n62nfOfcfE9JbM0iLEqEE8Lom7+pp/bvMLD4liz7dzwXxUamEG1G0fmmYFrtR1Ea2Csf
         F6wg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1774385604; x=1774990404;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:x-gm-gg:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=uUcSB1EO0xjAITGH0sHDE53xGeXK6K+ju8W0/0xClh8=;
        b=joXDKDqseVJbpeW0cBQ/p8oZd1r3mNX8+ndwpR430lCjQtVQqRRu1EwGrb/O/MoWcc
         clxDeoO2ECLtGWVC0jkaMj7Wl5TGHDfFQ4/bD4VM7aHyGCIoC+HV8q77Pvvbg035vMcg
         MJ9DKGX/A+IE4QiDDWYKLOUr9cj6HTBcMklMNVUQVzFLqtlhTCN8s+0gC2X1nFsC7RKm
         d9CM1SwVif2DEEVzD2w1g1Jpu6i+oRiqcVonCHf2+xa4+2vARdMinfW4OlfH7c+jUrT0
         xAo4YETgl8W82ZZ/UHxGPOPZZjgh2sjZ0D2RGQpGVGeED0PatwUl9X0N02So5nml93M/
         wujw==
X-Forwarded-Encrypted: i=1; AJvYcCW7H5WKA+9hWJU8HnQnSPnWGzOoNPvo1Hdj411uepwHXdQtqvZuXNsNtdgdSUuYgU5sLRuPpvpmlq8U@vger.kernel.org
X-Gm-Message-State: AOJu0Yzg8AuODFCKQ2eR/aTBSxMfUo2w2vHHlauIidZFa+/9CWH4HzT2
	KTumtMXlYCxE07bVbdn9BXcKDa4FGCbm1DcbDp6A2Jp2WAnot6rd1kI5D7iWq4T+zgftscL+wOY
	Y43QOpaC0a+Yorp881oSN6RN9iorNwrm5hSwm1JqSBgLATV3K92Mz7q8H9jvstHke
X-Gm-Gg: ATEYQzwxzan4eBsisFMrHucVkdOW2yWIS3lZm7jh4BvGs2JdD8d7MbxK8BG8dtSXQNv
	q26nmrF3NPzzfwIzdiEQ+RiHKjhCLpIG/QgtS3MCEW8bW+StLMGVJoa9wNtTCNOv/D/w4A1mi+o
	vVTMDxqvRtjgG8csfQXB2AobzuczgX/lTq9CZ6OlyatCJhOr65GCngKNHVcRfYqv2XkjRl+lb7d
	r5ayz2b6nWkrxCXtQUQOsDba15tW0ioKrU+IZDUcUw8P2FI5cR4BoSxxwmgSiDFaQEAQn/H9cI3
	N0ftTyILq0oP5FAJ0SlKIeEXtIl3lLWCX4cfYtk8FbvGsE1Ye5g51D4NDf68gbXlk9FNwBk2/8K
	o8OCOHmx02vNVATmRq0nRlSjU90Ka67vm2XNokBLzNE17ll/3tsKz21+pcyMGJA1SdO1R1Uq+cI
	y/6OYFsY88rbjJBFdGaTWitpUSz+bPbAa0FxU=
X-Received: by 2002:a05:622a:8310:b0:50b:5258:28df with SMTP id d75a77b69052e-50b80cd1eeemr15392511cf.1.1774385604122;
        Tue, 24 Mar 2026 13:53:24 -0700 (PDT)
X-Received: by 2002:a05:622a:8310:b0:50b:5258:28df with SMTP id d75a77b69052e-50b80cd1eeemr15392131cf.1.1774385603624;
        Tue, 24 Mar 2026 13:53:23 -0700 (PDT)
Received: from umbar.lan (2001-14ba-a073-af00-264b-feff-fe8b-be8a.rev.dnainternet.fi. [2001:14ba:a073:af00:264b:feff:fe8b:be8a])
        by smtp.gmail.com with ESMTPSA id 2adb3069b0e04-5a28530ccf9sm3368152e87.74.2026.03.24.13.53.21
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 24 Mar 2026 13:53:21 -0700 (PDT)
Date: Tue, 24 Mar 2026 22:53:19 +0200
From: Dmitry Baryshkov <dmitry.baryshkov@oss.qualcomm.com>
To: Viken Dadhaniya <viken.dadhaniya@oss.qualcomm.com>
Cc: Mark Brown <broonie@kernel.org>, Rob Herring <robh@kernel.org>,
        Krzysztof Kozlowski <krzk+dt@kernel.org>,
        Conor Dooley <conor+dt@kernel.org>,
        Bjorn Andersson <andersson@kernel.org>,
        Konrad Dybcio <konradybcio@kernel.org>,
        cros-qcom-dts-watchers@chromium.org, linux-arm-msm@vger.kernel.org,
        linux-spi@vger.kernel.org, devicetree@vger.kernel.org,
        linux-kernel@vger.kernel.org
Subject: Re: [PATCH v1 4/6] arm64: dts: qcom: qcs615-ride: enable QSPI and
 NOR flash
Message-ID: <zwfbabbr4bwlq4bnc7hwy5gbfrs7j52mloukkmyytxwqgl667z@eoq75ye27yul>
References: <20260324-spi-nor-v1-0-3efe59c1c119@oss.qualcomm.com>
 <20260324-spi-nor-v1-4-3efe59c1c119@oss.qualcomm.com>
Precedence: bulk
X-Mailing-List: devicetree@vger.kernel.org
List-Id: <devicetree.vger.kernel.org>
List-Subscribe: <mailto:devicetree+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:devicetree+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20260324-spi-nor-v1-4-3efe59c1c119@oss.qualcomm.com>
X-Authority-Analysis: v=2.4 cv=NLjYOk6g c=1 sm=1 tr=0 ts=69c2f9c4 cx=c_pps
 a=JbAStetqSzwMeJznSMzCyw==:117 a=xqWC_Br6kY4A:10 a=kj9zAlcOel0A:10
 a=Yq5XynenixoA:10 a=s4-Qcg_JpJYA:10 a=VkNPw1HP01LnGYTKEx00:22
 a=u7WPNUs3qKkmUXheDGA7:22 a=ZpdpYltYx_vBUK5n70dp:22 a=EUspDBNiAAAA:8
 a=Nlfn2TMoNVKOkoW8Ct4A:9 a=CjuIK1q_8ugA:10 a=zZCYzV9kfG8A:10
 a=uxP6HrT_eTzRwkO_Te1X:22
X-Proofpoint-ORIG-GUID: M5hVyug0yUgsLBaw8KCXRBnraOdVw5QW
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYwMzI0MDE2MSBTYWx0ZWRfX/7YKZYPYNE6w
 jvaUZBXi0hGlmcSp3bFan68aDbmZ4HQIGm7NTQKp2v7aaPYygeoZa1vfjvKDoGQmYc28QCKaxR/
 /Ul1CFDvTcoz4ChGJgjf0jtjcsigFqQxjgimx2V/vdYFIeGZcYp5mQV6ppUhNnfErlctdYAkf2V
 XsKKcga4R7BLM5RQRXFURYti2A8tbTlk/DfMxaLXvM+3vLbxA6x8lM410/9WpvNB1KKd/RHUNxh
 Kg81aSLuj5oLA9LDgVrt2V40qjeLwSzn3NpWTtCjQ64rvgNjzpYzQsIK7IOjDkogSzmND/qmLNh
 OdNKDAWAO4q/3ToCT6tQI4tYm7HQfxrPrDwtdhrvt/Atw/2hO1/0XcRDwHplzF9wWj/6YY14Ys3
 WvRY7dotZgD9UpCe1KrOR7yhrQ+6yp2sz04SbAs5g0gPsoCOQDFJSS98N9NhmwjYSEkAGpzVY//
 G3GZ3V1RW2VoDqUoC3Q==
X-Proofpoint-GUID: M5hVyug0yUgsLBaw8KCXRBnraOdVw5QW
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1143,Hydra:6.1.51,FMLib:17.12.100.49
 definitions=2026-03-24_03,2026-03-24_01,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 bulkscore=0 clxscore=1015 malwarescore=0 suspectscore=0 adultscore=0
 priorityscore=1501 impostorscore=0 spamscore=0 phishscore=0
 lowpriorityscore=0 classifier=typeunknown authscore=0 authtc= authcc=
 route=outbound adjust=0 reason=mlx scancount=1 engine=8.22.0-2603050001
 definitions=main-2603240161

On Tue, Mar 24, 2026 at 06:43:21PM +0530, Viken Dadhaniya wrote:
> The QCS615 Ride board has a SPI-NOR flash connected to the QSPI controller
> on CS0. Enable the QSPI controller and add the corresponding SPI-NOR flash
> node to allow the system to access it.
> 
> Signed-off-by: Viken Dadhaniya <viken.dadhaniya@oss.qualcomm.com>
> ---
>  arch/arm64/boot/dts/qcom/qcs615-ride.dts | 12 ++++++++++++
>  1 file changed, 12 insertions(+)
> 

Reviewed-by: Dmitry Baryshkov <dmitry.baryshkov@oss.qualcomm.com>


-- 
With best wishes
Dmitry
