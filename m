Received: from mx0b-0031df01.pphosted.com (mx0b-0031df01.pphosted.com [205.220.180.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id D9288364958
	for <devicetree@vger.kernel.org>; Thu,  2 Apr 2026 09:07:37 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.180.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1775120860; cv=none; b=F777f6QTHaa4Lt8w1edzuo5GV/XCoSRVVpzr2D0QFlzVl7nk3Tu1jZi4R5oPFl4Bme7mSMB0us6bmBY0vpRKUvbXBAqxGVCSU6UcGipZJsMD5d8S9yB6ML245LSsTMHFWkkZda3KkArHKAfvSDZv71CWE2H94PfEn6Sz/4gvP0E=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1775120860; c=relaxed/simple;
	bh=Up3MNq8a8YgpJydhUUpKFvy7IhhdCuy0+sVystVoO9o=;
	h=Message-ID:Date:MIME-Version:Subject:To:Cc:References:From:
	 In-Reply-To:Content-Type; b=FRe9DaMpIXtOsL2aExePSNArpzHv8XN8DLajYesvKQiPQqd0QvhOodzHNHHt1UucdnJ6IDmiu9UE3b6wk51cw/ocAnXuyMTXYQH+VVZfkc5VAp4DQPz8xM2cxvQJS2/Dyqfx+mQobYfTgv08sOX1b1KV+eYToGkSc3aGKCexV7U=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=FS/gI+D7; dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b=Q3B+MVp5; arc=none smtp.client-ip=205.220.180.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b="FS/gI+D7";
	dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b="Q3B+MVp5"
Received: from pps.filterd (m0279871.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 6325VfNP091589
	for <devicetree@vger.kernel.org>; Thu, 2 Apr 2026 09:07:37 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	jNL23KRNx3VBPsO3Bq3eEcdp1pYh7Ktco7ToNFPO8S0=; b=FS/gI+D7PaVgJH+I
	ZP74fJfkkxV/y8tNJmP8nn8+DgHOw2phnsu69oIr9nECcob6/zuDhEcZo9yzdUcv
	87wS6kKIF720D2e8FufsYZ9JxucdqlxQvkqTtKG186YOS7Ez5nQvz0UcNtcUMW7L
	PUU0XT2PrYAVSMLD8jbP4xSYMCZYidjJ0UdBgme3eLYzbgkxMfj9uN8ChIjOybyH
	KHIrAKfDT0x4vNf9XKssASy0x+XPL3+DA9RqViZG32byTy/JuMe3mLCLAWboqo4x
	UdebWmsIyuchhZa3/c1AYufQ5gyekjEDh/tPV7rPIWXwpornIrvwRqYAk4dCJv5U
	AGpDfA==
Received: from mail-pf1-f197.google.com (mail-pf1-f197.google.com [209.85.210.197])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4d9jcu8va8-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <devicetree@vger.kernel.org>; Thu, 02 Apr 2026 09:07:36 +0000 (GMT)
Received: by mail-pf1-f197.google.com with SMTP id d2e1a72fcca58-82a88a2704fso364546b3a.0
        for <devicetree@vger.kernel.org>; Thu, 02 Apr 2026 02:07:36 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1775120856; x=1775725656; darn=vger.kernel.org;
        h=content-transfer-encoding:in-reply-to:from:content-language
         :references:cc:to:subject:user-agent:mime-version:date:message-id
         :from:to:cc:subject:date:message-id:reply-to;
        bh=jNL23KRNx3VBPsO3Bq3eEcdp1pYh7Ktco7ToNFPO8S0=;
        b=Q3B+MVp5buTncqpaNh/1sgQwK0UtfRsMAfK6Wbp6ITf8ddhFQ9h1xYmGOXNnyByUAL
         WfPUAovzqXpH5r7WJurljFvBiBpVW+MkNOkmdVnnB9A8cQtEML3nUgk8p3vC4MkJqAmk
         vHM5+FurawDN6/cg25rOeA7DY/9rxcxUYPNlAmygUhGVhnm+3z4ODMyzRCSYqjgKpB6g
         cPT0+2FvyohAZ2QfnGSk6L2WwNu6NbpQLpMjP3G7h5I6sMI3UlE5IEPfOZ8bo5bjXdpo
         40YIIb8i0jyRw9QBqwE4TGG3t4K9maXBFYw4Zb+dEvwZJf9gxFIJ3+7CktUuM+vSUAMD
         a5Bg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1775120856; x=1775725656;
        h=content-transfer-encoding:in-reply-to:from:content-language
         :references:cc:to:subject:user-agent:mime-version:date:message-id
         :x-gm-gg:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=jNL23KRNx3VBPsO3Bq3eEcdp1pYh7Ktco7ToNFPO8S0=;
        b=JJo1nf36yr1Q/JCeDpJvYh663O/Arp0RW1L87rUA0T2CDR379VbRFshBBZvRi1EDEB
         jJdj0+BGwUUPuAo+bH1vj8x72imJitkCtzBQTk3QPBl6Kjk/6Fk6M8pZTDYiPC+ryLtR
         1wMvp4pob2Gd7HVlY84xW7623/cf55KG8Rz7umLFOsnIjw7VhElDHqumopg+S4vvNHYa
         /MoJY7AHdzeoXKaWusjXfQPrNi6iAGbsvoK0ZeUjSauLbbUnkisukTWHsNTSfjl9BlSZ
         +SC46NTdWPqWfDOh1DMj1isVZxxsaBEfN59dLpvxXDjz3/pCi2KHqitO/uKU7hfdLSW8
         PxNw==
X-Forwarded-Encrypted: i=1; AJvYcCU+4hmiUiAAapqX2n7new8JH+SodTFDuQQThxNV3/0YKcvizT73Wa0KlXBsagdtSakD6zSUzSJLTMq3@vger.kernel.org
X-Gm-Message-State: AOJu0Yx6ySXrZupzxvNDPv8UeFBrso5rL6+pcsNi2YIuIvZbyYD/tvfU
	ocobBYxx4lFvCVgF657trU2buPnzfAkPOjNTQyb3TqiOiC78g9u7SNTAHihURKmYbulqdY4VTnw
	ImnqGrAzfGRlC9CcrPF4ema/KMz6Vfz+f9x0R78nZjcMT2F5M7WOcCf0tYgNAbBGx
X-Gm-Gg: ATEYQzygQcf/hrnK05PvRwLCQ9tFuWRt5DCSQNqFErlDNmWuW9nvtzr0lpiFjcep5Z9
	TVrWzXJiWwGRFmW2LBJSFd5mH2wPTu/OWyEi3jnUbDGqI+MAE0EyB3sT+xFC+NenJ/dFiaBvRip
	70uNiNh3a/PH25sxG9ZhxrB+NGsipB+6iIBWI4+Bzrz11ijUQfo+GJpWdjxvDDHloPLh1mqMizD
	4uLney63q+tLo0iohM8tmq+vomkw5kiR/+tr3oRDQ+o6XFyTKdZx8+gB/Qcc4v0XM/5xvmVl1QB
	x7HgfGpOfATpk2fMpG95lcaa5cBRf//pDngtf4xxIzM38LTTVs/FZbTLIRn47MhztlH7qZfop8j
	jBC4nuVlpd9I4KTdJAThUKc2ybcpDusAtofk6MitD31wrLt5HWS6f
X-Received: by 2002:a05:6a00:c8b:b0:827:32dd:59c5 with SMTP id d2e1a72fcca58-82d0038878bmr1984192b3a.28.1775120855742;
        Thu, 02 Apr 2026 02:07:35 -0700 (PDT)
X-Received: by 2002:a05:6a00:c8b:b0:827:32dd:59c5 with SMTP id d2e1a72fcca58-82d0038878bmr1984156b3a.28.1775120855310;
        Thu, 02 Apr 2026 02:07:35 -0700 (PDT)
Received: from [10.218.44.178] ([202.46.22.19])
        by smtp.gmail.com with ESMTPSA id d2e1a72fcca58-82cf9b272bdsm2480282b3a.12.2026.04.02.02.07.31
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Thu, 02 Apr 2026 02:07:34 -0700 (PDT)
Message-ID: <0b8a2c10-c74b-4126-bd44-b36f85db1aa8@oss.qualcomm.com>
Date: Thu, 2 Apr 2026 14:37:30 +0530
Precedence: bulk
X-Mailing-List: devicetree@vger.kernel.org
List-Id: <devicetree.vger.kernel.org>
List-Subscribe: <mailto:devicetree+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:devicetree+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v6 3/3] arm64: dts: qcom: monaco: enable the inline crypto
 engine for SDHC
To: Neeraj Soni <neeraj.soni@oss.qualcomm.com>, ulf.hansson@linaro.org,
        robh@kernel.org, krzk+dt@kernel.org, conor+dt@kernel.org,
        andersson@kernel.org, konradybcio@kernel.org
Cc: linux-mmc@vger.kernel.org, devicetree@vger.kernel.org,
        linux-kernel@vger.kernel.org
References: <20260310113557.348502-1-neeraj.soni@oss.qualcomm.com>
 <20260310113557.348502-4-neeraj.soni@oss.qualcomm.com>
Content-Language: en-US
From: Kuldeep Singh <kuldeep.singh@oss.qualcomm.com>
In-Reply-To: <20260310113557.348502-4-neeraj.soni@oss.qualcomm.com>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYwNDAyMDA4MSBTYWx0ZWRfX9KtI59nei8C+
 tkVZggj2ry+eyxVaP2FiJ3eppEo5vYcs2loqCGyhi8TuzKEaSIPKFxduOqqR3iwg4CnK+Bpdani
 qNIS5hy86jyWX1viDFFWIJsI5heCqJENs9bLHglyQgh4uoMcJ2JKxL5TSvEjHFt1BfkwEewxCkG
 fI7b8E1ipD4K76FFCubr8SyHb4yth6LRpK0hbij1LTqqkLbvKg1y2oY8JKT4EuDpkUSiqctjkiZ
 wU1MmzV7RSIqUQFnKY6xL1opLfBUewgWQja7Y2PyX5Q910pr4hbafzqchDAJvEhNBFYWSnelmeu
 UfaD/jA991MKHh3Y8z5+LS1CAyE31zy0yipgQ6mfNzhvaI0lZt14uNCe6gYKf0qz6DVtEvGJMss
 cAHBfI5SgFJK/KpuTj99qG0sZ4i78zGWhu7W53o/F6VM/K0P/yfLAillsc6a6RkFaIR07AD3LSC
 2C3K4CJi/IHKBQxqdEw==
X-Proofpoint-GUID: DkeKf73MNblQ6cBk_QwONVdhBKx8uGFz
X-Authority-Analysis: v=2.4 cv=eYYwvrEH c=1 sm=1 tr=0 ts=69ce31d8 cx=c_pps
 a=rEQLjTOiSrHUhVqRoksmgQ==:117 a=fChuTYTh2wq5r3m49p7fHw==:17
 a=IkcTkHD0fZMA:10 a=A5OVakUREuEA:10 a=s4-Qcg_JpJYA:10
 a=VkNPw1HP01LnGYTKEx00:22 a=u7WPNUs3qKkmUXheDGA7:22 a=3WHJM1ZQz_JShphwDgj5:22
 a=EUspDBNiAAAA:8 a=QNBTSuZnymOEHSKAjgQA:9 a=QEXdDO2ut3YA:10
 a=2VI0MkxyNR6bbpdq8BZq:22
X-Proofpoint-ORIG-GUID: DkeKf73MNblQ6cBk_QwONVdhBKx8uGFz
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1143,Hydra:6.1.51,FMLib:17.12.100.49
 definitions=2026-04-02_01,2026-04-02_01,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 suspectscore=0 priorityscore=1501 lowpriorityscore=0 phishscore=0
 impostorscore=0 malwarescore=0 bulkscore=0 adultscore=0 clxscore=1015
 spamscore=0 classifier=typeunknown authscore=0 authtc= authcc= route=outbound
 adjust=0 reason=mlx scancount=1 engine=8.22.0-2603050001
 definitions=main-2604020081

On 3/10/2026 5:05 PM, Neeraj Soni wrote:
> Add an ICE node to monaco SoC description and enable it by adding a
> phandle to the SDHC node.
> 
> Signed-off-by: Neeraj Soni <neeraj.soni@oss.qualcomm.com>
> ---
>  arch/arm64/boot/dts/qcom/monaco.dtsi | 9 +++++++++
>  1 file changed, 9 insertions(+)
> 
> diff --git a/arch/arm64/boot/dts/qcom/monaco.dtsi b/arch/arm64/boot/dts/qcom/monaco.dtsi
> index 816fa2af8a9a..365af78b01ae 100644
> --- a/arch/arm64/boot/dts/qcom/monaco.dtsi
> +++ b/arch/arm64/boot/dts/qcom/monaco.dtsi
> @@ -4202,6 +4202,8 @@ &mc_virt SLAVE_EBI1 QCOM_ICC_TAG_ALWAYS>,
>  			supports-cqe;
>  			dma-coherent;
>  
> +			qcom,ice = <&sdhc_ice>;
> +
>  			status = "disabled";
>  
>  			sdhc1_opp_table: opp-table {
> @@ -4229,6 +4231,13 @@ opp-384000000 {
>  			};
>  		};
>  
> +		sdhc_ice: crypto@87c8000 {
> +			compatible = "qcom,qcs8300-inline-crypto-engine",
> +				     "qcom,inline-crypto-engine";

Same comment as patch 2/3.

Reviewed-by: Kuldeep Singh <kuldeep.singh@oss.qualcomm.com>

-- 
Regards
Kuldeep

