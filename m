Received: from mx0a-0031df01.pphosted.com (mx0a-0031df01.pphosted.com [205.220.168.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id BE4232D3727
	for <devicetree@vger.kernel.org>; Sun, 14 Jun 2026 21:41:58 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.168.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1781473319; cv=none; b=ijNH/u9TQL8O4ZI/R4HfXdZK2bpBXLAVcjm31/KdLPG5xRGU+YQcl1xWKO+RB1FdRCtT81p/KKJjH5RUcKXqceYXV2jYij76cT0gNIeWP3TtwBZ8Y+Y6+doU2rIS685E5ShJtYPe5zQPM8oGhXqmoYXcffKvFdUt+axRkt18tGA=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1781473319; c=relaxed/simple;
	bh=3MM/QC1d7DMFjj96U0zHm7se3t1/cUKIqod6IxmDgoY=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=lbGcfEBMzaGYho+21er+xLf0FjhgWYGs/fPsD3mV8hqKY5QjLaP1RbCaYqRuQmCzA4h55r1DO6oGAYYrg1Bc6OxWO1ZNjPURBOAxWGUzLIBAuxzk24XOHIYsXy9NO09VrwVmxHKGfzmOEbK48K9wBU4OiOvTHQWH+cstvV8yd+4=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=YxpYxzQg; dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b=EiFXu5Zb; arc=none smtp.client-ip=205.220.168.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b="YxpYxzQg";
	dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b="EiFXu5Zb"
Received: from pps.filterd (m0279866.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 65ELEY6S2197003
	for <devicetree@vger.kernel.org>; Sun, 14 Jun 2026 21:41:58 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-type:date:from:in-reply-to:message-id:mime-version
	:references:subject:to; s=qcppdkim1; bh=Grwn3YVn93/D705PG92kjjTD
	C1rDMtxnuDTNRZh1TIA=; b=YxpYxzQgwBA0oiMJX6/P00kfy7/xef2KhwBkE+4r
	8uvek6cXVni97nw10d7hS2oFb69v6KPpqAkjoLu6/jo2oGv71BOXuYcwBP3hgmAG
	3V2pTd0y0GFdMQlNb4cXfbWwTnnQGkgOBUjvVTTtUUMIhMt1qdORqhhyWqwxHRtO
	DO3rRnrYqR9KytwxpObCqmE0Esp+SI3PTs0HXH2TEMAYBrNSwrNI/7t+8fRXb+NE
	GLjpOjnvHJVTv9OKRrttKhi5i15RvpDYSGMlynYdjiC+42E8FUFqCf4pJtFqLFTv
	k90swdQ7DYXEbFl24BvmxdLoJ/7HPZYbQBLIr6UteGWNkA==
Received: from mail-qk1-f199.google.com (mail-qk1-f199.google.com [209.85.222.199])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4es0g84jk5-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <devicetree@vger.kernel.org>; Sun, 14 Jun 2026 21:41:57 +0000 (GMT)
Received: by mail-qk1-f199.google.com with SMTP id af79cd13be357-91931144870so199376285a.1
        for <devicetree@vger.kernel.org>; Sun, 14 Jun 2026 14:41:57 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1781473317; x=1782078117; darn=vger.kernel.org;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:from:to:cc:subject:date:message-id:reply-to;
        bh=Grwn3YVn93/D705PG92kjjTDC1rDMtxnuDTNRZh1TIA=;
        b=EiFXu5ZbgUke5MXGtR84L01dm3AzsE/SKwqY4Fnvxo2sWMB/bV2d3tlpyCYbMOL1YZ
         GelGVhfhfSNY7iUgwLyosnn0nbKZec4YTQfI9j7q2iNxX35XBY//88UUpsjnS8kdeqQr
         2j9YkGfKpn5oriDgolnWcHDWDomc3Op1OJsXM8wbwgoZy3JUq9LjJjsassnC8gyWMd5C
         Z7RR7pxsNunE5JRjVFmgdP23s/2XNX/mr8LRiSI8n/RGtMTpN78mTDv1tSvg9Kb38jOt
         /Qf6vosOyhhTlq7jqyg0JiL3nPaJ+iwpRVDmhdy/164YRN27C/FHmhj9NJDWnLBT5TCx
         BhyQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1781473317; x=1782078117;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:x-gm-gg:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=Grwn3YVn93/D705PG92kjjTDC1rDMtxnuDTNRZh1TIA=;
        b=spIjd0bQFi/xLZnSV6q9yKLKyEjJNHolyGabdTPIweEIwNIrU8V3URHbX6Ue+14cYk
         ookn6r+6uj9H22QgPRlPLnkrm3T40XJgcFrbQv830Y8RC3orIerriRrDehkdhDR18fQj
         2NmfAO6a6BzoIFoMYjGmlQAY9v+UYnzuspCcb8lGZ/J1JbB7bjLH9duXHMsuLJ03Zjsk
         QQ57yPp2Hi2AmGl3UNFkl7+hZBYXptMf9I06IUhu5+5HOOa4nyQU2MKDGQv1es3TCb7U
         yaOT/BZIgqo9lBUEFr4IhuwmQBhYraf1JChKNOqxFUUVP5r2cIXllGhFHoyLl3rgITyM
         1law==
X-Forwarded-Encrypted: i=1; AFNElJ+jh92bTZDSZ9OJ+HCNhiFdxKrNgyh6jmuJDeLyXSSJgdQNznN5ai5uYLJDCuRy21ZZycysQgiP6/lU@vger.kernel.org
X-Gm-Message-State: AOJu0Ywc3DSw2pkm/lLHVcjBDYK7qoe6pjvAoFNRO8MKUq+rWo6ylSxw
	ehjkxZjjnYiGaeHbfNJl/AHVxuFAYSerttVkTUn1107VVSCcwFJfvQ0+/ZxrgN/Vvol6g9L5SOP
	uNumW/X1dEUVxYiIDjkNGculsRg8wbN7r5vU8fSv/vB+WQ18r3dCJi3mNfCqhXO6l
X-Gm-Gg: Acq92OFHo3CVF8jtoS2bXqfGgb03CTJQbuovdcBEyf5ziSpFFozs8B0EC1Gpt0R3gx6
	JfpQr8ZaMfOu7C9hpi6rHKiVn0kse2fpvym4SU8FNfem6RjIG68nEZoPSN52wjeeMqLz2UhTcvc
	/ucZznFx+5IC0DBiQuFw1VYqpZajtsaxfcfioLDKDWmPO/WBe8WBVc7pB4utDvTUxDVixROK9gU
	XAZYsCuZmFffLc348UDGJTHTA0znHuQNBsqsy3uTWYaNp0NbkpjeTupBNOz6eq4RaU71ryYtJcG
	Xp4rQw7riy+z7Nhsjhw4CdB1HW1PsX83N1cCenmggeQK5w1tsVZXyRxRh8A6J6eXERj8y8fEN/G
	dEuQoMdnq127syywLWLU1v0F9P/JA7F3H4K+FIURdq3p1MZeNCdG+qCA2slP8nbc05kHEEakfiU
	JukVRT16Wfr6buXkjfvhc8PZc3mhgudMBXNoo=
X-Received: by 2002:a05:620a:319f:b0:915:b9f6:71a2 with SMTP id af79cd13be357-9161bd41fcfmr1782516885a.48.1781473317018;
        Sun, 14 Jun 2026 14:41:57 -0700 (PDT)
X-Received: by 2002:a05:620a:319f:b0:915:b9f6:71a2 with SMTP id af79cd13be357-9161bd41fcfmr1782514385a.48.1781473316559;
        Sun, 14 Jun 2026 14:41:56 -0700 (PDT)
Received: from umbar.lan (2001-14ba-a073-af00-264b-feff-fe8b-be8a.rev.dnainternet.fi. [2001:14ba:a073:af00:264b:feff:fe8b:be8a])
        by smtp.gmail.com with ESMTPSA id 2adb3069b0e04-5ad2e1bb12csm2211403e87.84.2026.06.14.14.41.55
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Sun, 14 Jun 2026 14:41:55 -0700 (PDT)
Date: Mon, 15 Jun 2026 00:41:53 +0300
From: Dmitry Baryshkov <dmitry.baryshkov@oss.qualcomm.com>
To: Jishnu Prakash <jishnu.prakash@oss.qualcomm.com>
Cc: Bjorn Andersson <andersson@kernel.org>,
        Konrad Dybcio <konradybcio@kernel.org>, Rob Herring <robh@kernel.org>,
        Krzysztof Kozlowski <krzk+dt@kernel.org>,
        Conor Dooley <conor+dt@kernel.org>, linux-arm-msm@vger.kernel.org,
        devicetree@vger.kernel.org, linux-kernel@vger.kernel.org,
        Kamal Wadhwa <kamal.wadhwa@oss.qualcomm.com>,
        Rakesh Kota <rakesh.kota@oss.qualcomm.com>
Subject: Re: [PATCH 1/4] arm64: dts: qcom: pm4125: Add VADC and temp alarm
 nodes
Message-ID: <y3b3i4p6nr3tj5ds3a5zispbrxt7pzucoswh5grtthmj2m5en2@ucniw6w45572>
References: <20260613-shikra_adc_support-v1-0-57d5e6c7f47d@oss.qualcomm.com>
 <20260613-shikra_adc_support-v1-1-57d5e6c7f47d@oss.qualcomm.com>
Precedence: bulk
X-Mailing-List: devicetree@vger.kernel.org
List-Id: <devicetree.vger.kernel.org>
List-Subscribe: <mailto:devicetree+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:devicetree+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20260613-shikra_adc_support-v1-1-57d5e6c7f47d@oss.qualcomm.com>
X-Authority-Analysis: v=2.4 cv=OOoXGyaB c=1 sm=1 tr=0 ts=6a2f2026 cx=c_pps
 a=HLyN3IcIa5EE8TELMZ618Q==:117 a=xqWC_Br6kY4A:10 a=kj9zAlcOel0A:10
 a=FelO9ux0wxsA:10 a=s4-Qcg_JpJYA:10 a=VkNPw1HP01LnGYTKEx00:22
 a=u7WPNUs3qKkmUXheDGA7:22 a=YMgV9FUhrdKAYTUUvYB2:22 a=EUspDBNiAAAA:8
 a=sKpPAbJoxR1_uPe38MUA:9 a=CjuIK1q_8ugA:10 a=bTQJ7kPSJx9SKPbeHEYW:22
X-Proofpoint-GUID: u_bsmFxr0xONMsw2DVcjUrAsLzrDXCFt
X-Proofpoint-ORIG-GUID: u_bsmFxr0xONMsw2DVcjUrAsLzrDXCFt
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYwNjE0MDIzMCBTYWx0ZWRfX5Uh9oanoI9DF
 LvtXUYrSih+AceEvHtdTHpoKn8XQIcLo1KQf4EQURZ56VJM66pvPuP8EbBfq5iachW9/TATJ0LM
 Qzp7brl5xoxB2zeIRRQnZ6sprM/FrBC9a2qZ/2uRwwF0l3W2etxNNBH/reTxQ6ZtXSJm/mxgoRK
 FTra/p5dNdN7PnzkfgkzcyYd5zpsKhGUuM42ZY6wtEiIqRmPYc5sE/1p2sEgrG/PzRuG5TaYqX9
 NIbpvx35x0tqkKU/nB8B5Ksti0NI9sJQT+pPKIgXI0Zr3h/5lekUUuvdLnYuHR1A1+NzDx54nk5
 oaQvANymwVDsbInbDl6Jo7tzrrBu39ldqCrIgq9OLu8QRl1jv46YKMhq0RsFHgw/B4okbU6WNvq
 fJ4LP0jxdFbMsV2ailv9LFLgm5nl+H+PThELOxfcwLDnBYubnSYZIam01ygWxkUD2NVIwICBkxp
 MIznX+LhQJ6o6ctsqJw==
X-Proofpoint-Spam-Info: AW1haW4tMjYwNjE0MDIzMCBTYWx0ZWRfX7WL8gpik56MS
 455F77BS6y1k6HG67aPKfC2MViDwkPI3ZQ/8cmKC3GSaktoIrHzpZeAAe1PoRXxQbqBsrW3/4t7
 lNGreRyehpCvZDT+6vd8CdRZDdITM/c=
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1143,Hydra:6.1.125,FMLib:17.12.100.49
 definitions=2026-06-14_05,2026-06-12_03,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 priorityscore=1501 clxscore=1015 adultscore=0 spamscore=0 phishscore=0
 lowpriorityscore=0 bulkscore=0 malwarescore=0 impostorscore=0 suspectscore=0
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.22.0-2606040000 definitions=main-2606140230

On Sat, Jun 13, 2026 at 01:39:21PM +0530, Jishnu Prakash wrote:
> Add VADC node with some channels under it, for voltage and
> temperature readings. Add temperature alarm node, used for
> PMIC thermal mitigation.
> 
> Co-developed-by: Rakesh Kota <rakesh.kota@oss.qualcomm.com>
> Signed-off-by: Rakesh Kota <rakesh.kota@oss.qualcomm.com>
> Signed-off-by: Jishnu Prakash <jishnu.prakash@oss.qualcomm.com>
> ---
>  arch/arm64/boot/dts/qcom/pm4125.dtsi | 77 ++++++++++++++++++++++++++++++++++++
>  1 file changed, 77 insertions(+)
> 
> diff --git a/arch/arm64/boot/dts/qcom/pm4125.dtsi b/arch/arm64/boot/dts/qcom/pm4125.dtsi
> index 542e8fe030da..7113504d5941 100644
> --- a/arch/arm64/boot/dts/qcom/pm4125.dtsi
> +++ b/arch/arm64/boot/dts/qcom/pm4125.dtsi
> @@ -65,6 +65,83 @@ pm4125_typec: typec@1500 {
>  			status = "disabled";
>  		};
>  
> +		pm4125_tz: temp-alarm@2400 {
> +			compatible = "qcom,spmi-temp-alarm";
> +			reg = <0x2400>;
> +			interrupts = <0x0 0x24 0x0 IRQ_TYPE_EDGE_BOTH>;
> +			io-channels = <&pm4125_adc ADC5_DIE_TEMP>;
> +			io-channel-names = "thermal";
> +			#thermal-sensor-cells = <0>;
> +			status = "disabled";

Why would it be disabled by default?

> +		};
> +
> +		pm4125_adc: adc@3100 {
> +			compatible = "qcom,spmi-adc5";
> +			reg = <0x3100>;
> +			#address-cells = <1>;
> +			#size-cells = <0>;
> +			#io-channel-cells = <1>;
> +			interrupts = <0x0 0x31 0x0 IRQ_TYPE_EDGE_RISING>;
> +			status = "disabled";

Again, why?

> +
> +			/* Channel nodes */
> +			channel@0 {
> +				reg = <ADC5_REF_GND>;
> +				label = "ref_gnd";
> +				qcom,pre-scaling = <1 1>;
> +			};
> +
> +			channel@1 {
> +				reg = <ADC5_1P25VREF>;
> +				label = "vref_1p25";
> +				qcom,pre-scaling = <1 1>;
> +			};
> +
> +			channel@6 {
> +				reg = <ADC5_DIE_TEMP>;
> +				label = "die_temp";
> +				qcom,pre-scaling = <1 1>;
> +			};
> +
> +			channel@7 {
> +				reg = <ADC5_USB_IN_I>;
> +				label = "usb_in_i_uv";
> +				qcom,pre-scaling = <1 1>;
> +			};
> +
> +			channel@8 {
> +				reg = <ADC5_USB_IN_V_16>;
> +				label = "usb_in_v_div_16";
> +				qcom,pre-scaling = <1 16>;
> +			};
> +
> +			channel@9 {
> +				reg = <ADC5_CHG_TEMP>;
> +				label = "chg_temp";
> +				qcom,pre-scaling = <1 1>;
> +			};
> +
> +			channel@4b {
> +				reg = <ADC5_BAT_ID_100K_PU>;
> +				label = "bat_id";
> +				qcom,ratiometric;
> +				qcom,hw-settle-time = <200>;
> +				qcom,pre-scaling = <1 1>;
> +			};
> +
> +			channel@83 {
> +				reg = <ADC5_VPH_PWR>;
> +				label = "vph_pwr";
> +				qcom,pre-scaling = <1 3>;
> +			};
> +
> +			channel@84 {
> +				reg = <ADC5_VBAT_SNS>;
> +				label = "vbat_sns";
> +				qcom,pre-scaling = <1 3>;
> +			};
> +		};
> +
>  		rtc@6000 {
>  			compatible = "qcom,pm8941-rtc";
>  			reg = <0x6000>, <0x6100>;
> 
> -- 
> 2.43.0
> 

-- 
With best wishes
Dmitry
