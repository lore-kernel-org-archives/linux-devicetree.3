Received: from mx0a-0031df01.pphosted.com (mx0a-0031df01.pphosted.com [205.220.168.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 2C411547042
	for <devicetree@vger.kernel.org>; Mon, 28 Sep 2026 01:23:36 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.168.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1790558618; cv=none; b=cesBtbiA6w9DCDqHhay+9BfAeglYx6PCiTslI7cIk7bC6klygLm8Mv38ikCCYuowolShrSmWc4ByJ9NhqMeJ9UQRiE909gI3776UNSOFYENCWkDvXwKCPp38oAxUew87e7x9Sdpw/JQQaM8yNHlOfHNRZA6N09TEPQpp/7cz+8Y=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1790558618; c=relaxed/simple;
	bh=rlU8MJoKFwEj7TyI1+k4wCrAAdEifzHXOnp3hjdwys8=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=eRESEdWS4VMqqFJW3BRo5N5NHoSEAzv9on1uRWqyxqpBCLuz5txhioXUdb5JLtD2OgQ68xtokxZPJJvlLZ3Ro9ij4xeRCQeZ47gktjl0HAZSdkCeUQi7Sk4RBvgW39k6zrC6WwxYGgaVFj5QCeiBW6flsqH6aGlJ1JK3RIvFAj8=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=g/xqR/rS; dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b=UqHBhfBp; arc=none smtp.client-ip=205.220.168.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b="g/xqR/rS";
	dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b="UqHBhfBp"
Received: from pps.filterd (m0279867.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 68RNZmm3920214
	for <devicetree@vger.kernel.org>; Mon, 28 Sep 2026 01:23:36 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-type:date:from:in-reply-to:message-id:mime-version
	:references:subject:to; s=qcppdkim1; bh=f9YQvTKqFZSuamKQeg6Fv5je
	yjb7KS6ZvU+IaaOa62U=; b=g/xqR/rSZxs/Xgx+quFtEB1CyhYChdAmycoz3OvL
	da6JauSe73ThYbM6ML9jyGbHN9tBv0lbrHH0DQyH+TSmk3ji/MF8qb2A1l8Vhk2j
	6DQeLfAh7MV9xZh7w7X0UCvltI6EV93dk+p3zkSxe8KWXIdFD5iYA2A9LPCF3F4t
	lV6ydV2vgnzTr5wLmjCNY86wAIjTuI4cOT0B0BCh4x9uRLTI63TTOIv3mcF1yAAA
	oOPDk0PytByMCzQj5UT4qbjjsjMWr32/2Y/0FbSBENdcEDbEUjZT0hguwfq5y9Jm
	S0Up0wU82Vk4UFmQINihpGtlqCUtkGrxDf+b8k+WQwX9qw==
Received: from mail-dy1-f200.google.com (mail-dy1-f200.google.com [74.125.82.200])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4gx3rfvc9d-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <devicetree@vger.kernel.org>; Mon, 28 Sep 2026 01:23:36 +0000 (GMT)
Received: by mail-dy1-f200.google.com with SMTP id 5a478bee46e88-30f1b904861so3769745eec.0
        for <devicetree@vger.kernel.org>; Sun, 27 Sep 2026 18:23:36 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1790558615; x=1791163415; darn=vger.kernel.org;
        h=in-reply-to:content-disposition:content-type:mime-version
         :references:message-id:subject:cc:to:from:date:from:to:cc:subject
         :date:message-id:reply-to:content-type;
        bh=f9YQvTKqFZSuamKQeg6Fv5jeyjb7KS6ZvU+IaaOa62U=;
        b=UqHBhfBpawSDwpr2fuMcpb0/XcKQmflLo6ThYCKzLH1Lh/PfBlKxrcpmkpIo7mIMIL
         Wa25WjMuVwIxSmQm+G6wsHYqe1JT6d83j+hfEZJUYwVyzD7M8ysFzBeiOOqHAdPDUrAB
         ZPsTkKaGTLnIDGFwh5XHavXIs3z79FmkD6xvY3yE29zKOYmNHvs59uelVYpPeA05Jxlr
         P8RaWKLDKrOW3vKvf3JvN6qS6F0MUoOD5YIO1rXu3l3QhWh0GFai/GSnEy0SmzlmzY5z
         jYf+02+hh8bHGG9+wcitvbhL39TbVJH1Nyf1DIaL+JEm29HQkSzPZJzFWrwI0RjFruNK
         y1MQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1790558615; x=1791163415;
        h=in-reply-to:content-disposition:content-type:mime-version
         :references:message-id:subject:cc:to:from:date:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=f9YQvTKqFZSuamKQeg6Fv5jeyjb7KS6ZvU+IaaOa62U=;
        b=TKYeSeQhG7mQmFqrdGG8uVIYcRQcKb+VXDqDo3hECWtNnXwh0YehZn58ozhUzTpJaM
         B3t9jOv6ThFcG3Wpo5aAJDMeITle2fkUHHLr8dfkXPuELkLxx22/bol9Pwc5nrebRBWJ
         bbOIqNwiOtgDu77xpe0Y5JFNBT0rC/LxdMKJVXSK07ldu4nU6ZqNzH5j8DkWcYa1vFqk
         pI7zEPj+oXxTwXnpJ4+a3MxW7IMWUBny83BbTdST2YVoGlH7YMWXpPzpudVEfk1Y5Vll
         3RqYNvZwuATZXMv46LjY7hZ2xaBQd2zASi5k0AOhG2VO84ICsLSKIy+bjMC+NNLkGklj
         geRw==
X-Forwarded-Encrypted: i=1; AKwUvBxOtjcrGTikAqiYi+NowT6peCo1+lW5CW3o3wJawSJJ9+eIulflRX2Cq4ntgNXyIYGfMQ6ir3t0UyUK@vger.kernel.org
X-Gm-Message-State: AFuF++lugdr1ZymI5HqpuCIWuCrKfcszwQm9NMUcomYaDM0iSZBZz8DT
	qFSDMkjhPY10aue8q64pnIcgL1Xffw7vePkGmN8LuHa0oFoZNOK7Zb+vWkLb6FcKV8FWe3WvyxP
	Ich286Zt42deO1bhM/ynuqOOuF3lNcMTM7h2znrm9tmmhi6pH6dGskFm+wVnQnjjX
X-Gm-Gg: AYBFou3mNrcsnPBvJwvCZRBCL5ag9IxL5xoiskN9yaVOTOrL5Jk+MUVpSbLetJ5XkEt
	hNpLLIu+W6vtIe2XFhCgwGe1YEaApvEh+/lXMxssXVaUS6KfjChf34j/yE2X9Txt9ZpEpL7vqYr
	i3rEOjTwOj3JhvEo/+j9IVhgzOvkgq6g2rjAJQW1svEp4mNu76kpNIr4IMQEB+GkMhhWnojqEJn
	DLAO7MymfUZ2SHhymWC2Wt3wiwjDxFwHSRvgpLteRpMIG+47VImwjpfgArYWs35/G63a6lr1PFH
	R83rexW7FTO9sXoKL+uM86XcUpbNvFi5BJ+15oooBML31WXii+2xMdFFzGdoPpaAwHjukfnhA+h
	DsqUhvlodO92P192oaN0S2kJHQu8QbRs4VP0OWSEruQ==
X-Received: by 2002:a05:7301:52c1:b0:314:267f:46e2 with SMTP id 5a478bee46e88-34271a8da39mr7821603eec.20.1790558615490;
        Sun, 27 Sep 2026 18:23:35 -0700 (PDT)
X-Received: by 2002:a05:7301:52c1:b0:314:267f:46e2 with SMTP id 5a478bee46e88-34271a8da39mr7821550eec.20.1790558613844;
        Sun, 27 Sep 2026 18:23:33 -0700 (PDT)
Received: from QCOM-aGQu4IUr3Y (i-global052.qualcomm.com. [199.106.103.52])
        by smtp.gmail.com with ESMTPSA id 5a478bee46e88-34141a4a00dsm25487284eec.1.2026.09.27.18.23.29
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Sun, 27 Sep 2026 18:23:33 -0700 (PDT)
Date: Mon, 28 Sep 2026 09:23:27 +0800
From: Shawn Guo <shengchao.guo@oss.qualcomm.com>
To: Bjorn Andersson <andersson@kernel.org>
Cc: Konrad Dybcio <konradybcio@kernel.org>, Rob Herring <robh@kernel.org>,
        Krzysztof Kozlowski <krzk+dt@kernel.org>,
        Conor Dooley <conor+dt@kernel.org>,
        Bartosz Golaszewski <brgl@kernel.org>,
        Dhruvin Rajpura <dhruvin.rajpura@oss.qualcomm.com>,
        Anandu Krishnan E <anandu.e@oss.qualcomm.com>,
        linux-arm-msm@vger.kernel.org, devicetree@vger.kernel.org,
        linux-kernel@vger.kernel.org, Abel Vesa <abel.vesa@oss.qualcomm.com>,
        Konrad Dybcio <konrad.dybcio@oss.qualcomm.com>
Subject: Re: [PATCH v3 2/6] arm64: dts: qcom: nord-rrd: Enable ADSP and CDSPs
Message-ID: <arnBj2WlZrg25LeT@QCOM-aGQu4IUr3Y>
References: <20260920084920.2201418-1-shengchao.guo@oss.qualcomm.com>
 <20260920084920.2201418-3-shengchao.guo@oss.qualcomm.com>
Precedence: bulk
X-Mailing-List: devicetree@vger.kernel.org
List-Id: <devicetree.vger.kernel.org>
List-Subscribe: <mailto:devicetree+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:devicetree+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20260920084920.2201418-3-shengchao.guo@oss.qualcomm.com>
X-Proofpoint-Spam-Info: AW1haW4tMjYwOTI4MDAwNSBTYWx0ZWRfX5DyxDD/vp1mk
 EwbgtHwfpj/xTM5cTa0IclGcWoy+JUYAnH3qb/MwpwSEmZbPGqXVlOUJyE+m6iSnIs3k3ChH7sn
 SBkGaLHA7bQbX6+ElEEJgZ8Cwjq7jwE=
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYwOTI4MDAwNSBTYWx0ZWRfX9LQ+fuc5TKDs
 7+xsnwgGkYWoiDN0Eq3LJ0A0Mg9HNAZ2Xcy+sjuIMfl4e2Ks4c5ZaSM2Z6yQ6taB1888vhT6GcT
 5WmV2QGSGBLAl3iTWRb6mC1Rkkio2hq63yBH17nQRRdZKjXFvNbsEvage1kr/zSfgHX1JL+D5cV
 bmIRA/a0qjBh09sBgBS77LnECBaguVUOso2guw0kiNLtrfPPnIOYr/5+t/4gYLwpHMdYrmlESQK
 evV5/upjNo5esZPSfYhFlEK8ooyNcC50+3cdAX8lijX0EJkdo8axwJ7/AodiEsMJ0o9HpbXPP1A
 +73JhoSqfXrQjilPB5hV0u3ZpfYTXo4dQQrCDsS2JHXFi2aLj8MgViiTN9o1cI4KKq+SCu1nyt2
 gE/hTzhGrQPvY1pp5/cg2R7z1p8JKfIqeA3nFYCIlfvUCFZGjFF0iGPNAAN1WyoI+QSMa46UEqC
 orInV0CCakn2ybF7pzg==
X-Proofpoint-GUID: 6utAPmyfmh4c32hP_9RYfBunwzkcGXQa
X-Proofpoint-ORIG-GUID: 6utAPmyfmh4c32hP_9RYfBunwzkcGXQa
X-Authority-Analysis: v=2.4 cv=K6G3jCWI c=1 sm=1 tr=0 ts=6ab9c198 cx=c_pps
 a=PfFC4Oe2JQzmKTvty2cRDw==:117 a=b9+bayejhc3NMeqCNyeLQQ==:17
 a=kj9zAlcOel0A:10 a=VdqzKS8jKosA:10 a=s4-Qcg_JpJYA:10
 a=VkNPw1HP01LnGYTKEx00:22 a=u7WPNUs3qKkmUXheDGA7:22 a=eoimf2acIAo5FJnRuUoq:22
 a=EUspDBNiAAAA:8 a=MvHJX41Kz9pwvTpm7VEA:9 a=CjuIK1q_8ugA:10
 a=6Ab_bkdmUrQuMsNx7PHu:22
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1176,Hydra:6.1.134,FMLib:17.12.100.49
 definitions=2026-09-26_05,2026-09-21_02,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 spamscore=0 suspectscore=0 clxscore=1015 lowpriorityscore=0 bulkscore=0
 adultscore=0 priorityscore=1501 impostorscore=0 phishscore=0 malwarescore=0
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.22.0-2609040000 definitions=main-2609280005

On Sun, Sep 20, 2026 at 04:49:16PM +0800, Shawn Guo wrote:
> Enable ADSP (HPASS DSP) and CDSPs remoteproc on the Nord RRD board.
> 
> Reviewed-by: Abel Vesa <abel.vesa@oss.qualcomm.com>
> Reviewed-by: Konrad Dybcio <konrad.dybcio@oss.qualcomm.com>
> Signed-off-by: Shawn Guo <shengchao.guo@oss.qualcomm.com>
> ---
>  arch/arm64/boot/dts/qcom/nord-rrd.dts | 35 +++++++++++++++++++++++++++
>  1 file changed, 35 insertions(+)
> 
> diff --git a/arch/arm64/boot/dts/qcom/nord-rrd.dts b/arch/arm64/boot/dts/qcom/nord-rrd.dts
> index 3673003c8b21..e4c3aee441c2 100644
> --- a/arch/arm64/boot/dts/qcom/nord-rrd.dts
> +++ b/arch/arm64/boot/dts/qcom/nord-rrd.dts
> @@ -393,6 +393,41 @@ &qupv3_2 {
>  	status = "okay";
>  };
>  
> +&remoteproc_adsp {
> +	firmware-name = "qcom/nord/adsp.mbn",
> +			"qcom/nord/adsp_dtbs.elf";

I will need to update firmware-name to align with what we have in
linux-firmware repository.

Shawn

> +
> +	status = "okay";
> +};
> +
> +&remoteproc_cdsp0 {
> +	firmware-name = "qcom/nord/cdsp.mbn",
> +			"qcom/nord/cdsp_dtbs.elf";
> +
> +	status = "okay";
> +};
> +
> +&remoteproc_cdsp1 {
> +	firmware-name = "qcom/nord/cdsp1.mbn",
> +			"qcom/nord/cdsp1_dtbs.elf";
> +
> +	status = "okay";
> +};
> +
> +&remoteproc_cdsp2 {
> +	firmware-name = "qcom/nord/cdsp2.mbn",
> +			"qcom/nord/cdsp2_dtbs.elf";
> +
> +	status = "okay";
> +};
> +
> +&remoteproc_cdsp3 {
> +	firmware-name = "qcom/nord/cdsp3.mbn",
> +			"qcom/nord/cdsp3_dtbs.elf";
> +
> +	status = "okay";
> +};
> +
>  &spi16 {
>  	status = "okay";
>  };
> -- 
> 2.43.0
> 
