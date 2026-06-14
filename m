Received: from mx0b-0031df01.pphosted.com (mx0b-0031df01.pphosted.com [205.220.180.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 892F5179A3
	for <devicetree@vger.kernel.org>; Sun, 14 Jun 2026 21:42:43 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.180.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1781473364; cv=none; b=HyuJPfDTtS7wnaTgi5YmWCXNC+XE8rVHG8Px5C2wdULL49lzTpFzUgst6suQBQjHtbDYVF3ULnuf19eHrZNA2RYcl5ASe9nrMmfzf7SgR5679ivfVaakOHgmDeSGo31cFldZp700s4X6p1yl9RnjfyKEiFAF30ckCko+MEFfl34=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1781473364; c=relaxed/simple;
	bh=O5RAX6vSkVyMV9/AiCOkLDjnKhqPtvtNfNqeJYGa/FQ=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=nWXobVJteTYKaalwPwwxHysERldNT6rxRjyC00yr6qcjqsU3aGfh5Y5GyPZUJbFSyZwRjEn/co+0yEq2NRq5cZxnKGVHxjStBmD5yb4SJZlbpuqxwcyVrAPnUth8MToncm4NG3QIxAYaJ5CLOxMxsfk6SzG7jCXmVSv2/l42yLs=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=IX5vBccK; dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b=SKmFF7pX; arc=none smtp.client-ip=205.220.180.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b="IX5vBccK";
	dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b="SKmFF7pX"
Received: from pps.filterd (m0279869.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 65ELgL382787130
	for <devicetree@vger.kernel.org>; Sun, 14 Jun 2026 21:42:42 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-type:date:from:in-reply-to:message-id:mime-version
	:references:subject:to; s=qcppdkim1; bh=nweQR30NtiV5h3TcT7NqDuG3
	GC9ianIw1AGvroZ8LpI=; b=IX5vBccKZb3QFGume1xt4/oY+zQaOG3/CoqkgSPx
	cvd0IEzMrsvGjiW/bhewea5WW0zblECbt/1Qx5Qkgp9D1HVc8kpdGl67q6/zyiCl
	SFz1OwFTbYKNdrQJU1aekxcEtGXRRXLDw6Zkgwqstolx7/b9si60EQwnF/gnDDt8
	Os85PlcPUmHIdXSQ7Pu+mnooyZyW0HEjlcmwjoFf0kB/Ww+DMOzlDXS65MOvRLq7
	3uqWNQ1nm1cMsg5h/gaLgnK+q67RjAD6RRB/oypt0fc8PM7Cq6hvj/1ohg6L6B6k
	YggvfOo9d0SBi9cSLLyxPP+T4zNkQHJU+uM0TuaPFtEE1w==
Received: from mail-qv1-f72.google.com (mail-qv1-f72.google.com [209.85.219.72])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4ery8wvkd7-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <devicetree@vger.kernel.org>; Sun, 14 Jun 2026 21:42:42 +0000 (GMT)
Received: by mail-qv1-f72.google.com with SMTP id 6a1803df08f44-8ce9de04835so79111026d6.0
        for <devicetree@vger.kernel.org>; Sun, 14 Jun 2026 14:42:42 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1781473362; x=1782078162; darn=vger.kernel.org;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:from:to:cc:subject:date:message-id:reply-to;
        bh=nweQR30NtiV5h3TcT7NqDuG3GC9ianIw1AGvroZ8LpI=;
        b=SKmFF7pXdAtIEQOnEg1wLdt7E0qjPREcNySv6jm0BU/Ag1wVbzlbCuAvYqtY6ZMBro
         3WfgG8d8WCqclOG3ZrwQPz9/pmaGFjTpSdhhs5B+89VOdKL+I91dG4pknqKGcfF7IKZD
         8UozDOiqzEynaQcCBpVFyTA7+0gL77PUJBqb2Gf83X1YIV69E+l2+7oY6diSpvDpsZTQ
         SEONe9XD7vqkMdcgeHWY/UD1dDX2DfnlAgHN+3XUmbamiGQWhhS9HprwAvAgauiEZK6V
         wf6QK7RmnaF5DrIctyXQmz1qq6RHDf1TKNL8iK9OHS+LGF3qLqaGWLjoeEsOW2p71enY
         +K8g==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1781473362; x=1782078162;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:x-gm-gg:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=nweQR30NtiV5h3TcT7NqDuG3GC9ianIw1AGvroZ8LpI=;
        b=Y3l9oRLwTenU+5MUV3+aprULSN3lrkV2bIXuXpv7+BPxy3MSQExqAIKPuRs7WwuHE7
         0XrQrVGWbLmtiLL9jMGnAynCMcbhfaOa7Wo7BloE8DIUE3w0H3rtfF1HUBoPRzzw8NbS
         JQMIXQLoGDC3QfmmnaIN9jkqkBPG4WABSkeXpUbkh+EUD0bDbEgi0dAcEh7XN+9Md4l+
         a4UitUtwrQRJW7DtPtQgqWeruyGsT6Az24jDXi5p3ylxp2oXlJZDa8lOHqS9oJi+gn9w
         NtesJleXBlY5gUgKeZheV0PF802DF9RlLJsyaOF/LM5qFnRGNO/JluVtN3GMyYp4TyyR
         zSNQ==
X-Forwarded-Encrypted: i=1; AFNElJ/LCJG5A/folj8Y8KJIxyX3FPd+YAEIgRuINh7wDKjM98LKgJxs1mrRZ1mURBfthDl7S5MR07+AaoSG@vger.kernel.org
X-Gm-Message-State: AOJu0YzNkkQDTv7O9Vvs8hmXPcdwKmYHS6pwtjRmaK2S6DBkvDlnyf7J
	DdpCabaX+9Thj9ebZUkjiaKQulhl3TAxOGjxM/0ytB41z/QykenzynGyeHfws/e/u9QaSpL0so4
	504Ovf5vEEK6/dixpgMTROLPzro1habln9CEfoTKo0GpdmsoclQU2bRYp3m8WONRK
X-Gm-Gg: Acq92OFZMTSGdnUUcCr/UuxqyowHQeboj7BieJbYNE4qN9gMWXwwC6rvPkN0PbBlctu
	SbbVxNKIygadQ9BkvBsrrniylLYN0yu8PVl8BPKvdJSnu3fI0if2ILV+t25gP1xyLUgGp95ZpI8
	OO+74sXDq31pva2IHWyVUFmkD2kEVy9mYwcw2SKiPa/3JZW8UiYQj9GLrzxAtcdpSbwnm2BQdIX
	SXdA4DCUK8oUwkVm3AAsaoO/yyCTQL92bH9tvEe2olibiFVWyybUZDnWZ7TCH0eTnyMhW9rNuD4
	ExTRLr1WbHQYiWhdix2wvft9AxWF0BTFgiJh52J1qXNqKJNo0aAD/IXPQxEGOac7w9Sc1EqoNAz
	RbcHTHsMVzc3TSPIc2M2YmUDYqX1Y40VirFaefah+vnJE3+X7Wl1neS24Xq0nm1LebhnK1Fw7Y4
	GNdk3/apVoEIl2TasW7eXQzMVTHa+gnNp26dA=
X-Received: by 2002:ad4:5dc9:0:b0:8cc:f55a:9e47 with SMTP id 6a1803df08f44-8d44f9f899amr143563646d6.40.1781473361827;
        Sun, 14 Jun 2026 14:42:41 -0700 (PDT)
X-Received: by 2002:ad4:5dc9:0:b0:8cc:f55a:9e47 with SMTP id 6a1803df08f44-8d44f9f899amr143563296d6.40.1781473361374;
        Sun, 14 Jun 2026 14:42:41 -0700 (PDT)
Received: from umbar.lan (2001-14ba-a073-af00-264b-feff-fe8b-be8a.rev.dnainternet.fi. [2001:14ba:a073:af00:264b:feff:fe8b:be8a])
        by smtp.gmail.com with ESMTPSA id 38308e7fff4ca-39929c6abe7sm20905221fa.11.2026.06.14.14.42.39
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Sun, 14 Jun 2026 14:42:40 -0700 (PDT)
Date: Mon, 15 Jun 2026 00:42:38 +0300
From: Dmitry Baryshkov <dmitry.baryshkov@oss.qualcomm.com>
To: Jishnu Prakash <jishnu.prakash@oss.qualcomm.com>
Cc: Bjorn Andersson <andersson@kernel.org>,
        Konrad Dybcio <konradybcio@kernel.org>, Rob Herring <robh@kernel.org>,
        Krzysztof Kozlowski <krzk+dt@kernel.org>,
        Conor Dooley <conor+dt@kernel.org>, linux-arm-msm@vger.kernel.org,
        devicetree@vger.kernel.org, linux-kernel@vger.kernel.org,
        Kamal Wadhwa <kamal.wadhwa@oss.qualcomm.com>,
        Rakesh Kota <rakesh.kota@oss.qualcomm.com>
Subject: Re: [PATCH 2/4] arm64: dts: qcom: pm8005: Add temp alarm node
Message-ID: <633bh5nvxafrwnga5mdvvfdkazfgmrkt2jgn36dh7u5dlgjkgs@vewjc6tkgytq>
References: <20260613-shikra_adc_support-v1-0-57d5e6c7f47d@oss.qualcomm.com>
 <20260613-shikra_adc_support-v1-2-57d5e6c7f47d@oss.qualcomm.com>
Precedence: bulk
X-Mailing-List: devicetree@vger.kernel.org
List-Id: <devicetree.vger.kernel.org>
List-Subscribe: <mailto:devicetree+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:devicetree+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20260613-shikra_adc_support-v1-2-57d5e6c7f47d@oss.qualcomm.com>
X-Proofpoint-ORIG-GUID: 5IC8qkBN3sukPnmku-HUa8_JY_KVtcZt
X-Proofpoint-GUID: 5IC8qkBN3sukPnmku-HUa8_JY_KVtcZt
X-Proofpoint-Spam-Info: AW1haW4tMjYwNjE0MDIzMCBTYWx0ZWRfX7fNX5z8zGUzT
 Di9cqUkrhxplwHmGUcHbL8w8h6OYs8a6WwfllmOOiAzKwhLfv1Mwp2chclIGhbFCbZR2o8I6wxC
 NB6MzCA823sdqflq+clGdsHPbUTJ8IE=
X-Authority-Analysis: v=2.4 cv=IqAutr/g c=1 sm=1 tr=0 ts=6a2f2052 cx=c_pps
 a=7E5Bxpl4vBhpaufnMqZlrw==:117 a=xqWC_Br6kY4A:10 a=kj9zAlcOel0A:10
 a=FelO9ux0wxsA:10 a=s4-Qcg_JpJYA:10 a=VkNPw1HP01LnGYTKEx00:22
 a=u7WPNUs3qKkmUXheDGA7:22 a=_glEPmIy2e8OvE2BGh3C:22 a=EUspDBNiAAAA:8
 a=-2XugwumPvLk_3HJCtYA:9 a=CjuIK1q_8ugA:10 a=pJ04lnu7RYOZP9TFuWaZ:22
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYwNjE0MDIzMCBTYWx0ZWRfX69EMjRZrYJIy
 GcxQGvSm0xOpxUtkQqejUv9FhaZxAnOY9QDw3hR8kzJGVZoYbY0m3cWhNOIgnvkDS3QVi8JAXr9
 nagT5jmZonqS1EZkf/CmjfV+Ygx8Zt4Axk/Q3PFgjj9n/zP2arrQDruDPophIyTekkkoGcHNXaQ
 HUD82SRLR52kcFokao7jnAOCowheqSkW4kaFq0D7flr42dsM2Y1c8cUQadsKU5dLXpLnC3H6c72
 oESBWkWQhdr6kgJ7rSLabFgPgj3lvfpTZCXSunaWf15v/KA/hdeBQnNBUj9RkUFeitRQhvxl0ma
 OlKYxdhfmhfuhQY2flMtAqeKvcFzlYkR8Bb+L2rd5TQWiOP8MB66b/mZBrx3Pbizawm94y+mRqQ
 FlwSETQgh8G//rFiy2++BAarSLvCLeTEQug7oxcdAZkqDhQolAT1aWh8rBD4lQkjf+GDbNDjTa4
 hQK1E80hk/p6zatxvOA==
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1143,Hydra:6.1.125,FMLib:17.12.100.49
 definitions=2026-06-14_05,2026-06-12_03,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 impostorscore=0 suspectscore=0 priorityscore=1501 malwarescore=0 phishscore=0
 adultscore=0 lowpriorityscore=0 spamscore=0 bulkscore=0 clxscore=1015
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.22.0-2606040000 definitions=main-2606140230

On Sat, Jun 13, 2026 at 01:39:22PM +0530, Jishnu Prakash wrote:
> Add temperature alarm node, used for PMIC thermal mitigation.
> 
> Co-developed-by: Rakesh Kota <rakesh.kota@oss.qualcomm.com>
> Signed-off-by: Rakesh Kota <rakesh.kota@oss.qualcomm.com>
> Signed-off-by: Jishnu Prakash <jishnu.prakash@oss.qualcomm.com>
> ---
>  arch/arm64/boot/dts/qcom/pm8005.dtsi | 8 ++++++++
>  1 file changed, 8 insertions(+)
> 
> diff --git a/arch/arm64/boot/dts/qcom/pm8005.dtsi b/arch/arm64/boot/dts/qcom/pm8005.dtsi
> index 0f0ab2da8305..180809a0ee73 100644
> --- a/arch/arm64/boot/dts/qcom/pm8005.dtsi
> +++ b/arch/arm64/boot/dts/qcom/pm8005.dtsi
> @@ -11,6 +11,14 @@ pm8005_lsid0: pmic@4 {
>  		#address-cells = <1>;
>  		#size-cells = <0>;
>  
> +		pm8005_tz: temp-alarm@2400 {
> +			compatible = "qcom,spmi-temp-alarm";
> +			reg = <0x2400>;
> +			interrupts = <0x4 0x24 0x0 IRQ_TYPE_EDGE_BOTH>;
> +			#thermal-sensor-cells = <0>;
> +			status = "disabled";

Missing thermal zone, also enable it by default.

> +		};
> +
>  		pm8005_gpios: gpio@c000 {
>  			compatible = "qcom,pm8005-gpio", "qcom,spmi-gpio";
>  			reg = <0xc000>;
> 
> -- 
> 2.43.0
> 

-- 
With best wishes
Dmitry
