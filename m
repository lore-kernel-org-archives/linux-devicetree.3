Received: from mx0a-0031df01.pphosted.com (mx0a-0031df01.pphosted.com [205.220.168.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 773C23A7588
	for <devicetree@vger.kernel.org>; Tue,  7 Apr 2026 10:21:26 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.168.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1775557289; cv=none; b=Tf7NdnPfrA656fD71hmbX9UJwF/oiiC153R88YaYVzx64Xf81QjY+6ZQNZ8LEKH4Fqyld2hDJskflza0gOV13tyvgVoFKxcC177DucLUPE9aEbBhMOql5e8shGPwwH5ScloQsCpMFsBkq4dBgYHPhwWYa/1yCd1ECJYsKb6SMWo=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1775557289; c=relaxed/simple;
	bh=k4XUKpLqkubWWFx6MiS4fNCXcrWR49bP8C25WodCErA=;
	h=Message-ID:Date:MIME-Version:Subject:To:Cc:References:From:
	 In-Reply-To:Content-Type; b=grcvl/x6fAW0zz8JFIGGN9EIA7tyWEv1FFKMKIRYf+3nmcSvID05iHx/UfXPRjKDeugHV7yoOfEBZcv3wxlQsCwmSBntGMXx4J/sJZUFv+leUuoCFPottrR15xYJFtr1xQmjmionI5wcHwuY9wgbMv2EUhzdD02hTWqoAcpDpAc=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=CH0qLK17; dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b=kmyqcG0C; arc=none smtp.client-ip=205.220.168.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b="CH0qLK17";
	dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b="kmyqcG0C"
Received: from pps.filterd (m0279862.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 6376MREn3537479
	for <devicetree@vger.kernel.org>; Tue, 7 Apr 2026 10:21:26 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	LZguX743r0gyTJOc5bBbYAt/gY8tHuQCdVrp7L/+iEs=; b=CH0qLK17FEtgjhjb
	Ycsawe15Ha/kzERSKqayUsfpqMpGg403oM1DPIFsCnSzL7aUYLGgF8Jb6+yjE+PC
	Zq0F2bZeVCOAvP+24RkOFkNE35ZNyKRfdgCy2kwmmFIfER9QodnewfOzpEfE6PnG
	30bryTZHm9AicdVWM0Nrgb5Zjl8TV8X9PZvUOCT61DdIRomPK5aeUd4uuoGpGb5J
	TD3Ft22WG/+4R7SmI4Wi8yrs19xbun2ocMvQ/twqt3o3LjWFIQAf3hfXFwAa/b3Y
	yATlfMKl06dv0mIU2ha6M88HzkpkAx9nxz8Qhcfvd2dxvfZ/6efi0jXoiKtBLw9V
	V9TNzQ==
Received: from mail-qk1-f200.google.com (mail-qk1-f200.google.com [209.85.222.200])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4dcmra28yb-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <devicetree@vger.kernel.org>; Tue, 07 Apr 2026 10:21:25 +0000 (GMT)
Received: by mail-qk1-f200.google.com with SMTP id af79cd13be357-8cfe29579d5so137994485a.3
        for <devicetree@vger.kernel.org>; Tue, 07 Apr 2026 03:21:25 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1775557285; x=1776162085; darn=vger.kernel.org;
        h=content-transfer-encoding:in-reply-to:from:content-language
         :references:cc:to:subject:user-agent:mime-version:date:message-id
         :from:to:cc:subject:date:message-id:reply-to;
        bh=LZguX743r0gyTJOc5bBbYAt/gY8tHuQCdVrp7L/+iEs=;
        b=kmyqcG0CCHmjvVfAyLxqDOJQSOahGMSG5vcT6cVJRXeIhQdO42Qa6DrLmp+ofkAsuc
         nOikyEvl+YK4smij4ysdn6b1ouJX8yGveePPCmXoonufS6frmGjPtVX/NtF04ull3uyI
         4LIm0EiZ055G2uyKtZTSLPsPFPVIl1eDx63N/7Mcx/Vv2rDK1q2W4+PJkp0Qf5Q1YZFV
         g9NdBTv2BJ9cUNnrjk1hZ+7pIxn2xYuBgm9VPThm7hLB+ISDms3ZRDJltXOgpuUy/m15
         2PE6DVIHYpw/RRgWgXKByhCSEs7p/oxT/7+8Gp71LHnAkxiOBNMg8zLL3JW4NmMvtKdP
         RyoQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1775557285; x=1776162085;
        h=content-transfer-encoding:in-reply-to:from:content-language
         :references:cc:to:subject:user-agent:mime-version:date:message-id
         :x-gm-gg:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=LZguX743r0gyTJOc5bBbYAt/gY8tHuQCdVrp7L/+iEs=;
        b=oFJg4AQ6XIklfE0hlYfPqzQBnLocujGWW4qH/MZAHAA+b77KdcOrEAJyb5PzWnOrFh
         1vsR2mMA1mbR3mQbATmoEZIKVIQXXgGCqlXET04qlMApnWCobZ6RxlMIDSKsFHrT17Il
         lBEbnoNTAAJmkqYlyv4W+H9GbYg+DP4dyc97IsYuldKZIwzYsnhHBJkRB9QB+h9GEn5P
         hnkMsw99g+2YWqvx47PVXbgmCHy9pOeNl13od0WKfyTGXwd3A4FUwqkORUqO4AU8A1Ks
         nzkrLlyJ1FKv18S6a50413zIBnxjj8tWW1LByAkRbscfZAVotHNkaGmbe/swmECntlEH
         Q2bw==
X-Forwarded-Encrypted: i=1; AJvYcCW30nTBmJxtQDdUCtcDq0bg3DpASW/+u8rbly4dLbtVtAOT7Mv7hMQLGyoNjEjIe0MH+RMLBwllAfGu@vger.kernel.org
X-Gm-Message-State: AOJu0Yx60moPTFApW54dm6qe5iTNti4k4A0+68dVIGQ9SH3ZsiG51Uwj
	Yv70zxGn18XiCzBAkmNaP229k+MMJjM+v1vx63yxcK6S1DECDU8sIm6i39fCuNB8i3ivjXnGqwf
	deCt7OftKOEmtghFpqrfteEDGaYwjs1F8x23Yz7QWDUCsyrrTJAP21HhCWntEJRcm
X-Gm-Gg: AeBDiet9/KXGFZGeZ9H8CDxwnA8v4NeyJqfzu3hzqrSZ7nEbijiyVw6PYxOy5Q6oyDT
	ilMrppCSj7PslFjvnf+IloHQEYpnLjayQs3ZX0+cRjUX+m4FuySYNDm/XD2NAX6yoTd1c3kMR70
	aUjLbCu8+d9NP7EeSilpgfMbm3aAU7UTqnPenY+Dhu1RKYMkKGnX2YYvLiUIv6qKZg0+n4LaeN4
	fcJDHZg6oan8z5pvl14+vamKJApEloaroFaYhGkerpFVJujUcKR1v/bkKvWfppwAMCScZJsYLlC
	Bhmc7/dNGtxayq+PuMfiwoM/0jaiVaFR9aIaOunE1/EgrUFNR3ScGSZHHDbnPfKvPT8ykLjALvz
	QkgKyzYunAbrdYregZTzKVurRsesqxu+cOnsO4WKEz11AbYe/cWcFk0At3QGWBhyoFUl0GjJvpc
	opAIM=
X-Received: by 2002:a05:620a:2590:b0:8cd:91f5:7a13 with SMTP id af79cd13be357-8d4185cdecbmr1609798385a.0.1775557284944;
        Tue, 07 Apr 2026 03:21:24 -0700 (PDT)
X-Received: by 2002:a05:620a:2590:b0:8cd:91f5:7a13 with SMTP id af79cd13be357-8d4185cdecbmr1609796685a.0.1775557284508;
        Tue, 07 Apr 2026 03:21:24 -0700 (PDT)
Received: from [192.168.119.254] (078088045245.garwolin.vectranet.pl. [78.88.45.245])
        by smtp.gmail.com with ESMTPSA id 4fb4d7f45d1cf-66e034bc112sm4047545a12.25.2026.04.07.03.21.22
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Tue, 07 Apr 2026 03:21:22 -0700 (PDT)
Message-ID: <0e558d0e-4306-45d5-bf1f-df692c3a10ea@oss.qualcomm.com>
Date: Tue, 7 Apr 2026 12:21:21 +0200
Precedence: bulk
X-Mailing-List: devicetree@vger.kernel.org
List-Id: <devicetree.vger.kernel.org>
List-Subscribe: <mailto:devicetree+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:devicetree+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH 2/2] arm64: dts: qcom: milos: Add IMEM node
To: Luca Weiss <luca.weiss@fairphone.com>, Rob Herring <robh@kernel.org>,
        Krzysztof Kozlowski <krzk+dt@kernel.org>,
        Conor Dooley
 <conor+dt@kernel.org>,
        Bjorn Andersson <andersson@kernel.org>,
        Konrad Dybcio <konradybcio@kernel.org>
Cc: ~postmarketos/upstreaming@lists.sr.ht, phone-devel@vger.kernel.org,
        linux-arm-msm@vger.kernel.org, devicetree@vger.kernel.org,
        linux-kernel@vger.kernel.org
References: <20260403-milos-imem-v1-0-4244ebb47017@fairphone.com>
 <20260403-milos-imem-v1-2-4244ebb47017@fairphone.com>
Content-Language: en-US
From: Konrad Dybcio <konrad.dybcio@oss.qualcomm.com>
In-Reply-To: <20260403-milos-imem-v1-2-4244ebb47017@fairphone.com>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit
X-Proofpoint-ORIG-GUID: qGnYrnmwejwcz7an_qcTKmmxUUw3z9CK
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYwNDA3MDA5NiBTYWx0ZWRfX28D6zfCt+UbT
 tO1FmYL2oT96OhwAap3jzK+QesOiY+XNLGChvIRrdD7DYemt/+bXA4kfx9u5mBehHVKRaeEipTc
 LwuQbsCe3qM+A3LrTXrsyKNlRGS3dgs0JMgrI7RbGqLLkUaDpkY3/iOX6PIvNnoEbJiCs7spYXX
 PUrS0ibwkfMdXxzu+KCpgY4Fym7P7e0hkcmI4de/JBeVzPbe2sbtM1S6TMaxUiKY+IJEtkBByhK
 POejqCywLn7qh3rmVebhKiN/78nei+Fmh5VDun+LVrBIwgXGaBXD6IfBGeWANJZ1W8hQ8NrQ68g
 Inub7YudATPp4uXO3Nz1oUVCuiQVibP/PBcPsThUzyApi4lNmDuhx7OXzCnWAQesCUkIfQwfTZh
 kzBworbihCwlp6+mBwjkZifEC3y4LC2KdrTY5+AGYcNjeabNQPruA1JzJaXCr04hgT/xkOVzCY9
 ajtq9PIepKMHt0o16uw==
X-Authority-Analysis: v=2.4 cv=BKGDalQG c=1 sm=1 tr=0 ts=69d4daa5 cx=c_pps
 a=hnmNkyzTK/kJ09Xio7VxxA==:117 a=FpWmc02/iXfjRdCD7H54yg==:17
 a=IkcTkHD0fZMA:10 a=A5OVakUREuEA:10 a=s4-Qcg_JpJYA:10
 a=VkNPw1HP01LnGYTKEx00:22 a=u7WPNUs3qKkmUXheDGA7:22 a=_K5XuSEh1TEqbUxoQ0s3:22
 a=6H0WHjuAAAAA:8 a=EUspDBNiAAAA:8 a=jsmoW5eAAA8I8i0BJVwA:9 a=QEXdDO2ut3YA:10
 a=PEH46H7Ffwr30OY-TuGO:22 a=Soq9LBFxuPC4vsCAQt-j:22
X-Proofpoint-GUID: qGnYrnmwejwcz7an_qcTKmmxUUw3z9CK
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1143,Hydra:6.1.51,FMLib:17.12.100.49
 definitions=2026-04-07_02,2026-04-07_02,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 lowpriorityscore=0 phishscore=0 clxscore=1015 bulkscore=0 suspectscore=0
 spamscore=0 impostorscore=0 malwarescore=0 priorityscore=1501 adultscore=0
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.22.0-2604010000 definitions=main-2604070096

On 4/3/26 5:00 PM, Luca Weiss wrote:
> Add a node for the IMEM found on Milos, which contains pil-reloc-info
> and the modem tables for IPA, among others.
> 
> Signed-off-by: Luca Weiss <luca.weiss@fairphone.com>
> ---
>  arch/arm64/boot/dts/qcom/milos.dtsi | 19 +++++++++++++++++++
>  1 file changed, 19 insertions(+)
> 
> diff --git a/arch/arm64/boot/dts/qcom/milos.dtsi b/arch/arm64/boot/dts/qcom/milos.dtsi
> index 4a64a98a434b..1c045743ef77 100644
> --- a/arch/arm64/boot/dts/qcom/milos.dtsi
> +++ b/arch/arm64/boot/dts/qcom/milos.dtsi
> @@ -2289,6 +2289,25 @@ scl-pins {
>  			};
>  		};
>  
> +		sram@14680000 {
> +			compatible = "qcom,milos-imem", "syscon", "simple-mfd";

With the new compatible:

Reviewed-by: Konrad Dybcio <konrad.dybcio@oss.qualcomm.com>

Konrad

