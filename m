Received: from mx0a-0031df01.pphosted.com (mx0a-0031df01.pphosted.com [205.220.168.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 3072F3815E6
	for <devicetree@vger.kernel.org>; Tue, 11 Aug 2026 01:15:07 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.168.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1786410908; cv=none; b=FODzDHmxeQ1oXTxumNwgAGx3GTqhKTixu7fVa1xS63x7YTCRZmPlXG5wWPrnJDa5QOweZbRfFjVYCB+6wXgV4IwgNnURnGmqR20Fd6nQkz8Lv3JQ3dLqWoGQzQlw8GdrBbXTUsr78dRkmtsIDQ57RInnogRraLBfL5xFFRPpbtw=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1786410908; c=relaxed/simple;
	bh=GueRRaGK153pH2lJbZ8XAdC1P9r2Q+bS3QvQGYSD6Gs=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=K8QYElq9E5Tw9UwDyTe66jyOAPQF0moFg18+SBrXfWgUflaBTtLNPZkR4UKJPwADUanj8+httI1JTAWwnnGkvCLByJUDE3yzSBsagFg3Uig0nZ8TZfiYYG7eysdchzS5cTqOToTzOssXoOwntLulqXvNuH+DLm8lsoYgt4Eoegs=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=Isu7Zsmx; dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b=Boq5MrXN; arc=none smtp.client-ip=205.220.168.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b="Isu7Zsmx";
	dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b="Boq5MrXN"
Received: from pps.filterd (m0279864.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 67AMptxR2252397
	for <devicetree@vger.kernel.org>; Tue, 11 Aug 2026 01:15:06 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-type:date:from:in-reply-to:message-id:mime-version
	:references:subject:to; s=qcppdkim1; bh=GGaUnVMUNJgXa28mOYG9JE92
	ABLir+NK9V0hKydCvc4=; b=Isu7ZsmxeG/DdK1qdM8rQPW5sU18oqleRDKkyXS5
	KK1SIMJwez3qh4KCOnHBbjGXadVXbfzEE/CjtM7/L4ztfGRca2DrCtqYkzQpwB5E
	jf0WqZXFuETpkUD2ZX+1UcoUw6dxmqFu1iTOmXjW8SixqCUFCjeyPobZSxbyBECy
	527CYDKYCj3O5JfqBYwpV6jChtUgPVL7waX2UqGW85h1C42SWzqonwDanul2xPXr
	CHFVtJxoWuUPiXeKwvGN2fyCfk5oR48IQ/Jiq/O+T7WXguMzO/XrcemJIAAzseYJ
	QuHwt27KZrIrh8vF0iKnXtqK+MmxTKbmHUgGpk/on8lWsQ==
Received: from mail-qt1-f200.google.com (mail-qt1-f200.google.com [209.85.160.200])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4fyjk79tu7-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <devicetree@vger.kernel.org>; Tue, 11 Aug 2026 01:15:06 +0000 (GMT)
Received: by mail-qt1-f200.google.com with SMTP id d75a77b69052e-52827090cc5so6813341cf.0
        for <devicetree@vger.kernel.org>; Mon, 10 Aug 2026 18:15:06 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1786410905; x=1787015705; darn=vger.kernel.org;
        h=in-reply-to:content-disposition:content-type:mime-version
         :references:message-id:subject:cc:to:from:date:from:to:cc:subject
         :date:message-id:reply-to:content-type;
        bh=GGaUnVMUNJgXa28mOYG9JE92ABLir+NK9V0hKydCvc4=;
        b=Boq5MrXN67JbyUwUfoGbG31wYICW4SE0EFs10HpqdMu/8W72tKG0VtO/C67hT2KIiE
         Ut900h+smkXMKZe0PE5Zd0iRnk+FzhFTUbyRrzGKbYjdw0h7gdvkzYYLrwOV8vyDKqSE
         ZYDcVe6uFWHbCeJWDzL8pVSWb5PLOfLmvWVtLNW3x1fMPefg1O+JdN+aIzzwMV+U91LG
         yxv9GrJDDiT6O/1FL+yYJ8y3gAp89r9p8Q728LGXEyw0YsjC7ShMsZo8XtCeE1wwo0Ra
         RZJN7ctDq38W47rWfgXOUHPxUvHcErs7pQNy6fhduc8/80WlcifiNTVPS/7FQKpCfuPa
         xCBQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1786410905; x=1787015705;
        h=in-reply-to:content-disposition:content-type:mime-version
         :references:message-id:subject:cc:to:from:date:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=GGaUnVMUNJgXa28mOYG9JE92ABLir+NK9V0hKydCvc4=;
        b=oi3jRHCQ5NPmhJXtawig7+bh8LtdEezaB+ej5F1edViznWZLZbmzlAkYyceXmRxzKA
         JW2dRuYeww65HZ3csvUXJMfcNUCG0UlHYX1O33f826y2KHShirQz4zT6hJ4QUkG9hD4j
         YJ72gimPACFUAhBBJjJEsIJbKXAqMCIZObACXz9/pJ1lCVQnl9weC3eZGEaz9Mz/QSo8
         Aij1IgpcevvYQ+iwLSCCBdf+LGePoMqUX+E5xnS0et0raLWHgfoBTkTK1Mh8gFgZuQms
         JL5ZrHqcQYesI3HVOMuia4bILATPGiSbTQtNyLJYttKtzhW3a2ni345kxVnqyUg6VdiU
         2ylg==
X-Forwarded-Encrypted: i=1; AHgh+Rp5uVptHp8yWQfotsqtTCBbMX9WXONl9vZDWs5HVMTbrHOQe0PoEoxoGmkykd6NAYy4JXqkLCSlINK8@vger.kernel.org
X-Gm-Message-State: AOJu0YzQ2eWNV4ACaW2pr8CnYaErrQj3OaVR5ZOsA+8RLCQnyXZPIfeE
	E/Ms088FiP7ZVXduTUtQxRCgzAuHziy3TMMnPzNmz60wZnDSMvoFHOTq/49lpTTvJFsm5r/9vu7
	sBFrq5p5Xe+m0bOLBsdiCSxYLrWIXMpDVIrn0PJoXtIXg6whA4zFKrxWx8B4ily0h
X-Gm-Gg: AR+sD11cI4Th0JLIp2SfitalkQ7tXBCKXPddZqo9DihpAGrGAsuWoaq/nosv93rlfhx
	sd71iuc0Gc8cOlYLt1Lo4NJz5C5AVIn67SQKVGRCMrD2yoSJtwHrSKg6aM4erUGbpRW/vU2USnP
	3/lW6arlKjN7uWYqLYr7avBRwdSumG1FseXF7+YB5P3abIDQREBIFIFmb+Pkowqu3sDngBZ0o7R
	a2NzhUUu/qHiX+hj2HN6jRlXX/ZcqiXi/VQEpi8jDCVo2Pq8BIDHeH5oEhALzwO6rbUVRad1TuB
	SM4veK+8+Zv+JyuLNI1BNeNTiLlXEcR6MYBHkWRffcV1NjPTtEuzknhhiYTG+NgLsBPVeUbvtR7
	WOOrHiRpl5HzCnhhLJaRvuXlWDnv1ATsdtqHmgrodKaNzWGP2Irly2gwlTl21fCR1VmHoVjbMT9
	zdjKFyF082yCWFeg==
X-Received: by 2002:a05:622a:30d:b0:50e:474a:47e1 with SMTP id d75a77b69052e-52d514bf630mr27102701cf.10.1786410905064;
        Mon, 10 Aug 2026 18:15:05 -0700 (PDT)
X-Received: by 2002:a05:622a:30d:b0:50e:474a:47e1 with SMTP id d75a77b69052e-52d514bf630mr27102351cf.10.1786410904654;
        Mon, 10 Aug 2026 18:15:04 -0700 (PDT)
Received: from umbar.lan (2001-14ba-a073-af00-264b-feff-fe8b-be8a.rev.dnainternet.fi. [2001:14ba:a073:af00:264b:feff:fe8b:be8a])
        by smtp.gmail.com with ESMTPSA id 2adb3069b0e04-5b3056eafc0sm2347318e87.76.2026.08.10.18.15.01
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 10 Aug 2026 18:15:03 -0700 (PDT)
Date: Tue, 11 Aug 2026 04:15:00 +0300
From: Dmitry Baryshkov <dmitry.baryshkov@oss.qualcomm.com>
To: Hardeep Sharma <hardeep.sharma@oss.qualcomm.com>
Cc: Bjorn Andersson <andersson@kernel.org>,
        Konrad Dybcio <konradybcio@kernel.org>,
        Krzysztof Kozlowski <krzysztof.kozlowski@oss.qualcomm.com>,
        Rob Herring <robh@kernel.org>,
        Krzysztof Kozlowski <krzk+dt@kernel.org>,
        Conor Dooley <conor+dt@kernel.org>, Ulf Hansson <ulfh@kernel.org>,
        Michael Turquette <mturquette@baylibre.com>,
        Stephen Boyd <sboyd@kernel.org>, Brian Masney <bmasney@redhat.com>,
        Taniya Das <quic_tdas@quicinc.com>, Georgi Djakov <djakov@kernel.org>,
        Bartosz Golaszewski <brgl@kernel.org>,
        Linus Walleij <linusw@kernel.org>, Thomas Gleixner <tglx@kernel.org>,
        Radu Rendec <radu@rendec.net>, Robert Marko <robimarko@gmail.com>,
        Guru Das Srinagesh <linux@gurudas.dev>, linux-arm-msm@vger.kernel.org,
        linux-kernel@vger.kernel.org, devicetree@vger.kernel.org,
        linux-pm@vger.kernel.org, linux-clk@vger.kernel.org,
        linux-gpio@vger.kernel.org
Subject: Re: [PATCH 01/15] soc: qcom: geni-se: allow selection on 32-bit ARM
 Qualcomm SoCs
Message-ID: <vxpntlaebf4an2wgebgbwk2rdkingzjecdgylqv36wmxtyqju3@hkip3wqgendw>
References: <20260809-kuno-soc-support-v1-0-5e0ede4a0c72@oss.qualcomm.com>
 <20260809-kuno-soc-support-v1-1-5e0ede4a0c72@oss.qualcomm.com>
 <7f4qs6su5fd5ilecy4r72suk6mqvj7oouz7ahgatxthqavrfia@wxilczij4unf>
Precedence: bulk
X-Mailing-List: devicetree@vger.kernel.org
List-Id: <devicetree.vger.kernel.org>
List-Subscribe: <mailto:devicetree+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:devicetree+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <7f4qs6su5fd5ilecy4r72suk6mqvj7oouz7ahgatxthqavrfia@wxilczij4unf>
X-Authority-Analysis: v=2.4 cv=Yus/gYYX c=1 sm=1 tr=0 ts=6a7a779a cx=c_pps
 a=JbAStetqSzwMeJznSMzCyw==:117 a=xqWC_Br6kY4A:10 a=kj9zAlcOel0A:10
 a=Sv0fKeRqtYgA:10 a=s4-Qcg_JpJYA:10 a=VkNPw1HP01LnGYTKEx00:22
 a=u7WPNUs3qKkmUXheDGA7:22 a=DJpcGTmdVt4CTyJn9g5Z:22 a=EUspDBNiAAAA:8
 a=SI9sQr29kBuAMZg-vOEA:9 a=CjuIK1q_8ugA:10 a=uxP6HrT_eTzRwkO_Te1X:22
X-Proofpoint-ORIG-GUID: 9hH4kKbpMFTWK67r-UyPMw8pveOnkpXn
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYwODExMDAwNyBTYWx0ZWRfX+CdoFtlwUVYI
 q+gAy3PVQDJ1JfHuZG98HOXoITVi+/Qa3dH0S+kmF+P5+7V6lDqt1DhuEoB+9bNGTtFlPxJ/Mam
 kC5j7loKxvyKXEpfOd8bq9CMsRE3untY/dy/hFrTHwsLiqvzJQfcGgRsJUCd9PoCcPn+2mVcjOJ
 acl1CwgDrA+F5JbluqqV5GWldekwbsIdr4pqNT15c5rM2aALSTkZl0eOCPye6Q+Swo+DPC5lUt9
 PaIRMOkRiZJ60Qt0QpA8fhSQScBNNgyK+BwR8c91H1rlB429s/YnjYDguNig3gxAalrzhrkdBqY
 Ca2gXajorOhoip8QGWRzgSz3MJbJaYfW4UBcTzOuNgCzpjHWNd+Az25ygcP05Rs/+qAFeHfOugQ
 KEfMO73rqdli6d3rKRuoQ9oIWvPNnA616CTmLJUWA1i+9NZL3jvdP0vWVHsUAlmKwWxM3sf1PJO
 a46EgvEEbrd9upfrY9Q==
X-Proofpoint-Spam-Info: AW1haW4tMjYwODExMDAwNyBTYWx0ZWRfX4JQlpH628ZnZ
 HY0tiICviQxQA1ELhL0xtnNfCRvHT+hIOJveiP3Gdhmxee0kPz6hWarKrAxeEA3YKY/WL3INou6
 Sd8Fsv/OdDGT0mvKCRgPd1OGZI7yyRU=
X-Proofpoint-GUID: 9hH4kKbpMFTWK67r-UyPMw8pveOnkpXn
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1176,Hydra:6.1.134,FMLib:17.12.100.49
 definitions=2026-08-10_06,2026-08-10_03,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 clxscore=1015 suspectscore=0 adultscore=0 impostorscore=0 bulkscore=0
 malwarescore=0 lowpriorityscore=0 phishscore=0 priorityscore=1501 spamscore=0
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.22.0-2606150000 definitions=main-2608110007

On Tue, Aug 11, 2026 at 03:48:00AM +0300, Dmitry Baryshkov wrote:
> On Sun, Aug 09, 2026 at 12:57:00PM +0530, Hardeep Sharma wrote:
> > Commit e10b198a94c6 ("soc: qcom: Restrict drivers per ARM/ARM64")
> > tightened QCOM_GENI_SE's dependency to ARM64 || COMPILE_TEST on the
> > assumption that no ARMv7 Qualcomm SoC uses the GENI Serial Engine
> > hardware.
> > 
> > Kuno, a 32-bit ARM Cortex-A7 Qualcomm SoC, uses the GENI-based QUP
> > wrapper for its debug UART, so this assumption no longer holds.
> > 
> > Fixes: e10b198a94c6 ("soc: qcom: Restrict drivers per ARM/ARM64")
> > Signed-off-by: Hardeep Sharma <hardeep.sharma@oss.qualcomm.com>
> > ---
> >  drivers/soc/qcom/Kconfig | 1 -
> >  1 file changed, 1 deletion(-)
> > 
> > diff --git a/drivers/soc/qcom/Kconfig b/drivers/soc/qcom/Kconfig
> > index fd4d4ecd2df0..5b3c9d31fd7f 100644
> > --- a/drivers/soc/qcom/Kconfig
> > +++ b/drivers/soc/qcom/Kconfig
> > @@ -39,7 +39,6 @@ config QCOM_COMMAND_DB
> >  
> >  config QCOM_GENI_SE
> >  	tristate "Qualcomm GENI Serial Engine Driver"
> > -	depends on ARM64 || COMPILE_TEST
> 
> depends on ARM || ARM64 || COMPILE_TEST

Or depends on ARCH_QCOM || COMPILE_TEST

> 
> >  	default ARCH_QCOM
> >  	help
> >  	  This driver is used to manage Generic Interface (GENI) firmware based
> > 
> > -- 
> > 2.43.0
> > 
> 
> -- 
> With best wishes
> Dmitry

-- 
With best wishes
Dmitry
