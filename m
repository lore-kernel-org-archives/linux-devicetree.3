Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=205.220.168.131
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1793003776;
	b=kxTrG0zFktptloEi3J7PTn79IogbNHMd7hTubfAJa9bu2R2pBy7VQ1jvX6EeHYtTQtTe
	 jL1l14ZHFE9PcewO3GCqWynAuaELU4j4/AW1iEKizNAs2+5bUWPbmyX1o1NG/jXa0fjZ5
	 1ad5RdTb/2x3P646XLCPAN9L3q43xMEdYnsDNGy0+BnOOZxQLLe9P5q5yabW7ZMRmOrVD
	 43dmKgg1gYZO0DJzbfDYSTDcze9Dr7/7Oo9ZqR6szpxS/ewOhx9yFwB+wXN1USN7Q1Ud7
	 iFY0kQPEhDhDE15sqhUd4dEmG4oFReSYGCufnggprApDSeHD/+ZNC0XRWh2MGqMtfpQ==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1793003776;
	h=DMARC-Filter:Received:DKIM-Signature:Received:Received:
	 DKIM-Signature:X-Google-DKIM-Signature:X-Forwarded-Encrypted:
	 X-Gm-Message-State:X-Gm-Gg:X-Received:X-Received:Received:Date:From:
	 To:Cc:Subject:Message-ID:References:MIME-Version:Content-Type:
	 Content-Disposition:In-Reply-To:X-Proofpoint-GUID:
	 X-Proofpoint-ORIG-GUID:X-Proofpoint-Spam-Info:X-Authority-Analysis:
	 X-Proofpoint-Spam-Details-Enc:X-Proofpoint-Virus-Version:
	 X-Proofpoint-Spam-Details;
	bh=2IBldTT+B4MiEIGdaWBBVnElcnO8vPC3++c1Vr7JCyA=;
	b=kEvCXSebk5W0b6QTk+H81wFuQqSglWjFJuItLb4QfN9hKkS8pRqhKHzwLYmrO8SEEprV
	 XkCQc+mP1rNPQ8XxKBtXnjFlD8iHV5Hh4dqT9bPqADYN75Vq5N+jdEIHLb1iEzsDC1OXv
	 9cTksPbHVKXrtVPmkERSzuHKWynZwdhaBggI/xG0HPWOs+lcfY9Ar4OFEU1IFp0FrZOZ9
	 w1P326qINHSEoTSkZYDC3PA1HBjLxFA5GclIREiQYUZGjnB7pKCHiRsA1qlq5ieVmkDDl
	 aAckzBLUf1juxUK2ZcQLZZlXST8v9VoW1h+8TdyKPVjFUpGdyipAaptgHJppn0aNMMQ==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=oss.qualcomm.com;
	spf=pass smtp.mailfrom=oss.qualcomm.com;
	dkim=pass header.d=qualcomm.com header.i=@qualcomm.com header.a=rsa-sha256 header.s=qcppdkim1 header.b=Ux2TlE8z;
	dkim=pass header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.a=rsa-sha256 header.s=google header.b=QL5vGX3h;
	arc=none smtp.remote-ip=205.220.168.131
Received: from mx0a-0031df01.pphosted.com (mx0a-0031df01.pphosted.com [205.220.168.131])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 8E237606A33A
	for <devicetree@vger.kernel.org>; Mon, 26 Oct 2026 08:36:15 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org 8E237606A33A
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key, unprotected) header.d=qualcomm.com header.i=@qualcomm.com header.a=rsa-sha256 header.s=qcppdkim1 header.b=Ux2TlE8z;
	dkim=pass (2048-bit key, unprotected) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.a=rsa-sha256 header.s=google header.b=QL5vGX3h
Received: from pps.filterd (m0279863.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 69Q4auKf2255115
	for <devicetree@vger.kernel.org>; Mon, 26 Oct 2026 08:36:15 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-type:date:from:in-reply-to:message-id:mime-version
	:references:subject:to; s=qcppdkim1; bh=2IBldTT+B4MiEIGdaWBBVnEl
	cnO8vPC3++c1Vr7JCyA=; b=Ux2TlE8z+gn9CQPUQH7iMDWV3wRVIQWe9SWb4WE9
	dBSsI1tDytWIT/7OBt7qKcvynQ02TKQlx1duqUiZ6dlzQ+S4XWG2OMZHmTWXiPxD
	c4VZKpbS3sVZh5bl/DjDWpmmqyAxzOxgVCpLe029L+2lOS/Lh46/pM5MK9JKEACO
	91/lmaYzR64nc6iWTbcO1Pz2WwtcDR0FPZyDX6AoiGYGSzv+uTFE4Xuv3xFNwxeL
	+h/z8/2emxUseYxs0sm7ZXBnbhIAyaeKQ0a+Rxru6btArCce4ejB9Ge36aeU5VaE
	ZNRW5muNra1IE76qEhY/ye203+B/veS0m5aRqDyNuymRSA==
Received: from mail-pj1-f71.google.com (mail-pj1-f71.google.com [209.85.216.71])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4hgmw3nfk0-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <devicetree@vger.kernel.org>; Mon, 26 Oct 2026 08:36:14 +0000 (GMT)
Received: by mail-pj1-f71.google.com with SMTP id 98e67ed59e1d1-3ad7030e886so3067553a91.0
        for <devicetree@vger.kernel.org>; Mon, 26 Oct 2026 01:36:14 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1793003774; x=1793608574; darn=vger.kernel.org;
        h=in-reply-to:content-disposition:content-type:mime-version
         :references:message-id:subject:cc:to:from:date:from:to:cc:subject
         :date:message-id:reply-to:content-type;
        bh=2IBldTT+B4MiEIGdaWBBVnElcnO8vPC3++c1Vr7JCyA=;
        b=QL5vGX3hZ/MuMoSd9PwzfCMn7g0Mk8rWfsLNIvyB9itnhwRqlMgb5JxZDPm5Viv4WU
         TISe8BGjnu1dVYdeshGGAHtSXbbSVXdqSKKPGr/PbX0PEF6AWPIaBDTan1dLqwmiLTvn
         d7/ivRZ638FmPPDz+MefZCesVYl2VT6DfsAZrX22uhT8v0qZl7oPhzNnpT94MSGQqRl9
         s2qNQJGc2MTp3ejxBmtpY01IyDHTTYT+p/p06FMCK4/g1rDkTxjjuPSxJEComdLXtzOw
         yPFyFOGBWGi2GgB2U3bXN16F+PoaVJes6Y2j2EseJxHFkUP4tzrYSkRz21dGwnY+F7a1
         H54Q==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1793003774; x=1793608574;
        h=in-reply-to:content-disposition:content-type:mime-version
         :references:message-id:subject:cc:to:from:date:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=2IBldTT+B4MiEIGdaWBBVnElcnO8vPC3++c1Vr7JCyA=;
        b=V8dZ2+4mS2QRlcCrDo2u/L4NG/Q5xDyz33awxBjcHvrZLtjUlXch71Kj0vypFybXhx
         WRCl5DYX7Cr9usLCaW6cZuue0rPFq0KucHjhL9fjDmaQM3fSSFHTRjZfgBZKPdlaaPC9
         wb/pNG7UyWYQDjeSCXKzTwsRW7v7x+TGLXHyuRDWWc6pbNt7hONWLvolfg1BN8/7fBBj
         hfuoHLC/fxRDC/8/yOtPmsmJcqF7Q/uncNeIgkDpYZpjfYpr2JlLlXaNWY9fW1Vhlm11
         POWGOQ/+HIOpFpihTH0fUGpQ33Fqhl874vVqU7Uu/te9Fe4CuRu7Xeno1I6oc6vjPRs8
         QwCw==
X-Forwarded-Encrypted: i=1; AKwUvBxSZODqmbdQsUMqDvlFe4JvhsRiCS937AAANagP3w7mtiw4g42pCYEIDD2xTFNPcYc/qpbMiEsz6/o1@vger.kernel.org
X-Gm-Message-State: AFq9FYKRp0GlVSu4ayhWyne7PQ/UCpOwnCryD+9tQxDXCMn2ukHnxzRZ
	YOIV1E4Z8uu0SY7xQCTpDx5hSll5ZdltqkiZGR7fwdl10+pL5d7mzEJ4O50RZO9iUL3ZPN2LTmu
	mj0sxYHuwVGQO9ZYQbG1oHKxRTt0JJrPua52KhrPX0IUdnDJ/n8PbquPO5hv7oGur
X-Gm-Gg: AYBFou36PVamI8wrj9HmdPGeXfgwrMgGwE77Fr431c3E70LZhiakVgwoqIzWvOYfhS/
	Z+BJnnwmPUN6gPqt/sOZViUrVqodHYVbBphRTaFQrvEV4EJ7ibsP41qbn6niNfkTkIhnEIh8M6z
	3tNb9jibhc69CCN1XeKrV396VllHA8ZuV4DxfQE/GHhEqk7R7hni+47DcUEkr49GZxptyo2ezLb
	u3Cur1Qx9zyj9iHc8X8dmZH+FRIIN64f020utIdVmMuPm7AJmXiy65S/YCpqCKuRTGyQ/G9cCnx
	/sw2EoSsq97I1UbZEF6YDzboxI09Aq+vjVq1zsI8jf931jSFeqT3vop0Ina+485rGtru19u5J5L
	EWnKy+ifhqUCqMa6EJBMo5EZmJhOdJNKb8rSby+eDdQ==
X-Received: by 2002:a17:90a:e7d1:b0:3ab:1b19:78f4 with SMTP id 98e67ed59e1d1-3ade9b2ed8bmr5784766a91.6.1793003773978;
        Mon, 26 Oct 2026 01:36:13 -0700 (PDT)
X-Received: by 2002:a17:90a:e7d1:b0:3ab:1b19:78f4 with SMTP id 98e67ed59e1d1-3ade9b2ed8bmr5784737a91.6.1793003773334;
        Mon, 26 Oct 2026 01:36:13 -0700 (PDT)
Received: from QCOM-aGQu4IUr3Y (i-global052.qualcomm.com. [199.106.103.52])
        by smtp.gmail.com with ESMTPSA id 98e67ed59e1d1-3adebaddd45sm5344362a91.2.2026.10.26.01.36.09
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 26 Oct 2026 01:36:12 -0700 (PDT)
Date: Mon, 26 Oct 2026 16:36:06 +0800
From: Shawn Guo <shengchao.guo@oss.qualcomm.com>
To: Bartosz Golaszewski <bartosz.golaszewski@oss.qualcomm.com>
Cc: Bjorn Andersson <andersson@kernel.org>,
        Konrad Dybcio <konradybcio@kernel.org>,
        Abel Vesa <abelvesa@kernel.org>, Rob Herring <robh@kernel.org>,
        Krzysztof Kozlowski <krzk+dt@kernel.org>,
        Conor Dooley <conor+dt@kernel.org>,
        Bartosz Golaszewski <brgl@kernel.org>, linux-arm-msm@vger.kernel.org,
        devicetree@vger.kernel.org, linux-kernel@vger.kernel.org,
        netdev@vger.kernel.org
Subject: Re: [PATCH 2/3] arm64: dts: qcom: lemans: make the emac compatible
 specific to the embedded variant
Message-ID: <at8Q9umfE2AP24lI@QCOM-aGQu4IUr3Y>
References: <20261023-sa8255p-emac-dts-v1-0-a34d778ce9ac@oss.qualcomm.com>
 <20261023-sa8255p-emac-dts-v1-2-a34d778ce9ac@oss.qualcomm.com>
X-Mailing-List: devicetree@vger.kernel.org
List-Id: <devicetree.vger.kernel.org>
List-Post: <mailto:devicetree@vger.kernel.org>
List-Help: <mailto:devicetree+help@vger.kernel.org>
List-Subscribe: <mailto:devicetree+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:devicetree+unsubscribe@vger.kernel.org>
List-Owner: <mailto:devicetree+owner@vger.kernel.org>
Precedence: list
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20261023-sa8255p-emac-dts-v1-2-a34d778ce9ac@oss.qualcomm.com>
X-Proofpoint-GUID: lqZHCJTXKnvKuAWBxDJZyPqVycBjst_1
X-Proofpoint-ORIG-GUID: lqZHCJTXKnvKuAWBxDJZyPqVycBjst_1
X-Proofpoint-Spam-Info: AW1haW4tMjYxMDI2MDAzNCBTYWx0ZWRfX3izbTQVTJLyd
 N7/O7MBVjsAHGrBmHYBjClwRMl4eGfMzae9BbLr4Ymv5zZiGRU3DjF7fglxCl9lk98W6Y1cwnkY
 WXugkhaZX9EQuEgIDXpTU/EF2wwcPdc=
X-Authority-Analysis: v=2.4 cv=HqHjiETS c=1 sm=1 tr=0 ts=6adf10fe cx=c_pps
 a=UNFcQwm+pnOIJct1K4W+Mw==:117 a=b9+bayejhc3NMeqCNyeLQQ==:17
 a=kj9zAlcOel0A:10 a=660iZSQnnn4A:10 a=s4-Qcg_JpJYA:10
 a=VkNPw1HP01LnGYTKEx00:22 a=u7WPNUs3qKkmUXheDGA7:22 a=yOCtJkima9RkubShWh1s:22
 a=EUspDBNiAAAA:8 a=OYXKdzKcgdxe2yQkhO4A:9 a=CjuIK1q_8ugA:10
 a=uKXjsCUrEbL0IQVhDsJ9:22
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYxMDI2MDAzNCBTYWx0ZWRfXwkqbOpwmlqt4
 axRFHTV1jAOV6h3ATiV1ixBmGt8iZWfcKAYy0HmwS3PwO7x6X3NYhhmc7VYxJDIvumeXhxhaVd8
 MS1TApql5hwVTyV57/cAn8B9KrqnG06dOCkJLmALxhpmQAfZXog+MtC0gU6lJrKJyoztlt0ri0g
 xVe0UEtsZRvLt5BuC5dUg+KLoYd/EWS6axaM+M97Ee8WGy3b127U3+jAJNHuejMoWKrnP5vflz+
 yP5i2YT83JLhjBz8OIAM5cXsJ9RD6eztjGHtVmYqVYgqYGIf9iok/fsx7iOwvQSdeuymdx5mHMr
 Smn8/KpsK/JuskS4BFkzF/PWk+t1L3EdOm2CUYxXQxnw86d+qSuVXXGibgi5wWa0RpKHP0lACIG
 +DhwAYPv9lQPnOT9w1VZy/NOppvUkiJ06wubnG9L0DWrXBCDVwDhH14msbUuXGIecK8Qc4omsR1
 2PQMjnwIxa0rQ6QLBrQ==
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1176,Hydra:6.1.138,FMLib:17.12.100.49
 definitions=2026-10-26_01,2026-10-21_02,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 priorityscore=1501 spamscore=0 bulkscore=0 malwarescore=0 lowpriorityscore=0
 clxscore=1015 impostorscore=0 adultscore=0 phishscore=0 suspectscore=0
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.22.0-2610190000 definitions=main-2610260034

On Fri, Oct 23, 2026 at 11:02:23AM +0200, Bartosz Golaszewski wrote:
> The embedded and gearvm variants of the ethernet MAC use different
> compatibles so move the one for sa8775p into lemans-embedded.dtsi and
> make place for the gearvm variant to be placed in lemans-gearvm.dtsi.
> 
> Signed-off-by: Bartosz Golaszewski <bartosz.golaszewski@oss.qualcomm.com>

Do we run into any problem if lemans-gearvm.dtsi simply overwrites
the compatible without this patch?

Shawn

> ---
>  arch/arm64/boot/dts/qcom/lemans-embedded.dtsi | 2 ++
>  arch/arm64/boot/dts/qcom/lemans.dtsi          | 2 --
>  2 files changed, 2 insertions(+), 2 deletions(-)
> 
> diff --git a/arch/arm64/boot/dts/qcom/lemans-embedded.dtsi b/arch/arm64/boot/dts/qcom/lemans-embedded.dtsi
> index 3733c0b7bace10cad656144b31d02bd8b4dbf3ed..630c40d21ecdab40ec59135cc667e4eccfd23554 100644
> --- a/arch/arm64/boot/dts/qcom/lemans-embedded.dtsi
> +++ b/arch/arm64/boot/dts/qcom/lemans-embedded.dtsi
> @@ -458,6 +458,7 @@ &cpufreq_hw {
>  };
>  
>  &ethernet1 {
> +	compatible = "qcom,sa8775p-ethqos";
>  	clocks = <&gcc GCC_EMAC1_AXI_CLK>,
>  		 <&gcc GCC_EMAC1_SLV_AHB_CLK>,
>  		 <&gcc GCC_EMAC1_PTP_CLK>,
> @@ -481,6 +482,7 @@ &config_noc SLAVE_EMAC1_CFG QCOM_ICC_TAG_ALWAYS>,
>  };
>  
>  &ethernet0 {
> +	compatible = "qcom,sa8775p-ethqos";
>  	clocks = <&gcc GCC_EMAC0_AXI_CLK>,
>  		 <&gcc GCC_EMAC0_SLV_AHB_CLK>,
>  		 <&gcc GCC_EMAC0_PTP_CLK>,
> diff --git a/arch/arm64/boot/dts/qcom/lemans.dtsi b/arch/arm64/boot/dts/qcom/lemans.dtsi
> index da740a0876d4adcff0bb9458564c868a6f406b0d..77e4f57778fd54e414c86a32f5b068239bee6d24 100644
> --- a/arch/arm64/boot/dts/qcom/lemans.dtsi
> +++ b/arch/arm64/boot/dts/qcom/lemans.dtsi
> @@ -4386,7 +4386,6 @@ port@1 {
>  		};
>  
>  		ethernet1: ethernet@23000000 {
> -			compatible = "qcom,sa8775p-ethqos";
>  			reg = <0x0 0x23000000 0x0 0x10000>,
>  			      <0x0 0x23016000 0x0 0x100>;
>  			reg-names = "stmmaceth", "rgmii";
> @@ -4407,7 +4406,6 @@ ethernet1: ethernet@23000000 {
>  		};
>  
>  		ethernet0: ethernet@23040000 {
> -			compatible = "qcom,sa8775p-ethqos";
>  			reg = <0x0 0x23040000 0x0 0x10000>,
>  			      <0x0 0x23056000 0x0 0x100>;
>  			reg-names = "stmmaceth", "rgmii";
> 
> -- 
> 2.47.3
> 
