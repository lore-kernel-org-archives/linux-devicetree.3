Received: from mx0b-0031df01.pphosted.com (mx0b-0031df01.pphosted.com [205.220.180.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 98DF034F275
	for <devicetree@vger.kernel.org>; Sat,  6 Jun 2026 12:32:41 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.180.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1780749162; cv=none; b=RZcPkWOyxemCfqMhH7JOgLkJhEjGgUbFU98DEaZcAj18BNiSW2ME7iqxHJVd6ta5SwBCYj4plWOy31mCL9QkEhKq4dFtSQP+54zLAIigYcMg3nK06U4N88rJ/Hw1ZDfJ7cr81FR5o8sAWaIXMA8LWkE074v64SodoK19/t6QHhM=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1780749162; c=relaxed/simple;
	bh=uArRKwydgi7Awi4QPGR51VyhpX7czobobNZeG3o9P0k=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=H9Acsa6u4o7YRtAZuB98f9WEM+nUVbW/fOBMwgtTCVQJzXs0c0Vpsn3YSVLr7TqlThSsD3VfDaKcQo7z+y88I/0viWGdp5XQpe+H5D5pvG9EICA2C7/Whe4s7CjEHtSUAEt2S74ZnOVBYftruPo1BNqMSyNUZugo0SM+tMf2iIs=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=E/FAz9rD; dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b=etr7bukI; arc=none smtp.client-ip=205.220.180.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b="E/FAz9rD";
	dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b="etr7bukI"
Received: from pps.filterd (m0279873.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 656BGeTV1295877
	for <devicetree@vger.kernel.org>; Sat, 6 Jun 2026 12:32:40 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-type:date:from:in-reply-to:message-id:mime-version
	:references:subject:to; s=qcppdkim1; bh=J7Jk6biw3e7jArCRN6UqVLK8
	rysHv0R52SpzdK/4FYE=; b=E/FAz9rDat47MAmRdOnoSqI7RkGCWRGIiEDC51vj
	JLkwxEz/tmIyvekIfi6YxXkyorWJua3ag9xd9BWtmJJXEP6psl3iJcnKjT8KEEJs
	0yIJotazgYMkChJ7zncLaPbnjYzmx1ZBMyJNdZ5IJSZDL7pyWGMBEguyx0o8NSJ2
	UXThhukq5USxC+w/HpEZNFtNyj0CsiDdcP+yd3jsCXGkBZ+PnEJtKMH4IaD31EHT
	lLCjItmIe5+szFktITBMFzgrIu5vKOlLFe5xQsLPKbYcTuce+q/RDoNVhhqmXGlk
	wIZqMJ31B4GDYyFaUPhd4dvPY7qFaT6vo2DeLUl8ed7kZA==
Received: from mail-ua1-f70.google.com (mail-ua1-f70.google.com [209.85.222.70])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4em9k3hf2n-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <devicetree@vger.kernel.org>; Sat, 06 Jun 2026 12:32:40 +0000 (GMT)
Received: by mail-ua1-f70.google.com with SMTP id a1e0cc1a2514c-96391e58e62so3806926241.0
        for <devicetree@vger.kernel.org>; Sat, 06 Jun 2026 05:32:40 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1780749160; x=1781353960; darn=vger.kernel.org;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:from:to:cc:subject:date:message-id:reply-to;
        bh=J7Jk6biw3e7jArCRN6UqVLK8rysHv0R52SpzdK/4FYE=;
        b=etr7bukIK2frDt50OzMcg67khqXOtR245s49ghOJZ7EBEAKCx5hxD8uOs0st22U8FO
         1LX1IyiksadBCqllzb3iSfHErb2C302JU8c42k3qlbkAPeKUDlog07FuiiCIfFF6E0qi
         pcNvdSfoDtDkN4cEWGUpIZT1q7DiliyMUm/uhgt5u9K0KpAeLWFe12FZ+ixXSl5FE8Mm
         zzL23mWKkvFR9pqpuTDW0aOn/laVLJw36j6ullZj36j0WgHvLGZqkhgxzsHo+420aJt7
         kZ/7JQeTpJoJK/a16IbcP2/E2PE4toqd3S5LITfjKQblXDoDlz9IUVkxyRYlHPez0ANk
         o6kA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1780749160; x=1781353960;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:x-gm-gg:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=J7Jk6biw3e7jArCRN6UqVLK8rysHv0R52SpzdK/4FYE=;
        b=QOQF6iKpsnRJPk2YQO91YnuXqfv0BAwQWoD42/PFVHpTMI4Zc4oJPDcIm7dStD4N4Q
         3qdW40qJELgEH6gUUgozRCvDZSy5KuPW3rNDBUvHNpsaq6ZOHsVJwb4kkiENkj1oefmE
         9R4Y+uM+Z8mi4XumfUTvij0jb40zcvlwqSrMwY/wQOc+RiDhQ81OA/EeWXShU2tSfQpg
         kdamsogdxHSMnDm25c3XbnyQBSQHspq+qaOg9bItyqgGGZk6omqPeJhYo9GDh3Qhp770
         aXVSn9zu9a1YzKPUjhx/PTGXSBX0mNIBbNS/no0F+U1d2cbLi8zl3NoPQPthzxA5g4SQ
         JfYA==
X-Forwarded-Encrypted: i=1; AFNElJ8cjhAl3Ya5sUl45QHBmZwU8cBznUW+Mzl3sCewgWoaFwQSi4t/R3FDqvRhKUDE38ka9SodwEoJtIBa@vger.kernel.org
X-Gm-Message-State: AOJu0YzVH2mZ21qMPASNJBzseWTzuROiOtVbcJjrrpRaV7VDpNyZk92U
	h0VUzEAn5bSa9sap7AHUvXtR+wsVKq65cFNcJ05Sy91kHUNCYFTnikWwr72/Jgox/yC46X5PMtI
	qHppvbHlWfrP5DTEHT1u1Su558dUvFEASkhKo7g5fnaokUEOqbf4oJRuuuhjcTxFD
X-Gm-Gg: Acq92OF3viOGW0nOv3bZ4REP4zLWWZDFGAwsLfIdl1Uz9dfqTT+Q3elIxZLF/ZtAWtp
	bvQH584YUZrC4gPS0O1v52kwEidmDaRs4K8iLI5KfSusCJikY82w1sEN/vKEsyUAt4HOGMJqkYC
	Wt68AR+GGlUL761UPQdgnBwmyctm+Zi7TGDb1w3rvzTGPseMQ94tpC5lBK35HVXd6a0WizVMHxO
	ShHf1XKA7u5ivRJo3fc54XmlqWkSs8FFxvDmOnLv5GeQ9vrmGTa/pKX6FtWlaJ2/Gway/LpxP2M
	Ubfx4B5cReSq24VvBuDhCPqpMDEqW6hyqjVGVGnDIBTikGI2VH3tvQNy/1/LT/7cfgfRUhursDL
	5QXb/6Ftt2ZDVX0yLU7pN9JioQdsPmTtZpuObGamNSscyCg1tzsW8u+xCO42J39aGUIHkH4CQ9h
	dr4+nV7BFDMnLLXmIWRTEaPSJcPoMH1F3s86uFADSdnuubiw==
X-Received: by 2002:a05:6102:284f:b0:6dc:c4aa:472 with SMTP id ada2fe7eead31-700359f5425mr1741714137.14.1780749159949;
        Sat, 06 Jun 2026 05:32:39 -0700 (PDT)
X-Received: by 2002:a05:6102:284f:b0:6dc:c4aa:472 with SMTP id ada2fe7eead31-700359f5425mr1741697137.14.1780749159549;
        Sat, 06 Jun 2026 05:32:39 -0700 (PDT)
Received: from umbar.lan (2001-14ba-a073-af00-264b-feff-fe8b-be8a.rev.dnainternet.fi. [2001:14ba:a073:af00:264b:feff:fe8b:be8a])
        by smtp.gmail.com with ESMTPSA id 2adb3069b0e04-5aa7b8fba4asm2415013e87.18.2026.06.06.05.32.36
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Sat, 06 Jun 2026 05:32:37 -0700 (PDT)
Date: Sat, 6 Jun 2026 15:32:35 +0300
From: Dmitry Baryshkov <dmitry.baryshkov@oss.qualcomm.com>
To: Komal Bajaj <komal.bajaj@oss.qualcomm.com>
Cc: Vinod Koul <vkoul@kernel.org>, Frank Li <Frank.Li@kernel.org>,
        Rob Herring <robh@kernel.org>,
        Krzysztof Kozlowski <krzk+dt@kernel.org>,
        Conor Dooley <conor+dt@kernel.org>,
        Krzysztof Kozlowski <krzk@kernel.org>,
        Georgi Djakov <djakov@kernel.org>,
        Bjorn Andersson <andersson@kernel.org>,
        Konrad Dybcio <konradybcio@kernel.org>, linux-arm-msm@vger.kernel.org,
        dmaengine@vger.kernel.org, devicetree@vger.kernel.org,
        linux-kernel@vger.kernel.org, linux-pm@vger.kernel.org,
        Bibek Kumar Patro <bibek.patro@oss.qualcomm.com>
Subject: Re: [PATCH v3 08/10] arm64: dts: qcom: shikra: Enable CDSP, LPAICP
 and MPSS on EVK boards
Message-ID: <ykcbo7dkl2rrjdzutpwsc3wmnub5r7h3zuspxiyh5v432whb65@sbaar24glpta>
References: <20260601-shikra-dt-m1-v3-0-0fe3f8d9ec48@oss.qualcomm.com>
 <20260601-shikra-dt-m1-v3-8-0fe3f8d9ec48@oss.qualcomm.com>
Precedence: bulk
X-Mailing-List: devicetree@vger.kernel.org
List-Id: <devicetree.vger.kernel.org>
List-Subscribe: <mailto:devicetree+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:devicetree+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20260601-shikra-dt-m1-v3-8-0fe3f8d9ec48@oss.qualcomm.com>
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYwNjA2MDEyNSBTYWx0ZWRfX1752kyJDehRO
 XCr4WTNeTmW4TVhEuflIMSkC8fzFOnaQZn04bRSv/wO0gnAzDgHejrWKftFZeiSr6TtDnd1CnLJ
 zw1e4WL9zhCgzlZn1f1Q2lCy0Ota5te9kn/f41hMneFZDgWBN8AQtQYQgEHz1luwv4cYPNTKQjR
 mYhCfAyQpeSla4P9U/wG5KAiHjYx6GAaBaHnr82gtru+Zi8z0kUVE+fEv3AS++o7GSa8bhSZ/9w
 Y9CDe1bL4xazrEQW5Dlv3q3oj4QbWGfNaE71cppn6+f3ICOBcXiAntUc9rONlt1+I2+XcMQHnqB
 o0hMT/JijjCkQ7HirbBuftRgcIFuhvnU8kJjanwpf4nHqMZNO081/kvnoVazp1wYGzlU6quvNlL
 94jigyKZkShqYzUPcHzAEUJvUH2W0T15+UkgEhlWBCH4Lp2iuxD6AOxULVZcp92VSm68JOFJ9bT
 bBrqxfHX583mEPte6uA==
X-Proofpoint-ORIG-GUID: GQcUygE5S418tgSOeZF0Ms8_N86LvEQF
X-Proofpoint-GUID: GQcUygE5S418tgSOeZF0Ms8_N86LvEQF
X-Authority-Analysis: v=2.4 cv=TIB1jVla c=1 sm=1 tr=0 ts=6a241368 cx=c_pps
 a=R6oCqFB+Yf/t2GF8e0/dFg==:117 a=xqWC_Br6kY4A:10 a=kj9zAlcOel0A:10
 a=FelO9ux0wxsA:10 a=s4-Qcg_JpJYA:10 a=VkNPw1HP01LnGYTKEx00:22
 a=u7WPNUs3qKkmUXheDGA7:22 a=rJkE3RaqiGZ5pbrm-msn:22 a=EUspDBNiAAAA:8
 a=0thynvrgsBQo68K9vjAA:9 a=CjuIK1q_8ugA:10 a=TD8TdBvy0hsOASGTdmB-:22
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1143,Hydra:6.1.125,FMLib:17.12.100.49
 definitions=2026-06-06_03,2026-06-05_02,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 lowpriorityscore=0 phishscore=0 clxscore=1015 adultscore=0 priorityscore=1501
 bulkscore=0 malwarescore=0 suspectscore=0 spamscore=0 impostorscore=0
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.22.0-2605210000 definitions=main-2606060125

On Mon, Jun 01, 2026 at 06:25:10PM +0530, Komal Bajaj wrote:
> From: Bibek Kumar Patro <bibek.patro@oss.qualcomm.com>
> 
> Enable CDSP, LPAICP and MPSS for Qualcomm's Shikra CQM, CQS and
> IQS EVK board.
> 
> Signed-off-by: Bibek Kumar Patro <bibek.patro@oss.qualcomm.com>
> Signed-off-by: Komal Bajaj <komal.bajaj@oss.qualcomm.com>
> ---
>  arch/arm64/boot/dts/qcom/shikra-cqm-evk.dts | 19 +++++++++++++++++++
>  arch/arm64/boot/dts/qcom/shikra-cqs-evk.dts | 19 +++++++++++++++++++
>  arch/arm64/boot/dts/qcom/shikra-iqs-evk.dts | 19 +++++++++++++++++++
>  3 files changed, 57 insertions(+)
> 
> diff --git a/arch/arm64/boot/dts/qcom/shikra-cqm-evk.dts b/arch/arm64/boot/dts/qcom/shikra-cqm-evk.dts
> index 0a52ab9b7a4c..b112b21b1d79 100644
> --- a/arch/arm64/boot/dts/qcom/shikra-cqm-evk.dts
> +++ b/arch/arm64/boot/dts/qcom/shikra-cqm-evk.dts
> @@ -23,6 +23,25 @@ chosen {
>  	};
>  };
>  
> +&remoteproc_cdsp {
> +	firmware-name = "qcom/shikra/cdsp.mbn";
> +
> +	status = "okay";
> +};
> +
> +&remoteproc_lpaicp {
> +	firmware-name = "qcom/shikra/lpaicp.mbn",
> +			"qcom/shikra/lpaicp_dtb.mbn";
> +
> +	status = "okay";
> +};
> +
> +&remoteproc_mpss {
> +	firmware-name = "qcom/shikra/cqm/qdsp6sw.mbn";

qcom/shikra/qdsp6sw.mbn

> +
> +	status = "okay";
> +};
> +
>  &sdhc_1 {
>  	vmmc-supply = <&pm4125_l20>;
>  	vqmmc-supply = <&pm4125_l14>;
> diff --git a/arch/arm64/boot/dts/qcom/shikra-cqs-evk.dts b/arch/arm64/boot/dts/qcom/shikra-cqs-evk.dts
> index b3f19a64d7ae..e62ba5aef71f 100644
> --- a/arch/arm64/boot/dts/qcom/shikra-cqs-evk.dts
> +++ b/arch/arm64/boot/dts/qcom/shikra-cqs-evk.dts
> @@ -23,6 +23,25 @@ chosen {
>  	};
>  };
>  
> +&remoteproc_cdsp {
> +	firmware-name = "qcom/shikra/cdsp.mbn";
> +
> +	status = "okay";
> +};
> +
> +&remoteproc_lpaicp {
> +	firmware-name = "qcom/shikra/lpaicp.mbn",
> +			"qcom/shikra/lpaicp_dtb.mbn";
> +
> +	status = "okay";
> +};
> +
> +&remoteproc_mpss {
> +	firmware-name = "qcom/shikra/cqs/qdsp6sw.mbn";

qcom/shikra/qdsp6sw_nm.mbn

> +
> +	status = "okay";
> +};
> +
>  &sdhc_1 {
>  	vmmc-supply = <&pm4125_l20>;
>  	vqmmc-supply = <&pm4125_l14>;
> diff --git a/arch/arm64/boot/dts/qcom/shikra-iqs-evk.dts b/arch/arm64/boot/dts/qcom/shikra-iqs-evk.dts
> index 3003a47bd759..727809430fd1 100644
> --- a/arch/arm64/boot/dts/qcom/shikra-iqs-evk.dts
> +++ b/arch/arm64/boot/dts/qcom/shikra-iqs-evk.dts
> @@ -23,6 +23,25 @@ chosen {
>  	};
>  };
>  
> +&remoteproc_cdsp {
> +	firmware-name = "qcom/shikra/cdsp.mbn";
> +
> +	status = "okay";
> +};
> +
> +&remoteproc_lpaicp {
> +	firmware-name = "qcom/shikra/lpaicp.mbn",
> +			"qcom/shikra/lpaicp_dtb.mbn";
> +
> +	status = "okay";
> +};
> +
> +&remoteproc_mpss {
> +	firmware-name = "qcom/shikra/cqs/qdsp6sw.mbn";

qcom/shikra/qdsp6sw_nm.mbn

> +
> +	status = "okay";
> +};
> +
>  &sdhc_1 {
>  	vmmc-supply = <&pm8150_l17>;
>  	vqmmc-supply = <&pm8150_s4>;
> 
> -- 
> 2.34.1
> 

-- 
With best wishes
Dmitry
