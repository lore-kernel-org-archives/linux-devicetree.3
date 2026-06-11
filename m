Received: from mx0b-0031df01.pphosted.com (mx0b-0031df01.pphosted.com [205.220.180.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 8E650368D5E
	for <devicetree@vger.kernel.org>; Thu, 11 Jun 2026 20:17:26 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.180.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1781209047; cv=none; b=N/18yd4MfM4yQ0o7qAo5K8+I5HfdpiVOGKbE3kaIf4G4yGtqX7mKxbi0z2sR7fpdzqcpTxtPsrMj9f5V42h5wRKLOSZpWHnMgmrx2w4uw0i3IbXHoTUcgGzaMJc6nOfDOmyyxMz/LA8rAZ4gIx/6pgni34zlTvB2w09GzX6maWk=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1781209047; c=relaxed/simple;
	bh=Fq0Q/DDsjNcDFSjfHAH1n5aCPkGZos0PsXXjLEEFLMU=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=hPMqRkox5+IpRe5LCP6Qj3tUz1xGWp85eHf1iTDnqu/0cNoDg2MW5TpQdGIamkhP8jQ26QFiutmGe31Gjj4DRbzaIdq4bbRneeYFeWmXWmBqsODdVco2rXrXZPLUQKLX2fz4cbyWZg9Mln6rb8QkLhxs+WMbpJpsK9zuFMn9VBs=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=dNoJbT6c; dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b=d6cP32vl; arc=none smtp.client-ip=205.220.180.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b="dNoJbT6c";
	dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b="d6cP32vl"
Received: from pps.filterd (m0279870.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 65BJ3XHa1512336
	for <devicetree@vger.kernel.org>; Thu, 11 Jun 2026 20:17:25 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-type:date:from:in-reply-to:message-id:mime-version
	:references:subject:to; s=qcppdkim1; bh=W9wdom+aRQF7jsN+TuBvQ4aM
	HYM7LB4K4EuWK4s72GQ=; b=dNoJbT6c4YJCUHvSUJcSwLyni0Ks1N4MiOmotQ54
	5XoF514zeCD+ViI9mrpvqaAioJdXmzMu4i1AbbA6S3qxIeVvlImB0TUG32s/jDcV
	COtmZ4Vo48TWNlE3OtzShOP4IFdkunRl4Uyrct7HTuuVke0agG0eA9XSf/mrPMb0
	gPFMgPTNjwFJBUtN6E8mHV6+hRZEp01cttRIA2gy6nZNzdjxMG+O0LEEA0vLwYam
	rp11DYNZe++mcIo6HJz33SGSju/lgZOsJPxfgZdJSiJPxCLiPEtIbZ2Z0+Rm9DAy
	RuESzTgEPeYjHPIH0qulI+0nmk1a9fpta/cmYVIWbQtwHg==
Received: from mail-vs1-f72.google.com (mail-vs1-f72.google.com [209.85.217.72])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4eqtb5js09-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <devicetree@vger.kernel.org>; Thu, 11 Jun 2026 20:17:25 +0000 (GMT)
Received: by mail-vs1-f72.google.com with SMTP id ada2fe7eead31-6cfc66167c4so75963137.1
        for <devicetree@vger.kernel.org>; Thu, 11 Jun 2026 13:17:25 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1781209045; x=1781813845; darn=vger.kernel.org;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:from:to:cc:subject:date:message-id:reply-to;
        bh=W9wdom+aRQF7jsN+TuBvQ4aMHYM7LB4K4EuWK4s72GQ=;
        b=d6cP32vljT/HA/JEfqCNCw1mz4ohivoDxh9UOKI29K3+pFk9hV2B732AlbegqlTTfy
         APwA64LDT2iDBi2H6CmtlcS1vocb85VWrmmYYF3H6AP4aoHXQBbXzE8AaYB7WfPhiFyV
         RyjPpV+MZ2uFPWIrHYFue1QDgGh5HGB24p2DzYLuig7C5pXyyTVfR4yt0rt3zdqjkxaS
         6Xcrlz4oLuUOkz0FvCfyFA2kDlYLrR5Nm92vAKYNI02ii5QxzRlBYHrtX86puoUDvVZt
         LEjViunmVa+zVP9Lj917lGRYzFzBjvzGIMaG5APd+2JcNQEpezPhfANepu3uzjOXCiDp
         6bMQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1781209045; x=1781813845;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:x-gm-gg:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=W9wdom+aRQF7jsN+TuBvQ4aMHYM7LB4K4EuWK4s72GQ=;
        b=m86amRaQbZyLefwfvlRQ8Aft37z6+ockbTPeaxeiNLP5V3wPJdHhPE1+psYLwauiFC
         /90Wp+QxV7VP1iM+AXf+pTBMfzd8C7Ru3+9ycLzZdiCHCarEqj4hGw3Jg9gnXF7DQgIY
         xnvajE9UPtBp17M1fOta/ryaXI6LviknasyUZR9h5bL0brmlT8bFUV7WZI9fM3PkdRQ5
         igMHOapGPZey7W5/mhxqTG3BCFpP8uMQ7I1a8G+q68mC+ZuQXqy6ZrZ/3Oc+gqt31xQn
         kZBnzhGO35mRYdhTaT5sFmwP6qjzJ6DwijsrLJt5OJgjlpsGZl1DfWy3Niwgs1VtdiI9
         tJOw==
X-Forwarded-Encrypted: i=1; AFNElJ8O7SWQY7ElQCynThuGjUw5Rd3sHPwpRJZoi+ytzchSHhzZ05pXNrM/JolwwVk4pMZ3i+97hXXQFI/m@vger.kernel.org
X-Gm-Message-State: AOJu0YweRhRujEnkXb2sscHeJrpcPKeM0lHRBo1Ck1mP9WbHx3iz1ef5
	QI8PUJZbtYtFOVg2uTebE9NPKYbbJZtVAq2v8OBjn/fZwBSrtimwYxrJtWm0VNLgdUUHyccuJp9
	OaxJ662ElaRtaownJjzr54/rEQTcx+RZErASN7CCl+/L694T1aJEt+8dkoDGetIG3
X-Gm-Gg: Acq92OH2xrbBT5YeEfA4XysgBCQhWR45jBzmk71YyFlZDGy32LC2iXLMR7yfzvkPE32
	xbx1GaVn0QyiPGnLxZIQmMLJpqnqNESj3qf1wyS4z8bakwi0u2Tui3Lun+WW0qoHSBMCP0j7ilX
	A+VK104CdDGKTZQW47It+xhxnaQjTRJoSZMMqJkYpmQPSzHpUaCkgybMsthvvzQeclUlJ84aTVu
	mnnWXzqrAi1e7nC+Uxm7NkxQYUUUM4k+jxN0C02OqlagjMeuNrGJR8GnZfuf2S/pQ4acCaKGT95
	iLk6I11k84SqzuovZ3ZUBLKJ6lcbWblBuHIA6LRT4oPjd6BJQ41p9fb5OQF6gyp55CWg9oOLk4f
	WKiV5B7QJUoNvDJ7h5YucbmI/3Ae0jBqDYFSfGj2L/cP3YkFNdq8GWGYgsQDiTV+unLRZS3n/4a
	dx88ygoxUA8xAO0nV6e7IZobwR6MMXP8iRdIo=
X-Received: by 2002:a05:6102:3e8d:b0:659:3ae:e6d1 with SMTP id ada2fe7eead31-71d5d99fa42mr3015691137.9.1781209044794;
        Thu, 11 Jun 2026 13:17:24 -0700 (PDT)
X-Received: by 2002:a05:6102:3e8d:b0:659:3ae:e6d1 with SMTP id ada2fe7eead31-71d5d99fa42mr3015674137.9.1781209044310;
        Thu, 11 Jun 2026 13:17:24 -0700 (PDT)
Received: from umbar.lan (2001-14ba-a073-af00-264b-feff-fe8b-be8a.rev.dnainternet.fi. [2001:14ba:a073:af00:264b:feff:fe8b:be8a])
        by smtp.gmail.com with ESMTPSA id 2adb3069b0e04-5ad2cd966f0sm114597e87.71.2026.06.11.13.17.21
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 11 Jun 2026 13:17:22 -0700 (PDT)
Date: Thu, 11 Jun 2026 23:17:20 +0300
From: Dmitry Baryshkov <dmitry.baryshkov@oss.qualcomm.com>
To: Komal Bajaj <komal.bajaj@oss.qualcomm.com>
Cc: Bjorn Andersson <andersson@kernel.org>,
        Konrad Dybcio <konradybcio@kernel.org>, Rob Herring <robh@kernel.org>,
        Krzysztof Kozlowski <krzk+dt@kernel.org>,
        Conor Dooley <conor+dt@kernel.org>, Vinod Koul <vkoul@kernel.org>,
        Neil Armstrong <neil.armstrong@linaro.org>,
        Wesley Cheng <quic_wcheng@quicinc.com>, Ulf Hansson <ulfh@kernel.org>,
        linux-arm-msm@vger.kernel.org, devicetree@vger.kernel.org,
        linux-kernel@vger.kernel.org, linux-phy@lists.infradead.org,
        linux-mmc@vger.kernel.org, monish.chunara@oss.qualcomm.com,
        Rakesh Kota <rakesh.kota@oss.qualcomm.com>
Subject: Re: [PATCH v5 3/5] arm64: dts: qcom: Add Shikra CQ2390M SoM platform
Message-ID: <u5uvhewvzkbqto7wk3g3iaxnjijcgelifhlan4shbkopjul4qf@7fzwcygqq47f>
References: <20260611-shikra-dt-v5-0-103ed26a8529@oss.qualcomm.com>
 <20260611-shikra-dt-v5-3-103ed26a8529@oss.qualcomm.com>
Precedence: bulk
X-Mailing-List: devicetree@vger.kernel.org
List-Id: <devicetree.vger.kernel.org>
List-Subscribe: <mailto:devicetree+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:devicetree+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20260611-shikra-dt-v5-3-103ed26a8529@oss.qualcomm.com>
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYwNjExMDIwMyBTYWx0ZWRfXzx81qaW1Qvh9
 lVXljM6K1kRa96cxJZDn/TMDhDOLdK1B3mgqSMsJbT2dX7Gvdpv0u2xCCnYOHNIzjxuYqQf9jYk
 SjVBfSXZMgneMnAs+eYs1BlDLcRgjJaCvzwk6KDm/ouumPP8SSe9cM9khDK/uAo7p5lRU6fNGcq
 gs2gBWYBhDO5mgrJDrfVpsyNhVnj0BW9zjMQTgIV1PkThhkaPmkyLpxLHQPqGCnQcQCz47Q81GQ
 11lSwnKK4pMI4mjTmPIJG0hIpe8Zp1KUx4TZwhK7637nS1OY54AQH65moluEMFs0bLOWDjc9yZl
 jmTHb8XAGh1pK0EVhuvzWRjHSRwt6ltMWxG757qySHU7hT3WzPuurXeW//PzF6shktGOpvbWWs4
 KI9EKIOauVPjCCsn0R0E+P1U4ceIDXHxoZzMoMcTWPJ2bPgVJ/NoVTXLz9YcgsROB8cFMQEQCcF
 BqaVRlHlNFVGyoBqJOQ==
X-Proofpoint-ORIG-GUID: xiuKUO18gGGA-cmGhCiVnyhSAqdjDpYU
X-Proofpoint-Spam-Info: AW1haW4tMjYwNjExMDIwMyBTYWx0ZWRfX/QtwnE1n85ub
 5F2JxqiJkCUP/IBoWcyZeO4eiGWnVrzX+LRctInAwMDibUweCpAYiRTmPCB0RKLOi5S8TCEd0GY
 F4Gq2MZpHWDht/8th5DyU3vZqk90STs=
X-Authority-Analysis: v=2.4 cv=e6g2j6p/ c=1 sm=1 tr=0 ts=6a2b17d5 cx=c_pps
 a=DUEm7b3gzWu7BqY5nP7+9g==:117 a=xqWC_Br6kY4A:10 a=kj9zAlcOel0A:10
 a=FelO9ux0wxsA:10 a=s4-Qcg_JpJYA:10 a=VkNPw1HP01LnGYTKEx00:22
 a=u7WPNUs3qKkmUXheDGA7:22 a=gowsoOTTUOVcmtlkKump:22 a=EUspDBNiAAAA:8
 a=djcwQD5uGQ3GNs8by1sA:9 a=CjuIK1q_8ugA:10 a=-aSRE8QhW-JAV6biHavz:22
X-Proofpoint-GUID: xiuKUO18gGGA-cmGhCiVnyhSAqdjDpYU
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1143,Hydra:6.1.125,FMLib:17.12.100.49
 definitions=2026-06-11_04,2026-06-11_01,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 spamscore=0 suspectscore=0 bulkscore=0 priorityscore=1501 lowpriorityscore=0
 phishscore=0 clxscore=1015 impostorscore=0 adultscore=0 malwarescore=0
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.22.0-2606040000 definitions=main-2606110203

On Thu, Jun 11, 2026 at 03:40:10PM +0530, Komal Bajaj wrote:
> Add device tree include for the CQ2390M variant of the Shikra
> System-on-Module, a compact compute module integrating the Shikra SoC
> and PMIC for IoT applications, designed to mount on carrier boards.
> 
>   - shikra-cqm-som.dtsi: Retail SoM with modem (PM4125 and PM8005 PMIC)
> 
> The DTSI includes the common shikra.dtsi, adds PM4125 and PM8005 PMIC
> peripheral definitions specific to this variant. Since PM8005 regulators
> are controlled by rpmpd, so disabling the pm8005 regulators.
> 
> Co-developed-by: Rakesh Kota <rakesh.kota@oss.qualcomm.com>
> Signed-off-by: Rakesh Kota <rakesh.kota@oss.qualcomm.com>
> Signed-off-by: Komal Bajaj <komal.bajaj@oss.qualcomm.com>
> ---
>  arch/arm64/boot/dts/qcom/shikra-cqm-som.dtsi | 156 +++++++++++++++++++++++++++
>  1 file changed, 156 insertions(+)
> 

Reviewed-by: Dmitry Baryshkov <dmitry.baryshkov@oss.qualcomm.com>


-- 
With best wishes
Dmitry
