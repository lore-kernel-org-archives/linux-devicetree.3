Received: from mx0a-0031df01.pphosted.com (mx0a-0031df01.pphosted.com [205.220.168.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id C0A3040A924
	for <devicetree@vger.kernel.org>; Wed, 29 Jul 2026 09:35:59 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.168.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1785317761; cv=none; b=f8pSdkFAiRlGzUSN1UiD3clYWgreH0uGCX4OGv12e2Wm3qkmzDG6+1d0mVVVdNTbY9ANQFEL5crtwhtjEU2O0I8qJIs7SRtnL+uDpZJk0SHcGAiWtjjWevt8VmwowCmQeK6SbMN+eMR8LHvVi5Qd76FBoLbxsviApZyCdhDh8LA=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1785317761; c=relaxed/simple;
	bh=ZaCWRqfKbgTlsT8GVdWkwsueyAjzupW1Bye9aozkzDc=;
	h=Message-ID:Date:MIME-Version:Subject:To:Cc:References:From:
	 In-Reply-To:Content-Type; b=vBSRSxfXtWTkL4IxFD2AKvAEafIj9eHku41/gJ+KUH46hx6rLepZnBSoW9oV0yJV3YRdN4YW2kkpLEt0Fx0UNHB6bkvSwAVRt8e2jZtl0REZR4r+ZIAHXYVdrsB0w5UHRw0TjFZrvwSb+nya0dYsPJ3Uh8Or5gOGM3cVazZFPw0=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=gedWuyZ9; dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b=I/alw/y9; arc=none smtp.client-ip=205.220.168.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b="gedWuyZ9";
	dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b="I/alw/y9"
Received: from pps.filterd (m0279866.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 66T7ets6944301
	for <devicetree@vger.kernel.org>; Wed, 29 Jul 2026 09:35:59 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	+r4+xWdHMzsyfScjCV/VxoiA9AqoNvSqUiB8FzN+vwI=; b=gedWuyZ90FVwJ4LR
	1OJ8Yp9KMWBt931TwFiFI0gdWq02yPVmph03m3tmfcIZhVSu1Nx4eWyExezzcbW9
	+ARsUwpC4mtDdacnZ9NoJIpFNeqKGDb5Xwc2rc7ZWRtTk+LmpfQUu2tXoxuQDKtB
	UUR3r5GBEjdcqG4IyuMr6b9ZjckvhRMq6e0BSOZNjqxPw3/kWk7uEE/9RUPa801q
	dfv2Zx8BUKNznSo2uu7aqu+Lw5nfqngej5K0XZ5f9m5xgTfBqQk76BGvqVBADRvJ
	BBN6Zz4L0h/ix++0cYmKQiuIMSNabAbh8KVjYW0DPL3zynNzBu8ORgpjmbdJHLiN
	MOuGrQ==
Received: from mail-qt1-f200.google.com (mail-qt1-f200.google.com [209.85.160.200])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4fqbmm0wtw-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <devicetree@vger.kernel.org>; Wed, 29 Jul 2026 09:35:58 +0000 (GMT)
Received: by mail-qt1-f200.google.com with SMTP id d75a77b69052e-51c1e777a15so968841cf.2
        for <devicetree@vger.kernel.org>; Wed, 29 Jul 2026 02:35:58 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1785317758; x=1785922558; darn=vger.kernel.org;
        h=content-transfer-encoding:content-type:in-reply-to:from
         :content-language:references:cc:to:subject:user-agent:mime-version
         :date:message-id:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=+r4+xWdHMzsyfScjCV/VxoiA9AqoNvSqUiB8FzN+vwI=;
        b=I/alw/y9lUf8KXAOZWtSsAwBMmi/OZPvBXMu+ijE3oHNsD3eSlNyjSWziQXRXYAkuP
         UgE1dc8cQQ8cQiETXinuSHZeUchZlReDXtImXEwi10cImK14QxXmvMzFtZxiJ22T6xQ6
         VOYoTAfoyHRhr+54EV9TAS6TeM92NG7bjI1TO8j0t3wOgJO24xtb41I33Dy5DUtktRMU
         ZQIV1xwE6H7l2YwCJ1W4rM/SWQownaN+7g6hnbJ99qszWsK6Nt3s0ZyQZ2+tNkrHL8Mt
         LJAMoD4SeCkD0XqT9YMLL4/AQMZIuYduN9VXYp1CJDJdFQM2D06+ZTpKDnzpKjhZcBG/
         e7/w==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1785317758; x=1785922558;
        h=content-transfer-encoding:content-type:in-reply-to:from
         :content-language:references:cc:to:subject:user-agent:mime-version
         :date:message-id:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=+r4+xWdHMzsyfScjCV/VxoiA9AqoNvSqUiB8FzN+vwI=;
        b=Rmm5XAAMPqhRWvFOummg+bJCLhFIxlR7XfmwaPOFRYzB3G6Ud06iIcHZ7nk4Z072Tz
         Y4/5Tb+itrlqVge9WUjdJY2IhyYUuhHJEIN5aZtQWdU44AI7Rv5XupOB6AbxuY/2NlNl
         PDJJIa72UMfOzJt83TUkToRkHPNFVFeyH1kIDYua6TSi/XjS5eSv2possVbuUAlh4JjM
         5geVs5FA9FqbuGh93H7ZmpHaJwiClnhoy38+KYxWZ09qqLtAjye9jJsQ82QAsDW3WZBR
         A2Hqbmi4nwXGJebqSDoHjlqIFbY9Vg2bzN/oqSmkE8ZJYAfosFtAJX821bKO2abYMJzb
         c0/Q==
X-Forwarded-Encrypted: i=1; AHgh+RrXpSXsSw7r0OG5+6/WFUBHxVf48xm+E36Wmtkp3R2pDLTPK1Rl67Ix0Oi5mIM0O9hgFoD39Icrn0Gk@vger.kernel.org
X-Gm-Message-State: AOJu0YzDJIrKJe7fsqBqaIUaM23k9nE/HiA99SbQXKOr9Pq/V0DICEER
	a/r23Mrr6hlxptGKiNNCOii0cYTE5yRnD2cTdEaxuhRfjXEBqzoxEjFPOLlcrW/p5D7SZ047ti3
	3jN6yT6g/c9jKwg9gUnVrDGUEjS7unnfaYR0bepMXpyJC7uC7py4Wqexi4RflewsK
X-Gm-Gg: AR+sD10mlaz3mcOmmnxTiL+mdg54vGzviWtcaazrmWLw4AG9vHcB78+RILSixdUq+fy
	vJvl78okk637H33rYZqMoUtCjEWeQhTbeumRQuoU5cF/Kchv0/W/vZ5SAleZSbLYeDApN1wUx7l
	riRAtuiaCOB/Bn6HYuGdyyhdWotXpzB67HNGlyXag+AHFgwMMRLmUWxArQrzdZCBPT6wjFlmmhV
	qBWXk0Rh+DJbKDjLCacREZlrdSQfg7hxLGMl12TL44+Rl1ZbHpJwbitngpRjbLHpbw4iPruqURd
	EFjvpW0tLx4S093Tudd2N1uQxecsk4mjwIRdjorsBCkjXRypJOFX2gUku72gwIWG0tNjbvTJRjw
	rThZ+zo942oCu/1zspeMnUs/q
X-Received: by 2002:a05:622a:aa10:20b0:51b:eab3:4ef1 with SMTP id d75a77b69052e-529df81bfd9mr45433071cf.4.1785317757841;
        Wed, 29 Jul 2026 02:35:57 -0700 (PDT)
X-Received: by 2002:a05:622a:aa10:20b0:51b:eab3:4ef1 with SMTP id d75a77b69052e-529df81bfd9mr45432871cf.4.1785317757410;
        Wed, 29 Jul 2026 02:35:57 -0700 (PDT)
Received: from [192.168.120.193] ([178.235.128.140])
        by smtp.gmail.com with ESMTPSA id a640c23a62f3a-c1f83fb1189sm88133866b.47.2026.07.29.02.35.54
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Wed, 29 Jul 2026 02:35:56 -0700 (PDT)
Message-ID: <0267f9d0-f2ab-4b54-9989-37902bd5b066@oss.qualcomm.com>
Date: Wed, 29 Jul 2026 11:35:53 +0200
Precedence: bulk
X-Mailing-List: devicetree@vger.kernel.org
List-Id: <devicetree.vger.kernel.org>
List-Subscribe: <mailto:devicetree+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:devicetree+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v3 1/2] arm64: dts: qcom: eliza: Add LPASS macro and
 SoundWire support
To: Ravi Hothi <ravi.hothi@oss.qualcomm.com>,
        Bjorn Andersson <andersson@kernel.org>,
        Konrad Dybcio <konradybcio@kernel.org>, Rob Herring <robh@kernel.org>,
        Krzysztof Kozlowski <krzk+dt@kernel.org>,
        Conor Dooley <conor+dt@kernel.org>
Cc: linux-arm-msm@vger.kernel.org, devicetree@vger.kernel.org,
        linux-kernel@vger.kernel.org, mohammad.rafi.shaik@oss.qualcomm.com,
        ajay.nandam@oss.qualcomm.com
References: <20260723121516.2341900-1-ravi.hothi@oss.qualcomm.com>
 <20260723121516.2341900-2-ravi.hothi@oss.qualcomm.com>
Content-Language: en-US
From: Konrad Dybcio <konrad.dybcio@oss.qualcomm.com>
In-Reply-To: <20260723121516.2341900-2-ravi.hothi@oss.qualcomm.com>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit
X-Proofpoint-GUID: 3AxzzrutUlhxCU_RgwktjBOZFMgKgEbS
X-Proofpoint-ORIG-GUID: 3AxzzrutUlhxCU_RgwktjBOZFMgKgEbS
X-Authority-Analysis: v=2.4 cv=R/Uz39RX c=1 sm=1 tr=0 ts=6a69c97e cx=c_pps
 a=JbAStetqSzwMeJznSMzCyw==:117 a=PRfkaYvzSr8QmIIGAkY2Sg==:17
 a=IkcTkHD0fZMA:10 a=RAioF0-LDSMA:10 a=s4-Qcg_JpJYA:10
 a=VkNPw1HP01LnGYTKEx00:22 a=u7WPNUs3qKkmUXheDGA7:22 a=YMgV9FUhrdKAYTUUvYB2:22
 a=EUspDBNiAAAA:8 a=xONkTBg-w_5Iyyk_CLcA:9 a=QEXdDO2ut3YA:10
 a=uxP6HrT_eTzRwkO_Te1X:22
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYwNzI5MDA3OCBTYWx0ZWRfX3B0wGwhMiYR8
 rZEgyEAWG9Oec0KlpUMrHw7D1lF387WD+8a8zHYakC3Ph2Ak+yrxyT4rrWFg0tyHzqysauFWol7
 waHhtCuIdGBWbHgHUlp/JXyFbdx7EIArLJYCrNk/y9slI5zx8C/3o8H03xomMBXDmcd9Gx2PqJg
 WDd0N5cBaQJ/JtZxYEdkn4RE7F0o1di/43C+sVuUhnhqhx0G28i7F1MiYApcvOeWOTZhtsSARKP
 hY4MkKwbtIlDATAh/HHgoNrSmJfDGtL7Q6wX+pzCpLYDSLBR5iGT8At/BbW2x2bjSp8He2Welku
 yN0SoUb8EJbB/aiX5kdUKCIUEedy6iTO8kMgfKvu3AhluH8X0KyTC7Y0ZPOqZr95o+wby7n+MfB
 gvyS/IfYFR4OJ34qBs9Helz/5EePESiEqJ284LthkhZJ+JnfihIuG6kF2brGRp9lHb+I5BYQlpP
 LUB0mfgJwo/NCItkv7Q==
X-Proofpoint-Spam-Info: AW1haW4tMjYwNzI5MDA3OCBTYWx0ZWRfX2R4oju5tW9bA
 LJ/IXPt0gt7U+MqM51lD7ZQpog7Ja9w+ClNR72D+NLfazsGYm6tjkXzdolCwW3KOY5uDRb3qZjm
 Lw+buKw85Nu+2pvVdSaD97iRBkJ6zmY=
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1143,Hydra:6.1.134,FMLib:17.12.100.49
 definitions=2026-07-29_03,2026-07-28_02,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 spamscore=0 adultscore=0 suspectscore=0 malwarescore=0 bulkscore=0
 impostorscore=0 lowpriorityscore=0 phishscore=0 clxscore=1015
 priorityscore=1501 classifier=typeunknown authscore=0 authtc= authcc=
 route=outbound adjust=0 reason=mlx scancount=1 engine=8.22.0-2606150000
 definitions=main-2607290078

On 7/23/26 2:15 PM, Ravi Hothi wrote:
> Add SoC-level LPASS WSA macro, VA macro, SoundWire controller and LPASS
> LPI pin controller nodes. DMIC and WSA SoundWire pinctrl states are
> defined inside the LPASS LPI pin controller node. The hardware is similar
> to the SM8750 platform.
> 
> The WSA macro, VA macro and SoundWire controller are kept disabled so
> board DTS files can selectively enable and configure them.
> 
> Signed-off-by: Ravi Hothi <ravi.hothi@oss.qualcomm.com>
> ---

[...]

> +		lpass_wsamacro: codec@6b00000 {
> +			compatible = "qcom,eliza-lpass-wsa-macro",
> +				     "qcom,sm8550-lpass-wsa-macro";
> +			reg = <0x0 0x06b00000 0x0 0x1000>;
> +
> +			clocks = <&q6prmcc LPASS_CLK_ID_WSA_CORE_TX_MCLK
> +					   LPASS_CLK_ATTRIBUTE_COUPLE_NO>,
> +				 <&q6prmcc LPASS_HW_MACRO_VOTE
> +					   LPASS_CLK_ATTRIBUTE_COUPLE_NO>,
> +				 <&q6prmcc LPASS_HW_DCODEC_VOTE
> +					   LPASS_CLK_ATTRIBUTE_COUPLE_NO>,
> +				 <&lpass_vamacro>;
> +			clock-names = "mclk",
> +				      "macro",
> +				      "dcodec",
> +				      "fsgen";
> +
> +			#clock-cells = <0>;
> +			clock-output-names = "mclk";
> +			#sound-dai-cells = <1>;
> +
> +			status = "disabled";

All macros (but not swr hosts) are usually enabled by default on other
socs, let's do the same here

Konrad
