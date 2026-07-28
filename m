Received: from mx0b-0031df01.pphosted.com (mx0b-0031df01.pphosted.com [205.220.180.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 58EE73D953D
	for <devicetree@vger.kernel.org>; Tue, 28 Jul 2026 08:08:55 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.180.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1785226136; cv=none; b=RVE6a/mCi6HgqLG2OoOToa3putSTngJrXb/SS5TZa2TvEVuoWpiDlX1oMyu66x1SWcd7BE00ebvY0lCoOGOZsM6fWStxEcqwV2qgklIyAg02Xzdw6LC7UjrlQ5IfBbzpX6s4ohb1bFD8NfiySDSNT9paQgOjTUPvK4Z8x59dpHo=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1785226136; c=relaxed/simple;
	bh=mPDXysXj5lzIWFwy6wC2FZ/rGmW2AByblfFrnVyPj1Y=;
	h=Message-ID:Date:MIME-Version:Subject:To:Cc:References:From:
	 In-Reply-To:Content-Type; b=UJkPBxKagsBVM6wI33lj5s5OZzlt0MIcG2MFyNktLlhJENt+c8aailMTRmxROGVY67aT9a/1axsR6WU/4GVy8evMIiX1KRfiGA1QUm4WC4EqOShdh5o12g3fX7Uq1t90lAfhyFVVCWXB+n8uhYwHd7sSgIf3VApqNvSiIApK2hw=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=oECY8N2U; dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b=PkIsBEDI; arc=none smtp.client-ip=205.220.180.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b="oECY8N2U";
	dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b="PkIsBEDI"
Received: from pps.filterd (m0279872.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 66S82DZC2026838
	for <devicetree@vger.kernel.org>; Tue, 28 Jul 2026 08:08:54 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	k4JyYcB4rNl1WLdr8qEJ8Cc9TJtQG+TnKG6hDCnD3Po=; b=oECY8N2U1G+KxAvF
	89Mm/FeNM87wXi/JdA1ceMollKJ2MVFvB6ZtKMe3BHkVvOtxGH//KO8Jj/yJngPI
	REv/xoC5Wz3GMGHH7mZZ0cXoKKwz9ASwKdCz+vF/NYDoGWREo5yApcDlI/BNe7zu
	qfONhCIckdfvkr7xjBWtKLnK1+a+uMGyBpkW3EQ7RORkMmTPTbZy6l+WVYQSRUy6
	Koq9flzKVVc81KvQKJTmG4hg5g5A1J8s8QXyK0w5i/3RXjkEwBriH0j1fPh2Z0k5
	N2YGxL8w8Zy3M0foNjcvf/uoJwOoxFKSzHFlZii1b6c+9WlywSiIFg++CuiLdui/
	4c+dow==
Received: from mail-qt1-f197.google.com (mail-qt1-f197.google.com [209.85.160.197])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4fpq9hgc83-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <devicetree@vger.kernel.org>; Tue, 28 Jul 2026 08:08:54 +0000 (GMT)
Received: by mail-qt1-f197.google.com with SMTP id d75a77b69052e-51ca37ce4c3so6508341cf.3
        for <devicetree@vger.kernel.org>; Tue, 28 Jul 2026 01:08:54 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1785226134; x=1785830934; darn=vger.kernel.org;
        h=content-transfer-encoding:content-type:in-reply-to:from
         :content-language:references:cc:to:subject:user-agent:mime-version
         :date:message-id:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=k4JyYcB4rNl1WLdr8qEJ8Cc9TJtQG+TnKG6hDCnD3Po=;
        b=PkIsBEDIS4ZPZa0rt1c23ECvACVhGPsM7hrk9EwXLEjtpkTkWrBzSbVN/CP9diQk32
         KFaa460/41vInvVcRH0+29GG41mOrk/9svfRWLXbgyjjJ9rnvVB9PWiXGEZYmFKQi8Qt
         TuIHoFbi982SfpwdnqMAHaU/65HITDrZJBGj4FQYZ2aXpabymyWco38npH9aGr0NySFP
         4cS533cp7Y02uiALzI8cogrJl7P83SvAFUwKEp0D8H65qdMc5NawwHlhn8HYaPy74jot
         G4UgQ/AB06W2lCcbTq+r3cQvD+Vk44+dQHUYy6yU/wyc9InOchT37Obu7kbOxYPPLUWz
         wm2w==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1785226134; x=1785830934;
        h=content-transfer-encoding:content-type:in-reply-to:from
         :content-language:references:cc:to:subject:user-agent:mime-version
         :date:message-id:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=k4JyYcB4rNl1WLdr8qEJ8Cc9TJtQG+TnKG6hDCnD3Po=;
        b=JW+AzNDHIO6tWIgxSX76kZ0pqp06TdxGI/EL6gGnX/CxhqIFdTIAfmEuI9Z3fFsNZg
         SlTXVxHQIgxx6SJReTjtvN+toyAChvtkWfUdYuOjnkQOaP56tAPRQX2aUcrggfAjfX+2
         tdqpgf/xUNYkX5Nra/MCNpN7+xaX1geODKp0MoXOlm7g0+csq2NwMlHfQ5o/fXBggNiK
         0DBmTdfE9wX5u8TLimPDg++5WSjxNKojpKFn61bq378CTc+lxMCej5p4R2/YvR3YrAk1
         zMwihyPcQEEbCAF/PU/xMXe2nR38YnOcCvPep/FUn43ms2ZyqZut9jW25FbBRA1m2pUs
         kPtg==
X-Forwarded-Encrypted: i=1; AHgh+Rq4Ayb/ivcKA0ZqWMwEpBIuEFPO6ym379JkbVdt/4/ucgnR3xNDZdZ2NRrZIj5HNxbUITsQ++RZcqHh@vger.kernel.org
X-Gm-Message-State: AOJu0Yw2pxUZV8XN2GzMx/xuYo2EXPKOm8pkoAKb8/id9lfFcPIL/ack
	FTOnb/ymO1GOEdd9H+haqjWgRvRyLp3u0pdEYUd3o0u13rd8cIFPku7kjzeOnjm1vyQhExxLW4B
	P64Nd+5ryVG7HQzE4Fd6XQ5+z2s+d6+PueJ3et7nBfdgxZwCKZdEYeZ0QblcGrLWp
X-Gm-Gg: AR+sD10Cyk4odCJX2TxQlEy4qivKUdw9tAM68IcWgDnmXtYIfOZbvkJpX5klBEQ2m71
	liufJq3GLD0DBNEPbYvzWpQFi+4z4Ac0tA9fykqMS+ELw84DiWPVGZALvp8jTzlWdufJcsyWp3g
	lu2t6NhgNPYc46Ui/9N0jRQzm2YAo2E58ys5fZ77BYMUWQ8wKzdtsjmylwKegD42LWa6suaApaJ
	Xvnv1DUzTz7zEw9RvCR4NwchLRC4/+e4qxFi6YGAftAfApj5YzuV1EIlP9sdUzarD1voSDOaVC9
	us5j235528NjHnmZ5H7mJusGJsyC2rYh8HU8ky07k9WWsjiorYuXl2PDDe6ALFiGSfLrkHBIZUy
	iFsAL91AF7MJCVs9uMJmJEjSS
X-Received: by 2002:a05:622a:a98e:20b0:51c:1c73:51a6 with SMTP id d75a77b69052e-529d6fe33e2mr6436271cf.5.1785226133699;
        Tue, 28 Jul 2026 01:08:53 -0700 (PDT)
X-Received: by 2002:a05:622a:a98e:20b0:51c:1c73:51a6 with SMTP id d75a77b69052e-529d6fe33e2mr6436041cf.5.1785226133066;
        Tue, 28 Jul 2026 01:08:53 -0700 (PDT)
Received: from [192.168.120.193] ([178.235.128.140])
        by smtp.gmail.com with ESMTPSA id a640c23a62f3a-c1c32af244asm720034066b.27.2026.07.28.01.08.50
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Tue, 28 Jul 2026 01:08:52 -0700 (PDT)
Message-ID: <b417ff8c-7829-4db5-b3de-9ee946c493f5@oss.qualcomm.com>
Date: Tue, 28 Jul 2026 10:08:49 +0200
Precedence: bulk
X-Mailing-List: devicetree@vger.kernel.org
List-Id: <devicetree.vger.kernel.org>
List-Subscribe: <mailto:devicetree+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:devicetree+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v4 3/3] arm64: dts: qcom: eliza-evk: Add PCIe1 with TC9563
 PCIe switch
To: Krishna Chaitanya Chundru <krishna.chundru@oss.qualcomm.com>,
        Bjorn Andersson <andersson@kernel.org>,
        Konrad Dybcio <konradybcio@kernel.org>, Rob Herring <robh@kernel.org>,
        Krzysztof Kozlowski <krzk+dt@kernel.org>,
        Conor Dooley
 <conor+dt@kernel.org>,
        Manivannan Sadhasivam <mani@kernel.org>,
        Bartosz Golaszewski <brgl@kernel.org>
Cc: linux-arm-msm@vger.kernel.org, devicetree@vger.kernel.org,
        linux-kernel@vger.kernel.org, linux-pci@vger.kernel.org,
        linux-pm@vger.kernel.org
References: <20260728-eliza_evk-v4-0-decc7fe5246e@oss.qualcomm.com>
 <20260728-eliza_evk-v4-3-decc7fe5246e@oss.qualcomm.com>
Content-Language: en-US
From: Konrad Dybcio <konrad.dybcio@oss.qualcomm.com>
In-Reply-To: <20260728-eliza_evk-v4-3-decc7fe5246e@oss.qualcomm.com>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit
X-Proofpoint-Spam-Info: AW1haW4tMjYwNzI4MDA2OSBTYWx0ZWRfX03NMkaMdvK0Y
 aDDR4SNQdWHIIf+7ApYXjbiCIhluA+VEq5uimSrKJeEjKBB2qO6BNYThPBrvG6wL+tjcbBBH6nc
 qL7NQRs8yI66Ps059VmKXBl5TVyit00=
X-Proofpoint-GUID: AjOx3u8snw667fwZNDMzEBIHEnO8n3wR
X-Proofpoint-ORIG-GUID: AjOx3u8snw667fwZNDMzEBIHEnO8n3wR
X-Authority-Analysis: v=2.4 cv=Aa6B2XXG c=1 sm=1 tr=0 ts=6a686396 cx=c_pps
 a=EVbN6Ke/fEF3bsl7X48z0g==:117 a=PRfkaYvzSr8QmIIGAkY2Sg==:17
 a=IkcTkHD0fZMA:10 a=RAioF0-LDSMA:10 a=s4-Qcg_JpJYA:10
 a=VkNPw1HP01LnGYTKEx00:22 a=u7WPNUs3qKkmUXheDGA7:22 a=yx91gb_oNiZeI1HMLzn7:22
 a=EUspDBNiAAAA:8 a=obKXXINtG9EwW41erPwA:9 a=QEXdDO2ut3YA:10
 a=a_PwQJl-kcHnX1M80qC6:22
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYwNzI4MDA2OSBTYWx0ZWRfX99mpR8GYc+4p
 SktbGtyq6QVZhKu24kb9STJeWLtPZFnmPlZtPvEl2QhgoBqBK6hVL31sWSZ4nNdZ+OpLnkJpnT4
 iheLlisMNUDZp0z1rYM4YD5gWDdBSaLnpvp3AjrM+vBvEu6IMdlHokCUccStvCaAbD7eLY10z5f
 cJ+fkt7WwqB2RcS+HaVixUIEOAOQdnmgapUAC8GFn4LGVYf0jjmRPOI2Cs08MNPp5P/W4YmyOKm
 iKWWYV4pCxHw3NYSozTrwGwXfALJCDNdfd7hAcXSSUURdqDh0PGrVIJpamlAm+3CrAXwfNxw/Hp
 CG8lwX+Dzps5KC0/ZKuuiZbGv3ACbmk/KTUN5qqO+Lkw9I5lfKFpieWC7LDyATirJ5WoFsn4jS5
 C9H/jDzsV83MZcU6+kUs1i0df+AwY85tSF4b4UW3EWbhRzgwnlCZHnlA8hC6Ff96h54Oo8Vqfqn
 KoCjkaaOMk3gDnoE/cQ==
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1143,Hydra:6.1.134,FMLib:17.12.100.49
 definitions=2026-07-28_02,2026-07-27_01,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 impostorscore=0 adultscore=0 phishscore=0 malwarescore=0 clxscore=1015
 lowpriorityscore=0 spamscore=0 priorityscore=1501 bulkscore=0 suspectscore=0
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.22.0-2606150000 definitions=main-2607280069

On 7/28/26 9:06 AM, Krishna Chaitanya Chundru wrote:
> The Eliza EVK board connects PCIe1 (8GT/s x2) to a Toshiba TC9563
> PCIe switch. Enable PCIe1 and its QMP PHY nodes.
> 
> TC9563 uses I2C (at address 0x77 on I2C4) for its management interface.
> 
> Override the base iommu-map with the expanded set covering all the
> switch's downstream ports (0x1400-0x1408 SID range).
> 
> The TC9563 RESX# and PERST# are OR-ed internally to assert reset on the
> switch. Use TC9563 RESX# pin via a TLMM GPIO and skip wiring PERST#
> from the PCIe controller.
> 
> Signed-off-by: Krishna Chaitanya Chundru <krishna.chundru@oss.qualcomm.com>
> ---

[...]

> +			reg = <0x21800 0x0 0x0 0x0 0x0>;
> +			#address-cells = <3>;
> +			#size-cells = <2>;
> +			device_type = "pci";
> +			ranges;
> +			bus-range = <0x5 0xff>;
> +
> +			pci@0,0 {

FWIW these subnodes should be pcie@ too

Konrad

> +				reg = <0x50000 0x0 0x0 0x0 0x0>;
> +				#address-cells = <3>;
> +				#size-cells = <2>;
> +				device_type = "pci";
> +				ranges;
> +			};
> +
> +			pci@0,1 {
> +				reg = <0x50100 0x0 0x0 0x0 0x0>;
> +				#address-cells = <3>;
> +				#size-cells = <2>;
> +				device_type = "pci";
> +				ranges;
> +			};
> +		};
> +	};
> +};
> +
>  &uart13 {
>  	compatible = "qcom,geni-debug-uart";
>  
> diff --git a/arch/arm64/boot/dts/qcom/eliza.dtsi b/arch/arm64/boot/dts/qcom/eliza.dtsi
> index c99bcccae00c..2ecfeddea496 100644
> --- a/arch/arm64/boot/dts/qcom/eliza.dtsi
> +++ b/arch/arm64/boot/dts/qcom/eliza.dtsi
> @@ -2104,6 +2104,7 @@ opp-16000000-3 {
>  			};
>  
>  			pcie1_port0: pcie@0 {
> +				compatible = "pciclass,0604";
>  				device_type = "pci";
>  				reg = <0x0 0x0 0x0 0x0 0x0>;
>  				bus-range = <0x01 0xff>;
> 
