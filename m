Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=205.220.168.131
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1795066959;
	b=lYGDBvRIv7367KphSWZd+KHisJ8EYg4eIWFGR7WuaXpTdDBywL/kqDTSgCcj7lD5SG0o
	 WZkeF3ma8fZwck07ev/f9bz9qnM4NlPevEzmIud0cHWYFRWcgtGV7Urf30mPRH8Xo7x9f
	 QFugQD/P6wfoAsAAYE7VvM7+s/2FhCZCvnhdDltuOUeW9rpS5l9ftT0bfP/usB//aHFHq
	 Dh5P2Y/x8yns0QmKJmDGhedHIjIWB3+lkdNF1TZW/J5X9xY6L2U7OHRio0Y9HCKsGYg6l
	 f+VNuXdZ6Yhze8nuNL/Qq3FrMHSDmQlmVtcuojAV/qwhP69QED12LmRBNpOBSXAfP1A==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1795066959;
	h=DMARC-Filter:Received:DKIM-Signature:Received:Received:
	 DKIM-Signature:X-Google-DKIM-Signature:X-Forwarded-Encrypted:
	 X-Gm-Message-State:X-Gm-Gg:X-Received:X-Received:Received:Message-ID:
	 Date:MIME-Version:User-Agent:Subject:To:Cc:References:
	 Content-Language:From:In-Reply-To:Content-Type:
	 Content-Transfer-Encoding:X-Authority-Analysis:X-Proofpoint-ORIG-GUID:
	 X-Proofpoint-Spam-Details-Enc:X-Proofpoint-GUID:
	 X-Proofpoint-Spam-Info:X-Proofpoint-Virus-Version:
	 X-Proofpoint-Spam-Details;
	bh=RKJl+ABzMH0LdlBRBqskNpw/RH4rFfVp+FcQkSOVlss=;
	b=A+STlNB40Y8njA4cpozFPqIFLMPVDZMmou71SyFEMyoip85eDXpFXbrwv3/YVepyvvaU
	 nC++8iHxjaefXHMTLpqocvTBoN4iOAArhWT3ymUQ9n1VRR6AC4FfQ8VZWChy1vgKDa8vs
	 54tN32yAiaLkTxejuptK2RqQtlG3cT05HTBsVA3RtnWrX1YiBjXFcTAytwaV/FQw0+tOV
	 E3abB6L1UoeGjgMloFPSOQTgyNBvgemvsnF+9XZP7/MW2yhVUb5lWq9GiWd5ILEJEhwIF
	 AjghEeN2pguW66xX2sDvpTfK12UdGKhv/SbcBWVxRm6IlRHR4cnpLK4OYuqby9xeILw==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=oss.qualcomm.com;
	spf=pass smtp.mailfrom=oss.qualcomm.com;
	dkim=pass header.d=qualcomm.com header.i=@qualcomm.com header.a=rsa-sha256 header.s=qcppdkim1 header.b=hNFM+4Rl;
	dkim=pass header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.a=rsa-sha256 header.s=google header.b=bXKNL6Yz;
	arc=none smtp.remote-ip=205.220.168.131
Received: from mx0a-0031df01.pphosted.com (mx0a-0031df01.pphosted.com [205.220.168.131])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id D251C606A326
	for <devicetree@vger.kernel.org>; Thu, 19 Nov 2026 05:42:38 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org D251C606A326
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.a=rsa-sha256 header.s=qcppdkim1 header.b=hNFM+4Rl;
	dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.a=rsa-sha256 header.s=google header.b=bXKNL6Yz
Received: from pps.filterd (m0279863.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 6AJ1Ao7M1215573
	for <devicetree@vger.kernel.org>; Thu, 19 Nov 2026 05:42:38 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	RKJl+ABzMH0LdlBRBqskNpw/RH4rFfVp+FcQkSOVlss=; b=hNFM+4RluyqC7Y7o
	6eqxKKPkk65OeIDblcJxlRNwXG7ua5g7m69VUM6vNbo9tdXgdYsCV1kBj+ZZNkN9
	HZwoeiEUBcdFiPc86+Sxxba2Rij50g/ChHroBauKWo5IUPBT3Ab2fS3Ol9aC6kWj
	W2dEcdWS/3VbfjJcO72YQ7gTevCC+HQf+QgFtahnLwDNJ3FI2geL9hJxIyfLgNGR
	+nOs59aw73Zi2SLI+grgNLp65QEYf5gOfFZh2iqR/oDuAIaoDr9jgoh/nMhRBXEn
	U/qIfQHkoJ2YBd/0lNg4topu3pC/YlgqAKB5RZaHhZnsEG8FcVGR9T7ZXabReOOa
	Orgyhw==
Received: from mail-pj1-f70.google.com (mail-pj1-f70.google.com [209.85.216.70])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4j1gxcthcs-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <devicetree@vger.kernel.org>; Thu, 19 Nov 2026 05:42:38 +0000 (GMT)
Received: by mail-pj1-f70.google.com with SMTP id 98e67ed59e1d1-3b0a7cbf164so1736934a91.3
        for <devicetree@vger.kernel.org>; Wed, 18 Nov 2026 21:42:38 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1795066957; x=1795671757; darn=vger.kernel.org;
        h=content-transfer-encoding:content-type:in-reply-to:from
         :content-language:references:cc:to:subject:user-agent:mime-version
         :date:message-id:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=RKJl+ABzMH0LdlBRBqskNpw/RH4rFfVp+FcQkSOVlss=;
        b=bXKNL6YzeJOfo0aOOAcwy7TLsrZIb8UoQaiuL57HCzUQ660ttThNA+XP10XxqKDAwq
         Ivdwgk+LMrYM7ZqC5moazg4U/nnlQYEmGWZahdYsFFIGNJvdxAdKYiXC40ELOP5DU2/X
         NMzXjKpAzDMk02er2BZxplnm1TocpqkIuaAP8JuBH6KzrZCPR2s6fZS+p7nZqc7YUasM
         +WKE++ttf+2LZXhbuHrNuY2siaX64+ujuBA6vB1fp3GXCUrvd5W0BF41+AwdCMuZm8Uj
         DGiMbQf+RjgYCqsWXd1gqM3X0Gbio6vxpRi8KvxlcCyYNY4X9eC1JBJxZAqHzkm/9y+y
         5eZQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1795066957; x=1795671757;
        h=content-transfer-encoding:content-type:in-reply-to:from
         :content-language:references:cc:to:subject:user-agent:mime-version
         :date:message-id:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=RKJl+ABzMH0LdlBRBqskNpw/RH4rFfVp+FcQkSOVlss=;
        b=qLGi+GLEU0E+Mr2DDkEgsUVimYnqYIFE0o/8JHKBP7/Qs6YbHbZ5vdXCDd5K2bW7AB
         4bplROVHHdnrBUSiqWU1v9D/FLzKC2cVqer0LitBg2p6D6+E8mc0XoUYAV5ZpUuuWd7b
         UFlxNKI5cchRc/WInR4qQwB319SJPAximj7uvIyeZrkDN0dJND+WGfuHGVFb0bum03iL
         PPBqMUrEgxWuJBbV4ndMq6jvWHAokoAQkmmGkL9b6UvObBSnP+jLx638gjRkgRLXRv25
         wVQU4tcyfx5gKK4ng1xRv9u70fuOv8P6mLtMw0zLnyflxKJFvIuJN3JlnUEd/f/RmnII
         Huzw==
X-Forwarded-Encrypted: i=1; AL+hErFUjO6U2nQ0uWVBADQHi30ZxkxoWtX/c5KYflHRApGHikanwlIA9uPLodi7H563ly6jldfwGgZyURl/@vger.kernel.org
X-Gm-Message-State: APuU4Z9A9unFUvla0YV+sBUDbgkqDdp3Qt6+wD+QpXpZsCYY7DHYqkmb
	pCXZBg1SynRPU1UjxaKC0wy4GG/eTyjvLHUJVeHjcqnJyVfjZNUIzT6YWBwUtwS/bzbi6t7fKMk
	UvLL1kv82vkGPc1jeiBHWZQltRR4XjgvTXzodfj2fVybGPs1FinaVSQU99+uJbP4T
X-Gm-Gg: AZFdTZf1cQ26HK3vRMbD4+NNJLEG1XmmO7fXKOAv/QYEwGszxplwBYAe62lG+ST2LtM
	TC66T8Fne5jBTa39dz5kmpaeQMah8LXjxCK2vIGhGOZWX8f342SOpQlYdFTrf43uYY8Lr+C2mv3
	pVAu/Sk9WuNsBsQgl3P3CBY6f9/5yQCk4P6A+WIVkeJEMqfl1bgR26BDtwks6mkAWFeI8+JZZHw
	SYtkM7pU0gDhrEO5rs1U4ihRZCrr+Mm4v/JzSMcgg1t0WBPtIq1AMLGj2u80WbrD4f+wDXM/nQJ
	vUN7G25J3VGvDnqiHk69DDwjjyBARpUciVa5e2tAXzvO+Yj1GoCDHeDFx8ZcaDuIYpKDYl9jFib
	pyIEcf5M24AhCxKsbHCGt0/W32azNh5awDZoa/Hddq+LHVEPoFALGjkIZxxtEPzOkHgU1hj80UH
	7QsZTrHkVwY295GSLfUrq1mFbI0lYOBnzjbcoTjRoUpg==
X-Received: by 2002:a17:90b:52:b0:3b3:b9e4:e3f5 with SMTP id 98e67ed59e1d1-3b3d07b92a0mr4740714a91.30.1795066957428;
        Wed, 18 Nov 2026 21:42:37 -0800 (PST)
X-Received: by 2002:a17:90b:52:b0:3b3:b9e4:e3f5 with SMTP id 98e67ed59e1d1-3b3d07b92a0mr4740693a91.30.1795066956923;
        Wed, 18 Nov 2026 21:42:36 -0800 (PST)
Received: from [10.133.33.81] (tpe-colo-wan-fw-bordernet.qualcomm.com. [103.229.16.4])
        by smtp.gmail.com with ESMTPSA id 98e67ed59e1d1-3b405d63728sm848634a91.8.2026.11.18.21.42.34
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Wed, 18 Nov 2026 21:42:36 -0800 (PST)
Message-ID: <93bbc219-5706-4e3f-87c1-ddeeb8f11df4@oss.qualcomm.com>
Date: Thu, 19 Nov 2026 13:42:33 +0800
X-Mailing-List: devicetree@vger.kernel.org
List-Id: <devicetree.vger.kernel.org>
List-Post: <mailto:devicetree@vger.kernel.org>
List-Help: <mailto:devicetree+help@vger.kernel.org>
List-Subscribe: <mailto:devicetree+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:devicetree+unsubscribe@vger.kernel.org>
List-Owner: <mailto:devicetree+owner@vger.kernel.org>
Precedence: list
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH 1/2] arm64: dts: qcom: maili-mtp: Add WCN7850 WLAN support
To: Yijie Yang <yijie.yang@oss.qualcomm.com>,
        Bjorn Andersson <andersson@kernel.org>,
        Konrad Dybcio <konradybcio@kernel.org>,
        Abel Vesa <abelvesa@kernel.org>, Rob Herring <robh@kernel.org>,
        Krzysztof Kozlowski <krzk+dt@kernel.org>,
        Conor Dooley <conor+dt@kernel.org>
Cc: linux-arm-msm@vger.kernel.org, devicetree@vger.kernel.org
References: <20261118-wlan-bt-v1-0-18bb1b059a17@oss.qualcomm.com>
 <20261118-wlan-bt-v1-1-18bb1b059a17@oss.qualcomm.com>
Content-Language: en-US
From: Jingyi Wang <jingyi.wang@oss.qualcomm.com>
In-Reply-To: <20261118-wlan-bt-v1-1-18bb1b059a17@oss.qualcomm.com>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit
X-Authority-Analysis: v=2.4 cv=LZapeTfi c=1 sm=1 tr=0 ts=6afe8c4e cx=c_pps
 a=0uOsjrqzRL749jD1oC5vDA==:117 a=nuhDOHQX5FNHPW3J6Bj6AA==:17
 a=IkcTkHD0fZMA:10 a=zJRp6_cAMcgA:10 a=s4-Qcg_JpJYA:10
 a=VkNPw1HP01LnGYTKEx00:22 a=u7WPNUs3qKkmUXheDGA7:22 a=yOCtJkima9RkubShWh1s:22
 a=EUspDBNiAAAA:8 a=vRUFK8mIlklHSIi4FnMA:9 a=QEXdDO2ut3YA:10
 a=mQ_c8vxmzFEMiUWkPHU9:22
X-Proofpoint-ORIG-GUID: 8uVeYV4BmYg8uZN2HY4bdYqz6hwoNBNa
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYxMTE5MDAyMiBTYWx0ZWRfX9xvBlwREBhse
 o/BdTw7XfrgOvTy/gOI7YcLSor2TFFd7yrWo8ffTXRS0tWcBvYqSOHNSlfmdbccQ+T8OavmVSD9
 M4aynrwvVOdu7tytktho8HIhzObGled3yLYrQmmy9A94nftCQot3SqA/Y8gD2ZjNe4b8RAnATNR
 r11HhIB06xqbahKE9aQWaRu9AFf3xn5MdgUq0fMp2uAkhkK5i8hy59zKN+XEo8dIa0vsXVw7Wsd
 6yMgdgTbtki4Xz9KAWauTVJ0HWIM7D6JH9iQAGbyj7tB3P/P/RL8v1e3qsgbMf1zQ6ENwvNTB+8
 buv5OUKhU9ZtyK/BkpdMLzl2kKz4qVZKqYZsyvuozzvjHouA+Ng/EzHYL5jdPJ+XTEDM057bD6Q
 +8PWYt8rDQlCCbn7q74LLEehr0Zp0UHqI/hUI3zi1fX6Fko4+cFXIhhmKR2XRfIkirVx3ja8moL
 4C1iDCYgVmgsoSazONA==
X-Proofpoint-GUID: 8uVeYV4BmYg8uZN2HY4bdYqz6hwoNBNa
X-Proofpoint-Spam-Info: AW1haW4tMjYxMTE5MDAyMiBTYWx0ZWRfXzojQUg/R8J/I
 H/5XU381Fl3UmRpehMdd++N5VQWwlmy+EtPDirp2DL4JIx1U2Eag0P/IklfzGhnSrzjnMGSxrgY
 WONh8WQrEPC1/uiDsWtOa64ekHW8MRM=
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1176,Hydra:6.1.138,FMLib:17.12.100.49
 definitions=2026-11-19_01,2026-11-16_01,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 malwarescore=0 spamscore=0 phishscore=0 priorityscore=1501 suspectscore=0
 bulkscore=0 adultscore=0 impostorscore=0 lowpriorityscore=0 clxscore=1015
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.22.0-2611040001 definitions=main-2611190022



On 11/18/2026 11:33 AM, Yijie Yang wrote:
> Enable WCN785x Wi-Fi on Maili MTP board.
> 
> Signed-off-by: Yijie Yang <yijie.yang@oss.qualcomm.com>
> ---
>   arch/arm64/boot/dts/qcom/maili-mtp.dts | 88 ++++++++++++++++++++++++++++++++++
>   1 file changed, 88 insertions(+)
> 
> diff --git a/arch/arm64/boot/dts/qcom/maili-mtp.dts b/arch/arm64/boot/dts/qcom/maili-mtp.dts
> index 5409d0a7ec2e0..a3c2016eb9053 100644
> --- a/arch/arm64/boot/dts/qcom/maili-mtp.dts
> +++ b/arch/arm64/boot/dts/qcom/maili-mtp.dts
> @@ -142,6 +142,63 @@ sdcard_vdd_3p0: sdcard-vdd-3p0 {
>   
>   		vin-supply = <&vreg_bob1>;
>   	};
> +
> +	wcn7850-pmu {
> +		compatible = "qcom,wcn7850-pmu";
> +
> +		pinctrl-0 = <&wlan_en>, <&sw_ctrl_default>;
> +		pinctrl-names = "default";
> +
> +		wlan-enable-gpios = <&pmh0104_c_e0_gpios 7 GPIO_ACTIVE_HIGH>;
> +
> +		vdd-supply = <&vreg_s1j_0p8>;
> +		vddio-supply = <&vreg_l2d_1p8>;
> +		vddio1p2-supply = <&vreg_l4g_1p2>;
> +		vddaon-supply = <&vreg_s9d_1p0>;
> +		vdddig-supply = <&vreg_s3c_1p2>;
> +		vddrfa1p2-supply = <&vreg_s9d_1p0>;
> +		vddrfa1p8-supply = <&vreg_s7g_1p2>;
> +
> +		clocks = <&rpmhcc RPMH_RF_CLK1>;
> +
> +		regulators {
> +			vreg_pmu_rfa_cmn: ldo0 {
> +				regulator-name = "vreg_pmu_rfa_cmn";
> +			};
> +
> +			vreg_pmu_aon_0p59: ldo1 {
> +				regulator-name = "vreg_pmu_aon_0p59";
> +			};
> +
> +			vreg_pmu_wlcx_0p8: ldo2 {
> +				regulator-name = "vreg_pmu_wlcx_0p8";
> +			};
> +
> +			vreg_pmu_wlmx_0p85: ldo3 {
> +				regulator-name = "vreg_pmu_wlmx_0p85";
> +			};
> +
> +			vreg_pmu_rfa_0p8: ldo5 {
> +				regulator-name = "vreg_pmu_rfa_0p8";
> +			};
> +
> +			vreg_pmu_rfa_1p2: ldo6 {
> +				regulator-name = "vreg_pmu_rfa_1p2";
> +			};
> +
> +			vreg_pmu_rfa_1p8: ldo7 {
> +				regulator-name = "vreg_pmu_rfa_1p8";
> +			};
> +
> +			vreg_pmu_pcie_0p9: ldo8 {
> +				regulator-name = "vreg_pmu_pcie_0p9";
> +			};
> +
> +			vreg_pmu_pcie_1p8: ldo9 {
> +				regulator-name = "vreg_pmu_pcie_1p8";
> +			};
> +		};
> +	};
>   };
>   
>   &apps_rsc {
> @@ -757,6 +814,21 @@ &pcie0_phy {
>   &pcie_port0 {
>   	wake-gpios = <&tlmm 104 GPIO_ACTIVE_LOW>;
>   	reset-gpios = <&tlmm 102 GPIO_ACTIVE_LOW>;
> +
> +	wifi@0 {
> +		compatible = "pci17cb,1107";
> +		reg = <0x10000 0x0 0x0 0x0 0x0>;
> +
> +		vddrfacmn-supply = <&vreg_pmu_rfa_cmn>;
> +		vddaon-supply = <&vreg_pmu_aon_0p59>;
> +		vddwlcx-supply = <&vreg_pmu_wlcx_0p8>;
> +		vddwlmx-supply = <&vreg_pmu_wlmx_0p85>;
> +		vddrfa0p8-supply = <&vreg_pmu_rfa_0p8>;
> +		vddrfa1p2-supply = <&vreg_pmu_rfa_1p2>;
> +		vddrfa1p8-supply = <&vreg_pmu_rfa_1p8>;
> +		vddpcie0p9-supply = <&vreg_pmu_pcie_0p9>;
> +		vddpcie1p8-supply = <&vreg_pmu_pcie_1p8>;
> +	};
>   };
>   
>   &pcie1 {
> @@ -800,6 +872,16 @@ led-1 {
>   };
>   
>   &pmh0104_c_e0_gpios {
> +	wlan_en: wlan-en-state {
> +		pins = "gpio7";
> +		function = "normal";
> +		input-disable;
> +		output-enable;
> +		output-low;
> +		bias-disable;
> +		power-source = <1>;
> +	};
> +

s < w

Thanks,
Jingyi

>   	sd_card_eldo_en: sd-card-eldo-en-state {
>   		pins = "gpio5";
>   		function = "normal";
> @@ -906,6 +988,12 @@ &tlmm {
>   			       <119 2>,	/* SoCCP */
>   			       <144 2>,	/* CXM UART */
>   			       <211 1>; /* NFC Secure IO */
> +
> +	sw_ctrl_default: sw-ctrl-default-state {
> +		pins = "gpio18";
> +		function = "gpio";
> +		bias-pull-down;
> +	};
>   };
>   
>   &uart7 {
> 

