Received: from mx0a-0031df01.pphosted.com (mx0a-0031df01.pphosted.com [205.220.168.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id ACDFA459AE0
	for <devicetree@vger.kernel.org>; Thu, 23 Jul 2026 11:03:19 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.168.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1784804605; cv=none; b=PNRwxTmGd58HP0I/eh5hJTkPVS+CEe6324ZFwU5kTpcQagpMHwOv6ymXNI2uORHvvbVhH0TH9ep8lg0Rp5OjNTBSn8ngRtP0ucGxKpbvC3x3DCA8R5qYibliTOkjldOL55VlcMfknR6MYMzo6WaMOkBQ0YWhP64GHAIuRsMIyWs=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1784804605; c=relaxed/simple;
	bh=PJxlQLJhClhGhrxLfac9Q8XNY9NarRC50QQx0RhLnkM=;
	h=Message-ID:Date:MIME-Version:Subject:To:Cc:References:From:
	 In-Reply-To:Content-Type; b=eZpGjFWmnkl5X+dAbL5/PP1K/UYZ5th8nhL3XgeKNYCuONCJNHcBJhVTSq2wHoLMnh/iUy6fD3GdSKrMc5NwVBKdvpEzEr2xwXovrTtlgHvi1K7cMwwQAOAhBO/rAvloHXnwEUCxGqi2OCWxAWasp73pMf6GPY1RJtvnTyyamfQ=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=hGDFETAd; dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b=Fej3IV7s; arc=none smtp.client-ip=205.220.168.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b="hGDFETAd";
	dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b="Fej3IV7s"
Received: from pps.filterd (m0279865.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 66N8r4bR3790809
	for <devicetree@vger.kernel.org>; Thu, 23 Jul 2026 11:03:18 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	NLZ5Ckx7WUXahAJgTAmy6vdj8GBqbFMwXWkx8XDyuOc=; b=hGDFETAd2vwF/Kus
	QMHNDqkOKiFJUWvv7c1286U6jOWnedWkDxAiQVZOaw5OUFvkt3TD/OTNHkjR8RFJ
	vDKJSM59l2ypBeEr/vsB7TNOk/DfsVwpawW17fjAKXeoMt72HhFEPudvq94O4L0g
	E6xCpFKhBjcsd0/BOoN90XSNsRgYjjZR6pbASL8vdTNqYu82NyTAfcMjgvDcmGrS
	79Yna5+OzKwNObLh3vhb4Nd7XK5TI+Ncyg4p1USGZAcvXVO0bCsP0iEhKH8aOaLS
	bqm58/q4Ebl39mf5Rl7HvQUlerCh5odpHVA8UAJ2OOQFY5DUGqwL33+9mWT3dEg8
	U5huUg==
Received: from mail-ua1-f70.google.com (mail-ua1-f70.google.com [209.85.222.70])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4fk7b52evn-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <devicetree@vger.kernel.org>; Thu, 23 Jul 2026 11:03:18 +0000 (GMT)
Received: by mail-ua1-f70.google.com with SMTP id a1e0cc1a2514c-9775a8105d6so7481241.0
        for <devicetree@vger.kernel.org>; Thu, 23 Jul 2026 04:03:17 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1784804597; x=1785409397; darn=vger.kernel.org;
        h=content-transfer-encoding:content-type:in-reply-to:from
         :content-language:references:cc:to:subject:user-agent:mime-version
         :date:message-id:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=NLZ5Ckx7WUXahAJgTAmy6vdj8GBqbFMwXWkx8XDyuOc=;
        b=Fej3IV7soG/InvA03w3TWIB/DXlctH6vxIFbRe4P6aIB+3LEWHlzTS2Jybrp4P9+bf
         Nvi1Cjcxy148knfO6IdXIY/aiJpYU+p2F3AIkdpBGkaD7PkUbQiZ8HX1HtlZKlrsIxPB
         3jqJLlHww3bUnT/jJ0fK3aJcYMliO41vBXOdElR5hzJtfI93HwwYQouDMH3eQvVwho32
         EC55obZMFI+WRRChLLrxlQ6fcTHotJl7nTV7tdc6qRzveb/Byu6WFW04ZL58CdRsD8Ra
         AEljQ3m/Ks4kW4k8xxlE8//meEw3FITQht28+8g75SZGxiP8OaULo+hoh6b7CHU0Qd59
         T9jg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1784804597; x=1785409397;
        h=content-transfer-encoding:content-type:in-reply-to:from
         :content-language:references:cc:to:subject:user-agent:mime-version
         :date:message-id:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=NLZ5Ckx7WUXahAJgTAmy6vdj8GBqbFMwXWkx8XDyuOc=;
        b=DA8fdeRmOJLrJ4SRhANnkyPvV8sxT5Bp0b1YeTZcxzEtdLaeB51HcHERHetEOto1v4
         7fkEzY0etjo9iSZfKpHfAbmkFTAAOAUK2Pl98SigoyfvYP9GFFigp1UH3BGuOeLO2lt5
         Yv7/Bn63I4SbIXdisPtBtn6CudBfcwtVnR9hY+KnI7GZVJxMJvoFAO2G1ZUdsp5mpqPB
         HN27WtuQWuDPSzsA0wo4//zqKZ5aEQlkbuTmrvpMx/Dl3mweer6YnKNYefqE5BLh0h1t
         F0yP4s2kOpGiTUrzIjd2EbnC7TMZkqSutnYDpVJude7+qFHWrOFXoAlg3KZU1bnZJ9Pg
         gAyQ==
X-Forwarded-Encrypted: i=1; AHgh+RrssRsgmHwTlFDOlqidMe4NA6l8h29C4dWUulz6k6IKvrvA9PPwg/eoVR+QBxGgsjhkwDD1jIYFF0Xe@vger.kernel.org
X-Gm-Message-State: AOJu0Yw4sBpGtMuu28CY2BT/5IC9rvXTSoDqUXKmMb5sKtLn1X00GWgw
	p9brjP4OUrMJlHRwn72RDBS7YKo4ON/bzuJ8c/e2w6b1j0i86QihGWezdBUOR+b2qRg3o84z3E/
	5vPP/qEl3R6eh3xTmm+HdtUCuOvQXiTnc7jzxmdIOxtMl7oE3l4lQ2b9jCEKF4eDc
X-Gm-Gg: AR+sD11gE+lJSH9we9XIqr828As3TEg8oIdRy9IzDgYOGCzmnyq0l8dcRTiG3ieNV7p
	8+JrXHbI9GVC2Te+ACS4+OCgux6qrVs7kFoESu1LclYIQVv1+Y6FHzqHeOyEi1CBeJhOFRtTs8d
	Wh0SFBpnQjI4HZh+f0XR6Wep9lUKGDTeJWiQknXKr7AM38m4MYI0SxcIk+dqsiQZLllmnC0QN9P
	XsQ4ZXKNNNut8WXvenKHyGvacMvFUCSDeQAtUsIC2MRRWI5Co2xpwaymGDwQbU6xcJw8PhcRNci
	WoTwGXaIkYzEct4nxP99CR74TTg+YCaMSqIF2x699WSvXcnHFhd0sp7jy+Yixrx8JudJi0pTEC8
	ofCpFOQaKIj555jNxBW4evKuZ
X-Received: by 2002:a05:6102:424d:b0:738:8d0f:72a3 with SMTP id ada2fe7eead31-74d5ffe001dmr296378137.4.1784804597145;
        Thu, 23 Jul 2026 04:03:17 -0700 (PDT)
X-Received: by 2002:a05:6102:424d:b0:738:8d0f:72a3 with SMTP id ada2fe7eead31-74d5ffe001dmr296363137.4.1784804596651;
        Thu, 23 Jul 2026 04:03:16 -0700 (PDT)
Received: from [192.168.120.193] ([178.235.128.140])
        by smtp.gmail.com with ESMTPSA id a640c23a62f3a-c1c32f1127fsm214052866b.55.2026.07.23.04.03.13
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Thu, 23 Jul 2026 04:03:15 -0700 (PDT)
Message-ID: <eb229d10-2e8e-42cc-bf92-96ab3460483f@oss.qualcomm.com>
Date: Thu, 23 Jul 2026 13:03:12 +0200
Precedence: bulk
X-Mailing-List: devicetree@vger.kernel.org
List-Id: <devicetree.vger.kernel.org>
List-Subscribe: <mailto:devicetree+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:devicetree+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v2 1/3] arm64: dts: qcom: hamoa: Number usb_2 HS port as
 port@0
To: Wei Deng <wei.deng@oss.qualcomm.com>,
        Bjorn Andersson <andersson@kernel.org>,
        Konrad Dybcio <konradybcio@kernel.org>, Rob Herring <robh@kernel.org>,
        Krzysztof Kozlowski <krzk+dt@kernel.org>,
        Conor Dooley <conor+dt@kernel.org>
Cc: linux-arm-msm@vger.kernel.org, devicetree@vger.kernel.org,
        linux-kernel@vger.kernel.org, Manivannan Sadhasivam <mani@kernel.org>,
        Bartosz Golaszewski <brgl@kernel.org>,
        Chen-Yu Tsai <wenst@chromium.org>, quic_chezhou@quicinc.com,
        cheng.jiang@oss.qualcomm.com, shuai.zhang@oss.qualcomm.com,
        jinwang.li@oss.qualcomm.com, xiuzhuo.shang@oss.qualcomm.com,
        mengshi.wu@oss.qualcomm.com
References: <20260723-hamoa-m2-dts-v2-v2-0-82254ac101fb@oss.qualcomm.com>
 <20260723-hamoa-m2-dts-v2-v2-1-82254ac101fb@oss.qualcomm.com>
Content-Language: en-US
From: Konrad Dybcio <konrad.dybcio@oss.qualcomm.com>
In-Reply-To: <20260723-hamoa-m2-dts-v2-v2-1-82254ac101fb@oss.qualcomm.com>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYwNzIzMDEwOCBTYWx0ZWRfXwDJvIdtggCf/
 lksVS8GQYGf6p00MaXOljcKPjX0jKelogMH/BdQ4qKRajyP4pQBpI/nVfSgYK5b02WhYIvdg1Aa
 qwqxKqUdNfpnN8QtQEUZcot+R2FByJbnCFbB6FQIEyyAr3ncQBcrwE0MvUKj4TR+k69nWTymfGI
 f+iAq/9gxUrcJIuGciJ59RUvLsW6lf01njRF4W7jpPvvQzSiQPbzroyT8FCHB2ke74UcoEru+Fu
 H64e3WR4HNEZ7UBDLYtgsSHMcCuMKgukCdwCBsxRGlnpfatQMXgsgfE/2tXlK7sW5/PgwKjzMVl
 26AearSJBuijkQGabu+j5Qj186AKc47xWIyjhLcEZpPBvpsEXFXHUFwhRnujuFjDi23Pr6UokQo
 /ZJm5EzAPDAXbxeGb7DlbMgiymnPH3d5WKW5v5P9Y8Fgkc9KB6dbTQ0BaTsQv/56EkpThxPJPJy
 frc6SWe9SzrPOU8hmIQ==
X-Proofpoint-GUID: CDNBOMrB4Gu03FN2Oa2yWW_AAn7dSx17
X-Proofpoint-Spam-Info: AW1haW4tMjYwNzIzMDEwOCBTYWx0ZWRfX7MAvUWTRu+/D
 zzaPJVdRfeSiJfM6IcoVNeI+bQ9k/5UhM7tsiQFN8IVi1LqkXL/LViomwxsez1z9+gJ3gtJM0yr
 qcsKLRpmbaUVXChf36yeT166VVmeoBk=
X-Authority-Analysis: v=2.4 cv=btx8wkai c=1 sm=1 tr=0 ts=6a61f4f6 cx=c_pps
 a=R6oCqFB+Yf/t2GF8e0/dFg==:117 a=PRfkaYvzSr8QmIIGAkY2Sg==:17
 a=IkcTkHD0fZMA:10 a=RAioF0-LDSMA:10 a=s4-Qcg_JpJYA:10
 a=VkNPw1HP01LnGYTKEx00:22 a=u7WPNUs3qKkmUXheDGA7:22 a=Um2Pa8k9VHT-vaBCBUpS:22
 a=EUspDBNiAAAA:8 a=q5C_vJi7yyHM8oFOZdwA:9 a=QEXdDO2ut3YA:10
 a=TD8TdBvy0hsOASGTdmB-:22
X-Proofpoint-ORIG-GUID: CDNBOMrB4Gu03FN2Oa2yWW_AAn7dSx17
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1143,Hydra:6.1.134,FMLib:17.12.100.49
 definitions=2026-07-23_03,2026-07-22_02,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 clxscore=1015 malwarescore=0 adultscore=0 lowpriorityscore=0 impostorscore=0
 phishscore=0 priorityscore=1501 spamscore=0 bulkscore=0 suspectscore=0
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.22.0-2606150000 definitions=main-2607230108

On 7/23/26 11:56 AM, Wei Deng wrote:
> Assign a port number (reg = <0>) to the existing HS data bus port in
> the usb_2 DWC3 controller, renaming it from the unnumbered 'port' to
> 'port@0'. This is consistent with the snps,dwc3 binding convention
> where port@0 denotes the High-Speed data bus.
> 
> Adding a port number also reserves port@1 for USB root hub physical
> port connections (e.g. an M.2 Key E USB BT slot) that can be described
> in board device tree files.
> 
> Signed-off-by: Wei Deng <wei.deng@oss.qualcomm.com>
> ---
>  arch/arm64/boot/dts/qcom/hamoa.dtsi | 12 ++++++++++--
>  1 file changed, 10 insertions(+), 2 deletions(-)
> 
> diff --git a/arch/arm64/boot/dts/qcom/hamoa.dtsi b/arch/arm64/boot/dts/qcom/hamoa.dtsi
> index 09527dcf9576..833810470c85 100644
> --- a/arch/arm64/boot/dts/qcom/hamoa.dtsi
> +++ b/arch/arm64/boot/dts/qcom/hamoa.dtsi
> @@ -5134,8 +5134,16 @@ &mc_virt SLAVE_EBI1 QCOM_ICC_TAG_ALWAYS>,
>  
>  			status = "disabled";
>  
> -			port {
> -				usb_2_dwc3_hs: endpoint {
> +			ports {
> +				#address-cells = <1>;
> +				#size-cells = <0>;
> +
> +				/* High-speed USB 2.0 data bus */

This is defined by bindings, so the comment is superfluous

Konrad
