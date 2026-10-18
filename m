Received: from mx0b-0031df01.pphosted.com (mx0b-0031df01.pphosted.com [205.220.180.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 3B7B749AA21
	for <devicetree@vger.kernel.org>; Sun, 18 Oct 2026 12:49:25 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.180.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1792327767; cv=none; b=WmDfCSVCrkjrE3WH+0VsduQexnDbyYnjBkZ7lxLMYXtz3DLITG6/aBHId0aFwDVeyyZNwbJOVWqNsJEdYN20cw83O5C0beFBR4YMSJ5Lh7mk0SbcNluqKdAeK9FLy+1PWlOW/ucDK1qFZVw7IP8bE/TLRcQC+Pda8DF/NeLteN8=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1792327767; c=relaxed/simple;
	bh=3H5WDrbLsyNmUMdQMd7cl7iVv73It2xWoc2XO457wBg=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=pRmt+VgWvvDSDrHoS47zrBjRqFwypbBhwb9HwYORhlLI76PKa1My2ZUSGyAAzVJ96TVd1fmPxu9Acar9EeMIgI4memr5KDCGU4SrUWka4VM+jlWPZURVVsFns3E4GvmAx0v2mTcy4dJ/jTnrxRCgbZxKdlJe3QFul2eX46cUZ6U=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=XIglB1Jo; dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b=PrNTyPCQ; arc=none smtp.client-ip=205.220.180.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b="XIglB1Jo";
	dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b="PrNTyPCQ"
Received: from pps.filterd (m0279869.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 69I5t2Bu3595627
	for <devicetree@vger.kernel.org>; Sun, 18 Oct 2026 12:49:25 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-type:date:from:in-reply-to:message-id:mime-version
	:references:subject:to; s=qcppdkim1; bh=oR0xHgOBXTHB3mbB2fYrEG1u
	zN9XOep8KCEuy/4J+/Q=; b=XIglB1JoNlxqpHbbQJLWsKmbWDv1IVt+GHEjmKz6
	14M0m+PoTeHRkHuE3wjjUUZ87BF2hKQdDAim0Fjp0ebnVYlK5KcoStz6hymnVwIw
	rOcAhqmMtDqKPcGhQ6z5Cfp76BiELLZ2Nx9xRiFhboApVbYKqA45ffM5Ay615FK9
	Dl8Js+9gcX7v3cdkr9LkRUW/sV9CYQdXREJpcXMn8Fleh8xvL0T9tQknBHZsv7uZ
	pCoOlh2hgFVILJhGnZ8tIX/cHuGCc6FbN7Qwjl57Yqs6gUUcGg5TcCLWXILZsxHF
	VHEXQzDwBRpXwAsvAq2HCjb5BK9vaMkzuhDgMvM/Aia13A==
Received: from mail-dl1-f72.google.com (mail-dl1-f72.google.com [74.125.82.72])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4hc016k6q5-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <devicetree@vger.kernel.org>; Sun, 18 Oct 2026 12:49:24 +0000 (GMT)
Received: by mail-dl1-f72.google.com with SMTP id a92af1059eb24-139b62317d0so5488211c88.0
        for <devicetree@vger.kernel.org>; Sun, 18 Oct 2026 05:49:24 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1792327764; x=1792932564; darn=vger.kernel.org;
        h=in-reply-to:content-disposition:content-type:mime-version
         :references:message-id:subject:cc:to:from:date:from:to:cc:subject
         :date:message-id:reply-to:content-type;
        bh=oR0xHgOBXTHB3mbB2fYrEG1uzN9XOep8KCEuy/4J+/Q=;
        b=PrNTyPCQPcjwXfGCZF1gPLJwicrGr+Rh/KEddUJOw9ejpfPrJagiwNLI5IxNAestY/
         zATXEyBcLkO+YiocX7maUuq3Npq0UD0HR45xJxzU5PZqlkhrvohvf/WKAWacf5HAvD+x
         LNt9PPpr0N0iEmg5cd6XU6bfxK9IVAfaB1drVtzdq7NJhQ8HzRRNKyc1Bu+g5QWXoD+N
         i58pZDzVmsblJLjsDJGTgcHwDutwrz3uYGR2lbvxtT48rir0YPmxqf98gDfziLk7IBo/
         hUuX0yuryk/UOxswAJqG3BX10RZmTrrz/3pvCGg9ie/cNI0CqlKAQBZu4DRG8gYU+PKT
         W2cg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1792327764; x=1792932564;
        h=in-reply-to:content-disposition:content-type:mime-version
         :references:message-id:subject:cc:to:from:date:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=oR0xHgOBXTHB3mbB2fYrEG1uzN9XOep8KCEuy/4J+/Q=;
        b=u5MBkkmP99uTMtyVbYhf91Cv9hzuxh+kmUFCTrtP2WYeJJtum1djz+fL+MARIFkClk
         6TSi0cUMbl+LFFJ2ptJAfn5YqoOqiu+PswiVM+OJP4rFCavMpmGooQyT/LmDAIGLFchU
         HTJ411phObK6nflQyfrmDDvW6lz0l+GNc3Xj4oTyNKpE+jWDpMvz3rbzzKJkTH9mLdoE
         verZ0Y41XlDIDVJNz/Vm5d6VlcNC1k0bHnfDxO/3Rq/xhLuTomiHsAWaaPCbXv0gTq3/
         K5Dx1PIQyRQ7YRxFDQkfIbCjXXu9Xx6nU1Vn3gjeVnzje0JQjr6/Xr/mt8LyVSOhE3G7
         tx3w==
X-Forwarded-Encrypted: i=1; AKwUvBzU1YFWTxOw6tM4m9zZAoJ8kFTCCHqugWcDEymK3VIb8bkLRiuBU1ClOUn98wbenEBOkjTNcr7uVj4I@vger.kernel.org
X-Gm-Message-State: AFq9FYKm5x/3ZC1pWVs1lt5MprDkDT/9ynHKvfeE3WtIHorARkxuQ/p8
	HHWPrNPyLuJTfDZ9FJ1ByGpZTCUZZ1zcycbVMLkp9kGqv4PmbU2nkGTegE2mjzh+QqGUwZOSlgC
	B+Z714x2C5WPmL9QErW8tiNm94qMhyuQa1kkXqiiB0iWv/XjSuSVQgz5wXIzKFsC4
X-Gm-Gg: AYBFou31tSydVxjLYg86JP1+5mV6B4/Sn6cLtt8nOFQ8gmzJfN4yoP5yWuZxrxfSKHR
	Hp8jQVHQYuzbGR6Z9rknXwEsjgvDFDblfuCMNSH0thOD4euzmqEBlETDsGS2GBNFcZId6BENPrt
	joPNS45tD33/hxG6B5BdNdnAp+SVhhsLtpHjYc7C3K9hUTOjHOSGF6KNGvgneW09FDlvXUgjgmg
	wYCuhDKEw/N/BgIx8GLI79go4W36SFIQG5VmKfOefkPUwHTKUSD5JOCRgVH8fPndvuZ4tiM2gPm
	jmPjJhjr+1qeoXLIQejhIEHkIM41bD1pRbkW8zd4NkmZBXs1F6zurcaRzAVGdJBmUOq47Vea/vF
	Gymjdd7rAULN2zBLdKmltBAIuuYrDurQO/ullRWa4nQ==
X-Received: by 2002:a05:7022:fe06:b0:151:7831:e401 with SMTP id a92af1059eb24-185120a8c4fmr11330649c88.15.1792327764072;
        Sun, 18 Oct 2026 05:49:24 -0700 (PDT)
X-Received: by 2002:a05:7022:fe06:b0:151:7831:e401 with SMTP id a92af1059eb24-185120a8c4fmr11330594c88.15.1792327763450;
        Sun, 18 Oct 2026 05:49:23 -0700 (PDT)
Received: from QCOM-aGQu4IUr3Y (i-global052.qualcomm.com. [199.106.103.52])
        by smtp.gmail.com with ESMTPSA id a92af1059eb24-18314b16f57sm21496025c88.2.2026.10.18.05.49.19
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Sun, 18 Oct 2026 05:49:22 -0700 (PDT)
Date: Sun, 18 Oct 2026 20:49:16 +0800
From: Shawn Guo <shengchao.guo@oss.qualcomm.com>
To: Anurag Pateriya <anurag.pateriya@oss.qualcomm.com>
Cc: Bjorn Andersson <andersson@kernel.org>,
        Konrad Dybcio <konradybcio@kernel.org>,
        Abel Vesa <abelvesa@kernel.org>, Rob Herring <robh@kernel.org>,
        Krzysztof Kozlowski <krzk+dt@kernel.org>,
        Conor Dooley <conor+dt@kernel.org>, linux-arm-msm@vger.kernel.org,
        devicetree@vger.kernel.org, linux-kernel@vger.kernel.org
Subject: Re: [PATCH RFC v2 2/3] arm64: dts: qcom: nord: Add SoCCP on RRD board
Message-ID: <atTATLreJ1Fo-ZqI@QCOM-aGQu4IUr3Y>
References: <20261018-nord-soccp-dt-v2-0-4d713d316e9d@oss.qualcomm.com>
 <20261018-nord-soccp-dt-v2-2-4d713d316e9d@oss.qualcomm.com>
Precedence: bulk
X-Mailing-List: devicetree@vger.kernel.org
List-Id: <devicetree.vger.kernel.org>
List-Subscribe: <mailto:devicetree+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:devicetree+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20261018-nord-soccp-dt-v2-2-4d713d316e9d@oss.qualcomm.com>
X-Proofpoint-Spam-Info: AW1haW4tMjYxMDE4MDA1MCBTYWx0ZWRfXzyqDQcUnTxun
 38TAKQ2LBKWCkyjuOGYhsPflH/EFofuqDaOMTZyh7vMkkRPEut6/rsmwgK/pLanOgvBgwePlfeq
 rX3A3bwOajl/f0+d4JLCO4O0WtDfYoE=
X-Proofpoint-GUID: z2YzUtlxKWI2GNCj1G5b1HOkYNZ2zxYl
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYxMDE4MDA1MCBTYWx0ZWRfX9M3NtCPaobkJ
 heiQJAElS/r0dR27A2tleEISBqlk+HCx8ydbGcHmbtuIOGeTaT9f0LpQM3zXRBIHH+Jn5sBoF/D
 NLUukPUbaSJx/w57YYKaKLV3YdYNgH7MTr9qIDPoUf4ZfseLG/PylqGi0RQoPknsvtIbhGuFt+X
 PtCzkdkY56vz4sF3+AQEavVUZE4m1xliqTgNDYRSlYQ0QXMxHPju8noWGA8BkXMWWjDC09tfgi0
 cjg14g9skYODQ3Bihu+dBpr3bGckZzpNQ8r75rUf+862HNFZDcSjatmqwIUoMEJmEkBO2e7//aV
 v80QaqYjxuO6W6xRWKg1dR6FBYEMrH7MvBz8tJdZ6Xahmlfxlz5UPbMzS6cNJlK7fxxZ50lMmbP
 4o8Yj7YCJC+3M8wutRsr+ME84fLZNdEQRg1Prkg+Kn5ccug9EVGfIhAYn8PkDibjzRVCf7GYzSK
 EsRJcOima3zp4qRFoRA==
X-Authority-Analysis: v=2.4 cv=COm/zhrD c=1 sm=1 tr=0 ts=6ad4c054 cx=c_pps
 a=bS7HVuBVfinNPG3f6cIo3Q==:117 a=b9+bayejhc3NMeqCNyeLQQ==:17
 a=kj9zAlcOel0A:10 a=660iZSQnnn4A:10 a=s4-Qcg_JpJYA:10
 a=VkNPw1HP01LnGYTKEx00:22 a=u7WPNUs3qKkmUXheDGA7:22 a=_glEPmIy2e8OvE2BGh3C:22
 a=EUspDBNiAAAA:8 a=BAA5RAoUlf9vgojSqUoA:9 a=CjuIK1q_8ugA:10
 a=vBUdepa8ALXHeOFLBtFW:22
X-Proofpoint-ORIG-GUID: z2YzUtlxKWI2GNCj1G5b1HOkYNZ2zxYl
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1176,Hydra:6.1.134,FMLib:17.12.100.49
 definitions=2026-10-18_02,2026-10-14_01,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 suspectscore=0 adultscore=0 phishscore=0 bulkscore=0 spamscore=0
 malwarescore=0 clxscore=1015 impostorscore=0 lowpriorityscore=0
 priorityscore=1501 classifier=typeunknown authscore=0 authtc= authcc=
 route=outbound adjust=0 reason=mlx scancount=1 engine=8.22.0-2610080000
 definitions=main-2610180050

On Sun, Oct 18, 2026 at 12:46:47PM +0530, Anurag Pateriya wrote:
> Add the SoCCP remoteproc node with its firmware path on the Nord
> RRD board.
> 
> Signed-off-by: Anurag Pateriya <anurag.pateriya@oss.qualcomm.com>
> ---
>  arch/arm64/boot/dts/qcom/nord-rrd.dts | 4 ++++
>  1 file changed, 4 insertions(+)
> 
> diff --git a/arch/arm64/boot/dts/qcom/nord-rrd.dts b/arch/arm64/boot/dts/qcom/nord-rrd.dts
> index 47978df0af92..89f8d36ed812 100644
> --- a/arch/arm64/boot/dts/qcom/nord-rrd.dts
> +++ b/arch/arm64/boot/dts/qcom/nord-rrd.dts
> @@ -434,6 +434,10 @@ &spi16 {
>  	status = "okay";
>  };
>  
> +&remoteproc_soccp {

In alphabetical order, I think it should go right after remoteproc_cdsp3
rather than spi16.

Shawn

> +	firmware-name = "qcom/nord/soccp.mbn";
> +};
> +
>  &uart4 {
>  	status = "okay";
>  };
> 
> -- 
> 2.43.0
> 
