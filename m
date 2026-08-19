Received: from mx0b-0031df01.pphosted.com (mx0b-0031df01.pphosted.com [205.220.180.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 745AC2DA74C
	for <devicetree@vger.kernel.org>; Wed, 19 Aug 2026 12:42:51 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.180.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1787143372; cv=none; b=d2J8YVVLjLtSjjd/WyXDEAo/SGQ76L+I3oASjAa366cMdQ9potCb8rNa/BIB50mtJmHEZKZ6aS14JVoj044j7ZbUPUpszYELoS754ghQ5PoS+ryidBV0s0WaO5plIn+DN+GCOOcgL4Eho/e7E2eIYaPhFFsByPdGxjFYBdFhPkc=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1787143372; c=relaxed/simple;
	bh=X2PpSaRXlaE29+KXi6u4ZM+bH6zXSM4DRiQS/6Qia0k=;
	h=Message-ID:Date:MIME-Version:Subject:To:Cc:References:From:
	 In-Reply-To:Content-Type; b=gIrUMjfcPAjLJJIbi9y0ts2ICOaksZc5iKtQS3qZChrWZsIesKNrDX+2nIycjzbGT3NpL2r6RMJzWTxa3ZU/zLwY11st6Pb+Gfrkl0zAwksiYy3ra9h9FCbNbgbmP/xuLqzKqAeyYC2kQDNvtvBjxSWXc5MFxTW8UrPd8b6JHBE=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=HoXhZkte; dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b=O5KLm9gt; arc=none smtp.client-ip=205.220.180.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b="HoXhZkte";
	dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b="O5KLm9gt"
Received: from pps.filterd (m0279871.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 67JA86RE307185
	for <devicetree@vger.kernel.org>; Wed, 19 Aug 2026 12:42:50 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	2Wb1aqGA6H166eXI5vYkBIGxwFUHLiMbIF8k8+XA1tQ=; b=HoXhZkteYA2szGCs
	k1YcP0ZJ6i4xdu8jnKk+nEMzV0vOaG6Xh8RL2lLhXZ5DydYaq1UnnW6Y16OYkxRu
	nFzFbobPdDt+JuFVN26GX6oiow28immWOstiXWkm36nKzrN2ZyXVAeAO+A6j7XZc
	nqvgKpOBudqMaPrKGda/DFRStYt1G1FRVq68W3fWxEG6kTbnTYnix9Iq1DsHLQub
	p0zDBnUCW4ezVFlgMGbqICfZXl41Sh8tiUUQMXVQEkLwYN1WYC6YWbr63mK1fXyy
	oEXTDEqchx3G4XuKpXnBkZuuXFq3lBudj+ME6Nw5Cq6XhyjslrV5zVsdtRfvErKM
	oy2uwQ==
Received: from mail-qt1-f200.google.com (mail-qt1-f200.google.com [209.85.160.200])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4g4yfmb6ec-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <devicetree@vger.kernel.org>; Wed, 19 Aug 2026 12:42:50 +0000 (GMT)
Received: by mail-qt1-f200.google.com with SMTP id d75a77b69052e-52845bd815bso1917051cf.0
        for <devicetree@vger.kernel.org>; Wed, 19 Aug 2026 05:42:50 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1787143370; x=1787748170; darn=vger.kernel.org;
        h=content-transfer-encoding:content-type:in-reply-to:from
         :content-language:references:cc:to:subject:user-agent:mime-version
         :date:message-id:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=2Wb1aqGA6H166eXI5vYkBIGxwFUHLiMbIF8k8+XA1tQ=;
        b=O5KLm9gt+AiHWFhSV4Uszy5uKE+g2cBsiUk8zaH76jgkZSIFEX8RkhEXY3asD8E+K5
         S0zj8TNGuE8zTMMvPu6s7Qjp+6brjm97uRoDwclEznnsILDT9lJQ7OJuYLMe222eqebC
         tnfXO+mn6FGCdaTTAEXhsTmRBF0HuL7NbiBsRcr7XprRRJmKGGLdEqgrMB6iKGbxSgeg
         wMuecbHnOkXflHOs2qwm4y8mOaTIPUzcrM7Jr7gbC0z0i/YC3eebzvRtteAriNnjWywO
         v8tjnULJMp7Y8DtSKIHRyaf01j/oQak8gCHG1lBwtPTR3kXBr72aPMQnWS98aPqw80j4
         Frmg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1787143370; x=1787748170;
        h=content-transfer-encoding:content-type:in-reply-to:from
         :content-language:references:cc:to:subject:user-agent:mime-version
         :date:message-id:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=2Wb1aqGA6H166eXI5vYkBIGxwFUHLiMbIF8k8+XA1tQ=;
        b=TWSzlz2+WENrmWMhiuUaMy+TircGTOUIx1ISIVx2CW11H63Va6I3eotcAqDt85uy9J
         RtofLJ+QZCPGU8oeYac/Aj+Op724ZZ56LKkaCMR24zIxGXfkU8Bzmzul8HVhAQMcdEz5
         i1eD6dGkbZWvSdc25OuVKv3STY5ZRuSmkvf2Shq10TCc4TbmD4aYZBS87ppF/0N2AO7d
         o530RTGt0C1GWyNoB4qc9KlUzYNd3CEa1Fgrh9JT/HkvInz14O+S+/tmoPFYjOCW0HiG
         UymO5C4cLSAoisjepztGOrdztlO5BDJ5iTurw1bOARgnMFJaoO+eqOBWbNknbKr03HR5
         gabg==
X-Forwarded-Encrypted: i=1; AHgh+Rpv97Eab2MZB8SMbwu2ttLSXykgBMXidYyUD3Pdzn75x2qBfqIQruI+6DypkzRtHLkBDjZJKxpPvi/T@vger.kernel.org
X-Gm-Message-State: AOJu0YzPiPzpoVT1WeQzOmv8LHoVy3JRz/RgdQJd6+g9dWq2XgzOvlZr
	H1PzJoyom1NYmyNZYSZjge70KbhAH22uscBV8elFgLTKXZx98b3V5HiZsRGhCwaeaXCeHQ2o65B
	Kx/WRT4IpsWQip48elKxI2W7Lsft22fsj04FZOHqiEWJq5LuD6lMo0VCFZ3ZKAxnR
X-Gm-Gg: AR+sD13S256WxqZ7ml+9pYmfn3RCehLXuDEcYsmD7aIC2MaVQd4NcIE3akvxx7HD4cA
	D5fQKvtIXEQsh1yG9tphPNGNoCxRjQvuJWjRqjdWnM/ppx1DhhuRNzRbh8UROk6OFwhnRhk2T4X
	CR5QH+EWdX81yLJ6uUfgoeWU9ZDY1ZFJVvICLZeXNqlYNkWYejFcDJpWrX4gGdC1qrKGPwZdWyT
	F/LprO+gzRhnf1TU9vBINpePT6f+IJgyxGy5RBxnByDnA9H9DgUrNzZ4g2LlGX9hS8+caS6fzhp
	GEWrB4E5V7kFr8SOQfFMFJ5ciaQguUo/zo3nsP7AVBOMNukjJsqB960hC+zmKSgY6y6oLLs7p+X
	dx4YDSX1103+bDM1r3eq+CcB1
X-Received: by 2002:ac8:5d08:0:b0:51b:f40b:2faf with SMTP id d75a77b69052e-52dd5cf7f84mr29311761cf.4.1787143369695;
        Wed, 19 Aug 2026 05:42:49 -0700 (PDT)
X-Received: by 2002:ac8:5d08:0:b0:51b:f40b:2faf with SMTP id d75a77b69052e-52dd5cf7f84mr29311281cf.4.1787143369148;
        Wed, 19 Aug 2026 05:42:49 -0700 (PDT)
Received: from [192.168.120.193] ([178.235.128.140])
        by smtp.gmail.com with ESMTPSA id a640c23a62f3a-c243c38c2fdsm67072866b.45.2026.08.19.05.42.47
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Wed, 19 Aug 2026 05:42:48 -0700 (PDT)
Message-ID: <ba2cd714-3da5-41ab-ae17-522d84f9d1c4@oss.qualcomm.com>
Date: Wed, 19 Aug 2026 14:42:46 +0200
Precedence: bulk
X-Mailing-List: devicetree@vger.kernel.org
List-Id: <devicetree.vger.kernel.org>
List-Subscribe: <mailto:devicetree+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:devicetree+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v2 2/2] arm64: dts: qcom: ipq5018: Enable MDIO buses and
 add ethernet PHY
To: Luo Jie <jie.luo@oss.qualcomm.com>,
        Bjorn Andersson
 <andersson@kernel.org>,
        Konrad Dybcio <konradybcio@kernel.org>, Rob Herring <robh@kernel.org>,
        Krzysztof Kozlowski <krzk+dt@kernel.org>,
        Conor Dooley <conor+dt@kernel.org>
Cc: linux-arm-msm@vger.kernel.org, devicetree@vger.kernel.org,
        linux-kernel@vger.kernel.org
References: <20260814-qcom_ipq5018_mdio_pinctrl-v2-0-ff90d6605d61@oss.qualcomm.com>
 <20260814-qcom_ipq5018_mdio_pinctrl-v2-2-ff90d6605d61@oss.qualcomm.com>
Content-Language: en-US
From: Konrad Dybcio <konrad.dybcio@oss.qualcomm.com>
In-Reply-To: <20260814-qcom_ipq5018_mdio_pinctrl-v2-2-ff90d6605d61@oss.qualcomm.com>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit
X-Proofpoint-ORIG-GUID: _GVNxKZlnNIJICLUfbJnRu1zAeI5cuCr
X-Proofpoint-Spam-Info: AW1haW4tMjYwODE5MDA5OCBTYWx0ZWRfX2IKqA/QjFgIk
 cJsDei9lZ9XW+OE2/mSWrOO5wdL1pEO3Z/S/2aQdCnFyhmggMSb+ApXHTmJpsFLVR6W6HdNzGsW
 Zg2fgZOe5rkcAEDJTHZuAm1JnZJfY88=
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYwODE5MDA5OCBTYWx0ZWRfX8MF6HVJ13o49
 NLZJ/eL+RhcGi1XSKv3vGvEuo2JeBSUC6FYVPJmQMxfmBAYddKpHVzt6ec3pEetjT3ddT9pV70x
 MXon02qcEVvhW7ASb+m1Mj1ZZuzWGbXhgk6oCeuJBDI0ZExG3g56/bhdqDYIjFDZUImCpB7fBHJ
 /sQuoVd6axzrbcoGL4Jc8A6gwk5Ujxsk732Cv9HQAcVu8n/jbkYZm/eKwDvA3OxKhjTtnJHC1Be
 DTySydPeKl4jLfM0Rh/HddhwXT9f6OWeeUtllj2lPvKBi37+IPov8Krg+Su5p//vKCPWQohlAFW
 xu9FSLt9jtoKUpJ5Jb6XCOoKKfEGPAiimblc9S3YfLCp5C8PjfI/0jhXflYxnme9Xm8Tc4qRMVN
 uoqg7I6R+3vMPXDMRg7ko2gPluQdWHipeHUVjai2fd7m3RCIPXF9/FhRrFUR7GGlCKfimti8NWT
 kloF8JOweN+MpMhxRAg==
X-Authority-Analysis: v=2.4 cv=aNrAb79m c=1 sm=1 tr=0 ts=6a85a4ca cx=c_pps
 a=JbAStetqSzwMeJznSMzCyw==:117 a=PRfkaYvzSr8QmIIGAkY2Sg==:17
 a=IkcTkHD0fZMA:10 a=Sv0fKeRqtYgA:10 a=s4-Qcg_JpJYA:10
 a=VkNPw1HP01LnGYTKEx00:22 a=u7WPNUs3qKkmUXheDGA7:22 a=3WHJM1ZQz_JShphwDgj5:22
 a=EUspDBNiAAAA:8 a=yv-Pc3QK0v4PSjaF5QAA:9 a=QEXdDO2ut3YA:10
 a=uxP6HrT_eTzRwkO_Te1X:22
X-Proofpoint-GUID: _GVNxKZlnNIJICLUfbJnRu1zAeI5cuCr
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1176,Hydra:6.1.134,FMLib:17.12.100.49
 definitions=2026-08-19_03,2026-08-18_01,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 spamscore=0 adultscore=0 lowpriorityscore=0 clxscore=1015 bulkscore=0
 malwarescore=0 suspectscore=0 priorityscore=1501 phishscore=0 impostorscore=0
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.22.0-2606150000 definitions=main-2608190098

On 8/14/26 4:22 PM, Luo Jie wrote:
> Both the internal (mdio0) and external (mdio1) MDIO buses are present
> in the SoC dtsi but left disabled at the board level, so the board
> currently has no way to talk to PHYs on either bus.
> 
> The RDP432-c2 board uses the SoC-integrated EPHY on mdio0 and an
> external QCA8081 PHY on mdio1 for its Ethernet connections. Enable
> mdio0 and mdio1 with a 6.25MHz MDIO clock, and describe the QCA8081
> PHY at address 0x1c on mdio1.
> 
> Signed-off-by: Luo Jie <jie.luo@oss.qualcomm.com>
> ---
>  arch/arm64/boot/dts/qcom/ipq5018-rdp432-c2.dts | 14 ++++++++++++++
>  1 file changed, 14 insertions(+)
> 
> diff --git a/arch/arm64/boot/dts/qcom/ipq5018-rdp432-c2.dts b/arch/arm64/boot/dts/qcom/ipq5018-rdp432-c2.dts
> index 33eef92b19b1..aed8359b1931 100644
> --- a/arch/arm64/boot/dts/qcom/ipq5018-rdp432-c2.dts
> +++ b/arch/arm64/boot/dts/qcom/ipq5018-rdp432-c2.dts
> @@ -30,6 +30,20 @@ &blsp1_uart1 {
>  	status = "okay";
>  };
>  
> +&mdio0 {
> +	clock-frequency = <6250000>;
> +	status = "okay";

If the phy is integrated as part of the SoC, is there a reason to
not enable this bus by default for all boards?

> +};
> +
> +&mdio1 {
> +	clock-frequency = <6250000>;
> +	status = "okay";

Nit: a newline before status would be neat

> +
> +	ethernet-phy@1c {

No compatible string and other properties?

Konrad
