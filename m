Received: from mx0a-0031df01.pphosted.com (mx0a-0031df01.pphosted.com [205.220.168.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 6CE8E3FBB7D
	for <devicetree@vger.kernel.org>; Tue, 13 Oct 2026 14:43:41 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.168.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1791902622; cv=none; b=GcPuIMaKF4TrMNj2JkhugR/BLMWYYo/1/+546VXJriDSUHDiKzcVQ9NQtAJSK6z12ZZ3/GgsLzfdCfLBWA7enJIwa6Ex10L2mPF4CRJZK+GUtw8HtlBSGSygbHczFLI+M7iJ223mbUwQ9Fg7UndElJeaRRqlrn92HnRyAeKIQMQ=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1791902622; c=relaxed/simple;
	bh=hRee58Kt7S5y/UGwQRupQTcuC10MswKmClFHJFzTshw=;
	h=Message-ID:Date:MIME-Version:Subject:To:Cc:References:From:
	 In-Reply-To:Content-Type; b=TWiAswfi/JNyzOjUpQsTzfJowTTtshR0XGgjT4wfp4NuQZvXVlo6gjHwDYXDj8A96fgERk7X1TOqsqFR9NT3n01YNaCGHcYtimjXvAKvCAjsdrTrceqGiuwL0+9s+2UGGCHdVvntDWpbzWED6DVaTsh3MJh0AZCoUBSZDUDc+Fo=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=NkmMHhqg; dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b=Sp72T/LC; arc=none smtp.client-ip=205.220.168.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b="NkmMHhqg";
	dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b="Sp72T/LC"
Received: from pps.filterd (m0279867.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 69DE4QrV2571123
	for <devicetree@vger.kernel.org>; Tue, 13 Oct 2026 14:43:40 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	XGrFsGdzOaW98t5aAcMeDng2+ODIxPogmmneM/3dCzg=; b=NkmMHhqgRbencrNw
	RJwnSiavZsDuBaUzcUXIqxcOFMR2Z0zTQsSmUVrUEBx/RT/HmlX5CcLI0YbI4W7+
	DlHA7scOvyPFOb94xonF+aEuCJc9338TJduxFC5VeQ3zPymQt8Ey+4QWJCVpoFtg
	8r1Uscj8L+jmk0uR+YesT+3g60g7bI0bZ8vBZJjqr2ev0BdkB6/uZM8WFu04SmM3
	oimIHGuXAegGfdYYbuSMOqBGlZYdYXM11eAimmOZNQdTpPGjmhvB2TlLTn/pKvDK
	MiHF32EH35fzMT/wnfoKS+3CXr/rRgd9Cy85KOgb9vreN65kR0HP1+ZXc1+FoCkn
	t940hA==
Received: from mail-qv1-f70.google.com (mail-qv1-f70.google.com [209.85.219.70])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4h98hcbg44-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <devicetree@vger.kernel.org>; Tue, 13 Oct 2026 14:43:40 +0000 (GMT)
Received: by mail-qv1-f70.google.com with SMTP id 6a1803df08f44-917a54501a8so8784366d6.2
        for <devicetree@vger.kernel.org>; Tue, 13 Oct 2026 07:43:40 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1791902620; x=1792507420; darn=vger.kernel.org;
        h=content-transfer-encoding:content-type:in-reply-to:from
         :content-language:references:cc:to:subject:user-agent:mime-version
         :date:message-id:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=XGrFsGdzOaW98t5aAcMeDng2+ODIxPogmmneM/3dCzg=;
        b=Sp72T/LCMTI0OgALyLF/x9KP3PuJhqMfxPMHDf463bjSNXmyGuSZvaYQLVbtaudvmg
         ikBBxCEm8zcwKUVZOnkQf0V0HtrMBxZIXv0ygEvmUIDuJ1m7SmgQvwrlifA10Q0ewBOA
         HxItJ+GceZNu8rvaiIqx4luRvSuDyeTqeOk2DibP2lkbI+G+anv7kr9Gfb4uWCFlxVrd
         y/clb2F6Is0WBe88quaA9TKelPNruxkR09A11sDC+ctl12ds8mLpLUNIx8pWA8HIfDuX
         +HW2nEG2l2NvUORSjaD2edL14Z9Dbe4OLa4VxQZAHLmzCmB6vPnNo8cJN3CERUVQqtau
         d8bw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1791902620; x=1792507420;
        h=content-transfer-encoding:content-type:in-reply-to:from
         :content-language:references:cc:to:subject:user-agent:mime-version
         :date:message-id:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=XGrFsGdzOaW98t5aAcMeDng2+ODIxPogmmneM/3dCzg=;
        b=Sh6pn2oeySzIRgoEy86bIrQqX+pVzNuXLdwNHTexx52NHd0aZjneqZpIqLcMHZg6Ln
         +RzNwe2iGxDEdI1UxapipKKe9HFr9liIo7G+wQvIoq8zuRMV3yZIRtDELrVeGFxMH035
         7ykSwCRxcwT8D8s51QLtYI7lOPUpq+OzJGBn1CryI702S5Sfnz23lNqOMvCUHyYiBNbS
         IR97kWiNlNcejQtNhtuEfm6hhQCBIMCopQBiwp3aKNuynJS8b2bAfLYG5OS8JZBTNPsU
         pUFwrurCmgAZq7uYFJTCVoVITwaTIOqiCS39TJKP//yvPso54F+CCdAoVWs7NjR/5855
         duwg==
X-Forwarded-Encrypted: i=1; AKwUvBxGh+0UTWGxSqYAEMroy7PzcjTiu7sAjv+5L3UVM9m+F+EHj/Pn7LA2kzl8opL+V5Kb3FwfBzwlgrd1@vger.kernel.org
X-Gm-Message-State: AFq9FYKv4qFZoEwMSdoNqTQjso/UBkVHi2EpWsm2mbKppA4U2cmDK5rt
	w7pt/bxlMb+HIQwZ9VUL9IojSCSru94qz1D2ZB5XPcnkObStOz1XD+sZKUmRAKUWihgcE98JRDB
	qOHxpmhQWE2Yw8sPDo7z6eavOGnmsSkK1xrXC6Jl60NmXE6ewcSYMUUegapebv3ma
X-Gm-Gg: AYBFou1E1DpPM7pt5UGgyxq/E+bRZPnAQ/dWOOottQXXhfk4mrE4pFoa4LXFjYh+N/I
	KP5mSl+ef2UQv2xX6wFOOaPMK0Hh+rz6ikyz9uz3rF5YsU/hZJkAdkzE/N0uLO2rYJVczGIGiSx
	bx/zdnULKDsp0C9r12N85urvQDmw6LPToeWgd6vl/pqU8Hej0CzR1trfG4+KcfBLMIsIUcA/ptJ
	0gTCf4Yy8k+oAO4WJH5PAYTS8Ts1abIopMXDY2uPElxWLTBW0efKL5mYXE4xvIDdvhdLJGYPjHf
	kfy7/FQLRYwXnpSEXRV7SImWLoiYgxlA6YlJqb7++mQo1srJ5VNFdiVo4Ze1bM6RjUKIjNosKML
	GVFRR4xNmNoEFnxCYixht2g==
X-Received: by 2002:a05:620a:269a:b0:93a:14c:329c with SMTP id af79cd13be357-93ebd0c2693mr2404963685a.1.1791902619715;
        Tue, 13 Oct 2026 07:43:39 -0700 (PDT)
X-Received: by 2002:a05:620a:269a:b0:93a:14c:329c with SMTP id af79cd13be357-93ebd0c2693mr2404959085a.1.1791902619270;
        Tue, 13 Oct 2026 07:43:39 -0700 (PDT)
Received: from [192.168.226.26] ([178.235.128.140])
        by smtp.gmail.com with ESMTPSA id a640c23a62f3a-c31a9ac9ecfsm620584966b.74.2026.10.13.07.43.37
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Tue, 13 Oct 2026 07:43:38 -0700 (PDT)
Message-ID: <a7f04052-37d1-452c-8755-013e6e16414b@oss.qualcomm.com>
Date: Tue, 13 Oct 2026 16:43:36 +0200
Precedence: bulk
X-Mailing-List: devicetree@vger.kernel.org
List-Id: <devicetree.vger.kernel.org>
List-Subscribe: <mailto:devicetree+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:devicetree+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v7 06/11] arm64: dts: qcom: ipq5210: Add ICE support to
 SDHCI
To: Varadarajan Narayanan <varadarajan.narayanan@oss.qualcomm.com>,
        Bjorn Andersson <andersson@kernel.org>,
        Konrad Dybcio <konradybcio@kernel.org>, Rob Herring <robh@kernel.org>,
        Krzysztof Kozlowski <krzk+dt@kernel.org>,
        Conor Dooley
 <conor+dt@kernel.org>, Abel Vesa <abelvesa@kernel.org>
Cc: linux-arm-msm@vger.kernel.org, devicetree@vger.kernel.org,
        linux-kernel@vger.kernel.org
References: <20261012-08-dts-v7-0-77bd3d68d850@oss.qualcomm.com>
 <20261012-08-dts-v7-6-77bd3d68d850@oss.qualcomm.com>
Content-Language: en-US
From: Konrad Dybcio <konrad.dybcio@oss.qualcomm.com>
In-Reply-To: <20261012-08-dts-v7-6-77bd3d68d850@oss.qualcomm.com>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYxMDEzMDA1OCBTYWx0ZWRfX9WSoDqdjoJhj
 g9nEUww3z9cN8ZO+NVXM9kj6OrW13BbfJ7oOE1N0mo0O0kHK8U5B4AXyqKlEKitNIRA+qWVLtfb
 z9gHXtoTa9ljVFeP3MWK6TGeByoXiQFZZtp3FQxj4A/kBi9C+jN4y8an18GkhPTiXuio6imwF6W
 ahrRFjaGk2nLB42H6n/2zwG8zy+QUmxIM7DQmII+DJMrf/rD6Or+rM1m2cv7zBOhSCBTZ3mRQ/U
 jTUFk2KYZZY5FtkH7XF55jxEJCU9tOFDl7OZh6sXvN2zOIARBwnPBWHt5TgBFblSzkpEESqCgXe
 nxsYNgMGQ6r4Fp31nXBSsrZ6zdXFo1LZWlpRIVN6238XBxIsK7lG2VeDHZKB3XEMMXkPygVQ/FK
 MNNvX4mYlhl9CLwmYjV+fI2/YWAYVAcqDCigHqm64IGAUanEPMUKQ3X0aQnsEeg8BXX695MbNee
 7/1IxgmQUYgOktrWCZw==
X-Authority-Analysis: v=2.4 cv=VPVIDNPX c=1 sm=1 tr=0 ts=6ace439c cx=c_pps
 a=oc9J++0uMp73DTRD5QyR2A==:117 a=PRfkaYvzSr8QmIIGAkY2Sg==:17
 a=IkcTkHD0fZMA:10 a=660iZSQnnn4A:10 a=s4-Qcg_JpJYA:10
 a=VkNPw1HP01LnGYTKEx00:22 a=u7WPNUs3qKkmUXheDGA7:22 a=eoimf2acIAo5FJnRuUoq:22
 a=EUspDBNiAAAA:8 a=lT5hrBjHAMB7_Zzis_wA:9 a=QEXdDO2ut3YA:10
 a=iYH6xdkBrDN1Jqds4HTS:22
X-Proofpoint-ORIG-GUID: zS5VDMky5xNGPWv_MInsX3U-rRtIPkOr
X-Proofpoint-Spam-Info: AW1haW4tMjYxMDEzMDA1OCBTYWx0ZWRfX4ofvOrJscvz4
 CUELbGwj4lTEmb0Xnnc6ZnjFsWxctRKvHTJRyNXc7hFY+k2pGMYRJBCz/8FKzGAvgZ/XY1T2dkd
 e5PoOP8h25P3Tzx/2b+JU4mMxkyit8g=
X-Proofpoint-GUID: zS5VDMky5xNGPWv_MInsX3U-rRtIPkOr
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1176,Hydra:6.1.134,FMLib:17.12.100.49
 definitions=2026-10-13_01,2026-10-09_01,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 bulkscore=0 priorityscore=1501 malwarescore=0 impostorscore=0 spamscore=0
 suspectscore=0 lowpriorityscore=0 adultscore=0 phishscore=0 clxscore=1015
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.22.0-2610080000 definitions=main-2610130058

On 10/12/26 9:23 AM, Varadarajan Narayanan wrote:
> Describe the SDHCI ICE register region and clock, and enable CQE support
> for the IPQ5210 SDHCI controller.
> 
> Signed-off-by: Varadarajan Narayanan <varadarajan.narayanan@oss.qualcomm.com>
> ---
>  arch/arm64/boot/dts/qcom/ipq5210.dtsi | 15 +++++++++++----
>  1 file changed, 11 insertions(+), 4 deletions(-)
> 
> diff --git a/arch/arm64/boot/dts/qcom/ipq5210.dtsi b/arch/arm64/boot/dts/qcom/ipq5210.dtsi
> index d28d68a10958..c14b42c22616 100644
> --- a/arch/arm64/boot/dts/qcom/ipq5210.dtsi
> +++ b/arch/arm64/boot/dts/qcom/ipq5210.dtsi
> @@ -416,9 +416,11 @@ uart1: serial@1a84000 {
>  		sdhc: mmc@7804000 {
>  			compatible = "qcom,ipq5210-sdhci", "qcom,sdhci-msm-v5";
>  			reg = <0x0 0x07804000 0x0 0x1000>,
> -			      <0x0 0x07805000 0x0 0x1000>;
> +			      <0x0 0x07805000 0x0 0x1000>,
> +			      <0x0 0x07808000 0x0 0x2000>;
>  			reg-names = "hc",
> -				    "cqhci";
> +				    "cqhci",
> +				    "ice";

This should be a separate node, like on other SoCs to allow things
like frequency scaling

Konrad
