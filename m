Received: from mx0b-0031df01.pphosted.com (mx0b-0031df01.pphosted.com [205.220.180.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 7C3CA330B22
	for <devicetree@vger.kernel.org>; Thu, 18 Jun 2026 13:00:00 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.180.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1781787601; cv=none; b=AP9+8soL0M2y5mmHZbVZCHbM3/LQQpZv/uXiHvgUCldHgV/Bq4ACctFQkkt5HZihNOSUQGbxDJg38NchWXeFklvtQyXoaWTBLucB4OK9KtesnLVP2Gp8Z7g/ABmNHN0IstEpoO6Ds8oNwZiNqJGFpcGZMvOrdZkaIl6UNbZmWqI=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1781787601; c=relaxed/simple;
	bh=OaCsWVjeRKhtSIjTib1hDCycgwux+YYlVcMe1W6BPKM=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=GDpsHGG/btm1Un/yZqfnCRHQ3k1wY1FesT5dx1FWZnqEFTspVyV2WSWvdKCau1bhRtIraNhZCY3JfJFvDLTEILxkvkT+QayXzScly4ldCXouhQLTCXoH1pOVEFhr7m0iCp87Qvgx0F0LoYze8wSm8+OVvsRzufUU5ruypmTq1KU=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=bJFgVlQX; dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b=QifFtmim; arc=none smtp.client-ip=205.220.180.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b="bJFgVlQX";
	dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b="QifFtmim"
Received: from pps.filterd (m0279870.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 65ICvHK61879340
	for <devicetree@vger.kernel.org>; Thu, 18 Jun 2026 12:59:59 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-type:date:from:in-reply-to:message-id:mime-version
	:references:subject:to; s=qcppdkim1; bh=HXykU2dPfmxOISS3+zUF8uA0
	j3FskgVTiZO2+nvoP9Y=; b=bJFgVlQXgZRa8K/6lxi+GPG1T3MzqTdcWPVA7XzL
	etQvChXHyJKyKL0GNUnPBBfUuz2QQ8PN+07X8qddPlP+3j3jUJr3MbsKMgeFF0oD
	844TQIm9S0yO8Ln33jOJeM0SRANw1PRvkXMSM/fouAtQAI92ypZeLlqWj6kqSDXl
	LnYOHZ2zn1Vp8nrlBXSOkuCcDF+5/Do154COEXoqp2mh2+Mgwcpg8UxJNFN2i7Lq
	GrR0tQy06M8PZU+VrnWNN5rm4Ef/CwV+GHnI27CJXE9F97Np3QE9MLS2Wsq4abUW
	0bjtzHi4/G+Z3aiKTdTrMBHsD3ZLMkxjBiyj5rupMbMHgA==
Received: from mail-qk1-f197.google.com (mail-qk1-f197.google.com [209.85.222.197])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4ev0g7knqe-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <devicetree@vger.kernel.org>; Thu, 18 Jun 2026 12:59:59 +0000 (GMT)
Received: by mail-qk1-f197.google.com with SMTP id af79cd13be357-9157f1be083so199188885a.3
        for <devicetree@vger.kernel.org>; Thu, 18 Jun 2026 05:59:59 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1781787599; x=1782392399; darn=vger.kernel.org;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:from:to:cc:subject:date:message-id:reply-to;
        bh=HXykU2dPfmxOISS3+zUF8uA0j3FskgVTiZO2+nvoP9Y=;
        b=QifFtmimfZuYkKFvdzcAMTdEDoNozh0/UpyDL9Q+5CrMHiSR9BmAVBwIJDAxUaFSac
         tl33/ZL3PUa3iQuxaaB8sm1eZCmzp0XxVtM1IARlt41qacqIPe0vUfblXlaFtoPelObl
         xnrmcCfS3Wt/m07B30cCNpwEMSSbtOd4vUrRh4YbuR6THw70QeON88YxvwsJSbEL6kDD
         YsDXQbcFc1yMs+2SrIe+5kDli9hBJfaXYQlCxOBoHCkyCzN6AKzrplWlqwOP1Q5Z7Boo
         JL9037XfWDCxLxP+RUM0g9Na2rv5FgUbjltE+xWT/2Tp/8zf8jRHwvYabtBb03qOupWc
         0maw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1781787599; x=1782392399;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:x-gm-gg:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=HXykU2dPfmxOISS3+zUF8uA0j3FskgVTiZO2+nvoP9Y=;
        b=neJe1r6XTj5zUPbZRF/pBJUoM5rMv8KBs6b+l53URtSB3mtJZcPchg25CKpBBFFMGO
         X9MVjXedgdTiCPVSHxV/Nu3PKinIeUDOUencIvZJ+DYvdAk6ETE0ecWeUDZasZkS/rgX
         g9kOG4AzxchSTYAKw5M4BgCSQZp5Ov4P6uhwxWn35btqPiTCLry2/AgejTLtzWYYLhlu
         Dl9X4cXt17g8ISy2Smm0RM/N1dbzwj8FSZFHDg3+Eu830G9BCLrsMYRfsp95Raap9os5
         w8noaeneCIpduN4FhfELAwnK8jD0Dsf64QM1P8j4ZJW6BDAA4ZS2tytZeDjLVFP/hO/9
         1GcA==
X-Forwarded-Encrypted: i=1; AFNElJ+oiCFpfwKecwaFlj3JqG/KMB3K7Fgxx+S4nW3U9GBJPLOqUX1wR/qckl5g/aVfLdpgQfPnpu5rstU5@vger.kernel.org
X-Gm-Message-State: AOJu0Yx5Lv1YP32jvgepOho+g0BIziaVE7yKmC0yAZTtpSQHqpTibdvD
	ZNvv8/Oer4KoQ987xiv3cgU6fjey6y5Lsdzhe5Mo9y1DixrYODJ/VxLL7NIPnPPi06zj6NhDJSA
	zO37XryDhaZXMVqH6YCJ2XvSO3tSQx6Iww0q2+Szw/NBqN3vGXo4orJ2zwGzjAEO6
X-Gm-Gg: AfdE7ckEoVHeQHw4o9w9QsQ+Is9LL9RbW0H2DMQ0SLLUfOG8aZhfM+aD9w0R9yiduQ5
	rqkhWKh22q+p2m9R8RWmvA1jkKF3ls20ZVBNnfYFjC6dQ1txpoRvYA6VLLbPi6rgzPDMAwctjc9
	j7fX9JRSAym063CCFqEWJpsoR5wBDQrVu+Vga0ZnJUf9T9qCjKA+LVNDem6PMw6DhE8PARLKNM2
	61Nm51or89vxXyf18ync9ysWQ4/i3j/oghjmlu0m18YFY9wgtK20Mse0q7w0vWE0cPNVyxJTCwQ
	zGsSjpyzGJsadNdwMzpdKujQvDObcxhXZV9LBkWGerAwQI6Qrwj4vrWRYE5MunNgcytqY9U7EAE
	v3hC3zmNXlKTWogFb5RWF1TQYFOJpwTru7qnJ15vKIXH3o2PgIXWyWBKudbULRkdADS3Emqxh5U
	WrLx9urgKMtjD5IPZXiIyYPbTF
X-Received: by 2002:a05:620a:1b92:b0:915:40ff:4e10 with SMTP id af79cd13be357-91f8ba807f4mr313683485a.4.1781787598827;
        Thu, 18 Jun 2026 05:59:58 -0700 (PDT)
X-Received: by 2002:a05:620a:1b92:b0:915:40ff:4e10 with SMTP id af79cd13be357-91f8ba807f4mr313678785a.4.1781787598296;
        Thu, 18 Jun 2026 05:59:58 -0700 (PDT)
Received: from umbar.lan (2001-14ba-a073-af00-264b-feff-fe8b-be8a.rev.dnainternet.fi. [2001:14ba:a073:af00:264b:feff:fe8b:be8a])
        by smtp.gmail.com with ESMTPSA id 38308e7fff4ca-3995c05abe3sm23104051fa.15.2026.06.18.05.59.56
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 18 Jun 2026 05:59:57 -0700 (PDT)
Date: Thu, 18 Jun 2026 15:59:55 +0300
From: Dmitry Baryshkov <dmitry.baryshkov@oss.qualcomm.com>
To: Sarat Addepalli <sarat.addepalli@oss.qualcomm.com>
Cc: andersson@kernel.org, konradybcio@kernel.org, robh@kernel.org,
        krzk+dt@kernel.org, conor+dt@kernel.org, linux-arm-msm@vger.kernel.org,
        devicetree@vger.kernel.org, linux-kernel@vger.kernel.org,
        pavan.m@oss.qualcomm.com
Subject: Re: [PATCH v2] arm64: dts: qcom: qcom6490-idp: Add IPA nodes
Message-ID: <2qlpabzpyvjwd2siwkpcdcjq7geyzj5egu732dg775asn2wtbq@tcbj6r5ti2o5>
References: <20260618124700.2001191-1-sarat.addepalli@oss.qualcomm.com>
Precedence: bulk
X-Mailing-List: devicetree@vger.kernel.org
List-Id: <devicetree.vger.kernel.org>
List-Subscribe: <mailto:devicetree+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:devicetree+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20260618124700.2001191-1-sarat.addepalli@oss.qualcomm.com>
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYwNjE4MDEyMSBTYWx0ZWRfX93e/s60dGHhT
 ec/dPjHrvLF1P3KX21MF5cLNwgIbaXFhbsHNOPl1qix9599lzPPqhKCmDkUeru3dRFTrAflLiJ9
 54+pYlxCmLxnQg6wYqYIR+kK2Y1vkpjp4h38fAqwjpVjvK8Pjne0ZA8stR+6FvAyNUNr/TPjTh/
 5oulor0SN2GA7ozsVdFY4qbE9eX+7nc4LE7ztHMsQx0vOS97Gj9U7wPI0llsnys71jbl4sbrh4R
 s8WzTt3YoYfuSNbPBZcdi2zLaWqvz4ZCLUc8JcDtPFSw40QYbxY0l28jMFzBSRctG0m9Fk5olxe
 QDQ9d264TAePbDNSUFjI7LtJ8OWhywp95Fook1BCmyffQOTtZ6ZGEgHak1ktBRgr3IpMac6r5bP
 i5o7Dce90UefHvnIPsjQNWmG1oKMpJaYtrf/7+D8ky+wNfRHy/L/VVK9A6NMRtYVNNofq43VCRG
 fI4QNxl97Z+NUdkqdkQ==
X-Proofpoint-GUID: pwGD1t4PHpZ1YROIC75CLNrxN2uXMsz9
X-Proofpoint-ORIG-GUID: pwGD1t4PHpZ1YROIC75CLNrxN2uXMsz9
X-Proofpoint-Spam-Info: AW1haW4tMjYwNjE4MDEyMSBTYWx0ZWRfX9KPGsnKKv8xm
 hzf/5Pv7Pr9J9FyuWf0P5KTzN5bp9crGzGbKZi3P3Do+gsU0yu4HGJEbaWlUyHVUSmd9wiXWMo4
 q3lkHX7er4yPG2+rX50ify7WTHV2FXI=
X-Authority-Analysis: v=2.4 cv=YrI/gYYX c=1 sm=1 tr=0 ts=6a33ebcf cx=c_pps
 a=50t2pK5VMbmlHzFWWp8p/g==:117 a=xqWC_Br6kY4A:10 a=kj9zAlcOel0A:10
 a=FelO9ux0wxsA:10 a=s4-Qcg_JpJYA:10 a=VkNPw1HP01LnGYTKEx00:22
 a=u7WPNUs3qKkmUXheDGA7:22 a=gowsoOTTUOVcmtlkKump:22 a=VwQbUJbxAAAA:8
 a=EUspDBNiAAAA:8 a=Es2dbmlq2MXA_sE65LsA:9 a=CjuIK1q_8ugA:10
 a=IoWCM6iH3mJn3m4BftBB:22
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1143,Hydra:6.1.125,FMLib:17.12.100.49
 definitions=2026-06-18_01,2026-06-18_02,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 adultscore=0 clxscore=1015 malwarescore=0 bulkscore=0 suspectscore=0
 priorityscore=1501 impostorscore=0 phishscore=0 spamscore=0
 lowpriorityscore=0 classifier=typeunknown authscore=0 authtc= authcc=
 route=outbound adjust=0 reason=mlx scancount=1 engine=8.22.0-2606150000
 definitions=main-2606180121

On Thu, Jun 18, 2026 at 06:17:00PM +0530, Sarat Addepalli wrote:
> Add IPA nodes for Qualcomm qcm6490 board.
> 
> Signed-off-by: Sarat Addepalli <sarat.addepalli@oss.qualcomm.com>
> ---
>  arch/arm64/boot/dts/qcom/qcm6490-idp.dts | 7 +++++++
>  1 file changed, 7 insertions(+)

Please rebase on top of https://lore.kernel.org/all/20260517-ipa-loader-v1-0-3c3764c1b4a3@oss.qualcomm.com/

> 
> diff --git a/arch/arm64/boot/dts/qcom/qcm6490-idp.dts b/arch/arm64/boot/dts/qcom/qcm6490-idp.dts
> index bdc02260f902..fd1aa26e20f1 100644
> --- a/arch/arm64/boot/dts/qcom/qcm6490-idp.dts
> +++ b/arch/arm64/boot/dts/qcom/qcm6490-idp.dts
> @@ -619,6 +619,13 @@ &gpu_zap_shader {
>  	firmware-name = "qcom/qcm6490/a660_zap.mbn";
>  };
>  
> +&ipa {
> +	qcom,gsi-loader = "self";
> +	memory-region = <&ipa_fw_mem>;
> +	firmware-name = "qcom/qcm6490/ipa_fws.mbn";
> +	status = "okay";
> +};
> +
>  &lpass_rx_macro {
>  	status = "okay";
>  };

-- 
With best wishes
Dmitry
