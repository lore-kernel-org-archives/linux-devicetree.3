Received: from mx0b-0031df01.pphosted.com (mx0b-0031df01.pphosted.com [205.220.180.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 1BB9442F6F6
	for <devicetree@vger.kernel.org>; Thu, 16 Jul 2026 14:28:36 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.180.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1784212118; cv=none; b=W2UCkxcealTOGTFrOwamZtPIQS3IauMLYwZ0TlQEslHO737Y6AFIXYVWv7xGGi+BcoOZhf+5ZG9D5FcjxNLAfy5jdnEL9VDiE3BSGblXlW9rEo4Dzli80NkDZLob7q462oF+QwM2ZIfjyO0T3HQEt31Loih5xKkSYXyn013SnJY=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1784212118; c=relaxed/simple;
	bh=XbeiP+quxy8JdRYY++ddACJ6YqpfwZkPJ9dVg3KWp98=;
	h=Message-ID:Date:MIME-Version:Subject:To:Cc:References:From:
	 In-Reply-To:Content-Type; b=Etcp1T67J3cde1lKTu7faFw4kzhuyIfktRq2LMc/L5zuww4wfXgiMRw1gdeSMkmCEdwKzuNXiSTi1kkbQqBTJ4toiwDvLfkkLt7Ubxnqi4hw/up7d3Rwp5dA3pa1O7IR7ZCf473gdHQIPzb+CHTp7t1/U49xndYZSxqe+yc3Enc=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=LASPYrWw; dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b=HndCH5yI; arc=none smtp.client-ip=205.220.180.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b="LASPYrWw";
	dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b="HndCH5yI"
Received: from pps.filterd (m0279870.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 66GDJnRD2897291
	for <devicetree@vger.kernel.org>; Thu, 16 Jul 2026 14:28:36 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	rL4SpDLV0gQsFTbrH61VS1SQZ29IO/LN7dDdsh0VUgw=; b=LASPYrWwAQxt9RWf
	2kk5WrOkQUghcwjikBG/7ohp0vYfzhIfIaExT7fgnOZJLyTyVyLEQl+5PZZgKGZO
	57rLAUhOho4QKeoUzuqurW3ugffa3TZeyAm5lg3TvPgMckdXguS65n8In++VEWSM
	HzopEBHYCfopYHhOOUri2IHQL6/gkJMj7Mha97O+7gIEBjy2aVN/wsKJhW5JW3i1
	kQ2vFeHNmHpmi1c8pllcU401/CBb7Vh2zh2nuVI/LYBx9+YNs2UNj3+ChhYo+suv
	UcKM0ncRtvVjQkfJ2J2CUFE09yHX0uTJXiIqEkBILkC8wBQNHMAp7nIdGHiYGRiG
	P0cBjA==
Received: from mail-ot1-f69.google.com (mail-ot1-f69.google.com [209.85.210.69])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4feve1segt-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <devicetree@vger.kernel.org>; Thu, 16 Jul 2026 14:28:35 +0000 (GMT)
Received: by mail-ot1-f69.google.com with SMTP id 46e09a7af769-7ebeeb51976so742525a34.1
        for <devicetree@vger.kernel.org>; Thu, 16 Jul 2026 07:28:35 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1784212115; x=1784816915; darn=vger.kernel.org;
        h=content-transfer-encoding:content-type:in-reply-to:from
         :content-language:references:cc:to:subject:user-agent:mime-version
         :date:message-id:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=rL4SpDLV0gQsFTbrH61VS1SQZ29IO/LN7dDdsh0VUgw=;
        b=HndCH5yI4LvBJun1eu7idHI/bnlkkPIGtMFuZetboYn383qdpQzke28Oo890dUmUqW
         rtUm/bm/VgMT5j9qgIZaK5c6dLoUjm5WPqJu5GnjqX1JtMs7Q+Wg0vvr2jfL1TyeQH1F
         U9Sgl+8D9nuUwyQ2a5IDGPc9x7oq7PMxoBMst/l7tiaP6XIk+hVoJ7g5Lxfyt5mi9PvI
         kF49sFMv3X2dpxum/SITalzXXXiM/b9/D0HLYyFcW+oh2GEe7uJldQCRhCsUSxgI8Bj5
         ihmJR3qfXEET5mNghbN1JprDrlTApUFczZEHEXOx4gMy9K4OljOT04We+h7HMHhrt+CW
         sq6w==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1784212115; x=1784816915;
        h=content-transfer-encoding:content-type:in-reply-to:from
         :content-language:references:cc:to:subject:user-agent:mime-version
         :date:message-id:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=rL4SpDLV0gQsFTbrH61VS1SQZ29IO/LN7dDdsh0VUgw=;
        b=b3rkYpRnUtp3n9dp05RNpP0A0OA4vPdDOGQDS4MO8bRyH/8tLlc+u4JP1QhoKkGSao
         oxKsMTHZam0PwvTiyRPYhM6gIyJKzm04qssGWCgNlzoSCizvamAkZktZP/i+yrNP/ycZ
         Ihdm6U1ukvRHj3xa1WpSLPYgt+Yy0LFcg7Cb7UajjdT1I5dhDfYcSAiYZznD+WiOcpzF
         OGWz6FD4Q7366oWUu32/M7fpt3Y4qsAo0tQYZujUqHN1q/fl6XkLWvqEjR5EXah2In+d
         BNPrcnsNOQ6wBY1YUYSAKGa/Luilyyh4rC6OEdgA8ld4fKy+px0v+FKJjO3dUTrZ0MOx
         AZVg==
X-Gm-Message-State: AOJu0YzqgfvkgYWe3uw43DwKq5FJvH2Wd9r4uXP/dlfvcCriacB4eMKB
	m4E7CIko2P5ENEvOycgADTvo9r6hhZ5b+qlmgxdwvoDm+WX24nqkTCdKLVJ1mLUE+OSbDAN0Y65
	QKP+Ozz5ybhglh3et+pfEKI0Qcx0SgiX09X/yLM5UhLj3gVJQ9noF62F7WgVLPgh/gWJOMtgf
X-Gm-Gg: AfdE7cn6JjZzwZvYFIraUJeXnKObY6ymtXjsD6CFIZ6lLNhVOiC2yzevJASBrF154AD
	RJ8jilyhWfuSdn1dxAkdNlp9sMiQGWP/X/smyHKhbjhd6YkxwAPt8mfTa00LdQhRCNShOKB2Yzo
	Ij+M3ZMXEVSZrXcEFYYL4/X+9EJm8P6+0YtDu3zKRbgE8hwgm34L8p5Y78n9TYB5hPTDpWe/udE
	Y9jhSmDNlAZ/mRohOpdynW4uNUKWGRmxKPI7HmKlMMRLmv+NRWH2gvgZ5s66RrdR4/w+47y5eHx
	BWnJhhErOlXsw7uGgS/DbdAD+PIjIZTOE+tWN5HP6JLprKbiRJSb7ddvj2aanQhOjoWW1AZnJGU
	L7SNUW6SblDri9Q3eXpj7O15MhOu9ed4Q
X-Received: by 2002:a05:6830:3c86:b0:7e9:b673:cbfd with SMTP id 46e09a7af769-7ec6e5ee816mr1662162a34.7.1784212110123;
        Thu, 16 Jul 2026 07:28:30 -0700 (PDT)
X-Received: by 2002:a05:6830:3c86:b0:7e9:b673:cbfd with SMTP id 46e09a7af769-7ec6e5ee816mr1662154a34.7.1784212109651;
        Thu, 16 Jul 2026 07:28:29 -0700 (PDT)
Received: from [10.218.25.112] ([202.46.22.19])
        by smtp.gmail.com with ESMTPSA id 46e09a7af769-7ec2183a28fsm10376641a34.24.2026.07.16.07.28.27
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Thu, 16 Jul 2026 07:28:29 -0700 (PDT)
Message-ID: <c66cb2e1-b403-4241-b63c-e71abf8f49c7@oss.qualcomm.com>
Date: Thu, 16 Jul 2026 19:58:24 +0530
Precedence: bulk
X-Mailing-List: devicetree@vger.kernel.org
List-Id: <devicetree.vger.kernel.org>
List-Subscribe: <mailto:devicetree+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:devicetree+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH V3 1/3] arm64: dts: qcom: monaco: Move eMMC CQE support
 from SoC to board DT
To: sashiko-reviews@lists.linux.dev
Cc: devicetree@vger.kernel.org, robh@kernel.org, conor+dt@kernel.org
References: <20260701081715.2580329-1-monish.chunara@oss.qualcomm.com>
 <20260701081715.2580329-2-monish.chunara@oss.qualcomm.com>
 <20260701082834.EA3E11F000E9@smtp.kernel.org>
Content-Language: en-US
From: Monish Chunara <monish.chunara@oss.qualcomm.com>
In-Reply-To: <20260701082834.EA3E11F000E9@smtp.kernel.org>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYwNzE2MDE0OSBTYWx0ZWRfXwL2kIIydKyXI
 D0Rn+sS2mOSjL0K9Ff31i+kArQJ/goZCLUpD0qxo6UKiiypgXG4aeIe7o/UJStKN1vbHjbLIS0t
 bKd5uFJG+2Gsv27uF4KbYcc+UZ+a//QImLawmEXTWeli+v378M3emwi3kXCsMwfcLqodXPrEyTq
 jDbeo6rqqndCMQEfEC6lBFrDY/q7cIPx8W+f18/mP11d5m6E09BJLp9YAmUrUvfEg1Q3Tui/2lc
 NNgCEh9AdMB9OPwKG2nz53xLJydrSIev30pTXL5nAE+/UU2ks5FnlDDNZPMOwRhAT7LVpxhCHB/
 DNchwfUAzFo9PjEOM4q/CjldJ2MACEBVZbyBHyG7AF4JurWZ/zL/elQLnNq7XFEfhGwYSVq6B8T
 gSTQHal855tWrwIM82C4rWsngl313MMgoC+agukGetfpDwbrKrpGw5gsM2Ko2TPyPvWmcOJSwns
 IxtFtgTviEiYIUTi51Q==
X-Authority-Analysis: v=2.4 cv=DvpmPm/+ c=1 sm=1 tr=0 ts=6a58ea93 cx=c_pps
 a=z9lCQkyTxNhZyzAvolXo/A==:117 a=fChuTYTh2wq5r3m49p7fHw==:17
 a=IkcTkHD0fZMA:10 a=RAioF0-LDSMA:10 a=s4-Qcg_JpJYA:10
 a=VkNPw1HP01LnGYTKEx00:22 a=u7WPNUs3qKkmUXheDGA7:22 a=gowsoOTTUOVcmtlkKump:22
 a=VwQbUJbxAAAA:8 a=EUspDBNiAAAA:8 a=AICR_x1_rTwGJrEgV6EA:9 a=QEXdDO2ut3YA:10
 a=EyFUmsFV_t8cxB2kMr4A:22
X-Proofpoint-GUID: -wihwRMrKTN8qsPM0eABd1CuRbdoWV-c
X-Proofpoint-ORIG-GUID: -wihwRMrKTN8qsPM0eABd1CuRbdoWV-c
X-Proofpoint-Spam-Info: AW1haW4tMjYwNzE2MDE0OSBTYWx0ZWRfXyhLqW/YlByPI
 CP5dOzxqIsofPHX6EkkJXJ5Q8OwBImKpdoNMTa0/EpZ5E0awfN2g7lTy07JDAvLunF98GZYlLp5
 nWdDditXqTsF80liOPn+xdw5c0rL4Ys=
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1143,Hydra:6.1.134,FMLib:17.12.100.49
 definitions=2026-07-16_05,2026-07-15_02,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 clxscore=1015 suspectscore=0 priorityscore=1501 phishscore=0
 lowpriorityscore=0 bulkscore=0 spamscore=0 malwarescore=0 impostorscore=0
 adultscore=0 classifier=typeunknown authscore=0 authtc= authcc=
 route=outbound adjust=0 reason=mlx scancount=1 engine=8.22.0-2606150000
 definitions=main-2607160149



On 7/1/2026 1:58 PM, sashiko-bot@kernel.org wrote:
> Thank you for your contribution! Sashiko AI review found 1 potential issue(s) to consider:
> - [High] Missing `supports-cqe` property for eMMC in `monaco-evk.dts`.
> --
> 
> commit 5c91ec5c205c89bd965c17fc6805d964575e0468
> Author: Monish Chunara <monish.chunara@oss.qualcomm.com>
> 
> arm64: dts: qcom: monaco: Move eMMC CQE support from SoC to board DT
> 
> This commit removes the 'supports-cqe' property from the Monaco SoC device
> tree to allow SD card compatibility, and moves it into the board-specific
> device trees that use eMMC.
> 
>> diff --git a/arch/arm64/boot/dts/qcom/monaco.dtsi b/arch/arm64/boot/dts/qcom/monaco.dtsi
>> index 7b1d57460f1e6..e5f316897706b 100644
>> --- a/arch/arm64/boot/dts/qcom/monaco.dtsi
>> +++ b/arch/arm64/boot/dts/qcom/monaco.dtsi
>> @@ -4828,7 +4828,6 @@ &mc_virt SLAVE_EBI1 QCOM_ICC_TAG_ALWAYS>,
>>  			qcom,dll-config = <0x000f64ee>;
>>  			qcom,ddr-config = <0x80040868>;
>>  			bus-width = <8>;
>> -			supports-cqe;
>>  			dma-coherent;
>>  
>>  			mmc-ddr-1_8v;
> 
> [Severity: High]
> Does this unintentionally drop CQE support for the monaco-evk board?
> 
> The &sdhc_1 node in arch/arm64/boot/dts/qcom/monaco-evk.dts configures the
> controller for eMMC:
> 
> &sdhc_1 {
> 	vmmc-supply = <&vreg_l8a>;
> 	vqmmc-supply = <&vreg_s2s>;
> 
> 	no-sd;
> 	no-sdio;
> 	non-removable;
> 
> 	status = "okay";
> };
> 
> Since supports-cqe is removed from the base monaco.dtsi here, but is not
> explicitly added to monaco-evk.dts in this patch, booting the standalone
> monaco-evk.dtb will now bring up eMMC without Command Queue Engine support.
> 
> Should monaco-evk.dts be updated alongside the other boards in this patch
> to prevent a performance regression?
> 

This property will come from the monaco-evk-emmc.dtso file to enable eMMC.

Regards,
Monish
