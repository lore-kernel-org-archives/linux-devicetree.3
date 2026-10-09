Received: from mx0b-0031df01.pphosted.com (mx0b-0031df01.pphosted.com [205.220.180.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 89A8E4B44BF
	for <devicetree@vger.kernel.org>; Fri,  9 Oct 2026 10:48:22 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.180.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1791542914; cv=none; b=Xn4K6cXqhcDcVeuX/6n04nyWMH/Mspphd4kN1ebasdyDd1JdH5KtMBW63YNPv2i3tlE9vdvGFXfupaEBczVhlACPjRweQByFPHOvKY3VIVO0yW1MrL78rULjL5ftOdL97ufh6J1AM/xPzR5G4rDr7LMctT6U6elXXOrHZuVnJjY=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1791542914; c=relaxed/simple;
	bh=hXAZLulDZSHv7p+IwxBCxoU+xaRODRRS47Lz06TEE6E=;
	h=Message-ID:Date:MIME-Version:Subject:To:Cc:References:From:
	 In-Reply-To:Content-Type; b=kkMaECk1VIIgdnYT0ig9uQNJyz2rNfjBBDC1tdxWOIXydrgTaBZYw5U/sObsfQDzCA7RevuatrjUcDzafu+EZ0f1Rxnu/+6GbkpO5XcWMMsuhHCGR2teLs9bVmy14C99G7hnsvQmBNDtXPqxTdWfdo9OAxrDDqFBvVTga2pGU/I=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=LOosSm7y; dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b=YO3h1tfx; arc=none smtp.client-ip=205.220.180.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b="LOosSm7y";
	dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b="YO3h1tfx"
Received: from pps.filterd (m0279873.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 699A4f0d1336282
	for <devicetree@vger.kernel.org>; Fri, 9 Oct 2026 10:48:21 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	1z/X9tGm5aE4WYRZZCAENSK6cH/4JbMWNqBqxrfbL3Q=; b=LOosSm7yKO+alq4p
	xcXdKdZ7BFVPTvAS9Xw4HBdBEDKfV7yDDLNZgPoMCS6j5ACC0k6ddntH7emkY9oM
	LAmt7cz/gqQkX/Vc910ZWDBlBv6RCq/zXjGqfjj0YHjc8Lu55SI5PODHeKxES8QP
	ULvgvQz2bdAs9sXfGRPC7y0Ur2OMpeLBcuFWrQBJXrPLrTRfTSAVj8jBCP9clDQH
	D6M9VPLlLKn0MZ1RjNAmHDiERtmffiGg2UVYbSe+EJd6ELr9l1zuLmGAEu/1q47p
	AIghGFOobUraSNoy1yq5dlJnoBUVHF2EiUsj+MfmI4nrkj/WvdwJTFghvEAWvE1D
	y0atkw==
Received: from mail-pf1-f199.google.com (mail-pf1-f199.google.com [209.85.210.199])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4h6x6wg4kx-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <devicetree@vger.kernel.org>; Fri, 09 Oct 2026 10:48:21 +0000 (GMT)
Received: by mail-pf1-f199.google.com with SMTP id d2e1a72fcca58-88c768886a6so5267121b3a.2
        for <devicetree@vger.kernel.org>; Fri, 09 Oct 2026 03:48:21 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1791542900; x=1792147700; darn=vger.kernel.org;
        h=content-transfer-encoding:content-type:in-reply-to:from
         :content-language:references:cc:to:subject:user-agent:mime-version
         :date:message-id:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=1z/X9tGm5aE4WYRZZCAENSK6cH/4JbMWNqBqxrfbL3Q=;
        b=YO3h1tfxW274EcGebsFyjVQ/7ZI2deGNy17kRFvX+iKOMnIGWtRTTtlxTRLVXqaf7w
         n7zMm0B/BiyU8d46jdGdsREvkgBhA/xqEM3chg2Tgl2bLLOiSRGJX8ESLh2dnbnU9Bu9
         WmJwMYEyFkrCxKCjvty4qQoCtJCgYzdhnamuazLsuVcIspRDZHI0tu+tHDTFvMkO9YMU
         6msPRELHjVagXRF3AAkjnL/rwWL4pEG08Dz0kidzmU177es6S+/NzeEZ4jxmRoxeLPyc
         qNuWxawF1kfK4hpZ7uK4qedOi8XQCBmuj7Lu7yoGsAyOua0BH5QmKk1AQVj9LmftG/Qe
         W3GA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1791542900; x=1792147700;
        h=content-transfer-encoding:content-type:in-reply-to:from
         :content-language:references:cc:to:subject:user-agent:mime-version
         :date:message-id:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=1z/X9tGm5aE4WYRZZCAENSK6cH/4JbMWNqBqxrfbL3Q=;
        b=Xvw6lhuaPgFvzDxbDmtI0vZ9ESK57UUBOMs6rTgouER9qwZqvYHipi4yOIlc6ybYqk
         NOQYJpn9Utgrf0355gAWTP7pVqVzq6T/ZUOo6IT18xjUfqjQn33hjz91Su5CWamoqrNU
         v4xualKvPxE0biurzBayFYTFfqIL9FkFMMInY5iYxUrmriHVSZkemQzhjp+ouZl1PrE5
         +bH5Iv+XDU5aQjk9YUZkaidBeYJVEj9YzkjeGe9Vxb56SbGvF8jSxdW99mObComHVcZa
         /HTMUIhVbCxUNZo1RHPhKHYR71otb2EVgdFsE1uTAUd224Mtd1JhO2WJWcybxfMH3kR9
         A8TQ==
X-Forwarded-Encrypted: i=1; AKwUvBwU2+OhAgUnhSWOM/QYWwB9Dr3KMeW5ygrpnAA2so3N7SP3pFJ12ggTIUu3z7ZURU8ljRqZQcTdO8Ae@vger.kernel.org
X-Gm-Message-State: AFq9FYLBoHQUm4LXp+/eOPz1C9CLnN4LOhUDcrYTbWHrnYLqIUBpuyyS
	n2KjrWNbRgU8v3M/GEo21bxL9/594heiSMdkpV5OL3gYGgQXFI+Fe7t4Fgzjf1Rt/U6GONhAw1U
	gRikD61JVm4agl+vK8uShqWWfHt2saPjSJ9Kyh3DQN+0jTTJvwLMgRbwRthGreQOg
X-Gm-Gg: AYBFou07kwoEyg5ZVHFiVqEZbMLYsL0KASsfP5KSHBCANz7VD25Y9z03qRLPfhzee0f
	WuHGdHfHB5AZU1i9KkDNqseKytmLa3Yh+UUOKPd3yfC+ybv+lWiRqQSh5D0RnVxrpMznHFFTrJi
	hCh8wzxBUxnJYac/rnfTRnGuqNLTS6Q3Hw16wlxlYWYHnY65Y26fuQTv/JtlZCX7atuKzsBqcpX
	WvUJmXiTE3r1Oq7FYVxuK+RReL8DEx75q/uzqiyTmI/o6O4nBAIrdqX0eP/w7oV94Cc405WwWYe
	acDHKyk2gghquk3zqziD1xtQKY7u6xEF1XvB1F00+S4x5x5Qwpq689UXkP/asFXWd4NBgloI7Jc
	wti6Xxy1y7GsvpcdW/GRJEMuGRtXaiDYAtQ==
X-Received: by 2002:a05:6a00:3403:b0:890:b4c2:d7e8 with SMTP id d2e1a72fcca58-897c79e0cf1mr1408251b3a.33.1791542900128;
        Fri, 09 Oct 2026 03:48:20 -0700 (PDT)
X-Received: by 2002:a05:6a00:3403:b0:890:b4c2:d7e8 with SMTP id d2e1a72fcca58-897c79e0cf1mr1408225b3a.33.1791542899607;
        Fri, 09 Oct 2026 03:48:19 -0700 (PDT)
Received: from [10.204.78.217] ([202.46.23.25])
        by smtp.gmail.com with ESMTPSA id d2e1a72fcca58-896c3ecb01dsm712832b3a.36.2026.10.09.03.48.11
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Fri, 09 Oct 2026 03:48:19 -0700 (PDT)
Message-ID: <6e7779bc-89db-4ed9-b5b5-bff1dfd968b5@oss.qualcomm.com>
Date: Fri, 9 Oct 2026 16:18:10 +0530
Precedence: bulk
X-Mailing-List: devicetree@vger.kernel.org
List-Id: <devicetree.vger.kernel.org>
List-Subscribe: <mailto:devicetree+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:devicetree+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH 3/5] arm64: dts: qcom: kaanapali: Add DisplayPort
 controller
To: Dmitry Baryshkov <dmitry.baryshkov@oss.qualcomm.com>
Cc: Rob Clark <robin.clark@oss.qualcomm.com>,
        Dmitry Baryshkov <lumag@kernel.org>,
        Abhinav Kumar
 <abhinav.kumar@linux.dev>,
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
References: <20261005-kaanapali_dp-v1-0-6faeac3a6d59@oss.qualcomm.com>
 <20261005-kaanapali_dp-v1-3-6faeac3a6d59@oss.qualcomm.com>
 <e2ng5qasvi7bd2btgbmli6oehn774k57giwzalsyksimgbcf7t@phjas5ymdwgc>
Content-Language: en-US
From: Balaji Kalkonda <balaji.kalkonda@oss.qualcomm.com>
In-Reply-To: <e2ng5qasvi7bd2btgbmli6oehn774k57giwzalsyksimgbcf7t@phjas5ymdwgc>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit
X-Proofpoint-Spam-Info: AW1haW4tMjYxMDA5MDA0MiBTYWx0ZWRfXxahfi/TXFXVQ
 p7qqgjJfi9qeQ5s3oA0iLACHoh56Kihl8DbNSuB0pllEXhsAIx+IznoJtXGsFZ+3oJw02LFPvBw
 B/RUseRwOCEa91XlcMMJQw/eC3aFWco=
X-Proofpoint-ORIG-GUID: i3ELfBNsewJeuJs0yudeo_ZyVWrYZfq5
X-Proofpoint-GUID: i3ELfBNsewJeuJs0yudeo_ZyVWrYZfq5
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYxMDA5MDA0MiBTYWx0ZWRfXxo4l9Pd1qeap
 nCNubndosoqhGqJiN3ylzuHk632dbqsr0Q2ulKAMBb0eSh3BNtc495O2uo1pWhWslWuDCbWDwQZ
 tidXKrbz+QEOp4P63xnjhdIOZch70eQ9Eo0w62rz/glQx0RC02azADbmfrSKhDSnt/jQ4PIhaoF
 KPd5XTAaRHWc1X1wCvzhEz9ff0m7O1QC33he48UByRTWA8AF/1qHMGMQ15xm3x5/0Za5BP7bFOJ
 GVhmZ2RQxVif0MoJgJXTy/hm87mi0ej+3xv1az38OBc4pqa5Hn+oo90PAfqQO6OSmcNpiKwOPMY
 2g5XOkGKeUXv8sXYNJKsHIcqr5ko/jRueEDApOSlr/DofYMkLrMUkYl7LaVIFzcO24nXpsuFdBT
 XT+ouVhFjS04Pqwijz02WZ3+UFQvQNqqJW+0gzRjtVa+s/E3WQbqUc3eCNUAAoL0wWUSTh4O0en
 Wm1Cpogcw3rnZODtz9w==
X-Authority-Analysis: v=2.4 cv=ad30Dhot c=1 sm=1 tr=0 ts=6ac8c675 cx=c_pps
 a=WW5sKcV1LcKqjgzy2JUPuA==:117 a=ZePRamnt/+rB5gQjfz0u9A==:17
 a=IkcTkHD0fZMA:10 a=660iZSQnnn4A:10 a=s4-Qcg_JpJYA:10
 a=VkNPw1HP01LnGYTKEx00:22 a=u7WPNUs3qKkmUXheDGA7:22 a=rJkE3RaqiGZ5pbrm-msn:22
 a=EUspDBNiAAAA:8 a=6Q945mz2-PRHoXMB8K4A:9 a=QEXdDO2ut3YA:10
 a=OpyuDcXvxspvyRM73sMx:22
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1176,Hydra:6.1.134,FMLib:17.12.100.49
 definitions=2026-10-09_03,2026-10-08_01,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 phishscore=0 malwarescore=0 lowpriorityscore=0 adultscore=0 impostorscore=0
 spamscore=0 priorityscore=1501 suspectscore=0 clxscore=1015 bulkscore=0
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.22.0-2610020000 definitions=main-2610090042


On 09-10-2026 02:02 pm, Dmitry Baryshkov wrote:
> On Mon, Oct 05, 2026 at 12:54:28PM +0530, Balaji Kalkonda wrote:
>> Add device node for the DisplayPort controller, its OPP table, clocks
>> and power domain, and connect it to the DPU and USB/DP QMP PHY.
>>
>> Signed-off-by: Balaji Kalkonda <balaji.kalkonda@oss.qualcomm.com>
>> ---
>>  arch/arm64/boot/dts/qcom/kaanapali.dtsi | 87 ++++++++++++++++++++++++++++++++-
>>  1 file changed, 85 insertions(+), 2 deletions(-)
>>
>> diff --git a/arch/arm64/boot/dts/qcom/kaanapali.dtsi b/arch/arm64/boot/dts/qcom/kaanapali.dtsi
>> index e48a179d0722..155c590c8eb6 100644
>> --- a/arch/arm64/boot/dts/qcom/kaanapali.dtsi
>> +++ b/arch/arm64/boot/dts/qcom/kaanapali.dtsi
>> @@ -3565,6 +3565,7 @@ usb_dp_qmpphy: phy@88e8000 {
>>  			#clock-cells = <1>;
>>  			#phy-cells = <1>;
>>  
>> +			mode-switch;
> Not mentioned in the commit message.
>
>>  			orientation-switch;
>>  
>>  			status = "disabled";
>> @@ -3851,6 +3854,86 @@ mdss_dsi0_phy: phy@9ac1000 {
>>  
>>  				status = "disabled";
>>  			};
>> +
>> +			mdss_dp0: displayport-controller@9ad2000 {
>> +				compatible = "qcom,kaanapali-dp";
>> +				reg = <0x0 0x09ad2000 0x0 0x10c>,
>> +				      <0x0 0x09ad2200 0x0 0xc8>,
>> +				      <0x0 0x09ad3000 0x0 0x78>,
>> +				      <0x0 0x09ad4000 0x0 0xa0>;
>> +
>> +				interrupts-extended = <&mdss 12>;
>> +
>> +				clocks = <&dispcc DISP_CC_MDSS_AHB_CLK>,
>> +					 <&dispcc DISP_CC_MDSS_DPTX0_AUX_CLK>,
>> +					 <&dispcc DISP_CC_MDSS_DPTX0_LINK_CLK>,
>> +					 <&dispcc DISP_CC_MDSS_DPTX0_LINK_INTF_CLK>,
>> +					 <&dispcc DISP_CC_MDSS_DPTX0_PIXEL0_CLK>;
>> +
> Please define all pixel clocks that are used by the DP controller. Is it
> not MST-capable?
>
>> +				clock-names = "core_iface",
>> +					      "core_aux",
>> +					      "ctrl_link",
>> +					      "ctrl_link_iface",
>> +					      "stream_pixel";
>> +
>> +				assigned-clocks = <&dispcc DISP_CC_MDSS_DPTX0_LINK_CLK_SRC>,
>> +						  <&dispcc DISP_CC_MDSS_DPTX0_PIXEL0_CLK_SRC>;
>> +				assigned-clock-parents =
>> +					<&usb_dp_qmpphy QMP_USB43DP_DP_LINK_CLK>,
> Don't break the line here.
>
>> +					<&usb_dp_qmpphy QMP_USB43DP_DP_VCO_DIV_CLK>;
>> +
>> +				operating-points-v2 = <&dp_opp_table>;
>> +
>> +				power-domains = <&rpmhpd RPMHPD_MX>;
> MMCX. If you need to cast a vote on MX domain too, add second entry to
> the power domains and handle it in the driver.
>
>> +
>> +				phys = <&usb_dp_qmpphy QMP_USB43DP_DP_PHY>;
>> +				phy-names = "dp";
>> +
>> +				#sound-dai-cells = <0>;
>> +
>> +				status = "disabled";
>> +

Hi Dmitry,

Thanks for reviewing.

I'll address all these comments in v2.

Thanks,
Balaji

