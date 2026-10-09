Received: from mx0b-0031df01.pphosted.com (mx0b-0031df01.pphosted.com [205.220.180.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 0664B3D410C
	for <devicetree@vger.kernel.org>; Fri,  9 Oct 2026 08:32:51 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.180.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1791534773; cv=none; b=mOxmIll8+ZwrJ+1ofF8Agk1IAqB5bTb88mUSUrgsuJ0gx9GsYEQMOJiMBtOWiUm43H+GcWHnvFK6W2VnGEAAC2ALTvKSu5QuNZnUvbWD8kfCbO9EMV3wo+7O1R/wjyTlYam5/U0UH1FqLe9VipSDRCst+8slydXhW3rrJPb7LWE=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1791534773; c=relaxed/simple;
	bh=a7Lm4/DxhhCCUOlJHN7JA316POdiEnKzoa2I4qZpihM=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=YZ3chMyF6k+NrDwGNm40CoURpQr2QNz7P96yftIs9tPDoMFDBavORi+THdO5RciF5NP+3m1etww1z6Y5u49P+rRS9LwRKQq4fAD4wiZG8DSOc+DX15xBBIHSJi/HsnwwFSuLYL6D76NMkhK16JKX/sOCRZw5c07MmqDo6X3KfhY=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=Dm+PmXOM; dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b=OxulDcq+; arc=none smtp.client-ip=205.220.180.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b="Dm+PmXOM";
	dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b="OxulDcq+"
Received: from pps.filterd (m0279870.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 6998KMx51223195
	for <devicetree@vger.kernel.org>; Fri, 9 Oct 2026 08:32:51 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-type:date:from:in-reply-to:message-id:mime-version
	:references:subject:to; s=qcppdkim1; bh=rTY5MltW4IcuX1L4KNFAaxZO
	ejIWHfJIHVYUxsUR3Lk=; b=Dm+PmXOMTtLCj8IW980LNZDG3w5Yf0q+89TGOY3R
	aWPY7lSPxFkJlMabqTAV+UkQPZoDeaPgEt/BgS1M23hmRelJ/qCLYGqoM3OXX09G
	fJVGH1bk0ozvdOEw+X8TQIamIl4gWOEUB7Ohtt0tr6vCeSEooOJvbDXn5a/83bS/
	fi83Ld2sP0LxStiDSMNakOiK26RH9CdkMVsd2wMRxTHdGKBjuVAgi0VkrM4n+6sB
	O0uUQaAYXh7uyfcTF2tCwFVLVT+le6p7RyF2KU+MD8e79ZCAL0ddiboRuSoBn2wd
	m+PMVUDEUJOGvM6DKTIR9J2CFw2P9mzQwU6URXXiO9QHbw==
Received: from mail-qk1-f197.google.com (mail-qk1-f197.google.com [209.85.222.197])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4h6fxkaktd-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <devicetree@vger.kernel.org>; Fri, 09 Oct 2026 08:32:50 +0000 (GMT)
Received: by mail-qk1-f197.google.com with SMTP id af79cd13be357-93cc0b31ecaso1334641685a.1
        for <devicetree@vger.kernel.org>; Fri, 09 Oct 2026 01:32:50 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1791534770; x=1792139570; darn=vger.kernel.org;
        h=in-reply-to:content-disposition:content-type:mime-version
         :references:message-id:subject:cc:to:from:date:from:to:cc:subject
         :date:message-id:reply-to:content-type;
        bh=rTY5MltW4IcuX1L4KNFAaxZOejIWHfJIHVYUxsUR3Lk=;
        b=OxulDcq+cl925lEXsqwL/wA5hTe4L73Pgh6sE1aeu6ePl00PeBYqFONBqHkFD1jtmH
         tZ4yzKsB04IkCPCQvpAY96WVPnlM3UxUd7EaTcOCaRVWK57uNK0RZ0plM5nv3cEPEc0e
         3f40pWGipjQm/uUHSVQdVgBISqnBuOPq9gqpbvEwlTZXrHrmOLl0zZne3+fyUiLyFgI7
         7X4ymIPxXPBqWLPmFTRLCs1LMfNQDhj+yfNp9y1O/yqI/6JXVBPk/C8FHMWhj59TXR1b
         P+1qy3bEn7ExY+4pWJCQ9qEmSHEu62TOTHLTXOosQlcZw+4jgPQbpfyDm79rhKwddWWu
         J16w==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1791534770; x=1792139570;
        h=in-reply-to:content-disposition:content-type:mime-version
         :references:message-id:subject:cc:to:from:date:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=rTY5MltW4IcuX1L4KNFAaxZOejIWHfJIHVYUxsUR3Lk=;
        b=Gy2lcJCr5ogVowXLsWY33gN8FCWrnE9MbteXI3rayXId92nysjMK95vCzrzwqEV60b
         xDxJblLqscqUXPkPbt21WeW+x617QY1rJmHta8N7nAoShAulAozW6TnX7t5Gnrsq+lqe
         lsbr4fPBvo52Qd8+kIBOWbNpbGRrfOU2ue35L3gbdqPvm+mHW/+7QZ/1lipOENTZ2rG7
         TE1BO6NZnZgqtdfzcsvuTzYcgRCsbfp9C5YNExa5OQ3W3Qt3h4uuyFHF18umr++o9sQ6
         TlWEfSqA7JCwAECxmAjHSsZCKkQKEUyZ80a5SPJQHjcI4xEHHU0ZfUO75AgHRUtQyjbH
         hOdw==
X-Forwarded-Encrypted: i=1; AKwUvBx7vI9CwQIJleI1q5MNSWlkyyWRIKM2EW7Nedr6nD0dWkzF2cpdtzMUAiGyKLdKUuZuebv3YXZ5pgCu@vger.kernel.org
X-Gm-Message-State: AFuF++lIUl3LCukKAHe4EDgfzKimP1tCjDCNfLaW7pig5fiw7JAGnk2D
	qrD55M/bjP1Hvde06FRQIQ+wpM/fGbTFypKgNwm6jPCLApjSe92TJlXQFrpbqVX4Bl2fG6ALJxW
	96z7eJpvRBiBAdBT2ciFoeJyk7gjm+NH1gnyCGxdotvwHWsPu/rGoKvK0qkAcmqjn
X-Gm-Gg: AYBFou1C8w+wSzP//f4npqTllkooq0iYiqdZjxMy42e9ZR+4FBwRcM7zCbpPJVpiPZT
	ugjFOfmERGpL0pZQE8TSD3205xQ3jBuYFzq7GTNmD7I/RznEz0ThUgHLQ87flSBet4LFlojQQjp
	DkmzQ8NtMr07Rab4VSF5NfRs7m/yxRe95k7Nqh1SAfWECQ6Oj3nEGVA//BHk+mJMUcX96gy8og4
	uQ6v3XMsmJI2xrWaexotIsRa0rNuSRbnSBeVdS+Jyc9traP6YxAScbCH9dUcXniab93jxWmWdmh
	kbKn6ktqjXKVHmmgp56bDRtQQfhnXrI0ujsJ8oqmLllzax1Ciqklb3ys0aWxoHv+GDSHMipUCZI
	yhi2Ujk5WydWfLZ7vJd163n4LkuZQGH1CB2xbW7jv7t8uqvL+/kb0GjfwEVZ0w+JxM1lCSVBGpx
	RUjWcWrklI7Zya
X-Received: by 2002:a05:620a:2719:b0:93e:c12c:440f with SMTP id af79cd13be357-93ec12c4a41mr55454485a.75.1791534770133;
        Fri, 09 Oct 2026 01:32:50 -0700 (PDT)
X-Received: by 2002:a05:620a:2719:b0:93e:c12c:440f with SMTP id af79cd13be357-93ec12c4a41mr55452285a.75.1791534769663;
        Fri, 09 Oct 2026 01:32:49 -0700 (PDT)
Received: from umbar.lan (2001-14ba-a073-af00-264b-feff-fe8b-be8a.rev.dnainternet.fi. [2001:14ba:a073:af00:264b:feff:fe8b:be8a])
        by smtp.gmail.com with ESMTPSA id 2adb3069b0e04-5bcddeb627fsm436591e87.68.2026.10.09.01.32.48
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 09 Oct 2026 01:32:48 -0700 (PDT)
Date: Fri, 9 Oct 2026 11:32:46 +0300
From: Dmitry Baryshkov <dmitry.baryshkov@oss.qualcomm.com>
To: Balaji Kalkonda <balaji.kalkonda@oss.qualcomm.com>
Cc: Rob Clark <robin.clark@oss.qualcomm.com>,
        Dmitry Baryshkov <lumag@kernel.org>,
        Abhinav Kumar <abhinav.kumar@linux.dev>,
        Jessica Zhang <jesszhan0024@gmail.com>, Sean Paul <sean@poorly.run>,
        Marijn Suijten <marijn.suijten@somainline.org>,
        Maarten Lankhorst <maarten.lankhorst@linux.intel.com>,
        Maxime Ripard <mripard@kernel.org>,
        Thomas Zimmermann <tzimmermann@suse.de>,
        David Airlie <airlied@gmail.com>, Simona Vetter <simona@ffwll.ch>,
        Rob Herring <robh@kernel.org>,
        Krzysztof Kozlowski <krzk+dt@kernel.org>,
        Conor Dooley <conor+dt@kernel.org>,
        Kuogee Hsieh <quic_khsieh@quicinc.com>,
        Yongxing Mou <yongxing.mou@oss.qualcomm.com>,
        Yuanjie Yang <yuanjie.yang@oss.qualcomm.com>,
        Bjorn Andersson <andersson@kernel.org>,
        Konrad Dybcio <konradybcio@kernel.org>,
        Abel Vesa <abelvesa@kernel.org>,
        Mahadevan P <mahadevan.p@oss.qualcomm.com>,
        linux-arm-msm@vger.kernel.org, dri-devel@lists.freedesktop.org,
        freedreno@lists.freedesktop.org, devicetree@vger.kernel.org,
        linux-kernel@vger.kernel.org
Subject: Re: [PATCH 3/5] arm64: dts: qcom: kaanapali: Add DisplayPort
 controller
Message-ID: <e2ng5qasvi7bd2btgbmli6oehn774k57giwzalsyksimgbcf7t@phjas5ymdwgc>
References: <20261005-kaanapali_dp-v1-0-6faeac3a6d59@oss.qualcomm.com>
 <20261005-kaanapali_dp-v1-3-6faeac3a6d59@oss.qualcomm.com>
Precedence: bulk
X-Mailing-List: devicetree@vger.kernel.org
List-Id: <devicetree.vger.kernel.org>
List-Subscribe: <mailto:devicetree+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:devicetree+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20261005-kaanapali_dp-v1-3-6faeac3a6d59@oss.qualcomm.com>
X-Proofpoint-GUID: xKMCpMpZGnhAJzf6Ix8G7zowjhi1oCjc
X-Proofpoint-Spam-Info: AW1haW4tMjYxMDA5MDAzMiBTYWx0ZWRfX2Rw7hgkDCCBd
 Y7LGg57EBJXgvKrDYM0ePZmqPj9PdoEjFMDlmjBDY5dSbSUYSp5Hv+pJkWKIN3+TbWpfUtki1uJ
 cg0Xb3i6FBO39+HPzsq5txGdiOaV6Ak=
X-Authority-Analysis: v=2.4 cv=Cs0q4X4D c=1 sm=1 tr=0 ts=6ac8a6b2 cx=c_pps
 a=50t2pK5VMbmlHzFWWp8p/g==:117 a=xqWC_Br6kY4A:10 a=kj9zAlcOel0A:10
 a=660iZSQnnn4A:10 a=s4-Qcg_JpJYA:10 a=VkNPw1HP01LnGYTKEx00:22
 a=u7WPNUs3qKkmUXheDGA7:22 a=gowsoOTTUOVcmtlkKump:22 a=EUspDBNiAAAA:8
 a=rG78yz47eWoMus8saG0A:9 a=CjuIK1q_8ugA:10 a=IoWCM6iH3mJn3m4BftBB:22
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYxMDA5MDAzMiBTYWx0ZWRfXx7hsDmHsBUju
 +DlzkMhslRamGbLeGGJanhnp7hdkZ/vx4rcWKZs7NDC6paa0fk39RBfIT6VKhhidPOIce/eJmM5
 fUbcYrrBzPKk8N4cUpLI1klBVjZG8Sudy5k+Roiec6XyUuAvkpoWSYxun+epsmivYQe5xffIoKQ
 iyszosCScSSFw45kyUFAqy61YZ8wSdeBMGsLtiOZGpEAn2fHxaTP1iXkc16gVdgYxM7Jfr++HpO
 ecscsF+gHa1q8ah8+dFgBOd/EcdTHH4eFc3w9begkMLZbSszl6XTDtirOV+TwWeYvy1+T5UfSJR
 6hByIAEk9BYcbYqUerzqse5cki393vXoOP18EiZi8GWy4/rZVsm+sWdzIP1pYobAb2rsJ1KBwNV
 zR7JvDE7vwk4I+CcUFr+mVNx3Jtrm0fGq5dUqotis8NSXij/ZnYkALMs21YflmWBDjEbRVtzcym
 VhWuIUgWYumT/w8wUhw==
X-Proofpoint-ORIG-GUID: xKMCpMpZGnhAJzf6Ix8G7zowjhi1oCjc
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1176,Hydra:6.1.134,FMLib:17.12.100.49
 definitions=2026-10-09_03,2026-10-08_01,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 malwarescore=0 phishscore=0 bulkscore=0 clxscore=1015 adultscore=0
 priorityscore=1501 lowpriorityscore=0 impostorscore=0 spamscore=0
 suspectscore=0 classifier=typeunknown authscore=0 authtc= authcc=
 route=outbound adjust=0 reason=mlx scancount=1 engine=8.22.0-2610020000
 definitions=main-2610090032

On Mon, Oct 05, 2026 at 12:54:28PM +0530, Balaji Kalkonda wrote:
> Add device node for the DisplayPort controller, its OPP table, clocks
> and power domain, and connect it to the DPU and USB/DP QMP PHY.
> 
> Signed-off-by: Balaji Kalkonda <balaji.kalkonda@oss.qualcomm.com>
> ---
>  arch/arm64/boot/dts/qcom/kaanapali.dtsi | 87 ++++++++++++++++++++++++++++++++-
>  1 file changed, 85 insertions(+), 2 deletions(-)
> 
> diff --git a/arch/arm64/boot/dts/qcom/kaanapali.dtsi b/arch/arm64/boot/dts/qcom/kaanapali.dtsi
> index e48a179d0722..155c590c8eb6 100644
> --- a/arch/arm64/boot/dts/qcom/kaanapali.dtsi
> +++ b/arch/arm64/boot/dts/qcom/kaanapali.dtsi
> @@ -3565,6 +3565,7 @@ usb_dp_qmpphy: phy@88e8000 {
>  			#clock-cells = <1>;
>  			#phy-cells = <1>;
>  
> +			mode-switch;

Not mentioned in the commit message.

>  			orientation-switch;
>  
>  			status = "disabled";
> @@ -3851,6 +3854,86 @@ mdss_dsi0_phy: phy@9ac1000 {
>  
>  				status = "disabled";
>  			};
> +
> +			mdss_dp0: displayport-controller@9ad2000 {
> +				compatible = "qcom,kaanapali-dp";
> +				reg = <0x0 0x09ad2000 0x0 0x10c>,
> +				      <0x0 0x09ad2200 0x0 0xc8>,
> +				      <0x0 0x09ad3000 0x0 0x78>,
> +				      <0x0 0x09ad4000 0x0 0xa0>;
> +
> +				interrupts-extended = <&mdss 12>;
> +
> +				clocks = <&dispcc DISP_CC_MDSS_AHB_CLK>,
> +					 <&dispcc DISP_CC_MDSS_DPTX0_AUX_CLK>,
> +					 <&dispcc DISP_CC_MDSS_DPTX0_LINK_CLK>,
> +					 <&dispcc DISP_CC_MDSS_DPTX0_LINK_INTF_CLK>,
> +					 <&dispcc DISP_CC_MDSS_DPTX0_PIXEL0_CLK>;
> +

Please define all pixel clocks that are used by the DP controller. Is it
not MST-capable?

> +				clock-names = "core_iface",
> +					      "core_aux",
> +					      "ctrl_link",
> +					      "ctrl_link_iface",
> +					      "stream_pixel";
> +
> +				assigned-clocks = <&dispcc DISP_CC_MDSS_DPTX0_LINK_CLK_SRC>,
> +						  <&dispcc DISP_CC_MDSS_DPTX0_PIXEL0_CLK_SRC>;
> +				assigned-clock-parents =
> +					<&usb_dp_qmpphy QMP_USB43DP_DP_LINK_CLK>,

Don't break the line here.

> +					<&usb_dp_qmpphy QMP_USB43DP_DP_VCO_DIV_CLK>;
> +
> +				operating-points-v2 = <&dp_opp_table>;
> +
> +				power-domains = <&rpmhpd RPMHPD_MX>;

MMCX. If you need to cast a vote on MX domain too, add second entry to
the power domains and handle it in the driver.

> +
> +				phys = <&usb_dp_qmpphy QMP_USB43DP_DP_PHY>;
> +				phy-names = "dp";
> +
> +				#sound-dai-cells = <0>;
> +
> +				status = "disabled";
> +

-- 
With best wishes
Dmitry
