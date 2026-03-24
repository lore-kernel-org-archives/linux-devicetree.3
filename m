Received: from mx0a-0031df01.pphosted.com (mx0a-0031df01.pphosted.com [205.220.168.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 6D2C735AC30
	for <devicetree@vger.kernel.org>; Tue, 24 Mar 2026 20:54:29 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.168.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1774385672; cv=none; b=eZ/zBDQzu2GKDnnRFpnFDpp1rg3izYYNWAqmmj8MBFlQLeldI/QLfCbRHt1oWSBQGpfk1qQazQZ+QKytNUiD6um+E3RtBpTn2IHysIcEaEdVE7cm2/eraeq1+z07VDYl4ycyeJq8X7tgqNl+TIEf5/gDlU4f55EEMdbKIEouXaQ=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1774385672; c=relaxed/simple;
	bh=Z8NlWAS8ibWrW+F1hqnwN7hUxPRmLS9DxyojjSXY4EE=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=kDm9zlyGDGZDOiwNPh2Nxe6Ctema6pw/u9C+Wz4uav/XnbNm4xSIpjOUkrumWlncZAdkrtccXIJ5Fh/8tr+frfS3rUNheQmuEeOWQOu+GjGTqAL7uphmre3o74atYY9dJa7sJju4eS6/4SDTKNfU9UbAAbRvpjWHveKKBedPQqQ=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=ArYV2VJT; dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b=e9dWchMi; arc=none smtp.client-ip=205.220.168.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b="ArYV2VJT";
	dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b="e9dWchMi"
Received: from pps.filterd (m0279867.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 62OJnrua2076393
	for <devicetree@vger.kernel.org>; Tue, 24 Mar 2026 20:54:28 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-type:date:from:in-reply-to:message-id:mime-version
	:references:subject:to; s=qcppdkim1; bh=416fKEesZoc7uRI0P7P5Lb7s
	vTGvf9yskNjv5O78rw8=; b=ArYV2VJTkIr5mRa5iUC/RuadD2oQBMMGc+Nlt8MS
	LljjJm0yS35LulUhCu53i5hyu8toL2JeHCkBhbpNdv/ce8ymLawvUkvFlSFMumVC
	tDd1EFFKfsPxUCOr6fX3YfUxAElhkLYuXs+VUUy6eTdVdHNsRmKmQyq0kTLTzxJH
	pkmfsAo65Z1FATrfbMnbjqFGvN7IJvBQE89dbzbZqVLo+jc1ysEA0AYpAJsariMn
	a0C5emNJXZIwlbcv4EbLWJTDDE0kXJNZgX3Aj6RKXKCBeS+CQAyeWQgXcQeWPg6z
	J2aMcVA0iVkV514YuvyijTM6DyL0Tni2jPtCpcH8a8WWzw==
Received: from mail-qt1-f199.google.com (mail-qt1-f199.google.com [209.85.160.199])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4d4141069y-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <devicetree@vger.kernel.org>; Tue, 24 Mar 2026 20:54:28 +0000 (GMT)
Received: by mail-qt1-f199.google.com with SMTP id d75a77b69052e-50b6f869676so59332251cf.2
        for <devicetree@vger.kernel.org>; Tue, 24 Mar 2026 13:54:28 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1774385667; x=1774990467; darn=vger.kernel.org;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:from:to:cc:subject:date:message-id:reply-to;
        bh=416fKEesZoc7uRI0P7P5Lb7svTGvf9yskNjv5O78rw8=;
        b=e9dWchMivgi9OmOR3I7jZgUyGr2Rp4SYoWrpozR0VGuialBK0+7aousc5yPO2b36q3
         RTWXRBuZxzoFEEk9baKTulpHCJP3THYRv5yo8ECmLB7SMzhqM+e4rzkR/GgPG0KH/5G7
         R3Lz2bDPLFk7grCo0MQcn547gSRU+s62OMu5ApIwHU0xGTjmaPTN2RYLu35cK5tEpreE
         CRR3sqpwLtZahasplD77BL9gqOJ5rspNjiTT0R6+e8jctkX6NSdV133zGtmlXhR6whxg
         1EEfopdgAXOusIXbR+6hUKK2JVIEwp+S7W76DJOdI43wnwxKim7aIPFXWd4ScvHW1oLu
         GVPQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1774385667; x=1774990467;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:x-gm-gg:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=416fKEesZoc7uRI0P7P5Lb7svTGvf9yskNjv5O78rw8=;
        b=J9EhnxxhwcVSKyN7SWUI1UfiVOj4W1uU8UjhYWP1KEVxYAEO46mfsSDdlq8FgiFqfV
         HXKCWBdiIuMc5wflBevAlU7zZaU+gqOshib877LrT5Kp8qHkbr9rU944w1ov48zT2X5K
         my3JLr3vN95I2ZiY8pmsq6Qed/yVd6wcw+n5Y82QOIX2Lyo1pyuIIUS2Tngsm1H/JLKw
         4AlXrpDlu/OZaYSNpX0YVza85Ax4Ka0z+DatL54BoNcKq45xBdsbWZprZ3sK+QsfLKJy
         Fs6ap6n5nrnSgEaKTbi51tsXvIsB0/lkCk5HXcU/NMSY7eIZU4Etf7ymYhhjMVzPXnir
         srYg==
X-Forwarded-Encrypted: i=1; AJvYcCX85pHEr4DuG6/2Uanjlclm6oczkxNYY6uRMecv1Iw0UmAqO9/4tc9S5Ud+m7aBp4CWB3Dbl33RKC8q@vger.kernel.org
X-Gm-Message-State: AOJu0YyiT1I7gx6OegxnLi4zdPDJM3Bx5bYTOiJe3Of9ZaDNXpCC6wh1
	vH0rENvSUb1bksTob/a1Lo+KjTKX+dqOs9jRv7pcxwRZg1d4hMuqNDZB9BcpAjVDrWMAqelU7lh
	0vo04WWjGvMeR66MAIYJS83QLJP60rwfoMfNFwH+ksSi1LLcrmfltIj1lq8A2IxGg
X-Gm-Gg: ATEYQzwkWJh++md3vFnT1vvN8JrLTTxTKON6jv30i8ZLFOquZx7J63qMyMIhGMtCy3G
	5ozoU3cLNruC6EBeqTJWPEa8Y5UVURW3LvaYMK5um3TvR9rQ9g3GdolWQvikEEFfJ8VVnSO//22
	iuqZ3hf7sTpWgDdBOMbWD4otkwGZRwiRFS/7rTQnoq9xNSZq4R1jq7mgcz/fLiw0QzN754Ots40
	XOcxHxj/xnfFdzayzRENY442Hci4hc/FEMI+s0NvAuDbCksgZSuotWgM5Cpe0XFHJkQjL6O1HxJ
	ru3+Te+7aBAM4EjuC371kyGC3f6BB1kPoMA5ICUC6fxaO1+T0oDPnllIicEXMvuYcgWPF76YHBq
	aYUYIdB7CtWGqqSIvE14ZGznd+zH3zdu1GW1IqrDyRu4oi72bilxC3SubL64SoTFq/r/MA04XH4
	QxvzvbGpbSGg5z9hiuUtZGXxASlQyc+gAcxo0=
X-Received: by 2002:a05:622a:5c93:b0:509:481:5365 with SMTP id d75a77b69052e-50b80e63242mr14891681cf.50.1774385667387;
        Tue, 24 Mar 2026 13:54:27 -0700 (PDT)
X-Received: by 2002:a05:622a:5c93:b0:509:481:5365 with SMTP id d75a77b69052e-50b80e63242mr14888691cf.50.1774385662062;
        Tue, 24 Mar 2026 13:54:22 -0700 (PDT)
Received: from umbar.lan (2001-14ba-a073-af00-264b-feff-fe8b-be8a.rev.dnainternet.fi. [2001:14ba:a073:af00:264b:feff:fe8b:be8a])
        by smtp.gmail.com with ESMTPSA id 38308e7fff4ca-38bf9753c7dsm36218071fa.13.2026.03.24.13.54.20
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 24 Mar 2026 13:54:21 -0700 (PDT)
Date: Tue, 24 Mar 2026 22:54:19 +0200
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
Subject: Re: [PATCH v1 5/6] arm64: dts: qcom: kodiak: Add QSPI memory
 interconnect path
Message-ID: <i73fny3nxdljztry4qn3rotjtrjnlau7oxzjfj2bfsox42ylti@lllrvsc4eyum>
References: <20260324-spi-nor-v1-0-3efe59c1c119@oss.qualcomm.com>
 <20260324-spi-nor-v1-5-3efe59c1c119@oss.qualcomm.com>
Precedence: bulk
X-Mailing-List: devicetree@vger.kernel.org
List-Id: <devicetree.vger.kernel.org>
List-Subscribe: <mailto:devicetree+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:devicetree+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20260324-spi-nor-v1-5-3efe59c1c119@oss.qualcomm.com>
X-Authority-Analysis: v=2.4 cv=fOk0HJae c=1 sm=1 tr=0 ts=69c2fa04 cx=c_pps
 a=WeENfcodrlLV9YRTxbY/uA==:117 a=xqWC_Br6kY4A:10 a=kj9zAlcOel0A:10
 a=Yq5XynenixoA:10 a=s4-Qcg_JpJYA:10 a=VkNPw1HP01LnGYTKEx00:22
 a=u7WPNUs3qKkmUXheDGA7:22 a=eoimf2acIAo5FJnRuUoq:22 a=EUspDBNiAAAA:8
 a=b-WZSYoPuCkCoMZxyvkA:9 a=CjuIK1q_8ugA:10 a=kacYvNCVWA4VmyqE58fU:22
X-Proofpoint-GUID: tchux3x0CQ2DeAZF_mfpSQsr9IzswMjl
X-Proofpoint-ORIG-GUID: tchux3x0CQ2DeAZF_mfpSQsr9IzswMjl
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYwMzI0MDE2MSBTYWx0ZWRfX3VzA1QHXh2WC
 ClSGrIs+rM1pxWyA/CJgw1kYfo87CC3pE3190QOVlivW23rr3gRZaU4dUkCgnOrH2TW4GXbSIqn
 eirEGPpfvkKS5GFsqiq14NX+Rrd6CjobGm/4A020mQJrfwTyle5K9tzp/nAAXMNnu8UT+kK66UB
 1K/kZNGdWswgmat/tFfSQPGpzrNlp+jFrqfPx3WdUkUVOC/6PCSIi2shLMCdsF8s5vEZV2Gz22t
 3l3OnN8iDM7XGGrJ3VUVBPKJlrX2F22SG6u6RMOPf7dwO87MkoYPBs3fFnmMgFfTCzmCSOmHqSB
 E5cWo/KwBZ/34d40ScRNtBk+xdeL6ckVqyO28l0PnAo/WzVAuYH961v0owE8sXrKPSvz5R7rrxN
 +OWhLmErWh7ZcK8I2RTOc1kWa83jhGtZ2TMK8UdNnHJid8E3uuvKporZlfpaNijwCcEPJErR6ku
 y91s8kGMPNaxMEUm0lA==
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1143,Hydra:6.1.51,FMLib:17.12.100.49
 definitions=2026-03-24_03,2026-03-24_01,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 malwarescore=0 bulkscore=0 priorityscore=1501 clxscore=1015 adultscore=0
 lowpriorityscore=0 phishscore=0 spamscore=0 suspectscore=0 impostorscore=0
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.22.0-2603050001 definitions=main-2603240161

On Tue, Mar 24, 2026 at 06:43:22PM +0530, Viken Dadhaniya wrote:
> Add the missing QSPI-to-memory interconnect path alongside the existing
> configuration path. Without it, the interconnect framework cannot vote for
> the bandwidth required by QSPI DMA data transfers.
> 
> Signed-off-by: Viken Dadhaniya <viken.dadhaniya@oss.qualcomm.com>
> ---
>  arch/arm64/boot/dts/qcom/kodiak.dtsi | 7 ++++---
>  1 file changed, 4 insertions(+), 3 deletions(-)
> 
> diff --git a/arch/arm64/boot/dts/qcom/kodiak.dtsi b/arch/arm64/boot/dts/qcom/kodiak.dtsi
> index 6079e67ea829..9a44bb3811a7 100644
> --- a/arch/arm64/boot/dts/qcom/kodiak.dtsi
> +++ b/arch/arm64/boot/dts/qcom/kodiak.dtsi
> @@ -4312,9 +4312,10 @@ qspi: spi@88dc000 {
>  			clocks = <&gcc GCC_QSPI_CNOC_PERIPH_AHB_CLK>,
>  				 <&gcc GCC_QSPI_CORE_CLK>;
>  			clock-names = "iface", "core";
> -			interconnects = <&gem_noc MASTER_APPSS_PROC 0
> -					&cnoc2 SLAVE_QSPI_0 0>;
> -			interconnect-names = "qspi-config";
> +			interconnects = <&gem_noc MASTER_APPSS_PROC 0 &cnoc2 SLAVE_QSPI_0 0>,
> +					<&aggre1_noc MASTER_QSPI_0 0 &mc_virt SLAVE_EBI1 0>;

As you are touching thse lines, please also switch to correspodning
QCOM_ICC_TAGs (and I'm not sure if those should be ALWAYS).


> +			interconnect-names = "qspi-config",
> +					     "qspi-memory";
>  			power-domains = <&rpmhpd SC7280_CX>;
>  			operating-points-v2 = <&qspi_opp_table>;
>  			status = "disabled";
> 
> -- 
> 2.34.1
> 

-- 
With best wishes
Dmitry
