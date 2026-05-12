Received: from mx0a-0031df01.pphosted.com (mx0a-0031df01.pphosted.com [205.220.168.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 1C997379C4B
	for <devicetree@vger.kernel.org>; Tue, 12 May 2026 08:04:30 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.168.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1778573073; cv=none; b=BCgepG07sRXPB/9Z15oCB+AtuC6uvpuzEY+9R5QQ/ifdItBtL0kzaC/1sS2Z8MP07Pgadx82fBIN/N9gb/0XwkyR59e6bZbtGETeD29a++ZoKOON1CWjMIlU2Vs6oUjzNNKJBNHAF8zo/ITP4cHmPrVcKcpiMEuM+ZB+pSijpwQ=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1778573073; c=relaxed/simple;
	bh=3WGE47pfdoo4k/MjKdinj+dl7ukeJ81TgpzUVZwpxeg=;
	h=Message-ID:Date:MIME-Version:Subject:To:Cc:References:From:
	 In-Reply-To:Content-Type; b=iww5+yORemhqg/OwKYjgSThhT3i79+CyNNqJpB5AYWwjh389ZWUSwR0pOFLAOBtRgiK1UdjdtpWUJD7DqCE434s4p3SvkyTy+PkI5xsfxhpBvZgi5yPJWK6+fu2/PABQY6xXhszRwVplVRSfpYXBUhNkZ6eoGgAw/AtidWprF3c=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=MmG5eYJL; dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b=DnpkfqJT; arc=none smtp.client-ip=205.220.168.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b="MmG5eYJL";
	dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b="DnpkfqJT"
Received: from pps.filterd (m0279864.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 64C5C3D72573819
	for <devicetree@vger.kernel.org>; Tue, 12 May 2026 08:04:30 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	1O1Bep8eC2VqYFRAY485Q++gy9Sfmn6rwYeFrN2t960=; b=MmG5eYJLTmexLQrc
	uEcWOt3CGOzCsW+asqWxA4YMLHSqebCBcXXzLFMYmQHDNu3LAunc31gEu2sC89Yc
	QiYxsNqRtYg6Xtx3ef5of+A67hUrFe3iihrXNLCt4Ub/EBL6br9N6XdwL1TyZN/v
	z84YWHV4ZGDXl7EULC4XT5voKsPtDzRQmHelg9l15AqHkg8bBTht/d+114+jZ+tv
	UIywnfj7mf6AqOOs62xSKq+/m1RjpOAS3E3J7p+DvNhwWfQN4PTmhD+CLvbkp1jy
	2pthqUpItJ7kAC/0m/8y9MMcl6RBTBNlJmBIRNpj6OkuRvfrpM9nNkh65t8Zo0pt
	ccTYig==
Received: from mail-pl1-f199.google.com (mail-pl1-f199.google.com [209.85.214.199])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4e3nv2a5fn-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <devicetree@vger.kernel.org>; Tue, 12 May 2026 08:04:30 +0000 (GMT)
Received: by mail-pl1-f199.google.com with SMTP id d9443c01a7336-2bc7f9b2213so22653765ad.0
        for <devicetree@vger.kernel.org>; Tue, 12 May 2026 01:04:30 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1778573069; x=1779177869; darn=vger.kernel.org;
        h=content-transfer-encoding:in-reply-to:from:references:cc:to:subject
         :user-agent:mime-version:date:message-id:from:to:cc:subject:date
         :message-id:reply-to;
        bh=1O1Bep8eC2VqYFRAY485Q++gy9Sfmn6rwYeFrN2t960=;
        b=DnpkfqJTeu9RwUCij+/D4Wbsq2Ig4FlVb+r25KaHyyrqtjCjy7YxUf+oB1tPQl2ZC0
         7AWGIybvabMfKU2MFCTGjgayXJix+kpNvHf0c1GssCVIrP/t+UfQW3tcs+8OVyTzLAwp
         kF3CnCn13t1+Ghb0F7YPw/MCSU05gHkMWS0TaUTLPqJ75U66XvhDEvfonmh+QCDUxAbI
         qpJuhp5oU+ypEO1IIcSEwMMk90qxFVHdSdkJ/Xk0LE+vtLXRnACw4vx/GXpIROzSc6wX
         MFUMmhXmbAU9aUf40hHu4SUO6I7NCeyoRY0wWZYBefqeEuTTaqUBvZgmA6XmxUShApXC
         8qIg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1778573069; x=1779177869;
        h=content-transfer-encoding:in-reply-to:from:references:cc:to:subject
         :user-agent:mime-version:date:message-id:x-gm-gg:x-gm-message-state
         :from:to:cc:subject:date:message-id:reply-to;
        bh=1O1Bep8eC2VqYFRAY485Q++gy9Sfmn6rwYeFrN2t960=;
        b=eLeSqRB47ReK4sYPy3Cp5jpTgtqme6gMe+NoILTTNTxURQHnXSDKpjVF6mbccyJEMn
         Cow/lTRvQ6Cfew78JEj2hJdCrZwecvfb7c/GoWPA/w3qc3kW8P2HlrhJkixvFLiXLuiv
         8N1Lkhkbrtig8Js7eqdSgWk+gbJi66xukxMcIAp0yCgU3u9wkQ1zB3rnbIAZ7XkGt/Y6
         LHYXMVlq/DYbMOFALCLNoP9m0HFGrQPWW7gBSC4NVtYca5yslp83B92SZSMly1/NnOlA
         e4+bYH7EGxvuYbpxyTAp6gLncWJyPOAoJfaRO7/DeCwxLay6awEARNFcezGF1wewAIpK
         XhZw==
X-Forwarded-Encrypted: i=1; AFNElJ8MIcxY5QraakYy7q+bW6g+0qAp1F7/VoKyFqPNG5uVta7IBK+KnIa0XZEwVs3ngbXM/qqeqYyB/pjB@vger.kernel.org
X-Gm-Message-State: AOJu0YwGY0zTA77NFXO+M1Ebl1D4tF0REhoq9aPRcLCxIamO2NvMg0f0
	yM5bF6FLC5hshffckDU6HRyFtDEgT5hOkA6aoWdH/tGY4KLgK+kogyl2KhyF+aDH/0tgR1Fc3Fi
	rpHSNhZWyGPSXpe6qyrZnFJCMLP4vKFhRKcUIJ1VZ28Je5OI/zFxwfnWXAr1xmWDe
X-Gm-Gg: Acq92OHU5dyKMwVsz0Y5RgdjwWMjGVwuydGVtIRvG1HkXvq6YKJGGc5RaksDciMK2xv
	Pg8sFespwF2DDHOWaXHgf/3bZpWGFJIyYRDS7MJLbimct5edzPji/MtyyJ4ME7uxM5ZMIBiLWrm
	O0ZYCJ7odAqBfhhsZrTAbLp7fe5uhKR6UX6t8CqqMROZpzqVwdQWjFPkjT0oQaQ7iRgi0jil1Eh
	Zf/yJQOjj5rdKmEruEB4gytm5K35feFoCqdyL/FzGb5d+CCoKspP9+AcbkPoRGuuJ4YSJZRA0tz
	jJflq0cuafFUiGBdX/Lxh66BSVKCIcZLiqy47tToF+lWGEArtZ/u82mZzfSbl5nvYc+JX97zvWb
	fOE9t4T9WwQal2dxI/RUHKVZQQdQRuZahK51mdV2AAzx93tPEu4mozYd857SYW1eBBfqbYqlqkR
	yb78z7oPRXz1mQ1WTI
X-Received: by 2002:a17:903:284:b0:2ba:6ca2:be0 with SMTP id d9443c01a7336-2baf0cf3149mr192525495ad.4.1778573069358;
        Tue, 12 May 2026 01:04:29 -0700 (PDT)
X-Received: by 2002:a17:903:284:b0:2ba:6ca2:be0 with SMTP id d9443c01a7336-2baf0cf3149mr192525035ad.4.1778573068888;
        Tue, 12 May 2026 01:04:28 -0700 (PDT)
Received: from [10.133.33.42] (tpe-colo-wan-fw-bordernet.qualcomm.com. [103.229.16.4])
        by smtp.gmail.com with ESMTPSA id d9443c01a7336-2baf1d271b7sm125431085ad.14.2026.05.12.01.04.23
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Tue, 12 May 2026 01:04:28 -0700 (PDT)
Message-ID: <83c260b9-dd7f-4c28-ab83-91853afa08a0@oss.qualcomm.com>
Date: Tue, 12 May 2026 16:04:21 +0800
Precedence: bulk
X-Mailing-List: devicetree@vger.kernel.org
List-Id: <devicetree.vger.kernel.org>
List-Subscribe: <mailto:devicetree+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:devicetree+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v2 2/2] arm64: dts: qcom: glymur: Add crypto engine and
 BAM
To: Harshal Dev <harshal.dev@oss.qualcomm.com>,
        Thara Gopinath <thara.gopinath@gmail.com>,
        Herbert Xu <herbert@gondor.apana.org.au>,
        "David S. Miller" <davem@davemloft.net>, Rob Herring <robh@kernel.org>,
        Krzysztof Kozlowski <krzk+dt@kernel.org>,
        Conor Dooley
 <conor+dt@kernel.org>,
        Bjorn Andersson <andersson@kernel.org>,
        Konrad Dybcio <konradybcio@kernel.org>,
        Dmitry Baryshkov <dmitry.baryshkov@oss.qualcomm.com>
Cc: Neeraj Soni <neeraj.soni@oss.qualcomm.com>,
        Kuldeep Singh <kuldeep.singh@oss.qualcomm.com>,
        Abel Vesa <abel.vesa@oss.qualcomm.com>, linux-arm-msm@vger.kernel.org,
        linux-crypto@vger.kernel.org, devicetree@vger.kernel.org,
        linux-kernel@vger.kernel.org
References: <20260505-glymur_crypto_enablement-v2-0-bf115aeb1459@oss.qualcomm.com>
 <20260505-glymur_crypto_enablement-v2-2-bf115aeb1459@oss.qualcomm.com>
From: Wenjia Zhang <wenjia.zhang@oss.qualcomm.com>
In-Reply-To: <20260505-glymur_crypto_enablement-v2-2-bf115aeb1459@oss.qualcomm.com>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit
X-Authority-Analysis: v=2.4 cv=IsAutr/g c=1 sm=1 tr=0 ts=6a02df0e cx=c_pps
 a=JL+w9abYAAE89/QcEU+0QA==:117 a=nuhDOHQX5FNHPW3J6Bj6AA==:17
 a=IkcTkHD0fZMA:10 a=NGcC8JguVDcA:10 a=s4-Qcg_JpJYA:10
 a=VkNPw1HP01LnGYTKEx00:22 a=u7WPNUs3qKkmUXheDGA7:22 a=DJpcGTmdVt4CTyJn9g5Z:22
 a=EUspDBNiAAAA:8 a=QMFbHPruP1MRKEW6HfkA:9 a=QEXdDO2ut3YA:10
 a=324X-CrmTo6CU4MGRt3R:22
X-Proofpoint-GUID: HiaSNJBEqzpNl4KbMiWZE6jzDAI1L7ZK
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYwNTEyMDA3OSBTYWx0ZWRfX0aSnK/QvYhWD
 Iy5AcTpZY8A2LbEjmyWiR2mHO6ljCT/Nh/zM8woXO3zkEqIzrH3/2vzLJIfucOtV7y+gzhmDC0z
 xX85K+7zgVk+Ri4Fe3E8FHDfIRcMMechPp6ZUC+glvkLxguv+4sQexo+9S3LSsApdehvvPjq8tW
 FKF6kcwORh8WVrlxlElWdvpBu0lcH6Q+ayhO0vdwmMN4hcaw7QCzxBAmeATI59yajUlKJKApGcB
 u7mAeIz6L41NBvr+QCdgdLG8n+xAh3NwrXJpBZ5555GDBmvs6o521ejzgV4CD61A/4/lXp82g5R
 YFHhxCIp89v30QplpFiR/pA8tL9ZaIavaVxGQMgah3hbEfS7zMCVcATIDFA+LfaQKyBExSE2h1S
 ZKHBNEDj9Vu79fshqWuxkRjJfl4LU8nK8c72Jq9p7LWZnVu8w9RlLr6i4Ht4qU907UtHvArwjME
 x/qIt+z/qzuw2/U2NLg==
X-Proofpoint-ORIG-GUID: HiaSNJBEqzpNl4KbMiWZE6jzDAI1L7ZK
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1143,Hydra:6.1.51,FMLib:17.12.100.49
 definitions=2026-05-11_05,2026-05-08_02,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 lowpriorityscore=0 spamscore=0 bulkscore=0 clxscore=1015 phishscore=0
 malwarescore=0 impostorscore=0 priorityscore=1501 adultscore=0 suspectscore=0
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.22.0-2605050000 definitions=main-2605120079


On 5/5/2026 3:40 PM, Harshal Dev wrote:
> On almost all Qualcomm platforms, including Glymur, there is a Crypto
> engine IP block to which the CPU can off-load cryptographic computations
> for achieving acceleration.
> The engine is also DMA capable due to the presence of an associated Bus
> Access Manager (BAM) module.
>
> Describe the Crypto engine and its BAM.
>
> Signed-off-by: Harshal Dev <harshal.dev@oss.qualcomm.com>
> ---
>   arch/arm64/boot/dts/qcom/glymur.dtsi | 26 ++++++++++++++++++++++++++
>   1 file changed, 26 insertions(+)
>
> diff --git a/arch/arm64/boot/dts/qcom/glymur.dtsi b/arch/arm64/boot/dts/qcom/glymur.dtsi
> index f23cf81ddb77..349da9966d52 100644
> --- a/arch/arm64/boot/dts/qcom/glymur.dtsi
> +++ b/arch/arm64/boot/dts/qcom/glymur.dtsi
> @@ -3675,6 +3675,32 @@ pcie3b_phy: phy@f10000 {
>   			status = "disabled";
>   		};
>   
> +		cryptobam: dma-controller@1dc4000 {
> +			compatible = "qcom,bam-v1.7.4", "qcom,bam-v1.7.0";
> +			reg = <0x0 0x01dc4000 0x0 0x28000>;
> +			interrupts = <GIC_SPI 272 IRQ_TYPE_LEVEL_HIGH>;
> +			#dma-cells = <1>;
> +			iommus = <&apps_smmu 0x80 0x0>,
> +				 <&apps_smmu 0x81 0x0>;
> +			qcom,ee = <0>;
> +			qcom,controlled-remotely;
> +			num-channels = <20>;
> +			qcom,num-ees = <4>;
> +		};
> +
> +		crypto: crypto@1dfa000 {
> +			compatible = "qcom,glymur-qce", "qcom,sm8150-qce", "qcom,qce";
> +			reg = <0x0 0x01dfa000 0x0 0x6000>;
> +			dmas = <&cryptobam 4>, <&cryptobam 5>;
> +			dma-names = "rx",
> +				    "tx";
> +			iommus = <&apps_smmu 0x80 0x0>,
> +				 <&apps_smmu 0x81 0x0>;
> +			interconnects = <&aggre1_noc MASTER_CRYPTO QCOM_ICC_TAG_ALWAYS
> +					 &mc_virt SLAVE_EBI1 QCOM_ICC_TAG_ALWAYS>;
> +			interconnect-names = "memory";
> +		};
> +
>   		tcsr_mutex: hwlock@1f40000 {
>   			compatible = "qcom,tcsr-mutex";
>   			reg = <0x0 0x01f40000 0x0 0x20000>;

Tested-by: Wenjia Zhang <wenjia.zhang@oss.qualcomm.com> # on Glymur-crd 
device

root@qcom-armv8a:~# bash /usr/libexec/libkcapi/kcapi-convenience.sh
[PASSED: 64-bit - 7.0.0-next-20260415-00003-g5de0c764975a-dirty] 
Convenience message digest operation
===================================================================
Number of failures: 0
root@qcom-armv8a:~#

Regards,

Wenjia

